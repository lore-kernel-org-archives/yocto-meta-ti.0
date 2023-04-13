Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF86EC77B73
	for <webhook@archiver.kernel.org>; Thu, 13 Apr 2023 05:25:30 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.5509.1681363527214134076
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 12 Apr 2023 22:25:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: list.ti.com, ip: 198.47.23.249, mailfrom: lcpdbld@list.ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33D5PQHY016957;
	Thu, 13 Apr 2023 00:25:26 -0500
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33D5PQZt115318
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 13 Apr 2023 00:25:26 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Thu, 13
 Apr 2023 00:25:25 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Thu, 13 Apr 2023 00:25:25 -0500
Received: from fllvdckhpci039.itg.ti.com (fllvdckhpci039.itg.ti.com [10.248.132.250])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33D5PP6f036977;
	Thu, 13 Apr 2023 00:25:25 -0500
Received: by fllvdckhpci039.itg.ti.com (Postfix, from userid 60899)
	id B33DB11221B4; Thu, 13 Apr 2023 00:25:25 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH 1/2] linux-ti-staging-rt: CI/CD Auto-Merger: cicd.dunfell.202304122200
Date: Thu, 13 Apr 2023 00:25:24 -0500
Message-ID: <1681363525-103432-2-git-send-email-lcpdbld@list.ti.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1681363525-103432-1-git-send-email-lcpdbld@list.ti.com>
References: <1681363525-103432-1-git-send-email-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 13 Apr 2023 05:25:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16390

Updated the value(s) for:
  SRCREV

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 recipes-kernel/linux/linux-ti-staging-rt_5.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb b/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
index 5d82d1d..75c17e9 100644
--- a/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
+++ b/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
@@ -6,5 +6,5 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-5.10:"
 
 BRANCH = "ti-rt-linux-5.10.y"
 
-SRCREV = "d14fbab5ccb21ffeb010ce57792c56a1308ed314"
+SRCREV = "e6bb059e69c106b73bfe2a10e729dbe5a5820916"
 PV = "5.10.168+git${SRCPV}"
-- 
1.8.3.1


