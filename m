Return-Path: <chase.maupin@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 73096E0027E
	for <meta-ti@yoctoproject.org>; Wed, 10 Oct 2012 08:48:25 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id q9AFmKI6012878;
	Wed, 10 Oct 2012 10:48:20 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q9AFmKgU022222;
	Wed, 10 Oct 2012 10:48:20 -0500
Received: from DLEE12.ent.ti.com ([fe80::3867:617:aab3:5956]) by
	DFLE72.ent.ti.com ([fe80::5c48:b90d:af93:5822%30]) with mapi id
	14.01.0323.003; Wed, 10 Oct 2012 10:48:20 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>,
	"meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [PATCH 1/2][for-comments] libgles-omap3: Add updated
	Graphics SDK
Thread-Index: AQHNppuAqNLqRJsb/UOid2tc/JMB/JeyrbIg
Date: Wed, 10 Oct 2012 15:48:19 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101592554EE@DLEE12.ent.ti.com>
References: <1349843304-18507-1-git-send-email-fcooper@ti.com>
In-Reply-To: <1349843304-18507-1-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 1/2][for-comments] libgles-omap3: Add updated	Graphics SDK
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
X-List-Received-Date: Wed, 10 Oct 2012 15:48:25 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> bounces@yoctoproject.org] On Behalf Of Franklin S. Cooper Jr
> Sent: Tuesday, October 09, 2012 11:28 PM
> To: meta-ti@yoctoproject.org
> Subject: [meta-ti] [PATCH 1/2][for-comments] libgles-omap3: Add
> updated Graphics SDK
>=20
> * Add version v4.08.00.01 of the Graphics SDK.
> * Add X11 support via DRI/DRM Xorg driver
> * Replace pvrsrvinit with pvrsrvctl (Imagination Technologies
> based change)
>=20
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  .../libgles/libgles-omap3-4.08.00.01/rc.pvr        |  124
> ++++++++++++++++++
>  .../libgles/libgles-omap3-4.08.00.01/rc_dri.pvr    |  136
> ++++++++++++++++++++
>  .../libgles/libgles-omap3_4.08.00.01.bb            |   74
> +++++++++++
>  3 files changed, 334 insertions(+), 0 deletions(-)
>  create mode 100755 recipes-graphics/libgles/libgles-omap3-
> 4.08.00.01/rc.pvr
>  create mode 100755 recipes-graphics/libgles/libgles-omap3-
> 4.08.00.01/rc_dri.pvr
>  create mode 100644 recipes-graphics/libgles/libgles-
> omap3_4.08.00.01.bb
>=20
> diff --git a/recipes-graphics/libgles/libgles-omap3-
> 4.08.00.01/rc.pvr b/recipes-graphics/libgles/libgles-omap3-
> 4.08.00.01/rc.pvr
> new file mode 100755
> index 0000000..7b5cefa
> --- /dev/null
> +++ b/recipes-graphics/libgles/libgles-omap3-4.08.00.01/rc.pvr
> @@ -0,0 +1,124 @@

Can you use --find-copies-harder to find similar files?

> +#!/bin/sh
> +PATH=3D$PATH:/usr/sbin
> +
> +# Check if an fb device is available.  If not then just go ahead
> and
> +# exit because we have no display.
> +fbset > /dev/null 2>&1
> +if [ "$?" =3D=3D "1" ]
> +then
> +    # looks like there is no display, so let's exit
> +    exit 0
> +fi
> +
> +BITSPERPIXEL=3D"$(fbset | grep geom | awk '{print $6}')"
> +YRES=3D"$(fbset | grep geom | awk '{print $3}')"
> +
> +CPUTYPE=3D"$(cputype)"
> +
> +if [ "$1" =3D "" ]; then
> +	echo PVR-INIT: Please use start, stop, or restart.
> +	exit 1
> +fi
> +
> +if [ "$1" =3D "stop" -o  "$1" =3D "restart" ]; then
> +	echo Stopping PVR
> +	rmmod bufferclass_ti
> +	rmmod omaplfb 2>/dev/null
> +	rmmod pvrsrvkm 2>/dev/null
> +fi
> +
> +if [ "$1" =3D "stop" ]; then
> +	exit 0
> +fi
> +
> +# Set RGBA ordering to something the drivers like
> +if [ "$BITSPERPIXEL" =3D "32" ] ; then
> +	fbset -rgba 8/16,8/8,8/0,8/24
> +fi
> +
> +# Try to enable triple buffering when there's enough VRAM
> +fbset -vyres $(expr $YRES \* 3)
> +
> +sgxprepare () {
> +	echo Starting PVR
> +	insmod $(busybox find /lib/modules/$(uname -r) -name
> "pvrsrvkm.ko")
> +
> +    if [ "$?" !=3D "0" ]
> +    then
> +        echo "Could not find pvrsrvkm driver"
> +        exit 1
> +    fi
> +
> +	modprobe omaplfb
> +	modprobe bufferclass_ti
> +
> +	pvr_maj=3D`grep "pvrsrvkm$" /proc/devices | cut -b1,2,3`
> +        bc_maj=3D`grep "bc" /proc/devices | cut -b1,2,3`
> +
> +	if [ -e /dev/pvrsrvkm ] ; then
> +		rm -f /dev/pvrsrvkm
> +	fi
> +
> +	mknod /dev/pvrsrvkm c $pvr_maj 0
> +	chmod 666 /dev/pvrsrvkm
> +
> +	touch /etc/powervr-esrev
> +
> +	SAVED_ESREVISION=3D"$(cat /etc/powervr-esrev)"
> +}
> +
> +sgxfinish () {
> +	# Fix up a bug in opkg
> +	if [ $(readlink /usr/lib/libsrv_um.so) !=3D $(readlink
> /usr/lib/libsrv_um.so.1) ] ; then
> +		cd /usr/lib
> +		ln -sf $(readlink /usr/lib/libsrv_um.so.1)
> libsrv_um.so
> +	fi
> +
> +	if [ "${ES_REVISION}" !=3D "${SAVED_ESREVISION}" ] ; then
> +		echo -n "Starting SGX fixup for"
> +		echo " ES${ES_REVISION}.x"
> +		cp -a /usr/lib/ES${ES_REVISION}.0/* /usr/lib
> +		cp -a /usr/bin/ES${ES_REVISION}.0/* /usr/bin
> +		echo "${ES_REVISION}" > /etc/powervr-esrev
> +	fi
> +
> +	if ! /usr/bin/pvrsrvctl --start --no-module; then return;
> fi
> +}
> +
> +case $CPUTYPE in
> +"OMAP3530")
> +	sgxprepare
> +
> +	devmem2 0x48004B48 w 0x2 > /dev/null
> +	devmem2 0x48004B10 w 0x1 > /dev/null
> +	devmem2 0x48004B00 w 0x2 > /dev/null
> +
> +	ES_REVISION=3D"$(devmem2 0x50000014 | sed -e s:0x00010205:5:
> -e s:0x00010201:3: -e s:0x00010003:2: | tail -n1 | awk -F': '
> '{print $2}')"
> +
> +	sgxfinish
> +	;;
> +"TI33XX")
> +	sgxprepare
> +
> +	devmem2 0x44e01104 w 0x0 > /dev/null
> +	devmem2 0x44e00904 w 0x2 > /dev/null
> +
> +	ES_REVISION=3D"$(devmem2 0x56000014 | sed -e s:0x00010205:8:
> | tail -n1 | awk -F': ' '{print $2}')"
> +
> +	sgxfinish
> +	;;
> +"TI816x")
> +	sgxprepare
> +
> +	devmem2 0x48180F04 w 0x0 > /dev/null
> +	devmem2 0x48180900 w 0x2 > /dev/null
> +	devmem2 0x48180920 w 0x2 > /dev/null
> +
> +	ES_REVISION=3D"$(devmem2 0x56000014 | sed -e s:0x00010205:6:
> -e s:0x00010201:3: -e s:0x00010003:2: | tail -n1 | awk -F': '
> '{print $2}')"
> +
> +	sgxfinish
> +	;;
> +*)
> +	echo No SGX hardware, not starting PVR
> +	;;
> +esac
> diff --git a/recipes-graphics/libgles/libgles-omap3-
> 4.08.00.01/rc_dri.pvr b/recipes-graphics/libgles/libgles-omap3-
> 4.08.00.01/rc_dri.pvr
> new file mode 100755
> index 0000000..dd1e942
> --- /dev/null
> +++ b/recipes-graphics/libgles/libgles-omap3-
> 4.08.00.01/rc_dri.pvr
> @@ -0,0 +1,136 @@
> +#!/bin/sh
> +PATH=3D$PATH:/usr/sbin
> +
> +# Check if an fb device is available.  If not then just go ahead
> and
> +# exit because we have no display.
> +fbset > /dev/null 2>&1
> +if [ "$?" =3D=3D "1" ]
> +then
> +    # looks like there is no display, so let's exit
> +    exit 0
> +fi
> +
> +BITSPERPIXEL=3D"$(fbset | grep geom | awk '{print $6}')"
> +YRES=3D"$(fbset | grep geom | awk '{print $3}')"
> +
> +CPUTYPE=3D"$(cputype)"
> +
> +if [ "$1" =3D "" ]; then
> +	echo PVR-INIT: Please use start, stop, or restart.
> +	exit 1
> +fi
> +
> +if [ "$1" =3D "stop" -o  "$1" =3D "restart" ]; then
> +	echo Stopping PVR
> +
> +	# Stop the X Server.
> +	#
> +	[ -f /tmp/.X0-lock ] && read XPID < /tmp/.X0-lock && [ -n
> "$XPID" ] && kill $XPID && while [ -e /proc/$XPID ] ; do sleep 1;
> done
> +
> +	rmmod bufferclass_ti
> +	rmmod pvrsrvkm 2>/dev/null
> +    rmmod drm 2>/dev/null
> +fi
> +
> +if [ "$1" =3D "stop" ]; then
> +	exit 0
> +fi
> +
> +# Set RGBA ordering to something the drivers like
> +if [ "$BITSPERPIXEL" =3D "32" ] ; then
> +	fbset -rgba 8/16,8/8,8/0,8/24
> +fi
> +
> +# Try to enable triple buffering when there's enough VRAM
> +fbset -vyres $(expr $YRES \* 3)
> +
> +sgxprepare () {
> +	echo Starting PVR
> +
> +	# Start the X Server.
> +	# The X Server will load the PVR Services module.
> +	#
> +	/usr/local/XSGX/bin/X -verbose -config
> /usr/local/XSGX/etc/xorg.conf &
> +
> +	modprobe drm
> +
> +	insmod $(busybox find /lib/modules/$(uname -r) -name
> "pvrsrvkm.ko")
> +
> +    if [ "$?" !=3D "0" ]
> +    then
> +        echo "Could not find pvrsrvkm driver"
> +        exit 1
> +    fi
> +
> +	modprobe bufferclass_ti
> +
> +	pvr_maj=3D`grep "pvrsrvkm$" /proc/devices | cut -b1,2,3`
> +        bc_maj=3D`grep "bc" /proc/devices | cut -b1,2,3`
> +
> +	if [ -e /dev/pvrsrvkm ] ; then
> +		rm -f /dev/pvrsrvkm
> +	fi
> +
> +	mknod /dev/pvrsrvkm c $pvr_maj 0
> +	chmod 666 /dev/pvrsrvkm
> +
> +	touch /etc/powervr-esrev
> +
> +	SAVED_ESREVISION=3D"$(cat /etc/powervr-esrev)"
> +}
> +
> +sgxfinish () {
> +	# Fix up a bug in opkg
> +	if [ $(readlink /usr/lib/libsrv_um.so) !=3D $(readlink
> /usr/lib/libsrv_um.so.1) ] ; then
> +		cd /usr/lib
> +		ln -sf $(readlink /usr/lib/libsrv_um.so.1)
> libsrv_um.so
> +	fi
> +
> +	if [ "${ES_REVISION}" !=3D "${SAVED_ESREVISION}" ] ; then
> +		echo -n "Starting SGX fixup for"
> +		echo " ES${ES_REVISION}.x"
> +		cp -a /usr/lib/ES${ES_REVISION}.0/* /usr/lib
> +		cp -a /usr/bin/ES${ES_REVISION}.0/* /usr/bin
> +		echo "${ES_REVISION}" > /etc/powervr-esrev
> +	fi
> +
> +	if ! /usr/bin/pvrsrvctl --start --no-module; then return;
> fi
> +}
> +
> +case $CPUTYPE in
> +"OMAP3530")
> +	sgxprepare
> +
> +	devmem2 0x48004B48 w 0x2 > /dev/null
> +	devmem2 0x48004B10 w 0x1 > /dev/null
> +	devmem2 0x48004B00 w 0x2 > /dev/null
> +
> +	ES_REVISION=3D"$(devmem2 0x50000014 | sed -e s:0x00010205:5:
> -e s:0x00010201:3: -e s:0x00010003:2: | tail -n1 | awk -F': '
> '{print $2}')"
> +
> +	sgxfinish
> +	;;
> +"TI33XX")
> +	sgxprepare
> +
> +	devmem2 0x44e01104 w 0x0 > /dev/null
> +	devmem2 0x44e00904 w 0x2 > /dev/null
> +
> +	ES_REVISION=3D"$(devmem2 0x56000014 | sed -e s:0x00010205:8:
> | tail -n1 | awk -F': ' '{print $2}')"
> +
> +	sgxfinish
> +	;;
> +"TI816x")
> +	sgxprepare
> +
> +	devmem2 0x48180F04 w 0x0 > /dev/null
> +	devmem2 0x48180900 w 0x2 > /dev/null
> +	devmem2 0x48180920 w 0x2 > /dev/null
> +
> +	ES_REVISION=3D"$(devmem2 0x56000014 | sed -e s:0x00010205:6:
> -e s:0x00010201:3: -e s:0x00010003:2: | tail -n1 | awk -F': '
> '{print $2}')"
> +
> +	sgxfinish
> +	;;
> +*)
> +	echo No SGX hardware, not starting PVR
> +	;;
> +esac
> diff --git a/recipes-graphics/libgles/libgles-omap3_4.08.00.01.bb
> b/recipes-graphics/libgles/libgles-omap3_4.08.00.01.bb
> new file mode 100644
> index 0000000..5a82e68
> --- /dev/null
> +++ b/recipes-graphics/libgles/libgles-omap3_4.08.00.01.bb
> @@ -0,0 +1,74 @@
> +require libgles-omap3.inc
> +
> +DEFAULT_PREFERENCE =3D "-1"
> +
> +BINLOCATION_omap3  =3D "${S}/gfx_rel_es3.x"
> +BINLOCATION_ti816x =3D "${S}/gfx_rel_es6.x"
> +BINLOCATION_ti814x =3D "${S}/gfx_rel_es6.x"
> +BINLOCATION_ti33x =3D "${S}/gfx_rel_es8.x"
> +
> +PLATFORM =3D "LinuxARMV7"
> +PVR_INIT =3D "pvrsrvctl"
> +
> +# download required binary distribution from:
> +# http://software-
> dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/latest/
> index_FDS.html
> +# see libgles-omap3.inc for detailed installation instructions
> +gedit
> +SGXPV =3D "4_08_00_01"
> +IMGPV =3D "1.7.867897"
> +BINFILE =3D "Graphics_SDK_setuplinux_${SGXPV}.bin"
> +TI_BIN_UNPK_WDEXT :=3D "/Graphics_SDK_${SGXPV}"
> +SRC_URI =3D "<ti-internal-
> url>/Graphics_SDK_setuplinux_4_08_00_01.bin \

This URL will be updated when the graphics SDK 4.08.00.01 pushes external c=
orrect?  Go ahead and put the real external URL in place.

> +           file://cputype \
> +           file://rc.pvr \
> +           file://rc_dri.pvr \
> +           file://sample.desktop \
> +           file://99-bufferclass.rules  \
> +"
> +
> +SRC_URI[md5sum] =3D "95b8f02923d6ea52ea104fa3d93ce1f0"
> +SRC_URI[sha256sum] =3D
> "1db2d46ec3c6a97db146357841e02a95a15be658c2297dc571e6e61b32238561
> "
> +
> +S =3D "${WORKDIR}/Graphics_SDK_${SGXPV}"
> +
> +LIBGLESWINDOWSYSTEM ?=3D "${@base_contains('DISTRO_FEATURES',
> 'x11',"libpvrPVR2D_DRIWSEGL.so" ,"libpvrPVR2D_FRONTWSEGL.so.1",
> d)}"

Why not just set this in the .inc file?

> +
> +do_configure_append() {
> +
> +	# Change PVR server's user mode library to point to DRI
> +	for drifile in $(find ${S} -name "libsrv_um_dri.so"); do
> +	if [ "$drifile" !=3D "" ]
> +	then
> +		dir=3D$(dirname ${drifile})
> +		if [ "$SUPPORT_XORG" =3D "1" ]
> +		then
> +		    mv ${dir}/libsrv_um_dri.so ${dir}/libsrv_um.so
> +		else
> +		    rm -rf ${dir}/libsrv_um_dri.so
> +		fi
> +	fi
> +
> +	done
> +}

Any reason this couldn't be done in the base .inc file?

> +
> +do_install_append() {
> +
> +    # In this version of the graphics SDK the following
> directories do not exist:
> +    #
> /GFX_Linux_SDK/OGLES/SDKPackage/Builds/OGLES/Include/pvr2d.h
> (doesn't exist)
> +    #
> /GFX_Linux_SDK/OGLES/SDKPackage/Builds/OGLES/Include/GLES/egltype
> s.h (doesn't exist)
> +    # Therefore, need to copy these files manually at the only
> location that they do exist
> +    cp -pPr ${S}/include/pvr2d/*.h ${D}${includedir} || true
> +    cp -pPr ${S}/include/OGLES/GLES ${D}${includedir}/ || true

If these are required then shouldn't the return of the copy actually be che=
cked?  And couldn't this be put in the .inc file as well to check if these =
files exist and if so install them?

> +
> +    rm ${D}${sysconfdir}/init.d/pvr-init
> +
> +    if [ "$SUPPORT_XORG" =3D "1" ]; then
> +	    cp -pP ${WORKDIR}/rc_dri.pvr
> ${D}${sysconfdir}/init.d/pvr-init
> +	else
> +	    cp -pP ${WORKDIR}/rc.pvr ${D}${sysconfdir}/init.d/pvr-
> init
> +	fi
> +
> +}
> +
> +RRECOMMENDS_${PN}-x11demos =3D "${PN}-driwsegl"
> +RRECOMMENDS_${PN}-x11trainingcourses =3D "${PN}-driwsegl"
> --
> 1.7.0.4
>=20
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

