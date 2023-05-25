Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36F40C7EE3A
	for <webhook@archiver.kernel.org>; Thu, 25 May 2023 18:11:41 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.19173.1685038296661703602
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 25 May 2023 11:11:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=l8jhLpbB;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34PIBZBq020389;
	Thu, 25 May 2023 13:11:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1685038295;
	bh=vQlqC8QI22RpczZxMiuGiptunwvSIc93GvrhOSsnIUU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=l8jhLpbBL4OMb9j70TH1rn+zVUZoc0mXoh6DmKGIenoGWrkU1KhAXRKnyveJmVL50
	 k3t7rzosOQN3gCJx5eAzAOhefnRy3ynEeknUOfib8F2HTqnh/NC35MTOqIeYrDF1dJ
	 BXxTn3lARad0v1FAl7uABOYzQ44UBYSvpChmd/1I=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34PIBZpI085283
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 25 May 2023 13:11:35 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 25
 May 2023 13:11:35 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 25 May 2023 13:11:35 -0500
Received: from lelv0326.itg.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34PIBXGv102467;
	Thu, 25 May 2023 13:11:35 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH 4/9] u-boot-bb.org: Remove this recipe
Date: Thu, 25 May 2023 13:11:27 -0500
Message-ID: <20230525181132.417197-5-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230525181132.417197-1-afd@ti.com>
References: <20230525181132.417197-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 25 May 2023 18:11:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16588

This will no longer build after we switch away from k3-image-gen. Remove
this version until it can be rebased on the latest U-Boot with binman
support. For now switch current users of this over to u-boot-ti v2021.01.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-ti-bsp/conf/machine/beagle-x15.conf      |  2 --
 .../conf/machine/beaglebone-ai64-k3r5.conf    |  3 ---
 meta-ti-bsp/conf/machine/beaglebone-ai64.conf |  2 --
 meta-ti-bsp/conf/machine/beaglebone.conf      |  2 --
 meta-ti-bsp/conf/machine/beagleplay-k3r5.conf |  3 ---
 meta-ti-bsp/conf/machine/beagleplay.conf      |  2 --
 .../recipes-bsp/u-boot/u-boot-bb.org_git.bb   | 24 -------------------
 7 files changed, 38 deletions(-)
 delete mode 100644 meta-ti-bsp/recipes-bsp/u-boot/u-boot-bb.org_git.bb

diff --git a/meta-ti-bsp/conf/machine/beagle-x15.conf b/meta-ti-bsp/conf/machine/beagle-x15.conf
index fb52245b..be27705c 100644
--- a/meta-ti-bsp/conf/machine/beagle-x15.conf
+++ b/meta-ti-bsp/conf/machine/beagle-x15.conf
@@ -5,8 +5,6 @@
 require conf/machine/include/am57xx.inc
 
 PREFERRED_PROVIDER_virtual/kernel = "linux-bb.org"
-PREFERRED_PROVIDER_virtual/bootloader = "u-boot-bb.org"
-PREFERRED_PROVIDER_u-boot = "u-boot-bb.org"
 
 KERNEL_DEVICETREE_PREFIX = "am57xx-beagle-x15"
 
diff --git a/meta-ti-bsp/conf/machine/beaglebone-ai64-k3r5.conf b/meta-ti-bsp/conf/machine/beaglebone-ai64-k3r5.conf
index 7c99b5d4..b893f380 100644
--- a/meta-ti-bsp/conf/machine/beaglebone-ai64-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/beaglebone-ai64-k3r5.conf
@@ -4,9 +4,6 @@
 
 require conf/machine/include/k3r5.inc
 
-PREFERRED_PROVIDER_virtual/bootloader = "u-boot-bb.org"
-PREFERRED_PROVIDER_u-boot = "u-boot-bb.org"
-
 SYSFW_SOC = "j721e"
 SYSFW_CONFIG = "evm"
 SYSFW_SUFFIX = "gp"
diff --git a/meta-ti-bsp/conf/machine/beaglebone-ai64.conf b/meta-ti-bsp/conf/machine/beaglebone-ai64.conf
index 304cbb62..bd5f541f 100644
--- a/meta-ti-bsp/conf/machine/beaglebone-ai64.conf
+++ b/meta-ti-bsp/conf/machine/beaglebone-ai64.conf
@@ -7,8 +7,6 @@ require conf/machine/include/j721e.inc
 UBOOT_MACHINE = "j721e_evm_a72_config"
 
 PREFERRED_PROVIDER_virtual/kernel = "linux-bb.org"
-PREFERRED_PROVIDER_virtual/bootloader = "u-boot-bb.org"
-PREFERRED_PROVIDER_u-boot = "u-boot-bb.org"
 
 KERNEL_DEVICETREE = " \
 ti/k3-j721e-beagleboneai64.dtb \
diff --git a/meta-ti-bsp/conf/machine/beaglebone.conf b/meta-ti-bsp/conf/machine/beaglebone.conf
index dceef1db..2d811d0d 100644
--- a/meta-ti-bsp/conf/machine/beaglebone.conf
+++ b/meta-ti-bsp/conf/machine/beaglebone.conf
@@ -5,8 +5,6 @@
 require conf/machine/include/ti33x.inc
 
 PREFERRED_PROVIDER_virtual/kernel = "linux-bb.org"
-PREFERRED_PROVIDER_virtual/bootloader = "u-boot-bb.org"
-PREFERRED_PROVIDER_u-boot = "u-boot-bb.org"
 
 KERNEL_DEVICETREE_PREFIX = "am335x-bone"
 
diff --git a/meta-ti-bsp/conf/machine/beagleplay-k3r5.conf b/meta-ti-bsp/conf/machine/beagleplay-k3r5.conf
index c40615c9..f8f08d63 100644
--- a/meta-ti-bsp/conf/machine/beagleplay-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/beagleplay-k3r5.conf
@@ -4,9 +4,6 @@
 
 require conf/machine/include/k3r5.inc
 
-PREFERRED_PROVIDER_virtual/bootloader = "u-boot-bb.org"
-PREFERRED_PROVIDER_u-boot = "u-boot-bb.org"
-
 SYSFW_SOC = "am62x"
 SYSFW_CONFIG = "evm"
 SYSFW_SUFFIX = "gp"
diff --git a/meta-ti-bsp/conf/machine/beagleplay.conf b/meta-ti-bsp/conf/machine/beagleplay.conf
index c7b1414a..23f44c3f 100644
--- a/meta-ti-bsp/conf/machine/beagleplay.conf
+++ b/meta-ti-bsp/conf/machine/beagleplay.conf
@@ -21,8 +21,6 @@ OPTEEMACHINE = "k3-am62x"
 UBOOT_MACHINE = "am62x_evm_a53_defconfig"
 
 PREFERRED_PROVIDER_virtual/kernel = "linux-bb.org"
-PREFERRED_PROVIDER_virtual/bootloader = "u-boot-bb.org"
-PREFERRED_PROVIDER_u-boot = "u-boot-bb.org"
 
 KERNEL_DEVICETREE = " \
 ti/k3-am625-beagleplay.dtb \
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-bb.org_git.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-bb.org_git.bb
deleted file mode 100644
index 4e4688aa..00000000
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-bb.org_git.bb
+++ /dev/null
@@ -1,24 +0,0 @@
-require u-boot-ti.inc
-
-SUMMARY = "BeagleBoard.org U-Boot"
-
-COMPATIBLE_MACHINE = "beagle.*"
-
-LIC_FILES_CHKSUM = "file://Licenses/README;md5=5a7450c57ffe5ae63fd732446b988025"
-
-PV = "2021.01"
-
-UBOOT_GIT_URI = "git://github.com/beagleboard/u-boot.git"
-UBOOT_GIT_PROTOCOL = "https"
-BRANCH = "v2021.01-ti-08.05.00.005-SDK-8.5"
-SRCREV = "46ff4982b41067e5c93369bddd49b1541856d80b"
-
-BRANCH:beaglebone-ai64 = "v2021.01-ti-08.05.00.001"
-BRANCH:beaglebone-ai64-k3r5 = "v2021.01-ti-08.05.00.001"
-SRCREV:beaglebone-ai64 = "ea96725b5156135d5875415f75d2188f6f56622a"
-SRCREV:beaglebone-ai64-k3r5 = "ea96725b5156135d5875415f75d2188f6f56622a"
-
-BRANCH:beagleplay = "v2021.01-ti-BeaglePlay-Release"
-BRANCH:beagleplay-k3r5 = "v2021.01-ti-BeaglePlay-Release"
-SRCREV:beagleplay = "f036fbdc25941d7585182d2552c767edb9b04114"
-SRCREV:beagleplay-k3r5 = "f036fbdc25941d7585182d2552c767edb9b04114"
-- 
2.39.2


