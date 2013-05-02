Return-Path: <prabu@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 898A0E014FE
	for <meta-ti@yoctoproject.org>; Thu,  2 May 2013 06:40:07 -0700 (PDT)
Received: from dbdlxv05.itg.ti.com ([172.24.171.60])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r42De5Lt027521
	for <meta-ti@yoctoproject.org>; Thu, 2 May 2013 08:40:06 -0500
Received: from DBDE72.ent.ti.com (dbde72.ent.ti.com [172.24.171.97])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id r42De3xb028414
	for <meta-ti@yoctoproject.org>; Thu, 2 May 2013 08:40:04 -0500
Received: from dbdp32.itg.ti.com (172.24.170.251) by DBDE72.ent.ti.com
	(172.24.171.97) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 2 May 2013 21:40:02 +0800
Received: from bangubntigfx.india.ti.com (smtpvbd.itg.ti.com [172.24.170.250])
	by dbdp32.itg.ti.com (8.13.8/8.13.8) with ESMTP id r42De1MF016387;
	Thu, 2 May 2013 19:10:02 +0530
From: Prabindh Sundareson <prabu@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 2 May 2013 19:09:15 +0530
Message-ID: <1367501964-6294-1-git-send-email-prabu@ti.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
Subject: [PATCH 01/10] libgles-omap3: Remove X11 related build and packaging
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
X-List-Received-Date: Thu, 02 May 2013 13:40:07 -0000
Content-Type: text/plain

The SGX530 driver for X11 is only buildable and testable standalone
with the pre-built X11 package provided with the Graphics SDK.
This patch removes X11 build from the default recipe, to enable
moving X11 build to a separate recipe.

This is part of a clean up of the Graphics recipe starting from
4.09.00.01 version of the Graphics SDK.

Signed-off-by: Prabindh Sundareson <prabu@ti.com>
---
 recipes-graphics/libgles/libgles-omap3.inc         |  168 ++++----------------
 .../libgles/libgles-omap3_4.09.00.01.bb            |   43 +-----
 2 files changed, 30 insertions(+), 181 deletions(-)

diff --git a/recipes-graphics/libgles/libgles-omap3.inc b/recipes-graphics/libgles/libgles-omap3.inc
index 9a90c56..130dc49 100644
--- a/recipes-graphics/libgles/libgles-omap3.inc
+++ b/recipes-graphics/libgles/libgles-omap3.inc
@@ -7,10 +7,6 @@ PR = "r35"
 
 COMPATIBLE_MACHINE = "(omap3|ti814x|ti816x|ti33x)"
 
-X11DEPENDS = "virtual/libx11 libxau libxdmcp libdrm"
-DEPENDS = "${@base_contains('DISTRO_FEATURES', 'x11', '${X11DEPENDS}', '', d)}"
-
-export SUPPORT_XORG ?= "${@base_contains('DISTRO_FEATURES', 'x11', '1', '0', d)}"
 PVR_INIT ?= "pvrsrvinit"
 
 PROVIDES += "virtual/egl virtual/libgles1 virtual/libgles2"
@@ -22,7 +18,6 @@ RREPLACES_${PN}-dbg = "libegl-dbg"
 SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/${SGXPV}/exports/${BINFILE} \
 		   file://cputype \
 		   file://rc.pvr \
-		   file://sample.desktop \
 		   file://99-bufferclass.rules  \
 "
 
@@ -79,87 +74,53 @@ do_compile() {
 	export PLAT_CPP="${CXX}"
 	export PLAR_AR="${AR}"
 
-	if [ ${SUPPORT_XORG} -eq 1 ] ; then
-		export X11ROOT="${STAGING_DIR_HOST}/usr"
-		mkdir -p ${S}/demos/x11
-		mkdir -p ${S}/trainingcourses/x11
-	fi
-
 	mkdir -p ${S}/demos/raw
 	mkdir -p ${S}/trainingcourses/raw
 
 	# Rebuild demos
-	for X11BUILD in 0 1 ; do
-		# Don't rebuild demos with X11 support for a non X11 distro
-		if [ ${SUPPORT_XORG} -eq 0 -a $X11BUILD -eq 1 ] ; then
-			continue
-		fi
+	for demo in ${S}/GFX_Linux_SDK/OGLES/SDKPackage/Demos/* ; do
+		cd $demo/OGLES/Build/LinuxGeneric
+		oe_runmake Common=1 PLATFORM=${PLATFORM} X11BUILD=0
+		rm $demo/OGLES/Build/${PLATFORM}/Release*/*.o
+
+		install -m 0755 $demo/OGLES/Build/${PLATFORM}/ReleaseRaw/* ${S}/demos/raw || true
+	done
+
+	for demo in ${S}/GFX_Linux_SDK/OGLES2/SDKPackage/Demos/* ; do
+		cd $demo/OGLES2/Build/LinuxGeneric
+		oe_runmake Common=1 PLATFORM=${PLATFORM} X11BUILD=0
+		rm -f $demo/OGLES2/Build/${PLATFORM}/Release*/*.o
 
-		for demo in ${S}/GFX_Linux_SDK/OGLES/SDKPackage/Demos/* ; do
-			cd $demo/OGLES/Build/LinuxGeneric
-			oe_runmake Common=1 PLATFORM=${PLATFORM} X11BUILD=$X11BUILD
-			rm $demo/OGLES/Build/${PLATFORM}/Release*/*.o
-
-			if [ $X11BUILD -eq 1 ] ; then
-				install -m 0755 $demo/OGLES/Build/${PLATFORM}/ReleaseX11/* ${S}/demos/x11 || true
-				sed -e s:NAME:$(basename $demo): \
-				    -e s:EXEC:${bindir}/SGX/demos/X11/$(basename $demo/OGLES/Build/${PLATFORM}/ReleaseX11/*): \
-				    ${WORKDIR}/sample.desktop > ${WORKDIR}/$(basename $demo).desktop
-			else
-				install -m 0755 $demo/OGLES/Build/${PLATFORM}/ReleaseRaw/* ${S}/demos/raw || true
-			fi
-		done
-
-		for demo in ${S}/GFX_Linux_SDK/OGLES2/SDKPackage/Demos/* ; do
-			cd $demo/OGLES2/Build/LinuxGeneric
-			oe_runmake Common=1 PLATFORM=${PLATFORM} X11BUILD=$X11BUILD
-			rm -f $demo/OGLES2/Build/${PLATFORM}/Release*/*.o
-
-			if [ $X11BUILD -eq 1 ] ; then
-				install -m 0755 $demo/OGLES2/Build/${PLATFORM}/ReleaseX11/* ${S}/demos/x11 || true
-				sed -e s:NAME:$(basename $demo): \
-				    -e s:EXEC:${bindir}/SGX/demos/X11/$(basename $demo/OGLES2/Build/${PLATFORM}/ReleaseX11/*): \
-				    ${WORKDIR}/sample.desktop > ${WORKDIR}/$(basename $demo).desktop
-			else
-				install -m 0755 $demo/OGLES2/Build/${PLATFORM}/ReleaseRaw/* ${S}/demos/raw || true
-			fi
-		done
+		install -m 0755 $demo/OGLES2/Build/${PLATFORM}/ReleaseRaw/* ${S}/demos/raw || true
 	done
 
 	find ${S} -name "*_org" -delete
 
 	# Build OGLES2 Trainingcourses
-	for X11BUILD in 0 1 ; do
-		# Don't rebuild training courses with X11 support for a non X11 distro
-		if [ ${SUPPORT_XORG} -eq 0 -a $X11BUILD -eq 1 ] ; then
-			continue
+	for training in ${S}/GFX_Linux_SDK/OGLES2/SDKPackage/TrainingCourse/* ; do
+		if [ -e $training/OGLES2/Build/LinuxGeneric/Makefile ] ; then
+			cd $training/OGLES2/Build/LinuxGeneric
 		fi
 
-		for training in ${S}/GFX_Linux_SDK/OGLES2/SDKPackage/TrainingCourse/* ; do
-			if [ -e $training/OGLES2/Build/LinuxGeneric/Makefile ] ; then
-				cd $training/OGLES2/Build/LinuxGeneric
-			fi
-
-			if [ -e $training/OGLES2/Build/${PLATFORM}/Makefile ] ; then
-				cd $training/OGLES2/Build/${PLATFORM}
-			fi
+		if [ -e $training/OGLES2/Build/${PLATFORM}/Makefile ] ; then
+			cd $training/OGLES2/Build/${PLATFORM}
+		fi
 
-			oe_runmake Common=1 PLATFORM=${PLATFORM} X11BUILD=$X11BUILD
-			rm -f $training/OGLES2/Build/${PLATFORM}/Release*/*.o
+		oe_runmake Common=1 PLATFORM=${PLATFORM} X11BUILD=0
+		rm -f $training/OGLES2/Build/${PLATFORM}/Release*/*.o
 
-			if [ $X11BUILD -eq 1 ] ; then
-				install -m 0755 $training/OGLES2/Build/${PLATFORM}/ReleaseX11/* ${S}/trainingcourses/x11 || true
-			else
-				install -m 0755 $training/OGLES2/Build/${PLATFORM}/ReleaseRaw/* ${S}/trainingcourses/raw || true
-			fi
-		done
+		install -m 0755 $training/OGLES2/Build/${PLATFORM}/ReleaseRaw/* ${S}/trainingcourses/raw || true
 	done
 
+
 }
 
 do_install () {
 	install -d ${D}${libdir}
 	cp -pPR ${BINLOCATION}/*.so* ${D}${libdir}
+ 	rm ${D}${libdir}/libpvrPVR2D_DRIWSEGL.so*
+ 	rm ${D}${libdir}/libsrv_um_dri.so*
+ 	rm ${D}${libdir}/pvr_drv.so*
 	install -m 0644 ${BINLOCATION}/*.a ${D}${libdir}
 
 	install -d ${D}${bindir}/
@@ -169,12 +130,6 @@ do_install () {
 	install -m 0755 ${BINLOCATION}/gl* ${D}${bindir}/
 	install -m 0755 ${BINLOCATION}/${PVR_INIT} ${D}${bindir}/
 
-	if [ ${SUPPORT_XORG} -eq 1 ] ; then
-		install -m 0755 ${BINLOCATION}/xgles1test1 ${D}${bindir}/
-		install -m 0755 ${BINLOCATION}/freedesktop/kdrive/usr/X11R6_SGX/bin/Xsgx ${D}${bindir}/|| true
-		cp -pPR ${S}/GFX_Linux_SDK/OGLES2/SDKPackage/Builds/OGLES2/${PLATFORM}/lib/*X11WS* ${D}${libdir} || true
-	fi
-
 	install -d ${D}${includedir}
 	cp -pPR ${S}/GFX_Linux_KM/include4 ${D}${includedir}/
 	cp -pPR ${S}/GFX_Linux_KM/services4 ${D}${includedir}/
@@ -211,13 +166,12 @@ do_install () {
 
 	shared_prog="eglinfo pvr2d_test ${PVR_INIT} services_test sgx_blit_test sgx_clipblit_test sgx_flip_test sgx_init_test sgx_render_flip_test"
 	raw_prog="gles1test1 gles2test1 ovg_unit_test"
-	x11_prog="eglinfo_x xgles1test1 xgles2test1 xmultiegltest xovg_unit_test"
 
 	for esrev in 2 3 5 6 8 ; do
 		ESLOCATION=$(eval echo $(echo \$\{ES${esrev}LOCATION\}))
 		if [ -e ${ESLOCATION} ] ; then
 			cp -pPR ${ESLOCATION}/lib*${IMGPV} ${ESLOCATION}/pvr_drv.so ${ESLOCATION}/*.a ${D}${libdir}/ES${esrev}.0/
-			for esprog in $shared_prog $raw_prog ${@base_contains('DISTRO_FEATURES', 'x11',"$x11_prog","",d)} ; do
+			for esprog in $shared_prog $raw_prog ; do
 				install -m 0755 ${ESLOCATION}/$esprog ${D}${bindir}/ES${esrev}.0/ 2>/dev/null || true
 			done
 		fi
@@ -225,17 +179,6 @@ do_install () {
 
 	rm ${D}${bindir}/ES*/*.h ${D}${bindir}/ES*/pdsasm ${D}${bindir}/pdsasm -f || true
 
-	install -d ${D}${prefix}/share/applications
-	cp ${WORKDIR}/*.desktop ${D}${prefix}/share/applications
-	rm ${D}${prefix}/share/applications/sample.desktop
-
-	if [ ${SUPPORT_XORG} -eq 1 ] ; then
-		install -d ${D}${bindir}/SGX/demos/X11/
-		install -m 0755 ${S}/demos/x11/* ${D}${bindir}/SGX/demos/X11/
-		install -d ${D}${bindir}/SGX/trainingcourses/X11  2>/dev/null || true
-		install -m 0755 ${S}/trainingcourses/x11/* ${D}${bindir}/SGX/trainingcourses/X11/ 2>/dev/null || true
-	fi
-
 	install -d ${D}${bindir}/SGX/demos/Raw/
 	install -m 0755 ${S}/demos/raw/* ${D}${bindir}/SGX/demos/Raw/
 	install -d ${D}${bindir}/SGX/trainingcourses/Raw 2>/dev/null || true
@@ -251,8 +194,7 @@ do_install () {
 
 }
 
-PACKAGES =+ "${@base_contains('DISTRO_FEATURES', 'x11',"${PN}-x11demos ${PN}-x11trainingcourses xserver-kdrive-powervrsgx" ,"", d)}  \
-             ${PN}-rawdemos ${PN}-rawtrainingcourses ${PN}-tests"
+PACKAGES =+ "${PN}-rawdemos ${PN}-rawtrainingcourses ${PN}-tests"
 # Package the base libraries per silicon revision
 PACKAGES =+ "${PN}-es2 ${PN}-es3 ${PN}-es5 ${PN}-es6 ${PN}-es8"
 RRECOMMENDS_${PN} += "${PN}-es2 ${PN}-es3 ${PN}-es5 ${PN}-es6 ${PN}-es8"
@@ -271,18 +213,14 @@ PRIVATE_LIBS_${PN}-es8 = "libGLESv2.so libIMGegl.so libsrv_um.so libOpenVG.so li
 
 
 PACKAGES =+ "${PN}-blitwsegl ${PN}-flipwsegl ${PN}-frontwsegl ${PN}-linuxfbwsegl"
-PACKAGES =+ "${@base_contains('DISTRO_FEATURES', 'x11',"${PN}-x11wsegl ${PN}-driwsegl" ,"", d)}"
+
 FILES_${PN}-blitwsegl = "${libdir}/libpvrPVR2D_BLITWSEGL.so.*"
 FILES_${PN}-flipwsegl = "${libdir}/libpvrPVR2D_FLIPWSEGL.so.*"
 FILES_${PN}-frontwsegl = "${libdir}/libpvrPVR2D_FRONTWSEGL.so.*"
 FILES_${PN}-linuxfbwsegl = "${libdir}/libpvrPVR2D_LINUXFBWSEGL.so.*"
-FILES_${PN}-x11wsegl = "${libdir}/libpvrPVR2D_X11WSEGL.so* ${bindir}/x* ${bindir}/*x"
-FILES_${PN}-driwsegl = "${libdir}/libpvrPVR2D_DRIWSEGL.so* ${libdir}/libsrv_um_dri*"
 
 PACKAGES =+ "${PN}-blitwsegl-es2 ${PN}-blitwsegl-es3 ${PN}-blitwsegl-es5 ${PN}-blitwsegl-es6 ${PN}-blitwsegl-es8 ${PN}-flipwsegl-es2 ${PN}-flipwsegl-es3 ${PN}-flipwsegl-es5 ${PN}-flipwsegl-es6 ${PN}-flipwsegl-es8 ${PN}-frontwsegl-es2 ${PN}-frontwsegl-es3 ${PN}-frontwsegl-es5 ${PN}-frontwsegl-es6 ${PN}-frontwsegl-es8 ${PN}-linuxfbwsegl-es2 ${PN}-linuxfbwsegl-es3 ${PN}-linuxfbwsegl-es5 ${PN}-linuxfbwsegl-es6 ${PN}-linuxfbwsegl-es8"
 
-X11_SEGL = " ${PN}-x11wsegl-es2 ${PN}-x11wsegl-es3 ${PN}-x11wsegl-es5 ${PN}-x11wsegl-es6 ${PN}-x11wsegl-es8 ${PN}-driwsegl-es2 ${PN}-driwsegl-es3 ${PN}-driwsegl-es5 ${PN}-driwsegl-es6 ${PN}-driwsegl-es8 "
-PACKAGES =+ "${@base_contains('DISTRO_FEATURES', 'x11',"${X11_SEGL}" ,"", d)}"
 FILES_${PN}-blitwsegl-es2 = "${libdir}/ES2*/libpvrPVR2D_BLITWSEGL.so.*"
 FILES_${PN}-blitwsegl-es3 = "${libdir}/ES3*/libpvrPVR2D_BLITWSEGL.so.*"
 FILES_${PN}-blitwsegl-es5 = "${libdir}/ES5*/libpvrPVR2D_BLITWSEGL.so.*"
@@ -311,25 +249,10 @@ FILES_${PN}-linuxfbwsegl-es6 = "${libdir}/ES6*/libpvrPVR2D_LINUXFBWSEGL.so.*"
 FILES_${PN}-linuxfbwsegl-es8 = "${libdir}/ES8*/libpvrPVR2D_LINUXFBWSEGL.so.*"
 RRECOMMENDS_${PN}-linuxfbwsegl = " ${PN}-linuxfbwsegl-es2 ${PN}-linuxfbwsegl-es3 ${PN}-linuxfbwsegl-es5 ${PN}-linuxfbwsegl-es6 ${PN}-linuxfbwsegl-es8"
 
-FILES_${PN}-x11wsegl-es2 = "${libdir}/ES2*/libpvrPVR2D_X11WSEGL.so.* ${bindir}/ES2*/x* ${bindir}/ES2*/*x"
-FILES_${PN}-x11wsegl-es3 = "${libdir}/ES3*/libpvrPVR2D_X11WSEGL.so.* ${bindir}/ES3*/x* ${bindir}/ES3*/*x"
-FILES_${PN}-x11wsegl-es5 = "${libdir}/ES5*/libpvrPVR2D_X11WSEGL.so.* ${bindir}/ES5*/x* ${bindir}/ES5*/*x"
-FILES_${PN}-x11wsegl-es6 = "${libdir}/ES6*/libpvrPVR2D_X11WSEGL.so.* ${bindir}/ES6*/x* ${bindir}/ES6*/*x"
-FILES_${PN}-x11wsegl-es8 = "${libdir}/ES8*/libpvrPVR2D_X11WSEGL.so.* ${bindir}/ES8*/x* ${bindir}/ES8*/*x"
-RRECOMMENDS_${PN}-x11wsegl = " ${PN}-x11wsegl-es2 ${PN}-x11wsegl-es3 ${PN}-x11wsegl-es5 ${PN}-x11wsegl-es6 ${PN}-x11wsegl-es8"
-
-FILES_${PN}-driwsegl-es2 = "${libdir}/ES2*/libpvrPVR2D_DRIWSEGL.so.* ${libdir}/ES2*/libsrv_um_dri*"
-FILES_${PN}-driwsegl-es3 = "${libdir}/ES3*/libpvrPVR2D_DRIWSEGL.so.* ${libdir}/ES3*/libsrv_um_dri*"
-FILES_${PN}-driwsegl-es5 = "${libdir}/ES5*/libpvrPVR2D_DRIWSEGL.so.* ${libdir}/ES5*/libsrv_um_dri*"
-FILES_${PN}-driwsegl-es6 = "${libdir}/ES6*/libpvrPVR2D_DRIWSEGL.so.* ${libdir}/ES6*/libsrv_um_dri*"
-FILES_${PN}-driwsegl-es8 = "${libdir}/ES8*/libpvrPVR2D_DRIWSEGL.so.* ${libdir}/ES8*/libsrv_um_dri*"
-RRECOMMENDS_${PN}-driwsegl = " ${PN}-driwsegl-es2 ${PN}-driwsegl-es3 ${PN}-driwsegl-es5 ${PN}-driwsegl-es6 ${PN}-driwsegl-es8"
-
 CONFFILES_${PN} = "${sysconfdir}/powervr.ini"
 
 FILES_${PN} = "${sysconfdir} ${libdir}/*.so* ${bindir}/${PVR_INIT} ${bindir}/cputype ${bindir}/*"
 
-FILES_xserver-kdrive-powervrsgx = "${bindir}/Xsgx"
 FILES_${PN}-tests = "${bindir}/*test*"
 FILES_${PN}-dbg = "${libdir}/.debug/* ${bindir}/.debug/* \
                    ${libdir}/ES*/.debug ${bindir}/*/.debug\
@@ -338,12 +261,8 @@ FILES_${PN}-dbg = "${libdir}/.debug/* ${bindir}/.debug/* \
 	"
 
 FILES_${PN}-rawdemos = "${bindir}/SGX/demos/Raw/*"
-FILES_${PN}-x11demos = "${bindir}/SGX/demos/X11/* ${prefix}/share/applications "
-RRECOMMENDS_${PN}-x11demos = "${PN}-x11wsegl"
 
 FILES_${PN}-rawtrainingcourses = "${bindir}/SGX/trainingcourses/Raw/*"
-FILES_${PN}-x11trainingcourses = "${bindir}/SGX/trainingcourses/X11/*"
-RRECOMMENDS_${PN}-x11trainingcourses = "${PN}-x11wsegl"
 
 # The libs need the kernel-modules
 RRECOMMENDS_${PN} += "omap3-sgx-modules"
@@ -358,7 +277,6 @@ INSANE_SKIP_${PN}-es5 = "ldflags dev-so staticdev"
 INSANE_SKIP_${PN}-es6 = "ldflags dev-so staticdev"
 INSANE_SKIP_${PN}-es8 = "ldflags dev-so staticdev"
 INSANE_SKIP_${PN}-rawdemos = "ldflags dev-so useless-rpaths"
-INSANE_SKIP_${PN}-x11demos = "ldflags dev-so useless-rpaths"
 INSANE_SKIP_${PN}-blitwsegl = "ldflags"
 INSANE_SKIP_${PN}-blitwsegl-es3 = "ldflags"
 INSANE_SKIP_${PN}-blitwsegl-es5 = "ldflags"
@@ -379,18 +297,7 @@ INSANE_SKIP_${PN}-linuxfbwsegl-es3 = "ldflags"
 INSANE_SKIP_${PN}-linuxfbwsegl-es5 = "ldflags"
 INSANE_SKIP_${PN}-linuxfbwsegl-es6 = "ldflags"
 INSANE_SKIP_${PN}-linuxfbwsegl-es8 = "ldflags"
-INSANE_SKIP_${PN}-x11wsegl = "ldflags dev-so"
-INSANE_SKIP_${PN}-x11wsegl-es3 = "ldflags dev-so"
-INSANE_SKIP_${PN}-x11wsegl-es5 = "ldflags dev-so"
-INSANE_SKIP_${PN}-x11wsegl-es6 = "ldflags dev-so"
-INSANE_SKIP_${PN}-x11wsegl-es8 = "ldflags dev-so"
-INSANE_SKIP_${PN}-driwsegl = "ldflags dev-so"
-INSANE_SKIP_${PN}-driwsegl-es3 = "ldflags dev-so"
-INSANE_SKIP_${PN}-driwsegl-es5 = "ldflags dev-so"
-INSANE_SKIP_${PN}-driwsegl-es6 = "ldflags dev-so"
-INSANE_SKIP_${PN}-driwsegl-es8 = "ldflags dev-so"
 INSANE_SKIP_${PN}-tests = "ldflags"
-INSANE_SKIP_xserver-kdrive-powervrsgx = "ldflags"
 
 # Quality control is really poor on these SDKs, so hack around the latest madness:
 FILES_${PN} += "${libdir}/*.so "
@@ -404,12 +311,6 @@ INITSCRIPT_PARAMS = "start 30 5 2 . stop 40 0 1 6 ."
 # Append to update-rc.d postinst
 pkg_postinst_${PN}_append() {
 rm -f $D${sysconfdir}/powervr-esrev
-
-if [ ${SUPPORT_XORG} -eq 1 ] ; then
-	ln -sf /usr/lib/libXdmcp.so.6.0.0 /usr/lib/libXdmcp.so.0
-	ln -sf /usr/lib/libXau.so.6.0.0 /usr/lib/libXau.so.0
-fi
-
 }
 
 pkg_postinst_${PN}-blitwsegl() {
@@ -427,14 +328,3 @@ pkg_postinst_${PN}-linuxfbwsegl() {
 rm -f $D${sysconfdir}/powervr-esrev
 }
 
-pkg_postinst_${PN}-x11wsegl() {
-rm -f $D${sysconfdir}/powervr-esrev
-
-echo "[default]" > $D${sysconfdir}/powervr.ini
-echo "WindowSystem=libpvrPVR2D_X11WSEGL.so.1" >> $D${sysconfdir}/powervr.ini
-}
-
-pkg_postinst_${PN}-driwsegl() {
-rm -f $D${sysconfdir}/powervr-esrev
-}
-
diff --git a/recipes-graphics/libgles/libgles-omap3_4.09.00.01.bb b/recipes-graphics/libgles/libgles-omap3_4.09.00.01.bb
index 7c6f231..165a406 100644
--- a/recipes-graphics/libgles/libgles-omap3_4.09.00.01.bb
+++ b/recipes-graphics/libgles/libgles-omap3_4.09.00.01.bb
@@ -23,8 +23,6 @@ TI_BIN_UNPK_WDEXT := "/Graphics_SDK_${SGXPV}"
 SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/${SGXPV}/exports/${BINFILE} \
            file://cputype \
            file://rc.pvr \
-           file://rc_dri.pvr \
-           file://sample.desktop \
            file://99-bufferclass.rules  \
 "
 SRC_URI[md5sum] = "bd35e9d8843aff3a2aca9d41e7db1c7d"
@@ -32,44 +30,5 @@ SRC_URI[sha256sum] = "eb37f75ddde4640b09e760fa86e689beb394330ecdf68786188c34f249
 
 S = "${WORKDIR}/Graphics_SDK_${SGXPV}"
 
-LIBGLESWINDOWSYSTEM ?= "${@base_contains('DISTRO_FEATURES', 'x11',"libpvrPVR2D_DRIWSEGL.so" ,"libpvrPVR2D_FRONTWSEGL.so.1", d)}"
+LIBGLESWINDOWSYSTEM ?= "libpvrPVR2D_FRONTWSEGL.so.1"
 
-do_configure_append() {
-
-    # Change PVR server's user mode library to point to DRI
-    for drifile in $(find ${S} -name "libsrv_um_dri.so"); do
-    if [ "$drifile" != "" ]
-    then
-        dir=$(dirname ${drifile})
-        if [ "$SUPPORT_XORG" = "1" ]
-        then
-            mv ${dir}/libsrv_um_dri.so ${dir}/libsrv_um.so
-        else
-            rm -rf ${dir}/libsrv_um_dri.so
-        fi
-    fi
-
-    done
-}
-
-do_install_append() {
-
-    # In this version of the graphics SDK the following directories do not exist:
-    #    /GFX_Linux_SDK/OGLES/SDKPackage/Builds/OGLES/Include/pvr2d.h (doesn't exist)
-    #    /GFX_Linux_SDK/OGLES/SDKPackage/Builds/OGLES/Include/GLES/egltypes.h (doesn't exist)
-    # Therefore, need to copy these files manually at the only location that they do exist
-    cp -pPr ${S}/include/pvr2d/*.h ${D}${includedir}
-    cp -pPr ${S}/include/OGLES/GLES ${D}${includedir}/
-
-    rm ${D}${sysconfdir}/init.d/pvr-init
-
-    if [ "$SUPPORT_XORG" = "1" ]; then
-        cp -pP ${WORKDIR}/rc_dri.pvr ${D}${sysconfdir}/init.d/pvr-init
-    else
-        cp -pP ${WORKDIR}/rc.pvr ${D}${sysconfdir}/init.d/pvr-init
-    fi
-
-}
-
-RRECOMMENDS_${PN}-x11demos = "${PN}-driwsegl"
-RRECOMMENDS_${PN}-x11trainingcourses = "${PN}-driwsegl"
-- 
1.7.1


