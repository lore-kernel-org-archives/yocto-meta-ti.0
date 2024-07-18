Return-Path: <a-limaye@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5290BC3DA60
	for <webhook@archiver.kernel.org>; Thu, 18 Jul 2024 07:56:39 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.10217.1721289392772415883
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 18 Jul 2024 00:56:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=kxAVUtxM;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: a-limaye@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 46I7uWBs047982
	for <meta-ti@lists.yoctoproject.org>; Thu, 18 Jul 2024 02:56:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1721289392;
	bh=nxFt424gjkKoSAQJL5fkNyrVYmDiQebIETR9PAWahJQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=kxAVUtxMb5Uk0MY9oDyKOOxbX6/Z8wDyY5qjl9ALQW2csiJCoERynMNwWDfD43ugA
	 7d8YWaAc+uFzH8u3BonGbNCunxwET6NTTTMKNqFlEBX2dhduNwGRM2H9/antVG56tt
	 ewdEyNIoJA3qiFW7mx3Bde2PsRkHtRbLL8oi6jtU=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 46I7uWuh111217
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 18 Jul 2024 02:56:32 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 18
 Jul 2024 02:56:31 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 18 Jul 2024 02:56:31 -0500
Received: from PSDKL-Workstation0.dhcp.ti.com (psdkl-workstation0.dhcp.ti.com [172.24.227.91])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 46I7tY0N086409;
	Thu, 18 Jul 2024 02:56:29 -0500
From: Aniket Limaye <a-limaye@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <m-chawdhry@ti.com>, <n-francis@ti.com>,
        <u-kumar1@ti.com>, <detheridge@ti.com>,
        Aniket Limaye <a-limaye@ti.com>
Subject: [meta-ti][master/scarthgap][PATCH v2 1/3] meta-ti-bsp: Add support for j742s2-evm
Date: Thu, 18 Jul 2024 13:25:25 +0530
Message-ID: <20240718075526.1427615-2-a-limaye@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240718075526.1427615-1-a-limaye@ti.com>
References: <20240718075526.1427615-1-a-limaye@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 18 Jul 2024 07:56:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17883

- Add A72 and R5 machine configurations for j742s2-evm
- Add firmware overrides.
- Add u-boot overrides.

Signed-off-by: Aniket Limaye <a-limaye@ti.com>
---
Changes in v2:
- Removed ti-eth from MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS since we do
  not have ti-eth fw for j742s2
---
 meta-ti-bsp/conf/machine/include/j742s2.inc   | 19 +++++++
 meta-ti-bsp/conf/machine/j742s2-evm-k3r5.conf | 11 ++++
 meta-ti-bsp/conf/machine/j742s2-evm.conf      | 22 +++++++
 .../cadence-mhdp-fw/cadence-mhdp-fw_git.bb    |  2 +-
 .../cnm-wave-fw/cnm-wave-fw_git.bb            |  2 +-
 meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb  |  5 ++
 .../recipes-bsp/ti-eth-fw/ti-eth-fw.bb        |  2 +
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc  |  2 +
 .../ti-rtos-bin/ti-rtos-firmware.bb           | 57 +++++++++++++++++++
 9 files changed, 120 insertions(+), 2 deletions(-)
 create mode 100644 meta-ti-bsp/conf/machine/include/j742s2.inc
 create mode 100644 meta-ti-bsp/conf/machine/j742s2-evm-k3r5.conf
 create mode 100644 meta-ti-bsp/conf/machine/j742s2-evm.conf

diff --git a/meta-ti-bsp/conf/machine/include/j742s2.inc b/meta-ti-bsp/conf/machine/include/j742s2.inc
new file mode 100644
index 00000000..b7d87112
--- /dev/null
+++ b/meta-ti-bsp/conf/machine/include/j742s2.inc
@@ -0,0 +1,19 @@
+require conf/machine/include/k3.inc
+SOC_FAMILY:append = ":j742s2"
+
+MACHINE_FEATURES += "screen gpu"
+
+require conf/machine/include/mesa-pvr.inc
+PREFERRED_PROVIDER_virtual/gpudriver ?= ""
+
+# Default tiboot3.bin on J742S2 is for HS-FS
+IMAGE_BOOT_FILES += "tiboot3-j742s2-hs-fs-evm.bin"
+
+# Since default tiboot3.bin on J742S2 is for HS-FS, add a version for SR1.0 HS-SE
+IMAGE_BOOT_FILES += "tiboot3-j742s2-hs-evm.bin"
+
+TFA_BOARD = "j784s4"
+
+OPTEEMACHINE = "k3-j784s4"
+
+MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "cadence-mhdp-fw cnm-wave-fw"
diff --git a/meta-ti-bsp/conf/machine/j742s2-evm-k3r5.conf b/meta-ti-bsp/conf/machine/j742s2-evm-k3r5.conf
new file mode 100644
index 00000000..41bf401e
--- /dev/null
+++ b/meta-ti-bsp/conf/machine/j742s2-evm-k3r5.conf
@@ -0,0 +1,11 @@
+#@TYPE: Machine
+#@NAME: J742S2 EVM (R5F)
+#@DESCRIPTION: Machine configuration for the TI J742S2 EVM (R5F core)
+
+require conf/machine/include/k3r5.inc
+
+SYSFW_SOC = "j742s2"
+SYSFW_CONFIG = "evm"
+SYSFW_SUFFIX = "hs-fs"
+
+UBOOT_MACHINE = "j742s2_evm_r5_defconfig"
diff --git a/meta-ti-bsp/conf/machine/j742s2-evm.conf b/meta-ti-bsp/conf/machine/j742s2-evm.conf
new file mode 100644
index 00000000..110931cc
--- /dev/null
+++ b/meta-ti-bsp/conf/machine/j742s2-evm.conf
@@ -0,0 +1,22 @@
+#@TYPE: Machine
+#@NAME: J742S2 EVM
+#@DESCRIPTION: Machine configuration for the TI J742S2 EVM
+
+require conf/machine/include/j742s2.inc
+
+TFA_K3_USART = "0x8"
+OPTEE_K3_USART = "0x8"
+
+KERNEL_DEVICETREE_PREFIX = " \
+    ti/k3-j742s2 \
+    ti/k3-j784s4 \
+    ti/k3-fpdlink \
+    ti/k3-j7200-evm-mcspi-loopback \
+    ti/k3-j721s2-evm-csi2-ov5640 \
+    ti/k3-j721s2-evm-fusion \
+    ti/k3-v3link \
+"
+
+KERNEL_DEVICETREE = ""
+
+UBOOT_MACHINE = "j742s2_evm_a72_defconfig"
diff --git a/meta-ti-bsp/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb b/meta-ti-bsp/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb
index ed1c7817..97363b2e 100644
--- a/meta-ti-bsp/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb
+++ b/meta-ti-bsp/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.cadence;md5=009f46816f6956cfb75ede13d3e1cee0"
 PV = "${CADENCE_MHDP_FW_VERSION}"
 PR = "${INC_PR}.0"
 
-COMPATIBLE_MACHINE = "j721e|j721s2|j784s4"
+COMPATIBLE_MACHINE = "j721e|j721s2|j784s4|j742s2"
 
 TARGET = "mhdp8546.bin"
 
diff --git a/meta-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb b/meta-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
index b28bea92..43624183 100644
--- a/meta-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
+++ b/meta-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.cnm;md5=93b67e6bac7f8fec22b96b8ad0a1a9d0"
 PV = "${CNM_WAVE521_FW_VERSION}"
 PR = "${INC_PR}.1"
 
-COMPATIBLE_MACHINE = "j721s2|j784s4|j722s|am62axx|am62pxx"
+COMPATIBLE_MACHINE = "j721s2|j784s4|j722s|j742s2|am62axx|am62pxx"
 
 TARGET_WAVE521C = "wave521c_k3_codec_fw.bin"
 
diff --git a/meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb b/meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb
index 1ad236ce..0b6792b6 100644
--- a/meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb
+++ b/meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb
@@ -26,6 +26,7 @@ PLAT_SFX:j7200 = "j7200"
 PLAT_SFX:j721s2 = "j721s2"
 PLAT_SFX:j784s4 = "j784s4"
 PLAT_SFX:j722s = "j722s"
+PLAT_SFX:j742s2 = "j742s2"
 PLAT_SFX:am65xx = "am65xx"
 PLAT_SFX:am64xx = "am64xx"
 PLAT_SFX:am62xx = "am62xx"
@@ -44,6 +45,7 @@ DM_FW_LIST:j7200 =   "${DM_FIRMWARE}"
 DM_FW_LIST:j721s2 =  "${DM_FIRMWARE}"
 DM_FW_LIST:j784s4 =  "${DM_FIRMWARE}"
 DM_FW_LIST:j722s =   "${DM_FIRMWARE}"
+DM_FW_LIST:j742s2 =  "${DM_FIRMWARE}"
 DM_FW_LIST:am65xx =  ""
 DM_FW_LIST:am64xx =  ""
 DM_FW_LIST:am62xx =  "${DM_FIRMWARE}"
@@ -86,6 +88,7 @@ ALTERNATIVE:${PN}:j7200   = "j7200-mcu-r5f0_0-fw"
 ALTERNATIVE:${PN}:j721s2  = "j721s2-mcu-r5f0_0-fw"
 ALTERNATIVE:${PN}:j784s4  = "j784s4-mcu-r5f0_0-fw"
 ALTERNATIVE:${PN}:j722s   = "j722s-wkup-r5f0_0-fw"
+ALTERNATIVE:${PN}:j742s2  = "j742s2-mcu-r5f0_0-fw"
 
 # Set up link names for the firmwares
 ALTERNATIVE_LINK_NAME[am62-main-r5f0_0-fw]  = "${nonarch_base_libdir}/firmware/am62-main-r5f0_0-fw"
@@ -96,6 +99,7 @@ ALTERNATIVE_LINK_NAME[j7200-mcu-r5f0_0-fw]  = "${nonarch_base_libdir}/firmware/j
 ALTERNATIVE_LINK_NAME[j721s2-mcu-r5f0_0-fw] = "${nonarch_base_libdir}/firmware/j721s2-mcu-r5f0_0-fw"
 ALTERNATIVE_LINK_NAME[j784s4-mcu-r5f0_0-fw] = "${nonarch_base_libdir}/firmware/j784s4-mcu-r5f0_0-fw"
 ALTERNATIVE_LINK_NAME[j722s-wkup-r5f0_0-fw] = "${nonarch_base_libdir}/firmware/j722s-wkup-r5f0_0-fw"
+ALTERNATIVE_LINK_NAME[j742s2-mcu-r5f0_0-fw] = "${nonarch_base_libdir}/firmware/j742s2-mcu-r5f0_0-fw"
 
 # Create the firmware alternatives
 ALTERNATIVE_TARGET[am62-main-r5f0_0-fw]  = "${INSTALL_DM_FW_DIR}/${DM_FIRMWARE}"
@@ -106,6 +110,7 @@ ALTERNATIVE_TARGET[j7200-mcu-r5f0_0-fw]  = "${INSTALL_DM_FW_DIR}/${DM_FIRMWARE}"
 ALTERNATIVE_TARGET[j721s2-mcu-r5f0_0-fw] = "${INSTALL_DM_FW_DIR}/${DM_FIRMWARE}"
 ALTERNATIVE_TARGET[j784s4-mcu-r5f0_0-fw] = "${INSTALL_DM_FW_DIR}/${DM_FIRMWARE}"
 ALTERNATIVE_TARGET[j722s-wkup-r5f0_0-fw] = "${INSTALL_DM_FW_DIR}/${DM_FIRMWARE}"
+ALTERNATIVE_TARGET[j742s2-mcu-r5f0_0-fw] = "${INSTALL_DM_FW_DIR}/${DM_FIRMWARE}"
 
 ALTERNATIVE_PRIORITY = "10"
 
diff --git a/meta-ti-bsp/recipes-bsp/ti-eth-fw/ti-eth-fw.bb b/meta-ti-bsp/recipes-bsp/ti-eth-fw/ti-eth-fw.bb
index 6bcc824b..cf9566dc 100644
--- a/meta-ti-bsp/recipes-bsp/ti-eth-fw/ti-eth-fw.bb
+++ b/meta-ti-bsp/recipes-bsp/ti-eth-fw/ti-eth-fw.bb
@@ -25,6 +25,7 @@ PLAT_SFX:j7200 = "j7200"
 PLAT_SFX:j721s2 = "j721s2"
 PLAT_SFX:j784s4 = "j784s4"
 PLAT_SFX:j722s = "j722s"
+PLAT_SFX:j742s2 = "j742s2"
 PLAT_SFX:am65xx = "am65xx"
 PLAT_SFX:am64xx = "am64xx"
 PLAT_SFX:am62xx = "am62xx"
@@ -43,6 +44,7 @@ ETH_FW_LIST:j7200 =   "${ETH_FW}"
 ETH_FW_LIST:j721s2 =  ""
 ETH_FW_LIST:j784s4 =  "${ETH_FW}"
 ETH_FW_LIST:j722s =   ""
+ETH_FW_LIST:j742s2 =  ""
 ETH_FW_LIST:am65xx =  ""
 ETH_FW_LIST:am64xx =  ""
 ETH_FW_LIST:am62xx =  ""
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
index bad8371f..4e6825a8 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
@@ -44,6 +44,7 @@ PLAT_SFX:j7200 = "j7200"
 PLAT_SFX:j721s2 = "j721s2"
 PLAT_SFX:j784s4 = "j784s4"
 PLAT_SFX:j722s = "j722s"
+PLAT_SFX:j742s2 = "j742s2"
 PLAT_SFX:am65xx = "am65xx"
 PLAT_SFX:am64xx = "am64xx"
 PLAT_SFX:am62xx = "am62xx"
@@ -60,6 +61,7 @@ PACKAGECONFIG:append:j7200 = " dm"
 PACKAGECONFIG:append:j721s2 = " dm"
 PACKAGECONFIG:append:j784s4 = " dm"
 PACKAGECONFIG:append:j722s = " dm"
+PACKAGECONFIG:append:j742s2 = " dm"
 PACKAGECONFIG:append:am62xx = " dm"
 PACKAGECONFIG:append:am62axx = " dm"
 PACKAGECONFIG:append:am62pxx = " dm"
diff --git a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
index a67dc18e..00112017 100644
--- a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
+++ b/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
@@ -17,6 +17,7 @@ PLAT_SFX:j7200 = "j7200"
 PLAT_SFX:j721s2 = "j721s2"
 PLAT_SFX:j784s4 = "j784s4"
 PLAT_SFX:j722s = "j722s"
+PLAT_SFX:j742s2 = "j742s2"
 PLAT_SFX:am65xx = "am65xx"
 PLAT_SFX:am64xx = "am64xx"
 PLAT_SFX:am62xx = "am62xx"
@@ -62,6 +63,7 @@ IPC_FW_LIST:j7200 =   "              ${MCU_1_1_FW} ${MCU_2_0_FW} ${MCU_2_1_FW}"
 IPC_FW_LIST:j721s2 =  "              ${MCU_1_1_FW} ${MCU_2_0_FW} ${MCU_2_1_FW} ${MCU_3_0_FW} ${MCU_3_1_FW}                                                     ${C7X_1_FW} ${C7X_2_FW}"
 IPC_FW_LIST:j784s4 =  "              ${MCU_1_1_FW} ${MCU_2_0_FW} ${MCU_2_1_FW} ${MCU_3_0_FW} ${MCU_3_1_FW} ${MCU_4_0_FW} ${MCU_4_1_FW}                         ${C7X_1_FW} ${C7X_2_FW} ${C7X_3_FW} ${C7X_4_FW}"
 IPC_FW_LIST:j722s =   "                            ${MCU_2_0_FW}               ${MCU_3_0_FW}                                                                   ${C7X_1_FW} ${C7X_2_FW}"
+IPC_FW_LIST:j742s2 =  "              ${MCU_1_1_FW} ${MCU_2_0_FW} ${MCU_2_1_FW} ${MCU_3_0_FW} ${MCU_3_1_FW} ${MCU_4_0_FW} ${MCU_4_1_FW}                         ${C7X_1_FW} ${C7X_2_FW} ${C7X_3_FW}"
 
 # Update the am64xx ipc binaries to be consistent with other platforms
 do_install:prepend:am64xx() {
@@ -186,6 +188,19 @@ ALTERNATIVE:${PN}:j722s = "\
                     j722s-c71_1-fw        j722s-c71_1-fw-sec \
                     "
 
+ALTERNATIVE:${PN}:j742s2 = "\
+                    j742s2-mcu-r5f0_1-fw    j742s2-mcu-r5f0_1-fw-sec \
+                    j742s2-main-r5f0_0-fw   j742s2-main-r5f0_0-fw-sec \
+                    j742s2-main-r5f0_1-fw   j742s2-main-r5f0_1-fw-sec \
+                    j742s2-main-r5f1_0-fw   j742s2-main-r5f1_0-fw-sec \
+                    j742s2-main-r5f1_1-fw   j742s2-main-r5f1_1-fw-sec \
+                    j742s2-main-r5f2_0-fw   j742s2-main-r5f2_0-fw-sec \
+                    j742s2-main-r5f2_1-fw   j742s2-main-r5f2_1-fw-sec \
+                    j742s2-c71_0-fw         j742s2-c71_0-fw-sec \
+                    j742s2-c71_1-fw         j742s2-c71_1-fw-sec \
+                    j742s2-c71_2-fw         j742s2-c71_2-fw-sec \
+                    "
+
 # Set up link names for the firmwares
 
 ALTERNATIVE_LINK_NAME[am65x-mcu-r5f0_0-fw]     = "${nonarch_base_libdir}/firmware/am65x-mcu-r5f0_0-fw"
@@ -286,6 +301,27 @@ ALTERNATIVE_LINK_NAME[j722s-c71_0-fw-sec] = "${nonarch_base_libdir}/firmware/j72
 ALTERNATIVE_LINK_NAME[j722s-c71_1-fw]     = "${nonarch_base_libdir}/firmware/j722s-c71_1-fw"
 ALTERNATIVE_LINK_NAME[j722s-c71_1-fw-sec] = "${nonarch_base_libdir}/firmware/j722s-c71_1-fw-sec"
 
+ALTERNATIVE_LINK_NAME[j742s2-mcu-r5f0_1-fw]     = "${nonarch_base_libdir}/firmware/j742s2-mcu-r5f0_1-fw"
+ALTERNATIVE_LINK_NAME[j742s2-mcu-r5f0_1-fw-sec] = "${nonarch_base_libdir}/firmware/j742s2-mcu-r5f0_1-fw-sec"
+ALTERNATIVE_LINK_NAME[j742s2-main-r5f0_0-fw]     = "${nonarch_base_libdir}/firmware/j742s2-main-r5f0_0-fw"
+ALTERNATIVE_LINK_NAME[j742s2-main-r5f0_0-fw-sec] = "${nonarch_base_libdir}/firmware/j742s2-main-r5f0_0-fw-sec"
+ALTERNATIVE_LINK_NAME[j742s2-main-r5f0_1-fw]     = "${nonarch_base_libdir}/firmware/j742s2-main-r5f0_1-fw"
+ALTERNATIVE_LINK_NAME[j742s2-main-r5f0_1-fw-sec] = "${nonarch_base_libdir}/firmware/j742s2-main-r5f0_1-fw-sec"
+ALTERNATIVE_LINK_NAME[j742s2-main-r5f1_0-fw]     = "${nonarch_base_libdir}/firmware/j742s2-main-r5f1_0-fw"
+ALTERNATIVE_LINK_NAME[j742s2-main-r5f1_0-fw-sec] = "${nonarch_base_libdir}/firmware/j742s2-main-r5f1_0-fw-sec"
+ALTERNATIVE_LINK_NAME[j742s2-main-r5f1_1-fw]     = "${nonarch_base_libdir}/firmware/j742s2-main-r5f1_1-fw"
+ALTERNATIVE_LINK_NAME[j742s2-main-r5f1_1-fw-sec] = "${nonarch_base_libdir}/firmware/j742s2-main-r5f1_1-fw-sec"
+ALTERNATIVE_LINK_NAME[j742s2-main-r5f2_0-fw]     = "${nonarch_base_libdir}/firmware/j742s2-main-r5f2_0-fw"
+ALTERNATIVE_LINK_NAME[j742s2-main-r5f2_0-fw-sec] = "${nonarch_base_libdir}/firmware/j742s2-main-r5f2_0-fw-sec"
+ALTERNATIVE_LINK_NAME[j742s2-main-r5f2_1-fw]     = "${nonarch_base_libdir}/firmware/j742s2-main-r5f2_1-fw"
+ALTERNATIVE_LINK_NAME[j742s2-main-r5f2_1-fw-sec] = "${nonarch_base_libdir}/firmware/j742s2-main-r5f2_1-fw-sec"
+ALTERNATIVE_LINK_NAME[j742s2-c71_0-fw]     = "${nonarch_base_libdir}/firmware/j742s2-c71_0-fw"
+ALTERNATIVE_LINK_NAME[j742s2-c71_0-fw-sec] = "${nonarch_base_libdir}/firmware/j742s2-c71_0-fw-sec"
+ALTERNATIVE_LINK_NAME[j742s2-c71_1-fw]     = "${nonarch_base_libdir}/firmware/j742s2-c71_1-fw"
+ALTERNATIVE_LINK_NAME[j742s2-c71_1-fw-sec] = "${nonarch_base_libdir}/firmware/j742s2-c71_1-fw-sec"
+ALTERNATIVE_LINK_NAME[j742s2-c71_2-fw]     = "${nonarch_base_libdir}/firmware/j742s2-c71_2-fw"
+ALTERNATIVE_LINK_NAME[j742s2-c71_2-fw-sec] = "${nonarch_base_libdir}/firmware/j742s2-c71_2-fw-sec"
+
 # Create the firmware alternatives
 
 ALTERNATIVE_TARGET[am65x-mcu-r5f0_0-fw]     = "${INSTALL_IPC_FW_DIR}/${MCU_1_0_FW}"
@@ -386,4 +422,25 @@ ALTERNATIVE_TARGET[j722s-c71_0-fw-sec] = "${INSTALL_IPC_FW_DIR}/${C7X_1_FW}.sign
 ALTERNATIVE_TARGET[j722s-c71_1-fw]     = "${INSTALL_IPC_FW_DIR}/${C7X_2_FW}"
 ALTERNATIVE_TARGET[j722s-c71_1-fw-sec] = "${INSTALL_IPC_FW_DIR}/${C7X_2_FW}.signed"
 
+ALTERNATIVE_TARGET[j742s2-mcu-r5f0_1-fw]     = "${INSTALL_IPC_FW_DIR}/${MCU_1_1_FW}"
+ALTERNATIVE_TARGET[j742s2-mcu-r5f0_1-fw-sec] = "${INSTALL_IPC_FW_DIR}/${MCU_1_1_FW}.signed"
+ALTERNATIVE_TARGET[j742s2-main-r5f0_0-fw]     = "${INSTALL_IPC_FW_DIR}/${MCU_2_0_FW}"
+ALTERNATIVE_TARGET[j742s2-main-r5f0_0-fw-sec] = "${INSTALL_IPC_FW_DIR}/${MCU_2_0_FW}.signed"
+ALTERNATIVE_TARGET[j742s2-main-r5f0_1-fw]     = "${INSTALL_IPC_FW_DIR}/${MCU_2_1_FW}"
+ALTERNATIVE_TARGET[j742s2-main-r5f0_1-fw-sec] = "${INSTALL_IPC_FW_DIR}/${MCU_2_1_FW}.signed"
+ALTERNATIVE_TARGET[j742s2-main-r5f1_0-fw]     = "${INSTALL_IPC_FW_DIR}/${MCU_3_0_FW}"
+ALTERNATIVE_TARGET[j742s2-main-r5f1_0-fw-sec] = "${INSTALL_IPC_FW_DIR}/${MCU_3_0_FW}.signed"
+ALTERNATIVE_TARGET[j742s2-main-r5f1_1-fw]     = "${INSTALL_IPC_FW_DIR}/${MCU_3_1_FW}"
+ALTERNATIVE_TARGET[j742s2-main-r5f1_1-fw-sec] = "${INSTALL_IPC_FW_DIR}/${MCU_3_1_FW}.signed"
+ALTERNATIVE_TARGET[j742s2-main-r5f2_0-fw]     = "${INSTALL_IPC_FW_DIR}/${MCU_4_0_FW}"
+ALTERNATIVE_TARGET[j742s2-main-r5f2_0-fw-sec] = "${INSTALL_IPC_FW_DIR}/${MCU_4_0_FW}.signed"
+ALTERNATIVE_TARGET[j742s2-main-r5f2_1-fw]     = "${INSTALL_IPC_FW_DIR}/${MCU_4_1_FW}"
+ALTERNATIVE_TARGET[j742s2-main-r5f2_1-fw-sec] = "${INSTALL_IPC_FW_DIR}/${MCU_4_1_FW}.signed"
+ALTERNATIVE_TARGET[j742s2-c71_0-fw]     = "${INSTALL_IPC_FW_DIR}/${C7X_1_FW}"
+ALTERNATIVE_TARGET[j742s2-c71_0-fw-sec] = "${INSTALL_IPC_FW_DIR}/${C7X_1_FW}.signed"
+ALTERNATIVE_TARGET[j742s2-c71_1-fw]     = "${INSTALL_IPC_FW_DIR}/${C7X_2_FW}"
+ALTERNATIVE_TARGET[j742s2-c71_1-fw-sec] = "${INSTALL_IPC_FW_DIR}/${C7X_2_FW}.signed"
+ALTERNATIVE_TARGET[j742s2-c71_2-fw]     = "${INSTALL_IPC_FW_DIR}/${C7X_3_FW}"
+ALTERNATIVE_TARGET[j742s2-c71_2-fw-sec] = "${INSTALL_IPC_FW_DIR}/${C7X_3_FW}.signed"
+
 ALTERNATIVE_PRIORITY = "10"
-- 
2.34.1


