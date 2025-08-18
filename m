Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDF27CA0EE4
	for <webhook@archiver.kernel.org>; Mon, 18 Aug 2025 19:01:53 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.1010.1755543709057425623
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 18 Aug 2025 12:01:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=CW7uG8rE;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: afd@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57IJ1mW43228673;
	Mon, 18 Aug 2025 14:01:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755543708;
	bh=oiOjF542uB3mVGzbq+e6YT24CraqSQr/1i89r44usb0=;
	h=From:To:CC:Subject:Date;
	b=CW7uG8rElx+e8a9WVJpVCPpCTLw3abGF2iobHPgQZ7b4fJx8/+VUDkgE2DK3iPO8M
	 wkFwRKAZj4lbfHQqFArgP7H4a+T2WF9234BOPCe5Rf490LElNvy4ix5WTEkvDNq8Ya
	 3+CehDwLkhxZdXknI3R+Sfa9tLj5qvwcvcXDjOOI=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57IJ1msS722453
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 18 Aug 2025 14:01:48 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 18
 Aug 2025 14:01:47 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 18 Aug 2025 14:01:47 -0500
Received: from lelvem-mr06.itg.ti.com ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57IJ1lUl1501283;
	Mon, 18 Aug 2025 14:01:47 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][scarthgap/master][PATCH] meta-ti-bsp: Add all tiboot3.bin and sysfw.itb variants by wildcard
Date: Mon, 18 Aug 2025 14:01:46 -0500
Message-ID: <20250818190146.1371051-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 18 Aug 2025 19:01:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18933

U-Boot generates all the valid versions of tiboot3.bin and sysfw.itb
based on the given defconfig. The defaults are also picked based on
the board's binman files. No need to duplicate this logic here,
simply deploy what U-Boot generates.

Signed-off-by: Andrew Davis <afd@ti.com>
---

This was 2 patches that are now squashed into 1. Doing this in
two steps as before was causing issues with the beaglebone-ai64
which only deploys one version of the files, but folding in the
wildcard matching patch solves that.

 meta-beagle/conf/machine/beaglebone-ai64.conf |  5 ----
 meta-beagle/conf/machine/beagley-ai.conf      |  2 --
 meta-ti-bsp/conf/machine/include/am62axx.inc  |  6 -----
 meta-ti-bsp/conf/machine/include/am62dxx.inc  |  6 -----
 meta-ti-bsp/conf/machine/include/am62pxx.inc  |  6 -----
 meta-ti-bsp/conf/machine/include/am62xx.inc   |  9 -------
 meta-ti-bsp/conf/machine/include/am64xx.inc   |  9 -------
 meta-ti-bsp/conf/machine/include/am65xx.inc   | 11 ++------
 meta-ti-bsp/conf/machine/include/am68.inc     |  6 -----
 meta-ti-bsp/conf/machine/include/am69.inc     |  6 -----
 meta-ti-bsp/conf/machine/include/j7200.inc    | 19 --------------
 meta-ti-bsp/conf/machine/include/j721e.inc    | 25 ++-----------------
 meta-ti-bsp/conf/machine/include/j721s2.inc   |  9 -------
 meta-ti-bsp/conf/machine/include/j722s.inc    |  9 -------
 meta-ti-bsp/conf/machine/include/j742s2.inc   |  6 -----
 meta-ti-bsp/conf/machine/include/j784s4.inc   |  9 -------
 meta-ti-bsp/conf/machine/include/k3.inc       |  2 +-
 17 files changed, 5 insertions(+), 140 deletions(-)

diff --git a/meta-beagle/conf/machine/beaglebone-ai64.conf b/meta-beagle/conf/machine/beaglebone-ai64.conf
index e05c6aff..0504832c 100644
--- a/meta-beagle/conf/machine/beaglebone-ai64.conf
+++ b/meta-beagle/conf/machine/beaglebone-ai64.conf
@@ -5,11 +5,6 @@
 require conf/machine/include/j721e.inc
 require conf/machine/include/beagle-bsp.inc
 
-IMAGE_SR1_1_HS_FS_FILES = ""
-IMAGE_SR1_1_HS_SE_FILES = ""
-IMAGE_SR2_HS_FS_FILES = ""
-IMAGE_SR2_HS_SE_FILES = ""
-
 UBOOT_MACHINE = "j721e_beagleboneai64_a72_defconfig"
 
 SPL_BINARY = "tispl.bin_unsigned"
diff --git a/meta-beagle/conf/machine/beagley-ai.conf b/meta-beagle/conf/machine/beagley-ai.conf
index f7e7ec44..8fbf3cea 100644
--- a/meta-beagle/conf/machine/beagley-ai.conf
+++ b/meta-beagle/conf/machine/beagley-ai.conf
@@ -5,8 +5,6 @@
 require conf/machine/include/j722s.inc
 require conf/machine/include/beagle-bsp.inc
 
-IMAGE_SR1_HS_SE_FILES:bsp-bb_org-6_6 = ""
-
 UBOOT_MACHINE:bsp-bb_org-6_6 = "j722s_evm_a53_config"
 
 UBOOT_MACHINE = "am67a_beagley_ai_a53_defconfig"
diff --git a/meta-ti-bsp/conf/machine/include/am62axx.inc b/meta-ti-bsp/conf/machine/include/am62axx.inc
index e5f827a9..964be0ad 100644
--- a/meta-ti-bsp/conf/machine/include/am62axx.inc
+++ b/meta-ti-bsp/conf/machine/include/am62axx.inc
@@ -7,12 +7,6 @@ MACHINE_FEATURES += "screen touchscreen"
 
 TFA_K3_SYSTEM_SUSPEND = "1"
 
-# Default tiboot3.bin on AM62A is for HS-FS
-IMAGE_BOOT_FILES += "tiboot3-am62ax-hs-fs-evm.bin"
-
-# Since default tiboot3.bin on AM62A is for HS-FS, add a version for HS-SE
-IMAGE_BOOT_FILES += "tiboot3-am62ax-hs-evm.bin"
-
 TFA_BOARD = "lite"
 OPTEEMACHINE = "k3-am62x"
 
diff --git a/meta-ti-bsp/conf/machine/include/am62dxx.inc b/meta-ti-bsp/conf/machine/include/am62dxx.inc
index ac4e8e17..fc2ce4a3 100644
--- a/meta-ti-bsp/conf/machine/include/am62dxx.inc
+++ b/meta-ti-bsp/conf/machine/include/am62dxx.inc
@@ -5,11 +5,5 @@ SOC_FAMILY:append = ":am62dxx"
 
 TFA_K3_SYSTEM_SUSPEND = "1"
 
-# Default tiboot3.bin on AM62D is for HS-FS
-IMAGE_BOOT_FILES += "tiboot3-am62dx-hs-fs-evm.bin"
-
-# Since default tiboot3.bin on AM62D is for HS-FS, add a version for HS-SE
-IMAGE_BOOT_FILES += "tiboot3-am62dx-hs-evm.bin"
-
 TFA_BOARD = "lite"
 OPTEEMACHINE = "k3-am62x"
diff --git a/meta-ti-bsp/conf/machine/include/am62pxx.inc b/meta-ti-bsp/conf/machine/include/am62pxx.inc
index 061d0e67..d59f607d 100644
--- a/meta-ti-bsp/conf/machine/include/am62pxx.inc
+++ b/meta-ti-bsp/conf/machine/include/am62pxx.inc
@@ -8,12 +8,6 @@ MACHINE_FEATURES += "screen gpu"
 require conf/machine/include/mesa-pvr.inc
 PREFERRED_PROVIDER_virtual/gpudriver ?= "${BSP_ROGUE_DRIVER_PROVIDER}"
 
-# Default tiboot3.bin on AM62Px is for HS-FS
-IMAGE_BOOT_FILES += "tiboot3-am62px-hs-fs-evm.bin"
-
-# Since default tiboot3.bin on AM62Px is for HS-FS, add a version for HS-SE
-IMAGE_BOOT_FILES += "tiboot3-am62px-hs-evm.bin"
-
 TFA_BOARD = "lite"
 TFA_K3_SYSTEM_SUSPEND = "1"
 
diff --git a/meta-ti-bsp/conf/machine/include/am62xx.inc b/meta-ti-bsp/conf/machine/include/am62xx.inc
index 1eb77b4e..74054a78 100644
--- a/meta-ti-bsp/conf/machine/include/am62xx.inc
+++ b/meta-ti-bsp/conf/machine/include/am62xx.inc
@@ -8,15 +8,6 @@ MACHINE_FEATURES += "screen gpu"
 require conf/machine/include/mesa-pvr.inc
 PREFERRED_PROVIDER_virtual/gpudriver ?= "${BSP_ROGUE_DRIVER_PROVIDER}"
 
-# Default tiboot3.bin on AM62x is for HS-FS
-IMAGE_BOOT_FILES += "tiboot3-am62x-hs-fs-evm.bin"
-
-# Since default tiboot3.bin on AM62x is for HS-FS, add a version for GP
-IMAGE_BOOT_FILES += "tiboot3-am62x-gp-evm.bin"
-
-# Since default tiboot3.bin on AM62x is for HS-FS, add a version for HS-SE
-IMAGE_BOOT_FILES += "tiboot3-am62x-hs-evm.bin"
-
 # Bitmap image tarball for early splashscreen
 IMAGE_BOOT_FILES += "ti_logo_414x97_32bpp.bmp.gz"
 
diff --git a/meta-ti-bsp/conf/machine/include/am64xx.inc b/meta-ti-bsp/conf/machine/include/am64xx.inc
index 27165547..e79e6e61 100644
--- a/meta-ti-bsp/conf/machine/include/am64xx.inc
+++ b/meta-ti-bsp/conf/machine/include/am64xx.inc
@@ -20,15 +20,6 @@ KERNEL_DEVICETREE = " \
     ti/k3-am642-tqma64xxl-mbax4xxl.dtb \
 "
 
-# Default tiboot3.bin on AM64x is for SR2.0 HS-FS
-IMAGE_BOOT_FILES += "tiboot3-am64x_sr2-hs-fs-evm.bin"
-
-# Since default tiboot3.bin on AM64x is for SR2.0 HS-FS, add a version for GP
-IMAGE_BOOT_FILES += "tiboot3-am64x-gp-evm.bin"
-
-# Since default tiboot3.bin on AM64x is for SR2.0 HS-FS, add a version for SR2.0 HS-SE
-IMAGE_BOOT_FILES += "tiboot3-am64x_sr2-hs-evm.bin"
-
 TFA_BOARD = "lite"
 
 OPTEEMACHINE = "k3-am64x"
diff --git a/meta-ti-bsp/conf/machine/include/am65xx.inc b/meta-ti-bsp/conf/machine/include/am65xx.inc
index 99a3b12f..7255bb30 100644
--- a/meta-ti-bsp/conf/machine/include/am65xx.inc
+++ b/meta-ti-bsp/conf/machine/include/am65xx.inc
@@ -25,15 +25,8 @@ KERNEL_DEVICETREE = " \
     ti/k3-am6548-iot2050-advanced.dtb \
 "
 
-IMAGE_BOOT_FILES += "sysfw.itb"
-
-# Default on AM65x is for GP
-IMAGE_BOOT_FILES += "tiboot3-am65x_sr2-gp-evm.bin"
-IMAGE_BOOT_FILES += "sysfw-am65x_sr2-gp-evm.itb"
-
-# Since default on AM65x is for GP, add a version for HS-SE
-IMAGE_BOOT_FILES += "tiboot3-am65x_sr2-hs-evm.bin"
-IMAGE_BOOT_FILES += "sysfw-am65x_sr2-hs-evm.itb"
+# Deploy SYSFW and any variants
+IMAGE_BOOT_FILES += "sysfw.itb sysfw-*-evm.itb"
 
 TFA_BOARD = "generic"
 
diff --git a/meta-ti-bsp/conf/machine/include/am68.inc b/meta-ti-bsp/conf/machine/include/am68.inc
index 330a2973..b6d18fe0 100644
--- a/meta-ti-bsp/conf/machine/include/am68.inc
+++ b/meta-ti-bsp/conf/machine/include/am68.inc
@@ -8,12 +8,6 @@ MACHINE_FEATURES += "screen gpu"
 require conf/machine/include/mesa-pvr.inc
 PREFERRED_PROVIDER_virtual/gpudriver ?= "${BSP_ROGUE_DRIVER_PROVIDER}"
 
-# Default tiboot3.bin on AM68 is for SR1.0 HS-FS
-IMAGE_BOOT_FILES += "tiboot3-j721s2-hs-fs-evm.bin"
-
-# Since default tiboot3.bin on AM68 is for HS-FS, add a version for SR1.0 HS-SE
-IMAGE_BOOT_FILES += "tiboot3-j721s2-hs-evm.bin"
-
 TFA_BOARD = "generic"
 
 OPTEEMACHINE = "k3-j784s4"
diff --git a/meta-ti-bsp/conf/machine/include/am69.inc b/meta-ti-bsp/conf/machine/include/am69.inc
index 1a19410a..759984ea 100644
--- a/meta-ti-bsp/conf/machine/include/am69.inc
+++ b/meta-ti-bsp/conf/machine/include/am69.inc
@@ -8,12 +8,6 @@ MACHINE_FEATURES += "screen gpu"
 require conf/machine/include/mesa-pvr.inc
 PREFERRED_PROVIDER_virtual/gpudriver ?= "${BSP_ROGUE_DRIVER_PROVIDER}"
 
-# Default tiboot3.bin on AM69 is for SR1.0 HS-FS
-IMAGE_BOOT_FILES += "tiboot3-j784s4-hs-fs-evm.bin"
-
-# Since default tiboot3.bin on AM69 is for HS-FS, add a version for SR1.0 HS-SE
-IMAGE_BOOT_FILES += "tiboot3-j784s4-hs-evm.bin"
-
 TFA_BOARD = "j784s4"
 
 OPTEEMACHINE = "k3-j784s4"
diff --git a/meta-ti-bsp/conf/machine/include/j7200.inc b/meta-ti-bsp/conf/machine/include/j7200.inc
index 3cba71b6..be5cb4cd 100644
--- a/meta-ti-bsp/conf/machine/include/j7200.inc
+++ b/meta-ti-bsp/conf/machine/include/j7200.inc
@@ -3,25 +3,6 @@ require conf/machine/include/mc_k3r5.inc
 
 SOC_FAMILY:append = ":j7200"
 
-# Default tiboot3.bin on J7200 is for GP
-IMAGE_BOOT_FILES += "tiboot3-j7200-gp-evm.bin"
-
-# Since default tiboot3.bin on J7200 is for GP, add a version for SR1.0 HS-FS
-IMAGE_SR1_HS_FS_FILES = "tiboot3-j7200-hs-fs-evm.bin"
-IMAGE_SR1_HS_FS_FILES:bsp-mainline = ""
-IMAGE_BOOT_FILES += "${IMAGE_SR1_HS_FS_FILES}"
-
-# Since default tiboot3.bin on J7200 is for GP, add a version for SR1.0 HS-SE
-IMAGE_SR1_HS_SE_FILES = "tiboot3-j7200-hs-evm.bin"
-IMAGE_SR1_HS_SE_FILES:bsp-mainline = ""
-IMAGE_BOOT_FILES += "${IMAGE_SR1_HS_SE_FILES}"
-
-# Since default tiboot3.bin on J7200 is for GP, add a version for SR2.0 HS-FS
-IMAGE_BOOT_FILES += "tiboot3-j7200_sr2-hs-fs-evm.bin"
-
-# Since default tiboot3.bin on J721e is for GP, add a version for SR2.0 HS-SE
-IMAGE_BOOT_FILES += "tiboot3-j7200_sr2-hs-evm.bin"
-
 TFA_BOARD = "generic"
 
 OPTEEMACHINE = "k3-j721e"
diff --git a/meta-ti-bsp/conf/machine/include/j721e.inc b/meta-ti-bsp/conf/machine/include/j721e.inc
index 5833c322..f9fdac0c 100644
--- a/meta-ti-bsp/conf/machine/include/j721e.inc
+++ b/meta-ti-bsp/conf/machine/include/j721e.inc
@@ -8,29 +8,8 @@ MACHINE_FEATURES += "screen gpu"
 require conf/machine/include/mesa-pvr.inc
 PREFERRED_PROVIDER_virtual/gpudriver ?= "${BSP_ROGUE_DRIVER_PROVIDER}"
 
-IMAGE_BOOT_FILES += "sysfw.itb"
-
-# Default on J721e is for GP
-IMAGE_BOOT_FILES += "tiboot3-j721e-gp-evm.bin"
-IMAGE_BOOT_FILES += "sysfw-j721e-gp-evm.itb"
-
-# Since default on J721e is for GP, add a version for SR1.1 HS-FS
-IMAGE_SR1_1_HS_FS_FILES = "tiboot3-j721e_sr1_1-hs-fs-evm.bin sysfw-j721e_sr1_1-hs-fs-evm.itb"
-IMAGE_SR1_1_HS_FS_FILES:bsp-mainline = ""
-IMAGE_BOOT_FILES += "${IMAGE_SR1_1_HS_FS_FILES}"
-
-# Since default on J721e is for GP, add a version for SR1.1 HS-SE
-IMAGE_SR1_1_HS_SE_FILES = "tiboot3-j721e_sr1_1-hs-evm.bin sysfw-j721e_sr1_1-hs-evm.itb"
-IMAGE_BOOT_FILES += "${IMAGE_SR1_1_HS_SE_FILES}"
-
-# Since default on J721e is for GP, add a version for SR2.0 HS-FS
-IMAGE_SR2_HS_FS_FILES = "tiboot3-j721e_sr2-hs-fs-evm.bin sysfw-j721e_sr2-hs-fs-evm.itb"
-IMAGE_BOOT_FILES += "${IMAGE_SR2_HS_FS_FILES}"
-
-# Since default on J721e is for GP, add a version for SR2.0 HS-SE
-IMAGE_SR2_HS_SE_FILES = "tiboot3-j721e_sr2-hs-evm.bin sysfw-j721e_sr2-hs-evm.itb"
-IMAGE_SR2_HS_SE_FILES:bsp-mainline = ""
-IMAGE_BOOT_FILES += "${IMAGE_SR2_HS_SE_FILES}"
+# Deploy SYSFW and any variants
+IMAGE_BOOT_FILES += "sysfw.itb sysfw-*-evm.itb"
 
 TFA_BOARD = "generic"
 
diff --git a/meta-ti-bsp/conf/machine/include/j721s2.inc b/meta-ti-bsp/conf/machine/include/j721s2.inc
index e6e4f162..b6d18fe0 100644
--- a/meta-ti-bsp/conf/machine/include/j721s2.inc
+++ b/meta-ti-bsp/conf/machine/include/j721s2.inc
@@ -8,15 +8,6 @@ MACHINE_FEATURES += "screen gpu"
 require conf/machine/include/mesa-pvr.inc
 PREFERRED_PROVIDER_virtual/gpudriver ?= "${BSP_ROGUE_DRIVER_PROVIDER}"
 
-# Default tiboot3.bin on J721S2 is for GP
-IMAGE_BOOT_FILES += "tiboot3-j721s2-gp-evm.bin"
-
-# Since default tiboot3.bin on J721S2 is for GP, add a version for SR1.0 HS-FS
-IMAGE_BOOT_FILES += "tiboot3-j721s2-hs-fs-evm.bin"
-
-# Since default tiboot3.bin on J721S2 is for GP, add a version for SR1.0 HS-SE
-IMAGE_BOOT_FILES += "tiboot3-j721s2-hs-evm.bin"
-
 TFA_BOARD = "generic"
 
 OPTEEMACHINE = "k3-j784s4"
diff --git a/meta-ti-bsp/conf/machine/include/j722s.inc b/meta-ti-bsp/conf/machine/include/j722s.inc
index e0b77d96..8a02441b 100644
--- a/meta-ti-bsp/conf/machine/include/j722s.inc
+++ b/meta-ti-bsp/conf/machine/include/j722s.inc
@@ -8,15 +8,6 @@ MACHINE_FEATURES += "screen gpu"
 require conf/machine/include/mesa-pvr.inc
 PREFERRED_PROVIDER_virtual/gpudriver ?= "${BSP_ROGUE_DRIVER_PROVIDER}"
 
-# Default tiboot3.bin on J722S is for HS-FS
-IMAGE_BOOT_FILES += "tiboot3-j722s-hs-fs-evm.bin"
-
-# Since default tiboot3.bin on J722S is for HS-FS, add a version for HS-SE
-IMAGE_SR1_HS_SE_FILES = "tiboot3-j722s-hs-evm.bin"
-IMAGE_SR1_HS_SE_FILES:bsp-mainline = ""
-IMAGE_SR1_HS_SE_FILES:bsp-next = ""
-IMAGE_BOOT_FILES += "${IMAGE_SR1_HS_SE_FILES}"
-
 TFA_BOARD = "lite"
 TFA_K3_SYSTEM_SUSPEND = "1"
 
diff --git a/meta-ti-bsp/conf/machine/include/j742s2.inc b/meta-ti-bsp/conf/machine/include/j742s2.inc
index 9a54e11e..d2de1d0d 100644
--- a/meta-ti-bsp/conf/machine/include/j742s2.inc
+++ b/meta-ti-bsp/conf/machine/include/j742s2.inc
@@ -8,12 +8,6 @@ MACHINE_FEATURES += "screen gpu"
 require conf/machine/include/mesa-pvr.inc
 PREFERRED_PROVIDER_virtual/gpudriver ?= "${BSP_ROGUE_DRIVER_PROVIDER}"
 
-# Default tiboot3.bin on J742S2 is for HS-FS
-IMAGE_BOOT_FILES += "tiboot3-j742s2-hs-fs-evm.bin"
-
-# Since default tiboot3.bin on J742S2 is for HS-FS, add a version for SR1.0 HS-SE
-IMAGE_BOOT_FILES += "tiboot3-j742s2-hs-evm.bin"
-
 TFA_BOARD = "j784s4"
 
 OPTEEMACHINE = "k3-j784s4"
diff --git a/meta-ti-bsp/conf/machine/include/j784s4.inc b/meta-ti-bsp/conf/machine/include/j784s4.inc
index 33224ee3..759984ea 100644
--- a/meta-ti-bsp/conf/machine/include/j784s4.inc
+++ b/meta-ti-bsp/conf/machine/include/j784s4.inc
@@ -8,15 +8,6 @@ MACHINE_FEATURES += "screen gpu"
 require conf/machine/include/mesa-pvr.inc
 PREFERRED_PROVIDER_virtual/gpudriver ?= "${BSP_ROGUE_DRIVER_PROVIDER}"
 
-# Default tiboot3.bin on J784S4 is for GP
-IMAGE_BOOT_FILES += "tiboot3-j784s4-gp-evm.bin"
-
-# Since default tiboot3.bin on J784S4 is for GP, add a version for SR1.0 HS-FS
-IMAGE_BOOT_FILES += "tiboot3-j784s4-hs-fs-evm.bin"
-
-# Since default tiboot3.bin on J784S4 is for GP, add a version for SR1.0 HS-SE
-IMAGE_BOOT_FILES += "tiboot3-j784s4-hs-evm.bin"
-
 TFA_BOARD = "j784s4"
 
 OPTEEMACHINE = "k3-j784s4"
diff --git a/meta-ti-bsp/conf/machine/include/k3.inc b/meta-ti-bsp/conf/machine/include/k3.inc
index fdcf193d..d17ae71b 100644
--- a/meta-ti-bsp/conf/machine/include/k3.inc
+++ b/meta-ti-bsp/conf/machine/include/k3.inc
@@ -44,7 +44,7 @@ MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "ti-pka-fw"
 
 IMAGE_FSTYPES += "tar.xz wic.xz wic.bmap"
 
-IMAGE_BOOT_FILES ?= "${SPL_BINARYNAME} u-boot.${UBOOT_SUFFIX} tiboot3.bin"
+IMAGE_BOOT_FILES ?= "${SPL_BINARYNAME} u-boot.${UBOOT_SUFFIX} tiboot3.bin tiboot3-*-evm.bin"
 IMAGE_EFI_BOOT_FILES ?= "${IMAGE_BOOT_FILES}"
 
 EFI_PROVIDER ?= "grub-efi"
-- 
2.39.2


