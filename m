Return-Path: <m-chawdhry@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF540C6FA83
	for <webhook@archiver.kernel.org>; Mon, 12 Sep 2022 08:55:18 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web12.5293.1662972916357220537
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 12 Sep 2022 01:55:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=MzV+aTsr;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: m-chawdhry@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 28C8tFgV009152
	for <meta-ti@lists.yoctoproject.org>; Mon, 12 Sep 2022 03:55:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1662972915;
	bh=tzk5ANjfiu90oj5iGYNvpyDtH29aQKOU6C7CL+AWTZ4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=MzV+aTsr80g+H5Ld76W3zLpsa1m4JrkKm2SPoCoJ+MhLQirMAFyRuZulB1NszDk5T
	 8jmrcYqXF0Z9YhkqWZD2VV+3NEy/1k9jJion5h5t/Q5E2LNmuE25CVtlxwApJn5PM3
	 wg43K5eBDl1Gmib6EiJoeOHldk4hlaMHXBcNyoeY=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 28C8tFXw072327
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 12 Sep 2022 03:55:15 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Mon, 12
 Sep 2022 03:55:15 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Mon, 12 Sep 2022 03:55:15 -0500
Received: from uda0497581.dhcp.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 28C8tBVu101532;
	Mon, 12 Sep 2022 03:55:13 -0500
From: Manorit Chawdhry <m-chawdhry@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>, Nishanth Menon <nm@ti.com>,
        Manorit Chawdhry
	<m-chawdhry@ti.com>
Subject: [meta-ti][dunfell][PATCH v2 1/3] ti-rtos-firmware: j721e-hs-evm: add
 secure firmware images
Date: Mon, 12 Sep 2022 14:25:08 +0530
Message-ID: <20220912085510.763246-2-m-chawdhry@ti.com>
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
 <meta-ti@lists.yoctoproject.org>; Mon, 12 Sep 2022 08:55:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15021

Adds support for secure firmware images in J721E HS EVM.

Signed-off-by: Manorit Chawdhry <m-chawdhry@ti.com>
---
 recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb | 75 ++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
index 19ea93f1..5f2d840e 100644
--- a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
+++ b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
@@ -57,6 +57,26 @@ do_install_prepend_j7-hs-evm() {
                 mv ${DM_FIRMWARE} ${DM_FIRMWARE}.unsigned; \
                 ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ${DM_FIRMWARE}.unsigned ${DM_FIRMWARE}; \
         )
+        ( cd ${RTOS_IPC_FW_DIR}; \
+                ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ipc_echo_test_mcu2_0_release_strip.xer5f \
+                        ipc_echo_test_mcu2_0_release_strip.xer5f.signed; \
+                ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ipc_echo_test_mcu2_1_release_strip.xer5f \
+                        ipc_echo_test_mcu2_1_release_strip.xer5f.signed; \
+                ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ipc_echo_test_mcu3_0_release_strip.xer5f \
+                        ipc_echo_test_mcu3_0_release_strip.xer5f.signed; \
+                ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ipc_echo_test_mcu3_1_release_strip.xer5f \
+                        ipc_echo_test_mcu3_1_release_strip.xer5f.signed; \
+                ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ipc_echo_test_c66xdsp_1_release_strip.xe66 \
+                        ipc_echo_test_c66xdsp_1_release_strip.xe66.signed; \
+                ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ipc_echo_test_c66xdsp_2_release_strip.xe66 \
+                        ipc_echo_test_c66xdsp_2_release_strip.xe66.signed; \
+                ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ipc_echo_test_c7x_1_release_strip.xe71 \
+                        ipc_echo_test_c7x_1_release_strip.xe71.signed; \
+        )
+        ( cd ${RTOS_ETH_FW_DIR}; \
+                ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh app_remoteswitchcfg_server_strip.xer5f \
+                        app_remoteswitchcfg_server_strip.xer5f.signed;
+        )
 }
 
 # J7 HS support
@@ -117,6 +137,18 @@ do_install_j7() {
     install -m 0644 ${RTOS_ETH_FW_DIR}/app_remoteswitchcfg_server_strip.xer5f ${LEGACY_ETH_FW_DIR}
 }
 
+do_install_append_j7-hs-evm() {
+    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu2_0_release_strip.xer5f.signed ${LEGACY_IPC_FW_DIR}
+    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu2_1_release_strip.xer5f.signed ${LEGACY_IPC_FW_DIR}
+    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu3_0_release_strip.xer5f.signed ${LEGACY_IPC_FW_DIR}
+    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu3_1_release_strip.xer5f.signed ${LEGACY_IPC_FW_DIR}
+    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_c66xdsp_1_release_strip.xe66.signed ${LEGACY_IPC_FW_DIR}
+    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_c66xdsp_2_release_strip.xe66.signed ${LEGACY_IPC_FW_DIR}
+    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_c7x_1_release_strip.xe71.signed ${LEGACY_IPC_FW_DIR}
+    # ETH firmware
+    install -m 0644 ${RTOS_ETH_FW_DIR}/app_remoteswitchcfg_server_strip.xer5f.signed ${LEGACY_ETH_FW_DIR}
+}
+
 do_install_j7200-evm() {
     install -d ${LEGACY_IPC_FW_DIR}
     install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu1_1_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
@@ -223,6 +255,25 @@ ALTERNATIVE_${PN}_am62xx = "\
                     am62-main-r5f0_0-fw \
                     "
 
+ALTERNATIVE_${PN}_j7-hs-evm = "\
+                    j7-mcu-r5f0_0-fw \
+                    j7-mcu-r5f0_1-fw \
+                    j7-main-r5f0_0-fw \
+                    j7-main-r5f0_1-fw \
+                    j7-main-r5f1_0-fw \
+                    j7-main-r5f1_1-fw \
+                    j7-c66_0-fw \
+                    j7-c66_1-fw \
+                    j7-c71_0-fw\
+                    j7-main-r5f0_0-fw-sec \
+                    j7-main-r5f0_1-fw-sec \
+                    j7-main-r5f1_0-fw-sec \
+                    j7-main-r5f1_1-fw-sec \
+                    j7-c66_0-fw-sec \
+                    j7-c66_1-fw-sec \
+                    j7-c71_0-fw-sec \
+                    "
+
 ALTERNATIVE_${PN}_j7 = "\
                     j7-mcu-r5f0_0-fw \
                     j7-mcu-r5f0_1-fw \
@@ -295,6 +346,14 @@ TARGET_C66_0_j7 = "j7-c66_0-fw"
 TARGET_C66_1_j7 = "j7-c66_1-fw"
 TARGET_C7X_0_j7 = "j7-c71_0-fw"
 
+TARGET_MAIN_R5FSS0_0_SIGNED_j7-hs-evm = "j7-main-r5f0_0-fw-sec"
+TARGET_MAIN_R5FSS0_1_SIGNED_j7-hs-evm = "j7-main-r5f0_1-fw-sec"
+TARGET_MAIN_R5FSS1_0_SIGNED_j7-hs-evm = "j7-main-r5f1_0-fw-sec"
+TARGET_MAIN_R5FSS1_1_SIGNED_j7-hs-evm = "j7-main-r5f1_1-fw-sec"
+TARGET_C66_0_SIGNED_j7-hs-evm = "j7-c66_0-fw-sec"
+TARGET_C66_1_SIGNED_j7-hs-evm = "j7-c66_1-fw-sec"
+TARGET_C7X_0_SIGNED_j7-hs-evm = "j7-c71_0-fw-sec"
+
 TARGET_MCU_R5FSS0_0_j7200-evm = "j7200-mcu-r5f0_0-fw"
 TARGET_MCU_R5FSS0_1_j7200-evm = "j7200-mcu-r5f0_1-fw"
 TARGET_MAIN_R5FSS0_0_j7200-evm = "j7200-main-r5f0_0-fw"
@@ -345,6 +404,14 @@ ALTERNATIVE_LINK_NAME[j7-c66_0-fw] = "${base_libdir}/firmware/${TARGET_C66_0}"
 ALTERNATIVE_LINK_NAME[j7-c66_1-fw] = "${base_libdir}/firmware/${TARGET_C66_1}"
 ALTERNATIVE_LINK_NAME[j7-c71_0-fw] = "${base_libdir}/firmware/${TARGET_C7X_0}"
 
+ALTERNATIVE_LINK_NAME[j7-main-r5f0_0-fw-sec] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS0_0_SIGNED}"
+ALTERNATIVE_LINK_NAME[j7-main-r5f0_1-fw-sec] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS0_1_SIGNED}"
+ALTERNATIVE_LINK_NAME[j7-main-r5f1_0-fw-sec] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS1_0_SIGNED}"
+ALTERNATIVE_LINK_NAME[j7-main-r5f1_1-fw-sec] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS1_1_SIGNED}"
+ALTERNATIVE_LINK_NAME[j7-c66_0-fw-sec] = "${base_libdir}/firmware/${TARGET_C66_0_SIGNED}"
+ALTERNATIVE_LINK_NAME[j7-c66_1-fw-sec] = "${base_libdir}/firmware/${TARGET_C66_1_SIGNED}"
+ALTERNATIVE_LINK_NAME[j7-c71_0-fw-sec] = "${base_libdir}/firmware/${TARGET_C7X_0_SIGNED}"
+
 ALTERNATIVE_LINK_NAME[j7200-mcu-r5f0_0-fw] = "${base_libdir}/firmware/${TARGET_MCU_R5FSS0_0}"
 ALTERNATIVE_LINK_NAME[j7200-mcu-r5f0_1-fw] = "${base_libdir}/firmware/${TARGET_MCU_R5FSS0_1}"
 ALTERNATIVE_LINK_NAME[j7200-main-r5f0_0-fw] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS0_0}"
@@ -383,6 +450,14 @@ ALTERNATIVE_TARGET[j7-c66_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test
 ALTERNATIVE_TARGET[j7-c66_1-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_c66xdsp_2_release_strip.xe66"
 ALTERNATIVE_TARGET[j7-c71_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_c7x_1_release_strip.xe71"
 
+ALTERNATIVE_TARGET[j7-main-r5f0_0-fw-sec] = "${base_libdir}/firmware/ethfw/app_remoteswitchcfg_server_strip.xer5f.signed"
+ALTERNATIVE_TARGET[j7-main-r5f0_1-fw-sec] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu2_1_release_strip.xer5f.signed"
+ALTERNATIVE_TARGET[j7-main-r5f1_0-fw-sec] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu3_0_release_strip.xer5f.signed"
+ALTERNATIVE_TARGET[j7-main-r5f1_1-fw-sec] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu3_1_release_strip.xer5f.signed"
+ALTERNATIVE_TARGET[j7-c66_0-fw-sec] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_c66xdsp_1_release_strip.xe66.signed"
+ALTERNATIVE_TARGET[j7-c66_1-fw-sec] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_c66xdsp_2_release_strip.xe66.signed"
+ALTERNATIVE_TARGET[j7-c71_0-fw-sec] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_c7x_1_release_strip.xe71.signed"
+
 ALTERNATIVE_TARGET[j7200-mcu-r5f0_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_testb_mcu1_0_release_strip.xer5f"
 ALTERNATIVE_TARGET[j7200-mcu-r5f0_1-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu1_1_release_strip.xer5f"
 ALTERNATIVE_TARGET[j7200-main-r5f0_0-fw] = "${base_libdir}/firmware/ethfw/app_remoteswitchcfg_server_strip.xer5f"
-- 
2.34.1


