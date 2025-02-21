Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B45CCC021B2
	for <webhook@archiver.kernel.org>; Fri, 21 Feb 2025 02:51:10 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.14899.1740106265304152299
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 20 Feb 2025 18:51:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=yHpsa5NN;
 spf=pass (domain: list.ti.com, ip: 198.47.19.245, mailfrom: lcpdbld@list.ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51L2p3jA174174
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 20 Feb 2025 20:51:03 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1740106263; i=@ti.com;
	bh=f/iKOtgidfW2H4j+NK3lSbOiELcg7BFF+B/jZ19xqRg=;
	h=From:To:Subject:Date;
	b=yHpsa5NN63pg1KxMdEnET9VjpquGjIWDIUY6htiPxxhHYZgE0V67uw5GAV1gbhZ3K
	 a5UR6cZS5brWbBCTdlyETgpW6Y6ine97/x68k7E542QAex0JLWgqIBeCJIWeMYiiaG
	 5CxFk1SP5joSB7BCI3q/+gP9EM/z1hUzmPO+P13M=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51L2p3ue059362;
	Thu, 20 Feb 2025 20:51:03 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 20
 Feb 2025 20:51:03 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 20 Feb 2025 20:51:03 -0600
Received: from fllvdckhpci004.itg.ti.com (fllvdckhpci004.itg.ti.com [10.64.72.21])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51L2p3m9043906;
	Thu, 20 Feb 2025 20:51:03 -0600
Received: by fllvdckhpci004.itg.ti.com (Postfix, from userid 60899)
	id 55B42138222; Thu, 20 Feb 2025 20:51:03 -0600 (CST)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202502201516
Date: Thu, 20 Feb 2025 20:51:03 -0600
Message-ID: <20250221025103.3937523-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 21 Feb 2025 02:51:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18332

Updated the value(s) for:
  ti-linux-fw: TI_LINUX_FW_SRCREV,TI_SYSFW_VERSION
  atf: SRCREV_tfa
  u-boot-ti-staging_2025.01: SRCREV
  linux-ti-staging_6.12: SRCREV

Changelogs:
  ti-linux-fw: https://git.ti.com/cgit/processor-firmware/ti-linux-firmware/log/?qt=range&q=2ba3fe65a367288d68cdb6768938559aa9ccbedc..a38d4919117436130c38738197b72558998ef463
  u-boot-ti-staging_2025.01: https://git.ti.com/cgit/ti-u-boot/ti-u-boot/log/?qt=range&q=4d6c49e808b86832ba198e8884226e2ee959d229..03740dcaec3959431cd59683d795aaaac216972f
  linux-ti-staging_6.12: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/log/?qt=range&q=cab6cafd320b575d69c2425580633deeb0b4396c..5657fc069e8b33255b027a2416b51133a98df939

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc           | 4 ++--
 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc  | 2 +-
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb   | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb     | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index e8047b6f..cee5e4fa 100644
--- a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -15,9 +15,9 @@ CADENCE_MHDP_FW_VERSION = "2.1.0"
 IMG_DEC_FW_VERSION = "1.0"
 CNM_WAVE521_FW_VERSION = "1.0.7"
 TI_DM_FW_VERSION = "10.01.03"
-TI_SYSFW_VERSION = "10.01.08"
+TI_SYSFW_VERSION = "11.00.02"
 
-TI_LINUX_FW_SRCREV ?= "2ba3fe65a367288d68cdb6768938559aa9ccbedc"
+TI_LINUX_FW_SRCREV ?= "a38d4919117436130c38738197b72558998ef463"
 SRCREV = "${TI_LINUX_FW_SRCREV}"
 
 BRANCH ?= "ti-linux-firmware"
diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
index 21aef489..6a48d30e 100644
--- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
@@ -1,7 +1,7 @@
 # NOTE: This .inc file with customizations only gets included for K3 platforms
 
 PV = "2.12+git"
-SRCREV_tfa = "5227171c079d0c7d22a6d37b5cec079c8c5bb4b1"
+SRCREV_tfa = "c660da3784b824f920c1d2d7f768cb2ed5cf9d4c"
 SRC_URI_TRUSTED_FIRMWARE_A = "git://github.com/TexasInstruments/arm-trusted-firmware.git;protocol=https"
 SRCBRANCH = "ti-master"
 SRC_URI = "${SRC_URI_TRUSTED_FIRMWARE_A};name=tfa;branch=${SRCBRANCH}"
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
index 6590d7a6..d8914d32 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
@@ -6,4 +6,4 @@ PR = "r0"
 
 BRANCH = "ti-u-boot-2025.01"
 
-SRCREV = "4d6c49e808b86832ba198e8884226e2ee959d229"
+SRCREV = "03740dcaec3959431cd59683d795aaaac216972f"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
index 359c8fdd..45e6ad44 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
@@ -23,7 +23,7 @@ S = "${WORKDIR}/git"
 
 BRANCH ?= "ti-linux-6.12.y"
 
-SRCREV ?= "cab6cafd320b575d69c2425580633deeb0b4396c"
+SRCREV ?= "5657fc069e8b33255b027a2416b51133a98df939"
 PV = "6.12.13+git"
 
 # Special configuration for remoteproc/rpmsg IPC modules
-- 
2.43.5


