Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42A0FC64ED9
	for <webhook@archiver.kernel.org>; Wed, 15 Feb 2023 19:34:02 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.2566.1676489641283151327
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 15 Feb 2023 11:34:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=QT2zuOWL;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 31FJY0u1084073;
	Wed, 15 Feb 2023 13:34:00 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1676489640;
	bh=oXAVIHAVHg2pIpkK+XdYR/6KNXMK3fNAnxX8/HZKpHA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=QT2zuOWLWe6j/ficQ92gyEsx6NUfFGbe400odh5qatYWhOCmnOkOw6c7W13I0Nkvw
	 pqHLwM3nCbPfOID1mEyNlUMgDg2GRG0T7huRFyTeO9GLY+X77etgf0D2xIoohmWXj0
	 1H/FJaIOaG8NVmo2jEPlGCaeA8x1+udZMhZ8bZIk=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 31FJY0VM011014
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 15 Feb 2023 13:34:00 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 15
 Feb 2023 13:34:00 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 15 Feb 2023 13:34:00 -0600
Received: from ula0226330.dal.design.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 31FJXt6q014221;
	Wed, 15 Feb 2023 13:33:59 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH v2 13/15] ti-rtos-firmware: Use a table instead of a list of copy commands
Date: Wed, 15 Feb 2023 13:33:53 -0600
Message-ID: <20230215193355.9676-14-afd@ti.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230215193355.9676-1-afd@ti.com>
References: <20230215193355.9676-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 15 Feb 2023 19:34:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15867

Using a table makes it easier to see what firmware is included with
each machine build. It also helps prevent errors here.

Since the same functions run across machines we now sign all the firmware
without needing to add a new signing function for each new machine.

Another fix is that we install the DM firmware to the deploy directory
for all machines that use need it. This was added for J7x machines
but missed for AM62x.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../ti-rtos-bin/ti-rtos-firmware.bb           | 276 +++++-------------
 1 file changed, 67 insertions(+), 209 deletions(-)

diff --git a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
index 396850b4..1b8e1cd2 100644
--- a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
+++ b/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
@@ -62,78 +62,32 @@ C7X_4_FW   = "ipc_echo_test_c7x_4_release_strip.xe71"
 
 ETH_FW = "app_remoteswitchcfg_server_strip.xer5f"
 
-# J721e HS support
-do_install:prepend:j721e-hs-evm() {
-        ( cd ${RTOS_DM_FW_DIR}; \
-                mv ${DM_FIRMWARE} ${DM_FIRMWARE}.unsigned; \
-                ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ${DM_FIRMWARE}.unsigned ${DM_FIRMWARE}; \
-        )
-        (
-          cd ${RTOS_IPC_FW_DIR}; \
-                ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ${MCU_2_0_FW} \
-                        ${MCU_2_0_FW}.signed; \
-                ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ${MCU_2_1_FW} \
-                        ${MCU_2_1_FW}.signed; \
-                ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ${MCU_3_0_FW} \
-                        ${MCU_3_0_FW}.signed; \
-                ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ${MCU_3_1_FW} \
-                        ${MCU_3_1_FW}.signed; \
-                ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ${C66_1_FW} \
-                        ${C66_1_FW}.signed; \
-                ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ${C66_2_FW} \
-                        ${C66_2_FW}.signed; \
-                ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ${C7X_1_FW} \
-                        ${C7X_1_FW}.signed; \
-        )
-        (
-          cd ${RTOS_ETH_FW_DIR}; \
-                ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ${ETH_FW} \
-                        ${ETH_FW}.signed;
-        )
-}
-
-# J7200 HS support
-do_install:prepend:j7200-hs-evm() {
-        ( cd ${RTOS_DM_FW_DIR}; \
-                mv ${DM_FIRMWARE} ${DM_FIRMWARE}.unsigned; \
-                ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ${DM_FIRMWARE}.unsigned ${DM_FIRMWARE}; \
-        )
-        (
-          cd ${RTOS_IPC_FW_DIR}; \
-                ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ${MCU_2_0_FW} \
-                        ${MCU_2_0_FW}.signed; \
-                ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ${MCU_2_1_FW} \
-                        ${MCU_2_1_FW}.signed; \
-        )
-        (
-          cd ${RTOS_ETH_FW_DIR}; \
-                ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ${ETH_FW} \
-                        ${ETH_FW}.signed;
-        )
-}
-
-# J721s2 HS support
-do_install:prepend:j721s2-hs-evm() {
-        ( cd ${RTOS_DM_FW_DIR}; \
-                mv ${DM_FIRMWARE} ${DM_FIRMWARE}.unsigned; \
-                ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ${DM_FIRMWARE}.unsigned ${DM_FIRMWARE}; \
-        )
-        (
-          cd ${RTOS_IPC_FW_DIR}; \
-            ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ${MCU_2_0_FW} \
-                ${MCU_2_0_FW}.signed; \
-            ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ${MCU_2_1_FW} \
-                ${MCU_2_1_FW}.signed; \
-            ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ${MCU_3_0_FW} \
-                ${MCU_3_0_FW}.signed; \
-            ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ${MCU_3_1_FW} \
-                ${MCU_3_1_FW}.signed; \
-            ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ${C7X_1_FW} \
-                ${C7X_1_FW}.signed; \
-            ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ${C7X_2_FW} \
-                ${C7X_2_FW}.signed; \
-        )
-}
+DM_FW_LIST = ""
+DM_FW_LIST:am65xx = ""
+DM_FW_LIST:j721e =  "${DM_FIRMWARE}"
+DM_FW_LIST:j7200 =  "${DM_FIRMWARE}"
+DM_FW_LIST:j721s2 = "${DM_FIRMWARE}"
+DM_FW_LIST:am64xx = ""
+DM_FW_LIST:am62xx = "${DM_FIRMWARE}"
+DM_FW_LIST:j784s4 = "${DM_FIRMWARE}"
+
+IPC_FW_LIST = ""
+IPC_FW_LIST:am65xx = "${MCU_1_0_FW} ${MCU_1_1_FW}"
+IPC_FW_LIST:j721e =  "                            ${MCU_2_0_FW} ${MCU_2_1_FW} ${MCU_3_0_FW} ${MCU_3_1_FW} ${C66_1_FW} ${C66_2_FW} ${C7X_1_FW}"
+IPC_FW_LIST:j7200 =  "              ${MCU_1_1_FW} ${MCU_2_0_FW} ${MCU_2_1_FW}"
+IPC_FW_LIST:j721s2 = "                            ${MCU_2_0_FW} ${MCU_2_1_FW} ${MCU_2_0_FW} ${MCU_3_1_FW}                         ${C7X_1_FW} ${C7X_2_FW}"
+IPC_FW_LIST:am64xx = "${MCU_1_0_FW} ${MCU_1_1_FW} ${MCU_2_0_FW} ${MCU_2_1_FW} ${MCU_3_0_FW}"
+IPC_FW_LIST:am62xx = "                            ${MCU_2_0_FW}"
+IPC_FW_LIST:j784s4 = "              ${MCU_1_1_FW} ${MCU_2_0_FW} ${MCU_2_1_FW} ${MCU_3_0_FW} ${MCU_3_1_FW}                         ${C7X_1_FW} ${C7X_2_FW} ${C7X_3_FW} ${C7X_4_FW}"
+
+ETH_FW_LIST = ""
+ETH_FW_LIST:am65xx = ""
+ETH_FW_LIST:j721e =  "${ETH_FW}"
+ETH_FW_LIST:j7200 =  "${ETH_FW}"
+ETH_FW_LIST:j721s2 = ""
+ETH_FW_LIST:am64xx = ""
+ETH_FW_LIST:am62xx = ""
+ETH_FW_LIST:j784s4 = "${ETH_FW}"
 
 # Update the am64xx ipc binaries to be consistent with other platforms
 do_install:prepend:am64xx() {
@@ -153,158 +107,62 @@ do_install:prepend:am62xx() {
         )
 }
 
-#Install all R5 & DSP ipc echo test binaries in lib/firmware/pdk-ipc, with softlinks up a level
-do_install() {
-	:
-}
-
-do_install:j721e() {
-    install -d ${LEGACY_IPC_FW_DIR}
-    install -m 0644 ${RTOS_IPC_FW_DIR}/${MCU_1_1_FW} ${LEGACY_IPC_FW_DIR}
-    install -m 0644 ${RTOS_IPC_FW_DIR}/${MCU_2_0_FW} ${LEGACY_IPC_FW_DIR}
-    install -m 0644 ${RTOS_IPC_FW_DIR}/${MCU_2_1_FW} ${LEGACY_IPC_FW_DIR}
-    install -m 0644 ${RTOS_IPC_FW_DIR}/${MCU_3_0_FW} ${LEGACY_IPC_FW_DIR}
-    install -m 0644 ${RTOS_IPC_FW_DIR}/${MCU_3_1_FW} ${LEGACY_IPC_FW_DIR}
-    install -m 0644 ${RTOS_IPC_FW_DIR}/${C66_1_FW} ${LEGACY_IPC_FW_DIR}
-    install -m 0644 ${RTOS_IPC_FW_DIR}/${C66_2_FW} ${LEGACY_IPC_FW_DIR}
-    install -m 0644 ${RTOS_IPC_FW_DIR}/${C7X_1_FW} ${LEGACY_IPC_FW_DIR}
+# Sign the firmware
+do_install:prepend() {
     # DM Firmware
-    install -m 0644 ${RTOS_DM_FW_DIR}/${DM_FIRMWARE} ${LEGACY_DM_FW_DIR}
-    # ETH firmware
-    install -d ${LEGACY_ETH_FW_DIR}
-    install -m 0644 ${RTOS_ETH_FW_DIR}/${ETH_FW} ${LEGACY_ETH_FW_DIR}
-}
+    for FW_NAME in ${DM_FW_LIST}
+    do
+      ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ${RTOS_DM_FW_DIR}/${FW_NAME} ${RTOS_DM_FW_DIR}/${FW_NAME}.signed
+    done
 
-do_install:append:j721e-hs-evm() {
-    install -m 0644 ${RTOS_IPC_FW_DIR}/${MCU_2_0_FW}.signed ${LEGACY_IPC_FW_DIR}
-    install -m 0644 ${RTOS_IPC_FW_DIR}/${MCU_2_1_FW}.signed ${LEGACY_IPC_FW_DIR}
-    install -m 0644 ${RTOS_IPC_FW_DIR}/${MCU_3_0_FW}.signed ${LEGACY_IPC_FW_DIR}
-    install -m 0644 ${RTOS_IPC_FW_DIR}/${MCU_3_1_FW}.signed ${LEGACY_IPC_FW_DIR}
-    install -m 0644 ${RTOS_IPC_FW_DIR}/${C66_1_FW}.signed ${LEGACY_IPC_FW_DIR}
-    install -m 0644 ${RTOS_IPC_FW_DIR}/${C66_2_FW}.signed ${LEGACY_IPC_FW_DIR}
-    install -m 0644 ${RTOS_IPC_FW_DIR}/${C7X_1_FW}.signed ${LEGACY_IPC_FW_DIR}
-    # ETH firmware
-    install -m 0644 ${RTOS_ETH_FW_DIR}/${ETH_FW}.signed ${LEGACY_ETH_FW_DIR}
-}
+    # IPC Firmware
+    for FW_NAME in ${IPC_FW_LIST}
+    do
+      ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ${RTOS_IPC_FW_DIR}/${FW_NAME} ${RTOS_IPC_FW_DIR}/${FW_NAME}.signed
+    done
 
-do_install:j7200-evm() {
-    install -d ${LEGACY_IPC_FW_DIR}
-    install -m 0644 ${RTOS_IPC_FW_DIR}/${MCU_1_1_FW} ${LEGACY_IPC_FW_DIR}
-    install -m 0644 ${RTOS_IPC_FW_DIR}/${MCU_2_0_FW} ${LEGACY_IPC_FW_DIR}
-    install -m 0644 ${RTOS_IPC_FW_DIR}/${MCU_2_1_FW} ${LEGACY_IPC_FW_DIR}
-    # DM Firmware
-    install -m 0644 ${RTOS_DM_FW_DIR}/${DM_FIRMWARE} ${LEGACY_DM_FW_DIR}
     # ETH firmware
-    install -d ${LEGACY_ETH_FW_DIR}
-    install -m 0644 ${RTOS_ETH_FW_DIR}/${ETH_FW} ${LEGACY_ETH_FW_DIR}
+    for FW_NAME in ${ETH_FW_LIST}
+    do
+        ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ${RTOS_ETH_FW_DIR}/${FW_NAME} ${RTOS_ETH_FW_DIR}/${FW_NAME}.signed;
+    done
 }
 
-do_install:j7200-hs-evm() {
-    install -d ${LEGACY_IPC_FW_DIR}
-    install -m 0644 ${RTOS_IPC_FW_DIR}/${MCU_1_1_FW} ${LEGACY_IPC_FW_DIR}
-    install -m 0644 ${RTOS_IPC_FW_DIR}/${MCU_2_0_FW} ${LEGACY_IPC_FW_DIR}
-    install -m 0644 ${RTOS_IPC_FW_DIR}/${MCU_2_1_FW} ${LEGACY_IPC_FW_DIR}
-    # Signed Firmwares
-    install -m 0644 ${RTOS_IPC_FW_DIR}/${MCU_2_0_FW}.signed ${LEGACY_IPC_FW_DIR}
-    install -m 0644 ${RTOS_IPC_FW_DIR}/${MCU_2_1_FW}.signed ${LEGACY_IPC_FW_DIR}
-    # DM Firmware
-    install -m 0644 ${RTOS_DM_FW_DIR}/${DM_FIRMWARE} ${LEGACY_DM_FW_DIR}
-    # ETH firmware
-    install -d ${LEGACY_ETH_FW_DIR}
-    install -m 0644 ${RTOS_ETH_FW_DIR}/${ETH_FW} ${LEGACY_ETH_FW_DIR}
-    # ETH Signed firmware
-    install -m 0644 ${RTOS_ETH_FW_DIR}/${ETH_FW}.signed ${LEGACY_ETH_FW_DIR}
-}
-
-do_install:j721s2-evm() {
-    install -d ${LEGACY_IPC_FW_DIR}
-    install -m 0644 ${RTOS_IPC_FW_DIR}/${MCU_1_1_FW} ${LEGACY_IPC_FW_DIR}
-    install -m 0644 ${RTOS_IPC_FW_DIR}/${MCU_2_0_FW} ${LEGACY_IPC_FW_DIR}
-    install -m 0644 ${RTOS_IPC_FW_DIR}/${MCU_2_1_FW} ${LEGACY_IPC_FW_DIR}
-    install -m 0644 ${RTOS_IPC_FW_DIR}/${MCU_3_0_FW} ${LEGACY_IPC_FW_DIR}
-    install -m 0644 ${RTOS_IPC_FW_DIR}/${MCU_3_1_FW} ${LEGACY_IPC_FW_DIR}
-    install -m 0644 ${RTOS_IPC_FW_DIR}/${C7X_1_FW} ${LEGACY_IPC_FW_DIR}
-    install -m 0644 ${RTOS_IPC_FW_DIR}/${C7X_2_FW} ${LEGACY_IPC_FW_DIR}
+#Install all R5 & DSP ipc echo test binaries in lib/firmware/pdk-ipc, with softlinks up a level
+do_install() {
     # DM Firmware
-    install -m 0644 ${RTOS_DM_FW_DIR}/${DM_FIRMWARE} ${LEGACY_DM_FW_DIR}
-    # ETH firmware
-    # install -d ${LEGACY_ETH_FW_DIR}
-    # install -m 0644 ${RTOS_ETH_FW_DIR}/${ETH_FW} ${LEGACY_ETH_FW_DIR}
-}
-
-do_install:j721s2-hs-evm() {
+    install -d ${LEGACY_DM_FW_DIR}
+    for FW_NAME in ${DM_FW_LIST}
+    do
+      install -m 0644 ${RTOS_DM_FW_DIR}/${FW_NAME}        ${LEGACY_DM_FW_DIR}/${FW_NAME}.unsigned
+      install -m 0644 ${RTOS_DM_FW_DIR}/${FW_NAME}.signed ${LEGACY_DM_FW_DIR}/${FW_NAME}
+    done
+
+    # IPC Firmware
     install -d ${LEGACY_IPC_FW_DIR}
-    install -m 0644 ${RTOS_IPC_FW_DIR}/${MCU_1_1_FW} ${LEGACY_IPC_FW_DIR}
-    install -m 0644 ${RTOS_IPC_FW_DIR}/${MCU_2_0_FW} ${LEGACY_IPC_FW_DIR}
-    install -m 0644 ${RTOS_IPC_FW_DIR}/${MCU_2_1_FW} ${LEGACY_IPC_FW_DIR}
-    install -m 0644 ${RTOS_IPC_FW_DIR}/${MCU_3_0_FW} ${LEGACY_IPC_FW_DIR}
-    install -m 0644 ${RTOS_IPC_FW_DIR}/${MCU_3_1_FW} ${LEGACY_IPC_FW_DIR}
-    install -m 0644 ${RTOS_IPC_FW_DIR}/${C7X_1_FW} ${LEGACY_IPC_FW_DIR}
-    install -m 0644 ${RTOS_IPC_FW_DIR}/${C7X_2_FW} ${LEGACY_IPC_FW_DIR}
-    # Signed firmware
-    install -m 0644 ${RTOS_IPC_FW_DIR}/${MCU_2_0_FW}.signed ${LEGACY_IPC_FW_DIR}
-    install -m 0644 ${RTOS_IPC_FW_DIR}/${MCU_2_1_FW}.signed ${LEGACY_IPC_FW_DIR}
-    install -m 0644 ${RTOS_IPC_FW_DIR}/${MCU_3_0_FW}.signed ${LEGACY_IPC_FW_DIR}
-    install -m 0644 ${RTOS_IPC_FW_DIR}/${MCU_3_1_FW}.signed ${LEGACY_IPC_FW_DIR}
-    install -m 0644 ${RTOS_IPC_FW_DIR}/${C7X_1_FW}.signed ${LEGACY_IPC_FW_DIR}
-    install -m 0644 ${RTOS_IPC_FW_DIR}/${C7X_2_FW}.signed ${LEGACY_IPC_FW_DIR}
-    # DM Firmware
-    install -m 0644 ${RTOS_DM_FW_DIR}/${DM_FIRMWARE} ${LEGACY_DM_FW_DIR}
-    # ETH firmware
-    # install -d ${LEGACY_ETH_FW_DIR}
-    # install -m 0644 ${RTOS_ETH_FW_DIR}/${ETH_FW} ${LEGACY_ETH_FW_DIR}
-}
+    for FW_NAME in ${IPC_FW_LIST}
+    do
+      install -m 0644 ${RTOS_IPC_FW_DIR}/${FW_NAME}        ${LEGACY_IPC_FW_DIR}
+      install -m 0644 ${RTOS_IPC_FW_DIR}/${FW_NAME}.signed ${LEGACY_IPC_FW_DIR}
+    done
 
-do_install:j784s4-evm() {
-    install -d ${LEGACY_IPC_FW_DIR}
-    install -m 0644 ${RTOS_IPC_FW_DIR}/${MCU_1_1_FW} ${LEGACY_IPC_FW_DIR}
-    install -m 0644 ${RTOS_IPC_FW_DIR}/${MCU_2_0_FW} ${LEGACY_IPC_FW_DIR}
-    install -m 0644 ${RTOS_IPC_FW_DIR}/${MCU_2_1_FW} ${LEGACY_IPC_FW_DIR}
-    install -m 0644 ${RTOS_IPC_FW_DIR}/${MCU_3_0_FW} ${LEGACY_IPC_FW_DIR}
-    install -m 0644 ${RTOS_IPC_FW_DIR}/${MCU_3_1_FW} ${LEGACY_IPC_FW_DIR}
-    install -m 0644 ${RTOS_IPC_FW_DIR}/${MCU_4_0_FW} ${LEGACY_IPC_FW_DIR}
-    install -m 0644 ${RTOS_IPC_FW_DIR}/${MCU_4_1_FW} ${LEGACY_IPC_FW_DIR}
-    install -m 0644 ${RTOS_IPC_FW_DIR}/${C7X_1_FW} ${LEGACY_IPC_FW_DIR}
-    install -m 0644 ${RTOS_IPC_FW_DIR}/${C7X_2_FW} ${LEGACY_IPC_FW_DIR}
-    install -m 0644 ${RTOS_IPC_FW_DIR}/${C7X_3_FW} ${LEGACY_IPC_FW_DIR}
-    install -m 0644 ${RTOS_IPC_FW_DIR}/${C7X_4_FW} ${LEGACY_IPC_FW_DIR}
-    # DM Firmware
-    install -m 0644 ${RTOS_DM_FW_DIR}/${DM_FIRMWARE} ${LEGACY_DM_FW_DIR}
     # ETH firmware
     install -d ${LEGACY_ETH_FW_DIR}
-    install -m 0644 ${RTOS_ETH_FW_DIR}/${ETH_FW} ${LEGACY_ETH_FW_DIR}
+    for FW_NAME in ${ETH_FW_LIST}
+    do
+      install -m 0644 ${RTOS_ETH_FW_DIR}/${FW_NAME}        ${LEGACY_ETH_FW_DIR}
+      install -m 0644 ${RTOS_ETH_FW_DIR}/${FW_NAME}.signed ${LEGACY_ETH_FW_DIR}
+    done
 }
 
-do_install:am65xx() {
-    install -d ${LEGACY_IPC_FW_DIR}
-    install -m 0644 ${RTOS_IPC_FW_DIR}/${MCU_1_0_FW} ${LEGACY_IPC_FW_DIR}
-    install -m 0644 ${RTOS_IPC_FW_DIR}/${MCU_1_1_FW} ${LEGACY_IPC_FW_DIR}
-}
-
-do_install:am64xx() {
-    install -d ${LEGACY_IPC_FW_DIR}
-    install -m 0644 ${RTOS_IPC_FW_DIR}/${MCU_1_0_FW} ${LEGACY_IPC_FW_DIR}
-    install -m 0644 ${RTOS_IPC_FW_DIR}/${MCU_1_1_FW} ${LEGACY_IPC_FW_DIR}
-    install -m 0644 ${RTOS_IPC_FW_DIR}/${MCU_2_0_FW} ${LEGACY_IPC_FW_DIR}
-    install -m 0644 ${RTOS_IPC_FW_DIR}/${MCU_2_1_FW} ${LEGACY_IPC_FW_DIR}
-    install -m 0644 ${RTOS_IPC_FW_DIR}/${MCU_3_0_FW} ${LEGACY_IPC_FW_DIR}
-}
-
-do_install:am62xx() {
-    install -d ${LEGACY_IPC_FW_DIR}
-    install -m 0644 ${RTOS_IPC_FW_DIR}/${MCU_2_0_FW} ${LEGACY_IPC_FW_DIR}
-    # DM Firmware
-    install -m 0644 ${RTOS_DM_FW_DIR}/${DM_FIRMWARE} ${LEGACY_DM_FW_DIR}
-}
-
-
 do_deploy() {
+    # DM Firmware is needed for rebuilding U-Boot
     install -d ${DEPLOYDIR}
-}
-
-do_deploy:am62xx() {
-    install -d ${DEPLOYDIR}
-    install -m 0644 ${RTOS_DM_FW_DIR}/${DM_FIRMWARE} ${DEPLOYDIR}
+    for FW_NAME in ${DM_FW_LIST}
+    do
+      install -m 0644 ${RTOS_DM_FW_DIR}/${FW_NAME}        ${DEPLOYDIR}/${FW_NAME}.unsigned
+      install -m 0644 ${RTOS_DM_FW_DIR}/${FW_NAME}.signed ${DEPLOYDIR}/${FW_NAME}
+    done
 }
 
 # Set up names for the firmwares
-- 
2.39.1


