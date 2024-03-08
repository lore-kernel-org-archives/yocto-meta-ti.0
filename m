Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91D68C54E58
	for <webhook@archiver.kernel.org>; Fri,  8 Mar 2024 00:08:03 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.9003.1709856476550519130
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 07 Mar 2024 16:07:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=SC9WWwxz;
 spf=pass (domain: list.ti.com, ip: 198.47.23.249, mailfrom: lcpdbld@list.ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 42807tm8007605;
	Thu, 7 Mar 2024 18:07:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1709856475; i=@ti.com;
	bh=us9DioiWW7a/R1uBHk61n72QqciR7WhyEBc4FDHa9Ws=;
	h=From:To:Subject:Date;
	b=SC9WWwxz6uRFogsiSWsHXuc0OSDZLDlzZFEiCi7KD+7U0qaaQxFtw/tyYXuNVjjKH
	 IqYLW3h5SHjcvF/PN5cdz9SVaCajjG9k73APeg5ze/xBxZmcuVG+mrqc2ZqnkiQDbW
	 6J6BOzcG1/hSi873Z6F1g1OS6YF+/OvS4iX37p4s=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 42807tgo120579
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 7 Mar 2024 18:07:55 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 7
 Mar 2024 18:07:54 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 7 Mar 2024 18:07:54 -0600
Received: from fllvdckhpci004.itg.ti.com (fllvdckhpci004.itg.ti.com [10.248.130.8])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 42807sSL124902;
	Thu, 7 Mar 2024 18:07:54 -0600
Received: by fllvdckhpci004.itg.ti.com (Postfix, from userid 60899)
	id D5BD410EE883; Thu,  7 Mar 2024 18:07:54 -0600 (CST)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][kirkstone][PATCH] CI/CD Auto-Merger: cicd.kirkstone.202403071346
Date: Thu, 7 Mar 2024 18:07:54 -0600
Message-ID: <1709856474-68209-1-git-send-email-lcpdbld@list.ti.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 08 Mar 2024 00:08:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17503

Updated the value(s) for:
  ti-linux-fw: TI_LINUX_FW_SRCREV
  u-boot-ti-staging_2023.04: SRCREV
  k3conf: SRCREV
  linux-ti-staging-rt_6.1: PV,SRCREV
  linux-ti-staging_6.1: PV,SRCREV

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc         | 2 +-
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb | 2 +-
 meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb           | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.1.bb | 4 ++--
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb    | 4 ++--
 5 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index 09ab514..347a97f 100644
--- a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -17,7 +17,7 @@ CNM_WAVE521_FW_VERSION = "1.0.3"
 TI_DM_FW_VERSION = "09.02.04"
 TI_SYSFW_VERSION = "09.02.05"
 
-TI_LINUX_FW_SRCREV ?= "0ac29b7745bfa507b07fd99237b916497113ac9d"
+TI_LINUX_FW_SRCREV ?= "1ab38f4882f0b257377dbd22bbf544b046d7faac"
 SRCREV = "${TI_LINUX_FW_SRCREV}"
 
 BRANCH ?= "ti-linux-firmware"
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb
index 7b06106..be1fb85 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb
@@ -6,4 +6,4 @@ PR = "r0"
 
 BRANCH = "ti-u-boot-2023.04"
 
-SRCREV = "0822c70e575b19506287c1e62b3bf5d2794cd40e"
+SRCREV = "dbb6e4280dfa53faaa1c04f5ddd22f9f068d0428"
diff --git a/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb b/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb
index f7a38da..76088ea 100644
--- a/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb
+++ b/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb
@@ -10,7 +10,7 @@ PV = "0.3+git${SRCPV}"
 COMPATIBLE_MACHINE = "k3"
 
 BRANCH ?= "master"
-SRCREV = "cadf72379c7eec7e69031cc939d5a85f209017d6"
+SRCREV = "85a7433202aafafbccea8a7b2491f4df8b1ecd80"
 
 SRC_URI = "git://git.ti.com/git/k3conf/k3conf.git;protocol=https;branch=${BRANCH}"
 
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.1.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.1.bb
index 111981d..a4aa2cd 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.1.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.1.bb
@@ -8,8 +8,8 @@ FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}-6.1:"
 
 BRANCH = "ti-rt-linux-6.1.y"
 
-SRCREV = "16683766adce1c66579c8071a1db8c70c1ab0758"
+SRCREV = "31dc6b6f9309afec8555a584ff1ea5e3f18a30e9"
 
 include ${@ 'recipes-kernel/linux/ti-extras-rt.inc' if d.getVar('TI_EXTRAS') else ''}
 
-PV = "6.1.69+git${SRCPV}"
+PV = "6.1.80+git${SRCPV}"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
index 6175350..e168c92 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
@@ -23,8 +23,8 @@ S = "${WORKDIR}/git"
 
 BRANCH ?= "ti-linux-6.1.y"
 
-SRCREV ?= "0ccfdb3fe66551031a7a112f6ff668f9683ef725"
-PV = "6.1.69+git${SRCPV}"
+SRCREV ?= "a6174d6c4ff531039c677079321888a9a3f9951c"
+PV = "6.1.80+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
 MACHINE_KERNEL_PR:append = "b"
-- 
1.8.3.1


