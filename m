Return-Path: <pab@pabigot.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 98053E00524; Tue,  2 Sep 2014 10:01:03 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [173.201.192.234 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from p3plsmtpa07-05.prod.phx3.secureserver.net
	(p3plsmtpa07-05.prod.phx3.secureserver.net [173.201.192.234])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5C54FE004A0
	for <meta-ti@yoctoproject.org>; Tue,  2 Sep 2014 10:00:52 -0700 (PDT)
Received: from [192.168.65.10] ([66.41.60.82])
	by p3plsmtpa07-05.prod.phx3.secureserver.net with 
	id mH0q1o0071mTNtu01H0q2Y; Tue, 02 Sep 2014 10:00:51 -0700
Message-ID: <5405F7C1.2060809@pabigot.com>
Date: Tue, 02 Sep 2014 12:00:49 -0500
From: "Peter A. Bigot" <pab@pabigot.com>
Organization: Peter Bigot Consulting, LLC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: Tom Rini <trini@ti.com>
References: <5405349A.4050207@pabigot.com>
	<1409627490-28337-1-git-send-email-pab@pabigot.com>
	<20140902164451.GV19374@bill-the-cat>
In-Reply-To: <20140902164451.GV19374@bill-the-cat>
Cc: meta-ti@yoctoproject.org, Pantelis Antoniou <panto@antoniou-consulting.com>
Subject: Re: [ti-uboot][PATCH] mmc: restore capacity when switching to partition 0
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Tue, 02 Sep 2014 17:01:03 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 09/02/2014 11:44 AM, Tom Rini wrote:
> On Mon, Sep 01, 2014 at 10:11:30PM -0500, Peter A. Bigot wrote:
>
>> The capacity and lba for an MMC device with part_num 0 reflects the
>> whole device.  When mmc_switch_part() successfully switches to a
>> partition, the capacity is changed to that partition.  As partition 0
>> does not physically exist, attempts to switch back to the whole device
>> will indicate an error, but should still restore the capacity setting.
> In other words:
> # mmc dev 0:1
> ...
> # mmc dev 0:0
>
> Fails?

I don't know.  This error occurs in SPL mode where there is no command 
line and only one device.  From the companion email:

This is a bug in handling mmc_switch_part: what's happening is that the 
code reconfigures the mmc device to look at the partition on which the 
environment is to be found, but fails to restore it to reflect the state 
of the whole device. I.e., the mmc capacity and lba are zero in my case 
(I have no partition 2 on the uSD card), but mmc_switch_part() returns 
-ENODEV on the attempt to switch back in fini_mmc_for_env() without also 
resetting the capacity to what the rest of the system expects.

>   And the following patch fixes it.
>
>> Signed-off-by: Peter A. Bigot <pab@pabigot.com>
>> ---
>>   drivers/mmc/mmc.c | 7 ++++---
>>   1 file changed, 4 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/mmc/mmc.c b/drivers/mmc/mmc.c
>> index b5477b1..b05c6ee 100644
>> --- a/drivers/mmc/mmc.c
>> +++ b/drivers/mmc/mmc.c
>> @@ -596,10 +596,11 @@ int mmc_switch_part(int dev_num, unsigned int part_num)
>>   	ret = mmc_switch(mmc, EXT_CSD_CMD_SET_NORMAL, EXT_CSD_PART_CONF,
>>   			 (mmc->part_config & ~PART_ACCESS_MASK)
>>   			 | (part_num & PART_ACCESS_MASK));
>> -	if (ret)
>> -		return ret;
>>   
>> -	return mmc_set_capacity(mmc, part_num);
>> +	if ((0 == ret) || ((-ENODEV == ret) && (0 == part_num)))

Yes.  There are several ways to fix it; this is the one with the minimal 
change from existing behavior.  (It is necessary to try the mmc_switch() 
call even if part_num is zero since that resets some internal driver state.)

> This is backwards from how we usually code things:
>
> if ((ret == 0) || ((ret == -ENODEV) && (part_num == 0)))

OK; I default to yoda conditions since it saves me at least once a year, 
but can swap things back around.  No objection to explicit 
parenthesization (the GNU folks hate it).

> And should have a comment above it that's a short summary of the commit
> message so this doesn't get lost later on.

OK.

>
>> +		ret = mmc_set_capacity(mmc, part_num);
>> +
>> +	return ret;
>>   }
>>   
>>   int mmc_getcd(struct mmc *mmc)
>> -- 
>> 1.8.5.5
>>
>> -- 
>> _______________________________________________
>> meta-ti mailing list
>> meta-ti@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-ti

If I update this patch, will you see the patch gets into ti-uboot?

> And speaking of getting lost, this isn't the U-Boot mailing list so the
> change would get lost with the next release.  Please make sure to post
> the next version to the u-boot ML as well and CC Pantelis.   Thanks!

This fix is specific to 2014.07, and may or may not also be influenced 
by TI-specific patches.  AFAICT u-boot doesn't maintain a stable-release 
patch branch.

I mentioned in deleted material that subsequent changes rework how the 
environment code manipulates the mmc device so it doesn't apply to 
u-boot master.  There are several such changes that are cumulative, so 
there's some rework to be done.  I'd have to switch over to using u-boot 
master to see if the problem still remains in the current 
implementation.  At this time that's not in scope for me.

Peter

