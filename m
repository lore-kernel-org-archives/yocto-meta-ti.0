Return-Path: <trini@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7F0A2E0043F; Wed,  2 Jul 2014 13:45:57 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3EEADE00342
	for <meta-ti@yoctoproject.org>; Wed,  2 Jul 2014 13:45:50 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s62KjnbR011062
	for <meta-ti@yoctoproject.org>; Wed, 2 Jul 2014 15:45:49 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s62KjnLP026045
	for <meta-ti@yoctoproject.org>; Wed, 2 Jul 2014 15:45:49 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 2 Jul 2014 15:45:49 -0500
Received: from [172.22.141.168] (dbdp20.itg.ti.com [172.24.170.38])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s62KjkBp030314;
	Wed, 2 Jul 2014 15:45:47 -0500
Message-ID: <53B46F7E.5030909@ti.com>
Date: Wed, 2 Jul 2014 16:45:50 -0400
From: Tom Rini <trini@ti.com>
Organization: Texas Instruments
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: Denys Dmytriyenko <denys@ti.com>
References: <1403806695-6302-1-git-send-email-denis@denix.org>
	<20140626193101.GQ9006@bill-the-cat> <20140626195150.GC6700@edge>
	<20140626201609.GR9006@bill-the-cat> <20140702195711.GF15788@edge>
In-Reply-To: <20140702195711.GF15788@edge>
X-Enigmail-Version: 1.6
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH v2] u-boot: switch from SPL/MLO to "ais" image for omapl138 SOCs
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
X-List-Received-Date: Wed, 02 Jul 2014 20:45:57 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 07/02/2014 03:57 PM, Denys Dmytriyenko wrote:
> On Thu, Jun 26, 2014 at 04:16:09PM -0400, Tom Rini wrote:
>> On Thu, Jun 26, 2014 at 03:51:50PM -0400, Denys Dmytriyenko wrote:
>>> On Thu, Jun 26, 2014 at 03:33:20PM -0400, Tom Rini wrote:
>>>> On Thu, Jun 26, 2014 at 02:18:15PM -0400, Denys Dmytriyenko wrote:
>>>>> From: Denys Dmytriyenko <denys@ti.com>
>>>>>
>>>>> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>>>>> Cc: Tom Rini <trini@ti.com>
>>>>> ---
>>>>>  conf/machine/am180x-evm.conf         | 4 +++-
>>>>>  recipes-bsp/u-boot/u-boot-ti.inc     | 4 ++--
>>>>>  recipes-bsp/u-boot/u-boot_2014.07.bb | 3 +++
>>>>>  3 files changed, 8 insertions(+), 3 deletions(-)
>>>>>
>>>>> diff --git a/conf/machine/am180x-evm.conf b/conf/machine/am180x-evm.conf
>>>>> index 3182e8a..f83814e 100644
>>>>> --- a/conf/machine/am180x-evm.conf
>>>>> +++ b/conf/machine/am180x-evm.conf
>>>>> @@ -5,7 +5,9 @@
>>>>>  require conf/machine/include/davinci.inc
>>>>>  require conf/machine/include/omapl138.inc
>>>>>  
>>>>> -UBOOT_MACHINE = "da850evm_config"
>>>>> +UBOOT_MACHINE = "da850_am18xxevm_config"
>>>>> +UBOOT_SUFFIX = "ais"
>>>>> +
>>>>>  UBOOT_ENTRYPOINT = "0xc0008000"
>>>>>  UBOOT_LOADADDRESS = "0xc0008000"
>>>>
>>>> Since we've got ENTRYPOINT/LOADADDRESS in here which also are omapl138
>>>> rather than am180x specific, that's OK with me.
>>>>
>>>>> diff --git a/recipes-bsp/u-boot/u-boot-ti.inc b/recipes-bsp/u-boot/u-boot-ti.inc
>>>>> index c024e96..0cb53ea 100644
>>>>> --- a/recipes-bsp/u-boot/u-boot-ti.inc
>>>>> +++ b/recipes-bsp/u-boot/u-boot-ti.inc
>>>>> @@ -1,3 +1,5 @@
>>>>> +UBOOT_SUFFIX ?= "img"
>>>>> +
>>>>>  require ${COREBASE}/meta/recipes-bsp/u-boot/u-boot.inc
>>>>
>>>> This isn't completely safe, is it?  The COREBASE version also has ?= for
>>>> UBOOT_SUFFIX too.  We need to either convince oe-core to use ??= or just
>>>> populate our machine.conf/soc.inc files with UBOOT_SUFFIX.
>>>
>>> That's why I moved it before require COREBASE, as otherwise it will be 
>>> set there...
>>>
>>> So, if machine defines own UBOOT_SUFFIX, our .inc won't overwrite it and 
>>> COREBASE version won't either. If machine doesn't define one, we set it to 
>>> "img" here. And for recipes not using our version of .inc, it will be set to 
>>> "bin" in COREBASE .inc
>>
>> I would have sworn the reason ??= was added was that what you describe
>> isn't always safe even if it looks like it should be, in all cases.  If
>> you're sure it's fine, OK.
> 
> Well, I think it may be unsafe when it cannot immediately evaluate the 
> variable, which is not the case here. I did some more testing and seems to 
> work. I guess long-term plan should be to populate all our machines with 
> UBOOT_SUFFIX, then.

Sounds good to me, thanks!

-- 
Tom

