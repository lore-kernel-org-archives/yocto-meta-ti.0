Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 17CB5E014C6
	for <meta-ti@yoctoproject.org>; Mon,  4 Mar 2013 10:03:27 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id AFEBC52AB6; Mon,  4 Mar 2013 18:03:26 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130304180326.AFEBC52AB6@arago-project.org>
Date: Mon,  4 Mar 2013 18:03:26 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : multi-kernel: match oe-core for MODULE_IMAGE_BASE_NAME, set it conditionally
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
X-List-Received-Date: Mon, 04 Mar 2013 18:03:27 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 79e90aebdbe897f5686cf86e874cf702cea5f027
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=79e90aebdbe897f5686cf86e874cf702cea5f027

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Mon Mar  4 12:26:10 2013 -0500

multi-kernel: match oe-core for MODULE_IMAGE_BASE_NAME, set it conditionally

Thanks to Robert P. J. Day, MODULE_IMAGE_BASE_NAME was added to oe-core - only
~3.5 years after it got into Classic-OE and with a typo of MODULE_*, not plural
MODULES_*, so match it here and set conditionally.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/multi-kernel.inc |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-kernel/linux/multi-kernel.inc b/recipes-kernel/linux/multi-kernel.inc
index 9a0c090..e696c8b 100644
--- a/recipes-kernel/linux/multi-kernel.inc
+++ b/recipes-kernel/linux/multi-kernel.inc
@@ -26,7 +26,7 @@ SRC_URI += " \
            file://configs "
 
 MULTI_CONFIG_BASE_SUFFIX = "multi-config-"
-MODULES_IMAGE_BASE_NAME = "modules-${PV}-${PR}-${MACHINE}"
+MODULE_IMAGE_BASE_NAME ?= "modules-${PE}-${PV}-${PR}-${MACHINE}-${DATETIME}"
 
 do_preparekernel () {
 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
@@ -76,7 +76,7 @@ do_compileconfigs () {
         install -m 0644 ${KERNEL_OUTPUT} ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGE_BASE_NAME}.${MULTI_CONFIG_BASE_SUFFIX}$(basename $config).bin
 
         if [ -d "${D}/lib" ]; then
-            tar --owner=root --group=root -cvzf ${DEPLOY_DIR_IMAGE}/${MODULES_IMAGE_BASE_NAME}.${MULTI_CONFIG_BASE_SUFFIX}$(basename $config).tgz -C ${D} lib
+            tar --owner=root --group=root -cvzf ${DEPLOY_DIR_IMAGE}/${MODULE_IMAGE_BASE_NAME}.${MULTI_CONFIG_BASE_SUFFIX}$(basename $config).tgz -C ${D} lib
         fi
  
         # Install the final config alongside the images
@@ -87,7 +87,7 @@ do_compileconfigs () {
         rm -f ${KERNEL_IMAGE_SYMLINK_NAME}.${MULTI_CONFIG_BASE_SUFFIX}$(basename $config).bin
         ln -sf ${KERNEL_IMAGE_BASE_NAME}.${MULTI_CONFIG_BASE_SUFFIX}$(basename $config).bin ${KERNEL_IMAGE_SYMLINK_NAME}.${MULTI_CONFIG_BASE_SUFFIX}$(basename $config).bin
         rm -f modules-${MACHINE}.${MULTI_CONFIG_BASE_SUFFIX}$(basename $config).tgz
-        ln -sf ${MODULES_IMAGE_BASE_NAME}.${MULTI_CONFIG_BASE_SUFFIX}$(basename $config).tgz modules-${MACHINE}.${MULTI_CONFIG_BASE_SUFFIX}$(basename $config).tgz
+        ln -sf ${MODULE_IMAGE_BASE_NAME}.${MULTI_CONFIG_BASE_SUFFIX}$(basename $config).tgz modules-${MACHINE}.${MULTI_CONFIG_BASE_SUFFIX}$(basename $config).tgz
         rm -f config-${MACHINE}.${MULTI_CONFIG_BASE_SUFFIX}$(basename $config).config
         ln -sf config-${PV}-${PR}-${MACHINE}.${MULTI_CONFIG_BASE_SUFFIX}$(basename $config).config config-${MACHINE}.${MULTI_CONFIG_BASE_SUFFIX}$(basename $config).config
 
@@ -115,7 +115,7 @@ do_deploy_append () {
     ln -s config-${PV}-${PR}-${MACHINE}.config config-${MACHINE}.config
 
     rm -f modules-${MACHINE}.tgz
-    ln -sf ${MODULES_IMAGE_BASE_NAME}.tgz modules-${MACHINE}.tgz
+    ln -sf ${MODULE_IMAGE_BASE_NAME}.tgz modules-${MACHINE}.tgz
 
 }
 


