Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D2D3C4332F
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 18:16:01 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web09.13668.1647972960507880911
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 22 Mar 2022 11:16:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=koY/rlZw;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22MIFx97123847;
	Tue, 22 Mar 2022 13:15:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1647972959;
	bh=k2xbtqFH/JtpDFrYSSfw/vRz4HKZBTFLgnPEf17Z7CU=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=koY/rlZwzqjGYsmNGwLZnP04bnYpHgH5jTrZ2MOjgjIma+gkH1NuqZhgGKgqDGOlc
	 5ErHM72iQUf62TyJf+tJWsHP8r9DiXw0yhccFwRnZYm+LbKTVLR6Eb+JAlY6KMC2Hg
	 6DcKihmm0AKWj6XSXZRhdBRzQP1jRTk9BNncONCo=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22MIFxtS060594
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 22 Mar 2022 13:15:59 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 22
 Mar 2022 13:15:59 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 22 Mar 2022 13:15:58 -0500
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22MIFx4C015154;
	Tue, 22 Mar 2022 13:15:59 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1nWj30-0005P0-UO; Tue, 22 Mar 2022 13:15:58 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Yogesh Siraswar <yogeshs@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH v2 5/7] ti-rtos: Add support for AM62x M4F
Date: Tue, 22 Mar 2022 13:15:56 -0500
Message-ID: <20220322181558.20684-6-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220322181558.20684-1-reatmon@ti.com>
References: <20220322181558.20684-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 22 Mar 2022 18:16:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14532

From: Hari Nagalla <hnagalla@ti.com>

Add M4F FW support for AM62x SoC.

Signed-off-by: Hari Nagalla <hnagalla@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb | 23 +++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
index 4cd08a36..43119f03 100644
--- a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
+++ b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
@@ -19,7 +19,7 @@ PLAT_SFX_j7200-hs-evm = "j7200"
 PLAT_SFX_j721s2-evm = "j721s2"
 PLAT_SFX_am65xx = "am65xx"
 PLAT_SFX_am64xx = "am64xx"
-PLAT_SFX_am62xx-evm = "am62x"
+PLAT_SFX_am62xx = "am62xx"
 
 FILESEXTRAPATHS_prepend := "${METATIBASE}/recipes-bsp/ti-sci-fw/files/:"
 require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -78,6 +78,13 @@ do_install_prepend_am64xx() {
         )
 }
 
+# Update the am62xx ipc binaries to be consistent with other platforms
+do_install_prepend_am62xx() {
+        ( cd ${RTOS_IPC_FW_DIR}; \
+                mv am62-mcu-m4f0_0-fw ipc_echo_baremetal_test_mcu1_0_release_strip.xer5f; \
+        )
+}
+
 #Install all R5 & DSP ipc echo test binaries in lib/firmware/pdk-ipc, with softlinks up a level
 do_install() {
 
@@ -155,11 +162,9 @@ do_install_am64xx() {
     install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_baremetal_test_mcu3_0_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
 }
 
-do_install_am62xx-evm() {
+do_install_am62xx() {
     install -d ${LEGACY_IPC_FW_DIR}
-    # No specific firmware to install till M4F comes online
-    # DM Firmware
-    install -m 0644 ${RTOS_DM_FW_DIR}/ipc_echo_testb_mcu1_0_release_strip.xer5f ${LEGACY_DM_FW_DIR}
+    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_baremetal_test_mcu1_0_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
 }
 
 # Set up names for the firmwares
@@ -175,6 +180,9 @@ ALTERNATIVE_${PN}_am64xx = "\
                     am64-main-r5f1_1-fw \
                     am64-mcu-m4f0_0-fw \
                     "
+ALTERNATIVE_${PN}_am62xx = "\
+                    am62-mcu-m4f0_0-fw \
+                    "
 
 ALTERNATIVE_${PN}_j7 = "\
                     j7-mcu-r5f0_0-fw \
@@ -227,6 +235,7 @@ TARGET_MAIN_R5FSS0_1_am64xx = "am64-main-r5f0_1-fw"
 TARGET_MAIN_R5FSS1_0_am64xx = "am64-main-r5f1_0-fw"
 TARGET_MAIN_R5FSS1_1_am64xx = "am64-main-r5f1_1-fw"
 TARGET_MCU_M4FSS0_0_am64xx = "am64-mcu-m4f0_0-fw"
+TARGET_MCU_M4FSS0_0_am62xx = "am62-mcu-m4f0_0-fw"
 
 TARGET_MCU_R5FSS0_0_j7 = "j7-mcu-r5f0_0-fw"
 TARGET_MCU_R5FSS0_1_j7 = "j7-mcu-r5f0_1-fw"
@@ -268,6 +277,8 @@ ALTERNATIVE_LINK_NAME[am64-main-r5f1_0-fw] = "${base_libdir}/firmware/${TARGET_M
 ALTERNATIVE_LINK_NAME[am64-main-r5f1_1-fw] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS1_1}"
 ALTERNATIVE_LINK_NAME[am64-mcu-m4f0_0-fw] = "${base_libdir}/firmware/${TARGET_MCU_M4FSS0_0}"
 
+ALTERNATIVE_LINK_NAME[am62-mcu-m4f0_0-fw] = "${base_libdir}/firmware/${TARGET_MCU_M4FSS0_0}"
+
 ALTERNATIVE_LINK_NAME[j7-mcu-r5f0_0-fw] = "${base_libdir}/firmware/${TARGET_MCU_R5FSS0_0}"
 ALTERNATIVE_LINK_NAME[j7-mcu-r5f0_1-fw] = "${base_libdir}/firmware/${TARGET_MCU_R5FSS0_1}"
 ALTERNATIVE_LINK_NAME[j7-main-r5f0_0-fw] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS0_0}"
@@ -305,6 +316,8 @@ ALTERNATIVE_TARGET[am64-main-r5f1_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_e
 ALTERNATIVE_TARGET[am64-main-r5f1_1-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_baremetal_test_mcu2_1_release_strip.xer5f"
 ALTERNATIVE_TARGET[am64-mcu-m4f0_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_baremetal_test_mcu3_0_release_strip.xer5f"
 
+ALTERNATIVE_TARGET[am62-mcu-m4f0_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_baremetal_test_mcu1_0_release_strip.xer5f"
+
 ALTERNATIVE_TARGET[j7-mcu-r5f0_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_testb_mcu1_0_release_strip.xer5f"
 ALTERNATIVE_TARGET[j7-mcu-r5f0_1-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu1_1_release_strip.xer5f"
 ALTERNATIVE_TARGET[j7-main-r5f0_0-fw] = "${base_libdir}/firmware/ethfw/app_remoteswitchcfg_server_strip.xer5f"
-- 
2.17.1


