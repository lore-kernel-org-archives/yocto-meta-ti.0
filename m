Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F526C77B7F
	for <webhook@archiver.kernel.org>; Fri, 27 Jun 2025 13:15:27 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.13451.1751030126978909117
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 27 Jun 2025 06:15:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=w4Gp8xXt;
 spf=pass (domain: list.ti.com, ip: 198.47.19.246, mailfrom: lcpdbld@list.ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55RDFPRF2758851;
	Fri, 27 Jun 2025 08:15:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1751030125; i=@ti.com;
	bh=/ph8jkIomZGnpdnjpFZIYMeMCq4Bqo517DnTjUWlZHM=;
	h=From:To:Subject:Date;
	b=w4Gp8xXtt+5u/tuYZMNE00G3CVsbPZRbtfB3EpGIm7jn01H7bJnee5ZZFUoI6Oq1w
	 HPj3h1sTN076vqf2K8dbRTpPPynALBfUUXPkbSHzLY1lQjWlp45edlvZbiD/YDVX/N
	 v3PRDbuI6HOgtHrLxIZs7o4LdxhlR4PB0zv6mwko=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55RDFPeI413093
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 27 Jun 2025 08:15:25 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 27
 Jun 2025 08:14:54 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 27 Jun 2025 08:14:55 -0500
Received: from fllvdckhpci004.itg.ti.com (fllvdckhpci004.itg.ti.com [10.64.72.21])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55RDEsJQ2851528;
	Fri, 27 Jun 2025 08:14:54 -0500
Received: by fllvdckhpci004.itg.ti.com (Postfix, from userid 60899)
	id D0BA3E8048; Fri, 27 Jun 2025 08:14:54 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202506261626
Date: Fri, 27 Jun 2025 08:14:54 -0500
Message-ID: <20250627131454.2142712-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 27 Jun 2025 13:15:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18702

Updated the value(s) for:
  ti-linux-fw: TI_LINUX_FW_SRCREV,TI_SYSFW_VERSION
  atf: SRCREV_tfa
  u-boot-ti-staging_2025.01: SRCREV
  linux-ti-staging_6.12: PV,SRCREV

Changelogs:
  ti-linux-fw: https://git.ti.com/cgit/processor-firmware/ti-linux-firmware/log/?qt=range&q=e594deb508a322d5681888d48fbb153953b06ca9..1190654141a9604e21307555882d77eaaf8c5fac
  u-boot-ti-staging_2025.01: https://git.ti.com/cgit/ti-u-boot/ti-u-boot/log/?qt=range&q=c99a1f082ba4970678c9cb5100d13a986e77817c..5350f13b66393212475a15c4e107add1d38267d3
  linux-ti-staging_6.12: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/log/?qt=range&q=34d0b070130a8cd2cddd9260389ad974e8cb8468..9167ea3511ca6ac1536b3114d92791b3de7422a3

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc           | 4 ++--
 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc  | 2 +-
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb   | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb     | 4 ++--
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index 61364c66..b1db1dfd 100644
--- a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -15,11 +15,11 @@ CADENCE_MHDP_FW_VERSION = "2.1.0"
 IMG_DEC_FW_VERSION = "1.0"
 CNM_WAVE521_FW_VERSION = "1.0.8"
 TI_DM_FW_VERSION = "11.00.09"
-TI_SYSFW_VERSION = "11.01.00"
+TI_SYSFW_VERSION = "11.01.02"
 TI_HSM_DEMO_FW_VERSION = "11.00.09"
 TAD5212_FW_VERSION = "1.0.0.0"
 
-TI_LINUX_FW_SRCREV ?= "e594deb508a322d5681888d48fbb153953b06ca9"
+TI_LINUX_FW_SRCREV ?= "1190654141a9604e21307555882d77eaaf8c5fac"
 SRCREV = "${TI_LINUX_FW_SRCREV}"
 
 BRANCH ?= "ti-linux-firmware"
diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
index d3824b92..c17ac9de 100644
--- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
@@ -1,7 +1,7 @@
 # NOTE: This .inc file with customizations only gets included for K3 platforms
 
 PV = "2.12+git"
-SRCREV_tfa = "39fe4a856d3576646642c2516b7a99de63eca74e"
+SRCREV_tfa = "2ab59f45ad0a5d95b5cb339c0f64686954377050"
 SRC_URI_TRUSTED_FIRMWARE_A = "git://github.com/TexasInstruments/arm-trusted-firmware.git;protocol=https"
 SRCBRANCH = "ti-master"
 SRC_URI = "${SRC_URI_TRUSTED_FIRMWARE_A};name=tfa;branch=${SRCBRANCH}"
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
index 329c2af0..0d61a732 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
@@ -6,4 +6,4 @@ PR = "r0"
 
 BRANCH = "ti-u-boot-2025.01"
 
-SRCREV = "c99a1f082ba4970678c9cb5100d13a986e77817c"
+SRCREV = "5350f13b66393212475a15c4e107add1d38267d3"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
index f7cb439f..23675b35 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
@@ -23,8 +23,8 @@ S = "${WORKDIR}/git"
 
 BRANCH ?= "ti-linux-6.12.y"
 
-SRCREV ?= "34d0b070130a8cd2cddd9260389ad974e8cb8468"
-PV = "6.12.33+git"
+SRCREV ?= "9167ea3511ca6ac1536b3114d92791b3de7422a3"
+PV = "6.12.34+git"
 
 # Special configuration for remoteproc/rpmsg IPC modules
 module_conf_rpmsg_client_sample = "blacklist rpmsg_client_sample"
-- 
2.43.5


