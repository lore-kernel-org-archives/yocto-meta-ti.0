Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EF317E002AB
	for <meta-ti@yoctoproject.org>; Tue,  9 Oct 2012 21:39:31 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id q9A4dU6N007122;
	Tue, 9 Oct 2012 23:39:30 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q9A4dUTF022844;
	Tue, 9 Oct 2012 23:39:30 -0500
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DFLE73.ent.ti.com ([fe80::86e:fab6:cd95:e158%28]) with mapi id
	14.01.0323.003; Tue, 9 Oct 2012 23:39:30 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>,
	"meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Thread-Topic: [PATCH 1/2][for-comments] libgles-omap3: Add updated Graphics SDK
Thread-Index: AQHNppt++eqHnag/UUmbH1PrMMukXpex6fkw
Date: Wed, 10 Oct 2012 04:39:29 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C30075E@DFLE09.ent.ti.com>
References: <1349843304-18507-1-git-send-email-fcooper@ti.com>
In-Reply-To: <1349843304-18507-1-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH 1/2][for-comments] libgles-omap3: Add updated Graphics SDK
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
X-List-Received-Date: Wed, 10 Oct 2012 04:39:32 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I am currently working on a recipe for the beta version of the next Graphic=
s SDK release and I want initial feedback. Right now these recipes will not=
 work since I need to work with our graphics team to provide an externally =
accessible url  to the Graphics SDK. Once I get a link, I will send a v2 pa=
tch that will allow everyone to be able to actually build these recipes.=20

This version of the Graphics SDK  no longer uses pvrsrvinit but uses pvrsrv=
ctl instead. This is why I created a new rc.pvr file that incorporates that=
 change.

The biggest change is the switch to the DRI/DRM Xorg driver for X11 distros=
. This switch is something that will eventually be made but I understand th=
ere are things that need to be tweaked or fixed to ensure X11 distros will =
work properly with this switch. I also created a rc_dri.pvr file which has =
a minor tweak to use the DRI/DRM driver. The DEFAULT_PREFERENCE is currentl=
y set to -1 for this recipe and the matching omap3-sgx-modules recipe. My f=
ocus is on the Arago distribution, which is an non X11 based distro. This m=
eans I will need the community's help to insure everything is ok for X11 di=
stros.

Feedback is appreciated and if there are any questions or concerns please l=
et me know.

Release notes for this beta SDK release can be found here: http://processor=
s.wiki.ti.com/index.php/RN_4_08_00_01

-----Original Message-----
From: Franklin S. Cooper Jr [mailto:fcooperjr27@gmail.com]=20
Sent: Tuesday, October 09, 2012 11:28 PM
To: meta-ti@yoctoproject.org
Cc: Cooper Jr., Franklin
Subject: [PATCH 1/2][for-comments] libgles-omap3: Add updated Graphics SDK

* Add version v4.08.00.01 of the Graphics SDK.
* Add X11 support via DRI/DRM Xorg driver
* Replace pvrsrvinit with pvrsrvctl (Imagination Technologies based change)

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../libgles/libgles-omap3-4.08.00.01/rc.pvr        |  124 ++++++++++++++++=
++
 .../libgles/libgles-omap3-4.08.00.01/rc_dri.pvr    |  136 ++++++++++++++++=
++++
 .../libgles/libgles-omap3_4.08.00.01.bb            |   74 +++++++++++
 3 files changed, 334 insertions(+), 0 deletions(-)  create mode 100755 rec=
ipes-graphics/libgles/libgles-omap3-4.08.00.01/rc.pvr
 create mode 100755 recipes-graphics/libgles/libgles-omap3-4.08.00.01/rc_dr=
i.pvr
 create mode 100644 recipes-graphics/libgles/libgles-omap3_4.08.00.01.bb

diff --git a/recipes-graphics/libgles/libgles-omap3-4.08.00.01/rc.pvr b/rec=
ipes-graphics/libgles/libgles-omap3-4.08.00.01/rc.pvr
new file mode 100755
index 0000000..7b5cefa
--- /dev/null
+++ b/recipes-graphics/libgles/libgles-omap3-4.08.00.01/rc.pvr
@@ -0,0 +1,124 @@
+#!/bin/sh
+PATH=3D$PATH:/usr/sbin
+
+# Check if an fb device is available.  If not then just go ahead and #=20
+exit because we have no display.
+fbset > /dev/null 2>&1
+if [ "$?" =3D=3D "1" ]
+then
+    # looks like there is no display, so let's exit
+    exit 0
+fi
+
+BITSPERPIXEL=3D"$(fbset | grep geom | awk '{print $6}')"
+YRES=3D"$(fbset | grep geom | awk '{print $3}')"
+
+CPUTYPE=3D"$(cputype)"
+
+if [ "$1" =3D "" ]; then
+	echo PVR-INIT: Please use start, stop, or restart.
+	exit 1
+fi
+
+if [ "$1" =3D "stop" -o  "$1" =3D "restart" ]; then
+	echo Stopping PVR
+	rmmod bufferclass_ti
+	rmmod omaplfb 2>/dev/null
+	rmmod pvrsrvkm 2>/dev/null
+fi
+
+if [ "$1" =3D "stop" ]; then
+	exit 0
+fi
+
+# Set RGBA ordering to something the drivers like if [ "$BITSPERPIXEL"=20
+=3D "32" ] ; then
+	fbset -rgba 8/16,8/8,8/0,8/24
+fi
+
+# Try to enable triple buffering when there's enough VRAM fbset -vyres=20
+$(expr $YRES \* 3)
+
+sgxprepare () {
+	echo Starting PVR
+	insmod $(busybox find /lib/modules/$(uname -r) -name "pvrsrvkm.ko")
+
+    if [ "$?" !=3D "0" ]
+    then
+        echo "Could not find pvrsrvkm driver"
+        exit 1
+    fi
+
+	modprobe omaplfb
+	modprobe bufferclass_ti
+
+	pvr_maj=3D`grep "pvrsrvkm$" /proc/devices | cut -b1,2,3`
+        bc_maj=3D`grep "bc" /proc/devices | cut -b1,2,3`
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
+	SAVED_ESREVISION=3D"$(cat /etc/powervr-esrev)"
+}
+
+sgxfinish () {
+	# Fix up a bug in opkg
+	if [ $(readlink /usr/lib/libsrv_um.so) !=3D $(readlink /usr/lib/libsrv_um=
.so.1) ] ; then
+		cd /usr/lib
+		ln -sf $(readlink /usr/lib/libsrv_um.so.1) libsrv_um.so
+	fi
+
+	if [ "${ES_REVISION}" !=3D "${SAVED_ESREVISION}" ] ; then
+		echo -n "Starting SGX fixup for"
+		echo " ES${ES_REVISION}.x"
+		cp -a /usr/lib/ES${ES_REVISION}.0/* /usr/lib
+		cp -a /usr/bin/ES${ES_REVISION}.0/* /usr/bin
+		echo "${ES_REVISION}" > /etc/powervr-esrev
+	fi
+
+	if ! /usr/bin/pvrsrvctl --start --no-module; then return; fi }
+
+case $CPUTYPE in
+"OMAP3530")
+	sgxprepare
+
+	devmem2 0x48004B48 w 0x2 > /dev/null
+	devmem2 0x48004B10 w 0x1 > /dev/null
+	devmem2 0x48004B00 w 0x2 > /dev/null
+
+	ES_REVISION=3D"$(devmem2 0x50000014 | sed -e s:0x00010205:5: -e s:0x00010=
201:3: -e s:0x00010003:2: | tail -n1 | awk -F': ' '{print $2}')"
+
+	sgxfinish
+	;;
+"TI33XX")
+	sgxprepare
+
+	devmem2 0x44e01104 w 0x0 > /dev/null
+	devmem2 0x44e00904 w 0x2 > /dev/null
+
+	ES_REVISION=3D"$(devmem2 0x56000014 | sed -e s:0x00010205:8: | tail -n1 |=
 awk -F': ' '{print $2}')"
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
+	ES_REVISION=3D"$(devmem2 0x56000014 | sed -e s:0x00010205:6: -e s:0x00010=
201:3: -e s:0x00010003:2: | tail -n1 | awk -F': ' '{print $2}')"
+
+	sgxfinish
+	;;
+*)
+	echo No SGX hardware, not starting PVR
+	;;
+esac
diff --git a/recipes-graphics/libgles/libgles-omap3-4.08.00.01/rc_dri.pvr b=
/recipes-graphics/libgles/libgles-omap3-4.08.00.01/rc_dri.pvr
new file mode 100755
index 0000000..dd1e942
--- /dev/null
+++ b/recipes-graphics/libgles/libgles-omap3-4.08.00.01/rc_dri.pvr
@@ -0,0 +1,136 @@
+#!/bin/sh
+PATH=3D$PATH:/usr/sbin
+
+# Check if an fb device is available.  If not then just go ahead and #=20
+exit because we have no display.
+fbset > /dev/null 2>&1
+if [ "$?" =3D=3D "1" ]
+then
+    # looks like there is no display, so let's exit
+    exit 0
+fi
+
+BITSPERPIXEL=3D"$(fbset | grep geom | awk '{print $6}')"
+YRES=3D"$(fbset | grep geom | awk '{print $3}')"
+
+CPUTYPE=3D"$(cputype)"
+
+if [ "$1" =3D "" ]; then
+	echo PVR-INIT: Please use start, stop, or restart.
+	exit 1
+fi
+
+if [ "$1" =3D "stop" -o  "$1" =3D "restart" ]; then
+	echo Stopping PVR
+
+	# Stop the X Server.
+	#
+	[ -f /tmp/.X0-lock ] && read XPID < /tmp/.X0-lock && [ -n "$XPID" ] &&=20
+kill $XPID && while [ -e /proc/$XPID ] ; do sleep 1; done
+
+	rmmod bufferclass_ti
+	rmmod pvrsrvkm 2>/dev/null
+    rmmod drm 2>/dev/null
+fi
+
+if [ "$1" =3D "stop" ]; then
+	exit 0
+fi
+
+# Set RGBA ordering to something the drivers like if [ "$BITSPERPIXEL"=20
+=3D "32" ] ; then
+	fbset -rgba 8/16,8/8,8/0,8/24
+fi
+
+# Try to enable triple buffering when there's enough VRAM fbset -vyres=20
+$(expr $YRES \* 3)
+
+sgxprepare () {
+	echo Starting PVR
+
+	# Start the X Server.=20
+	# The X Server will load the PVR Services module.
+	#
+	/usr/local/XSGX/bin/X -verbose -config /usr/local/XSGX/etc/xorg.conf &
+
+	modprobe drm
+
+	insmod $(busybox find /lib/modules/$(uname -r) -name "pvrsrvkm.ko")
+
+    if [ "$?" !=3D "0" ]
+    then
+        echo "Could not find pvrsrvkm driver"
+        exit 1
+    fi
+
+	modprobe bufferclass_ti
+
+	pvr_maj=3D`grep "pvrsrvkm$" /proc/devices | cut -b1,2,3`
+        bc_maj=3D`grep "bc" /proc/devices | cut -b1,2,3`
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
+	SAVED_ESREVISION=3D"$(cat /etc/powervr-esrev)"
+}
+
+sgxfinish () {
+	# Fix up a bug in opkg
+	if [ $(readlink /usr/lib/libsrv_um.so) !=3D $(readlink /usr/lib/libsrv_um=
.so.1) ] ; then
+		cd /usr/lib
+		ln -sf $(readlink /usr/lib/libsrv_um.so.1) libsrv_um.so
+	fi
+
+	if [ "${ES_REVISION}" !=3D "${SAVED_ESREVISION}" ] ; then
+		echo -n "Starting SGX fixup for"
+		echo " ES${ES_REVISION}.x"
+		cp -a /usr/lib/ES${ES_REVISION}.0/* /usr/lib
+		cp -a /usr/bin/ES${ES_REVISION}.0/* /usr/bin
+		echo "${ES_REVISION}" > /etc/powervr-esrev
+	fi
+
+	if ! /usr/bin/pvrsrvctl --start --no-module; then return; fi }
+
+case $CPUTYPE in
+"OMAP3530")
+	sgxprepare
+
+	devmem2 0x48004B48 w 0x2 > /dev/null
+	devmem2 0x48004B10 w 0x1 > /dev/null
+	devmem2 0x48004B00 w 0x2 > /dev/null
+
+	ES_REVISION=3D"$(devmem2 0x50000014 | sed -e s:0x00010205:5: -e s:0x00010=
201:3: -e s:0x00010003:2: | tail -n1 | awk -F': ' '{print $2}')"
+
+	sgxfinish
+	;;
+"TI33XX")
+	sgxprepare
+
+	devmem2 0x44e01104 w 0x0 > /dev/null
+	devmem2 0x44e00904 w 0x2 > /dev/null
+
+	ES_REVISION=3D"$(devmem2 0x56000014 | sed -e s:0x00010205:8: | tail -n1 |=
 awk -F': ' '{print $2}')"
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
+	ES_REVISION=3D"$(devmem2 0x56000014 | sed -e s:0x00010205:6: -e s:0x00010=
201:3: -e s:0x00010003:2: | tail -n1 | awk -F': ' '{print $2}')"
+
+	sgxfinish
+	;;
+*)
+	echo No SGX hardware, not starting PVR
+	;;
+esac
diff --git a/recipes-graphics/libgles/libgles-omap3_4.08.00.01.bb b/recipes=
-graphics/libgles/libgles-omap3_4.08.00.01.bb
new file mode 100644
index 0000000..5a82e68
--- /dev/null
+++ b/recipes-graphics/libgles/libgles-omap3_4.08.00.01.bb
@@ -0,0 +1,74 @@
+require libgles-omap3.inc
+
+DEFAULT_PREFERENCE =3D "-1"
+
+BINLOCATION_omap3  =3D "${S}/gfx_rel_es3.x"
+BINLOCATION_ti816x =3D "${S}/gfx_rel_es6.x"
+BINLOCATION_ti814x =3D "${S}/gfx_rel_es6.x"
+BINLOCATION_ti33x =3D "${S}/gfx_rel_es8.x"
+
+PLATFORM =3D "LinuxARMV7"
+PVR_INIT =3D "pvrsrvctl"
+
+# download required binary distribution from:
+#=20
+http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxs
+dk/latest/index_FDS.html # see libgles-omap3.inc for detailed=20
+installation instructions gedit SGXPV =3D "4_08_00_01"
+IMGPV =3D "1.7.867897"
+BINFILE =3D "Graphics_SDK_setuplinux_${SGXPV}.bin"
+TI_BIN_UNPK_WDEXT :=3D "/Graphics_SDK_${SGXPV}"
+SRC_URI =3D "<ti-internal-url>/Graphics_SDK_setuplinux_4_08_00_01.bin \
+           file://cputype \
+           file://rc.pvr \
+           file://rc_dri.pvr \
+           file://sample.desktop \
+           file://99-bufferclass.rules  \ "
+
+SRC_URI[md5sum] =3D "95b8f02923d6ea52ea104fa3d93ce1f0"
+SRC_URI[sha256sum] =3D "1db2d46ec3c6a97db146357841e02a95a15be658c2297dc571=
e6e61b32238561"
+
+S =3D "${WORKDIR}/Graphics_SDK_${SGXPV}"
+
+LIBGLESWINDOWSYSTEM ?=3D "${@base_contains('DISTRO_FEATURES', 'x11',"libpv=
rPVR2D_DRIWSEGL.so" ,"libpvrPVR2D_FRONTWSEGL.so.1", d)}"
+
+do_configure_append() {
+
+	# Change PVR server's user mode library to point to DRI
+	for drifile in $(find ${S} -name "libsrv_um_dri.so"); do
+	if [ "$drifile" !=3D "" ]
+	then
+		dir=3D$(dirname ${drifile})
+		if [ "$SUPPORT_XORG" =3D "1" ]
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
+    # In this version of the graphics SDK the following directories do not=
 exist:
+    #    /GFX_Linux_SDK/OGLES/SDKPackage/Builds/OGLES/Include/pvr2d.h (doe=
sn't exist)
+    #    /GFX_Linux_SDK/OGLES/SDKPackage/Builds/OGLES/Include/GLES/egltype=
s.h (doesn't exist)
+    # Therefore, need to copy these files manually at the only location th=
at they do exist
+    cp -pPr ${S}/include/pvr2d/*.h ${D}${includedir} || true
+    cp -pPr ${S}/include/OGLES/GLES ${D}${includedir}/ || true
+
+    rm ${D}${sysconfdir}/init.d/pvr-init
+
+    if [ "$SUPPORT_XORG" =3D "1" ]; then
+	    cp -pP ${WORKDIR}/rc_dri.pvr ${D}${sysconfdir}/init.d/pvr-init
+	else
+	    cp -pP ${WORKDIR}/rc.pvr ${D}${sysconfdir}/init.d/pvr-init
+	fi
+
+}
+
+RRECOMMENDS_${PN}-x11demos =3D "${PN}-driwsegl"
+RRECOMMENDS_${PN}-x11trainingcourses =3D "${PN}-driwsegl"
--
1.7.0.4


