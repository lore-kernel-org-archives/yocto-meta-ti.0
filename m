Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEF10C5AE59
	for <webhook@archiver.kernel.org>; Fri, 30 May 2025 00:59:18 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.806.1748566756242069280
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 29 May 2025 17:59:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=nMCW45Qy;
 spf=pass (domain: list.ti.com, ip: 198.47.23.235, mailfrom: lcpdbld@list.ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54U0xEBw2544793;
	Thu, 29 May 2025 19:59:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1748566754; i=@ti.com;
	bh=q6gEK6YZkGlOpRcKnJHnf11hWSJd8EycmmOWutqt8zc=;
	h=From:To:Subject:Date;
	b=nMCW45QyHiQkS2g4HCTVcJWYrEq4mLLod3TmKqoNXb3cra5jnbLbzmyXtDTL7TP3P
	 wkX62XVavjU3ZQK6pcKpjeWP87mOqsCNCwwh63h49IV7OZWOK7hwZOqBwQ/OBIB53u
	 tYFNsqiIt96ePTsJW8+30GHUGpkfseVwJqr8LJw0=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54U0xEGV516073
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 29 May 2025 19:59:14 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 29
 May 2025 19:59:14 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 29 May 2025 19:59:13 -0500
Received: from fllvdckhpci004.itg.ti.com (fllvdckhpci004.itg.ti.com [10.64.72.21])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 54U0xDdH2236947;
	Thu, 29 May 2025 19:59:13 -0500
Received: by fllvdckhpci004.itg.ti.com (Postfix, from userid 60899)
	id CA31118D465; Thu, 29 May 2025 19:59:13 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202505291514
Date: Thu, 29 May 2025 19:59:13 -0500
Message-ID: <20250530005913.3731091-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 30 May 2025 00:59:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18613

Updated the value(s) for:
  ti-linux-fw: TI_LINUX_FW_SRCREV
  atf: SRCREV_tfa
  u-boot-ti-staging_2025.01: SRCREV
  linux-ti-staging_6.12: SRCREV

Changelogs:
  ti-linux-fw: https://git.ti.com/cgit/processor-firmware/ti-linux-firmware/log/?qt=range&q=d5a6aed56d76f7a8a7729f0d0b4655b7e623e1c7..1ea29f4b3ec17bdc1a3431a014ea5224962dc779
  u-boot-ti-staging_2025.01: https://git.ti.com/cgit/ti-u-boot/ti-u-boot/log/?qt=range&q=3d024809613c2a8f1d69258554ab8954d26537f5..1d6ba4a32cdd8c987533d5789b5bc7b84c41fabe
  linux-ti-staging_6.12: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/log/?qt=range&q=d95b7f80f66d104525e6beb002d82a9505b28131..b0afb35642d79e776a4cf940945367cef87ba127

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc             | 2 +-
 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc    | 2 +-
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb     | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb       | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index adc7afa1..3c9836a0 100644
--- a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -18,7 +18,7 @@ TI_DM_FW_VERSION = "11.00.09"
 TI_SYSFW_VERSION = "11.00.07"
 TI_HSM_DEMO_FW_VERSION = "11.00.09"
 
-TI_LINUX_FW_SRCREV ?= "d5a6aed56d76f7a8a7729f0d0b4655b7e623e1c7"
+TI_LINUX_FW_SRCREV ?= "1ea29f4b3ec17bdc1a3431a014ea5224962dc779"
 SRCREV = "${TI_LINUX_FW_SRCREV}"
 
 BRANCH ?= "ti-linux-firmware"
diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
index f176a43e..594a4930 100644
--- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
@@ -1,7 +1,7 @@
 # NOTE: This .inc file with customizations only gets included for K3 platforms
 
 PV = "2.12+git"
-SRCREV_tfa = "13db77abe0ade00bd5b302c9d9b6873a35700ae4"
+SRCREV_tfa = "a70f82d5a439cb9e21426908c7410c4f2a646364"
 SRC_URI_TRUSTED_FIRMWARE_A = "git://github.com/TexasInstruments/arm-trusted-firmware.git;protocol=https"
 SRCBRANCH = "ti-master"
 SRC_URI = "${SRC_URI_TRUSTED_FIRMWARE_A};name=tfa;branch=${SRCBRANCH}"
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
index 99a2c8fc..57a29737 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
@@ -6,4 +6,4 @@ PR = "r0"
 
 BRANCH = "ti-u-boot-2025.01"
 
-SRCREV = "3d024809613c2a8f1d69258554ab8954d26537f5"
+SRCREV = "1d6ba4a32cdd8c987533d5789b5bc7b84c41fabe"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
index f399c207..c8954ee8 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
@@ -23,7 +23,7 @@ S = "${WORKDIR}/git"
 
 BRANCH ?= "ti-linux-6.12.y"
 
-SRCREV ?= "d95b7f80f66d104525e6beb002d82a9505b28131"
+SRCREV ?= "b0afb35642d79e776a4cf940945367cef87ba127"
 PV = "6.12.24+git"
 
 # Special configuration for remoteproc/rpmsg IPC modules
-- 
2.43.5


