Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 030D1C282DE
	for <webhook@archiver.kernel.org>; Fri, 14 Mar 2025 00:13:11 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.2495.1741911189035627054
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 13 Mar 2025 17:13:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=oKcS4zV1;
 spf=pass (domain: list.ti.com, ip: 198.47.23.234, mailfrom: lcpdbld@list.ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52E0D7Kh1523005
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 13 Mar 2025 19:13:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741911187; i=@ti.com;
	bh=NwaVlnN1EbNV9bJJRJ7ZfSL4cNTc5FlgubICYa/hgmI=;
	h=From:To:Subject:Date;
	b=oKcS4zV19v4uEMtGZOVbuBVf48wVBpi9PBH+OoCadkslMLLEvATXVUpboj+WScDNY
	 KXTzO1n7EYwgwF1D0qh4HydKsKc1Gew8HsVUwJDbYMgqpo9FJRqnjE0RWcPZJKgPB8
	 Qq89G9tlIH8S0O0BjZdP8UpmnoPmSCIFBgNIc4yE=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52E0D7L5013478;
	Thu, 13 Mar 2025 19:13:07 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 13
 Mar 2025 19:13:06 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 13 Mar 2025 19:13:07 -0500
Received: from fllvdckhpci004.itg.ti.com (fllvdckhpci004.itg.ti.com [10.64.72.21])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52E0D6gw116330;
	Thu, 13 Mar 2025 19:13:06 -0500
Received: by fllvdckhpci004.itg.ti.com (Postfix, from userid 60899)
	id B8F7524E9; Thu, 13 Mar 2025 19:13:06 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202503131348
Date: Thu, 13 Mar 2025 19:13:06 -0500
Message-ID: <20250314001306.1460348-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 14 Mar 2025 00:13:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18382

Updated the value(s) for:
  ti-linux-fw: PRUETH_FW_AM65X_SR2_VERSION,TI_LINUX_FW_SRCREV,TI_SYSFW_VERSION
  atf: SRCREV_tfa
  u-boot-ti-staging_2025.01: SRCREV
  linux-ti-staging_6.12: SRCREV

Changelogs:
  ti-linux-fw: https://git.ti.com/cgit/processor-firmware/ti-linux-firmware/log/?qt=range&q=e089c2f8db0577aa4acd3b3ef3ab229be2e804e1..1faf5974a93eb35ac31ed27e5693739edb08824c
  u-boot-ti-staging_2025.01: https://git.ti.com/cgit/ti-u-boot/ti-u-boot/log/?qt=range&q=baf3aaa8ecfa20b9d9f497621b6c11915223f502..c8badfb165815c648052309418987f302e48aeef
  linux-ti-staging_6.12: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/log/?qt=range&q=1a22c2fb64485a5dea9a9247eb007ddd4ea8a81d..8c8cc002ab65149491f9b75cadfaeb2342150800

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc         | 6 +++---
 .../trusted-firmware-a/trusted-firmware-a-ti.inc            | 2 +-
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb   | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index f9773dad..2aad1c03 100644
--- a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -9,15 +9,15 @@ INC_PR = "r4"
 # Firmware versions
 CORESDK_RTOS_VERSION = "08.02.00.04"
 PRUETH_FW_AM65X_VERSION = "08.00.00.20"
-PRUETH_FW_AM65X_SR2_VERSION = "02.02.15.02"
+PRUETH_FW_AM65X_SR2_VERSION = "02.02.15.04"
 GOODIX_FW_VERSION = "1.0.0.0"
 CADENCE_MHDP_FW_VERSION = "2.1.0"
 IMG_DEC_FW_VERSION = "1.0"
 CNM_WAVE521_FW_VERSION = "1.0.7"
 TI_DM_FW_VERSION = "11.00.06"
-TI_SYSFW_VERSION = "11.00.06"
+TI_SYSFW_VERSION = "11.00.07"
 
-TI_LINUX_FW_SRCREV ?= "e089c2f8db0577aa4acd3b3ef3ab229be2e804e1"
+TI_LINUX_FW_SRCREV ?= "1faf5974a93eb35ac31ed27e5693739edb08824c"
 SRCREV = "${TI_LINUX_FW_SRCREV}"
 
 BRANCH ?= "ti-linux-firmware"
diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
index ff8c09fc..95d31e68 100644
--- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
@@ -1,7 +1,7 @@
 # NOTE: This .inc file with customizations only gets included for K3 platforms
 
 PV = "2.12+git"
-SRCREV_tfa = "dd46885ec58f9394b37f0c3d957e79838999b79d"
+SRCREV_tfa = "2ae655f0f77a540c2b935780cccb1f150350f84f"
 SRC_URI_TRUSTED_FIRMWARE_A = "git://github.com/TexasInstruments/arm-trusted-firmware.git;protocol=https"
 SRCBRANCH = "ti-master"
 SRC_URI = "${SRC_URI_TRUSTED_FIRMWARE_A};name=tfa;branch=${SRCBRANCH}"
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
index 8fea6396..f23a9f1d 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
@@ -6,4 +6,4 @@ PR = "r0"
 
 BRANCH = "ti-u-boot-2025.01"
 
-SRCREV = "baf3aaa8ecfa20b9d9f497621b6c11915223f502"
+SRCREV = "c8badfb165815c648052309418987f302e48aeef"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
index c66bec91..5319dc1c 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
@@ -23,7 +23,7 @@ S = "${WORKDIR}/git"
 
 BRANCH ?= "ti-linux-6.12.y"
 
-SRCREV ?= "1a22c2fb64485a5dea9a9247eb007ddd4ea8a81d"
+SRCREV ?= "8c8cc002ab65149491f9b75cadfaeb2342150800"
 PV = "6.12.17+git"
 
 # Special configuration for remoteproc/rpmsg IPC modules
-- 
2.43.5


