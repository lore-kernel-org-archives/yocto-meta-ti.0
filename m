Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 841D5E00C92; Fri,  4 Mar 2016 04:41:14 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.41 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4EE6DE00C86
	for <meta-ti@yoctoproject.org>; Fri,  4 Mar 2016 04:41:12 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id u24CfBIF018157
	for <meta-ti@yoctoproject.org>; Fri, 4 Mar 2016 06:41:11 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u24CfBe7020633
	for <meta-ti@yoctoproject.org>; Fri, 4 Mar 2016 06:41:11 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 4 Mar 2016 06:41:11 -0600
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u24Cf8NM014808;	Fri, 4 Mar 2016 06:41:11 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 4 Mar 2016 07:41:06 -0500
Message-ID: <1457095266-16139-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1457095266-16139-1-git-send-email-j-stiffler@ti.com>
References: <1457095266-16139-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] openmp-rtos: Bump version to 2.2.1.0 and add k2g-evm
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
X-List-Received-Date: Fri, 04 Mar 2016 12:41:14 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-ti/openmp-rtos/openmp-rtos_git.bb | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

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
-- 
1.9.1


