Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 886B2C4829E
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 20:30:54 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.1184.1708029048989182078
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 15 Feb 2024 12:30:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=kDOSNrmA;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 41FKUh21124891;
	Thu, 15 Feb 2024 14:30:43 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1708029044;
	bh=3yfcarLAb7cYQSq38xayMjeJxEmnpw2OGhXAYaxJv3M=;
	h=From:To:CC:Subject:Date;
	b=kDOSNrmAbjel00gDZ5QmITBf9CfXMaR3kfT3l1fl9BrG0Iu17oYUNp8OA7NhMIOpz
	 NFhPLRTPzq++clf7cAJ/JRoFIzB+/GrIncZg03OZ0eMNztegebOW4YRFZodjVSOoFS
	 Pu0yuZczkYK/3ANMVAhgXyqcR/IjKfFzvm3PKNMQ=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 41FKUh1H015744
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 15 Feb 2024 14:30:43 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 15
 Feb 2024 14:30:43 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 15 Feb 2024 14:30:43 -0600
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 41FKUhZ0100463;
	Thu, 15 Feb 2024 14:30:43 -0600
From: <rs@ti.com>
To: <denis@denix.org>, <reatmon@ti.com>, <detheridge@ti.com>, <vishalm@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][kirkstone][PATCH] ti-img-rogue-driver: fix suspend/resume regression
Date: Thu, 15 Feb 2024 14:30:08 -0600
Message-ID: <20240215203008.3488939-1-rs@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 15 Feb 2024 20:30:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17481

From: Randolph Sapp <rs@ti.com>

Bump the SRCREV to include a fix for suspend and resume. Unfortunately
version 23.3 includes a partial rework of the power management subsystem
that breaks OS active power management. Apparently it also broke OS
suspend/resume by incorrectly setting OS state before the device state
was updated and trying to fall back on device default behavior in
certain paths.

This fixes OS suspend/resume but unfortunately full OS APM will need a
little more work.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 .../powervr-drivers/ti-img-rogue-driver_23.3.6512818.bb         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.3.6512818.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.3.6512818.bb
index bc59816a..a4b5390f 100644
--- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.3.6512818.bb
+++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.3.6512818.bb
@@ -22,7 +22,7 @@ SRC_URI = "git://git.ti.com/git/graphics/ti-img-rogue-driver.git;protocol=https;
 
 S = "${WORKDIR}/git"
 
-SRCREV = "41a494accb30aa2f247e6a4e123a4954982f2a88"
+SRCREV = "c89c1efa4a1ee5da64fd525f45e9e33728cf6181"
 
 TARGET_PRODUCT:j721e = "j721e_linux"
 TARGET_PRODUCT:j721s2 = "j721s2_linux"
-- 
2.43.0


