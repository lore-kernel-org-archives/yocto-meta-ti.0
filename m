Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 440D9C05027
	for <webhook@archiver.kernel.org>; Fri, 10 Feb 2023 01:04:52 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.1982.1675991084529674285
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 09 Feb 2023 17:04:44 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: list.ti.com, ip: 198.47.23.249, mailfrom: lcpdbld@list.ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 31A14hh7118953;
	Thu, 9 Feb 2023 19:04:43 -0600
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 31A14hxb068329
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 9 Feb 2023 19:04:43 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Thu, 9
 Feb 2023 19:04:43 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Thu, 9 Feb 2023 19:04:43 -0600
Received: from fllvdckhpci039.itg.ti.com (fllvdckhpci039.itg.ti.com [10.248.132.250])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 31A14hdZ007786;
	Thu, 9 Feb 2023 19:04:43 -0600
Received: by fllvdckhpci039.itg.ti.com (Postfix, from userid 60899)
	id 14FCD115496B; Thu,  9 Feb 2023 19:04:43 -0600 (CST)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH 1/4] ti-linux-fw: CI/CD Auto-Merger: cicd.dunfell.202302091706
Date: Thu, 9 Feb 2023 19:04:40 -0600
Message-ID: <1675991083-50052-2-git-send-email-lcpdbld@list.ti.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1675991083-50052-1-git-send-email-lcpdbld@list.ti.com>
References: <1675991083-50052-1-git-send-email-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 10 Feb 2023 01:04:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15784

Updated the value(s) for:
  K3_IMAGE_GEN_SRCREV
  TI_LINUX_FW_SRCREV

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 recipes-bsp/ti-linux-fw/ti-linux-fw.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index 5728710..0ae5194 100644
--- a/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -20,12 +20,12 @@ IMG_DEC_FW_VERSION = "1.0"
 CNM_WAVE521_FW_VERSION = "1.0.00"
 TIFS_LPM_STUB_FW_VERSION = "08.03.02"
 
-TI_LINUX_FW_SRCREV ?= "b57df8eec37e93cf0e50017b3617080096ab3510"
+TI_LINUX_FW_SRCREV ?= "9e339668d7d1bf5a5ac9109d33f89919eabe6daf"
 SRCREV = "${TI_LINUX_FW_SRCREV}"
 
 BRANCH ?= "ti-linux-firmware"
 
-K3_IMAGE_GEN_SRCREV ?= "a2c62b32e43a0e663af0691fa739f9c5cdf65678"
+K3_IMAGE_GEN_SRCREV ?= "64e7fb3c03f3d4e72a3517175707feff277690e9"
 SRCREV_imggen = "${K3_IMAGE_GEN_SRCREV}"
 SRCREV_FORMAT = "imggen"
 
-- 
1.8.3.1


