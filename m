Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 756F2C3DA7F
	for <webhook@archiver.kernel.org>; Mon,  5 Aug 2024 10:44:26 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.5201.1722854664914133986
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 05 Aug 2024 03:44:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=nbYcX+wI;
 spf=pass (domain: list.ti.com, ip: 198.47.23.248, mailfrom: lcpdbld@list.ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 475AiNDP058427;
	Mon, 5 Aug 2024 05:44:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1722854663; i=@ti.com;
	bh=lDBGqJmp1N9oEMq5ZrudV5nivZjLXEU78c19QYs3rLg=;
	h=From:To:Subject:Date;
	b=nbYcX+wIU2Mn639C3mSj6ysCuB8EjbL0YzhILXgVbecpONP3ZM9JJ6Vnd1KjrKDHg
	 OAtp3RtNcKLHvOIhCVGEpfMlGafXvVr9rIoFaoA70F2deTqWyhyND7j+f/VzHxrNd2
	 GTvTGTIuHM73GfEgpXiLcYux3Iqpd3s02qywkxIE=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 475AiNb7106791
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 5 Aug 2024 05:44:23 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 5
 Aug 2024 05:44:23 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 5 Aug 2024 05:44:23 -0500
Received: from fllvdckhpci004.itg.ti.com (fllvdckhpci004.itg.ti.com [10.248.130.8])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 475AiNVR106779;
	Mon, 5 Aug 2024 05:44:23 -0500
Received: by fllvdckhpci004.itg.ti.com (Postfix, from userid 60899)
	id 23C5510AC0D6; Mon,  5 Aug 2024 05:44:23 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202408050100
Date: Mon, 5 Aug 2024 05:44:23 -0500
Message-ID: <1722854663-30348-1-git-send-email-lcpdbld@list.ti.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 05 Aug 2024 10:44:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17924

Updated the value(s) for:
  ti-linux-fw: PRUETH_FW_AM65X_SR2_VERSION,TI_LINUX_FW_SRCREV,TI_SYSFW_VERSION
  u-boot-ti-staging_2024.04: SRCREV
  k3conf: SRCREV
  linux-ti-staging-rt_6.6: SRCREV
  linux-ti-staging_6.6: SRCREV

Changelogs:
  ti-linux-fw: https://git.ti.com/cgit/processor-firmware/ti-linux-firmware/log/?qt=range&q=af745923679b12f9872ed43e510e74335149de1c..35fa44a93549d8d91b1c37a7b9f8767dbe7d37eb
  u-boot-ti-staging_2024.04: https://git.ti.com/cgit/ti-u-boot/ti-u-boot/log/?qt=range&q=79b13d5cb02d619cfb1842ee28ea2e7b77be54cc..818c76aed67f94059b9ebb94d237418802620b81
  k3conf: https://git.ti.com/cgit/k3conf/k3conf/log/?qt=range&q=85a7433202aafafbccea8a7b2491f4df8b1ecd80..30a1d5b2d08c0da39d4e62b3ebee591a9882fa21
  linux-ti-staging-rt_6.6: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/log/?qt=range&q=30b405326c30368375e58551f85c9e531ec4aef2..f9bceb7343387ac6fab003518f1cd31987d6eb05
  linux-ti-staging_6.6: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/log/?qt=range&q=15f828fd0fc706919f64551afbe431eb66ba927f..db88712931433e92a5f73cec57c82c5c7ebee593

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc         | 6 +++---
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2024.04.bb | 2 +-
 meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb           | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.6.bb | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb    | 2 +-
 5 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index ef6be86..126edf3 100644
--- a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -9,15 +9,15 @@ INC_PR = "r4"
 # Firmware versions
 CORESDK_RTOS_VERSION = "08.02.00.04"
 PRUETH_FW_AM65X_VERSION = "08.00.00.20"
-PRUETH_FW_AM65X_SR2_VERSION = "02.02.14.00"
+PRUETH_FW_AM65X_SR2_VERSION = "02.02.14.03"
 GOODIX_FW_VERSION = "1.0.0.0"
 CADENCE_MHDP_FW_VERSION = "2.1.0"
 IMG_DEC_FW_VERSION = "1.0"
 CNM_WAVE521_FW_VERSION = "1.0.4"
 TI_DM_FW_VERSION = "10.00.05"
-TI_SYSFW_VERSION = "10.00.04"
+TI_SYSFW_VERSION = "10.00.08"
 
-TI_LINUX_FW_SRCREV ?= "af745923679b12f9872ed43e510e74335149de1c"
+TI_LINUX_FW_SRCREV ?= "35fa44a93549d8d91b1c37a7b9f8767dbe7d37eb"
 SRCREV = "${TI_LINUX_FW_SRCREV}"
 
 BRANCH ?= "ti-linux-firmware"
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2024.04.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2024.04.bb
index a837863..a873488 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2024.04.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2024.04.bb
@@ -6,4 +6,4 @@ PR = "r0"
 
 BRANCH = "ti-u-boot-2024.04"
 
-SRCREV = "79b13d5cb02d619cfb1842ee28ea2e7b77be54cc"
+SRCREV = "818c76aed67f94059b9ebb94d237418802620b81"
diff --git a/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb b/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb
index c8da667..77094c8 100644
--- a/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb
+++ b/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb
@@ -10,7 +10,7 @@ PV = "0.3+git"
 COMPATIBLE_MACHINE = "k3"
 
 BRANCH ?= "master"
-SRCREV = "85a7433202aafafbccea8a7b2491f4df8b1ecd80"
+SRCREV = "30a1d5b2d08c0da39d4e62b3ebee591a9882fa21"
 
 SRC_URI = "git://git.ti.com/git/k3conf/k3conf.git;protocol=https;branch=${BRANCH}"
 
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.6.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.6.bb
index 5f681a8..29607b2 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.6.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.6.bb
@@ -8,7 +8,7 @@ FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}-6.6:"
 
 BRANCH = "ti-rt-linux-6.6.y"
 
-SRCREV = "30b405326c30368375e58551f85c9e531ec4aef2"
+SRCREV = "f9bceb7343387ac6fab003518f1cd31987d6eb05"
 
 include ${@ 'recipes-kernel/linux/ti-extras-rt.inc' if d.getVar('TI_EXTRAS') else ''}
 
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb
index 2288cef..341a4cc 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb
@@ -23,7 +23,7 @@ S = "${WORKDIR}/git"
 
 BRANCH ?= "ti-linux-6.6.y"
 
-SRCREV ?= "15f828fd0fc706919f64551afbe431eb66ba927f"
+SRCREV ?= "db88712931433e92a5f73cec57c82c5c7ebee593"
 PV = "6.6.32+git"
 
 KERNEL_GIT_URI ?= "git://git.ti.com/git/ti-linux-kernel/ti-linux-kernel.git"
-- 
1.8.3.1


