Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC921E77184
	for <webhook@archiver.kernel.org>; Thu, 19 Dec 2024 21:54:06 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.139700.1734645245502178803
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 19 Dec 2024 13:54:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=qlDbMFWw;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4BJLs4jT025118;
	Thu, 19 Dec 2024 15:54:04 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1734645244;
	bh=qeRmjIU9ZzyXVWmAljjlW42jDIk8bfvv/kQEE72k+EY=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=qlDbMFWwoQLbZOjJ6Z1lWKidqBe6A/XWL/BhNBgMA5MhVTvXJSx1ViZViH+I+d3t1
	 5ehNBeMlcoK5wOyAIX8u14IxB0uE87T6m0h8L2vnu9cORGyA5zLuH2Lo0dLpfFmVQy
	 4fpTztDfmEXnYjq6liP2AluVbf4X/kjGtwu+C3nk=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BJLs4xj050864;
	Thu, 19 Dec 2024 15:54:04 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 19
 Dec 2024 15:54:03 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 19 Dec 2024 15:54:03 -0600
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BJLs35K066830;
	Thu, 19 Dec 2024 15:54:03 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1tOOT5-0007ce-OT; Thu, 19 Dec 2024 15:54:03 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][scarthgap][PATCH 11/13] beagle-bsp, linux-bb.org, u-boot-bb.org: add support for 6.6 BSP
Date: Thu, 19 Dec 2024 15:54:00 -0600
Message-ID: <20241219215402.28324-12-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241219215402.28324-1-reatmon@ti.com>
References: <20241219215402.28324-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 19 Dec 2024 21:54:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18158

From: Denys Dmytriyenko <denys@konsulko.com>

Most Beagle platforms are switching to 6.6 based Linux kernel and U-boot
2024.10. Add corresponding recipes and extend beagle-bsp with required
settings.

BeagleY-AI for now remains on 6.1 BSP with U-boot 2023.04.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-beagle/conf/machine/beagle-x15.conf      |  2 +-
 .../conf/machine/beaglebone-ai64-k3r5.conf    |  8 ++-
 meta-beagle/conf/machine/beaglebone-ai64.conf | 19 ++++--
 meta-beagle/conf/machine/beaglebone.conf      |  2 +-
 meta-beagle/conf/machine/beagleplay-k3r5.conf |  5 +-
 meta-beagle/conf/machine/beagleplay.conf      | 37 +++++++++-
 meta-beagle/conf/machine/beagley-ai-k3r5.conf |  4 +-
 meta-beagle/conf/machine/beagley-ai.conf      |  6 +-
 .../conf/machine/include/beagle-bsp.inc       | 47 +++++++++----
 .../u-boot/u-boot-bb.org_2024.10.bb           | 12 ++++
 .../defconfig                                 |  0
 .../recipes-kernel/linux/linux-bb.org_6.6.bb  | 68 +++++++++++++++++++
 12 files changed, 179 insertions(+), 31 deletions(-)
 create mode 100644 meta-beagle/recipes-bsp/u-boot/u-boot-bb.org_2024.10.bb
 copy meta-beagle/recipes-kernel/linux/{linux-bb.org-6.1 => linux-bb.org-6.6}/defconfig (100%)
 create mode 100644 meta-beagle/recipes-kernel/linux/linux-bb.org_6.6.bb

diff --git a/meta-beagle/conf/machine/beagle-x15.conf b/meta-beagle/conf/machine/beagle-x15.conf
index e9ab5d40..8ad028f4 100644
--- a/meta-beagle/conf/machine/beagle-x15.conf
+++ b/meta-beagle/conf/machine/beagle-x15.conf
@@ -7,7 +7,7 @@ require conf/machine/include/beagle-bsp.inc
 
 DT_VENDOR_PREFIX = "ti/omap/"
 DT_VENDOR_PREFIX:bsp-ti-6_1 = ""
-DT_VENDOR_PREFIX:bsp-bb_org = ""
+DT_VENDOR_PREFIX:bsp-bb_org-6_1 = ""
 
 KERNEL_DEVICETREE_PREFIX = " \
 ${DT_VENDOR_PREFIX}am57xx-beagle-x15 \
diff --git a/meta-beagle/conf/machine/beaglebone-ai64-k3r5.conf b/meta-beagle/conf/machine/beaglebone-ai64-k3r5.conf
index 95d3abc0..4574f82b 100644
--- a/meta-beagle/conf/machine/beaglebone-ai64-k3r5.conf
+++ b/meta-beagle/conf/machine/beaglebone-ai64-k3r5.conf
@@ -15,8 +15,10 @@ UBOOT_BINARY = "tiboot3.${UBOOT_SUFFIX}"
 UBOOT_IMAGE = "tiboot3-${MAINMACHINE}-${PV}-${PR}.${UBOOT_SUFFIX}"
 UBOOT_SYMLINK = "tiboot3-${MAINMACHINE}.${UBOOT_SUFFIX}"
 
-UBOOT_MACHINE = "j721e_evm_r5_defconfig"
-UBOOT_MACHINE:bsp-ti-6_6 = "j721e_beagleboneai64_r5_defconfig"
+UBOOT_MACHINE = "j721e_beagleboneai64_r5_defconfig"
 
-UBOOT_CONFIG_FRAGMENTS:bsp-bb_org = "j721e_beagleboneai64_r5.config"
+UBOOT_MACHINE:bsp-ti-6_1 = "j721e_evm_r5_defconfig"
 UBOOT_CONFIG_FRAGMENTS:bsp-ti-6_1 = "j721e_beagleboneai64_r5.config"
+
+UBOOT_MACHINE:bsp-bb_org-6_1 = "j721e_evm_r5_defconfig"
+UBOOT_CONFIG_FRAGMENTS:bsp-bb_org-6_1 = "j721e_beagleboneai64_r5.config"
diff --git a/meta-beagle/conf/machine/beaglebone-ai64.conf b/meta-beagle/conf/machine/beaglebone-ai64.conf
index faffd0bb..a521c8cf 100644
--- a/meta-beagle/conf/machine/beaglebone-ai64.conf
+++ b/meta-beagle/conf/machine/beaglebone-ai64.conf
@@ -5,18 +5,25 @@
 require conf/machine/include/j721e.inc
 require conf/machine/include/beagle-bsp.inc
 
-IMAGE_SR1_1_HS_FS_FILES:bsp-bb_org = ""
-IMAGE_SR2_HS_SE_FILES:bsp-bb_org = ""
+IMAGE_SR1_1_HS_FS_FILES = ""
+IMAGE_SR1_1_HS_SE_FILES = ""
+IMAGE_SR2_HS_FS_FILES = ""
+IMAGE_SR2_HS_SE_FILES = ""
 
-UBOOT_MACHINE = "j721e_evm_a72_config"
-UBOOT_MACHINE:bsp-ti-6_6 = "j721e_beagleboneai64_a72_defconfig"
+UBOOT_MACHINE = "j721e_beagleboneai64_a72_defconfig"
 
+UBOOT_MACHINE:bsp-ti-6_1 = "j721e_evm_a72_config"
 UBOOT_CONFIG_FRAGMENTS:bsp-ti-6_1 = "j721e_beagleboneai64_a72.config"
-UBOOT_CONFIG_FRAGMENTS:bsp-bb_org = "j721e_beagleboneai64_a72.config"
+
+UBOOT_MACHINE:bsp-bb_org-6_1 = "j721e_evm_a72_config"
+UBOOT_CONFIG_FRAGMENTS:bsp-bb_org-6_1 = "j721e_beagleboneai64_a72.config"
 
 SPL_BINARY:bsp-ti-6_6 = "tispl.bin_unsigned"
 SPL_BINARYNAME:bsp-ti-6_6 = "tispl.bin"
 
+SPL_BINARY:bsp-bb_org-6_6 = "tispl.bin_unsigned"
+SPL_BINARYNAME:bsp-bb_org-6_6 = "tispl.bin"
+
 KERNEL_DEVICETREE_PREFIX = " \
     ti/k3-j721e \
 "
@@ -29,7 +36,7 @@ ti/k3-j721e-evm-quad-port-eth-exp.dtbo \
 ti/k3-j721e-sk.dtb \
 "
 
-KERNEL_DEVICETREE:append:bsp-bb_org = " \
+KERNEL_DEVICETREE:append:bsp-bb_org-6_1 = " \
 ti/k3-j721e-beagleboneai64-dsi-rpi-7inch-panel.dtbo \
 ti/k3-j721e-common-proc-board-infotainment.dtbo \
 ti/k3-j721e-evm-csi2-ov5640.dtbo \
diff --git a/meta-beagle/conf/machine/beaglebone.conf b/meta-beagle/conf/machine/beaglebone.conf
index 6048383b..456da618 100644
--- a/meta-beagle/conf/machine/beaglebone.conf
+++ b/meta-beagle/conf/machine/beaglebone.conf
@@ -7,7 +7,7 @@ require conf/machine/include/beagle-bsp.inc
 
 DT_VENDOR_PREFIX = "ti/omap/"
 DT_VENDOR_PREFIX:bsp-ti-6_1 = ""
-DT_VENDOR_PREFIX:bsp-bb_org = ""
+DT_VENDOR_PREFIX:bsp-bb_org-6_1 = ""
 
 KERNEL_DEVICETREE_PREFIX = " \
 ${DT_VENDOR_PREFIX}am335x-bone \
diff --git a/meta-beagle/conf/machine/beagleplay-k3r5.conf b/meta-beagle/conf/machine/beagleplay-k3r5.conf
index 1423aa10..3e7f0c1b 100644
--- a/meta-beagle/conf/machine/beagleplay-k3r5.conf
+++ b/meta-beagle/conf/machine/beagleplay-k3r5.conf
@@ -3,6 +3,9 @@
 #@DESCRIPTION: Machine configuration for the BeaglePlay (R5F core)
 
 require conf/machine/beagleplay-ti-k3r5.conf
+
 require conf/machine/include/beagle-bsp.inc
 
-UBOOT_CONFIG_FRAGMENTS:bsp-bb_org = "am625_beagleplay_r5.config"
+UBOOT_MACHINE:bsp-bb_org-6_6 = "am62x_beagleplay_r5_defconfig"
+
+UBOOT_CONFIG_FRAGMENTS:bsp-bb_org-6_1 = "am625_beagleplay_r5.config"
diff --git a/meta-beagle/conf/machine/beagleplay.conf b/meta-beagle/conf/machine/beagleplay.conf
index 1977b4c1..b1a463e1 100644
--- a/meta-beagle/conf/machine/beagleplay.conf
+++ b/meta-beagle/conf/machine/beagleplay.conf
@@ -3,11 +3,17 @@
 #@DESCRIPTION: Machine configuration for the BeaglePlay board (A53 core)
 
 require conf/machine/beagleplay-ti.conf
+
 require conf/machine/include/beagle-bsp.inc
 
-UBOOT_CONFIG_FRAGMENTS:bsp-bb_org = "am625_beagleplay_a53.config"
+UBOOT_MACHINE:bsp-bb_org-6_6 = "am62x_beagleplay_a53_defconfig"
+
+UBOOT_CONFIG_FRAGMENTS:bsp-bb_org-6_1 = "am625_beagleplay_a53.config"
+
+SPL_BINARY:bsp-bb_org-6_6 = "tispl.bin_unsigned"
+SPL_BINARYNAME:bsp-bb_org-6_6 = "tispl.bin"
 
-KERNEL_DEVICETREE:append:bsp-bb_org = " \
+KERNEL_DEVICETREE:append:bsp-bb_org-6_1 = " \
 ti/k3-am625-beagleplay-csi2-ov5640.dtbo \
 ti/k3-am625-beagleplay-csi2-tevi-ov5640.dtbo \
 ti/k3-am625-beagleplay-lincolntech-lcd185-panel.dtbo \
@@ -43,3 +49,30 @@ ti/k3-am62x-sk-hdmi-disable-fastboot.dtbo \
 ti/k3-am62x-sk-lpm-wkup-sources.dtbo \
 ti/k3-am62x-sk-mcan.dtbo \
 "
+
+KERNEL_DEVICETREE:append:bsp-bb_org-6_6 = " \
+ti/k3-am625-beagleplay-csi2-ov5640.dtbo \
+ti/k3-am625-beagleplay-csi2-tevi-ov5640.dtbo \
+ti/k3-am625-beagleplay.dtb \
+ti/k3-am625-beagleplay-lincolntech-lcd185-panel.dtbo \
+ti/k3-am625-minimal.dtb \
+ti/k3-am625-sk.dtb \
+ti/k3-am625-sk-ecap-capture.dtbo \
+ti/k3-am625-sk-lincolntech-lcd185-panel.dtbo \
+ti/k3-am625-sk-m2-cc3301.dtbo \
+ti/k3-am625-sk-mcspi-loopback.dtbo \
+ti/k3-am625-sk-microtips-mf101hie-panel.dtbo \
+ti/k3-am625-sk-rpi-hdr-ehrpwm.dtbo \
+ti/k3-am62x-sk-csi2-imx219.dtbo \
+ti/k3-am62x-sk-csi2-ov5640.dtbo \
+ti/k3-am62x-sk-csi2-tevi-ov5640.dtbo \
+ti/k3-am62x-sk-csi2-v3link-fusion.dtbo \
+ti/k3-am62x-sk-dmtimer-pwm.dtbo \
+ti/k3-am62x-sk-eqep.dtbo \
+ti/k3-am62x-sk-fastboot-disable-hdmi.dtbo \
+ti/k3-am62x-sk-hdmi-audio.dtbo \
+ti/k3-am62x-sk-lpm-wkup-sources.dtbo \
+ti/k3-am62x-sk-mcan.dtbo \
+ti/k3-am62x-sk-microtips-mf103hie-lcd2.dtbo \
+ti/k3-am62x-sk-pwm.dtbo \
+"
diff --git a/meta-beagle/conf/machine/beagley-ai-k3r5.conf b/meta-beagle/conf/machine/beagley-ai-k3r5.conf
index 87462e72..6cc370d1 100644
--- a/meta-beagle/conf/machine/beagley-ai-k3r5.conf
+++ b/meta-beagle/conf/machine/beagley-ai-k3r5.conf
@@ -3,6 +3,8 @@
 #@DESCRIPTION: Machine configuration for the BeagleY AI (R5F core)
 
 require conf/machine/include/k3r5.inc
+
+TI_PREFERRED_BSP ?= "bb_org-6_1"
 require conf/machine/include/beagle-bsp.inc
 
 SYSFW_SOC = "j722s"
@@ -11,4 +13,4 @@ SYSFW_SUFFIX = "hs-fs"
 
 UBOOT_MACHINE = "j722s_evm_r5_defconfig"
 
-UBOOT_CONFIG_FRAGMENTS:bsp-bb_org = "am67a_beagley_ai_r5.config"
+UBOOT_CONFIG_FRAGMENTS:bsp-bb_org-6_1 = "am67a_beagley_ai_r5.config"
diff --git a/meta-beagle/conf/machine/beagley-ai.conf b/meta-beagle/conf/machine/beagley-ai.conf
index 8dcc9b14..9b1832d2 100644
--- a/meta-beagle/conf/machine/beagley-ai.conf
+++ b/meta-beagle/conf/machine/beagley-ai.conf
@@ -3,11 +3,13 @@
 #@DESCRIPTION: Machine configuration for the BeagleY AI board (A53 core)
 
 require conf/machine/include/j722s.inc
+
+TI_PREFERRED_BSP ?= "bb_org-6_1"
 require conf/machine/include/beagle-bsp.inc
 
 UBOOT_MACHINE = "j722s_evm_a53_config"
 
-UBOOT_CONFIG_FRAGMENTS:bsp-bb_org = "am67a_beagley_ai_a53.config"
+UBOOT_CONFIG_FRAGMENTS:bsp-bb_org-6_1 = "am67a_beagley_ai_a53.config"
 
 KERNEL_DEVICETREE_PREFIX = " \
     ti/k3-j722s \
@@ -15,7 +17,7 @@ KERNEL_DEVICETREE_PREFIX = " \
 
 KERNEL_DEVICETREE = ""
 
-KERNEL_DEVICETREE:append:bsp-bb_org = " \
+KERNEL_DEVICETREE:append:bsp-bb_org-6_1 = " \
 ti/k3-j722s-evm.dtb \
 ti/k3-am67a-beagley-ai.dtb \
 "
diff --git a/meta-beagle/conf/machine/include/beagle-bsp.inc b/meta-beagle/conf/machine/include/beagle-bsp.inc
index 77d0b483..34889b41 100644
--- a/meta-beagle/conf/machine/include/beagle-bsp.inc
+++ b/meta-beagle/conf/machine/include/beagle-bsp.inc
@@ -1,24 +1,43 @@
 # Use meta-ti-bsp "multi-BSP" facility to create a custom "bb_org" BSP profile
 # with default preferences for Beagle platforms
 
-# Default is bb_org, but can override with any of the existing options
-TI_PREFERRED_BSP ?= "bb_org"
+# Default is bb_org-6_6, but can override with any of the existing options
+TI_PREFERRED_BSP ?= "bb_org-6_6"
 
 # ==========
-# bb_org
+# bb_org-6_1
 # BeagleBoard.org kernel 6.1, u-boot 2023.04
 # based on TI staging trees with extra Beagle-specific features
 # but may not be up-to-date with TI version
 # ==========
-BSP_KERNEL_PROVIDER:bsp-bb_org = "linux-bb.org"
-BSP_KERNEL_VERSION:bsp-bb_org = "%"
-BSP_BOOTLOADER_PROVIDER:bsp-bb_org = "u-boot-bb.org"
-BSP_BOOTLOADER_VERSION:bsp-bb_org = "%"
+BSP_KERNEL_PROVIDER:bsp-bb_org-6_1 = "linux-bb.org"
+BSP_KERNEL_VERSION:bsp-bb_org-6_1 = "6.1.%"
+BSP_BOOTLOADER_PROVIDER:bsp-bb_org-6_1 = "u-boot-bb.org"
+BSP_BOOTLOADER_VERSION:bsp-bb_org-6_1 = "2023.%"
 
-BSP_SGX_DRIVER_PROVIDER:bsp-bb_org = "ti-sgx-ddk-km"
-BSP_SGX_DRIVER_VERSION:bsp-bb_org = "1.17%"
-BSP_SGX_UMLIBS_VERSION:bsp-bb_org = "1.17%"
-BSP_ROGUE_DRIVER_PROVIDER:bsp-bb_org = "ti-img-rogue-driver"
-BSP_ROGUE_DRIVER_VERSION:bsp-bb_org = "23%"
-BSP_ROGUE_UMLIBS_VERSION:bsp-bb_org = "23%"
-BSP_MESA_PVR_VERSION:bsp-bb_org = "22%"
+BSP_SGX_DRIVER_PROVIDER:bsp-bb_org-6_1 = "ti-sgx-ddk-km"
+BSP_SGX_DRIVER_VERSION:bsp-bb_org-6_1 = "1.17%"
+BSP_SGX_UMLIBS_VERSION:bsp-bb_org-6_1 = "1.17%"
+BSP_ROGUE_DRIVER_PROVIDER:bsp-bb_org-6_1 = "ti-img-rogue-driver"
+BSP_ROGUE_DRIVER_VERSION:bsp-bb_org-6_1 = "23%"
+BSP_ROGUE_UMLIBS_VERSION:bsp-bb_org-6_1 = "23%"
+BSP_MESA_PVR_VERSION:bsp-bb_org-6_1 = "22%"
+
+# ==========
+# bb_org-6_6
+# BeagleBoard.org kernel 6.6, Upstream u-boot 2024.07
+# based on TI staging trees with extra Beagle-specific features
+# but may not be up-to-date with TI version
+# ==========
+BSP_KERNEL_PROVIDER:bsp-bb_org-6_6 = "linux-bb.org"
+BSP_KERNEL_VERSION:bsp-bb_org-6_6 = "6.6.%"
+BSP_BOOTLOADER_PROVIDER:bsp-bb_org-6_6 = "u-boot-bb.org"
+BSP_BOOTLOADER_VERSION:bsp-bb_org-6_6 = "2024.%"
+
+BSP_SGX_DRIVER_PROVIDER:bsp-bb_org-6_6 = "ti-sgx-ddk-km"
+BSP_SGX_DRIVER_VERSION:bsp-bb_org-6_6 = "1.17%"
+BSP_SGX_UMLIBS_VERSION:bsp-bb_org-6_6 = "1.17%"
+BSP_ROGUE_DRIVER_PROVIDER:bsp-bb_org-6_6 = "ti-img-rogue-driver"
+BSP_ROGUE_DRIVER_VERSION:bsp-bb_org-6_6 = "24%"
+BSP_ROGUE_UMLIBS_VERSION:bsp-bb_org-6_6 = "24%"
+BSP_MESA_PVR_VERSION:bsp-bb_org-6_6 = "23%"
diff --git a/meta-beagle/recipes-bsp/u-boot/u-boot-bb.org_2024.10.bb b/meta-beagle/recipes-bsp/u-boot/u-boot-bb.org_2024.10.bb
new file mode 100644
index 00000000..10b20873
--- /dev/null
+++ b/meta-beagle/recipes-bsp/u-boot/u-boot-bb.org_2024.10.bb
@@ -0,0 +1,12 @@
+require recipes-bsp/u-boot/u-boot-ti.inc
+
+SUMMARY = "BeagleBoard.org U-Boot"
+
+COMPATIBLE_MACHINE = "beagle.*"
+
+PV = "2024.10"
+
+UBOOT_GIT_URI = "git://github.com/beagleboard/u-boot.git"
+UBOOT_GIT_PROTOCOL = "https"
+BRANCH = "v2024.10-Beagle"
+SRCREV = "bf0e9d0b7274d2b561bd24c858affec2038250f9"
diff --git a/meta-beagle/recipes-kernel/linux/linux-bb.org-6.1/defconfig b/meta-beagle/recipes-kernel/linux/linux-bb.org-6.6/defconfig
similarity index 100%
copy from meta-beagle/recipes-kernel/linux/linux-bb.org-6.1/defconfig
copy to meta-beagle/recipes-kernel/linux/linux-bb.org-6.6/defconfig
diff --git a/meta-beagle/recipes-kernel/linux/linux-bb.org_6.6.bb b/meta-beagle/recipes-kernel/linux/linux-bb.org_6.6.bb
new file mode 100644
index 00000000..bf8f8a24
--- /dev/null
+++ b/meta-beagle/recipes-kernel/linux/linux-bb.org_6.6.bb
@@ -0,0 +1,68 @@
+# Look in the generic major.minor directory for files
+FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}-6.6:"
+
+SECTION = "kernel"
+SUMMARY = "BeagleBoard.org Linux kernel"
+LICENSE = "GPL-2.0-only"
+LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
+
+COMPATIBLE_MACHINE = "beagle.*"
+
+inherit kernel
+
+require recipes-kernel/linux/setup-defconfig.inc
+require recipes-kernel/linux/ti-kernel.inc
+
+DEPENDS += "gmp-native libmpc-native"
+
+KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT} ${EXTRA_DTC_ARGS}"
+
+# Extra DT overlays/capes
+KERNEL_DEVICETREE:append:armv7a = " \
+${DT_VENDOR_PREFIX}AM335X-PRU-UIO-00A0.dtbo \
+${DT_VENDOR_PREFIX}BB-ADC-00A0.dtbo \
+${DT_VENDOR_PREFIX}BB-BBBW-WL1835-00A0.dtbo \
+${DT_VENDOR_PREFIX}BB-BBGG-WL1835-00A0.dtbo \
+${DT_VENDOR_PREFIX}BB-BBGW-WL1835-00A0.dtbo \
+${DT_VENDOR_PREFIX}BB-BONE-4D5R-01-00A1.dtbo \
+${DT_VENDOR_PREFIX}BB-BONE-eMMC1-01-00A0.dtbo \
+${DT_VENDOR_PREFIX}BB-BONE-LCD4-01-00A1.dtbo \
+${DT_VENDOR_PREFIX}BB-BONE-NH7C-01-A0.dtbo \
+${DT_VENDOR_PREFIX}BB-CAPE-DISP-CT4-00A0.dtbo \
+${DT_VENDOR_PREFIX}BB-HDMI-TDA998x-00A0.dtbo \
+${DT_VENDOR_PREFIX}BB-I2C1-MCP7940X-00A0.dtbo \
+${DT_VENDOR_PREFIX}BB-I2C1-RTC-DS3231.dtbo \
+${DT_VENDOR_PREFIX}BB-I2C1-RTC-PCF8563.dtbo \
+${DT_VENDOR_PREFIX}BB-I2C2-BME680.dtbo \
+${DT_VENDOR_PREFIX}BB-I2C2-MPU6050.dtbo \
+${DT_VENDOR_PREFIX}BB-LCD-ADAFRUIT-24-SPI1-00A0.dtbo \
+${DT_VENDOR_PREFIX}BB-NHDMI-TDA998x-00A0.dtbo \
+${DT_VENDOR_PREFIX}BBORG_COMMS-00A2.dtbo \
+${DT_VENDOR_PREFIX}BBORG_FAN-A000.dtbo \
+${DT_VENDOR_PREFIX}BBORG_RELAY-00A2.dtbo \
+${DT_VENDOR_PREFIX}BB-SPIDEV0-00A0.dtbo \
+${DT_VENDOR_PREFIX}BB-SPIDEV1-00A0.dtbo \
+${DT_VENDOR_PREFIX}BB-UART1-00A0.dtbo \
+${DT_VENDOR_PREFIX}BB-UART2-00A0.dtbo \
+${DT_VENDOR_PREFIX}BB-UART4-00A0.dtbo \
+${DT_VENDOR_PREFIX}BB-W1-P9.12-00A0.dtbo \
+${DT_VENDOR_PREFIX}BONE-ADC.dtbo \
+${DT_VENDOR_PREFIX}M-BB-BBG-00A0.dtbo \
+${DT_VENDOR_PREFIX}M-BB-BBGG-00A0.dtbo \
+${DT_VENDOR_PREFIX}PB-MIKROBUS-0.dtbo \
+${DT_VENDOR_PREFIX}PB-MIKROBUS-1.dtbo \
+"
+
+S = "${WORKDIR}/git"
+
+# 6.6.32 version for 32-bit
+SRCREV:armv7a = "525684d28fadc2bdae5424f28b219377bd5d4639"
+PV:armv7a = "6.6.32+git"
+BRANCH:armv7a = "v6.6.32-ti-arm32-r7"
+
+# 6.6.58 version for 64-bit
+SRCREV:aarch64 = "9beffa9162f6a0f5de7e25bbb66026a579376428"
+PV:aarch64 = "6.6.58+git"
+BRANCH:aarch64 = "v6.6.58-ti-arm64-r16"
+
+KERNEL_GIT_URI = "git://github.com/beagleboard/linux.git"
-- 
2.17.1


