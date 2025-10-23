Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 444F1CCF9E0
	for <webhook@archiver.kernel.org>; Thu, 23 Oct 2025 21:26:30 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.20.1761254784209943590
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 23 Oct 2025 14:26:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=oT345fuI;
 spf=pass (domain: list.ti.com, ip: 198.47.23.235, mailfrom: lcpdbld@list.ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59NLQNZQ624910;
	Thu, 23 Oct 2025 16:26:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1761254783; i=@ti.com;
	bh=W/EMDZeVcuu6uIvqflgAeHNbuewzE8sJBzv8le1pm1U=;
	h=From:To:Subject:Date;
	b=oT345fuIdX/5cbXMKv9/40hzsvZ2NybPIIFC2u5nMvVjuJvBaaGOs7CdSxzVEcBKV
	 XBlyKAXxbGuhO7R1ni9/s/08hwu9FXIj4HElaMG4yg/aBdWQRE3KXzOsbO3pH33XKq
	 zc5hwhZfY6/Pk9w80xGl5LkaKU8Ph8kJkyaBHPDA=
Received: from DLEE209.ent.ti.com (dlee209.ent.ti.com [157.170.170.98])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59NLQNcu3101545
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 23 Oct 2025 16:26:23 -0500
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 23 Oct
 2025 16:26:22 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 23 Oct 2025 16:26:22 -0500
Received: from fllvdckhpci102.itg.ti.com (fllvdckhpci102.itg.ti.com [10.64.72.97])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59NLQMum643766;
	Thu, 23 Oct 2025 16:26:22 -0500
Received: by fllvdckhpci102.itg.ti.com (Postfix, from userid 60899)
	id CA3DE2A6D; Thu, 23 Oct 2025 16:26:22 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202510231214
Date: Thu, 23 Oct 2025 16:26:22 -0500
Message-ID: <20251023212622.4160109-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 23 Oct 2025 21:26:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19165

Updated the value(s) for:
  ti-linux-fw: TI_LINUX_FW_SRCREV
  u-boot-ti-staging_2025.01: SRCREV_uboot
  k3conf: SRCREV
  linux-ti-staging-rt_6.12: SRCREV_ARM32
  linux-ti-staging_6.12: SRCREV

Changelogs:
  ti-linux-fw: https://git.ti.com/cgit/processor-firmware/ti-linux-firmware/log/?qt=range&q=237071793594723bf1c2e9eef8ff836ffa3b09df..3c8ad7386e818cb42cce6ed4ce2aa1e76d7c688f
  u-boot-ti-staging_2025.01: https://git.ti.com/cgit/ti-u-boot/ti-u-boot/log/?qt=range&q=b5956eebf45b7b604c046a21792883a42cd9c198..87519a151561393ce1244ba53401196b011b7a39
  k3conf: https://git.ti.com/cgit/k3conf/k3conf/log/?qt=range&q=f63ccd27cba9550de04e8dbb04bc6003d8b5168e..4612157b45912dfc21ef49e364931c5ce3cb27a0
  linux-ti-staging-rt_6.12: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/log/?qt=range&q=dd80e6d61d8ccba753eb372040107ff195c8550d..f4bae38e160972f3dbfee640421bad168443cc0a
  linux-ti-staging_6.12: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/log/?qt=range&q=2ce6f0999344a368217d04cdbee0922144ecc899..2edd47b56fbddaa47a5b85fe3440bb3516bca8ea

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc          | 2 +-
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb  | 2 +-
 meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb            | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb    | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index 6a86143b..ba2eb4fe 100644
--- a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -21,7 +21,7 @@ TAD5212_FW_VERSION = "1.0.0.0"
 TI_PKA_FW_VERSION = "2.1.0"
 TI_IPC_EXAMPLES_FW_VERSION = "3.52.00.01"
 
-TI_LINUX_FW_SRCREV ?= "237071793594723bf1c2e9eef8ff836ffa3b09df"
+TI_LINUX_FW_SRCREV ?= "3c8ad7386e818cb42cce6ed4ce2aa1e76d7c688f"
 SRCREV = "${TI_LINUX_FW_SRCREV}"
 
 BRANCH ?= "ti-linux-firmware"
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
index f544cca2..3eb7a168 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
@@ -6,4 +6,4 @@ PR = "r0"
 
 BRANCH = "ti-u-boot-2025.01"
 
-SRCREV_uboot = "b5956eebf45b7b604c046a21792883a42cd9c198"
+SRCREV_uboot = "87519a151561393ce1244ba53401196b011b7a39"
diff --git a/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb b/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb
index 761f5c5d..f4da2f1f 100644
--- a/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb
+++ b/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb
@@ -10,7 +10,7 @@ PV = "0.3+git"
 COMPATIBLE_MACHINE = "k3"
 
 BRANCH ?= "master"
-SRCREV = "f63ccd27cba9550de04e8dbb04bc6003d8b5168e"
+SRCREV = "4612157b45912dfc21ef49e364931c5ce3cb27a0"
 
 SRC_URI = "git://git.ti.com/git/k3conf/k3conf.git;protocol=https;branch=${BRANCH}"
 
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
index cc1c4610..db9f9e6c 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
@@ -10,7 +10,7 @@ BRANCH_ARM64 = "ti-linux-6.12.y"
 BRANCH = "${BRANCH_ARM64}"
 
 BRANCH_ARM32 = "ti-rt-linux-6.12.y-arm32"
-SRCREV_ARM32 = "dd80e6d61d8ccba753eb372040107ff195c8550d"
+SRCREV_ARM32 = "f4bae38e160972f3dbfee640421bad168443cc0a"
 PV_ARM32 = "6.12.49+git"
 
 BRANCH:ti33x = "${BRANCH_ARM32}"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
index fb040fbb..f8b69bed 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
@@ -22,7 +22,7 @@ S = "${WORKDIR}/git"
 
 BRANCH ?= "ti-linux-6.12.y"
 
-SRCREV ?= "2ce6f0999344a368217d04cdbee0922144ecc899"
+SRCREV ?= "2edd47b56fbddaa47a5b85fe3440bb3516bca8ea"
 PV = "6.12.49+git"
 
 # Special configuration for remoteproc/rpmsg IPC modules
-- 
2.43.5


