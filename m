Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20295C0218C
	for <webhook@archiver.kernel.org>; Wed, 22 Jan 2025 21:42:57 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.5906.1737582175375995787
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 22 Jan 2025 13:42:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=aHgoSZTP;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50MLgsb3265432
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 22 Jan 2025 15:42:54 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1737582174;
	bh=J1F+iOu5H5OULnRKvyxWlspf0RpfRSiESYAU2kCVYjk=;
	h=From:To:Subject:Date;
	b=aHgoSZTPX54Z3JnhWjlUcWua7bozHKWMKcOTUp2ebP4BRo3AYULh+gGTfrpzme++V
	 m0R/KXQcaETizzd77hF32+eSZU0ZKX+Gx+CEqGjUtMGr1meN634mrLfDs7cDiEi1gF
	 7S7BL2naYZXF5/Goiao95lgRSY7zTOq06Ds97xeI=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50MLgsd4076384
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 22 Jan 2025 15:42:54 -0600
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 22
 Jan 2025 15:42:53 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 22 Jan 2025 15:42:53 -0600
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50MLgrL2112781;
	Wed, 22 Jan 2025 15:42:53 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1taiUv-0005Kn-NY; Wed, 22 Jan 2025 15:42:53 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][scarthgap][PATCH] ti-bsp: Remove ti-6_1 and all related recipes
Date: Wed, 22 Jan 2025 15:42:53 -0600
Message-ID: <20250122214253.20466-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 22 Jan 2025 21:42:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18222

With the upcoming LTS move to 6.12 we no longer need to continue
supporting the ti-6_1 BSP.  Also remove the related recipes and their
related file:

linux-ti-staging_6.1.bb
linux-ti-staging-rt_6.1.bb
u-boot-ti-staging_2023.04.bb
ti-img-rogue-driver_23.3.6512818.bb
ti-img-rogue-umlibs_23.3.6512818.bb
mesa-pvr_22.3.5.bb

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-beagle/conf/machine/beagle-x15.conf      |   1 -
 .../conf/machine/beaglebone-ai64-k3r5.conf    |   3 -
 meta-beagle/conf/machine/beaglebone-ai64.conf |   3 -
 meta-beagle/conf/machine/beaglebone.conf      |   1 -
 meta-ti-bsp/conf/machine/am62pxx-evm.conf     |   2 -
 .../conf/machine/am62xxsip-evm-k3r5.conf      |   4 -
 meta-ti-bsp/conf/machine/am62xxsip-evm.conf   |   2 -
 .../conf/machine/beagleplay-ti-k3r5.conf      |   3 -
 meta-ti-bsp/conf/machine/beagleplay-ti.conf   |   3 -
 meta-ti-bsp/conf/machine/include/ti-bsp.inc   |  22 +--
 .../ti-img-rogue-driver_23.3.6512818.bb       |  39 -----
 .../u-boot/u-boot-ti-staging_2023.04.bb       |   9 --
 ...lude-of-Host-h-moved-to-TargetParser.patch |  64 --------
 ...allium-Fix-build-with-llvm-18-and-19.patch |  52 -------
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
 28 files changed, 1 insertion(+), 483 deletions(-)
 delete mode 100644 meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.3.6512818.bb
 delete mode 100644 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb
 delete mode 100644 meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-22.3.5/0001-fix-gallivm-fix-LLVM-include-of-Host-h-moved-to-TargetParser.patch
 delete mode 100644 meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-22.3.5/0001-gallium-Fix-build-with-llvm-18-and-19.patch
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
index 8ad028f4..d7fde889 100644
--- a/meta-beagle/conf/machine/beagle-x15.conf
+++ b/meta-beagle/conf/machine/beagle-x15.conf
@@ -6,7 +6,6 @@ require conf/machine/include/am57xx.inc
 require conf/machine/include/beagle-bsp.inc
 
 DT_VENDOR_PREFIX = "ti/omap/"
-DT_VENDOR_PREFIX:bsp-ti-6_1 = ""
 DT_VENDOR_PREFIX:bsp-bb_org-6_1 = ""
 
 KERNEL_DEVICETREE_PREFIX = " \
diff --git a/meta-beagle/conf/machine/beaglebone-ai64-k3r5.conf b/meta-beagle/conf/machine/beaglebone-ai64-k3r5.conf
index 4574f82b..5de809c9 100644
--- a/meta-beagle/conf/machine/beaglebone-ai64-k3r5.conf
+++ b/meta-beagle/conf/machine/beaglebone-ai64-k3r5.conf
@@ -17,8 +17,5 @@ UBOOT_SYMLINK = "tiboot3-${MAINMACHINE}.${UBOOT_SUFFIX}"
 
 UBOOT_MACHINE = "j721e_beagleboneai64_r5_defconfig"
 
-UBOOT_MACHINE:bsp-ti-6_1 = "j721e_evm_r5_defconfig"
-UBOOT_CONFIG_FRAGMENTS:bsp-ti-6_1 = "j721e_beagleboneai64_r5.config"
-
 UBOOT_MACHINE:bsp-bb_org-6_1 = "j721e_evm_r5_defconfig"
 UBOOT_CONFIG_FRAGMENTS:bsp-bb_org-6_1 = "j721e_beagleboneai64_r5.config"
diff --git a/meta-beagle/conf/machine/beaglebone-ai64.conf b/meta-beagle/conf/machine/beaglebone-ai64.conf
index ecd3a6e7..fffdca81 100644
--- a/meta-beagle/conf/machine/beaglebone-ai64.conf
+++ b/meta-beagle/conf/machine/beaglebone-ai64.conf
@@ -12,9 +12,6 @@ IMAGE_SR2_HS_SE_FILES = ""
 
 UBOOT_MACHINE = "j721e_beagleboneai64_a72_defconfig"
 
-UBOOT_MACHINE:bsp-ti-6_1 = "j721e_evm_a72_config"
-UBOOT_CONFIG_FRAGMENTS:bsp-ti-6_1 = "j721e_beagleboneai64_a72.config"
-
 UBOOT_MACHINE:bsp-bb_org-6_1 = "j721e_evm_a72_config"
 UBOOT_CONFIG_FRAGMENTS:bsp-bb_org-6_1 = "j721e_beagleboneai64_a72.config"
 
diff --git a/meta-beagle/conf/machine/beaglebone.conf b/meta-beagle/conf/machine/beaglebone.conf
index 456da618..27c084fc 100644
--- a/meta-beagle/conf/machine/beaglebone.conf
+++ b/meta-beagle/conf/machine/beaglebone.conf
@@ -6,7 +6,6 @@ require conf/machine/include/ti33x.inc
 require conf/machine/include/beagle-bsp.inc
 
 DT_VENDOR_PREFIX = "ti/omap/"
-DT_VENDOR_PREFIX:bsp-ti-6_1 = ""
 DT_VENDOR_PREFIX:bsp-bb_org-6_1 = ""
 
 KERNEL_DEVICETREE_PREFIX = " \
diff --git a/meta-ti-bsp/conf/machine/am62pxx-evm.conf b/meta-ti-bsp/conf/machine/am62pxx-evm.conf
index bb3c34a3..d7d1fa83 100644
--- a/meta-ti-bsp/conf/machine/am62pxx-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62pxx-evm.conf
@@ -29,5 +29,3 @@ UBOOT_MACHINE = "am62px_evm_a53_defconfig"
 # For AM62P tisdk-display-cluster image, splash screen is handled by SBL.
 # Hence, disable the A53 based splash screen using the am62x_evm_prune_splashscreen.config fragment present in ti-u-boot tree
 UBOOT_CONFIG_FRAGMENTS = "${@oe.utils.conditional('DISPLAY_CLUSTER_ENABLE', '1', 'am62x_evm_prune_splashscreen.config', '', d)}"
-
-UBOOT_CONFIG_FRAGMENTS:bsp-ti-6_1 = "${@oe.utils.conditional('DISPLAY_CLUSTER_ENABLE', '1', 'am62px_evm_prune_splashscreen.config', '', d)}"
diff --git a/meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf b/meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf
index 55bc530b..c35edc6e 100644
--- a/meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf
@@ -9,7 +9,3 @@ SYSFW_CONFIG = "evm"
 SYSFW_SUFFIX = "hs-fs"
 
 UBOOT_MACHINE = "am62xsip_evm_r5_defconfig"
-
-UBOOT_MACHINE:bsp-ti-6_1 = "am62x_evm_r5_defconfig"
-
-UBOOT_CONFIG_FRAGMENTS:bsp-ti-6_1 = "am62xsip_sk_r5.config"
diff --git a/meta-ti-bsp/conf/machine/am62xxsip-evm.conf b/meta-ti-bsp/conf/machine/am62xxsip-evm.conf
index 8104329e..38fe04c9 100644
--- a/meta-ti-bsp/conf/machine/am62xxsip-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62xxsip-evm.conf
@@ -14,5 +14,3 @@ KERNEL_DEVICETREE = " \
 "
 
 UBOOT_MACHINE = "am62xsip_evm_a53_defconfig"
-
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
 
diff --git a/meta-ti-bsp/conf/machine/include/ti-bsp.inc b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
index 7c8466c4..0f62702f 100644
--- a/meta-ti-bsp/conf/machine/include/ti-bsp.inc
+++ b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
@@ -3,7 +3,7 @@
 # preferences for kernel, bootloader and graphics components, as
 # well as a dedicated machine override.
 
-# Supported options are: mainline, next, ti-6_12, ti-6_6, ti-6_1
+# Supported options are: mainline, next, ti-6_12, ti-6_6
 TI_PREFERRED_BSP ??= "ti-6_12"
 
 # Use bsp-* namespace for overrides
@@ -77,26 +77,6 @@ BSP_MESA_PVR_VERSION:bsp-ti-6_6 = "23%"
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
index f7c871e1..00000000
--- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.3.6512818.bb
+++ /dev/null
@@ -1,39 +0,0 @@
-DESCRIPTION =  "Kernel drivers for the PowerVR Rogue GPU found in the TI SoCs"
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
diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_22.3.5.bb b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_22.3.5.bb
deleted file mode 100644
index bdc9ce16..00000000
--- a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_22.3.5.bb
+++ /dev/null
@@ -1,62 +0,0 @@
-# PowerVR Graphics require several patches that have not made their way
-# upstream yet. This allows us to build the shims we need without completely
-# clobbering mesa.
-
-require recipes-graphics/mesa/mesa.inc
-
-SUMMARY += " (with PowerVR support for TI platforms)"
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
index 40835439..00000000
--- a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.3.6512818.bb
+++ /dev/null
@@ -1,147 +0,0 @@
-DESCRIPTION = "Userspace libraries for PowerVR Rogue GPU on TI SoCs"
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
-    prefix = f"{d.getVar('S')}/"
-    if package_list:
-        for package in package_list.split():
-            package_file_string = d.getVar(f"FILES:{package}")
-            if package_file_string:
-                for package_file in package_file_string.split():
-                    file_list.append(f"{prefix}{package_file}")
-    return " ".join(file_list)
-
-do_install:prepend() {
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
-        if [ -e ${S}/lib/firmware ]; then
-            mv ${S}/lib/firmware ${S}${nonarch_base_libdir}
-        fi
-    fi
-
-    # clean up any empty directories
-    find "${S}" -empty -type d -delete
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
2.17.1


