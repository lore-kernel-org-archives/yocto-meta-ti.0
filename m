Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C9D2EE49AB
	for <webhook@archiver.kernel.org>; Mon, 21 Aug 2023 05:22:07 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.4760.1692595325948531303
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 20 Aug 2023 22:22:06 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: list.ti.com, ip: 198.47.19.141, mailfrom: lcpdbld@list.ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 37L5M48a016527;
	Mon, 21 Aug 2023 00:22:04 -0500
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 37L5M4OT029810
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 21 Aug 2023 00:22:04 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 21
 Aug 2023 00:22:04 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 21 Aug 2023 00:22:04 -0500
Received: from fllvdckhpci039.itg.ti.com (fllvdckhpci039.itg.ti.com [10.248.132.250])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 37L5M4WM120602;
	Mon, 21 Aug 2023 00:22:04 -0500
Received: by fllvdckhpci039.itg.ti.com (Postfix, from userid 60899)
	id 03D6010FCF51; Mon, 21 Aug 2023 00:22:04 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][kirkstone][PATCH 1/2] linux-ti-staging-rt_6.1: CI/CD Auto-Merger: cicd.kirkstone.202308201800
Date: Mon, 21 Aug 2023 00:22:02 -0500
Message-ID: <1692595323-8020-2-git-send-email-lcpdbld@list.ti.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1692595323-8020-1-git-send-email-lcpdbld@list.ti.com>
References: <1692595323-8020-1-git-send-email-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 21 Aug 2023 05:22:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16880

Updated the value(s) for:
  SRCREV

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.1.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.1.bb
index a0122d2..61bf934 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.1.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.1.bb
@@ -6,5 +6,5 @@ FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}-6.1:"
 
 BRANCH = "ti-rt-linux-6.1.y"
 
-SRCREV = "b48e8af2b534491c63db33742d2758064b72eb9f"
+SRCREV = "4446f2255e8f8594a80ddf38a0202ff67db110ee"
 PV = "6.1.38+git${SRCPV}"
-- 
1.8.3.1


