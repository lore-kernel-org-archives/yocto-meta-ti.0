Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B523BE00970; Wed, 12 Jul 2017 14:51:43 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B9097E0090A
	for <meta-ti@yoctoproject.org>; Wed, 12 Jul 2017 14:51:42 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v6CLpVpK001283
	for <meta-ti@yoctoproject.org>; Wed, 12 Jul 2017 16:51:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1499896291;
	bh=SSytAQlFWU9TKMKp0hb+0ZzhmLWCEepE0u/jwwOInKY=;
	h=From:To:CC:Subject:Date;
	b=uVucnGbOGH4AH2dmskjqOTvE437VjgtKk9PHOkhBbEv0HxFB0fvy5VXIFtS4tsyiY
	yrApass/7VGLa3OY//sll8FGEUvOGtrkWO/8xblXbGuTx4kbWwjvzNzot/eKBkd5VA
	TZXzbWC7WnlVR6uV7n258Nzts5q2M+btjDKtCJw4=
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v6CLpQJK017023
	for <meta-ti@yoctoproject.org>; Wed, 12 Jul 2017 16:51:26 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 12 Jul 2017 16:51:26 -0500
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v6CLpQum027161;	Wed, 12 Jul 2017 16:51:26 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 12 Jul 2017 17:51:21 -0400
Message-ID: <1499896281-44438-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH v3] edma3-lld-rtos: Add support for omapl1, c66x and update revision to 2.12.04.28A
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
X-List-Received-Date: Wed, 12 Jul 2017 21:51:43 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---

v3 - Removed dependency on component_meta, fixed target list
v2 - Updated target & platform list for omapl1 and revision

 recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb | 20 ++++++++++++++++++--
 recipes-bsp/edma3-lld/edma3-lld.inc         |  6 +++---
 2 files changed, 21 insertions(+), 5 deletions(-)

diff --git a/recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb b/recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb
index f524478..7e8ed3e 100644
--- a/recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb
+++ b/recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb
@@ -1,11 +1,11 @@
 require edma3-lld.inc
 require recipes-ti/includes/ti-paths.inc
 
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
 
 DEPENDS = "ti-sysbios ti-xdctools gcc-arm-none-eabi-native ti-cgt-arm-native ti-cgt6x-native"
 
-COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|keystone"
+COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|keystone|c66x|omapl1"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 PLATFORMLIST = ""
@@ -29,6 +29,7 @@ TARGETLIST_ti43x = " \
 
 PLATFORMLIST_omap-a15 = " \
         tda2xx-evm \
+        tda3xx-evm \
 "
 
 TARGETLIST_omap-a15 = " \
@@ -43,6 +44,12 @@ PLATFORMLIST_keystone = " \
         tci6630k2l-evm \
         c66ak2e-evm \
         tci66ak2g02-evm \
+        c6657-evm \
+        c6678-evm \
+"
+PLATFORMLIST_omapl1 = " \
+        omapl137-evm \
+        omapl138-evm \
 "
 
 TARGETLIST_keystone = " \
@@ -50,6 +57,10 @@ TARGETLIST_keystone = " \
         a15 \
 "
 
+TARGETLIST_omapl1 = " \
+        arm9 \
+        674 \
+"
 FORMAT="ELF"
 
 S = "${WORKDIR}/git"
@@ -73,6 +84,8 @@ export CROSSAR="${TARGET_PREFIX}ar"
 export CROSSLNK="${TARGET_PREFIX}gcc"
 
 do_configure () {
+    rm -rf ${S}/examples/edma3_driver/evmTCI6614
+    rm -rf ${S}/examples/edma3_driver/evmTCI6614BE
     sed -i -e "s|_config.bld|config.bld|g" ${S}/makerules/env.mk
     sed -i -e "s|^edma3_lld_PATH =.*$|edma3_lld_PATH = ${S}|g" ${S}/makerules/env.mk
     sed -i -e "s|^CODEGEN_PATH_M3 =.*$|CODEGEN_PATH_M3 = ${M4_TOOLCHAIN_INSTALL_DIR}|g" ${S}/makerules/env.mk
@@ -114,3 +127,6 @@ INSANE_SKIP_${PN}-dev = "arch ldflags file-rdeps"
 
 ALLOW_EMPTY_${PN} = "1"
 FILES_${PN}-dev += "${EDMA3_LLD_INSTALL_DIR_RECIPE}"
+
+EXTRA_OEMAKE_remove = "TARGET=66"
+
diff --git a/recipes-bsp/edma3-lld/edma3-lld.inc b/recipes-bsp/edma3-lld/edma3-lld.inc
index 63f1cac..daf9268 100644
--- a/recipes-bsp/edma3-lld/edma3-lld.inc
+++ b/recipes-bsp/edma3-lld/edma3-lld.inc
@@ -6,12 +6,12 @@ EDMA3_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/edma3_lld.git"
 EDMA3_LLD_GIT_PROTOCOL = "git"
 EDMA3_LLD_GIT_BRANCH = "master"
 
-# Below commit ID corresponds to tag "DEV_EDMA3_LLD_02_12_03_27"
-EDMA3_LLD_SRCREV = "ed434ef4019b696b753dae0f98fe6594a7ce35a3"
+# Below commit ID corresponds to tag "DEV_EDMA3_LLD_02_12_04_28A"
+EDMA3_LLD_SRCREV = "8a8ed96465b6625cc3446a65fecebd9c510f4342"
 
 BRANCH = "${EDMA3_LLD_GIT_BRANCH}"
 SRC_URI = "${EDMA3_LLD_GIT_URI};protocol=${EDMA3_LLD_GIT_PROTOCOL};branch=${BRANCH}"
 SRCREV = "${EDMA3_LLD_SRCREV}"
 
-PV = "2.12.03.27"
+PV = "2.12.04.28A"
 INC_PR = "r0"
-- 
1.9.1


