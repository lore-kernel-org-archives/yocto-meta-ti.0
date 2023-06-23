Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B1B8C001DD
	for <webhook@archiver.kernel.org>; Fri, 23 Jun 2023 03:37:02 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.34317.1687491416398689483
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 22 Jun 2023 20:36:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: list.ti.com, ip: 198.47.23.248, mailfrom: lcpdbld@list.ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35N3atbE084991;
	Thu, 22 Jun 2023 22:36:55 -0500
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35N3atab003896
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 22 Jun 2023 22:36:55 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 22
 Jun 2023 22:36:54 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 22 Jun 2023 22:36:54 -0500
Received: from fllvdckhpci039.itg.ti.com (fllvdckhpci039.itg.ti.com [10.248.132.250])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35N3asOl023821;
	Thu, 22 Jun 2023 22:36:54 -0500
Received: by fllvdckhpci039.itg.ti.com (Postfix, from userid 60899)
	id 6A70510F5C89; Thu, 22 Jun 2023 22:36:54 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][kirkstone][PATCH 4/4] ti-k3-secdev: CI/CD Auto-Merger: cicd.kirkstone.202306221900
Date: Thu, 22 Jun 2023 22:36:54 -0500
Message-ID: <1687491414-113463-5-git-send-email-lcpdbld@list.ti.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1687491414-113463-1-git-send-email-lcpdbld@list.ti.com>
References: <1687491414-113463-1-git-send-email-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 23 Jun 2023 03:37:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16785

Updated the value(s) for:
  GIT_SRCREV

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-ti-bsp/recipes-ti/secdev/ti-k3-secdev_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/recipes-ti/secdev/ti-k3-secdev_git.bb b/meta-ti-bsp/recipes-ti/secdev/ti-k3-secdev_git.bb
index 87987ae..e3267a2 100644
--- a/meta-ti-bsp/recipes-ti/secdev/ti-k3-secdev_git.bb
+++ b/meta-ti-bsp/recipes-ti/secdev/ti-k3-secdev_git.bb
@@ -15,7 +15,7 @@ COMPATIBLE_MACHINE:class-nativesdk = "(.*)"
 GIT_URI = "git://git.ti.com/git/security-development-tools/core-secdev-k3.git"
 GIT_PROTOCOL = "https"
 GIT_BRANCH = "master"
-GIT_SRCREV = "bba9cabaeee96f7f287385188ff289b46769a4bf"
+GIT_SRCREV = "ed6951fd3877c6cac7f1237311f7278ac21634f3"
 
 SRC_URI = "${GIT_URI};protocol=${GIT_PROTOCOL};branch=${GIT_BRANCH}"
 SRCREV = "${GIT_SRCREV}"
-- 
1.8.3.1


