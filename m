Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5DA7BE00BF5; Wed,  4 Nov 2015 07:04:40 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1165AE008AE
	for <meta-ti@yoctoproject.org>; Wed,  4 Nov 2015 07:04:17 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id C779C52A94; Wed,  4 Nov 2015 15:04:16 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20151104150416.C779C52A94@arago-project.org>
Date: Wed,  4 Nov 2015 15:04:16 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : multi-kernel.inc: improve handling of configs with different version string
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
X-List-Received-Date: Wed, 04 Nov 2015 15:04:40 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: 1b60203857d6f23586636b9eaf95c75fe5bcaf71
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=1b60203857d6f23586636b9eaf95c75fe5bcaf71

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Wed Nov  4 06:24:21 2015 +0000

multi-kernel.inc: improve handling of configs with different version string

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/multi-kernel.inc |   39 ++++++++++++++++++++++++--------
 1 files changed, 29 insertions(+), 10 deletions(-)

diff --git a/recipes-kernel/linux/multi-kernel.inc b/recipes-kernel/linux/multi-kernel.inc
index 5d21d4e..64701ed 100644
--- a/recipes-kernel/linux/multi-kernel.inc
+++ b/recipes-kernel/linux/multi-kernel.inc
@@ -21,8 +21,21 @@ inherit deploy
 SRC_URI += " \
            file://configs "
 
+def get_git_revision(p):
+    import subprocess
+
+    try:
+        return subprocess.Popen("git rev-parse HEAD 2>/dev/null ", cwd=p, shell=True, stdout=subprocess.PIPE).communicate()[0].rstrip()
+    except OSError:
+        return None
+
+KERNEL_LOCALVERSION = "-g${@get_git_revision('${S}').__str__()[:10]}"
+
 MULTI_CONFIG_BASE_SUFFIX = "multi-config-"
-MODULE_IMAGE_BASE_NAME ?= "modules-${PE}-${PV}-${PR}-${MACHINE}-${DATETIME}"
+
+KERNEL_IMAGE_BASE_NAME = "${KERNEL_IMAGETYPE}-${KERNEL_VERSION}-${PKGR}-${MACHINE}-${DATETIME}"
+MODULE_IMAGE_BASE_NAME = "modules-${KERNEL_VERSION}-${PKGR}-${MACHINE}-${DATETIME}"
+CONFIG_IMAGE_BASE_NAME = "config-${KERNEL_VERSION}-${PKGR}-${MACHINE}-${DATETIME}"
 
 EXTRA_OEMAKE = "${PARALLEL_MAKE} "
 
@@ -61,16 +74,22 @@ do_compileconfigs () {
             do_configure
             echo ${KERNEL_LOCALVERSION}-$(basename $configname) > ${B}/.scmversion
             echo ${KERNEL_LOCALVERSION}-$(basename $configname) > ${S}/.scmversion
-            kernel_do_compile
+            do_compile
             do_compile_kernelmodules
+            # Below lines are needed to satisfy do_install and it's cleanup code, which doesn't know about configname
             install -d "${D}/lib/modules/${KERNEL_VERSION}"
             touch "${D}/lib/modules/${KERNEL_VERSION}/build"
             touch "${D}/lib/modules/${KERNEL_VERSION}/source"
             install -d "${D}/lib/modules/${KERNEL_VERSION}/kernel"
-            kernel_do_install
-            rm "${D}/lib/modules/${KERNEL_VERSION}-$(basename $configname)/build"
-            rm "${D}/lib/modules/${KERNEL_VERSION}-$(basename $configname)/source"
-            rmdir --ignore-fail-on-non-empty "${D}/lib/modules/${KERNEL_VERSION}-$(basename $configname)/kernel"
+            do_install
+
+            # Remove unused symlinks specific to configname
+            rm "${D}/lib/modules/$(cut -d\" -f2 ${B}/include/generated/utsrelease.h)/build"
+            rm "${D}/lib/modules/$(cut -d\" -f2 ${B}/include/generated/utsrelease.h)/source"
+            # In case no modules were installed, remove empty dirs
+            rmdir --ignore-fail-on-non-empty "${D}/lib/modules/$(cut -d\" -f2 ${B}/include/generated/utsrelease.h)/kernel"
+            rmdir --ignore-fail-on-non-empty "${D}/lib/modules/$(cut -d\" -f2 ${B}/include/generated/utsrelease.h)"
+            # Also remove default location for modules used by do_install if empty
             rmdir --ignore-fail-on-non-empty "${D}/lib/modules/${KERNEL_VERSION}"
 
             # Drop the resulting images in the deploy dir
@@ -82,7 +101,7 @@ do_compileconfigs () {
             fi
 
             # Install the final config alongside the images
-            cp .config ${DEPLOYDIR}/config-${PV}-${PR}-${MACHINE}.${MULTI_CONFIG_BASE_SUFFIX}$(basename $configname).config
+            cp .config ${DEPLOYDIR}/${CONFIG_IMAGE_BASE_NAME}.${MULTI_CONFIG_BASE_SUFFIX}$(basename $configname).config
 
             # Create symlinks
             cd ${DEPLOYDIR}
@@ -91,7 +110,7 @@ do_compileconfigs () {
             rm -f modules-${MACHINE}.${MULTI_CONFIG_BASE_SUFFIX}$(basename $configname).tgz
             ln -sf ${MODULE_IMAGE_BASE_NAME}.${MULTI_CONFIG_BASE_SUFFIX}$(basename $configname).tgz modules-${MACHINE}.${MULTI_CONFIG_BASE_SUFFIX}$(basename $configname).tgz
             rm -f config-${MACHINE}.${MULTI_CONFIG_BASE_SUFFIX}$(basename $configname).config
-            ln -sf config-${PV}-${PR}-${MACHINE}.${MULTI_CONFIG_BASE_SUFFIX}$(basename $configname).config config-${MACHINE}.${MULTI_CONFIG_BASE_SUFFIX}$(basename $configname).config
+            ln -sf ${CONFIG_IMAGE_BASE_NAME}.${MULTI_CONFIG_BASE_SUFFIX}$(basename $configname).config config-${MACHINE}.${MULTI_CONFIG_BASE_SUFFIX}$(basename $configname).config
         done
 
         # Restore the regular 'defconfig'
@@ -106,12 +125,12 @@ do_deploy_append () {
     install -d ${DEPLOYDIR}
 
     # Drop the regular defconfig along side the others for consistency
-    cp ${B}/.config ${DEPLOYDIR}/config-${PV}-${PR}-${MACHINE}.config
+    cp ${B}/.config ${DEPLOYDIR}/${CONFIG_IMAGE_BASE_NAME}.config
 
     # add symlink
     cd ${DEPLOYDIR}
     rm -f config-${MACHINE}.config
-    ln -s config-${PV}-${PR}-${MACHINE}.config config-${MACHINE}.config
+    ln -s ${CONFIG_IMAGE_BASE_NAME}.config config-${MACHINE}.config
 
     rm -f modules-${MACHINE}.tgz
     ln -sf ${MODULE_IMAGE_BASE_NAME}.tgz modules-${MACHINE}.tgz


