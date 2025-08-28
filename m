Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F832CA0FF9
	for <webhook@archiver.kernel.org>; Thu, 28 Aug 2025 23:06:17 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.1343.1756422375721199614
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 28 Aug 2025 16:06:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=X1nD+jsf;
 spf=pass (domain: list.ti.com, ip: 198.47.19.245, mailfrom: lcpdbld@list.ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57SN6E2h1617006;
	Thu, 28 Aug 2025 18:06:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1756422374; i=@ti.com;
	bh=9Wu1UHXTmOGUJToJlYyInnLrx8G13RQZTnoffMwyZFg=;
	h=From:To:Subject:Date;
	b=X1nD+jsfslEXsgmV/rqhI81PMsGKEu+SY8jbjhrudqH2FhjgV2zgrCn2hf2jXPFM1
	 mzaEryqnZs1xczkYqod2Va+VZAtmb9n7pg0g+aVFspNEm5/Q/+j/L13QBG6my1JTEH
	 m3UtS/LFyHx7IxlupmiulKZLhMspdaV6IBhq1Fzc=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57SN6D0N093944
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 28 Aug 2025 18:06:13 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 28
 Aug 2025 18:06:13 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 28 Aug 2025 18:06:13 -0500
Received: from fllvdckhpci102.itg.ti.com (fllvdckhpci102.itg.ti.com [10.64.72.97])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57SN6Dng1390274;
	Thu, 28 Aug 2025 18:06:13 -0500
Received: by fllvdckhpci102.itg.ti.com (Postfix, from userid 60899)
	id 81A93136628; Thu, 28 Aug 2025 18:06:13 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202508281316
Date: Thu, 28 Aug 2025 18:06:13 -0500
Message-ID: <20250828230613.3423453-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 28 Aug 2025 23:06:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18975

Updated the value(s) for:
  ti-linux-fw: TI_LINUX_FW_SRCREV
  u-boot-ti-staging_2025.01: SRCREV
  k3conf: SRCREV
  linux-ti-staging-rt_6.12: SRCREV_ARM32
  linux-ti-staging_6.12: SRCREV

Changelogs:
  ti-linux-fw: https://git.ti.com/cgit/processor-firmware/ti-linux-firmware/log/?qt=range&q=33b0116556a8a57e8e456a99e45e8736db7652f3..fb492164151831b90e961dd37fccc57a8fdc1257
  u-boot-ti-staging_2025.01: https://git.ti.com/cgit/ti-u-boot/ti-u-boot/log/?qt=range&q=f3f8c664b3001e40cbdf46687732b2c37e1b6b33..252b02299cf637f96be9c735a86ed5aad328e00c
  k3conf: https://git.ti.com/cgit/k3conf/k3conf/log/?qt=range&q=4e8df1a41a1437b61562836e9478e8069d1a071c..3de294db4f2cd75404f358768f4be8f8fa3132d7
  linux-ti-staging-rt_6.12: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/log/?qt=range&q=9085e19579dfb5074d05000dcca3b9b7d8afb106..c0845caeb62fc6ea82d85a65f52efcfebb9b2c75
  linux-ti-staging_6.12: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/log/?qt=range&q=10c7960f9cf6c5e3ed0c8865596e07540bf9ba1b..26482216a39c9653ea319cd1d6e609b8d1f0fc12

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc          | 2 +-
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb  | 2 +-
 meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb            | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb    | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index b5926ca4..9b3497fa 100644
--- a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -21,7 +21,7 @@ TAD5212_FW_VERSION = "1.0.0.0"
 TI_PKA_FW_VERSION = "2.1.0"
 TI_IPC_EXAMPLES_FW_VERSION = "3.52.00.01"
 
-TI_LINUX_FW_SRCREV ?= "33b0116556a8a57e8e456a99e45e8736db7652f3"
+TI_LINUX_FW_SRCREV ?= "fb492164151831b90e961dd37fccc57a8fdc1257"
 SRCREV = "${TI_LINUX_FW_SRCREV}"
 
 BRANCH ?= "ti-linux-firmware"
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
index ab19988d..609f8404 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
@@ -6,4 +6,4 @@ PR = "r0"
 
 BRANCH = "ti-u-boot-2025.01"
 
-SRCREV = "f3f8c664b3001e40cbdf46687732b2c37e1b6b33"
+SRCREV = "252b02299cf637f96be9c735a86ed5aad328e00c"
diff --git a/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb b/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb
index 4f11fe9f..8a34743f 100644
--- a/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb
+++ b/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb
@@ -10,7 +10,7 @@ PV = "0.3+git"
 COMPATIBLE_MACHINE = "k3"
 
 BRANCH ?= "master"
-SRCREV = "4e8df1a41a1437b61562836e9478e8069d1a071c"
+SRCREV = "3de294db4f2cd75404f358768f4be8f8fa3132d7"
 
 SRC_URI = "git://git.ti.com/git/k3conf/k3conf.git;protocol=https;branch=${BRANCH}"
 
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
index a6a1e7c7..5c72f0b2 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
@@ -10,7 +10,7 @@ BRANCH_ARM64 = "ti-linux-6.12.y"
 BRANCH = "${BRANCH_ARM64}"
 
 BRANCH_ARM32 = "ti-rt-linux-6.12.y-arm32"
-SRCREV_ARM32 = "9085e19579dfb5074d05000dcca3b9b7d8afb106"
+SRCREV_ARM32 = "c0845caeb62fc6ea82d85a65f52efcfebb9b2c75"
 PV_ARM32 = "6.12.43+git"
 
 BRANCH:ti33x = "${BRANCH_ARM32}"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
index c8c93533..c2faf9c7 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
@@ -22,7 +22,7 @@ S = "${WORKDIR}/git"
 
 BRANCH ?= "ti-linux-6.12.y"
 
-SRCREV ?= "10c7960f9cf6c5e3ed0c8865596e07540bf9ba1b"
+SRCREV ?= "26482216a39c9653ea319cd1d6e609b8d1f0fc12"
 PV = "6.12.43+git"
 
 # Special configuration for remoteproc/rpmsg IPC modules
-- 
2.43.5


