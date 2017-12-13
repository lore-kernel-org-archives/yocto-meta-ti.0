Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 74825E00D6F; Wed, 13 Dec 2017 13:49:29 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.27.77 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 46848E00D17
	for <meta-ti@yoctoproject.org>; Wed, 13 Dec 2017 13:49:27 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id vBDLnRoa000420
	for <meta-ti@yoctoproject.org>; Wed, 13 Dec 2017 15:49:27 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1513201767;
	bh=g1PccO3dNKLGHkggjE8DLf2vUFYtq6UZy861iqDvgmQ=;
	h=From:To:Subject:Date;
	b=dsF9TPMyw3ID3lSS16jhu1zpgTnfSpGfxyGXBpAtoRTqKPcqZE3AaDSGhjApdYIxN
	EXvp8HdD6SxRCWKx5iGEUIUSBPcmuz4bPa5UeCAp5AbdLsXBwtqvikts3FIWqPLevu
	JePAMdcowx7CmScBB0nxzy94AM3Vm/Aa6Hn5q4TY=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBDLnRDm027864
	for <meta-ti@yoctoproject.org>; Wed, 13 Dec 2017 15:49:27 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Wed, 13 Dec 2017 15:49:26 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Wed, 13 Dec 2017 15:49:26 -0600
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBDLnQkF005142
	for <meta-ti@yoctoproject.org>; Wed, 13 Dec 2017 15:49:26 -0600
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 13 Dec 2017 16:49:25 -0500
Message-ID: <1513201765-22222-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty/master][PATCH] ti-pdk-build-rtos:Updating to version 1.0.0.7
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
X-List-Received-Date: Wed, 13 Dec 2017 21:49:29 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb | 100 ++++++++++++++++++++---
 1 file changed, 87 insertions(+), 13 deletions(-)

diff --git a/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb b/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb
index 573c48d..0999b5c 100644
--- a/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb
+++ b/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb
@@ -4,22 +4,22 @@ LIC_FILES_CHKSUM = "file://makerules/env.mk;beginline=1;endline=31;md5=10503e8de
 
 require recipes-ti/includes/ti-paths.inc
 
-PV = "01.00.00.04B"
-PR = "r1"
+PV = "01.00.00.07"
+PR = "r0"
 
 PDK_BUILD_GIT_URI = "git://git.ti.com/keystone-rtos/processor-pdk-build.git"
 PDK_BUILD_GIT_PROTOCOL = "git"
 PDK_BUILD_GIT_BRANCH = "master"
 
-# Below Commit ID corresponds to "DEV.PDK_BUILD.01.00.00.04B"
-PDK_BUILD_SRCREV = "98b62506c451304252c7cd1e6af60dd11adc588a"
+# Below Commit ID corresponds to "DEV.PDK_BUILD.01.00.00.07"
+PDK_BUILD_SRCREV = "cbac264f08aa9cdc2cd533d1433ef57b922cccb5"
 
 BRANCH = "${PDK_BUILD_GIT_BRANCH}"
 SRC_URI = "${PDK_BUILD_GIT_URI};protocol=${PDK_BUILD_GIT_PROTOCOL};branch=${BRANCH}"
 
 SRCREV = "${PDK_BUILD_SRCREV}"
 
-COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|keystone"
+COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|keystone|omapl1|c66x"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 S = "${WORKDIR}/git/"
@@ -53,8 +53,11 @@ do_install_append_ti33x() {
     install -m 0755 makerules/rules_pru.mk ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/makerules
 
     install -m 0755 am335x/config_am335x_a8.bld ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/am335x
-    install -m 0755 pruss/PRU0_to_ARM.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
-    install -m 0755 pruss/PRU1_to_ARM.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
+    install -m 0755 pruss/lnk_a8_a9_a15_REV1.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
+    install -m 0755 pruss/PRU0_REV1_to_ARM.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
+    install -m 0755 pruss/PRU1_REV1_to_ARM.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
+    install -m 0755 pruss/lnk_a8_a9_a15_REV1_linux.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
+    
 }
 
 do_install_append_ti43x() {
@@ -65,13 +68,17 @@ do_install_append_ti43x() {
     install -m 0755 makerules/rules_pru.mk ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/makerules
 
     install -m 0755 am437x/config_am437x_a9.bld ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/am437x
-    install -m 0755 pruss/PRU0_to_ARM.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
-    install -m 0755 pruss/PRU1_to_ARM.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
+    install -m 0755 pruss/lnk_a8_a9_a15_REV1.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
+    install -m 0755 pruss/PRU0_REV1_to_ARM.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
+    install -m 0755 pruss/PRU1_REV1_to_ARM.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
+    install -m 0755 pruss/lnk_a8_a9_a15_REV1_linux.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
+    
 }
 
 do_install_append_am57xx-evm() {
     install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/am571x
     install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/am572x
+    install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/am574x
     install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
 
     install -m 0755 makerules/rules_66.mk ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/makerules
@@ -88,8 +95,25 @@ do_install_append_am57xx-evm() {
     install -m 0755 am572x/config_am572x_c66.bld ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/am572x
     install -m 0755 am572x/config_am572x_a15.bld ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/am572x
     install -m 0755 am572x/mem_segment_definition_1024mb_bios.xs ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/am572x
-    install -m 0755 pruss/PRU0_to_ARM.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
-    install -m 0755 pruss/PRU1_to_ARM.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
+    install -m 0755 am574x/config_am574x.bld ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/am574x
+    install -m 0755 am574x/config_am574x_c66.bld ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/am574x
+    install -m 0755 am574x/config_am574x_a15.bld ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/am574x
+    install -m 0755 am574x/mem_segment_definition_1024mb_bios.xs ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/am574x
+    
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
+    install -m 0755 pruss/lnk_a8_a9_a15_REV1_linux.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
+    install -m 0755 pruss/lnk_a8_a9_a15_REV2_linux.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
 }
 
 do_install_append_am57xx-hs-evm() {
@@ -111,13 +135,25 @@ do_install_append_am57xx-hs-evm() {
     install -m 0755 am572x/config_am572x_c66.bld ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/am572x
     install -m 0755 am572x/config_am572x_a15.bld ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/am572x
     install -m 0755 am572x/mem_segment_definition_1024mb_bios.xs ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/am572x
-    install -m 0755 pruss/PRU0_to_ARM.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
-    install -m 0755 pruss/PRU1_to_ARM.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
+    
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
     install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/tda2xx
     install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/tda3xx
+    install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/tda2ex
 
     install -m 0755 makefile ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/
 
@@ -133,6 +169,10 @@ do_install_append_dra7xx() {
     install -m 0755 tda2xx/mem_segment_definition_1024mb_bios.xs ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/tda2xx
     install -m 0755 tda3xx/config_tda3xx.bld ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/tda3xx
     install -m 0755 tda3xx/config_tda3xx_c66.bld ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/tda3xx
+    install -m 0755 tda2ex/config_tda2ex.bld ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/tda2ex
+    install -m 0755 tda2ex/config_tda2ex_a15.bld ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/tda2ex
+    install -m 0755 tda2ex/config_tda2ex_c66.bld ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/tda2ex
+    install -m 0755 tda2ex/mem_segment_definition_1024mb_bios.xs ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/tda2ex
 }
 
 do_install_append_keystone() {
@@ -142,9 +182,43 @@ do_install_append_keystone() {
 
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
+    install -m 0755 pruss/lnk_a8_a9_a15_REV2_linux.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
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
+do_install_append_omapl137-evm() {
+    install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/omapl137
+
+    install -m 0755 omapl137/config_omapl137_c674x.bld ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/omapl137
+    install -m 0755 omapl137/config_omapl137_arm9.bld ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/omapl137
+}
+
+do_install_append_omapl138-lcdk() {
+    install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/omapl138
+
+    install -m 0755 omapl138/config_omapl138_c674x.bld ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/omapl138
+    install -m 0755 omapl138/config_omapl138_arm9.bld ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/omapl138
 }
 
 FILES_${PN} += "${PDK_INSTALL_DIR_RECIPE}/packages/*"
-- 
1.9.1


