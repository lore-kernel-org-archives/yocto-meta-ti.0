Return-Path: <gary@mlbassoc.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A81DFE004DD; Mon,  4 Aug 2014 09:17:23 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
X-Greylist: delayed 515 seconds by postgrey-1.32 at yocto-www;
	Mon, 04 Aug 2014 09:17:09 PDT
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 85D39E0030B
	for <meta-ti@yoctoproject.org>; Mon,  4 Aug 2014 09:17:09 -0700 (PDT)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 183D1F811DC; Mon,  4 Aug 2014 10:08:34 -0600 (MDT)
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 90F3BF811DA;
	Mon,  4 Aug 2014 10:08:31 -0600 (MDT)
Message-ID: <53DFB017.6010401@mlbassoc.com>
Date: Mon, 04 Aug 2014 10:08:55 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: meta-ti@yoctoproject.org
References: <1407167150-22655-1-git-send-email-alexandre.belloni@free-electrons.com>
	<CDAEECB9-550D-4013-A3C9-07520AA88C9D@ti.com>
In-Reply-To: <CDAEECB9-550D-4013-A3C9-07520AA88C9D@ti.com>
Subject: Re: [PATCH] beaglebone: use the am335x_boneblack u-boot configuration
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
X-List-Received-Date: Mon, 04 Aug 2014 16:17:23 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 2014-08-04 10:04, Cooper Jr., Franklin wrote:
> How does this config work on the Beaglebone white?
>
>> On Aug 4, 2014, at 10:46 AM, "Alexandre Belloni" <alexandre.belloni@free-electrons.com> wrote:
>>
>> Using the am335x_boneblack configuration for u-boot allows to save the
>> environment to the emmc. Else, it is not possible to save the
>> environment at all.
>>
>> Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
>> ---
>> conf/machine/beaglebone.conf | 2 +-
>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/conf/machine/beaglebone.conf b/conf/machine/beaglebone.conf
>> index 8a83a1aeb569..0b4dce3ad647 100644
>> --- a/conf/machine/beaglebone.conf
>> +++ b/conf/machine/beaglebone.conf
>> @@ -11,4 +11,4 @@ IMAGE_FSTYPES += "tar.gz"
>>
>> SERIAL_CONSOLE = "115200 ttyO0"
>>
>> -UBOOT_MACHINE = "am335x_evm_config"
>> +UBOOT_MACHINE = "am335x_boneblack"
>> --

Perhaps it would be better to let this assignment be soft, i.e.
   UBOOT_MACHINE ?= "am335x_boneblack"

That way, either choice would be possible.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

