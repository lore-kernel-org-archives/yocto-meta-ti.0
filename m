Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4BA7BE00DEA; Mon, 19 Dec 2016 15:15:58 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8B1F1E00CF2
	for <meta-ti@yoctoproject.org>; Mon, 19 Dec 2016 15:15:48 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id B125552A3D; Mon, 19 Dec 2016 23:15:47 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20161219231547.B125552A3D@arago-project.org>
Date: Mon, 19 Dec 2016 23:15:47 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Justin Sobota : ti-pdk-build-rtos: Upstream version 1.0.0.3
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
X-List-Received-Date: Mon, 19 Dec 2016 23:15:58 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: morty
Commit: e6b912ab8963acf4ed18e277e49031356a6c4552
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=e6b912ab8963acf4ed18e277e49031356a6c4552

Author: Justin Sobota <jsobota@ti.com>
Date:   Thu Dec 15 21:54:37 2016 +0000

ti-pdk-build-rtos: Upstream version 1.0.0.3

Signed-off-by: Justin Sobota <jsobota@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb |   49 +++++++++++++++++-----
 1 files changed, 38 insertions(+), 11 deletions(-)

diff --git a/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb b/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb
index 84dca37..73ed092 100644
--- a/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb
+++ b/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb
@@ -4,15 +4,15 @@ LIC_FILES_CHKSUM = "file://makerules/env.mk;beginline=1;endline=31;md5=10503e8de
 
 require recipes-ti/includes/ti-paths.inc
 
-PV = "01.00.00.02B"
+PV = "01.00.00.03"
 PR = "r0"
 
 PDK_BUILD_GIT_URI = "git://git.ti.com/keystone-rtos/processor-pdk-build.git"
 PDK_BUILD_GIT_PROTOCOL = "git"
 PDK_BUILD_GIT_BRANCH = "master"
 
-# Below Commit ID corresponds to "DEV.PDK_BUILD.01.00.00.02B"
-PDK_BUILD_SRCREV = "28a1bf6dba6d4eb6d80bfe37c5a5f17941754192"
+# Below Commit ID corresponds to "DEV.PDK_BUILD.01.00.00.03"
+PDK_BUILD_SRCREV = "487845b835b54d97f2d2f47ee1d0d88784e7e9ca"
 
 BRANCH = "${PDK_BUILD_GIT_BRANCH}"
 SRC_URI = "${PDK_BUILD_GIT_URI};protocol=${PDK_BUILD_GIT_PROTOCOL};branch=${BRANCH}"
@@ -32,30 +32,46 @@ do_compile() {
 do_install() {
     install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build
     install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/makerules
-    install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/am335x
-    install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/am571x
-    install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/am572x
     
     install -m 0755 Rules.make ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build
     install -m 0755 comp_top.mk ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build
 
     sed -i -e "s|c\:/ti/ccsv5/utils/cygwin|\$(XDC_INSTALL_PATH)/bin|g" \
         ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/Rules.make
-
+    
     install -m 0755 makerules/build_config.mk ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/makerules
     install -m 0755 makerules/common.mk ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/makerules
     install -m 0755 makerules/component.mk ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/makerules
     install -m 0755 makerules/env.mk ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/makerules
     install -m 0755 makerules/platform.mk ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/makerules
-    install -m 0755 makerules/rules_66.mk ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/makerules
-    install -m 0755 makerules/rules_a15.mk ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/makerules
+}
+
+do_install_append_ti33x() {
+    install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/am335x
+
     install -m 0755 makerules/rules_a8.mk ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/makerules
     install -m 0755 makerules/rules_a8_extend.mk ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/makerules
+
+    install -m 0755 am335x/config_am335x_a8.bld ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/am335x
+}
+
+do_install_append_ti43x() {
+    install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/am437x
+
     install -m 0755 makerules/rules_a9.mk ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/makerules
+    
+    install -m 0755 am437x/config_am437x_a9.bld ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/am437x
+}
+
+do_install_append_omap-a15() {
+    install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/am571x
+    install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/am572x
+
+    install -m 0755 makerules/rules_66.mk ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/makerules
+    install -m 0755 makerules/rules_a15.mk ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/makerules
     install -m 0755 makerules/rules_m4.mk ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/makerules
     install -m 0755 makerules/rules_ti_cgt_arm.mk ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/makerules
-    install -m 0755 am335x/config_am335x_a8.bld ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/am335x
-    install -m 0755 am335x/mem_segment_definition_1024mb_bios.xs ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/am335x
+    
     install -m 0755 am571x/config_am571x.bld ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/am571x
     install -m 0755 am571x/config_am571x_c66.bld ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/am571x
     install -m 0755 am571x/config_am571x_a15.bld ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/am571x
@@ -65,5 +81,16 @@ do_install() {
     install -m 0755 am572x/config_am572x_a15.bld ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/am572x
     install -m 0755 am572x/mem_segment_definition_1024mb_bios.xs ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/am572x
 }
+    
+do_install_append_keystone() {
+    install -m 0755 makerules/rules_66.mk ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/makerules
+    install -m 0755 makerules/rules_a15.mk ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/makerules
+}
+
+do_install_append_k2g-evm() {
+    install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/k2g
+
+    install -m 0755 k2g/config_k2g_a15.bld ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/k2g
+}
 
 FILES_${PN} += "${PDK_INSTALL_DIR_RECIPE}/packages/*"


