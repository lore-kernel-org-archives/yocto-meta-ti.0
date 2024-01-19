Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 583D6C4725D
	for <webhook@archiver.kernel.org>; Fri, 19 Jan 2024 22:28:12 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.1197.1705703281880606406
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 19 Jan 2024 14:28:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=ebqK1p0E;
 spf=pass (domain: list.ti.com, ip: 198.47.19.141, mailfrom: lcpdbld@list.ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 40JMS0je127163;
	Fri, 19 Jan 2024 16:28:00 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1705703280; i=@ti.com;
	bh=p2Av+r1TgXD0AhqKkkoJXaqAXZPgmg2jw47YNz02oNQ=;
	h=From:To:Subject:Date;
	b=ebqK1p0ET3GJPBdMW+LjGaetFaz0OZhAONCdh9wQkZ5tlHNMNC8tYP9A0v/sfD0qO
	 P52QhuKDd6rSQ15mRb6yq9sE3drD2pG4TB5k/lixOUdFA2U8/NHkOVa/hHtbk1l696
	 YbB0B3mSKmfyu4hw5dcDdAkW+AXg86u3PsjbQv8c=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 40JMS0po121153
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 19 Jan 2024 16:28:00 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 19
 Jan 2024 16:28:00 -0600
Received: from fllvsmtp7.itg.ti.com (10.64.40.31) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 19 Jan 2024 16:28:00 -0600
Received: from fllvdckhpci028.itg.ti.com (fllvdckhpci028.itg.ti.com [10.248.130.161])
	by fllvsmtp7.itg.ti.com (8.15.2/8.15.2) with ESMTP id 40JMS0w0078908;
	Fri, 19 Jan 2024 16:28:00 -0600
Received: by fllvdckhpci028.itg.ti.com (Postfix, from userid 60899)
	id 0E2AE10AA2AB; Fri, 19 Jan 2024 16:28:00 -0600 (CST)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][kirkstone][PATCH] CI/CD Auto-Merger: cicd.kirkstone.202401191036
Date: Fri, 19 Jan 2024 16:28:00 -0600
Message-ID: <1705703280-124707-1-git-send-email-lcpdbld@list.ti.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 19 Jan 2024 22:28:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17405

Updated the value(s) for:
  linux-ti-staging-rt_6.1: SRCREV
  linux-ti-staging_6.1: SRCREV

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.1.bb | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.1.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.1.bb
index de38350..a0534ca 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.1.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.1.bb
@@ -6,7 +6,7 @@ FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}-6.1:"
 
 BRANCH = "ti-rt-linux-6.1.y"
 
-SRCREV = "0f8de5c40f576fc34dc80b3a32508d9990fd79d4"
+SRCREV = "95b5a09669edc6d3a5216ab8155a621ac28dd6ca"
 
 include ${@ 'recipes-kernel/linux/ti-extras-rt.inc' if d.getVar('TI_EXTRAS') else ''}
 
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
index c3d280a..1290d98 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
@@ -23,7 +23,7 @@ S = "${WORKDIR}/git"
 
 BRANCH ?= "ti-linux-6.1.y"
 
-SRCREV ?= "82d2b827840254248a0444a9c50ab3dc395876cc"
+SRCREV ?= "edc768299f200ad01fcb51d9fc68f329fa62936f"
 PV = "6.1.69+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-- 
1.8.3.1


