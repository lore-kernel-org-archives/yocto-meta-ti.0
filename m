Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CAE13E0140D
	for <meta-ti@yoctoproject.org>; Mon,  1 Jul 2013 04:38:45 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r61Bci8x013761
	for <meta-ti@yoctoproject.org>; Mon, 1 Jul 2013 06:38:44 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r61Bcfu4003867
	for <meta-ti@yoctoproject.org>; Mon, 1 Jul 2013 06:38:41 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.02.0342.003; Mon, 1 Jul 2013 06:38:43 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Heroor, Siddharth" <heroor@ti.com>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [PATCH] recipes-bsp: u-boot: Add GLSDK Staging tree
Thread-Index: AQHOdjVQ45wsO8wXUEOVutdYAdKTEplPsiUA
Date: Mon, 1 Jul 2013 11:38:43 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015962AE50@DLEE11.ent.ti.com>
References: <20130701083045.GA4253@ti.com>
In-Reply-To: <20130701083045.GA4253@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH] recipes-bsp: u-boot: Add GLSDK Staging tree
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
X-List-Received-Date: Mon, 01 Jul 2013 11:38:50 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

>-----Original Message-----
>From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
>bounces@yoctoproject.org] On Behalf Of Heroor, Siddharth
>Sent: Monday, July 01, 2013 3:31 AM
>To: meta-ti@yoctoproject.org
>Subject: [meta-ti] [PATCH] recipes-bsp: u-boot: Add GLSDK Staging
>tree
>
>* The GLSDK u-boot staging tree is based off the Core SDK
>2013.04.02
>  release. This tree will be used to stage patches and fixes on
>  top of the Core SDK U-Boot. The GLSDK release will use this tree
>  for product development.
>* Includes fix to OMAP5 so that QSPI is not enabled.
>
>Signed-off-by: Siddharth Heroor <heroor@ti.com>
>---
> .../u-boot/u-boot-glsdk-staging_2013.01.01.bb      |   16
>++++++++++++++++
> 1 files changed, 16 insertions(+), 0 deletions(-)
> create mode 100644 recipes-bsp/u-boot/u-boot-glsdk-
>staging_2013.01.01.bb
>
>diff --git a/recipes-bsp/u-boot/u-boot-glsdk-staging_2013.01.01.bb
>b/recipes-bsp/u-boot/u-boot-glsdk-staging_2013.01.01.bb
>new file mode 100644
>index 0000000..90d2d61
>--- /dev/null
>+++ b/recipes-bsp/u-boot/u-boot-glsdk-staging_2013.01.01.bb
>@@ -0,0 +1,16 @@
>+require u-boot-ti.inc
>+
>+DESCRIPTION =3D "u-boot bootloader for TI devices supported by the
>GLSDK product"
>+
>+PR =3D "r1+gitr${SRCPV}"

You can start at r0.  Please make sure if you are finding issues with the b=
ase u-boot sources you are feeding those back so that hopefully your need f=
or this recipe eventually dies.

>+
>+DEFAULT_PREFERENCE =3D "-1"
>+
>+SRC_URI =3D "git://git.ti.com/glsdk/glsdk-u-
>boot.git;protocol=3Dgit;branch=3D${BRANCH}"
>+
>+BRANCH ?=3D "master"
>+
>+SRCREV =3D "81836e8cc84bd6523d9a4e187965dcd1633c4bc9"
>+
>+SPL_BINARY =3D "MLO"
>+SPL_UART_BINARY =3D "u-boot-spl.bin"
>--
>1.7.0.4
>
>_______________________________________________
>meta-ti mailing list
>meta-ti@yoctoproject.org
>https://lists.yoctoproject.org/listinfo/meta-ti

