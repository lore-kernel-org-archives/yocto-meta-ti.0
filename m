Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 53116E00A9B; Mon, 24 Apr 2017 15:20:57 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0D857E00867
	for <meta-ti@yoctoproject.org>; Mon, 24 Apr 2017 15:20:53 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E32B420B85;
	Mon, 24 Apr 2017 22:20:52 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id zKNvIKVNm3tr; Mon, 24 Apr 2017 22:20:52 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B8D9F2006A;
	Mon, 24 Apr 2017 22:20:50 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 4FCE5162473;
	Mon, 24 Apr 2017 18:20:50 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-ti@yoctoproject.org
Date: Mon, 24 Apr 2017 18:20:49 -0400
Message-Id: <1493072449-23172-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [morty/master][PATCH] boot-monitor: fix build issue caused by Makefile tabs forcing sparse use
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
X-List-Received-Date: Mon, 24 Apr 2017 22:20:57 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Cc: Dan Murphy <dmurphy@ti.com>
---
 recipes-bsp/boot-monitor/boot-monitor_git.bb       |  1 +
 ...-Fix-issue-with-setting-CHECK-and-VERBOSE.patch | 42 ++++++++++++++++++++++
 2 files changed, 43 insertions(+)
 create mode 100644 recipes-bsp/boot-monitor/files/0001-makedefs-Fix-issue-with-setting-CHECK-and-VERBOSE.patch

diff --git a/recipes-bsp/boot-monitor/boot-monitor_git.bb b/recipes-bsp/boot-monitor/boot-monitor_git.bb
index da53867..e4ea67f 100644
--- a/recipes-bsp/boot-monitor/boot-monitor_git.bb
+++ b/recipes-bsp/boot-monitor/boot-monitor_git.bb
@@ -8,6 +8,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 DEPENDS = "u-boot-mkimage-native"
 
 SRC_URI = "git://git.ti.com/processor-firmware/ks2-boot-monitor.git;protocol=git;branch=${BRANCH}"
+SRC_URI += "file://0001-makedefs-Fix-issue-with-setting-CHECK-and-VERBOSE.patch"
 
 PV = "4.0+git${SRCPV}"
 
diff --git a/recipes-bsp/boot-monitor/files/0001-makedefs-Fix-issue-with-setting-CHECK-and-VERBOSE.patch b/recipes-bsp/boot-monitor/files/0001-makedefs-Fix-issue-with-setting-CHECK-and-VERBOSE.patch
new file mode 100644
index 0000000..ae6d25c
--- /dev/null
+++ b/recipes-bsp/boot-monitor/files/0001-makedefs-Fix-issue-with-setting-CHECK-and-VERBOSE.patch
@@ -0,0 +1,42 @@
+From f22f18d426c8f5b70c0bce9ac6015c067c46f5ad Mon Sep 17 00:00:00 2001
+From: Dan Murphy <dmurphy@ti.com>
+Date: Mon, 24 Apr 2017 17:02:56 -0500
+Subject: [PATCH] makedefs: Fix issue with setting CHECK and VERBOSE
+
+Within the ifndef tabs are not allowed.  These need
+to be converted to spaces.  Without this CHECK is always
+set and sparse is expected to be installed.
+
+Fixes: aba308b9868d ("Makefile: Use OBJROOT for build output to enable out-of-tree builds")
+Reported-by: Denys Dmytriyenko <denys@ti.com>
+Signed-off-by: Dan Murphy <dmurphy@ti.com>
+Signed-off-by: Denys Dmytriyenko <denys@ti.com>
+---
+ makedefs | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/makedefs b/makedefs
+index 1c4e2a5..ab710c3 100644
+--- a/makedefs
++++ b/makedefs
+@@ -58,7 +58,7 @@ ifeq ("$(origin C)", "command line")
+ endif
+ 
+ ifndef VERBOSE
+-	export VERBOSE=0
++        export VERBOSE=0
+ endif
+ 
+ ifeq ($(VERBOSE),1)
+@@ -69,7 +69,7 @@ else
+ endif
+ 
+ ifndef CHECK
+-	export CHECK=0
++        export CHECK=0
+ endif
+ 
+ Q_CC=$(Q:@=@echo	'     CC	'$@;)$(CC)
+-- 
+2.7.4
+
-- 
2.7.4


