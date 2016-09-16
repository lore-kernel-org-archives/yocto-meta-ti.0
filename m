Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 43F4EE00CAA; Fri, 16 Sep 2016 09:19:11 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 21A9FE00C8B
	for <meta-ti@yoctoproject.org>; Fri, 16 Sep 2016 09:19:07 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 4756D52A26; Fri, 16 Sep 2016 16:19:06 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160916161906.4756D52A26@arago-project.org>
Date: Fri, 16 Sep 2016 16:19:06 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Justin Sobota : pa-lld: Bump version and remove makefile error patch
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
X-List-Received-Date: Fri, 16 Sep 2016 16:19:11 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 9aeeb60207ef8022cd42c6570e92b6759a523f0c
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=9aeeb60207ef8022cd42c6570e92b6759a523f0c

Author: Justin Sobota <jsobota@ti.com>
Date:   Wed Sep 14 21:58:13 2016 +0000

pa-lld: Bump version and remove makefile error patch

Signed-off-by: Justin Sobota <jsobota@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 ...akefile_armv7-fix-missing-separator-error.patch |   30 --------------------
 recipes-bsp/pa-lld/pa-lld.inc                      |   11 +++----
 2 files changed, 5 insertions(+), 36 deletions(-)

diff --git a/recipes-bsp/pa-lld/files/0001-makefile_armv7-fix-missing-separator-error.patch b/recipes-bsp/pa-lld/files/0001-makefile_armv7-fix-missing-separator-error.patch
deleted file mode 100644
index 2ff41d3..0000000
--- a/recipes-bsp/pa-lld/files/0001-makefile_armv7-fix-missing-separator-error.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 60a938e6902c7cb8bec34abbc5a3723c8094d728 Mon Sep 17 00:00:00 2001
-From: Denys Dmytriyenko <denys@ti.com>
-Date: Tue, 1 Dec 2015 00:00:00 -0500
-Subject: [PATCH] makefile_armv7: fix missing separator error
-
-Doesn't seem to work in all versions of Make, fails like this:
-makefile_armv7:27: *** missing separator.  Stop.
-
-Signed-off-by: Denys Dmytriyenko <denys@ti.com>
----
- makefile_armv7 | 3 ---
- 1 file changed, 3 deletions(-)
-
-diff --git a/makefile_armv7 b/makefile_armv7
-index a2bc4f6..1ae6e0a 100644
---- a/makefile_armv7
-+++ b/makefile_armv7
-@@ -24,9 +24,6 @@ else
-     export LLD_NAME=pa
- endif        
- 
--echo DEVICE=$(DEVICE)
--echo LLD_NAME=$(LLD_NAME)
--
- # Output for prebuilt generated libraries
- export ARMV7LIBDIR ?= ./lib
- export ARMV7OBJDIR ?= ./obj/$(DEVICE)
--- 
-2.2.0
-
diff --git a/recipes-bsp/pa-lld/pa-lld.inc b/recipes-bsp/pa-lld/pa-lld.inc
index 6c51560..0b2a4cc 100644
--- a/recipes-bsp/pa-lld/pa-lld.inc
+++ b/recipes-bsp/pa-lld/pa-lld.inc
@@ -9,16 +9,15 @@ PA_LLD_GIT_PROTOCOL = "git"
 PA_LLD_GIT_BRANCH = "master"
 PA_LLD_GIT_DESTSUFFIX = "git/ti/drv/pa"
 
-# Below Commit ID corresponds to "DEV.PA_LLD.03.00.01.12"
-PA_LLD_SRCREV = "d3f3f5d93d3febc24099974bbc77e67c80a83b1e"
+# Below Commit ID corresponds to "DEV.PA_LLD.03.00.02.00"
+PA_LLD_SRCREV = "dca2a281c0c57f3b3018a93fae5485825a33042c"
 
 BRANCH = "${PA_LLD_GIT_BRANCH}"
-SRC_URI = "${PA_LLD_GIT_URI};destsuffix=${PA_LLD_GIT_DESTSUFFIX};protocol=${PA_LLD_GIT_PROTOCOL};branch=${BRANCH} \
-            file://0001-makefile_armv7-fix-missing-separator-error.patch"
+SRC_URI = "${PA_LLD_GIT_URI};destsuffix=${PA_LLD_GIT_DESTSUFFIX};protocol=${PA_LLD_GIT_PROTOCOL};branch=${BRANCH}"
 SRCREV = "${PA_LLD_SRCREV}"
 
-PV = "03.00.01.12"
-INC_PR = "r2"
+PV = "03.00.02.00"
+INC_PR = "r0"
 
 S = "${WORKDIR}/${PA_LLD_GIT_DESTSUFFIX}"
 


