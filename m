Return-Path: <m-chawdhry@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F822ECAAA1
	for <webhook@archiver.kernel.org>; Fri,  9 Sep 2022 05:51:10 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web08.3333.1662702662934101880
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 08 Sep 2022 22:51:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=IuHugjC9;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: m-chawdhry@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2895p2TM077714
	for <meta-ti@lists.yoctoproject.org>; Fri, 9 Sep 2022 00:51:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1662702662;
	bh=P/M+EjxtzOr4je1dxn/Ukdwgw4OYEZsrrRsMSu5orlQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=IuHugjC9S1jqKfEw/whAtwIcj2k5nYE/Bq9wBqCsImheXcWAitb2Vo0HEDxE2v2qp
	 jwqpLqUdKWMxQVXv0/3STyFhKTbDi1folUlbYC5Nt5mZ87PL4GWcnZE+lHR2246cZ/
	 ObT/uZs+GnSnQhYTlJ8JoSYKgrhsXjdnW++cqssw=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2895p2fd039505
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 9 Sep 2022 00:51:02 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Fri, 9 Sep
 2022 00:51:01 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Fri, 9 Sep 2022 00:51:01 -0500
Received: from uda0497581.dhcp.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2895otId120128;
	Fri, 9 Sep 2022 00:51:00 -0500
From: Manorit Chawdhry <m-chawdhry@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>, Nishanth Menon <nm@ti.com>,
        Manorit Chawdhry
	<m-chawdhry@ti.com>
Subject: [meta-ti][dunfell][PATCH 2/3] ti-rtos-firmware: j7200-hs-evm: add
 secure firmware images
Date: Fri, 9 Sep 2022 11:20:54 +0530
Message-ID: <20220909055055.38394-3-m-chawdhry@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220909055055.38394-1-m-chawdhry@ti.com>
References: <20220909055055.38394-1-m-chawdhry@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 09 Sep 2022 05:51:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15013

Adds support for secure firmware images in J7200 HS EVM.

Signed-off-by: Manorit Chawdhry <m-chawdhry@ti.com>
---
 recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
index 78faeae3..f7a28218 100644
--- a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
+++ b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
@@ -89,6 +89,18 @@ do_install_prepend_j7200-hs-evm() {
                 mv ${DM_FIRMWARE} ${DM_FIRMWARE}.unsigned; \
                 ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ${DM_FIRMWARE}.unsigned ${DM_FIRMWARE}; \
         )
+        (
+          cd ${RTOS_IPC_FW_DIR}; \
+                ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ipc_echo_test_mcu2_0_release_strip.xer5f \
+                        ipc_echo_test_mcu2_0_release_strip.xer5f.signed; \
+                ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ipc_echo_test_mcu2_1_release_strip.xer5f \
+                        ipc_echo_test_mcu2_1_release_strip.xer5f.signed; \
+        )
+        (
+          cd ${RTOS_ETH_FW_DIR}; \
+                ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh app_remoteswitchcfg_server_strip.xer5f \
+                        app_remoteswitchcfg_server_strip.xer5f.signed;
+        )
 }
 
 # J7 HS support
@@ -169,11 +181,16 @@ do_install_j7200-hs-evm() {
     install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu1_1_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
     install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu2_0_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
     install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu2_1_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
+    # Signed Firmwares
+    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu2_0_release_strip.xer5f.signed ${LEGACY_IPC_FW_DIR}
+    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu2_1_release_strip.xer5f.signed ${LEGACY_IPC_FW_DIR}
     # DM Firmware
     install -m 0644 ${RTOS_DM_FW_DIR}/ipc_echo_testb_mcu1_0_release_strip.xer5f ${LEGACY_DM_FW_DIR}
     # ETH firmware
     install -d ${LEGACY_ETH_FW_DIR}
     install -m 0644 ${RTOS_ETH_FW_DIR}/app_remoteswitchcfg_server_strip.xer5f ${LEGACY_ETH_FW_DIR}
+    # ETH Signed firmware
+    install -m 0644 ${RTOS_ETH_FW_DIR}/app_remoteswitchcfg_server_strip.xer5f.signed ${LEGACY_ETH_FW_DIR}
 }
 
 do_install_j721s2-evm() {
@@ -301,6 +318,8 @@ ALTERNATIVE_${PN}_j7200-hs-evm = "\
                     j7200-mcu-r5f0_1-fw \
                     j7200-main-r5f0_0-fw \
                     j7200-main-r5f0_1-fw \
+                    j7200-main-r5f0_0-fw-sec \
+                    j7200-main-r5f0_1-fw-sec \
                     "
 
 ALTERNATIVE_${PN}_j721s2-evm = "\
@@ -367,6 +386,9 @@ TARGET_MCU_R5FSS0_1_j7200-hs-evm = "j7200-mcu-r5f0_1-fw"
 TARGET_MAIN_R5FSS0_0_j7200-hs-evm = "j7200-main-r5f0_0-fw"
 TARGET_MAIN_R5FSS0_1_j7200-hs-evm = "j7200-main-r5f0_1-fw"
 
+TARGET_MAIN_R5FSS0_0_SIGNED_j7200-hs-evm = "j7200-main-r5f0_0-fw-sec"
+TARGET_MAIN_R5FSS0_1_SIGNED_j7200-hs-evm = "j7200-main-r5f0_1-fw-sec"
+
 TARGET_MCU_R5FSS0_0_j721s2-evm = "j721s2-mcu-r5f0_0-fw"
 TARGET_MCU_R5FSS0_1_j721s2-evm = "j721s2-mcu-r5f0_1-fw"
 TARGET_MAIN_R5FSS0_0_j721s2-evm = "j721s2-main-r5f0_0-fw"
@@ -420,6 +442,9 @@ ALTERNATIVE_LINK_NAME[j7200-mcu-r5f0_1-fw] = "${base_libdir}/firmware/${TARGET_M
 ALTERNATIVE_LINK_NAME[j7200-main-r5f0_0-fw] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS0_0}"
 ALTERNATIVE_LINK_NAME[j7200-main-r5f0_1-fw] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS0_1}"
 
+ALTERNATIVE_LINK_NAME[j7200-main-r5f0_0-fw-sec] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS0_0_SIGNED}"
+ALTERNATIVE_LINK_NAME[j7200-main-r5f0_1-fw-sec] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS0_1_SIGNED}"
+
 ALTERNATIVE_LINK_NAME[j721s2-mcu-r5f0_0-fw] = "${base_libdir}/firmware/${TARGET_MCU_R5FSS0_0}"
 ALTERNATIVE_LINK_NAME[j721s2-mcu-r5f0_1-fw] = "${base_libdir}/firmware/${TARGET_MCU_R5FSS0_1}"
 ALTERNATIVE_LINK_NAME[j721s2-main-r5f0_0-fw] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS0_0}"
@@ -466,6 +491,9 @@ ALTERNATIVE_TARGET[j7200-mcu-r5f0_1-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_e
 ALTERNATIVE_TARGET[j7200-main-r5f0_0-fw] = "${base_libdir}/firmware/ethfw/app_remoteswitchcfg_server_strip.xer5f"
 ALTERNATIVE_TARGET[j7200-main-r5f0_1-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu2_1_release_strip.xer5f"
 
+ALTERNATIVE_TARGET[j7200-main-r5f0_0-fw-sec] = "${base_libdir}/firmware/ethfw/app_remoteswitchcfg_server_strip.xer5f.signed"
+ALTERNATIVE_TARGET[j7200-main-r5f0_1-fw-sec] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu2_1_release_strip.xer5f.signed"
+
 ALTERNATIVE_TARGET[j721s2-mcu-r5f0_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_testb_mcu1_0_release_strip.xer5f"
 ALTERNATIVE_TARGET[j721s2-mcu-r5f0_1-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu1_1_release_strip.xer5f"
 ALTERNATIVE_TARGET[j721s2-main-r5f0_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu2_0_release_strip.xer5f"
-- 
2.34.1


