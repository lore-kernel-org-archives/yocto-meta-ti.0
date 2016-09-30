Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 552FEE00DA3; Fri, 30 Sep 2016 09:40:40 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E8228E00D7F
	for <meta-ti@yoctoproject.org>; Fri, 30 Sep 2016 09:40:37 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 2DB5552AA3; Fri, 30 Sep 2016 16:40:36 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160930164036.2DB5552AA3@arago-project.org>
Date: Fri, 30 Sep 2016 16:40:36 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Justin Sobota : ti-pdk-build-rtos: Update to version 1.0.0.2B
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
X-List-Received-Date: Fri, 30 Sep 2016 16:40:40 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: krogoth
Commit: 1dc72ed98f314b6682c49ae0800b79677eacaecf
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=1dc72ed98f314b6682c49ae0800b79677eacaecf

Author: Justin Sobota <jsobota@ti.com>
Date:   Wed Sep 28 21:44:04 2016 +0000

ti-pdk-build-rtos: Update to version 1.0.0.2B

Signed-off-by: Justin Sobota <jsobota@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb |    9 ++++++---
 1 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb b/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb
index 36fd360..84dca37 100644
--- a/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb
+++ b/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb
@@ -4,15 +4,15 @@ LIC_FILES_CHKSUM = "file://makerules/env.mk;beginline=1;endline=31;md5=10503e8de
 
 require recipes-ti/includes/ti-paths.inc
 
-PV = "01.00.00.02"
+PV = "01.00.00.02B"
 PR = "r0"
 
 PDK_BUILD_GIT_URI = "git://git.ti.com/keystone-rtos/processor-pdk-build.git"
 PDK_BUILD_GIT_PROTOCOL = "git"
 PDK_BUILD_GIT_BRANCH = "master"
 
-# Below Commit ID corresponds to "DEV.PDK_BUILD.01.00.00.02"
-PDK_BUILD_SRCREV = "0bbd9d2fdff205fda4893936d7cb71404c003b93"
+# Below Commit ID corresponds to "DEV.PDK_BUILD.01.00.00.02B"
+PDK_BUILD_SRCREV = "28a1bf6dba6d4eb6d80bfe37c5a5f17941754192"
 
 BRANCH = "${PDK_BUILD_GIT_BRANCH}"
 SRC_URI = "${PDK_BUILD_GIT_URI};protocol=${PDK_BUILD_GIT_PROTOCOL};branch=${BRANCH}"
@@ -32,6 +32,7 @@ do_compile() {
 do_install() {
     install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build
     install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/makerules
+    install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/am335x
     install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/am571x
     install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/am572x
     
@@ -53,6 +54,8 @@ do_install() {
     install -m 0755 makerules/rules_a9.mk ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/makerules
     install -m 0755 makerules/rules_m4.mk ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/makerules
     install -m 0755 makerules/rules_ti_cgt_arm.mk ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/makerules
+    install -m 0755 am335x/config_am335x_a8.bld ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/am335x
+    install -m 0755 am335x/mem_segment_definition_1024mb_bios.xs ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/am335x
     install -m 0755 am571x/config_am571x.bld ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/am571x
     install -m 0755 am571x/config_am571x_c66.bld ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/am571x
     install -m 0755 am571x/config_am571x_a15.bld ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/am571x


