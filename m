Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1C17C38142
	for <webhook@archiver.kernel.org>; Fri, 20 Jan 2023 01:41:04 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.64378.1674178855681787718
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 19 Jan 2023 17:40:55 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 0265640C98
	for <meta-ti@lists.yoctoproject.org>; Fri, 20 Jan 2023 01:40:54 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MkiJ2XFFREPm for <meta-ti@lists.yoctoproject.org>;
	Fri, 20 Jan 2023 01:40:53 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E76DB40CA2
	for <meta-ti@lists.yoctoproject.org>; Fri, 20 Jan 2023 01:40:53 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id D83E7163708
	for <meta-ti@lists.yoctoproject.org>; Thu, 19 Jan 2023 20:40:32 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master/kirkstone][PATCH v2 7/7] conf: machine: Rework do_image_wic dependencies
Date: Fri, 20 Jan 2023 01:40:50 +0000
Message-Id: <20230120014050.1988728-7-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230120014050.1988728-1-denis@denix.org>
References: <20230120014050.1988728-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 20 Jan 2023 01:41:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15606

From: Andrew Davis <afd@ti.com>

The WIC image for K3 depends on the TI-SCI firmware, on AM65x and J721e
also the bootloader. Make this clear by only depending on firmware in
the base k3.inc file, then adding the bootloader dependency in AM65x and
J721e specific includes.

Remove unneeded overrides from the evm level files.

Remove do_image_tar dependencies as the tar files do not include
the bootloader nor TI-SCI firmware, only the boot partition of
the WIC file needs these.

Signed-off-by: Andrew Davis <afd@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
v2 - default to SR1-1 for J721e HS, while using SR1 for J721e GP

 meta-ti-bsp/conf/machine/include/am62xx.inc           |  3 ---
 meta-ti-bsp/conf/machine/include/am64xx.inc           |  8 +++-----
 meta-ti-bsp/conf/machine/include/am65xx.inc           | 10 +++++-----
 meta-ti-bsp/conf/machine/include/j721e.inc            |  5 +++++
 meta-ti-bsp/conf/machine/include/k3.inc               |  3 +--
 meta-ti-bsp/conf/machine/include/omap-a15.inc         |  2 +-
 meta-ti-bsp/conf/machine/include/ti43x.inc            |  2 +-
 meta-ti-bsp/conf/machine/j7200-evm.conf               |  3 ---
 meta-ti-bsp/conf/machine/j721e-evm.conf               |  3 ---
 meta-ti-bsp/conf/machine/j721e-hs-evm-k3r5-sr1-1.conf | 11 -----------
 meta-ti-bsp/conf/machine/j721e-hs-evm-k3r5.conf       |  3 +--
 meta-ti-bsp/conf/machine/j721e-hs-evm.conf            |  7 -------
 meta-ti-bsp/conf/machine/j721s2-evm.conf              |  3 ---
 meta-ti-bsp/conf/machine/j784s4-evm.conf              |  3 ---
 meta-ti-bsp/conf/multiconfig/k3r5-sr1-1.conf          |  3 ---
 15 files changed, 17 insertions(+), 52 deletions(-)
 delete mode 100644 meta-ti-bsp/conf/machine/j721e-hs-evm-k3r5-sr1-1.conf
 delete mode 100644 meta-ti-bsp/conf/multiconfig/k3r5-sr1-1.conf

diff --git a/meta-ti-bsp/conf/machine/include/am62xx.inc b/meta-ti-bsp/co=
nf/machine/include/am62xx.inc
index 9d8bc87c..411e5265 100644
--- a/meta-ti-bsp/conf/machine/include/am62xx.inc
+++ b/meta-ti-bsp/conf/machine/include/am62xx.inc
@@ -12,9 +12,6 @@ PREFERRED_PROVIDER_virtual/libgles2 ?=3D "ti-img-rogue-=
umlibs"
 PREFERRED_PROVIDER_virtual/libgbm ?=3D "ti-img-rogue-umlibs"
 PREFERRED_PROVIDER_virtual/gpudriver ?=3D "ti-img-rogue-driver"
=20
-do_image_wic[mcdepends] =3D "mc::k3r5:ti-sci-fw:do_deploy"
-do_image_tar[mcdepends] =3D "mc::k3r5:ti-sci-fw:do_deploy"
-
 TFA_BOARD =3D "lite"
 TFA_K3_SYSTEM_SUSPEND =3D "1"
=20
diff --git a/meta-ti-bsp/conf/machine/include/am64xx.inc b/meta-ti-bsp/co=
nf/machine/include/am64xx.inc
index f1a91991..0fd15b90 100644
--- a/meta-ti-bsp/conf/machine/include/am64xx.inc
+++ b/meta-ti-bsp/conf/machine/include/am64xx.inc
@@ -17,19 +17,17 @@ KERNEL_DEVICETREE =3D " \
 # Default tiboot3.bin on AM64x is for SR2.0 HS-FS
 BBMULTICONFIG =3D "k3r5-sr2-hs-fs"
 do_image_wic[mcdepends] =3D "mc::k3r5-sr2-hs-fs:ti-sci-fw:do_deploy"
-do_image_tar[mcdepends] =3D "mc::k3r5-sr2-hs-fs:ti-sci-fw:do_deploy"
+IMAGE_BOOT_FILES +=3D "tiboot3-am64x_sr2-hs-fs-evm.bin"
=20
 # Since default tiboot3.bin on AM64x is for SR2.0 HS-FS, add a version f=
or GP
 BBMULTICONFIG +=3D "k3r5-gp"
-IMAGE_BOOT_FILES +=3D "tiboot3-am64x-gp-evm.bin"
 do_image_wic[mcdepends] +=3D "mc::k3r5-gp:ti-sci-fw:do_deploy"
-do_image_tar[mcdepends] +=3D "mc::k3r5-gp:ti-sci-fw:do_deploy"
+IMAGE_BOOT_FILES +=3D "tiboot3-am64x-gp-evm.bin"
=20
 # Since default tiboot3.bin on AM64x is for SR2.0 HS-FS, add a version f=
or SR2.0 HS-SE
 BBMULTICONFIG +=3D "k3r5-sr2-hs-se"
-IMAGE_BOOT_FILES +=3D "tiboot3-am64x_sr2-hs-evm.bin"
 do_image_wic[mcdepends] +=3D "mc::k3r5-sr2-hs-se:ti-sci-fw:do_deploy"
-do_image_tar[mcdepends] +=3D "mc::k3r5-sr2-hs-se:ti-sci-fw:do_deploy"
+IMAGE_BOOT_FILES +=3D "tiboot3-am64x_sr2-hs-evm.bin"
=20
 TFA_BOARD =3D "lite"
=20
diff --git a/meta-ti-bsp/conf/machine/include/am65xx.inc b/meta-ti-bsp/co=
nf/machine/include/am65xx.inc
index 88259717..424864d3 100644
--- a/meta-ti-bsp/conf/machine/include/am65xx.inc
+++ b/meta-ti-bsp/conf/machine/include/am65xx.inc
@@ -26,17 +26,17 @@ KERNEL_DEVICETREE =3D " \
     ti/k3-am654-evm-ov5640.dtbo \
 "
=20
-BBMULTICONFIG +=3D "k3r5-sr2"
+# On AM65x the file tiboot3.bin comes from the bootloader not ti-sci-fw
+do_image_wic[mcdepends] +=3D "mc::k3r5:virtual/bootloader:do_deploy"
=20
-# Since J721e does not support multi-cert tiboot3.bin add standalone sys=
fw.itb
+# Default sysfw.itb on AM65x is for SR2.0
+BBMULTICONFIG +=3D "k3r5-sr2"
+do_image_wic[mcdepends] +=3D "mc::k3r5-sr2:ti-sci-fw:do_deploy"
 IMAGE_BOOT_FILES +=3D "sysfw.itb"
=20
 # Since default sysfw.itb on AM65x is for SR2.0, add a version for SR1.0
 IMAGE_BOOT_FILES +=3D "sysfw-am65x-evm.itb"
=20
-do_image_wic[mcdepends] +=3D "mc::k3r5-sr2:ti-sci-fw:do_deploy"
-do_image_tar[mcdepends] +=3D "mc::k3r5-sr2:ti-sci-fw:do_deploy"
-
 TFA_BOARD =3D "generic"
=20
 OPTEEMACHINE =3D "k3-am65x"
diff --git a/meta-ti-bsp/conf/machine/include/j721e.inc b/meta-ti-bsp/con=
f/machine/include/j721e.inc
index 12ee0c90..eba10d8d 100644
--- a/meta-ti-bsp/conf/machine/include/j721e.inc
+++ b/meta-ti-bsp/conf/machine/include/j721e.inc
@@ -9,6 +9,11 @@ PREFERRED_PROVIDER_virtual/libgles2 ?=3D "ti-img-rogue-u=
mlibs"
 PREFERRED_PROVIDER_virtual/libgbm ?=3D "ti-img-rogue-umlibs"
 PREFERRED_PROVIDER_virtual/gpudriver ?=3D "ti-img-rogue-driver"
=20
+# On J721e the file tiboot3.bin comes from the bootloader not ti-sci-fw
+do_image_wic[mcdepends] +=3D "mc::k3r5:virtual/bootloader:do_deploy"
+
+IMAGE_BOOT_FILES +=3D "sysfw.itb"
+
 TFA_BOARD =3D "generic"
=20
 OPTEEMACHINE =3D "k3-j721e"
diff --git a/meta-ti-bsp/conf/machine/include/k3.inc b/meta-ti-bsp/conf/m=
achine/include/k3.inc
index bd71becf..a34b67ff 100644
--- a/meta-ti-bsp/conf/machine/include/k3.inc
+++ b/meta-ti-bsp/conf/machine/include/k3.inc
@@ -47,7 +47,6 @@ MACHINE_FEATURES +=3D "efi"
=20
 WKS_FILE ?=3D "sdimage-2part-efi.wks"
 do_image_wic[depends] +=3D "virtual/bootloader:do_deploy"
-do_image_wic[mcdepends] +=3D "mc::k3r5:virtual/bootloader:do_deploy mc::=
k3r5:ti-sci-fw:do_deploy"
-do_image_tar[mcdepends] +=3D "mc::k3r5:virtual/bootloader:do_deploy mc::=
k3r5:ti-sci-fw:do_deploy"
+do_image_wic[mcdepends] +=3D "mc::k3r5:ti-sci-fw:do_deploy"
=20
 TI_SECURE_DEV_PKG =3D "${TI_SECURE_DEV_PKG_K3}"
diff --git a/meta-ti-bsp/conf/machine/include/omap-a15.inc b/meta-ti-bsp/=
conf/machine/include/omap-a15.inc
index f548f3fd..0843fb28 100644
--- a/meta-ti-bsp/conf/machine/include/omap-a15.inc
+++ b/meta-ti-bsp/conf/machine/include/omap-a15.inc
@@ -50,4 +50,4 @@ MACHINE_FEATURES =3D "kernel26 apm usbgadget usbhost vf=
at ext2 screen alsa etherne
 IMAGE_FSTYPES +=3D "tar.xz wic.xz wic.bmap"
 WKS_FILE ?=3D "sdimage-2part.wks"
 IMAGE_BOOT_FILES ?=3D "${SPL_BINARY} u-boot.${UBOOT_SUFFIX} ${UBOOT_EXTL=
INUX_BOOT_FILES}"
-do_image_wic[depends] +=3D "u-boot:do_deploy"
+do_image_wic[depends] +=3D "virtual/bootloader:do_deploy"
diff --git a/meta-ti-bsp/conf/machine/include/ti43x.inc b/meta-ti-bsp/con=
f/machine/include/ti43x.inc
index 5509a54d..74a964db 100644
--- a/meta-ti-bsp/conf/machine/include/ti43x.inc
+++ b/meta-ti-bsp/conf/machine/include/ti43x.inc
@@ -59,4 +59,4 @@ MACHINE_FEATURES =3D "kernel26 apm usbgadget usbhost vf=
at ext2 screen alsa etherne
 IMAGE_FSTYPES +=3D "tar.xz wic.xz wic.bmap"
 WKS_FILE ?=3D "sdimage-2part.wks"
 IMAGE_BOOT_FILES ?=3D "${SPL_BINARY} u-boot.${UBOOT_SUFFIX} ${UBOOT_EXTL=
INUX_BOOT_FILES}"
-do_image_wic[depends] +=3D "u-boot:do_deploy"
+do_image_wic[depends] +=3D "virtual/bootloader:do_deploy"
diff --git a/meta-ti-bsp/conf/machine/j7200-evm.conf b/meta-ti-bsp/conf/m=
achine/j7200-evm.conf
index 303ec182..33c39a52 100644
--- a/meta-ti-bsp/conf/machine/j7200-evm.conf
+++ b/meta-ti-bsp/conf/machine/j7200-evm.conf
@@ -12,6 +12,3 @@ KERNEL_DEVICETREE =3D " \
 "
=20
 UBOOT_MACHINE =3D "j7200_evm_a72_config"
-
-do_image_wic[mcdepends] =3D "mc::k3r5:ti-sci-fw:do_deploy"
-do_image_tar[mcdepends] =3D "mc::k3r5:ti-sci-fw:do_deploy"
diff --git a/meta-ti-bsp/conf/machine/j721e-evm.conf b/meta-ti-bsp/conf/m=
achine/j721e-evm.conf
index d28d16d1..fe28e6f5 100644
--- a/meta-ti-bsp/conf/machine/j721e-evm.conf
+++ b/meta-ti-bsp/conf/machine/j721e-evm.conf
@@ -7,9 +7,6 @@ require conf/machine/include/j721e.inc
 SERIAL_CONSOLES =3D "115200;ttyS2 115200;ttyS3"
 SERIAL_CONSOLES_CHECK =3D "${SERIAL_CONSOLES}"
=20
-# Since J721e does not support multi-cert tiboot3.bin add standalone sys=
fw.itb
-IMAGE_BOOT_FILES +=3D "sysfw.itb"
-
 KERNEL_DEVICETREE =3D " \
     ti/k3-j721e-common-proc-board.dtb \
     ti/k3-j721e-common-proc-board-infotainment.dtbo \
diff --git a/meta-ti-bsp/conf/machine/j721e-hs-evm-k3r5-sr1-1.conf b/meta=
-ti-bsp/conf/machine/j721e-hs-evm-k3r5-sr1-1.conf
deleted file mode 100644
index 6e809f46..00000000
--- a/meta-ti-bsp/conf/machine/j721e-hs-evm-k3r5-sr1-1.conf
+++ /dev/null
@@ -1,11 +0,0 @@
-#@TYPE: Machine
-#@NAME: J721e SR1.1 HS EVM (R5F)
-#@DESCRIPTION: Machine configuration for the TI J721e SR1.1 HS EVM (R5F =
core)
-
-# Booting SR1.1 requires different SYSFW, the rest is handled at runtime
-
-require conf/machine/j721e-hs-evm-k3r5.conf
-SOC_FAMILY:append =3D ":k3r5-sr1-1"
-
-SYSFW_SOC =3D "j721e_sr1_1"
-SYSFW_SYMLINK =3D "sysfw.itb"
diff --git a/meta-ti-bsp/conf/machine/j721e-hs-evm-k3r5.conf b/meta-ti-bs=
p/conf/machine/j721e-hs-evm-k3r5.conf
index a0d000b2..56312c0c 100644
--- a/meta-ti-bsp/conf/machine/j721e-hs-evm-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/j721e-hs-evm-k3r5.conf
@@ -4,10 +4,9 @@
=20
 require conf/machine/include/k3r5.inc
=20
-SYSFW_SOC =3D "j721e"
+SYSFW_SOC =3D "j721e_sr1_1"
 SYSFW_CONFIG =3D "evm"
 SYSFW_SUFFIX =3D "hs"
-SYSFW_SYMLINK =3D ""
=20
 SPL_BINARY =3D "spl/u-boot-spl.${UBOOT_SUFFIX}"
 SPL_SYMLINK =3D "u-boot-r5spl.${UBOOT_SUFFIX}"
diff --git a/meta-ti-bsp/conf/machine/j721e-hs-evm.conf b/meta-ti-bsp/con=
f/machine/j721e-hs-evm.conf
index 9ef7b86a..acd5ca18 100644
--- a/meta-ti-bsp/conf/machine/j721e-hs-evm.conf
+++ b/meta-ti-bsp/conf/machine/j721e-hs-evm.conf
@@ -18,10 +18,3 @@ SPL_BINARY =3D "tispl.bin_HS"
 UBOOT_BINARY =3D "u-boot.img_HS"
 UBOOT_SYMLINK =3D "u-boot.img"
 SYSFW_SYMLINK =3D ""
-
-BBMULTICONFIG +=3D "k3r5-sr1-1"
-
-# Since default sysfw.itb on J721e is for SR1.1, add a version for SR1.0
-IMAGE_BOOT_FILES +=3D "sysfw-j721e-evm.itb"
-do_image_wic[mcdepends] +=3D "mc::k3r5-sr1-1:ti-sci-fw:do_deploy"
-do_image_tar[mcdepends] +=3D "mc::k3r5-sr1-1:ti-sci-fw:do_deploy"
diff --git a/meta-ti-bsp/conf/machine/j721s2-evm.conf b/meta-ti-bsp/conf/=
machine/j721s2-evm.conf
index 46d5dbf6..3576414d 100644
--- a/meta-ti-bsp/conf/machine/j721s2-evm.conf
+++ b/meta-ti-bsp/conf/machine/j721s2-evm.conf
@@ -15,6 +15,3 @@ KERNEL_DEVICETREE =3D " \
 "
=20
 UBOOT_MACHINE =3D "j721s2_evm_a72_defconfig"
-
-do_image_wic[mcdepends] =3D "mc::k3r5:ti-sci-fw:do_deploy"
-do_image_tar[mcdepends] =3D "mc::k3r5:ti-sci-fw:do_deploy"
diff --git a/meta-ti-bsp/conf/machine/j784s4-evm.conf b/meta-ti-bsp/conf/=
machine/j784s4-evm.conf
index f8be7d18..73f3eb8c 100644
--- a/meta-ti-bsp/conf/machine/j784s4-evm.conf
+++ b/meta-ti-bsp/conf/machine/j784s4-evm.conf
@@ -14,6 +14,3 @@ KERNEL_DEVICETREE =3D " \
 "
=20
 UBOOT_MACHINE =3D "j784s4_evm_a72_defconfig"
-
-do_image_wic[mcdepends] =3D "mc::k3r5:ti-sci-fw:do_deploy"
-do_image_tar[mcdepends] =3D "mc::k3r5:ti-sci-fw:do_deploy"
diff --git a/meta-ti-bsp/conf/multiconfig/k3r5-sr1-1.conf b/meta-ti-bsp/c=
onf/multiconfig/k3r5-sr1-1.conf
deleted file mode 100644
index 428f2212..00000000
--- a/meta-ti-bsp/conf/multiconfig/k3r5-sr1-1.conf
+++ /dev/null
@@ -1,3 +0,0 @@
-require k3r5.conf
-
-MACHINE:append =3D "-sr1-1"
--=20
2.25.1


