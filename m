Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 93DB1E00B2E; Wed, 27 Jan 2016 12:54:58 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DC8EEE00B36
	for <meta-ti@yoctoproject.org>; Wed, 27 Jan 2016 12:54:52 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 448D552AAB; Wed, 27 Jan 2016 20:54:49 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160127205449.448D552AAB@arago-project.org>
Date: Wed, 27 Jan 2016 20:54:49 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : openmp-rtos: Add the OpenMP RTOS package
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
X-List-Received-Date: Wed, 27 Jan 2016 20:54:58 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: cba652df4435c752033a8b447e30b0f5b11ac9db
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=cba652df4435c752033a8b447e30b0f5b11ac9db

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Wed Jan 27 03:16:50 2016 +0000

openmp-rtos: Add the OpenMP RTOS package

* supports OpenMP on c66x cores

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/includes/ti-paths.inc          |    2 +
 recipes-ti/openmp-rtos/openmp-rtos_git.bb |   62 +++++++++++++++++++++++++++++
 2 files changed, 64 insertions(+), 0 deletions(-)

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


