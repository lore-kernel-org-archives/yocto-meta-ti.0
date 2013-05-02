Return-Path: <prabu@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 408B4E014F9
	for <meta-ti@yoctoproject.org>; Thu,  2 May 2013 06:40:37 -0700 (PDT)
Received: from dbdlxv05.itg.ti.com ([172.24.171.60])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r42DeZI6007286
	for <meta-ti@yoctoproject.org>; Thu, 2 May 2013 08:40:36 -0500
Received: from DBDE72.ent.ti.com (dbde72.ent.ti.com [172.24.171.97])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id r42DeWoN028448
	for <meta-ti@yoctoproject.org>; Thu, 2 May 2013 08:40:34 -0500
Received: from dbdp32.itg.ti.com (172.24.170.251) by DBDE72.ent.ti.com
	(172.24.171.97) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 2 May 2013 21:40:32 +0800
Received: from bangubntigfx.india.ti.com (smtpvbd.itg.ti.com [172.24.170.250])
	by dbdp32.itg.ti.com (8.13.8/8.13.8) with ESMTP id r42De1MI016387;
	Thu, 2 May 2013 19:10:32 +0530
From: Prabindh Sundareson <prabu@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 2 May 2013 19:09:18 +0530
Message-ID: <1367501964-6294-4-git-send-email-prabu@ti.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1367501964-6294-1-git-send-email-prabu@ti.com>
References: <1367501964-6294-1-git-send-email-prabu@ti.com>
MIME-Version: 1.0
Subject: [PATCH 04/10] libgles-omap3: Remove OpenVG references
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
X-List-Received-Date: Thu, 02 May 2013 13:40:37 -0000
Content-Type: text/plain

OpenVG API is no longer supported in the SGX Graphics SDK.
Customers are encouraged to move to OpenGL ES2.x.

Signed-off-by: Prabindh Sundareson <prabu@ti.com>
---
 recipes-graphics/libgles/libgles-omap3.inc |   12 +++++-------
 1 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/recipes-graphics/libgles/libgles-omap3.inc b/recipes-graphics/libgles/libgles-omap3.inc
index 1e1a6f1..3d59906 100644
--- a/recipes-graphics/libgles/libgles-omap3.inc
+++ b/recipes-graphics/libgles/libgles-omap3.inc
@@ -137,8 +137,6 @@ do_install () {
 	cp -pPR ${S}/GFX_Linux_SDK/OGLES/SDKPackage/Builds/OGLES/Include/* ${D}${includedir}/
 	cp -pPR ${S}/GFX_Linux_SDK/OGLES/SDKPackage/Builds/OGLES/${PLATFORM}/Include/GLES/* ${D}${includedir}/GLES/ 2>/dev/null || true
 	cp -pPr ${S}/GFX_Linux_SDK/OGLES2/SDKPackage/Builds/OGLES2/${PLATFORM}/Include/GLES/* ${D}${includedir}/GLES2/ 2>/dev/null || true
-	cp -pPr ${S}/GFX_Linux_SDK/OVG/SDKPackage/Builds/OVG/Include/v* ${D}${includedir}/ 2>/dev/null || true
-	cp -pPr ${S}/GFX_Linux_SDK/OVG/SDKPackage/Builds/OVG/Include/V* ${D}${includedir}/ 2>/dev/null || true
 	cp -pPr ${S}/include/*.h ${D}${includedir} || true
 	cp -pPr ${S}/include/wsegl/*.h ${D}${includedir} || true
 	
@@ -162,7 +160,7 @@ do_install () {
 	install -d ${D}${bindir}/ES3.0
 
 	shared_prog="eglinfo pvr2d_test ${PVR_INIT} services_test sgx_blit_test sgx_clipblit_test sgx_flip_test sgx_init_test sgx_render_flip_test"
-	raw_prog="gles1test1 gles2test1 ovg_unit_test"
+	raw_prog="gles1test1 gles2test1"
 
 	for esrev in 3 5 6 8 ; do
 		ESLOCATION=$(eval echo $(echo \$\{ES${esrev}LOCATION\}))
@@ -201,10 +199,10 @@ FILES_${PN}-es6 = "${libdir}/ES6*/* ${bindir}/ES6*/*"
 FILES_${PN}-es8 = "${libdir}/ES8*/* ${bindir}/ES8*/*"
 
 # Stop shlib code from picking a subpackage
-PRIVATE_LIBS_${PN}-es3 = "libGLESv2.so libIMGegl.so libsrv_um.so libOpenVG.so libpvr2d.so libsrv_init.so libEGL.so libsrv_um_dri.so libOpenVGU.so libglslcompiler.so libGLES_CM.so"
-PRIVATE_LIBS_${PN}-es5 = "libGLESv2.so libIMGegl.so libsrv_um.so libOpenVG.so libpvr2d.so libsrv_init.so libEGL.so libsrv_um_dri.so libOpenVGU.so libglslcompiler.so libGLES_CM.so"
-PRIVATE_LIBS_${PN}-es6 = "libGLESv2.so libIMGegl.so libsrv_um.so libOpenVG.so libpvr2d.so libsrv_init.so libEGL.so libsrv_um_dri.so libOpenVGU.so libglslcompiler.so libGLES_CM.so"
-PRIVATE_LIBS_${PN}-es8 = "libGLESv2.so libIMGegl.so libsrv_um.so libOpenVG.so libpvr2d.so libsrv_init.so libEGL.so libsrv_um_dri.so libOpenVGU.so libglslcompiler.so libGLES_CM.so"
+PRIVATE_LIBS_${PN}-es3 = "libGLESv2.so libIMGegl.so libsrv_um.so libpvr2d.so libsrv_init.so libEGL.so libsrv_um_dri.so libglslcompiler.so libGLES_CM.so"
+PRIVATE_LIBS_${PN}-es5 = "libGLESv2.so libIMGegl.so libsrv_um.so libpvr2d.so libsrv_init.so libEGL.so libsrv_um_dri.so libglslcompiler.so libGLES_CM.so"
+PRIVATE_LIBS_${PN}-es6 = "libGLESv2.so libIMGegl.so libsrv_um.so libpvr2d.so libsrv_init.so libEGL.so libsrv_um_dri.so libglslcompiler.so libGLES_CM.so"
+PRIVATE_LIBS_${PN}-es8 = "libGLESv2.so libIMGegl.so libsrv_um.so libpvr2d.so libsrv_init.so libEGL.so libsrv_um_dri.so libglslcompiler.so libGLES_CM.so"
 
 
 PACKAGES =+ "${PN}-blitwsegl ${PN}-flipwsegl ${PN}-frontwsegl ${PN}-linuxfbwsegl"
-- 
1.7.1


