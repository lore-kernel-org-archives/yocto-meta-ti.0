Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46508C46467
	for <webhook@archiver.kernel.org>; Wed, 11 Jan 2023 22:14:43 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.38909.1673475277791047414
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 11 Jan 2023 14:14:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=RznbECTr;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: rs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 30BMEb6I085273
	for <meta-ti@lists.yoctoproject.org>; Wed, 11 Jan 2023 16:14:37 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1673475277;
	bh=5e/LDTJT1b4tq4jfMl9Lz++eyviv8U0GWRG/dr260ic=;
	h=From:To:CC:Subject:Date;
	b=RznbECTrIQIKW+lYr18GA8eNauNQRe9au86OnLUwJpHwKLL3PZSIQMYxBXJeFn7FY
	 CBP/90WjJNhzHCOSRSsarV3cUG8jbVCo71Xm/you1mTHmdJnl+bVOTwf1gN9aRyblW
	 vT+KcqahjX+VO4PB8GKiUq4m32egG0oHD3x0lOck=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 30BMEbPO045235
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Wed, 11 Jan 2023 16:14:37 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 11
 Jan 2023 16:14:36 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 11 Jan 2023 16:14:36 -0600
Received: from res.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 30BMEaGi006955;
	Wed, 11 Jan 2023 16:14:36 -0600
From: Randolph Sapp <rs@ti.com>
To: <reatmon@ti.com>, <denys@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, Randolph Sapp <rs@ti.com>
Subject: [dunfell][PATCH v2] ti-img-rogue-driver: AM62 Active power management
Date: Wed, 11 Jan 2023 16:14:34 -0600
Message-ID: <20230111221434.2399898-1-rs@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 11 Jan 2023 22:14:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15550

Bump source revision. Changelog from source:
  - Cleanup the device initialization routine for all platforms
  - Add a power safeguard for multicore initialization
  - Enable active power management for AM62 devices

v2: This revision actually uses the correct commit hash. Not sure where
I got the old one from.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb b/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb
index 94a7f220..9a5bc479 100644
--- a/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb
+++ b/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb
@@ -26,7 +26,7 @@ SRC_URI = " \
 
 S = "${WORKDIR}/git"
 
-SRCREV = "c901804e8221d477983a6f7224a9cdc6e832f050"
+SRCREV = "1dd6291a5cad4f2b909fc2a14bd717a3bc5f0bb2"
 
 TARGET_PRODUCT_j7-evm = "j721e_linux"
 TARGET_PRODUCT_j7-hs-evm = "j721e_linux"
-- 
2.34.1


