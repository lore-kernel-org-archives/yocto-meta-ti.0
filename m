Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id AAF10E009D7; Mon, 30 Nov 2015 21:26:10 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [206.46.173.17 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E3F65E00978
	for <meta-ti@yoctoproject.org>; Mon, 30 Nov 2015 21:26:09 -0800 (PST)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173017.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NYN00DQHZ38U990@vms173017.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Mon, 30 Nov 2015 23:26:07 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WcjxEBVX c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=qtqOOiqGOCEA:10 a=sozttTNsAAAA:8
	a=yuy-qJ4TrphRiMpqrg0A:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 73B9F161D28;	Tue,
	1 Dec 2015 00:25:56 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Tue, 01 Dec 2015 00:25:56 -0500
Message-id: <1448947556-13421-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH v3] pa-lld: set sane defaults when platform is not defined
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
X-List-Received-Date: Tue, 01 Dec 2015 05:26:10 -0000

From: Denys Dmytriyenko <denys@ti.com>

Also fix this build error:
| makefile_armv7:27: *** missing separator.  Stop.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
v3 - actually requires patching Makefile

 ...akefile_armv7-fix-missing-separator-error.patch | 30 ++++++++++++++++++++++
 recipes-bsp/pa-lld/pa-lld.inc                      |  7 +++--
 recipes-bsp/pa-lld/pa-lld_git.bb                   |  2 +-
 3 files changed, 36 insertions(+), 3 deletions(-)
 create mode 100644 recipes-bsp/pa-lld/files/0001-makefile_armv7-fix-missing-separator-error.patch

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
 
-- 
2.2.0


