Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6B80C021AA
	for <webhook@archiver.kernel.org>; Tue, 18 Feb 2025 22:02:48 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.8807.1739916166430459790
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 18 Feb 2025 14:02:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=yHS2Z7yT;
 spf=pass (domain: list.ti.com, ip: 198.47.19.245, mailfrom: lcpdbld@list.ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51IM2iDP1637843
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 18 Feb 2025 16:02:44 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1739916164; i=@ti.com;
	bh=weAGfxZ8WDbEAjMtpDvZQn/GUKFAqHrFmImkzn8a8bk=;
	h=From:To:Subject:Date;
	b=yHS2Z7yTWiycy7Oc6EnirJJTnPUS1R3t2ERPcY+SafyDfUOgEh9gWq6NPTg+1Xlea
	 hll2hawMTCSIaWlVy4ILg8JL8hOoUWSHCDwfTffJPrLLqSiTkrz+I+0Xqo5q6/S4H+
	 HzI717WjeUDIk93tJXtebD0enwo9HzeiwFP6xvOs=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51IM2iSs053317;
	Tue, 18 Feb 2025 16:02:44 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 18
 Feb 2025 16:02:44 -0600
Received: from fllvsmtp8.itg.ti.com (10.64.41.158) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 18 Feb 2025 16:02:44 -0600
Received: from fllvdckhpci004.itg.ti.com (fllvdckhpci004.itg.ti.com [10.64.72.21])
	by fllvsmtp8.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51IM2iwQ063291;
	Tue, 18 Feb 2025 16:02:44 -0600
Received: by fllvdckhpci004.itg.ti.com (Postfix, from userid 60899)
	id EB8EF138215; Tue, 18 Feb 2025 16:02:43 -0600 (CST)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202502181346
Date: Tue, 18 Feb 2025 16:02:43 -0600
Message-ID: <20250218220243.3277622-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 18 Feb 2025 22:02:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18326

Updated the value(s) for:
  ti-linux-fw: TI_LINUX_FW_SRCREV
  u-boot-ti-staging_2025.01: SRCREV
  linux-ti-staging_6.12: SRCREV

Changelogs:
  ti-linux-fw: https://git.ti.com/cgit/processor-firmware/ti-linux-firmware/log/?qt=range&q=7fbc75f80161a400a4b9c618b6191d72ab408def..e38a05e2ef5f6a6f2387742864042beba01972bb
  u-boot-ti-staging_2025.01: https://git.ti.com/cgit/ti-u-boot/ti-u-boot/log/?qt=range&q=4e9c90ad8b12cc5b4fdd1308bc3ac3e4fc869aab..9c89e8b0a82fabe55c6366aa65eb987f05bb4472
  linux-ti-staging_6.12: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/log/?qt=range&q=8906665ace32eb0dc12810667ee8646bd660c374..6423e6bb6191982da1c09a21a46c68b494f5b1b5

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc         | 2 +-
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index 1347fd99..f3db9bd7 100644
--- a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -17,7 +17,7 @@ CNM_WAVE521_FW_VERSION = "1.0.7"
 TI_DM_FW_VERSION = "10.01.03"
 TI_SYSFW_VERSION = "10.01.08"
 
-TI_LINUX_FW_SRCREV ?= "7fbc75f80161a400a4b9c618b6191d72ab408def"
+TI_LINUX_FW_SRCREV ?= "e38a05e2ef5f6a6f2387742864042beba01972bb"
 SRCREV = "${TI_LINUX_FW_SRCREV}"
 
 BRANCH ?= "ti-linux-firmware"
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
index 5e56d2db..183b33db 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
@@ -6,4 +6,4 @@ PR = "r0"
 
 BRANCH = "ti-u-boot-2025.01"
 
-SRCREV = "4e9c90ad8b12cc5b4fdd1308bc3ac3e4fc869aab"
+SRCREV = "9c89e8b0a82fabe55c6366aa65eb987f05bb4472"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
index 88c41ac5..170b0f0b 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
@@ -23,7 +23,7 @@ S = "${WORKDIR}/git"
 
 BRANCH ?= "ti-linux-6.12.y"
 
-SRCREV ?= "8906665ace32eb0dc12810667ee8646bd660c374"
+SRCREV ?= "6423e6bb6191982da1c09a21a46c68b494f5b1b5"
 PV = "6.12.9+git"
 
 KERNEL_REPRODUCIBILITY_PATCHES = " \
-- 
2.43.5


