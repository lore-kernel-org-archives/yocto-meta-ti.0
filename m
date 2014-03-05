Return-Path: <Samuli.Piippo@digia.com>
Received: from smtp1.digia.com (smtp1.digia.com [82.118.214.156])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 84CBDE00973
	for <meta-ti@yoctoproject.org>; Wed,  5 Mar 2014 05:00:35 -0800 (PST)
Received: from smtp1.digia.com (unknown [127.0.0.1])
	by IMSVA80 (Postfix) with ESMTP id 34C28370057
	for <meta-ti@yoctoproject.org>; Wed,  5 Mar 2014 15:00:33 +0200 (EET)
Received: from IT-EXCAS01-HKI.it.local (unknown [10.9.52.70])
	(using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	by smtp1.digia.com (Postfix) with ESMTP id 26AF5370056
	for <meta-ti@yoctoproject.org>; Wed,  5 Mar 2014 15:00:33 +0200 (EET)
Received: from piippo.it.local (10.9.5.71) by IT-EXCAS01-HKI.it.local
	(10.9.52.75) with Microsoft SMTP Server (TLS) id 14.2.283.3;
	Wed, 5 Mar 2014 15:00:32 +0200
From: Samuli Piippo <samuli.piippo@digia.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 5 Mar 2014 15:00:24 +0200
Message-ID: <1394024424-23691-1-git-send-email-samuli.piippo@digia.com>
X-Mailer: git-send-email 1.8.3.2
MIME-Version: 1.0
X-Originating-IP: [10.9.5.71]
Subject: [PATCH] libgles-omap3: create ESx.0 folders only if they exist
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
X-List-Received-Date: Wed, 05 Mar 2014 13:00:36 -0000
Content-Type: text/plain

Instead of creating all folders, only create those that exist
in the Graphics SDK. This fixes QA issue with unshipped ES9.0
folder which does not exists in 4.09.00.01.

Signed-off-by: Samuli Piippo <samuli.piippo@digia.com>
---
 recipes-graphics/libgles/libgles-omap3-no-x.inc | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/recipes-graphics/libgles/libgles-omap3-no-x.inc b/recipes-graphics/libgles/libgles-omap3-no-x.inc
index 60bcad5..7bb6cfb 100644
--- a/recipes-graphics/libgles/libgles-omap3-no-x.inc
+++ b/recipes-graphics/libgles/libgles-omap3-no-x.inc
@@ -158,24 +158,14 @@ do_install () {
 
 	#Create different folders for ease of installing into different platforms with different display drivers/ SGX core
 
-	install -d ${D}${libdir}/ES9.0
-	install -d ${D}${libdir}/ES8.0
-	install -d ${D}${libdir}/ES6.0
-	install -d ${D}${libdir}/ES5.0
-	install -d ${D}${libdir}/ES3.0
-
-	install -d ${D}${bindir}/ES9.0
-	install -d ${D}${bindir}/ES8.0
-	install -d ${D}${bindir}/ES6.0
-	install -d ${D}${bindir}/ES5.0
-	install -d ${D}${bindir}/ES3.0
-
 	shared_prog="eglinfo pvr2d_test ${PVR_INIT} services_test sgx_blit_test sgx_clipblit_test sgx_flip_test sgx_init_test sgx_render_flip_test"
 	raw_prog="gles1test1 gles2test1"
 
 	for esrev in 3 5 6 8 9 ; do
 		ESLOCATION=$(eval echo $(echo \$\{ES${esrev}LOCATION\}))
 		if [ -e ${ESLOCATION} ] ; then
+			install -d ${D}${libdir}/ES${esrev}.0
+			install -d ${D}${bindir}/ES${esrev}.0
 			cp -pPR ${ESLOCATION}/lib*${IMGPV} ${ESLOCATION}/pvr_drv.so ${ESLOCATION}/*.a ${D}${libdir}/ES${esrev}.0/
 			for esprog in $shared_prog $raw_prog ; do
 				install -m 0755 ${ESLOCATION}/$esprog ${D}${bindir}/ES${esrev}.0/ 2>/dev/null || true
-- 
1.8.3.2


