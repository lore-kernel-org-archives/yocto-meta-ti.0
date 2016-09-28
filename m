Return-Path: <jsobota@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0E04CE00D12; Wed, 28 Sep 2016 08:44:26 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.152 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BE24FE00CFC
	for <meta-ti@yoctoproject.org>; Wed, 28 Sep 2016 08:44:22 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id u8SFiM7g013905
	for <meta-ti@yoctoproject.org>; Wed, 28 Sep 2016 10:44:22 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u8SFiLdv012403
	for <meta-ti@yoctoproject.org>; Wed, 28 Sep 2016 10:44:21 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 28 Sep 2016 10:44:20 -0500
Received: from a0756824local.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u8SFiGKY010765;	Wed, 28 Sep 2016 10:44:20 -0500
From: Justin Sobota <jsobota@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 28 Sep 2016 11:44:04 -0400
Message-ID: <1475077444-16485-3-git-send-email-jsobota@ti.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1475077444-16485-1-git-send-email-jsobota@ti.com>
References: <1475077444-16485-1-git-send-email-jsobota@ti.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] ti-pdk-build-rtos: Update to version 1.0.0.2B
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
X-List-Received-Date: Wed, 28 Sep 2016 15:44:26 -0000
Content-Type: text/plain

Signed-off-by: Justin Sobota <jsobota@ti.com>
---
 recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb |    9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

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
-- 
1.7.10.4


