Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EAFC6E014F1
	for <meta-ti@yoctoproject.org>; Fri, 21 Jun 2013 11:54:29 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id CDCB852AAF; Fri, 21 Jun 2013 18:54:28 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130621185428.CDCB852AAF@arago-project.org>
Date: Fri, 21 Jun 2013 18:54:28 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : libgles-omap3: don't RCONFLICT/ RREPLACE no-x version with x11 as it breaks non-X distros
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
X-List-Received-Date: Fri, 21 Jun 2013 18:54:30 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: b02c0284fbf695a5543b2d61630cd2a95cd36c66
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=b02c0284fbf695a5543b2d61630cd2a95cd36c66

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Fri Jun 21 14:24:50 2013 -0400

libgles-omap3: don't RCONFLICT/RREPLACE no-x version with x11 as it breaks non-X distros

* Enables building/installing both X11 and RAW libs/demos. Plus otherwise the
  build is broken for non-X distros, as it pulls in X11 deps due to RREPLACES...
* Fix broken DEPENDS copy/paste typo.
* Also, clean up after the previous changes - extra empty lines, indentation, etc.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../omap3-sgx-modules-x11_4.09.00.01.bb            |    1 -
 .../omap3-sgx-modules_4.09.00.01.bb                |    1 -
 recipes-graphics/libgles/libgles-omap3-no-x.inc    |    3 +-
 recipes-graphics/libgles/libgles-omap3-x11.inc     |   21 ++++++++-----------
 recipes-graphics/libgles/libgles-omap3.inc         |    1 -
 5 files changed, 10 insertions(+), 17 deletions(-)

diff --git a/recipes-bsp/powervr-drivers/omap3-sgx-modules-x11_4.09.00.01.bb b/recipes-bsp/powervr-drivers/omap3-sgx-modules-x11_4.09.00.01.bb
index 8493814..d439d83 100644
--- a/recipes-bsp/powervr-drivers/omap3-sgx-modules-x11_4.09.00.01.bb
+++ b/recipes-bsp/powervr-drivers/omap3-sgx-modules-x11_4.09.00.01.bb
@@ -71,4 +71,3 @@ do_install() {
 
     cp ${S}/services4/3rdparty/linux_drm/drm.ko ${D}/lib/modules/${KERNEL_VERSION}/kernel/drivers/gpu/pvr
 }
-
diff --git a/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.09.00.01.bb b/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.09.00.01.bb
index 923e6a5..399374d 100644
--- a/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.09.00.01.bb
+++ b/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.09.00.01.bb
@@ -48,4 +48,3 @@ do_install() {
         ${S}/services4/3rdparty/bufferclass_ti/bufferclass_ti.ko \
         ${D}/lib/modules/${KERNEL_VERSION}/kernel/drivers/gpu/pvr
 }
-
diff --git a/recipes-graphics/libgles/libgles-omap3-no-x.inc b/recipes-graphics/libgles/libgles-omap3-no-x.inc
index 6d79bf6..d4cb46b 100644
--- a/recipes-graphics/libgles/libgles-omap3-no-x.inc
+++ b/recipes-graphics/libgles/libgles-omap3-no-x.inc
@@ -245,7 +245,7 @@ FILES_${PN}-dbg = "${libdir}/.debug/* ${bindir}/.debug/* \
                    ${libdir}/ES*/.debug ${bindir}/*/.debug\
                    ${bindir}/SGX/demos/*/.debug/* \
                    ${bindir}/SGX/trainingcourses/*/.debug/* \
-	"
+"
 
 FILES_${PN}-rawdemos = "${bindir}/SGX/demos/Raw/*"
 
@@ -315,4 +315,3 @@ rm -f $D${sysconfdir}/powervr-esrev
 pkg_postinst_${PN}-linuxfbwsegl() {
 rm -f $D${sysconfdir}/powervr-esrev
 }
-
diff --git a/recipes-graphics/libgles/libgles-omap3-x11.inc b/recipes-graphics/libgles/libgles-omap3-x11.inc
index c4d0806..6621396 100644
--- a/recipes-graphics/libgles/libgles-omap3-x11.inc
+++ b/recipes-graphics/libgles/libgles-omap3-x11.inc
@@ -7,27 +7,24 @@ PR = "r35"
 
 COMPATIBLE_MACHINE = "(omap3|ti814x|ti816x|ti33x)"
 
-X11DEPENDS = "virtual/libx11 libxau libxdmcp libdrm"
-DEPENDS = "x11"
+DEPENDS = "virtual/libx11 libxau libxdmcp libdrm"
 
 export SUPPORT_XORG ?= "1"
 PVR_INIT ?= "pvrsrvinit"
 
 PROVIDES += "virtual/egl virtual/libgles1 virtual/libgles2"
 
-RREPLACES_${PN} = "libegl libgles1 libgles2 libgles-omap3"
-RREPLACES_${PN}-dev = "libegl-dev libgles1-dev libgles2-dev libgles-omap3-dev"
-RREPLACES_${PN}-dbg = "libegl-dbg libgles-omap3-dbg"
+RREPLACES_${PN} = "libegl libgles1 libgles2"
+RREPLACES_${PN}-dev = "libegl-dev libgles1-dev libgles2-dev"
+RREPLACES_${PN}-dbg = "libegl-dbg"
 
-RPROVIDES_${PN} = "libegl libgles1 libgles2 libgles-omap3"
-RPROVIDES_${PN}-dev = "libegl-dev libgles1-dev libgles2-dev libgles-omap3-dev"
-RPROVIDES_${PN}-dbg = "libegl-dbg libgles-omap3-dbg"
+RPROVIDES_${PN} = "libegl libgles1 libgles2"
+RPROVIDES_${PN}-dev = "libegl-dev libgles1-dev libgles2-dev"
+RPROVIDES_${PN}-dbg = "libegl-dbg"
 
 RCONFLICTS_${PN} = "libegl libgles1 libgles2"
-RCONFLICTS_${PN}-dev = "libegl-dev libgles1-dev libgles2-dev libgles-omap3-dev"
-RCONFLICTS_${PN}-dbg = "libegl-dbg libgles-omap3-dbg"
-
-
+RCONFLICTS_${PN}-dev = "libegl-dev libgles1-dev libgles2-dev"
+RCONFLICTS_${PN}-dbg = "libegl-dbg"
 
 SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/${SGXPV}/exports/${BINFILE} \
 		   file://cputype \
diff --git a/recipes-graphics/libgles/libgles-omap3.inc b/recipes-graphics/libgles/libgles-omap3.inc
index 9a90c56..f417b8e 100644
--- a/recipes-graphics/libgles/libgles-omap3.inc
+++ b/recipes-graphics/libgles/libgles-omap3.inc
@@ -437,4 +437,3 @@ echo "WindowSystem=libpvrPVR2D_X11WSEGL.so.1" >> $D${sysconfdir}/powervr.ini
 pkg_postinst_${PN}-driwsegl() {
 rm -f $D${sysconfdir}/powervr-esrev
 }
-


