Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1B23EE0094C; Thu,  4 May 2017 12:49:46 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A4558E007EE
	for <meta-ti@yoctoproject.org>; Thu,  4 May 2017 12:49:41 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 7C6CD20873;
	Thu,  4 May 2017 19:49:40 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id CUVxOTrSiwLU; Thu,  4 May 2017 19:49:40 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 5352A20066;
	Thu,  4 May 2017 19:49:38 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id D0FE516249B;
	Thu,  4 May 2017 15:49:37 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-ti@yoctoproject.org
Date: Thu,  4 May 2017 15:49:37 -0400
Message-Id: <1493927377-140060-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [morty/master][PATCH] ti-pdk-build-rtos: use k2g SOC family, clean up whitespaces
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
X-List-Received-Date: Thu, 04 May 2017 19:49:46 -0000

Use k2g SOC family to cover HS and GP devices.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Cc: Justin Sobota <jsobota@ti.com>
---
 recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb b/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb
index 6031ed1..b196ee6 100644
--- a/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb
+++ b/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb
@@ -32,7 +32,7 @@ do_compile() {
 do_install() {
     install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build
     install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/makerules
-    
+
     install -m 0755 Rules.make ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build
     install -m 0755 comp_top.mk ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build
 
@@ -62,7 +62,7 @@ do_install_append_ti43x() {
 
     install -m 0755 makerules/rules_a9.mk ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/makerules
     install -m 0755 makerules/rules_pru.mk ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/makerules
-    
+
     install -m 0755 am437x/config_am437x_a9.bld ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/am437x
     install -m 0755 pruss/PRU0_to_ARM.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
     install -m 0755 pruss/PRU1_to_ARM.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
@@ -78,7 +78,7 @@ do_install_append_am57xx-evm() {
     install -m 0755 makerules/rules_m4.mk ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/makerules
     install -m 0755 makerules/rules_ti_cgt_arm.mk ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/makerules
     install -m 0755 makerules/rules_pru.mk ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/makerules
-    
+
     install -m 0755 am571x/config_am571x.bld ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/am571x
     install -m 0755 am571x/config_am571x_c66.bld ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/am571x
     install -m 0755 am571x/config_am571x_a15.bld ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/am571x
@@ -101,7 +101,7 @@ do_install_append_am57xx-hs-evm() {
     install -m 0755 makerules/rules_m4.mk ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/makerules
     install -m 0755 makerules/rules_ti_cgt_arm.mk ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/makerules
     install -m 0755 makerules/rules_pru.mk ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/makerules
-    
+
     install -m 0755 am571x/config_am571x.bld ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/am571x
     install -m 0755 am571x/config_am571x_c66.bld ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/am571x
     install -m 0755 am571x/config_am571x_a15.bld ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/am571x
@@ -113,7 +113,7 @@ do_install_append_am57xx-hs-evm() {
     install -m 0755 pruss/PRU0_to_ARM.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
     install -m 0755 pruss/PRU1_to_ARM.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
 }
-    
+
 do_install_append_dra7xx() {
     install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/tda2xx
     install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/tda3xx
@@ -139,7 +139,7 @@ do_install_append_keystone() {
     install -m 0755 makerules/rules_a15.mk ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/makerules
 }
 
-do_install_append_k2g-evm() {
+do_install_append_k2g() {
     install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/k2g
 
     install -m 0755 k2g/config_k2g_a15.bld ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/k2g
-- 
2.7.4


