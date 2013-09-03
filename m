Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 21CBFE00715
	for <meta-ti@yoctoproject.org>; Tue,  3 Sep 2013 10:08:14 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 68DEA52A87; Tue,  3 Sep 2013 17:08:12 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130903170812.68DEA52A87@arago-project.org>
Date: Tue,  3 Sep 2013 17:08:12 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : libgles-omap3: fix some conflicts between X11 and Raw versions
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
X-List-Received-Date: Tue, 03 Sep 2013 17:08:14 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: dylan
Commit: ae4f09067c552a25730a5019b2f5e7d016ef75b5
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=ae4f09067c552a25730a5019b2f5e7d016ef75b5

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Sat Aug 31 21:56:47 2013 -0400

libgles-omap3: fix some conflicts between X11 and Raw versions

* Properly define all PROVIDES, RPROVIDES, RCONFLICTS and RREPLACES variables.
* Skip X11 recipe altogether in non-X11 distros to avoid broken dependencies
  for missing X libraries.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Acked-by: Chase Maupin <chase.maupin@ti.com>

---

 recipes-graphics/libgles/libgles-omap3-no-x.inc |   14 ++++++++++++--
 recipes-graphics/libgles/libgles-omap3-x11.inc  |   17 ++++++++++++-----
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


