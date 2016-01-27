Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EBAA2E00C1B; Wed, 27 Jan 2016 12:57:39 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8C321E00B8C
	for <meta-ti@yoctoproject.org>; Wed, 27 Jan 2016 12:57:18 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 5794B529E2; Wed, 27 Jan 2016 20:57:18 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160127205718.5794B529E2@arago-project.org>
Date: Wed, 27 Jan 2016 20:57:18 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : edma3-lld-rtos: Extend supported SOCs
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
X-List-Received-Date: Wed, 27 Jan 2016 20:57:40 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: 4e9e325f37e44d517f6fa8d76a57af5c8c82e2ee
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=4e9e325f37e44d517f6fa8d76a57af5c8c82e2ee

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Thu Jan 28 00:12:26 2016 +0000

edma3-lld-rtos: Extend supported SOCs

* Extend support to ti33x and ti43x
* Fix build for keystone

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb |   69 ++++++++++++++++++++++-----
 1 files changed, 57 insertions(+), 12 deletions(-)

diff --git a/recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb b/recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb
index 4ebfd16..dc39fee 100644
--- a/recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb
+++ b/recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb
@@ -4,12 +4,45 @@ require recipes-ti/includes/ti-staging.inc
 
 PR = "${INC_PR}.0"
 
-DEPENDS = "ti-cgt6x-native ti-sysbios ti-xdctools"
+DEPENDS = "ti-sysbios ti-xdctools"
 
-COMPATIBLE_MACHINE = "dra7xx|keystone"
+DEPENDS_append_keystone = " gcc-arm-none-eabi-native ti-cgt6x-native"
+DEPENDS_append_ti33x = " gcc-arm-none-eabi-native"
+DEPENDS_append_ti43x = " gcc-arm-none-eabi-native"
+DEPENDS_append_omap-a15 = " gcc-arm-none-eabi-native ti-ccsv6-native ti-cgt6x-native"
+
+COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|keystone"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 PLATFORMLIST = ""
+TARGETLIST = ""
+
+PLATFORMLIST_ti33x = " \
+        am335x-evm \
+"
+
+TARGETLIST_ti33x = " \
+        a8 \
+"
+
+PLATFORMLIST_ti43x = " \
+        am437x-evm \
+"
+
+TARGETLIST_ti43x = " \
+        arm9 \
+"
+
+PLATFORMLIST_omap-a15 = " \
+        tda2xx-evm \
+"
+
+TARGETLIST_omap-a15 = " \
+        66 \
+        a15 \
+        m4 \
+"
+
 PLATFORMLIST_keystone = " \
         tci6636k2h-evm \
         tci6638k2k-evm \
@@ -17,13 +50,13 @@ PLATFORMLIST_keystone = " \
         c66ak2e-evm \
 "
 
-PLATFORMLIST_dra7xx = " \
-        tda2xx-evm \
-        dra72x-evm \
-        am571x-evm \
-        am572x-evm \
+TARGETLIST_keystone = " \
+        66 \
+        a15 \
 "
 
+FORMAT="ELF"
+
 S = "${WORKDIR}/git"
 
 PARALLEL_MAKE = ""
@@ -44,10 +77,17 @@ export CROSSCC="${TARGET_PREFIX}gcc"
 export CROSSAR="${TARGET_PREFIX}ar"
 export CROSSLNK="${TARGET_PREFIX}gcc"
 
-
-EXTRA_OEMAKE += " -C ${S}/packages TARGET=66 FORMAT=ELF"
-
 do_configure () {
+    sed -i -e "s|_config.bld|config.bld|g" ${S}/makerules/env.mk
+    sed -i -e "s|^edma3_lld_PATH =.*$|edma3_lld_PATH = ${S}|g" ${S}/makerules/env.mk
+    sed -i -e "s|^CODEGEN_PATH_M3 =.*$|CODEGEN_PATH_M3 = ${M4_TOOLCHAIN_INSTALL_DIR}|g" ${S}/makerules/env.mk
+    sed -i -e "s|^CODEGEN_PATH_M4 =.*$|CODEGEN_PATH_M4 = ${M4_TOOLCHAIN_INSTALL_DIR}|g" ${S}/makerules/env.mk
+    sed -i -e "s|^CODEGEN_PATH_A8 =.*$|CODEGEN_PATH_A8 = ${M4_TOOLCHAIN_INSTALL_DIR}|g" ${S}/makerules/env.mk
+    sed -i -e "s|^CODEGEN_PATH_A8_GCC =.*$|CODEGEN_PATH_A8_GCC = ${GCC_ARM_NONE_TOOLCHAIN}|g" ${S}/makerules/env.mk
+    sed -i -e "s|^CODEGEN_PATH_ARM9 =.*$|CODEGEN_PATH_ARM9 = ${M4_TOOLCHAIN_INSTALL_DIR}|g" ${S}/makerules/env.mk
+    sed -i -e "s|^CODEGEN_PATH_A9_GCC =.*$|CODEGEN_PATH_A9_GCC = ${GCC_ARM_NONE_TOOLCHAIN}|g" ${S}/makerules/env.mk
+    sed -i -e "s|^CODEGEN_PATH_A15 =.*$|CODEGEN_PATH_A15 = ${GCC_ARM_NONE_TOOLCHAIN}|g" ${S}/makerules/env.mk
+    sed -i -e "s|^CODEGEN_PATH_A15_GCC =.*$|CODEGEN_PATH_A15_GCC = ${GCC_ARM_NONE_TOOLCHAIN}|g" ${S}/makerules/env.mk
     sed -i -e "s|^UTILS_INSTALL_DIR =.*$|UTILS_INSTALL_DIR = ${XDC_INSTALL_DIR}|g" ${S}/makerules/env.mk
     sed -i -e "s|^bios_PATH =.*$|bios_PATH = ${SYSBIOS_INSTALL_DIR}|g" ${S}/makerules/env.mk
     sed -i -e "s|^xdc_PATH =.*$|xdc_PATH = ${XDC_INSTALL_DIR}|g" ${S}/makerules/env.mk
@@ -59,10 +99,15 @@ do_configure () {
 }
 
 do_compile () {
+    cd ${S}/packages
     for p in ${PLATFORMLIST}
     do
-        oe_runmake PLATFORM=${p}
+        for t in ${TARGETLIST}
+        do
+            make PLATFORM=${p} TARGET=${t} FORMAT=${FORMAT}
+        done
     done
+    sourceipk_do_create_srcipk
 }
 
 do_install () {
@@ -70,7 +115,7 @@ do_install () {
     cp -pPrf ${S}/* ${D}${EDMA3_LLD_INSTALL_DIR_RECIPE}
 }
 
-INSANE_SKIP_${PN}-dev = "arch"
+INSANE_SKIP_${PN}-dev = "arch ldflags"
 
 ALLOW_EMPTY_${PN} = "1"
 FILES_${PN}-dev += "${EDMA3_LLD_INSTALL_DIR_RECIPE}"


