Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3880C05027
	for <webhook@archiver.kernel.org>; Fri,  3 Feb 2023 15:48:20 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.14094.1675439292226625404
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 03 Feb 2023 07:48:12 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: list.ti.com, ip: 198.47.19.141, mailfrom: lcpdbld@list.ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 313Fm9CW022994;
	Fri, 3 Feb 2023 09:48:09 -0600
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 313Fm90N081088
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 3 Feb 2023 09:48:09 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Fri, 3
 Feb 2023 09:48:09 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Fri, 3 Feb 2023 09:48:09 -0600
Received: from fllvdckhpci039.itg.ti.com (fllvdckhpci039.itg.ti.com [10.248.132.250])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 313Fm9eT067515;
	Fri, 3 Feb 2023 09:48:09 -0600
Received: by fllvdckhpci039.itg.ti.com (Postfix, from userid 60899)
	id 37DD810FE253; Fri,  3 Feb 2023 09:48:09 -0600 (CST)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH 1/4] ti-linux-fw: CI/CD Auto-Merger: cicd.dunfell.202302030400
Date: Fri, 3 Feb 2023 09:48:06 -0600
Message-ID: <1675439289-21302-2-git-send-email-lcpdbld@list.ti.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15722

Updated the value(s) for:
  K3_IMAGE_GEN_SRCREV
  TI_LINUX_FW_SRCREV

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 recipes-bsp/ti-linux-fw/ti-linux-fw.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index 8188d72..d6ee366 100644
--- a/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -20,12 +20,12 @@ IMG_DEC_FW_VERSION = "1.0"
 CNM_WAVE521_FW_VERSION = "1.0.00"
 TIFS_LPM_STUB_FW_VERSION = "08.03.02"
 
-TI_LINUX_FW_SRCREV ?= "54f54f37192bdb95f08d9e7fcc64659a98f6b6c4"
+TI_LINUX_FW_SRCREV ?= "e13f60459c72a315ff63d9800e8abb0d88bf45fc"
 SRCREV = "${TI_LINUX_FW_SRCREV}"
 
 BRANCH ?= "ti-linux-firmware"
 
-K3_IMAGE_GEN_SRCREV ?= "2308bfb01e7bd3e03514cb33f06180dd9bb79121"
+K3_IMAGE_GEN_SRCREV ?= "69250070a328f7a658a3d5cb4b8ca8f81947e8ac"
 SRCREV_imggen = "${K3_IMAGE_GEN_SRCREV}"
 SRCREV_FORMAT = "imggen"
 
-- 
1.8.3.1


