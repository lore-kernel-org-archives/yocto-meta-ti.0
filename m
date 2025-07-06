Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1FE7C83F05
	for <webhook@archiver.kernel.org>; Sun,  6 Jul 2025 04:45:08 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.31423.1751777100335162008
 for <meta-ti@lists.yoctoproject.org>;
 Sat, 05 Jul 2025 21:45:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=LLJJXMEL;
 spf=pass (domain: list.ti.com, ip: 198.47.19.246, mailfrom: lcpdbld@list.ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5664iwwF564253;
	Sat, 5 Jul 2025 23:44:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1751777098; i=@ti.com;
	bh=died6kZt11aH8kh2UNKiH8qKaVHvjGq984x3VhVTUxg=;
	h=From:To:Subject:Date;
	b=LLJJXMEL8T/+Oa0zyr6Khw+w62BUO0/TsWtmH6fEvhCkllh0UdZVcbsKAC3kBOwqM
	 gQuy71hAcQm7NRoCKvM9W0PrM2XtmfJsOtrW4tmRHjUvtv58xLwLPIl7M7pk0wd3du
	 jsGhBMuW1TpkeT/lnbe8TUfnb/rMzcQQ2Y9h8oJ4=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5664iwQl135929
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Sat, 5 Jul 2025 23:44:58 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Sat, 5
 Jul 2025 23:44:57 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Sat, 5 Jul 2025 23:44:57 -0500
Received: from fllvdckhpci004.itg.ti.com (fllvdckhpci004.itg.ti.com [10.64.72.21])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5664ivtW1860814;
	Sat, 5 Jul 2025 23:44:57 -0500
Received: by fllvdckhpci004.itg.ti.com (Postfix, from userid 60899)
	id 91709E8048; Sat,  5 Jul 2025 23:44:57 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202507051251
Date: Sat, 5 Jul 2025 23:44:57 -0500
Message-ID: <20250706044457.3761035-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sun, 06 Jul 2025 04:45:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18764

Updated the value(s) for:
  ti-linux-fw: TI_LINUX_FW_SRCREV
  u-boot-ti-staging_2025.01: SRCREV
  linux-ti-staging_6.12: SRCREV

Changelogs:
  ti-linux-fw: https://git.ti.com/cgit/processor-firmware/ti-linux-firmware/log/?qt=range&q=33bec0e2ea9a25362c0c8243b2f1ed392dbc5b02..373c2f5646e3947b3b4a340da729288ee3f07833
  u-boot-ti-staging_2025.01: https://git.ti.com/cgit/ti-u-boot/ti-u-boot/log/?qt=range&q=d2a72467939e169210bcd8e57de4b3e6ce2ef149..827c35b4d141865e25d234e3d298614e6c47150c
  linux-ti-staging_6.12: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/log/?qt=range&q=e3e551586dfad357550da433969d6d9f458e06ce..78e6abff322081d53c5a685d927476086c9b2846

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc         | 2 +-
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index b22585ff..30d5a1f3 100644
--- a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -19,7 +19,7 @@ TI_SYSFW_VERSION = "11.01.02"
 TI_HSM_DEMO_FW_VERSION = "11.00.09"
 TAD5212_FW_VERSION = "1.0.0.0"
 
-TI_LINUX_FW_SRCREV ?= "33bec0e2ea9a25362c0c8243b2f1ed392dbc5b02"
+TI_LINUX_FW_SRCREV ?= "373c2f5646e3947b3b4a340da729288ee3f07833"
 SRCREV = "${TI_LINUX_FW_SRCREV}"
 
 BRANCH ?= "ti-linux-firmware"
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
index 340c732e..6c88489d 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
@@ -6,4 +6,4 @@ PR = "r0"
 
 BRANCH = "ti-u-boot-2025.01"
 
-SRCREV = "d2a72467939e169210bcd8e57de4b3e6ce2ef149"
+SRCREV = "827c35b4d141865e25d234e3d298614e6c47150c"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
index 7ab98d30..f2f85bd1 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
@@ -23,7 +23,7 @@ S = "${WORKDIR}/git"
 
 BRANCH ?= "ti-linux-6.12.y"
 
-SRCREV ?= "e3e551586dfad357550da433969d6d9f458e06ce"
+SRCREV ?= "78e6abff322081d53c5a685d927476086c9b2846"
 PV = "6.12.35+git"
 
 # Special configuration for remoteproc/rpmsg IPC modules
-- 
2.43.5


