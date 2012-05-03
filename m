Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CB204E013B7
	for <meta-ti@yoctoproject.org>; Wed,  2 May 2012 21:36:14 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id D48B252AAA; Thu,  3 May 2012 04:36:13 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120503043613.D48B252AAA@arago-project.org>
Date: Thu,  3 May 2012 04:36:13 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Koen Kooi : libgles-omap3: copy over all binaries and abstract install process
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Thu, 03 May 2012 04:36:15 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 6cff7f12d22523b44803b5e191dc18e4d9c93784
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=6cff7f12d22523b44803b5e191dc18e4d9c93784

Author: Koen Kooi <koen@dominion.thruhere.net>
Date:   Wed May  2 14:33:23 2012 +0200

libgles-omap3: copy over all binaries and abstract install process

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-graphics/libgles/libgles-omap3.inc |   51 ++++++++++------------------
 1 files changed, 18 insertions(+), 33 deletions(-)

diff --git a/recipes-graphics/libgles/libgles-omap3.inc b/recipes-graphics/libgles/libgles-omap3.inc
index 93cb091..6820aea 100644
--- a/recipes-graphics/libgles/libgles-omap3.inc
+++ b/recipes-graphics/libgles/libgles-omap3.inc
@@ -3,7 +3,7 @@ LICENSE = "proprietary-binary"
 # 'TSPA.txt' might not be the best file to md5sum
 LIC_FILES_CHKSUM = "file://TSPA.txt;md5=c0d5d9c1e38b41677144c4e24d6ddee1"
 
-PR = "r27"
+PR = "r28"
 
 COMPATIBLE_MACHINE = "(omap3|ti816x|ti33x)"
 
@@ -24,12 +24,12 @@ S = "${WORKDIR}/OMAP35x_Graphics_SDK_${SGXPV}"
 TI_BIN_UNPK_CMDS="Y: qY:workdir:Y"
 require ../../recipes-ti/includes/ti-eula-unpack.inc
 
-BINLOCATION ?= "${S}/gfx_rel"
-ES2LOCATION ?= "${S}/gfx_rel_es2.x"
-ES3LOCATION ?= "${S}/gfx_rel_es3.x"
-ES5LOCATION ?= "${S}/gfx_rel_es5.x"
-ES6LOCATION ?= "${S}/gfx_rel_es6.x"
-ES8LOCATION ?= "${S}/gfx_rel_es8.x"
+export BINLOCATION ?= "${S}/gfx_rel"
+export ES2LOCATION ?= "${S}/gfx_rel_es2.x"
+export ES3LOCATION ?= "${S}/gfx_rel_es3.x"
+export ES5LOCATION ?= "${S}/gfx_rel_es5.x"
+export ES6LOCATION ?= "${S}/gfx_rel_es6.x"
+export ES8LOCATION ?= "${S}/gfx_rel_es8.x"
 
 do_configure() {
 	# Attempt to fix up the worst offenders for file permissions
@@ -132,7 +132,8 @@ do_install () {
 
 	install -m 0755 ${BINLOCATION}/*_test ${D}${bindir}/
 	install -m 0755 ${BINLOCATION}/gl* ${D}${bindir}/
-	install -m 0755 ${BINLOCATION}/p[dv]* ${D}${bindir}/
+	install -m 0755 ${BINLOCATION}/pvrsrvinit ${D}${bindir}/
+
 	install -m 0755 ${BINLOCATION}/xgles1test1 ${D}${bindir}/
 
 	install -m 0755 ${BINLOCATION}/freedesktop/kdrive/usr/X11R6_SGX/bin/Xsgx ${D}${bindir}/|| true
@@ -172,31 +173,15 @@ do_install () {
 	install -d ${D}${bindir}/ES3.0
 	install -d ${D}${bindir}/ES2.0
 
-
-	if [ -e ${ES2LOCATION} ] ; then
-		cp -pPR ${ES2LOCATION}/lib*${IMGPV} ${D}${libdir}/ES2.0/
-		cp ${ES2LOCATION}/p[dv]* ${D}${bindir}/ES2.0/
-	fi
-
-	if [ -e ${ES3LOCATION} ] ; then
-		cp -pPR ${ES3LOCATION}/lib*${IMGPV} ${D}${libdir}/ES3.0/
-		cp ${ES3LOCATION}/p[dv]* ${D}${bindir}/ES3.0
-	fi
-
-	if [ -e ${ES5LOCATION} ] ; then 
-		cp -pPR ${ES5LOCATION}/lib*${IMGPV} ${D}${libdir}/ES5.0/
-		cp ${ES5LOCATION}/p[dv]* ${D}${bindir}/ES5.0/
-	fi
-
-	if [ -e ${ES6LOCATION} ] ; then
-		cp -pPR ${ES6LOCATION}/lib*${IMGPV} ${D}${libdir}/ES6.0/
-		cp ${ES6LOCATION}/p[dv]* ${D}${bindir}/ES6.0/
-	fi
-
-	if [ -e ${ES8LOCATION} ] ; then
-		cp -pPR ${ES8LOCATION}/lib*${IMGPV} ${D}${libdir}/ES8.0/
-		cp ${ES8LOCATION}/p[dv]* ${D}${bindir}/ES8.0/
-	fi
+	for esrev in 2 3 5 6 8 ; do
+		ESLOCATION=$(eval echo $(echo \$\{ES${esrev}LOCATION\}))
+		if [ -e ${ESLOCATION} ] ; then
+			cp -pPR ${ESLOCATION}/lib*${IMGPV} ${ESLOCATION}/pvr_drv.so ${ESLOCATION}/*.a ${D}${libdir}/ES${esrev}.0/
+			for esprog in eglinfo eglinfo_x gles1test1 gles2test1 ovg_unit_test pvr2d_test pvrsrvinit services_test sgx_blit_test sgx_clipblit_test sgx_flip_test sgx_init_test sgx_render_flip_test xgles1test1 xgles2test1 xmultiegltest xovg_unit_test ; do
+				install -m 0755 ${ESLOCATION}/$esprog ${D}${bindir}/ES${esrev}.0/ || true
+			done
+		fi
+	done
 
 	rm ${D}${bindir}/ES*/*.h ${D}${bindir}/ES*/pdsasm ${D}${bindir}/pdsasm -f || true
 


