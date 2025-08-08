Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AAC6C87FD3
	for <webhook@archiver.kernel.org>; Fri,  8 Aug 2025 08:06:37 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.16973.1754640392511435942
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 08 Aug 2025 01:06:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=EAsR4hXU;
 spf=pass (domain: list.ti.com, ip: 198.47.23.234, mailfrom: lcpdbld@list.ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57886Vxo549631;
	Fri, 8 Aug 2025 03:06:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1754640391; i=@ti.com;
	bh=BX6+tWMcoXJMndilaJULETaEiVCE1YOcDOqZAtFEcf4=;
	h=From:To:Subject:Date;
	b=EAsR4hXUP0kRCv9jFf3cssUf+3Jeso8nB8AUIwjnjjpdM3Al5rz1+qq5xoLjBiCsN
	 DMljKsr9XN+w27Z7ediyKlS5PY4X8s4/AzWWEBPsrEwpX07K8SJvO1vd91fCr5Se3E
	 uaW90TVoIvVJUpY22wbjd2rMbl1nerKZRs4tje4k=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57886VCi1488549
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 8 Aug 2025 03:06:31 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 8
 Aug 2025 03:06:30 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 8 Aug 2025 03:06:30 -0500
Received: from fllvdckhpci004.itg.ti.com (fllvdckhpci004.itg.ti.com [10.64.72.21])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57886UMb2733077;
	Fri, 8 Aug 2025 03:06:30 -0500
Received: by fllvdckhpci004.itg.ti.com (Postfix, from userid 60899)
	id D0228E80C4; Fri,  8 Aug 2025 03:06:30 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202508080100
Date: Fri, 8 Aug 2025 03:06:30 -0500
Message-ID: <20250808080630.1774007-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 08 Aug 2025 08:06:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18911

Updated the value(s) for:
  u-boot-ti-staging_2025.01: SRCREV
  k3conf: SRCREV
  linux-ti-staging-rt_6.12: SRCREV_ARM32
  linux-ti-staging_6.12: SRCREV

Changelogs:
  u-boot-ti-staging_2025.01: https://git.ti.com/cgit/ti-u-boot/ti-u-boot/log/?qt=range&q=743712b9ee4b33cc9739a3cbeb5a8f14ae2ccf35..05d141ca0739756a0cdd7a19268e3ad07279a17e
  k3conf: https://git.ti.com/cgit/k3conf/k3conf/log/?qt=range&q=2bcd5f52a88ef48f8bb5b7541cf05b10d2008cd7..b35ec6f6c6e11471c5d06f8c24ac396077f893be
  linux-ti-staging-rt_6.12: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/log/?qt=range&q=60431d6c0e260d0b9404bcf325368a88daeef9ca..2bcb6e9caabf65ef182dde7dc0332a7fe53622a2
  linux-ti-staging_6.12: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/log/?qt=range&q=ce4785d01a0b962c7d9cb12f56dbae02514213eb..c94f90807b390a224fd087549b4bd5d84d5fc971

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb  | 2 +-
 meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb            | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb    | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
index 94e4c322..8024c295 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
@@ -6,4 +6,4 @@ PR = "r0"
 
 BRANCH = "ti-u-boot-2025.01"
 
-SRCREV = "743712b9ee4b33cc9739a3cbeb5a8f14ae2ccf35"
+SRCREV = "05d141ca0739756a0cdd7a19268e3ad07279a17e"
diff --git a/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb b/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb
index 4496413e..b22d6fcb 100644
--- a/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb
+++ b/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb
@@ -10,6 +10,6 @@ PV = "0.3+git"
 COMPATIBLE_MACHINE = "k3"
 
 BRANCH ?= "master"
-SRCREV = "2bcd5f52a88ef48f8bb5b7541cf05b10d2008cd7"
+SRCREV = "b35ec6f6c6e11471c5d06f8c24ac396077f893be"
 
 SRC_URI = "git://git.ti.com/git/k3conf/k3conf.git;protocol=https;branch=${BRANCH}"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
index 3dd3f922..9839c308 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
@@ -10,7 +10,7 @@ BRANCH_ARM64 = "ti-linux-6.12.y"
 BRANCH = "${BRANCH_ARM64}"
 
 BRANCH_ARM32 = "ti-rt-linux-6.12.y-arm32"
-SRCREV_ARM32 = "60431d6c0e260d0b9404bcf325368a88daeef9ca"
+SRCREV_ARM32 = "2bcb6e9caabf65ef182dde7dc0332a7fe53622a2"
 PV_ARM32 = "6.12.35+git"
 
 BRANCH:ti33x = "${BRANCH_ARM32}"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
index d36485fb..5fd20494 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
@@ -22,7 +22,7 @@ S = "${UNPACKDIR}/${BB_GIT_DEFAULT_DESTSUFFIX}"
 
 BRANCH ?= "ti-linux-6.12.y"
 
-SRCREV ?= "ce4785d01a0b962c7d9cb12f56dbae02514213eb"
+SRCREV ?= "c94f90807b390a224fd087549b4bd5d84d5fc971"
 PV = "6.12.35+git"
 
 KERNEL_REPRODUCIBILITY_PATCHES = " \
-- 
2.43.5


