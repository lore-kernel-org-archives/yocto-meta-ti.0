Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F399C001B3
	for <webhook@archiver.kernel.org>; Fri, 30 Jun 2023 02:46:25 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.4117.1688093180528049116
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 29 Jun 2023 19:46:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: list.ti.com, ip: 198.47.19.141, mailfrom: lcpdbld@list.ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35U2kF8p077904;
	Thu, 29 Jun 2023 21:46:15 -0500
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35U2kFfv120796
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 29 Jun 2023 21:46:15 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 29
 Jun 2023 21:46:14 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 29 Jun 2023 21:46:15 -0500
Received: from fllvdckhpci039.itg.ti.com (fllvdckhpci039.itg.ti.com [10.248.132.250])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35U2kFPS090106;
	Thu, 29 Jun 2023 21:46:15 -0500
Received: by fllvdckhpci039.itg.ti.com (Postfix, from userid 60899)
	id EC74210FCF7B; Thu, 29 Jun 2023 21:46:14 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][kirkstone][PATCH 2/4] u-boot-ti-staging_2023.04: CI/CD Auto-Merger: cicd.kirkstone.202306291638
Date: Thu, 29 Jun 2023 21:46:12 -0500
Message-ID: <1688093174-34108-3-git-send-email-lcpdbld@list.ti.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1688093174-34108-1-git-send-email-lcpdbld@list.ti.com>
References: <1688093174-34108-1-git-send-email-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 30 Jun 2023 02:46:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16807

Updated the value(s) for:
  SRCREV

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb
index d91bd75..451d3f5 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb
@@ -8,7 +8,7 @@ PR = "r0"
 
 BRANCH = "ti-u-boot-2023.04"
 
-SRCREV = "f08d85fc66a0b730f7bbd64900e146264f858fe3"
+SRCREV = "9ed6d8935d9aaca9507cbcc820833a2a238ac980"
 
 do_install:append:am62xx() {
 	install -d ${D}/boot
-- 
1.8.3.1


