Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27F51C64ED8
	for <webhook@archiver.kernel.org>; Wed, 15 Feb 2023 20:42:43 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.4485.1676493761417638102
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 15 Feb 2023 12:42:41 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: list.ti.com, ip: 198.47.19.142, mailfrom: lcpdbld@list.ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 31FKgdLW088220;
	Wed, 15 Feb 2023 14:42:39 -0600
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 31FKgdt4003627
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 15 Feb 2023 14:42:39 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 15
 Feb 2023 14:42:39 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 15 Feb 2023 14:42:38 -0600
Received: from fllvdckhpci039.itg.ti.com (fllvdckhpci039.itg.ti.com [10.248.132.250])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 31FKgdPH112101;
	Wed, 15 Feb 2023 14:42:39 -0600
Received: by fllvdckhpci039.itg.ti.com (Postfix, from userid 60899)
	id 0B4AD112303E; Wed, 15 Feb 2023 14:42:39 -0600 (CST)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH 4/4] linux-ti-staging: CI/CD Auto-Merger: cicd.dunfell.202302151242
Date: Wed, 15 Feb 2023 14:42:38 -0600
Message-ID: <1676493758-27461-5-git-send-email-lcpdbld@list.ti.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1676493758-27461-1-git-send-email-lcpdbld@list.ti.com>
References: <1676493758-27461-1-git-send-email-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 15 Feb 2023 20:42:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15873

Updated the value(s) for:
  SRCREV

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 recipes-kernel/linux/linux-ti-staging_5.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-kernel/linux/linux-ti-staging_5.10.bb b/recipes-kernel/linux/linux-ti-staging_5.10.bb
index 6dfd8e1..c0525de 100644
--- a/recipes-kernel/linux/linux-ti-staging_5.10.bb
+++ b/recipes-kernel/linux/linux-ti-staging_5.10.bb
@@ -25,7 +25,7 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-linux-5.10.y"
 
-SRCREV = "49ac7a0fd28276c30778837c1fd6372b62ae13a6"
+SRCREV = "76b3e88d569210a51399e8d8c8babd995af29d11"
 PV = "5.10.162+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-- 
1.8.3.1


