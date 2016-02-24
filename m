Return-Path: <h-gou@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 288FAE00A92; Wed, 24 Feb 2016 13:09:56 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at http://www.dnswl.org/,
	high *      trust
	*      [192.94.94.40 listed in list.dnswl.org]
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 493B6E00920
	for <meta-ti@yoctoproject.org>; Wed, 24 Feb 2016 13:09:54 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u1OL9s7d029344
	for <meta-ti@yoctoproject.org>; Wed, 24 Feb 2016 15:09:54 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u1OL9sFr002270
	for <meta-ti@yoctoproject.org>; Wed, 24 Feb 2016 15:09:54 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 24 Feb 2016 15:09:54 -0600
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u1OL9rKf016752;	Wed, 24 Feb 2016 15:09:53 -0600
From: Hongmei Gou <h-gou@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 24 Feb 2016 16:09:52 -0500
Message-ID: <1456348192-7859-1-git-send-email-h-gou@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] vlib-c66x: add version 3.2.1.0
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
X-List-Received-Date: Wed, 24 Feb 2016 21:09:56 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <h-gou@ti.com>
---
 recipes-ti/includes/ti-paths.inc     |  2 ++
 recipes-ti/vlib/vlib-c66x.inc        | 28 ++++++++++++++++++++++++++++
 recipes-ti/vlib/vlib-c66x_3.2.1.0.bb |  9 +++++++++
 3 files changed, 39 insertions(+)
 create mode 100644 recipes-ti/vlib/vlib-c66x.inc
 create mode 100644 recipes-ti/vlib/vlib-c66x_3.2.1.0.bb

diff --git a/recipes-ti/includes/ti-paths.inc b/recipes-ti/includes/ti-paths.inc
index 31427a6..e7d3e82 100644
--- a/recipes-ti/includes/ti-paths.inc
+++ b/recipes-ti/includes/ti-paths.inc
@@ -52,6 +52,7 @@ export TI_CGT_PRU_INSTALL_DIR_RECIPE      = "${installdir}/cgt-pru"
 export DSPLIB_C66_INSTALL_DIR_RECIPE      = "${installdir}/ti-dsplib-c66x-tree"
 export MATHLIB_C66_INSTALL_DIR_RECIPE     = "${installdir}/ti-mathlib-c66x-tree"
 export IMGLIB_C66_INSTALL_DIR_RECIPE      = "${installdir}/ti-imglib-c66x-tree"
+export VLIB_C66_INSTALL_DIR_RECIPE        = "${installdir}/ti-vlib-c66x-tree"
 export CG_XML_INSTALL_DIR_RECIPE     = "${installdir}/ti-cg-xml-tree"
 export OMP_INSTALL_DIR_RECIPE        = "${installdir}/ti-omp-tree"
 export MPM_INSTALL_DIR_RECIPE        = "${installdir}/ti-mpm-tree"
@@ -98,6 +99,7 @@ export TI_CGT_PRU_INSTALL_DIR      = "${STAGING_DIR_NATIVE}${TI_CGT_PRU_INSTALL_
 export DSPLIB_C66_INSTALL_DIR      = "${STAGING_DIR_TARGET}${DSPLIB_C66_INSTALL_DIR_RECIPE}"
 export MATHLIB_C66_INSTALL_DIR     = "${STAGING_DIR_TARGET}${MATHLIB_C66_INSTALL_DIR_RECIPE}"
 export IMGLIB_C66_INSTALL_DIR      = "${STAGING_DIR_TARGET}${IMGLIB_C66_INSTALL_DIR_RECIPE}"
+export VLIB_C66_INSTALL_DIR        = "${STAGING_DIR_TARGET}${VLIB_C66_INSTALL_DIR_RECIPE}"
 export CG_XML_INSTALL_DIR     = "${STAGING_DIR_NATIVE}${CG_XML_INSTALL_DIR_RECIPE}"
 export OMP_INSTALL_DIR        = "${STAGING_DIR_TARGET}${OMP_INSTALL_DIR_RECIPE}"
 export MPM_INSTALL_DIR        = "${STAGING_DIR_TARGET}${MPM_INSTALL_DIR_RECIPE}"
diff --git a/recipes-ti/vlib/vlib-c66x.inc b/recipes-ti/vlib/vlib-c66x.inc
new file mode 100644
index 0000000..2e57347
--- /dev/null
+++ b/recipes-ti/vlib/vlib-c66x.inc
@@ -0,0 +1,28 @@
+DESCRIPTION = "TI Vision Library (VLIB) for C66x"
+HOMEPAGE = "http://software-dl.ti.com/libs/vlib/latest/index_FDS.html"
+SECTION = "devel"
+LICENSE = "TI-TSPA & BSD-3-Clause"
+
+require ../includes/ti-paths.inc
+require ../includes/ti-staging.inc
+require ../includes/ti-eula-unpack.inc
+
+COMPATIBLE_MACHINE = "omap-a15|keystone"
+
+SRC_URI = "http://software-dl.ti.com/libs/vlib/${PV}//exports/vlib_c66x_obj_${PV}_Linux.bin;name=vlibbin"
+
+S = "${WORKDIR}/vlib_c66x_${PV}"
+
+BINFILE="vlib_c66x_obj_${PV}_Linux.bin"
+TI_BIN_UNPK_ARGS = "--mode silent --prefix ${S}"
+TI_BIN_UNPK_CMDS=""
+
+do_install() {
+    install -d ${D}${VLIB_C66_INSTALL_DIR_RECIPE}
+    cp -pPrf ${S}/* ${D}${VLIB_C66_INSTALL_DIR_RECIPE}
+}
+
+ALLOW_EMPTY_${PN} = "1"
+FILES_${PN}-dev += "${VLIB_C66_INSTALL_DIR_RECIPE}"
+
+INSANE_SKIP_${PN}-dev = "installed-vs-shipped arch"
diff --git a/recipes-ti/vlib/vlib-c66x_3.2.1.0.bb b/recipes-ti/vlib/vlib-c66x_3.2.1.0.bb
new file mode 100644
index 0000000..e3742d1
--- /dev/null
+++ b/recipes-ti/vlib/vlib-c66x_3.2.1.0.bb
@@ -0,0 +1,9 @@
+require vlib-c66x.inc
+
+PV = "3_2_1_0"
+PR = "r0"
+
+LIC_FILES_CHKSUM = "file://docs/VLIB_Software_Manifest.html;md5=75151b04457c8a1ae3c2172ada0eedda"
+
+SRC_URI[vlibbin.md5sum] = "e292fa3f74be60b9110e0ebcc6840fe7"
+SRC_URI[vlibbin.sha256sum] = "05bf16473d60e0252d3a73a7c3d268e540783a226b4bda930e5f6042e7b01bd8"
-- 
1.9.1


