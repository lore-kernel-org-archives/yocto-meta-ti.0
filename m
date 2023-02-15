Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5560FC678D5
	for <webhook@archiver.kernel.org>; Wed, 15 Feb 2023 19:34:02 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.2563.1676489638995036618
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 15 Feb 2023 11:33:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=ck5P5kpX;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 31FJXwUV084055;
	Wed, 15 Feb 2023 13:33:58 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1676489638;
	bh=72DNlYRvAXqYE9vYj8YNq/BZAQj7IF0kLWd+hRrTyPo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=ck5P5kpX6ity2gpxKZfZaEEAXThi1c4zdLhNOEb4U2k892Aze6iGx5/u7yABynsJg
	 QS4yvp71B1NSI9K4vCmPOvGhifh/XPTLwJGVtVzb18fe1MaEwu2jQZT1F9DkBziSD7
	 ZixoV+7rOOZlBp2x7ibajTgXVxMu8hPfylOBNYE0=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 31FJXwxa050850
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 15 Feb 2023 13:33:58 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 15
 Feb 2023 13:33:57 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 15 Feb 2023 13:33:57 -0600
Received: from ula0226330.dal.design.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 31FJXt6j014221;
	Wed, 15 Feb 2023 13:33:57 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH v2 06/15] ti-sci-fw: Use new ti-secdev class to sign the images
Date: Wed, 15 Feb 2023 13:33:46 -0600
Message-ID: <20230215193355.9676-7-afd@ti.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230215193355.9676-1-afd@ti.com>
References: <20230215193355.9676-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 15 Feb 2023 19:34:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15858

Use the new ti-k3-secdev package to pull in the signing tools if they are
not provided by the environment.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
index 578f56b8..46d5111d 100644
--- a/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
+++ b/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
@@ -1,7 +1,4 @@
 require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
-# set a default value for TI_K3_SECDEV_INSTALL_DIR
-export TI_K3_SECDEV_INSTALL_DIR = "${STAGING_DIR_NATIVE}${datadir}/ti/ti-k3-secdev"
-include recipes-ti/includes/ti-paths.inc
 
 DEPENDS = "openssl-native u-boot-mkimage-native dtc-native virtual/bootloader"
 DEPENDS:remove:am65xx-evm-k3r5 = "virtual/bootloader"
@@ -12,7 +9,6 @@ DEPENDS:remove:j721e-evm-k3r5 = "virtual/bootloader"
 DEPENDS:remove:j721e-hs-evm-k3r5 = "virtual/bootloader"
 DEPENDS:remove:j721e-hs-evm-k3r5-sr1-1 = "virtual/bootloader"
 DEPENDS:remove:beaglebone-ai64-k3r5 = "virtual/bootloader"
-DEPENDS:append = "${@ '' if d.getVar('TI_SECURE_DEV_PKG_K3') else ' ti-k3-secdev-native' }"
 
 CLEANBROKEN = "1"
 PR = "${INC_PR}.2"
@@ -23,8 +19,8 @@ COMPATIBLE_MACHINE:aarch64 = "null"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-TI_SECURE_DEV_PKG = "${@ d.getVar('TI_SECURE_DEV_PKG_K3') or d.getVar('TI_K3_SECDEV_INSTALL_DIR') }"
-export TI_SECURE_DEV_PKG
+# Use TI SECDEV for signing
+inherit ti-secdev
 
 SYSFW_SOC ?= "unknown"
 SYSFW_SUFFIX ?= "unknown"
-- 
2.39.1


