Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1CB37E00D77; Thu, 17 Oct 2019 18:13:50 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at https://www.dnswl.org/,
	low *      trust
	*      [64.68.198.64 listed in list.dnswl.org]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BF164E00D5F
	for <meta-ti@yoctoproject.org>; Thu, 17 Oct 2019 18:13:45 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 02B9740BEC;
	Fri, 18 Oct 2019 01:13:45 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id pnKEWhWeC3sl; Fri, 18 Oct 2019 01:13:44 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 989F940BE5;
	Fri, 18 Oct 2019 01:13:43 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id D0B9817429C;
	Thu, 17 Oct 2019 21:13:42 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-ti@yoctoproject.org
Date: Thu, 17 Oct 2019 21:13:42 -0400
Message-Id: <1571361222-36904-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [master][PATCH] ti-ipc: update 0001-Add-kernel-build-dir.patch
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
X-List-Received-Date: Fri, 18 Oct 2019 01:13:50 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-ti/ipc/ti-ipc/0001-Add-kernel-build-dir.patch | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/recipes-ti/ipc/ti-ipc/0001-Add-kernel-build-dir.patch b/recipes-ti/ipc/ti-ipc/0001-Add-kernel-build-dir.patch
index e612ddc..71d5b2b 100644
--- a/recipes-ti/ipc/ti-ipc/0001-Add-kernel-build-dir.patch
+++ b/recipes-ti/ipc/ti-ipc/0001-Add-kernel-build-dir.patch
@@ -1,4 +1,4 @@
-From 7d9f57983c6d14ac14f26987eddc555ea5c75d61 Mon Sep 17 00:00:00 2001
+From c3ada6bf49e6fcf7bc49e5bf09754f384838ca6a Mon Sep 17 00:00:00 2001
 From: Denys Dmytriyenko <denys@ti.com>
 Date: Mon, 27 Jul 2015 11:51:52 -0400
 Subject: [PATCH] Add kernel build dir
@@ -17,18 +17,18 @@ Signed-off-by: Denys Dmytriyenko <denys@ti.com>
  4 files changed, 14 insertions(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index f0b4b61..9b5d07c 100644
+index 4d4a559..84ac78b 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -71,6 +71,7 @@ AC_SUBST([AM_LDFLAGS])
- AC_ARG_VAR(PLATFORM, Platform to build. Options are: 'OMAPL138' 'OMAP54XX' '66AK2E' 'TCI6630' 'TCI6636' 'TCI6638' '66AK2G' and 'DRA7XX'. If not defined all platforms will be built.)
+ AC_ARG_VAR(PLATFORM, Platform to build. Options are: 'OMAPL138' 'OMAP54XX' '66AK2E' 'TCI6630' 'TCI6636' 'TCI6638' '66AK2G' 'DRA7XX' and 'AM65XX'. If not defined all platforms will be built.)
  AC_ARG_VAR(CMEM_INSTALL_DIR, Installation path directory to the CMEM libraries)
  AC_ARG_VAR(KERNEL_INSTALL_DIR, Installation path to the Linux kernel.)
 +AC_ARG_VAR(KERNEL_BUILD_DIR, Path to the Linux kernel build artifacts.)
  AC_ARG_VAR(AF_RPMSG, Address Family used by the RPMSG driver)
  AC_ARG_VAR(DRM_PREFIX, Installation location to the DRM library.)
  
-@@ -111,6 +112,7 @@ AS_IF([test "x$PLATFORM" = "x"], [CMEM_INSTALL_DIR=])
+@@ -113,6 +114,7 @@ AS_IF([test "x$PLATFORM" = "x"], [CMEM_INSTALL_DIR=])
  AC_SUBST([PLATFORM])
  AC_SUBST([CMEM_INSTALL_DIR])
  AC_SUBST([KERNEL_INSTALL_DIR])
@@ -36,7 +36,7 @@ index f0b4b61..9b5d07c 100644
  AC_SUBST([AF_RPMSG])
  AC_SUBST([DRM_PREFIX])
  
-@@ -127,6 +129,7 @@ AM_CONDITIONAL([DRA7XX], [test "x$PLATFORM" = "xDRA7XX"])
+@@ -130,6 +132,7 @@ AM_CONDITIONAL([AM65XX], [test "x$PLATFORM" = "xAM65XX"])
  AM_CONDITIONAL([CMEM], [test "x$CMEM_INSTALL_DIR" != "x"])
  AM_CONDITIONAL([KDIR], [test "x$KERNEL_INSTALL_DIR" != "x"])
  AM_CONDITIONAL([KERNEL_INSTALL_DIR], [test -n "$KERNEL_INSTALL_DIR"])
@@ -44,7 +44,7 @@ index f0b4b61..9b5d07c 100644
  AM_CONDITIONAL([DRM], [test "x$DRM_PREFIX" != "x"])
  AM_CONDITIONAL([AF_RPMSG], [test -n "$AF_RPMSG"])
  
-@@ -157,6 +160,9 @@ You have configured to build for the '${PLATFORM}' platform
+@@ -160,6 +163,9 @@ You have configured to build for the '${PLATFORM}' platform
  Your KERNEL installation directory is set to:
      '${KERNEL_INSTALL_DIR}'
  
-- 
2.7.4


