Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2E35C021AD
	for <webhook@archiver.kernel.org>; Thu, 20 Feb 2025 04:17:39 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.42410.1740025058636474551
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 19 Feb 2025 20:17:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=W/mBev1t;
 spf=pass (domain: list.ti.com, ip: 198.47.19.245, mailfrom: lcpdbld@list.ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51K4Ha2A2028583
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 19 Feb 2025 22:17:36 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1740025056; i=@ti.com;
	bh=LipB19B+W8tTxn/SHFE63nQMKmUDVqGX5mmaxKX+Gh4=;
	h=From:To:Subject:Date;
	b=W/mBev1tNMIhYojClgMXBQCjU30DPw5FROdvD40fNVybucUQT6sCSV7jzl6WyN46B
	 IU6ORxP+2DR3LJUukGev12nFLifYN/uizz+MPlGIzebTxBN54dWbm7ri39NZq+7OOl
	 8SEt4BVTJUtFu4rFUQw2o6odh9iMxOYupNpOTzv8=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51K4HarA006244
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 19 Feb 2025 22:17:36 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 19
 Feb 2025 22:17:35 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 19 Feb 2025 22:17:35 -0600
Received: from fllvdckhpci004.itg.ti.com (fllvdckhpci004.itg.ti.com [10.64.72.21])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51K4HZEa118874;
	Wed, 19 Feb 2025 22:17:35 -0600
Received: by fllvdckhpci004.itg.ti.com (Postfix, from userid 60899)
	id CCF6913821A; Wed, 19 Feb 2025 22:17:35 -0600 (CST)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202502191800
Date: Wed, 19 Feb 2025 22:17:35 -0600
Message-ID: <20250220041735.3378202-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 20 Feb 2025 04:17:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18330

Updated the value(s) for:
  ti-linux-fw: PRUETH_FW_AM65X_SR2_VERSION,TI_LINUX_FW_SRCREV
  u-boot-ti-staging_2025.01: SRCREV
  linux-ti-staging_6.12: PV,SRCREV

Changelogs:
  ti-linux-fw: https://git.ti.com/cgit/processor-firmware/ti-linux-firmware/log/?qt=range&q=e38a05e2ef5f6a6f2387742864042beba01972bb..2ba3fe65a367288d68cdb6768938559aa9ccbedc
  u-boot-ti-staging_2025.01: https://git.ti.com/cgit/ti-u-boot/ti-u-boot/log/?qt=range&q=9c89e8b0a82fabe55c6366aa65eb987f05bb4472..4d6c49e808b86832ba198e8884226e2ee959d229
  linux-ti-staging_6.12: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/log/?qt=range&q=6423e6bb6191982da1c09a21a46c68b494f5b1b5..cab6cafd320b575d69c2425580633deeb0b4396c

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc         | 4 ++--
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb   | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index f3db9bd7..e8047b6f 100644
--- a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -9,7 +9,7 @@ INC_PR = "r4"
 # Firmware versions
 CORESDK_RTOS_VERSION = "08.02.00.04"
 PRUETH_FW_AM65X_VERSION = "08.00.00.20"
-PRUETH_FW_AM65X_SR2_VERSION = "02.02.15.00"
+PRUETH_FW_AM65X_SR2_VERSION = "02.02.15.02"
 GOODIX_FW_VERSION = "1.0.0.0"
 CADENCE_MHDP_FW_VERSION = "2.1.0"
 IMG_DEC_FW_VERSION = "1.0"
@@ -17,7 +17,7 @@ CNM_WAVE521_FW_VERSION = "1.0.7"
 TI_DM_FW_VERSION = "10.01.03"
 TI_SYSFW_VERSION = "10.01.08"
 
-TI_LINUX_FW_SRCREV ?= "e38a05e2ef5f6a6f2387742864042beba01972bb"
+TI_LINUX_FW_SRCREV ?= "2ba3fe65a367288d68cdb6768938559aa9ccbedc"
 SRCREV = "${TI_LINUX_FW_SRCREV}"
 
 BRANCH ?= "ti-linux-firmware"
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
index 183b33db..6590d7a6 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
@@ -6,4 +6,4 @@ PR = "r0"
 
 BRANCH = "ti-u-boot-2025.01"
 
-SRCREV = "9c89e8b0a82fabe55c6366aa65eb987f05bb4472"
+SRCREV = "4d6c49e808b86832ba198e8884226e2ee959d229"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
index f7bf0b5d..359c8fdd 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
@@ -23,8 +23,8 @@ S = "${WORKDIR}/git"
 
 BRANCH ?= "ti-linux-6.12.y"
 
-SRCREV ?= "6423e6bb6191982da1c09a21a46c68b494f5b1b5"
-PV = "6.12.9+git"
+SRCREV ?= "cab6cafd320b575d69c2425580633deeb0b4396c"
+PV = "6.12.13+git"
 
 # Special configuration for remoteproc/rpmsg IPC modules
 module_conf_rpmsg_client_sample = "blacklist rpmsg_client_sample"
-- 
2.43.5


