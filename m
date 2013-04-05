Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EC1B2E0146D
	for <meta-ti@yoctoproject.org>; Fri,  5 Apr 2013 11:28:49 -0700 (PDT)
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r35ISlNd007814
	for <meta-ti@yoctoproject.org>; Fri, 5 Apr 2013 13:28:48 -0500
Received: from DBDE70.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id r35ISjR3015178
	for <meta-ti@yoctoproject.org>; Fri, 5 Apr 2013 23:58:46 +0530 (IST)
Received: from dbdp32.itg.ti.com (172.24.170.251) by dbde70.ent.ti.com
	(172.24.170.148) with Microsoft SMTP Server id 14.1.323.3;
	Fri, 5 Apr 2013 23:58:45 +0530
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dbdp32.itg.ti.com (8.13.8/8.13.8) with ESMTP id r35ISgrn016328;
	Fri, 5 Apr 2013 23:58:44 +0530
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 5 Apr 2013 13:28:40 -0500
Message-ID: <1365186520-29744-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH] ti-graphics: Add latest 4.09.00.01 version
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
X-List-Received-Date: Fri, 05 Apr 2013 18:28:50 -0000
Content-Type: text/plain

* Add the latest 4.09.00.01 version of the graphis SDK.  This
  version will compile against the latest v3.8 kernel.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 .../omap3-sgx-modules_4.09.00.01.bb                |   56 ++++++++
 .../libgles/libgles-omap3-4.09.00.01/rc.pvr        |  124 ++++++++++++++++++
 .../libgles/libgles-omap3-4.09.00.01/rc_dri.pvr    |  136 ++++++++++++++++++++
 .../libgles/libgles-omap3_4.09.00.01.bb            |   75 +++++++++++
 4 files changed, 391 insertions(+), 0 deletions(-)
 create mode 100644 recipes-bsp/powervr-drivers/omap3-sgx-modules_4.09.00.01.bb
 create mode 100755 recipes-graphics/libgles/libgles-omap3-4.09.00.01/rc.pvr
 create mode 100755 recipes-graphics/libgles/libgles-omap3-4.09.00.01/rc_dri.pvr
 create mode 100644 recipes-graphics/libgles/libgles-omap3_4.09.00.01.bb

diff --git a/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.09.00.01.bb b/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.09.00.01.bb
new file mode 100644
index 0000000..55e427f
--- /dev/null
+++ b/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.09.00.01.bb
@@ -0,0 +1,56 @@
+DESCRIPTION = "Kernel drivers for the PowerVR SGX chipset found in the omap3 SoCs"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=ea5743acf520dd81ca172e69f818a3d4"
+
+TI_BIN_UNPK_CMDS="Y: qY:workdir:Y"
+require ../../recipes-ti/includes/ti-eula-unpack.inc
+
+SGXPV = "4_09_00_01"
+IMGPV = "1.9.2188537"
+BINFILE = "Graphics_SDK_setuplinux_${SGXPV}_minimal_demos.bin"
+
+inherit module
+
+MACHINE_KERNEL_PR_append = "a"
+PR = "${MACHINE_KERNEL_PR}"
+
+DEFAULT_PREFERENCE = "-1"
+
+SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/${SGXPV}/exports/${BINFILE}"
+
+SRC_URI[md5sum] = "bd35e9d8843aff3a2aca9d41e7db1c7d"
+SRC_URI[sha256sum] = "eb37f75ddde4640b09e760fa86e689beb394330ecdf68786188c34f249247647"
+
+TI_BIN_UNPK_WDEXT="/Graphics_SDK_${SGXPV}"
+S = "${WORKDIR}${TI_BIN_UNPK_WDEXT}/GFX_Linux_KM"
+
+PVRBUILD = "release"
+export KERNELDIR = "${STAGING_KERNEL_DIR}"
+
+INHIBIT_PACKAGE_STRIP = "1"
+
+TI_PLATFORM_omap3 = "omap3630"
+TI_PLATFORM_ti814x = "ti81xx"
+TI_PLATFORM_ti816x = "ti81xx"
+TI_PLATFORM_ti33x = "ti335x"
+
+MODULESLOCATION_omap3 = "dc_omapfb3_linux"
+MODULESLOCATION_ti814x = "dc_ti81xx_linux"
+MODULESLOCATION_ti816x = "dc_ti81xx_linux"
+MODULESLOCATION_ti33x = "dc_ti335x_linux"
+
+export SUPPORT_XORG ?= "${@base_contains('DISTRO_FEATURES', 'x11', '1', '0', d)}"
+
+MAKE_TARGETS = " BUILD=${PVRBUILD} TI_PLATFORM=${TI_PLATFORM} SUPPORT_XORG=${SUPPORT_XORG}"
+
+do_install() {
+    mkdir -p ${D}/lib/modules/${KERNEL_VERSION}/kernel/drivers/gpu/pvr
+    cp  ${S}/pvrsrvkm.ko \
+        ${S}/services4/3rdparty/${MODULESLOCATION}/omaplfb.ko  \
+        ${S}/services4/3rdparty/bufferclass_ti/bufferclass_ti.ko \
+        ${D}/lib/modules/${KERNEL_VERSION}/kernel/drivers/gpu/pvr
+
+    if [ "${SUPPORT_XORG}" = "1" ]; then
+        cp ${S}/services4/3rdparty/linux_drm/drm.ko ${D}/lib/modules/${KERNEL_VERSION}/kernel/drivers/gpu/pvr
+    fi
+}
diff --git a/recipes-graphics/libgles/libgles-omap3-4.09.00.01/rc.pvr b/recipes-graphics/libgles/libgles-omap3-4.09.00.01/rc.pvr
new file mode 100755
index 0000000..7b5cefa
--- /dev/null
+++ b/recipes-graphics/libgles/libgles-omap3-4.09.00.01/rc.pvr
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
diff --git a/recipes-graphics/libgles/libgles-omap3-4.09.00.01/rc_dri.pvr b/recipes-graphics/libgles/libgles-omap3-4.09.00.01/rc_dri.pvr
new file mode 100755
index 0000000..dd1e942
--- /dev/null
+++ b/recipes-graphics/libgles/libgles-omap3-4.09.00.01/rc_dri.pvr
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
diff --git a/recipes-graphics/libgles/libgles-omap3_4.09.00.01.bb b/recipes-graphics/libgles/libgles-omap3_4.09.00.01.bb
new file mode 100644
index 0000000..7c6f231
--- /dev/null
+++ b/recipes-graphics/libgles/libgles-omap3_4.09.00.01.bb
@@ -0,0 +1,75 @@
+require libgles-omap3.inc
+
+LICENSE = "TSPA"
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
+
+SGXPV = "4_09_00_01"
+IMGPV = "1.9.2188537"
+BINFILE = "Graphics_SDK_setuplinux_${SGXPV}_minimal_demos.bin"
+TI_BIN_UNPK_WDEXT := "/Graphics_SDK_${SGXPV}"
+SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/${SGXPV}/exports/${BINFILE} \
+           file://cputype \
+           file://rc.pvr \
+           file://rc_dri.pvr \
+           file://sample.desktop \
+           file://99-bufferclass.rules  \
+"
+SRC_URI[md5sum] = "bd35e9d8843aff3a2aca9d41e7db1c7d"
+SRC_URI[sha256sum] = "eb37f75ddde4640b09e760fa86e689beb394330ecdf68786188c34f249247647"
+
+S = "${WORKDIR}/Graphics_SDK_${SGXPV}"
+
+LIBGLESWINDOWSYSTEM ?= "${@base_contains('DISTRO_FEATURES', 'x11',"libpvrPVR2D_DRIWSEGL.so" ,"libpvrPVR2D_FRONTWSEGL.so.1", d)}"
+
+do_configure_append() {
+
+    # Change PVR server's user mode library to point to DRI
+    for drifile in $(find ${S} -name "libsrv_um_dri.so"); do
+    if [ "$drifile" != "" ]
+    then
+        dir=$(dirname ${drifile})
+        if [ "$SUPPORT_XORG" = "1" ]
+        then
+            mv ${dir}/libsrv_um_dri.so ${dir}/libsrv_um.so
+        else
+            rm -rf ${dir}/libsrv_um_dri.so
+        fi
+    fi
+
+    done
+}
+
+do_install_append() {
+
+    # In this version of the graphics SDK the following directories do not exist:
+    #    /GFX_Linux_SDK/OGLES/SDKPackage/Builds/OGLES/Include/pvr2d.h (doesn't exist)
+    #    /GFX_Linux_SDK/OGLES/SDKPackage/Builds/OGLES/Include/GLES/egltypes.h (doesn't exist)
+    # Therefore, need to copy these files manually at the only location that they do exist
+    cp -pPr ${S}/include/pvr2d/*.h ${D}${includedir}
+    cp -pPr ${S}/include/OGLES/GLES ${D}${includedir}/
+
+    rm ${D}${sysconfdir}/init.d/pvr-init
+
+    if [ "$SUPPORT_XORG" = "1" ]; then
+        cp -pP ${WORKDIR}/rc_dri.pvr ${D}${sysconfdir}/init.d/pvr-init
+    else
+        cp -pP ${WORKDIR}/rc.pvr ${D}${sysconfdir}/init.d/pvr-init
+    fi
+
+}
+
+RRECOMMENDS_${PN}-x11demos = "${PN}-driwsegl"
+RRECOMMENDS_${PN}-x11trainingcourses = "${PN}-driwsegl"
-- 
1.7.0.4


