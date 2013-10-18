Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8CDC3E016E2
	for <meta-ti@yoctoproject.org>; Fri, 18 Oct 2013 05:38:02 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r9ICc2gN006231
	for <meta-ti@yoctoproject.org>; Fri, 18 Oct 2013 07:38:02 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9ICc2mY023849
	for <meta-ti@yoctoproject.org>; Fri, 18 Oct 2013 07:38:02 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.02.0342.003; Fri, 18 Oct 2013 07:38:02 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Hingolikar, Mrinmayee" <mrinmayee@ti.com>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [PATCH] u-boot-glsdk: Update to latest fixes
Thread-Index: AQHOy/q7JBppMSCgn0Ci85kXtQvIEJn6ZXmQ
Date: Fri, 18 Oct 2013 12:38:01 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101597C1828@DLEE11.ent.ti.com>
References: <20131018120809.GA3385@ti.com>
In-Reply-To: <20131018120809.GA3385@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH] u-boot-glsdk: Update to latest fixes
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
X-List-Received-Date: Fri, 18 Oct 2013 12:38:02 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

>-----Original Message-----
>From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
>bounces@yoctoproject.org] On Behalf Of Hingolikar, Mrinmayee
>Sent: Friday, October 18, 2013 7:08 AM
>To: meta-ti@yoctoproject.org
>Subject: [meta-ti] [PATCH] u-boot-glsdk: Update to latest fixes
>
> * Migration of u-boot code to omapzoom.org. The development tree
>is shared

Same question.  Why a need to move to omapzoom?

>   with the Android team.
> * Enable UART boot mode for dra7xx
> * Add VIP,VPE and Ethernet crossbar setting for dra7xx
> * Add SPL API, QSPI, and serial flash support of dra7xx
>
>Signed-off-by: Mrinmayee Hingolikar <mrinmayee@ti.com>
>---
> recipes-bsp/u-boot/u-boot-glsdk_2013.01.01.bb |    6 +++---
> 1 file changed, 3 insertions(+), 3 deletions(-)
>
>diff --git a/recipes-bsp/u-boot/u-boot-glsdk_2013.01.01.bb
>b/recipes-bsp/u-boot/u-boot-glsdk_2013.01.01.bb
>index d60ef44..4dde4e3 100644
>--- a/recipes-bsp/u-boot/u-boot-glsdk_2013.01.01.bb
>+++ b/recipes-bsp/u-boot/u-boot-glsdk_2013.01.01.bb
>@@ -6,11 +6,11 @@ PR =3D "r0+gitr${SRCPV}"
>
> DEFAULT_PREFERENCE =3D "-1"
>
>-SRC_URI =3D "git://git.ti.com/glsdk/glsdk-u-
>boot.git;protocol=3Dgit;branch=3D${BRANCH}"
>+SRC_URI =3D "git://git.omapzoom.org/repo/u-
>boot.git;protocol=3Dgit;branch=3D${BRANCH}"
>
>-BRANCH ?=3D "master"
>+BRANCH =3D "p-ti-u-boot-2013.04"

Why remove the optional setting?

>
>-SRCREV =3D "81836e8cc84bd6523d9a4e187965dcd1633c4bc9"
>+SRCREV =3D "76447484441a4b8e00840a2bde74e66dbac9e631"

Should be ?=3D

>
> SPL_BINARY =3D "MLO"
> SPL_UART_BINARY =3D "u-boot-spl.bin"
>--
>1.7.9.5
>
>_______________________________________________
>meta-ti mailing list
>meta-ti@yoctoproject.org
>https://lists.yoctoproject.org/listinfo/meta-ti

