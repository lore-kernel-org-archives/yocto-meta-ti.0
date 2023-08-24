Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB3CCC3DA6F
	for <webhook@archiver.kernel.org>; Thu, 24 Aug 2023 02:42:52 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.2543.1692844966697605079
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 23 Aug 2023 19:42:46 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: list.ti.com, ip: 198.47.23.248, mailfrom: lcpdbld@list.ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 37O2gjNL086792;
	Wed, 23 Aug 2023 21:42:45 -0500
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 37O2gjTt012192
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 23 Aug 2023 21:42:45 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 23
 Aug 2023 21:42:45 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 23 Aug 2023 21:42:45 -0500
Received: from fllvdckhpci039.itg.ti.com (fllvdckhpci039.itg.ti.com [10.248.132.250])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 37O2giGt112433;
	Wed, 23 Aug 2023 21:42:45 -0500
Received: by fllvdckhpci039.itg.ti.com (Postfix, from userid 60899)
	id EB1E910FE4C7; Wed, 23 Aug 2023 21:42:44 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][kirkstone][PATCH 1/2] linux-ti-staging-rt_6.1: CI/CD Auto-Merger: cicd.kirkstone.202308231800
Date: Wed, 23 Aug 2023 21:42:43 -0500
Message-ID: <1692844964-98806-2-git-send-email-lcpdbld@list.ti.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1692844964-98806-1-git-send-email-lcpdbld@list.ti.com>
References: <1692844964-98806-1-git-send-email-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 24 Aug 2023 02:42:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16887

Updated the value(s) for:
  PV
  SRCREV

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.1.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.1.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.1.bb
index 61bf934..a5ed931 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.1.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.1.bb
@@ -6,5 +6,5 @@ FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}-6.1:"
 
 BRANCH = "ti-rt-linux-6.1.y"
 
-SRCREV = "4446f2255e8f8594a80ddf38a0202ff67db110ee"
-PV = "6.1.38+git${SRCPV}"
+SRCREV = "dd944f14304d2ce6d26c9cdc3d2d2d6d373a322c"
+PV = "6.1.46+git${SRCPV}"
-- 
1.8.3.1


