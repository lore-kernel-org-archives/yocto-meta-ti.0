Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 81001E00B9D; Thu,  6 Jul 2017 09:05:20 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.19.16 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2AE32E00B2F
	for <meta-ti@yoctoproject.org>; Thu,  6 Jul 2017 09:05:17 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v66G57p7025256
	for <meta-ti@yoctoproject.org>; Thu, 6 Jul 2017 11:05:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1499357107;
	bh=rv/OSLNcGPBmvCo1gCKtBYssRW0ykM8AkpJwjUPFXGc=;
	h=From:To:CC:Subject:Date;
	b=stsVhuJd+1x/Bo+81Aa63rLq+IPDk57mSMcwS6nBk5BSy647wsc5UHw7+ACjZ3dJw
	x7oSjJSa7il4+PE7oz9Yi3JuUNkhJw12wUFVILV45SdjJpBfw8v8UEGjnzRssYK6Pr
	IL7GHJEXVTlJrAWsMioLo7j7oFaTCmdIbW0iWTAo=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v66G51E3015390
	for <meta-ti@yoctoproject.org>; Thu, 6 Jul 2017 11:05:02 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 6 Jul 2017 11:05:01 -0500
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v66G5116019523;	Thu, 6 Jul 2017 11:05:01 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 6 Jul 2017 12:04:59 -0400
Message-ID: <1499357099-22475-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] ti-pdk-build-rtos: Updated to revision 1.0.0.5A and added omapl1 & c66x support
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
X-List-Received-Date: Thu, 06 Jul 2017 16:05:20 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb | 76 ++++++++++++++++++++----
 1 file changed, 63 insertions(+), 13 deletions(-)

diff --git a/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb b/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb
index 573c48d..d3677da 100644
--- a/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb
+++ b/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb
@@ -4,22 +4,22 @@ LIC_FILES_CHKSUM = "file://makerules/env.mk;beginline=1;endline=31;md5=10503e8de
 
 require recipes-ti/includes/ti-paths.inc
 
-PV = "01.00.00.04B"
-PR = "r1"
+PV = "01.00.00.05A"
+PR = "r0"
 
 PDK_BUILD_GIT_URI = "git://git.ti.com/keystone-rtos/processor-pdk-build.git"
 PDK_BUILD_GIT_PROTOCOL = "git"
 PDK_BUILD_GIT_BRANCH = "master"
 
-# Below Commit ID corresponds to "DEV.PDK_BUILD.01.00.00.04B"
-PDK_BUILD_SRCREV = "98b62506c451304252c7cd1e6af60dd11adc588a"
+# Below Commit ID corresponds to "DEV.PDK_BUILD.01.00.00.05A"
+PDK_BUILD_SRCREV = "3a7a42bcd85388b24fe83401fb284ce22d7b2978"
 
 BRANCH = "${PDK_BUILD_GIT_BRANCH}"
 SRC_URI = "${PDK_BUILD_GIT_URI};protocol=${PDK_BUILD_GIT_PROTOCOL};branch=${BRANCH}"
 
 SRCREV = "${PDK_BUILD_SRCREV}"
 
-COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|keystone"
+COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|keystone|c66x|omapl1"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 S = "${WORKDIR}/git/"
@@ -53,8 +53,9 @@ do_install_append_ti33x() {
     install -m 0755 makerules/rules_pru.mk ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/makerules
 
     install -m 0755 am335x/config_am335x_a8.bld ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/am335x
-    install -m 0755 pruss/PRU0_to_ARM.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
-    install -m 0755 pruss/PRU1_to_ARM.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
+    install -m 0755 pruss/lnk_a8_a9_a15_REV1.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
+    install -m 0755 pruss/PRU0_REV1_to_ARM.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
+    install -m 0755 pruss/PRU1_REV1_to_ARM.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
 }
 
 do_install_append_ti43x() {
@@ -65,8 +66,9 @@ do_install_append_ti43x() {
     install -m 0755 makerules/rules_pru.mk ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/makerules
 
     install -m 0755 am437x/config_am437x_a9.bld ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/am437x
-    install -m 0755 pruss/PRU0_to_ARM.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
-    install -m 0755 pruss/PRU1_to_ARM.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
+    install -m 0755 pruss/lnk_a8_a9_a15_REV1.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
+    install -m 0755 pruss/PRU0_REV1_to_ARM.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
+    install -m 0755 pruss/PRU1_REV1_to_ARM.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
 }
 
 do_install_append_am57xx-evm() {
@@ -88,8 +90,18 @@ do_install_append_am57xx-evm() {
     install -m 0755 am572x/config_am572x_c66.bld ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/am572x
     install -m 0755 am572x/config_am572x_a15.bld ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/am572x
     install -m 0755 am572x/mem_segment_definition_1024mb_bios.xs ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/am572x
-    install -m 0755 pruss/PRU0_to_ARM.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
-    install -m 0755 pruss/PRU1_to_ARM.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
+    install -m 0755 pruss/lnk_a8_a9_a15_REV1.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
+    install -m 0755 pruss/lnk_c66_m4_REV1.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
+    install -m 0755 pruss/PRU0_REV1_to_ARM.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
+    install -m 0755 pruss/PRU0_REV1_to_C66.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
+    install -m 0755 pruss/PRU1_REV1_to_ARM.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
+    install -m 0755 pruss/PRU1_REV1_to_C66.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
+    install -m 0755 pruss/lnk_a8_a9_a15_REV2.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
+    install -m 0755 pruss/lnk_c66_m4_REV2.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
+    install -m 0755 pruss/PRU0_REV2_to_ARM.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
+    install -m 0755 pruss/PRU0_REV2_to_C66.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
+    install -m 0755 pruss/PRU1_REV2_to_ARM.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
+    install -m 0755 pruss/PRU1_REV2_to_C66.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
 }
 
 do_install_append_am57xx-hs-evm() {
@@ -111,8 +123,18 @@ do_install_append_am57xx-hs-evm() {
     install -m 0755 am572x/config_am572x_c66.bld ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/am572x
     install -m 0755 am572x/config_am572x_a15.bld ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/am572x
     install -m 0755 am572x/mem_segment_definition_1024mb_bios.xs ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/am572x
-    install -m 0755 pruss/PRU0_to_ARM.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
-    install -m 0755 pruss/PRU1_to_ARM.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
+    install -m 0755 pruss/lnk_a8_a9_a15_REV1.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
+    install -m 0755 pruss/lnk_c66_m4_REV1.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
+    install -m 0755 pruss/PRU0_REV1_to_ARM.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
+    install -m 0755 pruss/PRU0_REV1_to_C66.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
+    install -m 0755 pruss/PRU1_REV1_to_ARM.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
+    install -m 0755 pruss/PRU1_REV1_to_C66.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
+    install -m 0755 pruss/lnk_a8_a9_a15_REV2.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
+    install -m 0755 pruss/lnk_c66_m4_REV2.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
+    install -m 0755 pruss/PRU0_REV2_to_ARM.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
+    install -m 0755 pruss/PRU0_REV2_to_C66.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
+    install -m 0755 pruss/PRU1_REV2_to_ARM.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
+    install -m 0755 pruss/PRU1_REV2_to_C66.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
 }
 
 do_install_append_dra7xx() {
@@ -142,9 +164,37 @@ do_install_append_keystone() {
 
 do_install_append_k2g() {
     install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/k2g
+    install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss    
 
+    install -m 0755 makerules/rules_pru.mk ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/makerules
     install -m 0755 k2g/config_k2g_a15.bld ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/k2g
     install -m 0755 k2g/config_k2g_c66.bld ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/k2g
+    install -m 0755 pruss/lnk_a8_a9_a15_REV2.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
+    install -m 0755 pruss/lnk_c66_m4_REV2.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
+    install -m 0755 pruss/PRU0_REV2_to_ARM.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
+    install -m 0755 pruss/PRU0_REV2_to_C66.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
+    install -m 0755 pruss/PRU1_REV2_to_ARM.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
+    install -m 0755 pruss/PRU1_REV2_to_C66.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss    
+}
+
+do_install_append_c66x() {
+    install -m 0755 makerules/rules_66.mk ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/makerules
+}
+
+do_install_append_omapl1() {
+
+    install -m 0755 makerules/rules_674.mk ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/makerules
+    install -m 0755 makerules/rules_ae9.mk ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/makerules
+    install -m 0755 makerules/rules_ti_cgt_arm.mk ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/makerules
+}
+
+do_install_append_dra7xx-evm() {
+    install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/tda2ex
+
+    install -m 0755 tda2ex/config_tda2ex.bld ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/tda2ex
+    install -m 0755 tda2ex/config_tda2ex_a15.bld ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/tda2ex
+    install -m 0755 tda2ex/config_tda2ex_c66.bld ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/tda2ex
+    install -m 0755 tda2ex/mem_segment_definition_1024mb_bios.xs ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/tda2ex
 }
 
 FILES_${PN} += "${PDK_INSTALL_DIR_RECIPE}/packages/*"
-- 
1.9.1


