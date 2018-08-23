Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 64D4CE00546; Wed, 22 Aug 2018 17:09:28 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 39249E00474
	for <meta-ti@yoctoproject.org>; Wed, 22 Aug 2018 17:09:27 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7N09QSp054059
	for <meta-ti@yoctoproject.org>; Wed, 22 Aug 2018 19:09:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1534982966;
	bh=P9Jn1IpZ5qdDuNasDos1DjzP8tUy6G13trvxkHCLaXo=;
	h=From:To:CC:Subject:Date;
	b=K9oaX2o+5X/EliDz28MrcBsWv01VNIB/BB3C9oWx8lPSWSMnFL9iXoDtH9+J1Oljq
	WF8YgOE4KgEXXbPEqrXPRxYr1tkZGEA7hImwg4OR1OAicfBSjbt7x+sJ959VYihD+w
	EeWeABOLJc9m8kJkwKOzgkShDPQ3xpbnvx9IsmFU=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7N09Qnq020509
	for <meta-ti@yoctoproject.org>; Wed, 22 Aug 2018 19:09:26 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Wed, 22 Aug 2018 19:09:26 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Wed, 22 Aug 2018 19:09:26 -0500
Received: from uda0862859a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7N09Pbn020890;
	Wed, 22 Aug 2018 19:09:26 -0500
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>, <hzhang@ti.com>
Date: Wed, 22 Aug 2018 20:09:23 -0400
Message-ID: <1534982964-11887-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko][PATCH v2 1/4] ti-pdk-build-rtos: Update to new version 1.0.0.10
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
X-List-Received-Date: Thu, 23 Aug 2018 00:09:28 -0000
Content-Type: text/plain

Add support for am65xx-evm

Signed-off-by: Sam Nelson <sam.nelson@ti.com>

---
Change from previous version
Add INSANE_SKIP_${PN} += " file-rdeps" to avoid check for bash dependency
---
---
 recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb b/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb
index c838d71..65b90ff 100644
--- a/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb
+++ b/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb
@@ -4,25 +4,24 @@ LIC_FILES_CHKSUM = "file://makerules/env.mk;beginline=1;endline=31;md5=10503e8de
 
 require recipes-ti/includes/ti-paths.inc
 
-PV = "01.00.00.09A"
+PV = "01.00.00.10"
 PR = "r0"
 
 PDK_BUILD_GIT_URI = "git://git.ti.com/keystone-rtos/processor-pdk-build.git"
 PDK_BUILD_GIT_PROTOCOL = "git"
 PDK_BUILD_GIT_BRANCH = "master"
 
-# Below Commit ID corresponds to "DEV.PDK_BUILD.01.00.00.09A"
-PDK_BUILD_SRCREV = "4870d6cfcab92dfedae8ed28054fdc61169e28b1"
+# Below Commit ID corresponds to "DEV.PDK_BUILD.01.00.00.10"
+PDK_BUILD_SRCREV = "f06835474e51a5fd63cf23bab0d2f42b0f73f19d"
 
 BRANCH = "${PDK_BUILD_GIT_BRANCH}"
 SRC_URI = "\
     ${PDK_BUILD_GIT_URI};protocol=${PDK_BUILD_GIT_PROTOCOL};branch=${BRANCH} \
-    file://0001-comp_mk-Allow-doxygen-support-to-be-overridden.patch \
     "
 
 SRCREV = "${PDK_BUILD_SRCREV}"
 
-COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|keystone|omapl1|c66x"
+COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|keystone|omapl1|c66x|am65xx-evm"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 S = "${WORKDIR}/git/"
@@ -41,3 +40,4 @@ do_install() {
 }
 
 FILES_${PN} += "${PDK_INSTALL_DIR_RECIPE}/packages/*"
+INSANE_SKIP_${PN} += " file-rdeps"
-- 
1.9.1


