Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D668FE01410
	for <meta-ti@yoctoproject.org>; Tue, 19 Mar 2013 19:24:18 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r2K2OIBu016924
	for <meta-ti@yoctoproject.org>; Tue, 19 Mar 2013 21:24:18 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2K2OIhq008216
	for <meta-ti@yoctoproject.org>; Tue, 19 Mar 2013 21:24:18 -0500
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.02.0342.003; Tue, 19 Mar 2013 21:24:18 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Thread-Topic: [PATCH 2/2] libgles-omap3: Add version 4.08.00.02 of the
	Graphics SDK
Thread-Index: AQHOJRAfVUHcd154ZEKyIowYfkcbO5it1mJA
Date: Wed, 20 Mar 2013 02:24:17 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C3EB28B@DFLE09.ent.ti.com>
References: <1363745431-10452-1-git-send-email-fcooper@ti.com>
	<1363745431-10452-2-git-send-email-fcooper@ti.com>
In-Reply-To: <1363745431-10452-2-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] libgles-omap3: Add version 4.08.00.02 of the Graphics SDK
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
X-List-Received-Date: Wed, 20 Mar 2013 02:24:19 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

So just a general warning about these two 04.08.00.02 recipes. These recipe=
s are using a minimal version of the Graphics SDK. This version is signific=
antly smaller which is a good thing but also does not include all the demos=
 (only 4 now) and the trainingcourses and other documentation have been rem=
oved.=20

Two reasons why I am going with this smaller Graphics SDK version. First th=
e Graphics SDK in this release has doubled in size to about 1.7 GB. Majorit=
y of those files are unneeded.... Second our current libgles-omap3.inc had =
a lot of problems with this latest Graphics SDK. Quite a bit of work would =
need to be done for the .inc to work properly for this release which probab=
ly would break any of the other versions of the Graphics SDK recipe.

The best solution is to use the Graphics SDK top level makefile so a lot of=
 logic can be removed from the recipe and avoid similar issues in the futur=
e.

> -----Original Message-----
> From: Cooper Jr., Franklin
> Sent: Tuesday, March 19, 2013 9:11 PM
> To: meta-ti@yoctoproject.org
> Cc: Cooper Jr., Franklin
> Subject: [PATCH 2/2] libgles-omap3: Add version 4.08.00.02 of the Graphic=
s
> SDK
>=20
> ---
>  .../libgles/libgles-omap3-4.08.00.02/rc.pvr        |  124 ++++++++++++++=
++++
>  .../libgles/libgles-omap3-4.08.00.02/rc_dri.pvr    |  136
> ++++++++++++++++++++
>  .../libgles/libgles-omap3_4.08.00.02.bb            |   77 +++++++++++
>  3 files changed, 337 insertions(+), 0 deletions(-)  create mode 100755
> recipes-graphics/libgles/libgles-omap3-4.08.00.02/rc.pvr
>  create mode 100755 recipes-graphics/libgles/libgles-omap3-
> 4.08.00.02/rc_dri.pvr
>  create mode 100644 recipes-graphics/libgles/libgles-omap3_4.08.00.02.bb
>=20
> diff --git a/recipes-graphics/libgles/libgles-omap3-4.08.00.02/rc.pvr
> b/recipes-graphics/libgles/libgles-omap3-4.08.00.02/rc.pvr
> new file mode 100755
> index 0000000..7b5cefa
> --- /dev/null
> +++ b/recipes-graphics/libgles/libgles-omap3-4.08.00.02/rc.pvr
> @@ -0,0 +1,124 @@
> +#!/bin/sh
> +PATH=3D$PATH:/usr/sbin
> +
> +# Check if an fb device is available.  If not then just go ahead and #
> +exit because we have no display.
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
> +# Set RGBA ordering to something the drivers like if [ "$BITSPERPIXEL"
> +=3D "32" ] ; then
> +	fbset -rgba 8/16,8/8,8/0,8/24
> +fi
> +
> +# Try to enable triple buffering when there's enough VRAM fbset -vyres
> +$(expr $YRES \* 3)
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
> +		ln -sf $(readlink /usr/lib/libsrv_um.so.1) libsrv_um.so
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
> +	if ! /usr/bin/pvrsrvctl --start --no-module; then return; fi }
> +
> +case $CPUTYPE in
> +"OMAP3530")
> +	sgxprepare
> +
> +	devmem2 0x48004B48 w 0x2 > /dev/null
> +	devmem2 0x48004B10 w 0x1 > /dev/null
> +	devmem2 0x48004B00 w 0x2 > /dev/null
> +
> +	ES_REVISION=3D"$(devmem2 0x50000014 | sed -e s:0x00010205:5: -e
> s:0x00010201:3: -e s:0x00010003:2: | tail -n1 | awk -F': ' '{print $2}')"
> +
> +	sgxfinish
> +	;;
> +"TI33XX")
> +	sgxprepare
> +
> +	devmem2 0x44e01104 w 0x0 > /dev/null
> +	devmem2 0x44e00904 w 0x2 > /dev/null
> +
> +	ES_REVISION=3D"$(devmem2 0x56000014 | sed -e s:0x00010205:8: |
> tail -n1 | awk -F': ' '{print $2}')"
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
> +	ES_REVISION=3D"$(devmem2 0x56000014 | sed -e s:0x00010205:6: -e
> s:0x00010201:3: -e s:0x00010003:2: | tail -n1 | awk -F': ' '{print $2}')"
> +
> +	sgxfinish
> +	;;
> +*)
> +	echo No SGX hardware, not starting PVR
> +	;;
> +esac
> diff --git a/recipes-graphics/libgles/libgles-omap3-4.08.00.02/rc_dri.pvr
> b/recipes-graphics/libgles/libgles-omap3-4.08.00.02/rc_dri.pvr
> new file mode 100755
> index 0000000..dd1e942
> --- /dev/null
> +++ b/recipes-graphics/libgles/libgles-omap3-4.08.00.02/rc_dri.pvr
> @@ -0,0 +1,136 @@
> +#!/bin/sh
> +PATH=3D$PATH:/usr/sbin
> +
> +# Check if an fb device is available.  If not then just go ahead and #
> +exit because we have no display.
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
> +	[ -f /tmp/.X0-lock ] && read XPID < /tmp/.X0-lock && [ -n "$XPID" ]
> &&
> +kill $XPID && while [ -e /proc/$XPID ] ; do sleep 1; done
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
> +# Set RGBA ordering to something the drivers like if [ "$BITSPERPIXEL"
> +=3D "32" ] ; then
> +	fbset -rgba 8/16,8/8,8/0,8/24
> +fi
> +
> +# Try to enable triple buffering when there's enough VRAM fbset -vyres
> +$(expr $YRES \* 3)
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
> +		ln -sf $(readlink /usr/lib/libsrv_um.so.1) libsrv_um.so
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
> +	if ! /usr/bin/pvrsrvctl --start --no-module; then return; fi }
> +
> +case $CPUTYPE in
> +"OMAP3530")
> +	sgxprepare
> +
> +	devmem2 0x48004B48 w 0x2 > /dev/null
> +	devmem2 0x48004B10 w 0x1 > /dev/null
> +	devmem2 0x48004B00 w 0x2 > /dev/null
> +
> +	ES_REVISION=3D"$(devmem2 0x50000014 | sed -e s:0x00010205:5: -e
> s:0x00010201:3: -e s:0x00010003:2: | tail -n1 | awk -F': ' '{print $2}')"
> +
> +	sgxfinish
> +	;;
> +"TI33XX")
> +	sgxprepare
> +
> +	devmem2 0x44e01104 w 0x0 > /dev/null
> +	devmem2 0x44e00904 w 0x2 > /dev/null
> +
> +	ES_REVISION=3D"$(devmem2 0x56000014 | sed -e s:0x00010205:8: |
> tail -n1 | awk -F': ' '{print $2}')"
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
> +	ES_REVISION=3D"$(devmem2 0x56000014 | sed -e s:0x00010205:6: -e
> s:0x00010201:3: -e s:0x00010003:2: | tail -n1 | awk -F': ' '{print $2}')"
> +
> +	sgxfinish
> +	;;
> +*)
> +	echo No SGX hardware, not starting PVR
> +	;;
> +esac
> diff --git a/recipes-graphics/libgles/libgles-omap3_4.08.00.02.bb b/recip=
es-
> graphics/libgles/libgles-omap3_4.08.00.02.bb
> new file mode 100644
> index 0000000..98cfcc5
> --- /dev/null
> +++ b/recipes-graphics/libgles/libgles-omap3_4.08.00.02.bb
> @@ -0,0 +1,77 @@
> +require libgles-omap3.inc
> +
> +LICENSE =3D "TSPA"
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
> +#
> +http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxs
> +dk/latest/index_FDS.html # see libgles-omap3.inc for detailed
> +installation instructions
> +
> +SGXPV =3D "4_08_00_02"
> +IMGPV =3D "1.9.2188537"
> +BINFILE =3D "Graphics_SDK_setuplinux_${SGXPV}_minimal_demos.bin"
> +TI_BIN_UNPK_WDEXT :=3D "/Graphics_SDK_${SGXPV}"
> +SRC_URI =3D "http://software-
> dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/${SGXPV}/expo
> rts/${BINFILE} \
> +           file://cputype \
> +           file://rc.pvr \
> +           file://rc_dri.pvr \
> +           file://sample.desktop \
> +           file://99-bufferclass.rules  \ "
> +
> +SRC_URI[md5sum] =3D "0efa3a38266e6f41f8cc4fad0187f0d6"
> +SRC_URI[sha256sum] =3D
> "c732044b515a598e1fab661b7463aa9c53d4fa37f4980dfa85cd02b7468d0cd
> 9"
> +
> +S =3D "${WORKDIR}/Graphics_SDK_${SGXPV}"
> +
> +LIBGLESWINDOWSYSTEM ?=3D "${@base_contains('DISTRO_FEATURES',
> 'x11',"libpvrPVR2D_DRIWSEGL.so" ,"libpvrPVR2D_FRONTWSEGL.so.1", d)}"
> +
> +
> +do_configure_append() {
> +
> +    # Change PVR server's user mode library to point to DRI
> +    for drifile in $(find ${S} -name "libsrv_um_dri.so"); do
> +    if [ "$drifile" !=3D "" ]
> +    then
> +        dir=3D$(dirname ${drifile})
> +        if [ "$SUPPORT_XORG" =3D "1" ]
> +        then
> +            mv ${dir}/libsrv_um_dri.so ${dir}/libsrv_um.so
> +        else
> +            rm -rf ${dir}/libsrv_um_dri.so
> +        fi
> +    fi
> +
> +    done
> +}
> +
> +do_install_append() {
> +
> +    # In this version of the graphics SDK the following directories do n=
ot exist:
> +    #    /GFX_Linux_SDK/OGLES/SDKPackage/Builds/OGLES/Include/pvr2d.h
> (doesn't exist)
> +    #
> /GFX_Linux_SDK/OGLES/SDKPackage/Builds/OGLES/Include/GLES/egltypes.h
> (doesn't exist)
> +    # Therefore, need to copy these files manually at the only location =
that
> they do exist
> +    cp -pPr ${S}/include/pvr2d/*.h ${D}${includedir}
> +    cp -pPr ${S}/include/OGLES/GLES ${D}${includedir}/
> +
> +    rm ${D}${sysconfdir}/init.d/pvr-init
> +
> +    if [ "$SUPPORT_XORG" =3D "1" ]; then
> +        cp -pP ${WORKDIR}/rc_dri.pvr ${D}${sysconfdir}/init.d/pvr-init
> +    else
> +        cp -pP ${WORKDIR}/rc.pvr ${D}${sysconfdir}/init.d/pvr-init
> +    fi
> +
> +}
> +
> +RRECOMMENDS_${PN}-x11demos =3D "${PN}-driwsegl"
> +RRECOMMENDS_${PN}-x11trainingcourses =3D "${PN}-driwsegl"
> --
> 1.7.0.4


