Return-Path: <prabu@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DF4F9E0152E
	for <meta-ti@yoctoproject.org>; Fri, 17 May 2013 09:58:17 -0700 (PDT)
Received: from dbdlxv05.itg.ti.com ([172.24.171.60])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r4HGwFLU017015
	for <meta-ti@yoctoproject.org>; Fri, 17 May 2013 11:58:16 -0500
Received: from DBDE73.ent.ti.com (dbde73.ent.ti.com [172.24.171.98])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id r4HGwCUL026688
	for <meta-ti@yoctoproject.org>; Fri, 17 May 2013 11:58:14 -0500
Received: from dbdp32.itg.ti.com (172.24.170.251) by DBDE73.ent.ti.com
	(172.24.171.98) with Microsoft SMTP Server id 14.2.342.3;
	Sat, 18 May 2013 00:58:12 +0800
Received: from bangubntigfx.india.ti.com (smtpvbd.itg.ti.com [172.24.170.250])
	by dbdp32.itg.ti.com (8.13.8/8.13.8) with ESMTP id r4HGwAuv014936;
	Fri, 17 May 2013 22:28:12 +0530
From: Prabindh Sundareson <prabu@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 17 May 2013 22:27:58 +0530
Message-ID: <1368809879-27201-9-git-send-email-prabu@ti.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <prabu@ti.com>
References: <prabu@ti.com>
MIME-Version: 1.0
Subject: [PATCH 09/10] libgles-omap3-x11: Separate X11 SGX driver package into new recipe
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
X-List-Received-Date: Fri, 17 May 2013 16:58:18 -0000
Content-Type: text/plain

libgles-omap3 now contains only non-X11 drivers. The X11 driver is
available in the libgles-omap3-x11 package. This package has
dependency on specific kernel versions for DRM builds.

Signed-off-by: Prabindh Sundareson <prabu@ti.com>
---
 .../libgles/libgles-omap3-x11-4.09.00.01/rc.pvr    |  125 ++++++++
 .../libgles-omap3-x11-4.09.00.01/rc_dri.pvr        |  137 +++++++++
 recipes-graphics/libgles/libgles-omap3-x11.inc     |  323 ++++++++++++++++++++
 3 files changed, 585 insertions(+), 0 deletions(-)
 create mode 100644 recipes-graphics/libgles/libgles-omap3-x11-4.09.00.01/rc.pvr
 create mode 100644 recipes-graphics/libgles/libgles-omap3-x11-4.09.00.01/rc_dri.pvr
 create mode 100644 recipes-graphics/libgles/libgles-omap3-x11.inc

diff --git a/recipes-graphics/libgles/libgles-omap3-x11-4.09.00.01/rc.pvr b/recipes-graphics/libgles/libgles-omap3-x11-4.09.00.01/rc.pvr
new file mode 100644
index 0000000..590d06c
--- /dev/null
+++ b/recipes-graphics/libgles/libgles-omap3-x11-4.09.00.01/rc.pvr
@@ -0,0 +1,125 @@
+#!/bin/sh
+PATH=$PATH:/usr/sbin
+
+# Check if an fb device is available.  If not then just go ahead and
+# exit because we have no display.
+fbset > /dev/null 2>&1
+if [ "$?" == "1" ]
+then
+    # looks like there is no display, so let's exit
+    exit 0
+fi
+
+BITSPERPIXEL="$(fbset | grep geom | awk '{print $6}')"
+YRES="$(fbset | grep geom | awk '{print $3}')"
+
+CPUTYPE="$(cputype)"
+
+if [ "$1" = "" ]; then
+	echo PVR-INIT: Please use start, stop, or restart.
+	exit 1
+fi
+
+if [ "$1" = "stop" -o  "$1" = "restart" ]; then
+	echo Stopping PVR
+	rmmod bufferclass_ti
+	rmmod omaplfb 2>/dev/null
+	rmmod pvrsrvkm 2>/dev/null
+fi
+
+if [ "$1" = "stop" ]; then
+	exit 0
+fi
+
+# Set RGBA ordering to something the drivers like
+if [ "$BITSPERPIXEL" = "32" ] ; then
+	fbset -rgba 8/16,8/8,8/0,8/24
+fi
+
+# Try to enable triple buffering when there's enough VRAM
+fbset -vyres $(expr $YRES \* 3)
+
+sgxprepare () {
+	echo Starting PVR
+	insmod $(busybox find /lib/modules/$(uname -r) -name "pvrsrvkm.ko")
+
+    if [ "$?" != "0" ]
+    then
+        echo "Could not find pvrsrvkm driver"
+        exit 1
+    fi
+
+	modprobe omaplfb
+	modprobe bufferclass_ti
+
+	pvr_maj=`grep "pvrsrvkm$" /proc/devices | cut -b1,2,3`
+        bc_maj=`grep "bc" /proc/devices | cut -b1,2,3`
+
+	if [ -e /dev/pvrsrvkm ] ; then
+		rm -f /dev/pvrsrvkm
+	fi
+
+	mknod /dev/pvrsrvkm c $pvr_maj 0
+	chmod 666 /dev/pvrsrvkm
+
+	touch /etc/powervr-esrev
+
+	SAVED_ESREVISION="$(cat /etc/powervr-esrev)"
+}
+
+sgxfinish () {
+	# Fix up a bug in opkg
+	if [ $(readlink /usr/lib/libsrv_um.so) != $(readlink /usr/lib/libsrv_um.so.1) ] ; then
+		cd /usr/lib
+		ln -sf $(readlink /usr/lib/libsrv_um.so.1) libsrv_um.so
+	fi
+
+	if [ "${ES_REVISION}" != "${SAVED_ESREVISION}" ] ; then
+		echo -n "Starting SGX fixup for"
+		echo " ES${ES_REVISION}.x"
+		cp -a /usr/lib/ES${ES_REVISION}.0/* /usr/lib
+		cp -a /usr/bin/ES${ES_REVISION}.0/* /usr/bin
+		echo "${ES_REVISION}" > /etc/powervr-esrev
+	fi
+
+	if ! /usr/bin/pvrsrvctl --start --no-module; then return; fi 
+}
+
+case $CPUTYPE in
+"OMAP3530")
+	sgxprepare
+
+	devmem2 0x48004B48 w 0x2 > /dev/null
+	devmem2 0x48004B10 w 0x1 > /dev/null
+	devmem2 0x48004B00 w 0x2 > /dev/null
+
+	ES_REVISION="$(devmem2 0x50000014 | sed -e s:0x00010205:5: -e s:0x00010201:3: -e s:0x00010003:2: | tail -n1 | awk -F': ' '{print $2}')"
+
+	sgxfinish
+	;;
+"TI33XX")
+	sgxprepare
+
+	devmem2 0x44e01104 w 0x0 > /dev/null
+	devmem2 0x44e00904 w 0x2 > /dev/null
+
+	ES_REVISION="$(devmem2 0x56000014 | sed -e s:0x00010205:8: | tail -n1 | awk -F': ' '{print $2}')"
+
+	sgxfinish
+	;;
+"TI816x")
+	sgxprepare
+
+	devmem2 0x48180F04 w 0x0 > /dev/null
+	devmem2 0x48180900 w 0x2 > /dev/null
+	devmem2 0x48180920 w 0x2 > /dev/null
+
+	ES_REVISION="$(devmem2 0x56000014 | sed -e s:0x00010205:6: -e s:0x00010201:3: -e s:0x00010003:2: | tail -n1 | awk -F': ' '{print $2}')"
+
+	sgxfinish
+	;;
+*)
+	echo No SGX hardware, not starting PVR
+	;;
+esac
+
diff --git a/recipes-graphics/libgles/libgles-omap3-x11-4.09.00.01/rc_dri.pvr b/recipes-graphics/libgles/libgles-omap3-x11-4.09.00.01/rc_dri.pvr
new file mode 100644
index 0000000..bc44937
--- /dev/null
+++ b/recipes-graphics/libgles/libgles-omap3-x11-4.09.00.01/rc_dri.pvr
@@ -0,0 +1,137 @@
+#!/bin/sh
+PATH=$PATH:/usr/sbin
+
+# Check if an fb device is available.  If not then just go ahead and
+# exit because we have no display.
+fbset > /dev/null 2>&1
+if [ "$?" == "1" ]
+then
+    # looks like there is no display, so let's exit
+    exit 0
+fi
+
+BITSPERPIXEL="$(fbset | grep geom | awk '{print $6}')"
+YRES="$(fbset | grep geom | awk '{print $3}')"
+
+CPUTYPE="$(cputype)"
+
+if [ "$1" = "" ]; then
+	echo PVR-INIT: Please use start, stop, or restart.
+	exit 1
+fi
+
+if [ "$1" = "stop" -o  "$1" = "restart" ]; then
+	echo Stopping PVR
+
+	# Stop the X Server.
+	#
+	[ -f /tmp/.X0-lock ] && read XPID < /tmp/.X0-lock && [ -n "$XPID" ] && kill $XPID && while [ -e /proc/$XPID ] ; do sleep 1; done
+
+	rmmod bufferclass_ti
+	rmmod pvrsrvkm 2>/dev/null
+    rmmod drm 2>/dev/null
+fi
+
+if [ "$1" = "stop" ]; then
+	exit 0
+fi
+
+# Set RGBA ordering to something the drivers like
+if [ "$BITSPERPIXEL" = "32" ] ; then
+	fbset -rgba 8/16,8/8,8/0,8/24
+fi
+
+# Try to enable triple buffering when there's enough VRAM
+fbset -vyres $(expr $YRES \* 3)
+
+sgxprepare () {
+	echo Starting PVR
+
+	# Start the X Server. 
+	# The X Server will load the PVR Services module.
+	#
+	/usr/local/XSGX/bin/X -verbose -config /usr/local/XSGX/etc/xorg.conf &
+
+	modprobe drm
+
+	insmod $(busybox find /lib/modules/$(uname -r) -name "pvrsrvkm.ko")
+
+    if [ "$?" != "0" ]
+    then
+        echo "Could not find pvrsrvkm driver"
+        exit 1
+    fi
+
+	modprobe bufferclass_ti
+
+	pvr_maj=`grep "pvrsrvkm$" /proc/devices | cut -b1,2,3`
+        bc_maj=`grep "bc" /proc/devices | cut -b1,2,3`
+
+	if [ -e /dev/pvrsrvkm ] ; then
+		rm -f /dev/pvrsrvkm
+	fi
+
+	mknod /dev/pvrsrvkm c $pvr_maj 0
+	chmod 666 /dev/pvrsrvkm
+
+	touch /etc/powervr-esrev
+
+	SAVED_ESREVISION="$(cat /etc/powervr-esrev)"
+}
+
+sgxfinish () {
+	# Fix up a bug in opkg
+	if [ $(readlink /usr/lib/libsrv_um.so) != $(readlink /usr/lib/libsrv_um.so.1) ] ; then
+		cd /usr/lib
+		ln -sf $(readlink /usr/lib/libsrv_um.so.1) libsrv_um.so
+	fi
+
+	if [ "${ES_REVISION}" != "${SAVED_ESREVISION}" ] ; then
+		echo -n "Starting SGX fixup for"
+		echo " ES${ES_REVISION}.x"
+		cp -a /usr/lib/ES${ES_REVISION}.0/* /usr/lib
+		cp -a /usr/bin/ES${ES_REVISION}.0/* /usr/bin
+		echo "${ES_REVISION}" > /etc/powervr-esrev
+	fi
+
+	if ! /usr/bin/pvrsrvctl --start --no-module; then return; fi 
+}
+
+case $CPUTYPE in
+"OMAP3530")
+	sgxprepare
+
+	devmem2 0x48004B48 w 0x2 > /dev/null
+	devmem2 0x48004B10 w 0x1 > /dev/null
+	devmem2 0x48004B00 w 0x2 > /dev/null
+
+	ES_REVISION="$(devmem2 0x50000014 | sed -e s:0x00010205:5: -e s:0x00010201:3: -e s:0x00010003:2: | tail -n1 | awk -F': ' '{print $2}')"
+
+	sgxfinish
+	;;
+"TI33XX")
+	sgxprepare
+
+	devmem2 0x44e01104 w 0x0 > /dev/null
+	devmem2 0x44e00904 w 0x2 > /dev/null
+
+	ES_REVISION="$(devmem2 0x56000014 | sed -e s:0x00010205:8: | tail -n1 | awk -F': ' '{print $2}')"
+
+	sgxfinish
+	;;
+"TI816x")
+	sgxprepare
+
+	devmem2 0x48180F04 w 0x0 > /dev/null
+	devmem2 0x48180900 w 0x2 > /dev/null
+	devmem2 0x48180920 w 0x2 > /dev/null
+
+	ES_REVISION="$(devmem2 0x56000014 | sed -e s:0x00010205:6: -e s:0x00010201:3: -e s:0x00010003:2: | tail -n1 | awk -F': ' '{print $2}')"
+
+	sgxfinish
+	;;
+*)
+	echo No SGX hardware, not starting PVR
+	;;
+esac
+
diff --git a/recipes-graphics/libgles/libgles-omap3-x11.inc b/recipes-graphics/libgles/libgles-omap3-x11.inc
new file mode 100644
index 0000000..d819b84
--- /dev/null
+++ b/recipes-graphics/libgles/libgles-omap3-x11.inc
@@ -0,0 +1,323 @@
+DESCRIPTION = "libGLES for the omap3 (X11)"
+LICENSE = "proprietary-binary"
+# 'TSPA.txt' might not be the best file to md5sum
+LIC_FILES_CHKSUM = "file://TSPA.txt;md5=c0d5d9c1e38b41677144c4e24d6ddee1"
+
+PR = "r35"
+
+COMPATIBLE_MACHINE = "(omap3|ti814x|ti816x|ti33x)"
+
+X11DEPENDS = "virtual/libx11 libxau libxdmcp libdrm"
+DEPENDS = "x11"
+
+export SUPPORT_XORG ?= "1"
+PVR_INIT ?= "pvrsrvinit"
+
+PROVIDES += "virtual/egl virtual/libgles1 virtual/libgles2"
+
+RREPLACES_${PN} = "libegl libgles1 libgles2 libgles-omap3"
+RREPLACES_${PN}-dev = "libegl-dev libgles1-dev libgles2-dev libgles-omap3-dev"
+RREPLACES_${PN}-dbg = "libegl-dbg libgles-omap3-dbg"
+
+RPROVIDES_${PN} = "libegl libgles1 libgles2 libgles-omap3"
+RPROVIDES_${PN}-dev = "libegl-dev libgles1-dev libgles2-dev libgles-omap3-dev"
+RPROVIDES_${PN}-dbg = "libegl-dbg libgles-omap3-dbg"
+
+RCONFLICTS_${PN} = "libegl libgles1 libgles2"
+RCONFLICTS_${PN}-dev = "libegl-dev libgles1-dev libgles2-dev libgles-omap3-dev"
+RCONFLICTS_${PN}-dbg = "libegl-dbg libgles-omap3-dbg"
+
+
+
+SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/${SGXPV}/exports/${BINFILE} \
+		   file://cputype \
+		   file://rc_dri.pvr \
+		   file://sample.desktop \
+		   file://99-bufferclass.rules  \
+"
+
+S = "${WORKDIR}/OMAP35x_Graphics_SDK_${SGXPV}"
+
+# Logic to unpack installjammer file
+TI_BIN_UNPK_CMDS="Y: qY:workdir:Y"
+require ../../recipes-ti/includes/ti-eula-unpack.inc
+
+export BINLOCATION ?= "${S}/gfx_rel"
+export ES3LOCATION ?= "${S}/gfx_rel_es3.x"
+export ES5LOCATION ?= "${S}/gfx_rel_es5.x"
+export ES6LOCATION ?= "${S}/gfx_rel_es6.x"
+export ES8LOCATION ?= "${S}/gfx_rel_es8.x"
+
+LIBGLESWINDOWSYSTEM ?= "libpvrPVR2D_DRIWSEGL.so"
+
+do_configure() {
+	# Attempt to fix up the worst offenders for file permissions
+	for i in $(find ${S} -name "*.h") $(find ${S} -name "*.c") $(find ${S} -name "Make*") ; do
+		chmod 0644 $i
+	done
+
+	# Attempt to create proper library softlinks
+	for sofile in $(find ${S} -name "lib*Open*.so") $(find ${S} -name "lib*srv*.so") $(find ${S} -name "lib*gl*.so") $(find ${S} -name "libpvr*.so") $(find ${S} -name "lib*GL*.so"); do
+		if [ "$(readlink -n ${sofile})" = "" ] ; then
+			mv $sofile ${sofile}.${IMGPV}
+			ln -sf $(basename ${sofile}.${IMGPV}) ${sofile}
+			ln -sf $(basename ${sofile}.${IMGPV}) ${sofile}$(echo ${IMGPV} | awk -F. '{print "." $1}')
+			ln -sf $(basename ${sofile}.${IMGPV}) ${sofile}$(echo ${IMGPV} | awk -F. '{print "." $1 "." $2}')
+		fi
+	done
+
+	# Due to recursive make PLAT_* isn't always passed down correctly, so use sed to fix those
+	for mak in $(find ${S} -name "*.mak") ; do
+		sed -i -e s:arm-none-linux-gnueabi-:${TARGET_PREFIX}:g $mak
+	done
+
+	# clear out old stuff
+	find Binaries/ | xargs rm -f || true
+}
+
+# Force in GNU_HASH and paths to libs
+TARGET_CC_ARCH += " ${TARGET_LINK_HASH_STYLE} -Wl,-rpath-link,${BINLOCATION} -L${BINLOCATION} \
+-L${STAGING_DIR_TARGET}${libdir} -Wl,-rpath-link,${STAGING_DIR_TARGET}${libdir}"
+PARALLEL_MAKE = ""
+
+PLATFORM ?= "LinuxOMAP3"
+
+do_compile() {
+	export TOOLCHAIN="${TOOLCHAIN_PATH}"
+	export PLAT_CC="${CC}"
+	export PLAT_CPP="${CXX}"
+	export PLAR_AR="${AR}"
+
+	export X11ROOT="${STAGING_DIR_HOST}/usr"
+	mkdir -p ${S}/demos/x11
+	mkdir -p ${S}/trainingcourses/x11
+
+	mkdir -p ${S}/demos/raw
+	mkdir -p ${S}/trainingcourses/raw
+
+	# Rebuild demos
+		for demo in ${S}/GFX_Linux_SDK/OGLES/SDKPackage/Demos/* ; do
+			cd $demo/OGLES/Build/LinuxGeneric
+			oe_runmake Common=1 PLATFORM=${PLATFORM} X11BUILD=1
+			rm $demo/OGLES/Build/${PLATFORM}/Release*/*.o
+
+			install -m 0755 $demo/OGLES/Build/${PLATFORM}/ReleaseX11/* ${S}/demos/x11 || true
+			sed -e s:NAME:$(basename $demo): \
+			    -e s:EXEC:${bindir}/SGX/demos/X11/$(basename $demo/OGLES/Build/${PLATFORM}/ReleaseX11/*): \
+			    ${WORKDIR}/sample.desktop > ${WORKDIR}/$(basename $demo).desktop
+		done
+
+		for demo in ${S}/GFX_Linux_SDK/OGLES2/SDKPackage/Demos/* ; do
+			cd $demo/OGLES2/Build/LinuxGeneric
+			oe_runmake Common=1 PLATFORM=${PLATFORM} X11BUILD=1
+			rm -f $demo/OGLES2/Build/${PLATFORM}/Release*/*.o
+
+			install -m 0755 $demo/OGLES2/Build/${PLATFORM}/ReleaseX11/* ${S}/demos/x11 || true
+			sed -e s:NAME:$(basename $demo): \
+			    -e s:EXEC:${bindir}/SGX/demos/X11/$(basename $demo/OGLES2/Build/${PLATFORM}/ReleaseX11/*): \
+			    ${WORKDIR}/sample.desktop > ${WORKDIR}/$(basename $demo).desktop
+		done
+
+
+	find ${S} -name "*_org" -delete
+
+	# Build OGLES2 Trainingcourses
+		for training in ${S}/GFX_Linux_SDK/OGLES2/SDKPackage/TrainingCourse/* ; do
+			if [ -e $training/OGLES2/Build/LinuxGeneric/Makefile ] ; then
+				cd $training/OGLES2/Build/LinuxGeneric
+			fi
+
+			if [ -e $training/OGLES2/Build/${PLATFORM}/Makefile ] ; then
+				cd $training/OGLES2/Build/${PLATFORM}
+			fi
+
+			oe_runmake Common=1 PLATFORM=${PLATFORM} X11BUILD=1
+			rm -f $training/OGLES2/Build/${PLATFORM}/Release*/*.o
+
+			install -m 0755 $training/OGLES2/Build/${PLATFORM}/ReleaseX11/* ${S}/trainingcourses/x11 || true
+		done
+}
+
+do_install () {
+	install -d ${D}${libdir}
+	cp -pPR ${BINLOCATION}/*.so* ${D}${libdir}
+	install -m 0644 ${BINLOCATION}/*.a ${D}${libdir}
+
+	install -d ${D}${bindir}/
+	install -m 0755 ${WORKDIR}/cputype ${D}${bindir}/
+
+	install -m 0755 ${BINLOCATION}/*_test ${D}${bindir}/
+	install -m 0755 ${BINLOCATION}/gl* ${D}${bindir}/
+	install -m 0755 ${BINLOCATION}/${PVR_INIT} ${D}${bindir}/
+
+	install -m 0755 ${BINLOCATION}/xgles1test1 ${D}${bindir}/
+
+	install -d ${D}${includedir}
+	cp -pPR ${S}/GFX_Linux_KM/include4 ${D}${includedir}/
+	cp -pPR ${S}/GFX_Linux_KM/services4 ${D}${includedir}/
+
+	cp -pPR ${S}/GFX_Linux_SDK/OGLES2/SDKPackage/Builds/OGLES2/Include/* ${D}${includedir}/
+	cp -pPR ${S}/GFX_Linux_SDK/OGLES/SDKPackage/Builds/OGLES/Include/* ${D}${includedir}/
+	cp -pPR ${S}/GFX_Linux_SDK/OGLES/SDKPackage/Builds/OGLES/${PLATFORM}/Include/GLES/* ${D}${includedir}/GLES/ 2>/dev/null || true
+	cp -pPr ${S}/GFX_Linux_SDK/OGLES2/SDKPackage/Builds/OGLES2/${PLATFORM}/Include/GLES/* ${D}${includedir}/GLES2/ 2>/dev/null || true
+	cp -pPr ${S}/include/wsegl/*.h ${D}${includedir} || true
+	
+	install -d ${D}${sysconfdir}/init.d/
+
+	install -d ${D}${sysconfdir}
+	echo "[default]" > ${D}${sysconfdir}/powervr.ini
+	echo "WindowSystem=${LIBGLESWINDOWSYSTEM}" >> ${D}${sysconfdir}/powervr.ini
+
+	# The ES3.x, ES5.x and ES6.x CPUs have different SGX hardware, so we need to install multiple sets of userspace
+
+	install -d ${D}${libdir}/ES8.0
+	install -d ${D}${libdir}/ES6.0
+	install -d ${D}${libdir}/ES5.0
+	install -d ${D}${libdir}/ES3.0
+
+	install -d ${D}${bindir}/ES8.0
+	install -d ${D}${bindir}/ES6.0
+	install -d ${D}${bindir}/ES5.0
+	install -d ${D}${bindir}/ES3.0
+
+	x11_prog="eglinfo_x xgles1test1 xgles2test1 xmultiegltest"
+
+	for esrev in 3 5 6 8 ; do
+		ESLOCATION=$(eval echo $(echo \$\{ES${esrev}LOCATION\}))
+		if [ -e ${ESLOCATION} ] ; then
+			cp -pPR ${ESLOCATION}/lib*${IMGPV} ${ESLOCATION}/pvr_drv.so ${ESLOCATION}/*.a ${D}${libdir}/ES${esrev}.0/
+			for esprog in $x11_prog ; do
+				install -m 0755 ${ESLOCATION}/$esprog ${D}${bindir}/ES${esrev}.0/ 2>/dev/null || true
+			done
+		fi
+	done
+
+	rm ${D}${bindir}/ES*/*.h ${D}${bindir}/ES*/pdsasm ${D}${bindir}/pdsasm -f || true
+
+	install -d ${D}${prefix}/share/applications
+	cp ${WORKDIR}/*.desktop ${D}${prefix}/share/applications
+	rm ${D}${prefix}/share/applications/sample.desktop
+
+	install -d ${D}${bindir}/SGX/demos/X11/
+	install -m 0755 ${S}/demos/x11/* ${D}${bindir}/SGX/demos/X11/
+	install -d ${D}${bindir}/SGX/trainingcourses/X11  2>/dev/null || true
+	install -m 0755 ${S}/trainingcourses/x11/* ${D}${bindir}/SGX/trainingcourses/X11/ 2>/dev/null || true
+
+	# Delete objects and linker scripts hidden between the headers
+	find ${D} -name "*.o" -delete
+	find ${D} -name "*.o.cmd" -delete
+
+	install -d ${D}${sysconfdir}/udev/rules.d
+	install -m 0644 ${WORKDIR}/99-bufferclass.rules ${D}${sysconfdir}/udev/rules.d/
+
+}
+
+PACKAGES =+ "${PN}-x11demos ${PN}-x11trainingcourses xserver-kdrive-powervrsgx"
+
+# Package the base libraries per silicon revision
+PACKAGES =+ "${PN}-es3 ${PN}-es5 ${PN}-es6 ${PN}-es8"
+RRECOMMENDS_${PN} += "${PN}-es3 ${PN}-es5 ${PN}-es6 ${PN}-es8"
+FILES_${PN}-es3 = "${libdir}/ES3*/* ${bindir}/ES3*/*"
+FILES_${PN}-es5 = "${libdir}/ES5*/* ${bindir}/ES5*/*"
+FILES_${PN}-es6 = "${libdir}/ES6*/* ${bindir}/ES6*/*"
+FILES_${PN}-es8 = "${libdir}/ES8*/* ${bindir}/ES8*/*"
+
+# Stop shlib code from picking a subpackage
+PRIVATE_LIBS_${PN}-es3 = "libGLESv2.so libIMGegl.so libsrv_um.so libOpenVG.so libpvr2d.so libsrv_init.so libEGL.so libsrv_um_dri.so libOpenVGU.so libglslcompiler.so libGLES_CM.so"
+PRIVATE_LIBS_${PN}-es5 = "libGLESv2.so libIMGegl.so libsrv_um.so libOpenVG.so libpvr2d.so libsrv_init.so libEGL.so libsrv_um_dri.so libOpenVGU.so libglslcompiler.so libGLES_CM.so"
+PRIVATE_LIBS_${PN}-es6 = "libGLESv2.so libIMGegl.so libsrv_um.so libOpenVG.so libpvr2d.so libsrv_init.so libEGL.so libsrv_um_dri.so libOpenVGU.so libglslcompiler.so libGLES_CM.so"
+PRIVATE_LIBS_${PN}-es8 = "libGLESv2.so libIMGegl.so libsrv_um.so libOpenVG.so libpvr2d.so libsrv_init.so libEGL.so libsrv_um_dri.so libOpenVGU.so libglslcompiler.so libGLES_CM.so"
+
+
+PACKAGES =+ "${PN}-x11wsegl ${PN}-driwsegl"
+FILES_${PN}-x11wsegl = "${libdir}/libpvrPVR2D_X11WSEGL.so* ${bindir}/x* ${bindir}/*x"
+FILES_${PN}-driwsegl = "${libdir}/libpvrPVR2D_DRIWSEGL.so* ${libdir}/libsrv_um_dri*"
+
+X11_SEGL = " ${PN}-x11wsegl-es2 ${PN}-x11wsegl-es3 ${PN}-x11wsegl-es5 ${PN}-x11wsegl-es6 ${PN}-x11wsegl-es8 ${PN}-driwsegl-es2 ${PN}-driwsegl-es3 ${PN}-driwsegl-es5 ${PN}-driwsegl-es6 ${PN}-driwsegl-es8 "
+PACKAGES =+ "${X11_SEGL}"
+FILES_${PN}-x11wsegl-es2 = "${libdir}/ES2*/libpvrPVR2D_X11WSEGL.so.* ${bindir}/ES2*/x* ${bindir}/ES2*/*x"
+FILES_${PN}-x11wsegl-es3 = "${libdir}/ES3*/libpvrPVR2D_X11WSEGL.so.* ${bindir}/ES3*/x* ${bindir}/ES3*/*x"
+FILES_${PN}-x11wsegl-es5 = "${libdir}/ES5*/libpvrPVR2D_X11WSEGL.so.* ${bindir}/ES5*/x* ${bindir}/ES5*/*x"
+FILES_${PN}-x11wsegl-es6 = "${libdir}/ES6*/libpvrPVR2D_X11WSEGL.so.* ${bindir}/ES6*/x* ${bindir}/ES6*/*x"
+FILES_${PN}-x11wsegl-es8 = "${libdir}/ES8*/libpvrPVR2D_X11WSEGL.so.* ${bindir}/ES8*/x* ${bindir}/ES8*/*x"
+RRECOMMENDS_${PN}-x11wsegl = " ${PN}-x11wsegl-es2 ${PN}-x11wsegl-es3 ${PN}-x11wsegl-es5 ${PN}-x11wsegl-es6 ${PN}-x11wsegl-es8"
+
+FILES_${PN}-driwsegl-es2 = "${libdir}/ES2*/libpvrPVR2D_DRIWSEGL.so.* ${libdir}/ES2*/libsrv_um_dri*"
+FILES_${PN}-driwsegl-es3 = "${libdir}/ES3*/libpvrPVR2D_DRIWSEGL.so.* ${libdir}/ES3*/libsrv_um_dri*"
+FILES_${PN}-driwsegl-es5 = "${libdir}/ES5*/libpvrPVR2D_DRIWSEGL.so.* ${libdir}/ES5*/libsrv_um_dri*"
+FILES_${PN}-driwsegl-es6 = "${libdir}/ES6*/libpvrPVR2D_DRIWSEGL.so.* ${libdir}/ES6*/libsrv_um_dri*"
+FILES_${PN}-driwsegl-es8 = "${libdir}/ES8*/libpvrPVR2D_DRIWSEGL.so.* ${libdir}/ES8*/libsrv_um_dri*"
+RRECOMMENDS_${PN}-driwsegl = " ${PN}-driwsegl-es2 ${PN}-driwsegl-es3 ${PN}-driwsegl-es5 ${PN}-driwsegl-es6 ${PN}-driwsegl-es8"
+
+CONFFILES_${PN} = "${sysconfdir}/powervr.ini"
+
+FILES_${PN} = "${sysconfdir} ${libdir}/*.so* ${bindir}/${PVR_INIT} ${bindir}/cputype ${bindir}/*"
+
+FILES_xserver-kdrive-powervrsgx = "${bindir}/Xsgx"
+FILES_${PN}-tests = "${bindir}/*test*"
+FILES_${PN}-dbg = "${libdir}/.debug/* ${bindir}/.debug/* \
+                   ${libdir}/ES*/.debug ${bindir}/*/.debug\
+                   ${bindir}/SGX/demos/*/.debug/* \
+                   ${bindir}/SGX/trainingcourses/*/.debug/* \
+	"
+
+FILES_${PN}-x11demos = "${bindir}/SGX/demos/X11/* ${prefix}/share/applications "
+RRECOMMENDS_${PN}-x11demos = "${PN}-x11wsegl"
+
+FILES_${PN}-x11trainingcourses = "${bindir}/SGX/trainingcourses/X11/*"
+RRECOMMENDS_${PN}-x11trainingcourses = "${PN}-x11wsegl"
+
+# The libs need the kernel-modules
+RRECOMMENDS_${PN} += "omap3-sgx-modules-x11"
+
+# The initscript calls fbset, cputype calls devmem2
+RDEPENDS_${PN} += "fbset devmem2"
+
+#HACK! These are binaries, so we can't guarantee that LDFLAGS match :(
+INSANE_SKIP_${PN} = "ldflags dev-so"
+INSANE_SKIP_${PN}-es3 = "ldflags dev-so staticdev"
+INSANE_SKIP_${PN}-es5 = "ldflags dev-so staticdev"
+INSANE_SKIP_${PN}-es6 = "ldflags dev-so staticdev"
+INSANE_SKIP_${PN}-es8 = "ldflags dev-so staticdev"
+INSANE_SKIP_${PN}-x11demos = "ldflags dev-so useless-rpaths"
+INSANE_SKIP_${PN}-x11wsegl = "ldflags dev-so"
+INSANE_SKIP_${PN}-x11wsegl-es3 = "ldflags dev-so"
+INSANE_SKIP_${PN}-x11wsegl-es5 = "ldflags dev-so"
+INSANE_SKIP_${PN}-x11wsegl-es6 = "ldflags dev-so"
+INSANE_SKIP_${PN}-x11wsegl-es8 = "ldflags dev-so"
+INSANE_SKIP_${PN}-driwsegl = "ldflags dev-so"
+INSANE_SKIP_${PN}-driwsegl-es3 = "ldflags dev-so"
+INSANE_SKIP_${PN}-driwsegl-es5 = "ldflags dev-so"
+INSANE_SKIP_${PN}-driwsegl-es6 = "ldflags dev-so"
+INSANE_SKIP_${PN}-driwsegl-es8 = "ldflags dev-so"
+INSANE_SKIP_${PN}-tests = "ldflags"
+INSANE_SKIP_xserver-kdrive-powervrsgx = "ldflags"
+INSANE_SKIP_${PN}-dev = "ldflags dev-so"
+
+inherit update-rc.d
+
+INITSCRIPT_NAME = "pvr-init"
+INITSCRIPT_PARAMS = "start 30 5 2 . stop 40 0 1 6 ."
+
+# Append to update-rc.d postinst
+pkg_postinst_${PN}_append() {
+rm -f $D${sysconfdir}/powervr-esrev
+
+ln -sf /usr/lib/libXdmcp.so.6.0.0 /usr/lib/libXdmcp.so.0
+ln -sf /usr/lib/libXau.so.6.0.0 /usr/lib/libXau.so.0
+
+
+}
+
+pkg_postinst_${PN}-x11wsegl() {
+rm -f $D${sysconfdir}/powervr-esrev
+
+echo "[default]" > $D${sysconfdir}/powervr.ini
+echo "WindowSystem=libpvrPVR2D_X11WSEGL.so.1" >> $D${sysconfdir}/powervr.ini
+}
+
+pkg_postinst_${PN}-driwsegl() {
+rm -f $D${sysconfdir}/powervr-esrev
+}
+
+
-- 
1.7.1


