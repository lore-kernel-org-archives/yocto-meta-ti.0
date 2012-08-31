Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f176.google.com (mail-ob0-f176.google.com
	[209.85.214.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3AEF9E00283
	for <meta-ti@yoctoproject.org>; Fri, 31 Aug 2012 16:04:27 -0700 (PDT)
Received: by obbtb18 with SMTP id tb18so8366432obb.35
	for <meta-ti@yoctoproject.org>; Fri, 31 Aug 2012 16:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=PWkI+CPGh2Np2LfcH7TKdTtCLqyqqFr7gGmZm+yns4M=;
	b=Ry7i5jZ9Hcnsf92Qx1VyANIb6JUkThkB9RTQjvGvKibEnN1aKh1RWjOB0HNq2x5OPW
	N7V9qB7/2upqyLvZJBY/RvTAacwxY2ppBq9UiZoVW8YEC5Y5JpyR88t8+FCxp2HJvx2U
	GVA2QE+feTfpjFT39ny4cpK21NeRQUtjyZjBEQdXk73+qWT3WJKYDODyyqx+kJRn/hN9
	eyRO+w9HdZLh2B4kiUpQ0VEVPcg04G+As84MNtlGyXxYmtVFnTsGlMYArvVYXpVkOl+P
	pRGBQGW9tbahokQ495XWqGil7AQi083B1MbW5xyc3XaGEV2tB6mwW5TauK7U1YXnGikN
	kJpA==
Received: by 10.182.51.65 with SMTP id i1mr9221717obo.45.1346454266602;
	Fri, 31 Aug 2012 16:04:26 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id x10sm3916724oeb.8.2012.08.31.16.04.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 31 Aug 2012 16:04:26 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-ti@yoctoproject.org
Date: Fri, 31 Aug 2012 18:19:57 -0500
Message-Id: <1346455197-18722-1-git-send-email-fcooper27jr@gmail.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH] libgles-omap3.inc: Tweak PLATFORM variable.
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
X-List-Received-Date: Fri, 31 Aug 2012 23:04:27 -0000

From: Franklin S. Cooper Jr <fcooper@ti.com>

* Newer versions of libgles-omap3 utilize a different PLATFORM value. This
  patch allows the PLATFORM variable to be easily overridden if needed.
* Replace the hardcoded usage of LinuxOMAP3 with the PLATFORM variable.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 recipes-graphics/libgles/libgles-omap3.inc |   41 ++++++++++++++-------------
 1 files changed, 21 insertions(+), 20 deletions(-)

diff --git a/recipes-graphics/libgles/libgles-omap3.inc b/recipes-graphics/libgles/libgles-omap3.inc
index 6137097..18ee7ff 100644
--- a/recipes-graphics/libgles/libgles-omap3.inc
+++ b/recipes-graphics/libgles/libgles-omap3.inc
@@ -61,10 +61,11 @@ TARGET_CC_ARCH += " ${TARGET_LINK_HASH_STYLE} -Wl,-rpath-link,${BINLOCATION} -L$
 -L${STAGING_DIR_TARGET}${libdir} -Wl,-rpath-link,${STAGING_DIR_TARGET}${libdir}"
 PARALLEL_MAKE = ""
 
+PLATFORM ?= "LinuxOMAP3"
+
 do_compile() {
 	export X11ROOT="${STAGING_DIR_HOST}/usr"
 	export TOOLCHAIN="${TOOLCHAIN_PATH}"
-	export PLATFORM="LinuxOMAP3"
 
 	export PLAT_CC="${CC}"
 	export PLAT_CPP="${CXX}"
@@ -77,23 +78,23 @@ do_compile() {
 	for X11BUILD in 0 1 ; do
 		for demo in ${S}/GFX_Linux_SDK/OGLES/SDKPackage/Demos/* ; do
 			cd $demo/OGLES/Build/LinuxGeneric
-			oe_runmake Common=1 PLATFORM=$PLATFORM X11BUILD=$X11BUILD  
-			rm $demo/OGLES/Build/LinuxOMAP3/Release*/*.o
-			install -m 0755 $demo/OGLES/Build/LinuxOMAP3/ReleaseX11/* ${S}/demos/x11 || true
+			oe_runmake Common=1 PLATFORM=${PLATFORM} X11BUILD=$X11BUILD
+			rm $demo/OGLES/Build/${PLATFORM}/Release*/*.o
+			install -m 0755 $demo/OGLES/Build/${PLATFORM}/ReleaseX11/* ${S}/demos/x11 || true
 			sed -e s:NAME:$(basename $demo): \
-			    -e s:EXEC:${bindir}/SGX/demos/X11/$(basename $demo/OGLES/Build/LinuxOMAP3/ReleaseX11/*): \
+			    -e s:EXEC:${bindir}/SGX/demos/X11/$(basename $demo/OGLES/Build/${PLATFORM}/ReleaseX11/*): \
 			     ${WORKDIR}/sample.desktop > ${WORKDIR}/$(basename $demo).desktop
-			install -m 0755 $demo/OGLES/Build/LinuxOMAP3/ReleaseRaw/* ${S}/demos/raw || true	
+			install -m 0755 $demo/OGLES/Build/${PLATFORM}/ReleaseRaw/* ${S}/demos/raw || true
 		done
 		for demo in ${S}/GFX_Linux_SDK/OGLES2/SDKPackage/Demos/* ; do
 			cd $demo/OGLES2/Build/LinuxGeneric
-			oe_runmake Common=1 PLATFORM=$PLATFORM X11BUILD=$X11BUILD  
-			rm -f $demo/OGLES2/Build/LinuxOMAP3/Release*/*.o
-			install -m 0755 $demo/OGLES2/Build/LinuxOMAP3/ReleaseX11/* ${S}/demos/x11 || true
+			oe_runmake Common=1 PLATFORM=${PLATFORM} X11BUILD=$X11BUILD
+			rm -f $demo/OGLES2/Build/${PLATFORM}/Release*/*.o
+			install -m 0755 $demo/OGLES2/Build/${PLATFORM}/ReleaseX11/* ${S}/demos/x11 || true
 			sed -e s:NAME:$(basename $demo): \
-			    -e s:EXEC:${bindir}/SGX/demos/X11/$(basename $demo/OGLES2/Build/LinuxOMAP3/ReleaseX11/*): \
+			    -e s:EXEC:${bindir}/SGX/demos/X11/$(basename $demo/OGLES2/Build/${PLATFORM}/ReleaseX11/*): \
 			     ${WORKDIR}/sample.desktop > ${WORKDIR}/$(basename $demo).desktop
-			install -m 0755 $demo/OGLES2/Build/LinuxOMAP3/ReleaseRaw/* ${S}/demos/raw || true	
+			install -m 0755 $demo/OGLES2/Build/${PLATFORM}/ReleaseRaw/* ${S}/demos/raw || true
 		done
 	done
 
@@ -109,14 +110,14 @@ do_compile() {
 				cd $training/OGLES2/Build/LinuxGeneric
 			fi
 
-			if [ -e $training/OGLES2/Build/LinuxOMAP3/Makefile ] ; then
-				cd $training/OGLES2/Build/LinuxOMAP3
+			if [ -e $training/OGLES2/Build/${PLATFORM}/Makefile ] ; then
+				cd $training/OGLES2/Build/${PLATFORM}
 			fi			
 
-			oe_runmake Common=1 PLATFORM=$PLATFORM X11BUILD=$X11BUILD  
-			rm -f $training/OGLES2/Build/LinuxOMAP3/Release*/*.o
-			install -m 0755 $training/OGLES2/Build/LinuxOMAP3/ReleaseX11/* ${S}/trainingcourses/x11 || true
-			install -m 0755 $training/OGLES2/Build/LinuxOMAP3/ReleaseRaw/* ${S}/trainingcourses/raw || true	
+			oe_runmake Common=1 PLATFORM=${PLATFORM} X11BUILD=$X11BUILD
+			rm -f $training/OGLES2/Build/${PLATFORM}/Release*/*.o
+			install -m 0755 $training/OGLES2/Build/${PLATFORM}/ReleaseX11/* ${S}/trainingcourses/x11 || true
+			install -m 0755 $training/OGLES2/Build/${PLATFORM}/ReleaseRaw/* ${S}/trainingcourses/raw || true
 		done
 	done
 
@@ -137,7 +138,7 @@ do_install () {
 	install -m 0755 ${BINLOCATION}/xgles1test1 ${D}${bindir}/
 
 	install -m 0755 ${BINLOCATION}/freedesktop/kdrive/usr/X11R6_SGX/bin/Xsgx ${D}${bindir}/|| true
-	cp -pPR ${S}/GFX_Linux_SDK/OGLES2/SDKPackage/Builds/OGLES2/LinuxOMAP3/lib/*X11WS* ${D}${libdir} || true
+	cp -pPR ${S}/GFX_Linux_SDK/OGLES2/SDKPackage/Builds/OGLES2/${PLATFORM}/lib/*X11WS* ${D}${libdir} || true
 
 	install -d ${D}${includedir}
 	cp -pPR ${S}/GFX_Linux_KM/include4 ${D}${includedir}/
@@ -145,8 +146,8 @@ do_install () {
 
 	cp -pPR ${S}/GFX_Linux_SDK/OGLES2/SDKPackage/Builds/OGLES2/Include/* ${D}${includedir}/
 	cp -pPR ${S}/GFX_Linux_SDK/OGLES/SDKPackage/Builds/OGLES/Include/* ${D}${includedir}/
-	cp -pPR ${S}/GFX_Linux_SDK/OGLES/SDKPackage/Builds/OGLES/LinuxOMAP3/Include/GLES/* ${D}${includedir}/GLES/ || true
-	cp -pPr ${S}/GFX_Linux_SDK/OGLES2/SDKPackage/Builds/OGLES2/LinuxOMAP3/Include/GLES/* ${D}${includedir}/GLES2/ || true
+	cp -pPR ${S}/GFX_Linux_SDK/OGLES/SDKPackage/Builds/OGLES/${PLATFORM}/Include/GLES/* ${D}${includedir}/GLES/ || true
+	cp -pPr ${S}/GFX_Linux_SDK/OGLES2/SDKPackage/Builds/OGLES2/${PLATFORM}/Include/GLES/* ${D}${includedir}/GLES2/ || true
 	cp -pPr ${S}/GFX_Linux_SDK/OVG/SDKPackage/Builds/OVG/Include/v* ${D}${includedir}/ || true
 	cp -pPr ${S}/GFX_Linux_SDK/OVG/SDKPackage/Builds/OVG/Include/V* ${D}${includedir}/ || true
 	cp -pPr ${S}/include/*.h ${D}${includedir} || true
-- 
1.7.0.4


