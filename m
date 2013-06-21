Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7CBA5E01493
	for <meta-ti@yoctoproject.org>; Fri, 21 Jun 2013 11:54:28 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 6C4B452A8E; Fri, 21 Jun 2013 18:54:28 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130621185428.6C4B452A8E@arago-project.org>
Date: Fri, 21 Jun 2013 18:54:28 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Prabindh Sundareson : libgles-omap3: Remove copying of unused header files
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
X-List-Received-Date: Fri, 21 Jun 2013 18:54:29 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: c4fa819032cba531d65c53b1335ff2a628236cab
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=c4fa819032cba531d65c53b1335ff2a628236cab

Author: Prabindh Sundareson <prabu@ti.com>
Date:   Wed Jun 12 23:10:38 2013 +0530

libgles-omap3: Remove copying of unused header files

Current recipe copies lot of headers that are unused, including
unsupported files for OpenVG. This patch removes copying of such files.

Signed-off-by: Prabindh Sundareson <prabu at ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-graphics/libgles/libgles-omap3-no-x.inc |    9 +++------
 1 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/recipes-graphics/libgles/libgles-omap3-no-x.inc b/recipes-graphics/libgles/libgles-omap3-no-x.inc
index 9dc7cc8..094ad81 100644
--- a/recipes-graphics/libgles/libgles-omap3-no-x.inc
+++ b/recipes-graphics/libgles/libgles-omap3-no-x.inc
@@ -133,12 +133,9 @@ do_install () {
 	cp -pPR ${S}/GFX_Linux_KM/include4 ${D}${includedir}/
 	cp -pPR ${S}/GFX_Linux_KM/services4 ${D}${includedir}/
 
-	cp -pPR ${S}/GFX_Linux_SDK/OGLES2/SDKPackage/Builds/OGLES2/Include/* ${D}${includedir}/
-	cp -pPR ${S}/GFX_Linux_SDK/OGLES/SDKPackage/Builds/OGLES/Include/* ${D}${includedir}/
-	cp -pPR ${S}/GFX_Linux_SDK/OGLES/SDKPackage/Builds/OGLES/${PLATFORM}/Include/GLES/* ${D}${includedir}/GLES/ 2>/dev/null || true
-	cp -pPr ${S}/GFX_Linux_SDK/OGLES2/SDKPackage/Builds/OGLES2/${PLATFORM}/Include/GLES/* ${D}${includedir}/GLES2/ 2>/dev/null || true
-	cp -pPr ${S}/include/*.h ${D}${includedir} || true
-	cp -pPr ${S}/include/wsegl/*.h ${D}${includedir} || true
+	cp -pPr ${S}/include/pvr2d/*.h ${D}${includedir}
+	cp -pPr ${S}/include/OGLES2/* ${D}${includedir}/
+	cp -pPr ${S}/include/wsegl/*.h ${D}${includedir}/
 	
 	install -d ${D}${sysconfdir}/init.d/
 	cp -pP ${WORKDIR}/rc.pvr ${D}${sysconfdir}/init.d/pvr-init


