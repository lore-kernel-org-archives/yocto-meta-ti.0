Return-Path: <jsobota@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 27C9EE00D18; Wed, 12 Oct 2016 10:53:56 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from bear.ext.ti.com (bear.ext.ti.com [198.47.19.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 89B1BE00D00
	for <meta-ti@yoctoproject.org>; Wed, 12 Oct 2016 10:53:53 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id u9CHrqc5011310
	for <meta-ti@yoctoproject.org>; Wed, 12 Oct 2016 12:53:52 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u9CHrqvX007231
	for <meta-ti@yoctoproject.org>; Wed, 12 Oct 2016 12:53:52 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 12 Oct 2016 12:53:52 -0500
Received: from a0756824local.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u9CHrp4N017703;	Wed, 12 Oct 2016 12:53:52 -0500
From: Justin Sobota <jsobota@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 12 Oct 2016 13:53:46 -0400
Message-ID: <1476294829-27885-2-git-send-email-jsobota@ti.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1476294829-27885-1-git-send-email-jsobota@ti.com>
References: <1476294829-27885-1-git-send-email-jsobota@ti.com>
MIME-Version: 1.0
Subject: [master/krogoth][PATCH 2/5] ti-pdk-build: Install build infrastructure files based on SoC
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
X-List-Received-Date: Wed, 12 Oct 2016 17:53:56 -0000
Content-Type: text/plain

Signed-off-by: Justin Sobota <jsobota@ti.com>
---
 recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb |   35 ++++++++++++++++------
 1 file changed, 26 insertions(+), 9 deletions(-)

diff --git a/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb b/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb
index 84dca37..4cff274 100644
--- a/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb
+++ b/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://makerules/env.mk;beginline=1;endline=31;md5=10503e8de
 require recipes-ti/includes/ti-paths.inc
 
 PV = "01.00.00.02B"
-PR = "r0"
+PR = "r1"
 
 PDK_BUILD_GIT_URI = "git://git.ti.com/keystone-rtos/processor-pdk-build.git"
 PDK_BUILD_GIT_PROTOCOL = "git"
@@ -32,30 +32,42 @@ do_compile() {
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
     install -m 0755 makerules/rules_a9.mk ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/makerules
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
@@ -65,5 +77,10 @@ do_install() {
     install -m 0755 am572x/config_am572x_a15.bld ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/am572x
     install -m 0755 am572x/mem_segment_definition_1024mb_bios.xs ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/am572x
 }
+    
+do_install_append_keystone() {
+    install -m 0755 makerules/rules_66.mk ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/makerules
+    install -m 0755 makerules/rules_a15.mk ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/makerules
+}
 
 FILES_${PN} += "${PDK_INSTALL_DIR_RECIPE}/packages/*"
-- 
1.7.10.4


