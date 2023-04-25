Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76D87C77B61
	for <webhook@archiver.kernel.org>; Tue, 25 Apr 2023 17:23:59 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.86185.1682443429412350333
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 25 Apr 2023 10:23:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Jv6Mig6p;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33PHNmVH052987;
	Tue, 25 Apr 2023 12:23:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1682443428;
	bh=7j+zE7Gev+FhVonAVu79wE0gcqYgYyp23r3Q4Q0g8dw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Jv6Mig6pYKkKbzEVJ0otL4XbYqz40qhWzkDkNfHIuO3iBVYSqXG7Shty/8gGJxiLW
	 /66kZ+RhUTmR2x0gf7aVkAV2YCTFqsnSLnu5mOD4xvkn4QPSjKyr3AnXJLOnyCMpaM
	 z44unR1qFqd4bdITynJq9spzMn95QMf9brkrAjAw=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33PHNmru123167
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 25 Apr 2023 12:23:48 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 25
 Apr 2023 12:23:48 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Tue, 25 Apr 2023 12:23:48 -0500
Received: from ula0226330.dal.design.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33PHNj0s030178;
	Tue, 25 Apr 2023 12:23:47 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        Praneeth Bajjuri <praneeth@ti.com>,
        Neha Malcom Francis <n-francis@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master/kirkstone][RFC 5/9] u-boot-ti-staging: Remove version 2021.01
Date: Tue, 25 Apr 2023 12:23:41 -0500
Message-ID: <20230425172345.12293-6-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230425172345.12293-1-afd@ti.com>
References: <20230425172345.12293-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 25 Apr 2023 17:23:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16423

This will no longer build after we switch away from k3-image-gen. Remove
this version and make 2023.04 the default.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 ...e-to-support-oe-core-fitImage-naming.patch | 144 ------------------
 .../u-boot/u-boot-ti-staging_2021.01.bb       |  15 --
 .../u-boot/u-boot-ti-staging_2023.04.bb       |   2 -
 3 files changed, 161 deletions(-)
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
index 7529ce6c..00000000
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
-SRCREV = "2ee8efd6543648c6b8a14d93d52a6038854035c8"
-
-SRC_URI += "file://0001-configs-Update-to-support-oe-core-fitImage-naming.patch"
-
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb
index 6a46e812..c7006717 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb
@@ -7,5 +7,3 @@ PR = "r0"
 BRANCH = "ti-u-boot-2023.04"
 
 SRCREV = "41a88ad529b3943b1e465846eb24fe2c29203e35"
-
-DEFAULT_PREFERENCE = "-1"
-- 
2.39.2


