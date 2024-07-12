Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0DFCC3DA49
	for <webhook@archiver.kernel.org>; Fri, 12 Jul 2024 00:33:57 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.6586.1720744428797829390
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 11 Jul 2024 17:33:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=WP7CCHud;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: rs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 46C0XjCf072963;
	Thu, 11 Jul 2024 19:33:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1720744425;
	bh=F6QhheayMv5eb0a1XW/9MixFGMB8hmN4hevfiB1A/Us=;
	h=From:To:CC:Subject:Date;
	b=WP7CCHudCqnAdOHcOeu67awZbesTM3SRiGBeimxvHZByI6jFbzDaAEJHXT9DawAEW
	 7D0btPxnAzNlxe/BxlfNq6Quq87fNQm3m5bFZjnhpUF3bXK5AKnsphLmKImvBPMGnT
	 OMcPyP5wlrd3WgP2ZwMLulxllK1w7uuwe/uNf6QU=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 46C0XjY3087849
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 11 Jul 2024 19:33:45 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 11
 Jul 2024 19:33:45 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 11 Jul 2024 19:33:45 -0500
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 46C0Xjh6094028;
	Thu, 11 Jul 2024 19:33:45 -0500
From: <rs@ti.com>
To: <denis@denix.org>, <reatmon@ti.com>
CC: <detheridge@ti.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][scarthgap/master][PATCH] ti-img-rogue-driver: pickup page size patches
Date: Thu, 11 Jul 2024 19:33:29 -0500
Message-ID: <20240712003329.132121-1-rs@ti.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 12 Jul 2024 00:33:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17857

From: Randolph Sapp <rs@ti.com>

Bump SRCREV to pick up some patches that adjust the way heaps are
sized. This solves issues seen when utilizing page sizes greater
than 4K.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 .../powervr-drivers/ti-img-rogue-driver_23.3.6512818.bb         | 2 +-
 .../powervr-drivers/ti-img-rogue-driver_24.1.6554834.bb         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.3.6512818.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.3.6512818.bb
index 607c86b2..f7c871e1 100644
--- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.3.6512818.bb
+++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.3.6512818.bb
@@ -19,7 +19,7 @@ SRC_URI = "git://git.ti.com/git/graphics/ti-img-rogue-driver.git;protocol=https;
 
 S = "${WORKDIR}/git"
 
-SRCREV = "174eb331a61e89184342fa57a935226f4e952bc9"
+SRCREV = "c838bc06a163abad46dcc193c8fb9a4fb9e2e356"
 
 TARGET_PRODUCT:j721e = "j721e_linux"
 TARGET_PRODUCT:j721s2 = "j721s2_linux"
diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_24.1.6554834.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_24.1.6554834.bb
index fc303c4f..9d854da9 100644
--- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_24.1.6554834.bb
+++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_24.1.6554834.bb
@@ -19,7 +19,7 @@ SRC_URI = "git://git.ti.com/git/graphics/ti-img-rogue-driver.git;protocol=https;
 
 S = "${WORKDIR}/git"
 
-SRCREV = "81e189096ef2f2479ccfb50d8b2fb24097188de3"
+SRCREV = "707bb373902babf9ced5fd2f99139209ca0f605a"
 
 TARGET_PRODUCT:j721e = "j721e_linux"
 TARGET_PRODUCT:j721s2 = "j721s2_linux"
-- 
2.45.2


