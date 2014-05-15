Return-Path: <chase.maupin@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0AC82E00B68; Thu, 15 May 2014 07:21:43 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A1EA9E00A44
	for <meta-ti@yoctoproject.org>; Thu, 15 May 2014 07:21:37 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s4FELbmS005279
	for <meta-ti@yoctoproject.org>; Thu, 15 May 2014 09:21:37 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s4FELbMb019212
	for <meta-ti@yoctoproject.org>; Thu, 15 May 2014 09:21:37 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0174.001; Thu, 15 May 2014 09:21:37 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Zhang, Hao" <hzhang@ti.com>
Thread-Topic: [meta-ti] [PATCH] boot-monitor: add K2L and K2E boot monitor
	build support
Thread-Index: AQHPb6bsndqH52iPMEeqhXPNDssciptAfOBAgABgjQCAANTj0A==
Date: Thu, 15 May 2014 14:21:36 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015D01B8F5@DLEE11.ent.ti.com>
References: <1400092189-13946-1-git-send-email-hzhang@ti.com>
	<20140514184018.GO18053@edge> <5373BCEB.9020808@ti.com>
	<20140514190101.GQ18053@edge>
	<7D46E86EC0A8354091174257B2FED1015D016DD6@DLEE11.ent.ti.com>
	<5373D442.9050706@ti.com>
In-Reply-To: <5373D442.9050706@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
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
X-List-Received-Date: Thu, 15 May 2014 14:21:43 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

>-----Original Message-----
>From: Zhang, Hao
>Sent: Wednesday, May 14, 2014 3:38 PM
>To: Maupin, Chase
>Cc: Dmytriyenko, Denys; meta-ti@yoctoproject.org
>Subject: Re: [meta-ti] [PATCH] boot-monitor: add K2L and K2E boot
>monitor build support
>
>On 5/14/2014 3:55 PM, Maupin, Chase wrote:
>>> -----Original Message-----
>>> From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
>>> bounces@yoctoproject.org] On Behalf Of Dmytriyenko, Denys
>>> Sent: Wednesday, May 14, 2014 2:01 PM
>>> To: Zhang, Hao
>>> Cc: meta-ti@yoctoproject.org
>>> Subject: Re: [meta-ti] [PATCH] boot-monitor: add K2L and K2E
>boot
>>> monitor build support
>>>
>>> On Wed, May 14, 2014 at 02:58:51PM -0400, Hao Zhang wrote:
>>>> On 5/14/2014 2:40 PM, Denys Dmytriyenko wrote:
>>>>> On Wed, May 14, 2014 at 02:29:49PM -0400, hzhang@ti.com
>wrote:
>>>>>> From: Hao Zhang <hzhang@ti.com>
>>>>>>
>>>>>> ---
>>>>>>  recipes-bsp/boot-monitor/boot-monitor_git.bb |   18
>>> +++++++++++++-----
>>>>>>  1 file changed, 13 insertions(+), 5 deletions(-)
>>>>>>
>>>>>> diff --git a/recipes-bsp/boot-monitor/boot-monitor_git.bb
>>> b/recipes-bsp/boot-monitor/boot-monitor_git.bb
>>>>>> index 7c5e9cf..2c3aa43 100644
>>>>>> --- a/recipes-bsp/boot-monitor/boot-monitor_git.bb
>>>>>> +++ b/recipes-bsp/boot-monitor/boot-monitor_git.bb
>>>>>> @@ -3,8 +3,12 @@ EXTRA_OEMAKE =3D
>>> "CROSS_COMPILE=3D${TARGET_PREFIX}"
>>>>>>
>>>>>>  LICENSE =3D "BSD"
>>>>>>
>>>>>> -BOOT_MONITOR_BINARY ?=3D "skern.bin"
>>>>>> -BOOT_MONITOR_IMAGE  ?=3D "skern-${MACHINE}.bin"
>>>>>> +BOOT_MONITOR_BINARY_K2HK ?=3D "skern-k2hk.bin"
>>>>>> +BOOT_MONITOR_IMAGE_k2HK  ?=3D "skern-k2hk-${MACHINE}.bin"
>>>>>> +BOOT_MONITOR_BINARY_K2L ?=3D "skern-k2l.bin"
>>>>>> +BOOT_MONITOR_IMAGE_k2L  ?=3D "skern-k2l-${MACHINE}.bin"
>>>>>> +BOOT_MONITOR_BINARY_K2E ?=3D "skern-k2e.bin"
>>>>>> +BOOT_MONITOR_IMAGE_k2E  ?=3D "skern-k2e-${MACHINE}.bin"
>>
>> Maybe a silly question but do you need to package all of these
>in a single recipe or do you want to package K2HK and K2L and K2E
>in separate packages?
>>
>>>>>
>>>>> Have you tested it? You mix case in the above variables - one
>>> has K2HK
>>>>> uppercase, another has k2HK lowercase. Same for k2l...
>>>>>
>>>>>
>>>>
>>>> Yes, I tested it. I will correct the lowercase error and re-
>>> submit the
>>>> patch.
>>>
>>> It shouldn't have worked, as you use incorrect variables below
>in
>>> do_deploy.
>>>
>>>
>
>For some reason, it still works, anyway I fixed the lowercase
>errors
>
>>>>>>  BOOT_MONITOR_MAKE_TARGET  ?=3D "all"
>>>>>>
>>>>>>  LIC_FILES_CHKSUM =3D
>>> "file://COPYING;md5=3D25fe219a6febf6e5bb45beda1b2eb315"
>>>>>> @@ -14,7 +18,7 @@ COMPATIBLE_MACHINE =3D "keystone-evm"
>>>>>>  SRC_URI =3D "git://git.ti.com/keystone-linux/boot-
>>> monitor.git;protocol=3Dgit;branch=3D${BRANCH}"
>>>>>>
>>>>>>  PV =3D "2.0"
>>>>>> -PR =3D "r0+gitr${SRCPV}"
>>>>>> +PR =3D "r1+gitr${SRCPV}"
>>>>>>
>>>>>>  BRANCH =3D "master"
>>>>>>
>>>>>> @@ -27,7 +31,9 @@ do_compile () {
>>>>>>  	unset LDFLAGS
>>>>>>  	unset CFLAGS
>>>>>>  	unset CPPFLAGS
>>>>>> -	oe_runmake ${BOOT_MONITOR_MAKE_TARGET}
>>>>>> +	oe_runmake k2hk
>>>>>> +	oe_runmake k2l
>>>>>> +	oe_runmake k2e
>>
>> If you really want to package all of these in a single recipe
>why not use a for loop?  The naming, etc is formulaic.  You could
>just have a list of "k2hk k2l k2e" and do the make for that list
>as well as your do_deploy stuff below.
>>
>
>Will use for loop and re-sumbit the patch.

Can you clarify if you really want all 3 devices installed all the time or =
do you really want a recipe that installs the boot monitor per device?  I k=
now you don't currently have 3 machine types so maybe that is what is feedi=
ng your issue here, but my question is whether you need to have separate bu=
ilds per device.

>
>>>>>>  }
>>>>>>
>>>>>>  inherit deploy
>>>>>> @@ -36,5 +42,7 @@ addtask deploy before do_build after
>>> do_compile
>>>>>>
>>>>>>  do_deploy () {
>>>>>>  	install -d ${DEPLOYDIR}
>>>>>> -	install ${S}/${BOOT_MONITOR_BINARY}
>>> ${DEPLOYDIR}/${BOOT_MONITOR_IMAGE}
>>>>>> +	install ${S}/${BOOT_MONITOR_BINARY_K2HK}
>>> ${DEPLOYDIR}/${BOOT_MONITOR_IMAGE_K2HK}
>>>>>> +	install ${S}/${BOOT_MONITOR_BINARY_K2L}
>>> 	${DEPLOYDIR}/${BOOT_MONITOR_IMAGE_K2L}
>>>>>> +	install ${S}/${BOOT_MONITOR_BINARY_K2E}
>>> 	${DEPLOYDIR}/${BOOT_MONITOR_IMAGE_K2E}
>>>>>>  }
>>>>>> --
>>>>>> 1.7.9.5
>>>>>>
>>>>>> --
>>>>>> _______________________________________________
>>>>>> meta-ti mailing list
>>>>>> meta-ti@yoctoproject.org
>>>>>> https://lists.yoctoproject.org/listinfo/meta-ti
>>>>
>>> --
>>> _______________________________________________
>>> meta-ti mailing list
>>> meta-ti@yoctoproject.org
>>> https://lists.yoctoproject.org/listinfo/meta-ti


