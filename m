Return-Path: <m-chawdhry@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E173ECAAD5
	for <webhook@archiver.kernel.org>; Mon, 12 Sep 2022 08:55:28 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.5328.1662972919975865099
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 12 Sep 2022 01:55:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=EneOOQeR;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: m-chawdhry@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 28C8tJ1s079515
	for <meta-ti@lists.yoctoproject.org>; Mon, 12 Sep 2022 03:55:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1662972919;
	bh=UUdYUtFunOOMi8KAvS4CRZEClqMR64H+P+cx6cE5FW4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=EneOOQeRYjgetVGbWLMQHrNWui54ISBcjq+pg/BHS/tBslK+hSsFS7KRf3yltaFFF
	 aUDD0dzl2NSwOCqbuzCETETy2x1kKo19lpBC/29/EP3SFLlbe9uKVQMMkNx3zJ4F+A
	 4xpKd94UGjeER9PuY74NyGwoKitrxVzGNLHE9/nU=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 28C8tJrk015227
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 12 Sep 2022 03:55:19 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Mon, 12
 Sep 2022 03:55:19 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Mon, 12 Sep 2022 03:55:19 -0500
Received: from uda0497581.dhcp.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 28C8tBVw101532;
	Mon, 12 Sep 2022 03:55:17 -0500
From: Manorit Chawdhry <m-chawdhry@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>, Nishanth Menon <nm@ti.com>,
        Manorit Chawdhry
	<m-chawdhry@ti.com>
Subject: [meta-ti][dunfell][PATCH v2 3/3] ti-rtos-firmware: j721s2-hs-evm: add
 secure firmware images
Date: Mon, 12 Sep 2022 14:25:10 +0530
Message-ID: <20220912085510.763246-4-m-chawdhry@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220912085510.763246-1-m-chawdhry@ti.com>
References: <20220912085510.763246-1-m-chawdhry@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 12 Sep 2022 08:55:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15023

Adds support for secure firmware images in J721S2 HS EVM.

Signed-off-by: Manorit Chawdhry <m-chawdhry@ti.com>
---
 recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb | 48 ++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
index 8ea57fa2..0ff60c81 100644
--- a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
+++ b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
@@ -105,6 +105,20 @@ do_install_prepend_j721s2-hs-evm() {
                 mv ${DM_FIRMWARE} ${DM_FIRMWARE}.unsigned; \
                 ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ${DM_FIRMWARE}.unsigned ${DM_FIRMWARE}; \
         )
+        ( cd ${RTOS_IPC_FW_DIR}; \
+            ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ipc_echo_test_mcu2_0_release_strip.xer5f \
+                ipc_echo_test_mcu2_0_release_strip.xer5f.signed; \
+            ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ipc_echo_test_mcu2_1_release_strip.xer5f \
+                ipc_echo_test_mcu2_1_release_strip.xer5f.signed; \
+            ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ipc_echo_test_mcu3_0_release_strip.xer5f \
+                ipc_echo_test_mcu3_0_release_strip.xer5f.signed; \
+            ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ipc_echo_test_mcu3_1_release_strip.xer5f \
+                ipc_echo_test_mcu3_1_release_strip.xer5f.signed; \
+            ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ipc_echo_test_c7x_1_release_strip.xe71 \
+                ipc_echo_test_c7x_1_release_strip.xe71.signed; \
+            ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ipc_echo_test_c7x_2_release_strip.xe71 \
+                ipc_echo_test_c7x_2_release_strip.xe71.signed; \
+        )
 }
 
 # Update the am64xx ipc binaries to be consistent with other platforms
@@ -213,6 +227,13 @@ do_install_j721s2-hs-evm() {
     install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu3_1_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
     install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_c7x_1_release_strip.xe71 ${LEGACY_IPC_FW_DIR}
     install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_c7x_2_release_strip.xe71 ${LEGACY_IPC_FW_DIR}
+    # Signed firmware
+    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu2_0_release_strip.xer5f.signed ${LEGACY_IPC_FW_DIR}
+    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu2_1_release_strip.xer5f.signed ${LEGACY_IPC_FW_DIR}
+    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu3_0_release_strip.xer5f.signed ${LEGACY_IPC_FW_DIR}
+    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu3_1_release_strip.xer5f.signed ${LEGACY_IPC_FW_DIR}
+    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_c7x_1_release_strip.xe71.signed ${LEGACY_IPC_FW_DIR}
+    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_c7x_2_release_strip.xe71.signed ${LEGACY_IPC_FW_DIR}
     # DM Firmware
     install -m 0644 ${RTOS_DM_FW_DIR}/ipc_echo_testb_mcu1_0_release_strip.xer5f ${LEGACY_DM_FW_DIR}
     # ETH firmware
@@ -337,6 +358,12 @@ ALTERNATIVE_${PN}_j721s2-hs-evm = "\
                     j721s2-main-r5f1_1-fw \
                     j721s2-c71_0-fw \
                     j721s2-c71_1-fw \
+                    j721s2-main-r5f0_0-fw-sec \
+                    j721s2-main-r5f0_1-fw-sec \
+                    j721s2-main-r5f1_0-fw-sec \
+                    j721s2-main-r5f1_1-fw-sec \
+                    j721s2-c71_0-fw-sec \
+                    j721s2-c71_1-fw-sec \
                     "
 
 # Set up link names for the firmwares
@@ -402,6 +429,13 @@ TARGET_MAIN_R5FSS1_1_j721s2-hs-evm = "j721s2-main-r5f1_1-fw"
 TARGET_C7X_0_j721s2-hs-evm = "j721s2-c71_0-fw"
 TARGET_C7X_1_j721s2-hs-evm = "j721s2-c71_1-fw"
 
+TARGET_MAIN_R5FSS0_0_SIGNED_j721s2-hs-evm = "j721s2-main-r5f0_0-fw-sec"
+TARGET_MAIN_R5FSS0_1_SIGNED_j721s2-hs-evm = "j721s2-main-r5f0_1-fw-sec"
+TARGET_MAIN_R5FSS1_0_SIGNED_j721s2-hs-evm = "j721s2-main-r5f1_0-fw-sec"
+TARGET_MAIN_R5FSS1_1_SIGNED_j721s2-hs-evm = "j721s2-main-r5f1_1-fw-sec"
+TARGET_C7X_0_SIGNED_j721s2-hs-evm = "j721s2-c71_0-fw-sec"
+TARGET_C7X_1_SIGNED_j721s2-hs-evm = "j721s2-c71_1-fw-sec"
+
 ALTERNATIVE_LINK_NAME[am65x-mcu-r5f0_0-fw] = "${base_libdir}/firmware/${TARGET_MCU_R5FSS0_0}"
 ALTERNATIVE_LINK_NAME[am65x-mcu-r5f0_1-fw] = "${base_libdir}/firmware/${TARGET_MCU_R5FSS0_1}"
 
@@ -449,6 +483,13 @@ ALTERNATIVE_LINK_NAME[j721s2-main-r5f1_1-fw] = "${base_libdir}/firmware/${TARGET
 ALTERNATIVE_LINK_NAME[j721s2-c71_0-fw] = "${base_libdir}/firmware/${TARGET_C7X_0}"
 ALTERNATIVE_LINK_NAME[j721s2-c71_1-fw] = "${base_libdir}/firmware/${TARGET_C7X_1}"
 
+ALTERNATIVE_LINK_NAME[j721s2-main-r5f0_0-fw-sec] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS0_0_SIGNED}"
+ALTERNATIVE_LINK_NAME[j721s2-main-r5f0_1-fw-sec] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS0_1_SIGNED}"
+ALTERNATIVE_LINK_NAME[j721s2-main-r5f1_0-fw-sec] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS1_0_SIGNED}"
+ALTERNATIVE_LINK_NAME[j721s2-main-r5f1_1-fw-sec] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS1_1_SIGNED}"
+ALTERNATIVE_LINK_NAME[j721s2-c71_0-fw-sec] = "${base_libdir}/firmware/${TARGET_C7X_0_SIGNED}"
+ALTERNATIVE_LINK_NAME[j721s2-c71_1-fw-sec] = "${base_libdir}/firmware/${TARGET_C7X_1_SIGNED}"
+
 # Create the firmware alternatives
 
 ALTERNATIVE_TARGET[am65x-mcu-r5f0_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu1_0_release_strip.xer5f"
@@ -498,6 +539,13 @@ ALTERNATIVE_TARGET[j721s2-main-r5f1_1-fw] = "${base_libdir}/firmware/pdk-ipc/ipc
 ALTERNATIVE_TARGET[j721s2-c71_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_c7x_1_release_strip.xe71"
 ALTERNATIVE_TARGET[j721s2-c71_1-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_c7x_2_release_strip.xe71"
 
+ALTERNATIVE_TARGET[j721s2-main-r5f0_0-fw-sec] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu2_0_release_strip.xer5f.signed"
+ALTERNATIVE_TARGET[j721s2-main-r5f0_1-fw-sec] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu2_1_release_strip.xer5f.signed"
+ALTERNATIVE_TARGET[j721s2-main-r5f1_0-fw-sec] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu3_0_release_strip.xer5f.signed"
+ALTERNATIVE_TARGET[j721s2-main-r5f1_1-fw-sec] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu3_1_release_strip.xer5f.signed"
+ALTERNATIVE_TARGET[j721s2-c71_0-fw-sec] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_c7x_1_release_strip.xe71.signed"
+ALTERNATIVE_TARGET[j721s2-c71_1-fw-sec] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_c7x_2_release_strip.xe71.signed"
+
 ALTERNATIVE_PRIORITY = "10"
 
 # make sure that lib/firmware, and all its contents are part of the package
-- 
2.34.1


