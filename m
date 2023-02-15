Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 836E9C6FD1A
	for <webhook@archiver.kernel.org>; Wed, 15 Feb 2023 19:34:02 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.2569.1676489642062659680
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 15 Feb 2023 11:34:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=OgxBLCSk;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 31FJY1jW084080;
	Wed, 15 Feb 2023 13:34:01 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1676489641;
	bh=qw9x/N1W3U0wvMhU81nQ33FfUqtgMxCgNIEIGZIzt2U=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=OgxBLCSkAXrQVV1Tc3fbwOPh0V3wS9zY2A5qCndKc4HNCrCOY3C+gombIyzKaVuXy
	 dPeLehwtN0oBoQ84xBWelSWjMtN/jIyafedaMLAUTCXkmpvY+ehWzLpViuCIHL/yFm
	 RP83RPdS/H8UzYolXHtW+BMRWHsddLGCdCoosFCk=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 31FJY1SS096593
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 15 Feb 2023 13:34:01 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 15
 Feb 2023 13:34:00 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 15 Feb 2023 13:34:00 -0600
Received: from ula0226330.dal.design.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 31FJXt6s014221;
	Wed, 15 Feb 2023 13:34:00 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH v2 15/15] ti-rtos-firmware: Deploy secure firmware unconditionally
Date: Wed, 15 Feb 2023 13:33:55 -0600
Message-ID: <20230215193355.9676-16-afd@ti.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15869

Having signed firmware is needed for the HS platforms, but does not
cause any issues for non-HS. To keep things simple, let's deploy
both sets unconditionally. This prevents mistakes when adding HS
support and further reduces the image delta between the two types.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../ti-rtos-bin/ti-rtos-firmware.bb           | 38 ++-----------------
 1 file changed, 4 insertions(+), 34 deletions(-)

diff --git a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
index 5de7c7b3..ddfa07be 100644
--- a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
+++ b/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
@@ -183,7 +183,7 @@ ALTERNATIVE:${PN}:am62xx = "\
                     am62-main-r5f0_0-fw \
                     "
 
-ALTERNATIVE:${PN}:j721e-hs-evm = "\
+ALTERNATIVE:${PN}:j721e = "\
                     j7-mcu-r5f0_0-fw \
                     j7-mcu-r5f0_1-fw \
                     j7-main-r5f0_0-fw \
@@ -202,26 +202,7 @@ ALTERNATIVE:${PN}:j721e-hs-evm = "\
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
@@ -230,18 +211,7 @@ ALTERNATIVE:${PN}:j7200-hs-evm = "\
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
@@ -258,7 +228,7 @@ ALTERNATIVE:${PN}:j721s2-hs-evm = "\
                     j721s2-c71_1-fw-sec \
                     "
 
-ALTERNATIVE:${PN}:j784s4-evm = "\
+ALTERNATIVE:${PN}:j784s4 = "\
                     j784s4-mcu-r5f0_0-fw \
                     j784s4-mcu-r5f0_1-fw \
                     j784s4-main-r5f0_0-fw \
-- 
2.39.1


