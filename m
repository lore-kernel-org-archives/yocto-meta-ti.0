Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6D034E00A96; Mon, 10 Aug 2015 10:14:42 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,RDNS_DYNAMIC
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  1.0 RDNS_DYNAMIC Delivered to internal network by host with
	*      dynamic-looking rDNS
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 90D35E00A96
	for <meta-ti@yoctoproject.org>; Mon, 10 Aug 2015 10:14:35 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 57ECE52A96; Mon, 10 Aug 2015 17:14:35 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150810171435.57ECE52A96@arago-project.org>
Date: Mon, 10 Aug 2015 17:14:35 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : ti-xdctools: Add version 3.31.02.38.
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
X-List-Received-Date: Mon, 10 Aug 2015 17:14:42 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: daisy
Commit: f3519cab1446f0d17fb472f7d5c740889cbc7557
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=f3519cab1446f0d17fb472f7d5c740889cbc7557

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Wed Aug  5 17:04:29 2015 +0000

ti-xdctools: Add version 3.31.02.38.

* This version adheres to the new "core" package format.
* Add the version-indepedent include file for the core packages
* Extract common information between the core and legacy packages
  into the ti-xdctools-common.inc file.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/devtools/ti-xdctools-common.inc    |   54 +++++++++++++++++++++++++
 recipes-ti/devtools/ti-xdctools-core.inc      |    5 ++
 recipes-ti/devtools/ti-xdctools.inc           |   54 +------------------------
 recipes-ti/devtools/ti-xdctools_3.31.02.38.bb |    9 ++++
 4 files changed, 69 insertions(+), 53 deletions(-)

diff --git a/recipes-ti/devtools/ti-xdctools-common.inc b/recipes-ti/devtools/ti-xdctools-common.inc
new file mode 100644
index 0000000..2d5f2d7
--- /dev/null
+++ b/recipes-ti/devtools/ti-xdctools-common.inc
@@ -0,0 +1,54 @@
+DESCRIPTION = "TI XDCtools (RTSC - Real Time Software Components - http://rtsc.eclipse.org)"
+HOMEPAGE = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/rtsc"
+SECTION = "devel"
+LICENSE = "BSD & GPLv2"
+
+require recipes-ti/includes/ti-paths.inc
+require recipes-ti/includes/ti-staging.inc
+
+do_install() {
+    install -d ${D}${XDC_INSTALL_DIR_RECIPE}
+    cp -pPrf ${S}/* ${D}${XDC_INSTALL_DIR_RECIPE}
+}
+
+INSANE_SKIP_${PN} = "installed-vs-shipped"
+
+# Prevent internal libs from getting picked up
+PRIVATE_LIBS = " \
+libncdb.so \
+libcdb.so \
+libjavaplugin_oji.so \
+libjavaplugin_jni.so \
+libjsound.so \
+libinstrument.so \
+libjawt.so \
+libzip.so \
+libjava_crw_demo.so \
+libjavaplugin_nscp_gcc29.so \
+libhprof.so \
+libcmm.so \
+libjdwp.so \
+libmlib_image.so \
+libjpeg.so \
+libverify.so \
+libjavaplugin_nscp.so \
+libmanagement.so \
+libunpack.so \
+librmi.so \
+libJdbcOdbc.so \
+libawt.so \
+libnet.so \
+libjaas_unix.so \
+libnio.so \
+libdcpr.so \
+libioser12.so \
+libjsoundalsa.so \
+libjava.so \
+libfontmanager.so \
+libdt_socket.so \
+libmawt.so \
+libjvm.so \
+libhpi.so \
+lib.so \
+libcairo.so.2 \
+"
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


