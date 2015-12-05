Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 18A18E00956; Fri,  4 Dec 2015 19:25:10 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 72336E00956
	for <meta-ti@yoctoproject.org>; Fri,  4 Dec 2015 19:25:05 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 20C0152ABC; Sat,  5 Dec 2015 03:25:05 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20151205032505.20C0152ABC@arago-project.org>
Date: Sat,  5 Dec 2015 03:25:05 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Gou, Hongmei : mathlib-c66x: add version 3.1.1.0
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
Commit: 9e1e9d0a87c76cd7d9dfc17ba3bce09bb4669cbf
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=9e1e9d0a87c76cd7d9dfc17ba3bce09bb4669cbf

Author: Gou, Hongmei <h-gou@ti.com>
Date:   Fri Dec  4 01:08:27 2015 +0000

mathlib-c66x: add version 3.1.1.0

Signed-off-by: Hongmei Gou <h-gou@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/includes/ti-paths.inc           |    2 ++
 recipes-ti/mathlib/mathlib-c66x.inc        |   28 ++++++++++++++++++++++++++++
 recipes-ti/mathlib/mathlib-c66x_3.1.1.0.bb |    9 +++++++++
 3 files changed, 39 insertions(+), 0 deletions(-)

diff --git a/recipes-ti/includes/ti-paths.inc b/recipes-ti/includes/ti-paths.inc
index 37feb93..7d2211a 100644
--- a/recipes-ti/includes/ti-paths.inc
+++ b/recipes-ti/includes/ti-paths.inc
@@ -50,6 +50,7 @@ export CCSV6_INSTALL_DIR_RECIPE           = "${installdir}/ccsv6"
 export GCC_ARM_NONE_TOOLCHAIN_RECIPE      = "${installdir}/gcc-arm-none-eabi"
 export TI_CGT_PRU_INSTALL_DIR_RECIPE      = "${installdir}/cgt-pru"
 export DSPLIB_C66_INSTALL_DIR_RECIPE      = "${installdir}/ti-dsplib-c66x-tree"
+export MATHLIB_C66_INSTALL_DIR_RECIPE     = "${installdir}/ti-mathlib-c66x-tree"
 
 
 # This is where the tools will end up in sysroot
@@ -91,6 +92,7 @@ export CCSV6_INSTALL_DIR           = "${STAGING_DIR_NATIVE}${CCSV6_INSTALL_DIR_R
 export GCC_ARM_NONE_TOOLCHAIN      = "${STAGING_DIR_NATIVE}${GCC_ARM_NONE_TOOLCHAIN_RECIPE}"
 export TI_CGT_PRU_INSTALL_DIR      = "${STAGING_DIR_NATIVE}${TI_CGT_PRU_INSTALL_DIR_RECIPE}"
 export DSPLIB_C66_INSTALL_DIR      = "${STAGING_DIR_TARGET}${DSPLIB_C66_INSTALL_DIR_RECIPE}"
+export MATHLIB_C66_INSTALL_DIR     = "${STAGING_DIR_TARGET}${MATHLIB_C66_INSTALL_DIR_RECIPE}"
 
 DSPSUFFIX_omapl137 = "x674"
 DSPSUFFIX_omapl138 = "x674"
diff --git a/recipes-ti/mathlib/mathlib-c66x.inc b/recipes-ti/mathlib/mathlib-c66x.inc
new file mode 100644
index 0000000..1511337
--- /dev/null
+++ b/recipes-ti/mathlib/mathlib-c66x.inc
@@ -0,0 +1,28 @@
+DESCRIPTION = "MATHLIB contains optimized general-purpose signal-processing routines for TI DSPs"
+HOMEPAGE = "http://www.ti.com/tool/mathlib"
+SECTION = "devel"
+LICENSE = "BSD-3-Clause"
+
+require ../includes/ti-paths.inc
+require ../includes/ti-staging.inc
+require ../includes/ti-unpack.inc
+
+COMPATIBLE_MACHINE = "omap-a15|keystone"
+
+SRC_URI = "http://software-dl.ti.com/sdoemb/sdoemb_public_sw/mathlib/${PV}/exports/${BINFILE};name=mathlib"
+
+S = "${WORKDIR}/mathlib-c66x-${PV}"
+
+BINFILE = "mathlib_c66x_${PV}_Linux.bin"
+TI_BIN_UNPK_ARGS = "--mode silent --prefix ${S}"
+TI_BIN_UNPK_CMDS = ""
+
+do_install() {
+    install -d ${D}${MATHLIB_C66_INSTALL_DIR_RECIPE}
+    cp -pPrf ${S}/* ${D}${MATHLIB_C66_INSTALL_DIR_RECIPE}
+}
+
+ALLOW_EMPTY_${PN} = "1"
+FILES_${PN}-dev += "${MATHLIB_C66_INSTALL_DIR_RECIPE}"
+
+INSANE_SKIP_${PN}-dev = "arch"
diff --git a/recipes-ti/mathlib/mathlib-c66x_3.1.1.0.bb b/recipes-ti/mathlib/mathlib-c66x_3.1.1.0.bb
new file mode 100644
index 0000000..50746fb
--- /dev/null
+++ b/recipes-ti/mathlib/mathlib-c66x_3.1.1.0.bb
@@ -0,0 +1,9 @@
+require mathlib-c66x.inc
+
+PV = "3_1_1_0"
+PR = "r1"
+
+LIC_FILES_CHKSUM = "file://packages/ti/mathlib/mathlib.h;beginline=9;endline=35;md5=954ed7074e987be574989f985f1897db"
+
+SRC_URI[mathlib.md5sum] = "f3c9ad06dfcea780b5362c57a4bc48b8"
+SRC_URI[mathlib.sha256sum] = "85df897c94e8768e9a1f186c21702ed3887d39cda6dc67cb4580fa3f083e8925"


