Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C2ECEE0048B
	for <meta-ti@yoctoproject.org>; Sat, 10 Aug 2013 13:57:14 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 60F8352A61; Sat, 10 Aug 2013 20:57:13 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130810205713.60F8352A61@arago-project.org>
Date: Sat, 10 Aug 2013 20:57:13 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : libdrm: restore libdrm-tests package that got missed with TI version
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
X-List-Received-Date: Sat, 10 Aug 2013 20:57:16 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: ed417f659a24499301eb8e40de06e281462f213a
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=ed417f659a24499301eb8e40de06e281462f213a

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Sat Aug 10 16:41:28 2013 -0400

libdrm: restore libdrm-tests package that got missed with TI version

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../drm/libdrm-2.4.41/installtests-ti.patch        |   46 ++++++++++++++++++++
 recipes-graphics/drm/libdrm_2.4.41.bb              |    8 +++-
 2 files changed, 53 insertions(+), 1 deletions(-)

diff --git a/recipes-graphics/drm/libdrm-2.4.41/installtests-ti.patch b/recipes-graphics/drm/libdrm-2.4.41/installtests-ti.patch
new file mode 100644
index 0000000..ba325c0
--- /dev/null
+++ b/recipes-graphics/drm/libdrm-2.4.41/installtests-ti.patch
@@ -0,0 +1,46 @@
+tests: also install tests app (adjusted for TI version)
+
+Upstream-Status: Inappropriate [configuration]
+
+Signed-off-by: Denys Dmytriyenko <denys@ti.com>
+
+diff -uNr git-orig/tests/Makefile.am git/tests/Makefile.am
+--- git-orig/tests/Makefile.am	2013-08-10 16:26:30.000000000 -0400
++++ git/tests/Makefile.am	2013-08-10 16:28:53.753855225 -0400
+@@ -6,10 +6,11 @@
+ 
+ LDADD = $(top_builddir)/libdrm.la
+ 
+-check_PROGRAMS = \
++bin_PROGRAMS = \
+ 	dristat \
+ 	drmstat
+ 
++check_PROGRAMS =
+ dristat_LDADD = $(CLOCK_LIB)
+ 
+ SUBDIRS = modeprint
+diff -uNr git-orig/tests/modeprint/Makefile.am git/tests/modeprint/Makefile.am
+--- git-orig/tests/modeprint/Makefile.am	2013-08-10 16:26:30.000000000 -0400
++++ git/tests/modeprint/Makefile.am	2013-08-10 16:28:53.753855225 -0400
+@@ -2,7 +2,7 @@
+ 	-I$(top_srcdir)/include/drm \
+ 	-I$(top_srcdir)
+ 
+-noinst_PROGRAMS = \
++bin_PROGRAMS = \
+ 	modeprint
+ 
+ modeprint_SOURCES = \
+diff -uNr git-orig/tests/modetest/Makefile.am git/tests/modetest/Makefile.am
+--- git-orig/tests/modetest/Makefile.am	2013-08-10 16:26:30.000000000 -0400
++++ git/tests/modetest/Makefile.am	2013-08-10 16:28:53.753855225 -0400
+@@ -3,7 +3,7 @@
+ 	-I$(top_srcdir)/libkms/ \
+ 	-I$(top_srcdir)
+ 
+-noinst_PROGRAMS = \
++bin_PROGRAMS = \
+ 	modetest
+ 
+ modetest_SOURCES = \
diff --git a/recipes-graphics/drm/libdrm_2.4.41.bb b/recipes-graphics/drm/libdrm_2.4.41.bb
index 1d89401..0150632 100644
--- a/recipes-graphics/drm/libdrm_2.4.41.bb
+++ b/recipes-graphics/drm/libdrm_2.4.41.bb
@@ -1,5 +1,7 @@
 require recipes-graphics/drm/libdrm.inc
 
+FILESEXTRAPATHS_append := ":${COREBASE}/meta/recipes-graphics/drm/libdrm"
+
 COMPATIBLE_MACHINE = "omap-a15"
 
 DEFAULT_PREFERENCE = "-1"
@@ -9,6 +11,10 @@ EXTRA_OECONF += "--enable-omap-experimental-api --enable-kms"
 SRC_URI = "git://git.ti.com/glsdk/libdrm.git;protocol=git"
 SRCREV = "3cb5405084111193cedb8796d259b56560b088f0"
 
-PR = "${INC_PR}.0"
+SRC_URI += "file://installtests-ti.patch \
+            file://GNU_SOURCE_definition.patch \
+           "
+
+PR = "${INC_PR}.1"
 
 S = "${WORKDIR}/git"


