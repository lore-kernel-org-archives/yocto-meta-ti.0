Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64ABFC636CC
	for <webhook@archiver.kernel.org>; Tue,  7 Feb 2023 23:42:45 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.6583.1675813361751519976
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 07 Feb 2023 15:42:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=yXu2e24J;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 317NgevO038812;
	Tue, 7 Feb 2023 17:42:40 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1675813360;
	bh=eWA8892qYfa3oaPGokAf/RNSxrC0fosuTOQcIr4P0vs=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=yXu2e24JxPwrsj7btMefXfCaq+Tu0e5qVlS5/6c8PvyxQZAP6jpekPR8zuqh3ke5h
	 g/zs7zoAXwQKojGP/26xhCbIe1iqKGlmUP6Rc/tFfUiYhfwY3Lsb7UCTJHYLf7oKuB
	 J2npcrN9A4J4aiPWmsEQ5Zd8zHO+TDr/OmWv8sMQ=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 317Nge12103821
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 7 Feb 2023 17:42:40 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 7
 Feb 2023 17:42:40 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Tue, 7 Feb 2023 17:42:40 -0600
Received: from ula0226330.dal.design.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 317NgdTd050846;
	Tue, 7 Feb 2023 17:42:39 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH 2/8] ti-rtos-firmware: Remove unneeded per-machine TARGET defines
Date: Tue, 7 Feb 2023 17:42:33 -0600
Message-ID: <20230207234239.30720-2-afd@ti.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15742

Since these TARGET defines are only used on the machine for which
an ALTERNATIVE is defined and always have the same name, these
provide nothing. Drop them.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../ti-rtos-bin/ti-rtos-firmware.bb           | 213 ++++++------------
 1 file changed, 66 insertions(+), 147 deletions(-)

diff --git a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
index 6c59b8ab..e0b262da 100644
--- a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
+++ b/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
@@ -404,153 +404,72 @@ ALTERNATIVE:${PN}:j784s4-evm = "\
 
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


