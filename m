Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F3EFC2BA1B
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 19:55:33 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.19825.1741722931694976794
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 11 Mar 2025 12:55:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=kQ3ANfFP;
 spf=pass (domain: list.ti.com, ip: 198.47.19.246, mailfrom: lcpdbld@list.ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52BJtURw1282885
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 11 Mar 2025 14:55:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741722930; i=@ti.com;
	bh=KIcGt78jv7eYYRpXFh7vobhguL1xt4JBs8amb0E792I=;
	h=From:To:Subject:Date;
	b=kQ3ANfFPHho7onJBZ3/CGpwxZSEzzjxORboNFjP6QBzs1CeA3s5aO/sFjenPK/jML
	 CNeSY7E2tNeqOrqF8s5LpKFPFseWoKUKWi3R9PAIQWVoRDJBjURMeIo99eqgu1SDdf
	 Z1sArkhVRMM5+zGH3itaTdEhDhAnhP1aZgo9oK/U=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52BJtUrB102360
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 11 Mar 2025 14:55:30 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 11
 Mar 2025 14:55:29 -0500
Received: from fllvsmtp8.itg.ti.com (10.64.41.158) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 11 Mar 2025 14:55:29 -0500
Received: from fllvdckhpci004.itg.ti.com (fllvdckhpci004.itg.ti.com [10.64.72.21])
	by fllvsmtp8.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52BJtTip083437;
	Tue, 11 Mar 2025 14:55:29 -0500
Received: by fllvdckhpci004.itg.ti.com (Postfix, from userid 60899)
	id 8908F18D46F; Tue, 11 Mar 2025 14:55:29 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202503111223
Date: Tue, 11 Mar 2025 14:55:29 -0500
Message-ID: <20250311195529.2199081-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 11 Mar 2025 19:55:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18372

Updated the value(s) for:
  ti-linux-fw: PRUETH_FW_AM65X_SR2_VERSION,TI_DM_FW_VERSION,TI_LINUX_FW_SRCREV,TI_SYSFW_VERSION
  atf: SRCREV_tfa
  u-boot-ti-staging_2025.01: SRCREV
  linux-ti-staging_6.12: PV,SRCREV

Changelogs:
  ti-linux-fw: https://git.ti.com/cgit/processor-firmware/ti-linux-firmware/log/?qt=range&q=e38a05e2ef5f6a6f2387742864042beba01972bb..e089c2f8db0577aa4acd3b3ef3ab229be2e804e1
  u-boot-ti-staging_2025.01: https://git.ti.com/cgit/ti-u-boot/ti-u-boot/log/?qt=range&q=9c89e8b0a82fabe55c6366aa65eb987f05bb4472..baf3aaa8ecfa20b9d9f497621b6c11915223f502
  linux-ti-staging_6.12: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/log/?qt=range&q=6423e6bb6191982da1c09a21a46c68b494f5b1b5..1a22c2fb64485a5dea9a9247eb007ddd4ea8a81d

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc       | 8 ++++----
 .../trusted-firmware-a/trusted-firmware-a-ti.inc          | 2 +-
 .../recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb       | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb | 4 ++--
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index f3db9bd7..f9773dad 100644
--- a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -9,15 +9,15 @@ INC_PR = "r4"
 # Firmware versions
 CORESDK_RTOS_VERSION = "08.02.00.04"
 PRUETH_FW_AM65X_VERSION = "08.00.00.20"
-PRUETH_FW_AM65X_SR2_VERSION = "02.02.15.00"
+PRUETH_FW_AM65X_SR2_VERSION = "02.02.15.02"
 GOODIX_FW_VERSION = "1.0.0.0"
 CADENCE_MHDP_FW_VERSION = "2.1.0"
 IMG_DEC_FW_VERSION = "1.0"
 CNM_WAVE521_FW_VERSION = "1.0.7"
-TI_DM_FW_VERSION = "10.01.03"
-TI_SYSFW_VERSION = "10.01.08"
+TI_DM_FW_VERSION = "11.00.06"
+TI_SYSFW_VERSION = "11.00.06"
 
-TI_LINUX_FW_SRCREV ?= "e38a05e2ef5f6a6f2387742864042beba01972bb"
+TI_LINUX_FW_SRCREV ?= "e089c2f8db0577aa4acd3b3ef3ab229be2e804e1"
 SRCREV = "${TI_LINUX_FW_SRCREV}"
 
 BRANCH ?= "ti-linux-firmware"
diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
index 6dc30b5a..bc21a5cb 100644
--- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
@@ -1,7 +1,7 @@
 # NOTE: This .inc file with customizations only gets included for K3 platforms
 
 PV = "2.12+git"
-SRCREV_tfa = "5227171c079d0c7d22a6d37b5cec079c8c5bb4b1"
+SRCREV_tfa = "a29bdfd4c91330e3f2ccd3c591d0b3b5da019c8e"
 SRC_URI_TRUSTED_FIRMWARE_A = "git://github.com/TexasInstruments/arm-trusted-firmware.git;protocol=https"
 SRCBRANCH = "ti-master"
 SRC_URI = "${SRC_URI_TRUSTED_FIRMWARE_A};name=tfa;branch=${SRCBRANCH}"
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
index 183b33db..8fea6396 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
@@ -6,4 +6,4 @@ PR = "r0"
 
 BRANCH = "ti-u-boot-2025.01"
 
-SRCREV = "9c89e8b0a82fabe55c6366aa65eb987f05bb4472"
+SRCREV = "baf3aaa8ecfa20b9d9f497621b6c11915223f502"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
index 170b0f0b..fb71a2f0 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
@@ -23,8 +23,8 @@ S = "${WORKDIR}/git"
 
 BRANCH ?= "ti-linux-6.12.y"
 
-SRCREV ?= "6423e6bb6191982da1c09a21a46c68b494f5b1b5"
-PV = "6.12.9+git"
+SRCREV ?= "1a22c2fb64485a5dea9a9247eb007ddd4ea8a81d"
+PV = "6.12.17+git"
 
 KERNEL_REPRODUCIBILITY_PATCHES = " \
     file://0001-drivers-gpu-drm-msm-registers-improve-reproducibilit.patch \
-- 
2.43.5


