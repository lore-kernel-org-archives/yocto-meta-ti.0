Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 427D2E01454
	for <meta-ti@yoctoproject.org>; Sun, 17 Feb 2013 15:17:05 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id F3D0052A89; Sun, 17 Feb 2013 23:17:04 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130217231704.F3D0052A89@arago-project.org>
Date: Sun, 17 Feb 2013 23:17:04 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Peter A. Bigot : libgles-omap3: ignore QA errors
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
X-List-Received-Date: Sun, 17 Feb 2013 23:17:05 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: danny
Commit: 41159b9b785873279734859cafca34507d2dd44e
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=41159b9b785873279734859cafca34507d2dd44e

Author: Peter A. Bigot <pab@pabigot.com>
Date:   Mon Jan 14 13:41:01 2013 -0600

libgles-omap3: ignore QA errors

This patch allows libgles-omap3 to build on the danny branch.  The following
warnings are not addressed:

 WARNING: libgles-omap3: No generic license file exists for: proprietary-binary in any provider
 WARNING: QA Issue: libgles-omap3: Files/directories were installed but not shipped
  /usr/lib/ES2.0
 WARNING: libgles-omap3: The compile log indicates that host include and/or library paths were used.
         Please check the log '/prj/oe/omap/build-gumstix-community-danny/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/libgles-omap3-4.05.00.03-r35/temp/log.do_compile' for more information.

Signed-off-by: Peter A. Bigot <pab@pabigot.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-graphics/libgles/libgles-omap3.inc |   30 ++++++++++++++++++++++++++++
 1 files changed, 30 insertions(+), 0 deletions(-)

diff --git a/recipes-graphics/libgles/libgles-omap3.inc b/recipes-graphics/libgles/libgles-omap3.inc
index cb96e4f..66ebcd5 100644
--- a/recipes-graphics/libgles/libgles-omap3.inc
+++ b/recipes-graphics/libgles/libgles-omap3.inc
@@ -353,12 +353,42 @@ RDEPENDS_${PN} += "fbset devmem2"
 
 #HACK! These are binaries, so we can't guarantee that LDFLAGS match :(
 INSANE_SKIP_${PN} = "ldflags dev-so"
+INSANE_SKIP_${PN}-es3 = "ldflags dev-so staticdev"
+INSANE_SKIP_${PN}-es5 = "ldflags dev-so staticdev"
+INSANE_SKIP_${PN}-es6 = "ldflags dev-so staticdev"
+INSANE_SKIP_${PN}-es8 = "ldflags dev-so staticdev"
+INSANE_SKIP_${PN}-rawdemos = "ldflags dev-so useless-rpaths"
+INSANE_SKIP_${PN}-x11demos = "ldflags dev-so useless-rpaths"
 INSANE_SKIP_${PN}-blitwsegl = "ldflags"
+INSANE_SKIP_${PN}-blitwsegl-es3 = "ldflags"
+INSANE_SKIP_${PN}-blitwsegl-es5 = "ldflags"
+INSANE_SKIP_${PN}-blitwsegl-es6 = "ldflags"
+INSANE_SKIP_${PN}-blitwsegl-es8 = "ldflags"
 INSANE_SKIP_${PN}-flipwsegl = "ldflags"
+INSANE_SKIP_${PN}-flipwsegl-es3 = "ldflags"
+INSANE_SKIP_${PN}-flipwsegl-es5 = "ldflags"
+INSANE_SKIP_${PN}-flipwsegl-es6 = "ldflags"
+INSANE_SKIP_${PN}-flipwsegl-es8 = "ldflags"
 INSANE_SKIP_${PN}-frontwsegl = "ldflags"
+INSANE_SKIP_${PN}-frontwsegl-es3 = "ldflags"
+INSANE_SKIP_${PN}-frontwsegl-es5 = "ldflags"
+INSANE_SKIP_${PN}-frontwsegl-es6 = "ldflags"
+INSANE_SKIP_${PN}-frontwsegl-es8 = "ldflags"
 INSANE_SKIP_${PN}-linuxfbwsegl = "ldflags"
+INSANE_SKIP_${PN}-linuxfbwsegl-es3 = "ldflags"
+INSANE_SKIP_${PN}-linuxfbwsegl-es5 = "ldflags"
+INSANE_SKIP_${PN}-linuxfbwsegl-es6 = "ldflags"
+INSANE_SKIP_${PN}-linuxfbwsegl-es8 = "ldflags"
 INSANE_SKIP_${PN}-x11wsegl = "ldflags dev-so"
+INSANE_SKIP_${PN}-x11wsegl-es3 = "ldflags dev-so"
+INSANE_SKIP_${PN}-x11wsegl-es5 = "ldflags dev-so"
+INSANE_SKIP_${PN}-x11wsegl-es6 = "ldflags dev-so"
+INSANE_SKIP_${PN}-x11wsegl-es8 = "ldflags dev-so"
 INSANE_SKIP_${PN}-driwsegl = "ldflags dev-so"
+INSANE_SKIP_${PN}-driwsegl-es3 = "ldflags dev-so"
+INSANE_SKIP_${PN}-driwsegl-es5 = "ldflags dev-so"
+INSANE_SKIP_${PN}-driwsegl-es6 = "ldflags dev-so"
+INSANE_SKIP_${PN}-driwsegl-es8 = "ldflags dev-so"
 INSANE_SKIP_${PN}-tests = "ldflags"
 INSANE_SKIP_xserver-kdrive-powervrsgx = "ldflags"
 


