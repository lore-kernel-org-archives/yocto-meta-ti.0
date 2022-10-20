Return-Path: <m-chawdhry@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD219C433FE
	for <webhook@archiver.kernel.org>; Thu, 20 Oct 2022 05:26:13 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web12.6382.1666243563982800027
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 19 Oct 2022 22:26:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Yi1OVtYx;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: m-chawdhry@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 29K5Q2mD106381
	for <meta-ti@lists.yoctoproject.org>; Thu, 20 Oct 2022 00:26:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1666243562;
	bh=wfBoHYsmMgQUTF1hKoFdfUqUkaakqhUcqpmzCWS73yg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Yi1OVtYxF6OMWlh+/Ql3dw7egf/1voC8U9yJuPdPQB3dj4s3J5qZEYVaak1cEcj9O
	 AUJu4rY1ON5youGPhw6lHStRI6N23wrrp0GNJ9UDyV/8Ym/OUmPT5olgS06BkO2gzN
	 7bdURD2zJ6ammD2M/R6lH3KMtGd3cJ07vVIdHN+g=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 29K5Q2ao014980
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 20 Oct 2022 00:26:02 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Thu, 20
 Oct 2022 00:26:02 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Thu, 20 Oct 2022 00:26:02 -0500
Received: from uda0497581.dhcp.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 29K5PuEv120845;
	Thu, 20 Oct 2022 00:26:00 -0500
From: Manorit Chawdhry <m-chawdhry@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>, Ryan Eatmon <reatmon@ti.com>,
        Manorit Chawdhry
	<m-chawdhry@ti.com>
Subject: [meta-ti][RFC dunfell][PATCH v3 2/6] ti-rtos-firmware: Add J784S4 High Security support
Date: Thu, 20 Oct 2022 10:55:51 +0530
Message-ID: <20221020052555.1895586-3-m-chawdhry@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221020052555.1895586-1-m-chawdhry@ti.com>
References: <20221020052555.1895586-1-m-chawdhry@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 20 Oct 2022 05:26:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15186

Sign the firmwares for j784s4 similar to j721s2 hs.
Duplicate all j784s4 entries for j784s4-hs as we cannot use same
keyword for match between j784s4-evm and j784s4-hs-evm.

Signed-off-by: Manorit Chawdhry <m-chawdhry@ti.com>
---
 recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb | 138 +++++++++++++++++++++
 1 file changed, 138 insertions(+)

diff --git a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
index 68c93ae7..31212aae 100644
--- a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
+++ b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
@@ -20,6 +20,7 @@ PLAT_SFX_j7200-hs-evm = "j7200"
 PLAT_SFX_j721s2-evm = "j721s2"
 PLAT_SFX_j721s2-hs-evm = "j721s2"
 PLAT_SFX_j784s4-evm = "j784s4"
+PLAT_SFX_j784s4-hs-evm = "j784s4"
 PLAT_SFX_am65xx = "am65xx"
 PLAT_SFX_am64xx = "am64xx"
 PLAT_SFX_am62xx = "am62xx"
@@ -128,6 +129,38 @@ do_install_prepend_j721s2-hs-evm() {
         )
 }
 
+# J784S4 support
+do_install_prepend_j784s4-hs-evm() {
+        export TI_SECURE_DEV_PKG=${TI_SECURE_DEV_PKG}
+        ( cd ${RTOS_DM_FW_DIR}; \
+                mv ${DM_FIRMWARE} ${DM_FIRMWARE}.unsigned; \
+                ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ${DM_FIRMWARE}.unsigned ${DM_FIRMWARE}; \
+        )
+        (
+          cd ${RTOS_IPC_FW_DIR}; \
+            ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ipc_echo_test_mcu2_0_release_strip.xer5f \
+                ipc_echo_test_mcu2_0_release_strip.xer5f.signed; \
+            ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ipc_echo_test_mcu2_1_release_strip.xer5f \
+                ipc_echo_test_mcu2_1_release_strip.xer5f.signed; \
+            ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ipc_echo_test_mcu3_0_release_strip.xer5f \
+                ipc_echo_test_mcu3_0_release_strip.xer5f.signed; \
+            ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ipc_echo_test_mcu3_1_release_strip.xer5f \
+                ipc_echo_test_mcu3_1_release_strip.xer5f.signed; \
+            ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ipc_echo_test_mcu4_0_release_strip.xer5f \
+                ipc_echo_test_mcu4_0_release_strip.xer5f.signed; \
+            ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ipc_echo_test_mcu4_1_release_strip.xer5f \
+                ipc_echo_test_mcu4_1_release_strip.xer5f.signed; \
+            ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ipc_echo_test_c7x_1_release_strip.xe71 \
+                ipc_echo_test_c7x_1_release_strip.xe71.signed; \
+            ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ipc_echo_test_c7x_2_release_strip.xe71 \
+                ipc_echo_test_c7x_2_release_strip.xe71.signed; \
+            ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ipc_echo_test_c7x_3_release_strip.xe71 \
+                ipc_echo_test_c7x_3_release_strip.xe71.signed; \
+            ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ipc_echo_test_c7x_4_release_strip.xe71 \
+                ipc_echo_test_c7x_4_release_strip.xe71.signed; \
+        )
+}
+
 # Update the am64xx ipc binaries to be consistent with other platforms
 do_install_prepend_am64xx() {
         ( cd ${RTOS_IPC_FW_DIR}; \
@@ -248,6 +281,37 @@ do_install_j721s2-hs-evm() {
     # install -m 0644 ${RTOS_ETH_FW_DIR}/app_remoteswitchcfg_server_strip.xer5f ${LEGACY_ETH_FW_DIR}
 }
 
+do_install_j784s4-hs-evm() {
+    install -d ${LEGACY_IPC_FW_DIR}
+    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu1_1_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
+    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu2_0_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
+    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu2_1_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
+    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu3_0_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
+    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu3_1_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
+    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu4_0_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
+    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu4_1_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
+    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_c7x_1_release_strip.xe71 ${LEGACY_IPC_FW_DIR}
+    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_c7x_2_release_strip.xe71 ${LEGACY_IPC_FW_DIR}
+    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_c7x_3_release_strip.xe71 ${LEGACY_IPC_FW_DIR}
+    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_c7x_4_release_strip.xe71 ${LEGACY_IPC_FW_DIR}
+    # Signed firmware
+    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu2_0_release_strip.xer5f.signed ${LEGACY_IPC_FW_DIR}
+    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu2_1_release_strip.xer5f.signed ${LEGACY_IPC_FW_DIR}
+    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu3_0_release_strip.xer5f.signed ${LEGACY_IPC_FW_DIR}
+    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu3_1_release_strip.xer5f.signed ${LEGACY_IPC_FW_DIR}
+    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu4_0_release_strip.xer5f.signed ${LEGACY_IPC_FW_DIR}
+    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu4_1_release_strip.xer5f.signed ${LEGACY_IPC_FW_DIR}
+    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_c7x_1_release_strip.xe71.signed ${LEGACY_IPC_FW_DIR}
+    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_c7x_2_release_strip.xe71.signed ${LEGACY_IPC_FW_DIR}
+    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_c7x_3_release_strip.xe71.signed ${LEGACY_IPC_FW_DIR}
+    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_c7x_4_release_strip.xe71.signed ${LEGACY_IPC_FW_DIR}
+    # DM Firmware
+    install -m 0644 ${RTOS_DM_FW_DIR}/ipc_echo_testb_mcu1_0_release_strip.xer5f ${LEGACY_DM_FW_DIR}
+    # ETH firmware
+    install -d ${LEGACY_ETH_FW_DIR}
+    install -m 0644 ${RTOS_ETH_FW_DIR}/app_remoteswitchcfg_server_strip.xer5f ${LEGACY_ETH_FW_DIR}
+}
+
 do_install_j784s4-evm() {
     install -d ${LEGACY_IPC_FW_DIR}
     install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu1_1_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
@@ -408,6 +472,34 @@ ALTERNATIVE_${PN}_j784s4-evm = "\
                     j784s4-c71_3-fw \
                     "
 
+ALTERNATIVE_${PN}_j784s4-hs-evm = "\
+                    j784s4-mcu-r5f0_0-fw \
+                    j784s4-mcu-r5f0_1-fw \
+                    j784s4-main-r5f0_0-fw \
+                    j784s4-main-r5f0_1-fw \
+                    j784s4-main-r5f1_0-fw \
+                    j784s4-main-r5f1_1-fw \
+                    j784s4-main-r5f2_0-fw \
+                    j784s4-main-r5f2_1-fw \
+                    j784s4-c71_0-fw \
+                    j784s4-c71_1-fw \
+                    j784s4-c71_2-fw \
+                    j784s4-c71_3-fw \
+                    "
+
+ALTERNATIVE_${PN}_j784s4-hs-evm += "\
+                    j784s4-main-r5f0_0-fw-sec \
+                    j784s4-main-r5f0_1-fw-sec \
+                    j784s4-main-r5f1_0-fw-sec \
+                    j784s4-main-r5f1_1-fw-sec \
+                    j784s4-main-r5f2_0-fw-sec \
+                    j784s4-main-r5f2_1-fw-sec \
+                    j784s4-c71_0-fw-sec \
+                    j784s4-c71_1-fw-sec \
+                    j784s4-c71_2-fw-sec \
+                    j784s4-c71_3-fw-sec \
+                    "
+
 # Set up link names for the firmwares
 
 TARGET_MCU_R5FSS0_0_am65xx = "am65x-mcu-r5f0_0-fw"
@@ -491,6 +583,30 @@ TARGET_C7X_1_j784s4-evm = "j784s4-c71_1-fw"
 TARGET_C7X_2_j784s4-evm = "j784s4-c71_2-fw"
 TARGET_C7X_3_j784s4-evm = "j784s4-c71_3-fw"
 
+TARGET_MCU_R5FSS0_0_j784s4-hs-evm = "j784s4-mcu-r5f0_0-fw"
+TARGET_MCU_R5FSS0_1_j784s4-hs-evm = "j784s4-mcu-r5f0_1-fw"
+TARGET_MAIN_R5FSS0_0_j784s4-hs-evm = "j784s4-main-r5f0_0-fw"
+TARGET_MAIN_R5FSS0_1_j784s4-hs-evm = "j784s4-main-r5f0_1-fw"
+TARGET_MAIN_R5FSS1_0_j784s4-hs-evm = "j784s4-main-r5f1_0-fw"
+TARGET_MAIN_R5FSS1_1_j784s4-hs-evm = "j784s4-main-r5f1_1-fw"
+TARGET_MAIN_R5FSS2_0_j784s4-hs-evm = "j784s4-main-r5f2_0-fw"
+TARGET_MAIN_R5FSS2_1_j784s4-hs-evm = "j784s4-main-r5f2_1-fw"
+TARGET_C7X_0_j784s4-hs-evm = "j784s4-c71_0-fw"
+TARGET_C7X_1_j784s4-hs-evm = "j784s4-c71_1-fw"
+TARGET_C7X_2_j784s4-hs-evm = "j784s4-c71_2-fw"
+TARGET_C7X_3_j784s4-hs-evm = "j784s4-c71_3-fw"
+
+TARGET_MAIN_R5FSS0_0_SIGNED_j784s4-hs-evm = "j784s4-main-r5f0_0-fw-sec"
+TARGET_MAIN_R5FSS0_1_SIGNED_j784s4-hs-evm = "j784s4-main-r5f0_1-fw-sec"
+TARGET_MAIN_R5FSS1_0_SIGNED_j784s4-hs-evm = "j784s4-main-r5f1_0-fw-sec"
+TARGET_MAIN_R5FSS1_1_SIGNED_j784s4-hs-evm = "j784s4-main-r5f1_1-fw-sec"
+TARGET_MAIN_R5FSS2_0_SIGNED_j784s4-hs-evm = "j784s4-main-r5f2_0-fw-sec"
+TARGET_MAIN_R5FSS2_1_SIGNED_j784s4-hs-evm = "j784s4-main-r5f2_1-fw-sec"
+TARGET_C7X_0_SIGNED_j784s4-hs-evm = "j784s4-c71_0-fw-sec"
+TARGET_C7X_1_SIGNED_j784s4-hs-evm = "j784s4-c71_1-fw-sec"
+TARGET_C7X_2_SIGNED_j784s4-hs-evm = "j784s4-c71_2-fw-sec"
+TARGET_C7X_3_SIGNED_j784s4-hs-evm = "j784s4-c71_3-fw-sec"
+
 ALTERNATIVE_LINK_NAME[am65x-mcu-r5f0_0-fw] = "${base_libdir}/firmware/${TARGET_MCU_R5FSS0_0}"
 ALTERNATIVE_LINK_NAME[am65x-mcu-r5f0_1-fw] = "${base_libdir}/firmware/${TARGET_MCU_R5FSS0_1}"
 
@@ -558,6 +674,17 @@ ALTERNATIVE_LINK_NAME[j784s4-c71_1-fw] = "${base_libdir}/firmware/${TARGET_C7X_1
 ALTERNATIVE_LINK_NAME[j784s4-c71_2-fw] = "${base_libdir}/firmware/${TARGET_C7X_2}"
 ALTERNATIVE_LINK_NAME[j784s4-c71_3-fw] = "${base_libdir}/firmware/${TARGET_C7X_3}"
 
+ALTERNATIVE_LINK_NAME[j784s4-main-r5f0_0-fw-sec] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS0_0_SIGNED}"
+ALTERNATIVE_LINK_NAME[j784s4-main-r5f0_1-fw-sec] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS0_1_SIGNED}"
+ALTERNATIVE_LINK_NAME[j784s4-main-r5f1_0-fw-sec] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS1_0_SIGNED}"
+ALTERNATIVE_LINK_NAME[j784s4-main-r5f1_1-fw-sec] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS1_1_SIGNED}"
+ALTERNATIVE_LINK_NAME[j784s4-main-r5f2_0-fw-sec] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS2_0_SIGNED}"
+ALTERNATIVE_LINK_NAME[j784s4-main-r5f2_1-fw-sec] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS2_1_SIGNED}"
+ALTERNATIVE_LINK_NAME[j784s4-c71_0-fw-sec] = "${base_libdir}/firmware/${TARGET_C7X_0_SIGNED}"
+ALTERNATIVE_LINK_NAME[j784s4-c71_1-fw-sec] = "${base_libdir}/firmware/${TARGET_C7X_1_SIGNED}"
+ALTERNATIVE_LINK_NAME[j784s4-c71_2-fw-sec] = "${base_libdir}/firmware/${TARGET_C7X_2_SIGNED}"
+ALTERNATIVE_LINK_NAME[j784s4-c71_3-fw-sec] = "${base_libdir}/firmware/${TARGET_C7X_3_SIGNED}"
+
 # Create the firmware alternatives
 
 ALTERNATIVE_TARGET[am65x-mcu-r5f0_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu1_0_release_strip.xer5f"
@@ -627,6 +754,17 @@ ALTERNATIVE_TARGET[j784s4-c71_1-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_
 ALTERNATIVE_TARGET[j784s4-c71_2-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_c7x_3_release_strip.xe71"
 ALTERNATIVE_TARGET[j784s4-c71_3-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_c7x_4_release_strip.xe71"
 
+ALTERNATIVE_TARGET[j784s4-main-r5f0_0-fw-sec] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu2_0_release_strip.xer5f.signed"
+ALTERNATIVE_TARGET[j784s4-main-r5f0_1-fw-sec] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu2_1_release_strip.xer5f.signed"
+ALTERNATIVE_TARGET[j784s4-main-r5f1_0-fw-sec] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu3_0_release_strip.xer5f.signed"
+ALTERNATIVE_TARGET[j784s4-main-r5f1_1-fw-sec] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu3_1_release_strip.xer5f.signed"
+ALTERNATIVE_TARGET[j784s4-main-r5f2_0-fw-sec] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu4_0_release_strip.xer5f.signed"
+ALTERNATIVE_TARGET[j784s4-main-r5f2_1-fw-sec] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu4_1_release_strip.xer5f.signed"
+ALTERNATIVE_TARGET[j784s4-c71_0-fw-sec] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_c7x_1_release_strip.xe71.signed"
+ALTERNATIVE_TARGET[j784s4-c71_1-fw-sec] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_c7x_2_release_strip.xe71.signed"
+ALTERNATIVE_TARGET[j784s4-c71_2-fw-sec] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_c7x_3_release_strip.xe71.signed"
+ALTERNATIVE_TARGET[j784s4-c71_3-fw-sec] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_c7x_4_release_strip.xe71.signed"
+
 ALTERNATIVE_PRIORITY = "10"
 
 # make sure that lib/firmware, and all its contents are part of the package
-- 
2.34.1


