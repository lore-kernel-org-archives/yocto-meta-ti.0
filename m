Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f176.google.com (mail-ob0-f176.google.com
	[209.85.214.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 72CB4E002AB
	for <meta-ti@yoctoproject.org>; Mon, 17 Sep 2012 17:18:55 -0700 (PDT)
Received: by obbtb18 with SMTP id tb18so12758972obb.35
	for <meta-ti@yoctoproject.org>; Mon, 17 Sep 2012 17:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=em6ooQVGdwTEogbEW/6vHheJ6yehQxaSBvFoAc9AKqw=;
	b=Je4mAblUAkMjA0dwOdZ/nHKHYnIiROtCfTO7z9ZqnDTULwb7UK+cuoh9D+7SmAHNeB
	8uaOROLyHHLjcr8TAKggFxbc3LCnbK7gE4ISzFgbB1oo0ytOV9m8qg2QRZRGb+2LNTUB
	PjtW3xL0/gx/ugURd+SydzYW1Q0CzzuI/DRW6ondB8f+aCg9udGvredmlpRbvD1Pn7e3
	nJQCBESHfk8D+fXA6btuWn5B7GkaaG3PRwo2Wiwiw1nDVmdmdfdTWWLcP0gv/tHMJwsp
	kcakXKTySxw8+dzsp2foi/g6adhLFPCz49PGZhbrmfjEDlQ6G7R+w2KuPty0cdSs84E5
	meCQ==
Received: by 10.182.89.101 with SMTP id bn5mr13838506obb.7.1347927532583;
	Mon, 17 Sep 2012 17:18:52 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id x1sm10064768oef.8.2012.09.17.17.18.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 17 Sep 2012 17:18:52 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-ti@yoctoproject.org
Date: Mon, 17 Sep 2012 19:40:46 -0500
Message-Id: <1347928846-23618-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH] libgles-omap3: Adjust for non X11 distros
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
X-List-Received-Date: Tue, 18 Sep 2012 00:18:55 -0000

* Distros that do not use X11 (x11 excluded from DISTRO_FEATURE list) are unable
  to build this Graphics SDK.
* This patch builds the Graphics SDK in either X11 mode or Raw mode depending
  on if x11 is apart of the DISTRO_FEATURE. Components are built, installed and
  packaged based on which mode the Graphics SDK is built in.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 recipes-graphics/libgles/libgles-omap3.inc    |  184 +++++++++++++++----------
 recipes-graphics/libgles/libgles-omap3/rc.pvr |    7 +
 2 files changed, 120 insertions(+), 71 deletions(-)

diff --git a/recipes-graphics/libgles/libgles-omap3.inc b/recipes-graphics/libgles/libgles-omap3.inc
index 4525285..324a0ff 100644
--- a/recipes-graphics/libgles/libgles-omap3.inc
+++ b/recipes-graphics/libgles/libgles-omap3.inc
@@ -3,11 +3,14 @@ LICENSE = "proprietary-binary"
 # 'TSPA.txt' might not be the best file to md5sum
 LIC_FILES_CHKSUM = "file://TSPA.txt;md5=c0d5d9c1e38b41677144c4e24d6ddee1"
 
-PR = "r32"
+PR = "r33"
 
 COMPATIBLE_MACHINE = "(omap3|ti814x|ti816x|ti33x)"
 
-DEPENDS = "virtual/libx11 libxau libxdmcp libdrm"
+X11DEPENDS = "virtual/libx11 libxau libxdmcp libdrm"
+DEPENDS = "${@base_contains('DISTRO_FEATURES', 'x11', '${X11DEPENDS}', '', d)}"
+
+export SUPPORT_XORG ?= "${@base_contains('DISTRO_FEATURES', 'x11', '1', '0', d)}"
 
 PROVIDES += "virtual/egl"
 
@@ -35,7 +38,19 @@ do_configure() {
 	# Attempt to fix up the worst offenders for file permissions
 	for i in $(find ${S} -name "*.h") $(find ${S} -name "*.c") $(find ${S} -name "Make*") ; do
 		chmod 0644 $i
-	done 
+	done
+
+	# Remove dri files from non X11 distros.
+    for drifile in $(find ${S} -name "libsrv_um_dri.so"); do
+		if [ "$drifile" != "" ]
+		then
+			dir=$(dirname ${drifile})
+			if [ ${SUPPORT_XORG} -eq 0 ]
+            then
+			    rm -rf ${dir}/libsrv_um_dri.so
+			fi
+		fi
+    done
 
 	# Attempt to create proper library softlinks
 	for sofile in $(find ${S} -name "lib*Open*.so") $(find ${S} -name "lib*srv*.so") $(find ${S} -name "lib*gl*.so") $(find ${S} -name "libpvr*.so") $(find ${S} -name "lib*GL*.so"); do
@@ -64,61 +79,75 @@ PARALLEL_MAKE = ""
 PLATFORM ?= "LinuxOMAP3"
 
 do_compile() {
-	export X11ROOT="${STAGING_DIR_HOST}/usr"
 	export TOOLCHAIN="${TOOLCHAIN_PATH}"
-
 	export PLAT_CC="${CC}"
 	export PLAT_CPP="${CXX}"
 	export PLAR_AR="${AR}"
 
-	mkdir -p ${S}/demos/raw
-	mkdir -p ${S}/demos/x11
-
-	# Rebuild demos for both Raw and X11
-	for X11BUILD in 0 1 ; do
-		for demo in ${S}/GFX_Linux_SDK/OGLES/SDKPackage/Demos/* ; do
-			cd $demo/OGLES/Build/LinuxGeneric
-			oe_runmake Common=1 PLATFORM=${PLATFORM} X11BUILD=$X11BUILD
-			rm $demo/OGLES/Build/${PLATFORM}/Release*/*.o
-			install -m 0755 $demo/OGLES/Build/${PLATFORM}/ReleaseX11/* ${S}/demos/x11 || true
-			sed -e s:NAME:$(basename $demo): \
-			    -e s:EXEC:${bindir}/SGX/demos/X11/$(basename $demo/OGLES/Build/${PLATFORM}/ReleaseX11/*): \
-			     ${WORKDIR}/sample.desktop > ${WORKDIR}/$(basename $demo).desktop
-			install -m 0755 $demo/OGLES/Build/${PLATFORM}/ReleaseRaw/* ${S}/demos/raw || true
-		done
-		for demo in ${S}/GFX_Linux_SDK/OGLES2/SDKPackage/Demos/* ; do
-			cd $demo/OGLES2/Build/LinuxGeneric
-			oe_runmake Common=1 PLATFORM=${PLATFORM} X11BUILD=$X11BUILD
-			rm -f $demo/OGLES2/Build/${PLATFORM}/Release*/*.o
-			install -m 0755 $demo/OGLES2/Build/${PLATFORM}/ReleaseX11/* ${S}/demos/x11 || true
-			sed -e s:NAME:$(basename $demo): \
-			    -e s:EXEC:${bindir}/SGX/demos/X11/$(basename $demo/OGLES2/Build/${PLATFORM}/ReleaseX11/*): \
-			     ${WORKDIR}/sample.desktop > ${WORKDIR}/$(basename $demo).desktop
-			install -m 0755 $demo/OGLES2/Build/${PLATFORM}/ReleaseRaw/* ${S}/demos/raw || true
-		done
+    if [ ${SUPPORT_XORG} -eq 1 ]
+    then
+        export X11ROOT="${STAGING_DIR_HOST}/usr"
+        mkdir -p ${S}/demos/x11
+        mkdir -p ${S}/trainingcourses/x11
+    else
+	    mkdir -p ${S}/demos/raw
+        mkdir -p ${S}/trainingcourses/raw
+	fi
+
+	# Rebuild demos
+	for demo in ${S}/GFX_Linux_SDK/OGLES/SDKPackage/Demos/* ; do
+		cd $demo/OGLES/Build/LinuxGeneric
+		oe_runmake Common=1 PLATFORM=${PLATFORM} X11BUILD=${SUPPORT_XORG}
+		rm $demo/OGLES/Build/${PLATFORM}/Release*/*.o
+
+        if [ ${SUPPORT_XORG} -eq 1 ]
+        then
+            install -m 0755 $demo/OGLES/Build/${PLATFORM}/ReleaseX11/* ${S}/demos/x11 || true
+            sed -e s:NAME:$(basename $demo): \
+                -e s:EXEC:${bindir}/SGX/demos/X11/$(basename $demo/OGLES/Build/${PLATFORM}/ReleaseX11/*): \
+                ${WORKDIR}/sample.desktop > ${WORKDIR}/$(basename $demo).desktop
+        else
+            install -m 0755 $demo/OGLES/Build/${PLATFORM}/ReleaseRaw/* ${S}/demos/raw || true
+        fi
 	done
 
-	mkdir -p ${S}/trainingcourses/raw
-	mkdir -p ${S}/trainingcourses/x11
+	for demo in ${S}/GFX_Linux_SDK/OGLES2/SDKPackage/Demos/* ; do
+		cd $demo/OGLES2/Build/LinuxGeneric
+		oe_runmake Common=1 PLATFORM=${PLATFORM} X11BUILD=${SUPPORT_XORG}
+		rm -f $demo/OGLES2/Build/${PLATFORM}/Release*/*.o
+
+        if [ ${SUPPORT_XORG} -eq 1 ]
+        then
+		    install -m 0755 $demo/OGLES2/Build/${PLATFORM}/ReleaseX11/* ${S}/demos/x11 || true
+            sed -e s:NAME:$(basename $demo): \
+                -e s:EXEC:${bindir}/SGX/demos/X11/$(basename $demo/OGLES2/Build/${PLATFORM}/ReleaseX11/*): \
+                ${WORKDIR}/sample.desktop > ${WORKDIR}/$(basename $demo).desktop
+        else
+            install -m 0755 $demo/OGLES2/Build/${PLATFORM}/ReleaseRaw/* ${S}/demos/raw || true
+        fi
+	done
 
 	find ${S} -name "*_org" -delete
 
-	# Build OGLES2 Trainingcourses for both Raw and X11
-	for X11BUILD in 0 1 ; do
-		for training in ${S}/GFX_Linux_SDK/OGLES2/SDKPackage/TrainingCourse/* ; do
-			if [ -e $training/OGLES2/Build/LinuxGeneric/Makefile ] ; then
-				cd $training/OGLES2/Build/LinuxGeneric
-			fi
+	# Build OGLES2 Trainingcourses
+	for training in ${S}/GFX_Linux_SDK/OGLES2/SDKPackage/TrainingCourse/* ; do
+		if [ -e $training/OGLES2/Build/LinuxGeneric/Makefile ] ; then
+			cd $training/OGLES2/Build/LinuxGeneric
+		fi
 
-			if [ -e $training/OGLES2/Build/${PLATFORM}/Makefile ] ; then
-				cd $training/OGLES2/Build/${PLATFORM}
-			fi			
+		if [ -e $training/OGLES2/Build/${PLATFORM}/Makefile ] ; then
+			cd $training/OGLES2/Build/${PLATFORM}
+		fi
+
+		oe_runmake Common=1 PLATFORM=${PLATFORM} X11BUILD=${SUPPORT_XORG}
+		rm -f $training/OGLES2/Build/${PLATFORM}/Release*/*.o
 
-			oe_runmake Common=1 PLATFORM=${PLATFORM} X11BUILD=$X11BUILD
-			rm -f $training/OGLES2/Build/${PLATFORM}/Release*/*.o
-			install -m 0755 $training/OGLES2/Build/${PLATFORM}/ReleaseX11/* ${S}/trainingcourses/x11 || true
-			install -m 0755 $training/OGLES2/Build/${PLATFORM}/ReleaseRaw/* ${S}/trainingcourses/raw || true
-		done
+        if [ ${SUPPORT_XORG} -eq 1 ]
+        then
+		    install -m 0755 $training/OGLES2/Build/${PLATFORM}/ReleaseX11/* ${S}/trainingcourses/x11 || true
+        else
+		    install -m 0755 $training/OGLES2/Build/${PLATFORM}/ReleaseRaw/* ${S}/trainingcourses/raw || true
+        fi
 	done
 
 }
@@ -135,10 +164,13 @@ do_install () {
 	install -m 0755 ${BINLOCATION}/gl* ${D}${bindir}/
 	install -m 0755 ${BINLOCATION}/pvrsrvinit ${D}${bindir}/
 
-	install -m 0755 ${BINLOCATION}/xgles1test1 ${D}${bindir}/
+    if [ ${SUPPORT_XORG} -eq 1 ]
+    then
+	    install -m 0755 ${BINLOCATION}/xgles1test1 ${D}${bindir}/
 
-	install -m 0755 ${BINLOCATION}/freedesktop/kdrive/usr/X11R6_SGX/bin/Xsgx ${D}${bindir}/|| true
-	cp -pPR ${S}/GFX_Linux_SDK/OGLES2/SDKPackage/Builds/OGLES2/${PLATFORM}/lib/*X11WS* ${D}${libdir} || true
+	    install -m 0755 ${BINLOCATION}/freedesktop/kdrive/usr/X11R6_SGX/bin/Xsgx ${D}${bindir}/|| true
+	    cp -pPR ${S}/GFX_Linux_SDK/OGLES2/SDKPackage/Builds/OGLES2/${PLATFORM}/lib/*X11WS* ${D}${libdir} || true
+    fi
 
 	install -d ${D}${includedir}
 	cp -pPR ${S}/GFX_Linux_KM/include4 ${D}${includedir}/
@@ -174,11 +206,15 @@ do_install () {
 	install -d ${D}${bindir}/ES3.0
 	install -d ${D}${bindir}/ES2.0
 
+    shared_prog="eglinfo pvr2d_test pvrsrvinit services_test sgx_blit_test sgx_clipblit_test sgx_flip_test sgx_init_test sgx_render_flip_test"
+    raw_prog="gles1test1 gles2test1 ovg_unit_test"
+    x11_prog="eglinfo_x xgles1test1 xgles2test1 xmultiegltest xovg_unit_test"
+
 	for esrev in 2 3 5 6 8 ; do
 		ESLOCATION=$(eval echo $(echo \$\{ES${esrev}LOCATION\}))
 		if [ -e ${ESLOCATION} ] ; then
 			cp -pPR ${ESLOCATION}/lib*${IMGPV} ${ESLOCATION}/pvr_drv.so ${ESLOCATION}/*.a ${D}${libdir}/ES${esrev}.0/
-			for esprog in eglinfo eglinfo_x gles1test1 gles2test1 ovg_unit_test pvr2d_test pvrsrvinit services_test sgx_blit_test sgx_clipblit_test sgx_flip_test sgx_init_test sgx_render_flip_test xgles1test1 xgles2test1 xmultiegltest xovg_unit_test ; do
+			for esprog in $shared_prog ${@base_contains('DISTRO_FEATURES', 'x11',"$x11_prog","$raw_prog",d)} ; do
 				install -m 0755 ${ESLOCATION}/$esprog ${D}${bindir}/ES${esrev}.0/ || true
 			done
 		fi
@@ -190,15 +226,18 @@ do_install () {
 	cp ${WORKDIR}/*.desktop ${D}${prefix}/share/applications
 	rm ${D}${prefix}/share/applications/sample.desktop
 
-	install -d ${D}${bindir}/SGX/demos/X11/
-	install -d ${D}${bindir}/SGX/demos/Raw/
-	install -m 0755 ${S}/demos/x11/* ${D}${bindir}/SGX/demos/X11/
-	install -m 0755 ${S}/demos/raw/* ${D}${bindir}/SGX/demos/Raw/
-
-	install -d ${D}${bindir}/SGX/trainingcourses/Raw
-	install -d ${D}${bindir}/SGX/trainingcourses/X11
-	install -m 0755 ${S}/trainingcourses/x11/* ${D}${bindir}/SGX/trainingcourses/X11/
-	install -m 0755 ${S}/trainingcourses/raw/* ${D}${bindir}/SGX/trainingcourses/Raw/
+    if [ ${SUPPORT_XORG} -eq 1 ]
+    then
+	    install -d ${D}${bindir}/SGX/demos/X11/
+	    install -m 0755 ${S}/demos/x11/* ${D}${bindir}/SGX/demos/X11/
+	    install -d ${D}${bindir}/SGX/trainingcourses/X11
+        install -m 0755 ${S}/trainingcourses/x11/* ${D}${bindir}/SGX/trainingcourses/X11/
+    else
+	    install -d ${D}${bindir}/SGX/demos/Raw/
+	    install -m 0755 ${S}/demos/raw/* ${D}${bindir}/SGX/demos/Raw/
+	    install -d ${D}${bindir}/SGX/trainingcourses/Raw
+	    install -m 0755 ${S}/trainingcourses/raw/* ${D}${bindir}/SGX/trainingcourses/Raw/
+    fi
 
 	# Delete objects and linker scripts hidden between the headers
 	find ${D} -name "*.o" -delete
@@ -209,15 +248,9 @@ do_install () {
 
 }
 
-PACKAGES =+ "${PN}-rawdemos \
-             ${PN}-x11demos \
-             ${PN}-rawtrainingcourses \
-             ${PN}-x11trainingcourses \
+PACKAGES =+ " ${@base_contains('DISTRO_FEATURES', 'x11',"${PN}-x11demos ${PN}-x11trainingcourses xserver-kdrive-powervrsgx" ,"${PN}-rawdemos ${PN}-rawtrainingcourses", d)}  \
+            ${PN}-tests \
 "
-
-PACKAGES += "xserver-kdrive-powervrsgx \
-             ${PN}-tests "
-
 # Package the base libraries per silicon revision
 PACKAGES =+ "${PN}-es2 ${PN}-es3 ${PN}-es5 ${PN}-es6 ${PN}-es8"
 RRECOMMENDS_${PN} += "${PN}-es2 ${PN}-es3 ${PN}-es5 ${PN}-es6 ${PN}-es8"
@@ -234,7 +267,9 @@ PRIVATE_LIBS_${PN}-es5 = "libGLESv2.so libIMGegl.so libsrv_um.so libOpenVG.so li
 PRIVATE_LIBS_${PN}-es6 = "libGLESv2.so libIMGegl.so libsrv_um.so libOpenVG.so libpvr2d.so libsrv_init.so libEGL.so libsrv_um_dri.so libOpenVGU.so libglslcompiler.so libGLES_CM.so"
 PRIVATE_LIBS_${PN}-es8 = "libGLESv2.so libIMGegl.so libsrv_um.so libOpenVG.so libpvr2d.so libsrv_init.so libEGL.so libsrv_um_dri.so libOpenVGU.so libglslcompiler.so libGLES_CM.so"
 
-PACKAGES =+ "${PN}-blitwsegl ${PN}-flipwsegl ${PN}-frontwsegl ${PN}-linuxfbwsegl ${PN}-x11wsegl ${PN}-driwsegl"
+
+PACKAGES =+ "${PN}-blitwsegl ${PN}-flipwsegl ${PN}-frontwsegl ${PN}-linuxfbwsegl"
+PACKAGES =+ "${@base_contains('DISTRO_FEATURES', 'x11',"${PN}-x11wsegl ${PN}-driwsegl" ,"", d)}"
 FILES_${PN}-blitwsegl = "${libdir}/libpvrPVR2D_BLITWSEGL.so.*"
 FILES_${PN}-flipwsegl = "${libdir}/libpvrPVR2D_FLIPWSEGL.so.*"
 FILES_${PN}-frontwsegl = "${libdir}/libpvrPVR2D_FRONTWSEGL.so.*"
@@ -242,7 +277,10 @@ FILES_${PN}-linuxfbwsegl = "${libdir}/libpvrPVR2D_LINUXFBWSEGL.so.*"
 FILES_${PN}-x11wsegl = "${libdir}/libpvrPVR2D_X11WSEGL.so* ${bindir}/x* ${bindir}/*x"
 FILES_${PN}-driwsegl = "${libdir}/libpvrPVR2D_DRIWSEGL.so* ${libdir}/libsrv_um_dri*"
 
-PACKAGES =+ "${PN}-blitwsegl-es2 ${PN}-blitwsegl-es3 ${PN}-blitwsegl-es5 ${PN}-blitwsegl-es6 ${PN}-blitwsegl-es8 ${PN}-flipwsegl-es2 ${PN}-flipwsegl-es3 ${PN}-flipwsegl-es5 ${PN}-flipwsegl-es6 ${PN}-flipwsegl-es8 ${PN}-frontwsegl-es2 ${PN}-frontwsegl-es3 ${PN}-frontwsegl-es5 ${PN}-frontwsegl-es6 ${PN}-frontwsegl-es8 ${PN}-linuxfbwsegl-es2 ${PN}-linuxfbwsegl-es3 ${PN}-linuxfbwsegl-es5 ${PN}-linuxfbwsegl-es6 ${PN}-linuxfbwsegl-es8 ${PN}-x11wsegl-es2 ${PN}-x11wsegl-es3 ${PN}-x11wsegl-es5 ${PN}-x11wsegl-es6 ${PN}-x11wsegl-es8 ${PN}-driwsegl-es2 ${PN}-driwsegl-es3 ${PN}-driwsegl-es5 ${PN}-driwsegl-es6 ${PN}-driwsegl-es8"
+PACKAGES =+ "${PN}-blitwsegl-es2 ${PN}-blitwsegl-es3 ${PN}-blitwsegl-es5 ${PN}-blitwsegl-es6 ${PN}-blitwsegl-es8 ${PN}-flipwsegl-es2 ${PN}-flipwsegl-es3 ${PN}-flipwsegl-es5 ${PN}-flipwsegl-es6 ${PN}-flipwsegl-es8 ${PN}-frontwsegl-es2 ${PN}-frontwsegl-es3 ${PN}-frontwsegl-es5 ${PN}-frontwsegl-es6 ${PN}-frontwsegl-es8 ${PN}-linuxfbwsegl-es2 ${PN}-linuxfbwsegl-es3 ${PN}-linuxfbwsegl-es5 ${PN}-linuxfbwsegl-es6 ${PN}-linuxfbwsegl-es8"
+
+X11_SEGL = " ${PN}-x11wsegl-es2 ${PN}-x11wsegl-es3 ${PN}-x11wsegl-es5 ${PN}-x11wsegl-es6 ${PN}-x11wsegl-es8 ${PN}-driwsegl-es2 ${PN}-driwsegl-es3 ${PN}-driwsegl-es5 ${PN}-driwsegl-es6 ${PN}-driwsegl-es8 "
+PACKAGES =+ "${@base_contains('DISTRO_FEATURES', 'x11',"${X11_SEGL}" ,"", d)}"
 FILES_${PN}-blitwsegl-es2 = "${libdir}/ES2*/libpvrPVR2D_BLITWSEGL.so.*"
 FILES_${PN}-blitwsegl-es3 = "${libdir}/ES3*/libpvrPVR2D_BLITWSEGL.so.*"
 FILES_${PN}-blitwsegl-es5 = "${libdir}/ES5*/libpvrPVR2D_BLITWSEGL.so.*"
@@ -335,8 +373,12 @@ INITSCRIPT_PARAMS = "start 30 5 2 . stop 40 0 1 6 ."
 pkg_postinst_${PN}_append() {
 rm -f $D${sysconfdir}/powervr-esrev
 
-ln -sf /usr/lib/libXdmcp.so.6.0.0 /usr/lib/libXdmcp.so.0 
-ln -sf /usr/lib/libXau.so.6.0.0 /usr/lib/libXau.so.0
+if [ ${SUPPORT_XORG} -eq 1 ]
+then
+    ln -sf /usr/lib/libXdmcp.so.6.0.0 /usr/lib/libXdmcp.so.0
+    ln -sf /usr/lib/libXau.so.6.0.0 /usr/lib/libXau.so.0
+fi
+
 }
 
 pkg_postinst_${PN}-blitwsegl() {
diff --git a/recipes-graphics/libgles/libgles-omap3/rc.pvr b/recipes-graphics/libgles/libgles-omap3/rc.pvr
index 00cd994..e5a4cd1 100755
--- a/recipes-graphics/libgles/libgles-omap3/rc.pvr
+++ b/recipes-graphics/libgles/libgles-omap3/rc.pvr
@@ -42,6 +42,13 @@ fbset -vyres $(expr $YRES \* 3)
 sgxprepare () {
 	echo Starting PVR
 	insmod $(busybox find /lib/modules/$(uname -r) -name "pvrsrvkm.ko")
+
+    if [ "$?" != "0" ]
+    then
+        echo "Could not find pvrsrvkm driver"
+        exit 1
+    fi
+
 	modprobe omaplfb
 	modprobe bufferclass_ti
 
-- 
1.7.0.4


