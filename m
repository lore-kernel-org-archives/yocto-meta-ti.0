Return-Path: <j-choudhary@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89800CCA484
	for <webhook@archiver.kernel.org>; Tue,  7 Jun 2022 10:35:40 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.10676.1654598135014776643
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 07 Jun 2022 03:35:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=fJ7LBZOb;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: j-choudhary@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 257AZYjD014878
	for <meta-ti@lists.yoctoproject.org>; Tue, 7 Jun 2022 05:35:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1654598134;
	bh=Kns9tb+WtMOGohmKrhp+yxnZlt4ul15O6rCTCw9CxwY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=fJ7LBZOb1KuakH8V6PH17Dpzanr3bft5gsC2TNJLlPynvf928NrQi6PV84yYB4mLR
	 ZbjMay+ZOu8Hcpj0BBbHSjKP1pmIswJoDat7KIHgQ2mo9WaUrYq5WpjeV42o5a6a/2
	 4xyVkMmJf2U1ScZH+fJ+wrPiFqXULBspGOiQnCbU=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 257AZYRV017328
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Tue, 7 Jun 2022 05:35:34 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 7
 Jun 2022 05:35:33 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 7 Jun 2022 05:35:33 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 257AZW0H033832;
	Tue, 7 Jun 2022 05:35:33 -0500
From: Jayesh Choudhary <j-choudhary@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <afd@ti.com>, <praneeth@ti.com>, <reatmon@ti.com>, <j-choudhary@ti.com>
Subject: [meta-ti] [dunfell PATCH v2 2/5] ti-rtos-firmware: Add j721s2 hs
 support
Date: Tue, 7 Jun 2022 16:05:26 +0530
Message-ID: <20220607103529.13068-3-j-choudhary@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220607103529.13068-1-j-choudhary@ti.com>
References: <20220607103529.13068-1-j-choudhary@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 07 Jun 2022 10:35:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14788

Sign the DM firmware for j721s2 similar to j7200 hs.
Duplicate all j721s2 entries for j721s2-hs as we cannot use same
keyword for match between j721s2-evm and j721s2-hs-evm.

Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
---
 recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb | 46 ++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
index 0f2ba9af..19ea93f1 100644
--- a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
+++ b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
@@ -17,6 +17,7 @@ PLAT_SFX_j7 = "j721e"
 PLAT_SFX_j7200-evm = "j7200"
 PLAT_SFX_j7200-hs-evm = "j7200"
 PLAT_SFX_j721s2-evm = "j721s2"
+PLAT_SFX_j721s2-hs-evm = "j721s2"
 PLAT_SFX_am65xx = "am65xx"
 PLAT_SFX_am64xx = "am64xx"
 PLAT_SFX_am62xx = "am62xx"
@@ -67,6 +68,15 @@ do_install_prepend_j7200-hs-evm() {
         )
 }
 
+# J7 HS support
+do_install_prepend_j721s2-hs-evm() {
+        export TI_SECURE_DEV_PKG=${TI_SECURE_DEV_PKG}
+        ( cd ${RTOS_DM_FW_DIR}; \
+                mv ${DM_FIRMWARE} ${DM_FIRMWARE}.unsigned; \
+                ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ${DM_FIRMWARE}.unsigned ${DM_FIRMWARE}; \
+        )
+}
+
 # Update the am64xx ipc binaries to be consistent with other platforms
 do_install_prepend_am64xx() {
         ( cd ${RTOS_IPC_FW_DIR}; \
@@ -147,6 +157,22 @@ do_install_j721s2-evm() {
     # install -m 0644 ${RTOS_ETH_FW_DIR}/app_remoteswitchcfg_server_strip.xer5f ${LEGACY_ETH_FW_DIR}
 }
 
+do_install_j721s2-hs-evm() {
+    install -d ${LEGACY_IPC_FW_DIR}
+    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu1_1_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
+    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu2_0_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
+    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu2_1_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
+    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu3_0_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
+    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu3_1_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
+    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_c7x_1_release_strip.xe71 ${LEGACY_IPC_FW_DIR}
+    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_c7x_2_release_strip.xe71 ${LEGACY_IPC_FW_DIR}
+    # DM Firmware
+    install -m 0644 ${RTOS_DM_FW_DIR}/ipc_echo_testb_mcu1_0_release_strip.xer5f ${LEGACY_DM_FW_DIR}
+    # ETH firmware
+    # install -d ${LEGACY_ETH_FW_DIR}
+    # install -m 0644 ${RTOS_ETH_FW_DIR}/app_remoteswitchcfg_server_strip.xer5f ${LEGACY_ETH_FW_DIR}
+}
+
 do_install_am65xx() {
     install -d ${LEGACY_IPC_FW_DIR}
     install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu1_0_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
@@ -234,6 +260,17 @@ ALTERNATIVE_${PN}_j721s2-evm = "\
                     j721s2-c71_1-fw \
                     "
 
+ALTERNATIVE_${PN}_j721s2-hs-evm = "\
+                    j721s2-mcu-r5f0_0-fw \
+                    j721s2-mcu-r5f0_1-fw \
+                    j721s2-main-r5f0_0-fw \
+                    j721s2-main-r5f0_1-fw \
+                    j721s2-main-r5f1_0-fw \
+                    j721s2-main-r5f1_1-fw \
+                    j721s2-c71_0-fw \
+                    j721s2-c71_1-fw \
+                    "
+
 # Set up link names for the firmwares
 
 TARGET_MCU_R5FSS0_0_am65xx = "am65x-mcu-r5f0_0-fw"
@@ -277,6 +314,15 @@ TARGET_MAIN_R5FSS1_1_j721s2-evm = "j721s2-main-r5f1_1-fw"
 TARGET_C7X_0_j721s2-evm = "j721s2-c71_0-fw"
 TARGET_C7X_1_j721s2-evm = "j721s2-c71_1-fw"
 
+TARGET_MCU_R5FSS0_0_j721s2-hs-evm = "j721s2-mcu-r5f0_0-fw"
+TARGET_MCU_R5FSS0_1_j721s2-hs-evm = "j721s2-mcu-r5f0_1-fw"
+TARGET_MAIN_R5FSS0_0_j721s2-hs-evm = "j721s2-main-r5f0_0-fw"
+TARGET_MAIN_R5FSS0_1_j721s2-hs-evm = "j721s2-main-r5f0_1-fw"
+TARGET_MAIN_R5FSS1_0_j721s2-hs-evm = "j721s2-main-r5f1_0-fw"
+TARGET_MAIN_R5FSS1_1_j721s2-hs-evm = "j721s2-main-r5f1_1-fw"
+TARGET_C7X_0_j721s2-hs-evm = "j721s2-c71_0-fw"
+TARGET_C7X_1_j721s2-hs-evm = "j721s2-c71_1-fw"
+
 ALTERNATIVE_LINK_NAME[am65x-mcu-r5f0_0-fw] = "${base_libdir}/firmware/${TARGET_MCU_R5FSS0_0}"
 ALTERNATIVE_LINK_NAME[am65x-mcu-r5f0_1-fw] = "${base_libdir}/firmware/${TARGET_MCU_R5FSS0_1}"
 
-- 
2.17.1


