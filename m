Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20644C7EE33
	for <webhook@archiver.kernel.org>; Thu, 25 May 2023 18:11:41 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.19175.1685038297116882793
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 25 May 2023 11:11:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=tSBxvnfn;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34PIBaR9020394;
	Thu, 25 May 2023 13:11:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1685038296;
	bh=uxpHGRI68oMk/58+ayEr3vkzwlaMcLm35vwShlArhFY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=tSBxvnfnyI/DzhEHVSVSmtjUY+nPC5i9nfes5j7FpYhsXMH9bOEqVmEUS78Vop1JH
	 oCskz2RPkfIAmnLkZ3lsGipBjw6crxq0WblBeBQ+dWC7nI8V0I/WZ7X1vKdpQTS/zK
	 VMrG8mHr0DfxXcyxQElHuHRzHxmj1YyyzaJzZDM0=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34PIBaYi016382
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 25 May 2023 13:11:36 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 25
 May 2023 13:11:35 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 25 May 2023 13:11:35 -0500
Received: from lelv0326.itg.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34PIBXGw102467;
	Thu, 25 May 2023 13:11:35 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH 5/9] u-boot-ti-staging: Remove version 2021.01
Date: Thu, 25 May 2023 13:11:28 -0500
Message-ID: <20230525181132.417197-6-afd@ti.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16590

This will no longer build after we switch away from k3-image-gen. Remove
this version and make 2023.04 the default.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 ...e-to-support-oe-core-fitImage-naming.patch | 144 ------------------
 .../u-boot/u-boot-ti-staging_2021.01.bb       |  15 --
 2 files changed, 159 deletions(-)
 delete mode 100644 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging-2021.01/0001-configs-Update-to-support-oe-core-fitImage-naming.patch
 delete mode 100644 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb

diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging-2021.01/0001-configs-Update-to-support-oe-core-fitImage-naming.patch b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging-2021.01/0001-configs-Update-to-support-oe-core-fitImage-naming.patch
deleted file mode 100644
index 9a832312..00000000
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging-2021.01/0001-configs-Update-to-support-oe-core-fitImage-naming.patch
+++ /dev/null
@@ -1,144 +0,0 @@
-From 33c4b7335a39c48507a254505169df59c7a69c75 Mon Sep 17 00:00:00 2001
-From: Ryan Eatmon <reatmon@ti.com>
-Date: Thu, 23 Mar 2023 10:29:40 -0500
-Subject: [PATCH] configs: Update to support oe-core fitImage naming
-
-In kirkstone and forward, the values in the fitImage have been
-standardized to include both conf- and the vender subdir in the name of
-the dtbs.  This patch updates u-boot to support that.
-
-Signed-off-by: Ryan Eatmon <reatmon@ti.com>
----
- include/configs/am62x_evm.h       | 6 +++---
- include/configs/am64x_evm.h       | 4 ++--
- include/configs/am65x_evm.h       | 2 +-
- include/configs/j721e_evm.h       | 8 ++++----
- include/configs/j721s2_evm.h      | 6 +++---
- include/configs/j784s4_evm.h      | 6 +++---
- include/configs/ti_armv7_common.h | 2 +-
- 7 files changed, 17 insertions(+), 17 deletions(-)
-
-diff --git a/include/configs/am62x_evm.h b/include/configs/am62x_evm.h
-index 97bd7c1fd7..6d957c906b 100644
---- a/include/configs/am62x_evm.h
-+++ b/include/configs/am62x_evm.h
-@@ -122,11 +122,11 @@
- #define EXTRA_ENV_AM625_BOARD_SETTINGS					\
- 	"default_device_tree=" CONFIG_DEFAULT_DEVICE_TREE ".dtb\0"	\
- 	"findfdt="							\
--		"setenv name_fdt ${default_device_tree};"		\
-+		"setenv name_fdt ti_${default_device_tree};"		\
- 		"if test $board_name = am62x_skevm; then "		\
--			"setenv name_fdt k3-am625-sk.dtb; fi;"		\
-+			"setenv name_fdt ti_k3-am625-sk.dtb; fi;"		\
- 		"if test $board_name = am62x_lp_skevm; then "		\
--			"setenv name_fdt k3-am62x-lp-sk.dtb; fi;"	\
-+			"setenv name_fdt ti_k3-am62x-lp-sk.dtb; fi;"	\
- 		"setenv fdtfile ${name_fdt}\0"				\
- 	"name_kern=Image\0"						\
- 	"console=ttyS2,115200n8\0"					\
-diff --git a/include/configs/am64x_evm.h b/include/configs/am64x_evm.h
-index 33ba5da31f..d32b488b58 100644
---- a/include/configs/am64x_evm.h
-+++ b/include/configs/am64x_evm.h
-@@ -107,9 +107,9 @@
- #define EXTRA_ENV_AM642_BOARD_SETTINGS					\
- 	"findfdt="							\
- 		"if test $board_name = am64x_gpevm; then " \
--			"setenv fdtfile k3-am642-evm.dtb; fi; " \
-+			"setenv fdtfile ti_k3-am642-evm.dtb; fi; " \
- 		"if test $board_name = am64x_skevm; then " \
--			"setenv fdtfile k3-am642-sk.dtb; fi;" \
-+			"setenv fdtfile ti_k3-am642-sk.dtb; fi;" \
- 		"if test $fdtfile = undefined; then " \
- 			"echo WARNING: Could not determine device tree to use; fi; \0" \
- 	"name_kern=Image\0"						\
-diff --git a/include/configs/am65x_evm.h b/include/configs/am65x_evm.h
-index c78e4c4493..07d234d5d3 100644
---- a/include/configs/am65x_evm.h
-+++ b/include/configs/am65x_evm.h
-@@ -64,7 +64,7 @@
- /* U-Boot general configuration */
- #define EXTRA_ENV_AM65X_BOARD_SETTINGS					\
- 	"findfdt="							\
--		"setenv name_fdt k3-am654-base-board.dtb;"		\
-+		"setenv name_fdt ti_k3-am654-base-board.dtb;"		\
- 		"setenv fdtfile ${name_fdt}\0"				\
- 	"name_kern=Image\0"						\
- 	"console=ttyS2,115200n8\0"					\
-diff --git a/include/configs/j721e_evm.h b/include/configs/j721e_evm.h
-index 50b018b6ed..ad11494bd0 100644
---- a/include/configs/j721e_evm.h
-+++ b/include/configs/j721e_evm.h
-@@ -77,13 +77,13 @@
- #define EXTRA_ENV_J721E_BOARD_SETTINGS					\
- 	"default_device_tree=" CONFIG_DEFAULT_DEVICE_TREE ".dtb\0"	\
- 	"findfdt="							\
--		"setenv name_fdt ${default_device_tree};"		\
-+		"setenv name_fdt ti_${default_device_tree};"		\
- 		"if test $board_name = J721EX-PM1-SOM; then "		\
--			"setenv name_fdt k3-j721e-proc-board-tps65917.dtb; fi;" \
-+			"setenv name_fdt ti_k3-j721e-proc-board-tps65917.dtb; fi;" \
- 		"if test $board_name = j721e; then "			\
--			"setenv name_fdt k3-j721e-common-proc-board.dtb; fi;" \
-+			"setenv name_fdt ti_k3-j721e-common-proc-board.dtb; fi;" \
- 		"if test $board_name = j721e-eaik || test $board_name = j721e-sk; then " \
--			"setenv name_fdt k3-j721e-sk.dtb; fi;"	\
-+			"setenv name_fdt ti_k3-j721e-sk.dtb; fi;"	\
- 		"setenv fdtfile ${name_fdt}\0"				\
- 	"name_kern=Image\0"						\
- 	"console=ttyS2,115200n8\0"					\
-diff --git a/include/configs/j721s2_evm.h b/include/configs/j721s2_evm.h
-index 2d26eb544d..4b4d4a6e37 100644
---- a/include/configs/j721s2_evm.h
-+++ b/include/configs/j721s2_evm.h
-@@ -66,11 +66,11 @@
- #define EXTRA_ENV_J721S2_BOARD_SETTINGS					\
- 	"default_device_tree=" CONFIG_DEFAULT_DEVICE_TREE ".dtb\0"	\
- 	"findfdt="							\
--		"setenv name_fdt ${default_device_tree};"		\
-+		"setenv name_fdt ti_${default_device_tree};"		\
- 		"if test $board_name = j721s2; then "			\
--			"setenv name_fdt k3-j721s2-common-proc-board.dtb; fi;" \
-+			"setenv name_fdt ti_k3-j721s2-common-proc-board.dtb; fi;" \
- 		"if test $board_name = am68-sk; then "			\
--			"setenv name_fdt k3-am68-sk-base-board.dtb; fi;"\
-+			"setenv name_fdt ti_k3-am68-sk-base-board.dtb; fi;"\
- 		"setenv fdtfile ${name_fdt}\0"				\
- 	"name_kern=Image\0"						\
- 	"console=ttyS2,115200n8\0"					\
-diff --git a/include/configs/j784s4_evm.h b/include/configs/j784s4_evm.h
-index eb609100b0..30820ea1c6 100644
---- a/include/configs/j784s4_evm.h
-+++ b/include/configs/j784s4_evm.h
-@@ -67,11 +67,11 @@
- #define EXTRA_ENV_J784S4_BOARD_SETTINGS					\
- 	"default_device_tree=" CONFIG_DEFAULT_DEVICE_TREE ".dtb\0"	\
- 	"findfdt="                                                      \
--		"setenv name_fdt ${default_device_tree};"               \
-+		"setenv name_fdt ti_${default_device_tree};"               \
- 		"if test $board_name = am69-sk; then "           \
--			"setenv name_fdt k3-am69-sk.dtb; fi;" \
-+			"setenv name_fdt ti_k3-am69-sk.dtb; fi;" \
- 		"if test $board_name = j784s4; then "                    \
--			"setenv name_fdt k3-j784s4-evm.dtb; fi;" \
-+			"setenv name_fdt ti_k3-j784s4-evm.dtb; fi;" \
- 		"setenv fdtfile ${name_fdt}\0"				\
- 	"name_kern=Image\0"						\
- 	"console=ttyS2,115200n8\0"					\
-diff --git a/include/configs/ti_armv7_common.h b/include/configs/ti_armv7_common.h
-index c48c4c2398..29de095729 100644
---- a/include/configs/ti_armv7_common.h
-+++ b/include/configs/ti_armv7_common.h
-@@ -68,7 +68,7 @@
- 		"do;" \
- 		"setenv overlaystring ${overlaystring}'#'${overlay};" \
- 		"done;\0" \
--	"run_fit=bootm ${addr_fit}#${fdtfile}${overlaystring}\0" \
-+	"run_fit=bootm ${addr_fit}#conf-${fdtfile}${overlaystring}\0" \
- 
- /*
-  * DDR information.  If the CONFIG_NR_DRAM_BANKS is not defined,
--- 
-2.17.1
-
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
deleted file mode 100644
index 8984d859..00000000
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-
-FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}-${PV}:"
-
-require u-boot-ti.inc
-
-LIC_FILES_CHKSUM = "file://Licenses/README;md5=5a7450c57ffe5ae63fd732446b988025"
-
-PR = "r34"
-
-BRANCH = "ti-u-boot-2021.01"
-
-SRCREV = "3a5205e9803809f18edc59a40fd9df470f98a00f"
-
-SRC_URI += "file://0001-configs-Update-to-support-oe-core-fitImage-naming.patch"
-
-- 
2.39.2


