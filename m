Return-Path: <jsobota@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C3158E0049B; Wed, 14 Sep 2016 08:59:03 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7A1AEE0043B
	for <meta-ti@yoctoproject.org>; Wed, 14 Sep 2016 08:59:01 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u8EFx1ES004603
	for <meta-ti@yoctoproject.org>; Wed, 14 Sep 2016 10:59:01 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u8EFwx08020196
	for <meta-ti@yoctoproject.org>; Wed, 14 Sep 2016 10:59:00 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 14 Sep 2016 10:58:59 -0500
Received: from a0756824local.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u8EFwxRd032222;	Wed, 14 Sep 2016 10:58:59 -0500
From: Justin Sobota <jsobota@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 14 Sep 2016 11:58:58 -0400
Message-ID: <1473868738-3737-1-git-send-email-jsobota@ti.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [master/krogoth][PATCH v2 6/6] ti-pdk-build-rtos: Bump version and add comp_top.mk to install
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
X-List-Received-Date: Wed, 14 Sep 2016 15:59:03 -0000
Content-Type: text/plain

Signed-off-by: Justin Sobota <jsobota@ti.com>
---
 recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb |    9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb b/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb
index 3a3ab55..36fd360 100644
--- a/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb
+++ b/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb
@@ -4,15 +4,15 @@ LIC_FILES_CHKSUM = "file://makerules/env.mk;beginline=1;endline=31;md5=10503e8de
 
 require recipes-ti/includes/ti-paths.inc
 
-PV = "01.00.00.00A"
-PR = "r4"
+PV = "01.00.00.02"
+PR = "r0"
 
 PDK_BUILD_GIT_URI = "git://git.ti.com/keystone-rtos/processor-pdk-build.git"
 PDK_BUILD_GIT_PROTOCOL = "git"
 PDK_BUILD_GIT_BRANCH = "master"
 
-# Below Commit ID corresponds to "DEV.PDK_BUILD.01.00.00.00A"
-PDK_BUILD_SRCREV = "8a026319765cc125e2daef709841bb3ce1a8d325"
+# Below Commit ID corresponds to "DEV.PDK_BUILD.01.00.00.02"
+PDK_BUILD_SRCREV = "0bbd9d2fdff205fda4893936d7cb71404c003b93"
 
 BRANCH = "${PDK_BUILD_GIT_BRANCH}"
 SRC_URI = "${PDK_BUILD_GIT_URI};protocol=${PDK_BUILD_GIT_PROTOCOL};branch=${BRANCH}"
@@ -36,6 +36,7 @@ do_install() {
     install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/am572x
     
     install -m 0755 Rules.make ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build
+    install -m 0755 comp_top.mk ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build
 
     sed -i -e "s|c\:/ti/ccsv5/utils/cygwin|\$(XDC_INSTALL_PATH)/bin|g" \
         ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/Rules.make
-- 
1.7.10.4


