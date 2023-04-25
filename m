Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EEFDC6FD18
	for <webhook@archiver.kernel.org>; Tue, 25 Apr 2023 17:23:49 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.86183.1682443428144076703
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 25 Apr 2023 10:23:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=cWGlSmZl;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33PHNktl094302;
	Tue, 25 Apr 2023 12:23:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1682443426;
	bh=upCYcAoMURhjA4r3RrnkyJwsxYOrC/+6B6vocdus6bk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=cWGlSmZlv/VfTwtfRrbtvjAFcs/pJnyeO5l0RXNYCVdV/2OFx+cIdl2Ti0J5kvVsI
	 pA8OMD/lIZka21cGQxtHxQuVEVMuINBjsYU2AHvc8f1zSty8JalwfjszI9ZaQ8wawi
	 k5hHQniOR4eImQPw0KnTqATOO2tak/5mqmDgutcU=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33PHNkEH090962
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 25 Apr 2023 12:23:46 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 25
 Apr 2023 12:23:46 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Tue, 25 Apr 2023 12:23:46 -0500
Received: from ula0226330.dal.design.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33PHNj0o030178;
	Tue, 25 Apr 2023 12:23:46 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        Praneeth Bajjuri <praneeth@ti.com>,
        Neha Malcom Francis <n-francis@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master/kirkstone][RFC 1/9] ti-dm-fw: Add recipe for TI DM firmware
Date: Tue, 25 Apr 2023 12:23:37 -0500
Message-ID: <20230425172345.12293-2-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230425172345.12293-1-afd@ti.com>
References: <20230425172345.12293-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 25 Apr 2023 17:23:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16418

Split out the TI DM firmware from ti-rtos-firmware.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb  | 119 ++++++++++++++++++
 .../recipes-bsp/ti-linux-fw/ti-linux-fw.inc   |   1 +
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc  |   2 +-
 .../ti-rtos-bin/ti-rtos-firmware.bb           |  48 -------
 4 files changed, 121 insertions(+), 49 deletions(-)
 create mode 100644 meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb

diff --git a/meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb b/meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb
new file mode 100644
index 00000000..8fb40d12
--- /dev/null
+++ b/meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb
@@ -0,0 +1,119 @@
+SUMMARY = "TI DM prebuilt binary firmware images"
+
+LICENSE = "TI-TFL"
+LIC_FILES_CHKSUM = "file://${COREBASE}/../meta-ti/licenses/TI-TFL;md5=a1b59cb7ba626b9dbbcbf00f3fbc438a"
+
+COMPATIBLE_MACHINE = "k3"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+INHIBIT_DEFAULT_DEPS = "1"
+
+inherit deploy
+inherit update-alternatives
+
+require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+
+PV = "${TI_DM_FW_VERSION}"
+PR = "${INC_PR}.0"
+
+CLEANBROKEN = "1"
+
+# Secure Build
+inherit ti-secdev
+
+PLAT_SFX = ""
+PLAT_SFX:j721e = "j721e"
+PLAT_SFX:j7200 = "j7200"
+PLAT_SFX:j721s2 = "j721s2"
+PLAT_SFX:j784s4 = "j784s4"
+PLAT_SFX:am65xx = "am65xx"
+PLAT_SFX:am64xx = "am64xx"
+PLAT_SFX:am62xx = "am62xx"
+PLAT_SFX:am62axx = "am62axx"
+
+DM_FW_DIR = "ti-dm/${PLAT_SFX}"
+
+INSTALL_DM_FW_DIR  = "${nonarch_base_libdir}/firmware/${DM_FW_DIR}"
+
+DM_FIRMWARE = "ipc_echo_testb_mcu1_0_release_strip.xer5f"
+
+DM_FW_LIST = ""
+DM_FW_LIST:j721e =   "${DM_FIRMWARE}"
+DM_FW_LIST:j7200 =   "${DM_FIRMWARE}"
+DM_FW_LIST:j721s2 =  "${DM_FIRMWARE}"
+DM_FW_LIST:j784s4 =  "${DM_FIRMWARE}"
+DM_FW_LIST:am65xx =  ""
+DM_FW_LIST:am64xx =  ""
+DM_FW_LIST:am62xx =  "${DM_FIRMWARE}"
+DM_FW_LIST:am62axx = "${DM_FIRMWARE}"
+
+do_install() {
+    # Sign the firmware
+    # DM Firmware
+    for FW_NAME in ${DM_FW_LIST}
+    do
+        ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ${S}/${DM_FW_DIR}/${FW_NAME} ${S}/${DM_FW_DIR}/${FW_NAME}.signed
+    done
+
+    # DM Firmware
+    install -d ${D}${INSTALL_DM_FW_DIR}
+    for FW_NAME in ${DM_FW_LIST}
+    do
+        install -m 0644 ${S}/${DM_FW_DIR}/${FW_NAME}        ${D}${INSTALL_DM_FW_DIR}/${FW_NAME}.unsigned
+        install -m 0644 ${S}/${DM_FW_DIR}/${FW_NAME}.signed ${D}${INSTALL_DM_FW_DIR}/${FW_NAME}
+    done
+}
+
+do_deploy() {
+    # DM Firmware is needed for rebuilding U-Boot
+    install -d ${DEPLOYDIR}
+    for FW_NAME in ${DM_FW_LIST}
+    do
+        install -m 0644 ${S}/${DM_FW_DIR}/${FW_NAME}        ${DEPLOYDIR}/${FW_NAME}.unsigned
+        install -m 0644 ${S}/${DM_FW_DIR}/${FW_NAME}.signed ${DEPLOYDIR}/${FW_NAME}
+    done
+}
+
+# Set up names for the firmwares
+ALTERNATIVE:${PN}:am62xx  = "am62-main-r5f0_0-fw"
+ALTERNATIVE:${PN}:am62axx = "am62a-main-r5f0_0-fw"
+ALTERNATIVE:${PN}:j721e   = "j7-mcu-r5f0_0-fw"
+ALTERNATIVE:${PN}:j7200   = "j7200-mcu-r5f0_0-fw"
+ALTERNATIVE:${PN}:j721s2  = "j721s2-mcu-r5f0_0-fw"
+ALTERNATIVE:${PN}:j784s4  = "j784s4-mcu-r5f0_0-fw"
+
+# Set up link names for the firmwares
+ALTERNATIVE_LINK_NAME[am62-main-r5f0_0-fw]  = "${nonarch_base_libdir}/firmware/am62-main-r5f0_0-fw"
+ALTERNATIVE_LINK_NAME[am62a-main-r5f0_0-fw] = "${nonarch_base_libdir}/firmware/am62a-main-r5f0_0-fw"
+ALTERNATIVE_LINK_NAME[j7-mcu-r5f0_0-fw]     = "${nonarch_base_libdir}/firmware/j7-mcu-r5f0_0-fw"
+ALTERNATIVE_LINK_NAME[j7200-mcu-r5f0_0-fw]  = "${nonarch_base_libdir}/firmware/j7200-mcu-r5f0_0-fw"
+ALTERNATIVE_LINK_NAME[j721s2-mcu-r5f0_0-fw] = "${nonarch_base_libdir}/firmware/j721s2-mcu-r5f0_0-fw"
+ALTERNATIVE_LINK_NAME[j784s4-mcu-r5f0_0-fw] = "${nonarch_base_libdir}/firmware/j784s4-mcu-r5f0_0-fw"
+
+# Create the firmware alternatives
+ALTERNATIVE_TARGET[am62-main-r5f0_0-fw]  = "${INSTALL_DM_FW_DIR}/${DM_FIRMWARE}"
+ALTERNATIVE_TARGET[am62a-main-r5f0_0-fw] = "${INSTALL_DM_FW_DIR}/${DM_FIRMWARE}"
+ALTERNATIVE_TARGET[j7-mcu-r5f0_0-fw]     = "${INSTALL_DM_FW_DIR}/${DM_FIRMWARE}"
+ALTERNATIVE_TARGET[j7200-mcu-r5f0_0-fw]  = "${INSTALL_DM_FW_DIR}/${DM_FIRMWARE}"
+ALTERNATIVE_TARGET[j721s2-mcu-r5f0_0-fw] = "${INSTALL_DM_FW_DIR}/${DM_FIRMWARE}"
+ALTERNATIVE_TARGET[j784s4-mcu-r5f0_0-fw] = "${INSTALL_DM_FW_DIR}/${DM_FIRMWARE}"
+
+ALTERNATIVE_PRIORITY = "10"
+
+# make sure that lib/firmware, and all its contents are part of the package
+FILES:${PN} += "${nonarch_base_libdir}/firmware"
+
+# This is used to prevent the build system to_strip the executables
+INHIBIT_PACKAGE_STRIP = "1"
+INHIBIT_SYSROOT_STRIP = "1"
+# This is used to prevent the build system to split the debug info in a separate file
+INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
+# As it likely to be a different arch from the Yocto build, disable checking by adding "arch" to INSANE_SKIP
+INSANE_SKIP:${PN} += "arch"
+
+# we don't want to configure and build the source code
+do_compile[noexec] = "1"
+do_configure[noexec] = "1"
+
+addtask deploy after do_install
diff --git a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index 1a5ea534..912ca63f 100644
--- a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -15,6 +15,7 @@ CADENCE_MHDP_FW_VERSION = "2.1.0"
 IMG_DEC_FW_VERSION = "1.0"
 CNM_WAVE521_FW_VERSION = "1.0.00"
 TIFS_LPM_STUB_FW_VERSION = "08.06.04"
+TI_DM_FW_VERSION = "08.06.04"
 
 TI_LINUX_FW_SRCREV ?= "79c498ef6ab1558b699a2243a26c4a65a1c44d26"
 SRCREV = "${TI_LINUX_FW_SRCREV}"
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
index 8e236dfe..38ce5a58 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
@@ -39,7 +39,7 @@ PLAT_SFX:am62axx = "am62axx"
 
 PACKAGECONFIG[atf] = "ATF=${STAGING_DIR_HOST}/firmware/bl31.bin,,trusted-firmware-a"
 PACKAGECONFIG[optee] = "TEE=${STAGING_DIR_HOST}${nonarch_base_libdir}/firmware/bl32.bin,,optee-os"
-PACKAGECONFIG[dm] = "DM=${STAGING_DIR_HOST}${nonarch_base_libdir}/firmware/ti-dm/${PLAT_SFX}/${DM_FIRMWARE},,ti-rtos-firmware"
+PACKAGECONFIG[dm] = "DM=${STAGING_DIR_HOST}${nonarch_base_libdir}/firmware/ti-dm/${PLAT_SFX}/${DM_FIRMWARE},,ti-dm-fw"
 
 PACKAGECONFIG:append:aarch64 = " atf optee"
 PACKAGECONFIG:append:j721e = " dm"
diff --git a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
index 6bd85662..55f55ed5 100644
--- a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
+++ b/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
@@ -33,16 +33,12 @@ CLEANBROKEN = "1"
 # Secure Build
 inherit ti-secdev
 
-DM_FW_DIR = "ti-dm/${PLAT_SFX}"
 IPC_FW_DIR = "ti-ipc/${PLAT_SFX}"
 ETH_FW_DIR = "ti-eth/${PLAT_SFX}"
 
-INSTALL_DM_FW_DIR  = "${nonarch_base_libdir}/firmware/${DM_FW_DIR}"
 INSTALL_IPC_FW_DIR = "${nonarch_base_libdir}/firmware/${IPC_FW_DIR}"
 INSTALL_ETH_FW_DIR = "${nonarch_base_libdir}/firmware/${ETH_FW_DIR}"
 
-DM_FIRMWARE = "ipc_echo_testb_mcu1_0_release_strip.xer5f"
-
 MCU_1_0_FW = "ipc_echo_test_mcu1_0_release_strip.xer5f"
 MCU_1_1_FW = "ipc_echo_test_mcu1_1_release_strip.xer5f"
 MCU_2_0_FW = "ipc_echo_test_mcu2_0_release_strip.xer5f"
@@ -60,16 +56,6 @@ C7X_4_FW   = "ipc_echo_test_c7x_4_release_strip.xe71"
 
 ETH_FW = "app_remoteswitchcfg_server_strip.xer5f"
 
-DM_FW_LIST = ""
-DM_FW_LIST:j721e =   "${DM_FIRMWARE}"
-DM_FW_LIST:j7200 =   "${DM_FIRMWARE}"
-DM_FW_LIST:j721s2 =  "${DM_FIRMWARE}"
-DM_FW_LIST:j784s4 =  "${DM_FIRMWARE}"
-DM_FW_LIST:am65xx =  ""
-DM_FW_LIST:am64xx =  ""
-DM_FW_LIST:am62xx =  "${DM_FIRMWARE}"
-DM_FW_LIST:am62axx = "${DM_FIRMWARE}"
-
 IPC_FW_LIST = ""
 IPC_FW_LIST:j721e =   "              ${MCU_1_1_FW} ${MCU_2_0_FW} ${MCU_2_1_FW} ${MCU_3_0_FW} ${MCU_3_1_FW}                             ${C66_1_FW} ${C66_2_FW} ${C7X_1_FW}"
 IPC_FW_LIST:j7200 =   "              ${MCU_1_1_FW} ${MCU_2_0_FW} ${MCU_2_1_FW}"
@@ -116,13 +102,6 @@ do_install:prepend:am62axx() {
 }
 
 do_install() {
-    # Sign the firmware
-    # DM Firmware
-    for FW_NAME in ${DM_FW_LIST}
-    do
-        ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ${S}/${DM_FW_DIR}/${FW_NAME} ${S}/${DM_FW_DIR}/${FW_NAME}.signed
-    done
-
     # IPC Firmware
     for FW_NAME in ${IPC_FW_LIST}
     do
@@ -135,14 +114,6 @@ do_install() {
         ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ${S}/${ETH_FW_DIR}/${FW_NAME} ${S}/${ETH_FW_DIR}/${FW_NAME}.signed
     done
 
-    # DM Firmware
-    install -d ${D}${INSTALL_DM_FW_DIR}
-    for FW_NAME in ${DM_FW_LIST}
-    do
-        install -m 0644 ${S}/${DM_FW_DIR}/${FW_NAME}        ${D}${INSTALL_DM_FW_DIR}/${FW_NAME}.unsigned
-        install -m 0644 ${S}/${DM_FW_DIR}/${FW_NAME}.signed ${D}${INSTALL_DM_FW_DIR}/${FW_NAME}
-    done
-
     # IPC Firmware
     install -d ${D}${INSTALL_IPC_FW_DIR}
     for FW_NAME in ${IPC_FW_LIST}
@@ -160,16 +131,6 @@ do_install() {
     done
 }
 
-do_deploy() {
-    # DM Firmware is needed for rebuilding U-Boot
-    install -d ${DEPLOYDIR}
-    for FW_NAME in ${DM_FW_LIST}
-    do
-        install -m 0644 ${S}/${DM_FW_DIR}/${FW_NAME}        ${DEPLOYDIR}/${FW_NAME}.unsigned
-        install -m 0644 ${S}/${DM_FW_DIR}/${FW_NAME}.signed ${DEPLOYDIR}/${FW_NAME}
-    done
-}
-
 # Set up names for the firmwares
 ALTERNATIVE:${PN}:am65xx = "\
                     am65x-mcu-r5f0_0-fw \
@@ -265,7 +226,6 @@ ALTERNATIVE_LINK_NAME[am64-main-r5f1_0-fw] = "${nonarch_base_libdir}/firmware/am
 ALTERNATIVE_LINK_NAME[am64-main-r5f1_1-fw] = "${nonarch_base_libdir}/firmware/am64-main-r5f1_1-fw"
 ALTERNATIVE_LINK_NAME[am64-mcu-m4f0_0-fw] = "${nonarch_base_libdir}/firmware/am64-mcu-m4f0_0-fw"
 
-ALTERNATIVE_LINK_NAME[am62-main-r5f0_0-fw] = "${nonarch_base_libdir}/firmware/am62-main-r5f0_0-fw"
 ALTERNATIVE_LINK_NAME[am62-mcu-m4f0_0-fw] = "${nonarch_base_libdir}/firmware/am62-mcu-m4f0_0-fw"
 
 ALTERNATIVE_LINK_NAME[am62a-mcu-r5f0_0-fw] = "${nonarch_base_libdir}/firmware/am62a-mcu-r5f0_0-fw"
@@ -337,14 +297,11 @@ ALTERNATIVE_TARGET[am64-main-r5f1_0-fw] = "${INSTALL_IPC_FW_DIR}/${MCU_2_0_FW}"
 ALTERNATIVE_TARGET[am64-main-r5f1_1-fw] = "${INSTALL_IPC_FW_DIR}/${MCU_2_1_FW}"
 ALTERNATIVE_TARGET[am64-mcu-m4f0_0-fw] = "${INSTALL_IPC_FW_DIR}/${MCU_3_0_FW}"
 
-ALTERNATIVE_TARGET[am62-main-r5f0_0-fw] = "${INSTALL_DM_FW_DIR}/${DM_FIRMWARE}"
 ALTERNATIVE_TARGET[am62-mcu-m4f0_0-fw] = "${INSTALL_IPC_FW_DIR}/${MCU_2_0_FW}"
 
-ALTERNATIVE_TARGET[am62a-main-r5f0_0-fw] = "${INSTALL_DM_FW_DIR}/${DM_FIRMWARE}"
 ALTERNATIVE_TARGET[am62a-mcu-r5f0_0-fw] = "${INSTALL_IPC_FW_DIR}/${MCU_2_0_FW}"
 ALTERNATIVE_TARGET[am62a-c71_0-fw] = "${INSTALL_IPC_FW_DIR}/${C7X_1_FW}"
 
-ALTERNATIVE_TARGET[j7-mcu-r5f0_0-fw] = "${INSTALL_DM_FW_DIR}/${DM_FIRMWARE}"
 ALTERNATIVE_TARGET[j7-mcu-r5f0_1-fw] = "${INSTALL_IPC_FW_DIR}/${MCU_1_1_FW}"
 ALTERNATIVE_TARGET[j7-main-r5f0_0-fw] = "${INSTALL_ETH_FW_DIR}/${ETH_FW}"
 ALTERNATIVE_TARGET[j7-main-r5f0_1-fw] = "${INSTALL_IPC_FW_DIR}/${MCU_2_1_FW}"
@@ -362,7 +319,6 @@ ALTERNATIVE_TARGET[j7-c66_0-fw-sec] = "${INSTALL_IPC_FW_DIR}/${C66_1_FW}.signed"
 ALTERNATIVE_TARGET[j7-c66_1-fw-sec] = "${INSTALL_IPC_FW_DIR}/${C66_2_FW}.signed"
 ALTERNATIVE_TARGET[j7-c71_0-fw-sec] = "${INSTALL_IPC_FW_DIR}/${C7X_1_FW}.signed"
 
-ALTERNATIVE_TARGET[j7200-mcu-r5f0_0-fw] = "${INSTALL_DM_FW_DIR}/${DM_FIRMWARE}"
 ALTERNATIVE_TARGET[j7200-mcu-r5f0_1-fw] = "${INSTALL_IPC_FW_DIR}/${MCU_1_1_FW}"
 ALTERNATIVE_TARGET[j7200-main-r5f0_0-fw] = "${INSTALL_ETH_FW_DIR}/${ETH_FW}"
 ALTERNATIVE_TARGET[j7200-main-r5f0_1-fw] = "${INSTALL_IPC_FW_DIR}/${MCU_2_1_FW}"
@@ -370,7 +326,6 @@ ALTERNATIVE_TARGET[j7200-main-r5f0_1-fw] = "${INSTALL_IPC_FW_DIR}/${MCU_2_1_FW}"
 ALTERNATIVE_TARGET[j7200-main-r5f0_0-fw-sec] = "${INSTALL_ETH_FW_DIR}/${ETH_FW}.signed"
 ALTERNATIVE_TARGET[j7200-main-r5f0_1-fw-sec] = "${INSTALL_IPC_FW_DIR}/${MCU_2_1_FW}.signed"
 
-ALTERNATIVE_TARGET[j721s2-mcu-r5f0_0-fw] = "${INSTALL_DM_FW_DIR}/${DM_FIRMWARE}"
 ALTERNATIVE_TARGET[j721s2-mcu-r5f0_1-fw] = "${INSTALL_IPC_FW_DIR}/${MCU_1_1_FW}"
 ALTERNATIVE_TARGET[j721s2-main-r5f0_0-fw] = "${INSTALL_IPC_FW_DIR}/${MCU_2_0_FW}"
 ALTERNATIVE_TARGET[j721s2-main-r5f0_1-fw] = "${INSTALL_IPC_FW_DIR}/${MCU_2_1_FW}"
@@ -386,7 +341,6 @@ ALTERNATIVE_TARGET[j721s2-main-r5f1_1-fw-sec] = "${INSTALL_IPC_FW_DIR}/${MCU_3_1
 ALTERNATIVE_TARGET[j721s2-c71_0-fw-sec] = "${INSTALL_IPC_FW_DIR}/${C7X_1_FW}.signed"
 ALTERNATIVE_TARGET[j721s2-c71_1-fw-sec] = "${INSTALL_IPC_FW_DIR}/${C7X_2_FW}.signed"
 
-ALTERNATIVE_TARGET[j784s4-mcu-r5f0_0-fw] = "${INSTALL_DM_FW_DIR}/${DM_FIRMWARE}"
 ALTERNATIVE_TARGET[j784s4-mcu-r5f0_1-fw] = "${INSTALL_IPC_FW_DIR}/${MCU_1_1_FW}"
 ALTERNATIVE_TARGET[j784s4-main-r5f0_0-fw] = "${INSTALL_IPC_FW_DIR}/${MCU_2_0_FW}"
 ALTERNATIVE_TARGET[j784s4-main-r5f0_1-fw] = "${INSTALL_IPC_FW_DIR}/${MCU_2_1_FW}"
@@ -415,5 +369,3 @@ INSANE_SKIP:${PN} += "arch"
 # we don't want to configure and build the source code
 do_compile[noexec] = "1"
 do_configure[noexec] = "1"
-
-addtask deploy after do_install
-- 
2.39.2


