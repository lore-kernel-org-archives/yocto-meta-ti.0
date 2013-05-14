Return-Path: <denis@denix.org>
Received: from vms173001pub.verizon.net (vms173001pub.verizon.net
	[206.46.173.1])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 22627E01366
	for <meta-ti@yoctoproject.org>; Tue, 14 May 2013 10:29:53 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MMS004DMTWQF1B0@vms173001.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Tue, 14 May 2013 12:29:26 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 59A292003E; Tue,
	14 May 2013 13:29:13 -0400 (EDT)
Date: Tue, 14 May 2013 13:29:13 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Prabindh Sundareson <prabu@ti.com>
Message-id: <20130514172913.GC31835@denix.org>
References: <1367501964-6294-1-git-send-email-prabu@ti.com>
	<1367501964-6294-8-git-send-email-prabu@ti.com>
MIME-version: 1.0
In-reply-to: <1367501964-6294-8-git-send-email-prabu@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 08/10] libgles-omap3-x11: Separate X11 SGX driver package into new recipe
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
X-List-Received-Date: Tue, 14 May 2013 17:29:53 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, May 02, 2013 at 07:09:22PM +0530, Prabindh Sundareson wrote:
> libgles-omap3 now contains only non-X11 drivers. The X11 driver is
> available in the libgles-omap3-x11 package. This package has
> dependency on specific kernel versions for DRM builds.

Please see inline below.


> Signed-off-by: Prabindh Sundareson <prabu@ti.com>
> ---
>  .../libgles/libgles-omap3-x11-4.09.00.01/rc.pvr    |  124 ++++++++
>  .../libgles-omap3-x11-4.09.00.01/rc_dri.pvr        |  136 +++++++++
>  recipes-graphics/libgles/libgles-omap3-x11.inc     |  312 ++++++++++++++++++++
>  .../libgles/libgles-omap3-x11_4.09.00.01.bb        |   58 ++++
>  4 files changed, 630 insertions(+), 0 deletions(-)
>  create mode 100644 recipes-graphics/libgles/libgles-omap3-x11-4.09.00.01/rc.pvr
>  create mode 100644 recipes-graphics/libgles/libgles-omap3-x11-4.09.00.01/rc_dri.pvr
>  create mode 100644 recipes-graphics/libgles/libgles-omap3-x11.inc
>  create mode 100644 recipes-graphics/libgles/libgles-omap3-x11_4.09.00.01.bb
> 
> diff --git a/recipes-graphics/libgles/libgles-omap3-x11.inc b/recipes-graphics/libgles/libgles-omap3-x11.inc
> new file mode 100644
> index 0000000..d90b65c
> --- /dev/null
> +++ b/recipes-graphics/libgles/libgles-omap3-x11.inc
> @@ -0,0 +1,312 @@
> +DESCRIPTION = "libGLES for the omap3 (X11)"
> +LICENSE = "proprietary-binary"
> +# 'TSPA.txt' might not be the best file to md5sum
> +LIC_FILES_CHKSUM = "file://TSPA.txt;md5=c0d5d9c1e38b41677144c4e24d6ddee1"
> +
> +PR = "r35"
> +
> +COMPATIBLE_MACHINE = "(omap3|ti814x|ti816x|ti33x)"
> +
> +X11DEPENDS = "virtual/libx11 libxau libxdmcp libdrm"
> +DEPENDS = "${@base_contains('DISTRO_FEATURES', 'x11', '${X11DEPENDS}', '', d)}"

I don't think with a separate X11 recipe there is a need for the above 
condition...


> +export SUPPORT_XORG ?= "${@base_contains('DISTRO_FEATURES', 'x11', '1', '0', d)}"

Same here - should just be SUPPORT_XORG = "1".


> +PVR_INIT ?= "pvrsrvinit"
> +
> +PROVIDES += "virtual/egl virtual/libgles1 virtual/libgles2"

Now, the question I have - do we want to add PROVIDES += "libgles-omap3" here? 
With corresponding RPROVIDES, RREPLACES and RCONFLICTS.

This way it would prevent installing them both by accident and would require 
specifying PREFERRED_PROVIDER_libgles-omap3 to choose one or another.



> +RREPLACES_${PN} = "libegl libgles1 libgles2"
> +RREPLACES_${PN}-dev = "libegl-dev libgles1-dev libgles2-dev"
> +RREPLACES_${PN}-dbg = "libegl-dbg"

Missing corresponding RPROVIDES and RCONFLICTS?


> +SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/${SGXPV}/exports/${BINFILE} \
> +		   file://cputype \
> +		   file://rc_dri.pvr \
> +		   file://sample.desktop \
> +		   file://99-bufferclass.rules  \
> +"
> +
> +S = "${WORKDIR}/OMAP35x_Graphics_SDK_${SGXPV}"
> +
> +# Logic to unpack installjammer file
> +TI_BIN_UNPK_CMDS="Y: qY:workdir:Y"
> +require ../../recipes-ti/includes/ti-eula-unpack.inc
> +
> +export BINLOCATION ?= "${S}/gfx_rel"
> +export ES3LOCATION ?= "${S}/gfx_rel_es3.x"
> +export ES5LOCATION ?= "${S}/gfx_rel_es5.x"
> +export ES6LOCATION ?= "${S}/gfx_rel_es6.x"
> +export ES8LOCATION ?= "${S}/gfx_rel_es8.x"
> +
> +LIBGLESWINDOWSYSTEM ?= "libpvrPVR2D_DRIWSEGL.so"
> +
> +do_configure() {
> +	# Attempt to fix up the worst offenders for file permissions
> +	for i in $(find ${S} -name "*.h") $(find ${S} -name "*.c") $(find ${S} -name "Make*") ; do
> +		chmod 0644 $i
> +	done
> +
> +	# Attempt to create proper library softlinks
> +	for sofile in $(find ${S} -name "lib*Open*.so") $(find ${S} -name "lib*srv*.so") $(find ${S} -name "lib*gl*.so") $(find ${S} -name "libpvr*.so") $(find ${S} -name "lib*GL*.so"); do
> +		if [ "$(readlink -n ${sofile})" = "" ] ; then
> +			mv $sofile ${sofile}.${IMGPV}
> +			ln -sf $(basename ${sofile}.${IMGPV}) ${sofile}
> +			ln -sf $(basename ${sofile}.${IMGPV}) ${sofile}$(echo ${IMGPV} | awk -F. '{print "." $1}')
> +			ln -sf $(basename ${sofile}.${IMGPV}) ${sofile}$(echo ${IMGPV} | awk -F. '{print "." $1 "." $2}')
> +		fi
> +	done
> +
> +	# Due to recursive make PLAT_* isn't always passed down correctly, so use sed to fix those
> +	for mak in $(find ${S} -name "*.mak") ; do
> +		sed -i -e s:arm-none-linux-gnueabi-:${TARGET_PREFIX}:g $mak
> +	done
> +
> +	# clear out old stuff
> +	find Binaries/ | xargs rm -f || true
> +}
> +
> +# Force in GNU_HASH and paths to libs
> +TARGET_CC_ARCH += " ${TARGET_LINK_HASH_STYLE} -Wl,-rpath-link,${BINLOCATION} -L${BINLOCATION} \
> +-L${STAGING_DIR_TARGET}${libdir} -Wl,-rpath-link,${STAGING_DIR_TARGET}${libdir}"
> +PARALLEL_MAKE = ""
> +
> +PLATFORM ?= "LinuxOMAP3"
> +
> +do_compile() {
> +	export TOOLCHAIN="${TOOLCHAIN_PATH}"
> +	export PLAT_CC="${CC}"
> +	export PLAT_CPP="${CXX}"
> +	export PLAR_AR="${AR}"
> +
> +	export X11ROOT="${STAGING_DIR_HOST}/usr"
> +	mkdir -p ${S}/demos/x11
> +	mkdir -p ${S}/trainingcourses/x11
> +
> +	mkdir -p ${S}/demos/raw
> +	mkdir -p ${S}/trainingcourses/raw
> +
> +	# Rebuild demos
> +		for demo in ${S}/GFX_Linux_SDK/OGLES/SDKPackage/Demos/* ; do
> +			cd $demo/OGLES/Build/LinuxGeneric
> +			oe_runmake Common=1 PLATFORM=${PLATFORM} X11BUILD=1
> +			rm $demo/OGLES/Build/${PLATFORM}/Release*/*.o
> +
> +			install -m 0755 $demo/OGLES/Build/${PLATFORM}/ReleaseX11/* ${S}/demos/x11 || true
> +			sed -e s:NAME:$(basename $demo): \
> +			    -e s:EXEC:${bindir}/SGX/demos/X11/$(basename $demo/OGLES/Build/${PLATFORM}/ReleaseX11/*): \
> +			    ${WORKDIR}/sample.desktop > ${WORKDIR}/$(basename $demo).desktop
> +		done
> +
> +		for demo in ${S}/GFX_Linux_SDK/OGLES2/SDKPackage/Demos/* ; do
> +			cd $demo/OGLES2/Build/LinuxGeneric
> +			oe_runmake Common=1 PLATFORM=${PLATFORM} X11BUILD=1
> +			rm -f $demo/OGLES2/Build/${PLATFORM}/Release*/*.o
> +
> +			install -m 0755 $demo/OGLES2/Build/${PLATFORM}/ReleaseX11/* ${S}/demos/x11 || true
> +			sed -e s:NAME:$(basename $demo): \
> +			    -e s:EXEC:${bindir}/SGX/demos/X11/$(basename $demo/OGLES2/Build/${PLATFORM}/ReleaseX11/*): \
> +			    ${WORKDIR}/sample.desktop > ${WORKDIR}/$(basename $demo).desktop
> +		done
> +
> +
> +	find ${S} -name "*_org" -delete
> +
> +	# Build OGLES2 Trainingcourses
> +		for training in ${S}/GFX_Linux_SDK/OGLES2/SDKPackage/TrainingCourse/* ; do
> +			if [ -e $training/OGLES2/Build/LinuxGeneric/Makefile ] ; then
> +				cd $training/OGLES2/Build/LinuxGeneric
> +			fi
> +
> +			if [ -e $training/OGLES2/Build/${PLATFORM}/Makefile ] ; then
> +				cd $training/OGLES2/Build/${PLATFORM}
> +			fi
> +
> +			oe_runmake Common=1 PLATFORM=${PLATFORM} X11BUILD=1
> +			rm -f $training/OGLES2/Build/${PLATFORM}/Release*/*.o
> +
> +			install -m 0755 $training/OGLES2/Build/${PLATFORM}/ReleaseX11/* ${S}/trainingcourses/x11 || true
> +		done
> +}
> +
> +do_install () {
> +	install -d ${D}${libdir}
> +	cp -pPR ${BINLOCATION}/*.so* ${D}${libdir}
> +	install -m 0644 ${BINLOCATION}/*.a ${D}${libdir}
> +
> +	install -d ${D}${bindir}/
> +	install -m 0755 ${WORKDIR}/cputype ${D}${bindir}/
> +
> +	install -m 0755 ${BINLOCATION}/*_test ${D}${bindir}/
> +	install -m 0755 ${BINLOCATION}/gl* ${D}${bindir}/
> +	install -m 0755 ${BINLOCATION}/${PVR_INIT} ${D}${bindir}/
> +
> +	install -m 0755 ${BINLOCATION}/xgles1test1 ${D}${bindir}/
> +
> +	install -d ${D}${includedir}
> +	cp -pPR ${S}/GFX_Linux_KM/include4 ${D}${includedir}/
> +	cp -pPR ${S}/GFX_Linux_KM/services4 ${D}${includedir}/
> +
> +	cp -pPR ${S}/GFX_Linux_SDK/OGLES2/SDKPackage/Builds/OGLES2/Include/* ${D}${includedir}/
> +	cp -pPR ${S}/GFX_Linux_SDK/OGLES/SDKPackage/Builds/OGLES/Include/* ${D}${includedir}/
> +	cp -pPR ${S}/GFX_Linux_SDK/OGLES/SDKPackage/Builds/OGLES/${PLATFORM}/Include/GLES/* ${D}${includedir}/GLES/ 2>/dev/null || true
> +	cp -pPr ${S}/GFX_Linux_SDK/OGLES2/SDKPackage/Builds/OGLES2/${PLATFORM}/Include/GLES/* ${D}${includedir}/GLES2/ 2>/dev/null || true
> +	cp -pPr ${S}/include/wsegl/*.h ${D}${includedir} || true
> +	
> +	install -d ${D}${sysconfdir}/init.d/
> +
> +	install -d ${D}${sysconfdir}
> +	echo "[default]" > ${D}${sysconfdir}/powervr.ini
> +	echo "WindowSystem=${LIBGLESWINDOWSYSTEM}" >> ${D}${sysconfdir}/powervr.ini
> +
> +	# The ES3.x, ES5.x and ES6.x CPUs have different SGX hardware, so we need to install multiple sets of userspace
> +
> +	install -d ${D}${libdir}/ES8.0
> +	install -d ${D}${libdir}/ES6.0
> +	install -d ${D}${libdir}/ES5.0
> +	install -d ${D}${libdir}/ES3.0
> +
> +	install -d ${D}${bindir}/ES8.0
> +	install -d ${D}${bindir}/ES6.0
> +	install -d ${D}${bindir}/ES5.0
> +	install -d ${D}${bindir}/ES3.0
> +
> +	x11_prog="eglinfo_x xgles1test1 xgles2test1 xmultiegltest"
> +
> +	for esrev in 3 5 6 8 ; do
> +		ESLOCATION=$(eval echo $(echo \$\{ES${esrev}LOCATION\}))
> +		if [ -e ${ESLOCATION} ] ; then
> +			cp -pPR ${ESLOCATION}/lib*${IMGPV} ${ESLOCATION}/pvr_drv.so ${ESLOCATION}/*.a ${D}${libdir}/ES${esrev}.0/
> +			for esprog in $x11_prog ; do
> +				install -m 0755 ${ESLOCATION}/$esprog ${D}${bindir}/ES${esrev}.0/ 2>/dev/null || true
> +			done
> +		fi
> +	done
> +
> +	rm ${D}${bindir}/ES*/*.h ${D}${bindir}/ES*/pdsasm ${D}${bindir}/pdsasm -f || true
> +
> +	install -d ${D}${prefix}/share/applications
> +	cp ${WORKDIR}/*.desktop ${D}${prefix}/share/applications
> +	rm ${D}${prefix}/share/applications/sample.desktop
> +
> +	install -d ${D}${bindir}/SGX/demos/X11/
> +	install -m 0755 ${S}/demos/x11/* ${D}${bindir}/SGX/demos/X11/
> +	install -d ${D}${bindir}/SGX/trainingcourses/X11  2>/dev/null || true
> +	install -m 0755 ${S}/trainingcourses/x11/* ${D}${bindir}/SGX/trainingcourses/X11/ 2>/dev/null || true
> +
> +	# Delete objects and linker scripts hidden between the headers
> +	find ${D} -name "*.o" -delete
> +	find ${D} -name "*.o.cmd" -delete
> +
> +	install -d ${D}${sysconfdir}/udev/rules.d
> +	install -m 0644 ${WORKDIR}/99-bufferclass.rules ${D}${sysconfdir}/udev/rules.d/
> +
> +}
> +
> +PACKAGES =+ "${PN}-x11demos ${PN}-x11trainingcourses xserver-kdrive-powervrsgx"
> +
> +# Package the base libraries per silicon revision
> +PACKAGES =+ "${PN}-es3 ${PN}-es5 ${PN}-es6 ${PN}-es8"
> +RRECOMMENDS_${PN} += "${PN}-es3 ${PN}-es5 ${PN}-es6 ${PN}-es8"
> +FILES_${PN}-es3 = "${libdir}/ES3*/* ${bindir}/ES3*/*"
> +FILES_${PN}-es5 = "${libdir}/ES5*/* ${bindir}/ES5*/*"
> +FILES_${PN}-es6 = "${libdir}/ES6*/* ${bindir}/ES6*/*"
> +FILES_${PN}-es8 = "${libdir}/ES8*/* ${bindir}/ES8*/*"
> +
> +# Stop shlib code from picking a subpackage
> +PRIVATE_LIBS_${PN}-es3 = "libGLESv2.so libIMGegl.so libsrv_um.so libOpenVG.so libpvr2d.so libsrv_init.so libEGL.so libsrv_um_dri.so libOpenVGU.so libglslcompiler.so libGLES_CM.so"
> +PRIVATE_LIBS_${PN}-es5 = "libGLESv2.so libIMGegl.so libsrv_um.so libOpenVG.so libpvr2d.so libsrv_init.so libEGL.so libsrv_um_dri.so libOpenVGU.so libglslcompiler.so libGLES_CM.so"
> +PRIVATE_LIBS_${PN}-es6 = "libGLESv2.so libIMGegl.so libsrv_um.so libOpenVG.so libpvr2d.so libsrv_init.so libEGL.so libsrv_um_dri.so libOpenVGU.so libglslcompiler.so libGLES_CM.so"
> +PRIVATE_LIBS_${PN}-es8 = "libGLESv2.so libIMGegl.so libsrv_um.so libOpenVG.so libpvr2d.so libsrv_init.so libEGL.so libsrv_um_dri.so libOpenVGU.so libglslcompiler.so libGLES_CM.so"
> +
> +
> +PACKAGES =+ "${PN}-x11wsegl ${PN}-driwsegl"
> +FILES_${PN}-x11wsegl = "${libdir}/libpvrPVR2D_X11WSEGL.so* ${bindir}/x* ${bindir}/*x"
> +FILES_${PN}-driwsegl = "${libdir}/libpvrPVR2D_DRIWSEGL.so* ${libdir}/libsrv_um_dri*"
> +
> +X11_SEGL = " ${PN}-x11wsegl-es2 ${PN}-x11wsegl-es3 ${PN}-x11wsegl-es5 ${PN}-x11wsegl-es6 ${PN}-x11wsegl-es8 ${PN}-driwsegl-es2 ${PN}-driwsegl-es3 ${PN}-driwsegl-es5 ${PN}-driwsegl-es6 ${PN}-driwsegl-es8 "
> +PACKAGES =+ "${X11_SEGL}"
> +FILES_${PN}-x11wsegl-es2 = "${libdir}/ES2*/libpvrPVR2D_X11WSEGL.so.* ${bindir}/ES2*/x* ${bindir}/ES2*/*x"
> +FILES_${PN}-x11wsegl-es3 = "${libdir}/ES3*/libpvrPVR2D_X11WSEGL.so.* ${bindir}/ES3*/x* ${bindir}/ES3*/*x"
> +FILES_${PN}-x11wsegl-es5 = "${libdir}/ES5*/libpvrPVR2D_X11WSEGL.so.* ${bindir}/ES5*/x* ${bindir}/ES5*/*x"
> +FILES_${PN}-x11wsegl-es6 = "${libdir}/ES6*/libpvrPVR2D_X11WSEGL.so.* ${bindir}/ES6*/x* ${bindir}/ES6*/*x"
> +FILES_${PN}-x11wsegl-es8 = "${libdir}/ES8*/libpvrPVR2D_X11WSEGL.so.* ${bindir}/ES8*/x* ${bindir}/ES8*/*x"
> +RRECOMMENDS_${PN}-x11wsegl = " ${PN}-x11wsegl-es2 ${PN}-x11wsegl-es3 ${PN}-x11wsegl-es5 ${PN}-x11wsegl-es6 ${PN}-x11wsegl-es8"
> +
> +FILES_${PN}-driwsegl-es2 = "${libdir}/ES2*/libpvrPVR2D_DRIWSEGL.so.* ${libdir}/ES2*/libsrv_um_dri*"
> +FILES_${PN}-driwsegl-es3 = "${libdir}/ES3*/libpvrPVR2D_DRIWSEGL.so.* ${libdir}/ES3*/libsrv_um_dri*"
> +FILES_${PN}-driwsegl-es5 = "${libdir}/ES5*/libpvrPVR2D_DRIWSEGL.so.* ${libdir}/ES5*/libsrv_um_dri*"
> +FILES_${PN}-driwsegl-es6 = "${libdir}/ES6*/libpvrPVR2D_DRIWSEGL.so.* ${libdir}/ES6*/libsrv_um_dri*"
> +FILES_${PN}-driwsegl-es8 = "${libdir}/ES8*/libpvrPVR2D_DRIWSEGL.so.* ${libdir}/ES8*/libsrv_um_dri*"
> +RRECOMMENDS_${PN}-driwsegl = " ${PN}-driwsegl-es2 ${PN}-driwsegl-es3 ${PN}-driwsegl-es5 ${PN}-driwsegl-es6 ${PN}-driwsegl-es8"
> +
> +CONFFILES_${PN} = "${sysconfdir}/powervr.ini"
> +
> +FILES_${PN} = "${sysconfdir} ${libdir}/*.so* ${bindir}/${PVR_INIT} ${bindir}/cputype ${bindir}/*"
> +
> +FILES_xserver-kdrive-powervrsgx = "${bindir}/Xsgx"
> +FILES_${PN}-tests = "${bindir}/*test*"
> +FILES_${PN}-dbg = "${libdir}/.debug/* ${bindir}/.debug/* \
> +                   ${libdir}/ES*/.debug ${bindir}/*/.debug\
> +                   ${bindir}/SGX/demos/*/.debug/* \
> +                   ${bindir}/SGX/trainingcourses/*/.debug/* \
> +	"
> +
> +FILES_${PN}-x11demos = "${bindir}/SGX/demos/X11/* ${prefix}/share/applications "
> +RRECOMMENDS_${PN}-x11demos = "${PN}-x11wsegl"
> +
> +FILES_${PN}-x11trainingcourses = "${bindir}/SGX/trainingcourses/X11/*"
> +RRECOMMENDS_${PN}-x11trainingcourses = "${PN}-x11wsegl"
> +
> +# The libs need the kernel-modules
> +RRECOMMENDS_${PN} += "omap3-sgx-modules-x11"
> +
> +# The initscript calls fbset, cputype calls devmem2
> +RDEPENDS_${PN} += "fbset devmem2"
> +
> +#HACK! These are binaries, so we can't guarantee that LDFLAGS match :(
> +INSANE_SKIP_${PN} = "ldflags dev-so"
> +INSANE_SKIP_${PN}-es3 = "ldflags dev-so staticdev"
> +INSANE_SKIP_${PN}-es5 = "ldflags dev-so staticdev"
> +INSANE_SKIP_${PN}-es6 = "ldflags dev-so staticdev"
> +INSANE_SKIP_${PN}-es8 = "ldflags dev-so staticdev"
> +INSANE_SKIP_${PN}-x11demos = "ldflags dev-so useless-rpaths"
> +INSANE_SKIP_${PN}-x11wsegl = "ldflags dev-so"
> +INSANE_SKIP_${PN}-x11wsegl-es3 = "ldflags dev-so"
> +INSANE_SKIP_${PN}-x11wsegl-es5 = "ldflags dev-so"
> +INSANE_SKIP_${PN}-x11wsegl-es6 = "ldflags dev-so"
> +INSANE_SKIP_${PN}-x11wsegl-es8 = "ldflags dev-so"
> +INSANE_SKIP_${PN}-driwsegl = "ldflags dev-so"
> +INSANE_SKIP_${PN}-driwsegl-es3 = "ldflags dev-so"
> +INSANE_SKIP_${PN}-driwsegl-es5 = "ldflags dev-so"
> +INSANE_SKIP_${PN}-driwsegl-es6 = "ldflags dev-so"
> +INSANE_SKIP_${PN}-driwsegl-es8 = "ldflags dev-so"
> +INSANE_SKIP_${PN}-tests = "ldflags"
> +INSANE_SKIP_xserver-kdrive-powervrsgx = "ldflags"
> +INSANE_SKIP_${PN}-dev = "ldflags dev-so"
> +
> +inherit update-rc.d
> +
> +INITSCRIPT_NAME = "pvr-init"
> +INITSCRIPT_PARAMS = "start 30 5 2 . stop 40 0 1 6 ."
> +
> +# Append to update-rc.d postinst
> +pkg_postinst_${PN}_append() {
> +rm -f $D${sysconfdir}/powervr-esrev
> +
> +ln -sf /usr/lib/libXdmcp.so.6.0.0 /usr/lib/libXdmcp.so.0
> +ln -sf /usr/lib/libXau.so.6.0.0 /usr/lib/libXau.so.0
> +
> +
> +}
> +
> +pkg_postinst_${PN}-x11wsegl() {
> +rm -f $D${sysconfdir}/powervr-esrev
> +
> +echo "[default]" > $D${sysconfdir}/powervr.ini
> +echo "WindowSystem=libpvrPVR2D_X11WSEGL.so.1" >> $D${sysconfdir}/powervr.ini
> +}
> +
> +pkg_postinst_${PN}-driwsegl() {
> +rm -f $D${sysconfdir}/powervr-esrev
> +}
> +
> diff --git a/recipes-graphics/libgles/libgles-omap3-x11_4.09.00.01.bb b/recipes-graphics/libgles/libgles-omap3-x11_4.09.00.01.bb
> new file mode 100644
> index 0000000..0e71275
> --- /dev/null
> +++ b/recipes-graphics/libgles/libgles-omap3-x11_4.09.00.01.bb
> @@ -0,0 +1,58 @@
> +require libgles-omap3-x11.inc
> +
> +LICENSE = "TSPA"
> +
> +DEFAULT_PREFERENCE = "-1"
> +
> +BINLOCATION_omap3  = "${S}/gfx_rel_es3.x"
> +BINLOCATION_ti816x = "${S}/gfx_rel_es6.x"
> +BINLOCATION_ti814x = "${S}/gfx_rel_es6.x"
> +BINLOCATION_ti33x = "${S}/gfx_rel_es8.x"
> +
> +PLATFORM = "LinuxARMV7"
> +PVR_INIT = "pvrsrvctl"
> +
> +# download required binary distribution from:
> +# http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/latest/index_FDS.html
> +# see libgles-omap3-x11.inc for detailed installation instructions
> +
> +SGXPV = "4_09_00_01"
> +IMGPV = "1.9.2188537"
> +BINFILE = "Graphics_SDK_setuplinux_${SGXPV}_minimal_demos.bin"
> +TI_BIN_UNPK_WDEXT := "/Graphics_SDK_${SGXPV}"
> +SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/${SGXPV}/exports/${BINFILE} \
> +           file://cputype \
> +           file://rc_dri.pvr \
> +           file://sample.desktop \
> +           file://99-bufferclass.rules  \
> +"
> +SRC_URI[md5sum] = "bd35e9d8843aff3a2aca9d41e7db1c7d"
> +SRC_URI[sha256sum] = "eb37f75ddde4640b09e760fa86e689beb394330ecdf68786188c34f249247647"
> +
> +S = "${WORKDIR}/Graphics_SDK_${SGXPV}"
> +
> +LIBGLESWINDOWSYSTEM ?= "libpvrPVR2D_DRIWSEGL.so"
> +
> +do_configure_append() {
> +    # Change PVR server's user mode library to point to DRI
> +    for drifile in $(find ${S} -name "libsrv_um_dri.so"); do
> +    if [ "$drifile" != "" ]
> +    then
> +        dir=$(dirname ${drifile})
> +        if [ "$SUPPORT_XORG" = "1" ]
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
> +    cp -pP ${WORKDIR}/rc_dri.pvr ${D}${sysconfdir}/init.d/pvr-init
> +}
> +
> +RRECOMMENDS_${PN}-x11demos = "${PN}-driwsegl"
> +RRECOMMENDS_${PN}-x11trainingcourses = "${PN}-driwsegl"
> -- 
> 1.7.1
> 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
> 

