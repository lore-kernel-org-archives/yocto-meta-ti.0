Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wg0-f54.google.com (mail-wg0-f54.google.com [74.125.82.54])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 48918E0141F
	for <meta-ti@yoctoproject.org>; Thu, 10 May 2012 05:04:39 -0700 (PDT)
Received: by wgbfg15 with SMTP id fg15so1073053wgb.11
	for <meta-ti@yoctoproject.org>; Thu, 10 May 2012 05:04:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=2O7eJdwFTTbdjwf0m56e12qssS+5KolOERrccnN2snI=;
	b=Ksquaa0zkal6Q9EeUU3/ytytN7gVdmFZesrIBDT7LvLFIM6/R0CUN2UX+XETNRDU/Y
	AQvQ/JTGPrWh/3jJGQAATvOEPmXHX4f8NBhLmLq71NdldHDJjXGbNt+Gac4n4cLUDzH9
	4qt+2JfLkMAa0NZGyECVZB3H0dLjdA7RudoE4drWLk9agzGD4v41R9O5G4LAj7jUKpZK
	j7tTiWhykwm+iSq9dMXjr0Auj7AFLQJd/LlPATU42DU0BwjzcPskLBDWvDwcjROhea09
	NzCT9fewq//6uyXytmdHf+7l7Xuu7xN73j3zpBOhEZk2ExUthO24C0nM/jpTwBHc6V2y
	8dwA==
Received: by 10.180.97.3 with SMTP id dw3mr15569545wib.19.1336651478805;
	Thu, 10 May 2012 05:04:38 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id f19sm4595292wiw.11.2012.05.10.05.04.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 10 May 2012 05:04:37 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@yoctoproject.org
Date: Thu, 10 May 2012 14:04:27 +0200
Message-Id: <1336651467-17102-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQm7/WwHfQsfxTRc7Wg4zmg8nTb2M04LUl/7NyxtK1dlMQmybekLU7Gv1ar/eLxPd08NMdFz
Cc: denys@ti.com
Subject: [PATCH] omapfbplay: import from OE classic
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
X-List-Received-Date: Thu, 10 May 2012 12:04:40 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 .../files/0001-rollback-to-libav-0.7.4-API.patch   |   26 +++++++++++++++
 .../files/omapfbplay-errorhandling.patch           |   34 ++++++++++++++++++++
 recipes-graphics/omapfbplay/omapfbplay-cmem_git.bb |   16 +++++++++
 recipes-graphics/omapfbplay/omapfbplay-dce_git.bb  |    7 ++++
 recipes-graphics/omapfbplay/omapfbplay-xv_git.bb   |    3 ++
 recipes-graphics/omapfbplay/omapfbplay.inc         |   33 +++++++++++++++++++
 recipes-graphics/omapfbplay/omapfbplay_git.bb      |    3 ++
 7 files changed, 122 insertions(+)
 create mode 100644 recipes-graphics/omapfbplay/files/0001-rollback-to-libav-0.7.4-API.patch
 create mode 100644 recipes-graphics/omapfbplay/files/omapfbplay-errorhandling.patch
 create mode 100644 recipes-graphics/omapfbplay/omapfbplay-cmem_git.bb
 create mode 100644 recipes-graphics/omapfbplay/omapfbplay-dce_git.bb
 create mode 100644 recipes-graphics/omapfbplay/omapfbplay-xv_git.bb
 create mode 100644 recipes-graphics/omapfbplay/omapfbplay.inc
 create mode 100644 recipes-graphics/omapfbplay/omapfbplay_git.bb

diff --git a/recipes-graphics/omapfbplay/files/0001-rollback-to-libav-0.7.4-API.patch b/recipes-graphics/omapfbplay/files/0001-rollback-to-libav-0.7.4-API.patch
new file mode 100644
index 0000000..9095fe5
--- /dev/null
+++ b/recipes-graphics/omapfbplay/files/0001-rollback-to-libav-0.7.4-API.patch
@@ -0,0 +1,26 @@
+From dca631cfa22b1f903c943a9e03597aa6f9ae10d4 Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Thu, 10 May 2012 14:01:27 +0200
+Subject: [PATCH] rollback to libav 0.7.4 API
+
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+---
+ omapfbplay.c |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/omapfbplay.c b/omapfbplay.c
+index 6a6fc96..1e5a29c 100644
+--- a/omapfbplay.c
++++ b/omapfbplay.c
+@@ -674,7 +674,7 @@ main(int argc, char **argv)
+     pthread_join(dispt, NULL);
+ 
+ out:
+-    if (afc) avformat_close_input(&afc);
++    if (afc) av_close_input_file(&afc);
+ 
+     if (codec)   codec->close();
+     if (timer)   timer->close();
+-- 
+1.7.10
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
index 0000000..88de77b
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
+SRCREV = "d03f042ecac0a231bedeadc7a6c67f0102d5505a"
+SRC_URI = "git://git.mansr.com/omapfbplay;protocol=git \
+           file://omapfbplay-errorhandling.patch \
+           file://0001-rollback-to-libav-0.7.4-API.patch \
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
-- 
1.7.10


