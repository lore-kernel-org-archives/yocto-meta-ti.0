Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.20675.1643238550212070705
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 26 Jan 2022 15:09:10 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id A389E40CD1;
	Wed, 26 Jan 2022 23:09:09 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ydV09mHUlfc7; Wed, 26 Jan 2022 23:09:09 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 8B53040CC2;
	Wed, 26 Jan 2022 23:09:08 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id DEB56174739;
	Wed, 26 Jan 2022 18:09:04 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [RFC][master][PATCH 17/19] dspbios,biosutils: remove remnants of DSP/BIOS, predecessor to SYS/BIOS
Date: Wed, 26 Jan 2022 18:08:57 -0500
Message-Id: <1643238539-20686-18-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1643238539-20686-1-git-send-email-denis@denix.org>
References: <1643238539-20686-1-git-send-email-denis@denix.org>

From: Denys Dmytriyenko <denys@konsulko.com>

DSP/BIOS was the name for older versions of TI-RTOS, prior to SYS/BIOS and
used on older deprecated platforms. Remove any remnants.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 recipes-ti/bios/ti-biosutils.inc        | 18 ------------------
 recipes-ti/bios/ti-biosutils_1.02.02.bb | 12 ------------
 recipes-ti/bios/ti-dspbios.inc          | 25 -------------------------
 recipes-ti/includes/ti-paths.inc        |  3 ---
 4 files changed, 58 deletions(-)
 delete mode 100644 recipes-ti/bios/ti-biosutils.inc
 delete mode 100644 recipes-ti/bios/ti-biosutils_1.02.02.bb
 delete mode 100644 recipes-ti/bios/ti-dspbios.inc

diff --git a/recipes-ti/bios/ti-biosutils.inc b/recipes-ti/bios/ti-biosutils.inc
deleted file mode 100644
index d562c2d..0000000
--- a/recipes-ti/bios/ti-biosutils.inc
+++ /dev/null
@@ -1,18 +0,0 @@
-DESCRIPTION = "TI DSP/BIOS Utilities"
-HOMEPAGE = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/Bios_Utils"
-SECTION = "devel"
-LICENSE = "TI"
-LIC_FILES_CHKSUM = "file://packages/ti/bios/utils/Load.c;md5=e666d585907c3456e82b7e10f7a09a73"
-
-require ../includes/ti-paths.inc
-require ../includes/ti-staging.inc
-
-S = "${WORKDIR}/biosutils_${PV}"
-
-SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/Bios_Utils/${PV}${PVsuffix}/exports/biosutils_${PV}.tar.gz;name=biosutilstarball"
-
-do_install() {
-    install -d ${D}${BIOSUTILS_INSTALL_DIR_RECIPE}
-    cp -pPrf ${S}/* ${D}${BIOSUTILS_INSTALL_DIR_RECIPE}
-}
-
diff --git a/recipes-ti/bios/ti-biosutils_1.02.02.bb b/recipes-ti/bios/ti-biosutils_1.02.02.bb
deleted file mode 100644
index f62b9c2..0000000
--- a/recipes-ti/bios/ti-biosutils_1.02.02.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-require ti-biosutils.inc
-
-PV = "1_02_02"
-PVsuffix = "_02"
-
-SRC_URI[biosutilstarball.md5sum] = "0654e9e72b0a6fc7a6575829c0cd90c9"
-SRC_URI[biosutilstarball.sha256sum] = "df486500bdc8dbe3800fc7efe4241e6fa5b1827ba7c0dc17a71b41d42ef921e1"
-
-INSANE_SKIP:${PN} = "installed-vs-shipped"
-
-COMPATIBLE_HOST ?= "null"
-COMPATIBLE_HOST:ti-soc = "(.*)"
diff --git a/recipes-ti/bios/ti-dspbios.inc b/recipes-ti/bios/ti-dspbios.inc
deleted file mode 100644
index 0e3fa62..0000000
--- a/recipes-ti/bios/ti-dspbios.inc
+++ /dev/null
@@ -1,25 +0,0 @@
-DESCRIPTION = "TI DSP/BIOS v5 Kernel"
-HOMEPAGE = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/bios/dspbios"
-SECTION = "devel"
-LICENSE = "TI"
-
-# We can't depend on license files to be present, so just use the TI logo
-LIC_FILES_CHKSUM = "file://docs/tilogo.gif;md5=f049a774c576a5cef3fca4932d707b39"
-
-require ../includes/ti-paths.inc
-require ../includes/ti-staging.inc
-require ../includes/ti-eula-unpack.inc
-
-TI_BIN_UNPK_WDEXT="/bios_${PV}"
-S = "${WORKDIR}${TI_BIN_UNPK_WDEXT}"
-
-SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/bios/dspbios/${PV}/exports/bios_setuplinux_${PV}.bin;name=biosbin"
-
-BINFILE="bios_setuplinux_${PV}.bin"
-TI_BIN_UNPK_CMDS="Y: qY:workdir:Y"
-
-do_install() {
-    install -d ${D}${BIOS_INSTALL_DIR_RECIPE}
-    cp -pPrf ${S}/* ${D}${BIOS_INSTALL_DIR_RECIPE}
-}
-
diff --git a/recipes-ti/includes/ti-paths.inc b/recipes-ti/includes/ti-paths.inc
index 86689d3..ea985be 100644
--- a/recipes-ti/includes/ti-paths.inc
+++ b/recipes-ti/includes/ti-paths.inc
@@ -3,9 +3,7 @@ installdir = "${datadir}/ti"
 export TOOLCHAIN_PATH ?= "${STAGING_DIR_NATIVE}${prefix_native}/bin/${TARGET_SYS}"
 # This is where do_install will put it
 export AUDIO_SOC_INSTALL_DIR_RECIPE  = "${installdir}/ti-audio-soc-example-tree"
-export BIOS_INSTALL_DIR_RECIPE       = "${installdir}/ti-dspbios-tree"
 export BIOSPSP_INSTALL_DIR_RECIPE    = "${installdir}/ti-biospsp-tree"
-export BIOSUTILS_INSTALL_DIR_RECIPE  = "${installdir}/ti-biosutils-tree"
 export C6ACCEL_INSTALL_DIR_RECIPE    = "${installdir}/ti-c6accel-tree"
 export C6RUN_INSTALL_DIR_RECIPE      = "${installdir}/ti-c6run-tree"
 export CE_INSTALL_DIR_RECIPE         = "${installdir}/ti-codec-engine-tree"
@@ -60,7 +58,6 @@ export TI_CGT7X_INSTALL_DIR_RECIPE        = "${installdir}/cgt-c7x"
 # This is where the tools will end up in sysroot
 export BIOS_INSTALL_DIR       = "${STAGING_DIR_TARGET}${BIOS_INSTALL_DIR_RECIPE}"
 export BIOSPSP_INSTALL_DIR    = "${STAGING_DIR_TARGET}${BIOSPSP_INSTALL_DIR_RECIPE}"
-export BIOSUTILS_INSTALL_DIR  = "${STAGING_DIR_TARGET}${BIOSUTILS_INSTALL_DIR_RECIPE}"
 export C6ACCEL_INSTALL_DIR    = "${STAGING_DIR_TARGET}${C6ACCEL_INSTALL_DIR_RECIPE}"
 export C6RUN_INSTALL_DIR      = "${STAGING_DIR_TARGET}${C6RUN_INSTALL_DIR_RECIPE}"
 export CE_INSTALL_DIR         = "${STAGING_DIR_TARGET}${CE_INSTALL_DIR_RECIPE}"
-- 
2.7.4

