Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 24C2CE0097F; Wed, 19 Aug 2015 17:53:31 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00, RCVD_IN_DNSWL_NONE, 
	URIBL_BLACK autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [206.46.173.17 listed in list.dnswl.org]
	*  1.7 URIBL_BLACK Contains an URL listed in the URIBL blacklist
	*      [URIs: configure.ac]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EB935E00947
	for <meta-ti@yoctoproject.org>; Wed, 19 Aug 2015 17:53:26 -0700 (PDT)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173017.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NTC00GS1VSI41T0@vms173017.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Wed, 19 Aug 2015 19:53:07 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=MtGvkDue c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=uRRa74qj2VoA:10
	a=sozttTNsAAAA:8	a=U_ImoqNo-HHycG8sCloA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 4576A161B81;	Wed,
	19 Aug 2015 20:53:06 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Wed, 19 Aug 2015 20:53:05 -0400
Message-id: <1440031985-21625-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [master/fido][PATCH v2] ti-ipc: fix build when STAGING_KERNEL_DIR != STAGING_KERNEL_BUILDDIR
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
X-List-Received-Date: Thu, 20 Aug 2015 00:53:31 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
v2 - change new variable name to KERNEL_BUILD_DIR

 .../ipc/ti-ipc/0001-Add-kernel-build-dir.patch     | 114 +++++++++++++++++++++
 recipes-ti/ipc/ti-ipc_git.bb                       |   6 +-
 2 files changed, 118 insertions(+), 2 deletions(-)
 create mode 100644 recipes-ti/ipc/ti-ipc/0001-Add-kernel-build-dir.patch

diff --git a/recipes-ti/ipc/ti-ipc/0001-Add-kernel-build-dir.patch b/recipes-ti/ipc/ti-ipc/0001-Add-kernel-build-dir.patch
new file mode 100644
index 0000000..20d0e0f
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
index 5f0b8db..9aa3b48 100644
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
 
-- 
2.2.0


