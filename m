Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3894AE00507
	for <meta-ti@yoctoproject.org>; Tue, 19 Nov 2013 12:21:08 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id rAJKL8OE000446
	for <meta-ti@yoctoproject.org>; Tue, 19 Nov 2013 14:21:08 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id rAJKL7DQ024862
	for <meta-ti@yoctoproject.org>; Tue, 19 Nov 2013 14:21:07 -0600
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.02.0342.003; Tue, 19 Nov 2013 14:21:07 -0600
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [PATCH 1/4] libgles-omap3: Add support for AM43x in
	common libgles-omap3 include files
Thread-Index: AQHO5UA3FY5sjgSYhU2O7rRVQ6Uq8pos/zpg
Date: Tue, 19 Nov 2013 20:21:07 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED10159839E9A@DLEE11.ent.ti.com>
References: <1384880351-6571-1-git-send-email-fcooper@ti.com>
In-Reply-To: <1384880351-6571-1-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 1/4] libgles-omap3: Add support for AM43x in	common libgles-omap3 include files
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
X-List-Received-Date: Tue, 19 Nov 2013 20:21:12 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Acked-by: Chase Maupin <chase.maupin@ti.com>

>-----Original Message-----
>From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
>bounces@yoctoproject.org] On Behalf Of Cooper Jr., Franklin
>Sent: Tuesday, November 19, 2013 10:59 AM
>To: meta-ti@yoctoproject.org
>Subject: [meta-ti] [PATCH 1/4] libgles-omap3: Add support for
>AM43x in common libgles-omap3 include files
>
>Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
>---
> recipes-graphics/libgles/libgles-omap3-no-x.inc |   34
>++++++++++++++++-------
> recipes-graphics/libgles/libgles-omap3-x11.inc  |   26
>++++++++++++-----
> 2 files changed, 42 insertions(+), 18 deletions(-)
>
>diff --git a/recipes-graphics/libgles/libgles-omap3-no-x.inc
>b/recipes-graphics/libgles/libgles-omap3-no-x.inc
>index 83873d7..1449233 100644
>--- a/recipes-graphics/libgles/libgles-omap3-no-x.inc
>+++ b/recipes-graphics/libgles/libgles-omap3-no-x.inc
>@@ -3,11 +3,11 @@ LICENSE =3D "proprietary-binary"
> # 'TSPA.txt' might not be the best file to md5sum
> LIC_FILES_CHKSUM =3D
>"file://TSPA.txt;md5=3Dc0d5d9c1e38b41677144c4e24d6ddee1"
>
>-INC_PR =3D "r37"
>+INC_PR =3D "r38"
>
> EXCLUDE_FROM_WORLD =3D "1"
>
>-COMPATIBLE_MACHINE =3D "(omap3|ti814x|ti816x|ti33x)"
>+COMPATIBLE_MACHINE =3D "(omap3|ti814x|ti816x|ti33x|ti43x)"
>
> PVR_INIT ?=3D "pvrsrvinit"
>
>@@ -42,6 +42,7 @@ export ES3LOCATION ?=3D "${S}/gfx_rel_es3.x"
> export ES5LOCATION ?=3D "${S}/gfx_rel_es5.x"
> export ES6LOCATION ?=3D "${S}/gfx_rel_es6.x"
> export ES8LOCATION ?=3D "${S}/gfx_rel_es8.x"
>+export ES9LOCATION ?=3D "${S}/gfx_rel_es9.x"
>
> LIBGLESWINDOWSYSTEM ?=3D "libpvrPVR2D_FRONTWSEGL.so.1"
>
>@@ -157,11 +158,13 @@ do_install () {
>
> 	#Create different folders for ease of installing into
>different platforms with different display drivers/ SGX core
>
>+	install -d ${D}${libdir}/ES9.0
> 	install -d ${D}${libdir}/ES8.0
> 	install -d ${D}${libdir}/ES6.0
> 	install -d ${D}${libdir}/ES5.0
> 	install -d ${D}${libdir}/ES3.0
>
>+	install -d ${D}${bindir}/ES9.0
> 	install -d ${D}${bindir}/ES8.0
> 	install -d ${D}${bindir}/ES6.0
> 	install -d ${D}${bindir}/ES5.0
>@@ -170,7 +173,7 @@ do_install () {
> 	shared_prog=3D"eglinfo pvr2d_test ${PVR_INIT} services_test
>sgx_blit_test sgx_clipblit_test sgx_flip_test sgx_init_test
>sgx_render_flip_test"
> 	raw_prog=3D"gles1test1 gles2test1"
>
>-	for esrev in 3 5 6 8 ; do
>+	for esrev in 3 5 6 8 9 ; do
> 		ESLOCATION=3D$(eval echo $(echo
>\$\{ES${esrev}LOCATION\}))
> 		if [ -e ${ESLOCATION} ] ; then
> 			cp -pPR ${ESLOCATION}/lib*${IMGPV}
>${ESLOCATION}/pvr_drv.so ${ESLOCATION}/*.a
>${D}${libdir}/ES${esrev}.0/
>@@ -199,18 +202,21 @@ do_install () {
>
> PACKAGES =3D+ "${PN}-rawdemos ${PN}-rawtrainingcourses ${PN}-tests"
> # Package the base libraries per silicon revision
>-PACKAGES =3D+ "${PN}-es3 ${PN}-es5 ${PN}-es6 ${PN}-es8"
>-RRECOMMENDS_${PN} +=3D "${PN}-es3 ${PN}-es5 ${PN}-es6 ${PN}-es8"
>+PACKAGES =3D+ "${PN}-es3 ${PN}-es5 ${PN}-es6 ${PN}-es8 ${PN}-es9"
>+RRECOMMENDS_${PN} +=3D "${PN}-es3 ${PN}-es5 ${PN}-es6 ${PN}-es8
>${PN}-es9"
> FILES_${PN}-es3 =3D "${libdir}/ES3*/* ${bindir}/ES3*/*"
> FILES_${PN}-es5 =3D "${libdir}/ES5*/* ${bindir}/ES5*/*"
> FILES_${PN}-es6 =3D "${libdir}/ES6*/* ${bindir}/ES6*/*"
> FILES_${PN}-es8 =3D "${libdir}/ES8*/* ${bindir}/ES8*/*"
>+FILES_${PN}-es9 =3D "${libdir}/ES9*/* ${bindir}/ES9*/*"
>
> # Stop shlib code from picking a subpackage
> PRIVATE_LIBS_${PN}-es3 =3D "libGLESv2.so libIMGegl.so libsrv_um.so
>libpvr2d.so libsrv_init.so libEGL.so libsrv_um_dri.so
>libglslcompiler.so libGLES_CM.so"
> PRIVATE_LIBS_${PN}-es5 =3D "libGLESv2.so libIMGegl.so libsrv_um.so
>libpvr2d.so libsrv_init.so libEGL.so libsrv_um_dri.so
>libglslcompiler.so libGLES_CM.so"
> PRIVATE_LIBS_${PN}-es6 =3D "libGLESv2.so libIMGegl.so libsrv_um.so
>libpvr2d.so libsrv_init.so libEGL.so libsrv_um_dri.so
>libglslcompiler.so libGLES_CM.so"
> PRIVATE_LIBS_${PN}-es8 =3D "libGLESv2.so libIMGegl.so libsrv_um.so
>libpvr2d.so libsrv_init.so libEGL.so libsrv_um_dri.so
>libglslcompiler.so libGLES_CM.so"
>+PRIVATE_LIBS_${PN}-es9 =3D "libGLESv2.so libIMGegl.so libsrv_um.so
>libpvr2d.so libsrv_init.so libEGL.so libsrv_um_dri.so
>libglslcompiler.so libGLES_CM.so"
>+
>
> RPROVIDES_${PN} +=3D "libGLESv2.so libEGL.so libGLES_CM.so
>libpvr2d.so libIMGegl.so libsrv_init.so libsrv_um.so
>libsrv_um_dri.so libglslcompiler.so"
>
>@@ -220,31 +226,35 @@ FILES_${PN}-flipwsegl =3D
>"${libdir}/libpvrPVR2D_FLIPWSEGL.so.*"
> FILES_${PN}-frontwsegl =3D "${libdir}/libpvrPVR2D_FRONTWSEGL.so.*"
> FILES_${PN}-linuxfbwsegl =3D
>"${libdir}/libpvrPVR2D_LINUXFBWSEGL.so.*"
>
>-PACKAGES =3D+ "${PN}-blitwsegl-es3 ${PN}-blitwsegl-es5 ${PN}-
>blitwsegl-es6 ${PN}-blitwsegl-es8 ${PN}-flipwsegl-es3 ${PN}-
>flipwsegl-es5 ${PN}-flipwsegl-es6 ${PN}-flipwsegl-es8 ${PN}-
>frontwsegl-es3 ${PN}-frontwsegl-es5 ${PN}-frontwsegl-es6 ${PN}-
>frontwsegl-es8 ${PN}-linuxfbwsegl-es3 ${PN}-linuxfbwsegl-es5
>${PN}-linuxfbwsegl-es6 ${PN}-linuxfbwsegl-es8"
>+PACKAGES =3D+ "${PN}-blitwsegl-es3 ${PN}-blitwsegl-es5 ${PN}-
>blitwsegl-es6 ${PN}-blitwsegl-es8 ${PN}-blitwsegl-es9 ${PN}-
>flipwsegl-es3 ${PN}-flipwsegl-es5 ${PN}-flipwsegl-es6 ${PN}-
>flipwsegl-es8 ${PN}-flipwsegl-es9 ${PN}-frontwsegl-es3 ${PN}-
>frontwsegl-es5 ${PN}-frontwsegl-es6 ${PN}-frontwsegl-es8 ${PN}-
>frontwsegl-es9 ${PN}-linuxfbwsegl-es3 ${PN}-linuxfbwsegl-es5
>${PN}-linuxfbwsegl-es6 ${PN}-linuxfbwsegl-es8 ${PN}-linuxfbwsegl-
>es9"
>
> FILES_${PN}-blitwsegl-es3 =3D
>"${libdir}/ES3*/libpvrPVR2D_BLITWSEGL.so.*"
> FILES_${PN}-blitwsegl-es5 =3D
>"${libdir}/ES5*/libpvrPVR2D_BLITWSEGL.so.*"
> FILES_${PN}-blitwsegl-es6 =3D
>"${libdir}/ES6*/libpvrPVR2D_BLITWSEGL.so.*"
> FILES_${PN}-blitwsegl-es8 =3D
>"${libdir}/ES8*/libpvrPVR2D_BLITWSEGL.so.*"
>-RRECOMMENDS_${PN}-blitwsegl =3D " ${PN}-blitwsegl-es3 ${PN}-
>blitwsegl-es5 ${PN}-blitwsegl-es6 ${PN}-blitwsegl-es8"
>+FILES_${PN}-blitwsegl-es9 =3D
>"${libdir}/ES9*/libpvrPVR2D_BLITWSEGL.so.*"
>+RRECOMMENDS_${PN}-blitwsegl =3D " ${PN}-blitwsegl-es3 ${PN}-
>blitwsegl-es5 ${PN}-blitwsegl-es6 ${PN}-blitwsegl-es8 ${PN}-
>blitwsegl-es9"
>
> FILES_${PN}-flipwsegl-es3 =3D
>"${libdir}/ES3*/libpvrPVR2D_FLIPWSEGL.so.*"
> FILES_${PN}-flipwsegl-es5 =3D
>"${libdir}/ES5*/libpvrPVR2D_FLIPWSEGL.so.*"
> FILES_${PN}-flipwsegl-es6 =3D
>"${libdir}/ES6*/libpvrPVR2D_FLIPWSEGL.so.*"
> FILES_${PN}-flipwsegl-es8 =3D
>"${libdir}/ES8*/libpvrPVR2D_FLIPWSEGL.so.*"
>-RRECOMMENDS_${PN}-flipwsegl =3D " ${PN}-flipwsegl-es3 ${PN}-
>flipwsegl-es5 ${PN}-flipwsegl-es6 ${PN}-flipwsegl-es8"
>+FILES_${PN}-flipwsegl-es9 =3D
>"${libdir}/ES8*/libpvrPVR2D_FLIPWSEGL.so.*"
>+RRECOMMENDS_${PN}-flipwsegl =3D " ${PN}-flipwsegl-es3 ${PN}-
>flipwsegl-es5 ${PN}-flipwsegl-es6 ${PN}-flipwsegl-es8 ${PN}-
>flipwsegl-es9"
>
> FILES_${PN}-frontwsegl-es3 =3D
>"${libdir}/ES3*/libpvrPVR2D_FRONTWSEGL.so.*"
> FILES_${PN}-frontwsegl-es5 =3D
>"${libdir}/ES5*/libpvrPVR2D_FRONTWSEGL.so.*"
> FILES_${PN}-frontwsegl-es6 =3D
>"${libdir}/ES6*/libpvrPVR2D_FRONTWSEGL.so.*"
> FILES_${PN}-frontwsegl-es8 =3D
>"${libdir}/ES8*/libpvrPVR2D_FRONTWSEGL.so.*"
>-RRECOMMENDS_${PN}-frontwsegl =3D " ${PN}-frontwsegl-es3 ${PN}-
>frontwsegl-es5 ${PN}-frontwsegl-es6 ${PN}-frontwsegl-es8"
>+FILES_${PN}-frontwsegl-es9 =3D
>"${libdir}/ES9*/libpvrPVR2D_FRONTWSEGL.so.*"
>+RRECOMMENDS_${PN}-frontwsegl =3D " ${PN}-frontwsegl-es3 ${PN}-
>frontwsegl-es5 ${PN}-frontwsegl-es6 ${PN}-frontwsegl-es8 ${PN}-
>frontwsegl-es9"
>
> FILES_${PN}-linuxfbwsegl-es3 =3D
>"${libdir}/ES3*/libpvrPVR2D_LINUXFBWSEGL.so.*"
> FILES_${PN}-linuxfbwsegl-es5 =3D
>"${libdir}/ES5*/libpvrPVR2D_LINUXFBWSEGL.so.*"
> FILES_${PN}-linuxfbwsegl-es6 =3D
>"${libdir}/ES6*/libpvrPVR2D_LINUXFBWSEGL.so.*"
> FILES_${PN}-linuxfbwsegl-es8 =3D
>"${libdir}/ES8*/libpvrPVR2D_LINUXFBWSEGL.so.*"
>-RRECOMMENDS_${PN}-linuxfbwsegl =3D " ${PN}-linuxfbwsegl-es3 ${PN}-
>linuxfbwsegl-es5 ${PN}-linuxfbwsegl-es6 ${PN}-linuxfbwsegl-es8"
>+FILES_${PN}-linuxfbwsegl-es9 =3D
>"${libdir}/ES9*/libpvrPVR2D_LINUXFBWSEGL.so.*"
>+RRECOMMENDS_${PN}-linuxfbwsegl =3D " ${PN}-linuxfbwsegl-es3 ${PN}-
>linuxfbwsegl-es5 ${PN}-linuxfbwsegl-es6 ${PN}-linuxfbwsegl-es8
>${PN}-linuxfbwsegl-es9"
>
> CONFFILES_${PN} =3D "${sysconfdir}/powervr.ini"
>
>@@ -279,21 +289,25 @@ INSANE_SKIP_${PN}-blitwsegl-es3 =3D "ldflags"
> INSANE_SKIP_${PN}-blitwsegl-es5 =3D "ldflags"
> INSANE_SKIP_${PN}-blitwsegl-es6 =3D "ldflags"
> INSANE_SKIP_${PN}-blitwsegl-es8 =3D "ldflags"
>+INSANE_SKIP_${PN}-blitwsegl-es9 =3D "ldflags"
> INSANE_SKIP_${PN}-flipwsegl =3D "ldflags"
> INSANE_SKIP_${PN}-flipwsegl-es3 =3D "ldflags"
> INSANE_SKIP_${PN}-flipwsegl-es5 =3D "ldflags"
> INSANE_SKIP_${PN}-flipwsegl-es6 =3D "ldflags"
> INSANE_SKIP_${PN}-flipwsegl-es8 =3D "ldflags"
>+INSANE_SKIP_${PN}-flipwsegl-es9 =3D "ldflags"
> INSANE_SKIP_${PN}-frontwsegl =3D "ldflags"
> INSANE_SKIP_${PN}-frontwsegl-es3 =3D "ldflags"
> INSANE_SKIP_${PN}-frontwsegl-es5 =3D "ldflags"
> INSANE_SKIP_${PN}-frontwsegl-es6 =3D "ldflags"
> INSANE_SKIP_${PN}-frontwsegl-es8 =3D "ldflags"
>+INSANE_SKIP_${PN}-frontwsegl-es9 =3D "ldflags"
> INSANE_SKIP_${PN}-linuxfbwsegl =3D "ldflags"
> INSANE_SKIP_${PN}-linuxfbwsegl-es3 =3D "ldflags"
> INSANE_SKIP_${PN}-linuxfbwsegl-es5 =3D "ldflags"
> INSANE_SKIP_${PN}-linuxfbwsegl-es6 =3D "ldflags"
> INSANE_SKIP_${PN}-linuxfbwsegl-es8 =3D "ldflags"
>+INSANE_SKIP_${PN}-linuxfbwsegl-es9 =3D "ldflags"
> INSANE_SKIP_${PN}-tests =3D "ldflags"
>
> # Quality control is really poor on these SDKs, so hack around
>the latest madness:
>diff --git a/recipes-graphics/libgles/libgles-omap3-x11.inc
>b/recipes-graphics/libgles/libgles-omap3-x11.inc
>index 106a9bc..76ef5b3 100644
>--- a/recipes-graphics/libgles/libgles-omap3-x11.inc
>+++ b/recipes-graphics/libgles/libgles-omap3-x11.inc
>@@ -3,11 +3,11 @@ LICENSE =3D "proprietary-binary"
> # 'TSPA.txt' might not be the best file to md5sum
> LIC_FILES_CHKSUM =3D
>"file://TSPA.txt;md5=3Dc0d5d9c1e38b41677144c4e24d6ddee1"
>
>-INC_PR =3D "r37"
>+INC_PR =3D "r38"
>
> EXCLUDE_FROM_WORLD =3D "1"
>
>-COMPATIBLE_MACHINE =3D "(omap3|ti814x|ti816x|ti33x)"
>+COMPATIBLE_MACHINE =3D "(omap3|ti814x|ti816x|ti33x|ti43x)"
>
> DEPENDS =3D "virtual/libx11 libxau libxdmcp libdrm"
>
>@@ -46,6 +46,7 @@ export ES3LOCATION ?=3D "${S}/gfx_rel_es3.x"
> export ES5LOCATION ?=3D "${S}/gfx_rel_es5.x"
> export ES6LOCATION ?=3D "${S}/gfx_rel_es6.x"
> export ES8LOCATION ?=3D "${S}/gfx_rel_es8.x"
>+export ES9LOCATION ?=3D "${S}/gfx_rel_es9.x"
>
> LIBGLESWINDOWSYSTEM ?=3D "libpvrPVR2D_DRIWSEGL.so"
>
>@@ -174,11 +175,13 @@ do_install () {
>
> 	# The ES3.x, ES5.x and ES6.x CPUs have different SGX
>hardware, so we need to install multiple sets of userspace
>
>+	install -d ${D}${libdir}/ES9.0
> 	install -d ${D}${libdir}/ES8.0
> 	install -d ${D}${libdir}/ES6.0
> 	install -d ${D}${libdir}/ES5.0
> 	install -d ${D}${libdir}/ES3.0
>
>+	install -d ${D}${bindir}/ES9.0
> 	install -d ${D}${bindir}/ES8.0
> 	install -d ${D}${bindir}/ES6.0
> 	install -d ${D}${bindir}/ES5.0
>@@ -186,7 +189,7 @@ do_install () {
>
> 	x11_prog=3D"eglinfo_x xgles1test1 xgles2test1 xmultiegltest"
>
>-	for esrev in 3 5 6 8 ; do
>+	for esrev in 3 5 6 8 9; do
> 		ESLOCATION=3D$(eval echo $(echo
>\$\{ES${esrev}LOCATION\}))
> 		if [ -e ${ESLOCATION} ] ; then
> 			cp -pPR ${ESLOCATION}/lib*${IMGPV}
>${ESLOCATION}/pvr_drv.so ${ESLOCATION}/*.a
>${D}${libdir}/ES${esrev}.0/
>@@ -219,38 +222,42 @@ do_install () {
> PACKAGES =3D+ "${PN}-x11demos ${PN}-x11trainingcourses xserver-
>kdrive-powervrsgx"
>
> # Package the base libraries per silicon revision
>-PACKAGES =3D+ "${PN}-es3 ${PN}-es5 ${PN}-es6 ${PN}-es8"
>-RRECOMMENDS_${PN} +=3D "${PN}-es3 ${PN}-es5 ${PN}-es6 ${PN}-es8"
>+PACKAGES =3D+ "${PN}-es3 ${PN}-es5 ${PN}-es6 ${PN}-es8 ${PN}-es9"
>+RRECOMMENDS_${PN} +=3D "${PN}-es3 ${PN}-es5 ${PN}-es6 ${PN}-es8
>${PN}-es9"
> FILES_${PN}-es3 =3D "${libdir}/ES3*/* ${bindir}/ES3*/*"
> FILES_${PN}-es5 =3D "${libdir}/ES5*/* ${bindir}/ES5*/*"
> FILES_${PN}-es6 =3D "${libdir}/ES6*/* ${bindir}/ES6*/*"
> FILES_${PN}-es8 =3D "${libdir}/ES8*/* ${bindir}/ES8*/*"
>+FILES_${PN}-es9 =3D "${libdir}/ES9*/* ${bindir}/ES9*/*"
>
> # Stop shlib code from picking a subpackage
> PRIVATE_LIBS_${PN}-es3 =3D "libGLESv2.so libIMGegl.so libsrv_um.so
>libOpenVG.so libpvr2d.so libsrv_init.so libEGL.so libsrv_um_dri.so
>libOpenVGU.so libglslcompiler.so libGLES_CM.so"
> PRIVATE_LIBS_${PN}-es5 =3D "libGLESv2.so libIMGegl.so libsrv_um.so
>libOpenVG.so libpvr2d.so libsrv_init.so libEGL.so libsrv_um_dri.so
>libOpenVGU.so libglslcompiler.so libGLES_CM.so"
> PRIVATE_LIBS_${PN}-es6 =3D "libGLESv2.so libIMGegl.so libsrv_um.so
>libOpenVG.so libpvr2d.so libsrv_init.so libEGL.so libsrv_um_dri.so
>libOpenVGU.so libglslcompiler.so libGLES_CM.so"
> PRIVATE_LIBS_${PN}-es8 =3D "libGLESv2.so libIMGegl.so libsrv_um.so
>libOpenVG.so libpvr2d.so libsrv_init.so libEGL.so libsrv_um_dri.so
>libOpenVGU.so libglslcompiler.so libGLES_CM.so"
>+PRIVATE_LIBS_${PN}-es9 =3D "libGLESv2.so libIMGegl.so libsrv_um.so
>libOpenVG.so libpvr2d.so libsrv_init.so libEGL.so libsrv_um_dri.so
>libOpenVGU.so libglslcompiler.so libGLES_CM.so"
>
> PACKAGES =3D+ "${PN}-x11wsegl ${PN}-driwsegl"
> FILES_${PN}-x11wsegl =3D "${libdir}/libpvrPVR2D_X11WSEGL.so*
>${bindir}/x* ${bindir}/*x"
> FILES_${PN}-driwsegl =3D "${libdir}/libpvrPVR2D_DRIWSEGL.so*
>${libdir}/libsrv_um_dri*"
>
>-X11_SEGL =3D " ${PN}-x11wsegl-es2 ${PN}-x11wsegl-es3 ${PN}-
>x11wsegl-es5 ${PN}-x11wsegl-es6 ${PN}-x11wsegl-es8 ${PN}-driwsegl-
>es2 ${PN}-driwsegl-es3 ${PN}-driwsegl-es5 ${PN}-driwsegl-es6
>${PN}-driwsegl-es8 "
>+X11_SEGL =3D " ${PN}-x11wsegl-es2 ${PN}-x11wsegl-es3 ${PN}-
>x11wsegl-es5 ${PN}-x11wsegl-es6 ${PN}-x11wsegl-es8 ${PN}-x11wsegl-
>es9 ${PN}-driwsegl-es2 ${PN}-driwsegl-es3 ${PN}-driwsegl-es5
>${PN}-driwsegl-es6 ${PN}-driwsegl-es8 ${PN}-driwsegl-es9"
> PACKAGES =3D+ "${X11_SEGL}"
> FILES_${PN}-x11wsegl-es2 =3D
>"${libdir}/ES2*/libpvrPVR2D_X11WSEGL.so.* ${bindir}/ES2*/x*
>${bindir}/ES2*/*x"
> FILES_${PN}-x11wsegl-es3 =3D
>"${libdir}/ES3*/libpvrPVR2D_X11WSEGL.so.* ${bindir}/ES3*/x*
>${bindir}/ES3*/*x"
> FILES_${PN}-x11wsegl-es5 =3D
>"${libdir}/ES5*/libpvrPVR2D_X11WSEGL.so.* ${bindir}/ES5*/x*
>${bindir}/ES5*/*x"
> FILES_${PN}-x11wsegl-es6 =3D
>"${libdir}/ES6*/libpvrPVR2D_X11WSEGL.so.* ${bindir}/ES6*/x*
>${bindir}/ES6*/*x"
> FILES_${PN}-x11wsegl-es8 =3D
>"${libdir}/ES8*/libpvrPVR2D_X11WSEGL.so.* ${bindir}/ES8*/x*
>${bindir}/ES8*/*x"
>-RRECOMMENDS_${PN}-x11wsegl =3D " ${PN}-x11wsegl-es2 ${PN}-x11wsegl-
>es3 ${PN}-x11wsegl-es5 ${PN}-x11wsegl-es6 ${PN}-x11wsegl-es8"
>+FILES_${PN}-x11wsegl-es9 =3D
>"${libdir}/ES9*/libpvrPVR2D_X11WSEGL.so.* ${bindir}/ES9*/x*
>${bindir}/ES9*/*x"
>+RRECOMMENDS_${PN}-x11wsegl =3D " ${PN}-x11wsegl-es2 ${PN}-x11wsegl-
>es3 ${PN}-x11wsegl-es5 ${PN}-x11wsegl-es6 ${PN}-x11wsegl-es8
>${PN}-x11wsegl-es9"
>
> FILES_${PN}-driwsegl-es2 =3D
>"${libdir}/ES2*/libpvrPVR2D_DRIWSEGL.so.*
>${libdir}/ES2*/libsrv_um_dri*"
> FILES_${PN}-driwsegl-es3 =3D
>"${libdir}/ES3*/libpvrPVR2D_DRIWSEGL.so.*
>${libdir}/ES3*/libsrv_um_dri*"
> FILES_${PN}-driwsegl-es5 =3D
>"${libdir}/ES5*/libpvrPVR2D_DRIWSEGL.so.*
>${libdir}/ES5*/libsrv_um_dri*"
> FILES_${PN}-driwsegl-es6 =3D
>"${libdir}/ES6*/libpvrPVR2D_DRIWSEGL.so.*
>${libdir}/ES6*/libsrv_um_dri*"
> FILES_${PN}-driwsegl-es8 =3D
>"${libdir}/ES8*/libpvrPVR2D_DRIWSEGL.so.*
>${libdir}/ES8*/libsrv_um_dri*"
>-RRECOMMENDS_${PN}-driwsegl =3D " ${PN}-driwsegl-es2 ${PN}-driwsegl-
>es3 ${PN}-driwsegl-es5 ${PN}-driwsegl-es6 ${PN}-driwsegl-es8"
>+FILES_${PN}-driwsegl-es9 =3D
>"${libdir}/ES9*/libpvrPVR2D_DRIWSEGL.so.*
>${libdir}/ES9*/libsrv_um_dri*"
>+RRECOMMENDS_${PN}-driwsegl =3D " ${PN}-driwsegl-es2 ${PN}-driwsegl-
>es3 ${PN}-driwsegl-es5 ${PN}-driwsegl-es6 ${PN}-driwsegl-es8
>${PN}-driwsegl-es9"
>
> CONFFILES_${PN} =3D "${sysconfdir}/powervr.ini"
>
>@@ -282,17 +289,20 @@ INSANE_SKIP_${PN}-es3 =3D "ldflags dev-so
>staticdev"
> INSANE_SKIP_${PN}-es5 =3D "ldflags dev-so staticdev"
> INSANE_SKIP_${PN}-es6 =3D "ldflags dev-so staticdev"
> INSANE_SKIP_${PN}-es8 =3D "ldflags dev-so staticdev"
>+INSANE_SKIP_${PN}-es9 =3D "ldflags dev-so staticdev"
> INSANE_SKIP_${PN}-x11demos =3D "ldflags dev-so useless-rpaths"
> INSANE_SKIP_${PN}-x11wsegl =3D "ldflags dev-so"
> INSANE_SKIP_${PN}-x11wsegl-es3 =3D "ldflags dev-so"
> INSANE_SKIP_${PN}-x11wsegl-es5 =3D "ldflags dev-so"
> INSANE_SKIP_${PN}-x11wsegl-es6 =3D "ldflags dev-so"
> INSANE_SKIP_${PN}-x11wsegl-es8 =3D "ldflags dev-so"
>+INSANE_SKIP_${PN}-x11wsegl-es9 =3D "ldflags dev-so"
> INSANE_SKIP_${PN}-driwsegl =3D "ldflags dev-so"
> INSANE_SKIP_${PN}-driwsegl-es3 =3D "ldflags dev-so"
> INSANE_SKIP_${PN}-driwsegl-es5 =3D "ldflags dev-so"
> INSANE_SKIP_${PN}-driwsegl-es6 =3D "ldflags dev-so"
> INSANE_SKIP_${PN}-driwsegl-es8 =3D "ldflags dev-so"
>+INSANE_SKIP_${PN}-driwsegl-es9 =3D "ldflags dev-so"
> INSANE_SKIP_${PN}-tests =3D "ldflags"
> INSANE_SKIP_xserver-kdrive-powervrsgx =3D "ldflags"
> INSANE_SKIP_${PN}-dev =3D "ldflags dev-so"
>--
>1.7.0.4
>
>_______________________________________________
>meta-ti mailing list
>meta-ti@yoctoproject.org
>https://lists.yoctoproject.org/listinfo/meta-ti

