Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F7C5C25B4F
	for <webhook@archiver.kernel.org>; Thu,  9 May 2024 01:10:59 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.3617.1715217042368703894
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 08 May 2024 18:10:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=pP2VwIMb;
 spf=pass (domain: list.ti.com, ip: 198.47.23.248, mailfrom: lcpdbld@list.ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4491AeLo033469;
	Wed, 8 May 2024 20:10:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1715217040; i=@ti.com;
	bh=kXkIVA77DySLWilQgx47ip5vkoLJcjld+rGl0bl6HRE=;
	h=From:To:Subject:Date;
	b=pP2VwIMbfxtXR43ebAtByEUdPWr/zNw4aQdyHjI9SAU7+BJapzAMcWWNfTk/uGVcB
	 sX4werI4UVC0RAJsA7bJv75sU0jf7oyufZsCT2pX9NurJfIye7PnN7UPMcUkpIDiT6
	 UCQNJjG1QgYAf2zwRYKR1BukJaEShDoUZtumku0w=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4491AeA8012989
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 8 May 2024 20:10:40 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 8
 May 2024 20:10:40 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 8 May 2024 20:10:40 -0500
Received: from fllvdckhpci004.itg.ti.com (fllvdckhpci004.itg.ti.com [10.248.130.8])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4491Ae0Z052429;
	Wed, 8 May 2024 20:10:40 -0500
Received: by fllvdckhpci004.itg.ti.com (Postfix, from userid 60899)
	id 86CF710C35C6; Wed,  8 May 2024 20:10:40 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202405081800
Date: Wed, 8 May 2024 20:10:40 -0500
Message-ID: <1715217040-30859-1-git-send-email-lcpdbld@list.ti.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 09 May 2024 01:10:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17650

Updated the value(s) for:
  u-boot-ti-staging_2024.04: SRCREV
  linux-ti-staging-rt_6.6: SRCREV
  linux-ti-staging_6.6: SRCREV

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2024.04.bb | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.6.bb | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb    | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2024.04.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2024.04.bb
index fbf3b41..90917d4 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2024.04.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2024.04.bb
@@ -8,4 +8,4 @@ PR = "r0"
 
 BRANCH = "ti-u-boot-2024.04"
 
-SRCREV = "243d0c74704df56b1fab4e7989805adb45142070"
+SRCREV = "6dddecde23592b71b9a7e9cb4e47d809ce59dd39"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.6.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.6.bb
index 8ea4ca0..bccd856 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.6.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.6.bb
@@ -10,7 +10,7 @@ FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}-6.6:"
 
 BRANCH = "ti-rt-linux-6.6.y"
 
-SRCREV = "de1e0f90de78b391c98f02bb8e178e89cb81e1a8"
+SRCREV = "7cceac93947da35755935827cd675925400d0102"
 
 include ${@ 'recipes-kernel/linux/ti-extras-rt.inc' if d.getVar('TI_EXTRAS') else ''}
 
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb
index 9a78701..14fabb8 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb
@@ -25,7 +25,7 @@ S = "${WORKDIR}/git"
 
 BRANCH ?= "ti-linux-6.6.y"
 
-SRCREV ?= "9478b0bdd90a0df151c1cba3c90cab74a8d98009"
+SRCREV ?= "f7f73d9d344c89081db499a2968d9033d7cac45c"
 PV = "6.6.25+git"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-- 
1.8.3.1


