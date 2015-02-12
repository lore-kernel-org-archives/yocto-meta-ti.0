Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4B98DE00945; Wed, 11 Feb 2015 21:13:22 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [206.46.173.17 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
X-Greylist: delayed 3601 seconds by postgrey-1.32 at yocto-www;
	Wed, 11 Feb 2015 21:13:12 PST
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 70CC1E0093B
	for <meta-ti@yoctoproject.org>; Wed, 11 Feb 2015 21:13:12 -0800 (PST)
Received: from gandalf.denix.org ([108.28.89.130]) by vms173017.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NJN00MMR519QI00@vms173017.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Wed, 11 Feb 2015 22:13:00 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=CoYIqc8G c=1 sm=1 tr=0	a=ckUr7rGttv+NBxkAVUaaIw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=0HtSIViG9nkA:10
	a=sozttTNsAAAA:8	a=E7va0bGzjoS3-sz-9SIA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id EF73A20188;	Wed,
	11 Feb 2015 23:12:44 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Wed, 11 Feb 2015 23:12:44 -0500
Message-id: <1423714364-12810-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] multi-kernel: improve deploying additional files and sstate handling
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
X-List-Received-Date: Thu, 12 Feb 2015 05:13:22 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-kernel/linux/multi-kernel.inc | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

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
 
-- 
2.2.0


