Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 036CDE01410
	for <meta-ti@yoctoproject.org>; Tue, 19 Mar 2013 19:17:53 -0700 (PDT)
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r2K2HqrT013145
	for <meta-ti@yoctoproject.org>; Tue, 19 Mar 2013 21:17:53 -0500
Received: from DBDE70.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2K2HpvI025821
	for <meta-ti@yoctoproject.org>; Wed, 20 Mar 2013 07:47:51 +0530 (IST)
Received: from dbdp32.itg.ti.com (172.24.170.251) by dbde70.ent.ti.com
	(172.24.170.148) with Microsoft SMTP Server id 14.1.323.3;
	Wed, 20 Mar 2013 07:47:51 +0530
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dbdp32.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2K2HnDw026646;
	Wed, 20 Mar 2013 07:47:50 +0530
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 19 Mar 2013 21:17:47 -0500
Message-ID: <1363745867-10571-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH] libgles-omap3.inc: Add tweaks needed for newer version of the Graphics SDK
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
X-List-Received-Date: Wed, 20 Mar 2013 02:17:54 -0000
Content-Type: text/plain

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
-- 
1.7.0.4


