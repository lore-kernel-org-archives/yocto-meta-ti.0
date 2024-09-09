Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FC44ECE57A
	for <webhook@archiver.kernel.org>; Mon,  9 Sep 2024 13:37:44 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.53153.1725889060895900021
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 09 Sep 2024 06:37:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Ka67FfyS;
 spf=pass (domain: list.ti.com, ip: 198.47.19.141, mailfrom: lcpdbld@list.ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 489DbdT3103261;
	Mon, 9 Sep 2024 08:37:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1725889059; i=@ti.com;
	bh=SY2oKkyMu6Xs8t/L9EMb8GWsjY57olL9QFdNVzqQheA=;
	h=From:To:Subject:Date;
	b=Ka67FfyStgQuFrFAn6YrLIn9Hrt9AEq4oZG84t8kjwo0+viRafdyRfTNaSaNq8Bg3
	 64HniRo+PHMHCErO2vGTLeLVDS4Aj6oIxBuYvCRviXlNBJ5paeYadFjnAH5BRWxOlm
	 ObNC8LB+Gmj0SFyAW2D9UGF1jOJDjqK7OxG8cqgU=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 489DbdPS071975
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 9 Sep 2024 08:37:39 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 9
 Sep 2024 08:37:38 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 9 Sep 2024 08:37:39 -0500
Received: from fllvdckhpci004.itg.ti.com (fllvdckhpci004.itg.ti.com [10.248.130.8])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 489DbcqZ105401;
	Mon, 9 Sep 2024 08:37:38 -0500
Received: by fllvdckhpci004.itg.ti.com (Postfix, from userid 60899)
	id DB5C811125A8; Mon,  9 Sep 2024 08:37:38 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202409090400
Date: Mon, 9 Sep 2024 08:37:38 -0500
Message-ID: <1725889058-8142-1-git-send-email-lcpdbld@list.ti.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 09 Sep 2024 13:37:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17960

Updated the value(s) for:
  linux-ti-staging-rt_6.6: SRCREV
  linux-ti-staging_6.6: SRCREV

Changelogs:
  linux-ti-staging-rt_6.6: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/log/?qt=range&q=fb018c5e9fa7eb05fa1cb2e87760d9c1e430da64..85d46cfcef8242e37cbd99a6591cab2b90d0d8ed
  linux-ti-staging_6.6: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/log/?qt=range&q=c0deda7906ed2661afaa841e1d822932a37f38f6..d5b1bee95de93e6ab87e73242c20910e7d7d3d83

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.6.bb | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.6.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.6.bb
index c54ef7a..025702f 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.6.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.6.bb
@@ -8,7 +8,7 @@ FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}-6.6:"
 
 BRANCH = "ti-rt-linux-6.6.y"
 
-SRCREV = "fb018c5e9fa7eb05fa1cb2e87760d9c1e430da64"
+SRCREV = "85d46cfcef8242e37cbd99a6591cab2b90d0d8ed"
 
 include ${@ 'recipes-kernel/linux/ti-extras-rt.inc' if d.getVar('TI_EXTRAS') else ''}
 
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb
index f1f64dd..224d6d9 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb
@@ -23,7 +23,7 @@ S = "${WORKDIR}/git"
 
 BRANCH ?= "ti-linux-6.6.y"
 
-SRCREV ?= "c0deda7906ed2661afaa841e1d822932a37f38f6"
+SRCREV ?= "d5b1bee95de93e6ab87e73242c20910e7d7d3d83"
 PV = "6.6.32+git"
 
 KERNEL_GIT_URI ?= "git://git.ti.com/git/ti-linux-kernel/ti-linux-kernel.git"
-- 
1.8.3.1


