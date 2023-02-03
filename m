Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A631AC61DA4
	for <webhook@archiver.kernel.org>; Fri,  3 Feb 2023 15:48:20 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.14136.1675439290948653428
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 03 Feb 2023 07:48:11 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: list.ti.com, ip: 198.47.23.249, mailfrom: lcpdbld@list.ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 313Fm98D113662;
	Fri, 3 Feb 2023 09:48:09 -0600
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 313Fm9bF089292
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 3 Feb 2023 09:48:09 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Fri, 3
 Feb 2023 09:48:09 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Fri, 3 Feb 2023 09:48:09 -0600
Received: from fllvdckhpci039.itg.ti.com (fllvdckhpci039.itg.ti.com [10.248.132.250])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 313Fm9Vj016212;
	Fri, 3 Feb 2023 09:48:09 -0600
Received: by fllvdckhpci039.itg.ti.com (Postfix, from userid 60899)
	id 40E4410FE252; Fri,  3 Feb 2023 09:48:09 -0600 (CST)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH 4/4] linux-ti-staging: CI/CD Auto-Merger: cicd.dunfell.202302030400
Date: Fri, 3 Feb 2023 09:48:09 -0600
Message-ID: <1675439289-21302-5-git-send-email-lcpdbld@list.ti.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1675439289-21302-1-git-send-email-lcpdbld@list.ti.com>
References: <1675439289-21302-1-git-send-email-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 03 Feb 2023 15:48:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15720

Updated the value(s) for:
  PV
  SRCREV

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 recipes-kernel/linux/linux-ti-staging_5.10.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging_5.10.bb b/recipes-kernel/linux/linux-ti-staging_5.10.bb
index 480b607..84ec204 100644
--- a/recipes-kernel/linux/linux-ti-staging_5.10.bb
+++ b/recipes-kernel/linux/linux-ti-staging_5.10.bb
@@ -25,8 +25,8 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-linux-5.10.y"
 
-SRCREV = "06bd1d157b9b43163c1a2184e4a0c92f98656dd0"
-PV = "5.10.158+git${SRCPV}"
+SRCREV = "2927372e2c7cc3782c07b1896757962bc346d4c5"
+PV = "5.10.162+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
 MACHINE_KERNEL_PR_append = "b"
-- 
1.8.3.1


