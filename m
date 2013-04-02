Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8D3C0E014D7
	for <meta-ti@yoctoproject.org>; Tue,  2 Apr 2013 12:43:13 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 5783152A3B; Tue,  2 Apr 2013 19:43:11 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130402194312.5783152A3B@arago-project.org>
Date: Tue,  2 Apr 2013 19:43:11 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Franklin S. Cooper Jr : libgles-omap3.inc: Add tweaks needed for newer version of the Graphics SDK
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
X-List-Received-Date: Tue, 02 Apr 2013 19:43:13 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: e377abc5f7f697ad9f70cf264b7c9c2fb44d61d8
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=e377abc5f7f697ad9f70cf264b7c9c2fb44d61d8

Author: Franklin S. Cooper Jr <fcooper@ti.com>
Date:   Tue Mar 19 21:17:47 2013 -0500

libgles-omap3.inc: Add tweaks needed for newer version of the Graphics SDK

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-graphics/libgles/libgles-omap3.inc |   18 +++++++++---------
 1 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/recipes-graphics/libgles/libgles-omap3.inc b/recipes-graphics/libgles/libgles-omap3.inc
index 66ebcd5..9a90c56 100644
--- a/recipes-graphics/libgles/libgles-omap3.inc
+++ b/recipes-graphics/libgles/libgles-omap3.inc
@@ -181,10 +181,10 @@ do_install () {
 
 	cp -pPR ${S}/GFX_Linux_SDK/OGLES2/SDKPackage/Builds/OGLES2/Include/* ${D}${includedir}/
 	cp -pPR ${S}/GFX_Linux_SDK/OGLES/SDKPackage/Builds/OGLES/Include/* ${D}${includedir}/
-	cp -pPR ${S}/GFX_Linux_SDK/OGLES/SDKPackage/Builds/OGLES/${PLATFORM}/Include/GLES/* ${D}${includedir}/GLES/ || true
-	cp -pPr ${S}/GFX_Linux_SDK/OGLES2/SDKPackage/Builds/OGLES2/${PLATFORM}/Include/GLES/* ${D}${includedir}/GLES2/ || true
-	cp -pPr ${S}/GFX_Linux_SDK/OVG/SDKPackage/Builds/OVG/Include/v* ${D}${includedir}/ || true
-	cp -pPr ${S}/GFX_Linux_SDK/OVG/SDKPackage/Builds/OVG/Include/V* ${D}${includedir}/ || true
+	cp -pPR ${S}/GFX_Linux_SDK/OGLES/SDKPackage/Builds/OGLES/${PLATFORM}/Include/GLES/* ${D}${includedir}/GLES/ 2>/dev/null || true
+	cp -pPr ${S}/GFX_Linux_SDK/OGLES2/SDKPackage/Builds/OGLES2/${PLATFORM}/Include/GLES/* ${D}${includedir}/GLES2/ 2>/dev/null || true
+	cp -pPr ${S}/GFX_Linux_SDK/OVG/SDKPackage/Builds/OVG/Include/v* ${D}${includedir}/ 2>/dev/null || true
+	cp -pPr ${S}/GFX_Linux_SDK/OVG/SDKPackage/Builds/OVG/Include/V* ${D}${includedir}/ 2>/dev/null || true
 	cp -pPr ${S}/include/*.h ${D}${includedir} || true
 	cp -pPr ${S}/include/wsegl/*.h ${D}${includedir} || true
 	
@@ -218,7 +218,7 @@ do_install () {
 		if [ -e ${ESLOCATION} ] ; then
 			cp -pPR ${ESLOCATION}/lib*${IMGPV} ${ESLOCATION}/pvr_drv.so ${ESLOCATION}/*.a ${D}${libdir}/ES${esrev}.0/
 			for esprog in $shared_prog $raw_prog ${@base_contains('DISTRO_FEATURES', 'x11',"$x11_prog","",d)} ; do
-				install -m 0755 ${ESLOCATION}/$esprog ${D}${bindir}/ES${esrev}.0/ || true
+				install -m 0755 ${ESLOCATION}/$esprog ${D}${bindir}/ES${esrev}.0/ 2>/dev/null || true
 			done
 		fi
 	done
@@ -232,14 +232,14 @@ do_install () {
 	if [ ${SUPPORT_XORG} -eq 1 ] ; then
 		install -d ${D}${bindir}/SGX/demos/X11/
 		install -m 0755 ${S}/demos/x11/* ${D}${bindir}/SGX/demos/X11/
-		install -d ${D}${bindir}/SGX/trainingcourses/X11
-		install -m 0755 ${S}/trainingcourses/x11/* ${D}${bindir}/SGX/trainingcourses/X11/
+		install -d ${D}${bindir}/SGX/trainingcourses/X11  2>/dev/null || true
+		install -m 0755 ${S}/trainingcourses/x11/* ${D}${bindir}/SGX/trainingcourses/X11/ 2>/dev/null || true
 	fi
 
 	install -d ${D}${bindir}/SGX/demos/Raw/
 	install -m 0755 ${S}/demos/raw/* ${D}${bindir}/SGX/demos/Raw/
-	install -d ${D}${bindir}/SGX/trainingcourses/Raw
-	install -m 0755 ${S}/trainingcourses/raw/* ${D}${bindir}/SGX/trainingcourses/Raw/
+	install -d ${D}${bindir}/SGX/trainingcourses/Raw 2>/dev/null || true
+	install -m 0755 ${S}/trainingcourses/raw/* ${D}${bindir}/SGX/trainingcourses/Raw/ 2>/dev/null || true
 
 
 	# Delete objects and linker scripts hidden between the headers


