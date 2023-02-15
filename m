Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72797C636D4
	for <webhook@archiver.kernel.org>; Wed, 15 Feb 2023 19:34:12 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.2571.1676489642644904092
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 15 Feb 2023 11:34:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=ZS066VDz;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 31FJY0di098001;
	Wed, 15 Feb 2023 13:34:00 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1676489640;
	bh=+0yuNNFHj6IHfsYsCG9yIkfd2BtUhaDnxmelGp+3ycg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=ZS066VDzFRI4/M1c98/1j+Q2kE23oqvh7mD0JFDDaTbPDdvFxFtUshpzrOgVx1ph4
	 BUj/l2o3PK2BQsaTFyogXZnqHoZiPd2FYf7X+ojOUprFnR2O3sk1flfzUhk5NW0VHg
	 iyYWC/jQ26vk61k2IYPCLW1Eo84HykG3FB2/dkfo=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 31FJY0ST096583
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 15 Feb 2023 13:34:00 -0600
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 15
 Feb 2023 13:34:00 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 15 Feb 2023 13:34:00 -0600
Received: from ula0226330.dal.design.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 31FJXt6r014221;
	Wed, 15 Feb 2023 13:34:00 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH v2 14/15] ti-rtos-firmware: Fix use of base_libdir with nonarch_base_libdir
Date: Wed, 15 Feb 2023 13:33:54 -0600
Message-ID: <20230215193355.9676-15-afd@ti.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230215193355.9676-1-afd@ti.com>
References: <20230215193355.9676-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 15 Feb 2023 19:34:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15870

Firmware belongs in the nonarch lib directory. Use the right variable.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../ti-rtos-bin/ti-rtos-firmware.bb           | 112 +++++++++---------
 1 file changed, 56 insertions(+), 56 deletions(-)

diff --git a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
index 1b8e1cd2..5de7c7b3 100644
--- a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
+++ b/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
@@ -297,21 +297,21 @@ ALTERNATIVE_LINK_NAME[j7-c66_0-fw] = "${nonarch_base_libdir}/firmware/j7-c66_0-f
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
@@ -322,25 +322,25 @@ ALTERNATIVE_LINK_NAME[j721s2-main-r5f1_1-fw] = "${nonarch_base_libdir}/firmware/
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
 
@@ -366,21 +366,21 @@ ALTERNATIVE_TARGET[j7-c66_0-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/${C66
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
@@ -391,25 +391,25 @@ ALTERNATIVE_TARGET[j721s2-main-r5f1_1-fw] = "${nonarch_base_libdir}/firmware/pdk
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


