Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B5CAC87FC5
	for <webhook@archiver.kernel.org>; Thu, 24 Jul 2025 08:18:42 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.7522.1753345116212671436
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 24 Jul 2025 01:18:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Gh/Q7sQZ;
 spf=pass (domain: list.ti.com, ip: 198.47.19.245, mailfrom: lcpdbld@list.ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56O8IYWJ1455293;
	Thu, 24 Jul 2025 03:18:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1753345114; i=@ti.com;
	bh=s9mNTLfW4xg3u3N+/VfZarO5vLQLjzEJ1SSaSw2gcYw=;
	h=From:To:Subject:Date;
	b=Gh/Q7sQZIniTIqWVH/LfSBg0ASS2FQ0OwKfah3t3mOsk1tvy93behWsnzPty1Ccrp
	 SEBxa7g94f5od3t4vABEq9eW/GMJce/rvyrbBMWIe5eH50PnI9YlxlGcBeUnElU/ug
	 uMNeZH5KdgGznApxG3v65n16bfj3bZZM1Yb7j/ek=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56O8IYif2359599
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 24 Jul 2025 03:18:34 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 24
 Jul 2025 03:18:34 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 24 Jul 2025 03:18:34 -0500
Received: from fllvdckhpci021.itg.ti.com (fllvdckhpci021.itg.ti.com [10.64.72.33])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56O8IY501099473;
	Thu, 24 Jul 2025 03:18:34 -0500
Received: by fllvdckhpci021.itg.ti.com (Postfix, from userid 60899)
	id 1A7BFD6F3C; Thu, 24 Jul 2025 03:18:34 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202507240100
Date: Thu, 24 Jul 2025 03:18:34 -0500
Message-ID: <20250724081834.747526-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 24 Jul 2025 08:18:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18821

Updated the value(s) for:
  ti-linux-fw: TI_DM_FW_VERSION,TI_LINUX_FW_SRCREV,TI_SYSFW_VERSION
  atf: SRCREV_tfa:am62lxx
  u-boot-ti-staging_2025.01: SRCREV
  k3conf: SRCREV
  linux-ti-staging-rt_6.12: SRCREV_ARM32
  linux-ti-staging_6.12: SRCREV

Changelogs:
  ti-linux-fw: https://git.ti.com/cgit/processor-firmware/ti-linux-firmware/log/?qt=range&q=373c2f5646e3947b3b4a340da729288ee3f07833..f59a711599249ecac75fea38b7a15ef9137d650d
  u-boot-ti-staging_2025.01: https://git.ti.com/cgit/ti-u-boot/ti-u-boot/log/?qt=range&q=827c35b4d141865e25d234e3d298614e6c47150c..3bcfad6cee95403f7f62dd9d871cc3ea948c0761
  k3conf: https://git.ti.com/cgit/k3conf/k3conf/log/?qt=range&q=e6abc1b87f1d5bc4c2ab5f1ebfbf5a70e437dcb4..6034420195cf763c9470fb2113810695e5e37a23
  linux-ti-staging-rt_6.12: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/log/?qt=range&q=f0e4f5ca0905956c70779b31663f594c08c6a3bc..b5ee9420d81f46861c4f0a172154e477feda1980
  linux-ti-staging_6.12: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/log/?qt=range&q=78e6abff322081d53c5a685d927476086c9b2846..72f48d59b8f087fa0dd1f1e8c2c0b5bc0baa537c

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc         | 6 +++---
 .../trusted-firmware-a/trusted-firmware-a-ti.inc            | 2 +-
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb | 2 +-
 meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb           | 2 +-
 .../recipes-kernel/linux/linux-ti-staging-rt_6.12.bb        | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb   | 2 +-
 6 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index 575d5632..571259e0 100644
--- a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -14,12 +14,12 @@ GOODIX_FW_VERSION = "1.0.0.0"
 CADENCE_MHDP_FW_VERSION = "2.1.0"
 IMG_DEC_FW_VERSION = "1.0"
 CNM_WAVE521_FW_VERSION = "1.0.8"
-TI_DM_FW_VERSION = "11.00.09"
-TI_SYSFW_VERSION = "11.01.02"
+TI_DM_FW_VERSION = "11.01.09"
+TI_SYSFW_VERSION = "11.01.05"
 TI_HSM_DEMO_FW_VERSION = "11.00.09"
 TAD5212_FW_VERSION = "1.0.0.0"
 
-TI_LINUX_FW_SRCREV ?= "373c2f5646e3947b3b4a340da729288ee3f07833"
+TI_LINUX_FW_SRCREV ?= "f59a711599249ecac75fea38b7a15ef9137d650d"
 SRCREV = "${TI_LINUX_FW_SRCREV}"
 
 BRANCH ?= "ti-linux-firmware"
diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
index cc443c3f..ee58c193 100644
--- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
@@ -8,7 +8,7 @@ SRC_URI_TRUSTED_FIRMWARE_A = "git://git.trustedfirmware.org/TF-A/trusted-firmwar
 SRCBRANCH = "master"
 
 LIC_FILES_CHKSUM:am62lxx = "file://docs/license.rst;md5=1118e32884721c0be33267bd7ae11130"
-SRCREV_tfa:am62lxx = "c7583e555f0c7152a54e9ccac492dffddc4e3db0"
+SRCREV_tfa:am62lxx = "ed89d963b00e8dbdb91cea87e1ba43db0a64fba9"
 SRC_URI_TRUSTED_FIRMWARE_A:am62lxx = "git://github.com/TexasInstruments/arm-trusted-firmware.git;protocol=https"
 SRCBRANCH:am62lxx = "ti-master"
 
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
index 6c88489d..83965d54 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
@@ -6,4 +6,4 @@ PR = "r0"
 
 BRANCH = "ti-u-boot-2025.01"
 
-SRCREV = "827c35b4d141865e25d234e3d298614e6c47150c"
+SRCREV = "3bcfad6cee95403f7f62dd9d871cc3ea948c0761"
diff --git a/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb b/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb
index 3be1f46b..62f3485b 100644
--- a/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb
+++ b/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb
@@ -10,6 +10,6 @@ PV = "0.3+git"
 COMPATIBLE_MACHINE = "k3"
 
 BRANCH ?= "master"
-SRCREV = "e6abc1b87f1d5bc4c2ab5f1ebfbf5a70e437dcb4"
+SRCREV = "6034420195cf763c9470fb2113810695e5e37a23"
 
 SRC_URI = "git://git.ti.com/git/k3conf/k3conf.git;protocol=https;branch=${BRANCH}"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
index 974bf1d7..7240db0e 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
@@ -10,7 +10,7 @@ BRANCH_ARM64 = "ti-linux-6.12.y"
 BRANCH = "${BRANCH_ARM64}"
 
 BRANCH_ARM32 = "ti-rt-linux-6.12.y-arm32"
-SRCREV_ARM32 = "f0e4f5ca0905956c70779b31663f594c08c6a3bc"
+SRCREV_ARM32 = "b5ee9420d81f46861c4f0a172154e477feda1980"
 PV_ARM32 = "6.12.35+git"
 
 BRANCH:ti33x = "${BRANCH_ARM32}"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
index e58eadcb..b4e2c6b4 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
@@ -22,7 +22,7 @@ S = "${UNPACKDIR}/${BB_GIT_DEFAULT_DESTSUFFIX}"
 
 BRANCH ?= "ti-linux-6.12.y"
 
-SRCREV ?= "78e6abff322081d53c5a685d927476086c9b2846"
+SRCREV ?= "72f48d59b8f087fa0dd1f1e8c2c0b5bc0baa537c"
 PV = "6.12.35+git"
 
 KERNEL_REPRODUCIBILITY_PATCHES = " \
-- 
2.43.5


