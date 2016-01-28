Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 04DACE00852; Thu, 28 Jan 2016 10:21:51 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 14229E00A92
	for <meta-ti@yoctoproject.org>; Thu, 28 Jan 2016 10:21:49 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id CEE2B529EA; Thu, 28 Jan 2016 18:21:48 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160128182148.CEE2B529EA@arago-project.org>
Date: Thu, 28 Jan 2016 18:21:48 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : multiprocmgr-rtos: Add RTOS package for multiprocmgr
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
X-List-Received-Date: Thu, 28 Jan 2016 18:21:51 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: ef81b49a6daca949e04ff8719f8dd7cb02dead92
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=ef81b49a6daca949e04ff8719f8dd7cb02dead92

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Thu Jan 28 19:07:33 2016 +0000

multiprocmgr-rtos: Add RTOS package for multiprocmgr

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/includes/ti-paths.inc                 |    2 +
 recipes-ti/multiprocmgr/multiprocmgr-rtos_git.bb |   28 ++++++++++++++++++++++
 2 files changed, 30 insertions(+), 0 deletions(-)

diff --git a/recipes-ti/includes/ti-paths.inc b/recipes-ti/includes/ti-paths.inc
index b660c11..31427a6 100644
--- a/recipes-ti/includes/ti-paths.inc
+++ b/recipes-ti/includes/ti-paths.inc
@@ -54,6 +54,7 @@ export MATHLIB_C66_INSTALL_DIR_RECIPE     = "${installdir}/ti-mathlib-c66x-tree"
 export IMGLIB_C66_INSTALL_DIR_RECIPE      = "${installdir}/ti-imglib-c66x-tree"
 export CG_XML_INSTALL_DIR_RECIPE     = "${installdir}/ti-cg-xml-tree"
 export OMP_INSTALL_DIR_RECIPE        = "${installdir}/ti-omp-tree"
+export MPM_INSTALL_DIR_RECIPE        = "${installdir}/ti-mpm-tree"
 
 
 # This is where the tools will end up in sysroot
@@ -99,6 +100,7 @@ export MATHLIB_C66_INSTALL_DIR     = "${STAGING_DIR_TARGET}${MATHLIB_C66_INSTALL
 export IMGLIB_C66_INSTALL_DIR      = "${STAGING_DIR_TARGET}${IMGLIB_C66_INSTALL_DIR_RECIPE}"
 export CG_XML_INSTALL_DIR     = "${STAGING_DIR_NATIVE}${CG_XML_INSTALL_DIR_RECIPE}"
 export OMP_INSTALL_DIR        = "${STAGING_DIR_TARGET}${OMP_INSTALL_DIR_RECIPE}"
+export MPM_INSTALL_DIR        = "${STAGING_DIR_TARGET}${MPM_INSTALL_DIR_RECIPE}"
 
 DSPSUFFIX_omapl137 = "x674"
 DSPSUFFIX_omapl138 = "x674"
diff --git a/recipes-ti/multiprocmgr/multiprocmgr-rtos_git.bb b/recipes-ti/multiprocmgr/multiprocmgr-rtos_git.bb
new file mode 100644
index 0000000..50e5049
--- /dev/null
+++ b/recipes-ti/multiprocmgr/multiprocmgr-rtos_git.bb
@@ -0,0 +1,28 @@
+SUMMARY = "TI Multiproc Manager (RTOS) for KeyStone II"
+DESCRIPTION = "Provides download, debug and other utilities for other cores in the SOC like DSP"
+
+require recipes-ti/includes/ti-paths.inc
+require recipes-ti/multiprocmgr/multiprocmgr.inc
+
+DEPENDS = "ti-cgt6x-native"
+
+PR = "${INC_PR}.0"
+
+export LOCAL_SYSROOT="${STAGING_DIR_TARGET}"
+export C6X_GEN_INSTALL_PATH="${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x"
+
+do_compile() {
+    make c66x
+    make test_c66x
+    sourceipk_do_create_srcipk
+}
+
+do_install() {
+    install -d ${D}${MPM_INSTALL_DIR_RECIPE}
+    cp -pPrf ${S}/* ${D}${MPM_INSTALL_DIR_RECIPE}
+}
+
+FILES_${PN}-dev += "${MPM_INSTALL_DIR_RECIPE}"
+INSANE_SKIP_${PN}-dev = "arch"
+
+ALLOW_EMPTY_${PN} = "1"


