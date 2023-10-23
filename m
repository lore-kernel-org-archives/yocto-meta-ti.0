Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DD77C00A8F
	for <webhook@archiver.kernel.org>; Mon, 23 Oct 2023 22:38:25 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.135116.1698100701352041129
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 23 Oct 2023 15:38:22 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 98DD440CCA;
	Mon, 23 Oct 2023 22:38:20 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UXnJV5AcbCXj; Mon, 23 Oct 2023 22:38:20 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 2AAE240CC8;
	Mon, 23 Oct 2023 22:38:17 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id CEA2C163D1F;
	Mon, 23 Oct 2023 18:38:16 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>,
	Andrew Davis <afd@ti.com>,
	Ryan Eatmon <reatmon@ti.com>
Subject: [master/kirkstone][PATCH v2] conf: machine: move RDEPENDS and RRECOMMENDS from kernel-rdepends.inc
Date: Mon, 23 Oct 2023 22:38:16 +0000
Message-Id: <20231023223816.1512973-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 23 Oct 2023 22:38:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17185

From: Denys Dmytriyenko <denys@konsulko.com>

Instead of making kernel RDEPENDS on devicetree and different FW images w=
ith
lots of machine-override appends that are hard to modify downstream, use =
proper
MACHINE_ESSENTIAL_EXTRA_RDEPENDS and MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS =
vars
that are specifically designed for this purpose.

This also makes such dependencies generic and not tied to a particular ke=
rnel
recipe including kernel-rdepends.inc with the entire machine-specific lis=
t.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
Acked-by: Andrew Davis <afd@ti.com>
Acked-by: Ryan Eatmon <reatmon@ti.com>
---
v2 - move PRU images from common omap-a15.inc to am57xx.inc

 meta-ti-bsp/conf/machine/am65xx-evm.conf      |  2 +
 meta-ti-bsp/conf/machine/beagle-x15.conf      |  2 -
 meta-ti-bsp/conf/machine/beaglebone-ai64.conf |  4 --
 meta-ti-bsp/conf/machine/beaglebone.conf      |  4 --
 meta-ti-bsp/conf/machine/beagleplay.conf      |  4 --
 meta-ti-bsp/conf/machine/include/am57xx.inc   |  2 +
 meta-ti-bsp/conf/machine/include/am62axx.inc  |  2 +
 meta-ti-bsp/conf/machine/include/am64xx.inc   |  2 +
 meta-ti-bsp/conf/machine/include/am65xx.inc   |  2 +
 meta-ti-bsp/conf/machine/include/j7200.inc    |  2 +
 meta-ti-bsp/conf/machine/include/j721e.inc    |  2 +
 meta-ti-bsp/conf/machine/include/j721s2.inc   |  2 +
 meta-ti-bsp/conf/machine/include/j784s4.inc   |  2 +
 meta-ti-bsp/conf/machine/include/k3.inc       |  2 +
 meta-ti-bsp/conf/machine/include/omap-a15.inc |  4 ++
 meta-ti-bsp/conf/machine/include/omapl138.inc |  2 +
 meta-ti-bsp/conf/machine/include/ti-soc.inc   |  4 ++
 meta-ti-bsp/conf/machine/include/ti33x.inc    |  4 ++
 meta-ti-bsp/conf/machine/include/ti43x.inc    |  6 ++-
 .../recipes-kernel/linux/kernel-rdepends.inc  | 38 -------------------
 .../linux/linux-ti-mainline_git.bb            |  1 -
 .../linux/linux-ti-staging_5.10.bb            |  1 -
 .../linux/linux-ti-staging_6.1.bb             |  1 -
 23 files changed, 39 insertions(+), 56 deletions(-)
 delete mode 100644 meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc

diff --git a/meta-ti-bsp/conf/machine/am65xx-evm.conf b/meta-ti-bsp/conf/=
machine/am65xx-evm.conf
index 8b6ef546..f6eb6f0c 100644
--- a/meta-ti-bsp/conf/machine/am65xx-evm.conf
+++ b/meta-ti-bsp/conf/machine/am65xx-evm.conf
@@ -5,3 +5,5 @@
 require conf/machine/include/am65xx.inc
=20
 UBOOT_MACHINE =3D "am65x_evm_a53_defconfig"
+
+MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS +=3D "prueth-fw-am65x-sr2 pruhsr-fw-=
am65x-sr2 prusw-fw-am65x-sr2"
diff --git a/meta-ti-bsp/conf/machine/beagle-x15.conf b/meta-ti-bsp/conf/=
machine/beagle-x15.conf
index 3b857165..be27705c 100644
--- a/meta-ti-bsp/conf/machine/beagle-x15.conf
+++ b/meta-ti-bsp/conf/machine/beagle-x15.conf
@@ -19,5 +19,3 @@ MACHINE_GUI_CLASS =3D "bigscreen"
 SERIAL_CONSOLES =3D "115200;ttyS2"
=20
 UBOOT_MACHINE =3D "am57xx_evm_config"
-
-MACHINE_ESSENTIAL_EXTRA_RDEPENDS +=3D "kernel-devicetree kernel-image-zi=
mage"
diff --git a/meta-ti-bsp/conf/machine/beaglebone-ai64.conf b/meta-ti-bsp/=
conf/machine/beaglebone-ai64.conf
index 3f5a027e..e529f565 100644
--- a/meta-ti-bsp/conf/machine/beaglebone-ai64.conf
+++ b/meta-ti-bsp/conf/machine/beaglebone-ai64.conf
@@ -24,7 +24,3 @@ ti/k3-j721e-sk.dtb \
 "
=20
 MACHINE_GUI_CLASS =3D "bigscreen"
-
-MACHINE_ESSENTIAL_EXTRA_RDEPENDS +=3D "kernel-devicetree kernel-image-im=
age"
-
-MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS +=3D "cadence-mhdp-fw vxd-dec-fw"
diff --git a/meta-ti-bsp/conf/machine/beaglebone.conf b/meta-ti-bsp/conf/=
machine/beaglebone.conf
index 45944ce8..d9353e9b 100644
--- a/meta-ti-bsp/conf/machine/beaglebone.conf
+++ b/meta-ti-bsp/conf/machine/beaglebone.conf
@@ -21,7 +21,3 @@ MACHINE_GUI_CLASS =3D "bigscreen"
 MACHINE_FEATURES +=3D "screen"
=20
 SERIAL_CONSOLES =3D "115200;ttyS0"
-
-MACHINE_ESSENTIAL_EXTRA_RDEPENDS +=3D "kernel-devicetree kernel-image-zi=
mage"
-
-MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS +=3D "amx3-cm3"
diff --git a/meta-ti-bsp/conf/machine/beagleplay.conf b/meta-ti-bsp/conf/=
machine/beagleplay.conf
index 4dd550a1..978bbc5a 100644
--- a/meta-ti-bsp/conf/machine/beagleplay.conf
+++ b/meta-ti-bsp/conf/machine/beagleplay.conf
@@ -42,7 +42,3 @@ ti/k3-am625-sk-rpi-hdr-pwm.dtbo \
 "
=20
 MACHINE_GUI_CLASS =3D "bigscreen"
-
-MACHINE_ESSENTIAL_EXTRA_RDEPENDS +=3D "kernel-devicetree kernel-image-im=
age"
-
-MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS +=3D ""
diff --git a/meta-ti-bsp/conf/machine/include/am57xx.inc b/meta-ti-bsp/co=
nf/machine/include/am57xx.inc
index 6c52883b..85290924 100644
--- a/meta-ti-bsp/conf/machine/include/am57xx.inc
+++ b/meta-ti-bsp/conf/machine/include/am57xx.inc
@@ -3,3 +3,5 @@ SOC_FAMILY:append =3D ":dra7xx"
 SOC_FAMILY:append =3D ":am57xx"
=20
 MACHINE_FEATURES +=3D "pci"
+
+MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS +=3D "prueth-fw prusw-fw pruhsr-fw p=
ruprp-fw"
diff --git a/meta-ti-bsp/conf/machine/include/am62axx.inc b/meta-ti-bsp/c=
onf/machine/include/am62axx.inc
index 12889057..93a41d8d 100644
--- a/meta-ti-bsp/conf/machine/include/am62axx.inc
+++ b/meta-ti-bsp/conf/machine/include/am62axx.inc
@@ -16,3 +16,5 @@ IMAGE_BOOT_FILES +=3D "tiboot3-am62ax-hs-evm.bin"
=20
 TFA_BOARD =3D "lite"
 OPTEEMACHINE =3D "k3-am62x"
+
+MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS +=3D "cnm-wave-fw"
diff --git a/meta-ti-bsp/conf/machine/include/am64xx.inc b/meta-ti-bsp/co=
nf/machine/include/am64xx.inc
index 9112b78b..85652eef 100644
--- a/meta-ti-bsp/conf/machine/include/am64xx.inc
+++ b/meta-ti-bsp/conf/machine/include/am64xx.inc
@@ -20,3 +20,5 @@ IMAGE_BOOT_FILES +=3D "tiboot3-am64x_sr2-hs-evm.bin"
 TFA_BOARD =3D "lite"
=20
 OPTEEMACHINE =3D "k3-am64x"
+
+MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS +=3D "prueth-fw-am65x-sr2 pruhsr-fw-=
am65x-sr2 prusw-fw-am65x-sr2"
diff --git a/meta-ti-bsp/conf/machine/include/am65xx.inc b/meta-ti-bsp/co=
nf/machine/include/am65xx.inc
index 2c427b88..7c9d5fb1 100644
--- a/meta-ti-bsp/conf/machine/include/am65xx.inc
+++ b/meta-ti-bsp/conf/machine/include/am65xx.inc
@@ -25,3 +25,5 @@ IMAGE_BOOT_FILES +=3D "sysfw-am65x_sr2-hs-evm.itb"
 TFA_BOARD =3D "generic"
=20
 OPTEEMACHINE =3D "k3-am65x"
+
+MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS +=3D "prueth-fw-am65x"
diff --git a/meta-ti-bsp/conf/machine/include/j7200.inc b/meta-ti-bsp/con=
f/machine/include/j7200.inc
index d21e26cc..f23e70cd 100644
--- a/meta-ti-bsp/conf/machine/include/j7200.inc
+++ b/meta-ti-bsp/conf/machine/include/j7200.inc
@@ -4,3 +4,5 @@ SOC_FAMILY:append =3D ":j7200"
 TFA_BOARD =3D "generic"
=20
 OPTEEMACHINE =3D "k3-j721e"
+
+MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS +=3D "ti-eth-fw"
diff --git a/meta-ti-bsp/conf/machine/include/j721e.inc b/meta-ti-bsp/con=
f/machine/include/j721e.inc
index ca653770..92235527 100644
--- a/meta-ti-bsp/conf/machine/include/j721e.inc
+++ b/meta-ti-bsp/conf/machine/include/j721e.inc
@@ -23,3 +23,5 @@ IMAGE_BOOT_FILES +=3D "sysfw-j721e_sr1_1-hs-evm.itb"
 TFA_BOARD =3D "generic"
=20
 OPTEEMACHINE =3D "k3-j721e"
+
+MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS +=3D "cadence-mhdp-fw vxd-dec-fw ti-=
eth-fw"
diff --git a/meta-ti-bsp/conf/machine/include/j721s2.inc b/meta-ti-bsp/co=
nf/machine/include/j721s2.inc
index 98cc611f..cc58fb89 100644
--- a/meta-ti-bsp/conf/machine/include/j721s2.inc
+++ b/meta-ti-bsp/conf/machine/include/j721s2.inc
@@ -9,3 +9,5 @@ PREFERRED_PROVIDER_virtual/gpudriver ?=3D "ti-img-rogue-d=
river"
 TFA_BOARD =3D "generic"
=20
 OPTEEMACHINE =3D "k3-j784s4"
+
+MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS +=3D "cadence-mhdp-fw cnm-wave-fw"
diff --git a/meta-ti-bsp/conf/machine/include/j784s4.inc b/meta-ti-bsp/co=
nf/machine/include/j784s4.inc
index de207687..d4cf876b 100644
--- a/meta-ti-bsp/conf/machine/include/j784s4.inc
+++ b/meta-ti-bsp/conf/machine/include/j784s4.inc
@@ -9,3 +9,5 @@ PREFERRED_PROVIDER_virtual/gpudriver ?=3D "ti-img-rogue-d=
river"
 TFA_BOARD =3D "j784s4"
=20
 OPTEEMACHINE =3D "k3-j784s4"
+
+MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS +=3D "cadence-mhdp-fw cnm-wave-fw ti=
-eth-fw"
diff --git a/meta-ti-bsp/conf/machine/include/k3.inc b/meta-ti-bsp/conf/m=
achine/include/k3.inc
index a8e80fa7..2415f0ba 100644
--- a/meta-ti-bsp/conf/machine/include/k3.inc
+++ b/meta-ti-bsp/conf/machine/include/k3.inc
@@ -40,6 +40,8 @@ FIT_SIGN_ALG ?=3D "rsa4096"
=20
 EXTRA_IMAGEDEPENDS +=3D "virtual/bootloader"
=20
+MACHINE_ESSENTIAL_EXTRA_RDEPENDS +=3D "kernel-image-image"
+
 TFA_PLATFORM =3D "k3"
=20
 # Use the expected value of the ubifs filesystem's volume name in the ke=
rnel
diff --git a/meta-ti-bsp/conf/machine/include/omap-a15.inc b/meta-ti-bsp/=
conf/machine/include/omap-a15.inc
index c1eb659b..6187f2ea 100644
--- a/meta-ti-bsp/conf/machine/include/omap-a15.inc
+++ b/meta-ti-bsp/conf/machine/include/omap-a15.inc
@@ -40,6 +40,10 @@ UBOOT_SUFFIX =3D "img"
=20
 EXTRA_IMAGEDEPENDS +=3D "virtual/bootloader"
=20
+MACHINE_ESSENTIAL_EXTRA_RDEPENDS +=3D "kernel-image-zimage"
+
+MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS +=3D "vpdma-fw goodix-fw"
+
 # Use the expected value of the ubifs filesystem's volume name in the ke=
rnel
 # and u-boot.
 UBI_VOLNAME =3D "rootfs"
diff --git a/meta-ti-bsp/conf/machine/include/omapl138.inc b/meta-ti-bsp/=
conf/machine/include/omapl138.inc
index 72cfd659..7f8262a5 100644
--- a/meta-ti-bsp/conf/machine/include/omapl138.inc
+++ b/meta-ti-bsp/conf/machine/include/omapl138.inc
@@ -11,4 +11,6 @@ PREFERRED_PROVIDER_u-boot =3D "u-boot-ti-staging"
=20
 EXTRA_IMAGEDEPENDS +=3D "virtual/bootloader"
=20
+MACHINE_ESSENTIAL_EXTRA_RDEPENDS +=3D "kernel-image-zimage"
+
 MACHINE_FEATURES =3D "serial usbhost usbgadget alsa"
diff --git a/meta-ti-bsp/conf/machine/include/ti-soc.inc b/meta-ti-bsp/co=
nf/machine/include/ti-soc.inc
index 2792d2a0..a1fd3cbf 100644
--- a/meta-ti-bsp/conf/machine/include/ti-soc.inc
+++ b/meta-ti-bsp/conf/machine/include/ti-soc.inc
@@ -1,5 +1,9 @@
 # This is a generic TI SOC family. It is a superset of all other SOCs
 # and platforms defined in meta-ti to allow BSP-level overrides.
 SOC_FAMILY =3D "ti-soc"
+
+# TI platforms all use devicetrees with overlays
+MACHINE_ESSENTIAL_EXTRA_RDEPENDS +=3D "kernel-devicetree"
 KERNEL_DTB_OVERLAY_SUPPORT ?=3D "1"
+
 require conf/machine/include/soc-family.inc
diff --git a/meta-ti-bsp/conf/machine/include/ti33x.inc b/meta-ti-bsp/con=
f/machine/include/ti33x.inc
index 567cf128..d6a70895 100644
--- a/meta-ti-bsp/conf/machine/include/ti33x.inc
+++ b/meta-ti-bsp/conf/machine/include/ti33x.inc
@@ -63,6 +63,10 @@ UBI_VOLNAME =3D "rootfs"
=20
 EXTRA_IMAGEDEPENDS +=3D "virtual/bootloader"
=20
+MACHINE_ESSENTIAL_EXTRA_RDEPENDS +=3D "kernel-image-zimage"
+
+MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS +=3D "amx3-cm3 prueth-fw pruhsr-fw p=
ruprp-fw"
+
 # List common SoC features, may need to add touchscreen for specific mac=
hines
 MACHINE_FEATURES =3D "apm usbgadget usbhost vfat ext2 alsa gpu"
=20
diff --git a/meta-ti-bsp/conf/machine/include/ti43x.inc b/meta-ti-bsp/con=
f/machine/include/ti43x.inc
index c70a8363..05a28b77 100644
--- a/meta-ti-bsp/conf/machine/include/ti43x.inc
+++ b/meta-ti-bsp/conf/machine/include/ti43x.inc
@@ -57,7 +57,11 @@ UBOOT_SUFFIX =3D "img"
 # and u-boot.
 UBI_VOLNAME =3D "rootfs"
=20
-EXTRA_IMAGEDEPENDS +=3D "u-boot"
+EXTRA_IMAGEDEPENDS +=3D "virtual/bootloader"
+
+MACHINE_ESSENTIAL_EXTRA_RDEPENDS +=3D "kernel-image-zimage"
+
+MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS +=3D "amx3-cm3 prueth-fw pruhsr-fw p=
ruprp-fw"
=20
 # List common SoC features, may need to add touchscreen for specific mac=
hines
 MACHINE_FEATURES =3D "apm usbgadget usbhost vfat ext2 screen alsa gpu"
diff --git a/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc b/meta-=
ti-bsp/recipes-kernel/linux/kernel-rdepends.inc
deleted file mode 100644
index 266a7ef5..00000000
--- a/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc
+++ /dev/null
@@ -1,38 +0,0 @@
-# Pull in the devicetree files into the rootfs
-RDEPENDS:${KERNEL_PACKAGE_NAME}-base +=3D "kernel-devicetree"
-
-# Add run-time dependency for PM firmware to the rootfs
-RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:ti33x =3D " amx3-cm3"
-RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:ti43x =3D " amx3-cm3"
-
-# Add run-time dependency for VPE VPDMA firmware to the rootfs
-RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:dra7xx =3D " vpdma-fw"
-
-# Add run-time dependency for Goodix firmware to the rootfs
-RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:dra7xx =3D " goodix-fw"
-
-# Add run-time dependency for PRU Ethernet firmware to the rootfs
-RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:am57xx =3D " prueth-fw prusw=
-fw pruhsr-fw pruprp-fw"
-RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:ti43x =3D " prueth-fw pruhsr=
-fw pruprp-fw"
-RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:ti33x =3D " prueth-fw pruhsr=
-fw pruprp-fw"
-RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:am65xx =3D " prueth-fw-am65x=
"
-RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:am65xx-evm =3D " prueth-fw-a=
m65x-sr2 pruhsr-fw-am65x-sr2 prusw-fw-am65x-sr2"
-RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:am64xx =3D " prueth-fw-am65x=
-sr2 pruhsr-fw-am65x-sr2 prusw-fw-am65x-sr2"
-
-# Add run-time dependency for Cadence MHDP firmware to the rootfs
-RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:j721e =3D " cadence-mhdp-fw"
-RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:j721s2 =3D " cadence-mhdp-fw=
"
-RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:j784s4 =3D " cadence-mhdp-fw=
"
-
-# Add run-time dependency for Video Decoding firmware to the rootfs
-RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:j721e =3D " vxd-dec-fw"
-
-# Add run-time dependency for Chips&Media Wave521 firmware to the rootfs
-RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:j721s2 =3D " cnm-wave-fw"
-RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:j784s4 =3D " cnm-wave-fw"
-RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:am62axx =3D " cnm-wave-fw"
-
-# Add run-time dependency for TI ETH firmware to the rootfs
-RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:j721e =3D " ti-eth-fw"
-RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:j7200 =3D " ti-eth-fw"
-RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:j784s4 =3D " ti-eth-fw"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb b/=
meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
index dfa46f48..a7b5ca74 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
@@ -5,7 +5,6 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6bc538ed5bd9a7=
fc9398086aedcd7e46"
=20
 inherit kernel
=20
-require recipes-kernel/linux/kernel-rdepends.inc
 require recipes-kernel/linux/ti-kernel.inc
=20
 DEPENDS +=3D "gmp-native libmpc-native"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_5.10.bb b/=
meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_5.10.bb
index 7f3911e4..0cf0a319 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_5.10.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_5.10.bb
@@ -9,7 +9,6 @@ inherit kernel
=20
 DEFCONFIG_BUILDER =3D "${S}/ti_config_fragments/defconfig_builder.sh"
 require recipes-kernel/linux/setup-defconfig.inc
-require recipes-kernel/linux/kernel-rdepends.inc
 require recipes-kernel/linux/ti-kernel.inc
 include ${@ 'recipes-kernel/linux/ti-kernel-devicetree-prefix.inc' if d.=
getVar('KERNEL_DEVICETREE_PREFIX') else ''}
=20
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb b/m=
eta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
index 66be6944..ee106a7f 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
@@ -7,7 +7,6 @@ inherit ti-secdev
 inherit kernel
=20
 require recipes-kernel/linux/setup-defconfig.inc
-require recipes-kernel/linux/kernel-rdepends.inc
 require recipes-kernel/linux/ti-kernel.inc
 include ${@ 'recipes-kernel/linux/ti-kernel-devicetree-prefix.inc' if d.=
getVar('KERNEL_DEVICETREE_PREFIX') else ''}
 include ${@ 'recipes-kernel/linux/ti-extras.inc' if d.getVar('TI_EXTRAS'=
) else ''}
--=20
2.25.1


