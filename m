Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 84EAFE005B3; Thu,  3 Dec 2015 10:30:41 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 45A71E00349
	for <meta-ti@yoctoproject.org>; Thu,  3 Dec 2015 10:30:39 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 865A952A2A; Thu,  3 Dec 2015 18:30:38 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20151203183038.865A952A2A@arago-project.org>
Date: Thu,  3 Dec 2015 18:30:38 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Gou, Hongmei : dsplib-c66x: add version 3.4.0.0
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
X-List-Received-Date: Thu, 03 Dec 2015 18:30:41 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: 47d16a7911291d1468f258201d92abebca51585c
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=47d16a7911291d1468f258201d92abebca51585c

Author: Gou, Hongmei <h-gou@ti.com>
Date:   Thu Dec  3 02:50:47 2015 +0000

dsplib-c66x: add version 3.4.0.0

Signed-off-by: Hongmei Gou <h-gou@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/dsplib/dsplib-c66x.inc        |   26 ++++++++++++++++++++++++++
 recipes-ti/dsplib/dsplib-c66x_3.4.0.0.bb |    9 +++++++++
 recipes-ti/includes/ti-paths.inc         |    2 ++
 3 files changed, 37 insertions(+), 0 deletions(-)

diff --git a/recipes-ti/dsplib/dsplib-c66x.inc b/recipes-ti/dsplib/dsplib-c66x.inc
new file mode 100644
index 0000000..31acc1e
--- /dev/null
+++ b/recipes-ti/dsplib/dsplib-c66x.inc
@@ -0,0 +1,26 @@
+DESCRIPTION = "DSPLIB contains optimized general-purpose signal-processing routines for TI DSPs"
+HOMEPAGE = "http://www.ti.com/tool/sprc265"
+SECTION = "devel"
+LICENSE = "BSD-3-Clause"
+
+require ../includes/ti-paths.inc
+require ../includes/ti-staging.inc
+require ../includes/ti-unpack.inc
+
+COMPATIBLE_MACHINE = "omap-a15|keystone"
+
+SRC_URI = "http://software-dl.ti.com/sdoemb/sdoemb_public_sw/dsplib/${PV}/exports/${BINFILE};name=dsplib"
+
+BINFILE = "dsplib_c66x_${PV}_Linux.bin"
+TI_BIN_UNPK_ARGS = "--mode silent --prefix ${S}"
+TI_BIN_UNPK_CMDS = ""
+
+do_install() {
+    install -d ${D}${DSPLIB_C66_INSTALL_DIR_RECIPE}
+    cp -pPrf ${S}/* ${D}${DSPLIB_C66_INSTALL_DIR_RECIPE}
+}
+
+ALLOW_EMPTY_${PN} = "1"
+FILES_${PN}-dev += "${DSPLIB_C66_INSTALL_DIR_RECIPE}"
+
+INSANE_SKIP_${PN}-dev = "arch"
diff --git a/recipes-ti/dsplib/dsplib-c66x_3.4.0.0.bb b/recipes-ti/dsplib/dsplib-c66x_3.4.0.0.bb
new file mode 100644
index 0000000..f1273f3
--- /dev/null
+++ b/recipes-ti/dsplib/dsplib-c66x_3.4.0.0.bb
@@ -0,0 +1,9 @@
+require dsplib-c66x.inc
+
+PV = "3_4_0_0"
+PR = "r1"
+
+LIC_FILES_CHKSUM = "file://packages/ti/dsplib/dsplib.h;beginline=9;endline=35;md5=17733f9e1100f8a628512f47c4bf676a"
+
+SRC_URI[dsplib.md5sum] = "66785604729c153dcad5282097dee8bf"
+SRC_URI[dsplib.sha256sum] = "e88909b6271ce6c4c62e2ab90181b7adb36c7f28f5c52836668eb35888785ce8"
diff --git a/recipes-ti/includes/ti-paths.inc b/recipes-ti/includes/ti-paths.inc
index ad4ff78..37feb93 100644
--- a/recipes-ti/includes/ti-paths.inc
+++ b/recipes-ti/includes/ti-paths.inc
@@ -49,6 +49,7 @@ export M4_TOOLCHAIN_INSTALL_DIR_RECIPE    = "${installdir}/ti-cgt-arm"
 export CCSV6_INSTALL_DIR_RECIPE           = "${installdir}/ccsv6"
 export GCC_ARM_NONE_TOOLCHAIN_RECIPE      = "${installdir}/gcc-arm-none-eabi"
 export TI_CGT_PRU_INSTALL_DIR_RECIPE      = "${installdir}/cgt-pru"
+export DSPLIB_C66_INSTALL_DIR_RECIPE      = "${installdir}/ti-dsplib-c66x-tree"
 
 
 # This is where the tools will end up in sysroot
@@ -89,6 +90,7 @@ export M4_TOOLCHAIN_INSTALL_DIR    = "${STAGING_DIR_NATIVE}${M4_TOOLCHAIN_INSTAL
 export CCSV6_INSTALL_DIR           = "${STAGING_DIR_NATIVE}${CCSV6_INSTALL_DIR_RECIPE}"
 export GCC_ARM_NONE_TOOLCHAIN      = "${STAGING_DIR_NATIVE}${GCC_ARM_NONE_TOOLCHAIN_RECIPE}"
 export TI_CGT_PRU_INSTALL_DIR      = "${STAGING_DIR_NATIVE}${TI_CGT_PRU_INSTALL_DIR_RECIPE}"
+export DSPLIB_C66_INSTALL_DIR      = "${STAGING_DIR_TARGET}${DSPLIB_C66_INSTALL_DIR_RECIPE}"
 
 DSPSUFFIX_omapl137 = "x674"
 DSPSUFFIX_omapl138 = "x674"


