Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3A5ECE005BB
	for <meta-ti@yoctoproject.org>; Thu, 21 Nov 2013 18:34:47 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id rAM2YkGp018558
	for <meta-ti@yoctoproject.org>; Thu, 21 Nov 2013 20:34:46 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id rAM2YkfX031207
	for <meta-ti@yoctoproject.org>; Thu, 21 Nov 2013 20:34:46 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 21 Nov 2013 20:34:45 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id rAM2Yj4b015313;
	Thu, 21 Nov 2013 20:34:45 -0600
Date: Thu, 21 Nov 2013 21:34:45 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Franklin S. Cooper Jr" <fcooper@ti.com>
Message-ID: <20131122023444.GA690@edge>
References: <1384880351-6571-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
In-Reply-To: <1384880351-6571-1-git-send-email-fcooper@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 1/4] libgles-omap3: Add support for AM43x in common libgles-omap3 include files
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
X-List-Received-Date: Fri, 22 Nov 2013 02:34:48 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

See one comment inline below.


On Tue, Nov 19, 2013 at 10:59:08AM -0600, Franklin S. Cooper Jr wrote:
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  recipes-graphics/libgles/libgles-omap3-no-x.inc |   34 ++++++++++++++++-------
>  recipes-graphics/libgles/libgles-omap3-x11.inc  |   26 ++++++++++++-----
>  2 files changed, 42 insertions(+), 18 deletions(-)
> 
> diff --git a/recipes-graphics/libgles/libgles-omap3-no-x.inc b/recipes-graphics/libgles/libgles-omap3-no-x.inc
> index 83873d7..1449233 100644
> --- a/recipes-graphics/libgles/libgles-omap3-no-x.inc
> +++ b/recipes-graphics/libgles/libgles-omap3-no-x.inc
> @@ -3,11 +3,11 @@ LICENSE = "proprietary-binary"
>  # 'TSPA.txt' might not be the best file to md5sum
>  LIC_FILES_CHKSUM = "file://TSPA.txt;md5=c0d5d9c1e38b41677144c4e24d6ddee1"
>  
> -INC_PR = "r37"
> +INC_PR = "r38"
>  
>  EXCLUDE_FROM_WORLD = "1"
>  
> -COMPATIBLE_MACHINE = "(omap3|ti814x|ti816x|ti33x)"
> +COMPATIBLE_MACHINE = "(omap3|ti814x|ti816x|ti33x|ti43x)"
>  
>  PVR_INIT ?= "pvrsrvinit"
>  
> @@ -42,6 +42,7 @@ export ES3LOCATION ?= "${S}/gfx_rel_es3.x"
>  export ES5LOCATION ?= "${S}/gfx_rel_es5.x"
>  export ES6LOCATION ?= "${S}/gfx_rel_es6.x"
>  export ES8LOCATION ?= "${S}/gfx_rel_es8.x"
> +export ES9LOCATION ?= "${S}/gfx_rel_es9.x"
>  
>  LIBGLESWINDOWSYSTEM ?= "libpvrPVR2D_FRONTWSEGL.so.1"
>  
> @@ -157,11 +158,13 @@ do_install () {
>  
>  	#Create different folders for ease of installing into different platforms with different display drivers/ SGX core
>  
> +	install -d ${D}${libdir}/ES9.0
>  	install -d ${D}${libdir}/ES8.0
>  	install -d ${D}${libdir}/ES6.0
>  	install -d ${D}${libdir}/ES5.0
>  	install -d ${D}${libdir}/ES3.0
>  
> +	install -d ${D}${bindir}/ES9.0
>  	install -d ${D}${bindir}/ES8.0
>  	install -d ${D}${bindir}/ES6.0
>  	install -d ${D}${bindir}/ES5.0
> @@ -170,7 +173,7 @@ do_install () {
>  	shared_prog="eglinfo pvr2d_test ${PVR_INIT} services_test sgx_blit_test sgx_clipblit_test sgx_flip_test sgx_init_test sgx_render_flip_test"
>  	raw_prog="gles1test1 gles2test1"
>  
> -	for esrev in 3 5 6 8 ; do
> +	for esrev in 3 5 6 8 9 ; do
>  		ESLOCATION=$(eval echo $(echo \$\{ES${esrev}LOCATION\}))
>  		if [ -e ${ESLOCATION} ] ; then
>  			cp -pPR ${ESLOCATION}/lib*${IMGPV} ${ESLOCATION}/pvr_drv.so ${ESLOCATION}/*.a ${D}${libdir}/ES${esrev}.0/
> @@ -199,18 +202,21 @@ do_install () {
>  
>  PACKAGES =+ "${PN}-rawdemos ${PN}-rawtrainingcourses ${PN}-tests"
>  # Package the base libraries per silicon revision
> -PACKAGES =+ "${PN}-es3 ${PN}-es5 ${PN}-es6 ${PN}-es8"
> -RRECOMMENDS_${PN} += "${PN}-es3 ${PN}-es5 ${PN}-es6 ${PN}-es8"
> +PACKAGES =+ "${PN}-es3 ${PN}-es5 ${PN}-es6 ${PN}-es8 ${PN}-es9"
> +RRECOMMENDS_${PN} += "${PN}-es3 ${PN}-es5 ${PN}-es6 ${PN}-es8 ${PN}-es9"
>  FILES_${PN}-es3 = "${libdir}/ES3*/* ${bindir}/ES3*/*"
>  FILES_${PN}-es5 = "${libdir}/ES5*/* ${bindir}/ES5*/*"
>  FILES_${PN}-es6 = "${libdir}/ES6*/* ${bindir}/ES6*/*"
>  FILES_${PN}-es8 = "${libdir}/ES8*/* ${bindir}/ES8*/*"
> +FILES_${PN}-es9 = "${libdir}/ES9*/* ${bindir}/ES9*/*"
>  
>  # Stop shlib code from picking a subpackage
>  PRIVATE_LIBS_${PN}-es3 = "libGLESv2.so libIMGegl.so libsrv_um.so libpvr2d.so libsrv_init.so libEGL.so libsrv_um_dri.so libglslcompiler.so libGLES_CM.so"
>  PRIVATE_LIBS_${PN}-es5 = "libGLESv2.so libIMGegl.so libsrv_um.so libpvr2d.so libsrv_init.so libEGL.so libsrv_um_dri.so libglslcompiler.so libGLES_CM.so"
>  PRIVATE_LIBS_${PN}-es6 = "libGLESv2.so libIMGegl.so libsrv_um.so libpvr2d.so libsrv_init.so libEGL.so libsrv_um_dri.so libglslcompiler.so libGLES_CM.so"
>  PRIVATE_LIBS_${PN}-es8 = "libGLESv2.so libIMGegl.so libsrv_um.so libpvr2d.so libsrv_init.so libEGL.so libsrv_um_dri.so libglslcompiler.so libGLES_CM.so"
> +PRIVATE_LIBS_${PN}-es9 = "libGLESv2.so libIMGegl.so libsrv_um.so libpvr2d.so libsrv_init.so libEGL.so libsrv_um_dri.so libglslcompiler.so libGLES_CM.so"
> +
>  
>  RPROVIDES_${PN} += "libGLESv2.so libEGL.so libGLES_CM.so libpvr2d.so libIMGegl.so libsrv_init.so libsrv_um.so libsrv_um_dri.so libglslcompiler.so"
>  
> @@ -220,31 +226,35 @@ FILES_${PN}-flipwsegl = "${libdir}/libpvrPVR2D_FLIPWSEGL.so.*"
>  FILES_${PN}-frontwsegl = "${libdir}/libpvrPVR2D_FRONTWSEGL.so.*"
>  FILES_${PN}-linuxfbwsegl = "${libdir}/libpvrPVR2D_LINUXFBWSEGL.so.*"
>  
> -PACKAGES =+ "${PN}-blitwsegl-es3 ${PN}-blitwsegl-es5 ${PN}-blitwsegl-es6 ${PN}-blitwsegl-es8 ${PN}-flipwsegl-es3 ${PN}-flipwsegl-es5 ${PN}-flipwsegl-es6 ${PN}-flipwsegl-es8 ${PN}-frontwsegl-es3 ${PN}-frontwsegl-es5 ${PN}-frontwsegl-es6 ${PN}-frontwsegl-es8 ${PN}-linuxfbwsegl-es3 ${PN}-linuxfbwsegl-es5 ${PN}-linuxfbwsegl-es6 ${PN}-linuxfbwsegl-es8"
> +PACKAGES =+ "${PN}-blitwsegl-es3 ${PN}-blitwsegl-es5 ${PN}-blitwsegl-es6 ${PN}-blitwsegl-es8 ${PN}-blitwsegl-es9 ${PN}-flipwsegl-es3 ${PN}-flipwsegl-es5 ${PN}-flipwsegl-es6 ${PN}-flipwsegl-es8 ${PN}-flipwsegl-es9 ${PN}-frontwsegl-es3 ${PN}-frontwsegl-es5 ${PN}-frontwsegl-es6 ${PN}-frontwsegl-es8 ${PN}-frontwsegl-es9 ${PN}-linuxfbwsegl-es3 ${PN}-linuxfbwsegl-es5 ${PN}-linuxfbwsegl-es6 ${PN}-linuxfbwsegl-es8 ${PN}-linuxfbwsegl-es9"
>  
>  FILES_${PN}-blitwsegl-es3 = "${libdir}/ES3*/libpvrPVR2D_BLITWSEGL.so.*"
>  FILES_${PN}-blitwsegl-es5 = "${libdir}/ES5*/libpvrPVR2D_BLITWSEGL.so.*"
>  FILES_${PN}-blitwsegl-es6 = "${libdir}/ES6*/libpvrPVR2D_BLITWSEGL.so.*"
>  FILES_${PN}-blitwsegl-es8 = "${libdir}/ES8*/libpvrPVR2D_BLITWSEGL.so.*"
> -RRECOMMENDS_${PN}-blitwsegl = " ${PN}-blitwsegl-es3 ${PN}-blitwsegl-es5 ${PN}-blitwsegl-es6 ${PN}-blitwsegl-es8"
> +FILES_${PN}-blitwsegl-es9 = "${libdir}/ES9*/libpvrPVR2D_BLITWSEGL.so.*"
> +RRECOMMENDS_${PN}-blitwsegl = " ${PN}-blitwsegl-es3 ${PN}-blitwsegl-es5 ${PN}-blitwsegl-es6 ${PN}-blitwsegl-es8 ${PN}-blitwsegl-es9"
>  
>  FILES_${PN}-flipwsegl-es3 = "${libdir}/ES3*/libpvrPVR2D_FLIPWSEGL.so.*"
>  FILES_${PN}-flipwsegl-es5 = "${libdir}/ES5*/libpvrPVR2D_FLIPWSEGL.so.*"
>  FILES_${PN}-flipwsegl-es6 = "${libdir}/ES6*/libpvrPVR2D_FLIPWSEGL.so.*"
>  FILES_${PN}-flipwsegl-es8 = "${libdir}/ES8*/libpvrPVR2D_FLIPWSEGL.so.*"
> -RRECOMMENDS_${PN}-flipwsegl = " ${PN}-flipwsegl-es3 ${PN}-flipwsegl-es5 ${PN}-flipwsegl-es6 ${PN}-flipwsegl-es8"
> +FILES_${PN}-flipwsegl-es9 = "${libdir}/ES8*/libpvrPVR2D_FLIPWSEGL.so.*"

There is a typo in this line ^^^ it packages flipwsegl-es9 from /ES8/ dir.


> +RRECOMMENDS_${PN}-flipwsegl = " ${PN}-flipwsegl-es3 ${PN}-flipwsegl-es5 ${PN}-flipwsegl-es6 ${PN}-flipwsegl-es8 ${PN}-flipwsegl-es9"
>  
>  FILES_${PN}-frontwsegl-es3 = "${libdir}/ES3*/libpvrPVR2D_FRONTWSEGL.so.*"
>  FILES_${PN}-frontwsegl-es5 = "${libdir}/ES5*/libpvrPVR2D_FRONTWSEGL.so.*"
>  FILES_${PN}-frontwsegl-es6 = "${libdir}/ES6*/libpvrPVR2D_FRONTWSEGL.so.*"
>  FILES_${PN}-frontwsegl-es8 = "${libdir}/ES8*/libpvrPVR2D_FRONTWSEGL.so.*"
> -RRECOMMENDS_${PN}-frontwsegl = " ${PN}-frontwsegl-es3 ${PN}-frontwsegl-es5 ${PN}-frontwsegl-es6 ${PN}-frontwsegl-es8"
> +FILES_${PN}-frontwsegl-es9 = "${libdir}/ES9*/libpvrPVR2D_FRONTWSEGL.so.*"
> +RRECOMMENDS_${PN}-frontwsegl = " ${PN}-frontwsegl-es3 ${PN}-frontwsegl-es5 ${PN}-frontwsegl-es6 ${PN}-frontwsegl-es8 ${PN}-frontwsegl-es9"
>  
>  FILES_${PN}-linuxfbwsegl-es3 = "${libdir}/ES3*/libpvrPVR2D_LINUXFBWSEGL.so.*"
>  FILES_${PN}-linuxfbwsegl-es5 = "${libdir}/ES5*/libpvrPVR2D_LINUXFBWSEGL.so.*"
>  FILES_${PN}-linuxfbwsegl-es6 = "${libdir}/ES6*/libpvrPVR2D_LINUXFBWSEGL.so.*"
>  FILES_${PN}-linuxfbwsegl-es8 = "${libdir}/ES8*/libpvrPVR2D_LINUXFBWSEGL.so.*"
> -RRECOMMENDS_${PN}-linuxfbwsegl = " ${PN}-linuxfbwsegl-es3 ${PN}-linuxfbwsegl-es5 ${PN}-linuxfbwsegl-es6 ${PN}-linuxfbwsegl-es8"
> +FILES_${PN}-linuxfbwsegl-es9 = "${libdir}/ES9*/libpvrPVR2D_LINUXFBWSEGL.so.*"
> +RRECOMMENDS_${PN}-linuxfbwsegl = " ${PN}-linuxfbwsegl-es3 ${PN}-linuxfbwsegl-es5 ${PN}-linuxfbwsegl-es6 ${PN}-linuxfbwsegl-es8 ${PN}-linuxfbwsegl-es9"
>  
>  CONFFILES_${PN} = "${sysconfdir}/powervr.ini"
>  
> @@ -279,21 +289,25 @@ INSANE_SKIP_${PN}-blitwsegl-es3 = "ldflags"
>  INSANE_SKIP_${PN}-blitwsegl-es5 = "ldflags"
>  INSANE_SKIP_${PN}-blitwsegl-es6 = "ldflags"
>  INSANE_SKIP_${PN}-blitwsegl-es8 = "ldflags"
> +INSANE_SKIP_${PN}-blitwsegl-es9 = "ldflags"
>  INSANE_SKIP_${PN}-flipwsegl = "ldflags"
>  INSANE_SKIP_${PN}-flipwsegl-es3 = "ldflags"
>  INSANE_SKIP_${PN}-flipwsegl-es5 = "ldflags"
>  INSANE_SKIP_${PN}-flipwsegl-es6 = "ldflags"
>  INSANE_SKIP_${PN}-flipwsegl-es8 = "ldflags"
> +INSANE_SKIP_${PN}-flipwsegl-es9 = "ldflags"
>  INSANE_SKIP_${PN}-frontwsegl = "ldflags"
>  INSANE_SKIP_${PN}-frontwsegl-es3 = "ldflags"
>  INSANE_SKIP_${PN}-frontwsegl-es5 = "ldflags"
>  INSANE_SKIP_${PN}-frontwsegl-es6 = "ldflags"
>  INSANE_SKIP_${PN}-frontwsegl-es8 = "ldflags"
> +INSANE_SKIP_${PN}-frontwsegl-es9 = "ldflags"
>  INSANE_SKIP_${PN}-linuxfbwsegl = "ldflags"
>  INSANE_SKIP_${PN}-linuxfbwsegl-es3 = "ldflags"
>  INSANE_SKIP_${PN}-linuxfbwsegl-es5 = "ldflags"
>  INSANE_SKIP_${PN}-linuxfbwsegl-es6 = "ldflags"
>  INSANE_SKIP_${PN}-linuxfbwsegl-es8 = "ldflags"
> +INSANE_SKIP_${PN}-linuxfbwsegl-es9 = "ldflags"
>  INSANE_SKIP_${PN}-tests = "ldflags"
>  
>  # Quality control is really poor on these SDKs, so hack around the latest madness:
> diff --git a/recipes-graphics/libgles/libgles-omap3-x11.inc b/recipes-graphics/libgles/libgles-omap3-x11.inc
> index 106a9bc..76ef5b3 100644
> --- a/recipes-graphics/libgles/libgles-omap3-x11.inc
> +++ b/recipes-graphics/libgles/libgles-omap3-x11.inc
> @@ -3,11 +3,11 @@ LICENSE = "proprietary-binary"
>  # 'TSPA.txt' might not be the best file to md5sum
>  LIC_FILES_CHKSUM = "file://TSPA.txt;md5=c0d5d9c1e38b41677144c4e24d6ddee1"
>  
> -INC_PR = "r37"
> +INC_PR = "r38"
>  
>  EXCLUDE_FROM_WORLD = "1"
>  
> -COMPATIBLE_MACHINE = "(omap3|ti814x|ti816x|ti33x)"
> +COMPATIBLE_MACHINE = "(omap3|ti814x|ti816x|ti33x|ti43x)"
>  
>  DEPENDS = "virtual/libx11 libxau libxdmcp libdrm"
>  
> @@ -46,6 +46,7 @@ export ES3LOCATION ?= "${S}/gfx_rel_es3.x"
>  export ES5LOCATION ?= "${S}/gfx_rel_es5.x"
>  export ES6LOCATION ?= "${S}/gfx_rel_es6.x"
>  export ES8LOCATION ?= "${S}/gfx_rel_es8.x"
> +export ES9LOCATION ?= "${S}/gfx_rel_es9.x"
>  
>  LIBGLESWINDOWSYSTEM ?= "libpvrPVR2D_DRIWSEGL.so"
>  
> @@ -174,11 +175,13 @@ do_install () {
>  
>  	# The ES3.x, ES5.x and ES6.x CPUs have different SGX hardware, so we need to install multiple sets of userspace
>  
> +	install -d ${D}${libdir}/ES9.0
>  	install -d ${D}${libdir}/ES8.0
>  	install -d ${D}${libdir}/ES6.0
>  	install -d ${D}${libdir}/ES5.0
>  	install -d ${D}${libdir}/ES3.0
>  
> +	install -d ${D}${bindir}/ES9.0
>  	install -d ${D}${bindir}/ES8.0
>  	install -d ${D}${bindir}/ES6.0
>  	install -d ${D}${bindir}/ES5.0
> @@ -186,7 +189,7 @@ do_install () {
>  
>  	x11_prog="eglinfo_x xgles1test1 xgles2test1 xmultiegltest"
>  
> -	for esrev in 3 5 6 8 ; do
> +	for esrev in 3 5 6 8 9; do
>  		ESLOCATION=$(eval echo $(echo \$\{ES${esrev}LOCATION\}))
>  		if [ -e ${ESLOCATION} ] ; then
>  			cp -pPR ${ESLOCATION}/lib*${IMGPV} ${ESLOCATION}/pvr_drv.so ${ESLOCATION}/*.a ${D}${libdir}/ES${esrev}.0/
> @@ -219,38 +222,42 @@ do_install () {
>  PACKAGES =+ "${PN}-x11demos ${PN}-x11trainingcourses xserver-kdrive-powervrsgx"
>  
>  # Package the base libraries per silicon revision
> -PACKAGES =+ "${PN}-es3 ${PN}-es5 ${PN}-es6 ${PN}-es8"
> -RRECOMMENDS_${PN} += "${PN}-es3 ${PN}-es5 ${PN}-es6 ${PN}-es8"
> +PACKAGES =+ "${PN}-es3 ${PN}-es5 ${PN}-es6 ${PN}-es8 ${PN}-es9"
> +RRECOMMENDS_${PN} += "${PN}-es3 ${PN}-es5 ${PN}-es6 ${PN}-es8 ${PN}-es9"
>  FILES_${PN}-es3 = "${libdir}/ES3*/* ${bindir}/ES3*/*"
>  FILES_${PN}-es5 = "${libdir}/ES5*/* ${bindir}/ES5*/*"
>  FILES_${PN}-es6 = "${libdir}/ES6*/* ${bindir}/ES6*/*"
>  FILES_${PN}-es8 = "${libdir}/ES8*/* ${bindir}/ES8*/*"
> +FILES_${PN}-es9 = "${libdir}/ES9*/* ${bindir}/ES9*/*"
>  
>  # Stop shlib code from picking a subpackage
>  PRIVATE_LIBS_${PN}-es3 = "libGLESv2.so libIMGegl.so libsrv_um.so libOpenVG.so libpvr2d.so libsrv_init.so libEGL.so libsrv_um_dri.so libOpenVGU.so libglslcompiler.so libGLES_CM.so"
>  PRIVATE_LIBS_${PN}-es5 = "libGLESv2.so libIMGegl.so libsrv_um.so libOpenVG.so libpvr2d.so libsrv_init.so libEGL.so libsrv_um_dri.so libOpenVGU.so libglslcompiler.so libGLES_CM.so"
>  PRIVATE_LIBS_${PN}-es6 = "libGLESv2.so libIMGegl.so libsrv_um.so libOpenVG.so libpvr2d.so libsrv_init.so libEGL.so libsrv_um_dri.so libOpenVGU.so libglslcompiler.so libGLES_CM.so"
>  PRIVATE_LIBS_${PN}-es8 = "libGLESv2.so libIMGegl.so libsrv_um.so libOpenVG.so libpvr2d.so libsrv_init.so libEGL.so libsrv_um_dri.so libOpenVGU.so libglslcompiler.so libGLES_CM.so"
> +PRIVATE_LIBS_${PN}-es9 = "libGLESv2.so libIMGegl.so libsrv_um.so libOpenVG.so libpvr2d.so libsrv_init.so libEGL.so libsrv_um_dri.so libOpenVGU.so libglslcompiler.so libGLES_CM.so"
>  
>  PACKAGES =+ "${PN}-x11wsegl ${PN}-driwsegl"
>  FILES_${PN}-x11wsegl = "${libdir}/libpvrPVR2D_X11WSEGL.so* ${bindir}/x* ${bindir}/*x"
>  FILES_${PN}-driwsegl = "${libdir}/libpvrPVR2D_DRIWSEGL.so* ${libdir}/libsrv_um_dri*"
>  
> -X11_SEGL = " ${PN}-x11wsegl-es2 ${PN}-x11wsegl-es3 ${PN}-x11wsegl-es5 ${PN}-x11wsegl-es6 ${PN}-x11wsegl-es8 ${PN}-driwsegl-es2 ${PN}-driwsegl-es3 ${PN}-driwsegl-es5 ${PN}-driwsegl-es6 ${PN}-driwsegl-es8 "
> +X11_SEGL = " ${PN}-x11wsegl-es2 ${PN}-x11wsegl-es3 ${PN}-x11wsegl-es5 ${PN}-x11wsegl-es6 ${PN}-x11wsegl-es8 ${PN}-x11wsegl-es9 ${PN}-driwsegl-es2 ${PN}-driwsegl-es3 ${PN}-driwsegl-es5 ${PN}-driwsegl-es6 ${PN}-driwsegl-es8 ${PN}-driwsegl-es9"
>  PACKAGES =+ "${X11_SEGL}"
>  FILES_${PN}-x11wsegl-es2 = "${libdir}/ES2*/libpvrPVR2D_X11WSEGL.so.* ${bindir}/ES2*/x* ${bindir}/ES2*/*x"
>  FILES_${PN}-x11wsegl-es3 = "${libdir}/ES3*/libpvrPVR2D_X11WSEGL.so.* ${bindir}/ES3*/x* ${bindir}/ES3*/*x"
>  FILES_${PN}-x11wsegl-es5 = "${libdir}/ES5*/libpvrPVR2D_X11WSEGL.so.* ${bindir}/ES5*/x* ${bindir}/ES5*/*x"
>  FILES_${PN}-x11wsegl-es6 = "${libdir}/ES6*/libpvrPVR2D_X11WSEGL.so.* ${bindir}/ES6*/x* ${bindir}/ES6*/*x"
>  FILES_${PN}-x11wsegl-es8 = "${libdir}/ES8*/libpvrPVR2D_X11WSEGL.so.* ${bindir}/ES8*/x* ${bindir}/ES8*/*x"
> -RRECOMMENDS_${PN}-x11wsegl = " ${PN}-x11wsegl-es2 ${PN}-x11wsegl-es3 ${PN}-x11wsegl-es5 ${PN}-x11wsegl-es6 ${PN}-x11wsegl-es8"
> +FILES_${PN}-x11wsegl-es9 = "${libdir}/ES9*/libpvrPVR2D_X11WSEGL.so.* ${bindir}/ES9*/x* ${bindir}/ES9*/*x"
> +RRECOMMENDS_${PN}-x11wsegl = " ${PN}-x11wsegl-es2 ${PN}-x11wsegl-es3 ${PN}-x11wsegl-es5 ${PN}-x11wsegl-es6 ${PN}-x11wsegl-es8 ${PN}-x11wsegl-es9"
>  
>  FILES_${PN}-driwsegl-es2 = "${libdir}/ES2*/libpvrPVR2D_DRIWSEGL.so.* ${libdir}/ES2*/libsrv_um_dri*"
>  FILES_${PN}-driwsegl-es3 = "${libdir}/ES3*/libpvrPVR2D_DRIWSEGL.so.* ${libdir}/ES3*/libsrv_um_dri*"
>  FILES_${PN}-driwsegl-es5 = "${libdir}/ES5*/libpvrPVR2D_DRIWSEGL.so.* ${libdir}/ES5*/libsrv_um_dri*"
>  FILES_${PN}-driwsegl-es6 = "${libdir}/ES6*/libpvrPVR2D_DRIWSEGL.so.* ${libdir}/ES6*/libsrv_um_dri*"
>  FILES_${PN}-driwsegl-es8 = "${libdir}/ES8*/libpvrPVR2D_DRIWSEGL.so.* ${libdir}/ES8*/libsrv_um_dri*"
> -RRECOMMENDS_${PN}-driwsegl = " ${PN}-driwsegl-es2 ${PN}-driwsegl-es3 ${PN}-driwsegl-es5 ${PN}-driwsegl-es6 ${PN}-driwsegl-es8"
> +FILES_${PN}-driwsegl-es9 = "${libdir}/ES9*/libpvrPVR2D_DRIWSEGL.so.* ${libdir}/ES9*/libsrv_um_dri*"
> +RRECOMMENDS_${PN}-driwsegl = " ${PN}-driwsegl-es2 ${PN}-driwsegl-es3 ${PN}-driwsegl-es5 ${PN}-driwsegl-es6 ${PN}-driwsegl-es8 ${PN}-driwsegl-es9"
>  
>  CONFFILES_${PN} = "${sysconfdir}/powervr.ini"
>  
> @@ -282,17 +289,20 @@ INSANE_SKIP_${PN}-es3 = "ldflags dev-so staticdev"
>  INSANE_SKIP_${PN}-es5 = "ldflags dev-so staticdev"
>  INSANE_SKIP_${PN}-es6 = "ldflags dev-so staticdev"
>  INSANE_SKIP_${PN}-es8 = "ldflags dev-so staticdev"
> +INSANE_SKIP_${PN}-es9 = "ldflags dev-so staticdev"
>  INSANE_SKIP_${PN}-x11demos = "ldflags dev-so useless-rpaths"
>  INSANE_SKIP_${PN}-x11wsegl = "ldflags dev-so"
>  INSANE_SKIP_${PN}-x11wsegl-es3 = "ldflags dev-so"
>  INSANE_SKIP_${PN}-x11wsegl-es5 = "ldflags dev-so"
>  INSANE_SKIP_${PN}-x11wsegl-es6 = "ldflags dev-so"
>  INSANE_SKIP_${PN}-x11wsegl-es8 = "ldflags dev-so"
> +INSANE_SKIP_${PN}-x11wsegl-es9 = "ldflags dev-so"
>  INSANE_SKIP_${PN}-driwsegl = "ldflags dev-so"
>  INSANE_SKIP_${PN}-driwsegl-es3 = "ldflags dev-so"
>  INSANE_SKIP_${PN}-driwsegl-es5 = "ldflags dev-so"
>  INSANE_SKIP_${PN}-driwsegl-es6 = "ldflags dev-so"
>  INSANE_SKIP_${PN}-driwsegl-es8 = "ldflags dev-so"
> +INSANE_SKIP_${PN}-driwsegl-es9 = "ldflags dev-so"
>  INSANE_SKIP_${PN}-tests = "ldflags"
>  INSANE_SKIP_xserver-kdrive-powervrsgx = "ldflags"
>  INSANE_SKIP_${PN}-dev = "ldflags dev-so"
> -- 
> 1.7.0.4
> 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

