Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 859EEC64EC4
	for <webhook@archiver.kernel.org>; Tue,  7 Feb 2023 23:42:45 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.6627.1675813363902520809
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 07 Feb 2023 15:42:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=hT6t0qhM;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 317Ngg0X008733;
	Tue, 7 Feb 2023 17:42:42 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1675813362;
	bh=sTpe1prr74KE6BJmB02O3YZqRFwFWxJyTpgNOg+To1o=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=hT6t0qhMsU3bcSG8cnCLl75+FfIBUxYoJEs/Pm1WZtU2dHif5h+tYwlhV5hB5Doa0
	 dVA4mqyGX+woSeJyXIa5N9TjYfNNpuqQXBm5HCnRh1PL5f1wL2Ms5moionpZZqpMJk
	 G+hRKHhVlBqm58TBsgpF2PWvzSf6Pb+itWUFguoY=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 317NgggX032437
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 7 Feb 2023 17:42:42 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 7
 Feb 2023 17:42:42 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Tue, 7 Feb 2023 17:42:42 -0600
Received: from ula0226330.dal.design.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 317NgdTi050846;
	Tue, 7 Feb 2023 17:42:42 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH 7/8] ti-rtos-firmware: Fix use of base_libdir with nonarch_base_libdir
Date: Tue, 7 Feb 2023 17:42:38 -0600
Message-ID: <20230207234239.30720-7-afd@ti.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230207234239.30720-1-afd@ti.com>
References: <20230207234239.30720-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 07 Feb 2023 23:42:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15746

Firmware belongs in the nonarch lib directory. Use the right variable.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../ti-rtos-bin/ti-rtos-firmware.bb           | 112 +++++++++---------
 1 file changed, 56 insertions(+), 56 deletions(-)

diff --git a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
index 5cb673f0..feff39ea 100644
--- a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
+++ b/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
@@ -301,21 +301,21 @@ ALTERNATIVE_LINK_NAME[j7-c66_0-fw] = "${nonarch_base_libdir}/firmware/j7-c66_0-f
 ALTERNATIVE_LINK_NAME[j7-c66_1-fw] = "${nonarch_base_libdir}/firmware/j7-c66_1-fw"
 ALTERNATIVE_LINK_NAME[j7-c71_0-fw] = "${nonarch_base_libdir}/firmware/j7-c71_0-fw"
 
-ALTERNATIVE_LINK_NAME[j7-main-r5f0_0-fw-sec] = "${base_libdir}/firmware/j7-main-r5f0_0-fw-sec"
-ALTERNATIVE_LINK_NAME[j7-main-r5f0_1-fw-sec] = "${base_libdir}/firmware/j7-main-r5f0_1-fw-sec"
-ALTERNATIVE_LINK_NAME[j7-main-r5f1_0-fw-sec] = "${base_libdir}/firmware/j7-main-r5f1_0-fw-sec"
-ALTERNATIVE_LINK_NAME[j7-main-r5f1_1-fw-sec] = "${base_libdir}/firmware/j7-main-r5f1_1-fw-sec"
-ALTERNATIVE_LINK_NAME[j7-c66_0-fw-sec] = "${base_libdir}/firmware/j7-c66_0-fw-sec"
-ALTERNATIVE_LINK_NAME[j7-c66_1-fw-sec] = "${base_libdir}/firmware/j7-c66_1-fw-sec"
-ALTERNATIVE_LINK_NAME[j7-c71_0-fw-sec] = "${base_libdir}/firmware/j7-c71_0-fw-sec"
+ALTERNATIVE_LINK_NAME[j7-main-r5f0_0-fw-sec] = "${nonarch_base_libdir}/firmware/j7-main-r5f0_0-fw-sec"
+ALTERNATIVE_LINK_NAME[j7-main-r5f0_1-fw-sec] = "${nonarch_base_libdir}/firmware/j7-main-r5f0_1-fw-sec"
+ALTERNATIVE_LINK_NAME[j7-main-r5f1_0-fw-sec] = "${nonarch_base_libdir}/firmware/j7-main-r5f1_0-fw-sec"
+ALTERNATIVE_LINK_NAME[j7-main-r5f1_1-fw-sec] = "${nonarch_base_libdir}/firmware/j7-main-r5f1_1-fw-sec"
+ALTERNATIVE_LINK_NAME[j7-c66_0-fw-sec] = "${nonarch_base_libdir}/firmware/j7-c66_0-fw-sec"
+ALTERNATIVE_LINK_NAME[j7-c66_1-fw-sec] = "${nonarch_base_libdir}/firmware/j7-c66_1-fw-sec"
+ALTERNATIVE_LINK_NAME[j7-c71_0-fw-sec] = "${nonarch_base_libdir}/firmware/j7-c71_0-fw-sec"
 
 ALTERNATIVE_LINK_NAME[j7200-mcu-r5f0_0-fw] = "${nonarch_base_libdir}/firmware/j7200-mcu-r5f0_0-fw"
 ALTERNATIVE_LINK_NAME[j7200-mcu-r5f0_1-fw] = "${nonarch_base_libdir}/firmware/j7200-mcu-r5f0_1-fw"
 ALTERNATIVE_LINK_NAME[j7200-main-r5f0_0-fw] = "${nonarch_base_libdir}/firmware/j7200-main-r5f0_0-fw"
 ALTERNATIVE_LINK_NAME[j7200-main-r5f0_1-fw] = "${nonarch_base_libdir}/firmware/j7200-main-r5f0_1-fw"
 
-ALTERNATIVE_LINK_NAME[j7200-main-r5f0_0-fw-sec] = "${base_libdir}/firmware/j7200-main-r5f0_0-fw-sec"
-ALTERNATIVE_LINK_NAME[j7200-main-r5f0_1-fw-sec] = "${base_libdir}/firmware/j7200-main-r5f0_1-fw-sec"
+ALTERNATIVE_LINK_NAME[j7200-main-r5f0_0-fw-sec] = "${nonarch_base_libdir}/firmware/j7200-main-r5f0_0-fw-sec"
+ALTERNATIVE_LINK_NAME[j7200-main-r5f0_1-fw-sec] = "${nonarch_base_libdir}/firmware/j7200-main-r5f0_1-fw-sec"
 
 ALTERNATIVE_LINK_NAME[j721s2-mcu-r5f0_0-fw] = "${nonarch_base_libdir}/firmware/j721s2-mcu-r5f0_0-fw"
 ALTERNATIVE_LINK_NAME[j721s2-mcu-r5f0_1-fw] = "${nonarch_base_libdir}/firmware/j721s2-mcu-r5f0_1-fw"
@@ -326,25 +326,25 @@ ALTERNATIVE_LINK_NAME[j721s2-main-r5f1_1-fw] = "${nonarch_base_libdir}/firmware/
 ALTERNATIVE_LINK_NAME[j721s2-c71_0-fw] = "${nonarch_base_libdir}/firmware/j721s2-c71_0-fw"
 ALTERNATIVE_LINK_NAME[j721s2-c71_1-fw] = "${nonarch_base_libdir}/firmware/j721s2-c71_1-fw"
 
-ALTERNATIVE_LINK_NAME[j721s2-main-r5f0_0-fw-sec] = "${base_libdir}/firmware/j721s2-main-r5f0_0-fw-sec"
-ALTERNATIVE_LINK_NAME[j721s2-main-r5f0_1-fw-sec] = "${base_libdir}/firmware/j721s2-main-r5f0_1-fw-sec"
-ALTERNATIVE_LINK_NAME[j721s2-main-r5f1_0-fw-sec] = "${base_libdir}/firmware/j721s2-main-r5f1_0-fw-sec"
-ALTERNATIVE_LINK_NAME[j721s2-main-r5f1_1-fw-sec] = "${base_libdir}/firmware/j721s2-main-r5f1_1-fw-sec"
-ALTERNATIVE_LINK_NAME[j721s2-c71_0-fw-sec] = "${base_libdir}/firmware/j721s2-c71_0-fw-sec"
-ALTERNATIVE_LINK_NAME[j721s2-c71_1-fw-sec] = "${base_libdir}/firmware/j721s2-c71_1-fw-sec"
-
-ALTERNATIVE_LINK_NAME[j784s4-mcu-r5f0_0-fw] = "${base_libdir}/firmware/j784s4-mcu-r5f0_0-fw"
-ALTERNATIVE_LINK_NAME[j784s4-mcu-r5f0_1-fw] = "${base_libdir}/firmware/j784s4-mcu-r5f0_1-fw"
-ALTERNATIVE_LINK_NAME[j784s4-main-r5f0_0-fw] = "${base_libdir}/firmware/j784s4-main-r5f0_0-fw"
-ALTERNATIVE_LINK_NAME[j784s4-main-r5f0_1-fw] = "${base_libdir}/firmware/j784s4-main-r5f0_1-fw"
-ALTERNATIVE_LINK_NAME[j784s4-main-r5f1_0-fw] = "${base_libdir}/firmware/j784s4-main-r5f1_0-fw"
-ALTERNATIVE_LINK_NAME[j784s4-main-r5f1_1-fw] = "${base_libdir}/firmware/j784s4-main-r5f1_1-fw"
-ALTERNATIVE_LINK_NAME[j784s4-main-r5f2_0-fw] = "${base_libdir}/firmware/j784s4-main-r5f2_0-fw"
-ALTERNATIVE_LINK_NAME[j784s4-main-r5f2_1-fw] = "${base_libdir}/firmware/j784s4-main-r5f2_1-fw"
-ALTERNATIVE_LINK_NAME[j784s4-c71_0-fw] = "${base_libdir}/firmware/j784s4-c71_0-fw"
-ALTERNATIVE_LINK_NAME[j784s4-c71_1-fw] = "${base_libdir}/firmware/j784s4-c71_1-fw"
-ALTERNATIVE_LINK_NAME[j784s4-c71_2-fw] = "${base_libdir}/firmware/j784s4-c71_2-fw"
-ALTERNATIVE_LINK_NAME[j784s4-c71_3-fw] = "${base_libdir}/firmware/j784s4-c71_3-fw"
+ALTERNATIVE_LINK_NAME[j721s2-main-r5f0_0-fw-sec] = "${nonarch_base_libdir}/firmware/j721s2-main-r5f0_0-fw-sec"
+ALTERNATIVE_LINK_NAME[j721s2-main-r5f0_1-fw-sec] = "${nonarch_base_libdir}/firmware/j721s2-main-r5f0_1-fw-sec"
+ALTERNATIVE_LINK_NAME[j721s2-main-r5f1_0-fw-sec] = "${nonarch_base_libdir}/firmware/j721s2-main-r5f1_0-fw-sec"
+ALTERNATIVE_LINK_NAME[j721s2-main-r5f1_1-fw-sec] = "${nonarch_base_libdir}/firmware/j721s2-main-r5f1_1-fw-sec"
+ALTERNATIVE_LINK_NAME[j721s2-c71_0-fw-sec] = "${nonarch_base_libdir}/firmware/j721s2-c71_0-fw-sec"
+ALTERNATIVE_LINK_NAME[j721s2-c71_1-fw-sec] = "${nonarch_base_libdir}/firmware/j721s2-c71_1-fw-sec"
+
+ALTERNATIVE_LINK_NAME[j784s4-mcu-r5f0_0-fw] = "${nonarch_base_libdir}/firmware/j784s4-mcu-r5f0_0-fw"
+ALTERNATIVE_LINK_NAME[j784s4-mcu-r5f0_1-fw] = "${nonarch_base_libdir}/firmware/j784s4-mcu-r5f0_1-fw"
+ALTERNATIVE_LINK_NAME[j784s4-main-r5f0_0-fw] = "${nonarch_base_libdir}/firmware/j784s4-main-r5f0_0-fw"
+ALTERNATIVE_LINK_NAME[j784s4-main-r5f0_1-fw] = "${nonarch_base_libdir}/firmware/j784s4-main-r5f0_1-fw"
+ALTERNATIVE_LINK_NAME[j784s4-main-r5f1_0-fw] = "${nonarch_base_libdir}/firmware/j784s4-main-r5f1_0-fw"
+ALTERNATIVE_LINK_NAME[j784s4-main-r5f1_1-fw] = "${nonarch_base_libdir}/firmware/j784s4-main-r5f1_1-fw"
+ALTERNATIVE_LINK_NAME[j784s4-main-r5f2_0-fw] = "${nonarch_base_libdir}/firmware/j784s4-main-r5f2_0-fw"
+ALTERNATIVE_LINK_NAME[j784s4-main-r5f2_1-fw] = "${nonarch_base_libdir}/firmware/j784s4-main-r5f2_1-fw"
+ALTERNATIVE_LINK_NAME[j784s4-c71_0-fw] = "${nonarch_base_libdir}/firmware/j784s4-c71_0-fw"
+ALTERNATIVE_LINK_NAME[j784s4-c71_1-fw] = "${nonarch_base_libdir}/firmware/j784s4-c71_1-fw"
+ALTERNATIVE_LINK_NAME[j784s4-c71_2-fw] = "${nonarch_base_libdir}/firmware/j784s4-c71_2-fw"
+ALTERNATIVE_LINK_NAME[j784s4-c71_3-fw] = "${nonarch_base_libdir}/firmware/j784s4-c71_3-fw"
 
 # Create the firmware alternatives
 
@@ -370,21 +370,21 @@ ALTERNATIVE_TARGET[j7-c66_0-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/${C66
 ALTERNATIVE_TARGET[j7-c66_1-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/${C66_2_FW}"
 ALTERNATIVE_TARGET[j7-c71_0-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/${C7X_1_FW}"
 
-ALTERNATIVE_TARGET[j7-main-r5f0_0-fw-sec] = "${base_libdir}/firmware/ethfw/${ETH_FW}.signed"
-ALTERNATIVE_TARGET[j7-main-r5f0_1-fw-sec] = "${base_libdir}/firmware/pdk-ipc/${MCU_2_1_FW}.signed"
-ALTERNATIVE_TARGET[j7-main-r5f1_0-fw-sec] = "${base_libdir}/firmware/pdk-ipc/${MCU_3_0_FW}.signed"
-ALTERNATIVE_TARGET[j7-main-r5f1_1-fw-sec] = "${base_libdir}/firmware/pdk-ipc/${MCU_3_1_FW}.signed"
-ALTERNATIVE_TARGET[j7-c66_0-fw-sec] = "${base_libdir}/firmware/pdk-ipc/${C66_1_FW}.signed"
-ALTERNATIVE_TARGET[j7-c66_1-fw-sec] = "${base_libdir}/firmware/pdk-ipc/${C66_2_FW}.signed"
-ALTERNATIVE_TARGET[j7-c71_0-fw-sec] = "${base_libdir}/firmware/pdk-ipc/${C7X_1_FW}.signed"
+ALTERNATIVE_TARGET[j7-main-r5f0_0-fw-sec] = "${nonarch_base_libdir}/firmware/ethfw/${ETH_FW}.signed"
+ALTERNATIVE_TARGET[j7-main-r5f0_1-fw-sec] = "${nonarch_base_libdir}/firmware/pdk-ipc/${MCU_2_1_FW}.signed"
+ALTERNATIVE_TARGET[j7-main-r5f1_0-fw-sec] = "${nonarch_base_libdir}/firmware/pdk-ipc/${MCU_3_0_FW}.signed"
+ALTERNATIVE_TARGET[j7-main-r5f1_1-fw-sec] = "${nonarch_base_libdir}/firmware/pdk-ipc/${MCU_3_1_FW}.signed"
+ALTERNATIVE_TARGET[j7-c66_0-fw-sec] = "${nonarch_base_libdir}/firmware/pdk-ipc/${C66_1_FW}.signed"
+ALTERNATIVE_TARGET[j7-c66_1-fw-sec] = "${nonarch_base_libdir}/firmware/pdk-ipc/${C66_2_FW}.signed"
+ALTERNATIVE_TARGET[j7-c71_0-fw-sec] = "${nonarch_base_libdir}/firmware/pdk-ipc/${C7X_1_FW}.signed"
 
 ALTERNATIVE_TARGET[j7200-mcu-r5f0_0-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/${DM_FIRMWARE}"
 ALTERNATIVE_TARGET[j7200-mcu-r5f0_1-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/${MCU_1_1_FW}"
 ALTERNATIVE_TARGET[j7200-main-r5f0_0-fw] = "${nonarch_base_libdir}/firmware/ethfw/${ETH_FW}"
 ALTERNATIVE_TARGET[j7200-main-r5f0_1-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/${MCU_2_1_FW}"
 
-ALTERNATIVE_TARGET[j7200-main-r5f0_0-fw-sec] = "${base_libdir}/firmware/ethfw/${ETH_FW}.signed"
-ALTERNATIVE_TARGET[j7200-main-r5f0_1-fw-sec] = "${base_libdir}/firmware/pdk-ipc/${MCU_2_1_FW}.signed"
+ALTERNATIVE_TARGET[j7200-main-r5f0_0-fw-sec] = "${nonarch_base_libdir}/firmware/ethfw/${ETH_FW}.signed"
+ALTERNATIVE_TARGET[j7200-main-r5f0_1-fw-sec] = "${nonarch_base_libdir}/firmware/pdk-ipc/${MCU_2_1_FW}.signed"
 
 ALTERNATIVE_TARGET[j721s2-mcu-r5f0_0-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/${DM_FIRMWARE}"
 ALTERNATIVE_TARGET[j721s2-mcu-r5f0_1-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/${MCU_1_1_FW}"
@@ -395,25 +395,25 @@ ALTERNATIVE_TARGET[j721s2-main-r5f1_1-fw] = "${nonarch_base_libdir}/firmware/pdk
 ALTERNATIVE_TARGET[j721s2-c71_0-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/${C7X_1_FW}"
 ALTERNATIVE_TARGET[j721s2-c71_1-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/${C7X_2_FW}"
 
-ALTERNATIVE_TARGET[j721s2-main-r5f0_0-fw-sec] = "${base_libdir}/firmware/pdk-ipc/${MCU_2_0_FW}.signed"
-ALTERNATIVE_TARGET[j721s2-main-r5f0_1-fw-sec] = "${base_libdir}/firmware/pdk-ipc/${MCU_2_1_FW}.signed"
-ALTERNATIVE_TARGET[j721s2-main-r5f1_0-fw-sec] = "${base_libdir}/firmware/pdk-ipc/${MCU_3_0_FW}.signed"
-ALTERNATIVE_TARGET[j721s2-main-r5f1_1-fw-sec] = "${base_libdir}/firmware/pdk-ipc/${MCU_3_1_FW}.signed"
-ALTERNATIVE_TARGET[j721s2-c71_0-fw-sec] = "${base_libdir}/firmware/pdk-ipc/${C7X_1_FW}.signed"
-ALTERNATIVE_TARGET[j721s2-c71_1-fw-sec] = "${base_libdir}/firmware/pdk-ipc/${C7X_2_FW}.signed"
-
-ALTERNATIVE_TARGET[j784s4-mcu-r5f0_0-fw] = "${base_libdir}/firmware/pdk-ipc/${DM_FIRMWARE}"
-ALTERNATIVE_TARGET[j784s4-mcu-r5f0_1-fw] = "${base_libdir}/firmware/pdk-ipc/${MCU_1_1_FW}"
-ALTERNATIVE_TARGET[j784s4-main-r5f0_0-fw] = "${base_libdir}/firmware/pdk-ipc/${MCU_2_0_FW}"
-ALTERNATIVE_TARGET[j784s4-main-r5f0_1-fw] = "${base_libdir}/firmware/pdk-ipc/${MCU_2_1_FW}"
-ALTERNATIVE_TARGET[j784s4-main-r5f1_0-fw] = "${base_libdir}/firmware/pdk-ipc/${MCU_3_0_FW}"
-ALTERNATIVE_TARGET[j784s4-main-r5f1_1-fw] = "${base_libdir}/firmware/pdk-ipc/${MCU_3_1_FW}"
-ALTERNATIVE_TARGET[j784s4-main-r5f2_0-fw] = "${base_libdir}/firmware/pdk-ipc/${MCU_4_0_FW}"
-ALTERNATIVE_TARGET[j784s4-main-r5f2_1-fw] = "${base_libdir}/firmware/pdk-ipc/${MCU_4_1_FW}"
-ALTERNATIVE_TARGET[j784s4-c71_0-fw] = "${base_libdir}/firmware/pdk-ipc/${C7X_1_FW}"
-ALTERNATIVE_TARGET[j784s4-c71_1-fw] = "${base_libdir}/firmware/pdk-ipc/${C7X_2_FW}"
-ALTERNATIVE_TARGET[j784s4-c71_2-fw] = "${base_libdir}/firmware/pdk-ipc/${C7X_3_FW}"
-ALTERNATIVE_TARGET[j784s4-c71_3-fw] = "${base_libdir}/firmware/pdk-ipc/${C7X_4_FW}"
+ALTERNATIVE_TARGET[j721s2-main-r5f0_0-fw-sec] = "${nonarch_base_libdir}/firmware/pdk-ipc/${MCU_2_0_FW}.signed"
+ALTERNATIVE_TARGET[j721s2-main-r5f0_1-fw-sec] = "${nonarch_base_libdir}/firmware/pdk-ipc/${MCU_2_1_FW}.signed"
+ALTERNATIVE_TARGET[j721s2-main-r5f1_0-fw-sec] = "${nonarch_base_libdir}/firmware/pdk-ipc/${MCU_3_0_FW}.signed"
+ALTERNATIVE_TARGET[j721s2-main-r5f1_1-fw-sec] = "${nonarch_base_libdir}/firmware/pdk-ipc/${MCU_3_1_FW}.signed"
+ALTERNATIVE_TARGET[j721s2-c71_0-fw-sec] = "${nonarch_base_libdir}/firmware/pdk-ipc/${C7X_1_FW}.signed"
+ALTERNATIVE_TARGET[j721s2-c71_1-fw-sec] = "${nonarch_base_libdir}/firmware/pdk-ipc/${C7X_2_FW}.signed"
+
+ALTERNATIVE_TARGET[j784s4-mcu-r5f0_0-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/${DM_FIRMWARE}"
+ALTERNATIVE_TARGET[j784s4-mcu-r5f0_1-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/${MCU_1_1_FW}"
+ALTERNATIVE_TARGET[j784s4-main-r5f0_0-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/${MCU_2_0_FW}"
+ALTERNATIVE_TARGET[j784s4-main-r5f0_1-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/${MCU_2_1_FW}"
+ALTERNATIVE_TARGET[j784s4-main-r5f1_0-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/${MCU_3_0_FW}"
+ALTERNATIVE_TARGET[j784s4-main-r5f1_1-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/${MCU_3_1_FW}"
+ALTERNATIVE_TARGET[j784s4-main-r5f2_0-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/${MCU_4_0_FW}"
+ALTERNATIVE_TARGET[j784s4-main-r5f2_1-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/${MCU_4_1_FW}"
+ALTERNATIVE_TARGET[j784s4-c71_0-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/${C7X_1_FW}"
+ALTERNATIVE_TARGET[j784s4-c71_1-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/${C7X_2_FW}"
+ALTERNATIVE_TARGET[j784s4-c71_2-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/${C7X_3_FW}"
+ALTERNATIVE_TARGET[j784s4-c71_3-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/${C7X_4_FW}"
 
 ALTERNATIVE_PRIORITY = "10"
 
-- 
2.39.1


