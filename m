Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9030EE00EF2; Wed, 20 Apr 2016 13:50:47 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 193DEE00E8B
	for <meta-ti@yoctoproject.org>; Wed, 20 Apr 2016 13:50:43 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 8879552A81; Wed, 20 Apr 2016 20:50:42 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160420205042.8879552A81@arago-project.org>
Date: Wed, 20 Apr 2016 20:50:42 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : libdrm: drop outdated custom version, use latest upstream now
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
X-List-Received-Date: Wed, 20 Apr 2016 20:50:47 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: d82a408e1fddafcdf98d40cb10ba02fd1f52693b
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=d82a408e1fddafcdf98d40cb10ba02fd1f52693b

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Thu Apr 21 00:32:27 2016 +0000

libdrm: drop outdated custom version, use latest upstream now

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../drm/libdrm-2.4.41/installtests-ti.patch        |   46 --------------------
 recipes-graphics/drm/libdrm.inc                    |   41 -----------------
 recipes-graphics/drm/libdrm_2.4.41.bb              |   19 --------
 3 files changed, 0 insertions(+), 106 deletions(-)

diff --git a/recipes-graphics/drm/libdrm-2.4.41/installtests-ti.patch b/recipes-graphics/drm/libdrm-2.4.41/installtests-ti.patch
deleted file mode 100644
index ba325c0..0000000
--- a/recipes-graphics/drm/libdrm-2.4.41/installtests-ti.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-tests: also install tests app (adjusted for TI version)
-
-Upstream-Status: Inappropriate [configuration]
-
-Signed-off-by: Denys Dmytriyenko <denys@ti.com>
-
-diff -uNr git-orig/tests/Makefile.am git/tests/Makefile.am
---- git-orig/tests/Makefile.am	2013-08-10 16:26:30.000000000 -0400
-+++ git/tests/Makefile.am	2013-08-10 16:28:53.753855225 -0400
-@@ -6,10 +6,11 @@
- 
- LDADD = $(top_builddir)/libdrm.la
- 
--check_PROGRAMS = \
-+bin_PROGRAMS = \
- 	dristat \
- 	drmstat
- 
-+check_PROGRAMS =
- dristat_LDADD = $(CLOCK_LIB)
- 
- SUBDIRS = modeprint
-diff -uNr git-orig/tests/modeprint/Makefile.am git/tests/modeprint/Makefile.am
---- git-orig/tests/modeprint/Makefile.am	2013-08-10 16:26:30.000000000 -0400
-+++ git/tests/modeprint/Makefile.am	2013-08-10 16:28:53.753855225 -0400
-@@ -2,7 +2,7 @@
- 	-I$(top_srcdir)/include/drm \
- 	-I$(top_srcdir)
- 
--noinst_PROGRAMS = \
-+bin_PROGRAMS = \
- 	modeprint
- 
- modeprint_SOURCES = \
-diff -uNr git-orig/tests/modetest/Makefile.am git/tests/modetest/Makefile.am
---- git-orig/tests/modetest/Makefile.am	2013-08-10 16:26:30.000000000 -0400
-+++ git/tests/modetest/Makefile.am	2013-08-10 16:28:53.753855225 -0400
-@@ -3,7 +3,7 @@
- 	-I$(top_srcdir)/libkms/ \
- 	-I$(top_srcdir)
- 
--noinst_PROGRAMS = \
-+bin_PROGRAMS = \
- 	modetest
- 
- modetest_SOURCES = \
diff --git a/recipes-graphics/drm/libdrm.inc b/recipes-graphics/drm/libdrm.inc
deleted file mode 100644
index d3e1e92..0000000
--- a/recipes-graphics/drm/libdrm.inc
+++ /dev/null
@@ -1,41 +0,0 @@
-SUMMARY = "Userspace interface to the kernel DRM services"
-DESCRIPTION = "The runtime library for accessing the kernel DRM services.  DRM \
-stands for \"Direct Rendering Manager\", which is the kernel portion of the \
-\"Direct Rendering Infrastructure\" (DRI).  DRI is required for many hardware \
-accelerated OpenGL drivers."
-HOMEPAGE = "http://dri.freedesktop.org"
-SECTION = "x11/base"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://xf86drm.c;beginline=9;endline=32;md5=c8a3b961af7667c530816761e949dc71"
-SRC_URI = "http://dri.freedesktop.org/libdrm/libdrm-${PV}.tar.bz2"
-PROVIDES = "drm"
-DEPENDS = "libpthread-stubs udev"
-
-# be aware that libdrm_2.4.44.bb ignores this
-INC_PR = "r4"
-
-#libpciaccess is required starting from libdrm 2.4.26
-DEPENDS += " libpciaccess"
-
-inherit autotools pkgconfig
-
-EXTRA_OECONF += "--disable-cairo-tests \
-                 --enable-omap-experimental-api \
-                 --enable-install-test-programs \
-                 --disable-manpages \
-                "
-ALLOW_EMPTY_${PN}-drivers = "1"
-PACKAGES =+ "${PN}-tests ${PN}-drivers ${PN}-radeon ${PN}-nouveau ${PN}-omap \
-             ${PN}-intel ${PN}-exynos ${PN}-kms ${PN}-freedreno"
-
-RRECOMMENDS_${PN}-drivers = "${PN}-radeon ${PN}-nouveau ${PN}-omap ${PN}-intel \
-                             ${PN}-exynos ${PN}-freedreno"
-
-FILES_${PN}-tests = "${bindir}/dr* ${bindir}/mode* ${bindir}/*test"
-FILES_${PN}-radeon = "${libdir}/libdrm_radeon.so.*"
-FILES_${PN}-nouveau = "${libdir}/libdrm_nouveau.so.*"
-FILES_${PN}-omap = "${libdir}/libdrm_omap.so.*"
-FILES_${PN}-intel = "${libdir}/libdrm_intel.so.*"
-FILES_${PN}-exynos = "${libdir}/libdrm_exynos.so.*"
-FILES_${PN}-kms = "${libdir}/libkms*.so.*"
-FILES_${PN}-freedreno = "${libdir}/libdrm_freedreno.so.*"
diff --git a/recipes-graphics/drm/libdrm_2.4.41.bb b/recipes-graphics/drm/libdrm_2.4.41.bb
deleted file mode 100644
index 86a660e..0000000
--- a/recipes-graphics/drm/libdrm_2.4.41.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-require recipes-graphics/drm/libdrm.inc
-
-FILESEXTRAPATHS_append := ":${COREBASE}/meta/recipes-graphics/drm/libdrm"
-
-COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15"
-
-DEFAULT_PREFERENCE = "-1"
-
-EXTRA_OECONF += "--enable-omap-experimental-api --enable-kms"
-
-SRC_URI = "git://git.ti.com/glsdk/libdrm.git;protocol=git"
-SRCREV = "3cb5405084111193cedb8796d259b56560b088f0"
-
-SRC_URI += "file://installtests-ti.patch \
-           "
-
-PR = "${INC_PR}.2"
-
-S = "${WORKDIR}/git"


