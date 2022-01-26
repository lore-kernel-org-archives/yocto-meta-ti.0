Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web09.20895.1643238548174360677
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 26 Jan 2022 15:09:08 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6063540CC7;
	Wed, 26 Jan 2022 23:09:07 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sepLxwBGomZ9; Wed, 26 Jan 2022 23:09:07 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 4EF9C40CBF;
	Wed, 26 Jan 2022 23:09:06 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 0A2D717472B;
	Wed, 26 Jan 2022 18:09:04 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [RFC][master][PATCH 03/19] hdvpss: remove DaVinci High-Definition Video Processing Subsystem (HDVPSS)
Date: Wed, 26 Jan 2022 18:08:43 -0500
Message-Id: <1643238539-20686-4-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1643238539-20686-1-git-send-email-denis@denix.org>
References: <1643238539-20686-1-git-send-email-denis@denix.org>

From: Denys Dmytriyenko <denys@konsulko.com>

Due to DaVinci family of platforms being deprecated.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 recipes-ti/hdvpss/ti-hdvpss.inc            | 20 --------------------
 recipes-ti/hdvpss/ti-hdvpss_01.00.01.27.bb |  7 -------
 recipes-ti/includes/ti-paths.inc           |  2 --
 3 files changed, 29 deletions(-)
 delete mode 100644 recipes-ti/hdvpss/ti-hdvpss.inc
 delete mode 100644 recipes-ti/hdvpss/ti-hdvpss_01.00.01.27.bb

diff --git a/recipes-ti/hdvpss/ti-hdvpss.inc b/recipes-ti/hdvpss/ti-hdvpss.inc
deleted file mode 100644
index 3c99b79..0000000
--- a/recipes-ti/hdvpss/ti-hdvpss.inc
+++ /dev/null
@@ -1,20 +0,0 @@
-DESCRIPTION = "TI HDVPSS"
-SECTION = "devel"
-LICENSE = "TI"
-
-require ../includes/ti-paths.inc
-require ../includes/ti-staging.inc
-
-S = "${WORKDIR}/REL.HDVPSS_${PV}"
-
-SRC_URI = "http://install.source.dir.local/REL.HDVPSS.${PV}.zip"
-
-do_compile() {
-    :
-}
-
-do_install() {
-    install -d ${D}${HDVPSS_INSTALL_DIR_RECIPE}
-    cp -pPrf ${S}/* ${D}${HDVPSS_INSTALL_DIR_RECIPE}
-}
-
diff --git a/recipes-ti/hdvpss/ti-hdvpss_01.00.01.27.bb b/recipes-ti/hdvpss/ti-hdvpss_01.00.01.27.bb
deleted file mode 100644
index 0428b14..0000000
--- a/recipes-ti/hdvpss/ti-hdvpss_01.00.01.27.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require ti-hdvpss.inc
-
-SRC_URI[md5sum] = "6db908bef3b933dc8cea666564d5d4d8"
-SRC_URI[sha256sum] = "2caa9c859cfe348197e860f07d174a8ab7048d38d6d3a12ec576802122c9e91e"
-
-COMPATIBLE_HOST ?= "null"
-COMPATIBLE_HOST:ti-soc = "(.*)"
diff --git a/recipes-ti/includes/ti-paths.inc b/recipes-ti/includes/ti-paths.inc
index 7118035..a2d6b26 100644
--- a/recipes-ti/includes/ti-paths.inc
+++ b/recipes-ti/includes/ti-paths.inc
@@ -27,7 +27,6 @@ export FC3_INSTALL_DIR_RECIPE        = "${installdir}/ti-framework-components3-t
 export FC_INSTALL_DIR_RECIPE         = "${installdir}/ti-framework-components-tree"
 export GFX_SDK_INSTALL_DIR_RECIPE    = "${installdir}/ti-gfx-sdk-tree"
 export HDVICP20_INSTALL_DIR_RECIPE   = "${installdir}/ti-hdvicp20-tree"
-export HDVPSS_INSTALL_DIR_RECIPE     = "${installdir}/ti-hdvpss-tree"
 export IMGLIB_C64P_INSTALL_DIR_RECIPE= "${installdir}/ti-imglib-tree"
 export IPC_INSTALL_DIR_RECIPE        = "${installdir}/ti-ipc-tree"
 export LINK_INSTALL_DIR_RECIPE       = "${installdir}/ti-dsplink-tree"
@@ -82,7 +81,6 @@ export FASTMATHLIB_C674P_INSTALL_DIR = "${STAGING_DIR_TARGET}${FASTMATHLIB_C674P
 export FC3_INSTALL_DIR        = "${STAGING_DIR_TARGET}${FC3_INSTALL_DIR_RECIPE}"
 export FC_INSTALL_DIR         = "${STAGING_DIR_TARGET}${FC_INSTALL_DIR_RECIPE}"
 export HDVICP20_INSTALL_DIR   = "${STAGING_DIR_TARGET}${HDVICP20_INSTALL_DIR_RECIPE}"
-export HDVPSS_INSTALL_DIR     = "${STAGING_DIR_TARGET}${HDVPSS_INSTALL_DIR_RECIPE}"
 export IMGLIB_C64P_INSTALL_DIR= "${STAGING_DIR_TARGET}${IMGLIB_C64P_INSTALL_DIR_RECIPE}"
 export IPC_INSTALL_DIR        = "${STAGING_DIR_TARGET}${IPC_INSTALL_DIR_RECIPE}"
 export LINK_INSTALL_DIR       = "${STAGING_DIR_TARGET}${LINK_INSTALL_DIR_RECIPE}"
-- 
2.7.4

