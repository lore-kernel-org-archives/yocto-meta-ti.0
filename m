Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 453FDC77B7F
	for <webhook@archiver.kernel.org>; Fri, 27 Jun 2025 19:24:59 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.1430.1751052297445234191
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 27 Jun 2025 12:24:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=CUWDulg7;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: afd@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55RJOuDl2820354;
	Fri, 27 Jun 2025 14:24:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1751052296;
	bh=wCTOt7IwPQAomCp2+xxOtwf4n/JnGNV3VtZVv1cAvQA=;
	h=From:To:CC:Subject:Date;
	b=CUWDulg7+PtF2UFpP3pWHM/cSAQc371C9vxaL0Qmii3rPpl3VAFCa8LaSKmT2X6I6
	 e29kHzZU/uMz0Buh+9zaRNHFh78a/ZyHRUnoMTAxlCOJIjl40JJduJYRnEhkqv4GVh
	 QJyu8AP1gSPq9l2SwCldEAxnbMhmA+ic36WM9D4Y=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55RJOueQ3526595
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 27 Jun 2025 14:24:56 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 27
 Jun 2025 14:24:55 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 27 Jun 2025 14:24:55 -0500
Received: from lelvem-mr05.itg.ti.com ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55RJOt1Z3323523;
	Fri, 27 Jun 2025 14:24:55 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][scarthgap/master][PATCH 1/3] meta-ti: Remove bsp-ti-6_1 and bsp-bb_org-6_1 support
Date: Fri, 27 Jun 2025 14:24:52 -0500
Message-ID: <20250627192454.575458-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 27 Jun 2025 19:24:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18706

Remove support for the v6.1 TI and Beagle BSPs. This was originally
split into meta-ti-bsp and meta-beagle changes, but there are some
hidden interdependencies that made that more painful than needed.
Remove v6.1 support from both BSP layers here.

This includes packages specific to those BSPs:
 - TI and BB.org v6.1 Linux kernel
 - TI and BB.org 2023.04 U-Boot
 - Rogue GPU driver 23.3 and Mesa 22.3.5

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-beagle/conf/machine/beagle-x15.conf      |   2 -
 .../conf/machine/beaglebone-ai64-k3r5.conf    |   6 -
 meta-beagle/conf/machine/beaglebone-ai64.conf |  25 ---
 meta-beagle/conf/machine/beaglebone.conf      |   2 -
 meta-beagle/conf/machine/beagleplay-k3r5.conf |   4 -
 meta-beagle/conf/machine/beagleplay.conf      |  41 -----
 meta-beagle/conf/machine/beagley-ai-k3r5.conf |   2 -
 meta-beagle/conf/machine/beagley-ai.conf      |   7 -
 .../conf/machine/include/beagle-bsp.inc       |  22 ---
 .../u-boot/u-boot-bb.org_2023.04.bb           |  22 ---
 .../linux/linux-bb.org-6.1/defconfig          |   1 -
 .../recipes-kernel/linux/linux-bb.org_6.1.bb  |  68 --------
 meta-ti-bsp/conf/machine/am62pxx-evm.conf     |   2 -
 .../conf/machine/am62xxsip-evm-k3r5.conf      |   5 -
 meta-ti-bsp/conf/machine/am62xxsip-evm.conf   |   5 -
 .../conf/machine/beagleplay-ti-k3r5.conf      |   3 -
 meta-ti-bsp/conf/machine/beagleplay-ti.conf   |   3 -
 meta-ti-bsp/conf/machine/include/j721e.inc    |   1 -
 meta-ti-bsp/conf/machine/include/ti-bsp.inc   |  22 +--
 .../ti-img-rogue-driver_23.3.6512818.bb       |  39 -----
 .../u-boot/u-boot-ti-staging_2023.04.bb       |   9 --
 ...lude-of-Host-h-moved-to-TargetParser.patch |  64 --------
 ...t-usage-of-LLVMContextSetOpaquePoint.patch | 128 ---------------
 ...e-unsigned-instead-of-uint-to-fix-mu.patch |  43 -----
 .../0001-gallium-Fix-build-with-llvm-17.patch |  58 -------
 ...allium-Fix-build-with-llvm-18-and-19.patch |  52 -------
 ...-backend-fix-gbm-compile-without-dri.patch |  64 --------
 ...sdetects-64bit-atomics-on-mips-clang.patch |  25 ---
 ...k-for-all-linux-host_os-combinations.patch |  43 -----
 ...ormat-Check-for-NEON-before-using-it.patch |  47 ------
 .../recipes-graphics/mesa/mesa-pvr_22.3.5.bb  |  62 --------
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
 delete mode 100644 meta-beagle/recipes-bsp/u-boot/u-boot-bb.org_2023.04.bb
 delete mode 100644 meta-beagle/recipes-kernel/linux/linux-bb.org-6.1/defconfig
 delete mode 100644 meta-beagle/recipes-kernel/linux/linux-bb.org_6.1.bb
 delete mode 100644 meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.3.6512818.bb
 delete mode 100644 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb
 delete mode 100644 meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-22.3.5/0001-fix-gallivm-fix-LLVM-include-of-Host-h-moved-to-TargetParser.patch
 delete mode 100644 meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-22.3.5/0001-fix-gallivm-limit-usage-of-LLVMContextSetOpaquePoint.patch
 delete mode 100644 meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-22.3.5/0001-freedreno-pm4-Use-unsigned-instead-of-uint-to-fix-mu.patch
 delete mode 100644 meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-22.3.5/0001-gallium-Fix-build-with-llvm-17.patch
 delete mode 100644 meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-22.3.5/0001-gallium-Fix-build-with-llvm-18-and-19.patch
 delete mode 100644 meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-22.3.5/0001-gbm-backend-fix-gbm-compile-without-dri.patch
 delete mode 100644 meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-22.3.5/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch
 delete mode 100644 meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-22.3.5/0001-meson.build-check-for-all-linux-host_os-combinations.patch
 delete mode 100644 meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-22.3.5/0001-util-format-Check-for-NEON-before-using-it.patch
 delete mode 100644 meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_22.3.5.bb
 delete mode 100644 meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.3.6512818.bb
 delete mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.1/defconfig
 delete mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.1/k3/defconfig
 delete mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.1/omapl138/defconfig
 delete mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.1/ti33x/defconfig
 delete mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.1/ti43x/defconfig
 delete mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.1/defconfig
 delete mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.1/k3/defconfig
 delete mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.1/omapl138/defconfig
 delete mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.1/ti33x/defconfig
 delete mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.1/ti43x/defconfig
 delete mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.1.bb
 delete mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb

diff --git a/meta-beagle/conf/machine/beagle-x15.conf b/meta-beagle/conf/machine/beagle-x15.conf
index 8ad028f4..44e0daf6 100644
--- a/meta-beagle/conf/machine/beagle-x15.conf
+++ b/meta-beagle/conf/machine/beagle-x15.conf
@@ -6,8 +6,6 @@ require conf/machine/include/am57xx.inc
 require conf/machine/include/beagle-bsp.inc
 
 DT_VENDOR_PREFIX = "ti/omap/"
-DT_VENDOR_PREFIX:bsp-ti-6_1 = ""
-DT_VENDOR_PREFIX:bsp-bb_org-6_1 = ""
 
 KERNEL_DEVICETREE_PREFIX = " \
 ${DT_VENDOR_PREFIX}am57xx-beagle-x15 \
diff --git a/meta-beagle/conf/machine/beaglebone-ai64-k3r5.conf b/meta-beagle/conf/machine/beaglebone-ai64-k3r5.conf
index 4574f82b..1bdfd7a1 100644
--- a/meta-beagle/conf/machine/beaglebone-ai64-k3r5.conf
+++ b/meta-beagle/conf/machine/beaglebone-ai64-k3r5.conf
@@ -16,9 +16,3 @@ UBOOT_IMAGE = "tiboot3-${MAINMACHINE}-${PV}-${PR}.${UBOOT_SUFFIX}"
 UBOOT_SYMLINK = "tiboot3-${MAINMACHINE}.${UBOOT_SUFFIX}"
 
 UBOOT_MACHINE = "j721e_beagleboneai64_r5_defconfig"
-
-UBOOT_MACHINE:bsp-ti-6_1 = "j721e_evm_r5_defconfig"
-UBOOT_CONFIG_FRAGMENTS:bsp-ti-6_1 = "j721e_beagleboneai64_r5.config"
-
-UBOOT_MACHINE:bsp-bb_org-6_1 = "j721e_evm_r5_defconfig"
-UBOOT_CONFIG_FRAGMENTS:bsp-bb_org-6_1 = "j721e_beagleboneai64_r5.config"
diff --git a/meta-beagle/conf/machine/beaglebone-ai64.conf b/meta-beagle/conf/machine/beaglebone-ai64.conf
index c7d72590..3da6e878 100644
--- a/meta-beagle/conf/machine/beaglebone-ai64.conf
+++ b/meta-beagle/conf/machine/beaglebone-ai64.conf
@@ -12,12 +12,6 @@ IMAGE_SR2_HS_SE_FILES = ""
 
 UBOOT_MACHINE = "j721e_beagleboneai64_a72_defconfig"
 
-UBOOT_MACHINE:bsp-ti-6_1 = "j721e_evm_a72_config"
-UBOOT_CONFIG_FRAGMENTS:bsp-ti-6_1 = "j721e_beagleboneai64_a72.config"
-
-UBOOT_MACHINE:bsp-bb_org-6_1 = "j721e_evm_a72_config"
-UBOOT_CONFIG_FRAGMENTS:bsp-bb_org-6_1 = "j721e_beagleboneai64_a72.config"
-
 SPL_BINARY = "tispl.bin_unsigned"
 
 KERNEL_DEVICETREE_PREFIX = " \
@@ -32,23 +26,4 @@ ti/k3-j721e-evm-quad-port-eth-exp.dtbo \
 ti/k3-j721e-sk.dtb \
 "
 
-KERNEL_DEVICETREE:append:bsp-bb_org-6_1 = " \
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
 MACHINE_GUI_CLASS = "bigscreen"
-
-# TI has moved a driver out of its kernel tree and into an out of tree module.
-# We need to not include that for older kernels since the module is still in
-# the kernel.
-TI_VXE_VXD_DRIVER:bsp-bb_org-6_6 = ""
-TI_VXE_VXD_DRIVER:bsp-bb_org-6_1 = ""
diff --git a/meta-beagle/conf/machine/beaglebone.conf b/meta-beagle/conf/machine/beaglebone.conf
index 456da618..a4d11afe 100644
--- a/meta-beagle/conf/machine/beaglebone.conf
+++ b/meta-beagle/conf/machine/beaglebone.conf
@@ -6,8 +6,6 @@ require conf/machine/include/ti33x.inc
 require conf/machine/include/beagle-bsp.inc
 
 DT_VENDOR_PREFIX = "ti/omap/"
-DT_VENDOR_PREFIX:bsp-ti-6_1 = ""
-DT_VENDOR_PREFIX:bsp-bb_org-6_1 = ""
 
 KERNEL_DEVICETREE_PREFIX = " \
 ${DT_VENDOR_PREFIX}am335x-bone \
diff --git a/meta-beagle/conf/machine/beagleplay-k3r5.conf b/meta-beagle/conf/machine/beagleplay-k3r5.conf
index f053c11e..ea4c5160 100644
--- a/meta-beagle/conf/machine/beagleplay-k3r5.conf
+++ b/meta-beagle/conf/machine/beagleplay-k3r5.conf
@@ -5,7 +5,3 @@
 require conf/machine/beagleplay-ti-k3r5.conf
 
 require conf/machine/include/beagle-bsp.inc
-
-UBOOT_MACHINE:bsp-bb_org-6_1 = "am62x_evm_r5_defconfig"
-
-UBOOT_CONFIG_FRAGMENTS:bsp-bb_org-6_1 = "am625_beagleplay_r5.config"
diff --git a/meta-beagle/conf/machine/beagleplay.conf b/meta-beagle/conf/machine/beagleplay.conf
index bc0de3f0..87d4942e 100644
--- a/meta-beagle/conf/machine/beagleplay.conf
+++ b/meta-beagle/conf/machine/beagleplay.conf
@@ -6,47 +6,6 @@ require conf/machine/beagleplay-ti.conf
 
 require conf/machine/include/beagle-bsp.inc
 
-UBOOT_MACHINE:bsp-bb_org-6_1 = "am62x_evm_a53_defconfig"
-
-UBOOT_CONFIG_FRAGMENTS:bsp-bb_org-6_1 = "am625_beagleplay_a53.config"
-
-KERNEL_DEVICETREE:append:bsp-bb_org-6_1 = " \
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
 KERNEL_DEVICETREE:append:bsp-bb_org-6_6 = " \
 ti/k3-am625-beagleplay-csi2-ov5640.dtbo \
 ti/k3-am625-beagleplay-csi2-tevi-ov5640.dtbo \
diff --git a/meta-beagle/conf/machine/beagley-ai-k3r5.conf b/meta-beagle/conf/machine/beagley-ai-k3r5.conf
index 8d5111f0..07198f2e 100644
--- a/meta-beagle/conf/machine/beagley-ai-k3r5.conf
+++ b/meta-beagle/conf/machine/beagley-ai-k3r5.conf
@@ -11,5 +11,3 @@ SYSFW_SUFFIX = "hs-fs"
 
 UBOOT_MACHINE = "j722s_evm_r5_defconfig"
 UBOOT_MACHINE:bsp-bb_org-6_12 = "am67a_beagley_ai_r5_defconfig"
-
-UBOOT_CONFIG_FRAGMENTS:bsp-bb_org-6_1 = "am67a_beagley_ai_r5.config"
diff --git a/meta-beagle/conf/machine/beagley-ai.conf b/meta-beagle/conf/machine/beagley-ai.conf
index 497001ee..9e9e33b6 100644
--- a/meta-beagle/conf/machine/beagley-ai.conf
+++ b/meta-beagle/conf/machine/beagley-ai.conf
@@ -8,19 +8,12 @@ require conf/machine/include/beagle-bsp.inc
 UBOOT_MACHINE = "j722s_evm_a53_config"
 UBOOT_MACHINE:bsp-bb_org-6_12 = "am67a_beagley_ai_a53_defconfig"
 
-UBOOT_CONFIG_FRAGMENTS:bsp-bb_org-6_1 = "am67a_beagley_ai_a53.config"
-
 KERNEL_DEVICETREE_PREFIX = " \
     ti/k3-j722s \
 "
 
 KERNEL_DEVICETREE = ""
 
-KERNEL_DEVICETREE:append:bsp-bb_org-6_1 = " \
-ti/k3-j722s-evm.dtb \
-ti/k3-am67a-beagley-ai.dtb \
-"
-
 KERNEL_DEVICETREE:append:bsp-bb_org-6_12 = " \
 ti/k3-j722s-evm.dtb \
 ti/k3-am67a-beagley-ai.dtb \
diff --git a/meta-beagle/conf/machine/include/beagle-bsp.inc b/meta-beagle/conf/machine/include/beagle-bsp.inc
index 7dff583e..f8b94487 100644
--- a/meta-beagle/conf/machine/include/beagle-bsp.inc
+++ b/meta-beagle/conf/machine/include/beagle-bsp.inc
@@ -47,25 +47,3 @@ BSP_MESA_PVR_VERSION:bsp-bb_org-6_6 = "24%"
 
 # GC320 support requires out-of-tree drivers not yet available in bb.org 6.6
 MACHINE_FEATURES:remove:bsp-bb_org-6_6 = "gc320"
-
-# ==========
-# bb_org-6_1
-# BeagleBoard.org kernel 6.1, u-boot 2023.04
-# based on TI staging trees with extra Beagle-specific features
-# but may not be up-to-date with TI version
-# ==========
-BSP_KERNEL_PROVIDER:bsp-bb_org-6_1 = "linux-bb.org"
-BSP_KERNEL_VERSION:bsp-bb_org-6_1 = "6.1.%"
-BSP_BOOTLOADER_PROVIDER:bsp-bb_org-6_1 = "u-boot-bb.org"
-BSP_BOOTLOADER_VERSION:bsp-bb_org-6_1 = "2023.%"
-
-BSP_SGX_DRIVER_PROVIDER:bsp-bb_org-6_1 = "ti-sgx-ddk-km"
-BSP_SGX_DRIVER_VERSION:bsp-bb_org-6_1 = "1.17%"
-BSP_SGX_UMLIBS_VERSION:bsp-bb_org-6_1 = "1.17%"
-BSP_ROGUE_DRIVER_PROVIDER:bsp-bb_org-6_1 = "ti-img-rogue-driver"
-BSP_ROGUE_DRIVER_VERSION:bsp-bb_org-6_1 = "23%"
-BSP_ROGUE_UMLIBS_VERSION:bsp-bb_org-6_1 = "23%"
-BSP_MESA_PVR_VERSION:bsp-bb_org-6_1 = "22%"
-
-# GC320 support requires out-of-tree drivers not yet available in bb.org 6.1
-MACHINE_FEATURES:remove:bsp-bb_org-6_1 = "gc320"
diff --git a/meta-beagle/recipes-bsp/u-boot/u-boot-bb.org_2023.04.bb b/meta-beagle/recipes-bsp/u-boot/u-boot-bb.org_2023.04.bb
deleted file mode 100644
index 8e14c495..00000000
--- a/meta-beagle/recipes-bsp/u-boot/u-boot-bb.org_2023.04.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-require recipes-bsp/u-boot/u-boot-ti.inc
-
-SUMMARY = "BeagleBoard.org U-Boot"
-
-COMPATIBLE_MACHINE = "beagle.*"
-
-PV = "2023.04"
-
-UBOOT_GIT_URI = "git://github.com/beagleboard/u-boot.git"
-UBOOT_GIT_PROTOCOL = "https"
-BRANCH = "v2023.04-ti-09.01.00.008"
-SRCREV = "b0d717b732ee28e446baf94522b3491e590f7fbb"
-
-BRANCH:beagleplay = "v2023.04-ti-09.01.00.008-BeaglePlay"
-BRANCH:beagleplay-k3r5 = "v2023.04-ti-09.01.00.008-BeaglePlay"
-SRCREV:beagleplay = "43791d945f4e5c25bcc19b9c778e8f9d194dc16e"
-SRCREV:beagleplay-k3r5 = "43791d945f4e5c25bcc19b9c778e8f9d194dc16e"
-
-BRANCH:beagley-ai = "v2023.04-ti-09.02.00.009-BeagleY-AI-Production"
-BRANCH:beagley-ai-k3r5 = "v2023.04-ti-09.02.00.009-BeagleY-AI-Production"
-SRCREV:beagley-ai = "93735daa6fe024304934d5a5e93ab05a06abf1a8"
-SRCREV:beagley-ai-k3r5 = "93735daa6fe024304934d5a5e93ab05a06abf1a8"
diff --git a/meta-beagle/recipes-kernel/linux/linux-bb.org-6.1/defconfig b/meta-beagle/recipes-kernel/linux/linux-bb.org-6.1/defconfig
deleted file mode 100644
index a5de2e24..00000000
--- a/meta-beagle/recipes-kernel/linux/linux-bb.org-6.1/defconfig
+++ /dev/null
@@ -1 +0,0 @@
-use-kernel-config=bb.org_defconfig
diff --git a/meta-beagle/recipes-kernel/linux/linux-bb.org_6.1.bb b/meta-beagle/recipes-kernel/linux/linux-bb.org_6.1.bb
deleted file mode 100644
index 063bcac3..00000000
--- a/meta-beagle/recipes-kernel/linux/linux-bb.org_6.1.bb
+++ /dev/null
@@ -1,68 +0,0 @@
-# Look in the generic major.minor directory for files
-FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}-6.1:"
-
-SECTION = "kernel"
-SUMMARY = "BeagleBoard.org Linux kernel"
-LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-
-COMPATIBLE_MACHINE = "beagle.*"
-
-inherit kernel
-
-require recipes-kernel/linux/setup-defconfig.inc
-require recipes-kernel/linux/ti-kernel.inc
-
-DEPENDS += "gmp-native libmpc-native"
-
-KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT} ${EXTRA_DTC_ARGS}"
-
-# Extra DT overlays/capes
-KERNEL_DEVICETREE:append:armv7a = " \
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
-S = "${WORKDIR}/git"
-
-# 6.1.83 version for 32-bit
-SRCREV:armv7a = "be9b910b08dfd674e47a2643f35080b005ac3792"
-PV:armv7a = "6.1.83+git"
-BRANCH:armv7a = "v6.1.83-ti-r35"
-
-# 6.1.83 version for 64-bit
-SRCREV:aarch64 = "135558243d5a98ed39812b797d2ba6295ef3b86a"
-PV:aarch64 = "6.1.83+git"
-BRANCH:aarch64 = "v6.1.83-ti-arm64-r64"
-
-KERNEL_GIT_URI = "git://github.com/beagleboard/linux.git"
diff --git a/meta-ti-bsp/conf/machine/am62pxx-evm.conf b/meta-ti-bsp/conf/machine/am62pxx-evm.conf
index 09f0d1fb..9ab9cb1b 100644
--- a/meta-ti-bsp/conf/machine/am62pxx-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62pxx-evm.conf
@@ -31,5 +31,3 @@ UBOOT_MACHINE = "am62px_evm_a53_defconfig"
 # For AM62P tisdk-display-cluster image, splash screen is handled by SBL.
 # Hence, disable the A53 based splash screen using the am62x_evm_prune_splashscreen.config fragment present in ti-u-boot tree
 UBOOT_CONFIG_FRAGMENTS = "${@oe.utils.conditional('DISPLAY_CLUSTER_ENABLE', '1', 'am62x_evm_prune_splashscreen.config', '', d)}"
-
-UBOOT_CONFIG_FRAGMENTS:bsp-ti-6_1 = "${@oe.utils.conditional('DISPLAY_CLUSTER_ENABLE', '1', 'am62px_evm_prune_splashscreen.config', '', d)}"
diff --git a/meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf b/meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf
index 2fd0cb54..e846c0da 100644
--- a/meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf
@@ -9,9 +9,4 @@ SYSFW_CONFIG = "evm"
 SYSFW_SUFFIX = "hs-fs"
 
 UBOOT_MACHINE = "am6254xxl_evm_r5_defconfig"
-
 UBOOT_MACHINE:bsp-ti-6_6 = "am62xsip_evm_r5_defconfig"
-
-UBOOT_MACHINE:bsp-ti-6_1 = "am62x_evm_r5_defconfig"
-
-UBOOT_CONFIG_FRAGMENTS:bsp-ti-6_1 = "am62xsip_sk_r5.config"
diff --git a/meta-ti-bsp/conf/machine/am62xxsip-evm.conf b/meta-ti-bsp/conf/machine/am62xxsip-evm.conf
index a506385e..a9adbec0 100644
--- a/meta-ti-bsp/conf/machine/am62xxsip-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62xxsip-evm.conf
@@ -6,15 +6,12 @@ require conf/machine/include/am62xx.inc
 
 TFA_K3_BL32_BASE = "0x80080000"
 TFA_K3_BL32_BASE:bsp-ti-6_6 = ""
-TFA_K3_BL32_BASE:bsp-ti-6_1 = ""
 
 TFA_K3_PRELOADED_BL33 = "0x82000000"
 TFA_K3_PRELOADED_BL33:bsp-ti-6_6 = ""
-TFA_K3_PRELOADED_BL33:bsp-ti-6_1 = ""
 
 OPTEE_K3_TZDRAM_START = "0x80080000"
 OPTEE_K3_TZDRAM_START:bsp-ti-6_6 = ""
-OPTEE_K3_TZDRAM_START:bsp-ti-6_1 = ""
 
 KERNEL_DEVICETREE_PREFIX = " \
     ti/k3-am625 \
@@ -27,8 +24,6 @@ KERNEL_DEVICETREE = " \
 
 FIT_CONF_DEFAULT_DTB = "ti/k3-am6254xxl-sk.dtb"
 FIT_CONF_DEFAULT_DTB:bsp-ti-6_6 = "ti/k3-am625-sk.dtb"
-FIT_CONF_DEFAULT_DTB:bsp-ti-6_1 = "ti/k3-am625-sk.dtb"
 
 UBOOT_MACHINE = "am6254xxl_evm_a53_defconfig"
 UBOOT_MACHINE:bsp-ti-6_6 = "am62xsip_evm_a53_defconfig"
-UBOOT_MACHINE:bsp-ti-6_1 = "am62x_evm_a53_defconfig"
diff --git a/meta-ti-bsp/conf/machine/beagleplay-ti-k3r5.conf b/meta-ti-bsp/conf/machine/beagleplay-ti-k3r5.conf
index 72dc145b..b597c702 100644
--- a/meta-ti-bsp/conf/machine/beagleplay-ti-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/beagleplay-ti-k3r5.conf
@@ -9,6 +9,3 @@ SYSFW_CONFIG = "evm"
 SYSFW_SUFFIX = "gp"
 
 UBOOT_MACHINE = "am62x_beagleplay_r5_defconfig"
-UBOOT_MACHINE:bsp-ti-6_1 = "am62x_evm_r5_defconfig"
-
-UBOOT_CONFIG_FRAGMENTS:bsp-ti-6_1 = "am625_beagleplay_r5.config"
diff --git a/meta-ti-bsp/conf/machine/beagleplay-ti.conf b/meta-ti-bsp/conf/machine/beagleplay-ti.conf
index 3824d867..792c91b2 100644
--- a/meta-ti-bsp/conf/machine/beagleplay-ti.conf
+++ b/meta-ti-bsp/conf/machine/beagleplay-ti.conf
@@ -20,9 +20,6 @@ TFA_K3_SYSTEM_SUSPEND = "1"
 OPTEEMACHINE = "k3-am62x"
 
 UBOOT_MACHINE = "am62x_beagleplay_a53_defconfig"
-UBOOT_MACHINE:bsp-ti-6_1 = "am62x_evm_a53_defconfig"
-
-UBOOT_CONFIG_FRAGMENTS:bsp-ti-6_1 = "am625_beagleplay_a53.config"
 
 SPL_BINARY = "tispl.bin_unsigned"
 
diff --git a/meta-ti-bsp/conf/machine/include/j721e.inc b/meta-ti-bsp/conf/machine/include/j721e.inc
index 30aa2a69..5833c322 100644
--- a/meta-ti-bsp/conf/machine/include/j721e.inc
+++ b/meta-ti-bsp/conf/machine/include/j721e.inc
@@ -38,6 +38,5 @@ OPTEEMACHINE = "k3-j721e"
 
 TI_VXE_VXD_DRIVER = "ti-vxe-vxd-driver"
 TI_VXE_VXD_DRIVER:bsp-ti-6_6 = ""
-TI_VXE_VXD_DRIVER:bsp-ti-6_1 = ""
 
 MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "cadence-mhdp-fw vxd-dec-fw ti-eth-fw-j721e ${TI_VXE_VXD_DRIVER}"
diff --git a/meta-ti-bsp/conf/machine/include/ti-bsp.inc b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
index 054aa6cb..262aa884 100644
--- a/meta-ti-bsp/conf/machine/include/ti-bsp.inc
+++ b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
@@ -3,7 +3,7 @@
 # preferences for kernel, bootloader and graphics components, as
 # well as a dedicated machine override.
 
-# Supported options are: mainline, next, ti-6_12, ti-6_6, ti-6_1
+# Supported options are: mainline, next, ti-6_12, ti-6_6
 TI_PREFERRED_BSP ??= "ti-6_12"
 
 # Use bsp-* namespace for overrides
@@ -78,26 +78,6 @@ BSP_MESA_PVR_VERSION:bsp-ti-6_6 = "24%"
 # GC320 support requires out-of-tree drivers not yet available in 6.6
 MACHINE_FEATURES:remove:bsp-ti-6_6 = "gc320"
 
-# ==========
-# ti-6_1
-# TI staging kernel 6.1, u-boot 2023.04
-# ==========
-BSP_KERNEL_PROVIDER:bsp-ti-6_1 = "linux-ti-staging"
-BSP_KERNEL_VERSION:bsp-ti-6_1 = "6.1.%"
-BSP_BOOTLOADER_PROVIDER:bsp-ti-6_1 = "u-boot-ti-staging"
-BSP_BOOTLOADER_VERSION:bsp-ti-6_1 = "2023.04%"
-
-BSP_SGX_DRIVER_PROVIDER:bsp-ti-6_1 = "ti-sgx-ddk-km"
-BSP_SGX_DRIVER_VERSION:bsp-ti-6_1 = "1.17%"
-BSP_SGX_UMLIBS_VERSION:bsp-ti-6_1 = "1.17%"
-BSP_ROGUE_DRIVER_PROVIDER:bsp-ti-6_1 = "ti-img-rogue-driver"
-BSP_ROGUE_DRIVER_VERSION:bsp-ti-6_1 = "23%"
-BSP_ROGUE_UMLIBS_VERSION:bsp-ti-6_1 = "23%"
-BSP_MESA_PVR_VERSION:bsp-ti-6_1 = "22%"
-
-# GC320 support requires out-of-tree drivers not yet available in 6.1
-MACHINE_FEATURES:remove:bsp-ti-6_1 = "gc320"
-
 # ==========
 # sane fallback defaults
 # if specific values are not defined or bsp is set incorrectly
diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.3.6512818.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.3.6512818.bb
deleted file mode 100644
index dc55ef9b..00000000
--- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.3.6512818.bb
+++ /dev/null
@@ -1,39 +0,0 @@
-SUMMARY =  "Kernel drivers for the PowerVR Rogue GPU found in the TI SoCs"
-HOMEPAGE = "http://git.ti.com/graphics/ti-img-rogue-driver"
-LICENSE = "MIT | GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://README;beginline=14;endline=19;md5=0403c7dea01a2b8232261e805325fac2"
-
-inherit module
-
-PROVIDES = "virtual/gpudriver"
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-COMPATIBLE_MACHINE = "j721e|j721s2|j784s4|am62xx|am62pxx|j722s"
-
-DEPENDS = "virtual/kernel"
-
-BRANCH = "linuxws/kirkstone/k6.1/${PV}"
-
-SRC_URI = "git://git.ti.com/git/graphics/ti-img-rogue-driver.git;protocol=https;branch=${BRANCH}"
-
-S = "${WORKDIR}/git"
-
-SRCREV = "c838bc06a163abad46dcc193c8fb9a4fb9e2e356"
-
-TARGET_PRODUCT:j721e = "j721e_linux"
-TARGET_PRODUCT:j721s2 = "j721s2_linux"
-TARGET_PRODUCT:j784s4 = "j784s4_linux"
-TARGET_PRODUCT:am62xx = "am62_linux"
-TARGET_PRODUCT:am62pxx = "am62p_linux"
-TARGET_PRODUCT:j722s = "j722s_linux"
-PVR_BUILD = "release"
-PVR_WS = "lws-generic"
-
-EXTRA_OEMAKE += 'KERNELDIR="${STAGING_KERNEL_DIR}" BUILD=${PVR_BUILD} PVR_BUILD_DIR=${TARGET_PRODUCT} WINDOW_SYSTEM=${PVR_WS}'
-
-do_install() {
-    make -C ${STAGING_KERNEL_DIR} M=${B}/binary_${TARGET_PRODUCT}_${PVR_WS}_${PVR_BUILD}/target_aarch64/kbuild INSTALL_MOD_PATH=${D}${root_prefix} PREFIX=${STAGING_DIR_HOST} modules_install
-}
-
-RRECOMMENDS:${PN} += "ti-img-rogue-umlibs"
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb
deleted file mode 100644
index 1ceebede..00000000
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require u-boot-ti.inc
-
-include ${@ 'recipes-bsp/u-boot/ti-extras.inc' if d.getVar('TI_EXTRAS') else ''}
-
-PR = "r0"
-
-BRANCH = "ti-u-boot-2023.04"
-
-SRCREV = "0893e693e08f9fc864a6191051dccc818accf933"
diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-22.3.5/0001-fix-gallivm-fix-LLVM-include-of-Host-h-moved-to-TargetParser.patch b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-22.3.5/0001-fix-gallivm-fix-LLVM-include-of-Host-h-moved-to-TargetParser.patch
deleted file mode 100644
index aa1ab0d9..00000000
--- a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-22.3.5/0001-fix-gallivm-fix-LLVM-include-of-Host-h-moved-to-TargetParser.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-From bb2db56ffec6e527d88751f75117ae690227cd6c Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Kai=20Wasserb=C3=A4ch?= <kai@dev.carbon-project.org>
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
-Reference: https://github.com/llvm/llvm-project/commit/d768bf994f508d7eaf9541a568be3d71096febf5
-Reviewed-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
-Closes: #8275
-Part-of: <https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/21263>
-
-Upstream-Status: Backport [https://gitlab.freedesktop.org/mesa/mesa/-/commit/bb2db56ffec6e527d88751f75117ae690227cd6c]
-
----
- src/gallium/auxiliary/gallivm/lp_bld_debug.cpp | 7 ++++++-
- src/gallium/auxiliary/gallivm/lp_bld_misc.cpp  | 4 +++-
- 2 files changed, 9 insertions(+), 2 deletions(-)
-
-diff --git a/src/gallium/auxiliary/gallivm/lp_bld_debug.cpp b/src/gallium/auxiliary/gallivm/lp_bld_debug.cpp
-index 54bc5d5ada36c..f78f04f042be8 100644
---- a/src/gallium/auxiliary/gallivm/lp_bld_debug.cpp
-+++ b/src/gallium/auxiliary/gallivm/lp_bld_debug.cpp
-@@ -35,9 +35,14 @@
- #include <llvm-c/Disassembler.h>
- #include <llvm/Support/raw_ostream.h>
- #include <llvm/Support/Format.h>
--#include <llvm/Support/Host.h>
- #include <llvm/IR/Module.h>
-
-+#if LLVM_VERSION_MAJOR >= 17
-+#include <llvm/TargetParser/Host.h>
-+#else
-+#include <llvm/Support/Host.h>
-+#endif
-+
- #include "util/u_math.h"
- #include "util/u_debug.h"
-
-diff --git a/src/gallium/auxiliary/gallivm/lp_bld_misc.cpp b/src/gallium/auxiliary/gallivm/lp_bld_misc.cpp
-index 334c13530394b..5e7a30a6cc2e3 100644
---- a/src/gallium/auxiliary/gallivm/lp_bld_misc.cpp
-+++ b/src/gallium/auxiliary/gallivm/lp_bld_misc.cpp
-@@ -60,7 +60,11 @@
- #include <llvm/Analysis/TargetLibraryInfo.h>
- #include <llvm/ExecutionEngine/SectionMemoryManager.h>
- #include <llvm/Support/CommandLine.h>
-+#if LLVM_VERSION_MAJOR >= 17
-+#include <llvm/TargetParser/Host.h>
-+#else
- #include <llvm/Support/Host.h>
-+#endif
- #include <llvm/Support/PrettyStackTrace.h>
- #include <llvm/ExecutionEngine/ObjectCache.h>
- #include <llvm/Support/TargetSelect.h>
-
---
-GitLab
diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-22.3.5/0001-fix-gallivm-limit-usage-of-LLVMContextSetOpaquePoint.patch b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-22.3.5/0001-fix-gallivm-limit-usage-of-LLVMContextSetOpaquePoint.patch
deleted file mode 100644
index 905fad04..00000000
--- a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-22.3.5/0001-fix-gallivm-limit-usage-of-LLVMContextSetOpaquePoint.patch
+++ /dev/null
@@ -1,128 +0,0 @@
-From 1a894699354f5f984f31e5d3418b651edf486df9 Mon Sep 17 00:00:00 2001
-From: Ryan Eatmon <reatmon@ti.com>
-Date: Fri, 22 Sep 2023 22:32:41 -0500
-Subject: [PATCH] fix: gallivm: limit usage of LLVMContextSetOpaquePointers()
- to LLVM 15
-
-LLVMContextSetOpaquePointers() was a temporary workaround offered to
-allow transitioning to opaque pointers. Mesa is ready for this now with
-recent versions of LLVM (16+). Therefore we limit the workaround of
-using LLVMContextSetOpaquePointers() to LLVM 15 now, that this C
-interface was removed in LLVM 17.
-
-Reference: https://github.com/llvm/llvm-project/commit/1270879376025457e266572c7cccc51eb5de9276
-
-Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/21124]
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
-diff --git a/src/gallium/auxiliary/draw/draw_llvm.c b/src/gallium/auxiliary/draw/draw_llvm.c
-index 50c157bc3cc..8b3a1522725 100644
---- a/src/gallium/auxiliary/draw/draw_llvm.c
-+++ b/src/gallium/auxiliary/draw/draw_llvm.c
-@@ -784,7 +784,7 @@ draw_llvm_create(struct draw_context *draw, LLVMContextRef context)
-    if (!llvm->context) {
-       llvm->context = LLVMContextCreate();
-
--#if LLVM_VERSION_MAJOR >= 15
-+#if LLVM_VERSION_MAJOR == 15
-       LLVMContextSetOpaquePointers(llvm->context, false);
- #endif
-
-diff --git a/src/gallium/drivers/llvmpipe/lp_context.c b/src/gallium/drivers/llvmpipe/lp_context.c
-index 8309335aebc..0ef4317fc76 100644
---- a/src/gallium/drivers/llvmpipe/lp_context.c
-+++ b/src/gallium/drivers/llvmpipe/lp_context.c
-@@ -263,7 +263,7 @@ llvmpipe_create_context(struct pipe_screen *screen, void *priv,
-    if (!llvmpipe->context)
-       goto fail;
-
--#if LLVM_VERSION_MAJOR >= 15
-+#if LLVM_VERSION_MAJOR == 15
-    LLVMContextSetOpaquePointers(llvmpipe->context, false);
- #endif
-
-diff --git a/src/gallium/drivers/llvmpipe/lp_test_arit.c b/src/gallium/drivers/llvmpipe/lp_test_arit.c
-index 4118928d52e..565b1c47753 100644
---- a/src/gallium/drivers/llvmpipe/lp_test_arit.c
-+++ b/src/gallium/drivers/llvmpipe/lp_test_arit.c
-@@ -434,7 +434,7 @@ test_unary(unsigned verbose, FILE *fp, const struct unary_test_t *test, unsigned
-    }
-
-    context = LLVMContextCreate();
--#if LLVM_VERSION_MAJOR >= 15
-+#if LLVM_VERSION_MAJOR == 15
-    LLVMContextSetOpaquePointers(context, false);
- #endif
-    gallivm = gallivm_create("test_module", context, NULL);
-diff --git a/src/gallium/drivers/llvmpipe/lp_test_blend.c b/src/gallium/drivers/llvmpipe/lp_test_blend.c
-index 37c3f731eaf..3d2899a78d4 100644
---- a/src/gallium/drivers/llvmpipe/lp_test_blend.c
-+++ b/src/gallium/drivers/llvmpipe/lp_test_blend.c
-@@ -452,7 +452,7 @@ test_one(unsigned verbose,
-       dump_blend_type(stdout, blend, type);
-
-    context = LLVMContextCreate();
--#if LLVM_VERSION_MAJOR >= 15
-+#if LLVM_VERSION_MAJOR == 15
-    LLVMContextSetOpaquePointers(context, false);
- #endif
-    gallivm = gallivm_create("test_module", context, NULL);
-diff --git a/src/gallium/drivers/llvmpipe/lp_test_conv.c b/src/gallium/drivers/llvmpipe/lp_test_conv.c
-index c7ea9efc12d..83236f0c0ba 100644
---- a/src/gallium/drivers/llvmpipe/lp_test_conv.c
-+++ b/src/gallium/drivers/llvmpipe/lp_test_conv.c
-@@ -223,7 +223,7 @@ test_one(unsigned verbose,
-    }
-
-    context = LLVMContextCreate();
--#if LLVM_VERSION_MAJOR >= 15
-+#if LLVM_VERSION_MAJOR == 15
-    LLVMContextSetOpaquePointers(context, false);
- #endif
-    gallivm = gallivm_create("test_module", context, NULL);
-diff --git a/src/gallium/drivers/llvmpipe/lp_test_format.c b/src/gallium/drivers/llvmpipe/lp_test_format.c
-index 0a2a1e449e8..89f7d5dec1a 100644
---- a/src/gallium/drivers/llvmpipe/lp_test_format.c
-+++ b/src/gallium/drivers/llvmpipe/lp_test_format.c
-@@ -150,7 +150,7 @@ test_format_float(unsigned verbose, FILE *fp,
-    unsigned i, j, k, l;
-
-    context = LLVMContextCreate();
--#if LLVM_VERSION_MAJOR >= 15
-+#if LLVM_VERSION_MAJOR == 15
-    LLVMContextSetOpaquePointers(context, false);
- #endif
-    gallivm = gallivm_create("test_module_float", context, NULL);
-@@ -254,7 +254,7 @@ test_format_unorm8(unsigned verbose, FILE *fp,
-    unsigned i, j, k, l;
-
-    context = LLVMContextCreate();
--#if LLVM_VERSION_MAJOR >= 15
-+#if LLVM_VERSION_MAJOR == 15
-    LLVMContextSetOpaquePointers(context, false);
- #endif
-    gallivm = gallivm_create("test_module_unorm8", context, NULL);
-diff --git a/src/gallium/drivers/llvmpipe/lp_test_printf.c b/src/gallium/drivers/llvmpipe/lp_test_printf.c
-index b3de9cb9e8b..850c0abfe22 100644
---- a/src/gallium/drivers/llvmpipe/lp_test_printf.c
-+++ b/src/gallium/drivers/llvmpipe/lp_test_printf.c
-@@ -96,7 +96,7 @@ test_printf(unsigned verbose, FILE *fp,
-    boolean success = TRUE;
-
-    context = LLVMContextCreate();
--#if LLVM_VERSION_MAJOR >= 15
-+#if LLVM_VERSION_MAJOR == 15
-    LLVMContextSetOpaquePointers(context, false);
- #endif
-    gallivm = gallivm_create("test_module", context, NULL);
---
-2.17.1
diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-22.3.5/0001-freedreno-pm4-Use-unsigned-instead-of-uint-to-fix-mu.patch b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-22.3.5/0001-freedreno-pm4-Use-unsigned-instead-of-uint-to-fix-mu.patch
deleted file mode 100644
index f0775176..00000000
--- a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-22.3.5/0001-freedreno-pm4-Use-unsigned-instead-of-uint-to-fix-mu.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 8a5de0b6cf1090d7f29f3974ec79c32776cf2745 Mon Sep 17 00:00:00 2001
-From: Jami Kettunen <jami.kettunen@protonmail.com>
-Date: Tue, 31 Aug 2021 00:15:58 +0300
-Subject: [PATCH] freedreno/pm4: Use unsigned instead of uint to fix musl build
-
-Upstream-Status: Backport
-
-Fixes the following error I noticed when building against aarch64 with
-musl libc:
-
-  In file included from ../src/freedreno/decode/crashdec.h:38,
-                   from ../src/freedreno/decode/crashdec.c:40:
-  ../src/freedreno/common/freedreno_pm4.h:104:15: error: unknown type name 'uint'
-    104 | static inline uint
-        |               ^~~~
-  ../src/freedreno/common/freedreno_pm4.h:105:25: error: unknown type name 'uint'; did you mean 'int'?
-    105 | pm4_calc_odd_parity_bit(uint val)
-        |                         ^~~~
-        |                         int
-
-Signed-off-by: Jami Kettunen <jami.kettunen@protonmail.com>
-Part-of: <https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/19665>
----
- src/freedreno/common/freedreno_pm4.h | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/freedreno/common/freedreno_pm4.h b/src/freedreno/common/freedreno_pm4.h
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
-                              ((val) >> 12) ^ ((val) >> 16) ^ ((val) >> 20) ^
---
-2.39.2
diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-22.3.5/0001-gallium-Fix-build-with-llvm-17.patch b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-22.3.5/0001-gallium-Fix-build-with-llvm-17.patch
deleted file mode 100644
index bdfe7bb8..00000000
--- a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-22.3.5/0001-gallium-Fix-build-with-llvm-17.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From 2dfe0f899aeb415a5491b8c67e208673d2a2914f Mon Sep 17 00:00:00 2001
-From: Ryan Eatmon <reatmon@ti.com>
-Date: Fri, 22 Sep 2023 21:50:08 -0500
-Subject: [PATCH] gallium: Fix build with llvm 17
-
-These headers are not available for C files in llvm 17+
-and they seem to be not needed to compile after all with llvm 17
-so add conditions to exclude them for llvm >= 17
-
-Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/21262]
-Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/22980]
-Signed-off-by: Ryan Eatmon <reatmon@ti.com>
----
- src/gallium/auxiliary/gallivm/lp_bld_init.c   | 8 ++++----
- src/gallium/auxiliary/gallivm/lp_bld_misc.cpp | 4 ++++
- 2 files changed, 8 insertions(+), 4 deletions(-)
-
-diff --git a/src/gallium/auxiliary/gallivm/lp_bld_init.c b/src/gallium/auxiliary/gallivm/lp_bld_init.c
-index 584ea738668..fe8bb2b11af 100644
---- a/src/gallium/auxiliary/gallivm/lp_bld_init.c
-+++ b/src/gallium/auxiliary/gallivm/lp_bld_init.c
-@@ -42,14 +42,14 @@
-
- #include <llvm/Config/llvm-config.h>
- #include <llvm-c/Analysis.h>
--#include <llvm-c/Transforms/Scalar.h>
--#if LLVM_VERSION_MAJOR >= 7
--#include <llvm-c/Transforms/Utils.h>
--#endif
- #include <llvm-c/BitWriter.h>
- #if GALLIVM_USE_NEW_PASS == 1
- #include <llvm-c/Transforms/PassBuilder.h>
- #elif GALLIVM_HAVE_CORO == 1
-+#include <llvm-c/Transforms/Scalar.h>
-+#if LLVM_VERSION_MAJOR >= 7
-+#include <llvm-c/Transforms/Utils.h>
-+#endif
- #if LLVM_VERSION_MAJOR <= 8 && (defined(PIPE_ARCH_AARCH64) || defined (PIPE_ARCH_ARM) || defined(PIPE_ARCH_S390) || defined(PIPE_ARCH_MIPS64))
- #include <llvm-c/Transforms/IPO.h>
- #endif
-diff --git a/src/gallium/auxiliary/gallivm/lp_bld_misc.cpp b/src/gallium/auxiliary/gallivm/lp_bld_misc.cpp
-index 2279e5acb28..0caeaf94263 100644
---- a/src/gallium/auxiliary/gallivm/lp_bld_misc.cpp
-+++ b/src/gallium/auxiliary/gallivm/lp_bld_misc.cpp
-@@ -56,7 +56,11 @@
- #include <llvm-c/ExecutionEngine.h>
- #include <llvm/Target/TargetOptions.h>
- #include <llvm/ExecutionEngine/ExecutionEngine.h>
-+#if LLVM_VERSION_MAJOR >= 17
-+#include <llvm/TargetParser/Triple.h>
-+#else
- #include <llvm/ADT/Triple.h>
-+#endif
- #include <llvm/Analysis/TargetLibraryInfo.h>
- #include <llvm/ExecutionEngine/SectionMemoryManager.h>
- #include <llvm/Support/CommandLine.h>
---
-2.17.1
diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-22.3.5/0001-gallium-Fix-build-with-llvm-18-and-19.patch b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-22.3.5/0001-gallium-Fix-build-with-llvm-18-and-19.patch
deleted file mode 100644
index 4566c515..00000000
--- a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-22.3.5/0001-gallium-Fix-build-with-llvm-18-and-19.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 6c5033bb01a3a1341d4db5007586a5f2e2727b0a Mon Sep 17 00:00:00 2001
-From: Ryan Eatmon <reatmon@ti.com>
-Date: Mon, 4 Nov 2024 13:37:29 -0600
-Subject: [PATCH] gallium: Fix build with llvm 18 and 19
-
-- CodeGenOpt::Level changed to CodeGenOoptLevel. [1]
-- llvm::sys::getHostCPUFeatures() now returns the features instead of
-modifying the passed in argument. [2]
-
-Upstream-Status: Backport [1][https://gitlab.freedesktop.org/mesa/mesa/-/commit/f79617fe804ea6524651ff1bc3a91098d3199179]
-Upstream-Status: Backport [2][https://gitlab.freedesktop.org/mesa/mesa/-/commit/fa9cd89a85b904615ebc11da609445b5b751e68d]
-
-Signed-off-by: Ryan Eatmon <reatmon@ti.com>
----
- src/gallium/auxiliary/gallivm/lp_bld_misc.cpp | 14 ++++++++++++--
- 1 file changed, 12 insertions(+), 2 deletions(-)
-
-diff --git a/src/gallium/auxiliary/gallivm/lp_bld_misc.cpp b/src/gallium/auxiliary/gallivm/lp_bld_misc.cpp
-index 5e7a30a6cc2..dbc777e3096 100644
---- a/src/gallium/auxiliary/gallivm/lp_bld_misc.cpp
-+++ b/src/gallium/auxiliary/gallivm/lp_bld_misc.cpp
-@@ -368,7 +368,11 @@ lp_build_create_jit_compiler_for_module(LLVMExecutionEngineRef *OutJIT,
-    builder.setEngineKind(EngineKind::JIT)
-           .setErrorStr(&Error)
-           .setTargetOptions(options)
-+#if LLVM_VERSION_MAJOR >= 18
-+          .setOptLevel((CodeGenOptLevel)OptLevel);
-+#else
-           .setOptLevel((CodeGenOpt::Level)OptLevel);
-+#endif
-
- #ifdef _WIN32
-     /*
-@@ -392,8 +396,14 @@ lp_build_create_jit_compiler_for_module(LLVMExecutionEngineRef *OutJIT,
-     * which allows us to enable/disable code generation based
-     * on the results of cpuid on these architectures.
-     */
--   llvm::StringMap<bool> features;
--   llvm::sys::getHostCPUFeatures(features);
-+   #if LLVM_VERSION_MAJOR >= 19
-+      /* llvm-19+ returns StringMap from getHostCPUFeatures.
-+      */
-+      auto features = llvm::sys::getHostCPUFeatures();
-+   #else
-+      llvm::StringMap<bool> features;
-+      llvm::sys::getHostCPUFeatures(features);
-+   #endif
-
-    for (StringMapIterator<bool> f = features.begin();
-         f != features.end();
---
-2.17.1
diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-22.3.5/0001-gbm-backend-fix-gbm-compile-without-dri.patch b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-22.3.5/0001-gbm-backend-fix-gbm-compile-without-dri.patch
deleted file mode 100644
index 289ff032..00000000
--- a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-22.3.5/0001-gbm-backend-fix-gbm-compile-without-dri.patch
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
-https://gitlab.freedesktop.org/mesa/mesa/-/commit/842ca284650f066e58706741a7d22d67b5088e60
-
-At mesa version 22.2.3 patch wasn't introduced until after.
-
-Commit introduces a fix that allows for gbm to be built with an empty
-backend. There are situation especially in a Yocto/OE cross compilation
-environment where you want to build with an empty backend. The particular
-situation is as such:
-
-The mesa-gl recipe is the preferred provider for virtual/libgbm, virtual/libgl,
-virtual/mesa, etc... But the x11 DISTRO_FEATURE in't included this leads to build
-errors such as:
-
-| /../../../ld: src/gbm/libgbm.so.1.0.0.p/main_backend.c.o: in function `find_backend':
-| backend.c:(.text.find_backend+0xa4): undefined reference to `gbm_dri_backend'
-| /../../../ld: src/gbm/libgbm.so.1.0.0.p/main_backend.c.o:(.data.rel.ro.builtin_backends+0x4):
-                undefined reference to `gbm_dri_backend'
-| collect2: error: ld returned 1 exit status
-
-Issue should be replicable by setting -Ddri3=disabled and -Dgbm=enabled
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
- static const struct gbm_backend_desc builtin_backends[] = {
-+#if defined(HAVE_DRI) || defined(HAVE_DRI2) || defined(HAVE_DRI3)
-    { "dri", &gbm_dri_backend },
-+#endif
- };
-
- #define BACKEND_LIB_SUFFIX "_gbm"
---
-2.34.1
diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-22.3.5/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-22.3.5/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch
deleted file mode 100644
index 35bd0ea1..00000000
--- a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-22.3.5/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch
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
-+#if !defined(__clang__) && defined(MISSING_64BIT_ATOMICS) && defined(HAVE_PTHREAD)
-
- #include <stdint.h>
- #include <pthread.h>
diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-22.3.5/0001-meson.build-check-for-all-linux-host_os-combinations.patch b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-22.3.5/0001-meson.build-check-for-all-linux-host_os-combinations.patch
deleted file mode 100644
index f0c1de46..00000000
--- a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-22.3.5/0001-meson.build-check-for-all-linux-host_os-combinations.patch
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
-@@ -173,7 +173,7 @@ with_any_opengl = with_opengl or with_gles1 or with_gles2
- # Only build shared_glapi if at least one OpenGL API is enabled
- with_shared_glapi = with_shared_glapi and with_any_opengl
-
--system_has_kms_drm = ['openbsd', 'netbsd', 'freebsd', 'gnu/kfreebsd', 'dragonfly', 'linux', 'sunos', 'android'].contains(host_machine.system())
-+system_has_kms_drm = ['openbsd', 'netbsd', 'freebsd', 'gnu/kfreebsd', 'dragonfly', 'linux', 'sunos', 'android'].contains(host_machine.system()) or host_machine.system().startswith('linux')
-
- with_freedreno_kgsl = get_option('freedreno-kgsl')
- if with_freedreno_kgsl
-@@ -1076,7 +1076,7 @@ if cc.has_function('reallocarray')
- endif
-
- # TODO: this is very incomplete
--if ['linux', 'cygwin', 'gnu', 'freebsd', 'gnu/kfreebsd', 'haiku', 'android'].contains(host_machine.system())
-+if ['linux', 'cygwin', 'gnu', 'freebsd', 'gnu/kfreebsd', 'haiku'].contains(host_machine.system()) or host_machine.system().startswith('linux')
-   pre_args += '-D_GNU_SOURCE'
- elif host_machine.system() == 'sunos'
-   pre_args += '-D__EXTENSIONS__'
diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-22.3.5/0001-util-format-Check-for-NEON-before-using-it.patch b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-22.3.5/0001-util-format-Check-for-NEON-before-using-it.patch
deleted file mode 100644
index 6eea5ed8..00000000
--- a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-22.3.5/0001-util-format-Check-for-NEON-before-using-it.patch
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
-In file included from ../mesa-21.3.0/src/util/format/u_format_unpack_neon.c:35:
-/mnt/b/yoe/master/build/tmp/work/arm1176jzfshf-vfp-yoe-linux-gnueabi/mesa/2_21.3.0-r0/recipe-sysroot-native/usr/lib/clang/13.0.1/include/arm_neon.h:32:2: error: "NEON support not enabled"
-
-Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/14032]
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
-    for (enum pipe_format format = PIPE_FORMAT_NONE; format < PIPE_FORMAT_COUNT; format++) {
--#if (defined(PIPE_ARCH_AARCH64) || defined(PIPE_ARCH_ARM)) && !defined(NO_FORMAT_ASM) && !defined(__SOFTFP__)
-+#if (defined(PIPE_ARCH_AARCH64) || (defined(__ARM_NEON) && defined(PIPE_ARCH_ARM))) && !defined(NO_FORMAT_ASM)
-       const struct util_format_unpack_description *unpack = util_format_unpack_description_neon(format);
-       if (unpack) {
-          util_format_unpack_table[format] = unpack;
-diff --git a/src/util/format/u_format_unpack_neon.c b/src/util/format/u_format_unpack_neon.c
-index a4a5cb1..1e4f794 100644
---- a/src/util/format/u_format_unpack_neon.c
-+++ b/src/util/format/u_format_unpack_neon.c
-@@ -23,7 +23,7 @@
-
- #include <u_format.h>
-
--#if (defined(PIPE_ARCH_AARCH64) || defined(PIPE_ARCH_ARM)) && !defined(NO_FORMAT_ASM) && !defined(__SOFTFP__)
-+#if (defined(PIPE_ARCH_AARCH64) || (defined(__ARM_NEON) && defined(PIPE_ARCH_ARM))) && !defined(NO_FORMAT_ASM)
-
- /* armhf builds default to vfp, not neon, and refuses to compile neon intrinsics
-  * unless you tell it "no really".
diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_22.3.5.bb b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_22.3.5.bb
deleted file mode 100644
index 4f59fbdb..00000000
--- a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_22.3.5.bb
+++ /dev/null
@@ -1,62 +0,0 @@
-# PowerVR Graphics require several patches that have not made their way
-# upstream yet. This allows us to build the shims we need without completely
-# clobbering mesa.
-
-require recipes-graphics/mesa/mesa.inc
-
-SUMMARY += " (with PowerVR for TI parts)"
-
-LIC_FILES_CHKSUM = "file://docs/license.rst;md5=63779ec98d78d823a9dc533a0735ef10"
-
-BRANCH = "powervr/kirkstone/${PV}"
-
-SRC_URI = " \
-    git://gitlab.freedesktop.org/StaticRocket/mesa.git;protocol=https;branch=${BRANCH} \
-    file://0001-meson.build-check-for-all-linux-host_os-combinations.patch \
-    file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
-    file://0001-util-format-Check-for-NEON-before-using-it.patch \
-    file://0001-gbm-backend-fix-gbm-compile-without-dri.patch \
-    file://0001-freedreno-pm4-Use-unsigned-instead-of-uint-to-fix-mu.patch \
-    file://0001-gallium-Fix-build-with-llvm-17.patch \
-    file://0001-fix-gallivm-limit-usage-of-LLVMContextSetOpaquePoint.patch \
-    file://0001-fix-gallivm-fix-LLVM-include-of-Host-h-moved-to-TargetParser.patch \
-    file://0001-gallium-Fix-build-with-llvm-18-and-19.patch \
-"
-
-S = "${WORKDIR}/git"
-
-PACKAGECONFIG:append = " \
-    ${@bb.utils.contains('PREFERRED_PROVIDER_virtual/gpudriver', 'ti-img-rogue-driver', 'pvr', '', d)} \
-    ${@bb.utils.contains('PREFERRED_PROVIDER_virtual/gpudriver', 'ti-sgx-ddk-km', 'sgx', '', d)} \
-"
-
-SRCREV = "c9f0919367589b38f5682183846de9d60eec082d"
-PV = "22.3.5"
-
-PVR_DISPLAY_CONTROLLER_ALIAS ??= "tidss"
-PACKAGECONFIG[pvr] = "-Dgallium-pvr-alias=${PVR_DISPLAY_CONTROLLER_ALIAS},"
-PACKAGECONFIG[sgx] = "-Dgallium-sgx-alias=${PVR_DISPLAY_CONTROLLER_ALIAS},"
-
-PACKAGECONFIG:remove = "video-codecs"
-PACKAGECONFIG[video-codecs] = ""
-PACKAGECONFIG:remove = "elf-tls"
-PACKAGECONFIG[elf-tls] = ""
-PACKAGECONFIG:remove = "xvmc"
-PACKAGECONFIG[xvmc] = ""
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'pvr', ',pvr', '', d)}"
-GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'sgx', ',sgx', '', d)}"
-
-VULKAN_DRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'pvr', ',pvr', '', d)}"
-
-do_install:append () {
-    # remove pvr custom pkgconfig
-    rm -rf ${D}${datadir}/pkgconfig
-}
-
-FILES:${PN}-dev += "${datadir}/mesa/wayland-drm.xml"
-FILES:mesa-vulkan-drivers += "${libdir}/libpvr_mesa_wsi.so"
-
-RRECOMMENDS:mesa-megadriver:append:class-target = " ${@d.getVar('PREFERRED_PROVIDER_virtual/gpudriver')}"
diff --git a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.3.6512818.bb b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.3.6512818.bb
deleted file mode 100644
index 592a0e80..00000000
--- a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.3.6512818.bb
+++ /dev/null
@@ -1,147 +0,0 @@
-SUMMARY = "Userspace libraries for PowerVR Rogue GPU on TI SoCs"
-HOMEPAGE = "http://git.ti.com/graphics/ti-img-rogue-umlibs"
-LICENSE = "TI-TFL"
-LIC_FILES_CHKSUM = "file://${WORKDIR}/git/LICENSE;md5=7232b98c1c58f99e3baa03de5207e76f"
-
-inherit bin_package
-
-INHIBIT_DEFAULT_DEPS = ""
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-COMPATIBLE_MACHINE = "j721e|j721s2|j784s4|am62xx|am62pxx|j722s"
-
-PR = "r3"
-
-BRANCH = "linuxws/kirkstone/k6.1/${PV}"
-SRC_URI = "git://git.ti.com/git/graphics/ti-img-rogue-umlibs.git;protocol=https;branch=${BRANCH}"
-SRCREV = "0b9e64254269be2fa95c4f3e1dd925d6e4d58199"
-S = "${WORKDIR}/git/targetfs/${TARGET_PRODUCT}/${PVR_WS}/${PVR_BUILD}"
-
-TARGET_PRODUCT:j721e = "j721e_linux"
-TARGET_PRODUCT:j721s2 = "j721s2_linux"
-TARGET_PRODUCT:j784s4 = "j784s4_linux"
-TARGET_PRODUCT:am62xx = "am62_linux"
-TARGET_PRODUCT:am62pxx = "am62p_linux"
-TARGET_PRODUCT:j722s = "j722s_linux"
-PVR_BUILD = "release"
-PVR_WS = "lws-generic"
-
-RDEPENDS:${PN} = " \
-    libdrm \
-    ti-img-rogue-driver \
-    ${PN}-firmware \
-"
-
-PACKAGECONFIG ?= " \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'vulkan wayland', 'vulkan', '', d)} \
-    ${@bb.utils.filter('DISTRO_FEATURES', 'opengl opencl', d)} \
-"
-
-PACKAGECONFIG[opengl] = ",,,,${GLES_PACKAGES}"
-PACKAGECONFIG[vulkan] = ",,,,${VULKAN_PACKAGES}"
-PACKAGECONFIG[opencl] = ",,,,${OPENCL_PACKAGES}"
-
-def get_file_list(package_list_var, d):
-    file_list = []
-    package_list = d.getVar(package_list_var)
-    prefix = f"{d.getVar('D')}/"
-    if package_list:
-        for package in package_list.split():
-            package_file_string = d.getVar(f"FILES:{package}")
-            if package_file_string:
-                for package_file in package_file_string.split():
-                    file_list.append(f"{prefix}{package_file}")
-    return " ".join(file_list)
-
-do_install:append() {
-    if ${@bb.utils.contains('PACKAGECONFIG', 'opengl', 'false', 'true', d)}; then
-        for file in ${@get_file_list('GLES_PACKAGES',  d)}; do
-            rm -rf ${file}
-        done
-    fi
-    if ${@bb.utils.contains('PACKAGECONFIG', 'vulkan', 'false', 'true', d)}; then
-        for file in ${@get_file_list('VULKAN_PACKAGES', d)}; do
-            rm -rf ${file}
-        done
-    fi
-    if ${@bb.utils.contains('PACKAGECONFIG', 'opencl', 'false', 'true', d)}; then
-        for file in ${@get_file_list('OPENCL_PACKAGES', d)}; do
-            rm -rf ${file}
-        done
-    fi
-    if ${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', 'true', 'false', d)}; then
-        if [ -e ${D}/lib/firmware ]; then
-            mv ${D}/lib/firmware ${D}${nonarch_base_libdir}
-        fi
-    fi
-
-    # clean up any empty directories
-    find "${D}" -empty -type d -delete
-}
-
-GLES_PACKAGES = "libgles1-rogue libgles2-rogue libgles3-rogue"
-VULKAN_PACKAGES = "libvk-rogue"
-OPENCL_PACKAGES = "libopencl-rogue libopencl-rogue-tools"
-
-PACKAGES = " \
-    ${@bb.utils.contains('PACKAGECONFIG', 'opengl', d.getVar('GLES_PACKAGES'), '', d)} \
-    ${@bb.utils.contains('PACKAGECONFIG', 'vulkan', d.getVar('VULKAN_PACKAGES'), '', d)} \
-    ${@bb.utils.contains('PACKAGECONFIG', 'opencl', d.getVar('OPENCL_PACKAGES'), '', d)} \
-    ${PN}-tools \
-    ${PN}-firmware \
-    ${PN} \
-"
-
-# Inject variables so that packages don't get Debian-renamed (which would
-# remove the -rogue suffix), but don't RPROVIDEs/RCONFLICTs on the generic
-# libgl name to prevent colliding with swrast libs
-python __anonymous() {
-    suffix = ""
-    if "-native" in d.getVar("PN"):
-        suffix = "-native"
-    for p in (("vulkan", "libvk",),
-              ("gles", "libgles1", "libglesv1-cm1"),
-              ("gles", "libgles2", "libglesv2-2"),
-              ("gles", "libgles3",),
-              ("opencl", "libopencl",)):
-        mlprefix = d.getVar("MLPREFIX")
-        fullp = mlprefix + p[1] + "-rogue" + suffix
-        mlprefix = d.getVar("MLPREFIX")
-        pkgs = " " + " ".join(mlprefix + x + suffix for x in p[1:])
-        d.setVar("DEBIAN_NOAUTONAME:" + fullp, "1")
-        d.setVar("INSANE_SKIP:" + fullp, "dev-so ldflags")
-        d.appendVar("RRECOMMENDS:" + fullp, " ${MLPREFIX}ti-img-rogue-umlibs" + suffix)
-}
-
-# gles specific shared objects
-FILES:libgles1-rogue = "${libdir}/libGLESv1*.so*"
-FILES:libgles2-rogue = "${libdir}/libGLESv2*.so*"
-RDEPENDS:libgles1-rogue += "mesa-megadriver"
-RDEPENDS:libgles2-rogue += "mesa-megadriver"
-
-# vulkan specific shared objects and configs
-FILES:libvk-rogue = "${libdir}/libVK_IMG.so* ${datadir}/vulkan"
-RDEPENDS:libvk-rogue += "vulkan-loader wayland libdrm"
-
-# opencl specific shared objects and configs
-FILES:libopencl-rogue = "${libdir}/libPVROCL.so* ${sysconfdir}/OpenCL"
-RDEPENDS:libopencl-rogue += "opencl-icd-loader"
-RRECOMMENDS:libopencl-rogue += "libopencl-rogue-tools"
-FILES:libopencl-rogue-tools += "${bindir}/ocl*"
-DEBIAN_NOAUTONAME:libopencl-rogue-tools = "1"
-INSANE_SKIP:libopencl-rogue-tools = "ldflags"
-
-# optional tools and tests
-FILES:${PN}-tools = "${bindir}/"
-RDEPENDS:${PN}-tools = "python3-core ${PN}"
-INSANE_SKIP:${PN}-tools = "ldflags"
-
-# required firmware
-FILES:${PN}-firmware = "${base_libdir}/firmware/*"
-INSANE_SKIP:${PN}-firmware += "arch"
-
-RRECOMMENDS:${PN} += " \
-    ${PN}-tools \
-"
-
-INSANE_SKIP:${PN} += "already-stripped dev-so ldflags"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.1/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.1/defconfig
deleted file mode 100644
index 24b53cf7..00000000
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.1/defconfig
+++ /dev/null
@@ -1,2 +0,0 @@
-use-kernel-config=multi_v7_defconfig
-config-fragment=kernel/configs/ti_multi_v7_prune.config
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.1/k3/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.1/k3/defconfig
deleted file mode 100644
index ef1d3efd..00000000
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.1/k3/defconfig
+++ /dev/null
@@ -1,2 +0,0 @@
-use-kernel-config=defconfig
-config-fragment=kernel/configs/ti_arm64_prune.config
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.1/omapl138/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.1/omapl138/defconfig
deleted file mode 100644
index 099493af..00000000
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.1/omapl138/defconfig
+++ /dev/null
@@ -1 +0,0 @@
-use-kernel-config=davinci_all_defconfig
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.1/ti33x/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.1/ti33x/defconfig
deleted file mode 100644
index e6a967e1..00000000
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.1/ti33x/defconfig
+++ /dev/null
@@ -1,2 +0,0 @@
-use-kernel-config=multi_v7_defconfig
-config-fragment=kernel/configs/ti_multi_v7_prune.config kernel/configs/no_smp.config
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.1/ti43x/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.1/ti43x/defconfig
deleted file mode 100644
index e6a967e1..00000000
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.1/ti43x/defconfig
+++ /dev/null
@@ -1,2 +0,0 @@
-use-kernel-config=multi_v7_defconfig
-config-fragment=kernel/configs/ti_multi_v7_prune.config kernel/configs/no_smp.config
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.1/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.1/defconfig
deleted file mode 100644
index 43089dc8..00000000
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.1/defconfig
+++ /dev/null
@@ -1,2 +0,0 @@
-use-kernel-config=multi_v7_defconfig
-config-fragment=kernel/configs/ti_multi_v7_prune.config kernel/configs/ti_rt.config
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.1/k3/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.1/k3/defconfig
deleted file mode 100644
index 47d78664..00000000
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.1/k3/defconfig
+++ /dev/null
@@ -1,2 +0,0 @@
-use-kernel-config=defconfig
-config-fragment=kernel/configs/ti_arm64_prune.config kernel/configs/ti_rt.config
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.1/omapl138/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.1/omapl138/defconfig
deleted file mode 100644
index 2c829c0b..00000000
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.1/omapl138/defconfig
+++ /dev/null
@@ -1,2 +0,0 @@
-use-kernel-config=davinci_all_defconfig
-config-fragment=kernel/configs/ti_rt.config
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.1/ti33x/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.1/ti33x/defconfig
deleted file mode 100644
index 5de2b229..00000000
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.1/ti33x/defconfig
+++ /dev/null
@@ -1,2 +0,0 @@
-use-kernel-config=multi_v7_defconfig
-config-fragment=kernel/configs/ti_multi_v7_prune.config kernel/configs/ti_rt.config kernel/configs/no_smp.config
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.1/ti43x/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.1/ti43x/defconfig
deleted file mode 100644
index 5de2b229..00000000
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.1/ti43x/defconfig
+++ /dev/null
@@ -1,2 +0,0 @@
-use-kernel-config=multi_v7_defconfig
-config-fragment=kernel/configs/ti_multi_v7_prune.config kernel/configs/ti_rt.config kernel/configs/no_smp.config
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.1.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.1.bb
deleted file mode 100644
index 2d136698..00000000
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.1.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-require linux-ti-staging_6.1.bb
-
-KERNEL_LOCALVERSION:append = "-rt"
-
-# Look in the generic major.minor directory for files
-# This will have priority over generic non-rt path
-FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}-6.1:"
-
-BRANCH = "ti-rt-linux-6.1.y"
-
-SRCREV = "194ebd939bee3ffff36de9cf8dff28a77c671f5b"
-
-include ${@ 'recipes-kernel/linux/ti-extras-rt.inc' if d.getVar('TI_EXTRAS') else ''}
-
-PV = "6.1.112+git"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
deleted file mode 100644
index 47ed4f72..00000000
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
+++ /dev/null
@@ -1,33 +0,0 @@
-SECTION = "kernel"
-SUMMARY = "Linux kernel for TI devices"
-LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-
-inherit ti-secdev
-inherit kernel
-
-require recipes-kernel/linux/setup-defconfig.inc
-require recipes-kernel/linux/ti-kernel.inc
-include ${@ 'recipes-kernel/linux/ti-kernel-devicetree-prefix.inc' if d.getVar('KERNEL_DEVICETREE_PREFIX') else ''}
-include ${@ 'recipes-kernel/linux/ti-extras.inc' if d.getVar('TI_EXTRAS') else ''}
-
-DEPENDS += "gmp-native libmpc-native"
-
-# Look in the generic major.minor directory for files
-FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}-6.1:"
-
-KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT} \
-		      ${EXTRA_DTC_ARGS}"
-
-S = "${WORKDIR}/git"
-
-BRANCH ?= "ti-linux-6.1.y"
-
-SRCREV ?= "4ef41ca7ad952c7b13b7e40808ab1025796f9a6c"
-PV = "6.1.112+git"
-
-# Special configuration for remoteproc/rpmsg IPC modules
-module_conf_rpmsg_client_sample = "blacklist rpmsg_client_sample"
-module_conf_ti_k3_r5_remoteproc = "softdep ti_k3_r5_remoteproc pre: virtio_rpmsg_bus"
-module_conf_ti_k3_dsp_remoteproc = "softdep ti_k3_dsp_remoteproc pre: virtio_rpmsg_bus"
-KERNEL_MODULE_PROBECONF += "rpmsg_client_sample ti_k3_r5_remoteproc ti_k3_dsp_remoteproc"
-- 
2.39.2


