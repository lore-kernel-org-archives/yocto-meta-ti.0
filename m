Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id F0627E009C5; Fri,  4 Dec 2015 19:25:10 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 75CCCE009C3
	for <meta-ti@yoctoproject.org>; Fri,  4 Dec 2015 19:25:05 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 7FD9F52ABD; Sat,  5 Dec 2015 03:25:05 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20151205032505.7FD9F52ABD@arago-project.org>
Date: Sat,  5 Dec 2015 03:25:05 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Gou, Hongmei : imglib-c66x: add version 3.1.1.0
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
X-List-Received-Date: Sat, 05 Dec 2015 03:25:11 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: a757f12b9d944266bc18a98ccddf22607c30b369
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=a757f12b9d944266bc18a98ccddf22607c30b369

Author: Gou, Hongmei <h-gou@ti.com>
Date:   Fri Dec  4 01:21:57 2015 +0000

imglib-c66x: add version 3.1.1.0

Signed-off-by: Hongmei Gou <h-gou@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/imglib/imglib-c66x.inc        |   29 +++++++++++++++++++++++++++++
 recipes-ti/imglib/imglib-c66x_3.1.1.0.bb |    9 +++++++++
 recipes-ti/includes/ti-paths.inc         |    2 ++
 3 files changed, 40 insertions(+), 0 deletions(-)

diff --git a/recipes-ti/imglib/imglib-c66x.inc b/recipes-ti/imglib/imglib-c66x.inc
new file mode 100644
index 0000000..3c76ad5
--- /dev/null
+++ b/recipes-ti/imglib/imglib-c66x.inc
@@ -0,0 +1,29 @@
+DESCRIPTION = "IMGLIB contains optimized general-purpose image/video processing routines for TI DSPs"
+HOMEPAGE = "http://www.ti.com/tool/sprc264"
+SECTION = "devel"
+LICENSE = "BSD-3-Clause"
+
+require ../includes/ti-paths.inc
+require ../includes/ti-staging.inc
+require ../includes/ti-unpack.inc
+
+COMPATIBLE_MACHINE = "omap-a15|keystone"
+
+SRC_URI = "http://software-dl.ti.com/sdoemb/sdoemb_public_sw/imglib/${PV}/exports/${BINFILE};name=imglib"
+
+S = "${WORKDIR}/imglib-c66x-${PV}"
+
+BINFILE = "imglib_c66x_${PV}_Linux.bin"
+TI_BIN_UNPK_ARGS = "--mode silent --prefix ${S}"
+TI_BIN_UNPK_CMDS = ""
+
+do_install() {
+    install -d ${D}${IMGLIB_C66_INSTALL_DIR_RECIPE}
+    cp -pPrf ${S}/* ${D}${IMGLIB_C66_INSTALL_DIR_RECIPE}
+}
+
+ALLOW_EMPTY_${PN} = "1"
+FILES_${PN}-dev += "${IMGLIB_C66_INSTALL_DIR_RECIPE}"
+
+RDEPENDS_${PN}-dev += "perl"
+INSANE_SKIP_${PN}-dev = "arch"
diff --git a/recipes-ti/imglib/imglib-c66x_3.1.1.0.bb b/recipes-ti/imglib/imglib-c66x_3.1.1.0.bb
new file mode 100644
index 0000000..e614352
--- /dev/null
+++ b/recipes-ti/imglib/imglib-c66x_3.1.1.0.bb
@@ -0,0 +1,9 @@
+require imglib-c66x.inc
+
+PV = "3_1_1_0"
+PR = "r1"
+
+LIC_FILES_CHKSUM = "file://packages/ti/imglib/src/common/IMG_profile.h;beginline=1;endline=35;md5=a21fc16da34b650ce33a9a7143908667"
+
+SRC_URI[imglib.md5sum] = "9d64f213e040899048446df5055deeca"
+SRC_URI[imglib.sha256sum] = "f3153e51530f26cfc638efca7ca6ae1bbaf7736daf287fc972592372a676ed21"
diff --git a/recipes-ti/includes/ti-paths.inc b/recipes-ti/includes/ti-paths.inc
index 7d2211a..2f253a0 100644
--- a/recipes-ti/includes/ti-paths.inc
+++ b/recipes-ti/includes/ti-paths.inc
@@ -51,6 +51,7 @@ export GCC_ARM_NONE_TOOLCHAIN_RECIPE      = "${installdir}/gcc-arm-none-eabi"
 export TI_CGT_PRU_INSTALL_DIR_RECIPE      = "${installdir}/cgt-pru"
 export DSPLIB_C66_INSTALL_DIR_RECIPE      = "${installdir}/ti-dsplib-c66x-tree"
 export MATHLIB_C66_INSTALL_DIR_RECIPE     = "${installdir}/ti-mathlib-c66x-tree"
+export IMGLIB_C66_INSTALL_DIR_RECIPE      = "${installdir}/ti-imglib-c66x-tree"
 
 
 # This is where the tools will end up in sysroot
@@ -93,6 +94,7 @@ export GCC_ARM_NONE_TOOLCHAIN      = "${STAGING_DIR_NATIVE}${GCC_ARM_NONE_TOOLCH
 export TI_CGT_PRU_INSTALL_DIR      = "${STAGING_DIR_NATIVE}${TI_CGT_PRU_INSTALL_DIR_RECIPE}"
 export DSPLIB_C66_INSTALL_DIR      = "${STAGING_DIR_TARGET}${DSPLIB_C66_INSTALL_DIR_RECIPE}"
 export MATHLIB_C66_INSTALL_DIR     = "${STAGING_DIR_TARGET}${MATHLIB_C66_INSTALL_DIR_RECIPE}"
+export IMGLIB_C66_INSTALL_DIR      = "${STAGING_DIR_TARGET}${IMGLIB_C66_INSTALL_DIR_RECIPE}"
 
 DSPSUFFIX_omapl137 = "x674"
 DSPSUFFIX_omapl138 = "x674"


