Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93A22C64EC6
	for <webhook@archiver.kernel.org>; Tue,  7 Feb 2023 23:42:45 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.6629.1675813365130125571
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 07 Feb 2023 15:42:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=lSXthuf3;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 317Ngh9b058482;
	Tue, 7 Feb 2023 17:42:43 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1675813363;
	bh=ES6VVdaj06pnzdOYcQdJl38rAHHl5rkx75C4v1XvFEs=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=lSXthuf33sAN1LACk/yTPBFyW/hmgwWIUK42BExMDypubYAQEVrq+GkXvhp0voHTq
	 aaIcs8k3lrwE9oTfe7xSNz967lQamXN9YX5MN86eiOopnIAo4ggIELsjeBxQVHI5VC
	 jWfjNgqUqUgA+TsiINbD38h/DXSh2SaOG9fXmrDU=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 317NghhZ094346
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 7 Feb 2023 17:42:43 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 7
 Feb 2023 17:42:42 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Tue, 7 Feb 2023 17:42:42 -0600
Received: from ula0226330.dal.design.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 317NgdTj050846;
	Tue, 7 Feb 2023 17:42:42 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH 8/8] ti-rtos-firmware: Deploy secure firmware unconditionally
Date: Tue, 7 Feb 2023 17:42:39 -0600
Message-ID: <20230207234239.30720-8-afd@ti.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15748

Having signed firmware is needed for the HS platforms, but does not
cause any issues for non-HS. To keep things simple, let's deploy
both sets unconditionally. This prevents mistakes when adding HS
support and further reduces the image delta between the two types.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../ti-rtos-bin/ti-rtos-firmware.bb           | 38 ++-----------------
 1 file changed, 4 insertions(+), 34 deletions(-)

diff --git a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
index feff39ea..9931cab0 100644
--- a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
+++ b/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
@@ -187,7 +187,7 @@ ALTERNATIVE:${PN}:am62xx = "\
                     am62-main-r5f0_0-fw \
                     "
 
-ALTERNATIVE:${PN}:j721e-hs-evm = "\
+ALTERNATIVE:${PN}:j721e = "\
                     j7-mcu-r5f0_0-fw \
                     j7-mcu-r5f0_1-fw \
                     j7-main-r5f0_0-fw \
@@ -206,26 +206,7 @@ ALTERNATIVE:${PN}:j721e-hs-evm = "\
                     j7-c71_0-fw-sec \
                     "
 
-ALTERNATIVE:${PN}:j721e-evm = "\
-                    j7-mcu-r5f0_0-fw \
-                    j7-mcu-r5f0_1-fw \
-                    j7-main-r5f0_0-fw \
-                    j7-main-r5f0_1-fw \
-                    j7-main-r5f1_0-fw \
-                    j7-main-r5f1_1-fw \
-                    j7-c66_0-fw \
-                    j7-c66_1-fw \
-                    j7-c71_0-fw\
-                    "
-
-ALTERNATIVE:${PN}:j7200-evm = "\
-                    j7200-mcu-r5f0_0-fw \
-                    j7200-mcu-r5f0_1-fw \
-                    j7200-main-r5f0_0-fw \
-                    j7200-main-r5f0_1-fw \
-                    "
-
-ALTERNATIVE:${PN}:j7200-hs-evm = "\
+ALTERNATIVE:${PN}:j7200 = "\
                     j7200-mcu-r5f0_0-fw \
                     j7200-mcu-r5f0_1-fw \
                     j7200-main-r5f0_0-fw \
@@ -234,18 +215,7 @@ ALTERNATIVE:${PN}:j7200-hs-evm = "\
                     j7200-main-r5f0_1-fw-sec \
                     "
 
-ALTERNATIVE_${PN}:j721s2-evm = "\
-                    j721s2-mcu-r5f0_0-fw \
-                    j721s2-mcu-r5f0_1-fw \
-                    j721s2-main-r5f0_0-fw \
-                    j721s2-main-r5f0_1-fw \
-                    j721s2-main-r5f1_0-fw \
-                    j721s2-main-r5f1_1-fw \
-                    j721s2-c71_0-fw \
-                    j721s2-c71_1-fw \
-                    "
-
-ALTERNATIVE:${PN}:j721s2-hs-evm = "\
+ALTERNATIVE:${PN}:j721s2 = "\
                     j721s2-mcu-r5f0_0-fw \
                     j721s2-mcu-r5f0_1-fw \
                     j721s2-main-r5f0_0-fw \
@@ -262,7 +232,7 @@ ALTERNATIVE:${PN}:j721s2-hs-evm = "\
                     j721s2-c71_1-fw-sec \
                     "
 
-ALTERNATIVE:${PN}:j784s4-evm = "\
+ALTERNATIVE:${PN}:j784s4 = "\
                     j784s4-mcu-r5f0_0-fw \
                     j784s4-mcu-r5f0_1-fw \
                     j784s4-main-r5f0_0-fw \
-- 
2.39.1


