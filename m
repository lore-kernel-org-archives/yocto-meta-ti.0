Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EB5EC6FA9E
	for <webhook@archiver.kernel.org>; Wed, 15 Feb 2023 19:34:02 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.2567.1676489640100973656
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 15 Feb 2023 11:34:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=a1xxkY7l;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: afd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 31FJXxAK094846;
	Wed, 15 Feb 2023 13:33:59 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1676489639;
	bh=f5mbEaC0TPtmI2KRhMKKEpMbF0UdbYQvebEo0gG/JPE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=a1xxkY7ltVB4m570EHW1AxX8AL06lNbIgEW6oJLmRjKupL8QjST39FXi+7PxWhc4/
	 ZZIrHAEPZfefH9KBKKzLjKJnY3MUYYqaSIaBx6Gc2FmSTOzYCv5Vc0khKnhQxAXsOC
	 AiR8Aoh+q7lYkXmshr6olscWFKhcPK4uVv2SYdMM=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 31FJXxb8016214
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 15 Feb 2023 13:33:59 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 15
 Feb 2023 13:33:58 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 15 Feb 2023 13:33:58 -0600
Received: from ula0226330.dal.design.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 31FJXt6m014221;
	Wed, 15 Feb 2023 13:33:58 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH v2 09/15] ti-rtos-firmware: Remove unneeded per-machine TARGET defines
Date: Wed, 15 Feb 2023 13:33:49 -0600
Message-ID: <20230215193355.9676-10-afd@ti.com>
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
 <meta-ti@lists.yoctoproject.org>; Wed, 15 Feb 2023 19:34:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15863

Since these TARGET defines are only used on the machine for which
an ALTERNATIVE is defined and always have the same name, these
provide nothing. Drop them.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../ti-rtos-bin/ti-rtos-firmware.bb           | 213 ++++++------------
 1 file changed, 66 insertions(+), 147 deletions(-)

diff --git a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
index fddb5e2e..f2e0139a 100644
--- a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
+++ b/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
@@ -400,153 +400,72 @@ ALTERNATIVE:${PN}:j784s4-evm = "\
 
 # Set up link names for the firmwares
 
-TARGET_MCU_R5FSS0_0:am65xx = "am65x-mcu-r5f0_0-fw"
-TARGET_MCU_R5FSS0_1:am65xx = "am65x-mcu-r5f0_1-fw"
-
-TARGET_MAIN_R5FSS0_0:am64xx = "am64-main-r5f0_0-fw"
-TARGET_MAIN_R5FSS0_1:am64xx = "am64-main-r5f0_1-fw"
-TARGET_MAIN_R5FSS1_0:am64xx = "am64-main-r5f1_0-fw"
-TARGET_MAIN_R5FSS1_1:am64xx = "am64-main-r5f1_1-fw"
-TARGET_MCU_M4FSS0_0:am64xx = "am64-mcu-m4f0_0-fw"
-
-TARGET_MAIN_R5FSS0_0:am62xx = "am62-main-r5f0_0-fw"
-TARGET_MCU_M4FSS0_0:am62xx = "am62-mcu-m4f0_0-fw"
-
-TARGET_MCU_R5FSS0_0:j721e = "j7-mcu-r5f0_0-fw"
-TARGET_MCU_R5FSS0_1:j721e = "j7-mcu-r5f0_1-fw"
-TARGET_MAIN_R5FSS0_0:j721e = "j7-main-r5f0_0-fw"
-TARGET_MAIN_R5FSS0_1:j721e = "j7-main-r5f0_1-fw"
-TARGET_MAIN_R5FSS1_0:j721e = "j7-main-r5f1_0-fw"
-TARGET_MAIN_R5FSS1_1:j721e = "j7-main-r5f1_1-fw"
-TARGET_C66_0:j721e = "j7-c66_0-fw"
-TARGET_C66_1:j721e = "j7-c66_1-fw"
-TARGET_C7X_0:j721e = "j7-c71_0-fw"
-
-TARGET_MAIN_R5FSS0_0_SIGNED:j721e-hs-evm = "j7-main-r5f0_0-fw-sec"
-TARGET_MAIN_R5FSS0_1_SIGNED:j721e-hs-evm = "j7-main-r5f0_1-fw-sec"
-TARGET_MAIN_R5FSS1_0_SIGNED:j721e-hs-evm = "j7-main-r5f1_0-fw-sec"
-TARGET_MAIN_R5FSS1_1_SIGNED:j721e-hs-evm = "j7-main-r5f1_1-fw-sec"
-TARGET_C66_0_SIGNED:j721e-hs-evm = "j7-c66_0-fw-sec"
-TARGET_C66_1_SIGNED:j721e-hs-evm = "j7-c66_1-fw-sec"
-TARGET_C7X_0_SIGNED:j721e-hs-evm = "j7-c71_0-fw-sec"
-
-TARGET_MCU_R5FSS0_0:j7200-evm = "j7200-mcu-r5f0_0-fw"
-TARGET_MCU_R5FSS0_1:j7200-evm = "j7200-mcu-r5f0_1-fw"
-TARGET_MAIN_R5FSS0_0:j7200-evm = "j7200-main-r5f0_0-fw"
-TARGET_MAIN_R5FSS0_1:j7200-evm = "j7200-main-r5f0_1-fw"
-
-TARGET_MCU_R5FSS0_0:j7200-hs-evm = "j7200-mcu-r5f0_0-fw"
-TARGET_MCU_R5FSS0_1:j7200-hs-evm = "j7200-mcu-r5f0_1-fw"
-TARGET_MAIN_R5FSS0_0:j7200-hs-evm = "j7200-main-r5f0_0-fw"
-TARGET_MAIN_R5FSS0_1:j7200-hs-evm = "j7200-main-r5f0_1-fw"
-
-TARGET_MAIN_R5FSS0_0_SIGNED:j7200-hs-evm = "j7200-main-r5f0_0-fw-sec"
-TARGET_MAIN_R5FSS0_1_SIGNED:j7200-hs-evm = "j7200-main-r5f0_1-fw-sec"
-
-TARGET_MCU_R5FSS0_0:j721s2-evm = "j721s2-mcu-r5f0_0-fw"
-TARGET_MCU_R5FSS0_1:j721s2-evm = "j721s2-mcu-r5f0_1-fw"
-TARGET_MAIN_R5FSS0_0:j721s2-evm = "j721s2-main-r5f0_0-fw"
-TARGET_MAIN_R5FSS0_1:j721s2-evm = "j721s2-main-r5f0_1-fw"
-TARGET_MAIN_R5FSS1_0:j721s2-evm = "j721s2-main-r5f1_0-fw"
-TARGET_MAIN_R5FSS1_1:j721s2-evm = "j721s2-main-r5f1_1-fw"
-TARGET_C7X_0:j721s2-evm = "j721s2-c71_0-fw"
-TARGET_C7X_1:j721s2-evm = "j721s2-c71_1-fw"
-
-TARGET_MCU_R5FSS0_0:j721s2-hs-evm = "j721s2-mcu-r5f0_0-fw"
-TARGET_MCU_R5FSS0_1:j721s2-hs-evm = "j721s2-mcu-r5f0_1-fw"
-TARGET_MAIN_R5FSS0_0:j721s2-hs-evm = "j721s2-main-r5f0_0-fw"
-TARGET_MAIN_R5FSS0_1:j721s2-hs-evm = "j721s2-main-r5f0_1-fw"
-TARGET_MAIN_R5FSS1_0:j721s2-hs-evm = "j721s2-main-r5f1_0-fw"
-TARGET_MAIN_R5FSS1_1:j721s2-hs-evm = "j721s2-main-r5f1_1-fw"
-TARGET_C7X_0:j721s2-hs-evm = "j721s2-c71_0-fw"
-TARGET_C7X_1:j721s2-hs-evm = "j721s2-c71_1-fw"
-
-TARGET_MAIN_R5FSS0_0_SIGNED:j721s2-hs-evm = "j721s2-main-r5f0_0-fw-sec"
-TARGET_MAIN_R5FSS0_1_SIGNED:j721s2-hs-evm = "j721s2-main-r5f0_1-fw-sec"
-TARGET_MAIN_R5FSS1_0_SIGNED:j721s2-hs-evm = "j721s2-main-r5f1_0-fw-sec"
-TARGET_MAIN_R5FSS1_1_SIGNED:j721s2-hs-evm = "j721s2-main-r5f1_1-fw-sec"
-TARGET_C7X_0_SIGNED:j721s2-hs-evm = "j721s2-c71_0-fw-sec"
-TARGET_C7X_1_SIGNED:j721s2-hs-evm = "j721s2-c71_1-fw-sec"
-
-TARGET_MCU_R5FSS0_0:j784s4-evm = "j784s4-mcu-r5f0_0-fw"
-TARGET_MCU_R5FSS0_1:j784s4-evm = "j784s4-mcu-r5f0_1-fw"
-TARGET_MAIN_R5FSS0_0:j784s4-evm = "j784s4-main-r5f0_0-fw"
-TARGET_MAIN_R5FSS0_1:j784s4-evm = "j784s4-main-r5f0_1-fw"
-TARGET_MAIN_R5FSS1_0:j784s4-evm = "j784s4-main-r5f1_0-fw"
-TARGET_MAIN_R5FSS1_1:j784s4-evm = "j784s4-main-r5f1_1-fw"
-TARGET_MAIN_R5FSS2_0:j784s4-evm = "j784s4-main-r5f2_0-fw"
-TARGET_MAIN_R5FSS2_1:j784s4-evm = "j784s4-main-r5f2_1-fw"
-TARGET_C7X_0:j784s4-evm = "j784s4-c71_0-fw"
-TARGET_C7X_1:j784s4-evm = "j784s4-c71_1-fw"
-TARGET_C7X_2:j784s4-evm = "j784s4-c71_2-fw"
-TARGET_C7X_3:j784s4-evm = "j784s4-c71_3-fw"
-
-ALTERNATIVE_LINK_NAME[am65x-mcu-r5f0_0-fw] = "${nonarch_base_libdir}/firmware/${TARGET_MCU_R5FSS0_0}"
-ALTERNATIVE_LINK_NAME[am65x-mcu-r5f0_1-fw] = "${nonarch_base_libdir}/firmware/${TARGET_MCU_R5FSS0_1}"
-
-ALTERNATIVE_LINK_NAME[am64-main-r5f0_0-fw] = "${nonarch_base_libdir}/firmware/${TARGET_MAIN_R5FSS0_0}"
-ALTERNATIVE_LINK_NAME[am64-main-r5f0_1-fw] = "${nonarch_base_libdir}/firmware/${TARGET_MAIN_R5FSS0_1}"
-ALTERNATIVE_LINK_NAME[am64-main-r5f1_0-fw] = "${nonarch_base_libdir}/firmware/${TARGET_MAIN_R5FSS1_0}"
-ALTERNATIVE_LINK_NAME[am64-main-r5f1_1-fw] = "${nonarch_base_libdir}/firmware/${TARGET_MAIN_R5FSS1_1}"
-ALTERNATIVE_LINK_NAME[am64-mcu-m4f0_0-fw] = "${nonarch_base_libdir}/firmware/${TARGET_MCU_M4FSS0_0}"
-
-ALTERNATIVE_LINK_NAME[am62-main-r5f0_0-fw] = "${nonarch_base_libdir}/firmware/${TARGET_MAIN_R5FSS0_0}"
-ALTERNATIVE_LINK_NAME[am62-mcu-m4f0_0-fw] = "${nonarch_base_libdir}/firmware/${TARGET_MCU_M4FSS0_0}"
-
-ALTERNATIVE_LINK_NAME[j7-mcu-r5f0_0-fw] = "${nonarch_base_libdir}/firmware/${TARGET_MCU_R5FSS0_0}"
-ALTERNATIVE_LINK_NAME[j7-mcu-r5f0_1-fw] = "${nonarch_base_libdir}/firmware/${TARGET_MCU_R5FSS0_1}"
-ALTERNATIVE_LINK_NAME[j7-main-r5f0_0-fw] = "${nonarch_base_libdir}/firmware/${TARGET_MAIN_R5FSS0_0}"
-ALTERNATIVE_LINK_NAME[j7-main-r5f0_1-fw] = "${nonarch_base_libdir}/firmware/${TARGET_MAIN_R5FSS0_1}"
-ALTERNATIVE_LINK_NAME[j7-main-r5f1_0-fw] = "${nonarch_base_libdir}/firmware/${TARGET_MAIN_R5FSS1_0}"
-ALTERNATIVE_LINK_NAME[j7-main-r5f1_1-fw] = "${nonarch_base_libdir}/firmware/${TARGET_MAIN_R5FSS1_1}"
-ALTERNATIVE_LINK_NAME[j7-c66_0-fw] = "${nonarch_base_libdir}/firmware/${TARGET_C66_0}"
-ALTERNATIVE_LINK_NAME[j7-c66_1-fw] = "${nonarch_base_libdir}/firmware/${TARGET_C66_1}"
-ALTERNATIVE_LINK_NAME[j7-c71_0-fw] = "${nonarch_base_libdir}/firmware/${TARGET_C7X_0}"
-
-ALTERNATIVE_LINK_NAME[j7-main-r5f0_0-fw-sec] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS0_0_SIGNED}"
-ALTERNATIVE_LINK_NAME[j7-main-r5f0_1-fw-sec] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS0_1_SIGNED}"
-ALTERNATIVE_LINK_NAME[j7-main-r5f1_0-fw-sec] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS1_0_SIGNED}"
-ALTERNATIVE_LINK_NAME[j7-main-r5f1_1-fw-sec] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS1_1_SIGNED}"
-ALTERNATIVE_LINK_NAME[j7-c66_0-fw-sec] = "${base_libdir}/firmware/${TARGET_C66_0_SIGNED}"
-ALTERNATIVE_LINK_NAME[j7-c66_1-fw-sec] = "${base_libdir}/firmware/${TARGET_C66_1_SIGNED}"
-ALTERNATIVE_LINK_NAME[j7-c71_0-fw-sec] = "${base_libdir}/firmware/${TARGET_C7X_0_SIGNED}"
-
-ALTERNATIVE_LINK_NAME[j7200-mcu-r5f0_0-fw] = "${nonarch_base_libdir}/firmware/${TARGET_MCU_R5FSS0_0}"
-ALTERNATIVE_LINK_NAME[j7200-mcu-r5f0_1-fw] = "${nonarch_base_libdir}/firmware/${TARGET_MCU_R5FSS0_1}"
-ALTERNATIVE_LINK_NAME[j7200-main-r5f0_0-fw] = "${nonarch_base_libdir}/firmware/${TARGET_MAIN_R5FSS0_0}"
-ALTERNATIVE_LINK_NAME[j7200-main-r5f0_1-fw] = "${nonarch_base_libdir}/firmware/${TARGET_MAIN_R5FSS0_1}"
-
-ALTERNATIVE_LINK_NAME[j7200-main-r5f0_0-fw-sec] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS0_0_SIGNED}"
-ALTERNATIVE_LINK_NAME[j7200-main-r5f0_1-fw-sec] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS0_1_SIGNED}"
-
-ALTERNATIVE_LINK_NAME[j721s2-mcu-r5f0_0-fw] = "${nonarch_base_libdir}/firmware/${TARGET_MCU_R5FSS0_0}"
-ALTERNATIVE_LINK_NAME[j721s2-mcu-r5f0_1-fw] = "${nonarch_base_libdir}/firmware/${TARGET_MCU_R5FSS0_1}"
-ALTERNATIVE_LINK_NAME[j721s2-main-r5f0_0-fw] = "${nonarch_base_libdir}/firmware/${TARGET_MAIN_R5FSS0_0}"
-ALTERNATIVE_LINK_NAME[j721s2-main-r5f0_1-fw] = "${nonarch_base_libdir}/firmware/${TARGET_MAIN_R5FSS0_1}"
-ALTERNATIVE_LINK_NAME[j721s2-main-r5f1_0-fw] = "${nonarch_base_libdir}/firmware/${TARGET_MAIN_R5FSS1_0}"
-ALTERNATIVE_LINK_NAME[j721s2-main-r5f1_1-fw] = "${nonarch_base_libdir}/firmware/${TARGET_MAIN_R5FSS1_1}"
-ALTERNATIVE_LINK_NAME[j721s2-c71_0-fw] = "${nonarch_base_libdir}/firmware/${TARGET_C7X_0}"
-ALTERNATIVE_LINK_NAME[j721s2-c71_1-fw] = "${nonarch_base_libdir}/firmware/${TARGET_C7X_1}"
-
-ALTERNATIVE_LINK_NAME[j721s2-main-r5f0_0-fw-sec] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS0_0_SIGNED}"
-ALTERNATIVE_LINK_NAME[j721s2-main-r5f0_1-fw-sec] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS0_1_SIGNED}"
-ALTERNATIVE_LINK_NAME[j721s2-main-r5f1_0-fw-sec] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS1_0_SIGNED}"
-ALTERNATIVE_LINK_NAME[j721s2-main-r5f1_1-fw-sec] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS1_1_SIGNED}"
-ALTERNATIVE_LINK_NAME[j721s2-c71_0-fw-sec] = "${base_libdir}/firmware/${TARGET_C7X_0_SIGNED}"
-ALTERNATIVE_LINK_NAME[j721s2-c71_1-fw-sec] = "${base_libdir}/firmware/${TARGET_C7X_1_SIGNED}"
-
-ALTERNATIVE_LINK_NAME[j784s4-mcu-r5f0_0-fw] = "${base_libdir}/firmware/${TARGET_MCU_R5FSS0_0}"
-ALTERNATIVE_LINK_NAME[j784s4-mcu-r5f0_1-fw] = "${base_libdir}/firmware/${TARGET_MCU_R5FSS0_1}"
-ALTERNATIVE_LINK_NAME[j784s4-main-r5f0_0-fw] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS0_0}"
-ALTERNATIVE_LINK_NAME[j784s4-main-r5f0_1-fw] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS0_1}"
-ALTERNATIVE_LINK_NAME[j784s4-main-r5f1_0-fw] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS1_0}"
-ALTERNATIVE_LINK_NAME[j784s4-main-r5f1_1-fw] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS1_1}"
-ALTERNATIVE_LINK_NAME[j784s4-main-r5f2_0-fw] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS2_0}"
-ALTERNATIVE_LINK_NAME[j784s4-main-r5f2_1-fw] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS2_1}"
-ALTERNATIVE_LINK_NAME[j784s4-c71_0-fw] = "${base_libdir}/firmware/${TARGET_C7X_0}"
-ALTERNATIVE_LINK_NAME[j784s4-c71_1-fw] = "${base_libdir}/firmware/${TARGET_C7X_1}"
-ALTERNATIVE_LINK_NAME[j784s4-c71_2-fw] = "${base_libdir}/firmware/${TARGET_C7X_2}"
-ALTERNATIVE_LINK_NAME[j784s4-c71_3-fw] = "${base_libdir}/firmware/${TARGET_C7X_3}"
+ALTERNATIVE_LINK_NAME[am65x-mcu-r5f0_0-fw] = "${nonarch_base_libdir}/firmware/am65x-mcu-r5f0_0-fw"
+ALTERNATIVE_LINK_NAME[am65x-mcu-r5f0_1-fw] = "${nonarch_base_libdir}/firmware/am65x-mcu-r5f0_1-fw"
+
+ALTERNATIVE_LINK_NAME[am64-main-r5f0_0-fw] = "${nonarch_base_libdir}/firmware/am64-main-r5f0_0-fw"
+ALTERNATIVE_LINK_NAME[am64-main-r5f0_1-fw] = "${nonarch_base_libdir}/firmware/am64-main-r5f0_1-fw"
+ALTERNATIVE_LINK_NAME[am64-main-r5f1_0-fw] = "${nonarch_base_libdir}/firmware/am64-main-r5f1_0-fw"
+ALTERNATIVE_LINK_NAME[am64-main-r5f1_1-fw] = "${nonarch_base_libdir}/firmware/am64-main-r5f1_1-fw"
+ALTERNATIVE_LINK_NAME[am64-mcu-m4f0_0-fw] = "${nonarch_base_libdir}/firmware/am64-mcu-m4f0_0-fw"
+
+ALTERNATIVE_LINK_NAME[am62-main-r5f0_0-fw] = "${nonarch_base_libdir}/firmware/am62-main-r5f0_0-fw"
+ALTERNATIVE_LINK_NAME[am62-mcu-m4f0_0-fw] = "${nonarch_base_libdir}/firmware/am62-mcu-m4f0_0-fw"
+
+ALTERNATIVE_LINK_NAME[j7-mcu-r5f0_0-fw] = "${nonarch_base_libdir}/firmware/j7-mcu-r5f0_0-fw"
+ALTERNATIVE_LINK_NAME[j7-mcu-r5f0_1-fw] = "${nonarch_base_libdir}/firmware/j7-mcu-r5f0_1-fw"
+ALTERNATIVE_LINK_NAME[j7-main-r5f0_0-fw] = "${nonarch_base_libdir}/firmware/j7-main-r5f0_0-fw"
+ALTERNATIVE_LINK_NAME[j7-main-r5f0_1-fw] = "${nonarch_base_libdir}/firmware/j7-main-r5f0_1-fw"
+ALTERNATIVE_LINK_NAME[j7-main-r5f1_0-fw] = "${nonarch_base_libdir}/firmware/j7-main-r5f1_0-fw"
+ALTERNATIVE_LINK_NAME[j7-main-r5f1_1-fw] = "${nonarch_base_libdir}/firmware/j7-main-r5f1_1-fw"
+ALTERNATIVE_LINK_NAME[j7-c66_0-fw] = "${nonarch_base_libdir}/firmware/j7-c66_0-fw"
+ALTERNATIVE_LINK_NAME[j7-c66_1-fw] = "${nonarch_base_libdir}/firmware/j7-c66_1-fw"
+ALTERNATIVE_LINK_NAME[j7-c71_0-fw] = "${nonarch_base_libdir}/firmware/j7-c71_0-fw"
+
+ALTERNATIVE_LINK_NAME[j7-main-r5f0_0-fw-sec] = "${base_libdir}/firmware/j7-main-r5f0_0-fw-sec"
+ALTERNATIVE_LINK_NAME[j7-main-r5f0_1-fw-sec] = "${base_libdir}/firmware/j7-main-r5f0_1-fw-sec"
+ALTERNATIVE_LINK_NAME[j7-main-r5f1_0-fw-sec] = "${base_libdir}/firmware/j7-main-r5f1_0-fw-sec"
+ALTERNATIVE_LINK_NAME[j7-main-r5f1_1-fw-sec] = "${base_libdir}/firmware/j7-main-r5f1_1-fw-sec"
+ALTERNATIVE_LINK_NAME[j7-c66_0-fw-sec] = "${base_libdir}/firmware/j7-c66_0-fw-sec"
+ALTERNATIVE_LINK_NAME[j7-c66_1-fw-sec] = "${base_libdir}/firmware/j7-c66_1-fw-sec"
+ALTERNATIVE_LINK_NAME[j7-c71_0-fw-sec] = "${base_libdir}/firmware/j7-c71_0-fw-sec"
+
+ALTERNATIVE_LINK_NAME[j7200-mcu-r5f0_0-fw] = "${nonarch_base_libdir}/firmware/j7200-mcu-r5f0_0-fw"
+ALTERNATIVE_LINK_NAME[j7200-mcu-r5f0_1-fw] = "${nonarch_base_libdir}/firmware/j7200-mcu-r5f0_1-fw"
+ALTERNATIVE_LINK_NAME[j7200-main-r5f0_0-fw] = "${nonarch_base_libdir}/firmware/j7200-main-r5f0_0-fw"
+ALTERNATIVE_LINK_NAME[j7200-main-r5f0_1-fw] = "${nonarch_base_libdir}/firmware/j7200-main-r5f0_1-fw"
+
+ALTERNATIVE_LINK_NAME[j7200-main-r5f0_0-fw-sec] = "${base_libdir}/firmware/j7200-main-r5f0_0-fw-sec"
+ALTERNATIVE_LINK_NAME[j7200-main-r5f0_1-fw-sec] = "${base_libdir}/firmware/j7200-main-r5f0_1-fw-sec"
+
+ALTERNATIVE_LINK_NAME[j721s2-mcu-r5f0_0-fw] = "${nonarch_base_libdir}/firmware/j721s2-mcu-r5f0_0-fw"
+ALTERNATIVE_LINK_NAME[j721s2-mcu-r5f0_1-fw] = "${nonarch_base_libdir}/firmware/j721s2-mcu-r5f0_1-fw"
+ALTERNATIVE_LINK_NAME[j721s2-main-r5f0_0-fw] = "${nonarch_base_libdir}/firmware/j721s2-main-r5f0_0-fw"
+ALTERNATIVE_LINK_NAME[j721s2-main-r5f0_1-fw] = "${nonarch_base_libdir}/firmware/j721s2-main-r5f0_1-fw"
+ALTERNATIVE_LINK_NAME[j721s2-main-r5f1_0-fw] = "${nonarch_base_libdir}/firmware/j721s2-main-r5f1_0-fw"
+ALTERNATIVE_LINK_NAME[j721s2-main-r5f1_1-fw] = "${nonarch_base_libdir}/firmware/j721s2-main-r5f1_1-fw"
+ALTERNATIVE_LINK_NAME[j721s2-c71_0-fw] = "${nonarch_base_libdir}/firmware/j721s2-c71_0-fw"
+ALTERNATIVE_LINK_NAME[j721s2-c71_1-fw] = "${nonarch_base_libdir}/firmware/j721s2-c71_1-fw"
+
+ALTERNATIVE_LINK_NAME[j721s2-main-r5f0_0-fw-sec] = "${base_libdir}/firmware/j721s2-main-r5f0_0-fw-sec"
+ALTERNATIVE_LINK_NAME[j721s2-main-r5f0_1-fw-sec] = "${base_libdir}/firmware/j721s2-main-r5f0_1-fw-sec"
+ALTERNATIVE_LINK_NAME[j721s2-main-r5f1_0-fw-sec] = "${base_libdir}/firmware/j721s2-main-r5f1_0-fw-sec"
+ALTERNATIVE_LINK_NAME[j721s2-main-r5f1_1-fw-sec] = "${base_libdir}/firmware/j721s2-main-r5f1_1-fw-sec"
+ALTERNATIVE_LINK_NAME[j721s2-c71_0-fw-sec] = "${base_libdir}/firmware/j721s2-c71_0-fw-sec"
+ALTERNATIVE_LINK_NAME[j721s2-c71_1-fw-sec] = "${base_libdir}/firmware/j721s2-c71_1-fw-sec"
+
+ALTERNATIVE_LINK_NAME[j784s4-mcu-r5f0_0-fw] = "${base_libdir}/firmware/j784s4-mcu-r5f0_0-fw"
+ALTERNATIVE_LINK_NAME[j784s4-mcu-r5f0_1-fw] = "${base_libdir}/firmware/j784s4-mcu-r5f0_1-fw"
+ALTERNATIVE_LINK_NAME[j784s4-main-r5f0_0-fw] = "${base_libdir}/firmware/j784s4-main-r5f0_0-fw"
+ALTERNATIVE_LINK_NAME[j784s4-main-r5f0_1-fw] = "${base_libdir}/firmware/j784s4-main-r5f0_1-fw"
+ALTERNATIVE_LINK_NAME[j784s4-main-r5f1_0-fw] = "${base_libdir}/firmware/j784s4-main-r5f1_0-fw"
+ALTERNATIVE_LINK_NAME[j784s4-main-r5f1_1-fw] = "${base_libdir}/firmware/j784s4-main-r5f1_1-fw"
+ALTERNATIVE_LINK_NAME[j784s4-main-r5f2_0-fw] = "${base_libdir}/firmware/j784s4-main-r5f2_0-fw"
+ALTERNATIVE_LINK_NAME[j784s4-main-r5f2_1-fw] = "${base_libdir}/firmware/j784s4-main-r5f2_1-fw"
+ALTERNATIVE_LINK_NAME[j784s4-c71_0-fw] = "${base_libdir}/firmware/j784s4-c71_0-fw"
+ALTERNATIVE_LINK_NAME[j784s4-c71_1-fw] = "${base_libdir}/firmware/j784s4-c71_1-fw"
+ALTERNATIVE_LINK_NAME[j784s4-c71_2-fw] = "${base_libdir}/firmware/j784s4-c71_2-fw"
+ALTERNATIVE_LINK_NAME[j784s4-c71_3-fw] = "${base_libdir}/firmware/j784s4-c71_3-fw"
 
 # Create the firmware alternatives
 
-- 
2.39.1


