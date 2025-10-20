Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EE9ECCD1A2
	for <webhook@archiver.kernel.org>; Mon, 20 Oct 2025 13:03:57 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.18101.1760965430861533738
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 20 Oct 2025 06:03:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=cjnWUaWO;
 spf=pass (domain: list.ti.com, ip: 198.47.19.246, mailfrom: lcpdbld@list.ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59KD3mNj2894952;
	Mon, 20 Oct 2025 08:03:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1760965429; i=@ti.com;
	bh=rTeO39NsKGy4hUCRfPaN2ayiY/rSGVmk6MTHr9SOaeM=;
	h=From:To:Subject:Date;
	b=cjnWUaWO5sBs6Cunh+Da1cbPfWQ+Raw7DxUt0yZa38HRW9uuCxs2OQ8jYh7hc3ijH
	 s00FFFEcDauYGW/8jio3OLvFuR/+4T7HogZ5/mQmjPz/WoTHl2c4Xo35vKEjw+ZIiu
	 UIWfQq6NUcDDyIKPyYjNsY+yjzkrt1WZdV5Fccgc=
Received: from DFLE211.ent.ti.com (dfle211.ent.ti.com [10.64.6.69])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59KD3m6h025610
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 20 Oct 2025 08:03:48 -0500
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 20 Oct
 2025 08:03:48 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 20 Oct 2025 08:03:48 -0500
Received: from fllvdckhpci102.itg.ti.com (fllvdckhpci102.itg.ti.com [10.64.72.97])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59KD3mUV1662807;
	Mon, 20 Oct 2025 08:03:48 -0500
Received: by fllvdckhpci102.itg.ti.com (Postfix, from userid 60899)
	id 880CA2A6C; Mon, 20 Oct 2025 08:03:48 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202510200100
Date: Mon, 20 Oct 2025 08:03:48 -0500
Message-ID: <20251020130348.270516-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 20 Oct 2025 13:03:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19146

Updated the value(s) for:
  ti-linux-fw: TI_LINUX_FW_SRCREV,TI_SYSFW_VERSION
  atf: SRCREV_tfa:am62lxx
  u-boot-ti-staging_2025.01: SRCREV_uboot
  linux-ti-staging-rt_6.12: PV_ARM32,SRCREV_ARM32
  linux-ti-staging_6.12: PV,SRCREV

Changelogs:
  ti-linux-fw: https://git.ti.com/cgit/processor-firmware/ti-linux-firmware/log/?qt=range&q=27344bea60be4f0410feb1c309b9de3cdc7f8c6d..237071793594723bf1c2e9eef8ff836ffa3b09df
  u-boot-ti-staging_2025.01: https://git.ti.com/cgit/ti-u-boot/ti-u-boot/log/?qt=range&q=c779c758475cb98e95d3c05744e0dcbca5fc9991..b5956eebf45b7b604c046a21792883a42cd9c198
  linux-ti-staging-rt_6.12: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/log/?qt=range&q=2c04cd1373bf2cd53784cc10efad710f9fa5b5c8..dd80e6d61d8ccba753eb372040107ff195c8550d
  linux-ti-staging_6.12: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/log/?qt=range&q=3a3f87d0bf70131af74a85336c2785d933732825..2ce6f0999344a368217d04cdbee0922144ecc899

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc           | 4 ++--
 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc  | 2 +-
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb   | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb  | 4 ++--
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb     | 4 ++--
 5 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index e769044a..d65e1288 100644
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
index be42b27a..f544cca2 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
@@ -6,4 +6,4 @@ PR = "r0"
 
 BRANCH = "ti-u-boot-2025.01"
 
-SRCREV_uboot = "c779c758475cb98e95d3c05744e0dcbca5fc9991"
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
index f80c4c54..02a87d2f 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
@@ -22,8 +22,8 @@ S = "${UNPACKDIR}/${BB_GIT_DEFAULT_DESTSUFFIX}"
 
 BRANCH ?= "ti-linux-6.12.y"
 
-SRCREV ?= "3a3f87d0bf70131af74a85336c2785d933732825"
-PV = "6.12.43+git"
+SRCREV ?= "2ce6f0999344a368217d04cdbee0922144ecc899"
+PV = "6.12.49+git"
 
 KERNEL_REPRODUCIBILITY_PATCHES = " \
     file://0001-drivers-gpu-drm-msm-registers-improve-reproducibilit.patch \
-- 
2.43.5


