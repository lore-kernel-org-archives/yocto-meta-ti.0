Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 31A96E0030B
	for <meta-ti@yoctoproject.org>; Mon, 21 May 2012 13:45:30 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 570105299F; Mon, 21 May 2012 20:45:30 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120521204530.570105299F@arago-project.org>
Date: Mon, 21 May 2012 20:45:30 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Roger Monk : omapfbplay: import from OE classic + api tweak
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Mon, 21 May 2012 20:45:31 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: a9eca3f6f9258cba5f30b9e9bbb0e31bc5da0d77
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=a9eca3f6f9258cba5f30b9e9bbb0e31bc5da0d77

Author: Roger Monk <r-monk@ti.com>
Date:   Thu May 10 15:18:27 2012 +0100

omapfbplay: import from OE classic + api tweak

Signed-off-by: Roger Monk <r-monk@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 ...switch-CODEC_TYPE_VIDEO-to-AVMEDIA_TYPE_V.patch |   26 +++++++++++++++
 .../files/omapfbplay-errorhandling.patch           |   34 ++++++++++++++++++++
 recipes-graphics/omapfbplay/omapfbplay-cmem_git.bb |   16 +++++++++
 recipes-graphics/omapfbplay/omapfbplay-dce_git.bb  |    7 ++++
 recipes-graphics/omapfbplay/omapfbplay-xv_git.bb   |    3 ++
 recipes-graphics/omapfbplay/omapfbplay.inc         |   33 +++++++++++++++++++
 recipes-graphics/omapfbplay/omapfbplay_git.bb      |    3 ++
 7 files changed, 122 insertions(+), 0 deletions(-)

diff --git a/recipes-graphics/omapfbplay/files/0001-omapfbplay-switch-CODEC_TYPE_VIDEO-to-AVMEDIA_TYPE_V.patch b/recipes-graphics/omapfbplay/files/0001-omapfbplay-switch-CODEC_TYPE_VIDEO-to-AVMEDIA_TYPE_V.patch
new file mode 100644
index 0000000..e01fddb
--- /dev/null
+++ b/recipes-graphics/omapfbplay/files/0001-omapfbplay-switch-CODEC_TYPE_VIDEO-to-AVMEDIA_TYPE_V.patch
@@ -0,0 +1,26 @@
+From 71670f4a067efc169018a9ec9321ccc9af3bbd59 Mon Sep 17 00:00:00 2001
+From: Roger Monk <r-monk@ti.com>
+Date: Thu, 10 May 2012 14:50:11 +0100
+Subject: [PATCH] omapfbplay:  switch CODEC_TYPE_VIDEO to AVMEDIA_TYPE_VIDEO
+
+Signed-off-by: Roger Monk <r-monk@ti.com>
+---
+ omapfbplay.c |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/omapfbplay.c b/omapfbplay.c
+index ad35bd5..818cf2c 100644
+--- a/omapfbplay.c
++++ b/omapfbplay.c
+@@ -74,7 +74,7 @@ find_stream(AVFormatContext *afc)
+     int i;
+ 
+     for (i = 0; i < afc->nb_streams; i++) {
+-        if (afc->streams[i]->codec->codec_type == CODEC_TYPE_VIDEO && !st)
++        if (afc->streams[i]->codec->codec_type == AVMEDIA_TYPE_VIDEO && !st)
+             st = afc->streams[i];
+         else
+             afc->streams[i]->discard = AVDISCARD_ALL;
+-- 
+1.7.0.4
+
diff --git a/recipes-graphics/omapfbplay/files/omapfbplay-errorhandling.patch b/recipes-graphics/omapfbplay/files/omapfbplay-errorhandling.patch
new file mode 100644
index 0000000..7dd544f
--- /dev/null
+++ b/recipes-graphics/omapfbplay/files/omapfbplay-errorhandling.patch
@@ -0,0 +1,34 @@
+From e321ae7df57ada9ecc8c155fa4e5511c96ef5db3 Mon Sep 17 00:00:00 2001
+From: Rob Clark <rob@ti.com>
+Date: Fri, 18 Mar 2011 12:40:51 -0500
+Subject: [PATCH] dce: differentiate between fatal and non-fatal errors
+
+For streams with errors, the codec will throw back an error. But not
+all errors are fatal.
+---
+ dce.c |   10 ++++++++--
+ 1 files changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/dce.c b/dce.c
+index ab7ad0a..88f175e 100644
+--- a/dce.c
++++ b/dce.c
+@@ -270,8 +270,14 @@ static int dce_decode(AVPacket *p)
+ 
+     err = VIDDEC3_process(codec, inbufs, outbufs, in_args, out_args);
+     if (err) {
+-        fprintf(stderr, "VIDDEC3_process() error %d\n", err);
+-        return -1;
++        fprintf(stderr, "VIDDEC3_process() error %d %08x\n", err,
++                    out_args->extendedError);
++        /* for non-fatal errors, keep going.. a non-fatal error could
++         * just indicate an error in the input stream which the codec
++         * was able to conceal
++         */
++        if (XDM_ISFATALERROR(out_args->extendedError))
++            return -1;
+     }
+ 
+     for (i = 0; i < out_args->outputID[i]; i++) {
+-- 
+1.7.1
diff --git a/recipes-graphics/omapfbplay/omapfbplay-cmem_git.bb b/recipes-graphics/omapfbplay/omapfbplay-cmem_git.bb
new file mode 100644
index 0000000..a0392f6
--- /dev/null
+++ b/recipes-graphics/omapfbplay/omapfbplay-cmem_git.bb
@@ -0,0 +1,16 @@
+require omapfbplay.inc
+
+DEPENDS += "ti-linuxutils"
+
+require recipes-ti/includes/ti-paths.inc
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+SDMA_CFLAGS = " -I${LINUXUTILS_INSTALL_DIR}/packages/ti/sdo/linuxutils/sdma/include/"
+CMEM_CFLAGS = " -I${LINUXUTILS_INSTALL_DIR}/packages/ti/sdo/linuxutils/cmem/include/"
+CFLAGS += " -I. -I${STAGING_KERNEL_DIR}/include ${SDMA_CFLAGS} ${CMEM_CFLAGS}"
+
+export SDMA_LIBS = "-L${LINUXUTILS_INSTALL_DIR}/packages/ti/sdo/linuxutils/sdma/lib -l:sdma.a470MV"
+export CMEM_LIBS = "-L${LINUXUTILS_INSTALL_DIR}/packages/ti/sdo/linuxutils/cmem/lib -l:cmem.a470MV"
+
+OMAPFBPLAYOPTS = "V4L2=y OMAPFB=y NETSYNC=y CMEM=y SDMA=y"
diff --git a/recipes-graphics/omapfbplay/omapfbplay-dce_git.bb b/recipes-graphics/omapfbplay/omapfbplay-dce_git.bb
new file mode 100644
index 0000000..e70ac72
--- /dev/null
+++ b/recipes-graphics/omapfbplay/omapfbplay-dce_git.bb
@@ -0,0 +1,7 @@
+require omapfbplay.inc
+
+DEPENDS += "libdce"
+
+CFLAGS += " -I. -I${STAGING_INCDIR}/dce -I${STAGING_KERNEL_DIR}/include "
+
+OMAPFBPLAYOPTS = "V4L2=y OMAPFB=y NETSYNC=y DCE=y"
diff --git a/recipes-graphics/omapfbplay/omapfbplay-xv_git.bb b/recipes-graphics/omapfbplay/omapfbplay-xv_git.bb
new file mode 100644
index 0000000..cadf6d8
--- /dev/null
+++ b/recipes-graphics/omapfbplay/omapfbplay-xv_git.bb
@@ -0,0 +1,3 @@
+require omapfbplay.inc
+
+OMAPFBPLAYOPTS = "V4L2=y NETSYNC=y XV=y"
diff --git a/recipes-graphics/omapfbplay/omapfbplay.inc b/recipes-graphics/omapfbplay/omapfbplay.inc
new file mode 100644
index 0000000..77e2380
--- /dev/null
+++ b/recipes-graphics/omapfbplay/omapfbplay.inc
@@ -0,0 +1,33 @@
+DESCRIPTION = "Simple libav-based player that uses the omapfb overlays"
+DEPENDS = "bzip2 lame libav virtual/kernel"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://omapfbplay.c;beginline=2;endline=22;md5=05d3789ab362e6f4a9682e98100ea0fa"
+
+PV = "0.0+${PR}+gitr${SRCREV}"
+
+SRCREV = "34293052c5a2ae328eac6903512e6b4ce19b5639"
+SRC_URI = "git://git.mansr.com/omapfbplay;protocol=git \
+           file://omapfbplay-errorhandling.patch \
+           file://0001-omapfbplay-switch-CODEC_TYPE_VIDEO-to-AVMEDIA_TYPE_V.patch \
+          "
+
+S = "${WORKDIR}/git"
+
+# We want a kernel header for armv7a, but we don't want to make mplayer machine specific for that
+STAGING_KERNEL_DIR = "${STAGING_DIR}/${MACHINE_ARCH}${TARGET_VENDOR}-${TARGET_OS}/kernel"
+CFLAGS += " -I. -I${STAGING_KERNEL_DIR}/include "
+
+OMAPFBPLAYVARIANT ?= "${PN}"
+OMAPFBPLAYOPTS ?= "V4L2=y NETSYNC=y"
+
+do_compile() {
+	cp ${STAGING_KERNEL_DIR}/arch/arm/plat-omap/include/mach/omapfb.h ${S} || true
+	cp ${STAGING_KERNEL_DIR}/include/asm-arm/arch-omap/omapfb.h ${S} || true
+	cp ${STAGING_KERNEL_DIR}/include/linux/omapfb.h ${S} || true
+	oe_runmake ${TARGET_ARCH}=y ${OMAPFBPLAYOPTS} -e
+}
+
+do_install() {
+	install -d ${D}/${bindir}
+	install -m 0755 ${S}/omapfbplay ${D}/${bindir}/${OMAPFBPLAYVARIANT}
+}
diff --git a/recipes-graphics/omapfbplay/omapfbplay_git.bb b/recipes-graphics/omapfbplay/omapfbplay_git.bb
new file mode 100644
index 0000000..0d3956f
--- /dev/null
+++ b/recipes-graphics/omapfbplay/omapfbplay_git.bb
@@ -0,0 +1,3 @@
+require omapfbplay.inc
+
+OMAPFBPLAYOPTS = "V4L2=y OMAPFB=y NETSYNC=y"


