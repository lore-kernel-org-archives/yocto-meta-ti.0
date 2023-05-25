Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 195A0C7EE2C
	for <webhook@archiver.kernel.org>; Thu, 25 May 2023 18:11:41 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.19176.1685038297530104661
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 25 May 2023 11:11:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=DPgie3yz;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34PIBZHL087194;
	Thu, 25 May 2023 13:11:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1685038295;
	bh=hph8RGwL0tZy3SBuX5emc48efWcdQ54Kr3rhv/2YEoA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=DPgie3yz4Tin2YQ8oEkI0tcSIAjPXFZNzyPHHILMycSUyzoApeNW36O2iF/qsQ7t9
	 R/byBAxcn1ffapDAWoVCKr4hO4pxTItINCluplhFiAdZcdQHjABkI1rlSfWohrZvA+
	 i2xteyc0sBPnwWM717koJFbEa/Sa97OknWIQgA1I=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34PIBZQS016378
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 25 May 2023 13:11:35 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 25
 May 2023 13:11:34 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 25 May 2023 13:11:34 -0500
Received: from lelv0326.itg.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34PIBXGt102467;
	Thu, 25 May 2023 13:11:34 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH 2/9] ti-eth-fw: Add recipe for TI Ethernet firmware
Date: Thu, 25 May 2023 13:11:25 -0500
Message-ID: <20230525181132.417197-3-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230525181132.417197-1-afd@ti.com>
References: <20230525181132.417197-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 25 May 2023 18:11:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16592

Split out the TI Ethernet firmware from ti-rtos-firmware.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../recipes-bsp/ti-eth-fw/ti-eth-fw.bb        | 118 ++++++++++++++++++
 .../ti-rtos-bin/ti-rtos-firmware.bb           |  38 +-----
 2 files changed, 123 insertions(+), 33 deletions(-)
 create mode 100644 meta-ti-bsp/recipes-bsp/ti-eth-fw/ti-eth-fw.bb

diff --git a/meta-ti-bsp/recipes-bsp/ti-eth-fw/ti-eth-fw.bb b/meta-ti-bsp/recipes-bsp/ti-eth-fw/ti-eth-fw.bb
new file mode 100644
index 00000000..1a8d4aef
--- /dev/null
+++ b/meta-ti-bsp/recipes-bsp/ti-eth-fw/ti-eth-fw.bb
@@ -0,0 +1,118 @@
+SUMMARY = "TI Ethernet prebuilt binary firmware images"
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
+PV = "${CORESDK_RTOS_VERSION}"
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
+ETH_FW_DIR = "ti-eth/${PLAT_SFX}"
+
+INSTALL_ETH_FW_DIR = "${nonarch_base_libdir}/firmware/${ETH_FW_DIR}"
+
+ETH_FW = "app_remoteswitchcfg_server_strip.xer5f"
+
+ETH_FW_LIST = ""
+ETH_FW_LIST:j721e =   "${ETH_FW}"
+ETH_FW_LIST:j7200 =   "${ETH_FW}"
+ETH_FW_LIST:j721s2 =  ""
+ETH_FW_LIST:j784s4 =  "${ETH_FW}"
+ETH_FW_LIST:am65xx =  ""
+ETH_FW_LIST:am64xx =  ""
+ETH_FW_LIST:am62xx =  ""
+ETH_FW_LIST:am62axx = ""
+
+do_install() {
+    # ETH firmware
+    for FW_NAME in ${ETH_FW_LIST}
+    do
+        ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ${S}/${ETH_FW_DIR}/${FW_NAME} ${S}/${ETH_FW_DIR}/${FW_NAME}.signed
+    done
+
+    # ETH firmware
+    install -d ${D}${INSTALL_ETH_FW_DIR}
+    for FW_NAME in ${ETH_FW_LIST}
+    do
+        install -m 0644 ${S}/${ETH_FW_DIR}/${FW_NAME}        ${D}${INSTALL_ETH_FW_DIR}
+        install -m 0644 ${S}/${ETH_FW_DIR}/${FW_NAME}.signed ${D}${INSTALL_ETH_FW_DIR}
+    done
+}
+
+# Set up names for the firmwares
+ALTERNATIVE:${PN}:j721e = "\
+                    j7-main-r5f0_0-fw \
+                    j7-main-r5f0_0-fw-sec \
+                    "
+
+ALTERNATIVE:${PN}:j7200 = "\
+                    j7200-main-r5f0_0-fw \
+                    j7200-main-r5f0_0-fw-sec \
+                    "
+
+ALTERNATIVE:${PN}:j784s4 = "\
+                    j784s4-mcu-r5f0_0-fw \
+                    j784s4-mcu-r5f0_0-fw-sec \
+                    "
+
+# Set up link names for the firmwares
+ALTERNATIVE_LINK_NAME[j7-main-r5f0_0-fw]        = "${nonarch_base_libdir}/firmware/j7-main-r5f0_0-fw"
+ALTERNATIVE_LINK_NAME[j7-main-r5f0_0-fw-sec]    = "${nonarch_base_libdir}/firmware/j7-main-r5f0_0-fw-sec"
+
+ALTERNATIVE_LINK_NAME[j7200-main-r5f0_0-fw]     = "${nonarch_base_libdir}/firmware/j7200-main-r5f0_0-fw"
+ALTERNATIVE_LINK_NAME[j7200-main-r5f0_0-fw-sec] = "${nonarch_base_libdir}/firmware/j7200-main-r5f0_0-fw-sec"
+
+ALTERNATIVE_LINK_NAME[j784s4-mcu-r5f0_0-fw]     = "${nonarch_base_libdir}/firmware/j784s4-mcu-r5f0_0-fw"
+ALTERNATIVE_LINK_NAME[j784s4-mcu-r5f0_0-fw-sec] = "${nonarch_base_libdir}/firmware/j784s4-mcu-r5f0_0-fw-sec"
+
+# Create the firmware alternatives
+ALTERNATIVE_TARGET[j7-main-r5f0_0-fw]        = "${INSTALL_ETH_FW_DIR}/${ETH_FW}"
+ALTERNATIVE_TARGET[j7-main-r5f0_0-fw-sec]    = "${INSTALL_ETH_FW_DIR}/${ETH_FW}.signed"
+
+ALTERNATIVE_TARGET[j7200-main-r5f0_0-fw]     = "${INSTALL_ETH_FW_DIR}/${ETH_FW}"
+ALTERNATIVE_TARGET[j7200-main-r5f0_0-fw-sec] = "${INSTALL_ETH_FW_DIR}/${ETH_FW}.signed"
+
+ALTERNATIVE_TARGET[j784s4-mcu-r5f0_0-fw]     = "${INSTALL_ETH_FW_DIR}/${ETH_FW}"
+ALTERNATIVE_TARGET[j784s4-mcu-r5f0_0-fw-sec] = "${INSTALL_ETH_FW_DIR}/${ETH_FW}.signed"
+
+ALTERNATIVE_PRIORITY = "20"
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
diff --git a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
index 55f55ed5..7958c0e6 100644
--- a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
+++ b/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
@@ -1,4 +1,4 @@
-SUMMARY = "TI RTOS prebuilt binary firmware images"
+SUMMARY = "TI Echo Test prebuilt binary firmware images"
 
 LICENSE = "TI-TFL"
 LIC_FILES_CHKSUM = "file://${COREBASE}/../meta-ti/licenses/TI-TFL;md5=a1b59cb7ba626b9dbbcbf00f3fbc438a"
@@ -34,10 +34,8 @@ CLEANBROKEN = "1"
 inherit ti-secdev
 
 IPC_FW_DIR = "ti-ipc/${PLAT_SFX}"
-ETH_FW_DIR = "ti-eth/${PLAT_SFX}"
 
 INSTALL_IPC_FW_DIR = "${nonarch_base_libdir}/firmware/${IPC_FW_DIR}"
-INSTALL_ETH_FW_DIR = "${nonarch_base_libdir}/firmware/${ETH_FW_DIR}"
 
 MCU_1_0_FW = "ipc_echo_test_mcu1_0_release_strip.xer5f"
 MCU_1_1_FW = "ipc_echo_test_mcu1_1_release_strip.xer5f"
@@ -54,8 +52,6 @@ C7X_2_FW   = "ipc_echo_test_c7x_2_release_strip.xe71"
 C7X_3_FW   = "ipc_echo_test_c7x_3_release_strip.xe71"
 C7X_4_FW   = "ipc_echo_test_c7x_4_release_strip.xe71"
 
-ETH_FW = "app_remoteswitchcfg_server_strip.xer5f"
-
 IPC_FW_LIST = ""
 IPC_FW_LIST:j721e =   "              ${MCU_1_1_FW} ${MCU_2_0_FW} ${MCU_2_1_FW} ${MCU_3_0_FW} ${MCU_3_1_FW}                             ${C66_1_FW} ${C66_2_FW} ${C7X_1_FW}"
 IPC_FW_LIST:j7200 =   "              ${MCU_1_1_FW} ${MCU_2_0_FW} ${MCU_2_1_FW}"
@@ -66,16 +62,6 @@ IPC_FW_LIST:am64xx =  "${MCU_1_0_FW} ${MCU_1_1_FW} ${MCU_2_0_FW} ${MCU_2_1_FW} $
 IPC_FW_LIST:am62xx =  "                            ${MCU_2_0_FW}"
 IPC_FW_LIST:am62axx = "                            ${MCU_2_0_FW}                                                                                               ${C7X_1_FW}"
 
-ETH_FW_LIST = ""
-ETH_FW_LIST:j721e =   "${ETH_FW}"
-ETH_FW_LIST:j7200 =   "${ETH_FW}"
-ETH_FW_LIST:j721s2 =  ""
-ETH_FW_LIST:j784s4 =  "${ETH_FW}"
-ETH_FW_LIST:am65xx =  ""
-ETH_FW_LIST:am64xx =  ""
-ETH_FW_LIST:am62xx =  ""
-ETH_FW_LIST:am62axx = ""
-
 # Update the am64xx ipc binaries to be consistent with other platforms
 do_install:prepend:am64xx() {
         ( cd ${S}/${IPC_FW_DIR}; \
@@ -108,12 +94,6 @@ do_install() {
         ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ${S}/${IPC_FW_DIR}/${FW_NAME} ${S}/${IPC_FW_DIR}/${FW_NAME}.signed
     done
 
-    # ETH firmware
-    for FW_NAME in ${ETH_FW_LIST}
-    do
-        ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ${S}/${ETH_FW_DIR}/${FW_NAME} ${S}/${ETH_FW_DIR}/${FW_NAME}.signed
-    done
-
     # IPC Firmware
     install -d ${D}${INSTALL_IPC_FW_DIR}
     for FW_NAME in ${IPC_FW_LIST}
@@ -121,14 +101,6 @@ do_install() {
         install -m 0644 ${S}/${IPC_FW_DIR}/${FW_NAME}        ${D}${INSTALL_IPC_FW_DIR}
         install -m 0644 ${S}/${IPC_FW_DIR}/${FW_NAME}.signed ${D}${INSTALL_IPC_FW_DIR}
     done
-
-    # ETH firmware
-    install -d ${D}${INSTALL_ETH_FW_DIR}
-    for FW_NAME in ${ETH_FW_LIST}
-    do
-        install -m 0644 ${S}/${ETH_FW_DIR}/${FW_NAME}        ${D}${INSTALL_ETH_FW_DIR}
-        install -m 0644 ${S}/${ETH_FW_DIR}/${FW_NAME}.signed ${D}${INSTALL_ETH_FW_DIR}
-    done
 }
 
 # Set up names for the firmwares
@@ -303,7 +275,7 @@ ALTERNATIVE_TARGET[am62a-mcu-r5f0_0-fw] = "${INSTALL_IPC_FW_DIR}/${MCU_2_0_FW}"
 ALTERNATIVE_TARGET[am62a-c71_0-fw] = "${INSTALL_IPC_FW_DIR}/${C7X_1_FW}"
 
 ALTERNATIVE_TARGET[j7-mcu-r5f0_1-fw] = "${INSTALL_IPC_FW_DIR}/${MCU_1_1_FW}"
-ALTERNATIVE_TARGET[j7-main-r5f0_0-fw] = "${INSTALL_ETH_FW_DIR}/${ETH_FW}"
+ALTERNATIVE_TARGET[j7-main-r5f0_0-fw] = "${INSTALL_IPC_FW_DIR}/${MCU_2_0_FW}"
 ALTERNATIVE_TARGET[j7-main-r5f0_1-fw] = "${INSTALL_IPC_FW_DIR}/${MCU_2_1_FW}"
 ALTERNATIVE_TARGET[j7-main-r5f1_0-fw] = "${INSTALL_IPC_FW_DIR}/${MCU_3_0_FW}"
 ALTERNATIVE_TARGET[j7-main-r5f1_1-fw] = "${INSTALL_IPC_FW_DIR}/${MCU_3_1_FW}"
@@ -311,7 +283,7 @@ ALTERNATIVE_TARGET[j7-c66_0-fw] = "${INSTALL_IPC_FW_DIR}/${C66_1_FW}"
 ALTERNATIVE_TARGET[j7-c66_1-fw] = "${INSTALL_IPC_FW_DIR}/${C66_2_FW}"
 ALTERNATIVE_TARGET[j7-c71_0-fw] = "${INSTALL_IPC_FW_DIR}/${C7X_1_FW}"
 
-ALTERNATIVE_TARGET[j7-main-r5f0_0-fw-sec] = "${INSTALL_ETH_FW_DIR}/${ETH_FW}.signed"
+ALTERNATIVE_TARGET[j7-main-r5f0_0-fw-sec] = "${INSTALL_IPC_FW_DIR}/${MCU_2_0_FW}.signed"
 ALTERNATIVE_TARGET[j7-main-r5f0_1-fw-sec] = "${INSTALL_IPC_FW_DIR}/${MCU_2_1_FW}.signed"
 ALTERNATIVE_TARGET[j7-main-r5f1_0-fw-sec] = "${INSTALL_IPC_FW_DIR}/${MCU_3_0_FW}.signed"
 ALTERNATIVE_TARGET[j7-main-r5f1_1-fw-sec] = "${INSTALL_IPC_FW_DIR}/${MCU_3_1_FW}.signed"
@@ -320,10 +292,10 @@ ALTERNATIVE_TARGET[j7-c66_1-fw-sec] = "${INSTALL_IPC_FW_DIR}/${C66_2_FW}.signed"
 ALTERNATIVE_TARGET[j7-c71_0-fw-sec] = "${INSTALL_IPC_FW_DIR}/${C7X_1_FW}.signed"
 
 ALTERNATIVE_TARGET[j7200-mcu-r5f0_1-fw] = "${INSTALL_IPC_FW_DIR}/${MCU_1_1_FW}"
-ALTERNATIVE_TARGET[j7200-main-r5f0_0-fw] = "${INSTALL_ETH_FW_DIR}/${ETH_FW}"
+ALTERNATIVE_TARGET[j7200-main-r5f0_0-fw] = "${INSTALL_IPC_FW_DIR}/${MCU_2_0_FW}"
 ALTERNATIVE_TARGET[j7200-main-r5f0_1-fw] = "${INSTALL_IPC_FW_DIR}/${MCU_2_1_FW}"
 
-ALTERNATIVE_TARGET[j7200-main-r5f0_0-fw-sec] = "${INSTALL_ETH_FW_DIR}/${ETH_FW}.signed"
+ALTERNATIVE_TARGET[j7200-main-r5f0_0-fw-sec] = "${INSTALL_IPC_FW_DIR}/${MCU_2_0_FW}.signed"
 ALTERNATIVE_TARGET[j7200-main-r5f0_1-fw-sec] = "${INSTALL_IPC_FW_DIR}/${MCU_2_1_FW}.signed"
 
 ALTERNATIVE_TARGET[j721s2-mcu-r5f0_1-fw] = "${INSTALL_IPC_FW_DIR}/${MCU_1_1_FW}"
-- 
2.39.2


