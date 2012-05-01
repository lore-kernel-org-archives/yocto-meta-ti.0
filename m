Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wg0-f42.google.com (mail-wg0-f42.google.com [74.125.82.42])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6255BE0132F
	for <meta-ti@yoctoproject.org>; Tue,  1 May 2012 06:04:08 -0700 (PDT)
Received: by wgbds11 with SMTP id ds11so3092772wgb.5
	for <meta-ti@yoctoproject.org>; Tue, 01 May 2012 06:04:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=eYC4gGxMXKt+ahNnjpSnKcdYib85haWMJJloWPpuxws=;
	b=i83Yo+k47iGrutGevmp/XCjdPPWde+gr5zmFtXyh1hkRY0EZtqOM9IZNeJYwmB5RwB
	yVkPQoUGMvWttGnHYbs4YpR1JXka9/bs2B3tcDuUrSo2Mo9jZPj2BFfs4rB8Rm8caF/h
	Mn6ymDl9OlVLMe748ItmXQ2x4bvToGWTHx+hfpiPP1shpdsxxFrQA3q9josHg+minoSy
	Tqb3oIR0OCPVt8kppThi+sJs0VWwBWceMIfQSTILLsM6siEq0w+L31Y24ektB6Qgqn3I
	QOeVirWMVZpja7ytFJn9nphyIFqqREzMMdcJhg7zuhW/cuvIDXuS0+TOxidVTPOVy3rs
	tlhA==
Received: by 10.180.106.9 with SMTP id gq9mr5093394wib.17.1335877446990;
	Tue, 01 May 2012 06:04:06 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id 6sm36294032wiz.1.2012.05.01.06.04.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 01 May 2012 06:04:06 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@yoctoproject.org
Date: Tue,  1 May 2012 15:03:57 +0200
Message-Id: <1335877438-23916-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQkHZ7q2wnRuGqspZujnWmODdg+b+yQrlhyppcafjvW6dEh11+SgeGDmmVDR2YVxktbRxTAM
Cc: denys@ti.com
Subject: [PATCH 1/2] libgles-omap3: copy over all binaries and abstract install process
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
X-List-Received-Date: Tue, 01 May 2012 13:04:08 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 recipes-graphics/libgles/libgles-omap3.inc |   51 ++++++++++------------------
 1 file changed, 18 insertions(+), 33 deletions(-)

diff --git a/recipes-graphics/libgles/libgles-omap3.inc b/recipes-graphics/libgles/libgles-omap3.inc
index 93cb091..c363361 100644
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
 
-- 
1.7.10


