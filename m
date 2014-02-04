Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 295CAE0074F
	for <meta-ti@yoctoproject.org>; Tue,  4 Feb 2014 14:41:48 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s14MflaY015365
	for <meta-ti@yoctoproject.org>; Tue, 4 Feb 2014 16:41:47 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s14Mflvr026559
	for <meta-ti@yoctoproject.org>; Tue, 4 Feb 2014 16:41:47 -0600
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.02.0342.003; Tue, 4 Feb 2014 16:41:47 -0600
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Nelson, Sam" <sam.nelson@ti.com>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [PATCH v3] linux-keystone: Update to linux kernel
	version	3.10
Thread-Index: AQHPId5yb3ncA1uGq0i91QXFwfc5F5qlsD7A
Date: Tue, 4 Feb 2014 22:41:46 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED10159948C34@DLEE11.ent.ti.com>
References: <1391541392-16928-1-git-send-email-sam.nelson@ti.com>
In-Reply-To: <1391541392-16928-1-git-send-email-sam.nelson@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH v3] linux-keystone: Update to linux kernel version	3.10
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
X-List-Received-Date: Tue, 04 Feb 2014 22:41:56 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

>-----Original Message-----
>From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
>bounces@yoctoproject.org] On Behalf Of Nelson, Sam
>Sent: Tuesday, February 04, 2014 2:17 PM
>To: meta-ti@yoctoproject.org
>Subject: [meta-ti] [PATCH v3] linux-keystone: Update to linux
>kernel version 3.10
>
>- Updated Source URL & version
>- Added device tree file
>- Added LOADADDR extra args
>
>Signed-off-by: Sam Nelson <sam.nelson@ti.com>
>
>---
>Changes from last revision of patch
>- Added LOADADDR extra args
>- Name change to from 3.10.10--> 3.10
>---
>---
> .../defconfig                                      |    0
> ...ux-keystone_3.8.4.bb =3D> linux-keystone_3.10.bb} |   26
>+++++++++++---------
> 2 files changed, 15 insertions(+), 11 deletions(-)
> rename recipes-kernel/linux/{linux-keystone-3.8.4 =3D> linux-
>keystone-3.10}/defconfig (100%)
> rename recipes-kernel/linux/{linux-keystone_3.8.4.bb =3D> linux-
>keystone_3.10.bb} (59%)
>
>diff --git a/recipes-kernel/linux/linux-keystone-3.8.4/defconfig
>b/recipes-kernel/linux/linux-keystone-3.10/defconfig
>similarity index 100%
>rename from recipes-kernel/linux/linux-keystone-3.8.4/defconfig
>rename to recipes-kernel/linux/linux-keystone-3.10/defconfig
>diff --git a/recipes-kernel/linux/linux-keystone_3.8.4.bb
>b/recipes-kernel/linux/linux-keystone_3.10.bb
>similarity index 59%
>rename from recipes-kernel/linux/linux-keystone_3.8.4.bb
>rename to recipes-kernel/linux/linux-keystone_3.10.bb
>index d176f14..3ddd195 100644
>--- a/recipes-kernel/linux/linux-keystone_3.8.4.bb
>+++ b/recipes-kernel/linux/linux-keystone_3.10.bb
>@@ -3,26 +3,30 @@ DESCRIPTION =3D "Linux kernel for TI Keystone
>devices"
> LICENSE =3D "GPLv2"
> LIC_FILES_CHKSUM =3D
>"file://COPYING;md5=3Dd7810fab7487fb0aad327b76f1be7cd7"
>
>+COMPATIBLE_MACHINE =3D "keystone"
>+
> inherit kernel
>
> require recipes-kernel/linux/linux-dtb.inc
> require recipes-kernel/linux/setup-defconfig.inc
>
>+MACHINE_KERNEL_PR_append =3D "a+gitr${SRCPV}"
>+PR =3D "${MACHINE_KERNEL_PR}"
>+
> KERNEL_DEVICETREE_keystone-evm =3D "k2hk-evm.dtb"
>
>-COMPATIBLE_MACHINE =3D "keystone"
>+KERNEL_EXTRA_ARGS +=3D "LOADADDR=3D${UBOOT_ENTRYPOINT}"
>
>-S =3D "${WORKDIR}/git"
>+#This commit corresponds to "K2_LINUX_03.10.10_13.12"
>+SRCREV =3D "335d14b1c2ce23585835243126c6acba89067ecf"
>
>-BRANCH =3D "sept-2013/master"
>+BRANCH =3D "master"
>
>-# This commit corresponds to K2_LINUX_03.08.04_13.09 tag
>-SRCREV =3D "20a48dc5309c4434650baef2b6072b5f1016f946"
>+SRC_URI =3D "git://git.ti.com/keystone-
>linux/linux.git;protocol=3Dgit;branch=3D${BRANCH}\
>+           file://defconfig\
>+           "
>
>-# Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause
>a rebuild
>-MACHINE_KERNEL_PR_append =3D "a+gitr${SRCPV}"
>-PR =3D "${MACHINE_KERNEL_PR}"
>+S =3D "${WORKDIR}/git"
>+
>+RDEPENDS_kernel-base =3D ""

Why are you blanking the RDEPENDS?  I'm not sure of the issue being fixed h=
ere.

>
>-SRC_URI =3D "git://arago-project.org/git/projects/linux-
>keystone.git;protocol=3Dgit;branch=3D${BRANCH}\
>-           file://defconfig\
>-          "
>--
>1.7.9.5
>
>_______________________________________________
>meta-ti mailing list
>meta-ti@yoctoproject.org
>https://lists.yoctoproject.org/listinfo/meta-ti

