Return-Path: <prabu@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3636CE0153C
	for <meta-ti@yoctoproject.org>; Fri, 17 May 2013 09:58:19 -0700 (PDT)
Received: from dbdlxv05.itg.ti.com ([172.24.171.60])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r4HGwHZr017021
	for <meta-ti@yoctoproject.org>; Fri, 17 May 2013 11:58:18 -0500
Received: from DBDE72.ent.ti.com (dbde72.ent.ti.com [172.24.171.97])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id r4HGwBW4026687
	for <meta-ti@yoctoproject.org>; Fri, 17 May 2013 11:58:16 -0500
Received: from dbdp32.itg.ti.com (172.24.170.251) by DBDE72.ent.ti.com
	(172.24.171.97) with Microsoft SMTP Server id 14.2.342.3;
	Sat, 18 May 2013 00:58:12 +0800
Received: from bangubntigfx.india.ti.com (smtpvbd.itg.ti.com [172.24.170.250])
	by dbdp32.itg.ti.com (8.13.8/8.13.8) with ESMTP id r4HGwAur014936;
	Fri, 17 May 2013 22:28:12 +0530
From: Prabindh Sundareson <prabu@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 17 May 2013 22:27:54 +0530
Message-ID: <1368809879-27201-5-git-send-email-prabu@ti.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <prabu@ti.com>
References: <prabu@ti.com>
MIME-Version: 1.0
Subject: [PATCH 05/10] libgles-omap3: Remove copying of unused header files
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
X-List-Received-Date: Fri, 17 May 2013 16:58:19 -0000
Content-Type: text/plain

Current recipe copies lot of headers that are unused, including
unsupported files for OpenVG. This patch removes copying of such files.

Signed-off-by: Prabindh Sundareson <prabu@ti.com>
---
 recipes-graphics/libgles/libgles-omap3-no-x.inc |    9 +++------
 1 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/recipes-graphics/libgles/libgles-omap3-no-x.inc b/recipes-graphics/libgles/libgles-omap3-no-x.inc
index 0c41d76..1704e1a 100644
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
-- 
1.7.1


