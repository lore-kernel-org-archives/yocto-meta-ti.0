Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27879C6379F
	for <webhook@archiver.kernel.org>; Tue, 14 Feb 2023 14:54:05 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.8828.1676386435250612486
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 14 Feb 2023 06:53:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=aNg0z0ka;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: afd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 31EErs9s101077;
	Tue, 14 Feb 2023 08:53:54 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1676386434;
	bh=ILpbF1b3J1Q9F45u1q180TU0TTRmszIa3whEs4U5qD8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=aNg0z0kauEsgYCR10zN+E2vXMeTeONZN3rJN/wMMDhuQJUCGZgd7jf7/uwlTMuA0h
	 YZF8QK1Pvuk6kgo4g77CD0siv8T053bH2ahrXEhcW4PThHXM0DuiRdi4pnjd+wHOZm
	 hiELEJ+o9Pofblev+TqE8QCWdnTHiUtj12AEFT/s=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 31EErsjN033598
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 14 Feb 2023 08:53:54 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 14
 Feb 2023 08:53:53 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Tue, 14 Feb 2023 08:53:53 -0600
Received: from ula0226330.dal.design.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 31EErqPf048291;
	Tue, 14 Feb 2023 08:53:53 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH 3/4] ti-sci-fw: Use SOC_FAMILY to select boot and sysfw type
Date: Tue, 14 Feb 2023 08:53:51 -0600
Message-ID: <20230214145352.12093-3-afd@ti.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230214145352.12093-1-afd@ti.com>
References: <20230214145352.12093-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 14 Feb 2023 14:54:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15836

Use the new SOC_FAMILY SoC information to select boot type and
SYSFW/TIFS split. This removes the need to add to this recipe
for each new board, only for new SoCs.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb    | 36 +++++--------------
 1 file changed, 9 insertions(+), 27 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
index 578f56b8..e9c90a76 100644
--- a/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
+++ b/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
@@ -4,14 +4,8 @@ export TI_K3_SECDEV_INSTALL_DIR = "${STAGING_DIR_NATIVE}${datadir}/ti/ti-k3-secd
 include recipes-ti/includes/ti-paths.inc
 
 DEPENDS = "openssl-native u-boot-mkimage-native dtc-native virtual/bootloader"
-DEPENDS:remove:am65xx-evm-k3r5 = "virtual/bootloader"
-DEPENDS:remove:am65xx-evm-k3r5-sr2 = "virtual/bootloader"
-DEPENDS:remove:am65xx-hs-evm-k3r5 = "virtual/bootloader"
-DEPENDS:remove:am65xx-hs-evm-k3r5-sr2 = "virtual/bootloader"
-DEPENDS:remove:j721e-evm-k3r5 = "virtual/bootloader"
-DEPENDS:remove:j721e-hs-evm-k3r5 = "virtual/bootloader"
-DEPENDS:remove:j721e-hs-evm-k3r5-sr1-1 = "virtual/bootloader"
-DEPENDS:remove:beaglebone-ai64-k3r5 = "virtual/bootloader"
+DEPENDS:remove:am65xx = "virtual/bootloader"
+DEPENDS:remove:j721e = "virtual/bootloader"
 DEPENDS:append = "${@ '' if d.getVar('TI_SECURE_DEV_PKG_K3') else ' ti-k3-secdev-native' }"
 
 CLEANBROKEN = "1"
@@ -31,17 +25,11 @@ SYSFW_SUFFIX ?= "unknown"
 SYSFW_CONFIG ?= "unknown"
 
 SYSFW_PREFIX = "sci"
-SYSFW_PREFIX:j721e-evm-k3r5 = "fs"
-SYSFW_PREFIX:j721e-hs-evm-k3r5 = "fs"
-SYSFW_PREFIX:j721e-hs-evm-k3r5-sr1-1 = "fs"
-SYSFW_PREFIX:beaglebone-ai64-k3r5 = "fs"
-SYSFW_PREFIX:j7200-evm-k3r5 = "fs"
-SYSFW_PREFIX:j7200-hs-evm-k3r5 = "fs"
-SYSFW_PREFIX:j721s2-evm-k3r5 = "fs"
-SYSFW_PREFIX:j721s2-hs-evm-k3r5 = "fs"
-SYSFW_PREFIX:j784s4-evm-k3r5 = "fs"
-SYSFW_PREFIX:am62xx-evm-k3r5 = "fs"
-SYSFW_PREFIX:am62xx-lp-evm-k3r5 = "fs"
+SYSFW_PREFIX:j721e = "fs"
+SYSFW_PREFIX:j7200 = "fs"
+SYSFW_PREFIX:j721s2 = "fs"
+SYSFW_PREFIX:j784s4 = "fs"
+SYSFW_PREFIX:am62xx = "fs"
 
 SYSFW_TISCI = "${S}/ti-sysfw/ti-${SYSFW_PREFIX}-firmware-${SYSFW_SOC}-*.bin"
 
@@ -65,14 +53,8 @@ EXTRA_OEMAKE = "\
     CONFIG=${SYSFW_CONFIG} SYSFW_DIR="${S}/ti-sysfw" \
     SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin" \
 "
-EXTRA_OEMAKE:remove:am65xx-evm-k3r5 = "SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
-EXTRA_OEMAKE:remove:am65xx-evm-k3r5-sr2 = "SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
-EXTRA_OEMAKE:remove:am65xx-hs-evm-k3r5 = "SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
-EXTRA_OEMAKE:remove:am65xx-hs-evm-k3r5-sr2 = "SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
-EXTRA_OEMAKE:remove:j721e-evm-k3r5 = "SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
-EXTRA_OEMAKE:remove:j721e-hs-evm-k3r5 = "SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
-EXTRA_OEMAKE:remove:j721e-hs-evm-k3r5-sr1-1 = "SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
-EXTRA_OEMAKE:remove:beaglebone-ai64-k3r5 = "SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
+EXTRA_OEMAKE:remove:am65xx = "SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
+EXTRA_OEMAKE:remove:j721e = "SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
 
 do_compile() {
 	cd ${WORKDIR}/imggen/
-- 
2.39.1


