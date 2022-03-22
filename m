Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4102AC4321E
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 16:25:33 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web09.12180.1647966331789993506
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 22 Mar 2022 09:25:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=k4xVg/TV;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22MGPTcN073159;
	Tue, 22 Mar 2022 11:25:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1647966329;
	bh=WBmFyAz5eTxC8S0jc5YcUJwqSk5cZqkpkDv8JGJxfJU=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=k4xVg/TVj3Wzh6Xrs3yjaX5F8aufejAtq+Qc2vIYX4Ezc8b/WZqCaBiEqTratmnfE
	 +NMsxSmkG0klz1GUXoU5vUH4rB88ZfC4QN3q2sKhrHpQ/5KDAjJZGsE9n3O3vQBr5Q
	 wjj/NtncbxnRYvVDIewvJmBW0pj0/bBU9Dsx9ETE=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22MGPTuQ045365
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 22 Mar 2022 11:25:29 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 22
 Mar 2022 11:25:29 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 22 Mar 2022 11:25:29 -0500
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22MGPTx4013083;
	Tue, 22 Mar 2022 11:25:29 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1nWhK5-0003zm-9V; Tue, 22 Mar 2022 11:25:29 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Yogesh Siraswar <yogeshs@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH 02/11] recipes-ti: ti-rtos-bin: Add AM62x
 binaries
Date: Tue, 22 Mar 2022 11:25:19 -0500
Message-ID: <20220322162528.15298-3-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220322162528.15298-1-reatmon@ti.com>
References: <20220322162528.15298-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 22 Mar 2022 16:25:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14517

From: Nishanth Menon <nm@ti.com>

Add binaries for AM62x

Signed-off-by: Nishanth Menon <nm@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
index c5852dbd..431c13da 100644
--- a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
+++ b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
@@ -19,6 +19,7 @@ PLAT_SFX_j7200-hs-evm = "j7200"
 PLAT_SFX_j721s2-evm = "j721s2"
 PLAT_SFX_am65xx = "am65xx"
 PLAT_SFX_am64xx = "am64xx"
+PLAT_SFX_am62xx-evm = "am62xx"
 
 FILESEXTRAPATHS_prepend := "${METATIBASE}/recipes-bsp/ti-sci-fw/files/:"
 require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -154,6 +155,13 @@ do_install_am64xx() {
     install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_baremetal_test_mcu3_0_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
 }
 
+do_install_am62xx-evm() {
+    install -d ${LEGACY_IPC_FW_DIR}
+    # No specific firmware to install till M4F comes online
+    # DM Firmware
+    install -m 0644 ${RTOS_DM_FW_DIR}/ipc_echo_testb_mcu1_0_release_strip.xer5f ${LEGACY_DM_FW_DIR}
+}
+
 # Set up names for the firmwares
 ALTERNATIVE_${PN}_am65xx = "\
                     am65x-mcu-r5f0_0-fw \
@@ -205,6 +213,10 @@ ALTERNATIVE_${PN}_j721s2-evm = "\
                     j721s2-c71_1-fw \
                     "
 
+ALTERNATIVE_${PN}_am62xx-evm = "\
+                    am62xx-main-r5f0_0-fw \
+                    "
+
 # Set up link names for the firmwares
 
 TARGET_MCU_R5FSS0_0_am65xx = "am65x-mcu-r5f0_0-fw"
@@ -245,6 +257,8 @@ TARGET_MAIN_R5FSS1_1_j721s2-evm = "j721s2-main-r5f1_1-fw"
 TARGET_C7X_0_j721s2-evm = "j721s2-c71_0-fw"
 TARGET_C7X_1_j721s2-evm = "j721s2-c71_1-fw"
 
+TARGET_MAIN_R5FSS0_0_am62xx-evm = "am62xx-main-r5f0_0-fw"
+
 ALTERNATIVE_LINK_NAME[am65x-mcu-r5f0_0-fw] = "${base_libdir}/firmware/${TARGET_MCU_R5FSS0_0}"
 ALTERNATIVE_LINK_NAME[am65x-mcu-r5f0_1-fw] = "${base_libdir}/firmware/${TARGET_MCU_R5FSS0_1}"
 
@@ -278,6 +292,8 @@ ALTERNATIVE_LINK_NAME[j721s2-main-r5f1_1-fw] = "${base_libdir}/firmware/${TARGET
 ALTERNATIVE_LINK_NAME[j721s2-c71_0-fw] = "${base_libdir}/firmware/${TARGET_C7X_0}"
 ALTERNATIVE_LINK_NAME[j721s2-c71_1-fw] = "${base_libdir}/firmware/${TARGET_C7X_1}"
 
+ALTERNATIVE_LINK_NAME[am62xx-main-r5f0_0-fw] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS0_0}"
+
 # Create the firmware alternatives
 
 ALTERNATIVE_TARGET[am65x-mcu-r5f0_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu1_0_release_strip.xer5f"
@@ -313,6 +329,8 @@ ALTERNATIVE_TARGET[j721s2-main-r5f1_1-fw] = "${base_libdir}/firmware/pdk-ipc/ipc
 ALTERNATIVE_TARGET[j721s2-c71_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_c7x_1_release_strip.xe71"
 ALTERNATIVE_TARGET[j721s2-c71_1-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_c7x_2_release_strip.xe71"
 
+ALTERNATIVE_TARGET[am62xx-main-r5f0_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_testb_mcu1_0_release_strip.xer5f"
+
 ALTERNATIVE_PRIORITY = "10"
 
 # make sure that lib/firmware, and all its contents are part of the package
-- 
2.17.1


