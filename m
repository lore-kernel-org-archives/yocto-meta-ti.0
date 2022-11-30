Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 261D3C47089
	for <webhook@archiver.kernel.org>; Wed, 30 Nov 2022 19:16:26 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.21292.1669835784519453615
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 30 Nov 2022 11:16:24 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: list.ti.com, ip: 198.47.19.141, mailfrom: lcpdbld@list.ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2AUJGLe2116568;
	Wed, 30 Nov 2022 13:16:21 -0600
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2AUJGLho093776
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 30 Nov 2022 13:16:21 -0600
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 30
 Nov 2022 13:16:21 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 30 Nov 2022 13:16:21 -0600
Received: from fllvdckhpci039.itg.ti.com (fllvdckhpci039.itg.ti.com [10.248.132.250])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2AUJGL4s105263;
	Wed, 30 Nov 2022 13:16:21 -0600
Received: by fllvdckhpci039.itg.ti.com (Postfix, from userid 60899)
	id 97BE011483D5; Wed, 30 Nov 2022 13:16:21 -0600 (CST)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH 1/4] ti-linux-fw: CI/CD Auto-Merger: cicd.2022.11.30.11:05:19
Date: Wed, 30 Nov 2022 13:16:18 -0600
Message-ID: <1669835781-116675-2-git-send-email-lcpdbld@list.ti.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1669835781-116675-1-git-send-email-lcpdbld@list.ti.com>
References: <1669835781-116675-1-git-send-email-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 30 Nov 2022 19:16:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15377

Updated the value(s) for:
  K3_IMAGE_GEN_SRCREV

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 recipes-bsp/ti-linux-fw/ti-linux-fw.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index ab5889e..c27eb49 100644
--- a/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -25,7 +25,7 @@ SRCREV = "${TI_LINUX_FW_SRCREV}"
 
 BRANCH ?= "ti-linux-firmware"
 
-K3_IMAGE_GEN_SRCREV ?= "fde253192d1839723b777323596a697bf8d6332c"
+K3_IMAGE_GEN_SRCREV ?= "fe663d31c4884f1d7aeb4a79dd262bda819c5737"
 SRCREV_imggen = "${K3_IMAGE_GEN_SRCREV}"
 SRCREV_FORMAT = "imggen"
 
-- 
1.8.3.1


