Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEA64C54ED1
	for <webhook@archiver.kernel.org>; Fri, 23 May 2025 19:01:03 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.1643.1748026856686959831
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 23 May 2025 12:00:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=rF4hTTLr;
 spf=pass (domain: list.ti.com, ip: 198.47.19.245, mailfrom: lcpdbld@list.ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54NJ0tfv2182893;
	Fri, 23 May 2025 14:00:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1748026855; i=@ti.com;
	bh=92y6RTo82y0V9gRO0ppqVGtIeLdhPRlmRQsrh6QD6Tw=;
	h=From:To:Subject:Date;
	b=rF4hTTLr4nEX1UEbhfmC87cbwA+j1NZIEGYlVOoEEuBlZWDAKypWMzQewSzBRRn3K
	 f2i/6lVlcBMz7oa8UbUAhodWrOHy4HX1ZXxQOL9S1xTc1vuw725RizhEeUWPdKyg+8
	 QywOcAFaoCOol663BX/xjCMiM41rIxx2pT8hIiRE=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54NJ0tIB4036695
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 23 May 2025 14:00:55 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 23
 May 2025 14:00:54 -0500
Received: from fllvsmtp8.itg.ti.com (10.64.41.158) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 23 May 2025 14:00:54 -0500
Received: from fllvdckhpci004.itg.ti.com (fllvdckhpci004.itg.ti.com [10.64.72.21])
	by fllvsmtp8.itg.ti.com (8.15.2/8.15.2) with ESMTP id 54NJ0sQ2096085;
	Fri, 23 May 2025 14:00:54 -0500
Received: by fllvdckhpci004.itg.ti.com (Postfix, from userid 60899)
	id BBFDFE80C2; Fri, 23 May 2025 14:00:54 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202505230901
Date: Fri, 23 May 2025 14:00:54 -0500
Message-ID: <20250523190054.691771-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 23 May 2025 19:01:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18594

Updated the value(s) for:
  cnm-wave-fw: LIC_FILES_CHKSUM
  ti-linux-fw: CNM_WAVE521_FW_VERSION,TI_LINUX_FW_SRCREV
  u-boot-ti-staging_2025.01: SRCREV
  k3conf: SRCREV
  linux-ti-staging_6.12: PV,SRCREV

Changelogs:
  ti-linux-fw: https://git.ti.com/cgit/processor-firmware/ti-linux-firmware/log/?qt=range&q=bffa52a1b8d3318ec86814047025e7c5edf7b7b0..d5a6aed56d76f7a8a7729f0d0b4655b7e623e1c7
  u-boot-ti-staging_2025.01: https://git.ti.com/cgit/ti-u-boot/ti-u-boot/log/?qt=range&q=98b6b3f5a259be864e8db92f4925c3c19c3482a4..3d024809613c2a8f1d69258554ab8954d26537f5
  k3conf: https://git.ti.com/cgit/k3conf/k3conf/log/?qt=range&q=e4a814ff42ef357ee453b6f2f809ecdfa624aa8c..ea9938bf9cafd9c0cb05ef060a713ab4ac72270f
  linux-ti-staging_6.12: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/log/?qt=range&q=013211ccdf5ec33e19652be631b820bc5f6b86a4..d95b7f80f66d104525e6beb002d82a9505b28131

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb      | 2 +-
 meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc         | 4 ++--
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb | 2 +-
 meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb           | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb   | 4 ++--
 5 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb b/meta-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
index 43624183..6a65992f 100644
--- a/meta-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
+++ b/meta-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
@@ -5,7 +5,7 @@ require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
 inherit update-alternatives
 
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENCE.cnm;md5=93b67e6bac7f8fec22b96b8ad0a1a9d0"
+LIC_FILES_CHKSUM = "file://LICENCE.cnm;md5=df3992006621b797e36de43f36336e36"
 
 PV = "${CNM_WAVE521_FW_VERSION}"
 PR = "${INC_PR}.1"
diff --git a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index 925f81fe..adc7afa1 100644
--- a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -13,12 +13,12 @@ PRUETH_FW_AM65X_SR2_VERSION = "02.02.15.04"
 GOODIX_FW_VERSION = "1.0.0.0"
 CADENCE_MHDP_FW_VERSION = "2.1.0"
 IMG_DEC_FW_VERSION = "1.0"
-CNM_WAVE521_FW_VERSION = "1.0.7"
+CNM_WAVE521_FW_VERSION = "1.0.8"
 TI_DM_FW_VERSION = "11.00.09"
 TI_SYSFW_VERSION = "11.00.07"
 TI_HSM_DEMO_FW_VERSION = "11.00.09"
 
-TI_LINUX_FW_SRCREV ?= "bffa52a1b8d3318ec86814047025e7c5edf7b7b0"
+TI_LINUX_FW_SRCREV ?= "d5a6aed56d76f7a8a7729f0d0b4655b7e623e1c7"
 SRCREV = "${TI_LINUX_FW_SRCREV}"
 
 BRANCH ?= "ti-linux-firmware"
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
index fb5dfa73..99a2c8fc 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
@@ -6,4 +6,4 @@ PR = "r0"
 
 BRANCH = "ti-u-boot-2025.01"
 
-SRCREV = "98b6b3f5a259be864e8db92f4925c3c19c3482a4"
+SRCREV = "3d024809613c2a8f1d69258554ab8954d26537f5"
diff --git a/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb b/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb
index 8e83a1aa..8691e523 100644
--- a/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb
+++ b/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb
@@ -10,7 +10,7 @@ PV = "0.3+git"
 COMPATIBLE_MACHINE = "k3"
 
 BRANCH ?= "master"
-SRCREV = "e4a814ff42ef357ee453b6f2f809ecdfa624aa8c"
+SRCREV = "ea9938bf9cafd9c0cb05ef060a713ab4ac72270f"
 
 SRC_URI = "git://git.ti.com/git/k3conf/k3conf.git;protocol=https;branch=${BRANCH}"
 
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
index 535a96f8..f399c207 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
@@ -23,8 +23,8 @@ S = "${WORKDIR}/git"
 
 BRANCH ?= "ti-linux-6.12.y"
 
-SRCREV ?= "013211ccdf5ec33e19652be631b820bc5f6b86a4"
-PV = "6.12.23+git"
+SRCREV ?= "d95b7f80f66d104525e6beb002d82a9505b28131"
+PV = "6.12.24+git"
 
 # Special configuration for remoteproc/rpmsg IPC modules
 module_conf_rpmsg_client_sample = "blacklist rpmsg_client_sample"
-- 
2.43.5


