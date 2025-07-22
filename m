Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FDC7C87FC5
	for <webhook@archiver.kernel.org>; Tue, 22 Jul 2025 18:49:45 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.21408.1753210178806169628
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 22 Jul 2025 11:49:39 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id DF09740800;
	Tue, 22 Jul 2025 18:49:37 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QwdDNAyTxl2w; Tue, 22 Jul 2025 18:49:37 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 75EAA40C76;
	Tue, 22 Jul 2025 18:49:34 +0000 (UTC)
Received: from gimli.cabin (argonath.cabin [172.31.1.2])
	by mail.denix.org (Postfix) with ESMTP id 83C7916C97B;
	Tue, 22 Jul 2025 14:49:32 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Andrew Davis <afd@ti.com>,
	Ryan Eatmon <reatmon@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][PATCH v2 1/3] meta-ti: Remove bsp-ti-6_1 and bsp-bb_org-6_1 support
Date: Tue, 22 Jul 2025 14:49:15 -0400
Message-Id: <20250722184917.53901-1-denis@denix.org>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 22 Jul 2025 18:49:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18807

From: Andrew Davis <afd@ti.com>

Remove support for the v6.1 TI and Beagle BSPs. This was originally
split into meta-ti-bsp and meta-beagle changes, but there are some
hidden interdependencies that made that more painful than needed.
Remove v6.1 support from both BSP layers here.

This includes packages specific to those BSPs:
 - TI and BB.org v6.1 Linux kernel
 - TI and BB.org 2023.04 U-Boot
 - Rogue GPU driver 23.3 and Mesa 22.3.5

Signed-off-by: Andrew Davis <afd@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
v2 - rebased on latest master, restore removal of TI_VXE_VXD_DRIVER:bsp-b=
b_org-6_6

 meta-beagle/conf/machine/beagle-x15.conf      |   2 -
 .../conf/machine/beaglebone-ai64-k3r5.conf    |   6 -
 meta-beagle/conf/machine/beaglebone-ai64.conf |  20 ---
 meta-beagle/conf/machine/beaglebone.conf      |   2 -
 meta-beagle/conf/machine/beagleplay-k3r5.conf |   4 -
 meta-beagle/conf/machine/beagleplay.conf      |  41 -----
 meta-beagle/conf/machine/beagley-ai-k3r5.conf |   2 -
 meta-beagle/conf/machine/beagley-ai.conf      |   7 -
 .../conf/machine/include/beagle-bsp.inc       |  23 ---
 .../u-boot/u-boot-bb.org_2023.04.bb           |  24 ---
 .../linux/linux-bb.org-6.1/defconfig          |   1 -
 .../recipes-kernel/linux/linux-bb.org_6.1.bb  |  70 ---------
 meta-ti-bsp/conf/machine/am62pxx-evm.conf     |   2 -
 .../conf/machine/am62xxsip-evm-k3r5.conf      |   5 -
 meta-ti-bsp/conf/machine/am62xxsip-evm.conf   |   5 -
 .../conf/machine/beagleplay-ti-k3r5.conf      |   3 -
 meta-ti-bsp/conf/machine/beagleplay-ti.conf   |   3 -
 meta-ti-bsp/conf/machine/include/j721e.inc    |   1 -
 meta-ti-bsp/conf/machine/include/ti-bsp.inc   |  22 +--
 .../ti-img-rogue-driver_23.3.6512818.bb       |  37 -----
 .../u-boot/u-boot-ti-staging_2023.04.bb       |  11 --
 ...lude-of-Host-h-moved-to-TargetParser.patch |  65 --------
 ...t-usage-of-LLVMContextSetOpaquePoint.patch | 128 ---------------
 ...e-unsigned-instead-of-uint-to-fix-mu.patch |  43 -----
 .../0001-gallium-Fix-build-with-llvm-17.patch |  58 -------
 ...allium-Fix-build-with-llvm-18-and-19.patch |  53 -------
 ...-backend-fix-gbm-compile-without-dri.patch |  64 --------
 ...sdetects-64bit-atomics-on-mips-clang.patch |  25 ---
 ...k-for-all-linux-host_os-combinations.patch |  43 -----
 ...ormat-Check-for-NEON-before-using-it.patch |  47 ------
 .../recipes-graphics/mesa/mesa-pvr_22.3.5.bb  |  60 -------
 .../ti-img-rogue-umlibs_23.3.6512818.bb       | 147 ------------------
 .../linux/linux-ti-staging-6.1/defconfig      |   2 -
 .../linux/linux-ti-staging-6.1/k3/defconfig   |   2 -
 .../linux-ti-staging-6.1/omapl138/defconfig   |   1 -
 .../linux-ti-staging-6.1/ti33x/defconfig      |   2 -
 .../linux-ti-staging-6.1/ti43x/defconfig      |   2 -
 .../linux/linux-ti-staging-rt-6.1/defconfig   |   2 -
 .../linux-ti-staging-rt-6.1/k3/defconfig      |   2 -
 .../omapl138/defconfig                        |   2 -
 .../linux-ti-staging-rt-6.1/ti33x/defconfig   |   2 -
 .../linux-ti-staging-rt-6.1/ti43x/defconfig   |   2 -
 .../linux/linux-ti-staging-rt_6.1.bb          |  15 --
 .../linux/linux-ti-staging_6.1.bb             |  33 ----
 44 files changed, 1 insertion(+), 1090 deletions(-)
 delete mode 100644 meta-beagle/recipes-bsp/u-boot/u-boot-bb.org_2023.04.=
bb
 delete mode 100644 meta-beagle/recipes-kernel/linux/linux-bb.org-6.1/def=
config
 delete mode 100644 meta-beagle/recipes-kernel/linux/linux-bb.org_6.1.bb
 delete mode 100644 meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-=
driver_23.3.6512818.bb
 delete mode 100644 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023=
.04.bb
 delete mode 100644 meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-22.3.5/000=
1-fix-gallivm-fix-LLVM-include-of-Host-h-moved-to-TargetParser.patch
 delete mode 100644 meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-22.3.5/000=
1-fix-gallivm-limit-usage-of-LLVMContextSetOpaquePoint.patch
 delete mode 100644 meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-22.3.5/000=
1-freedreno-pm4-Use-unsigned-instead-of-uint-to-fix-mu.patch
 delete mode 100644 meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-22.3.5/000=
1-gallium-Fix-build-with-llvm-17.patch
 delete mode 100644 meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-22.3.5/000=
1-gallium-Fix-build-with-llvm-18-and-19.patch
 delete mode 100644 meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-22.3.5/000=
1-gbm-backend-fix-gbm-compile-without-dri.patch
 delete mode 100644 meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-22.3.5/000=
1-meson-misdetects-64bit-atomics-on-mips-clang.patch
 delete mode 100644 meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-22.3.5/000=
1-meson.build-check-for-all-linux-host_os-combinations.patch
 delete mode 100644 meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-22.3.5/000=
1-util-format-Check-for-NEON-before-using-it.patch
 delete mode 100644 meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_22.3.5.bb
 delete mode 100644 meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-ro=
gue-umlibs_23.3.6512818.bb
 delete mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.1=
/defconfig
 delete mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.1=
/k3/defconfig
 delete mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.1=
/omapl138/defconfig
 delete mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.1=
/ti33x/defconfig
 delete mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.1=
/ti43x/defconfig
 delete mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-=
6.1/defconfig
 delete mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-=
6.1/k3/defconfig
 delete mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-=
6.1/omapl138/defconfig
 delete mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-=
6.1/ti33x/defconfig
 delete mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-=
6.1/ti43x/defconfig
 delete mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_=
6.1.bb
 delete mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1=
.bb

diff --git a/meta-beagle/conf/machine/beagle-x15.conf b/meta-beagle/conf/=
machine/beagle-x15.conf
index 8ad028f4..44e0daf6 100644
--- a/meta-beagle/conf/machine/beagle-x15.conf
+++ b/meta-beagle/conf/machine/beagle-x15.conf
@@ -6,8 +6,6 @@ require conf/machine/include/am57xx.inc
 require conf/machine/include/beagle-bsp.inc
=20
 DT_VENDOR_PREFIX =3D "ti/omap/"
-DT_VENDOR_PREFIX:bsp-ti-6_1 =3D ""
-DT_VENDOR_PREFIX:bsp-bb_org-6_1 =3D ""
=20
 KERNEL_DEVICETREE_PREFIX =3D " \
 ${DT_VENDOR_PREFIX}am57xx-beagle-x15 \
diff --git a/meta-beagle/conf/machine/beaglebone-ai64-k3r5.conf b/meta-be=
agle/conf/machine/beaglebone-ai64-k3r5.conf
index 4574f82b..1bdfd7a1 100644
--- a/meta-beagle/conf/machine/beaglebone-ai64-k3r5.conf
+++ b/meta-beagle/conf/machine/beaglebone-ai64-k3r5.conf
@@ -16,9 +16,3 @@ UBOOT_IMAGE =3D "tiboot3-${MAINMACHINE}-${PV}-${PR}.${U=
BOOT_SUFFIX}"
 UBOOT_SYMLINK =3D "tiboot3-${MAINMACHINE}.${UBOOT_SUFFIX}"
=20
 UBOOT_MACHINE =3D "j721e_beagleboneai64_r5_defconfig"
-
-UBOOT_MACHINE:bsp-ti-6_1 =3D "j721e_evm_r5_defconfig"
-UBOOT_CONFIG_FRAGMENTS:bsp-ti-6_1 =3D "j721e_beagleboneai64_r5.config"
-
-UBOOT_MACHINE:bsp-bb_org-6_1 =3D "j721e_evm_r5_defconfig"
-UBOOT_CONFIG_FRAGMENTS:bsp-bb_org-6_1 =3D "j721e_beagleboneai64_r5.confi=
g"
diff --git a/meta-beagle/conf/machine/beaglebone-ai64.conf b/meta-beagle/=
conf/machine/beaglebone-ai64.conf
index c7d72590..0f15c712 100644
--- a/meta-beagle/conf/machine/beaglebone-ai64.conf
+++ b/meta-beagle/conf/machine/beaglebone-ai64.conf
@@ -12,12 +12,6 @@ IMAGE_SR2_HS_SE_FILES =3D ""
=20
 UBOOT_MACHINE =3D "j721e_beagleboneai64_a72_defconfig"
=20
-UBOOT_MACHINE:bsp-ti-6_1 =3D "j721e_evm_a72_config"
-UBOOT_CONFIG_FRAGMENTS:bsp-ti-6_1 =3D "j721e_beagleboneai64_a72.config"
-
-UBOOT_MACHINE:bsp-bb_org-6_1 =3D "j721e_evm_a72_config"
-UBOOT_CONFIG_FRAGMENTS:bsp-bb_org-6_1 =3D "j721e_beagleboneai64_a72.conf=
ig"
-
 SPL_BINARY =3D "tispl.bin_unsigned"
=20
 KERNEL_DEVICETREE_PREFIX =3D " \
@@ -32,23 +26,9 @@ ti/k3-j721e-evm-quad-port-eth-exp.dtbo \
 ti/k3-j721e-sk.dtb \
 "
=20
-KERNEL_DEVICETREE:append:bsp-bb_org-6_1 =3D " \
-ti/k3-j721e-beagleboneai64-dsi-rpi-7inch-panel.dtbo \
-ti/k3-j721e-common-proc-board-infotainment.dtbo \
-ti/k3-j721e-evm-csi2-ov5640.dtbo \
-ti/k3-j721e-evm-fusion.dtbo \
-ti/k3-j721e-evm-pcie0-ep.dtbo \
-ti/k3-j721e-evm-virt-mac-client.dtbo \
-ti/k3-j721e-sk-csi2-ov5640.dtbo \
-ti/k3-j721e-sk-csi2-rpi-imx219.dtbo \
-ti/k3-j721e-sk-fusion.dtbo \
-ti/k3-j721e-sk-rpi-hdr-ehrpwm.dtbo \
-"
-
 MACHINE_GUI_CLASS =3D "bigscreen"
=20
 # TI has moved a driver out of its kernel tree and into an out of tree m=
odule.
 # We need to not include that for older kernels since the module is stil=
l in
 # the kernel.
 TI_VXE_VXD_DRIVER:bsp-bb_org-6_6 =3D ""
-TI_VXE_VXD_DRIVER:bsp-bb_org-6_1 =3D ""
diff --git a/meta-beagle/conf/machine/beaglebone.conf b/meta-beagle/conf/=
machine/beaglebone.conf
index 456da618..a4d11afe 100644
--- a/meta-beagle/conf/machine/beaglebone.conf
+++ b/meta-beagle/conf/machine/beaglebone.conf
@@ -6,8 +6,6 @@ require conf/machine/include/ti33x.inc
 require conf/machine/include/beagle-bsp.inc
=20
 DT_VENDOR_PREFIX =3D "ti/omap/"
-DT_VENDOR_PREFIX:bsp-ti-6_1 =3D ""
-DT_VENDOR_PREFIX:bsp-bb_org-6_1 =3D ""
=20
 KERNEL_DEVICETREE_PREFIX =3D " \
 ${DT_VENDOR_PREFIX}am335x-bone \
diff --git a/meta-beagle/conf/machine/beagleplay-k3r5.conf b/meta-beagle/=
conf/machine/beagleplay-k3r5.conf
index f053c11e..ea4c5160 100644
--- a/meta-beagle/conf/machine/beagleplay-k3r5.conf
+++ b/meta-beagle/conf/machine/beagleplay-k3r5.conf
@@ -5,7 +5,3 @@
 require conf/machine/beagleplay-ti-k3r5.conf
=20
 require conf/machine/include/beagle-bsp.inc
-
-UBOOT_MACHINE:bsp-bb_org-6_1 =3D "am62x_evm_r5_defconfig"
-
-UBOOT_CONFIG_FRAGMENTS:bsp-bb_org-6_1 =3D "am625_beagleplay_r5.config"
diff --git a/meta-beagle/conf/machine/beagleplay.conf b/meta-beagle/conf/=
machine/beagleplay.conf
index bc0de3f0..87d4942e 100644
--- a/meta-beagle/conf/machine/beagleplay.conf
+++ b/meta-beagle/conf/machine/beagleplay.conf
@@ -6,47 +6,6 @@ require conf/machine/beagleplay-ti.conf
=20
 require conf/machine/include/beagle-bsp.inc
=20
-UBOOT_MACHINE:bsp-bb_org-6_1 =3D "am62x_evm_a53_defconfig"
-
-UBOOT_CONFIG_FRAGMENTS:bsp-bb_org-6_1 =3D "am625_beagleplay_a53.config"
-
-KERNEL_DEVICETREE:append:bsp-bb_org-6_1 =3D " \
-ti/k3-am625-beagleplay-csi2-ov5640.dtbo \
-ti/k3-am625-beagleplay-csi2-tevi-ov5640.dtbo \
-ti/k3-am625-beagleplay-lincolntech-lcd185-panel.dtbo \
-ti/k3-am625-beaglemod.dtb \
-ti/k3-am625-beaglemod-audio.dtbo \
-ti/k3-am625-beaglemod-can0.dtbo \
-ti/k3-am625-beaglemod-can1.dtbo \
-ti/k3-am625-beaglemod-csi0-ov5640.dtbo \
-ti/k3-am625-beaglemod-eeprom.dtbo \
-ti/k3-am625-beaglemod-eth.dtbo \
-ti/k3-am625-beaglemod-hdmi.dtbo \
-ti/k3-am625-beaglemod-io-expand.dtbo \
-ti/k3-am625-beaglemod-lt-lcd185.dtbo \
-ti/k3-am625-beaglemod-ospi-flash.dtbo \
-ti/k3-am625-beaglemod-rs485-1.dtbo \
-ti/k3-am625-beaglemod-rs485-2.dtbo \
-ti/k3-am625-beaglemod-rtc.dtbo \
-ti/k3-am625-beaglemod-wl1835.dtbo \
-ti/k3-am625-sk-dmtimer-pwm.dtbo \
-ti/k3-am625-sk-ecap-capture.dtbo \
-ti/k3-am625-sk-lincolntech-lcd185-panel.dtbo \
-ti/k3-am625-sk-mcspi-loopback.dtbo \
-ti/k3-am625-sk-microtips-mf101hie-panel.dtbo \
-ti/k3-am625-sk-microtips-mf103hie-lcd2.dtbo \
-ti/k3-am625-sk-pwm.dtbo \
-ti/k3-am625-sk-rpi-hdr-ehrpwm.dtbo \
-ti/k3-am62x-sk-csi2-imx219.dtbo \
-ti/k3-am62x-sk-csi2-ov5640.dtbo \
-ti/k3-am62x-sk-csi2-tevi-ov5640.dtbo \
-ti/k3-am62x-sk-csi2-v3link-fusion.dtbo \
-ti/k3-am62x-sk-eqep.dtbo \
-ti/k3-am62x-sk-hdmi-disable-fastboot.dtbo \
-ti/k3-am62x-sk-lpm-wkup-sources.dtbo \
-ti/k3-am62x-sk-mcan.dtbo \
-"
-
 KERNEL_DEVICETREE:append:bsp-bb_org-6_6 =3D " \
 ti/k3-am625-beagleplay-csi2-ov5640.dtbo \
 ti/k3-am625-beagleplay-csi2-tevi-ov5640.dtbo \
diff --git a/meta-beagle/conf/machine/beagley-ai-k3r5.conf b/meta-beagle/=
conf/machine/beagley-ai-k3r5.conf
index 8d5111f0..07198f2e 100644
--- a/meta-beagle/conf/machine/beagley-ai-k3r5.conf
+++ b/meta-beagle/conf/machine/beagley-ai-k3r5.conf
@@ -11,5 +11,3 @@ SYSFW_SUFFIX =3D "hs-fs"
=20
 UBOOT_MACHINE =3D "j722s_evm_r5_defconfig"
 UBOOT_MACHINE:bsp-bb_org-6_12 =3D "am67a_beagley_ai_r5_defconfig"
-
-UBOOT_CONFIG_FRAGMENTS:bsp-bb_org-6_1 =3D "am67a_beagley_ai_r5.config"
diff --git a/meta-beagle/conf/machine/beagley-ai.conf b/meta-beagle/conf/=
machine/beagley-ai.conf
index 497001ee..9e9e33b6 100644
--- a/meta-beagle/conf/machine/beagley-ai.conf
+++ b/meta-beagle/conf/machine/beagley-ai.conf
@@ -8,19 +8,12 @@ require conf/machine/include/beagle-bsp.inc
 UBOOT_MACHINE =3D "j722s_evm_a53_config"
 UBOOT_MACHINE:bsp-bb_org-6_12 =3D "am67a_beagley_ai_a53_defconfig"
=20
-UBOOT_CONFIG_FRAGMENTS:bsp-bb_org-6_1 =3D "am67a_beagley_ai_a53.config"
-
 KERNEL_DEVICETREE_PREFIX =3D " \
     ti/k3-j722s \
 "
=20
 KERNEL_DEVICETREE =3D ""
=20
-KERNEL_DEVICETREE:append:bsp-bb_org-6_1 =3D " \
-ti/k3-j722s-evm.dtb \
-ti/k3-am67a-beagley-ai.dtb \
-"
-
 KERNEL_DEVICETREE:append:bsp-bb_org-6_12 =3D " \
 ti/k3-j722s-evm.dtb \
 ti/k3-am67a-beagley-ai.dtb \
diff --git a/meta-beagle/conf/machine/include/beagle-bsp.inc b/meta-beagl=
e/conf/machine/include/beagle-bsp.inc
index af8e4b01..7368b3af 100644
--- a/meta-beagle/conf/machine/include/beagle-bsp.inc
+++ b/meta-beagle/conf/machine/include/beagle-bsp.inc
@@ -49,26 +49,3 @@ BSP_MESA_PVR_VERSION:bsp-bb_org-6_6 =3D "24%"
=20
 # GC320 support requires out-of-tree drivers not yet available in bb.org=
 6.6
 MACHINE_FEATURES:remove:bsp-bb_org-6_6 =3D "gc320"
-
-# =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-# bb_org-6_1
-# BeagleBoard.org kernel 6.1, u-boot 2023.04
-# based on TI staging trees with extra Beagle-specific features
-# but may not be up-to-date with TI version
-# =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-BSP_KERNEL_PROVIDER:bsp-bb_org-6_1 =3D "linux-bb.org"
-BSP_KERNEL_VERSION:bsp-bb_org-6_1 =3D "6.1.%"
-BSP_BOOTLOADER_PROVIDER:bsp-bb_org-6_1 =3D "u-boot-bb.org"
-BSP_BOOTLOADER_VERSION:bsp-bb_org-6_1 =3D "2023.%"
-KERNEL_DEVICETREE_PREFIX:bsp-bb_org-6_1 =3D ""
-
-BSP_SGX_DRIVER_PROVIDER:bsp-bb_org-6_1 =3D "ti-sgx-ddk-km"
-BSP_SGX_DRIVER_VERSION:bsp-bb_org-6_1 =3D "1.17%"
-BSP_SGX_UMLIBS_VERSION:bsp-bb_org-6_1 =3D "1.17%"
-BSP_ROGUE_DRIVER_PROVIDER:bsp-bb_org-6_1 =3D "ti-img-rogue-driver"
-BSP_ROGUE_DRIVER_VERSION:bsp-bb_org-6_1 =3D "23%"
-BSP_ROGUE_UMLIBS_VERSION:bsp-bb_org-6_1 =3D "23%"
-BSP_MESA_PVR_VERSION:bsp-bb_org-6_1 =3D "22%"
-
-# GC320 support requires out-of-tree drivers not yet available in bb.org=
 6.1
-MACHINE_FEATURES:remove:bsp-bb_org-6_1 =3D "gc320"
diff --git a/meta-beagle/recipes-bsp/u-boot/u-boot-bb.org_2023.04.bb b/me=
ta-beagle/recipes-bsp/u-boot/u-boot-bb.org_2023.04.bb
deleted file mode 100644
index fb7b0c18..00000000
--- a/meta-beagle/recipes-bsp/u-boot/u-boot-bb.org_2023.04.bb
+++ /dev/null
@@ -1,24 +0,0 @@
-require recipes-bsp/u-boot/u-boot-ti.inc
-
-SUMMARY =3D "BeagleBoard.org U-Boot"
-
-COMPATIBLE_MACHINE =3D "beagle.*"
-
-PV =3D "2023.04"
-
-SRC_URI +=3D "file://0001-scripts-dtc-pylibfdt-libfdt.i_shipped-Use-SWIG=
_Appen.patch"
-
-UBOOT_GIT_URI =3D "git://github.com/beagleboard/u-boot.git"
-UBOOT_GIT_PROTOCOL =3D "https"
-BRANCH =3D "v2023.04-ti-09.01.00.008"
-SRCREV =3D "b0d717b732ee28e446baf94522b3491e590f7fbb"
-
-BRANCH:beagleplay =3D "v2023.04-ti-09.01.00.008-BeaglePlay"
-BRANCH:beagleplay-k3r5 =3D "v2023.04-ti-09.01.00.008-BeaglePlay"
-SRCREV:beagleplay =3D "43791d945f4e5c25bcc19b9c778e8f9d194dc16e"
-SRCREV:beagleplay-k3r5 =3D "43791d945f4e5c25bcc19b9c778e8f9d194dc16e"
-
-BRANCH:beagley-ai =3D "v2023.04-ti-09.02.00.009-BeagleY-AI-Production"
-BRANCH:beagley-ai-k3r5 =3D "v2023.04-ti-09.02.00.009-BeagleY-AI-Producti=
on"
-SRCREV:beagley-ai =3D "93735daa6fe024304934d5a5e93ab05a06abf1a8"
-SRCREV:beagley-ai-k3r5 =3D "93735daa6fe024304934d5a5e93ab05a06abf1a8"
diff --git a/meta-beagle/recipes-kernel/linux/linux-bb.org-6.1/defconfig =
b/meta-beagle/recipes-kernel/linux/linux-bb.org-6.1/defconfig
deleted file mode 100644
index a5de2e24..00000000
--- a/meta-beagle/recipes-kernel/linux/linux-bb.org-6.1/defconfig
+++ /dev/null
@@ -1 +0,0 @@
-use-kernel-config=3Dbb.org_defconfig
diff --git a/meta-beagle/recipes-kernel/linux/linux-bb.org_6.1.bb b/meta-=
beagle/recipes-kernel/linux/linux-bb.org_6.1.bb
deleted file mode 100644
index 320ee60b..00000000
--- a/meta-beagle/recipes-kernel/linux/linux-bb.org_6.1.bb
+++ /dev/null
@@ -1,70 +0,0 @@
-# Look in the generic major.minor directory for files
-FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}-6.1:"
-
-SECTION =3D "kernel"
-SUMMARY =3D "BeagleBoard.org Linux kernel"
-LICENSE =3D "GPL-2.0-only"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6bc538ed5bd9a7fc9398086aedcd7=
e46"
-
-COMPATIBLE_MACHINE =3D "beagle.*"
-
-inherit kernel
-
-require recipes-kernel/linux/setup-defconfig.inc
-require recipes-kernel/linux/ti-kernel.inc
-
-DEPENDS +=3D "gmp-native libmpc-native"
-
-KERNEL_EXTRA_ARGS +=3D "LOADADDR=3D${UBOOT_ENTRYPOINT} ${EXTRA_DTC_ARGS}=
"
-
-# Extra DT overlays/capes
-KERNEL_DEVICETREE:append:armv7a =3D " \
-AM335X-PRU-UIO-00A0.dtbo \
-BB-ADC-00A0.dtbo \
-BB-BBBW-WL1835-00A0.dtbo \
-BB-BBGG-WL1835-00A0.dtbo \
-BB-BBGW-WL1835-00A0.dtbo \
-BB-BONE-4D5R-01-00A1.dtbo \
-BB-BONE-eMMC1-01-00A0.dtbo \
-BB-BONE-LCD4-01-00A1.dtbo \
-BB-BONE-NH7C-01-A0.dtbo \
-BB-CAPE-DISP-CT4-00A0.dtbo \
-BB-HDMI-TDA998x-00A0.dtbo \
-BB-I2C1-MCP7940X-00A0.dtbo \
-BB-I2C1-RTC-DS3231.dtbo \
-BB-I2C1-RTC-PCF8563.dtbo \
-BB-I2C2-BME680.dtbo \
-BB-I2C2-MPU6050.dtbo \
-BB-LCD-ADAFRUIT-24-SPI1-00A0.dtbo \
-BB-NHDMI-TDA998x-00A0.dtbo \
-BBORG_COMMS-00A2.dtbo \
-BBORG_FAN-A000.dtbo \
-BBORG_RELAY-00A2.dtbo \
-BB-SPIDEV0-00A0.dtbo \
-BB-SPIDEV1-00A0.dtbo \
-BB-UART1-00A0.dtbo \
-BB-UART2-00A0.dtbo \
-BB-UART4-00A0.dtbo \
-BB-W1-P9.12-00A0.dtbo \
-BONE-ADC.dtbo \
-M-BB-BBG-00A0.dtbo \
-M-BB-BBGG-00A0.dtbo \
-PB-MIKROBUS-0.dtbo \
-PB-MIKROBUS-1.dtbo \
-"
-
-S =3D "${UNPACKDIR}/${BB_GIT_DEFAULT_DESTSUFFIX}"
-
-# 6.1.83 version for 32-bit
-SRCREV:armv7a =3D "be9b910b08dfd674e47a2643f35080b005ac3792"
-PV:armv7a =3D "6.1.83+git"
-BRANCH:armv7a =3D "v6.1.83-ti-r35"
-
-# 6.1.83 version for 64-bit
-SRCREV:aarch64 =3D "135558243d5a98ed39812b797d2ba6295ef3b86a"
-PV:aarch64 =3D "6.1.83+git"
-BRANCH:aarch64 =3D "v6.1.83-ti-arm64-r64"
-
-KERNEL_GIT_URI =3D "git://github.com/beagleboard/linux.git"
-
-INSANE_SKIP:kernel-modules +=3D "debug-deps"
diff --git a/meta-ti-bsp/conf/machine/am62pxx-evm.conf b/meta-ti-bsp/conf=
/machine/am62pxx-evm.conf
index cdde69eb..3f9249e6 100644
--- a/meta-ti-bsp/conf/machine/am62pxx-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62pxx-evm.conf
@@ -31,5 +31,3 @@ UBOOT_MACHINE =3D "am62px_evm_a53_defconfig"
 # For AM62P tisdk-display-cluster image, splash screen is handled by SBL=
.
 # Hence, disable the A53 based splash screen using the am62x_evm_prune_s=
plashscreen.config fragment present in ti-u-boot tree
 UBOOT_CONFIG_FRAGMENTS =3D "${@oe.utils.conditional('DISPLAY_CLUSTER_ENA=
BLE', '1', 'am62x_evm_prune_splashscreen.config', '', d)}"
-
-UBOOT_CONFIG_FRAGMENTS:bsp-ti-6_1 =3D "${@oe.utils.conditional('DISPLAY_=
CLUSTER_ENABLE', '1', 'am62px_evm_prune_splashscreen.config', '', d)}"
diff --git a/meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf b/meta-ti-b=
sp/conf/machine/am62xxsip-evm-k3r5.conf
index 2fd0cb54..e846c0da 100644
--- a/meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf
@@ -9,9 +9,4 @@ SYSFW_CONFIG =3D "evm"
 SYSFW_SUFFIX =3D "hs-fs"
=20
 UBOOT_MACHINE =3D "am6254xxl_evm_r5_defconfig"
-
 UBOOT_MACHINE:bsp-ti-6_6 =3D "am62xsip_evm_r5_defconfig"
-
-UBOOT_MACHINE:bsp-ti-6_1 =3D "am62x_evm_r5_defconfig"
-
-UBOOT_CONFIG_FRAGMENTS:bsp-ti-6_1 =3D "am62xsip_sk_r5.config"
diff --git a/meta-ti-bsp/conf/machine/am62xxsip-evm.conf b/meta-ti-bsp/co=
nf/machine/am62xxsip-evm.conf
index 9469cdeb..c5a3a92d 100644
--- a/meta-ti-bsp/conf/machine/am62xxsip-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62xxsip-evm.conf
@@ -6,15 +6,12 @@ require conf/machine/include/am62xx.inc
=20
 TFA_K3_BL32_BASE =3D "0x80080000"
 TFA_K3_BL32_BASE:bsp-ti-6_6 =3D ""
-TFA_K3_BL32_BASE:bsp-ti-6_1 =3D ""
=20
 TFA_K3_PRELOADED_BL33 =3D "0x82000000"
 TFA_K3_PRELOADED_BL33:bsp-ti-6_6 =3D ""
-TFA_K3_PRELOADED_BL33:bsp-ti-6_1 =3D ""
=20
 OPTEE_K3_TZDRAM_START =3D "0x80080000"
 OPTEE_K3_TZDRAM_START:bsp-ti-6_6 =3D ""
-OPTEE_K3_TZDRAM_START:bsp-ti-6_1 =3D ""
=20
 KERNEL_DEVICETREE_PREFIX =3D " \
     ti/k3-am625 \
@@ -27,8 +24,6 @@ KERNEL_DEVICETREE =3D " \
=20
 FIT_CONF_DEFAULT_DTB =3D "k3-am6254xxl-sk.dtb"
 FIT_CONF_DEFAULT_DTB:bsp-ti-6_6 =3D "k3-am625-sk.dtb"
-FIT_CONF_DEFAULT_DTB:bsp-ti-6_1 =3D "k3-am625-sk.dtb"
=20
 UBOOT_MACHINE =3D "am6254xxl_evm_a53_defconfig"
 UBOOT_MACHINE:bsp-ti-6_6 =3D "am62xsip_evm_a53_defconfig"
-UBOOT_MACHINE:bsp-ti-6_1 =3D "am62x_evm_a53_defconfig"
diff --git a/meta-ti-bsp/conf/machine/beagleplay-ti-k3r5.conf b/meta-ti-b=
sp/conf/machine/beagleplay-ti-k3r5.conf
index 72dc145b..b597c702 100644
--- a/meta-ti-bsp/conf/machine/beagleplay-ti-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/beagleplay-ti-k3r5.conf
@@ -9,6 +9,3 @@ SYSFW_CONFIG =3D "evm"
 SYSFW_SUFFIX =3D "gp"
=20
 UBOOT_MACHINE =3D "am62x_beagleplay_r5_defconfig"
-UBOOT_MACHINE:bsp-ti-6_1 =3D "am62x_evm_r5_defconfig"
-
-UBOOT_CONFIG_FRAGMENTS:bsp-ti-6_1 =3D "am625_beagleplay_r5.config"
diff --git a/meta-ti-bsp/conf/machine/beagleplay-ti.conf b/meta-ti-bsp/co=
nf/machine/beagleplay-ti.conf
index 3824d867..792c91b2 100644
--- a/meta-ti-bsp/conf/machine/beagleplay-ti.conf
+++ b/meta-ti-bsp/conf/machine/beagleplay-ti.conf
@@ -20,9 +20,6 @@ TFA_K3_SYSTEM_SUSPEND =3D "1"
 OPTEEMACHINE =3D "k3-am62x"
=20
 UBOOT_MACHINE =3D "am62x_beagleplay_a53_defconfig"
-UBOOT_MACHINE:bsp-ti-6_1 =3D "am62x_evm_a53_defconfig"
-
-UBOOT_CONFIG_FRAGMENTS:bsp-ti-6_1 =3D "am625_beagleplay_a53.config"
=20
 SPL_BINARY =3D "tispl.bin_unsigned"
=20
diff --git a/meta-ti-bsp/conf/machine/include/j721e.inc b/meta-ti-bsp/con=
f/machine/include/j721e.inc
index 30aa2a69..5833c322 100644
--- a/meta-ti-bsp/conf/machine/include/j721e.inc
+++ b/meta-ti-bsp/conf/machine/include/j721e.inc
@@ -38,6 +38,5 @@ OPTEEMACHINE =3D "k3-j721e"
=20
 TI_VXE_VXD_DRIVER =3D "ti-vxe-vxd-driver"
 TI_VXE_VXD_DRIVER:bsp-ti-6_6 =3D ""
-TI_VXE_VXD_DRIVER:bsp-ti-6_1 =3D ""
=20
 MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS +=3D "cadence-mhdp-fw vxd-dec-fw ti-=
eth-fw-j721e ${TI_VXE_VXD_DRIVER}"
diff --git a/meta-ti-bsp/conf/machine/include/ti-bsp.inc b/meta-ti-bsp/co=
nf/machine/include/ti-bsp.inc
index ce8efecd..c690cb5a 100644
--- a/meta-ti-bsp/conf/machine/include/ti-bsp.inc
+++ b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
@@ -3,7 +3,7 @@
 # preferences for kernel, bootloader and graphics components, as
 # well as a dedicated machine override.
=20
-# Supported options are: mainline, next, ti-6_12, ti-6_6, ti-6_1
+# Supported options are: mainline, next, ti-6_12, ti-6_6
 TI_PREFERRED_BSP ??=3D "ti-6_12"
=20
 # Use bsp-* namespace for overrides
@@ -78,26 +78,6 @@ BSP_MESA_PVR_VERSION:bsp-ti-6_6 =3D "24%"
 # GC320 support requires out-of-tree drivers not yet available in 6.6
 MACHINE_FEATURES:remove:bsp-ti-6_6 =3D "gc320"
=20
-# =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-# ti-6_1
-# TI staging kernel 6.1, u-boot 2023.04
-# =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-BSP_KERNEL_PROVIDER:bsp-ti-6_1 =3D "linux-ti-staging"
-BSP_KERNEL_VERSION:bsp-ti-6_1 =3D "6.1.%"
-BSP_BOOTLOADER_PROVIDER:bsp-ti-6_1 =3D "u-boot-ti-staging"
-BSP_BOOTLOADER_VERSION:bsp-ti-6_1 =3D "2023.04%"
-
-BSP_SGX_DRIVER_PROVIDER:bsp-ti-6_1 =3D "ti-sgx-ddk-km"
-BSP_SGX_DRIVER_VERSION:bsp-ti-6_1 =3D "1.17%"
-BSP_SGX_UMLIBS_VERSION:bsp-ti-6_1 =3D "1.17%"
-BSP_ROGUE_DRIVER_PROVIDER:bsp-ti-6_1 =3D "ti-img-rogue-driver"
-BSP_ROGUE_DRIVER_VERSION:bsp-ti-6_1 =3D "23%"
-BSP_ROGUE_UMLIBS_VERSION:bsp-ti-6_1 =3D "23%"
-BSP_MESA_PVR_VERSION:bsp-ti-6_1 =3D "22%"
-
-# GC320 support requires out-of-tree drivers not yet available in 6.1
-MACHINE_FEATURES:remove:bsp-ti-6_1 =3D "gc320"
-
 # =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
 # sane fallback defaults
 # if specific values are not defined or bsp is set incorrectly
diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_=
23.3.6512818.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-dr=
iver_23.3.6512818.bb
deleted file mode 100644
index 0d39571b..00000000
--- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.3.65=
12818.bb
+++ /dev/null
@@ -1,37 +0,0 @@
-SUMMARY =3D  "Kernel drivers for the PowerVR Rogue GPU found in the TI S=
oCs"
-HOMEPAGE =3D "http://git.ti.com/graphics/ti-img-rogue-driver"
-LICENSE =3D "MIT | GPL-2.0-only"
-LIC_FILES_CHKSUM =3D "file://README;beginline=3D14;endline=3D19;md5=3D04=
03c7dea01a2b8232261e805325fac2"
-
-inherit module
-
-PROVIDES =3D "virtual/gpudriver"
-
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-COMPATIBLE_MACHINE =3D "j721e|j721s2|j784s4|am62xx|am62pxx|j722s"
-
-DEPENDS =3D "virtual/kernel"
-
-BRANCH =3D "linuxws/kirkstone/k6.1/${PV}"
-
-SRC_URI =3D "git://git.ti.com/git/graphics/ti-img-rogue-driver.git;proto=
col=3Dhttps;branch=3D${BRANCH}"
-
-SRCREV =3D "c838bc06a163abad46dcc193c8fb9a4fb9e2e356"
-
-TARGET_PRODUCT:j721e =3D "j721e_linux"
-TARGET_PRODUCT:j721s2 =3D "j721s2_linux"
-TARGET_PRODUCT:j784s4 =3D "j784s4_linux"
-TARGET_PRODUCT:am62xx =3D "am62_linux"
-TARGET_PRODUCT:am62pxx =3D "am62p_linux"
-TARGET_PRODUCT:j722s =3D "j722s_linux"
-PVR_BUILD =3D "release"
-PVR_WS =3D "lws-generic"
-
-EXTRA_OEMAKE +=3D 'KERNELDIR=3D"${STAGING_KERNEL_DIR}" BUILD=3D${PVR_BUI=
LD} PVR_BUILD_DIR=3D${TARGET_PRODUCT} WINDOW_SYSTEM=3D${PVR_WS}'
-
-do_install() {
-    make -C ${STAGING_KERNEL_DIR} M=3D${B}/binary_${TARGET_PRODUCT}_${PV=
R_WS}_${PVR_BUILD}/target_aarch64/kbuild INSTALL_MOD_PATH=3D${D}${root_pr=
efix} PREFIX=3D${STAGING_DIR_HOST} modules_install
-}
-
-RRECOMMENDS:${PN} +=3D "ti-img-rogue-umlibs"
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb =
b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb
deleted file mode 100644
index b26c59d4..00000000
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require u-boot-ti.inc
-
-include ${@ 'recipes-bsp/u-boot/ti-extras.inc' if d.getVar('TI_EXTRAS') =
else ''}
-
-PR =3D "r0"
-
-BRANCH =3D "ti-u-boot-2023.04"
-
-SRC_URI +=3D "file://0001-scripts-dtc-pylibfdt-libfdt.i_shipped-Use-SWIG=
_Appen.patch"
-
-SRCREV =3D "2bedcd265ca6de803c90505df5962cbd70cda611"
diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-22.3.5/0001-fix-g=
allivm-fix-LLVM-include-of-Host-h-moved-to-TargetParser.patch b/meta-ti-b=
sp/recipes-graphics/mesa/mesa-pvr-22.3.5/0001-fix-gallivm-fix-LLVM-includ=
e-of-Host-h-moved-to-TargetParser.patch
deleted file mode 100644
index 7d4fe078..00000000
--- a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-22.3.5/0001-fix-gallivm-=
fix-LLVM-include-of-Host-h-moved-to-TargetParser.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-From bb2db56ffec6e527d88751f75117ae690227cd6c Mon Sep 17 00:00:00 2001
-From: =3D?UTF-8?q?Kai=3D20Wasserb=3DC3=3DA4ch?=3D <kai@dev.carbon-projec=
t.org>
-Date: Sat, 11 Feb 2023 18:38:01 +0100
-Subject: [PATCH] fix: gallivm: fix LLVM #include of Host.h, moved to
- TargetParser
-
-Upstream moved Host.h from Support to TargetParser in LLVM 17.
-
-This shouldn't lead to a FTBFS, since there is a forwarding include left
-behind. Sadly the added deprecation warning #pragma is invalid and thus
-causes a build failure right away. But since we would have to follow the
-move anyway in the future, just do it right away.
-
-Reference: https://github.com/llvm/llvm-project/commit/d768bf994f508d7ea=
f9541a568be3d71096febf5
-Reviewed-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
-Closes: #8275
-Part-of: <https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/2126=
3>
-
-Upstream-Status: Backport [https://gitlab.freedesktop.org/mesa/mesa/-/co=
mmit/bb2db56ffec6e527d88751f75117ae690227cd6c]
-
----
- src/gallium/auxiliary/gallivm/lp_bld_debug.cpp | 7 ++++++-
- src/gallium/auxiliary/gallivm/lp_bld_misc.cpp  | 4 +++-
- 2 files changed, 9 insertions(+), 2 deletions(-)
-
-diff --git a/src/gallium/auxiliary/gallivm/lp_bld_debug.cpp b/src/galliu=
m/auxiliary/gallivm/lp_bld_debug.cpp
-index 54bc5d5ada36c..f78f04f042be8 100644
---- a/src/gallium/auxiliary/gallivm/lp_bld_debug.cpp
-+++ b/src/gallium/auxiliary/gallivm/lp_bld_debug.cpp
-@@ -35,9 +35,14 @@
- #include <llvm-c/Disassembler.h>
- #include <llvm/Support/raw_ostream.h>
- #include <llvm/Support/Format.h>
--#include <llvm/Support/Host.h>
- #include <llvm/IR/Module.h>
-=20
-+#if LLVM_VERSION_MAJOR >=3D 17
-+#include <llvm/TargetParser/Host.h>
-+#else
-+#include <llvm/Support/Host.h>
-+#endif
-+
- #include "util/u_math.h"
- #include "util/u_debug.h"
-=20
-diff --git a/src/gallium/auxiliary/gallivm/lp_bld_misc.cpp b/src/gallium=
/auxiliary/gallivm/lp_bld_misc.cpp
-index 334c13530394b..5e7a30a6cc2e3 100644
---- a/src/gallium/auxiliary/gallivm/lp_bld_misc.cpp
-+++ b/src/gallium/auxiliary/gallivm/lp_bld_misc.cpp
-@@ -60,7 +60,11 @@
- #include <llvm/Analysis/TargetLibraryInfo.h>
- #include <llvm/ExecutionEngine/SectionMemoryManager.h>
- #include <llvm/Support/CommandLine.h>
-+#if LLVM_VERSION_MAJOR >=3D 17
-+#include <llvm/TargetParser/Host.h>
-+#else
- #include <llvm/Support/Host.h>
-+#endif
- #include <llvm/Support/PrettyStackTrace.h>
- #include <llvm/ExecutionEngine/ObjectCache.h>
- #include <llvm/Support/TargetSelect.h>
-=20
---=20
-GitLab
-
diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-22.3.5/0001-fix-g=
allivm-limit-usage-of-LLVMContextSetOpaquePoint.patch b/meta-ti-bsp/recip=
es-graphics/mesa/mesa-pvr-22.3.5/0001-fix-gallivm-limit-usage-of-LLVMCont=
extSetOpaquePoint.patch
deleted file mode 100644
index 905fad04..00000000
--- a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-22.3.5/0001-fix-gallivm-=
limit-usage-of-LLVMContextSetOpaquePoint.patch
+++ /dev/null
@@ -1,128 +0,0 @@
-From 1a894699354f5f984f31e5d3418b651edf486df9 Mon Sep 17 00:00:00 2001
-From: Ryan Eatmon <reatmon@ti.com>
-Date: Fri, 22 Sep 2023 22:32:41 -0500
-Subject: [PATCH] fix: gallivm: limit usage of LLVMContextSetOpaquePointe=
rs()
- to LLVM 15
-
-LLVMContextSetOpaquePointers() was a temporary workaround offered to
-allow transitioning to opaque pointers. Mesa is ready for this now with
-recent versions of LLVM (16+). Therefore we limit the workaround of
-using LLVMContextSetOpaquePointers() to LLVM 15 now, that this C
-interface was removed in LLVM 17.
-
-Reference: https://github.com/llvm/llvm-project/commit/1270879376025457e=
266572c7cccc51eb5de9276
-
-Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/mesa/-/m=
erge_requests/21124]
-Signed-off-by: Ryan Eatmon <reatmon@ti.com>
----
- src/gallium/auxiliary/draw/draw_llvm.c        | 2 +-
- src/gallium/drivers/llvmpipe/lp_context.c     | 2 +-
- src/gallium/drivers/llvmpipe/lp_test_arit.c   | 2 +-
- src/gallium/drivers/llvmpipe/lp_test_blend.c  | 2 +-
- src/gallium/drivers/llvmpipe/lp_test_conv.c   | 2 +-
- src/gallium/drivers/llvmpipe/lp_test_format.c | 4 ++--
- src/gallium/drivers/llvmpipe/lp_test_printf.c | 2 +-
- 7 files changed, 8 insertions(+), 8 deletions(-)
-
-diff --git a/src/gallium/auxiliary/draw/draw_llvm.c b/src/gallium/auxili=
ary/draw/draw_llvm.c
-index 50c157bc3cc..8b3a1522725 100644
---- a/src/gallium/auxiliary/draw/draw_llvm.c
-+++ b/src/gallium/auxiliary/draw/draw_llvm.c
-@@ -784,7 +784,7 @@ draw_llvm_create(struct draw_context *draw, LLVMCont=
extRef context)
-    if (!llvm->context) {
-       llvm->context =3D LLVMContextCreate();
-
--#if LLVM_VERSION_MAJOR >=3D 15
-+#if LLVM_VERSION_MAJOR =3D=3D 15
-       LLVMContextSetOpaquePointers(llvm->context, false);
- #endif
-
-diff --git a/src/gallium/drivers/llvmpipe/lp_context.c b/src/gallium/dri=
vers/llvmpipe/lp_context.c
-index 8309335aebc..0ef4317fc76 100644
---- a/src/gallium/drivers/llvmpipe/lp_context.c
-+++ b/src/gallium/drivers/llvmpipe/lp_context.c
-@@ -263,7 +263,7 @@ llvmpipe_create_context(struct pipe_screen *screen, =
void *priv,
-    if (!llvmpipe->context)
-       goto fail;
-
--#if LLVM_VERSION_MAJOR >=3D 15
-+#if LLVM_VERSION_MAJOR =3D=3D 15
-    LLVMContextSetOpaquePointers(llvmpipe->context, false);
- #endif
-
-diff --git a/src/gallium/drivers/llvmpipe/lp_test_arit.c b/src/gallium/d=
rivers/llvmpipe/lp_test_arit.c
-index 4118928d52e..565b1c47753 100644
---- a/src/gallium/drivers/llvmpipe/lp_test_arit.c
-+++ b/src/gallium/drivers/llvmpipe/lp_test_arit.c
-@@ -434,7 +434,7 @@ test_unary(unsigned verbose, FILE *fp, const struct =
unary_test_t *test, unsigned
-    }
-
-    context =3D LLVMContextCreate();
--#if LLVM_VERSION_MAJOR >=3D 15
-+#if LLVM_VERSION_MAJOR =3D=3D 15
-    LLVMContextSetOpaquePointers(context, false);
- #endif
-    gallivm =3D gallivm_create("test_module", context, NULL);
-diff --git a/src/gallium/drivers/llvmpipe/lp_test_blend.c b/src/gallium/=
drivers/llvmpipe/lp_test_blend.c
-index 37c3f731eaf..3d2899a78d4 100644
---- a/src/gallium/drivers/llvmpipe/lp_test_blend.c
-+++ b/src/gallium/drivers/llvmpipe/lp_test_blend.c
-@@ -452,7 +452,7 @@ test_one(unsigned verbose,
-       dump_blend_type(stdout, blend, type);
-
-    context =3D LLVMContextCreate();
--#if LLVM_VERSION_MAJOR >=3D 15
-+#if LLVM_VERSION_MAJOR =3D=3D 15
-    LLVMContextSetOpaquePointers(context, false);
- #endif
-    gallivm =3D gallivm_create("test_module", context, NULL);
-diff --git a/src/gallium/drivers/llvmpipe/lp_test_conv.c b/src/gallium/d=
rivers/llvmpipe/lp_test_conv.c
-index c7ea9efc12d..83236f0c0ba 100644
---- a/src/gallium/drivers/llvmpipe/lp_test_conv.c
-+++ b/src/gallium/drivers/llvmpipe/lp_test_conv.c
-@@ -223,7 +223,7 @@ test_one(unsigned verbose,
-    }
-
-    context =3D LLVMContextCreate();
--#if LLVM_VERSION_MAJOR >=3D 15
-+#if LLVM_VERSION_MAJOR =3D=3D 15
-    LLVMContextSetOpaquePointers(context, false);
- #endif
-    gallivm =3D gallivm_create("test_module", context, NULL);
-diff --git a/src/gallium/drivers/llvmpipe/lp_test_format.c b/src/gallium=
/drivers/llvmpipe/lp_test_format.c
-index 0a2a1e449e8..89f7d5dec1a 100644
---- a/src/gallium/drivers/llvmpipe/lp_test_format.c
-+++ b/src/gallium/drivers/llvmpipe/lp_test_format.c
-@@ -150,7 +150,7 @@ test_format_float(unsigned verbose, FILE *fp,
-    unsigned i, j, k, l;
-
-    context =3D LLVMContextCreate();
--#if LLVM_VERSION_MAJOR >=3D 15
-+#if LLVM_VERSION_MAJOR =3D=3D 15
-    LLVMContextSetOpaquePointers(context, false);
- #endif
-    gallivm =3D gallivm_create("test_module_float", context, NULL);
-@@ -254,7 +254,7 @@ test_format_unorm8(unsigned verbose, FILE *fp,
-    unsigned i, j, k, l;
-
-    context =3D LLVMContextCreate();
--#if LLVM_VERSION_MAJOR >=3D 15
-+#if LLVM_VERSION_MAJOR =3D=3D 15
-    LLVMContextSetOpaquePointers(context, false);
- #endif
-    gallivm =3D gallivm_create("test_module_unorm8", context, NULL);
-diff --git a/src/gallium/drivers/llvmpipe/lp_test_printf.c b/src/gallium=
/drivers/llvmpipe/lp_test_printf.c
-index b3de9cb9e8b..850c0abfe22 100644
---- a/src/gallium/drivers/llvmpipe/lp_test_printf.c
-+++ b/src/gallium/drivers/llvmpipe/lp_test_printf.c
-@@ -96,7 +96,7 @@ test_printf(unsigned verbose, FILE *fp,
-    boolean success =3D TRUE;
-
-    context =3D LLVMContextCreate();
--#if LLVM_VERSION_MAJOR >=3D 15
-+#if LLVM_VERSION_MAJOR =3D=3D 15
-    LLVMContextSetOpaquePointers(context, false);
- #endif
-    gallivm =3D gallivm_create("test_module", context, NULL);
---
-2.17.1
diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-22.3.5/0001-freed=
reno-pm4-Use-unsigned-instead-of-uint-to-fix-mu.patch b/meta-ti-bsp/recip=
es-graphics/mesa/mesa-pvr-22.3.5/0001-freedreno-pm4-Use-unsigned-instead-=
of-uint-to-fix-mu.patch
deleted file mode 100644
index f0775176..00000000
--- a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-22.3.5/0001-freedreno-pm=
4-Use-unsigned-instead-of-uint-to-fix-mu.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 8a5de0b6cf1090d7f29f3974ec79c32776cf2745 Mon Sep 17 00:00:00 2001
-From: Jami Kettunen <jami.kettunen@protonmail.com>
-Date: Tue, 31 Aug 2021 00:15:58 +0300
-Subject: [PATCH] freedreno/pm4: Use unsigned instead of uint to fix musl=
 build
-
-Upstream-Status: Backport
-
-Fixes the following error I noticed when building against aarch64 with
-musl libc:
-
-  In file included from ../src/freedreno/decode/crashdec.h:38,
-                   from ../src/freedreno/decode/crashdec.c:40:
-  ../src/freedreno/common/freedreno_pm4.h:104:15: error: unknown type na=
me 'uint'
-    104 | static inline uint
-        |               ^~~~
-  ../src/freedreno/common/freedreno_pm4.h:105:25: error: unknown type na=
me 'uint'; did you mean 'int'?
-    105 | pm4_calc_odd_parity_bit(uint val)
-        |                         ^~~~
-        |                         int
-
-Signed-off-by: Jami Kettunen <jami.kettunen@protonmail.com>
-Part-of: <https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/1966=
5>
----
- src/freedreno/common/freedreno_pm4.h | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/freedreno/common/freedreno_pm4.h b/src/freedreno/common=
/freedreno_pm4.h
-index 8f958953d693..091247e709a0 100644
---- a/src/freedreno/common/freedreno_pm4.h
-+++ b/src/freedreno/common/freedreno_pm4.h
-@@ -105,8 +105,8 @@ pm4_pkt7_hdr(uint8_t opcode, uint16_t cnt)
- #define cp_type3_opcode(pkt) (((pkt) >> 8) & 0xFF)
- #define type3_pkt_size(pkt)  ((((pkt) >> 16) & 0x3FFF) + 1)
-
--static inline uint
--pm4_calc_odd_parity_bit(uint val)
-+static inline unsigned
-+pm4_calc_odd_parity_bit(unsigned val)
- {
-    return (0x9669 >> (0xf & ((val) ^ ((val) >> 4) ^ ((val) >> 8) ^
-                              ((val) >> 12) ^ ((val) >> 16) ^ ((val) >> =
20) ^
---
-2.39.2
diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-22.3.5/0001-galli=
um-Fix-build-with-llvm-17.patch b/meta-ti-bsp/recipes-graphics/mesa/mesa-=
pvr-22.3.5/0001-gallium-Fix-build-with-llvm-17.patch
deleted file mode 100644
index bdfe7bb8..00000000
--- a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-22.3.5/0001-gallium-Fix-=
build-with-llvm-17.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From 2dfe0f899aeb415a5491b8c67e208673d2a2914f Mon Sep 17 00:00:00 2001
-From: Ryan Eatmon <reatmon@ti.com>
-Date: Fri, 22 Sep 2023 21:50:08 -0500
-Subject: [PATCH] gallium: Fix build with llvm 17
-
-These headers are not available for C files in llvm 17+
-and they seem to be not needed to compile after all with llvm 17
-so add conditions to exclude them for llvm >=3D 17
-
-Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/mesa/-/m=
erge_requests/21262]
-Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/mesa/-/m=
erge_requests/22980]
-Signed-off-by: Ryan Eatmon <reatmon@ti.com>
----
- src/gallium/auxiliary/gallivm/lp_bld_init.c   | 8 ++++----
- src/gallium/auxiliary/gallivm/lp_bld_misc.cpp | 4 ++++
- 2 files changed, 8 insertions(+), 4 deletions(-)
-
-diff --git a/src/gallium/auxiliary/gallivm/lp_bld_init.c b/src/gallium/a=
uxiliary/gallivm/lp_bld_init.c
-index 584ea738668..fe8bb2b11af 100644
---- a/src/gallium/auxiliary/gallivm/lp_bld_init.c
-+++ b/src/gallium/auxiliary/gallivm/lp_bld_init.c
-@@ -42,14 +42,14 @@
-
- #include <llvm/Config/llvm-config.h>
- #include <llvm-c/Analysis.h>
--#include <llvm-c/Transforms/Scalar.h>
--#if LLVM_VERSION_MAJOR >=3D 7
--#include <llvm-c/Transforms/Utils.h>
--#endif
- #include <llvm-c/BitWriter.h>
- #if GALLIVM_USE_NEW_PASS =3D=3D 1
- #include <llvm-c/Transforms/PassBuilder.h>
- #elif GALLIVM_HAVE_CORO =3D=3D 1
-+#include <llvm-c/Transforms/Scalar.h>
-+#if LLVM_VERSION_MAJOR >=3D 7
-+#include <llvm-c/Transforms/Utils.h>
-+#endif
- #if LLVM_VERSION_MAJOR <=3D 8 && (defined(PIPE_ARCH_AARCH64) || defined=
 (PIPE_ARCH_ARM) || defined(PIPE_ARCH_S390) || defined(PIPE_ARCH_MIPS64))
- #include <llvm-c/Transforms/IPO.h>
- #endif
-diff --git a/src/gallium/auxiliary/gallivm/lp_bld_misc.cpp b/src/gallium=
/auxiliary/gallivm/lp_bld_misc.cpp
-index 2279e5acb28..0caeaf94263 100644
---- a/src/gallium/auxiliary/gallivm/lp_bld_misc.cpp
-+++ b/src/gallium/auxiliary/gallivm/lp_bld_misc.cpp
-@@ -56,7 +56,11 @@
- #include <llvm-c/ExecutionEngine.h>
- #include <llvm/Target/TargetOptions.h>
- #include <llvm/ExecutionEngine/ExecutionEngine.h>
-+#if LLVM_VERSION_MAJOR >=3D 17
-+#include <llvm/TargetParser/Triple.h>
-+#else
- #include <llvm/ADT/Triple.h>
-+#endif
- #include <llvm/Analysis/TargetLibraryInfo.h>
- #include <llvm/ExecutionEngine/SectionMemoryManager.h>
- #include <llvm/Support/CommandLine.h>
---
-2.17.1
diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-22.3.5/0001-galli=
um-Fix-build-with-llvm-18-and-19.patch b/meta-ti-bsp/recipes-graphics/mes=
a/mesa-pvr-22.3.5/0001-gallium-Fix-build-with-llvm-18-and-19.patch
deleted file mode 100644
index 37888c34..00000000
--- a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-22.3.5/0001-gallium-Fix-=
build-with-llvm-18-and-19.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From 6c5033bb01a3a1341d4db5007586a5f2e2727b0a Mon Sep 17 00:00:00 2001
-From: Ryan Eatmon <reatmon@ti.com>
-Date: Mon, 4 Nov 2024 13:37:29 -0600
-Subject: [PATCH] gallium: Fix build with llvm 18 and 19
-
-- CodeGenOpt::Level changed to CodeGenOoptLevel. [1]
-- llvm::sys::getHostCPUFeatures() now returns the features instead of
-modifying the passed in argument. [2]
-
-Upstream-Status: Backport [1][https://gitlab.freedesktop.org/mesa/mesa/-=
/commit/f79617fe804ea6524651ff1bc3a91098d3199179]
-Upstream-Status: Backport [2][https://gitlab.freedesktop.org/mesa/mesa/-=
/commit/fa9cd89a85b904615ebc11da609445b5b751e68d]
-
-Signed-off-by: Ryan Eatmon <reatmon@ti.com>
----
- src/gallium/auxiliary/gallivm/lp_bld_misc.cpp | 14 ++++++++++++--
- 1 file changed, 12 insertions(+), 2 deletions(-)
-
-diff --git a/src/gallium/auxiliary/gallivm/lp_bld_misc.cpp b/src/gallium=
/auxiliary/gallivm/lp_bld_misc.cpp
-index 5e7a30a6cc2..dbc777e3096 100644
---- a/src/gallium/auxiliary/gallivm/lp_bld_misc.cpp
-+++ b/src/gallium/auxiliary/gallivm/lp_bld_misc.cpp
-@@ -368,7 +368,11 @@ lp_build_create_jit_compiler_for_module(LLVMExecuti=
onEngineRef *OutJIT,
-    builder.setEngineKind(EngineKind::JIT)
-           .setErrorStr(&Error)
-           .setTargetOptions(options)
-+#if LLVM_VERSION_MAJOR >=3D 18
-+          .setOptLevel((CodeGenOptLevel)OptLevel);
-+#else
-           .setOptLevel((CodeGenOpt::Level)OptLevel);
-+#endif
-=20
- #ifdef _WIN32
-     /*
-@@ -392,8 +396,14 @@ lp_build_create_jit_compiler_for_module(LLVMExecuti=
onEngineRef *OutJIT,
-     * which allows us to enable/disable code generation based
-     * on the results of cpuid on these architectures.
-     */
--   llvm::StringMap<bool> features;
--   llvm::sys::getHostCPUFeatures(features);
-+   #if LLVM_VERSION_MAJOR >=3D 19
-+      /* llvm-19+ returns StringMap from getHostCPUFeatures.
-+      */
-+      auto features =3D llvm::sys::getHostCPUFeatures();
-+   #else
-+      llvm::StringMap<bool> features;
-+      llvm::sys::getHostCPUFeatures(features);
-+   #endif
-=20
-    for (StringMapIterator<bool> f =3D features.begin();
-         f !=3D features.end();
---=20
-2.17.1
-
diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-22.3.5/0001-gbm-b=
ackend-fix-gbm-compile-without-dri.patch b/meta-ti-bsp/recipes-graphics/m=
esa/mesa-pvr-22.3.5/0001-gbm-backend-fix-gbm-compile-without-dri.patch
deleted file mode 100644
index 289ff032..00000000
--- a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-22.3.5/0001-gbm-backend-=
fix-gbm-compile-without-dri.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-From 25946100e21cf2095bea334e8d7096798561d0b7 Mon Sep 17 00:00:00 2001
-From: Vincent Davis Jr <vince@underview.tech>
-Date: Wed, 28 Dec 2022 16:28:01 -0600
-Subject: [PATCH] gbm/backend: fix gbm compile without dri
-
-Upstream-Status: Backport
-
-https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/20447
-https://gitlab.freedesktop.org/mesa/mesa/-/commit/842ca284650f066e587067=
41a7d22d67b5088e60
-
-At mesa version 22.2.3 patch wasn't introduced until after.
-
-Commit introduces a fix that allows for gbm to be built with an empty
-backend. There are situation especially in a Yocto/OE cross compilation
-environment where you want to build with an empty backend. The particula=
r
-situation is as such:
-
-The mesa-gl recipe is the preferred provider for virtual/libgbm, virtual=
/libgl,
-virtual/mesa, etc... But the x11 DISTRO_FEATURE in't included this leads=
 to build
-errors such as:
-
-| /../../../ld: src/gbm/libgbm.so.1.0.0.p/main_backend.c.o: in function =
`find_backend':
-| backend.c:(.text.find_backend+0xa4): undefined reference to `gbm_dri_b=
ackend'
-| /../../../ld: src/gbm/libgbm.so.1.0.0.p/main_backend.c.o:(.data.rel.ro=
.builtin_backends+0x4):
-                undefined reference to `gbm_dri_backend'
-| collect2: error: ld returned 1 exit status
-
-Issue should be replicable by setting -Ddri3=3Ddisabled and -Dgbm=3Denab=
led
-
-Add fix to bypasses compilation issue by excluding gbm dri backend. If
-HAVE_DRI || HAVE_DRIX not specified.
-
-Acked-by: David Heidelberg <david.heidelberg@collabora.com>
-Signed-off-by: Vincent Davis Jr <vince@underview.tech>
----
- src/gbm/main/backend.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/src/gbm/main/backend.c b/src/gbm/main/backend.c
-index 974d0a76a4e..feee0703495 100644
---- a/src/gbm/main/backend.c
-+++ b/src/gbm/main/backend.c
-@@ -42,7 +42,9 @@
- #define ARRAY_SIZE(a) (sizeof(a)/sizeof((a)[0]))
- #define VER_MIN(a, b) ((a) < (b) ? (a) : (b))
-
-+#if defined(HAVE_DRI) || defined(HAVE_DRI2) || defined(HAVE_DRI3)
- extern const struct gbm_backend gbm_dri_backend;
-+#endif
-
- struct gbm_backend_desc {
-    const char *name;
-@@ -51,7 +53,9 @@ struct gbm_backend_desc {
- };
-
- static const struct gbm_backend_desc builtin_backends[] =3D {
-+#if defined(HAVE_DRI) || defined(HAVE_DRI2) || defined(HAVE_DRI3)
-    { "dri", &gbm_dri_backend },
-+#endif
- };
-
- #define BACKEND_LIB_SUFFIX "_gbm"
---
-2.34.1
diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-22.3.5/0001-meson=
-misdetects-64bit-atomics-on-mips-clang.patch b/meta-ti-bsp/recipes-graph=
ics/mesa/mesa-pvr-22.3.5/0001-meson-misdetects-64bit-atomics-on-mips-clan=
g.patch
deleted file mode 100644
index 35bd0ea1..00000000
--- a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-22.3.5/0001-meson-misdet=
ects-64bit-atomics-on-mips-clang.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From 3ef37c63f03ad6f2af407de350486fdd25e9132a Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 13 Jan 2020 15:23:47 -0800
-Subject: [PATCH] meson misdetects 64bit atomics on mips/clang
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
----
- src/util/u_atomic.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/util/u_atomic.c b/src/util/u_atomic.c
-index 5a5eab4..e499516 100644
---- a/src/util/u_atomic.c
-+++ b/src/util/u_atomic.c
-@@ -21,7 +21,7 @@
-  * IN THE SOFTWARE.
-  */
-
--#if defined(MISSING_64BIT_ATOMICS) && defined(HAVE_PTHREAD)
-+#if !defined(__clang__) && defined(MISSING_64BIT_ATOMICS) && defined(HA=
VE_PTHREAD)
-
- #include <stdint.h>
- #include <pthread.h>
diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-22.3.5/0001-meson=
.build-check-for-all-linux-host_os-combinations.patch b/meta-ti-bsp/recip=
es-graphics/mesa/mesa-pvr-22.3.5/0001-meson.build-check-for-all-linux-hos=
t_os-combinations.patch
deleted file mode 100644
index f0c1de46..00000000
--- a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-22.3.5/0001-meson.build-=
check-for-all-linux-host_os-combinations.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 3b4d6b89f644b43e507c08181fef06db4326f9da Mon Sep 17 00:00:00 2001
-From: Alistair Francis <alistair@alistair23.me>
-Date: Thu, 14 Nov 2019 13:04:49 -0800
-Subject: [PATCH] meson.build: check for all linux host_os combinations
-
-Make sure that we are also looking for our host_os combinations like
-linux-musl etc. when assuming support for DRM/KMS.
-
-Also delete a duplicate line.
-
-Upstream-Status: Pending
-
-Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
-Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
-Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
-Signed-off-by: Alistair Francis <alistair@alistair23.me>
-
----
- meson.build | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/meson.build b/meson.build
-index 172c64a..9b5294c 100644
---- a/meson.build
-+++ b/meson.build
-@@ -173,7 +173,7 @@ with_any_opengl =3D with_opengl or with_gles1 or wit=
h_gles2
- # Only build shared_glapi if at least one OpenGL API is enabled
- with_shared_glapi =3D with_shared_glapi and with_any_opengl
-
--system_has_kms_drm =3D ['openbsd', 'netbsd', 'freebsd', 'gnu/kfreebsd',=
 'dragonfly', 'linux', 'sunos', 'android'].contains(host_machine.system()=
)
-+system_has_kms_drm =3D ['openbsd', 'netbsd', 'freebsd', 'gnu/kfreebsd',=
 'dragonfly', 'linux', 'sunos', 'android'].contains(host_machine.system()=
) or host_machine.system().startswith('linux')
-
- with_freedreno_kgsl =3D get_option('freedreno-kgsl')
- if with_freedreno_kgsl
-@@ -1076,7 +1076,7 @@ if cc.has_function('reallocarray')
- endif
-
- # TODO: this is very incomplete
--if ['linux', 'cygwin', 'gnu', 'freebsd', 'gnu/kfreebsd', 'haiku', 'andr=
oid'].contains(host_machine.system())
-+if ['linux', 'cygwin', 'gnu', 'freebsd', 'gnu/kfreebsd', 'haiku'].conta=
ins(host_machine.system()) or host_machine.system().startswith('linux')
-   pre_args +=3D '-D_GNU_SOURCE'
- elif host_machine.system() =3D=3D 'sunos'
-   pre_args +=3D '-D__EXTENSIONS__'
diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-22.3.5/0001-util-=
format-Check-for-NEON-before-using-it.patch b/meta-ti-bsp/recipes-graphic=
s/mesa/mesa-pvr-22.3.5/0001-util-format-Check-for-NEON-before-using-it.pa=
tch
deleted file mode 100644
index 6eea5ed8..00000000
--- a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-22.3.5/0001-util-format-=
Check-for-NEON-before-using-it.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From f17e836ef9b1bbc6056790596420b699e48128c2 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 2 Dec 2021 19:57:42 -0800
-Subject: [PATCH] util/format: Check for NEON before using it
-
-This fixes build on rpi0-w and any other machine which does not have
-neon unit and is not used as FPU unit
-
-Fixes errors e.g.
-
-In file included from ../mesa-21.3.0/src/util/format/u_format_unpack_neo=
n.c:35:
-/mnt/b/yoe/master/build/tmp/work/arm1176jzfshf-vfp-yoe-linux-gnueabi/mes=
a/2_21.3.0-r0/recipe-sysroot-native/usr/lib/clang/13.0.1/include/arm_neon=
.h:32:2: error: "NEON support not enabled"
-
-Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/mesa/-/m=
erge_requests/14032]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
----
- src/util/format/u_format.c             | 2 +-
- src/util/format/u_format_unpack_neon.c | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/util/format/u_format.c b/src/util/format/u_format.c
-index c071250..0880984 100644
---- a/src/util/format/u_format.c
-+++ b/src/util/format/u_format.c
-@@ -1184,7 +1184,7 @@ static void
- util_format_unpack_table_init(void)
- {
-    for (enum pipe_format format =3D PIPE_FORMAT_NONE; format < PIPE_FOR=
MAT_COUNT; format++) {
--#if (defined(PIPE_ARCH_AARCH64) || defined(PIPE_ARCH_ARM)) && !defined(=
NO_FORMAT_ASM) && !defined(__SOFTFP__)
-+#if (defined(PIPE_ARCH_AARCH64) || (defined(__ARM_NEON) && defined(PIPE=
_ARCH_ARM))) && !defined(NO_FORMAT_ASM)
-       const struct util_format_unpack_description *unpack =3D util_form=
at_unpack_description_neon(format);
-       if (unpack) {
-          util_format_unpack_table[format] =3D unpack;
-diff --git a/src/util/format/u_format_unpack_neon.c b/src/util/format/u_=
format_unpack_neon.c
-index a4a5cb1..1e4f794 100644
---- a/src/util/format/u_format_unpack_neon.c
-+++ b/src/util/format/u_format_unpack_neon.c
-@@ -23,7 +23,7 @@
-
- #include <u_format.h>
-
--#if (defined(PIPE_ARCH_AARCH64) || defined(PIPE_ARCH_ARM)) && !defined(=
NO_FORMAT_ASM) && !defined(__SOFTFP__)
-+#if (defined(PIPE_ARCH_AARCH64) || (defined(__ARM_NEON) && defined(PIPE=
_ARCH_ARM))) && !defined(NO_FORMAT_ASM)
-
- /* armhf builds default to vfp, not neon, and refuses to compile neon i=
ntrinsics
-  * unless you tell it "no really".
diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_22.3.5.bb b/meta-=
ti-bsp/recipes-graphics/mesa/mesa-pvr_22.3.5.bb
deleted file mode 100644
index 2f160141..00000000
--- a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_22.3.5.bb
+++ /dev/null
@@ -1,60 +0,0 @@
-# PowerVR Graphics require several patches that have not made their way
-# upstream yet. This allows us to build the shims we need without comple=
tely
-# clobbering mesa.
-
-require recipes-graphics/mesa/mesa-pvr.inc
-
-SUMMARY +=3D " (with PowerVR for TI parts)"
-
-LIC_FILES_CHKSUM =3D "file://docs/license.rst;md5=3D63779ec98d78d823a9dc=
533a0735ef10"
-
-BRANCH =3D "powervr/kirkstone/${PV}"
-
-SRC_URI =3D " \
-    git://gitlab.freedesktop.org/StaticRocket/mesa.git;protocol=3Dhttps;=
branch=3D${BRANCH} \
-    file://0001-meson.build-check-for-all-linux-host_os-combinations.pat=
ch \
-    file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
-    file://0001-util-format-Check-for-NEON-before-using-it.patch \
-    file://0001-gbm-backend-fix-gbm-compile-without-dri.patch \
-    file://0001-freedreno-pm4-Use-unsigned-instead-of-uint-to-fix-mu.pat=
ch \
-    file://0001-gallium-Fix-build-with-llvm-17.patch \
-    file://0001-fix-gallivm-limit-usage-of-LLVMContextSetOpaquePoint.pat=
ch \
-    file://0001-fix-gallivm-fix-LLVM-include-of-Host-h-moved-to-TargetPa=
rser.patch \
-    file://0001-gallium-Fix-build-with-llvm-18-and-19.patch \
-"
-
-PACKAGECONFIG:append =3D " \
-    ${@bb.utils.contains('PREFERRED_PROVIDER_virtual/gpudriver', 'ti-img=
-rogue-driver', 'pvr', '', d)} \
-    ${@bb.utils.contains('PREFERRED_PROVIDER_virtual/gpudriver', 'ti-sgx=
-ddk-km', 'sgx', '', d)} \
-"
-
-SRCREV =3D "c9f0919367589b38f5682183846de9d60eec082d"
-PV =3D "22.3.5"
-
-PVR_DISPLAY_CONTROLLER_ALIAS ??=3D "tidss"
-PACKAGECONFIG[pvr] =3D "-Dgallium-pvr-alias=3D${PVR_DISPLAY_CONTROLLER_A=
LIAS},"
-PACKAGECONFIG[sgx] =3D "-Dgallium-sgx-alias=3D${PVR_DISPLAY_CONTROLLER_A=
LIAS},"
-
-PACKAGECONFIG:remove =3D "video-codecs"
-PACKAGECONFIG[video-codecs] =3D ""
-PACKAGECONFIG:remove =3D "elf-tls"
-PACKAGECONFIG[elf-tls] =3D ""
-PACKAGECONFIG:remove =3D "xvmc"
-PACKAGECONFIG[xvmc] =3D ""
-
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'pvr', =
',pvr', '', d)}"
-GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'sgx', =
',sgx', '', d)}"
-
-VULKAN_DRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'pvr', =
',pvr', '', d)}"
-
-do_install:append () {
-    # remove pvr custom pkgconfig
-    rm -rf ${D}${datadir}/pkgconfig
-}
-
-FILES:${PN}-dev +=3D "${datadir}/mesa/wayland-drm.xml"
-FILES:mesa-vulkan-drivers +=3D "${libdir}/libpvr_mesa_wsi.so"
-
-RRECOMMENDS:mesa-megadriver:append:class-target =3D " ${@d.getVar('PREFE=
RRED_PROVIDER_virtual/gpudriver')}"
diff --git a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-uml=
ibs_23.3.6512818.bb b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-=
rogue-umlibs_23.3.6512818.bb
deleted file mode 100644
index 5dc6c211..00000000
--- a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.=
3.6512818.bb
+++ /dev/null
@@ -1,147 +0,0 @@
-SUMMARY =3D "Userspace libraries for PowerVR Rogue GPU on TI SoCs"
-HOMEPAGE =3D "http://git.ti.com/graphics/ti-img-rogue-umlibs"
-LICENSE =3D "TI-TFL"
-LIC_FILES_CHKSUM =3D "file://git/LICENSE;md5=3D7232b98c1c58f99e3baa03de5=
207e76f"
-
-inherit bin_package
-
-INHIBIT_DEFAULT_DEPS =3D ""
-
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-COMPATIBLE_MACHINE =3D "j721e|j721s2|j784s4|am62xx|am62pxx|j722s"
-
-PR =3D "r3"
-
-BRANCH =3D "linuxws/kirkstone/k6.1/${PV}"
-SRC_URI =3D "git://git.ti.com/git/graphics/ti-img-rogue-umlibs.git;proto=
col=3Dhttps;branch=3D${BRANCH}"
-SRCREV =3D "0b9e64254269be2fa95c4f3e1dd925d6e4d58199"
-S:append =3D "/targetfs/${TARGET_PRODUCT}/${PVR_WS}/${PVR_BUILD}"
-
-TARGET_PRODUCT:j721e =3D "j721e_linux"
-TARGET_PRODUCT:j721s2 =3D "j721s2_linux"
-TARGET_PRODUCT:j784s4 =3D "j784s4_linux"
-TARGET_PRODUCT:am62xx =3D "am62_linux"
-TARGET_PRODUCT:am62pxx =3D "am62p_linux"
-TARGET_PRODUCT:j722s =3D "j722s_linux"
-PVR_BUILD =3D "release"
-PVR_WS =3D "lws-generic"
-
-RDEPENDS:${PN} =3D " \
-    libdrm \
-    ti-img-rogue-driver \
-    ${PN}-firmware \
-"
-
-PACKAGECONFIG ?=3D " \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'vulkan wayland', 'vulkan', =
'', d)} \
-    ${@bb.utils.filter('DISTRO_FEATURES', 'opengl opencl', d)} \
-"
-
-PACKAGECONFIG[opengl] =3D ",,,,${GLES_PACKAGES}"
-PACKAGECONFIG[vulkan] =3D ",,,,${VULKAN_PACKAGES}"
-PACKAGECONFIG[opencl] =3D ",,,,${OPENCL_PACKAGES}"
-
-def get_file_list(package_list_var, d):
-    file_list =3D []
-    package_list =3D d.getVar(package_list_var)
-    prefix =3D f"{d.getVar('D')}/"
-    if package_list:
-        for package in package_list.split():
-            package_file_string =3D d.getVar(f"FILES:{package}")
-            if package_file_string:
-                for package_file in package_file_string.split():
-                    file_list.append(f"{prefix}{package_file}")
-    return " ".join(file_list)
-
-do_install:append() {
-    if ${@bb.utils.contains('PACKAGECONFIG', 'opengl', 'false', 'true', =
d)}; then
-        for file in ${@get_file_list('GLES_PACKAGES',  d)}; do
-            rm -rf ${file}
-        done
-    fi
-    if ${@bb.utils.contains('PACKAGECONFIG', 'vulkan', 'false', 'true', =
d)}; then
-        for file in ${@get_file_list('VULKAN_PACKAGES', d)}; do
-            rm -rf ${file}
-        done
-    fi
-    if ${@bb.utils.contains('PACKAGECONFIG', 'opencl', 'false', 'true', =
d)}; then
-        for file in ${@get_file_list('OPENCL_PACKAGES', d)}; do
-            rm -rf ${file}
-        done
-    fi
-    if ${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', 'true', 'fals=
e', d)}; then
-        if [ -e ${D}/lib/firmware ]; then
-            mv ${D}/lib/firmware ${D}${nonarch_base_libdir}
-        fi
-    fi
-
-    # clean up any empty directories
-    find "${D}" -empty -type d -delete
-}
-
-GLES_PACKAGES =3D "libgles1-rogue libgles2-rogue libgles3-rogue"
-VULKAN_PACKAGES =3D "libvk-rogue"
-OPENCL_PACKAGES =3D "libopencl-rogue libopencl-rogue-tools"
-
-PACKAGES =3D " \
-    ${@bb.utils.contains('PACKAGECONFIG', 'opengl', d.getVar('GLES_PACKA=
GES'), '', d)} \
-    ${@bb.utils.contains('PACKAGECONFIG', 'vulkan', d.getVar('VULKAN_PAC=
KAGES'), '', d)} \
-    ${@bb.utils.contains('PACKAGECONFIG', 'opencl', d.getVar('OPENCL_PAC=
KAGES'), '', d)} \
-    ${PN}-tools \
-    ${PN}-firmware \
-    ${PN} \
-"
-
-# Inject variables so that packages don't get Debian-renamed (which woul=
d
-# remove the -rogue suffix), but don't RPROVIDEs/RCONFLICTs on the gener=
ic
-# libgl name to prevent colliding with swrast libs
-python __anonymous() {
-    suffix =3D ""
-    if "-native" in d.getVar("PN"):
-        suffix =3D "-native"
-    for p in (("vulkan", "libvk",),
-              ("gles", "libgles1", "libglesv1-cm1"),
-              ("gles", "libgles2", "libglesv2-2"),
-              ("gles", "libgles3",),
-              ("opencl", "libopencl",)):
-        mlprefix =3D d.getVar("MLPREFIX")
-        fullp =3D mlprefix + p[1] + "-rogue" + suffix
-        mlprefix =3D d.getVar("MLPREFIX")
-        pkgs =3D " " + " ".join(mlprefix + x + suffix for x in p[1:])
-        d.setVar("DEBIAN_NOAUTONAME:" + fullp, "1")
-        d.setVar("INSANE_SKIP:" + fullp, "dev-so ldflags")
-        d.appendVar("RRECOMMENDS:" + fullp, " ${MLPREFIX}ti-img-rogue-um=
libs" + suffix)
-}
-
-# gles specific shared objects
-FILES:libgles1-rogue =3D "${libdir}/libGLESv1*.so*"
-FILES:libgles2-rogue =3D "${libdir}/libGLESv2*.so*"
-RDEPENDS:libgles1-rogue +=3D "mesa-megadriver"
-RDEPENDS:libgles2-rogue +=3D "mesa-megadriver"
-
-# vulkan specific shared objects and configs
-FILES:libvk-rogue =3D "${libdir}/libVK_IMG.so* ${datadir}/vulkan"
-RDEPENDS:libvk-rogue +=3D "vulkan-loader wayland libdrm"
-
-# opencl specific shared objects and configs
-FILES:libopencl-rogue =3D "${libdir}/libPVROCL.so* ${sysconfdir}/OpenCL"
-RDEPENDS:libopencl-rogue +=3D "opencl-icd-loader"
-RRECOMMENDS:libopencl-rogue +=3D "libopencl-rogue-tools"
-FILES:libopencl-rogue-tools +=3D "${bindir}/ocl*"
-DEBIAN_NOAUTONAME:libopencl-rogue-tools =3D "1"
-INSANE_SKIP:libopencl-rogue-tools =3D "ldflags"
-
-# optional tools and tests
-FILES:${PN}-tools =3D "${bindir}/"
-RDEPENDS:${PN}-tools =3D "python3-core ${PN}"
-INSANE_SKIP:${PN}-tools =3D "ldflags"
-
-# required firmware
-FILES:${PN}-firmware =3D "${base_libdir}/firmware/*"
-INSANE_SKIP:${PN}-firmware +=3D "arch"
-
-RRECOMMENDS:${PN} +=3D " \
-    ${PN}-tools \
-"
-
-INSANE_SKIP:${PN} +=3D "already-stripped dev-so ldflags"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.1/defcon=
fig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.1/defconfig
deleted file mode 100644
index 24b53cf7..00000000
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.1/defconfig
+++ /dev/null
@@ -1,2 +0,0 @@
-use-kernel-config=3Dmulti_v7_defconfig
-config-fragment=3Dkernel/configs/ti_multi_v7_prune.config
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.1/k3/def=
config b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.1/k3/defconf=
ig
deleted file mode 100644
index ef1d3efd..00000000
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.1/k3/defconfig
+++ /dev/null
@@ -1,2 +0,0 @@
-use-kernel-config=3Ddefconfig
-config-fragment=3Dkernel/configs/ti_arm64_prune.config
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.1/omapl1=
38/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.1/omap=
l138/defconfig
deleted file mode 100644
index 099493af..00000000
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.1/omapl138/defc=
onfig
+++ /dev/null
@@ -1 +0,0 @@
-use-kernel-config=3Ddavinci_all_defconfig
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.1/ti33x/=
defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.1/ti33x/d=
efconfig
deleted file mode 100644
index e6a967e1..00000000
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.1/ti33x/defconf=
ig
+++ /dev/null
@@ -1,2 +0,0 @@
-use-kernel-config=3Dmulti_v7_defconfig
-config-fragment=3Dkernel/configs/ti_multi_v7_prune.config kernel/configs=
/no_smp.config
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.1/ti43x/=
defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.1/ti43x/d=
efconfig
deleted file mode 100644
index e6a967e1..00000000
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.1/ti43x/defconf=
ig
+++ /dev/null
@@ -1,2 +0,0 @@
-use-kernel-config=3Dmulti_v7_defconfig
-config-fragment=3Dkernel/configs/ti_multi_v7_prune.config kernel/configs=
/no_smp.config
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.1/def=
config b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.1/defconf=
ig
deleted file mode 100644
index 43089dc8..00000000
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.1/defconfig
+++ /dev/null
@@ -1,2 +0,0 @@
-use-kernel-config=3Dmulti_v7_defconfig
-config-fragment=3Dkernel/configs/ti_multi_v7_prune.config kernel/configs=
/ti_rt.config
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.1/k3/=
defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.1/k3/d=
efconfig
deleted file mode 100644
index 47d78664..00000000
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.1/k3/defconf=
ig
+++ /dev/null
@@ -1,2 +0,0 @@
-use-kernel-config=3Ddefconfig
-config-fragment=3Dkernel/configs/ti_arm64_prune.config kernel/configs/ti=
_rt.config
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.1/oma=
pl138/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.=
1/omapl138/defconfig
deleted file mode 100644
index 2c829c0b..00000000
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.1/omapl138/d=
efconfig
+++ /dev/null
@@ -1,2 +0,0 @@
-use-kernel-config=3Ddavinci_all_defconfig
-config-fragment=3Dkernel/configs/ti_rt.config
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.1/ti3=
3x/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.1/t=
i33x/defconfig
deleted file mode 100644
index 5de2b229..00000000
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.1/ti33x/defc=
onfig
+++ /dev/null
@@ -1,2 +0,0 @@
-use-kernel-config=3Dmulti_v7_defconfig
-config-fragment=3Dkernel/configs/ti_multi_v7_prune.config kernel/configs=
/ti_rt.config kernel/configs/no_smp.config
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.1/ti4=
3x/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.1/t=
i43x/defconfig
deleted file mode 100644
index 5de2b229..00000000
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.1/ti43x/defc=
onfig
+++ /dev/null
@@ -1,2 +0,0 @@
-use-kernel-config=3Dmulti_v7_defconfig
-config-fragment=3Dkernel/configs/ti_multi_v7_prune.config kernel/configs=
/ti_rt.config kernel/configs/no_smp.config
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.1.bb =
b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.1.bb
deleted file mode 100644
index 9fe0eb02..00000000
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.1.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-require linux-ti-staging_6.1.bb
-
-KERNEL_LOCALVERSION:append =3D "-rt"
-
-# Look in the generic major.minor directory for files
-# This will have priority over generic non-rt path
-FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}-6.1:"
-
-BRANCH =3D "ti-rt-linux-6.1.y"
-
-SRCREV =3D "9e8992fb839c642e3c20ee8ce69a30dbaae7f498"
-
-include ${@ 'recipes-kernel/linux/ti-extras-rt.inc' if d.getVar('TI_EXTR=
AS') else ''}
-
-PV =3D "6.1.119+git"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb b/m=
eta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
deleted file mode 100644
index ac034c2c..00000000
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
+++ /dev/null
@@ -1,33 +0,0 @@
-SECTION =3D "kernel"
-SUMMARY =3D "Linux kernel for TI devices"
-LICENSE =3D "GPL-2.0-only"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6bc538ed5bd9a7fc9398086aedcd7=
e46"
-
-inherit ti-secdev
-inherit kernel
-
-require recipes-kernel/linux/setup-defconfig.inc
-require recipes-kernel/linux/ti-kernel.inc
-include ${@ 'recipes-kernel/linux/ti-kernel-devicetree-prefix.inc' if d.=
getVar('KERNEL_DEVICETREE_PREFIX') else ''}
-include ${@ 'recipes-kernel/linux/ti-extras.inc' if d.getVar('TI_EXTRAS'=
) else ''}
-
-DEPENDS +=3D "gmp-native libmpc-native"
-
-# Look in the generic major.minor directory for files
-FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}-6.1:"
-
-KERNEL_EXTRA_ARGS +=3D "LOADADDR=3D${UBOOT_ENTRYPOINT} \
-		      ${EXTRA_DTC_ARGS}"
-
-S =3D "${UNPACKDIR}/${BB_GIT_DEFAULT_DESTSUFFIX}"
-
-BRANCH ?=3D "ti-linux-6.1.y"
-
-SRCREV ?=3D "e4e8b16e66f592749984b2d287e0479e93ef35b3"
-PV =3D "6.1.119+git"
-
-# Special configuration for remoteproc/rpmsg IPC modules
-module_conf_rpmsg_client_sample =3D "blacklist rpmsg_client_sample"
-module_conf_ti_k3_r5_remoteproc =3D "softdep ti_k3_r5_remoteproc pre: vi=
rtio_rpmsg_bus"
-module_conf_ti_k3_dsp_remoteproc =3D "softdep ti_k3_dsp_remoteproc pre: =
virtio_rpmsg_bus"
-KERNEL_MODULE_PROBECONF +=3D "rpmsg_client_sample ti_k3_r5_remoteproc ti=
_k3_dsp_remoteproc"
--=20
2.35.3


