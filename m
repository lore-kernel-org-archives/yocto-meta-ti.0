Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60D2AC88CB2
	for <webhook@archiver.kernel.org>; Tue,  5 Sep 2023 02:09:29 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.12871.1693879762432829484
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 04 Sep 2023 19:09:22 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: list.ti.com, ip: 198.47.23.249, mailfrom: lcpdbld@list.ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 38529LIB055684;
	Mon, 4 Sep 2023 21:09:21 -0500
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 38529Lgg001370
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 4 Sep 2023 21:09:21 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 4
 Sep 2023 21:09:20 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 4 Sep 2023 21:09:20 -0500
Received: from fllvdckhpci039.itg.ti.com (fllvdckhpci039.itg.ti.com [10.248.132.250])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 38529KcY055554;
	Mon, 4 Sep 2023 21:09:20 -0500
Received: by fllvdckhpci039.itg.ti.com (Postfix, from userid 60899)
	id E8E1910F5A68; Mon,  4 Sep 2023 21:09:19 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][kirkstone][PATCH 3/3] linux-ti-staging_6.1: CI/CD Auto-Merger: cicd.kirkstone.202309041800
Date: Mon, 4 Sep 2023 21:09:19 -0500
Message-ID: <1693879759-83137-4-git-send-email-lcpdbld@list.ti.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1693879759-83137-1-git-send-email-lcpdbld@list.ti.com>
References: <1693879759-83137-1-git-send-email-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 05 Sep 2023 02:09:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16919

Updated the value(s) for:
  SRCREV

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
index 0af3df5..6c2f20c 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
@@ -24,7 +24,7 @@ S = "${WORKDIR}/git"
 
 BRANCH ?= "ti-linux-6.1.y"
 
-SRCREV ?= "3c763d86e601ebbaeaa632b802c253a7332cf997"
+SRCREV ?= "95ce32cb0557f45cb10d3f2d46cf1ebed6fe592f"
 PV = "6.1.46+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-- 
1.8.3.1


