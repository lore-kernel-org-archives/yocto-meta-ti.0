Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75C39C7EE24
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 17:28:12 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.114.1684171685628019523
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 15 May 2023 10:28:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=yUPGT99u;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34FHS4sS022893;
	Mon, 15 May 2023 12:28:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1684171684;
	bh=EJ1sdQGdjD1a/CfvPCfrfR8u0KcoQxwpKGTz8raiVOw=;
	h=From:To:Subject:Date;
	b=yUPGT99uWlm2NoO8Qc3tNnwASyvz4doMUlLFPtz2MyOdmmv6o9xKG4ZSOlpI1ApQn
	 2HTrt+stoiKrredywncff1IOfKKCnyytVwCt00ekPQ+Muwhs9fRMPKxYYKtuyukJGG
	 g1gYpsMI6gAAoMnoYyKOupfmfTZk2LOTFGSJPvqs=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34FHS4tK036970
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 15 May 2023 12:28:04 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 15
 May 2023 12:28:04 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 15 May 2023 12:28:03 -0500
Received: from uda0214219 (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34FHS3s2082497;
	Mon, 15 May 2023 12:28:03 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1pybzP-0001PS-Ni; Mon, 15 May 2023 12:28:03 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/kirkstone][PATCH v2] ti-sci-fw: Add SYSFW_SUFFIX to SYSFW_BINARY to match k3-image-gen
Date: Mon, 15 May 2023 12:28:03 -0500
Message-ID: <20230515172803.5375-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 15 May 2023 17:28:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16533

k3_image_gen added the suffix to the sysfw binary to differentiate
between GP and HS binaries.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/conf/machine/am65xx-evm.conf      |  2 ++
 meta-ti-bsp/conf/machine/am65xx-hs-evm.conf   |  2 ++
 meta-ti-bsp/conf/machine/include/am65xx.inc   |  4 +--
 .../recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb    | 32 +++++++++----------
 4 files changed, 22 insertions(+), 18 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/am65xx-evm.conf b/meta-ti-bsp/conf/machine/am65xx-evm.conf
index 8b6ef546..63f2ecc5 100644
--- a/meta-ti-bsp/conf/machine/am65xx-evm.conf
+++ b/meta-ti-bsp/conf/machine/am65xx-evm.conf
@@ -2,6 +2,8 @@
 #@NAME: AM65xx EVM
 #@DESCRIPTION: Machine configuration for the TI AM65xx EVM
 
+SYSFW_SUFFIX = "gp"
+
 require conf/machine/include/am65xx.inc
 
 UBOOT_MACHINE = "am65x_evm_a53_defconfig"
diff --git a/meta-ti-bsp/conf/machine/am65xx-hs-evm.conf b/meta-ti-bsp/conf/machine/am65xx-hs-evm.conf
index 2c1256d0..84d616a4 100644
--- a/meta-ti-bsp/conf/machine/am65xx-hs-evm.conf
+++ b/meta-ti-bsp/conf/machine/am65xx-hs-evm.conf
@@ -2,6 +2,8 @@
 #@NAME: AM65xx HS EVM
 #@DESCRIPTION: Machine configuration for the TI AM65xx HS EVM
 
+SYSFW_SUFFIX = "hs"
+
 require conf/machine/include/am65xx.inc
 
 UBOOT_MACHINE = "am65x_hs_evm_a53_defconfig"
diff --git a/meta-ti-bsp/conf/machine/include/am65xx.inc b/meta-ti-bsp/conf/machine/include/am65xx.inc
index 9cbce243..10d2f293 100644
--- a/meta-ti-bsp/conf/machine/include/am65xx.inc
+++ b/meta-ti-bsp/conf/machine/include/am65xx.inc
@@ -18,10 +18,10 @@ do_image_complete[mcdepends] += "mc::k3r5:virtual/bootloader:do_deploy"
 # Default sysfw.itb on AM65x is for SR2.0
 BBMULTICONFIG += "k3r5-sr2"
 do_image_complete[mcdepends] += "mc::k3r5-sr2:ti-sci-fw:do_deploy"
-IMAGE_BOOT_FILES += "sysfw.itb"
+IMAGE_BOOT_FILES += "sysfw.itb sysfw-am65x_sr2-${SYSFW_SUFFIX}-evm.itb"
 
 # Since default sysfw.itb on AM65x is for SR2.0, add a version for SR1.0
-IMAGE_BOOT_FILES += "sysfw-am65x-evm.itb"
+IMAGE_BOOT_FILES += "sysfw-am65x-${SYSFW_SUFFIX}-evm.itb"
 
 TFA_BOARD = "generic"
 
diff --git a/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
index cde768df..ee995fa5 100644
--- a/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
+++ b/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
@@ -55,26 +55,26 @@ SYSFW_TISCI = "${S}/ti-sysfw/ti-${SYSFW_PREFIX}-firmware-${SYSFW_SOC}-*.bin"
 SYSFW_TIBOOT3 = "tiboot3-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONFIG}.bin"
 SYSFW_TIBOOT3_SYMLINK ?= "tiboot3.bin"
 
-SYSFW_BINARY = "sysfw-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
+SYSFW_BINARY = "sysfw-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONFIG}.itb"
 SYSFW_VBINARY = "sysfw-${PV}-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONFIG}.itb"
 SYSFW_IMAGE = "sysfw-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONFIG}.itb"
 SYSFW_SYMLINK ?= "sysfw.itb"
 
-SYSFW_VBINARY:am65xx-evm-k3r5 = "sysfw-${PV}-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
-SYSFW_VBINARY:am65xx-evm-k3r5-sr2 = "sysfw-${PV}-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
-SYSFW_VBINARY:am65xx-hs-evm-k3r5 = "sysfw-${PV}-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
-SYSFW_VBINARY:am65xx-hs-evm-k3r5-sr2 = "sysfw-${PV}-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
-SYSFW_VBINARY:j721e-evm-k3r5 = "sysfw-${PV}-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
-SYSFW_VBINARY:j721e-hs-evm-k3r5 = "sysfw-${PV}-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
-SYSFW_VBINARY:j721e-hs-evm-k3r5-sr1-1 = "sysfw-${PV}-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
-
-SYSFW_IMAGE:am65xx-evm-k3r5 = "sysfw-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
-SYSFW_IMAGE:am65xx-evm-k3r5-sr2 = "sysfw-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
-SYSFW_IMAGE:am65xx-hs-evm-k3r5 = "sysfw-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
-SYSFW_IMAGE:am65xx-hs-evm-k3r5-sr2 = "sysfw-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
-SYSFW_IMAGE:j721e-evm-k3r5 = "sysfw-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
-SYSFW_IMAGE:j721e-hs-evm-k3r5 = "sysfw-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
-SYSFW_IMAGE:j721e-hs-evm-k3r5-sr1-1 = "sysfw-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
+SYSFW_VBINARY:am65xx-evm-k3r5 = "sysfw-${PV}-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONFIG}.itb"
+SYSFW_VBINARY:am65xx-evm-k3r5-sr2 = "sysfw-${PV}-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONFIG}.itb"
+SYSFW_VBINARY:am65xx-hs-evm-k3r5 = "sysfw-${PV}-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONFIG}.itb"
+SYSFW_VBINARY:am65xx-hs-evm-k3r5-sr2 = "sysfw-${PV}-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONFIG}.itb"
+SYSFW_VBINARY:j721e-evm-k3r5 = "sysfw-${PV}-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONFIG}.itb"
+SYSFW_VBINARY:j721e-hs-evm-k3r5 = "sysfw-${PV}-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONFIG}.itb"
+SYSFW_VBINARY:j721e-hs-evm-k3r5-sr1-1 = "sysfw-${PV}-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONFIG}.itb"
+
+SYSFW_IMAGE:am65xx-evm-k3r5 = "sysfw-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONFIG}.itb"
+SYSFW_IMAGE:am65xx-evm-k3r5-sr2 = "sysfw-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONFIG}.itb"
+SYSFW_IMAGE:am65xx-hs-evm-k3r5 = "sysfw-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONFIG}.itb"
+SYSFW_IMAGE:am65xx-hs-evm-k3r5-sr2 = "sysfw-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONFIG}.itb"
+SYSFW_IMAGE:j721e-evm-k3r5 = "sysfw-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONFIG}.itb"
+SYSFW_IMAGE:j721e-hs-evm-k3r5 = "sysfw-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONFIG}.itb"
+SYSFW_IMAGE:j721e-hs-evm-k3r5-sr1-1 = "sysfw-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONFIG}.itb"
 
 CFLAGS[unexport] = "1"
 LDFLAGS[unexport] = "1"
-- 
2.17.1


