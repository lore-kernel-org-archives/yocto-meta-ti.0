Return-Path: <prabu@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 75272E015D4
	for <meta-ti@yoctoproject.org>; Wed, 12 Jun 2013 10:23:14 -0700 (PDT)
Received: from dbdlxv05.itg.ti.com ([172.24.171.60])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r5CHNCTS020095
	for <meta-ti@yoctoproject.org>; Wed, 12 Jun 2013 12:23:13 -0500
Received: from DBDE72.ent.ti.com (dbde72.ent.ti.com [172.24.171.97])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id r5CHNAx4004988
	for <meta-ti@yoctoproject.org>; Wed, 12 Jun 2013 12:23:10 -0500
Received: from dbdp32.itg.ti.com (172.24.170.251) by DBDE72.ent.ti.com
	(172.24.171.97) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 13 Jun 2013 01:23:09 +0800
Received: from bangubntigfx.india.ti.com (smtpvbd.itg.ti.com [172.24.170.250])
	by dbdp32.itg.ti.com (8.13.8/8.13.8) with ESMTP id r5CHMsO4027868;
	Wed, 12 Jun 2013 22:53:09 +0530
From: Prabindh Sundareson <prabu@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 12 Jun 2013 22:52:36 +0530
Message-ID: <1371057762-17055-4-git-send-email-prabu@ti.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <Prabindh Sundareson <prabu@ti.com>
References: <Prabindh Sundareson <prabu@ti.com>
MIME-Version: 1.0
Subject: [PATCH 3/9] libgles-omap3: Remove unsupported core build option ES2.0
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
X-List-Received-Date: Wed, 12 Jun 2013 17:23:16 -0000
Content-Type: text/plain

ES2.0 build option for SGX user binaries is deprecated as the
corresponding SOC is no longer in production

Signed-off-by: Prabindh Sundareson <prabu at ti.com>
---
 recipes-graphics/libgles/libgles-omap3-no-x.inc |   27 +++++++---------------
 1 files changed, 9 insertions(+), 18 deletions(-)

diff --git a/recipes-graphics/libgles/libgles-omap3-no-x.inc b/recipes-graphics/libgles/libgles-omap3-no-x.inc
index 31c5b8e..95cf166 100644
--- a/recipes-graphics/libgles/libgles-omap3-no-x.inc
+++ b/recipes-graphics/libgles/libgles-omap3-no-x.inc
@@ -28,7 +28,6 @@ TI_BIN_UNPK_CMDS="Y: qY:workdir:Y"
 require ../../recipes-ti/includes/ti-eula-unpack.inc
 
 export BINLOCATION ?= "${S}/gfx_rel"
-export ES2LOCATION ?= "${S}/gfx_rel_es2.x"
 export ES3LOCATION ?= "${S}/gfx_rel_es3.x"
 export ES5LOCATION ?= "${S}/gfx_rel_es5.x"
 export ES6LOCATION ?= "${S}/gfx_rel_es6.x"
@@ -150,24 +149,22 @@ do_install () {
 	echo "[default]" > ${D}${sysconfdir}/powervr.ini
 	echo "WindowSystem=${LIBGLESWINDOWSYSTEM}" >> ${D}${sysconfdir}/powervr.ini
 
-	# The ES2.x, ES3.x, ES5.x and ES6.x CPUs have different SGX hardware, so we need to install multiple sets of userspace
+	#Create different folders for ease of installing into different platforms with different display drivers/ SGX core
 
 	install -d ${D}${libdir}/ES8.0
 	install -d ${D}${libdir}/ES6.0
 	install -d ${D}${libdir}/ES5.0
 	install -d ${D}${libdir}/ES3.0
-	install -d ${D}${libdir}/ES2.0
 
 	install -d ${D}${bindir}/ES8.0
 	install -d ${D}${bindir}/ES6.0
 	install -d ${D}${bindir}/ES5.0
 	install -d ${D}${bindir}/ES3.0
-	install -d ${D}${bindir}/ES2.0
 
 	shared_prog="eglinfo pvr2d_test ${PVR_INIT} services_test sgx_blit_test sgx_clipblit_test sgx_flip_test sgx_init_test sgx_render_flip_test"
 	raw_prog="gles1test1 gles2test1 ovg_unit_test"
 
-	for esrev in 2 3 5 6 8 ; do
+	for esrev in 3 5 6 8 ; do
 		ESLOCATION=$(eval echo $(echo \$\{ES${esrev}LOCATION\}))
 		if [ -e ${ESLOCATION} ] ; then
 			cp -pPR ${ESLOCATION}/lib*${IMGPV} ${ESLOCATION}/pvr_drv.so ${ESLOCATION}/*.a ${D}${libdir}/ES${esrev}.0/
@@ -196,16 +193,14 @@ do_install () {
 
 PACKAGES =+ "${PN}-rawdemos ${PN}-rawtrainingcourses ${PN}-tests"
 # Package the base libraries per silicon revision
-PACKAGES =+ "${PN}-es2 ${PN}-es3 ${PN}-es5 ${PN}-es6 ${PN}-es8"
-RRECOMMENDS_${PN} += "${PN}-es2 ${PN}-es3 ${PN}-es5 ${PN}-es6 ${PN}-es8"
-FILES_${PN}-es2 = "${libdir}/ES2*/* ${bindir}/ES2*/*"
+PACKAGES =+ "${PN}-es3 ${PN}-es5 ${PN}-es6 ${PN}-es8"
+RRECOMMENDS_${PN} += "${PN}-es3 ${PN}-es5 ${PN}-es6 ${PN}-es8"
 FILES_${PN}-es3 = "${libdir}/ES3*/* ${bindir}/ES3*/*"
 FILES_${PN}-es5 = "${libdir}/ES5*/* ${bindir}/ES5*/*"
 FILES_${PN}-es6 = "${libdir}/ES6*/* ${bindir}/ES6*/*"
 FILES_${PN}-es8 = "${libdir}/ES8*/* ${bindir}/ES8*/*"
 
 # Stop shlib code from picking a subpackage
-PRIVATE_LIBS_${PN}-es2 = "libGLESv2.so libIMGegl.so libsrv_um.so libOpenVG.so libpvr2d.so libsrv_init.so libEGL.so libsrv_um_dri.so libOpenVGU.so libglslcompiler.so libGLES_CM.so"
 PRIVATE_LIBS_${PN}-es3 = "libGLESv2.so libIMGegl.so libsrv_um.so libOpenVG.so libpvr2d.so libsrv_init.so libEGL.so libsrv_um_dri.so libOpenVGU.so libglslcompiler.so libGLES_CM.so"
 PRIVATE_LIBS_${PN}-es5 = "libGLESv2.so libIMGegl.so libsrv_um.so libOpenVG.so libpvr2d.so libsrv_init.so libEGL.so libsrv_um_dri.so libOpenVGU.so libglslcompiler.so libGLES_CM.so"
 PRIVATE_LIBS_${PN}-es6 = "libGLESv2.so libIMGegl.so libsrv_um.so libOpenVG.so libpvr2d.so libsrv_init.so libEGL.so libsrv_um_dri.so libOpenVGU.so libglslcompiler.so libGLES_CM.so"
@@ -218,35 +213,31 @@ FILES_${PN}-flipwsegl = "${libdir}/libpvrPVR2D_FLIPWSEGL.so.*"
 FILES_${PN}-frontwsegl = "${libdir}/libpvrPVR2D_FRONTWSEGL.so.*"
 FILES_${PN}-linuxfbwsegl = "${libdir}/libpvrPVR2D_LINUXFBWSEGL.so.*"
 
-PACKAGES =+ "${PN}-blitwsegl-es2 ${PN}-blitwsegl-es3 ${PN}-blitwsegl-es5 ${PN}-blitwsegl-es6 ${PN}-blitwsegl-es8 ${PN}-flipwsegl-es2 ${PN}-flipwsegl-es3 ${PN}-flipwsegl-es5 ${PN}-flipwsegl-es6 ${PN}-flipwsegl-es8 ${PN}-frontwsegl-es2 ${PN}-frontwsegl-es3 ${PN}-frontwsegl-es5 ${PN}-frontwsegl-es6 ${PN}-frontwsegl-es8 ${PN}-linuxfbwsegl-es2 ${PN}-linuxfbwsegl-es3 ${PN}-linuxfbwsegl-es5 ${PN}-linuxfbwsegl-es6 ${PN}-linuxfbwsegl-es8"
+PACKAGES =+ "${PN}-blitwsegl-es3 ${PN}-blitwsegl-es5 ${PN}-blitwsegl-es6 ${PN}-blitwsegl-es8 ${PN}-flipwsegl-es3 ${PN}-flipwsegl-es5 ${PN}-flipwsegl-es6 ${PN}-flipwsegl-es8 ${PN}-frontwsegl-es3 ${PN}-frontwsegl-es5 ${PN}-frontwsegl-es6 ${PN}-frontwsegl-es8 ${PN}-linuxfbwsegl-es3 ${PN}-linuxfbwsegl-es5 ${PN}-linuxfbwsegl-es6 ${PN}-linuxfbwsegl-es8"
 
-FILES_${PN}-blitwsegl-es2 = "${libdir}/ES2*/libpvrPVR2D_BLITWSEGL.so.*"
 FILES_${PN}-blitwsegl-es3 = "${libdir}/ES3*/libpvrPVR2D_BLITWSEGL.so.*"
 FILES_${PN}-blitwsegl-es5 = "${libdir}/ES5*/libpvrPVR2D_BLITWSEGL.so.*"
 FILES_${PN}-blitwsegl-es6 = "${libdir}/ES6*/libpvrPVR2D_BLITWSEGL.so.*"
 FILES_${PN}-blitwsegl-es8 = "${libdir}/ES8*/libpvrPVR2D_BLITWSEGL.so.*"
-RRECOMMENDS_${PN}-blitwsegl = " ${PN}-blitwsegl-es2 ${PN}-blitwsegl-es3 ${PN}-blitwsegl-es5 ${PN}-blitwsegl-es6 ${PN}-blitwsegl-es8"
+RRECOMMENDS_${PN}-blitwsegl = " ${PN}-blitwsegl-es3 ${PN}-blitwsegl-es5 ${PN}-blitwsegl-es6 ${PN}-blitwsegl-es8"
 
-FILES_${PN}-flipwsegl-es2 = "${libdir}/ES2*/libpvrPVR2D_FLIPWSEGL.so.*"
 FILES_${PN}-flipwsegl-es3 = "${libdir}/ES3*/libpvrPVR2D_FLIPWSEGL.so.*"
 FILES_${PN}-flipwsegl-es5 = "${libdir}/ES5*/libpvrPVR2D_FLIPWSEGL.so.*"
 FILES_${PN}-flipwsegl-es6 = "${libdir}/ES6*/libpvrPVR2D_FLIPWSEGL.so.*"
 FILES_${PN}-flipwsegl-es8 = "${libdir}/ES8*/libpvrPVR2D_FLIPWSEGL.so.*"
-RRECOMMENDS_${PN}-flipwsegl = " ${PN}-flipwsegl-es2 ${PN}-flipwsegl-es3 ${PN}-flipwsegl-es5 ${PN}-flipwsegl-es6 ${PN}-flipwsegl-es8"
+RRECOMMENDS_${PN}-flipwsegl = " ${PN}-flipwsegl-es3 ${PN}-flipwsegl-es5 ${PN}-flipwsegl-es6 ${PN}-flipwsegl-es8"
 
-FILES_${PN}-frontwsegl-es2 = "${libdir}/ES2*/libpvrPVR2D_FRONTWSEGL.so.*"
 FILES_${PN}-frontwsegl-es3 = "${libdir}/ES3*/libpvrPVR2D_FRONTWSEGL.so.*"
 FILES_${PN}-frontwsegl-es5 = "${libdir}/ES5*/libpvrPVR2D_FRONTWSEGL.so.*"
 FILES_${PN}-frontwsegl-es6 = "${libdir}/ES6*/libpvrPVR2D_FRONTWSEGL.so.*"
 FILES_${PN}-frontwsegl-es8 = "${libdir}/ES8*/libpvrPVR2D_FRONTWSEGL.so.*"
-RRECOMMENDS_${PN}-frontwsegl = " ${PN}-frontwsegl-es2 ${PN}-frontwsegl-es3 ${PN}-frontwsegl-es5 ${PN}-frontwsegl-es6 ${PN}-frontwsegl-es8"
+RRECOMMENDS_${PN}-frontwsegl = " ${PN}-frontwsegl-es3 ${PN}-frontwsegl-es5 ${PN}-frontwsegl-es6 ${PN}-frontwsegl-es8"
 
-FILES_${PN}-linuxfbwsegl-es2 = "${libdir}/ES2*/libpvrPVR2D_LINUXFBWSEGL.so.*"
 FILES_${PN}-linuxfbwsegl-es3 = "${libdir}/ES3*/libpvrPVR2D_LINUXFBWSEGL.so.*"
 FILES_${PN}-linuxfbwsegl-es5 = "${libdir}/ES5*/libpvrPVR2D_LINUXFBWSEGL.so.*"
 FILES_${PN}-linuxfbwsegl-es6 = "${libdir}/ES6*/libpvrPVR2D_LINUXFBWSEGL.so.*"
 FILES_${PN}-linuxfbwsegl-es8 = "${libdir}/ES8*/libpvrPVR2D_LINUXFBWSEGL.so.*"
-RRECOMMENDS_${PN}-linuxfbwsegl = " ${PN}-linuxfbwsegl-es2 ${PN}-linuxfbwsegl-es3 ${PN}-linuxfbwsegl-es5 ${PN}-linuxfbwsegl-es6 ${PN}-linuxfbwsegl-es8"
+RRECOMMENDS_${PN}-linuxfbwsegl = " ${PN}-linuxfbwsegl-es3 ${PN}-linuxfbwsegl-es5 ${PN}-linuxfbwsegl-es6 ${PN}-linuxfbwsegl-es8"
 
 CONFFILES_${PN} = "${sysconfdir}/powervr.ini"
 
-- 
1.7.1


