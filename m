Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE789C27C6E
	for <webhook@archiver.kernel.org>; Fri, 14 Jun 2024 21:57:35 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.1408.1718402246826858453
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 14 Jun 2024 14:57:27 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E1B3340CC7;
	Fri, 14 Jun 2024 21:57:25 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fIspCseTcQqs; Fri, 14 Jun 2024 21:57:25 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id BA06B40C3A;
	Fri, 14 Jun 2024 21:57:24 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 335F2163FA0;
	Fri, 14 Jun 2024 17:57:22 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master/scarthgap][PATCH v2 1/4] conf/machine, ti-bsp: add support for multiple BSP providers
Date: Fri, 14 Jun 2024 17:57:18 -0400
Message-Id: <20240614215721.796496-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 14 Jun 2024 21:57:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17744

From: Denys Dmytriyenko <denys@konsulko.com>

This adds a facility to define multiple supported BSPs with their own
preferences for individual components, as well as lets machine configs
specify conditional configurations for different BSPs.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
v2 - rename TI_DEFAULT_BSP to TI_PREFERRED_BSP

 meta-ti-bsp/conf/machine/beagleplay-k3r5.conf |   3 -
 meta-ti-bsp/conf/machine/beagleplay.conf      |   5 +-
 meta-ti-bsp/conf/machine/include/am62pxx.inc  |   2 +-
 meta-ti-bsp/conf/machine/include/am62xx.inc   |   2 +-
 meta-ti-bsp/conf/machine/include/am65xx.inc   |   2 +-
 meta-ti-bsp/conf/machine/include/am68.inc     |   2 +-
 meta-ti-bsp/conf/machine/include/am69.inc     |   2 +-
 meta-ti-bsp/conf/machine/include/beagle.inc   |   4 +-
 meta-ti-bsp/conf/machine/include/j721e.inc    |   2 +-
 meta-ti-bsp/conf/machine/include/j721s2.inc   |   2 +-
 meta-ti-bsp/conf/machine/include/j722s.inc    |   2 +-
 meta-ti-bsp/conf/machine/include/j784s4.inc   |   2 +-
 meta-ti-bsp/conf/machine/include/k3.inc       |   4 +-
 meta-ti-bsp/conf/machine/include/k3r5.inc     |   4 +-
 meta-ti-bsp/conf/machine/include/omap-a15.inc |   6 +-
 meta-ti-bsp/conf/machine/include/omapl138.inc |   4 +-
 meta-ti-bsp/conf/machine/include/ti-bsp.inc   | 109 ++++++++++++++++++
 meta-ti-bsp/conf/machine/include/ti-soc.inc   |   3 +-
 meta-ti-bsp/conf/machine/include/ti33x.inc    |   7 +-
 meta-ti-bsp/conf/machine/include/ti43x.inc    |   7 +-
 20 files changed, 131 insertions(+), 43 deletions(-)
 create mode 100644 meta-ti-bsp/conf/machine/include/ti-bsp.inc

diff --git a/meta-ti-bsp/conf/machine/beagleplay-k3r5.conf b/meta-ti-bsp/=
conf/machine/beagleplay-k3r5.conf
index 601cbbf7..e38029ff 100644
--- a/meta-ti-bsp/conf/machine/beagleplay-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/beagleplay-k3r5.conf
@@ -4,9 +4,6 @@
=20
 require conf/machine/include/k3r5.inc
=20
-PREFERRED_PROVIDER_virtual/bootloader =3D "u-boot-bb.org"
-PREFERRED_PROVIDER_u-boot =3D "u-boot-bb.org"
-
 SYSFW_SOC =3D "am62x"
 SYSFW_CONFIG =3D "evm"
 SYSFW_SUFFIX =3D "gp"
diff --git a/meta-ti-bsp/conf/machine/beagleplay.conf b/meta-ti-bsp/conf/=
machine/beagleplay.conf
index 02bc6566..a09c0d13 100644
--- a/meta-ti-bsp/conf/machine/beagleplay.conf
+++ b/meta-ti-bsp/conf/machine/beagleplay.conf
@@ -11,7 +11,7 @@ MACHINE_FEATURES +=3D "screen gpu"
 SERIAL_CONSOLES =3D "115200;ttyS2"
=20
 require conf/machine/include/mesa-pvr.inc
-PREFERRED_PROVIDER_virtual/gpudriver ?=3D "ti-img-rogue-driver"
+PREFERRED_PROVIDER_virtual/gpudriver ?=3D "${BSP_ROGUE_DRIVER_PROVIDER}"
=20
 TFA_BOARD =3D "lite"
 TFA_K3_SYSTEM_SUSPEND =3D "1"
@@ -25,9 +25,6 @@ UBOOT_MACHINE =3D "am62x_evm_a53_defconfig"
 # under meta-ti-bsp/recipes-bsp/u-boot/ for more details.
 UBOOT_CONFIG_FRAGMENTS =3D "am625_beagleplay_a53.config"
=20
-PREFERRED_PROVIDER_virtual/bootloader =3D "u-boot-bb.org"
-PREFERRED_PROVIDER_u-boot =3D "u-boot-bb.org"
-
 KERNEL_DEVICETREE_PREFIX =3D " \
     ti/k3-am625 \
     ti/k3-am62x-sk \
diff --git a/meta-ti-bsp/conf/machine/include/am62pxx.inc b/meta-ti-bsp/c=
onf/machine/include/am62pxx.inc
index 38e35851..a2825905 100644
--- a/meta-ti-bsp/conf/machine/include/am62pxx.inc
+++ b/meta-ti-bsp/conf/machine/include/am62pxx.inc
@@ -4,7 +4,7 @@ SOC_FAMILY:append =3D ":am62pxx"
 MACHINE_FEATURES +=3D "screen gpu"
=20
 require conf/machine/include/mesa-pvr.inc
-PREFERRED_PROVIDER_virtual/gpudriver ?=3D "ti-img-rogue-driver"
+PREFERRED_PROVIDER_virtual/gpudriver ?=3D "${BSP_ROGUE_DRIVER_PROVIDER}"
=20
 # Default tiboot3.bin on AM62Px is for HS-FS
 IMAGE_BOOT_FILES +=3D "tiboot3-am62px-hs-fs-evm.bin"
diff --git a/meta-ti-bsp/conf/machine/include/am62xx.inc b/meta-ti-bsp/co=
nf/machine/include/am62xx.inc
index a0ec944f..070a691b 100644
--- a/meta-ti-bsp/conf/machine/include/am62xx.inc
+++ b/meta-ti-bsp/conf/machine/include/am62xx.inc
@@ -4,7 +4,7 @@ SOC_FAMILY:append =3D ":am62xx"
 MACHINE_FEATURES +=3D "screen gpu"
=20
 require conf/machine/include/mesa-pvr.inc
-PREFERRED_PROVIDER_virtual/gpudriver ?=3D "ti-img-rogue-driver"
+PREFERRED_PROVIDER_virtual/gpudriver ?=3D "${BSP_ROGUE_DRIVER_PROVIDER}"
=20
 # Default tiboot3.bin on AM62x is for HS-FS
 IMAGE_BOOT_FILES +=3D "tiboot3-am62x-hs-fs-evm.bin"
diff --git a/meta-ti-bsp/conf/machine/include/am65xx.inc b/meta-ti-bsp/co=
nf/machine/include/am65xx.inc
index 48b89638..e033c09b 100644
--- a/meta-ti-bsp/conf/machine/include/am65xx.inc
+++ b/meta-ti-bsp/conf/machine/include/am65xx.inc
@@ -4,7 +4,7 @@ SOC_FAMILY:append =3D ":am65xx"
 MACHINE_FEATURES +=3D "screen touchscreen gpu"
=20
 require conf/machine/include/mesa-pvr.inc
-PREFERRED_PROVIDER_virtual/gpudriver ?=3D ""
+PREFERRED_PROVIDER_virtual/gpudriver ?=3D "${BSP_SGX_DRIVER_PROVIDER}"
=20
 KERNEL_DEVICETREE_PREFIX =3D "ti/k3-am654"
=20
diff --git a/meta-ti-bsp/conf/machine/include/am68.inc b/meta-ti-bsp/conf=
/machine/include/am68.inc
index cb3d1026..327366be 100644
--- a/meta-ti-bsp/conf/machine/include/am68.inc
+++ b/meta-ti-bsp/conf/machine/include/am68.inc
@@ -4,7 +4,7 @@ SOC_FAMILY:append =3D ":j721s2"
 MACHINE_FEATURES +=3D "screen gpu"
=20
 require conf/machine/include/mesa-pvr.inc
-PREFERRED_PROVIDER_virtual/gpudriver ?=3D "ti-img-rogue-driver"
+PREFERRED_PROVIDER_virtual/gpudriver ?=3D "${BSP_ROGUE_DRIVER_PROVIDER}"
=20
 # Default tiboot3.bin on AM68 is for SR1.0 HS-FS
 IMAGE_BOOT_FILES +=3D "tiboot3-j721s2-hs-fs-evm.bin"
diff --git a/meta-ti-bsp/conf/machine/include/am69.inc b/meta-ti-bsp/conf=
/machine/include/am69.inc
index 81be1397..488f9c33 100644
--- a/meta-ti-bsp/conf/machine/include/am69.inc
+++ b/meta-ti-bsp/conf/machine/include/am69.inc
@@ -4,7 +4,7 @@ SOC_FAMILY:append =3D ":j784s4"
 MACHINE_FEATURES +=3D "screen gpu"
=20
 require conf/machine/include/mesa-pvr.inc
-PREFERRED_PROVIDER_virtual/gpudriver ?=3D "ti-img-rogue-driver"
+PREFERRED_PROVIDER_virtual/gpudriver ?=3D "${BSP_ROGUE_DRIVER_PROVIDER}"
=20
 # Default tiboot3.bin on AM69 is for SR1.0 HS-FS
 IMAGE_BOOT_FILES +=3D "tiboot3-j784s4-hs-fs-evm.bin"
diff --git a/meta-ti-bsp/conf/machine/include/beagle.inc b/meta-ti-bsp/co=
nf/machine/include/beagle.inc
index 27e3298d..e5050096 100644
--- a/meta-ti-bsp/conf/machine/include/beagle.inc
+++ b/meta-ti-bsp/conf/machine/include/beagle.inc
@@ -1,3 +1 @@
-
-PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-bb.org"
-
+TI_PREFERRED_BSP ?=3D "bb_org"
diff --git a/meta-ti-bsp/conf/machine/include/j721e.inc b/meta-ti-bsp/con=
f/machine/include/j721e.inc
index 6040feb0..a54c3f2f 100644
--- a/meta-ti-bsp/conf/machine/include/j721e.inc
+++ b/meta-ti-bsp/conf/machine/include/j721e.inc
@@ -4,7 +4,7 @@ SOC_FAMILY:append =3D ":j721e"
 MACHINE_FEATURES +=3D "screen gpu"
=20
 require conf/machine/include/mesa-pvr.inc
-PREFERRED_PROVIDER_virtual/gpudriver ?=3D "ti-img-rogue-driver"
+PREFERRED_PROVIDER_virtual/gpudriver ?=3D "${BSP_ROGUE_DRIVER_PROVIDER}"
=20
 IMAGE_BOOT_FILES +=3D "sysfw.itb"
=20
diff --git a/meta-ti-bsp/conf/machine/include/j721s2.inc b/meta-ti-bsp/co=
nf/machine/include/j721s2.inc
index 5289ec5a..9cd88d9b 100644
--- a/meta-ti-bsp/conf/machine/include/j721s2.inc
+++ b/meta-ti-bsp/conf/machine/include/j721s2.inc
@@ -4,7 +4,7 @@ SOC_FAMILY:append =3D ":j721s2"
 MACHINE_FEATURES +=3D "screen gpu"
=20
 require conf/machine/include/mesa-pvr.inc
-PREFERRED_PROVIDER_virtual/gpudriver ?=3D "ti-img-rogue-driver"
+PREFERRED_PROVIDER_virtual/gpudriver ?=3D "${BSP_ROGUE_DRIVER_PROVIDER}"
=20
 # Default tiboot3.bin on J721S2 is for GP
 IMAGE_BOOT_FILES +=3D "tiboot3-j721s2-gp-evm.bin"
diff --git a/meta-ti-bsp/conf/machine/include/j722s.inc b/meta-ti-bsp/con=
f/machine/include/j722s.inc
index 3b051f1b..3c0717a0 100644
--- a/meta-ti-bsp/conf/machine/include/j722s.inc
+++ b/meta-ti-bsp/conf/machine/include/j722s.inc
@@ -4,7 +4,7 @@ SOC_FAMILY:append =3D ":j722s"
 MACHINE_FEATURES +=3D "screen gpu"
=20
 require conf/machine/include/mesa-pvr.inc
-PREFERRED_PROVIDER_virtual/gpudriver ?=3D "ti-img-rogue-driver"
+PREFERRED_PROVIDER_virtual/gpudriver ?=3D "${BSP_ROGUE_DRIVER_PROVIDER}"
=20
 # Default tiboot3.bin on J722S is for HS-FS
 IMAGE_BOOT_FILES +=3D "tiboot3-j722s-hs-fs-evm.bin"
diff --git a/meta-ti-bsp/conf/machine/include/j784s4.inc b/meta-ti-bsp/co=
nf/machine/include/j784s4.inc
index 92062cdf..883c4a6e 100644
--- a/meta-ti-bsp/conf/machine/include/j784s4.inc
+++ b/meta-ti-bsp/conf/machine/include/j784s4.inc
@@ -4,7 +4,7 @@ SOC_FAMILY:append =3D ":j784s4"
 MACHINE_FEATURES +=3D "screen gpu"
=20
 require conf/machine/include/mesa-pvr.inc
-PREFERRED_PROVIDER_virtual/gpudriver ?=3D "ti-img-rogue-driver"
+PREFERRED_PROVIDER_virtual/gpudriver ?=3D "${BSP_ROGUE_DRIVER_PROVIDER}"
=20
 # Default tiboot3.bin on J784S4 is for GP
 IMAGE_BOOT_FILES +=3D "tiboot3-j784s4-gp-evm.bin"
diff --git a/meta-ti-bsp/conf/machine/include/k3.inc b/meta-ti-bsp/conf/m=
achine/include/k3.inc
index e3da9e12..2b82cb82 100644
--- a/meta-ti-bsp/conf/machine/include/k3.inc
+++ b/meta-ti-bsp/conf/machine/include/k3.inc
@@ -10,9 +10,7 @@ BBMULTICONFIG +=3D "k3r5"
 # Increase this everytime you change something in the kernel
 MACHINE_KERNEL_PR =3D "r0"
=20
-PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-ti-staging"
-PREFERRED_PROVIDER_virtual/bootloader ?=3D "u-boot-ti-staging"
-PREFERRED_PROVIDER_u-boot ?=3D "u-boot-ti-staging"
+require conf/machine/include/ti-bsp.inc
=20
 KERNEL_IMAGETYPE =3D "Image"
 KERNEL_IMAGETYPES =3D "Image fitImage"
diff --git a/meta-ti-bsp/conf/machine/include/k3r5.inc b/meta-ti-bsp/conf=
/machine/include/k3r5.inc
index 63267a5e..fcd54254 100644
--- a/meta-ti-bsp/conf/machine/include/k3r5.inc
+++ b/meta-ti-bsp/conf/machine/include/k3r5.inc
@@ -11,9 +11,9 @@ require conf/machine/include/arm/armv7a/tune-cortexa8.i=
nc
 # https://git.ti.com/cgit/ti-u-boot/ti-u-boot/tree/doc/board/ti/j721e_ev=
m.rst
 # https://git.ti.com/cgit/ti-u-boot/ti-u-boot/tree/doc/board/ti/am62x_sk=
.rst
 # https://git.ti.com/cgit/ti-u-boot/ti-u-boot/tree/doc/board/ti/k3.rst
+
+require conf/machine/include/ti-bsp.inc
 PREFERRED_PROVIDER_virtual/kernel =3D "linux-dummy"
-PREFERRED_PROVIDER_virtual/bootloader ?=3D "u-boot-ti-staging"
-PREFERRED_PROVIDER_u-boot ?=3D "u-boot-ti-staging"
=20
 SPL_SUFFIX =3D "bin"
 SPL_BINARY =3D "tiboot3-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONFIG}.${S=
PL_SUFFIX}"
diff --git a/meta-ti-bsp/conf/machine/include/omap-a15.inc b/meta-ti-bsp/=
conf/machine/include/omap-a15.inc
index 9ca41403..3637ad0a 100644
--- a/meta-ti-bsp/conf/machine/include/omap-a15.inc
+++ b/meta-ti-bsp/conf/machine/include/omap-a15.inc
@@ -7,13 +7,11 @@ require conf/machine/include/arm/armv7a/tune-cortexa15.=
inc
 # Increase this everytime you change something in the kernel
 MACHINE_KERNEL_PR =3D "r7"
=20
-PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-ti-staging"
-PREFERRED_PROVIDER_virtual/bootloader ?=3D "u-boot-ti-staging"
-PREFERRED_PROVIDER_u-boot ?=3D "u-boot-ti-staging"
+require conf/machine/include/ti-bsp.inc
=20
 # Graphics providers and variables
 require conf/machine/include/mesa-pvr.inc
-PREFERRED_PROVIDER_virtual/gpudriver ?=3D ""
+PREFERRED_PROVIDER_virtual/gpudriver ?=3D "${BSP_SGX_DRIVER_PROVIDER}"
 PVR_DISPLAY_CONTROLLER_ALIAS ?=3D "omapdrm"
=20
 KERNEL_IMAGETYPE =3D "zImage"
diff --git a/meta-ti-bsp/conf/machine/include/omapl138.inc b/meta-ti-bsp/=
conf/machine/include/omapl138.inc
index 7f8262a5..486de05d 100644
--- a/meta-ti-bsp/conf/machine/include/omapl138.inc
+++ b/meta-ti-bsp/conf/machine/include/omapl138.inc
@@ -5,9 +5,7 @@ require conf/machine/include/arm/armv5/tune-arm926ejs.inc
=20
 KERNEL_IMAGETYPE =3D "zImage"
=20
-PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-ti-staging"
-PREFERRED_PROVIDER_virtual/bootloader =3D "u-boot-ti-staging"
-PREFERRED_PROVIDER_u-boot =3D "u-boot-ti-staging"
+require conf/machine/include/ti-bsp.inc
=20
 EXTRA_IMAGEDEPENDS +=3D "virtual/bootloader"
=20
diff --git a/meta-ti-bsp/conf/machine/include/ti-bsp.inc b/meta-ti-bsp/co=
nf/machine/include/ti-bsp.inc
new file mode 100644
index 00000000..3bb94a7f
--- /dev/null
+++ b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
@@ -0,0 +1,109 @@
+# Support multiple BSP providers
+# The main input is TI_PREFERRED_BSP, which translates into default
+# preferences for kernel, bootloader and graphics components, as
+# well as a dedicated machine override.
+
+# Supported options are: mainline, ti-6_6, ti-6_1, bb_org
+TI_PREFERRED_BSP ??=3D "ti-6_6"
+
+# Use bsp-* namespace for overrides
+MACHINEOVERRIDES =3D. "bsp-${TI_PREFERRED_BSP}:"
+
+# =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+# mainline
+# latest upstream/mainline kernel, u-boot
+# =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+BSP_KERNEL_PROVIDER:bsp-mainline =3D "linux-ti-mainline"
+BSP_KERNEL_VERSION:bsp-mainline =3D "%"
+BSP_BOOTLOADER_PROVIDER:bsp-mainline =3D "u-boot-ti-mainline"
+BSP_BOOTLOADER_VERSION:bsp-mainline =3D "%"
+
+# GPU support requires out-of-tree SGX and Rogue drivers not available
+# in mainline, usually present in TI staging or derivative like BB.org
+MACHINE_FEATURES:remove:bsp-mainline =3D "gpu"
+
+# =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+# ti-6_6
+# TI staging kernel 6.6, u-boot 2024.04
+# =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+BSP_KERNEL_PROVIDER:bsp-ti-6_6 =3D "linux-ti-staging"
+BSP_KERNEL_VERSION:bsp-ti-6_6 =3D "6.6%"
+BSP_BOOTLOADER_PROVIDER:bsp-ti-6_6 =3D "u-boot-ti-staging"
+BSP_BOOTLOADER_VERSION:bsp-ti-6_6 =3D "2024%"
+
+# Only Rogue is enabled so far, SGX falls back to SW rendering
+BSP_ROGUE_DRIVER_PROVIDER:bsp-ti-6_6 =3D "ti-img-rogue-driver"
+BSP_ROGUE_DRIVER_VERSION:bsp-ti-6_6 =3D "24%"
+BSP_ROGUE_UMLIBS_VERSION:bsp-ti-6_6 =3D "24%"
+BSP_MESA_PVR_VERSION:bsp-ti-6_6 =3D "23%"
+
+# =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+# ti-6_1
+# TI staging kernel 6.1, u-boot 2023.04
+# =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+BSP_KERNEL_PROVIDER:bsp-ti-6_1 =3D "linux-ti-staging"
+BSP_KERNEL_VERSION:bsp-ti-6_1 =3D "6.1%"
+BSP_BOOTLOADER_PROVIDER:bsp-ti-6_1 =3D "u-boot-ti-staging"
+BSP_BOOTLOADER_VERSION:bsp-ti-6_1 =3D "2023%"
+
+BSP_SGX_DRIVER_PROVIDER:bsp-ti-6_1 =3D "ti-sgx-ddk-km"
+BSP_SGX_DRIVER_VERSION:bsp-ti-6_1 =3D "1.17%"
+BSP_SGX_UMLIBS_VERSION:bsp-ti-6_1 =3D "1.17%"
+BSP_ROGUE_DRIVER_PROVIDER:bsp-ti-6_1 =3D "ti-img-rogue-driver"
+BSP_ROGUE_DRIVER_VERSION:bsp-ti-6_1 =3D "23%"
+BSP_ROGUE_UMLIBS_VERSION:bsp-ti-6_1 =3D "23%"
+BSP_MESA_PVR_VERSION:bsp-ti-6_1 =3D "22%"
+
+# =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+# bb_org
+# BeagleBoard.org kernel 6.1, u-boot 2023.04
+# based on TI staging trees with extra Beagle-specific features
+# but may not be up-to-date with TI version
+# =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+BSP_KERNEL_PROVIDER:bsp-bb_org =3D "linux-bb.org"
+BSP_KERNEL_VERSION:bsp-bb_org =3D "%"
+BSP_BOOTLOADER_PROVIDER:bsp-bb_org =3D "u-boot-bb.org"
+BSP_BOOTLOADER_VERSION:bsp-bb_org =3D "%"
+
+BSP_SGX_DRIVER_PROVIDER:bsp-bb_org =3D "ti-sgx-ddk-km"
+BSP_SGX_DRIVER_VERSION:bsp-bb_org =3D "1.17%"
+BSP_SGX_UMLIBS_VERSION:bsp-bb_org =3D "1.17%"
+BSP_ROGUE_DRIVER_PROVIDER:bsp-bb_org =3D "ti-img-rogue-driver"
+BSP_ROGUE_DRIVER_VERSION:bsp-bb_org =3D "23%"
+BSP_ROGUE_UMLIBS_VERSION:bsp-bb_org =3D "23%"
+BSP_MESA_PVR_VERSION:bsp-bb_org =3D "22%"
+
+# =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+# sane fallback defaults
+# if specific values are not defined or bsp is set incorrectly
+# use default preference TI staging and SW-rendering graphics
+# =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+BSP_KERNEL_PROVIDER ?=3D "linux-ti-staging"
+BSP_KERNEL_VERSION ?=3D "%"
+BSP_BOOTLOADER_PROVIDER ?=3D "u-boot-ti-staging"
+BSP_BOOTLOADER_VERSION ?=3D "%"
+
+BSP_SGX_DRIVER_PROVIDER ?=3D ""
+BSP_SGX_DRIVER_VERSION ?=3D ""
+BSP_ROGUE_DRIVER_PROVIDER ?=3D ""
+BSP_ROGUE_DRIVER_VERSION ?=3D ""
+BSP_SGX_UMLIBS_VERSION ?=3D ""
+BSP_ROGUE_UMLIBS_VERSION ?=3D ""
+BSP_MESA_PVR_VERSION ?=3D ""
+
+# =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+# global preferences
+# =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+PREFERRED_PROVIDER_virtual/kernel ?=3D "${BSP_KERNEL_PROVIDER}"
+PREFERRED_VERSION_${BSP_KERNEL_PROVIDER} ?=3D "${BSP_KERNEL_VERSION}"
+PREFERRED_PROVIDER_virtual/bootloader ?=3D "${BSP_BOOTLOADER_PROVIDER}"
+PREFERRED_PROVIDER_u-boot ?=3D "${BSP_BOOTLOADER_PROVIDER}"
+PREFERRED_VERSION_${BSP_BOOTLOADER_PROVIDER} ?=3D "${BSP_BOOTLOADER_VERS=
ION}"
+
+# GPU provider gets set in machine configs, as some machines are headles=
s
+# Select default preferred versions here
+PREFERRED_VERSION_ti-sgx-ddk-km ?=3D "${BSP_SGX_DRIVER_VERSION}"
+PREFERRED_VERSION_ti-sgx-ddk-um ?=3D "${BSP_SGX_UMLIBS_VERSION}"
+PREFERRED_VERSION_ti-img-rogue-driver ?=3D "${BSP_ROGUE_DRIVER_VERSION}"
+PREFERRED_VERSION_ti-img-rogue-umlibs ?=3D "${BSP_ROGUE_UMLIBS_VERSION}"
+PREFERRED_VERSION_mesa-pvr ?=3D "${BSP_MESA_PVR_VERSION}"
diff --git a/meta-ti-bsp/conf/machine/include/ti-soc.inc b/meta-ti-bsp/co=
nf/machine/include/ti-soc.inc
index a1fd3cbf..5d77e719 100644
--- a/meta-ti-bsp/conf/machine/include/ti-soc.inc
+++ b/meta-ti-bsp/conf/machine/include/ti-soc.inc
@@ -1,9 +1,8 @@
 # This is a generic TI SOC family. It is a superset of all other SOCs
 # and platforms defined in meta-ti to allow BSP-level overrides.
 SOC_FAMILY =3D "ti-soc"
+require conf/machine/include/soc-family.inc
=20
 # TI platforms all use devicetrees with overlays
 MACHINE_ESSENTIAL_EXTRA_RDEPENDS +=3D "kernel-devicetree"
 KERNEL_DTB_OVERLAY_SUPPORT ?=3D "1"
-
-require conf/machine/include/soc-family.inc
diff --git a/meta-ti-bsp/conf/machine/include/ti33x.inc b/meta-ti-bsp/con=
f/machine/include/ti33x.inc
index 6fd65b2d..45934aa0 100644
--- a/meta-ti-bsp/conf/machine/include/ti33x.inc
+++ b/meta-ti-bsp/conf/machine/include/ti33x.inc
@@ -7,14 +7,11 @@ require conf/machine/include/arm/armv7a/tune-cortexa8.i=
nc
 # Increase this everytime you change something in the kernel
 MACHINE_KERNEL_PR =3D "r22"
=20
-# Default providers, may need to override for specific machines
-PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-ti-staging"
-PREFERRED_PROVIDER_virtual/bootloader ?=3D "u-boot-ti-staging"
-PREFERRED_PROVIDER_u-boot ?=3D "u-boot-ti-staging"
+require conf/machine/include/ti-bsp.inc
=20
 # Graphics providers and variables
 require conf/machine/include/mesa-pvr.inc
-PREFERRED_PROVIDER_virtual/gpudriver ?=3D ""
+PREFERRED_PROVIDER_virtual/gpudriver ?=3D "${BSP_SGX_DRIVER_PROVIDER}"
 PVR_DISPLAY_CONTROLLER_ALIAS ?=3D "tilcdc"
=20
 KERNEL_IMAGETYPE =3D "zImage"
diff --git a/meta-ti-bsp/conf/machine/include/ti43x.inc b/meta-ti-bsp/con=
f/machine/include/ti43x.inc
index 0a3ef4c3..c6a3c510 100644
--- a/meta-ti-bsp/conf/machine/include/ti43x.inc
+++ b/meta-ti-bsp/conf/machine/include/ti43x.inc
@@ -7,14 +7,11 @@ require conf/machine/include/arm/armv7a/tune-cortexa9.i=
nc
 # Increase this everytime you change something in the kernel
 MACHINE_KERNEL_PR =3D "r3"
=20
-# Default providers, may need to override for specific machines
-PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-ti-staging"
-PREFERRED_PROVIDER_virtual/bootloader ?=3D "u-boot-ti-staging"
-PREFERRED_PROVIDER_u-boot ?=3D "u-boot-ti-staging"
+require conf/machine/include/ti-bsp.inc
=20
 # Graphics providers and variables
 require conf/machine/include/mesa-pvr.inc
-PREFERRED_PROVIDER_virtual/gpudriver ?=3D ""
+PREFERRED_PROVIDER_virtual/gpudriver ?=3D "${BSP_SGX_DRIVER_PROVIDER}"
 PVR_DISPLAY_CONTROLLER_ALIAS ?=3D "omapdrm"
=20
 KERNEL_IMAGETYPE =3D "zImage"
--=20
2.25.1


