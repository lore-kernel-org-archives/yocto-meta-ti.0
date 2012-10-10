Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f176.google.com (mail-ob0-f176.google.com
	[209.85.214.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0207BE0070B
	for <meta-ti@yoctoproject.org>; Tue,  9 Oct 2012 20:58:23 -0700 (PDT)
Received: by mail-ob0-f176.google.com with SMTP id x4so97066obh.35
	for <meta-ti@yoctoproject.org>; Tue, 09 Oct 2012 20:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=VI8dF1FEFrxlDBhKL/EwVnc2XmYz5ltzABPGEUvTcoM=;
	b=kZ2v3E/8OaX43/PAulixlkFuQIOU7Z8sfl2C7vdobJ0Vo3BCSnOe5VLPfAaoet+hnk
	GKHkFwiJNcl/kz9eBZwI4Anl3nOogF05BobVnEnqwxdsyF79A4niDpacnoAWdgKjAOo4
	+C/+/ysvShuo7go3uswH0JIRyOsOjV1xTYfnqHGPOvmxJEfGeOKTrgxlseiw4E2Q10OO
	TUsbkfz4saEDa+KVLezJC4lXsOPv5HPtDybDOGzWC+WVEA52FN6LCICDEYdhe/vYiYbt
	8rpPMvgyCAdmTuyotBr9RCwwuRHj8J6DwbYOiqWcgKmIWRuDG1NjiyE28RZme6TdpDrQ
	BZgQ==
Received: by 10.60.19.37 with SMTP id b5mr18385003oee.16.1349841501447;
	Tue, 09 Oct 2012 20:58:21 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id f4sm252726obb.3.2012.10.09.20.58.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 09 Oct 2012 20:58:20 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-ti@yoctoproject.org
Date: Tue,  9 Oct 2012 23:28:23 -0500
Message-Id: <1349843304-18507-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH 1/2][for-comments] libgles-omap3: Add updated Graphics SDK
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
X-List-Received-Date: Wed, 10 Oct 2012 03:58:24 -0000

* Add version v4.08.00.01 of the Graphics SDK.
* Add X11 support via DRI/DRM Xorg driver
* Replace pvrsrvinit with pvrsrvctl (Imagination Technologies based change)

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../libgles/libgles-omap3-4.08.00.01/rc.pvr        |  124 ++++++++++++++++++
 .../libgles/libgles-omap3-4.08.00.01/rc_dri.pvr    |  136 ++++++++++++++++++++
 .../libgles/libgles-omap3_4.08.00.01.bb            |   74 +++++++++++
 3 files changed, 334 insertions(+), 0 deletions(-)
 create mode 100755 recipes-graphics/libgles/libgles-omap3-4.08.00.01/rc.pvr
 create mode 100755 recipes-graphics/libgles/libgles-omap3-4.08.00.01/rc_dri.pvr
 create mode 100644 recipes-graphics/libgles/libgles-omap3_4.08.00.01.bb

diff --git a/recipes-graphics/libgles/libgles-omap3-4.08.00.01/rc.pvr b/recipes-graphics/libgles/libgles-omap3-4.08.00.01/rc.pvr
new file mode 100755
index 0000000..7b5cefa
--- /dev/null
+++ b/recipes-graphics/libgles/libgles-omap3-4.08.00.01/rc.pvr
@@ -0,0 +1,124 @@
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
diff --git a/recipes-graphics/libgles/libgles-omap3-4.08.00.01/rc_dri.pvr b/recipes-graphics/libgles/libgles-omap3-4.08.00.01/rc_dri.pvr
new file mode 100755
index 0000000..dd1e942
--- /dev/null
+++ b/recipes-graphics/libgles/libgles-omap3-4.08.00.01/rc_dri.pvr
@@ -0,0 +1,136 @@
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
diff --git a/recipes-graphics/libgles/libgles-omap3_4.08.00.01.bb b/recipes-graphics/libgles/libgles-omap3_4.08.00.01.bb
new file mode 100644
index 0000000..5a82e68
--- /dev/null
+++ b/recipes-graphics/libgles/libgles-omap3_4.08.00.01.bb
@@ -0,0 +1,74 @@
+require libgles-omap3.inc
+
+DEFAULT_PREFERENCE = "-1"
+
+BINLOCATION_omap3  = "${S}/gfx_rel_es3.x"
+BINLOCATION_ti816x = "${S}/gfx_rel_es6.x"
+BINLOCATION_ti814x = "${S}/gfx_rel_es6.x"
+BINLOCATION_ti33x = "${S}/gfx_rel_es8.x"
+
+PLATFORM = "LinuxARMV7"
+PVR_INIT = "pvrsrvctl"
+
+# download required binary distribution from:
+# http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/latest/index_FDS.html
+# see libgles-omap3.inc for detailed installation instructions
+gedit 
+SGXPV = "4_08_00_01"
+IMGPV = "1.7.867897"
+BINFILE = "Graphics_SDK_setuplinux_${SGXPV}.bin"
+TI_BIN_UNPK_WDEXT := "/Graphics_SDK_${SGXPV}"
+SRC_URI = "<ti-internal-url>/Graphics_SDK_setuplinux_4_08_00_01.bin \
+           file://cputype \
+           file://rc.pvr \
+           file://rc_dri.pvr \
+           file://sample.desktop \
+           file://99-bufferclass.rules  \
+"
+
+SRC_URI[md5sum] = "95b8f02923d6ea52ea104fa3d93ce1f0"
+SRC_URI[sha256sum] = "1db2d46ec3c6a97db146357841e02a95a15be658c2297dc571e6e61b32238561"
+
+S = "${WORKDIR}/Graphics_SDK_${SGXPV}"
+
+LIBGLESWINDOWSYSTEM ?= "${@base_contains('DISTRO_FEATURES', 'x11',"libpvrPVR2D_DRIWSEGL.so" ,"libpvrPVR2D_FRONTWSEGL.so.1", d)}"
+
+do_configure_append() {
+
+	# Change PVR server's user mode library to point to DRI
+	for drifile in $(find ${S} -name "libsrv_um_dri.so"); do
+	if [ "$drifile" != "" ]
+	then
+		dir=$(dirname ${drifile})
+		if [ "$SUPPORT_XORG" = "1" ]
+		then
+		    mv ${dir}/libsrv_um_dri.so ${dir}/libsrv_um.so
+		else
+		    rm -rf ${dir}/libsrv_um_dri.so
+		fi
+	fi
+
+	done
+}
+
+do_install_append() {
+
+    # In this version of the graphics SDK the following directories do not exist:
+    #    /GFX_Linux_SDK/OGLES/SDKPackage/Builds/OGLES/Include/pvr2d.h (doesn't exist)
+    #    /GFX_Linux_SDK/OGLES/SDKPackage/Builds/OGLES/Include/GLES/egltypes.h (doesn't exist)
+    # Therefore, need to copy these files manually at the only location that they do exist
+    cp -pPr ${S}/include/pvr2d/*.h ${D}${includedir} || true
+    cp -pPr ${S}/include/OGLES/GLES ${D}${includedir}/ || true
+
+    rm ${D}${sysconfdir}/init.d/pvr-init
+
+    if [ "$SUPPORT_XORG" = "1" ]; then
+	    cp -pP ${WORKDIR}/rc_dri.pvr ${D}${sysconfdir}/init.d/pvr-init
+	else
+	    cp -pP ${WORKDIR}/rc.pvr ${D}${sysconfdir}/init.d/pvr-init
+	fi
+
+}
+
+RRECOMMENDS_${PN}-x11demos = "${PN}-driwsegl"
+RRECOMMENDS_${PN}-x11trainingcourses = "${PN}-driwsegl"
-- 
1.7.0.4


