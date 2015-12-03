Return-Path: <h-gou@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id ED706E00406; Thu,  3 Dec 2015 11:08:36 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.40 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DA66DE002F9
	for <meta-ti@yoctoproject.org>; Thu,  3 Dec 2015 11:08:31 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id tB3J8VEj020182
	for <meta-ti@yoctoproject.org>; Thu, 3 Dec 2015 13:08:31 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id tB3J8VLu005884
	for <meta-ti@yoctoproject.org>; Thu, 3 Dec 2015 13:08:31 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 3 Dec 2015 13:08:30 -0600
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	tB3J8ULE000841;	Thu, 3 Dec 2015 13:08:30 -0600
From: Hongmei Gou <h-gou@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 3 Dec 2015 14:08:27 -0500
Message-ID: <1449169707-18744-1-git-send-email-h-gou@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH v2] mathlib-c66x: add version 3.1.1.0
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
X-List-Received-Date: Thu, 03 Dec 2015 19:08:37 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <h-gou@ti.com>
---
v2 changes:
* Remove c66x from COMPATIBLE_MACHINE
* Remove SRCIPK

 recipes-ti/includes/ti-paths.inc           |  2 ++
 recipes-ti/mathlib/mathlib-c66x.inc        | 28 ++++++++++++++++++++++++++++
 recipes-ti/mathlib/mathlib-c66x_3.1.1.0.bb |  9 +++++++++
 3 files changed, 39 insertions(+)
 create mode 100644 recipes-ti/mathlib/mathlib-c66x.inc
 create mode 100644 recipes-ti/mathlib/mathlib-c66x_3.1.1.0.bb

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
-- 
1.9.1


