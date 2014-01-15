Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C61B6E007F8
	for <meta-ti@yoctoproject.org>; Wed, 15 Jan 2014 14:25:04 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s0FMP3XG000572;
	Wed, 15 Jan 2014 16:25:03 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0FMP2M5012708;
	Wed, 15 Jan 2014 16:25:03 -0600
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.02.0342.003; Wed, 15 Jan 2014 16:25:02 -0600
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [PATCH] vpe-vpdma: update SRCREV and pass CROSS_COMPILE
Thread-Index: AQHPEjctUonR7ZbwUk+4Gp5MwRhOk5qGXK8Q
Date: Wed, 15 Jan 2014 22:25:01 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101598FA0D1@DLEE11.ent.ti.com>
References: <1389820588-17906-1-git-send-email-denis@denix.org>
In-Reply-To: <1389820588-17906-1-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH] vpe-vpdma: update SRCREV and pass CROSS_COMPILE
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
X-List-Received-Date: Wed, 15 Jan 2014 22:25:10 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

>-----Original Message-----
>From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
>bounces@yoctoproject.org] On Behalf Of Denys Dmytriyenko
>Sent: Wednesday, January 15, 2014 3:16 PM
>To: meta-ti@yoctoproject.org
>Subject: [meta-ti] [PATCH] vpe-vpdma: update SRCREV and pass
>CROSS_COMPILE
>
>From: Denys Dmytriyenko <denys@ti.com>
>
>Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>---
> recipes-bsp/ti/vpe-vpdma_git.bb | 6 +++---
> 1 file changed, 3 insertions(+), 3 deletions(-)
>
>diff --git a/recipes-bsp/ti/vpe-vpdma_git.bb b/recipes-bsp/ti/vpe-
>vpdma_git.bb
>index d506791..fb3012a 100644
>--- a/recipes-bsp/ti/vpe-vpdma_git.bb
>+++ b/recipes-bsp/ti/vpe-vpdma_git.bb
>@@ -8,9 +8,9 @@ LIC_FILES_CHKSUM =3D
>"file://COPYING;md5=3D74d2f71d8898c54e3d1c9d0058c484aa"
> COMPATIBLE_MACHINE =3D "dra7xx-evm"
>
> PV =3D "1b8"
>-PR =3D "r0"
>+PR =3D "r1"
>
>-SRCREV =3D "24a5487ec13bf560f0e7fb24a9d4747f9f358be2"
>+SRCREV =3D "e3d8db1aa935775f9d196ad7428e0cd9864a36ca"
> BRANCH ?=3D "master"
>
> SRC_URI =3D
>"git://git.ti.com/vpe_tests/vpe_tests.git;protocol=3Dgit;branch=3D${BR
>ANCH}"
>@@ -18,7 +18,7 @@ SRC_URI =3D
>"git://git.ti.com/vpe_tests/vpe_tests.git;protocol=3Dgit;branch=3D${BR
>ANCH
> S =3D "${WORKDIR}/git"
>
> # The test application needs additional include headers from the
>kernel
>-EXTRA_OEMAKE =3D 'KDIR=3D"${STAGING_KERNEL_DIR}/include/uapi -
>I${STAGING_KERNEL_DIR}/include"'
>+EXTRA_OEMAKE =3D 'CROSS_COMPILE=3D"${TARGET_PREFIX}"
>KDIR=3D"${STAGING_KERNEL_DIR}/include/uapi -
>I${STAGING_KERNEL_DIR}/include"'

Shouldn't the setting of CC in OE already take care of this?  Or did the re=
base affect the Makefile?

>
> do_install() {
>     oe_runmake DESTDIR=3D"${D}" install
>--
>1.8.3.2
>
>_______________________________________________
>meta-ti mailing list
>meta-ti@yoctoproject.org
>https://lists.yoctoproject.org/listinfo/meta-ti

