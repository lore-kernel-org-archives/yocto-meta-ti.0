Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6DFBDE01402
	for <meta-ti@yoctoproject.org>; Wed,  2 May 2012 05:33:38 -0700 (PDT)
Received: by wibhm17 with SMTP id hm17so3974080wib.11
	for <meta-ti@yoctoproject.org>; Wed, 02 May 2012 05:33:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=eYC4gGxMXKt+ahNnjpSnKcdYib85haWMJJloWPpuxws=;
	b=WMJx/70iATvMLH8DlN9LXndmKByqAmMU1SztvI+WUCyfxsSfBBKG1/RdLPRSvufo8v
	jrvpNwWCdLiCaQGkwOkwHoM8c/txRLuD7bjPj24J82etgVarD05MGBuZAAJLjMeLKgTf
	po14Vw4VR8k7LoNprqHmCPoHhNxdDCyHOK5F+BNc5sXJOzD0nDjrB//zbYLdi/fcHQGF
	udfk0onmab8mGTEu3hvDSa1RUQ7xRAuBrfVV6mtAaTfQrcZLh2ffCJ+NPw+DvKKJOAfS
	MlVNfBA+FQj0WWfGEzl5ZMay0vJaNhpB3lddv2UAC5TyqPI7SrDuuUlQXdfepEoXFQFZ
	EpXQ==
Received: by 10.180.96.228 with SMTP id dv4mr9765286wib.14.1335962016809;
	Wed, 02 May 2012 05:33:36 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id gg2sm6297855wib.7.2012.05.02.05.33.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 02 May 2012 05:33:35 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@yoctoproject.org
Date: Wed,  2 May 2012 14:33:23 +0200
Message-Id: <1335962006-27727-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQlFzvqIXrqavhSvhVr/+jgHwadEdWTv+joALZeEqoD5TBFnkMZJtR04LO+n0mB+XwMpA/iF
Cc: denys@ti.com
Subject: [PATCH 1/4] libgles-omap3: copy over all binaries and abstract install process
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
X-List-Received-Date: Wed, 02 May 2012 12:33:38 -0000

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


