Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 50AB0E0049C
	for <meta-ti@yoctoproject.org>; Sat, 31 Aug 2013 20:13:07 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173021.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MSF00D72FLUH810@vms173021.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Sat, 31 Aug 2013 22:13:06 -0500 (CDT)
Received: from elrond.denix (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id F1A322004C; Sat,
	31 Aug 2013 23:13:05 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Sat, 31 Aug 2013 23:12:56 -0400
Message-id: <1378005180-30928-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH 1/5] libgles-omap3: fix some conflicts between X11 and Raw versions
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
X-List-Received-Date: Sun, 01 Sep 2013 03:13:12 -0000

From: Denys Dmytriyenko <denys@ti.com>

* Properly define all PROVIDES, RPROVIDES, RCONFLICTS and RREPLACES variables.
* Skip X11 recipe altogether in non-X11 distros to avoid broken dependencies
  for missing X libraries.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-graphics/libgles/libgles-omap3-no-x.inc | 14 ++++++++++++--
 recipes-graphics/libgles/libgles-omap3-x11.inc  | 17 ++++++++++++-----
 2 files changed, 24 insertions(+), 7 deletions(-)

diff --git a/recipes-graphics/libgles/libgles-omap3-no-x.inc b/recipes-graphics/libgles/libgles-omap3-no-x.inc
index d4cb46b..727c422 100644
--- a/recipes-graphics/libgles/libgles-omap3-no-x.inc
+++ b/recipes-graphics/libgles/libgles-omap3-no-x.inc
@@ -3,7 +3,9 @@ LICENSE = "proprietary-binary"
 # 'TSPA.txt' might not be the best file to md5sum
 LIC_FILES_CHKSUM = "file://TSPA.txt;md5=c0d5d9c1e38b41677144c4e24d6ddee1"
 
-PR = "r35"
+PR = "r36"
+
+EXCLUDE_FROM_WORLD = "1"
 
 COMPATIBLE_MACHINE = "(omap3|ti814x|ti816x|ti33x)"
 
@@ -13,7 +15,15 @@ PROVIDES += "virtual/egl virtual/libgles1 virtual/libgles2"
 
 RREPLACES_${PN} = "libegl libgles1 libgles2"
 RREPLACES_${PN}-dev = "libegl-dev libgles1-dev libgles2-dev"
-RREPLACES_${PN}-dbg = "libegl-dbg"
+RREPLACES_${PN}-dbg = "libegl-dbg libgles1-dbg libgles2-dbg"
+
+RPROVIDES_${PN} = "libegl libgles1 libgles2"
+RPROVIDES_${PN}-dev = "libegl-dev libgles1-dev libgles2-dev"
+RPROVIDES_${PN}-dbg = "libegl-dbg libgles1-dbg libgles2-dbg"
+
+RCONFLICTS_${PN} = "libegl libgles1 libgles2"
+RCONFLICTS_${PN}-dev = "libegl-dev libgles1-dev libgles2-dev"
+RCONFLICTS_${PN}-dbg = "libegl-dbg libgles1-dbg libgles2-dbg"
 
 SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/${SGXPV}/exports/${BINFILE} \
 		   file://cputype \
diff --git a/recipes-graphics/libgles/libgles-omap3-x11.inc b/recipes-graphics/libgles/libgles-omap3-x11.inc
index 6621396..abe6e6f 100644
--- a/recipes-graphics/libgles/libgles-omap3-x11.inc
+++ b/recipes-graphics/libgles/libgles-omap3-x11.inc
@@ -3,7 +3,9 @@ LICENSE = "proprietary-binary"
 # 'TSPA.txt' might not be the best file to md5sum
 LIC_FILES_CHKSUM = "file://TSPA.txt;md5=c0d5d9c1e38b41677144c4e24d6ddee1"
 
-PR = "r35"
+PR = "r36"
+
+EXCLUDE_FROM_WORLD = "1"
 
 COMPATIBLE_MACHINE = "(omap3|ti814x|ti816x|ti33x)"
 
@@ -12,19 +14,19 @@ DEPENDS = "virtual/libx11 libxau libxdmcp libdrm"
 export SUPPORT_XORG ?= "1"
 PVR_INIT ?= "pvrsrvinit"
 
-PROVIDES += "virtual/egl virtual/libgles1 virtual/libgles2"
+PROVIDES += "libgles-omap3 virtual/egl virtual/libgles1 virtual/libgles2"
 
 RREPLACES_${PN} = "libegl libgles1 libgles2"
 RREPLACES_${PN}-dev = "libegl-dev libgles1-dev libgles2-dev"
-RREPLACES_${PN}-dbg = "libegl-dbg"
+RREPLACES_${PN}-dbg = "libegl-dbg libgles1-dbg libgles2-dbg"
 
 RPROVIDES_${PN} = "libegl libgles1 libgles2"
 RPROVIDES_${PN}-dev = "libegl-dev libgles1-dev libgles2-dev"
-RPROVIDES_${PN}-dbg = "libegl-dbg"
+RPROVIDES_${PN}-dbg = "libegl-dbg libgles1-dbg libgles2-dbg"
 
 RCONFLICTS_${PN} = "libegl libgles1 libgles2"
 RCONFLICTS_${PN}-dev = "libegl-dev libgles1-dev libgles2-dev"
-RCONFLICTS_${PN}-dbg = "libegl-dbg"
+RCONFLICTS_${PN}-dbg = "libegl-dbg libgles1-dbg libgles2-dbg"
 
 SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/${SGXPV}/exports/${BINFILE} \
 		   file://cputype \
@@ -47,6 +49,11 @@ export ES8LOCATION ?= "${S}/gfx_rel_es8.x"
 
 LIBGLESWINDOWSYSTEM ?= "libpvrPVR2D_DRIWSEGL.so"
 
+python __anonymous() {
+    if "x11" not in d.getVar("DISTRO_FEATURES", True).split():
+        raise bb.parse.SkipPackage("Recipe is x11-specific, skipping")
+}
+
 do_configure() {
 	# Attempt to fix up the worst offenders for file permissions
 	for i in $(find ${S} -name "*.h") $(find ${S} -name "*.c") $(find ${S} -name "Make*") ; do
-- 
1.8.3.2


