Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4D7CFE009DB; Wed,  4 Apr 2018 13:35:45 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 95C52E006B4
	for <meta-ti@yoctoproject.org>; Wed,  4 Apr 2018 13:35:42 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id A360120B22;
	Wed,  4 Apr 2018 20:35:41 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id l2AdENy9kakS; Wed,  4 Apr 2018 20:35:41 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 83AD020866;
	Wed,  4 Apr 2018 20:35:40 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 08B341633B6;
	Wed,  4 Apr 2018 16:35:40 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-ti@yoctoproject.org
Date: Wed,  4 Apr 2018 16:35:39 -0400
Message-Id: <1522874139-29690-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [master][PATCH] ti-ipc: refresh local patch to avoid fuzz warnings
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
X-List-Received-Date: Wed, 04 Apr 2018 20:35:45 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../ipc/ti-ipc/0001-Add-kernel-build-dir.patch     | 24 ++++++++++------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/recipes-ti/ipc/ti-ipc/0001-Add-kernel-build-dir.patch b/recipes-ti/ipc/ti-ipc/0001-Add-kernel-build-dir.patch
index cfa1b3b..e612ddc 100644
--- a/recipes-ti/ipc/ti-ipc/0001-Add-kernel-build-dir.patch
+++ b/recipes-ti/ipc/ti-ipc/0001-Add-kernel-build-dir.patch
@@ -1,4 +1,4 @@
-From f1e89940a3fbc0ffec51640f909f87419c08a17e Mon Sep 17 00:00:00 2001
+From 7d9f57983c6d14ac14f26987eddc555ea5c75d61 Mon Sep 17 00:00:00 2001
 From: Denys Dmytriyenko <denys@ti.com>
 Date: Mon, 27 Jul 2015 11:51:52 -0400
 Subject: [PATCH] Add kernel build dir
@@ -8,6 +8,7 @@ file ends up being in a separate directory from the rest of kernel headers.
 Use another variable to point to the kernel build artifacts.
 
 Signed-off-by: Denys Dmytriyenko <denys@ti.com>
+
 ---
  configure.ac               | 6 ++++++
  ipc-linux.mak              | 3 +++
@@ -16,18 +17,18 @@ Signed-off-by: Denys Dmytriyenko <denys@ti.com>
  4 files changed, 14 insertions(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index e6cb19f..22f7db2 100644
+index f0b4b61..9b5d07c 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -70,6 +70,7 @@ AC_SUBST([AM_LDFLAGS])
- AC_ARG_VAR(PLATFORM, Platform to build. Options are: 'OMAPL138' 'OMAP54XX' '66AK2E' 'TCI6630' 'TCI6636' 'TCI6638' and 'DRA7XX'. If not defined all platforms will be built.)
+@@ -71,6 +71,7 @@ AC_SUBST([AM_LDFLAGS])
+ AC_ARG_VAR(PLATFORM, Platform to build. Options are: 'OMAPL138' 'OMAP54XX' '66AK2E' 'TCI6630' 'TCI6636' 'TCI6638' '66AK2G' and 'DRA7XX'. If not defined all platforms will be built.)
  AC_ARG_VAR(CMEM_INSTALL_DIR, Installation path directory to the CMEM libraries)
  AC_ARG_VAR(KERNEL_INSTALL_DIR, Installation path to the Linux kernel.)
 +AC_ARG_VAR(KERNEL_BUILD_DIR, Path to the Linux kernel build artifacts.)
  AC_ARG_VAR(AF_RPMSG, Address Family used by the RPMSG driver)
  AC_ARG_VAR(DRM_PREFIX, Installation location to the DRM library.)
  
-@@ -108,6 +109,7 @@ AS_IF([test "x$PLATFORM" = "x"], [CMEM_INSTALL_DIR=])
+@@ -111,6 +112,7 @@ AS_IF([test "x$PLATFORM" = "x"], [CMEM_INSTALL_DIR=])
  AC_SUBST([PLATFORM])
  AC_SUBST([CMEM_INSTALL_DIR])
  AC_SUBST([KERNEL_INSTALL_DIR])
@@ -35,7 +36,7 @@ index e6cb19f..22f7db2 100644
  AC_SUBST([AF_RPMSG])
  AC_SUBST([DRM_PREFIX])
  
-@@ -123,6 +125,7 @@ AM_CONDITIONAL([DRA7XX], [test "x$PLATFORM" = "xDRA7XX"])
+@@ -127,6 +129,7 @@ AM_CONDITIONAL([DRA7XX], [test "x$PLATFORM" = "xDRA7XX"])
  AM_CONDITIONAL([CMEM], [test "x$CMEM_INSTALL_DIR" != "x"])
  AM_CONDITIONAL([KDIR], [test "x$KERNEL_INSTALL_DIR" != "x"])
  AM_CONDITIONAL([KERNEL_INSTALL_DIR], [test -n "$KERNEL_INSTALL_DIR"])
@@ -43,7 +44,7 @@ index e6cb19f..22f7db2 100644
  AM_CONDITIONAL([DRM], [test "x$DRM_PREFIX" != "x"])
  AM_CONDITIONAL([AF_RPMSG], [test -n "$AF_RPMSG"])
  
-@@ -153,6 +156,9 @@ You have configured to build for the '${PLATFORM}' platform
+@@ -157,6 +160,9 @@ You have configured to build for the '${PLATFORM}' platform
  Your KERNEL installation directory is set to:
      '${KERNEL_INSTALL_DIR}'
  
@@ -54,7 +55,7 @@ index e6cb19f..22f7db2 100644
      '${DRM_PREFIX}'
  
 diff --git a/ipc-linux.mak b/ipc-linux.mak
-index 58a9cea..a174a9c 100644
+index 58a9cea..4e543ff 100644
 --- a/ipc-linux.mak
 +++ b/ipc-linux.mak
 @@ -60,6 +60,7 @@ config:
@@ -81,7 +82,7 @@ index 58a9cea..a174a9c 100644
              DRM_PREFIX=$(DRM_PREFIX) \
              AF_RPMSG=$(AF_RPMSG)
 diff --git a/linux/src/mm/Makefile.am b/linux/src/mm/Makefile.am
-index 59aa312..436b432 100644
+index 59aa312..8fb51a3 100644
 --- a/linux/src/mm/Makefile.am
 +++ b/linux/src/mm/Makefile.am
 @@ -32,7 +32,7 @@
@@ -94,7 +95,7 @@ index 59aa312..436b432 100644
  ###############################################################################
  # THE LIBRARIES TO BUILD
 diff --git a/packages/ti/ipc/mm/MmRpc.c b/packages/ti/ipc/mm/MmRpc.c
-index 09d6b05..78adfa8 100644
+index 2df7420..797e100 100644
 --- a/packages/ti/ipc/mm/MmRpc.c
 +++ b/packages/ti/ipc/mm/MmRpc.c
 @@ -56,7 +56,11 @@
@@ -109,6 +110,3 @@ index 09d6b05..78adfa8 100644
  
  #if LINUX_VERSION_CODE < KERNEL_VERSION(3,14,0)
  #define linux_include(kd,m) <kd/include/linux/m.h>
--- 
-2.2.0
-
-- 
2.7.4


