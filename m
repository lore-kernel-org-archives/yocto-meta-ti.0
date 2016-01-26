Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3DEABE00C19; Tue, 26 Jan 2016 13:17:07 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.152 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 386A0E00C1A
	for <meta-ti@yoctoproject.org>; Tue, 26 Jan 2016 13:17:02 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id u0QLH1jm007821
	for <meta-ti@yoctoproject.org>; Tue, 26 Jan 2016 15:17:01 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u0QLH1JM004494
	for <meta-ti@yoctoproject.org>; Tue, 26 Jan 2016 15:17:01 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 26 Jan 2016 15:17:01 -0600
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u0QLGvUW012813;	Tue, 26 Jan 2016 15:17:01 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 26 Jan 2016 16:16:50 -0500
Message-ID: <1453843011-28530-13-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453843011-28530-1-git-send-email-j-stiffler@ti.com>
References: <1453843011-28530-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 12/13] openmp-rtos: Add the OpenMP RTOS package
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
X-List-Received-Date: Tue, 26 Jan 2016 21:17:07 -0000
Content-Type: text/plain

* supports OpenMP on c66x cores

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-ti/includes/ti-paths.inc          |  2 +
 recipes-ti/openmp-rtos/openmp-rtos_git.bb | 62 +++++++++++++++++++++++++++++++
 2 files changed, 64 insertions(+)
 create mode 100644 recipes-ti/openmp-rtos/openmp-rtos_git.bb

diff --git a/recipes-ti/includes/ti-paths.inc b/recipes-ti/includes/ti-paths.inc
index 4bff921..b660c11 100644
--- a/recipes-ti/includes/ti-paths.inc
+++ b/recipes-ti/includes/ti-paths.inc
@@ -53,6 +53,7 @@ export DSPLIB_C66_INSTALL_DIR_RECIPE      = "${installdir}/ti-dsplib-c66x-tree"
 export MATHLIB_C66_INSTALL_DIR_RECIPE     = "${installdir}/ti-mathlib-c66x-tree"
 export IMGLIB_C66_INSTALL_DIR_RECIPE      = "${installdir}/ti-imglib-c66x-tree"
 export CG_XML_INSTALL_DIR_RECIPE     = "${installdir}/ti-cg-xml-tree"
+export OMP_INSTALL_DIR_RECIPE        = "${installdir}/ti-omp-tree"
 
 
 # This is where the tools will end up in sysroot
@@ -97,6 +98,7 @@ export DSPLIB_C66_INSTALL_DIR      = "${STAGING_DIR_TARGET}${DSPLIB_C66_INSTALL_
 export MATHLIB_C66_INSTALL_DIR     = "${STAGING_DIR_TARGET}${MATHLIB_C66_INSTALL_DIR_RECIPE}"
 export IMGLIB_C66_INSTALL_DIR      = "${STAGING_DIR_TARGET}${IMGLIB_C66_INSTALL_DIR_RECIPE}"
 export CG_XML_INSTALL_DIR     = "${STAGING_DIR_NATIVE}${CG_XML_INSTALL_DIR_RECIPE}"
+export OMP_INSTALL_DIR        = "${STAGING_DIR_TARGET}${OMP_INSTALL_DIR_RECIPE}"
 
 DSPSUFFIX_omapl137 = "x674"
 DSPSUFFIX_omapl138 = "x674"
diff --git a/recipes-ti/openmp-rtos/openmp-rtos_git.bb b/recipes-ti/openmp-rtos/openmp-rtos_git.bb
new file mode 100644
index 0000000..b735ec4
--- /dev/null
+++ b/recipes-ti/openmp-rtos/openmp-rtos_git.bb
@@ -0,0 +1,62 @@
+DESCRIPTION = "TI OpenMP RTOS"
+HOMEPAGE = "git://git.ti.com/openmp/ti-openmp-dsp-runtime.git"
+LICENSE = "BSD"
+
+require recipes-ti/includes/ti-paths.inc
+
+PV = "2_02_00_02"
+PR = "r0"
+
+OPENMP_RTOS_GIT_URI = "git://git.ti.com/openmp/ti-openmp-dsp-runtime.git"
+OPENMP_RTOS_GIT_PROTOCOL = "git"
+OPENMP_RTOS_GIT_BRANCH = "master"
+
+BRANCH = "${OPENMP_RTOS_GIT_BRANCH}"
+SRC_URI = "${OPENMP_RTOS_GIT_URI};protocol=${OPENMP_RTOS_GIT_PROTOCOL};branch=${BRANCH} \
+"
+
+SRCREV = "5599f2218be68274c58110a12c85a97c6ed1a2d9"
+
+LIC_FILES_CHKSUM = "file://docs/license/omp_manifest_template.html;md5=61a6972303c0447b7c056195d7ebafee"
+
+DEPENDS = "common-csl-ip-rtos ti-xdctools ti-ipc-rtos ti-sysbios ti-cgt6x-native libulm"
+DEPENDS_append_keystone = " qmss-lld-rtos cppi-lld-rtos"
+
+COMPATIBLE_MACHINE = "keystone|omap-a15"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+S = "${WORKDIR}/git"
+export IPC_DIR = "${IPC_INSTALL_DIR}"
+export XDC_DIR = "${XDC_INSTALL_DIR}"
+export BIOS_DIR = "${SYSBIOS_INSTALL_DIR}"
+export ULM_DIR ="${STAGING_DIR_TARGET}/usr/share/ti/ulm"
+export C6636_PDK_DIR ="${PDK_INSTALL_DIR}"
+export AM572_PDK_DIR ="${PDK_INSTALL_DIR}"
+export XDCCGROOT = "${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x"
+
+export BUILD_K2H = "0"
+export BUILD_AM572 = "0"
+
+BUILD_K2H_keystone = "1"
+BUILD_AM572_omap-a15 = "1"
+
+RELEASE_TARGET = ""
+RELEASE_TARGET_keystone = "k2x"
+RELEASE_TARGET_omap-a15 = "am57xx"
+
+do_compile() {
+    make -f utils/product/Makefile .zipfile
+}
+
+do_install() {
+    install -d ${D}${OMP_INSTALL_DIR_RECIPE}
+    cp -r ${S}/exports/openmp_dsp_${RELEASE_TARGET}_${PV}/. -d  ${D}${OMP_INSTALL_DIR_RECIPE}
+}
+
+ALLOW_EMPTY_${PN} = "1"
+
+FILES_${PN}-dev += " \
+    ${OMP_INSTALL_DIR_RECIPE}/ \
+"
+
+INSANE_SKIP_${PN}-dev = "arch"
-- 
1.9.1


