Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99B48CAC59A
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 23:27:52 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.3086.1758238070217305277
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 18 Sep 2025 16:27:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=SncyUlT4;
 spf=pass (domain: list.ti.com, ip: 198.47.23.235, mailfrom: lcpdbld@list.ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58INRn4W586355;
	Thu, 18 Sep 2025 18:27:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758238069; i=@ti.com;
	bh=MEj58SmPC7Ypzc/xaJuCWSPMOkJh5nEs2j+W6D2PjNM=;
	h=From:To:Subject:Date;
	b=SncyUlT4tqIs9p0t0lXA9Ic+WzWjsaRh7XIBc+jVYUh1gAC107PCgaL0oBI3cimkc
	 q3bZBp0RmOD5jfj8yRAwPwRhhb6wzhQ5jglFIHEn3WCD1NW0ObzdOwSMxqPCfwgQog
	 KIyhF0cabenOo6zpYwEarky3UkgvOx/id46vBssc=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58INRnXi3498781
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 18 Sep 2025 18:27:49 -0500
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 18
 Sep 2025 18:27:48 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 18 Sep 2025 18:27:48 -0500
Received: from fllvdckhpci102.itg.ti.com (fllvdckhpci102.itg.ti.com [10.64.72.97])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58INRmSF4134218;
	Thu, 18 Sep 2025 18:27:48 -0500
Received: by fllvdckhpci102.itg.ti.com (Postfix, from userid 60899)
	id 95C06136625; Thu, 18 Sep 2025 18:27:48 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202509181257
Date: Thu, 18 Sep 2025 18:27:48 -0500
Message-ID: <20250918232748.1813441-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 18 Sep 2025 23:27:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19041

Updated the value(s) for:
  atf: SRCREV_tfa:am62lxx
  u-boot-ti-staging_2025.01: SRCREV
  k3conf: SRCREV
  linux-ti-staging-rt_6.12: SRCREV_ARM32
  linux-ti-staging_6.12: SRCREV

Changelogs:
  u-boot-ti-staging_2025.01: https://git.ti.com/cgit/ti-u-boot/ti-u-boot/log/?qt=range&q=3c06cd621447331aeab0bbb2e5c063a2b1d79d1b..91c8a62c788c2d0efb733296336bf0e658727faf
  k3conf: https://git.ti.com/cgit/k3conf/k3conf/log/?qt=range&q=6dd352f234ef19c5cb92c924101e1eab29d2939a..f63ccd27cba9550de04e8dbb04bc6003d8b5168e
  linux-ti-staging-rt_6.12: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/log/?qt=range&q=4235794ce373baf55d9ff5cf920b1d44b7e31455..e2b759994f9ed141d13b2f7a3ae8b9c51eb7e295
  linux-ti-staging_6.12: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/log/?qt=range&q=af3896fca24b7945db015d2ac411ef50e93a11c9..ccfe8fee8026cbb23dcd9c69a2bd961c99c58567

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc    | 2 +-
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb     | 2 +-
 meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb               | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb    | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb       | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
index ffed4b2e..fdab93d8 100644
--- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
@@ -8,7 +8,7 @@ SRC_URI_TRUSTED_FIRMWARE_A = "git://git.trustedfirmware.org/TF-A/trusted-firmwar
 SRCBRANCH = "master"
 
 LIC_FILES_CHKSUM:am62lxx = "file://docs/license.rst;md5=1118e32884721c0be33267bd7ae11130"
-SRCREV_tfa:am62lxx = "229d03adf659b06e5ae9577dc219ac93de6280dc"
+SRCREV_tfa:am62lxx = "abb57dd3c9b38718caa63df711d9675e2bc7e789"
 SRC_URI_TRUSTED_FIRMWARE_A:am62lxx = "git://github.com/TexasInstruments/arm-trusted-firmware.git;protocol=https"
 SRCBRANCH:am62lxx = "ti-master"
 
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
index 12786c32..4d938ce3 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
@@ -6,4 +6,4 @@ PR = "r0"
 
 BRANCH = "ti-u-boot-2025.01"
 
-SRCREV = "3c06cd621447331aeab0bbb2e5c063a2b1d79d1b"
+SRCREV = "91c8a62c788c2d0efb733296336bf0e658727faf"
diff --git a/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb b/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb
index 2bacf173..761f5c5d 100644
--- a/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb
+++ b/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb
@@ -10,7 +10,7 @@ PV = "0.3+git"
 COMPATIBLE_MACHINE = "k3"
 
 BRANCH ?= "master"
-SRCREV = "6dd352f234ef19c5cb92c924101e1eab29d2939a"
+SRCREV = "f63ccd27cba9550de04e8dbb04bc6003d8b5168e"
 
 SRC_URI = "git://git.ti.com/git/k3conf/k3conf.git;protocol=https;branch=${BRANCH}"
 
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
index a9a1f440..a6adaacc 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
@@ -10,7 +10,7 @@ BRANCH_ARM64 = "ti-linux-6.12.y"
 BRANCH = "${BRANCH_ARM64}"
 
 BRANCH_ARM32 = "ti-rt-linux-6.12.y-arm32"
-SRCREV_ARM32 = "4235794ce373baf55d9ff5cf920b1d44b7e31455"
+SRCREV_ARM32 = "e2b759994f9ed141d13b2f7a3ae8b9c51eb7e295"
 PV_ARM32 = "6.12.43+git"
 
 BRANCH:ti33x = "${BRANCH_ARM32}"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
index 838b81ed..304b9f71 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
@@ -22,7 +22,7 @@ S = "${WORKDIR}/git"
 
 BRANCH ?= "ti-linux-6.12.y"
 
-SRCREV ?= "af3896fca24b7945db015d2ac411ef50e93a11c9"
+SRCREV ?= "ccfe8fee8026cbb23dcd9c69a2bd961c99c58567"
 PV = "6.12.43+git"
 
 # Special configuration for remoteproc/rpmsg IPC modules
-- 
2.43.5


