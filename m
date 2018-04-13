Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4BC11E00C54; Fri, 13 Apr 2018 10:12:50 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.27.80 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 977AEE00B28
	for <meta-ti@yoctoproject.org>; Fri, 13 Apr 2018 10:12:48 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id w3DHCmDn012799
	for <meta-ti@yoctoproject.org>; Fri, 13 Apr 2018 12:12:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1523639568;
	bh=EMDQhJoOFeWtNbCx3pHq3EQ0q2JEGcOyXoK0MmIPBbM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=OmUmB+CQ+lhIS+seB787RoPMDlhCc0qNBl4aHzzfbAGXg83MDoap7EAuh0RZh7k63
	6PLWDaNvz9W7PUbUHw9XkQ9GuoyGUlzvQHJhbiFtWReb8d2L36LjdK6+8iNCue2lg8
	2yykNDl8SBy0LDVduK91ee2YgfXArwXBI5wYaUdg=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w3DHCmhZ012484
	for <meta-ti@yoctoproject.org>; Fri, 13 Apr 2018 12:12:48 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Fri, 13 Apr 2018 12:12:47 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE107.ent.ti.com
	(10.64.6.28) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Fri, 13 Apr 2018 12:12:47 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w3DHCfML020225;
	Fri, 13 Apr 2018 12:12:47 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 13 Apr 2018 13:02:19 -0400
Message-ID: <1523638939-28861-24-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1523638939-28861-1-git-send-email-j-stiffler@ti.com>
References: <1523638939-28861-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH 23/23] ti-pdk-build-rtos: Updating to version 01.00.00.08E which uses make install internally
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
X-List-Received-Date: Fri, 13 Apr 2018 17:12:50 -0000
Content-Type: text/plain

From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>

The new version uses make install thereby eliminating the need to do the
same in the yocto recipe. Hence removing the same from the recipe.

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb | 199 +----------------------
 1 file changed, 7 insertions(+), 192 deletions(-)

diff --git a/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb b/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb
index bb133b8..0f60714 100644
--- a/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb
+++ b/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb
@@ -4,15 +4,15 @@ LIC_FILES_CHKSUM = "file://makerules/env.mk;beginline=1;endline=31;md5=10503e8de
 
 require recipes-ti/includes/ti-paths.inc
 
-PV = "01.00.00.08"
+PV = "01.00.00.08E"
 PR = "r0"
 
 PDK_BUILD_GIT_URI = "git://git.ti.com/keystone-rtos/processor-pdk-build.git"
 PDK_BUILD_GIT_PROTOCOL = "git"
 PDK_BUILD_GIT_BRANCH = "master"
 
-# Below Commit ID corresponds to "DEV.PDK_BUILD.01.00.00.08"
-PDK_BUILD_SRCREV = "f68931ff82eb051fc026ae28b2555f3c581eb6b9"
+# Below Commit ID corresponds to "DEV.PDK_BUILD.01.00.00.08E"
+PDK_BUILD_SRCREV = "9622a097c143188cab74b8827461eafdf54f8ed9"
 
 BRANCH = "${PDK_BUILD_GIT_BRANCH}"
 SRC_URI = "\
@@ -27,202 +27,17 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 S = "${WORKDIR}/git/"
 
+PARALLEL_MAKE = ""
 CLEANBROKEN = "1"
 
 do_compile() {
     :
 }
 
-do_install() {
-    install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build
-    install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/makerules
-
-    install -m 0755 Rules.make ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build
-    install -m 0755 comp_top.mk ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build
-    install -m 0755 comp_paths.mk ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build
-
-    install -m 0755 makerules/build_config.mk ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/makerules
-    install -m 0755 makerules/common.mk ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/makerules
-    install -m 0755 makerules/component.mk ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/makerules
-    install -m 0755 makerules/env.mk ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/makerules
-    install -m 0755 makerules/platform.mk ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/makerules
-}
-
-do_install_append_ti33x() {
-    install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/am335x
-    install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
-
-    install -m 0755 makerules/rules_a8.mk ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/makerules
-    install -m 0755 makerules/rules_a8_extend.mk ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/makerules
-    install -m 0755 makerules/rules_pru.mk ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/makerules
-
-    install -m 0755 am335x/config_am335x_a8.bld ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/am335x
-    install -m 0755 pruss/lnk_a8_a9_a15_REV1.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
-    install -m 0755 pruss/PRU0_REV1_to_ARM.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
-    install -m 0755 pruss/PRU1_REV1_to_ARM.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
-    install -m 0755 pruss/lnk_a8_a9_a15_REV1_linux.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
-    
-}
-
-do_install_append_ti43x() {
-    install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/am437x
-    install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
-
-    install -m 0755 makerules/rules_a9.mk ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/makerules
-    install -m 0755 makerules/rules_pru.mk ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/makerules
-
-    install -m 0755 am437x/config_am437x_a9.bld ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/am437x
-    install -m 0755 pruss/lnk_a8_a9_a15_REV1.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
-    install -m 0755 pruss/PRU0_REV1_to_ARM.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
-    install -m 0755 pruss/PRU1_REV1_to_ARM.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
-    install -m 0755 pruss/lnk_a8_a9_a15_REV1_linux.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
-    
-}
-
-do_install_append_am57xx-evm() {
-    install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/am571x
-    install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/am572x
-    install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/am574x
-    install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
-
-    install -m 0755 makerules/rules_66.mk ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/makerules
-    install -m 0755 makerules/rules_a15.mk ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/makerules
-    install -m 0755 makerules/rules_m4.mk ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/makerules
-    install -m 0755 makerules/rules_ti_cgt_arm.mk ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/makerules
-    install -m 0755 makerules/rules_pru.mk ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/makerules
-
-    install -m 0755 am571x/config_am571x.bld ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/am571x
-    install -m 0755 am571x/config_am571x_c66.bld ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/am571x
-    install -m 0755 am571x/config_am571x_a15.bld ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/am571x
-    install -m 0755 am571x/mem_segment_definition_1024mb_bios.xs ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/am571x
-    install -m 0755 am572x/config_am572x.bld ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/am572x
-    install -m 0755 am572x/config_am572x_c66.bld ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/am572x
-    install -m 0755 am572x/config_am572x_a15.bld ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/am572x
-    install -m 0755 am572x/mem_segment_definition_1024mb_bios.xs ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/am572x
-    install -m 0755 am574x/config_am574x.bld ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/am574x
-    install -m 0755 am574x/config_am574x_c66.bld ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/am574x
-    install -m 0755 am574x/config_am574x_a15.bld ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/am574x
-    install -m 0755 am574x/mem_segment_definition_1024mb_bios.xs ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/am574x
-    
-    install -m 0755 pruss/lnk_a8_a9_a15_REV1.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
-    install -m 0755 pruss/lnk_c66_m4_REV1.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
-    install -m 0755 pruss/PRU0_REV1_to_ARM.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
-    install -m 0755 pruss/PRU0_REV1_to_C66.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
-    install -m 0755 pruss/PRU1_REV1_to_ARM.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
-    install -m 0755 pruss/PRU1_REV1_to_C66.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
-    install -m 0755 pruss/lnk_a8_a9_a15_REV2.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
-    install -m 0755 pruss/lnk_c66_m4_REV2.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
-    install -m 0755 pruss/PRU0_REV2_to_ARM.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
-    install -m 0755 pruss/PRU0_REV2_to_C66.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
-    install -m 0755 pruss/PRU1_REV2_to_ARM.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
-    install -m 0755 pruss/PRU1_REV2_to_C66.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
-    install -m 0755 pruss/lnk_a8_a9_a15_REV1_linux.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
-    install -m 0755 pruss/lnk_a8_a9_a15_REV2_linux.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
-}
-
-do_install_append_am57xx-hs-evm() {
-    install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/am571x
-    install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/am572x
-    install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
-
-    install -m 0755 makerules/rules_66.mk ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/makerules
-    install -m 0755 makerules/rules_a15.mk ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/makerules
-    install -m 0755 makerules/rules_m4.mk ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/makerules
-    install -m 0755 makerules/rules_ti_cgt_arm.mk ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/makerules
-    install -m 0755 makerules/rules_pru.mk ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/makerules
-
-    install -m 0755 am571x/config_am571x.bld ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/am571x
-    install -m 0755 am571x/config_am571x_c66.bld ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/am571x
-    install -m 0755 am571x/config_am571x_a15.bld ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/am571x
-    install -m 0755 am571x/mem_segment_definition_1024mb_bios.xs ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/am571x
-    install -m 0755 am572x/config_am572x.bld ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/am572x
-    install -m 0755 am572x/config_am572x_c66.bld ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/am572x
-    install -m 0755 am572x/config_am572x_a15.bld ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/am572x
-    install -m 0755 am572x/mem_segment_definition_1024mb_bios.xs ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/am572x
-    
-    install -m 0755 pruss/lnk_a8_a9_a15_REV1.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
-    install -m 0755 pruss/lnk_c66_m4_REV1.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
-    install -m 0755 pruss/PRU0_REV1_to_ARM.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
-    install -m 0755 pruss/PRU0_REV1_to_C66.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
-    install -m 0755 pruss/PRU1_REV1_to_ARM.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
-    install -m 0755 pruss/PRU1_REV1_to_C66.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
-    install -m 0755 pruss/lnk_a8_a9_a15_REV2.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
-    install -m 0755 pruss/lnk_c66_m4_REV2.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
-    install -m 0755 pruss/PRU0_REV2_to_ARM.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
-    install -m 0755 pruss/PRU0_REV2_to_C66.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
-    install -m 0755 pruss/PRU1_REV2_to_ARM.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
-    install -m 0755 pruss/PRU1_REV2_to_C66.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
-}
+EXTRA_OEMAKE = "-f make_install LIMIT_SOCS="${TI_PDK_LIMIT_SOCS}" PDK_INSTALL_DIR="${D}${PDK_INSTALL_DIR_RECIPE}""
 
-do_install_append_dra7xx() {
-    install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/tda2xx
-    install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/tda3xx
-    install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/tda2ex
-
-    install -m 0755 makefile ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/
-
-    install -m 0755 makerules/rules_66.mk ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/makerules
-    install -m 0755 makerules/rules_a15.mk ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/makerules
-    install -m 0755 makerules/rules_m4.mk ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/makerules
-    install -m 0755 makerules/rules_arp32.mk ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/makerules
-    install -m 0755 makerules/rules_ti_cgt_arm.mk ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/makerules
-
-    install -m 0755 tda2xx/config_tda2xx.bld ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/tda2xx
-    install -m 0755 tda2xx/config_tda2xx_a15.bld ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/tda2xx
-    install -m 0755 tda2xx/config_tda2xx_c66.bld ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/tda2xx
-    install -m 0755 tda2xx/mem_segment_definition_1024mb_bios.xs ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/tda2xx
-    install -m 0755 tda3xx/config_tda3xx.bld ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/tda3xx
-    install -m 0755 tda3xx/config_tda3xx_c66.bld ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/tda3xx
-    install -m 0755 tda2ex/config_tda2ex.bld ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/tda2ex
-    install -m 0755 tda2ex/config_tda2ex_a15.bld ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/tda2ex
-    install -m 0755 tda2ex/config_tda2ex_c66.bld ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/tda2ex
-    install -m 0755 tda2ex/mem_segment_definition_1024mb_bios.xs ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/tda2ex
-}
-
-do_install_append_keystone() {
-    install -m 0755 makerules/rules_66.mk ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/makerules
-    install -m 0755 makerules/rules_a15.mk ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/makerules
-}
-
-do_install_append_k2g() {
-    install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/k2g
-    install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss    
-
-    install -m 0755 makerules/rules_pru.mk ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/makerules
-    install -m 0755 k2g/config_k2g_a15.bld ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/k2g
-    install -m 0755 k2g/config_k2g_c66.bld ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/k2g
-    install -m 0755 pruss/lnk_a8_a9_a15_REV2.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
-    install -m 0755 pruss/lnk_c66_m4_REV2.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
-    install -m 0755 pruss/PRU0_REV2_to_ARM.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
-    install -m 0755 pruss/PRU0_REV2_to_C66.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
-    install -m 0755 pruss/PRU1_REV2_to_ARM.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
-    install -m 0755 pruss/PRU1_REV2_to_C66.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss    
-    install -m 0755 pruss/lnk_a8_a9_a15_REV2_linux.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
-}
-
-do_install_append_c66x() {
-    install -m 0755 makerules/rules_66.mk ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/makerules
-}
-
-do_install_append_omapl1() {
-
-    install -m 0755 makerules/rules_674.mk ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/makerules
-    install -m 0755 makerules/rules_ae9.mk ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/makerules
-    install -m 0755 makerules/rules_ti_cgt_arm.mk ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/makerules
-}
-
-do_install_append_omapl137-evm() {
-    install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/omapl137
-
-    install -m 0755 omapl137/config_omapl137_c674x.bld ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/omapl137
-    install -m 0755 omapl137/config_omapl137_arm9.bld ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/omapl137
-}
-
-do_install_append_omapl138-lcdk() {
-    install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/omapl138
-
-    install -m 0755 omapl138/config_omapl138_c674x.bld ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/omapl138
-    install -m 0755 omapl138/config_omapl138_arm9.bld ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/omapl138
+do_install() {
+    oe_runmake
 }
 
 FILES_${PN} += "${PDK_INSTALL_DIR_RECIPE}/packages/*"
-- 
2.7.4


