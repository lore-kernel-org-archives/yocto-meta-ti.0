Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81509C77B78
	for <webhook@archiver.kernel.org>; Tue, 18 Apr 2023 20:23:45 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.20501.1681849424260441036
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 18 Apr 2023 13:23:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=ihlrvZpR;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33IKNgIw123121;
	Tue, 18 Apr 2023 15:23:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1681849422;
	bh=3ORnbQS0e+8uZggcaPbfnZsd9J3W/r0VBSelEjKL3I0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=ihlrvZpR+HZ8nz3PvwpsnuJa6sDLGoSGOXFWf1v4tlxAKXZa3CkCF3bd99gSfyolK
	 yN/GhprDQPT5HmOQsTSKmwCqXwswdAl5w4KJgaYqQ14qm8t1P6WpyaLXCI++CGZIXL
	 KGTx7dpDR82H0CaVbI7qXLvZ5YQ/LKWiT+ImbLIc=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33IKNgiX019449
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 18 Apr 2023 15:23:42 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 18
 Apr 2023 15:23:41 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Tue, 18 Apr 2023 15:23:41 -0500
Received: from ula0226330.dal.design.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33IKNemu086283;
	Tue, 18 Apr 2023 15:23:41 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH 2/2] ti-rtos-firmware: Use the same directory structure as linux-firmware
Date: Tue, 18 Apr 2023 15:23:40 -0500
Message-ID: <20230418202340.31072-2-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230418202340.31072-1-afd@ti.com>
References: <20230418202340.31072-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 18 Apr 2023 20:23:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16414

Currently we move this firmware around and put it in a directories named
pdk-ipc/ and ethfw/. This does not match what is in linux-firmware which
is what projects should expect /lib/firmware to match. This causes issues
for projects that want to work both on meta-ti and also on any other distro.

Switch to shipping the same directory structure as linux-firmware here.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc  |  12 +-
 .../ti-rtos-bin/ti-rtos-firmware.bb           | 191 +++++++++---------
 2 files changed, 105 insertions(+), 98 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
index 4f73a7b9..8e236dfe 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
@@ -27,9 +27,19 @@ DEPENDS += "dtc-native bc-native lzop-native flex-native bison-native python3-se
 
 DM_FIRMWARE = "ipc_echo_testb_mcu1_0_release_strip.xer5f"
 
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
 PACKAGECONFIG[atf] = "ATF=${STAGING_DIR_HOST}/firmware/bl31.bin,,trusted-firmware-a"
 PACKAGECONFIG[optee] = "TEE=${STAGING_DIR_HOST}${nonarch_base_libdir}/firmware/bl32.bin,,optee-os"
-PACKAGECONFIG[dm] = "DM=${STAGING_DIR_HOST}${nonarch_base_libdir}/firmware/pdk-ipc/${DM_FIRMWARE},,ti-rtos-firmware"
+PACKAGECONFIG[dm] = "DM=${STAGING_DIR_HOST}${nonarch_base_libdir}/firmware/ti-dm/${PLAT_SFX}/${DM_FIRMWARE},,ti-rtos-firmware"
 
 PACKAGECONFIG:append:aarch64 = " atf optee"
 PACKAGECONFIG:append:j721e = " dm"
diff --git a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
index 4cac1bfa..6bd85662 100644
--- a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
+++ b/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
@@ -26,22 +26,20 @@ FILESEXTRAPATHS:prepend := "${METATIBASE}/recipes-bsp/ti-sci-fw/files/:"
 require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
 
 PV = "${CORESDK_RTOS_VERSION}"
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 CLEANBROKEN = "1"
 
 # Secure Build
 inherit ti-secdev
 
-RTOS_ETH_FW_DIR = "${S}/ti-eth/${PLAT_SFX}"
-RTOS_DM_FW_DIR = "${S}/ti-dm/${PLAT_SFX}"
-RTOS_IPC_FW_DIR = "${S}/ti-ipc/${PLAT_SFX}"
+DM_FW_DIR = "ti-dm/${PLAT_SFX}"
+IPC_FW_DIR = "ti-ipc/${PLAT_SFX}"
+ETH_FW_DIR = "ti-eth/${PLAT_SFX}"
 
-# For back-ward compatability keeping legacy firmware folder name
-# TODO: fix this in next version
-LEGACY_ETH_FW_DIR = "${D}${nonarch_base_libdir}/firmware/ethfw/"
-LEGACY_IPC_FW_DIR = "${D}${nonarch_base_libdir}/firmware/pdk-ipc/"
-LEGACY_DM_FW_DIR  = "${D}${nonarch_base_libdir}/firmware/pdk-ipc/"
+INSTALL_DM_FW_DIR  = "${nonarch_base_libdir}/firmware/${DM_FW_DIR}"
+INSTALL_IPC_FW_DIR = "${nonarch_base_libdir}/firmware/${IPC_FW_DIR}"
+INSTALL_ETH_FW_DIR = "${nonarch_base_libdir}/firmware/${ETH_FW_DIR}"
 
 DM_FIRMWARE = "ipc_echo_testb_mcu1_0_release_strip.xer5f"
 
@@ -94,7 +92,7 @@ ETH_FW_LIST:am62axx = ""
 
 # Update the am64xx ipc binaries to be consistent with other platforms
 do_install:prepend:am64xx() {
-        ( cd ${RTOS_IPC_FW_DIR}; \
+        ( cd ${S}/${IPC_FW_DIR}; \
                 ln -sf am64-main-r5f0_0-fw ${MCU_1_0_FW}; \
                 ln -sf am64-main-r5f0_1-fw ${MCU_1_1_FW}; \
                 ln -sf am64-main-r5f1_0-fw ${MCU_2_0_FW}; \
@@ -105,14 +103,14 @@ do_install:prepend:am64xx() {
 
 # Update the am62xx ipc binaries to be consistent with other platforms
 do_install:prepend:am62xx() {
-        ( cd ${RTOS_IPC_FW_DIR}; \
+        ( cd ${S}/${IPC_FW_DIR}; \
                 ln -sf am62-mcu-m4f0_0-fw ${MCU_2_0_FW}; \
         )
 }
 
 # Update the am62axx ipc binaries to be consistent with other platforms
 do_install:prepend:am62axx() {
-        ( cd ${RTOS_IPC_FW_DIR}; \
+        ( cd ${S}/${IPC_FW_DIR}; \
                 ln -sf am62a-mcu-r5f0_0-fw ${MCU_2_0_FW}; \
         )
 }
@@ -122,44 +120,43 @@ do_install() {
     # DM Firmware
     for FW_NAME in ${DM_FW_LIST}
     do
-        ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ${RTOS_DM_FW_DIR}/${FW_NAME} ${RTOS_DM_FW_DIR}/${FW_NAME}.signed
+        ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ${S}/${DM_FW_DIR}/${FW_NAME} ${S}/${DM_FW_DIR}/${FW_NAME}.signed
     done
 
     # IPC Firmware
     for FW_NAME in ${IPC_FW_LIST}
     do
-        ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ${RTOS_IPC_FW_DIR}/${FW_NAME} ${RTOS_IPC_FW_DIR}/${FW_NAME}.signed
+        ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ${S}/${IPC_FW_DIR}/${FW_NAME} ${S}/${IPC_FW_DIR}/${FW_NAME}.signed
     done
 
     # ETH firmware
     for FW_NAME in ${ETH_FW_LIST}
     do
-        ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ${RTOS_ETH_FW_DIR}/${FW_NAME} ${RTOS_ETH_FW_DIR}/${FW_NAME}.signed
+        ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ${S}/${ETH_FW_DIR}/${FW_NAME} ${S}/${ETH_FW_DIR}/${FW_NAME}.signed
     done
 
-    # Install all R5 & DSP ipc echo test binaries in lib/firmware/pdk-ipc, with softlinks up a level
     # DM Firmware
-    install -d ${LEGACY_DM_FW_DIR}
+    install -d ${D}${INSTALL_DM_FW_DIR}
     for FW_NAME in ${DM_FW_LIST}
     do
-        install -m 0644 ${RTOS_DM_FW_DIR}/${FW_NAME}        ${LEGACY_DM_FW_DIR}/${FW_NAME}.unsigned
-        install -m 0644 ${RTOS_DM_FW_DIR}/${FW_NAME}.signed ${LEGACY_DM_FW_DIR}/${FW_NAME}
+        install -m 0644 ${S}/${DM_FW_DIR}/${FW_NAME}        ${D}${INSTALL_DM_FW_DIR}/${FW_NAME}.unsigned
+        install -m 0644 ${S}/${DM_FW_DIR}/${FW_NAME}.signed ${D}${INSTALL_DM_FW_DIR}/${FW_NAME}
     done
 
     # IPC Firmware
-    install -d ${LEGACY_IPC_FW_DIR}
+    install -d ${D}${INSTALL_IPC_FW_DIR}
     for FW_NAME in ${IPC_FW_LIST}
     do
-        install -m 0644 ${RTOS_IPC_FW_DIR}/${FW_NAME}        ${LEGACY_IPC_FW_DIR}
-        install -m 0644 ${RTOS_IPC_FW_DIR}/${FW_NAME}.signed ${LEGACY_IPC_FW_DIR}
+        install -m 0644 ${S}/${IPC_FW_DIR}/${FW_NAME}        ${D}${INSTALL_IPC_FW_DIR}
+        install -m 0644 ${S}/${IPC_FW_DIR}/${FW_NAME}.signed ${D}${INSTALL_IPC_FW_DIR}
     done
 
     # ETH firmware
-    install -d ${LEGACY_ETH_FW_DIR}
+    install -d ${D}${INSTALL_ETH_FW_DIR}
     for FW_NAME in ${ETH_FW_LIST}
     do
-        install -m 0644 ${RTOS_ETH_FW_DIR}/${FW_NAME}        ${LEGACY_ETH_FW_DIR}
-        install -m 0644 ${RTOS_ETH_FW_DIR}/${FW_NAME}.signed ${LEGACY_ETH_FW_DIR}
+        install -m 0644 ${S}/${ETH_FW_DIR}/${FW_NAME}        ${D}${INSTALL_ETH_FW_DIR}
+        install -m 0644 ${S}/${ETH_FW_DIR}/${FW_NAME}.signed ${D}${INSTALL_ETH_FW_DIR}
     done
 }
 
@@ -168,8 +165,8 @@ do_deploy() {
     install -d ${DEPLOYDIR}
     for FW_NAME in ${DM_FW_LIST}
     do
-        install -m 0644 ${RTOS_DM_FW_DIR}/${FW_NAME}        ${DEPLOYDIR}/${FW_NAME}.unsigned
-        install -m 0644 ${RTOS_DM_FW_DIR}/${FW_NAME}.signed ${DEPLOYDIR}/${FW_NAME}
+        install -m 0644 ${S}/${DM_FW_DIR}/${FW_NAME}        ${DEPLOYDIR}/${FW_NAME}.unsigned
+        install -m 0644 ${S}/${DM_FW_DIR}/${FW_NAME}.signed ${DEPLOYDIR}/${FW_NAME}
     done
 }
 
@@ -331,76 +328,76 @@ ALTERNATIVE_LINK_NAME[j784s4-c71_3-fw] = "${nonarch_base_libdir}/firmware/j784s4
 
 # Create the firmware alternatives
 
-ALTERNATIVE_TARGET[am65x-mcu-r5f0_0-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/${MCU_1_0_FW}"
-ALTERNATIVE_TARGET[am65x-mcu-r5f0_1-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/${MCU_1_1_FW}"
-
-ALTERNATIVE_TARGET[am64-main-r5f0_0-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/${MCU_1_0_FW}"
-ALTERNATIVE_TARGET[am64-main-r5f0_1-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/${MCU_1_1_FW}"
-ALTERNATIVE_TARGET[am64-main-r5f1_0-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/${MCU_2_0_FW}"
-ALTERNATIVE_TARGET[am64-main-r5f1_1-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/${MCU_2_1_FW}"
-ALTERNATIVE_TARGET[am64-mcu-m4f0_0-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/${MCU_3_0_FW}"
-
-ALTERNATIVE_TARGET[am62-main-r5f0_0-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/${DM_FIRMWARE}"
-ALTERNATIVE_TARGET[am62-mcu-m4f0_0-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/${MCU_2_0_FW}"
-
-ALTERNATIVE_TARGET[am62a-main-r5f0_0-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/${DM_FIRMWARE}"
-ALTERNATIVE_TARGET[am62a-mcu-r5f0_0-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/${MCU_2_0_FW}"
-ALTERNATIVE_TARGET[am62a-c71_0-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/${C7X_1_FW}"
-
-ALTERNATIVE_TARGET[j7-mcu-r5f0_0-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/${DM_FIRMWARE}"
-ALTERNATIVE_TARGET[j7-mcu-r5f0_1-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/${MCU_1_1_FW}"
-ALTERNATIVE_TARGET[j7-main-r5f0_0-fw] = "${nonarch_base_libdir}/firmware/ethfw/${ETH_FW}"
-ALTERNATIVE_TARGET[j7-main-r5f0_1-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/${MCU_2_1_FW}"
-ALTERNATIVE_TARGET[j7-main-r5f1_0-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/${MCU_3_0_FW}"
-ALTERNATIVE_TARGET[j7-main-r5f1_1-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/${MCU_3_1_FW}"
-ALTERNATIVE_TARGET[j7-c66_0-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/${C66_1_FW}"
-ALTERNATIVE_TARGET[j7-c66_1-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/${C66_2_FW}"
-ALTERNATIVE_TARGET[j7-c71_0-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/${C7X_1_FW}"
-
-ALTERNATIVE_TARGET[j7-main-r5f0_0-fw-sec] = "${nonarch_base_libdir}/firmware/ethfw/${ETH_FW}.signed"
-ALTERNATIVE_TARGET[j7-main-r5f0_1-fw-sec] = "${nonarch_base_libdir}/firmware/pdk-ipc/${MCU_2_1_FW}.signed"
-ALTERNATIVE_TARGET[j7-main-r5f1_0-fw-sec] = "${nonarch_base_libdir}/firmware/pdk-ipc/${MCU_3_0_FW}.signed"
-ALTERNATIVE_TARGET[j7-main-r5f1_1-fw-sec] = "${nonarch_base_libdir}/firmware/pdk-ipc/${MCU_3_1_FW}.signed"
-ALTERNATIVE_TARGET[j7-c66_0-fw-sec] = "${nonarch_base_libdir}/firmware/pdk-ipc/${C66_1_FW}.signed"
-ALTERNATIVE_TARGET[j7-c66_1-fw-sec] = "${nonarch_base_libdir}/firmware/pdk-ipc/${C66_2_FW}.signed"
-ALTERNATIVE_TARGET[j7-c71_0-fw-sec] = "${nonarch_base_libdir}/firmware/pdk-ipc/${C7X_1_FW}.signed"
-
-ALTERNATIVE_TARGET[j7200-mcu-r5f0_0-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/${DM_FIRMWARE}"
-ALTERNATIVE_TARGET[j7200-mcu-r5f0_1-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/${MCU_1_1_FW}"
-ALTERNATIVE_TARGET[j7200-main-r5f0_0-fw] = "${nonarch_base_libdir}/firmware/ethfw/${ETH_FW}"
-ALTERNATIVE_TARGET[j7200-main-r5f0_1-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/${MCU_2_1_FW}"
-
-ALTERNATIVE_TARGET[j7200-main-r5f0_0-fw-sec] = "${nonarch_base_libdir}/firmware/ethfw/${ETH_FW}.signed"
-ALTERNATIVE_TARGET[j7200-main-r5f0_1-fw-sec] = "${nonarch_base_libdir}/firmware/pdk-ipc/${MCU_2_1_FW}.signed"
-
-ALTERNATIVE_TARGET[j721s2-mcu-r5f0_0-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/${DM_FIRMWARE}"
-ALTERNATIVE_TARGET[j721s2-mcu-r5f0_1-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/${MCU_1_1_FW}"
-ALTERNATIVE_TARGET[j721s2-main-r5f0_0-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/${MCU_2_0_FW}"
-ALTERNATIVE_TARGET[j721s2-main-r5f0_1-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/${MCU_2_1_FW}"
-ALTERNATIVE_TARGET[j721s2-main-r5f1_0-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/${MCU_3_0_FW}"
-ALTERNATIVE_TARGET[j721s2-main-r5f1_1-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/${MCU_3_1_FW}"
-ALTERNATIVE_TARGET[j721s2-c71_0-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/${C7X_1_FW}"
-ALTERNATIVE_TARGET[j721s2-c71_1-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/${C7X_2_FW}"
-
-ALTERNATIVE_TARGET[j721s2-main-r5f0_0-fw-sec] = "${nonarch_base_libdir}/firmware/pdk-ipc/${MCU_2_0_FW}.signed"
-ALTERNATIVE_TARGET[j721s2-main-r5f0_1-fw-sec] = "${nonarch_base_libdir}/firmware/pdk-ipc/${MCU_2_1_FW}.signed"
-ALTERNATIVE_TARGET[j721s2-main-r5f1_0-fw-sec] = "${nonarch_base_libdir}/firmware/pdk-ipc/${MCU_3_0_FW}.signed"
-ALTERNATIVE_TARGET[j721s2-main-r5f1_1-fw-sec] = "${nonarch_base_libdir}/firmware/pdk-ipc/${MCU_3_1_FW}.signed"
-ALTERNATIVE_TARGET[j721s2-c71_0-fw-sec] = "${nonarch_base_libdir}/firmware/pdk-ipc/${C7X_1_FW}.signed"
-ALTERNATIVE_TARGET[j721s2-c71_1-fw-sec] = "${nonarch_base_libdir}/firmware/pdk-ipc/${C7X_2_FW}.signed"
-
-ALTERNATIVE_TARGET[j784s4-mcu-r5f0_0-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/${DM_FIRMWARE}"
-ALTERNATIVE_TARGET[j784s4-mcu-r5f0_1-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/${MCU_1_1_FW}"
-ALTERNATIVE_TARGET[j784s4-main-r5f0_0-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/${MCU_2_0_FW}"
-ALTERNATIVE_TARGET[j784s4-main-r5f0_1-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/${MCU_2_1_FW}"
-ALTERNATIVE_TARGET[j784s4-main-r5f1_0-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/${MCU_3_0_FW}"
-ALTERNATIVE_TARGET[j784s4-main-r5f1_1-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/${MCU_3_1_FW}"
-ALTERNATIVE_TARGET[j784s4-main-r5f2_0-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/${MCU_4_0_FW}"
-ALTERNATIVE_TARGET[j784s4-main-r5f2_1-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/${MCU_4_1_FW}"
-ALTERNATIVE_TARGET[j784s4-c71_0-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/${C7X_1_FW}"
-ALTERNATIVE_TARGET[j784s4-c71_1-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/${C7X_2_FW}"
-ALTERNATIVE_TARGET[j784s4-c71_2-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/${C7X_3_FW}"
-ALTERNATIVE_TARGET[j784s4-c71_3-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/${C7X_4_FW}"
+ALTERNATIVE_TARGET[am65x-mcu-r5f0_0-fw] = "${INSTALL_IPC_FW_DIR}/${MCU_1_0_FW}"
+ALTERNATIVE_TARGET[am65x-mcu-r5f0_1-fw] = "${INSTALL_IPC_FW_DIR}/${MCU_1_1_FW}"
+
+ALTERNATIVE_TARGET[am64-main-r5f0_0-fw] = "${INSTALL_IPC_FW_DIR}/${MCU_1_0_FW}"
+ALTERNATIVE_TARGET[am64-main-r5f0_1-fw] = "${INSTALL_IPC_FW_DIR}/${MCU_1_1_FW}"
+ALTERNATIVE_TARGET[am64-main-r5f1_0-fw] = "${INSTALL_IPC_FW_DIR}/${MCU_2_0_FW}"
+ALTERNATIVE_TARGET[am64-main-r5f1_1-fw] = "${INSTALL_IPC_FW_DIR}/${MCU_2_1_FW}"
+ALTERNATIVE_TARGET[am64-mcu-m4f0_0-fw] = "${INSTALL_IPC_FW_DIR}/${MCU_3_0_FW}"
+
+ALTERNATIVE_TARGET[am62-main-r5f0_0-fw] = "${INSTALL_DM_FW_DIR}/${DM_FIRMWARE}"
+ALTERNATIVE_TARGET[am62-mcu-m4f0_0-fw] = "${INSTALL_IPC_FW_DIR}/${MCU_2_0_FW}"
+
+ALTERNATIVE_TARGET[am62a-main-r5f0_0-fw] = "${INSTALL_DM_FW_DIR}/${DM_FIRMWARE}"
+ALTERNATIVE_TARGET[am62a-mcu-r5f0_0-fw] = "${INSTALL_IPC_FW_DIR}/${MCU_2_0_FW}"
+ALTERNATIVE_TARGET[am62a-c71_0-fw] = "${INSTALL_IPC_FW_DIR}/${C7X_1_FW}"
+
+ALTERNATIVE_TARGET[j7-mcu-r5f0_0-fw] = "${INSTALL_DM_FW_DIR}/${DM_FIRMWARE}"
+ALTERNATIVE_TARGET[j7-mcu-r5f0_1-fw] = "${INSTALL_IPC_FW_DIR}/${MCU_1_1_FW}"
+ALTERNATIVE_TARGET[j7-main-r5f0_0-fw] = "${INSTALL_ETH_FW_DIR}/${ETH_FW}"
+ALTERNATIVE_TARGET[j7-main-r5f0_1-fw] = "${INSTALL_IPC_FW_DIR}/${MCU_2_1_FW}"
+ALTERNATIVE_TARGET[j7-main-r5f1_0-fw] = "${INSTALL_IPC_FW_DIR}/${MCU_3_0_FW}"
+ALTERNATIVE_TARGET[j7-main-r5f1_1-fw] = "${INSTALL_IPC_FW_DIR}/${MCU_3_1_FW}"
+ALTERNATIVE_TARGET[j7-c66_0-fw] = "${INSTALL_IPC_FW_DIR}/${C66_1_FW}"
+ALTERNATIVE_TARGET[j7-c66_1-fw] = "${INSTALL_IPC_FW_DIR}/${C66_2_FW}"
+ALTERNATIVE_TARGET[j7-c71_0-fw] = "${INSTALL_IPC_FW_DIR}/${C7X_1_FW}"
+
+ALTERNATIVE_TARGET[j7-main-r5f0_0-fw-sec] = "${INSTALL_ETH_FW_DIR}/${ETH_FW}.signed"
+ALTERNATIVE_TARGET[j7-main-r5f0_1-fw-sec] = "${INSTALL_IPC_FW_DIR}/${MCU_2_1_FW}.signed"
+ALTERNATIVE_TARGET[j7-main-r5f1_0-fw-sec] = "${INSTALL_IPC_FW_DIR}/${MCU_3_0_FW}.signed"
+ALTERNATIVE_TARGET[j7-main-r5f1_1-fw-sec] = "${INSTALL_IPC_FW_DIR}/${MCU_3_1_FW}.signed"
+ALTERNATIVE_TARGET[j7-c66_0-fw-sec] = "${INSTALL_IPC_FW_DIR}/${C66_1_FW}.signed"
+ALTERNATIVE_TARGET[j7-c66_1-fw-sec] = "${INSTALL_IPC_FW_DIR}/${C66_2_FW}.signed"
+ALTERNATIVE_TARGET[j7-c71_0-fw-sec] = "${INSTALL_IPC_FW_DIR}/${C7X_1_FW}.signed"
+
+ALTERNATIVE_TARGET[j7200-mcu-r5f0_0-fw] = "${INSTALL_DM_FW_DIR}/${DM_FIRMWARE}"
+ALTERNATIVE_TARGET[j7200-mcu-r5f0_1-fw] = "${INSTALL_IPC_FW_DIR}/${MCU_1_1_FW}"
+ALTERNATIVE_TARGET[j7200-main-r5f0_0-fw] = "${INSTALL_ETH_FW_DIR}/${ETH_FW}"
+ALTERNATIVE_TARGET[j7200-main-r5f0_1-fw] = "${INSTALL_IPC_FW_DIR}/${MCU_2_1_FW}"
+
+ALTERNATIVE_TARGET[j7200-main-r5f0_0-fw-sec] = "${INSTALL_ETH_FW_DIR}/${ETH_FW}.signed"
+ALTERNATIVE_TARGET[j7200-main-r5f0_1-fw-sec] = "${INSTALL_IPC_FW_DIR}/${MCU_2_1_FW}.signed"
+
+ALTERNATIVE_TARGET[j721s2-mcu-r5f0_0-fw] = "${INSTALL_DM_FW_DIR}/${DM_FIRMWARE}"
+ALTERNATIVE_TARGET[j721s2-mcu-r5f0_1-fw] = "${INSTALL_IPC_FW_DIR}/${MCU_1_1_FW}"
+ALTERNATIVE_TARGET[j721s2-main-r5f0_0-fw] = "${INSTALL_IPC_FW_DIR}/${MCU_2_0_FW}"
+ALTERNATIVE_TARGET[j721s2-main-r5f0_1-fw] = "${INSTALL_IPC_FW_DIR}/${MCU_2_1_FW}"
+ALTERNATIVE_TARGET[j721s2-main-r5f1_0-fw] = "${INSTALL_IPC_FW_DIR}/${MCU_3_0_FW}"
+ALTERNATIVE_TARGET[j721s2-main-r5f1_1-fw] = "${INSTALL_IPC_FW_DIR}/${MCU_3_1_FW}"
+ALTERNATIVE_TARGET[j721s2-c71_0-fw] = "${INSTALL_IPC_FW_DIR}/${C7X_1_FW}"
+ALTERNATIVE_TARGET[j721s2-c71_1-fw] = "${INSTALL_IPC_FW_DIR}/${C7X_2_FW}"
+
+ALTERNATIVE_TARGET[j721s2-main-r5f0_0-fw-sec] = "${INSTALL_IPC_FW_DIR}/${MCU_2_0_FW}.signed"
+ALTERNATIVE_TARGET[j721s2-main-r5f0_1-fw-sec] = "${INSTALL_IPC_FW_DIR}/${MCU_2_1_FW}.signed"
+ALTERNATIVE_TARGET[j721s2-main-r5f1_0-fw-sec] = "${INSTALL_IPC_FW_DIR}/${MCU_3_0_FW}.signed"
+ALTERNATIVE_TARGET[j721s2-main-r5f1_1-fw-sec] = "${INSTALL_IPC_FW_DIR}/${MCU_3_1_FW}.signed"
+ALTERNATIVE_TARGET[j721s2-c71_0-fw-sec] = "${INSTALL_IPC_FW_DIR}/${C7X_1_FW}.signed"
+ALTERNATIVE_TARGET[j721s2-c71_1-fw-sec] = "${INSTALL_IPC_FW_DIR}/${C7X_2_FW}.signed"
+
+ALTERNATIVE_TARGET[j784s4-mcu-r5f0_0-fw] = "${INSTALL_DM_FW_DIR}/${DM_FIRMWARE}"
+ALTERNATIVE_TARGET[j784s4-mcu-r5f0_1-fw] = "${INSTALL_IPC_FW_DIR}/${MCU_1_1_FW}"
+ALTERNATIVE_TARGET[j784s4-main-r5f0_0-fw] = "${INSTALL_IPC_FW_DIR}/${MCU_2_0_FW}"
+ALTERNATIVE_TARGET[j784s4-main-r5f0_1-fw] = "${INSTALL_IPC_FW_DIR}/${MCU_2_1_FW}"
+ALTERNATIVE_TARGET[j784s4-main-r5f1_0-fw] = "${INSTALL_IPC_FW_DIR}/${MCU_3_0_FW}"
+ALTERNATIVE_TARGET[j784s4-main-r5f1_1-fw] = "${INSTALL_IPC_FW_DIR}/${MCU_3_1_FW}"
+ALTERNATIVE_TARGET[j784s4-main-r5f2_0-fw] = "${INSTALL_IPC_FW_DIR}/${MCU_4_0_FW}"
+ALTERNATIVE_TARGET[j784s4-main-r5f2_1-fw] = "${INSTALL_IPC_FW_DIR}/${MCU_4_1_FW}"
+ALTERNATIVE_TARGET[j784s4-c71_0-fw] = "${INSTALL_IPC_FW_DIR}/${C7X_1_FW}"
+ALTERNATIVE_TARGET[j784s4-c71_1-fw] = "${INSTALL_IPC_FW_DIR}/${C7X_2_FW}"
+ALTERNATIVE_TARGET[j784s4-c71_2-fw] = "${INSTALL_IPC_FW_DIR}/${C7X_3_FW}"
+ALTERNATIVE_TARGET[j784s4-c71_3-fw] = "${INSTALL_IPC_FW_DIR}/${C7X_4_FW}"
 
 ALTERNATIVE_PRIORITY = "10"
 
-- 
2.39.2


