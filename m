Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0E788E00BFF; Fri, 20 Apr 2018 12:29:38 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D881AE00843
	for <meta-ti@yoctoproject.org>; Fri, 20 Apr 2018 12:29:35 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 216C920AF8;
	Fri, 20 Apr 2018 19:29:35 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id UkUe5xVRohaO; Fri, 20 Apr 2018 19:29:35 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id ADB032079D;
	Fri, 20 Apr 2018 19:29:33 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 477501633B1;
	Fri, 20 Apr 2018 15:29:33 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-ti@yoctoproject.org
Date: Fri, 20 Apr 2018 15:29:30 -0400
Message-Id: <1524252572-1667-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [rocko/master][PATCH 1/3] recipes: fix host contamination warnings
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
X-List-Received-Date: Fri, 20 Apr 2018 19:29:38 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/cppi-lld/cppi-lld_git.bb        | 3 ++-
 recipes-bsp/pa-lld/pa-lld_git.bb            | 3 ++-
 recipes-bsp/pktlib/pktlib_git.bb            | 1 +
 recipes-bsp/qmss-lld/qmss-lld_git.bb        | 2 +-
 recipes-bsp/rm-lld/rm-lld_git.bb            | 1 +
 recipes-ti/ipc/ipc-transport-qmss_git.bb    | 1 +
 recipes-ti/multiprocmgr/multiprocmgr_git.bb | 1 +
 7 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/cppi-lld/cppi-lld_git.bb b/recipes-bsp/cppi-lld/cppi-lld_git.bb
index edbc35d..6ac72cf 100644
--- a/recipes-bsp/cppi-lld/cppi-lld_git.bb
+++ b/recipes-bsp/cppi-lld/cppi-lld_git.bb
@@ -16,7 +16,8 @@ do_compile () {
 }
 
 do_install () {
-	make -f makefile_armv7 install PDK_INSTALL_PATH=${STAGING_INCDIR} INSTALL_INC_BASE_DIR=${D}/${includedir} INSTALL_LIB_BASE_DIR=${D}${libdir}
+    make -f makefile_armv7 install PDK_INSTALL_PATH=${STAGING_INCDIR} INSTALL_INC_BASE_DIR=${D}/${includedir} INSTALL_LIB_BASE_DIR=${D}${libdir}
+    chown -R root:root ${D}
 
 #   Set the generic device library symbolic link to default k2h
     cd ${D}${libdir}
diff --git a/recipes-bsp/pa-lld/pa-lld_git.bb b/recipes-bsp/pa-lld/pa-lld_git.bb
index f6de5b1..f636ce4 100644
--- a/recipes-bsp/pa-lld/pa-lld_git.bb
+++ b/recipes-bsp/pa-lld/pa-lld_git.bb
@@ -15,7 +15,8 @@ do_compile () {
 }
 
 do_install () {
-	make -f makefile_armv7 install PDK_INSTALL_PATH=${STAGING_INCDIR} INSTALL_INC_BASE_DIR=${D}${includedir} INSTALL_LIB_BASE_DIR=${D}${libdir}
+    make -f makefile_armv7 install PDK_INSTALL_PATH=${STAGING_INCDIR} INSTALL_INC_BASE_DIR=${D}${includedir} INSTALL_LIB_BASE_DIR=${D}${libdir}
+    chown -R root:root ${D}
 
 #   Set the generic device library symbolic link
     ln -sf ${LIBPA}.so.1.0.0 ${D}${libdir}/libpa_device.so.1
diff --git a/recipes-bsp/pktlib/pktlib_git.bb b/recipes-bsp/pktlib/pktlib_git.bb
index dd66bd9..b15b61b 100644
--- a/recipes-bsp/pktlib/pktlib_git.bb
+++ b/recipes-bsp/pktlib/pktlib_git.bb
@@ -15,4 +15,5 @@ do_compile () {
 
 do_install () {
 	oe_runmake install
+	chown -R root:root ${D}
 }
diff --git a/recipes-bsp/qmss-lld/qmss-lld_git.bb b/recipes-bsp/qmss-lld/qmss-lld_git.bb
index 813929e..a3c1a3b 100644
--- a/recipes-bsp/qmss-lld/qmss-lld_git.bb
+++ b/recipes-bsp/qmss-lld/qmss-lld_git.bb
@@ -13,11 +13,11 @@ do_compile () {
 	do
 		make -f makefile_armv7 lib PDK_INSTALL_PATH=${STAGING_INCDIR}  DEVICE="${device}"
 	done
-
 }
 
 do_install () {
     make -f makefile_armv7 install PDK_INSTALL_PATH=${STAGING_INCDIR} INSTALL_INC_BASE_DIR=${D}${includedir} INSTALL_LIB_BASE_DIR=${D}${libdir}
+    chown -R root:root ${D}
 
     # Set the generic device library symbolic link to default k2h
     cd ${D}${libdir}
diff --git a/recipes-bsp/rm-lld/rm-lld_git.bb b/recipes-bsp/rm-lld/rm-lld_git.bb
index 659e620..ae79a34 100644
--- a/recipes-bsp/rm-lld/rm-lld_git.bb
+++ b/recipes-bsp/rm-lld/rm-lld_git.bb
@@ -27,4 +27,5 @@ do_install () {
     install -d ${D}${libdir}
     install -d ${D}${bindir}
     make -f makefile_armv7 install installbin installbin_test INSTALL_INC_BASE_DIR=${D}${includedir} INSTALL_LIB_BASE_DIR=${D}${libdir} INSTALL_BIN_BASE_DIR=${D}${bindir}
+    chown -R root:root ${D}
 }
diff --git a/recipes-ti/ipc/ipc-transport-qmss_git.bb b/recipes-ti/ipc/ipc-transport-qmss_git.bb
index 09acbf0..4c9aade 100644
--- a/recipes-ti/ipc/ipc-transport-qmss_git.bb
+++ b/recipes-ti/ipc/ipc-transport-qmss_git.bb
@@ -13,4 +13,5 @@ do_compile () {
 do_install () {
 	oe_runmake install INSTALL_INC_BASE_DIR=${D}${includedir} \
 		INSTALL_LIB_BASE_DIR=${D}${libdir}
+	chown -R root:root ${D}
 }
diff --git a/recipes-ti/multiprocmgr/multiprocmgr_git.bb b/recipes-ti/multiprocmgr/multiprocmgr_git.bb
index 1ec2241..b37c332 100644
--- a/recipes-ti/multiprocmgr/multiprocmgr_git.bb
+++ b/recipes-ti/multiprocmgr/multiprocmgr_git.bb
@@ -42,4 +42,5 @@ do_install() {
 
 	install -d ${D}${libdir}/
 	cp -a ${S}/lib/* ${D}${libdir}/
+	chown -R root:root ${D}${libdir}/
 }
-- 
2.7.4


