Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EE85CCD199
	for <webhook@archiver.kernel.org>; Fri, 17 Oct 2025 21:03:44 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.3638.1760735019899662293
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 17 Oct 2025 14:03:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=pZCPVyQi;
 spf=pass (domain: list.ti.com, ip: 198.47.19.246, mailfrom: lcpdbld@list.ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59HL3cNJ2359885;
	Fri, 17 Oct 2025 16:03:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1760735018; i=@ti.com;
	bh=jn6hYCpwLbSZQX8PaIytvaML8sbSqxi7gcsQD/hfzDc=;
	h=From:To:Subject:Date;
	b=pZCPVyQiqbtiM5hvO6ci2mFbFAG//1ROmoKychfsPMlyWHiBVmjM4AHNxLYMN2NyV
	 vYDU+UddCHLXsZ2GgQThHFoFdTVy+RV6rL9KZUOvTTTDzzeHq/q8UiyWJF0t+a+d2V
	 je730q634GhI37inkFA91YctmIWgeC2FP8p5wrPI=
Received: from DFLE215.ent.ti.com (dfle215.ent.ti.com [10.64.6.73])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59HL3coN2689524
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 17 Oct 2025 16:03:38 -0500
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 17 Oct
 2025 16:03:38 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 17 Oct 2025 16:03:38 -0500
Received: from fllvdckhpci102.itg.ti.com (fllvdckhpci102.itg.ti.com [10.64.72.97])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59HL3c543381757;
	Fri, 17 Oct 2025 16:03:38 -0500
Received: by fllvdckhpci102.itg.ti.com (Postfix, from userid 60899)
	id F10F82A61; Fri, 17 Oct 2025 16:03:37 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202510170857
Date: Fri, 17 Oct 2025 16:03:37 -0500
Message-ID: <20251017210337.1556682-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 17 Oct 2025 21:03:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19144

Updated the value(s) for:
  ti-linux-fw: TI_LINUX_FW_SRCREV,TI_SYSFW_VERSION
  atf: SRCREV_tfa:am62lxx
  u-boot-ti-staging_2025.01: SRCREV_uboot
  linux-ti-staging-rt_6.12: PV_ARM32,SRCREV_ARM32
  linux-ti-staging_6.12: PV,SRCREV

Changelogs:
  ti-linux-fw: https://git.ti.com/cgit/processor-firmware/ti-linux-firmware/log/?qt=range&q=27344bea60be4f0410feb1c309b9de3cdc7f8c6d..237071793594723bf1c2e9eef8ff836ffa3b09df
  u-boot-ti-staging_2025.01: https://git.ti.com/cgit/ti-u-boot/ti-u-boot/log/?qt=range&q=89f0c688f7d4c2a1b957b00429b71f29f2562f63..b5956eebf45b7b604c046a21792883a42cd9c198
  linux-ti-staging-rt_6.12: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/log/?qt=range&q=2c04cd1373bf2cd53784cc10efad710f9fa5b5c8..dd80e6d61d8ccba753eb372040107ff195c8550d
  linux-ti-staging_6.12: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/log/?qt=range&q=9d15ddf0f6fa1f2c5cebeb70e993523821e5086c..2ce6f0999344a368217d04cdbee0922144ecc899

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc           | 4 ++--
 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc  | 2 +-
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb   | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb  | 4 ++--
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb     | 4 ++--
 5 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index 504ceb85..6a86143b 100644
--- a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -15,13 +15,13 @@ CADENCE_MHDP_FW_VERSION = "2.1.0"
 IMG_DEC_FW_VERSION = "1.0"
 CNM_WAVE521_FW_VERSION = "1.0.8"
 TI_DM_FW_VERSION = "11.01.09"
-TI_SYSFW_VERSION = "11.01.05"
+TI_SYSFW_VERSION = "11.02.00"
 TI_HSM_DEMO_FW_VERSION = "11.00.09"
 TAD5212_FW_VERSION = "1.0.0.0"
 TI_PKA_FW_VERSION = "2.1.0"
 TI_IPC_EXAMPLES_FW_VERSION = "3.52.00.01"
 
-TI_LINUX_FW_SRCREV ?= "27344bea60be4f0410feb1c309b9de3cdc7f8c6d"
+TI_LINUX_FW_SRCREV ?= "237071793594723bf1c2e9eef8ff836ffa3b09df"
 SRCREV = "${TI_LINUX_FW_SRCREV}"
 
 BRANCH ?= "ti-linux-firmware"
diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
index bae1bc83..43450560 100644
--- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
@@ -8,7 +8,7 @@ SRC_URI_TRUSTED_FIRMWARE_A = "git://git.trustedfirmware.org/TF-A/trusted-firmwar
 SRCBRANCH = "master"
 
 LIC_FILES_CHKSUM:am62lxx = "file://docs/license.rst;md5=1118e32884721c0be33267bd7ae11130"
-SRCREV_tfa:am62lxx = "6c8ef67293770a59afe86f8e98cfa39d01614ab8"
+SRCREV_tfa:am62lxx = "8a4829a62a4c6b04de5055f78b9481da40c76ce3"
 SRC_URI_TRUSTED_FIRMWARE_A:am62lxx = "git://github.com/TexasInstruments/arm-trusted-firmware.git;protocol=https"
 SRCBRANCH:am62lxx = "ti-master"
 
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
index ae5ba0cc..f544cca2 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
@@ -6,4 +6,4 @@ PR = "r0"
 
 BRANCH = "ti-u-boot-2025.01"
 
-SRCREV_uboot = "89f0c688f7d4c2a1b957b00429b71f29f2562f63"
+SRCREV_uboot = "b5956eebf45b7b604c046a21792883a42cd9c198"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
index 84b86cff..cc1c4610 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
@@ -10,8 +10,8 @@ BRANCH_ARM64 = "ti-linux-6.12.y"
 BRANCH = "${BRANCH_ARM64}"
 
 BRANCH_ARM32 = "ti-rt-linux-6.12.y-arm32"
-SRCREV_ARM32 = "2c04cd1373bf2cd53784cc10efad710f9fa5b5c8"
-PV_ARM32 = "6.12.43+git"
+SRCREV_ARM32 = "dd80e6d61d8ccba753eb372040107ff195c8550d"
+PV_ARM32 = "6.12.49+git"
 
 BRANCH:ti33x = "${BRANCH_ARM32}"
 BRANCH:ti43x = "${BRANCH_ARM32}"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
index 77e83030..fb040fbb 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
@@ -22,8 +22,8 @@ S = "${WORKDIR}/git"
 
 BRANCH ?= "ti-linux-6.12.y"
 
-SRCREV ?= "9d15ddf0f6fa1f2c5cebeb70e993523821e5086c"
-PV = "6.12.43+git"
+SRCREV ?= "2ce6f0999344a368217d04cdbee0922144ecc899"
+PV = "6.12.49+git"
 
 # Special configuration for remoteproc/rpmsg IPC modules
 module_conf_rpmsg_client_sample = "blacklist rpmsg_client_sample"
-- 
2.43.5


