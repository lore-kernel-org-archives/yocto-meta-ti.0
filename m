Return-Path: <hzhang@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 24AA6E00B68; Thu, 15 May 2014 08:07:11 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=5.0 tests=RCVD_IN_DNSWL_HI,RDNS_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
	*  1.3 RDNS_NONE Delivered to internal network by a host with no rDNS
Received: from devils.ext.ti.com (unknown [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 58311E00A44
	for <meta-ti@yoctoproject.org>; Thu, 15 May 2014 08:07:08 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s4FF77mS000565
	for <meta-ti@yoctoproject.org>; Thu, 15 May 2014 10:07:08 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s4FF7737024792
	for <meta-ti@yoctoproject.org>; Thu, 15 May 2014 10:07:07 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 15 May 2014 10:07:07 -0500
Received: from [158.218.103.104] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s4FF77fI028550;
	Thu, 15 May 2014 10:07:07 -0500
Message-ID: <5374D81B.7020909@ti.com>
Date: Thu, 15 May 2014 11:07:07 -0400
From: Hao Zhang <hzhang@ti.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130801 Thunderbird/17.0.8
MIME-Version: 1.0
To: Denys Dmytriyenko <denys@ti.com>
References: <1400092189-13946-1-git-send-email-hzhang@ti.com>
	<20140514184018.GO18053@edge> <5373BCEB.9020808@ti.com>
	<20140514190101.GQ18053@edge>
	<7D46E86EC0A8354091174257B2FED1015D016DD6@DLEE11.ent.ti.com>
	<5373D442.9050706@ti.com>
	<7D46E86EC0A8354091174257B2FED1015D01B8F5@DLEE11.ent.ti.com>
	<5374D230.6090002@ti.com> <20140515145432.GR18053@edge>
In-Reply-To: <20140515145432.GR18053@edge>
X-Enigmail-Version: 1.6
Cc: trini@ti.com, "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>,
	Santosh Shilimkar <santosh.shilimkar@ti.com>
Subject: Re: [PATCH] boot-monitor: add K2L and K2E boot monitor build support
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
X-List-Received-Date: Thu, 15 May 2014 15:07:11 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 5/15/2014 10:54 AM, Denys Dmytriyenko wrote:
> On Thu, May 15, 2014 at 10:41:52AM -0400, Hao Zhang wrote:
>> On 5/15/2014 10:21 AM, Maupin, Chase wrote:
>>>> -----Original Message-----
>>>> From: Zhang, Hao
>>>> Sent: Wednesday, May 14, 2014 3:38 PM
>>>> To: Maupin, Chase
>>>> Cc: Dmytriyenko, Denys; meta-ti@yoctoproject.org
>>>> Subject: Re: [meta-ti] [PATCH] boot-monitor: add K2L and K2E boot
>>>> monitor build support
>>>>
>>>> On 5/14/2014 3:55 PM, Maupin, Chase wrote:
>>>>>> -----Original Message-----
>>>>>> From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
>>>>>> bounces@yoctoproject.org] On Behalf Of Dmytriyenko, Denys
>>>>>> Sent: Wednesday, May 14, 2014 2:01 PM
>>>>>> To: Zhang, Hao
>>>>>> Cc: meta-ti@yoctoproject.org
>>>>>> Subject: Re: [meta-ti] [PATCH] boot-monitor: add K2L and K2E
>>>> boot
>>>>>> monitor build support
>>>>>>
>>>>>> On Wed, May 14, 2014 at 02:58:51PM -0400, Hao Zhang wrote:
>>>>>>> On 5/14/2014 2:40 PM, Denys Dmytriyenko wrote:
>>>>>>>> On Wed, May 14, 2014 at 02:29:49PM -0400, hzhang@ti.com
>>>> wrote:
>>>>>>>>> From: Hao Zhang <hzhang@ti.com>
>>>>>>>>>
>>>>>>>>> ---
>>>>>>>>>  recipes-bsp/boot-monitor/boot-monitor_git.bb |   18
>>>>>> +++++++++++++-----
>>>>>>>>>  1 file changed, 13 insertions(+), 5 deletions(-)
>>>>>>>>>
>>>>>>>>> diff --git a/recipes-bsp/boot-monitor/boot-monitor_git.bb
>>>>>> b/recipes-bsp/boot-monitor/boot-monitor_git.bb
>>>>>>>>> index 7c5e9cf..2c3aa43 100644
>>>>>>>>> --- a/recipes-bsp/boot-monitor/boot-monitor_git.bb
>>>>>>>>> +++ b/recipes-bsp/boot-monitor/boot-monitor_git.bb
>>>>>>>>> @@ -3,8 +3,12 @@ EXTRA_OEMAKE =
>>>>>> "CROSS_COMPILE=${TARGET_PREFIX}"
>>>>>>>>>
>>>>>>>>>  LICENSE = "BSD"
>>>>>>>>>
>>>>>>>>> -BOOT_MONITOR_BINARY ?= "skern.bin"
>>>>>>>>> -BOOT_MONITOR_IMAGE  ?= "skern-${MACHINE}.bin"
>>>>>>>>> +BOOT_MONITOR_BINARY_K2HK ?= "skern-k2hk.bin"
>>>>>>>>> +BOOT_MONITOR_IMAGE_k2HK  ?= "skern-k2hk-${MACHINE}.bin"
>>>>>>>>> +BOOT_MONITOR_BINARY_K2L ?= "skern-k2l.bin"
>>>>>>>>> +BOOT_MONITOR_IMAGE_k2L  ?= "skern-k2l-${MACHINE}.bin"
>>>>>>>>> +BOOT_MONITOR_BINARY_K2E ?= "skern-k2e.bin"
>>>>>>>>> +BOOT_MONITOR_IMAGE_k2E  ?= "skern-k2e-${MACHINE}.bin"
>>>>>
>>>>> Maybe a silly question but do you need to package all of these
>>>> in a single recipe or do you want to package K2HK and K2L and K2E
>>>> in separate packages?
>>>>>
>>>>>>>>
>>>>>>>> Have you tested it? You mix case in the above variables - one
>>>>>> has K2HK
>>>>>>>> uppercase, another has k2HK lowercase. Same for k2l...
>>>>>>>>
>>>>>>>>
>>>>>>>
>>>>>>> Yes, I tested it. I will correct the lowercase error and re-
>>>>>> submit the
>>>>>>> patch.
>>>>>>
>>>>>> It shouldn't have worked, as you use incorrect variables below
>>>> in
>>>>>> do_deploy.
>>>>>>
>>>>>>
>>>>
>>>> For some reason, it still works, anyway I fixed the lowercase
>>>> errors
>>>>
>>>>>>>>>  BOOT_MONITOR_MAKE_TARGET  ?= "all"
>>>>>>>>>
>>>>>>>>>  LIC_FILES_CHKSUM =
>>>>>> "file://COPYING;md5=25fe219a6febf6e5bb45beda1b2eb315"
>>>>>>>>> @@ -14,7 +18,7 @@ COMPATIBLE_MACHINE = "keystone-evm"
>>>>>>>>>  SRC_URI = "git://git.ti.com/keystone-linux/boot-
>>>>>> monitor.git;protocol=git;branch=${BRANCH}"
>>>>>>>>>
>>>>>>>>>  PV = "2.0"
>>>>>>>>> -PR = "r0+gitr${SRCPV}"
>>>>>>>>> +PR = "r1+gitr${SRCPV}"
>>>>>>>>>
>>>>>>>>>  BRANCH = "master"
>>>>>>>>>
>>>>>>>>> @@ -27,7 +31,9 @@ do_compile () {
>>>>>>>>>  	unset LDFLAGS
>>>>>>>>>  	unset CFLAGS
>>>>>>>>>  	unset CPPFLAGS
>>>>>>>>> -	oe_runmake ${BOOT_MONITOR_MAKE_TARGET}
>>>>>>>>> +	oe_runmake k2hk
>>>>>>>>> +	oe_runmake k2l
>>>>>>>>> +	oe_runmake k2e
>>>>>
>>>>> If you really want to package all of these in a single recipe
>>>> why not use a for loop?  The naming, etc is formulaic.  You could
>>>> just have a list of "k2hk k2l k2e" and do the make for that list
>>>> as well as your do_deploy stuff below.
>>>>>
>>>>
>>>> Will use for loop and re-sumbit the patch.
>>>
>>> Can you clarify if you really want all 3 devices installed all the time or 
>>> do you really want a recipe that installs the boot monitor per device?  I 
>>> know you don't currently have 3 machine types so maybe that is what is 
>>> feeding your issue here, but my question is whether you need to have 
>>> separate builds per device.
>>>
>>
>> I want all the 3 boot monitors built and installed all the time in one
>> recipe, since MCSDK 3.1 supports all the 3 Keystone II devices in the
>> same release package. This applies to the U-boot (3 U-boot build for all
>> the 3 Keystone II devices) and Linux kernel DTB.
> 
> Linux kernel has support for board variations through DTBs, obviously.
> 
> As of U-boot, in Sitara world we had to manage board variations by detecting 
> the board at runtime. So, the same single binary would work on AM335x-EVM, 
> AM335x-SK, BeagleBone White and BeagleBone Black.
> 
> I would recommend you working with Tom Rini and doing it similarly, so you 
> don't have to build 3 different binaries for 3 slightly different Keystone 
> baords...
> 
> 

Keystone Linux team is working on the up-streaming of U-boot which may
include a single binary of U-boot for all the 3 different boards, but
for MCSDK 3.1 release, we will still use 3 binaries.

I am looping Santosh who is the Keystone Linux team manager ..

>>>>
>>>>>>>>>  }
>>>>>>>>>
>>>>>>>>>  inherit deploy
>>>>>>>>> @@ -36,5 +42,7 @@ addtask deploy before do_build after
>>>>>> do_compile
>>>>>>>>>
>>>>>>>>>  do_deploy () {
>>>>>>>>>  	install -d ${DEPLOYDIR}
>>>>>>>>> -	install ${S}/${BOOT_MONITOR_BINARY}
>>>>>> ${DEPLOYDIR}/${BOOT_MONITOR_IMAGE}
>>>>>>>>> +	install ${S}/${BOOT_MONITOR_BINARY_K2HK}
>>>>>> ${DEPLOYDIR}/${BOOT_MONITOR_IMAGE_K2HK}
>>>>>>>>> +	install ${S}/${BOOT_MONITOR_BINARY_K2L}
>>>>>> 	${DEPLOYDIR}/${BOOT_MONITOR_IMAGE_K2L}
>>>>>>>>> +	install ${S}/${BOOT_MONITOR_BINARY_K2E}
>>>>>> 	${DEPLOYDIR}/${BOOT_MONITOR_IMAGE_K2E}
>>>>>>>>>  }
>>>>>>>>> --
>>>>>>>>> 1.7.9.5
>>>>>>>>>
>>>>>>>>> --
>>>>>>>>> _______________________________________________
>>>>>>>>> meta-ti mailing list
>>>>>>>>> meta-ti@yoctoproject.org
>>>>>>>>> https://lists.yoctoproject.org/listinfo/meta-ti
>>>>>>>
>>>>>> --
>>>>>> _______________________________________________
>>>>>> meta-ti mailing list
>>>>>> meta-ti@yoctoproject.org
>>>>>> https://lists.yoctoproject.org/listinfo/meta-ti
>>>
>>


