Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 61FDCE00ADF; Tue,  1 Dec 2015 12:44:41 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,RDNS_DYNAMIC
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  1.0 RDNS_DYNAMIC Delivered to internal network by host with
	*      dynamic-looking rDNS
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3AF3AE00ADF
	for <meta-ti@yoctoproject.org>; Tue,  1 Dec 2015 12:44:32 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id B55A752997; Tue,  1 Dec 2015 20:44:31 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20151201204431.B55A752997@arago-project.org>
Date: Tue,  1 Dec 2015 20:44:31 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : pa-lld: set sane defaults when platform is not defined
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
X-List-Received-Date: Tue, 01 Dec 2015 20:44:41 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 8195b22cb136a91d32151ef932de0958a931361c
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=8195b22cb136a91d32151ef932de0958a931361c

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Tue Dec  1 11:25:56 2015 +0000

pa-lld: set sane defaults when platform is not defined

Also fix this build error:
| makefile_armv7:27: *** missing separator.  Stop.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 ...akefile_armv7-fix-missing-separator-error.patch |   30 ++++++++++++++++++++
 recipes-bsp/pa-lld/pa-lld.inc                      |    7 +++-
 recipes-bsp/pa-lld/pa-lld_git.bb                   |    2 +-
 3 files changed, 36 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/pa-lld/files/0001-makefile_armv7-fix-missing-separator-error.patch b/recipes-bsp/pa-lld/files/0001-makefile_armv7-fix-missing-separator-error.patch
new file mode 100644
index 0000000..2ff41d3
--- /dev/null
+++ b/recipes-bsp/pa-lld/files/0001-makefile_armv7-fix-missing-separator-error.patch
@@ -0,0 +1,30 @@
+From 60a938e6902c7cb8bec34abbc5a3723c8094d728 Mon Sep 17 00:00:00 2001
+From: Denys Dmytriyenko <denys@ti.com>
+Date: Tue, 1 Dec 2015 00:00:00 -0500
+Subject: [PATCH] makefile_armv7: fix missing separator error
+
+Doesn't seem to work in all versions of Make, fails like this:
+makefile_armv7:27: *** missing separator.  Stop.
+
+Signed-off-by: Denys Dmytriyenko <denys@ti.com>
+---
+ makefile_armv7 | 3 ---
+ 1 file changed, 3 deletions(-)
+
+diff --git a/makefile_armv7 b/makefile_armv7
+index a2bc4f6..1ae6e0a 100644
+--- a/makefile_armv7
++++ b/makefile_armv7
+@@ -24,9 +24,6 @@ else
+     export LLD_NAME=pa
+ endif        
+ 
+-echo DEVICE=$(DEVICE)
+-echo LLD_NAME=$(LLD_NAME)
+-
+ # Output for prebuilt generated libraries
+ export ARMV7LIBDIR ?= ./lib
+ export ARMV7OBJDIR ?= ./obj/$(DEVICE)
+-- 
+2.2.0
+
diff --git a/recipes-bsp/pa-lld/pa-lld.inc b/recipes-bsp/pa-lld/pa-lld.inc
index 082d59d..396278d 100644
--- a/recipes-bsp/pa-lld/pa-lld.inc
+++ b/recipes-bsp/pa-lld/pa-lld.inc
@@ -13,18 +13,21 @@ PA_LLD_GIT_DESTSUFFIX = "git/ti/drv/pa"
 PA_LLD_SRCREV = "ae3aa3e80ecf64fe5a16515d134a6bc217220e2e"
 
 BRANCH = "${PA_LLD_GIT_BRANCH}"
-SRC_URI = "${PA_LLD_GIT_URI};destsuffix=${PA_LLD_GIT_DESTSUFFIX};protocol=${PA_LLD_GIT_PROTOCOL};branch=${BRANCH}"
+SRC_URI = "${PA_LLD_GIT_URI};destsuffix=${PA_LLD_GIT_DESTSUFFIX};protocol=${PA_LLD_GIT_PROTOCOL};branch=${BRANCH} \
+            file://0001-makefile_armv7-fix-missing-separator-error.patch"
 SRCREV = "${PA_LLD_SRCREV}"
 
 PV = "03.00.01.05"
-INC_PR = "r2"
+INC_PR = "r3"
 
 S = "${WORKDIR}/${PA_LLD_GIT_DESTSUFFIX}"
 
+DEVICELIST = "k2h k2k k2l k2e"
 DEVICELIST_k2hk-evm = "k2h k2k"
 DEVICELIST_k2l-evm = "k2l"
 DEVICELIST_k2e-evm = "k2e"
 
+LIBPA = "libpa"
 LIBPA_k2hk-evm = "libpa"
 LIBPA_k2e-evm = "libpa2"
 LIBPA_k2l-evm = "libpa2"
diff --git a/recipes-bsp/pa-lld/pa-lld_git.bb b/recipes-bsp/pa-lld/pa-lld_git.bb
index 501ee2d..f6de5b1 100644
--- a/recipes-bsp/pa-lld/pa-lld_git.bb
+++ b/recipes-bsp/pa-lld/pa-lld_git.bb
@@ -10,7 +10,7 @@ do_compile () {
 #   Now build the lld in the updated directory
     for device in ${DEVICELIST}
     do
-        make -f makefile_armv7 DEVICE=$device lib PDK_INSTALL_PATH=${STAGING_INCDIR}
+        make -f makefile_armv7 lib PDK_INSTALL_PATH=${STAGING_INCDIR} DEVICE="$device"
     done
 }
 


