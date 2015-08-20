Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 93741E0096A; Wed, 19 Aug 2015 17:55:53 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=BAYES_00,RDNS_DYNAMIC,
	URIBL_BLACK autolearn=no version=3.3.1
X-Spam-HAM-Report: * 1.7 URIBL_BLACK Contains an URL listed in the URIBL
	blacklist *      [URIs: configure.ac]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  1.0 RDNS_DYNAMIC Delivered to internal network by host with
	*      dynamic-looking rDNS
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B37A9E00985
	for <meta-ti@yoctoproject.org>; Wed, 19 Aug 2015 17:55:48 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 8D5FB52A14; Thu, 20 Aug 2015 00:55:47 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150820005547.8D5FB52A14@arago-project.org>
Date: Thu, 20 Aug 2015 00:55:47 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : ti-ipc: fix build when STAGING_KERNEL_DIR != STAGING_KERNEL_BUILDDIR
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
X-List-Received-Date: Thu, 20 Aug 2015 00:55:53 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: 25660ccc23acd07c7bec8189b5abe91deeaf5ce9
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=25660ccc23acd07c7bec8189b5abe91deeaf5ce9

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Thu Aug 20 06:53:05 2015 +0000

ti-ipc: fix build when STAGING_KERNEL_DIR != STAGING_KERNEL_BUILDDIR

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../ipc/ti-ipc/0001-Add-kernel-build-dir.patch     |  114 ++++++++++++++++++++
 recipes-ti/ipc/ti-ipc_git.bb                       |    6 +-
 2 files changed, 118 insertions(+), 2 deletions(-)

diff --git a/recipes-ti/ipc/ti-ipc/0001-Add-kernel-build-dir.patch b/recipes-ti/ipc/ti-ipc/0001-Add-kernel-build-dir.patch
new file mode 100644
index 0000000..cfa1b3b
--- /dev/null
+++ b/recipes-ti/ipc/ti-ipc/0001-Add-kernel-build-dir.patch
@@ -0,0 +1,114 @@
+From f1e89940a3fbc0ffec51640f909f87419c08a17e Mon Sep 17 00:00:00 2001
+From: Denys Dmytriyenko <denys@ti.com>
+Date: Mon, 27 Jul 2015 11:51:52 -0400
+Subject: [PATCH] Add kernel build dir
+
+We build kernel outside of the source directory and the generated version.h
+file ends up being in a separate directory from the rest of kernel headers.
+Use another variable to point to the kernel build artifacts.
+
+Signed-off-by: Denys Dmytriyenko <denys@ti.com>
+---
+ configure.ac               | 6 ++++++
+ ipc-linux.mak              | 3 +++
+ linux/src/mm/Makefile.am   | 2 +-
+ packages/ti/ipc/mm/MmRpc.c | 4 ++++
+ 4 files changed, 14 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index e6cb19f..22f7db2 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -70,6 +70,7 @@ AC_SUBST([AM_LDFLAGS])
+ AC_ARG_VAR(PLATFORM, Platform to build. Options are: 'OMAPL138' 'OMAP54XX' '66AK2E' 'TCI6630' 'TCI6636' 'TCI6638' and 'DRA7XX'. If not defined all platforms will be built.)
+ AC_ARG_VAR(CMEM_INSTALL_DIR, Installation path directory to the CMEM libraries)
+ AC_ARG_VAR(KERNEL_INSTALL_DIR, Installation path to the Linux kernel.)
++AC_ARG_VAR(KERNEL_BUILD_DIR, Path to the Linux kernel build artifacts.)
+ AC_ARG_VAR(AF_RPMSG, Address Family used by the RPMSG driver)
+ AC_ARG_VAR(DRM_PREFIX, Installation location to the DRM library.)
+ 
+@@ -108,6 +109,7 @@ AS_IF([test "x$PLATFORM" = "x"], [CMEM_INSTALL_DIR=])
+ AC_SUBST([PLATFORM])
+ AC_SUBST([CMEM_INSTALL_DIR])
+ AC_SUBST([KERNEL_INSTALL_DIR])
++AC_SUBST([KERNEL_BUILD_DIR])
+ AC_SUBST([AF_RPMSG])
+ AC_SUBST([DRM_PREFIX])
+ 
+@@ -123,6 +125,7 @@ AM_CONDITIONAL([DRA7XX], [test "x$PLATFORM" = "xDRA7XX"])
+ AM_CONDITIONAL([CMEM], [test "x$CMEM_INSTALL_DIR" != "x"])
+ AM_CONDITIONAL([KDIR], [test "x$KERNEL_INSTALL_DIR" != "x"])
+ AM_CONDITIONAL([KERNEL_INSTALL_DIR], [test -n "$KERNEL_INSTALL_DIR"])
++AM_CONDITIONAL([KERNEL_BUILD_DIR], [test -n "$KERNEL_BUILD_DIR"])
+ AM_CONDITIONAL([DRM], [test "x$DRM_PREFIX" != "x"])
+ AM_CONDITIONAL([AF_RPMSG], [test -n "$AF_RPMSG"])
+ 
+@@ -153,6 +156,9 @@ You have configured to build for the '${PLATFORM}' platform
+ Your KERNEL installation directory is set to:
+     '${KERNEL_INSTALL_DIR}'
+ 
++Your KERNEL build artifacts directory is set to:
++    '${KERNEL_BUILD_DIR}'
++
+ Your DRM installation directory is set to:
+     '${DRM_PREFIX}'
+ 
+diff --git a/ipc-linux.mak b/ipc-linux.mak
+index 58a9cea..a174a9c 100644
+--- a/ipc-linux.mak
++++ b/ipc-linux.mak
+@@ -60,6 +60,7 @@ config:
+             PLATFORM=$(PLATFORM) \
+             CMEM_INSTALL_DIR=$(CMEM_INSTALL_DIR) \
+             KERNEL_INSTALL_DIR=$(KERNEL_INSTALL_DIR) \
++            KERNEL_BUILD_DIR=$(KERNEL_BUILD_DIR) \
+             DRM_PREFIX=$(DRM_PREFIX) \
+             AF_RPMSG=$(AF_RPMSG)
+ 
+@@ -72,6 +73,7 @@ config-static:
+             PLATFORM=$(PLATFORM) \
+             CMEM_INSTALL_DIR=$(CMEM_INSTALL_DIR) \
+             KERNEL_INSTALL_DIR=$(KERNEL_INSTALL_DIR) \
++            KERNEL_BUILD_DIR=$(KERNEL_BUILD_DIR) \
+             DRM_PREFIX=$(DRM_PREFIX) \
+             AF_RPMSG=$(AF_RPMSG)
+ 
+@@ -84,5 +86,6 @@ config-shared:
+             PLATFORM=$(PLATFORM) \
+             CMEM_INSTALL_DIR=$(CMEM_INSTALL_DIR) \
+             KERNEL_INSTALL_DIR=$(KERNEL_INSTALL_DIR) \
++            KERNEL_BUILD_DIR=$(KERNEL_BUILD_DIR) \
+             DRM_PREFIX=$(DRM_PREFIX) \
+             AF_RPMSG=$(AF_RPMSG)
+diff --git a/linux/src/mm/Makefile.am b/linux/src/mm/Makefile.am
+index 59aa312..436b432 100644
+--- a/linux/src/mm/Makefile.am
++++ b/linux/src/mm/Makefile.am
+@@ -32,7 +32,7 @@
+ ##
+ 
+ # additional include paths necessary to compile the library
+-AM_CFLAGS = -Wall @AM_CFLAGS@ -DKERNEL_INSTALL_DIR="$(KERNEL_INSTALL_DIR)"
++AM_CFLAGS = -Wall @AM_CFLAGS@ -DKERNEL_INSTALL_DIR="$(KERNEL_INSTALL_DIR)" -DKERNEL_BUILD_DIR="$(KERNEL_BUILD_DIR)"
+ 
+ ###############################################################################
+ # THE LIBRARIES TO BUILD
+diff --git a/packages/ti/ipc/mm/MmRpc.c b/packages/ti/ipc/mm/MmRpc.c
+index 09d6b05..78adfa8 100644
+--- a/packages/ti/ipc/mm/MmRpc.c
++++ b/packages/ti/ipc/mm/MmRpc.c
+@@ -56,7 +56,11 @@
+ #endif
+ 
+ #define linux_version_include(kd) <kd/include/generated/uapi/linux/version.h>
++#if defined(KERNEL_BUILD_DIR)
++#include linux_version_include(KERNEL_BUILD_DIR)
++#else
+ #include linux_version_include(KERNEL_INSTALL_DIR)
++#endif
+ 
+ #if LINUX_VERSION_CODE < KERNEL_VERSION(3,14,0)
+ #define linux_include(kd,m) <kd/include/linux/m.h>
+-- 
+2.2.0
+
diff --git a/recipes-ti/ipc/ti-ipc_git.bb b/recipes-ti/ipc/ti-ipc_git.bb
index 5f0b8db..065d2c6 100644
--- a/recipes-ti/ipc/ti-ipc_git.bb
+++ b/recipes-ti/ipc/ti-ipc_git.bb
@@ -11,6 +11,7 @@ PV = "3.36.01.11"
 BRANCH = "3.36"
 SRC_URI = "git://git.ti.com/ipc/ipcdev.git;protocol=git;branch=${BRANCH} \
            file://tiipclad-daemon.sh \
+           file://0001-Add-kernel-build-dir.patch \
            "
 # Commit corresponds to 3.36.01.11
 SRCREV = "2a4256289d462d93a7e00a6ffb10bd46081a9500"
@@ -33,14 +34,15 @@ DAEMON_k2hk-evm = "lad_tci6638"
 DAEMON_k2l-evm = "lad_tci6630"
 DAEMON_k2e-evm = "lad_66ak2e"
 
-inherit autotools pkgconfig update-rc.d
+inherit autotools-brokensep pkgconfig update-rc.d
 
 INITSCRIPT_NAME = "tiipclad-daemon.sh"
 INITSCRIPT_PARAMS = "defaults 10"
 
-EXTRA_OECONF += "PLATFORM=${PLATFORM} KERNEL_INSTALL_DIR=${STAGING_KERNEL_DIR}"
+EXTRA_OECONF += "PLATFORM=${PLATFORM} KERNEL_INSTALL_DIR=${STAGING_KERNEL_DIR} KERNEL_BUILD_DIR=${STAGING_KERNEL_BUILDDIR}"
 
 do_configure() {
+    ( cd ${S}; autoreconf -f -i -s )
     oe_runconf
 }
 


