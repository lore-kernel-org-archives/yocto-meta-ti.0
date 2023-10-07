Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BAB6E81E1F
	for <webhook@archiver.kernel.org>; Sat,  7 Oct 2023 04:46:34 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.12571.1696653989252074807
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 06 Oct 2023 21:46:29 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: list.ti.com, ip: 198.47.19.142, mailfrom: lcpdbld@list.ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3974kRjA054112;
	Fri, 6 Oct 2023 23:46:27 -0500
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3974kRkX074586
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 6 Oct 2023 23:46:27 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 6
 Oct 2023 23:46:27 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 6 Oct 2023 23:46:27 -0500
Received: from fllvdckhpci039.itg.ti.com (fllvdckhpci039.itg.ti.com [10.248.132.250])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3974kR4N024568;
	Fri, 6 Oct 2023 23:46:27 -0500
Received: by fllvdckhpci039.itg.ti.com (Postfix, from userid 60899)
	id 54FCA10F5A50; Fri,  6 Oct 2023 23:46:27 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][kirkstone][PATCH 1/5] ti-linux-fw: CI/CD Auto-Merger: cicd.kirkstone.202310061657
Date: Fri, 6 Oct 2023 23:46:23 -0500
Message-ID: <1696653987-108478-2-git-send-email-lcpdbld@list.ti.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1696653987-108478-1-git-send-email-lcpdbld@list.ti.com>
References: <1696653987-108478-1-git-send-email-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sat, 07 Oct 2023 04:46:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17067

Updated the value(s) for:
  TI_LINUX_FW_SRCREV

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index be072e6..889c543 100644
--- a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -17,7 +17,7 @@ CNM_WAVE521_FW_VERSION = "1.0.00"
 TI_DM_FW_VERSION = "08.06.04"
 TI_SYSFW_VERSION = "08.06.04"
 
-TI_LINUX_FW_SRCREV ?= "b99791cb6496139dbeb1ccf0a72bb1cb1ecfa7e6"
+TI_LINUX_FW_SRCREV ?= "f903ca69b36c5a991728867153bf2e10cac35f6c"
 SRCREV = "${TI_LINUX_FW_SRCREV}"
 
 BRANCH ?= "ti-linux-firmware"
-- 
1.8.3.1


