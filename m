Return-Path: <jsobota@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 04813E0049A; Wed, 14 Sep 2016 08:55:15 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B09C7E0043B
	for <meta-ti@yoctoproject.org>; Wed, 14 Sep 2016 08:55:12 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u8EFtBPJ002244
	for <meta-ti@yoctoproject.org>; Wed, 14 Sep 2016 10:55:11 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u8EFtAa8015045
	for <meta-ti@yoctoproject.org>; Wed, 14 Sep 2016 10:55:10 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 14 Sep 2016 10:55:10 -0500
Received: from a0756824local.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u8EFtAmY023854;	Wed, 14 Sep 2016 10:55:10 -0500
From: Justin Sobota <jsobota@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 14 Sep 2016 11:55:08 -0400
Message-ID: <1473868508-3642-1-git-send-email-jsobota@ti.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH 1/4] pa-lld: Bump version and remove makefile error patch
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
X-List-Received-Date: Wed, 14 Sep 2016 15:55:15 -0000
Content-Type: text/plain

Signed-off-by: Justin Sobota <jsobota@ti.com>
---
 ...akefile_armv7-fix-missing-separator-error.patch |   30 --------------------
 recipes-bsp/pa-lld/pa-lld.inc                      |   11 ++++---
 2 files changed, 5 insertions(+), 36 deletions(-)
 delete mode 100644 recipes-bsp/pa-lld/files/0001-makefile_armv7-fix-missing-separator-error.patch

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
 
-- 
1.7.10.4


