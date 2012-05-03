Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CD94CE01413
	for <meta-ti@yoctoproject.org>; Wed,  2 May 2012 21:36:14 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id EC3E752AA3; Thu,  3 May 2012 04:36:13 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120503043613.EC3E752AA3@arago-project.org>
Date: Thu,  3 May 2012 04:36:13 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Koen Kooi : libgles-omap3: package dri files into driwsegl subpackages
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
X-List-Received-Date: Thu, 03 May 2012 04:36:15 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 405ce1996520cf3ec9a095d310f2cfeb2db80a0b
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=405ce1996520cf3ec9a095d310f2cfeb2db80a0b

Author: Koen Kooi <koen@dominion.thruhere.net>
Date:   Wed May  2 14:33:25 2012 +0200

libgles-omap3: package dri files into driwsegl subpackages

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-graphics/libgles/libgles-omap3.inc |   14 +++++++-------
 1 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/recipes-graphics/libgles/libgles-omap3.inc b/recipes-graphics/libgles/libgles-omap3.inc
index 75b248c..c64a882 100644
--- a/recipes-graphics/libgles/libgles-omap3.inc
+++ b/recipes-graphics/libgles/libgles-omap3.inc
@@ -3,7 +3,7 @@ LICENSE = "proprietary-binary"
 # 'TSPA.txt' might not be the best file to md5sum
 LIC_FILES_CHKSUM = "file://TSPA.txt;md5=c0d5d9c1e38b41677144c4e24d6ddee1"
 
-PR = "r29"
+PR = "r30"
 
 COMPATIBLE_MACHINE = "(omap3|ti816x|ti33x)"
 
@@ -239,7 +239,7 @@ FILES_${PN}-flipwsegl = "${libdir}/libpvrPVR2D_FLIPWSEGL.so.*"
 FILES_${PN}-frontwsegl = "${libdir}/libpvrPVR2D_FRONTWSEGL.so.*"
 FILES_${PN}-linuxfbwsegl = "${libdir}/libpvrPVR2D_LINUXFBWSEGL.so.*"
 FILES_${PN}-x11wsegl = "${libdir}/libpvrPVR2D_X11WSEGL.so* ${bindir}/x* ${bindir}/*x"
-FILES_${PN}-driwsegl = "${libdir}/libpvrPVR2D_DRIWSEGL.so*"
+FILES_${PN}-driwsegl = "${libdir}/libpvrPVR2D_DRIWSEGL.so* ${libdir}/libsrv_um_dri*"
 
 PACKAGES =+ "${PN}-blitwsegl-es2 ${PN}-blitwsegl-es3 ${PN}-blitwsegl-es5 ${PN}-blitwsegl-es6 ${PN}-blitwsegl-es8 ${PN}-flipwsegl-es2 ${PN}-flipwsegl-es3 ${PN}-flipwsegl-es5 ${PN}-flipwsegl-es6 ${PN}-flipwsegl-es8 ${PN}-frontwsegl-es2 ${PN}-frontwsegl-es3 ${PN}-frontwsegl-es5 ${PN}-frontwsegl-es6 ${PN}-frontwsegl-es8 ${PN}-linuxfbwsegl-es2 ${PN}-linuxfbwsegl-es3 ${PN}-linuxfbwsegl-es5 ${PN}-linuxfbwsegl-es6 ${PN}-linuxfbwsegl-es8 ${PN}-x11wsegl-es2 ${PN}-x11wsegl-es3 ${PN}-x11wsegl-es5 ${PN}-x11wsegl-es6 ${PN}-x11wsegl-es8 ${PN}-driwsegl-es2 ${PN}-driwsegl-es3 ${PN}-driwsegl-es5 ${PN}-driwsegl-es6 ${PN}-driwsegl-es8"
 FILES_${PN}-blitwsegl-es2 = "${libdir}/ES2*/libpvrPVR2D_BLITWSEGL.so.*"
@@ -277,11 +277,11 @@ FILES_${PN}-x11wsegl-es6 = "${libdir}/ES6*/libpvrPVR2D_X11WSEGL.so.* ${bindir}/E
 FILES_${PN}-x11wsegl-es8 = "${libdir}/ES8*/libpvrPVR2D_X11WSEGL.so.* ${bindir}/ES8*/x* ${bindir}/ES8*/*x"
 RRECOMMENDS_${PN}-x11wsegl = " ${PN}-x11wsegl-es2 ${PN}-x11wsegl-es3 ${PN}-x11wsegl-es5 ${PN}-x11wsegl-es6 ${PN}-x11wsegl-es8"
 
-FILES_${PN}-driwsegl-es2 = "${libdir}/ES2*/libpvrPVR2D_DRIWSEGL.so.*"
-FILES_${PN}-driwsegl-es3 = "${libdir}/ES3*/libpvrPVR2D_DRIWSEGL.so.*"
-FILES_${PN}-driwsegl-es5 = "${libdir}/ES5*/libpvrPVR2D_DRIWSEGL.so.*"
-FILES_${PN}-driwsegl-es6 = "${libdir}/ES6*/libpvrPVR2D_DRIWSEGL.so.*"
-FILES_${PN}-driwsegl-es8 = "${libdir}/ES8*/libpvrPVR2D_DRIWSEGL.so.*"
+FILES_${PN}-driwsegl-es2 = "${libdir}/ES2*/libpvrPVR2D_DRIWSEGL.so.* ${libdir}/ES2*/libsrv_um_dri*"
+FILES_${PN}-driwsegl-es3 = "${libdir}/ES3*/libpvrPVR2D_DRIWSEGL.so.* ${libdir}/ES3*/libsrv_um_dri*"
+FILES_${PN}-driwsegl-es5 = "${libdir}/ES5*/libpvrPVR2D_DRIWSEGL.so.* ${libdir}/ES5*/libsrv_um_dri*"
+FILES_${PN}-driwsegl-es6 = "${libdir}/ES6*/libpvrPVR2D_DRIWSEGL.so.* ${libdir}/ES6*/libsrv_um_dri*"
+FILES_${PN}-driwsegl-es8 = "${libdir}/ES8*/libpvrPVR2D_DRIWSEGL.so.* ${libdir}/ES8*/libsrv_um_dri*"
 RRECOMMENDS_${PN}-driwsegl = " ${PN}-driwsegl-es2 ${PN}-driwsegl-es3 ${PN}-driwsegl-es5 ${PN}-driwsegl-es6 ${PN}-driwsegl-es8"
 
 CONFFILES_${PN} = "${sysconfdir}/powervr.ini"


