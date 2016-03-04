Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 03149E00CE5; Fri,  4 Mar 2016 09:07:52 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 41E1BE00CD8
	for <meta-ti@yoctoproject.org>; Fri,  4 Mar 2016 09:07:50 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id E552552AC3; Fri,  4 Mar 2016 17:07:49 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160304170749.E552552AC3@arago-project.org>
Date: Fri,  4 Mar 2016 17:07:49 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : openmp-rtos: Bump version to 2.2.1.0 and add k2g-evm
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
X-List-Received-Date: Fri, 04 Mar 2016 17:07:52 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: 8556c34e911d752726bb827b72ab5807208032d5
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=8556c34e911d752726bb827b72ab5807208032d5

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Fri Mar  4 18:41:06 2016 +0000

openmp-rtos: Bump version to 2.2.1.0 and add k2g-evm

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/openmp-rtos/openmp-rtos_git.bb |   15 +++++++++++----
 1 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/recipes-ti/openmp-rtos/openmp-rtos_git.bb b/recipes-ti/openmp-rtos/openmp-rtos_git.bb
index b735ec4..4869686 100644
--- a/recipes-ti/openmp-rtos/openmp-rtos_git.bb
+++ b/recipes-ti/openmp-rtos/openmp-rtos_git.bb
@@ -4,7 +4,7 @@ LICENSE = "BSD"
 
 require recipes-ti/includes/ti-paths.inc
 
-PV = "2_02_00_02"
+PV = "2_02_01_00"
 PR = "r0"
 
 OPENMP_RTOS_GIT_URI = "git://git.ti.com/openmp/ti-openmp-dsp-runtime.git"
@@ -15,12 +15,14 @@ BRANCH = "${OPENMP_RTOS_GIT_BRANCH}"
 SRC_URI = "${OPENMP_RTOS_GIT_URI};protocol=${OPENMP_RTOS_GIT_PROTOCOL};branch=${BRANCH} \
 "
 
-SRCREV = "5599f2218be68274c58110a12c85a97c6ed1a2d9"
+SRCREV = "f0fe1ce874734b83dacadfe33dacc862afc8ed00"
 
 LIC_FILES_CHKSUM = "file://docs/license/omp_manifest_template.html;md5=61a6972303c0447b7c056195d7ebafee"
 
 DEPENDS = "common-csl-ip-rtos ti-xdctools ti-ipc-rtos ti-sysbios ti-cgt6x-native libulm"
-DEPENDS_append_keystone = " qmss-lld-rtos cppi-lld-rtos"
+DEPENDS_append_k2hk-evm = " qmss-lld-rtos cppi-lld-rtos"
+DEPENDS_append_k2e-evm = " qmss-lld-rtos cppi-lld-rtos"
+DEPENDS_append_k2l-evm = " qmss-lld-rtos cppi-lld-rtos"
 
 COMPATIBLE_MACHINE = "keystone|omap-a15"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
@@ -32,17 +34,22 @@ export BIOS_DIR = "${SYSBIOS_INSTALL_DIR}"
 export ULM_DIR ="${STAGING_DIR_TARGET}/usr/share/ti/ulm"
 export C6636_PDK_DIR ="${PDK_INSTALL_DIR}"
 export AM572_PDK_DIR ="${PDK_INSTALL_DIR}"
+export K2G_PDK_DIR ="${PDK_INSTALL_DIR}"
 export XDCCGROOT = "${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x"
 
 export BUILD_K2H = "0"
 export BUILD_AM572 = "0"
+export BUILD_K2G = "0"
 
 BUILD_K2H_keystone = "1"
 BUILD_AM572_omap-a15 = "1"
+BUILD_K2H_k2g-evm = "0"
+BUILD_K2G_k2g-evm = "1"
 
 RELEASE_TARGET = ""
 RELEASE_TARGET_keystone = "k2x"
 RELEASE_TARGET_omap-a15 = "am57xx"
+RELEASE_TARGET_k2g-evm = "k2g"
 
 do_compile() {
     make -f utils/product/Makefile .zipfile
@@ -50,7 +57,7 @@ do_compile() {
 
 do_install() {
     install -d ${D}${OMP_INSTALL_DIR_RECIPE}
-    cp -r ${S}/exports/openmp_dsp_${RELEASE_TARGET}_${PV}/. -d  ${D}${OMP_INSTALL_DIR_RECIPE}
+    cp -r ${S}/exports/openmp_dsp_${RELEASE_TARGET}_*/. -d  ${D}${OMP_INSTALL_DIR_RECIPE}
 }
 
 ALLOW_EMPTY_${PN} = "1"


