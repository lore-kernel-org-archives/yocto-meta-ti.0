Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 061AAE006D9
	for <meta-ti@yoctoproject.org>; Thu, 21 Nov 2013 19:03:53 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 92CE7529BF; Fri, 22 Nov 2013 03:03:52 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20131122030352.92CE7529BF@arago-project.org>
Date: Fri, 22 Nov 2013 03:03:52 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : libgles-omap3: add new Graphics SDK 5.00.00. 01 alpha release
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
X-List-Received-Date: Fri, 22 Nov 2013 03:03:53 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: dylan
Commit: 802c10bc65bfb49df78fd1881f52a472cca42fbb
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=802c10bc65bfb49df78fd1881f52a472cca42fbb

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Thu Nov 21 20:53:50 2013 -0500

libgles-omap3: add new Graphics SDK 5.00.00.01 alpha release

* Adds initial support for AM43x platform
* Supports 3.12 kernel for AM335x and AM43x

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../libgles/libgles-omap3-5.00.00.01/rc.pvr        |  134 ++++++++++++++++++
 .../libgles/libgles-omap3-5.00.00.01/rc_dri.pvr    |  145 ++++++++++++++++++++
 .../libgles/libgles-omap3_5.00.00.01.bb            |   52 +++++++
 3 files changed, 331 insertions(+), 0 deletions(-)

diff --git a/recipes-graphics/libgles/libgles-omap3-5.00.00.01/rc.pvr b/recipes-graphics/libgles/libgles-omap3-5.00.00.01/rc.pvr
new file mode 100755
index 0000000..132749a
--- /dev/null
+++ b/recipes-graphics/libgles/libgles-omap3-5.00.00.01/rc.pvr
@@ -0,0 +1,134 @@
+#!/bin/sh
+PATH=$PATH:/usr/sbin
+
+# Check if an fb device is available.  If not then just go ahead and
+# exit because we have no display.
+fbset > /dev/null 2>&1
+if [ "$?" == "1" ]
+then
+	# looks like there is no display, so let's exit
+	exit 0
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
+
+	lsmod | grep pvrsrvkm > /dev/null
+
+	if [ "$?" != "0" ]
+	then
+		insmod $(busybox find /lib/modules/$(uname -r) -name "pvrsrvkm.ko")
+
+		if [ "$?" != "0" ]
+		then
+			echo "Could not find pvrsrvkm driver"
+			exit 1
+		fi
+	fi
+
+	modprobe omaplfb
+	modprobe bufferclass_ti
+
+	pvr_maj=`grep "pvrsrvkm$" /proc/devices | cut -b1,2,3`
+	bc_maj=`grep "bc" /proc/devices | cut -b1,2,3`
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
+	ES_REVISION="$(devmem2 0x56000014 | sed -e s:0x00010205:8: | tail -n1 | awk -F': ' '{print $2}')"
+
+	sgxfinish
+	;;
+"TI43XX")
+	sgxprepare
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
diff --git a/recipes-graphics/libgles/libgles-omap3-5.00.00.01/rc_dri.pvr b/recipes-graphics/libgles/libgles-omap3-5.00.00.01/rc_dri.pvr
new file mode 100755
index 0000000..9b75aaf
--- /dev/null
+++ b/recipes-graphics/libgles/libgles-omap3-5.00.00.01/rc_dri.pvr
@@ -0,0 +1,145 @@
+#!/bin/sh
+PATH=$PATH:/usr/sbin
+
+# Check if an fb device is available.  If not then just go ahead and
+# exit because we have no display.
+fbset > /dev/null 2>&1
+if [ "$?" == "1" ]
+then
+	# looks like there is no display, so let's exit
+	exit 0
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
+	rmmod drm 2>/dev/null
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
+	lsmod | grep pvrsrvkm > /dev/null
+
+	if [ "$?" != "0" ]
+	then
+		insmod $(busybox find /lib/modules/$(uname -r) -name "pvrsrvkm.ko")
+
+		if [ "$?" != "0" ]
+		then
+			echo "Could not find pvrsrvkm driver"
+			exit 1
+		fi
+	fi
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
+	ES_REVISION="$(devmem2 0x56000014 | sed -e s:0x00010205:8: | tail -n1 | awk -F': ' '{print $2}')"
+
+	sgxfinish
+	;;
+"TI43XX")
+	sgxprepare
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
diff --git a/recipes-graphics/libgles/libgles-omap3_5.00.00.01.bb b/recipes-graphics/libgles/libgles-omap3_5.00.00.01.bb
new file mode 100644
index 0000000..be09ffa
--- /dev/null
+++ b/recipes-graphics/libgles/libgles-omap3_5.00.00.01.bb
@@ -0,0 +1,52 @@
+require libgles-omap3-no-x.inc
+
+LICENSE = "TSPA"
+
+PR = "${INC_PR}.0"
+
+DEFAULT_PREFERENCE = "-1"
+
+BINLOCATION_omap3 = "${S}/gfx_rel_es3.x"
+BINLOCATION_ti816x = "${S}/gfx_rel_es6.x"
+BINLOCATION_ti814x = "${S}/gfx_rel_es6.x"
+BINLOCATION_ti33x = "${S}/gfx_rel_es8.x"
+BINLOCATION_ti43x = "${S}/gfx_rel_es9.x"
+
+PLATFORM = "LinuxARMV7"
+PVR_INIT = "pvrsrvctl"
+
+SGXPV = "5_00_00_01"
+IMGPV = "1.10.2359475"
+
+TI_BIN_UNPK_WDEXT := "/Graphics_SDK_${SGXPV}"
+
+BINFILE_HARDFP = "Graphics_SDK_setuplinux_${SGXPV}_alpha_hardfp_minimal_demos.bin"
+MD5SUM_HARDFP = "ae6125d7f8a313ea5c02afded893052d"
+SHA256SUM_HARDFP = "c2782a2f85024741722b936ec9dca66b858ae8561aa71b693f11e12d8c0385e0"
+
+# For now we only have hardfp version
+python __anonymous() {
+    tunes = bb.data.getVar("TUNE_FEATURES", d, 1)
+    if not tunes:
+        return
+    pkgn = bb.data.getVar("PN", d, 1)
+    pkgv = bb.data.getVar("PV", d, 1)
+    if "callconvention-hard" not in tunes:
+        bb.warn("%s-%s ONLY supports hardfp mode for now" % (pkgn, pkgv))
+        raise bb.parse.SkipPackage("%s-%s ONLY supports hardfp mode for now" % (pkgn, pkgv))
+}
+
+BINFILE := "${BINFILE_HARDFP}"
+
+SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/gfxsdk/${SGXPV}/exports/${BINFILE} \
+           file://cputype \
+           file://rc.pvr \
+           file://99-bufferclass.rules  \
+"
+
+SRC_URI[md5sum] := "${MD5SUM_HARDFP}"
+SRC_URI[sha256sum] := "${SHA256SUM_HARDFP}"
+
+S = "${WORKDIR}/Graphics_SDK_${SGXPV}"
+
+LIBGLESWINDOWSYSTEM ?= "libpvrPVR2D_FRONTWSEGL.so.1"


