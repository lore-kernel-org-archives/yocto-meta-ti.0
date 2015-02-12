Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B8A8AE0098A; Thu, 12 Feb 2015 08:03:11 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2F791E00990
	for <meta-ti@yoctoproject.org>; Thu, 12 Feb 2015 08:03:02 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 0387752A31; Thu, 12 Feb 2015 16:03:01 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150212160302.0387752A31@arago-project.org>
Date: Thu, 12 Feb 2015 16:03:01 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : multi-kernel: improve deploying additional files and sstate handling
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
X-List-Received-Date: Thu, 12 Feb 2015 16:03:11 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: daisy
Commit: 3a3a4619ef98889ea745a740113ca712e9fe8247
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=3a3a4619ef98889ea745a740113ca712e9fe8247

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Thu Feb 12 10:12:44 2015 +0000

multi-kernel: improve deploying additional files and sstate handling

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/multi-kernel.inc |   18 ++++++++++--------
 1 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/recipes-kernel/linux/multi-kernel.inc b/recipes-kernel/linux/multi-kernel.inc
index 93cf064..b3358f9 100644
--- a/recipes-kernel/linux/multi-kernel.inc
+++ b/recipes-kernel/linux/multi-kernel.inc
@@ -16,6 +16,8 @@
 # and breaks in several places. Introduce a task do_preparekernel that calls
 # "make prepare" in the kernel tree to generate all the necessary files.
 
+inherit deploy
+
 SRC_URI += " \
            file://configs "
 
@@ -72,18 +74,18 @@ do_compileconfigs () {
             rmdir --ignore-fail-on-non-empty "${D}/lib/modules/${KERNEL_VERSION}"
 
             # Drop the resulting images in the deploy dir
-            install -d ${DEPLOY_DIR_IMAGE}
-            install -m 0644 ${KERNEL_OUTPUT} ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGE_BASE_NAME}.${MULTI_CONFIG_BASE_SUFFIX}$(basename $configname).bin
+            install -d ${DEPLOYDIR}
+            install -m 0644 ${KERNEL_OUTPUT} ${DEPLOYDIR}/${KERNEL_IMAGE_BASE_NAME}.${MULTI_CONFIG_BASE_SUFFIX}$(basename $configname).bin
 
             if [ -d "${D}/lib" ]; then
-                tar --owner=root --group=root -cvzf ${DEPLOY_DIR_IMAGE}/${MODULE_IMAGE_BASE_NAME}.${MULTI_CONFIG_BASE_SUFFIX}$(basename $configname).tgz -C ${D} lib
+                tar --owner=root --group=root -cvzf ${DEPLOYDIR}/${MODULE_IMAGE_BASE_NAME}.${MULTI_CONFIG_BASE_SUFFIX}$(basename $configname).tgz -C ${D} lib
             fi
 
             # Install the final config alongside the images
-            cp .config ${DEPLOY_DIR_IMAGE}/config-${PV}-${PR}-${MACHINE}.${MULTI_CONFIG_BASE_SUFFIX}$(basename $configname).config
+            cp .config ${DEPLOYDIR}/config-${PV}-${PR}-${MACHINE}.${MULTI_CONFIG_BASE_SUFFIX}$(basename $configname).config
 
             # Create symlinks
-            cd ${DEPLOY_DIR_IMAGE}
+            cd ${DEPLOYDIR}
             rm -f ${KERNEL_IMAGE_SYMLINK_NAME}.${MULTI_CONFIG_BASE_SUFFIX}$(basename $configname).bin
             ln -sf ${KERNEL_IMAGE_BASE_NAME}.${MULTI_CONFIG_BASE_SUFFIX}$(basename $configname).bin ${KERNEL_IMAGE_SYMLINK_NAME}.${MULTI_CONFIG_BASE_SUFFIX}$(basename $configname).bin
             rm -f modules-${MACHINE}.${MULTI_CONFIG_BASE_SUFFIX}$(basename $configname).tgz
@@ -101,14 +103,14 @@ do_compileconfigs () {
 
 # For reference, copy .config to deploy image
 do_deploy_append () {
-    install -d ${DEPLOY_DIR_IMAGE}
+    install -d ${DEPLOYDIR}
 
     # Drop the regular defconfig along side the others for consistency
     cd ${S}
-    cp .config ${DEPLOY_DIR_IMAGE}/config-${PV}-${PR}-${MACHINE}.config
+    cp .config ${DEPLOYDIR}/config-${PV}-${PR}-${MACHINE}.config
 
     # add symlink
-    cd ${DEPLOY_DIR_IMAGE}
+    cd ${DEPLOYDIR}
     rm -f config-${MACHINE}.config
     ln -s config-${PV}-${PR}-${MACHINE}.config config-${MACHINE}.config
 


