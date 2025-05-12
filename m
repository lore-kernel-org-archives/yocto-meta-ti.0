Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A9EFC3ABCD
	for <webhook@archiver.kernel.org>; Mon, 12 May 2025 12:59:15 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.49650.1747054745745662434
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 12 May 2025 05:59:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=A3I/r31Q;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: p-bhagat@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 54CCx1He2576596
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 12 May 2025 07:59:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1747054741;
	bh=iR35jym1NIM79/3FWM8JGei2JaKOxZp4nuUM6LeMroo=;
	h=From:To:CC:Subject:Date;
	b=A3I/r31QCh2dScTHL4KB/Dz5NoH8TLZVI+rSrzwpvcND1LBCOckG882evHaBS5c1g
	 ZYJQrRGS9q/tK2tQVWQXS3Gt+J4gSxV3tahKmTpsuXcZjijaoN5ARWXdAsOf+gQcGD
	 8HKeT2buZ2HBGXN8diWPEnWErtB1UiJdxi6rGxTk=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 54CCx1xt026213
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 12 May 2025 07:59:01 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 12
 May 2025 07:59:01 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 12 May 2025 07:59:01 -0500
Received: from localhost (ula0502350.dhcp.ti.com [172.24.227.38])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 54CCx0f9036562;
	Mon, 12 May 2025 07:59:00 -0500
From: Paresh Bhagat <p-bhagat@ti.com>
To: <meta-ti@lists.yoctoproject.org>, <denis@denix.org>, <praneeth@ti.com>,
        <reatmon@ti.com>
CC: <v-singh1@ti.com>, <c-shilwant@ti.com>, <khasim@ti.com>
Subject: [scarthgap][PATCH] meta-ti-bsp: Add build support for am62dxx-evm
Date: Mon, 12 May 2025 18:28:50 +0530
Message-ID: <20250512125850.1790812-1-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 12 May 2025 12:59:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18549

The AM62D SoC is a high-performance Digital Signal Processing (DSP)
device with a quad-core Cortex-A53 cluster, dual Cortex-R5F cores, and
a Cx7 DSP core with Matrix Multiplication Accelerator (MMA). It features
a range of peripherals, including multichannel audio serial ports,
Ethernet, UARTs, SPI, I2C, USB, and more.

This SoC is part of K3-AM62x family, which includes the AM62A and AM62P
variants. While the AM62A and AM62D are largely similar, the AM62D is
specifically targeted for general-purpose DSP applications, whereas the
AM62A focuses on edge AI workloads. A key distinction is that the AM62D
does not include multimedia components such as the video encoder/decoder,
MJPEG encoder, Vision Processing Accelerator (VPAC) for image signal
processing, or the display subsystem. Additionally, the AM62D has a
different pin configuration compared to the AM62A, which impacts embedded
software development.

The EVM board is a low-cost, expandable platform designed for the AM62D2
SoC, having 4GB LPDDR4 RAM, Gigabit Ethernet expansion connectors, audio
jacks, USB ports, and more.

Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
---

Boot logs
https://gist.github.com/paresh-bhagat12/1757cc54a39f1baf883341af2a383db6

Mainline Kernel and U-Boot Support pending
https://lore.kernel.org/all/20250508091422.288876-1-p-bhagat@ti.com/

 .../conf/machine/am62dxx-evm-k3r5.conf        | 11 +++++++++++
 meta-ti-bsp/conf/machine/am62dxx-evm.conf     | 15 +++++++++++++++
 meta-ti-bsp/conf/machine/include/am62dxx.inc  | 19 +++++++++++++++++++
 .../cnm-wave-fw/cnm-wave-fw_git.bb            |  2 +-
 meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb  |  3 +++
 .../recipes-bsp/ti-eth-fw/ti-eth-fw.bb        |  2 ++
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc  |  2 ++
 .../optee/optee-os-ti-overrides.inc           |  1 +
 8 files changed, 54 insertions(+), 1 deletion(-)
 create mode 100644 meta-ti-bsp/conf/machine/am62dxx-evm-k3r5.conf
 create mode 100644 meta-ti-bsp/conf/machine/am62dxx-evm.conf
 create mode 100644 meta-ti-bsp/conf/machine/include/am62dxx.inc

diff --git a/meta-ti-bsp/conf/machine/am62dxx-evm-k3r5.conf b/meta-ti-bsp/conf/machine/am62dxx-evm-k3r5.conf
new file mode 100644
index 00000000..00906420
--- /dev/null
+++ b/meta-ti-bsp/conf/machine/am62dxx-evm-k3r5.conf
@@ -0,0 +1,11 @@
+#@TYPE: Machine
+#@NAME: AM62D HS-FS EVM (R5F)
+#@DESCRIPTION: Machine configuration for the TI AM62D EVM (R5F core)
+
+require conf/machine/include/k3r5.inc
+
+SYSFW_SOC = "am62dx"
+SYSFW_CONFIG = "evm"
+SYSFW_SUFFIX = "hs-fs"
+
+UBOOT_MACHINE = "am62dx_evm_r5_defconfig"
diff --git a/meta-ti-bsp/conf/machine/am62dxx-evm.conf b/meta-ti-bsp/conf/machine/am62dxx-evm.conf
new file mode 100644
index 00000000..f2da559c
--- /dev/null
+++ b/meta-ti-bsp/conf/machine/am62dxx-evm.conf
@@ -0,0 +1,15 @@
+#@TYPE: Machine
+#@NAME: AM62DXX EVM
+#@DESCRIPTION: Machine configuration for the TI AM62DXX EVM
+
+require conf/machine/include/am62dxx.inc
+
+KERNEL_DEVICETREE_PREFIX = " \
+    ti/k3-am62d2 \
+"
+
+KERNEL_DEVICETREE = ""
+
+FIT_CONF_DEFAULT_DTB = "ti/k3-am62d2-evm.dtb"
+
+UBOOT_MACHINE = "am62dx_evm_a53_defconfig"
diff --git a/meta-ti-bsp/conf/machine/include/am62dxx.inc b/meta-ti-bsp/conf/machine/include/am62dxx.inc
new file mode 100644
index 00000000..c7b12de4
--- /dev/null
+++ b/meta-ti-bsp/conf/machine/include/am62dxx.inc
@@ -0,0 +1,19 @@
+require conf/machine/include/k3.inc
+require conf/machine/include/mc_k3r5.inc
+
+SOC_FAMILY:append = ":am62dxx"
+
+# MACHINE_FEATURES += "screen touchscreen"
+
+TFA_K3_SYSTEM_SUSPEND = "1"
+
+# Default tiboot3.bin on AM62D is for HS-FS
+IMAGE_BOOT_FILES += "tiboot3-am62dx-hs-fs-evm.bin"
+
+# Since default tiboot3.bin on AM62D is for HS-FS, add a version for HS-SE
+IMAGE_BOOT_FILES += "tiboot3-am62dx-hs-evm.bin"
+
+TFA_BOARD = "lite"
+OPTEEMACHINE = "k3-am62x"
+
+MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "cnm-wave-fw"
diff --git a/meta-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb b/meta-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
index 43624183..9a9fcbd1 100644
--- a/meta-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
+++ b/meta-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.cnm;md5=93b67e6bac7f8fec22b96b8ad0a1a9d0"
 PV = "${CNM_WAVE521_FW_VERSION}"
 PR = "${INC_PR}.1"
 
-COMPATIBLE_MACHINE = "j721s2|j784s4|j722s|j742s2|am62axx|am62pxx"
+COMPATIBLE_MACHINE = "j721s2|j784s4|j722s|j742s2|am62axx|am62pxx|am62dxx"
 
 TARGET_WAVE521C = "wave521c_k3_codec_fw.bin"
 
diff --git a/meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb b/meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb
index a7d15e30..85cfc97e 100644
--- a/meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb
+++ b/meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb
@@ -33,6 +33,7 @@ PLAT_SFX:am62xx = "am62xx"
 PLAT_SFX:am62axx = "am62axx"
 PLAT_SFX:am62lxx = "am62lxx"
 PLAT_SFX:am62pxx = "am62pxx"
+PLAT_SFX:am62dxx = "am62axx"
 
 DM_FW_DIR = "ti-dm/${PLAT_SFX}"
 
@@ -52,6 +53,7 @@ DM_FW_LIST:am65xx =  ""
 DM_FW_LIST:am64xx =  ""
 DM_FW_LIST:am62xx =  "${DM_FIRMWARE}"
 DM_FW_LIST:am62axx = "${DM_FIRMWARE}"
+DM_FW_LIST:am62dxx = "${DM_FIRMWARE}"
 DM_FW_LIST:am62lxx = ""
 DM_FW_LIST:am62pxx = "${DM_FIRMWARE}"
 
@@ -86,6 +88,7 @@ do_deploy() {
 ALTERNATIVE:${PN}:am62xx  = "am62-main-r5f0_0-fw"
 ALTERNATIVE:${PN}:am62pxx  = "am62p-main-r5f0_0-fw"
 ALTERNATIVE:${PN}:am62axx = "am62a-main-r5f0_0-fw"
+ALTERNATIVE:${PN}:am62dxx = "am62a-main-r5f0_0-fw"
 ALTERNATIVE:${PN}:j721e   = "j7-mcu-r5f0_0-fw"
 ALTERNATIVE:${PN}:j7200   = "j7200-mcu-r5f0_0-fw"
 ALTERNATIVE:${PN}:j721s2  = "j721s2-mcu-r5f0_0-fw"
diff --git a/meta-ti-bsp/recipes-bsp/ti-eth-fw/ti-eth-fw.bb b/meta-ti-bsp/recipes-bsp/ti-eth-fw/ti-eth-fw.bb
index cf9566dc..654d456c 100644
--- a/meta-ti-bsp/recipes-bsp/ti-eth-fw/ti-eth-fw.bb
+++ b/meta-ti-bsp/recipes-bsp/ti-eth-fw/ti-eth-fw.bb
@@ -31,6 +31,7 @@ PLAT_SFX:am64xx = "am64xx"
 PLAT_SFX:am62xx = "am62xx"
 PLAT_SFX:am62pxx = "am62pxx"
 PLAT_SFX:am62axx = "am62axx"
+PLAT_SFX:am62dxx = "am62axx"
 
 ETH_FW_DIR = "ti-eth/${PLAT_SFX}"
 
@@ -50,6 +51,7 @@ ETH_FW_LIST:am64xx =  ""
 ETH_FW_LIST:am62xx =  ""
 ETH_FW_LIST:am62pxx = ""
 ETH_FW_LIST:am62axx = ""
+ETH_FW_LIST:am62dxx = ""
 
 do_install() {
     # ETH firmware
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
index 57bf7a4e..f6cd3aa2 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
@@ -60,6 +60,7 @@ PLAT_SFX:am62xx = "am62xx"
 PLAT_SFX:am62axx = "am62axx"
 PLAT_SFX:am62lxx = "am62lxx"
 PLAT_SFX:am62pxx = "am62pxx"
+PLAT_SFX:am62dxx = "am62axx"
 
 PACKAGECONFIG[ap-trusted-rom] = "BL1=${STAGING_DIR_HOST}/firmware/bl1.bin,,trusted-firmware-a"
 PACKAGECONFIG[atf] = "BL31=${STAGING_DIR_HOST}/firmware/bl31.bin,,trusted-firmware-a"
@@ -77,6 +78,7 @@ PACKAGECONFIG:append:am62xx = " dm"
 PACKAGECONFIG:append:am62axx = " dm"
 PACKAGECONFIG:append:am62lxx = " ap-trusted-rom"
 PACKAGECONFIG:append:am62pxx = " dm"
+PACKAGECONFIG:append:am62dxx = " dm"
 
 COMPATIBLE_MACHINE = "(ti-soc)"
 
diff --git a/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc b/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc
index ae6cca74..c37cf768 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc
+++ b/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc
@@ -9,6 +9,7 @@ EXTRA_OEMAKE:append:am62xx = " CFG_TEE_CORE_LOG_LEVEL=1"
 EXTRA_OEMAKE:append:am62lxx = " CFG_TEE_CORE_LOG_LEVEL=1"
 EXTRA_OEMAKE:append:am62pxx = " CFG_TEE_CORE_LOG_LEVEL=1"
 EXTRA_OEMAKE:append:am62axx = " CFG_TEE_CORE_LOG_LEVEL=1"
+EXTRA_OEMAKE:append:am62dxx = " CFG_TEE_CORE_LOG_LEVEL=1"
 EXTRA_OEMAKE:append:j722s = " CFG_TEE_CORE_LOG_LEVEL=1"
 
 do_compile:append:k3() {
-- 
2.34.1


