Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f176.google.com (mail-ob0-f176.google.com
	[209.85.214.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A0158E013A6
	for <meta-ti@yoctoproject.org>; Mon,  3 Sep 2012 02:23:24 -0700 (PDT)
Received: by obbtb18 with SMTP id tb18so11338138obb.35
	for <meta-ti@yoctoproject.org>; Mon, 03 Sep 2012 02:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=o4fo7bXnd9VAbKPcdNmEQYff9CBTbcVHsge9zEuER1c=;
	b=0LrwsK8XHkn21QV8fYOEkXwUXk9xOfFzi226bRTF8Ha4ZP4Px379EFJjSR+yN5gBiQ
	v6bqp8yNt5fnOFb5g+ZHu5AsPWG1QsJgFayNDJk2Eoidd034MdlY6fnrHNLylSdzzp5y
	y0Y08SkwzCZi1w3lPbAx++nShWcKgNwCCiariety/HDQr0WUNoYy9nvyGwA8bJJzz9Od
	q2M0EtSiAr91w2cbKgwGZIg5MFS3bwcvNetmFjjOuc8om6LyuHZE1GqLDVM3YFoO1obH
	t217+FTzlU/pJImWK9ZrHq+6jVSRjoHOSQYZEsUnwJvGLR5PNKj2y98EDwzQpML2Wovw
	QYRA==
Received: by 10.182.78.161 with SMTP id c1mr13457909obx.88.1346664204022;
	Mon, 03 Sep 2012 02:23:24 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id
	jd10sm11296383obb.13.2012.09.03.02.23.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Sep 2012 02:23:23 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-ti@yoctoproject.org
Date: Mon,  3 Sep 2012 04:39:49 -0500
Message-Id: <1346665189-10535-1-git-send-email-fcooper27jr@gmail.com>
X-Mailer: git-send-email 1.7.0.4
Cc: "Franklin S. Cooper Jr" <fcooper27jr@gmail.com>
Subject: [PATCH v2] libgles-omap3: Pull in changes from arago to meta-ti
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
X-List-Received-Date: Mon, 03 Sep 2012 09:23:24 -0000

* Package additional include files from pvr2d and OGLES/GLES. This is required
  when trying to build qt4-embedded-gles (currently being developed)
* Modify rc.pvr to check the return of the insmod of pvrsrvkm. If this driver
  fails to load the devmem2 read access can put the system in a state where it
  will not come out of suspend. (Taken from arago)
* Other minor tweaks.

Signed-off-by: Franklin S. Cooper Jr <fcooper27jr@gmail.com>
---
 recipes-graphics/libgles/libgles-omap3.inc    |   30 +++++++++++++-----------
 recipes-graphics/libgles/libgles-omap3/rc.pvr |    7 +++++
 2 files changed, 23 insertions(+), 14 deletions(-)

diff --git a/recipes-graphics/libgles/libgles-omap3.inc b/recipes-graphics/libgles/libgles-omap3.inc
index 4525285..d770fce 100644
--- a/recipes-graphics/libgles/libgles-omap3.inc
+++ b/recipes-graphics/libgles/libgles-omap3.inc
@@ -3,7 +3,7 @@ LICENSE = "proprietary-binary"
 # 'TSPA.txt' might not be the best file to md5sum
 LIC_FILES_CHKSUM = "file://TSPA.txt;md5=c0d5d9c1e38b41677144c4e24d6ddee1"
 
-PR = "r32"
+PR = "r33"
 
 COMPATIBLE_MACHINE = "(omap3|ti814x|ti816x|ti33x)"
 
@@ -15,10 +15,10 @@ SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gf
 		   file://cputype \
 		   file://rc.pvr \
 		   file://sample.desktop \
-		   file://99-bufferclass.rules  \
+		   file://99-bufferclass.rules \
 "
 
-S = "${WORKDIR}/OMAP35x_Graphics_SDK_${SGXPV}"
+S ?= "${WORKDIR}/OMAP35x_Graphics_SDK_${SGXPV}"
 
 # Logic to unpack installjammer file
 TI_BIN_UNPK_CMDS="Y: qY:workdir:Y"
@@ -31,11 +31,13 @@ export ES5LOCATION ?= "${S}/gfx_rel_es5.x"
 export ES6LOCATION ?= "${S}/gfx_rel_es6.x"
 export ES8LOCATION ?= "${S}/gfx_rel_es8.x"
 
+LIBGLESWINDOWSYSTEM ?= "libpvrPVR2D_FRONTWSEGL.so.1"
+
 do_configure() {
 	# Attempt to fix up the worst offenders for file permissions
 	for i in $(find ${S} -name "*.h") $(find ${S} -name "*.c") $(find ${S} -name "Make*") ; do
 		chmod 0644 $i
-	done 
+	done
 
 	# Attempt to create proper library softlinks
 	for sofile in $(find ${S} -name "lib*Open*.so") $(find ${S} -name "lib*srv*.so") $(find ${S} -name "lib*gl*.so") $(find ${S} -name "libpvr*.so") $(find ${S} -name "lib*GL*.so"); do
@@ -112,7 +114,7 @@ do_compile() {
 
 			if [ -e $training/OGLES2/Build/${PLATFORM}/Makefile ] ; then
 				cd $training/OGLES2/Build/${PLATFORM}
-			fi			
+			fi
 
 			oe_runmake Common=1 PLATFORM=${PLATFORM} X11BUILD=$X11BUILD
 			rm -f $training/OGLES2/Build/${PLATFORM}/Release*/*.o
@@ -120,7 +122,6 @@ do_compile() {
 			install -m 0755 $training/OGLES2/Build/${PLATFORM}/ReleaseRaw/* ${S}/trainingcourses/raw || true
 		done
 	done
-
 }
 
 do_install () {
@@ -133,8 +134,7 @@ do_install () {
 
 	install -m 0755 ${BINLOCATION}/*_test ${D}${bindir}/
 	install -m 0755 ${BINLOCATION}/gl* ${D}${bindir}/
-	install -m 0755 ${BINLOCATION}/pvrsrvinit ${D}${bindir}/
-
+    install -m 0755 ${BINLOCATION}/pvrsrvinit ${D}${bindir}/
 	install -m 0755 ${BINLOCATION}/xgles1test1 ${D}${bindir}/
 
 	install -m 0755 ${BINLOCATION}/freedesktop/kdrive/usr/X11R6_SGX/bin/Xsgx ${D}${bindir}/|| true
@@ -152,23 +152,25 @@ do_install () {
 	cp -pPr ${S}/GFX_Linux_SDK/OVG/SDKPackage/Builds/OVG/Include/V* ${D}${includedir}/ || true
 	cp -pPr ${S}/include/*.h ${D}${includedir} || true
 	cp -pPr ${S}/include/wsegl/*.h ${D}${includedir} || true
-	
+    cp -pPr ${S}/include/pvr2d/*.h ${D}${includedir} || true
+    cp -pPr ${S}/include/OGLES/GLES ${D}${includedir}/ || true
+
 	install -d ${D}${sysconfdir}/init.d/
 	cp -pP ${WORKDIR}/rc.pvr ${D}${sysconfdir}/init.d/pvr-init
 
 	install -d ${D}${sysconfdir}
 	echo "[default]" > ${D}${sysconfdir}/powervr.ini
-	echo "WindowSystem=libpvrPVR2D_FRONTWSEGL.so.1" >> ${D}${sysconfdir}/powervr.ini
+	echo "WindowSystem=${LIBGLESWINDOWSYSTEM}" >> ${D}${sysconfdir}/powervr.ini
 
 	# The ES2.x, ES3.x, ES5.x and ES6.x CPUs have different SGX hardware, so we need to install multiple sets of userspace
 
-	install -d ${D}${libdir}/ES8.0
+    install -d ${D}${libdir}/ES8.0
 	install -d ${D}${libdir}/ES6.0
 	install -d ${D}${libdir}/ES5.0
 	install -d ${D}${libdir}/ES3.0
 	install -d ${D}${libdir}/ES2.0
 
-	install -d ${D}${bindir}/ES8.0
+    install -d ${D}${bindir}/ES8.0
 	install -d ${D}${bindir}/ES6.0
 	install -d ${D}${bindir}/ES5.0
 	install -d ${D}${bindir}/ES3.0
@@ -287,7 +289,7 @@ RRECOMMENDS_${PN}-driwsegl = " ${PN}-driwsegl-es2 ${PN}-driwsegl-es3 ${PN}-driws
 
 CONFFILES_${PN} = "${sysconfdir}/powervr.ini"
 
-FILES_${PN} = "${sysconfdir} ${libdir}/*.so* ${bindir}/pvrsrvinit ${bindir}/cputype ${bindir}/*"
+FILES_${PN} = "${sysconfdir} ${libdir}/lib*.so.* ${bindir}/pvrsrvinit ${bindir}/cputype ${bindir}/*"
 
 FILES_xserver-kdrive-powervrsgx = "${bindir}/Xsgx"
 FILES_${PN}-tests = "${bindir}/*test*"
@@ -335,7 +337,7 @@ INITSCRIPT_PARAMS = "start 30 5 2 . stop 40 0 1 6 ."
 pkg_postinst_${PN}_append() {
 rm -f $D${sysconfdir}/powervr-esrev
 
-ln -sf /usr/lib/libXdmcp.so.6.0.0 /usr/lib/libXdmcp.so.0 
+ln -sf /usr/lib/libXdmcp.so.6.0.0 /usr/lib/libXdmcp.so.0
 ln -sf /usr/lib/libXau.so.6.0.0 /usr/lib/libXau.so.0
 }
 
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


