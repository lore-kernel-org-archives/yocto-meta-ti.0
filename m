Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7F1B7E006C6
	for <meta-ti@yoctoproject.org>; Tue, 18 Feb 2014 08:28:08 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s1IGS6jO005463
	for <meta-ti@yoctoproject.org>; Tue, 18 Feb 2014 10:28:06 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s1IGS6hs004370
	for <meta-ti@yoctoproject.org>; Tue, 18 Feb 2014 10:28:06 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 18 Feb 2014 10:28:06 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s1IGS5eW027605;
	Tue, 18 Feb 2014 10:28:06 -0600
Date: Tue, 18 Feb 2014 11:28:05 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Franklin S. Cooper Jr" <fcooper@ti.com>
Message-ID: <20140218162805.GX7138@edge>
References: <1392740645-16084-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
In-Reply-To: <1392740645-16084-1-git-send-email-fcooper@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] Graphics SDK: Add version 05.01.01.01
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
X-List-Received-Date: Tue, 18 Feb 2014 16:28:08 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Should be 99% similar to 5.01.00.01 - can you use --find-copies-harder flag?

-- 
Denys


On Tue, Feb 18, 2014 at 10:24:05AM -0600, Franklin S. Cooper Jr wrote:
> * Add latest version of the Graphics SDK that includes bug fixes.
> * Fixed Suspend and Resume issue on AM43x.
> 
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  .../omap3-sgx-modules_5.01.01.01.bb                |   67 +++++++++
>  .../libgles/libgles-omap3-5.01.01.01/rc.pvr        |  134 ++++++++++++++++++
>  .../libgles/libgles-omap3-5.01.01.01/rc_dri.pvr    |  145 ++++++++++++++++++++
>  .../libgles/libgles-omap3_5.01.01.01.bb            |   50 +++++++
>  4 files changed, 396 insertions(+), 0 deletions(-)
>  create mode 100644 recipes-bsp/powervr-drivers/omap3-sgx-modules_5.01.01.01.bb
>  create mode 100755 recipes-graphics/libgles/libgles-omap3-5.01.01.01/rc.pvr
>  create mode 100755 recipes-graphics/libgles/libgles-omap3-5.01.01.01/rc_dri.pvr
>  create mode 100644 recipes-graphics/libgles/libgles-omap3_5.01.01.01.bb
> 
> diff --git a/recipes-bsp/powervr-drivers/omap3-sgx-modules_5.01.01.01.bb b/recipes-bsp/powervr-drivers/omap3-sgx-modules_5.01.01.01.bb
> new file mode 100644
> index 0000000..40bf8c0
> --- /dev/null
> +++ b/recipes-bsp/powervr-drivers/omap3-sgx-modules_5.01.01.01.bb
> @@ -0,0 +1,67 @@
> +DESCRIPTION = "Kernel drivers for the PowerVR SGX chipset found in the omap3 SoCs"
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://GPL-COPYING;md5=60422928ba677faaa13d6ab5f5baaa1e"
> +
> +TI_BIN_UNPK_CMDS="Y: qY:workdir:Y"
> +require ../../recipes-ti/includes/ti-eula-unpack.inc
> +
> +SGXPV = "5_01_01_01"
> +IMGPV = "1.10.2359475"
> +
> +inherit module
> +
> +MACHINE_KERNEL_PR_append = "a"
> +PR = "${MACHINE_KERNEL_PR}"
> +
> +BINFILE_HARDFP = "Graphics_SDK_setuplinux_hardfp_${SGXPV}.bin"
> +MD5SUM_HARDFP = "94acdbd20152c905939c2448d5e80a72"
> +SHA256SUM_HARDFP = "7f647bf45a5ce8ba9aaa28c4afe85fced4275f9a4567a1886d4460b76c9051ae"
> +
> +# For now we only have hardfp version
> +python __anonymous() {
> +    tunes = bb.data.getVar("TUNE_FEATURES", d, 1)
> +    if not tunes:
> +        return
> +    pkgn = bb.data.getVar("PN", d, 1)
> +    pkgv = bb.data.getVar("PV", d, 1)
> +    if "callconvention-hard" not in tunes:
> +        bb.warn("%s-%s ONLY supports hardfp mode for now" % (pkgn, pkgv))
> +        raise bb.parse.SkipPackage("%s-%s ONLY supports hardfp mode for now" % (pkgn, pkgv))
> +}
> +
> +BINFILE := "${BINFILE_HARDFP}"
> +
> +SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/gfxsdk/${SGXPV}/exports/${BINFILE}"
> +
> +SRC_URI[md5sum] := "${MD5SUM_HARDFP}"
> +SRC_URI[sha256sum] := "${SHA256SUM_HARDFP}"
> +
> +TI_BIN_UNPK_WDEXT="/Graphics_SDK_${SGXPV}"
> +S = "${WORKDIR}${TI_BIN_UNPK_WDEXT}/GFX_Linux_KM"
> +
> +PVRBUILD = "release"
> +export KERNELDIR = "${STAGING_KERNEL_DIR}"
> +
> +INHIBIT_PACKAGE_STRIP = "1"
> +
> +TI_PLATFORM_omap3 = "omap3630"
> +TI_PLATFORM_ti814x = "ti81xx"
> +TI_PLATFORM_ti816x = "ti81xx"
> +TI_PLATFORM_ti33x = "ti335x"
> +TI_PLATFORM_ti43x = "ti43xx"
> +
> +MODULESLOCATION_omap3 = "dc_omapfb3_linux"
> +MODULESLOCATION_ti814x = "dc_ti81xx_linux"
> +MODULESLOCATION_ti816x = "dc_ti81xx_linux"
> +MODULESLOCATION_ti33x = "dc_ti335x_linux"
> +MODULESLOCATION_ti43x = "dc_ti43xx_linux"
> +
> +MAKE_TARGETS = " BUILD=${PVRBUILD} TI_PLATFORM=${TI_PLATFORM} SUPPORT_XORG=${SUPPORT_XORG}"
> +
> +do_install() {
> +    mkdir -p ${D}/lib/modules/${KERNEL_VERSION}/kernel/drivers/gpu/pvr
> +    cp  ${S}/pvrsrvkm.ko \
> +        ${S}/services4/3rdparty/${MODULESLOCATION}/omaplfb.ko  \
> +        ${S}/services4/3rdparty/bufferclass_ti/bufferclass_ti.ko \
> +        ${D}/lib/modules/${KERNEL_VERSION}/kernel/drivers/gpu/pvr
> +}
> diff --git a/recipes-graphics/libgles/libgles-omap3-5.01.01.01/rc.pvr b/recipes-graphics/libgles/libgles-omap3-5.01.01.01/rc.pvr
> new file mode 100755
> index 0000000..132749a
> --- /dev/null
> +++ b/recipes-graphics/libgles/libgles-omap3-5.01.01.01/rc.pvr
> @@ -0,0 +1,134 @@
> +#!/bin/sh
> +PATH=$PATH:/usr/sbin
> +
> +# Check if an fb device is available.  If not then just go ahead and
> +# exit because we have no display.
> +fbset > /dev/null 2>&1
> +if [ "$?" == "1" ]
> +then
> +	# looks like there is no display, so let's exit
> +	exit 0
> +fi
> +
> +BITSPERPIXEL="$(fbset | grep geom | awk '{print $6}')"
> +YRES="$(fbset | grep geom | awk '{print $3}')"
> +
> +CPUTYPE="$(cputype)"
> +
> +if [ "$1" = "" ]; then
> +	echo PVR-INIT: Please use start, stop, or restart.
> +	exit 1
> +fi
> +
> +if [ "$1" = "stop" -o  "$1" = "restart" ]; then
> +	echo Stopping PVR
> +	rmmod bufferclass_ti
> +	rmmod omaplfb 2>/dev/null
> +	rmmod pvrsrvkm 2>/dev/null
> +fi
> +
> +if [ "$1" = "stop" ]; then
> +	exit 0
> +fi
> +
> +# Set RGBA ordering to something the drivers like
> +if [ "$BITSPERPIXEL" = "32" ] ; then
> +	fbset -rgba 8/16,8/8,8/0,8/24
> +fi
> +
> +# Try to enable triple buffering when there's enough VRAM
> +fbset -vyres $(expr $YRES \* 3)
> +
> +sgxprepare () {
> +	echo Starting PVR
> +
> +	lsmod | grep pvrsrvkm > /dev/null
> +
> +	if [ "$?" != "0" ]
> +	then
> +		insmod $(busybox find /lib/modules/$(uname -r) -name "pvrsrvkm.ko")
> +
> +		if [ "$?" != "0" ]
> +		then
> +			echo "Could not find pvrsrvkm driver"
> +			exit 1
> +		fi
> +	fi
> +
> +	modprobe omaplfb
> +	modprobe bufferclass_ti
> +
> +	pvr_maj=`grep "pvrsrvkm$" /proc/devices | cut -b1,2,3`
> +	bc_maj=`grep "bc" /proc/devices | cut -b1,2,3`
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
> +	SAVED_ESREVISION="$(cat /etc/powervr-esrev)"
> +}
> +
> +sgxfinish () {
> +	# Fix up a bug in opkg
> +	if [ $(readlink /usr/lib/libsrv_um.so) != $(readlink /usr/lib/libsrv_um.so.1) ] ; then
> +		cd /usr/lib
> +		ln -sf $(readlink /usr/lib/libsrv_um.so.1) libsrv_um.so
> +	fi
> +
> +	if [ "${ES_REVISION}" != "${SAVED_ESREVISION}" ] ; then
> +		echo -n "Starting SGX fixup for"
> +		echo " ES${ES_REVISION}.x"
> +		cp -a /usr/lib/ES${ES_REVISION}.0/* /usr/lib
> +		cp -a /usr/bin/ES${ES_REVISION}.0/* /usr/bin
> +		echo "${ES_REVISION}" > /etc/powervr-esrev
> +	fi
> +
> +	if ! /usr/bin/pvrsrvctl --start --no-module; then return; fi
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
> +	ES_REVISION="$(devmem2 0x50000014 | sed -e s:0x00010205:5: -e s:0x00010201:3: -e s:0x00010003:2: | tail -n1 | awk -F': ' '{print $2}')"
> +
> +	sgxfinish
> +	;;
> +"TI33XX")
> +	sgxprepare
> +
> +	ES_REVISION="$(devmem2 0x56000014 | sed -e s:0x00010205:8: | tail -n1 | awk -F': ' '{print $2}')"
> +
> +	sgxfinish
> +	;;
> +"TI43XX")
> +	sgxprepare
> +
> +	ES_REVISION="$(devmem2 0x56000014 | sed -e s:0x00010205:8: | tail -n1 | awk -F': ' '{print $2}')"
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
> +	ES_REVISION="$(devmem2 0x56000014 | sed -e s:0x00010205:6: -e s:0x00010201:3: -e s:0x00010003:2: | tail -n1 | awk -F': ' '{print $2}')"
> +
> +	sgxfinish
> +	;;
> +*)
> +	echo No SGX hardware, not starting PVR
> +	;;
> +esac
> diff --git a/recipes-graphics/libgles/libgles-omap3-5.01.01.01/rc_dri.pvr b/recipes-graphics/libgles/libgles-omap3-5.01.01.01/rc_dri.pvr
> new file mode 100755
> index 0000000..9b75aaf
> --- /dev/null
> +++ b/recipes-graphics/libgles/libgles-omap3-5.01.01.01/rc_dri.pvr
> @@ -0,0 +1,145 @@
> +#!/bin/sh
> +PATH=$PATH:/usr/sbin
> +
> +# Check if an fb device is available.  If not then just go ahead and
> +# exit because we have no display.
> +fbset > /dev/null 2>&1
> +if [ "$?" == "1" ]
> +then
> +	# looks like there is no display, so let's exit
> +	exit 0
> +fi
> +
> +BITSPERPIXEL="$(fbset | grep geom | awk '{print $6}')"
> +YRES="$(fbset | grep geom | awk '{print $3}')"
> +
> +CPUTYPE="$(cputype)"
> +
> +if [ "$1" = "" ]; then
> +	echo PVR-INIT: Please use start, stop, or restart.
> +	exit 1
> +fi
> +
> +if [ "$1" = "stop" -o  "$1" = "restart" ]; then
> +	echo Stopping PVR
> +
> +	# Stop the X Server.
> +	#
> +	[ -f /tmp/.X0-lock ] && read XPID < /tmp/.X0-lock && [ -n "$XPID" ] && kill $XPID && while [ -e /proc/$XPID ] ; do sleep 1; done
> +
> +	rmmod bufferclass_ti
> +	rmmod pvrsrvkm 2>/dev/null
> +	rmmod drm 2>/dev/null
> +fi
> +
> +if [ "$1" = "stop" ]; then
> +	exit 0
> +fi
> +
> +# Set RGBA ordering to something the drivers like
> +if [ "$BITSPERPIXEL" = "32" ] ; then
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
> +	/usr/local/XSGX/bin/X -verbose -config /usr/local/XSGX/etc/xorg.conf &
> +
> +	modprobe drm
> +
> +	lsmod | grep pvrsrvkm > /dev/null
> +
> +	if [ "$?" != "0" ]
> +	then
> +		insmod $(busybox find /lib/modules/$(uname -r) -name "pvrsrvkm.ko")
> +
> +		if [ "$?" != "0" ]
> +		then
> +			echo "Could not find pvrsrvkm driver"
> +			exit 1
> +		fi
> +	fi
> +
> +	modprobe bufferclass_ti
> +
> +	pvr_maj=`grep "pvrsrvkm$" /proc/devices | cut -b1,2,3`
> +        bc_maj=`grep "bc" /proc/devices | cut -b1,2,3`
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
> +	SAVED_ESREVISION="$(cat /etc/powervr-esrev)"
> +}
> +
> +sgxfinish () {
> +	# Fix up a bug in opkg
> +	if [ $(readlink /usr/lib/libsrv_um.so) != $(readlink /usr/lib/libsrv_um.so.1) ] ; then
> +		cd /usr/lib
> +		ln -sf $(readlink /usr/lib/libsrv_um.so.1) libsrv_um.so
> +	fi
> +
> +	if [ "${ES_REVISION}" != "${SAVED_ESREVISION}" ] ; then
> +		echo -n "Starting SGX fixup for"
> +		echo " ES${ES_REVISION}.x"
> +		cp -a /usr/lib/ES${ES_REVISION}.0/* /usr/lib
> +		cp -a /usr/bin/ES${ES_REVISION}.0/* /usr/bin
> +		echo "${ES_REVISION}" > /etc/powervr-esrev
> +	fi
> +
> +	if ! /usr/bin/pvrsrvctl --start --no-module; then return; fi
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
> +	ES_REVISION="$(devmem2 0x50000014 | sed -e s:0x00010205:5: -e s:0x00010201:3: -e s:0x00010003:2: | tail -n1 | awk -F': ' '{print $2}')"
> +
> +	sgxfinish
> +	;;
> +"TI33XX")
> +	sgxprepare
> +
> +	ES_REVISION="$(devmem2 0x56000014 | sed -e s:0x00010205:8: | tail -n1 | awk -F': ' '{print $2}')"
> +
> +	sgxfinish
> +	;;
> +"TI43XX")
> +	sgxprepare
> +
> +	ES_REVISION="$(devmem2 0x56000014 | sed -e s:0x00010205:8: | tail -n1 | awk -F': ' '{print $2}')"
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
> +	ES_REVISION="$(devmem2 0x56000014 | sed -e s:0x00010205:6: -e s:0x00010201:3: -e s:0x00010003:2: | tail -n1 | awk -F': ' '{print $2}')"
> +
> +	sgxfinish
> +	;;
> +*)
> +	echo No SGX hardware, not starting PVR
> +	;;
> +esac
> diff --git a/recipes-graphics/libgles/libgles-omap3_5.01.01.01.bb b/recipes-graphics/libgles/libgles-omap3_5.01.01.01.bb
> new file mode 100644
> index 0000000..2d11317
> --- /dev/null
> +++ b/recipes-graphics/libgles/libgles-omap3_5.01.01.01.bb
> @@ -0,0 +1,50 @@
> +require libgles-omap3-no-x.inc
> +
> +LICENSE = "TSPA"
> +
> +PR = "${INC_PR}.0"
> +
> +BINLOCATION_omap3 = "${S}/gfx_rel_es3.x"
> +BINLOCATION_ti816x = "${S}/gfx_rel_es6.x"
> +BINLOCATION_ti814x = "${S}/gfx_rel_es6.x"
> +BINLOCATION_ti33x = "${S}/gfx_rel_es8.x"
> +BINLOCATION_ti43x = "${S}/gfx_rel_es9.x"
> +
> +PLATFORM = "LinuxARMV7"
> +PVR_INIT = "pvrsrvctl"
> +
> +SGXPV = "5_01_01_01"
> +IMGPV = "1.10.2359475"
> +
> +TI_BIN_UNPK_WDEXT := "/Graphics_SDK_${SGXPV}"
> +
> +BINFILE_HARDFP = "Graphics_SDK_setuplinux_hardfp_${SGXPV}.bin"
> +MD5SUM_HARDFP = "94acdbd20152c905939c2448d5e80a72"
> +SHA256SUM_HARDFP = "7f647bf45a5ce8ba9aaa28c4afe85fced4275f9a4567a1886d4460b76c9051ae"
> +
> +# For now we only have hardfp version
> +python __anonymous() {
> +    tunes = bb.data.getVar("TUNE_FEATURES", d, 1)
> +    if not tunes:
> +        return
> +    pkgn = bb.data.getVar("PN", d, 1)
> +    pkgv = bb.data.getVar("PV", d, 1)
> +    if "callconvention-hard" not in tunes:
> +        bb.warn("%s-%s ONLY supports hardfp mode for now" % (pkgn, pkgv))
> +        raise bb.parse.SkipPackage("%s-%s ONLY supports hardfp mode for now" % (pkgn, pkgv))
> +}
> +
> +BINFILE := "${BINFILE_HARDFP}"
> +
> +SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/gfxsdk/${SGXPV}/exports/${BINFILE} \
> +           file://cputype \
> +           file://rc.pvr \
> +           file://99-bufferclass.rules  \
> +"
> +
> +SRC_URI[md5sum] := "${MD5SUM_HARDFP}"
> +SRC_URI[sha256sum] := "${SHA256SUM_HARDFP}"
> +
> +S = "${WORKDIR}/Graphics_SDK_${SGXPV}"
> +
> +LIBGLESWINDOWSYSTEM ?= "libpvrPVR2D_FRONTWSEGL.so.1"
> -- 
> 1.7.0.4
> 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

