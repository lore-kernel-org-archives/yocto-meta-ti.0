Return-Path: <chase.maupin@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 21A46E01358
	for <meta-ti@yoctoproject.org>; Mon, 26 Aug 2013 11:54:22 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r7QIsKes013162;
	Mon, 26 Aug 2013 13:54:20 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7QIsK9c008954;
	Mon, 26 Aug 2013 13:54:20 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.02.0342.003; Mon, 26 Aug 2013 13:54:20 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [PATCH 2/2] linux-ti-staging/linux-ti-glsdk: adjust
	DTB handling to new syntax
Thread-Index: AQHOonkwlIFoLW67+UKiK6TeU3kFHpmn1kZA
Date: Mon, 26 Aug 2013 18:54:20 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101596E8CD5@DLEE11.ent.ti.com>
References: <1377534425-14198-1-git-send-email-denis@denix.org>
	<1377534425-14198-2-git-send-email-denis@denix.org>
In-Reply-To: <1377534425-14198-2-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] linux-ti-staging/linux-ti-glsdk: adjust DTB handling to new syntax
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
X-List-Received-Date: Mon, 26 Aug 2013 18:54:23 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

>-----Original Message-----
>From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
>bounces@yoctoproject.org] On Behalf Of Denys Dmytriyenko
>Sent: Monday, August 26, 2013 11:27 AM
>To: meta-ti@yoctoproject.org
>Subject: [meta-ti] [PATCH 2/2] linux-ti-staging/linux-ti-glsdk:
>adjust DTB handling to new syntax
>
>From: Denys Dmytriyenko <denys@ti.com>
>
>Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>---
> recipes-kernel/linux/linux-ti-glsdk_3.8.bb   |  6 +++---
> recipes-kernel/linux/linux-ti-staging_3.8.bb | 12 ++++++------

Maybe this answers my previous question about older kernels.

> recipes-kernel/linux/linux-ti-staging_git.bb | 14 +++++++-------
> 3 files changed, 16 insertions(+), 16 deletions(-)
>
>diff --git a/recipes-kernel/linux/linux-ti-glsdk_3.8.bb b/recipes-
>kernel/linux/linux-ti-glsdk_3.8.bb
>index 9e3e499..5fd17f8 100644
>--- a/recipes-kernel/linux/linux-ti-glsdk_3.8.bb
>+++ b/recipes-kernel/linux/linux-ti-glsdk_3.8.bb
>@@ -9,8 +9,8 @@ inherit kernel
> require recipes-kernel/linux/linux-dtb.inc
> require recipes-kernel/linux/setup-defconfig.inc
>
>-KERNEL_DEVICETREE_omap5-evm =3D "arch/arm/boot/dts/omap5-sevm.dts
>arch/arm/boot/dts/omap5-uevm.dts"
>-KERNEL_DEVICETREE_dra7xx-evm =3D "arch/arm/boot/dts/dra7-evm.dts"
>+KERNEL_DEVICETREE_omap5-evm =3D "omap5-sevm.dtb omap5-uevm.dtb"
>+KERNEL_DEVICETREE_dra7xx-evm =3D "dra7-evm.dtb"
>
> COMPATIBLE_MACHINE =3D "omap-a15"
>
>@@ -24,7 +24,7 @@ SRCREV =3D
>"6076e6882d1d6a64b104e42e56a3eada36605cb3"
> PV =3D "3.8.13"
>
> # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause
>a rebuild
>-MACHINE_KERNEL_PR_append =3D "b+gitr${SRCPV}"
>+MACHINE_KERNEL_PR_append =3D "c+gitr${SRCPV}"
>
> SRC_URI =3D "git://git.ti.com/ti-linux-kernel/ti-linux-3-8-y-
>kernel.git;protocol=3Dgit;branch=3D${BRANCH} \
>            file://defconfig \
>diff --git a/recipes-kernel/linux/linux-ti-staging_3.8.bb
>b/recipes-kernel/linux/linux-ti-staging_3.8.bb
>index 29ffebc..fd7b671 100644
>--- a/recipes-kernel/linux/linux-ti-staging_3.8.bb
>+++ b/recipes-kernel/linux/linux-ti-staging_3.8.bb
>@@ -13,12 +13,12 @@ require recipes-kernel/linux/setup-
>defconfig.inc
> # on the target file system.
> RDEPENDS_kernel-base_ti33x +=3D "am33x-cm3 am33x-cm3-initscript"
>
>-# Default is to package all dts files for ti33x devices unless
>building
>+# Default is to package all dtb files for ti33x devices unless
>building
> # for the specific beaglebone machine.
>-KERNEL_DEVICETREE_ti33x =3D "arch/arm/boot/dts/am335x-evm.dts
>arch/arm/boot/dts/am335x-evmsk.dts arch/arm/boot/dts/am335x-
>bone.dts"
>-KERNEL_DEVICETREE_beaglebone =3D "arch/arm/boot/dts/am335x-
>bone.dts"
>-KERNEL_DEVICETREE_omap5-evm =3D "arch/arm/boot/dts/omap5-sevm.dts
>arch/arm/boot/dts/omap5-uevm.dts"
>-KERNEL_DEVICETREE_dra7xx-evm =3D "arch/arm/boot/dts/dra7-evm.dts"
>+KERNEL_DEVICETREE_ti33x =3D "am335x-evm.dtb am335x-evmsk.dtb
>am335x-bone.dtb"
>+KERNEL_DEVICETREE_beaglebone =3D "am335x-bone.dtb"
>+KERNEL_DEVICETREE_omap5-evm =3D "omap5-sevm.dtb omap5-uevm.dtb"
>+KERNEL_DEVICETREE_dra7xx-evm =3D "dra7-evm.dtb"
>
> COMPATIBLE_MACHINE =3D "ti33x|omap-a15"
>
>@@ -31,7 +31,7 @@ SRCREV =3D
>"f3cb62a800ae37f17a3382b10d155ee02dbc83fc"
> PV =3D "3.8.13"
>
> # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause
>a rebuild
>-MACHINE_KERNEL_PR_append =3D "f+gitr${SRCPV}"
>+MACHINE_KERNEL_PR_append =3D "g+gitr${SRCPV}"
>
> SRC_URI =3D "git://git.ti.com/ti-linux-kernel/ti-linux-
>kernel.git;protocol=3Dgit;branch=3D${BRANCH} \
>            file://defconfig \
>diff --git a/recipes-kernel/linux/linux-ti-staging_git.bb
>b/recipes-kernel/linux/linux-ti-staging_git.bb
>index cb59dbb..7d84cc4 100644
>--- a/recipes-kernel/linux/linux-ti-staging_git.bb
>+++ b/recipes-kernel/linux/linux-ti-staging_git.bb
>@@ -13,13 +13,13 @@ require recipes-kernel/linux/setup-
>defconfig.inc
> # on the target file system.
> RDEPENDS_kernel-base_ti33x +=3D "am33x-cm3 am33x-cm3-initscript"
>
>-# Default is to package all dts files for ti33x devices unless
>building
>+# Default is to package all dtb files for ti33x devices unless
>building
> # for the specific beaglebone machine.
>-KERNEL_DEVICETREE_ti33x =3D "arch/arm/boot/dts/am335x-evm.dts
>arch/arm/boot/dts/am335x-evmsk.dts arch/arm/boot/dts/am335x-
>bone.dts"
>-KERNEL_DEVICETREE_am437x-evm =3D "arch/arm/boot/dts/am43x-epos-
>evm.dts"
>-KERNEL_DEVICETREE_beaglebone =3D "arch/arm/boot/dts/am335x-
>bone.dts"
>-KERNEL_DEVICETREE_omap5-evm =3D "arch/arm/boot/dts/omap5-sevm.dts
>arch/arm/boot/dts/omap5-uevm.dts"
>-KERNEL_DEVICETREE_dra7xx-evm =3D "arch/arm/boot/dts/dra7-evm.dts"
>+KERNEL_DEVICETREE_ti33x =3D "am335x-evm.dtb am335x-evmsk.dtb
>am335x-bone.dtb"
>+KERNEL_DEVICETREE_am437x-evm =3D "am43x-epos-evm.dtb"
>+KERNEL_DEVICETREE_beaglebone =3D "am335x-bone.dtb"
>+KERNEL_DEVICETREE_omap5-evm =3D "omap5-sevm.dtb omap5-uevm.dtb"
>+KERNEL_DEVICETREE_dra7xx-evm =3D "dra7-evm.dtb"
>
> KERNEL_EXTRA_ARGS +=3D "LOADADDR=3D${UBOOT_ENTRYPOINT}"
>
>@@ -35,7 +35,7 @@ SRCREV =3D
>"b36f4be3de1b123d8601de062e7dbfc904f305fb"
> PV =3D "3.10+3.11-rc6"
>
> # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause
>a rebuild
>-MACHINE_KERNEL_PR_append =3D "a+gitr${SRCPV}"
>+MACHINE_KERNEL_PR_append =3D "b+gitr${SRCPV}"
>
> SRC_URI =3D "git://git.ti.com/ti-linux-kernel/ti-linux-
>kernel.git;protocol=3Dgit;branch=3D${BRANCH} \
>            file://defconfig \
>--
>1.8.3.2
>
>_______________________________________________
>meta-ti mailing list
>meta-ti@yoctoproject.org
>https://lists.yoctoproject.org/listinfo/meta-ti

