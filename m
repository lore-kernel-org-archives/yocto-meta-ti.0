Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 077EDC369DC
	for <webhook@archiver.kernel.org>; Fri,  2 May 2025 00:08:35 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.8751.1746144505230735088
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 01 May 2025 17:08:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=mia0186k;
 spf=pass (domain: list.ti.com, ip: 198.47.23.234, mailfrom: lcpdbld@list.ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 54208NNJ3731949
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 1 May 2025 19:08:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746144503; i=@ti.com;
	bh=WR+9sdEPVosCFapOGOQ6bxGzI9sVDmDGq5T8nQ105PA=;
	h=From:To:Subject:Date;
	b=mia0186kCMHmPkhbaoyw9t5hGKCsFYa6Tzi+x1y0zyJBXUf1mR/1PTXvm+uVt9vcC
	 7AkcIRtQWXmJpEcCKXrU4qBRr/PomF1MpdA2dJ5nFBfGoujCk0MfTdAYFrNAknKxi6
	 VQ1t7Jvq3/U6gDabBNL35LwvJdkFPTPoDPkn7xt8=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 54208Nfh054973
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 1 May 2025 19:08:23 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 1
 May 2025 19:08:23 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 1 May 2025 19:08:23 -0500
Received: from fllvdckhpci004.itg.ti.com (fllvdckhpci004.itg.ti.com [10.64.72.21])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 54208NNO047446;
	Thu, 1 May 2025 19:08:23 -0500
Received: by fllvdckhpci004.itg.ti.com (Postfix, from userid 60899)
	id 08BDAE8048; Thu,  1 May 2025 19:08:23 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202505011354
Date: Thu, 1 May 2025 19:08:23 -0500
Message-ID: <20250502000823.1698395-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 02 May 2025 00:08:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18527

Updated the value(s) for:
  ti-linux-fw: TI_LINUX_FW_SRCREV
  atf: SRCREV_tfa
  u-boot-ti-staging_2025.01: SRCREV
  linux-ti-staging_6.12: PV,SRCREV

Changelogs:
  ti-linux-fw: https://git.ti.com/cgit/processor-firmware/ti-linux-firmware/log/?qt=range&q=10257543a029cc608c9df1c36c83e36ac3dd5b46..1e5d64d9385d6472d29e11ac7021765004ddff27
  u-boot-ti-staging_2025.01: https://git.ti.com/cgit/ti-u-boot/ti-u-boot/log/?qt=range&q=723dde103755167c07354d50fed1098d10709a98..4724106aaa824af920d81051818cc508cd50e6ec
  linux-ti-staging_6.12: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/log/?qt=range&q=95010a7c186b86f738615231016aa017ac527612..598740560225b2d404329bf466fb10475934de23

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc           | 2 +-
 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc  | 2 +-
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb   | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb     | 4 ++--
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index 2aa07f71..8605d708 100644
--- a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -18,7 +18,7 @@ TI_DM_FW_VERSION = "11.00.09"
 TI_SYSFW_VERSION = "11.00.07"
 TI_HSM_DEMO_FW_VERSION = "11.00.09"
 
-TI_LINUX_FW_SRCREV ?= "10257543a029cc608c9df1c36c83e36ac3dd5b46"
+TI_LINUX_FW_SRCREV ?= "1e5d64d9385d6472d29e11ac7021765004ddff27"
 SRCREV = "${TI_LINUX_FW_SRCREV}"
 
 BRANCH ?= "ti-linux-firmware"
diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
index 457f4916..9c47ca35 100644
--- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
@@ -1,7 +1,7 @@
 # NOTE: This .inc file with customizations only gets included for K3 platforms
 
 PV = "2.12+git"
-SRCREV_tfa = "ce454ea3b59e77c9e36e5356cdaeab6deaa8a62e"
+SRCREV_tfa = "b45324936bbba464b0623c83cd5aa53e1cd4cbdb"
 SRC_URI_TRUSTED_FIRMWARE_A = "git://github.com/TexasInstruments/arm-trusted-firmware.git;protocol=https"
 SRCBRANCH = "ti-master"
 SRC_URI = "${SRC_URI_TRUSTED_FIRMWARE_A};name=tfa;branch=${SRCBRANCH}"
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
index 2e6f122c..1d9244c8 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
@@ -6,4 +6,4 @@ PR = "r0"
 
 BRANCH = "ti-u-boot-2025.01"
 
-SRCREV = "723dde103755167c07354d50fed1098d10709a98"
+SRCREV = "4724106aaa824af920d81051818cc508cd50e6ec"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
index 154af5c8..5e6e2e46 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
@@ -23,8 +23,8 @@ S = "${WORKDIR}/git"
 
 BRANCH ?= "ti-linux-6.12.y"
 
-SRCREV ?= "95010a7c186b86f738615231016aa017ac527612"
-PV = "6.12.17+git"
+SRCREV ?= "598740560225b2d404329bf466fb10475934de23"
+PV = "6.12.22+git"
 
 # Special configuration for remoteproc/rpmsg IPC modules
 module_conf_rpmsg_client_sample = "blacklist rpmsg_client_sample"
-- 
2.43.5


