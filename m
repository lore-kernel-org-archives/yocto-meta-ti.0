Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30044CA0EFA
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 08:49:00 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.4559.1755766135824373719
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 21 Aug 2025 01:48:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=U5v7GVvU;
 spf=pass (domain: list.ti.com, ip: 198.47.23.234, mailfrom: lcpdbld@list.ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57L8msbo3396097;
	Thu, 21 Aug 2025 03:48:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755766134; i=@ti.com;
	bh=zpe6D0hVnQ49lktDPZRmbr4vjmkdtip0SEuqKLBGJ88=;
	h=From:To:Subject:Date;
	b=U5v7GVvU2rU7fgv3+TIGxS3a7A6CU8cFJUC3DlUj+F7M4ZfmJ9FiBAtPu/+5NPswh
	 2uGtNrT/uHWI4m6P6vQnhYwdKkue6AiT+vVRGZrk3y+r3tYK0lbXf3rYx1IVtJJyJj
	 c5vN4xjULDNmkjYYTEXZgA/HFPrbiVrrRxtlb748=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57L8msSk2699223
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 21 Aug 2025 03:48:54 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 21
 Aug 2025 03:48:54 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 21 Aug 2025 03:48:54 -0500
Received: from fllvdckhpci102.itg.ti.com (fllvdckhpci102.itg.ti.com [10.64.72.97])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57L8ms5o1608959;
	Thu, 21 Aug 2025 03:48:54 -0500
Received: by fllvdckhpci102.itg.ti.com (Postfix, from userid 60899)
	id 084CB2A67; Thu, 21 Aug 2025 03:48:54 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202508210100
Date: Thu, 21 Aug 2025 03:48:54 -0500
Message-ID: <20250821084854.1293608-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 21 Aug 2025 08:49:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18945

Updated the value(s) for:
  ti-linux-fw: TI_LINUX_FW_SRCREV
  atf: SRCREV_tfa:am62lxx
  u-boot-ti-staging_2025.01: SRCREV
  linux-ti-staging-rt_6.12: PV_ARM32,SRCREV_ARM32
  linux-ti-staging_6.12: PV,SRCREV

Changelogs:
  ti-linux-fw: https://git.ti.com/cgit/processor-firmware/ti-linux-firmware/log/?qt=range&q=e89a348f4618a26812fb353a04ed9532ef890a2f..6506f9e1e5d8d62e9dd70123fae04bd07b90bcd5
  u-boot-ti-staging_2025.01: https://git.ti.com/cgit/ti-u-boot/ti-u-boot/log/?qt=range&q=c5737097b4859362aa22260c5a1f2becd62af65c..556593b8d5f39ad77327d2e7aa190d3faae5a350
  linux-ti-staging-rt_6.12: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/log/?qt=range&q=90225824e8382c00e9628168922838a0702443eb..6246158ffbe4dfc005258a52780956f8baf04574
  linux-ti-staging_6.12: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/log/?qt=range&q=adbec2562ad14236717dc1c9dc3020c94ba27f7d..fe4718a972cfcac11933e98f5a3986e084a7c43f

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc           | 2 +-
 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc  | 2 +-
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb   | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb  | 4 ++--
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb     | 4 ++--
 5 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index 739bebc2..61696a00 100644
--- a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -20,7 +20,7 @@ TI_HSM_DEMO_FW_VERSION = "11.00.09"
 TAD5212_FW_VERSION = "1.0.0.0"
 TI_PKA_FW_VERSION = "2.1.0"
 
-TI_LINUX_FW_SRCREV ?= "e89a348f4618a26812fb353a04ed9532ef890a2f"
+TI_LINUX_FW_SRCREV ?= "6506f9e1e5d8d62e9dd70123fae04bd07b90bcd5"
 SRCREV = "${TI_LINUX_FW_SRCREV}"
 
 BRANCH ?= "ti-linux-firmware"
diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
index e965e959..c2c6b007 100644
--- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
@@ -8,7 +8,7 @@ SRC_URI_TRUSTED_FIRMWARE_A = "git://git.trustedfirmware.org/TF-A/trusted-firmwar
 SRCBRANCH = "master"
 
 LIC_FILES_CHKSUM:am62lxx = "file://docs/license.rst;md5=1118e32884721c0be33267bd7ae11130"
-SRCREV_tfa:am62lxx = "b33328a2b47157270d9afe17bc51731f88be37fb"
+SRCREV_tfa:am62lxx = "6998fc351e8d23f704054a4a778008e5f006c36a"
 SRC_URI_TRUSTED_FIRMWARE_A:am62lxx = "git://github.com/TexasInstruments/arm-trusted-firmware.git;protocol=https"
 SRCBRANCH:am62lxx = "ti-master"
 
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
index 48a78808..974897cf 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
@@ -6,4 +6,4 @@ PR = "r0"
 
 BRANCH = "ti-u-boot-2025.01"
 
-SRCREV = "c5737097b4859362aa22260c5a1f2becd62af65c"
+SRCREV = "556593b8d5f39ad77327d2e7aa190d3faae5a350"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
index ed735c2f..65dd667a 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
@@ -10,8 +10,8 @@ BRANCH_ARM64 = "ti-linux-6.12.y"
 BRANCH = "${BRANCH_ARM64}"
 
 BRANCH_ARM32 = "ti-rt-linux-6.12.y-arm32"
-SRCREV_ARM32 = "90225824e8382c00e9628168922838a0702443eb"
-PV_ARM32 = "6.12.35+git"
+SRCREV_ARM32 = "6246158ffbe4dfc005258a52780956f8baf04574"
+PV_ARM32 = "6.12.42+git"
 
 BRANCH:ti33x = "${BRANCH_ARM32}"
 BRANCH:ti43x = "${BRANCH_ARM32}"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
index e4448036..b9d8c6ce 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
@@ -22,8 +22,8 @@ S = "${UNPACKDIR}/${BB_GIT_DEFAULT_DESTSUFFIX}"
 
 BRANCH ?= "ti-linux-6.12.y"
 
-SRCREV ?= "adbec2562ad14236717dc1c9dc3020c94ba27f7d"
-PV = "6.12.35+git"
+SRCREV ?= "fe4718a972cfcac11933e98f5a3986e084a7c43f"
+PV = "6.12.42+git"
 
 KERNEL_REPRODUCIBILITY_PATCHES = " \
     file://0001-drivers-gpu-drm-msm-registers-improve-reproducibilit.patch \
-- 
2.43.5


