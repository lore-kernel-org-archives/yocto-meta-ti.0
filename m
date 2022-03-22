Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA37CC43219
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 18:16:01 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web08.13725.1647972960160191811
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 22 Mar 2022 11:16:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=FfGsMrt5;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22MIFxeG123839;
	Tue, 22 Mar 2022 13:15:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1647972959;
	bh=WBmFyAz5eTxC8S0jc5YcUJwqSk5cZqkpkDv8JGJxfJU=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=FfGsMrt5sWKJS9SI5NnWchGMC/LtaPRcTanWXe1UG7/aM6y6Em0bANrqpJAvqBrs1
	 +evT2CXB8ywGJqGJ1/ui0aiyuuP4JCifMjK+s+zmTwV7ZFtphfv7g6PwqO76EywtOp
	 fG6pZjnJI5AK774GNn5a5WKzxVkyp06G8A0Ou084=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22MIFx97105691
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 22 Mar 2022 13:15:59 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 22
 Mar 2022 13:15:58 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 22 Mar 2022 13:15:58 -0500
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22MIFwSe047732;
	Tue, 22 Mar 2022 13:15:58 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1nWj30-0005Oa-Is; Tue, 22 Mar 2022 13:15:58 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Yogesh Siraswar <yogeshs@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH v2 2/7] recipes-ti: ti-rtos-bin: Add AM62x
 binaries
Date: Tue, 22 Mar 2022 13:15:53 -0500
Message-ID: <20220322181558.20684-3-reatmon@ti.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14531

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


