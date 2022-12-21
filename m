Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1021C4332F
	for <webhook@archiver.kernel.org>; Wed, 21 Dec 2022 16:52:34 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.23836.1671641549596910779
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 21 Dec 2022 08:52:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=XuNXXW+t;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: rs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2BLGqSmu056980
	for <meta-ti@lists.yoctoproject.org>; Wed, 21 Dec 2022 10:52:28 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1671641548;
	bh=+7N27Rt5+g/IuEnoLz6GdmJ0hs2zbAcpsiySzHOOhi8=;
	h=From:To:CC:Subject:Date;
	b=XuNXXW+tZerZQ20JA7uU38G3BIB/RJ+ybPfcsFvCH0yzn8E0Kvld52qzNYwEIJZsz
	 i5CuVqVI3V5Ov8oaz6Ev6RLpKgZhVGOk8NpNwGy7wo9coXTILvoE1e88xV7x044WW7
	 bgFwc9il4wq1Nw4ZP/BXpRUr2UaUQZ6M/LLzIEAE=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2BLGqSLV026065
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Wed, 21 Dec 2022 10:52:28 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 21
 Dec 2022 10:52:28 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 21 Dec 2022 10:52:28 -0600
Received: from res.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2BLGqSUU052424;
	Wed, 21 Dec 2022 10:52:28 -0600
From: Randolph Sapp <rs@ti.com>
To: <reatmon@ti.com>, <denys@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <detheridge@ti.com>,
        Randolph Sapp
	<rs@ti.com>
Subject: [dunfell][PATCH] ti-img-rogue-driver: AM62 Active power management
Date: Wed, 21 Dec 2022 10:52:25 -0600
Message-ID: <20221221165225.1674821-1-rs@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 21 Dec 2022 16:52:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15500

Bump source revision. Changelog from source:
  - Cleanup the device initialization routine for all platforms
  - Add a power safeguard for multicore initialization
  - Enable active power management for AM62 devices

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb b/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb
index 94a7f220..53b27e73 100644
--- a/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb
+++ b/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb
@@ -26,7 +26,7 @@ SRC_URI = " \
 
 S = "${WORKDIR}/git"
 
-SRCREV = "c901804e8221d477983a6f7224a9cdc6e832f050"
+SRCREV = "af18cae88645dc288118aecb379380015ac1daee"
 
 TARGET_PRODUCT_j7-evm = "j721e_linux"
 TARGET_PRODUCT_j7-hs-evm = "j721e_linux"
-- 
2.34.1


