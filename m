Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78655C021A4
	for <webhook@archiver.kernel.org>; Fri, 14 Feb 2025 03:01:36 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.12234.1739502091144761783
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 13 Feb 2025 19:01:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=yTuL6XoT;
 spf=pass (domain: list.ti.com, ip: 198.47.23.234, mailfrom: lcpdbld@list.ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51E31TwJ869626
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 13 Feb 2025 21:01:29 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1739502089; i=@ti.com;
	bh=mq9DG9dCR01C73j7XkN7Q6OpYlclmNWAg6ReBy2XRfk=;
	h=From:To:Subject:Date;
	b=yTuL6XoTXfKwQqcjWREKwljkFYn7hQF94Mr/N8FQTqOUkeM6h/CJaQQb0r0CrBftY
	 C6XyOQkgh7TwQ52VUhhwtGguiUarT8oCwUUIYkBsTDc2+PV97EeOIIcqasSQ+EKitS
	 R1dNv+q56JtemO+EfJnAdQdS9Cg3kN26oCBYVhYM=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51E31Twe080251
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 13 Feb 2025 21:01:29 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 13
 Feb 2025 21:01:29 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 13 Feb 2025 21:01:29 -0600
Received: from fllvdckhpci004.itg.ti.com (fllvdckhpci004.itg.ti.com [10.64.72.21])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51E31Tc9039457;
	Thu, 13 Feb 2025 21:01:29 -0600
Received: by fllvdckhpci004.itg.ti.com (Postfix, from userid 60899)
	id 2F2F5E80D1; Thu, 13 Feb 2025 21:01:29 -0600 (CST)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202502131323
Date: Thu, 13 Feb 2025 21:01:29 -0600
Message-ID: <20250214030129.1794362-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 14 Feb 2025 03:01:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18316

Updated the value(s) for:
  ti-linux-fw: TI_LINUX_FW_SRCREV
  u-boot-ti-staging_2025.01: SRCREV
  linux-ti-staging_6.12: SRCREV

Changelogs:
  ti-linux-fw: https://git.ti.com/cgit/processor-firmware/ti-linux-firmware/log/?qt=range&q=5eb6ab596437555386df84e031887963e5e3a3b7..e38a05e2ef5f6a6f2387742864042beba01972bb
  u-boot-ti-staging_2025.01: https://git.ti.com/cgit/ti-u-boot/ti-u-boot/log/?qt=range&q=e718bbcec3ebf663c021839753034a224be4cc53..9c89e8b0a82fabe55c6366aa65eb987f05bb4472
  linux-ti-staging_6.12: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/log/?qt=range&q=c9e21a1ebd757f2b4487035382bbf65299cf8170..6423e6bb6191982da1c09a21a46c68b494f5b1b5

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc         | 2 +-
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index e1b1d774..f3db9bd7 100644
--- a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -17,7 +17,7 @@ CNM_WAVE521_FW_VERSION = "1.0.7"
 TI_DM_FW_VERSION = "10.01.03"
 TI_SYSFW_VERSION = "10.01.08"
 
-TI_LINUX_FW_SRCREV ?= "5eb6ab596437555386df84e031887963e5e3a3b7"
+TI_LINUX_FW_SRCREV ?= "e38a05e2ef5f6a6f2387742864042beba01972bb"
 SRCREV = "${TI_LINUX_FW_SRCREV}"
 
 BRANCH ?= "ti-linux-firmware"
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
index efa15dea..183b33db 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
@@ -6,4 +6,4 @@ PR = "r0"
 
 BRANCH = "ti-u-boot-2025.01"
 
-SRCREV = "e718bbcec3ebf663c021839753034a224be4cc53"
+SRCREV = "9c89e8b0a82fabe55c6366aa65eb987f05bb4472"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
index 40d28ecf..f7bf0b5d 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
@@ -23,7 +23,7 @@ S = "${WORKDIR}/git"
 
 BRANCH ?= "ti-linux-6.12.y"
 
-SRCREV ?= "c9e21a1ebd757f2b4487035382bbf65299cf8170"
+SRCREV ?= "6423e6bb6191982da1c09a21a46c68b494f5b1b5"
 PV = "6.12.9+git"
 
 # Special configuration for remoteproc/rpmsg IPC modules
-- 
2.43.5


