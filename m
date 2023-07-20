Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24F0BEB64DD
	for <webhook@archiver.kernel.org>; Thu, 20 Jul 2023 06:02:24 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.6912.1689832937734157550
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 19 Jul 2023 23:02:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: list.ti.com, ip: 198.47.19.141, mailfrom: lcpdbld@list.ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 36K62CYg083638;
	Thu, 20 Jul 2023 01:02:12 -0500
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 36K62CsN109005
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 20 Jul 2023 01:02:12 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 20
 Jul 2023 01:02:12 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 20 Jul 2023 01:02:12 -0500
Received: from fllvdckhpci028.itg.ti.com (fllvdckhpci028.itg.ti.com [10.248.130.161])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 36K62CKc024243;
	Thu, 20 Jul 2023 01:02:12 -0500
Received: by fllvdckhpci028.itg.ti.com (Postfix, from userid 60899)
	id 2E9BD11AA3E0; Thu, 20 Jul 2023 01:02:12 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][kirkstone][PATCH 2/2] linux-ti-staging_6.1: CI/CD Auto-Merger: cicd.kirkstone.202307192152
Date: Thu, 20 Jul 2023 01:02:12 -0500
Message-ID: <1689832932-32090-3-git-send-email-lcpdbld@list.ti.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1689832932-32090-1-git-send-email-lcpdbld@list.ti.com>
References: <1689832932-32090-1-git-send-email-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 20 Jul 2023 06:02:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16854

Updated the value(s) for:
  PV
  SRCREV

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
index ed1cd61..6efc62d 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
@@ -24,8 +24,8 @@ S = "${WORKDIR}/git"
 
 BRANCH ?= "ti-linux-6.1.y"
 
-SRCREV ?= "8f7f371be250809e9c4af879cfa31d5f1839257d"
-PV = "6.1.33+git${SRCPV}"
+SRCREV ?= "26d37f12c83158b8e5333e6d5dd14b2fb9cdeab7"
+PV = "6.1.38+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
 MACHINE_KERNEL_PR:append = "b"
-- 
1.8.3.1


