Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B12BEC61D9D
	for <webhook@archiver.kernel.org>; Wed, 25 Jan 2023 03:50:03 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.37437.1674618593206984405
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 24 Jan 2023 19:49:53 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: list.ti.com, ip: 198.47.23.249, mailfrom: lcpdbld@list.ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 30P3npi9036761;
	Tue, 24 Jan 2023 21:49:51 -0600
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 30P3npQo110523
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 24 Jan 2023 21:49:51 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 24
 Jan 2023 21:49:51 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Tue, 24 Jan 2023 21:49:51 -0600
Received: from fllvdckhpci039.itg.ti.com (fllvdckhpci039.itg.ti.com [10.248.132.250])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 30P3npf3018047;
	Tue, 24 Jan 2023 21:49:51 -0600
Received: by fllvdckhpci039.itg.ti.com (Postfix, from userid 60899)
	id 96E5911485B9; Tue, 24 Jan 2023 21:49:51 -0600 (CST)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH 3/3] linux-ti-staging: CI/CD Auto-Merger: cicd.dunfell.202301241906
Date: Tue, 24 Jan 2023 21:49:51 -0600
Message-ID: <1674618591-68774-4-git-send-email-lcpdbld@list.ti.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1674618591-68774-1-git-send-email-lcpdbld@list.ti.com>
References: <1674618591-68774-1-git-send-email-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 25 Jan 2023 03:50:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15644

Updated the value(s) for:
  SRCREV

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 recipes-kernel/linux/linux-ti-staging_5.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-kernel/linux/linux-ti-staging_5.10.bb b/recipes-kernel/linux/linux-ti-staging_5.10.bb
index ee31537..5e1f5e2 100644
--- a/recipes-kernel/linux/linux-ti-staging_5.10.bb
+++ b/recipes-kernel/linux/linux-ti-staging_5.10.bb
@@ -25,7 +25,7 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-linux-5.10.y"
 
-SRCREV = "90976f615b7ec6d31eba0db18c5b6844a3371e10"
+SRCREV = "d9ca44672caeffcf83ede29cbd2a20fab404d833"
 PV = "5.10.158+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-- 
1.8.3.1


