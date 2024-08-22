Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE988C531DF
	for <webhook@archiver.kernel.org>; Thu, 22 Aug 2024 15:14:23 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.15645.1724339661554313881
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 22 Aug 2024 08:14:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=ORPdpc58;
 spf=pass (domain: list.ti.com, ip: 198.47.23.249, mailfrom: lcpdbld@list.ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 47MFEK9e045341;
	Thu, 22 Aug 2024 10:14:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1724339660; i=@ti.com;
	bh=XXZ/W1djFAg8gh0oOk/mn9qhdBREMUUYFj0fOJQGEog=;
	h=From:To:Subject:Date;
	b=ORPdpc58Fymaafq4nt6Slp8rl0y5oxot32JqWqEexQkqmc8+8/fLOLATKY5X/MYB2
	 SSPhj2XJHVmkUr1NKUkOBZJ2wLnbQHV9NZb50BUKUUWBBoGNlLmpvccLMeiH1r4NcN
	 q0kG0DiSVyFo8iiQBBggXl9sTkli/IPlaARHEOmY=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 47MFEKk3018196
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 22 Aug 2024 10:14:20 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 22
 Aug 2024 10:14:20 -0500
Received: from fllvsmtp8.itg.ti.com (10.64.41.158) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 22 Aug 2024 10:14:20 -0500
Received: from fllvdckhpci004.itg.ti.com (fllvdckhpci004.itg.ti.com [10.248.130.8])
	by fllvsmtp8.itg.ti.com (8.15.2/8.15.2) with ESMTP id 47MFEJMD018014;
	Thu, 22 Aug 2024 10:14:19 -0500
Received: by fllvdckhpci004.itg.ti.com (Postfix, from userid 60899)
	id EA08711125AA; Thu, 22 Aug 2024 10:14:19 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202408220400
Date: Thu, 22 Aug 2024 10:14:19 -0500
Message-ID: <1724339659-52312-1-git-send-email-lcpdbld@list.ti.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 22 Aug 2024 15:14:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17947

Updated the value(s) for:
  u-boot-ti-staging_2024.04: SRCREV
  linux-ti-staging-rt_6.6: SRCREV
  linux-ti-staging_6.6: SRCREV

Changelogs:
  u-boot-ti-staging_2024.04: https://git.ti.com/cgit/ti-u-boot/ti-u-boot/log/?qt=range&q=818c76aed67f94059b9ebb94d237418802620b81..7986fd679935818d0ef11e6a334377df178774f6
  linux-ti-staging-rt_6.6: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/log/?qt=range&q=f9bceb7343387ac6fab003518f1cd31987d6eb05..2cc066b2c5d12544415bd84564e633bf852bef74
  linux-ti-staging_6.6: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/log/?qt=range&q=db88712931433e92a5f73cec57c82c5c7ebee593..d80245c38ed4432878e5fe309f6ba958fd2c2e8f

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2024.04.bb | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.6.bb | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb    | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2024.04.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2024.04.bb
index a873488..69add27 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2024.04.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2024.04.bb
@@ -6,4 +6,4 @@ PR = "r0"
 
 BRANCH = "ti-u-boot-2024.04"
 
-SRCREV = "818c76aed67f94059b9ebb94d237418802620b81"
+SRCREV = "7986fd679935818d0ef11e6a334377df178774f6"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.6.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.6.bb
index 29607b2..da0bcc7 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.6.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.6.bb
@@ -8,7 +8,7 @@ FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}-6.6:"
 
 BRANCH = "ti-rt-linux-6.6.y"
 
-SRCREV = "f9bceb7343387ac6fab003518f1cd31987d6eb05"
+SRCREV = "2cc066b2c5d12544415bd84564e633bf852bef74"
 
 include ${@ 'recipes-kernel/linux/ti-extras-rt.inc' if d.getVar('TI_EXTRAS') else ''}
 
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb
index 341a4cc..7407088 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb
@@ -23,7 +23,7 @@ S = "${WORKDIR}/git"
 
 BRANCH ?= "ti-linux-6.6.y"
 
-SRCREV ?= "db88712931433e92a5f73cec57c82c5c7ebee593"
+SRCREV ?= "d80245c38ed4432878e5fe309f6ba958fd2c2e8f"
 PV = "6.6.32+git"
 
 KERNEL_GIT_URI ?= "git://git.ti.com/git/ti-linux-kernel/ti-linux-kernel.git"
-- 
1.8.3.1


