Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B298C04A95
	for <webhook@archiver.kernel.org>; Fri, 10 Nov 2023 09:45:14 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.24065.1699609513243932764
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 10 Nov 2023 01:45:13 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: list.ti.com, ip: 198.47.19.142, mailfrom: lcpdbld@list.ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3AA9jCfY011235;
	Fri, 10 Nov 2023 03:45:12 -0600
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3AA9jC84037019
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 10 Nov 2023 03:45:12 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 10
 Nov 2023 03:45:11 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 10 Nov 2023 03:45:11 -0600
Received: from fllvdckhpci028.itg.ti.com (fllvdckhpci028.itg.ti.com [10.248.130.161])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3AA9jBS6030331;
	Fri, 10 Nov 2023 03:45:11 -0600
Received: by fllvdckhpci028.itg.ti.com (Postfix, from userid 60899)
	id F006010B5968; Fri, 10 Nov 2023 03:45:10 -0600 (CST)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH 1/3] u-boot-ti-staging_2023.04: CI/CD Auto-Merger: cicd.master.202311100100
Date: Fri, 10 Nov 2023 03:45:08 -0600
Message-ID: <1699609510-93865-2-git-send-email-lcpdbld@list.ti.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1699609510-93865-1-git-send-email-lcpdbld@list.ti.com>
References: <1699609510-93865-1-git-send-email-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 10 Nov 2023 09:45:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17291

Updated the value(s) for:
  SRCREV

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb
index 0bba349..8e88f03 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb
@@ -6,7 +6,7 @@ PR = "r0"
 
 BRANCH = "ti-u-boot-2023.04"
 
-SRCREV = "b0d868ee086eb5c96a3d32f72a7cb9670abf5b90"
+SRCREV = "09b2c79a8df8b3c01c9ea77ee09265963725fdea"
 
 do_install:append:am62xx() {
 	install -d ${D}/boot
-- 
1.8.3.1


