Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 09F9CE00758; Wed,  5 Aug 2015 04:04:41 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at http://www.dnswl.org/,
	high *      trust
	*      [192.94.94.41 listed in list.dnswl.org]
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B116AE0034B
	for <meta-ti@yoctoproject.org>; Wed,  5 Aug 2015 04:04:33 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t75B4WGP005394
	for <meta-ti@yoctoproject.org>; Wed, 5 Aug 2015 06:04:32 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t75B4WAc029935
	for <meta-ti@yoctoproject.org>; Wed, 5 Aug 2015 06:04:32 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 5 Aug 2015 06:04:32 -0500
Received: from udc0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t75B4VcX032188;	Wed, 5 Aug 2015 06:04:31 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 5 Aug 2015 07:04:29 -0400
Message-ID: <1438772669-16906-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH v2] ti-xdctools: Add version 3.31.02.38.
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Wed, 05 Aug 2015 11:04:41 -0000
Content-Type: text/plain

* This version adheres to the new "core" package format.
* Add the version-indepedent include file for the core packages
* Extract common information between the core and legacy packages
  into the ti-xdctools-common.inc file.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
v2 changes: Use "-M -C -C" flags when generating patch.

 .../{ti-xdctools.inc => ti-xdctools-common.inc}    | 16 ++-----
 recipes-ti/devtools/ti-xdctools-core.inc           |  5 ++
 recipes-ti/devtools/ti-xdctools.inc                | 54 +---------------------
 recipes-ti/devtools/ti-xdctools_3.31.02.38.bb      |  9 ++++
 4 files changed, 19 insertions(+), 65 deletions(-)
 copy recipes-ti/devtools/{ti-xdctools.inc => ti-xdctools-common.inc} (72%)
 create mode 100644 recipes-ti/devtools/ti-xdctools-core.inc
 create mode 100644 recipes-ti/devtools/ti-xdctools_3.31.02.38.bb

diff --git a/recipes-ti/devtools/ti-xdctools.inc b/recipes-ti/devtools/ti-xdctools-common.inc
similarity index 72%
copy from recipes-ti/devtools/ti-xdctools.inc
copy to recipes-ti/devtools/ti-xdctools-common.inc
index 547a555..2d5f2d7 100644
--- a/recipes-ti/devtools/ti-xdctools.inc
+++ b/recipes-ti/devtools/ti-xdctools-common.inc
@@ -3,23 +3,16 @@ HOMEPAGE = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/r
 SECTION = "devel"
 LICENSE = "BSD & GPLv2"
 
-require ../includes/ti-paths.inc
-require ../includes/ti-staging.inc
-require ../includes/ti-eula-unpack.inc
-
-S = "${WORKDIR}/xdctools_${PV}"
-
-SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/rtsc/${PV}/exports/xdctools_setuplinux_${PV}.bin;name=xdcbin"
-
-BINFILE="xdctools_setuplinux_${PV}.bin"
-TI_BIN_UNPK_CMDS="Y:workdir:Y"
-TI_BIN_UNPK_WDEXT="/ti"
+require recipes-ti/includes/ti-paths.inc
+require recipes-ti/includes/ti-staging.inc
 
 do_install() {
     install -d ${D}${XDC_INSTALL_DIR_RECIPE}
     cp -pPrf ${S}/* ${D}${XDC_INSTALL_DIR_RECIPE}
 }
 
+INSANE_SKIP_${PN} = "installed-vs-shipped"
+
 # Prevent internal libs from getting picked up
 PRIVATE_LIBS = " \
 libncdb.so \
@@ -59,4 +52,3 @@ libhpi.so \
 lib.so \
 libcairo.so.2 \
 "
-
diff --git a/recipes-ti/devtools/ti-xdctools-core.inc b/recipes-ti/devtools/ti-xdctools-core.inc
new file mode 100644
index 0000000..47f73b6
--- /dev/null
+++ b/recipes-ti/devtools/ti-xdctools-core.inc
@@ -0,0 +1,5 @@
+require ti-xdctools-common.inc
+
+S = "${WORKDIR}/xdctools_${PV}_core"
+
+SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/rtsc/${PV}/exports/xdccore/xdctools_${PV}_core_linux.zip;name=xdczip"
diff --git a/recipes-ti/devtools/ti-xdctools.inc b/recipes-ti/devtools/ti-xdctools.inc
index 547a555..1415f83 100644
--- a/recipes-ti/devtools/ti-xdctools.inc
+++ b/recipes-ti/devtools/ti-xdctools.inc
@@ -1,10 +1,4 @@
-DESCRIPTION = "TI XDCtools (RTSC - Real Time Software Components - http://rtsc.eclipse.org)"
-HOMEPAGE = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/rtsc"
-SECTION = "devel"
-LICENSE = "BSD & GPLv2"
-
-require ../includes/ti-paths.inc
-require ../includes/ti-staging.inc
+require ti-xdctools-common.inc
 require ../includes/ti-eula-unpack.inc
 
 S = "${WORKDIR}/xdctools_${PV}"
@@ -14,49 +8,3 @@ SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/rt
 BINFILE="xdctools_setuplinux_${PV}.bin"
 TI_BIN_UNPK_CMDS="Y:workdir:Y"
 TI_BIN_UNPK_WDEXT="/ti"
-
-do_install() {
-    install -d ${D}${XDC_INSTALL_DIR_RECIPE}
-    cp -pPrf ${S}/* ${D}${XDC_INSTALL_DIR_RECIPE}
-}
-
-# Prevent internal libs from getting picked up
-PRIVATE_LIBS = " \
-libncdb.so \
-libcdb.so \
-libjavaplugin_oji.so \
-libjavaplugin_jni.so \
-libjsound.so \
-libinstrument.so \
-libjawt.so \
-libzip.so \
-libjava_crw_demo.so \
-libjavaplugin_nscp_gcc29.so \
-libhprof.so \
-libcmm.so \
-libjdwp.so \
-libmlib_image.so \
-libjpeg.so \
-libverify.so \
-libjavaplugin_nscp.so \
-libmanagement.so \
-libunpack.so \
-librmi.so \
-libJdbcOdbc.so \
-libawt.so \
-libnet.so \
-libjaas_unix.so \
-libnio.so \
-libdcpr.so \
-libioser12.so \
-libjsoundalsa.so \
-libjava.so \
-libfontmanager.so \
-libdt_socket.so \
-libmawt.so \
-libjvm.so \
-libhpi.so \
-lib.so \
-libcairo.so.2 \
-"
-
diff --git a/recipes-ti/devtools/ti-xdctools_3.31.02.38.bb b/recipes-ti/devtools/ti-xdctools_3.31.02.38.bb
new file mode 100644
index 0000000..5e970ee
--- /dev/null
+++ b/recipes-ti/devtools/ti-xdctools_3.31.02.38.bb
@@ -0,0 +1,9 @@
+require ti-xdctools-core.inc
+
+PV = "3_31_02_38"
+PR = "r0"
+
+LIC_FILES_CHKSUM = "file://docs/license/xdc/shelf/package.html;md5=9dbb0095cdb8b35508b344aa4f1de333"
+
+SRC_URI[xdczip.md5sum] = "c76b3d90c3e25d199765557e393d165b"
+SRC_URI[xdczip.sha256sum] = "c0e1f6911f2294bfb76471fac1a0ceac3e89c7eb1300f84d2571bf78cb62a7d2"
-- 
1.9.1


