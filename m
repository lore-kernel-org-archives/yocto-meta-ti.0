Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDAAEC71148
	for <webhook@archiver.kernel.org>; Thu, 12 Jun 2025 23:58:38 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.9077.1749772711784896683
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 12 Jun 2025 16:58:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=MqTAeaB4;
 spf=pass (domain: list.ti.com, ip: 198.47.19.245, mailfrom: lcpdbld@list.ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55CNwUTt2988751;
	Thu, 12 Jun 2025 18:58:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1749772710; i=@ti.com;
	bh=tEOXSTwAPE6ACygsym66Y+YFTzg6qyHBfT51dGFlouM=;
	h=From:To:Subject:Date;
	b=MqTAeaB4zQYIZLrH9lw5V55Lc2Dl36XBzq537pThlOQCmmQNqwU7CX1v8UmP9wYvM
	 xQujXCbLHqE1FbiUneVBHozH9WXSBefWVWQ9/JrtyedBMEjf2+AF4qNteBKX1xI78N
	 U8/e6hWzwU0Gl7x0jHx4qOm5MXewKzk3bWfYM3Rc=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55CNwUjC2184921
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 12 Jun 2025 18:58:30 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 12
 Jun 2025 18:58:29 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 12 Jun 2025 18:58:29 -0500
Received: from fllvdckhpci004.itg.ti.com (fllvdckhpci004.itg.ti.com [10.64.72.21])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55CNwTch965152;
	Thu, 12 Jun 2025 18:58:29 -0500
Received: by fllvdckhpci004.itg.ti.com (Postfix, from userid 60899)
	id 9307D2356; Thu, 12 Jun 2025 18:58:29 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202506121146
Date: Thu, 12 Jun 2025 18:58:29 -0500
Message-ID: <20250612235829.1342698-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 12 Jun 2025 23:58:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18644

Updated the value(s) for:
  ti-linux-fw: TI_LINUX_FW_SRCREV,TI_SYSFW_VERSION
  u-boot-ti-staging_2025.01: SRCREV
  linux-ti-staging_6.12: PV,SRCREV

Changelogs:
  ti-linux-fw: https://git.ti.com/cgit/processor-firmware/ti-linux-firmware/log/?qt=range&q=1ea29f4b3ec17bdc1a3431a014ea5224962dc779..a37c82f0e25e0e3c99fdf03f1d57f7b08314a2bc
  u-boot-ti-staging_2025.01: https://git.ti.com/cgit/ti-u-boot/ti-u-boot/log/?qt=range&q=c9c21ce31fc557c2f43c4991fcc0a11b1fd90a12..da601a5231bf1b053a35c94c5d57a5658ce2e4e7
  linux-ti-staging_6.12: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/log/?qt=range&q=20778f6c125dc24e62767dc4837d793a0f18c319..251ed68a96e3f85a5db174c9c39dc334c0f0ba5f

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc         | 4 ++--
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb   | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index 3c9836a0..d1dd9df3 100644
--- a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -15,10 +15,10 @@ CADENCE_MHDP_FW_VERSION = "2.1.0"
 IMG_DEC_FW_VERSION = "1.0"
 CNM_WAVE521_FW_VERSION = "1.0.8"
 TI_DM_FW_VERSION = "11.00.09"
-TI_SYSFW_VERSION = "11.00.07"
+TI_SYSFW_VERSION = "11.01.00"
 TI_HSM_DEMO_FW_VERSION = "11.00.09"
 
-TI_LINUX_FW_SRCREV ?= "1ea29f4b3ec17bdc1a3431a014ea5224962dc779"
+TI_LINUX_FW_SRCREV ?= "a37c82f0e25e0e3c99fdf03f1d57f7b08314a2bc"
 SRCREV = "${TI_LINUX_FW_SRCREV}"
 
 BRANCH ?= "ti-linux-firmware"
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
index 3ffbcd01..c1a1ad53 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
@@ -6,4 +6,4 @@ PR = "r0"
 
 BRANCH = "ti-u-boot-2025.01"
 
-SRCREV = "c9c21ce31fc557c2f43c4991fcc0a11b1fd90a12"
+SRCREV = "da601a5231bf1b053a35c94c5d57a5658ce2e4e7"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
index 277c6769..be3274dd 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
@@ -23,8 +23,8 @@ S = "${WORKDIR}/git"
 
 BRANCH ?= "ti-linux-6.12.y"
 
-SRCREV ?= "20778f6c125dc24e62767dc4837d793a0f18c319"
-PV = "6.12.24+git"
+SRCREV ?= "251ed68a96e3f85a5db174c9c39dc334c0f0ba5f"
+PV = "6.12.33+git"
 
 # Special configuration for remoteproc/rpmsg IPC modules
 module_conf_rpmsg_client_sample = "blacklist rpmsg_client_sample"
-- 
2.43.5


