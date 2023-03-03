Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EE34C7EE39
	for <webhook@archiver.kernel.org>; Fri,  3 Mar 2023 02:17:23 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.13275.1677809838302477737
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 02 Mar 2023 18:17:18 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: list.ti.com, ip: 198.47.19.141, mailfrom: lcpdbld@list.ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3232HFkU104227;
	Thu, 2 Mar 2023 20:17:15 -0600
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3232HF7m020492
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 2 Mar 2023 20:17:15 -0600
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Thu, 2
 Mar 2023 20:17:15 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Thu, 2 Mar 2023 20:17:15 -0600
Received: from fllvdckhpci039.itg.ti.com (fllvdckhpci039.itg.ti.com [10.248.132.250])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3232HF1B046801;
	Thu, 2 Mar 2023 20:17:15 -0600
Received: by fllvdckhpci039.itg.ti.com (Postfix, from userid 60899)
	id 372D211221D6; Thu,  2 Mar 2023 20:17:15 -0600 (CST)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH 4/4] ti-k3-secdev: CI/CD Auto-Merger: cicd.dunfell.202303021800
Date: Thu, 2 Mar 2023 20:17:15 -0600
Message-ID: <1677809835-108022-5-git-send-email-lcpdbld@list.ti.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1677809835-108022-1-git-send-email-lcpdbld@list.ti.com>
References: <1677809835-108022-1-git-send-email-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 03 Mar 2023 02:17:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15975

Updated the value(s) for:
  GIT_SRCREV

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 recipes-ti/secdev/ti-k3-secdev_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-ti/secdev/ti-k3-secdev_git.bb b/recipes-ti/secdev/ti-k3-secdev_git.bb
index 7196be9..7d9a440 100644
--- a/recipes-ti/secdev/ti-k3-secdev_git.bb
+++ b/recipes-ti/secdev/ti-k3-secdev_git.bb
@@ -14,7 +14,7 @@ COMPATIBLE_MACHINE_class-nativesdk = "(.*)"
 GIT_URI = "git://git.ti.com/git/security-development-tools/core-secdev-k3.git"
 GIT_PROTOCOL = "https"
 GIT_BRANCH = "master"
-GIT_SRCREV = "eb2c4d734487e5095b94cef3fd7213ee71d9e016"
+GIT_SRCREV = "bba9cabaeee96f7f287385188ff289b46769a4bf"
 
 SRC_URI = "${GIT_URI};protocol=${GIT_PROTOCOL};branch=${GIT_BRANCH}"
 SRCREV = "${GIT_SRCREV}"
-- 
1.8.3.1


