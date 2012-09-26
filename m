Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3C888E01400
	for <meta-ti@yoctoproject.org>; Wed, 26 Sep 2012 11:54:33 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 3C76652A5D; Wed, 26 Sep 2012 18:54:33 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120926185433.3C76652A5D@arago-project.org>
Date: Wed, 26 Sep 2012 18:54:33 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Franklin S. Cooper Jr : libgles-omap3.inc: Tweak PLATFORM variable.
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
X-List-Received-Date: Wed, 26 Sep 2012 18:54:34 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 80cc70e50107bbc52001ad51a9f2b5a15935ce17
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=80cc70e50107bbc52001ad51a9f2b5a15935ce17

Author: Franklin S. Cooper Jr <fcooper@ti.com>
Date:   Fri Aug 31 18:19:57 2012 -0500

libgles-omap3.inc: Tweak PLATFORM variable.

* Newer versions of libgles-omap3 utilize a different PLATFORM value. This
  patch allows the PLATFORM variable to be easily overridden if needed.
* Replace the hardcoded usage of LinuxOMAP3 with the PLATFORM variable.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-graphics/libgles/libgles-omap3.inc |   41 ++++++++++++++-------------
 1 files changed, 21 insertions(+), 20 deletions(-)

diff --git a/recipes-graphics/libgles/libgles-omap3.inc b/recipes-graphics/libgles/libgles-omap3.inc
index ac9d5df..b6aa382 100644
--- a/recipes-graphics/libgles/libgles-omap3.inc
+++ b/recipes-graphics/libgles/libgles-omap3.inc
@@ -65,10 +65,11 @@ TARGET_CC_ARCH += " ${TARGET_LINK_HASH_STYLE} -Wl,-rpath-link,${BINLOCATION} -L$
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
@@ -81,23 +82,23 @@ do_compile() {
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
 
@@ -113,14 +114,14 @@ do_compile() {
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
 
@@ -141,7 +142,7 @@ do_install () {
 	install -m 0755 ${BINLOCATION}/xgles1test1 ${D}${bindir}/
 
 	install -m 0755 ${BINLOCATION}/freedesktop/kdrive/usr/X11R6_SGX/bin/Xsgx ${D}${bindir}/|| true
-	cp -pPR ${S}/GFX_Linux_SDK/OGLES2/SDKPackage/Builds/OGLES2/LinuxOMAP3/lib/*X11WS* ${D}${libdir} || true
+	cp -pPR ${S}/GFX_Linux_SDK/OGLES2/SDKPackage/Builds/OGLES2/${PLATFORM}/lib/*X11WS* ${D}${libdir} || true
 
 	install -d ${D}${includedir}
 	cp -pPR ${S}/GFX_Linux_KM/include4 ${D}${includedir}/
@@ -149,8 +150,8 @@ do_install () {
 
 	cp -pPR ${S}/GFX_Linux_SDK/OGLES2/SDKPackage/Builds/OGLES2/Include/* ${D}${includedir}/
 	cp -pPR ${S}/GFX_Linux_SDK/OGLES/SDKPackage/Builds/OGLES/Include/* ${D}${includedir}/
-	cp -pPR ${S}/GFX_Linux_SDK/OGLES/SDKPackage/Builds/OGLES/LinuxOMAP3/Include/GLES/* ${D}${includedir}/GLES/ || true
-	cp -pPr ${S}/GFX_Linux_SDK/OGLES2/SDKPackage/Builds/OGLES2/LinuxOMAP3/Include/GLES/* ${D}${includedir}/GLES2/ || true
+	cp -pPR ${S}/GFX_Linux_SDK/OGLES/SDKPackage/Builds/OGLES/${PLATFORM}/Include/GLES/* ${D}${includedir}/GLES/ || true
+	cp -pPr ${S}/GFX_Linux_SDK/OGLES2/SDKPackage/Builds/OGLES2/${PLATFORM}/Include/GLES/* ${D}${includedir}/GLES2/ || true
 	cp -pPr ${S}/GFX_Linux_SDK/OVG/SDKPackage/Builds/OVG/Include/v* ${D}${includedir}/ || true
 	cp -pPr ${S}/GFX_Linux_SDK/OVG/SDKPackage/Builds/OVG/Include/V* ${D}${includedir}/ || true
 	cp -pPr ${S}/include/*.h ${D}${includedir} || true


