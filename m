Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CD20C433EF
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 18:16:01 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web08.13729.1647972960677996137
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 22 Mar 2022 11:16:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=wfAG7Sqq;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22MIFx47129546;
	Tue, 22 Mar 2022 13:15:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1647972959;
	bh=wBooCOSE2Gwr9ReVf0Yk1GC3x5eFZm0nLgQxrMuXvW8=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=wfAG7SqqEH8wl6C9sNczRazFsgPCs8j2WtcU73FzpX8X99DC5Ai/oHdATRNHOkhMI
	 1ded7mrMtofJz7s0aLiUawY+UtBMB4bNhZyUrB86LJJgurP4r7ZLWtMDwxs+6t/0mG
	 V18Ex4YyXkPQsLN9y++nFiOY3EjAVV9wf30hOosM=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22MIFxOZ060597
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 22 Mar 2022 13:15:59 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 22
 Mar 2022 13:15:59 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 22 Mar 2022 13:15:59 -0500
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22MIFx2B030852;
	Tue, 22 Mar 2022 13:15:59 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1nWj31-0005P8-2A; Tue, 22 Mar 2022 13:15:59 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Yogesh Siraswar <yogeshs@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH v2 6/7] ti-rtos: Fix AM62x R5F DM FW paths
Date: Tue, 22 Mar 2022 13:15:57 -0500
Message-ID: <20220322181558.20684-7-reatmon@ti.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14535

From: Hari Nagalla <hnagalla@ti.com>

Signed-off-by: Hari Nagalla <hnagalla@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
index 43119f03..ecf54123 100644
--- a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
+++ b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
@@ -165,6 +165,8 @@ do_install_am64xx() {
 do_install_am62xx() {
     install -d ${LEGACY_IPC_FW_DIR}
     install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_baremetal_test_mcu1_0_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
+    # DM Firmware
+    install -m 0644 ${RTOS_DM_FW_DIR}/ipc_echo_testb_mcu1_0_release_strip.xer5f ${LEGACY_DM_FW_DIR}
 }
 
 # Set up names for the firmwares
@@ -182,6 +184,7 @@ ALTERNATIVE_${PN}_am64xx = "\
                     "
 ALTERNATIVE_${PN}_am62xx = "\
                     am62-mcu-m4f0_0-fw \
+		    am62xx-main-r5f0_0-fw \
                     "
 
 ALTERNATIVE_${PN}_j7 = "\
@@ -236,6 +239,7 @@ TARGET_MAIN_R5FSS1_0_am64xx = "am64-main-r5f1_0-fw"
 TARGET_MAIN_R5FSS1_1_am64xx = "am64-main-r5f1_1-fw"
 TARGET_MCU_M4FSS0_0_am64xx = "am64-mcu-m4f0_0-fw"
 TARGET_MCU_M4FSS0_0_am62xx = "am62-mcu-m4f0_0-fw"
+TARGET_MAIN_R5FSS0_0_am62xx = "am62xx-main-r5f0_0-fw"
 
 TARGET_MCU_R5FSS0_0_j7 = "j7-mcu-r5f0_0-fw"
 TARGET_MCU_R5FSS0_1_j7 = "j7-mcu-r5f0_1-fw"
@@ -278,6 +282,7 @@ ALTERNATIVE_LINK_NAME[am64-main-r5f1_1-fw] = "${base_libdir}/firmware/${TARGET_M
 ALTERNATIVE_LINK_NAME[am64-mcu-m4f0_0-fw] = "${base_libdir}/firmware/${TARGET_MCU_M4FSS0_0}"
 
 ALTERNATIVE_LINK_NAME[am62-mcu-m4f0_0-fw] = "${base_libdir}/firmware/${TARGET_MCU_M4FSS0_0}"
+ALTERNATIVE_LINK_NAME[am62xx-main-r5f0_0-fw] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS0_0}"
 
 ALTERNATIVE_LINK_NAME[j7-mcu-r5f0_0-fw] = "${base_libdir}/firmware/${TARGET_MCU_R5FSS0_0}"
 ALTERNATIVE_LINK_NAME[j7-mcu-r5f0_1-fw] = "${base_libdir}/firmware/${TARGET_MCU_R5FSS0_1}"
@@ -317,6 +322,7 @@ ALTERNATIVE_TARGET[am64-main-r5f1_1-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_e
 ALTERNATIVE_TARGET[am64-mcu-m4f0_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_baremetal_test_mcu3_0_release_strip.xer5f"
 
 ALTERNATIVE_TARGET[am62-mcu-m4f0_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_baremetal_test_mcu1_0_release_strip.xer5f"
+ALTERNATIVE_TARGET[am62xx-main-r5f0_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_testb_mcu1_0_release_strip.xer5f"
 
 ALTERNATIVE_TARGET[j7-mcu-r5f0_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_testb_mcu1_0_release_strip.xer5f"
 ALTERNATIVE_TARGET[j7-mcu-r5f0_1-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu1_1_release_strip.xer5f"
-- 
2.17.1


