Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DC2AC3DA4A
	for <webhook@archiver.kernel.org>; Thu,  1 Aug 2024 15:09:48 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.70712.1722524980746872539
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 01 Aug 2024 08:09:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Juae3Fo/;
 spf=pass (domain: list.ti.com, ip: 198.47.19.142, mailfrom: lcpdbld@list.ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 471F9cwJ070395;
	Thu, 1 Aug 2024 10:09:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1722524978; i=@ti.com;
	bh=5kRQn59PiMiuuzTuC8f4BuiBQkHbKfbCTv8YVpXVOjw=;
	h=From:To:Subject:Date;
	b=Juae3Fo/RhgKcVLaSuJqqZRK1k8Z+5u573xV4l4JH0nVmscQKRk51CIXsgjPgBYhY
	 PkvWnC+CZX7NckwC/rMoE0LeY/Zl5GkqfIyPh4qYfAVzJDLZTXLzRzOlDfCbv83sRx
	 2QWD3V0Rb0EfnRZOir8DxAko4DqDodmf4qx3ckrs=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 471F9cvt076644
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 1 Aug 2024 10:09:38 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 1
 Aug 2024 10:09:38 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 1 Aug 2024 10:09:38 -0500
Received: from fllvdckhpci004.itg.ti.com (fllvdckhpci004.itg.ti.com [10.248.130.8])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 471F9cfN081720;
	Thu, 1 Aug 2024 10:09:38 -0500
Received: by fllvdckhpci004.itg.ti.com (Postfix, from userid 60899)
	id 858E111124C8; Thu,  1 Aug 2024 10:09:38 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202408010400
Date: Thu, 1 Aug 2024 10:09:38 -0500
Message-ID: <1722524978-70477-1-git-send-email-lcpdbld@list.ti.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 01 Aug 2024 15:09:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17915

Updated the value(s) for:
  ti-linux-fw: TI_DM_FW_VERSION,TI_LINUX_FW_SRCREV
  u-boot-ti-staging_2024.04: SRCREV
  linux-ti-staging-rt_6.6: SRCREV
  linux-ti-staging_6.6: SRCREV

Changelogs:
  ti-linux-fw: https://git.ti.com/cgit/processor-firmware/ti-linux-firmware/log/?qt=range&q=1e01062a34b88427c2fca1ce7c5a5c308961e0c7..35fa44a93549d8d91b1c37a7b9f8767dbe7d37eb
  u-boot-ti-staging_2024.04: https://git.ti.com/cgit/ti-u-boot/ti-u-boot/log/?qt=range&q=fda88f8bcea30590528930ff9441c6e958da86f5..1a74648ab378f8c14ae6fc3a4f11ed3ad1ad7126
  linux-ti-staging-rt_6.6: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/log/?qt=range&q=04a9ad081f0f255a046f398abf6faf1d4374267f..e1ea7912c2045eaea586cb12cc63b6280e2a6c35
  linux-ti-staging_6.6: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/log/?qt=range&q=6de6e418c80edfbe08f4a5f851c721bd60c0123b..a816c5abf3307f42e308a1fe13bd72244f37ec86

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc         | 4 ++--
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2024.04.bb | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.6.bb | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb    | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index f664f65..126edf3 100644
--- a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -14,10 +14,10 @@ GOODIX_FW_VERSION = "1.0.0.0"
 CADENCE_MHDP_FW_VERSION = "2.1.0"
 IMG_DEC_FW_VERSION = "1.0"
 CNM_WAVE521_FW_VERSION = "1.0.4"
-TI_DM_FW_VERSION = "10.00.00"
+TI_DM_FW_VERSION = "10.00.05"
 TI_SYSFW_VERSION = "10.00.08"
 
-TI_LINUX_FW_SRCREV ?= "1e01062a34b88427c2fca1ce7c5a5c308961e0c7"
+TI_LINUX_FW_SRCREV ?= "35fa44a93549d8d91b1c37a7b9f8767dbe7d37eb"
 SRCREV = "${TI_LINUX_FW_SRCREV}"
 
 BRANCH ?= "ti-linux-firmware"
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2024.04.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2024.04.bb
index 651e922..7949ddf 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2024.04.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2024.04.bb
@@ -6,4 +6,4 @@ PR = "r0"
 
 BRANCH = "ti-u-boot-2024.04"
 
-SRCREV = "fda88f8bcea30590528930ff9441c6e958da86f5"
+SRCREV = "1a74648ab378f8c14ae6fc3a4f11ed3ad1ad7126"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.6.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.6.bb
index e685c17..500e28b 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.6.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.6.bb
@@ -8,7 +8,7 @@ FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}-6.6:"
 
 BRANCH = "ti-rt-linux-6.6.y"
 
-SRCREV = "04a9ad081f0f255a046f398abf6faf1d4374267f"
+SRCREV = "e1ea7912c2045eaea586cb12cc63b6280e2a6c35"
 
 include ${@ 'recipes-kernel/linux/ti-extras-rt.inc' if d.getVar('TI_EXTRAS') else ''}
 
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb
index 238aa2d..ba70f9e 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb
@@ -23,7 +23,7 @@ S = "${WORKDIR}/git"
 
 BRANCH ?= "ti-linux-6.6.y"
 
-SRCREV ?= "6de6e418c80edfbe08f4a5f851c721bd60c0123b"
+SRCREV ?= "a816c5abf3307f42e308a1fe13bd72244f37ec86"
 PV = "6.6.32+git"
 
 KERNEL_GIT_URI ?= "git://git.ti.com/git/ti-linux-kernel/ti-linux-kernel.git"
-- 
1.8.3.1


