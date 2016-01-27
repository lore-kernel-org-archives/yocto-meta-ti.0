Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5B14FE00C1D; Wed, 27 Jan 2016 05:59:23 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E939CE00C1A
	for <meta-ti@yoctoproject.org>; Wed, 27 Jan 2016 05:59:20 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u0RDxKgr018337
	for <meta-ti@yoctoproject.org>; Wed, 27 Jan 2016 07:59:20 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u0RDxKCr026344
	for <meta-ti@yoctoproject.org>; Wed, 27 Jan 2016 07:59:20 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 27 Jan 2016 07:59:20 -0600
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u0RDxDB1014465;	Wed, 27 Jan 2016 07:59:20 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 27 Jan 2016 08:59:09 -0500
Message-ID: <1453903149-1261-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453903149-1261-1-git-send-email-j-stiffler@ti.com>
References: <1453903149-1261-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] multiprocmgr-rtos: Add RTOS package for multiprocmgr
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
X-List-Received-Date: Wed, 27 Jan 2016 13:59:23 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-ti/includes/ti-paths.inc                 |  2 ++
 recipes-ti/multiprocmgr/multiprocmgr-rtos_git.bb | 28 ++++++++++++++++++++++++
 2 files changed, 30 insertions(+)
 create mode 100644 recipes-ti/multiprocmgr/multiprocmgr-rtos_git.bb

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
index 0000000..b3ae720
--- /dev/null
+++ b/recipes-ti/multiprocmgr/multiprocmgr-rtos_git.bb
@@ -0,0 +1,28 @@
+DESCRIPTION = "TI Multiproc Manager(RTOS) for KeyStone II"
+SUMMARY = "Provides download, debug and other utilities for other cores in the SOC like DSP"
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
-- 
1.9.1


