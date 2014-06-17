Return-Path: <chase.maupin@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0AD11E00C20; Tue, 17 Jun 2014 05:02:34 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6B6C1E00C14
	for <meta-ti@yoctoproject.org>; Tue, 17 Jun 2014 05:02:05 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s5HC25xS015032
	for <meta-ti@yoctoproject.org>; Tue, 17 Jun 2014 07:02:05 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s5HC247l002743
	for <meta-ti@yoctoproject.org>; Tue, 17 Jun 2014 07:02:05 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0174.001; Tue, 17 Jun 2014 07:02:04 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>, "Dmytriyenko, Denys"
	<denys@ti.com>
Thread-Topic: [meta-ti] [for dora & master][PATCH]
	u-boot-ti-staging:_2013.10: Update to pull in critical fixes
Thread-Index: AQHPhXyghKlVPCpK3UaBkqUomWnLCZt0udQAgAB4FMuAAAqfUA==
Date: Tue, 17 Jun 2014 12:02:03 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015D0C445C@DLEE11.ent.ti.com>
References: <1402494847-29713-1-git-send-email-fcooper@ti.com>,
	<20140616231250.GF1825@edge>
	<665B6C21-BDD3-47A0-9F29-B99C2B112773@ti.com>
In-Reply-To: <665B6C21-BDD3-47A0-9F29-B99C2B112773@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [for dora & master][PATCH] u-boot-ti-staging:_2013.10: Update to pull in critical fixes
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
X-List-Received-Date: Tue, 17 Jun 2014 12:02:34 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

>-----Original Message-----
>From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
>bounces@yoctoproject.org] On Behalf Of Cooper Jr., Franklin
>Sent: Tuesday, June 17, 2014 6:23 AM
>To: Dmytriyenko, Denys
>Cc: meta-ti@yoctoproject.org
>Subject: Re: [meta-ti] [for dora & master][PATCH] u-boot-ti-
>staging:_2013.10: Update to pull in critical fixes
>
>These are 2 production stop patches that have been pushed to the
>same LCPD git tree and branch that is apart of your last release.
>
>With out them beta and production boards will frequently not boot
>and even if they do running any intensive task can kill the
>display requiring a reboot.
>
>It's 2 patches that affect am4x only. For all other devices
>nothing has changed.

In the future I would say that this should be handled through meta-amsdk, a=
nd is one more reason to get to that solution.  However, for today we alrea=
dy have the coreSDK configs tagged, these patches are blessed by U-Boot mai=
ntainer, so I say we go ahead and take them since the net result is to make=
 the 2013.10 release of U-Boot better.

>
>> On Jun 16, 2014, at 6:12 PM, "Dmytriyenko, Denys" <denys@ti.com>
>wrote:
>>
>>> On Wed, Jun 11, 2014 at 08:54:07AM -0500, Franklin S. Cooper Jr
>wrote:
>>> * Critical fixes have been added to the ti-u-boot-2013.10
>branch for AM4x.
>>> * Update commit id to point to this new commit.
>>> * For all other platforms nothing should have changed.
>>> ---
>>> recipes-bsp/u-boot/u-boot-ti-staging_2013.10.bb |    6 +++---
>>> 1 files changed, 3 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2013.10.bb
>b/recipes-bsp/u-boot/u-boot-ti-staging_2013.10.bb
>>> index b8f5ce6..d954db4 100644
>>> --- a/recipes-bsp/u-boot/u-boot-ti-staging_2013.10.bb
>>> +++ b/recipes-bsp/u-boot/u-boot-ti-staging_2013.10.bb
>>> @@ -5,14 +5,14 @@ DESCRIPTION =3D "u-boot bootloader for TI
>devices"
>>> LIC_FILES_CHKSUM =3D
>"file://Licenses/README;md5=3D025bf9f768cbcb1a165dbe1a110babfb"
>>>
>>> PV =3D "2013.10"
>>> -PR =3D "r7+gitr${SRCPV}"
>>> +PR =3D "r8+gitr${SRCPV}"
>>>
>>> SRC_URI =3D "git://git.ti.com/ti-u-boot/ti-u-
>boot.git;protocol=3Dgit;branch=3D${BRANCH}"
>>>
>>> BRANCH ?=3D "ti-u-boot-2013.10"
>>>
>>> -# Corresponds to tag ti2013.12.01
>>> -SRCREV =3D "78d8ebd4a0214b72a125f5b98c5ed2f9a3e5e783"
>>> +# Corresponds to tag ti2013.12.01_amsdk-07.01
>>
>> I'm still not sure of how to handle this kind of change...
>>
>>
>>> +SRCREV =3D "259ff9a577cc66cb40e3cdff3e41628e466f0fef"
>>>
>>> SPL_BINARY =3D "MLO"
>>> SPL_UART_BINARY =3D "u-boot-spl.bin"
>>> --
>>> 1.7.0.4
>>>
>>> --
>>> _______________________________________________
>>> meta-ti mailing list
>>> meta-ti@yoctoproject.org
>>> https://lists.yoctoproject.org/listinfo/meta-ti
>--
>_______________________________________________
>meta-ti mailing list
>meta-ti@yoctoproject.org
>https://lists.yoctoproject.org/listinfo/meta-ti

