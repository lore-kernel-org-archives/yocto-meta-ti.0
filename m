Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C22FC7EE22
	for <webhook@archiver.kernel.org>; Wed, 17 May 2023 03:54:47 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.41892.1684295685123814786
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 16 May 2023 20:54:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: list.ti.com, ip: 198.47.23.248, mailfrom: lcpdbld@list.ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34H3shKY077335;
	Tue, 16 May 2023 22:54:43 -0500
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34H3shXF011035
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 16 May 2023 22:54:43 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 16
 May 2023 22:54:43 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 16 May 2023 22:54:43 -0500
Received: from fllvdckhpci039.itg.ti.com (fllvdckhpci039.itg.ti.com [10.248.132.250])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34H3shKW048534;
	Tue, 16 May 2023 22:54:43 -0500
Received: by fllvdckhpci039.itg.ti.com (Postfix, from userid 60899)
	id 37B0210FDEE9; Tue, 16 May 2023 22:54:43 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][kirkstone][PATCH 1/3] ti-linux-fw: CI/CD Auto-Merger: cicd.kirkstone.202305161900
Date: Tue, 16 May 2023 22:54:41 -0500
Message-ID: <1684295683-43547-2-git-send-email-lcpdbld@list.ti.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1684295683-43547-1-git-send-email-lcpdbld@list.ti.com>
References: <1684295683-43547-1-git-send-email-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 17 May 2023 03:54:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16549

Updated the value(s) for:
  TI_LINUX_FW_SRCREV

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index 5c4efb0..886251d 100644
--- a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -16,7 +16,7 @@ IMG_DEC_FW_VERSION = "1.0"
 CNM_WAVE521_FW_VERSION = "1.0.00"
 TIFS_LPM_STUB_FW_VERSION = "08.06.04"
 
-TI_LINUX_FW_SRCREV ?= "24f21d2ab6adbd018204bf4079e86b968277af56"
+TI_LINUX_FW_SRCREV ?= "d1372402013ab512dc25381403f075efa90e5a47"
 SRCREV = "${TI_LINUX_FW_SRCREV}"
 
 BRANCH ?= "ti-linux-firmware"
-- 
1.8.3.1


