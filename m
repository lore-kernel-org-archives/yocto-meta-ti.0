Return-Path: <a-limaye@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83CACC3DA6E
	for <webhook@archiver.kernel.org>; Fri,  5 Jan 2024 07:58:34 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.19163.1704441511772683281
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 04 Jan 2024 23:58:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=YkezHZn7;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: a-limaye@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4057wUGS050746
	for <meta-ti@lists.yoctoproject.org>; Fri, 5 Jan 2024 01:58:30 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1704441510;
	bh=70V1BBsHUsXTuw3Zl/QONbEzuIgKBp5YXk9Q7BbJl+k=;
	h=From:To:CC:Subject:Date;
	b=YkezHZn7QZnj8Tyqu5+KrgPSBDzQurZ3AsHT3NuROhe8bVfAKjBRIYWzaxBHR86U5
	 dOCozhL7tfajFQsTBO6oDOxPNWCCI92RvaHajP+iSlagSnPg6KssSuVS68nYrZZzmi
	 QX0E0z57bneSgznxSprEIYP7baw7N8gVMfgnxT6w=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4057wUV6091785
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 5 Jan 2024 01:58:30 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 5
 Jan 2024 01:58:29 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 5 Jan 2024 01:58:29 -0600
Received: from PSDKL-Workstation0.dhcp.ti.com (psdkl-workstation0.dhcp.ti.com [10.24.68.244])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4057wRSs074717;
	Fri, 5 Jan 2024 01:58:28 -0600
From: Aniket Limaye <a-limaye@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <u-kumar1@ti.com>, <j-choudhary@ti.com>,
        Aniket Limaye
	<a-limaye@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH] meta-ti-bsp: Add Support for j722s-evm
Date: Fri, 5 Jan 2024 13:28:08 +0530
Message-ID: <20240105075808.875816-1-a-limaye@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 05 Jan 2024 07:58:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17376

From: Ryan Eatmon <reatmon@ti.com>

- Add A53 and R5 machine configurations for j722s-evm.
- Add firmware overrides.
- Add u-boot overrides.
- Add cnm-wave support.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
Signed-off-by: Aniket Limaye <a-limaye@ti.com>
---
 meta-ti-bsp/conf/machine/include/j722s.inc    | 19 ++++++++++++
 meta-ti-bsp/conf/machine/j722s-evm-k3r5.conf  | 11 +++++++
 meta-ti-bsp/conf/machine/j722s-evm.conf       | 11 +++++++
 .../cnm-wave-fw/cnm-wave-fw_git.bb            |  2 +-
 meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb  |  5 ++++
 .../recipes-bsp/ti-eth-fw/ti-eth-fw.bb        |  4 ++-
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc  |  2 ++
 .../optee/optee-os-ti-overrides.inc           |  1 +
 .../ti-rtos-bin/ti-rtos-firmware.bb           | 29 ++++++++++++++++++-
 9 files changed, 81 insertions(+), 3 deletions(-)
 create mode 100644 meta-ti-bsp/conf/machine/include/j722s.inc
 create mode 100644 meta-ti-bsp/conf/machine/j722s-evm-k3r5.conf
 create mode 100644 meta-ti-bsp/conf/machine/j722s-evm.conf

diff --git a/meta-ti-bsp/conf/machine/include/j722s.inc b/meta-ti-bsp/conf/machine/include/j722s.inc
new file mode 100644
index 00000000..59f45c93
--- /dev/null
+++ b/meta-ti-bsp/conf/machine/include/j722s.inc
@@ -0,0 +1,19 @@
+require conf/machine/include/k3.inc
+SOC_FAMILY:append = ":j722s"
+
+MACHINE_FEATURES += "screen gpu"
+
+require conf/machine/include/mesa-pvr.inc
+PREFERRED_PROVIDER_virtual/gpudriver ?= ""
+
+# Default tiboot3.bin on J722S is for HS-FS
+IMAGE_BOOT_FILES += "tiboot3-j722s-hs-fs-evm.bin"
+
+TFA_BOARD = "lite"
+TFA_K3_SYSTEM_SUSPEND = "1"
+
+OPTEEMACHINE = "k3-am62x"
+
+MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "cnm-wave-fw"
+
+SERIAL_CONSOLES = "115200;ttyS2"
diff --git a/meta-ti-bsp/conf/machine/j722s-evm-k3r5.conf b/meta-ti-bsp/conf/machine/j722s-evm-k3r5.conf
new file mode 100644
index 00000000..2c884ffd
--- /dev/null
+++ b/meta-ti-bsp/conf/machine/j722s-evm-k3r5.conf
@@ -0,0 +1,11 @@
+#@TYPE: Machine
+#@NAME: J722S EVM (R5F)
+#@DESCRIPTION: Machine configuration for the TI J722S EVM (R5F core)
+
+require conf/machine/include/k3r5.inc
+
+SYSFW_SOC = "j722s"
+SYSFW_CONFIG = "evm"
+SYSFW_SUFFIX = "hs-fs"
+
+UBOOT_MACHINE = "j722s_evm_r5_defconfig"
diff --git a/meta-ti-bsp/conf/machine/j722s-evm.conf b/meta-ti-bsp/conf/machine/j722s-evm.conf
new file mode 100644
index 00000000..7e5874ab
--- /dev/null
+++ b/meta-ti-bsp/conf/machine/j722s-evm.conf
@@ -0,0 +1,11 @@
+#@TYPE: Machine
+#@NAME: J722S EVM
+#@DESCRIPTION: Machine configuration for the TI J722S EVM
+
+require conf/machine/include/j722s.inc
+
+KERNEL_DEVICETREE_PREFIX = "ti/k3-j722s"
+
+KERNEL_DEVICETREE = ""
+
+UBOOT_MACHINE = "j722s_evm_a53_defconfig"
diff --git a/meta-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb b/meta-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
index 965db336..d1b99979 100644
--- a/meta-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
+++ b/meta-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.cnm;md5=93b67e6bac7f8fec22b96b8ad0a1a9d0"
 PV = "${CNM_WAVE521_FW_VERSION}"
 PR = "${INC_PR}.1"
 
-COMPATIBLE_MACHINE = "j721s2|j784s4|am62axx|am62pxx"
+COMPATIBLE_MACHINE = "j721s2|j784s4|j722s|am62axx|am62pxx"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
diff --git a/meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb b/meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb
index 1851297f..1ad236ce 100644
--- a/meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb
+++ b/meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb
@@ -25,6 +25,7 @@ PLAT_SFX:j721e = "j721e"
 PLAT_SFX:j7200 = "j7200"
 PLAT_SFX:j721s2 = "j721s2"
 PLAT_SFX:j784s4 = "j784s4"
+PLAT_SFX:j722s = "j722s"
 PLAT_SFX:am65xx = "am65xx"
 PLAT_SFX:am64xx = "am64xx"
 PLAT_SFX:am62xx = "am62xx"
@@ -42,6 +43,7 @@ DM_FW_LIST:j721e =   "${DM_FIRMWARE}"
 DM_FW_LIST:j7200 =   "${DM_FIRMWARE}"
 DM_FW_LIST:j721s2 =  "${DM_FIRMWARE}"
 DM_FW_LIST:j784s4 =  "${DM_FIRMWARE}"
+DM_FW_LIST:j722s =   "${DM_FIRMWARE}"
 DM_FW_LIST:am65xx =  ""
 DM_FW_LIST:am64xx =  ""
 DM_FW_LIST:am62xx =  "${DM_FIRMWARE}"
@@ -83,6 +85,7 @@ ALTERNATIVE:${PN}:j721e   = "j7-mcu-r5f0_0-fw"
 ALTERNATIVE:${PN}:j7200   = "j7200-mcu-r5f0_0-fw"
 ALTERNATIVE:${PN}:j721s2  = "j721s2-mcu-r5f0_0-fw"
 ALTERNATIVE:${PN}:j784s4  = "j784s4-mcu-r5f0_0-fw"
+ALTERNATIVE:${PN}:j722s   = "j722s-wkup-r5f0_0-fw"
 
 # Set up link names for the firmwares
 ALTERNATIVE_LINK_NAME[am62-main-r5f0_0-fw]  = "${nonarch_base_libdir}/firmware/am62-main-r5f0_0-fw"
@@ -92,6 +95,7 @@ ALTERNATIVE_LINK_NAME[j7-mcu-r5f0_0-fw]     = "${nonarch_base_libdir}/firmware/j
 ALTERNATIVE_LINK_NAME[j7200-mcu-r5f0_0-fw]  = "${nonarch_base_libdir}/firmware/j7200-mcu-r5f0_0-fw"
 ALTERNATIVE_LINK_NAME[j721s2-mcu-r5f0_0-fw] = "${nonarch_base_libdir}/firmware/j721s2-mcu-r5f0_0-fw"
 ALTERNATIVE_LINK_NAME[j784s4-mcu-r5f0_0-fw] = "${nonarch_base_libdir}/firmware/j784s4-mcu-r5f0_0-fw"
+ALTERNATIVE_LINK_NAME[j722s-wkup-r5f0_0-fw] = "${nonarch_base_libdir}/firmware/j722s-wkup-r5f0_0-fw"
 
 # Create the firmware alternatives
 ALTERNATIVE_TARGET[am62-main-r5f0_0-fw]  = "${INSTALL_DM_FW_DIR}/${DM_FIRMWARE}"
@@ -101,6 +105,7 @@ ALTERNATIVE_TARGET[j7-mcu-r5f0_0-fw]     = "${INSTALL_DM_FW_DIR}/${DM_FIRMWARE}"
 ALTERNATIVE_TARGET[j7200-mcu-r5f0_0-fw]  = "${INSTALL_DM_FW_DIR}/${DM_FIRMWARE}"
 ALTERNATIVE_TARGET[j721s2-mcu-r5f0_0-fw] = "${INSTALL_DM_FW_DIR}/${DM_FIRMWARE}"
 ALTERNATIVE_TARGET[j784s4-mcu-r5f0_0-fw] = "${INSTALL_DM_FW_DIR}/${DM_FIRMWARE}"
+ALTERNATIVE_TARGET[j722s-wkup-r5f0_0-fw] = "${INSTALL_DM_FW_DIR}/${DM_FIRMWARE}"
 
 ALTERNATIVE_PRIORITY = "10"
 
diff --git a/meta-ti-bsp/recipes-bsp/ti-eth-fw/ti-eth-fw.bb b/meta-ti-bsp/recipes-bsp/ti-eth-fw/ti-eth-fw.bb
index 6c961844..6bcc824b 100644
--- a/meta-ti-bsp/recipes-bsp/ti-eth-fw/ti-eth-fw.bb
+++ b/meta-ti-bsp/recipes-bsp/ti-eth-fw/ti-eth-fw.bb
@@ -24,6 +24,7 @@ PLAT_SFX:j721e = "j721e"
 PLAT_SFX:j7200 = "j7200"
 PLAT_SFX:j721s2 = "j721s2"
 PLAT_SFX:j784s4 = "j784s4"
+PLAT_SFX:j722s = "j722s"
 PLAT_SFX:am65xx = "am65xx"
 PLAT_SFX:am64xx = "am64xx"
 PLAT_SFX:am62xx = "am62xx"
@@ -41,10 +42,11 @@ ETH_FW_LIST:j721e =   "${ETH_FW}"
 ETH_FW_LIST:j7200 =   "${ETH_FW}"
 ETH_FW_LIST:j721s2 =  ""
 ETH_FW_LIST:j784s4 =  "${ETH_FW}"
+ETH_FW_LIST:j722s =   ""
 ETH_FW_LIST:am65xx =  ""
 ETH_FW_LIST:am64xx =  ""
 ETH_FW_LIST:am62xx =  ""
-ETH_FW_LIST:am62pxx =  ""
+ETH_FW_LIST:am62pxx = ""
 ETH_FW_LIST:am62axx = ""
 
 do_install() {
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
index 2f15c4fb..7e2e2011 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
@@ -40,6 +40,7 @@ PLAT_SFX:j721e = "j721e"
 PLAT_SFX:j7200 = "j7200"
 PLAT_SFX:j721s2 = "j721s2"
 PLAT_SFX:j784s4 = "j784s4"
+PLAT_SFX:j722s = "j722s"
 PLAT_SFX:am65xx = "am65xx"
 PLAT_SFX:am64xx = "am64xx"
 PLAT_SFX:am62xx = "am62xx"
@@ -55,6 +56,7 @@ PACKAGECONFIG:append:j721e = " dm"
 PACKAGECONFIG:append:j7200 = " dm"
 PACKAGECONFIG:append:j721s2 = " dm"
 PACKAGECONFIG:append:j784s4 = " dm"
+PACKAGECONFIG:append:j722s = " dm"
 PACKAGECONFIG:append:am62xx = " dm"
 PACKAGECONFIG:append:am62axx = " dm"
 PACKAGECONFIG:append:am62pxx = " dm"
diff --git a/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc b/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc
index 62d6b4f9..a6c17359 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc
+++ b/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc
@@ -6,6 +6,7 @@ EXTRA_OEMAKE:append:k3 = "${@ ' CFG_CONSOLE_UART='+ d.getVar('OPTEE_K3_USART') i
 EXTRA_OEMAKE:append:am62xx = " CFG_TEE_CORE_LOG_LEVEL=1"
 EXTRA_OEMAKE:append:am62pxx = " CFG_WITH_SOFTWARE_PRNG=y CFG_TEE_CORE_LOG_LEVEL=1"
 EXTRA_OEMAKE:append:am62axx = " CFG_TEE_CORE_LOG_LEVEL=1"
+EXTRA_OEMAKE:append:j722s = " CFG_WITH_SOFTWARE_PRNG=y CFG_TEE_CORE_LOG_LEVEL=1"
 
 do_compile:append:k3() {
     cp ${B}/core/tee-pager_v2.bin ${B}/bl32.bin
diff --git a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
index 786c2834..7bf5030a 100644
--- a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
+++ b/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
@@ -16,6 +16,7 @@ PLAT_SFX:j721e = "j721e"
 PLAT_SFX:j7200 = "j7200"
 PLAT_SFX:j721s2 = "j721s2"
 PLAT_SFX:j784s4 = "j784s4"
+PLAT_SFX:j722s = "j722s"
 PLAT_SFX:am65xx = "am65xx"
 PLAT_SFX:am64xx = "am64xx"
 PLAT_SFX:am62xx = "am62xx"
@@ -54,12 +55,13 @@ IPC_FW_LIST = ""
 IPC_FW_LIST:am65xx =  "${MCU_1_0_FW} ${MCU_1_1_FW}"
 IPC_FW_LIST:am64xx =  "${MCU_1_0_FW} ${MCU_1_1_FW} ${MCU_2_0_FW} ${MCU_2_1_FW} ${MCU_3_0_FW}"
 IPC_FW_LIST:am62xx =  "                            ${MCU_2_0_FW}"
-IPC_FW_LIST:am62pxx =  "                            ${MCU_2_0_FW}"
+IPC_FW_LIST:am62pxx = "                            ${MCU_2_0_FW}"
 IPC_FW_LIST:am62axx = "                            ${MCU_2_0_FW}                                                                                               ${C7X_1_FW}"
 IPC_FW_LIST:j721e =   "              ${MCU_1_1_FW} ${MCU_2_0_FW} ${MCU_2_1_FW} ${MCU_3_0_FW} ${MCU_3_1_FW}                             ${C66_1_FW} ${C66_2_FW} ${C7X_1_FW}"
 IPC_FW_LIST:j7200 =   "              ${MCU_1_1_FW} ${MCU_2_0_FW} ${MCU_2_1_FW}"
 IPC_FW_LIST:j721s2 =  "              ${MCU_1_1_FW} ${MCU_2_0_FW} ${MCU_2_1_FW} ${MCU_3_0_FW} ${MCU_3_1_FW}                                                     ${C7X_1_FW} ${C7X_2_FW}"
 IPC_FW_LIST:j784s4 =  "              ${MCU_1_1_FW} ${MCU_2_0_FW} ${MCU_2_1_FW} ${MCU_3_0_FW} ${MCU_3_1_FW} ${MCU_4_0_FW} ${MCU_4_1_FW}                         ${C7X_1_FW} ${C7X_2_FW} ${C7X_3_FW} ${C7X_4_FW}"
+IPC_FW_LIST:j722s =   "                            ${MCU_2_0_FW}               ${MCU_3_0_FW}                                                                   ${C7X_1_FW} ${C7X_2_FW}"
 
 # Update the am64xx ipc binaries to be consistent with other platforms
 do_install:prepend:am64xx() {
@@ -178,6 +180,13 @@ ALTERNATIVE:${PN}:j784s4 = "\
                     j784s4-c71_3-fw         j784s4-c71_3-fw-sec \
                     "
 
+ALTERNATIVE:${PN}:j722s = "\
+                    j722s-mcu-r5f0_0-fw   j722s-mcu-r5f0_0-fw-sec \
+                    j722s-main-r5f0_0-fw  j722s-main-r5f0_0-fw-sec \
+                    j722s-c71_0-fw        j722s-c71_0-fw-sec \
+                    j722s-c71_1-fw        j722s-c71_1-fw-sec \
+                    "
+
 # Set up link names for the firmwares
 
 ALTERNATIVE_LINK_NAME[am65x-mcu-r5f0_0-fw]     = "${nonarch_base_libdir}/firmware/am65x-mcu-r5f0_0-fw"
@@ -271,6 +280,15 @@ ALTERNATIVE_LINK_NAME[j784s4-c71_2-fw-sec] = "${nonarch_base_libdir}/firmware/j7
 ALTERNATIVE_LINK_NAME[j784s4-c71_3-fw]     = "${nonarch_base_libdir}/firmware/j784s4-c71_3-fw"
 ALTERNATIVE_LINK_NAME[j784s4-c71_3-fw-sec] = "${nonarch_base_libdir}/firmware/j784s4-c71_3-fw-sec"
 
+ALTERNATIVE_LINK_NAME[j722s-mcu-r5f0_0-fw]     = "${nonarch_base_libdir}/firmware/j722s-mcu-r5f0_0-fw"
+ALTERNATIVE_LINK_NAME[j722s-mcu-r5f0_0-fw-sec] = "${nonarch_base_libdir}/firmware/j722s-mcu-r5f0_0-fw-sec"
+ALTERNATIVE_LINK_NAME[j722s-main-r5f0_0-fw]     = "${nonarch_base_libdir}/firmware/j722s-main-r5f0_0-fw"
+ALTERNATIVE_LINK_NAME[j722s-main-r5f0_0-fw-sec] = "${nonarch_base_libdir}/firmware/j722s-main-r5f0_0-fw-sec"
+ALTERNATIVE_LINK_NAME[j722s-c71_0-fw]     = "${nonarch_base_libdir}/firmware/j722s-c71_0-fw"
+ALTERNATIVE_LINK_NAME[j722s-c71_0-fw-sec] = "${nonarch_base_libdir}/firmware/j722s-c71_0-fw-sec"
+ALTERNATIVE_LINK_NAME[j722s-c71_1-fw]     = "${nonarch_base_libdir}/firmware/j722s-c71_1-fw"
+ALTERNATIVE_LINK_NAME[j722s-c71_1-fw-sec] = "${nonarch_base_libdir}/firmware/j722s-c71_1-fw-sec"
+
 # Create the firmware alternatives
 
 ALTERNATIVE_TARGET[am65x-mcu-r5f0_0-fw]     = "${INSTALL_IPC_FW_DIR}/${MCU_1_0_FW}"
@@ -364,4 +382,13 @@ ALTERNATIVE_TARGET[j784s4-c71_2-fw-sec] = "${INSTALL_IPC_FW_DIR}/${C7X_3_FW}.sig
 ALTERNATIVE_TARGET[j784s4-c71_3-fw]     = "${INSTALL_IPC_FW_DIR}/${C7X_4_FW}"
 ALTERNATIVE_TARGET[j784s4-c71_3-fw-sec] = "${INSTALL_IPC_FW_DIR}/${C7X_4_FW}.signed"
 
+ALTERNATIVE_TARGET[j722s-mcu-r5f0_0-fw]     = "${INSTALL_IPC_FW_DIR}/${MCU_2_0_FW}"
+ALTERNATIVE_TARGET[j722s-mcu-r5f0_0-fw-sec] = "${INSTALL_IPC_FW_DIR}/${MCU_2_0_FW}.signed"
+ALTERNATIVE_TARGET[j722s-main-r5f0_0-fw]     = "${INSTALL_IPC_FW_DIR}/${MCU_3_0_FW}"
+ALTERNATIVE_TARGET[j722s-main-r5f0_0-fw-sec] = "${INSTALL_IPC_FW_DIR}/${MCU_3_0_FW}.signed"
+ALTERNATIVE_TARGET[j722s-c71_0-fw]     = "${INSTALL_IPC_FW_DIR}/${C7X_1_FW}"
+ALTERNATIVE_TARGET[j722s-c71_0-fw-sec] = "${INSTALL_IPC_FW_DIR}/${C7X_1_FW}.signed"
+ALTERNATIVE_TARGET[j722s-c71_1-fw]     = "${INSTALL_IPC_FW_DIR}/${C7X_2_FW}"
+ALTERNATIVE_TARGET[j722s-c71_1-fw-sec] = "${INSTALL_IPC_FW_DIR}/${C7X_2_FW}.signed"
+
 ALTERNATIVE_PRIORITY = "10"
-- 
2.34.1


