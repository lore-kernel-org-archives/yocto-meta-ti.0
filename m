Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A16F3E0137D
	for <meta-ti@lists.yoctoproject.org>;
	Mon, 23 Jan 2012 06:18:44 -0800 (PST)
Received: by wibhi8 with SMTP id hi8so660362wib.26
	for <meta-ti@lists.yoctoproject.org>;
	Mon, 23 Jan 2012 06:18:43 -0800 (PST)
MIME-Version: 1.0
Received: by 10.180.96.161 with SMTP id dt1mr14270913wib.13.1327328323609;
	Mon, 23 Jan 2012 06:18:43 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id di5sm41581699wib.3.2012.01.23.06.18.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 23 Jan 2012 06:18:43 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@lists.yoctoproject.org
Date: Mon, 23 Jan 2012 15:18:24 +0100
Message-Id: <1327328309-15956-3-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1327328309-15956-1-git-send-email-koen@dominion.thruhere.net>
References: <1327328309-15956-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQmGLXP3tlbrDLIwkUbblYTYKhDh+xGs2zijBApsR/qT6vp8y0TdPuwpv8oXtr+PM7ph7y83
Subject: [PATCH 2/7] libgles-omap3: merge in updates from arago
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
X-List-Received-Date: Mon, 23 Jan 2012 14:18:45 -0000

* ES3.x do_install fix
* AM335x support

And one non-arago fix: break dependency on 'initscripts' package

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 recipes-graphics/libgles/libgles-omap3.inc     |   26 ++++++++++++++------
 recipes-graphics/libgles/libgles-omap3/cputype |   10 ++++++-
 recipes-graphics/libgles/libgles-omap3/rc.pvr  |   29 +++++++++++++++++++-----
 3 files changed, 49 insertions(+), 16 deletions(-)

diff --git a/recipes-graphics/libgles/libgles-omap3.inc b/recipes-graphics/libgles/libgles-omap3.inc
index dc0185a..0a05a0b 100644
--- a/recipes-graphics/libgles/libgles-omap3.inc
+++ b/recipes-graphics/libgles/libgles-omap3.inc
@@ -3,9 +3,9 @@ LICENSE = "proprietary-binary"
 # 'TSPA.txt' might not be the best file to md5sum
 LIC_FILES_CHKSUM = "file://TSPA.txt;md5=c0d5d9c1e38b41677144c4e24d6ddee1"
 
-PR = "r18"
+PR = "r19"
 
-COMPATIBLE_MACHINE = "(omap3|ti816x)"
+COMPATIBLE_MACHINE = "(omap3|ti816x|ti33x)"
 
 DEPENDS = "virtual/libx11 libxau libxdmcp"
 
@@ -29,6 +29,7 @@ ES2LOCATION ?= "${S}/gfx_rel_es2.x"
 ES3LOCATION ?= "${S}/gfx_rel_es3.x"
 ES5LOCATION ?= "${S}/gfx_rel_es5.x"
 ES6LOCATION ?= "${S}/gfx_rel_es6.x"
+ES8LOCATION ?= "${S}/gfx_rel_es8.x"
 
 do_configure() {
 	# Attempt to fix up the worst offenders for file permissions
@@ -158,22 +159,28 @@ do_install () {
 
 	# The ES2.x, ES3.x, ES5.x and ES6.x CPUs have different SGX hardware, so we need to install multiple sets of userspace
 
+	install -d ${D}${libdir}/ES8.0
 	install -d ${D}${libdir}/ES6.0
 	install -d ${D}${libdir}/ES5.0
 	install -d ${D}${libdir}/ES3.0
 	install -d ${D}${libdir}/ES2.0
 
+	install -d ${D}${bindir}/ES8.0
 	install -d ${D}${bindir}/ES6.0
 	install -d ${D}${bindir}/ES5.0
 	install -d ${D}${bindir}/ES3.0
 	install -d ${D}${bindir}/ES2.0
 
 
-	cp -pPR ${ES2LOCATION}/lib*${IMGPV} ${D}${libdir}/ES2.0/
-	cp ${ES2LOCATION}/p[dv]* ${D}${bindir}/ES2.0/
+	if [ -e ${ES2LOCATION} ] ; then
+		cp -pPR ${ES2LOCATION}/lib*${IMGPV} ${D}${libdir}/ES2.0/
+		cp ${ES2LOCATION}/p[dv]* ${D}${bindir}/ES2.0/
+	fi
 
-	cp -pPR ${D}${libdir}/lib*${IMGPV} ${D}${libdir}/ES3.0/
-	cp ${D}${bindir}/p[dv]* ${D}${bindir}/ES3.0
+	if [ -e ${ES3LOCATION} ] ; then
+		cp -pPR ${ES3LOCATION}/lib*${IMGPV} ${D}${libdir}/ES3.0/
+		cp ${ES3LOCATION}/p[dv]* ${D}${bindir}/ES3.0
+	fi
 
 	if [ -e ${ES5LOCATION} ] ; then 
 		cp -pPR ${ES5LOCATION}/lib*${IMGPV} ${D}${libdir}/ES5.0/
@@ -185,6 +192,11 @@ do_install () {
 		cp ${ES6LOCATION}/p[dv]* ${D}${bindir}/ES6.0/
 	fi
 
+	if [ -e ${ES8LOCATION} ] ; then
+		cp -pPR ${ES8LOCATION}/lib*${IMGPV} ${D}${libdir}/ES8.0/
+		cp ${ES8LOCATION}/p[dv]* ${D}${bindir}/ES8.0/
+	fi
+
 	rm ${D}${bindir}/ES*/*.h ${D}${bindir}/ES*/pdsasm ${D}${bindir}/pdsasm -f || true
 
 	install -d ${D}${prefix}/share/applications
@@ -272,8 +284,6 @@ FILES_${PN}-x11wsegl-es8 = "${libdir}/ES8*/libpvrPVR2D_X11WSEGL.so.*"
 RRECOMMENDS_${PN}-x11wsegl = " ${PN}-x11wsegl-es2 ${PN}-x11wsegl-es3 ${PN}-x11wsegl-es5 ${PN}-x11wsegl-es6 ${PN}-x11wsegl-es8"
 
 CONFFILES_${PN} = "${sysconfdir}/powervr.ini"
-# 'cputype' uses /etc/init.d/functions
-RRECOMMENDS_${PN} += "initscripts"
 
 FILES_${PN} = "${sysconfdir} ${libdir}/lib*.so.* ${libdir}/ES*/* ${bindir}/pvrsrvinit ${bindir}/cputype ${bindir}/*/*"
 
diff --git a/recipes-graphics/libgles/libgles-omap3/cputype b/recipes-graphics/libgles/libgles-omap3/cputype
index 27f411d..4448c30 100755
--- a/recipes-graphics/libgles/libgles-omap3/cputype
+++ b/recipes-graphics/libgles/libgles-omap3/cputype
@@ -1,11 +1,17 @@
 #!/bin/sh
-. /etc/init.d/functions
+
+machine_id() { # return the machine ID
+	awk 'BEGIN { FS=": " } /Hardware/ \
+		{ gsub(" ", "_", $2); print tolower($2) } ' </proc/cpuinfo
+}
 
 if [ "$(machine_id)" = "ti8168evm" ] ; then
 	echo TI816x
+elif [ "$(machine_id)" = "am335xevm" ] ; then
+    echo TI33XX
 else
 	devmem2 0x4800244c | \
 	grep 'Read at address' | \
 	sed -e 's/.*): //' | \
-	sed -e 's/0x00005C00/OMAP3503/' -e 's/0x00001C00/OMAP3515/' -e 's/0x00004C00/OMAP3525/' -e 's/0x00000C00/OMAP3530/'
+	sed -e 's/0x00005C00/OMAP3503/' -e 's/0x00001C00/OMAP3515/' -e 's/0x00004C00/OMAP3525/' -e 's/0x00000C00/OMAP3530/' -e 's/0x00005E00/OMAP3503/' -e 's/0x00001E00/OMAP3515/' -e 's/0x00004E00/OMAP3525/' -e 's/0x00000E00/OMAP3530/' -e 's/0x00000CC0/OMAP3530/'
 fi
diff --git a/recipes-graphics/libgles/libgles-omap3/rc.pvr b/recipes-graphics/libgles/libgles-omap3/rc.pvr
index d32f9e4..07efa66 100755
--- a/recipes-graphics/libgles/libgles-omap3/rc.pvr
+++ b/recipes-graphics/libgles/libgles-omap3/rc.pvr
@@ -1,6 +1,15 @@
 #!/bin/sh
 PATH=$PATH:/usr/sbin
 
+# Check if an fb device is available.  If not then just go ahead and
+# exit because we have no display.
+fbset > /dev/null 2>&1
+if [ "$?" == "1" ]
+then
+    # looks like there is no display, so let's exit
+    exit 0
+fi
+
 BITSPERPIXEL="$(fbset | grep geom | awk '{print $6}')"
 YRES="$(fbset | grep geom | awk '{print $3}')"
 
@@ -28,7 +37,7 @@ if [ "$BITSPERPIXEL" = "32" ] ; then
 fi
 
 # Try to enable triple buffering when there's enough VRAM
-fbset -vyres $(expr $YRES \* 3) 
+fbset -vyres $(expr $YRES \* 3)
 
 sgxprepare () {
 	echo Starting PVR
@@ -39,11 +48,11 @@ sgxprepare () {
 	pvr_maj=`grep "pvrsrvkm$" /proc/devices | cut -b1,2,3`
         bc_maj=`grep "bc" /proc/devices | cut -b1,2,3`
 
-	if [ -e /dev/pvrsrvkm ] ; then 
+	if [ -e /dev/pvrsrvkm ] ; then
 		rm -f /dev/pvrsrvkm
 	fi
 
-	mknod /dev/pvrsrvkm c $pvr_maj 0 
+	mknod /dev/pvrsrvkm c $pvr_maj 0
 	chmod 666 /dev/pvrsrvkm
 
 	touch /etc/powervr-esrev
@@ -56,7 +65,7 @@ sgxfinish () {
 		echo -n "Starting SGX fixup for"
 		echo " ES${ES_REVISION}.x"
 		cp -a /usr/lib/ES${ES_REVISION}.0/* /usr/lib
-		cp -a /usr/bin/ES${ES_REVISION}.0/* /usr/bin	
+		cp -a /usr/bin/ES${ES_REVISION}.0/* /usr/bin
 		echo "${ES_REVISION}" > /etc/powervr-esrev
 	fi
 	/usr/bin/pvrsrvinit
@@ -74,6 +83,16 @@ case $CPUTYPE in
 
 	sgxfinish
 	;;
+"TI33XX")
+	sgxprepare
+
+	devmem2 0x44e01104 w 0x0 > /dev/null
+	devmem2 0x44e00904 w 0x2 > /dev/null
+
+	ES_REVISION="$(devmem2 0x56000014 | sed -e s:0x00010205:8: | tail -n1 | awk -F': ' '{print $2}')"
+
+	sgxfinish
+	;;
 "TI816x")
 	sgxprepare
 
@@ -89,5 +108,3 @@ case $CPUTYPE in
 	echo No SGX hardware, not starting PVR
 	;;
 esac
-
-
-- 
1.7.2.5


