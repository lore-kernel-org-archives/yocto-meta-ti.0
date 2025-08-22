Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30AB8CA0EED
	for <webhook@archiver.kernel.org>; Fri, 22 Aug 2025 10:44:43 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.6937.1755859478257594923
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 22 Aug 2025 03:44:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=FJiqwqGA;
 spf=pass (domain: list.ti.com, ip: 198.47.23.234, mailfrom: lcpdbld@list.ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57MAiaQN233547;
	Fri, 22 Aug 2025 05:44:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755859477; i=@ti.com;
	bh=89fgmj2nlYQgIP6DmDLsKS5DlXgRnrD9eSEz7yHbw0Q=;
	h=From:To:Subject:Date;
	b=FJiqwqGAzL3VUAXgNvL7JwJK37gKHz8TD3g1exeXX4KJfqjHgX8LeswysooJbqSXT
	 KTRXpdeuCcaI3O9si1nWbr2CKp7wgrJlNec+57r5IvSB8VMPMd683yRsYNW+1ws+Zo
	 Pxgiw2bmOa7M3ZY9/1hnwnkgVTMTXKLmBnfgq524=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57MAiamb3545710
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 22 Aug 2025 05:44:36 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 22
 Aug 2025 05:44:36 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 22 Aug 2025 05:44:36 -0500
Received: from fllvdckhpci102.itg.ti.com (fllvdckhpci102.itg.ti.com [10.64.72.97])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57MAiaat3424030;
	Fri, 22 Aug 2025 05:44:36 -0500
Received: by fllvdckhpci102.itg.ti.com (Postfix, from userid 60899)
	id 850842A67; Fri, 22 Aug 2025 05:44:36 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202508220021
Date: Fri, 22 Aug 2025 05:44:36 -0500
Message-ID: <20250822104436.712507-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 22 Aug 2025 10:44:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18960

Updated the value(s) for:
  u-boot-ti-staging_2025.01: SRCREV
  linux-ti-staging-rt_6.12: PV_ARM32,SRCREV_ARM32
  linux-ti-staging_6.12: PV,SRCREV

Changelogs:
  u-boot-ti-staging_2025.01: https://git.ti.com/cgit/ti-u-boot/ti-u-boot/log/?qt=range&q=935b381a868777ce757ae732543b219b7ffba226..f3f8c664b3001e40cbdf46687732b2c37e1b6b33
  linux-ti-staging-rt_6.12: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/log/?qt=range&q=95eefa7f7f59e2fe2929d2edbc0e21793b9d79c6..9085e19579dfb5074d05000dcca3b9b7d8afb106
  linux-ti-staging_6.12: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/log/?qt=range&q=47b05100094a1b6ba8b1cba913a17ed73a47f581..10c7960f9cf6c5e3ed0c8865596e07540bf9ba1b

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb  | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb | 4 ++--
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb    | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
index d108f881..ab19988d 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
@@ -6,4 +6,4 @@ PR = "r0"
 
 BRANCH = "ti-u-boot-2025.01"
 
-SRCREV = "935b381a868777ce757ae732543b219b7ffba226"
+SRCREV = "f3f8c664b3001e40cbdf46687732b2c37e1b6b33"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
index 395adb05..a6a1e7c7 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
@@ -10,8 +10,8 @@ BRANCH_ARM64 = "ti-linux-6.12.y"
 BRANCH = "${BRANCH_ARM64}"
 
 BRANCH_ARM32 = "ti-rt-linux-6.12.y-arm32"
-SRCREV_ARM32 = "95eefa7f7f59e2fe2929d2edbc0e21793b9d79c6"
-PV_ARM32 = "6.12.42+git"
+SRCREV_ARM32 = "9085e19579dfb5074d05000dcca3b9b7d8afb106"
+PV_ARM32 = "6.12.43+git"
 
 BRANCH:ti33x = "${BRANCH_ARM32}"
 BRANCH:ti43x = "${BRANCH_ARM32}"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
index b331cd31..c8c93533 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
@@ -22,8 +22,8 @@ S = "${WORKDIR}/git"
 
 BRANCH ?= "ti-linux-6.12.y"
 
-SRCREV ?= "47b05100094a1b6ba8b1cba913a17ed73a47f581"
-PV = "6.12.42+git"
+SRCREV ?= "10c7960f9cf6c5e3ed0c8865596e07540bf9ba1b"
+PV = "6.12.43+git"
 
 # Special configuration for remoteproc/rpmsg IPC modules
 module_conf_rpmsg_client_sample = "blacklist rpmsg_client_sample"
-- 
2.43.5


