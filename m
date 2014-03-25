Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 75390E00939
	for <meta-ti@yoctoproject.org>; Tue, 25 Mar 2014 14:13:05 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 86A8B52A32; Tue, 25 Mar 2014 21:13:04 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20140325211304.86A8B52A32@arago-project.org>
Date: Tue, 25 Mar 2014 21:13:04 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Samuli Piippo : libgles-omap3: create ESx.0 folders only if they exist
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
X-List-Received-Date: Tue, 25 Mar 2014 21:13:06 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: b7d07640adff0f4dd472fa139292a5fd7d58dca4
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=b7d07640adff0f4dd472fa139292a5fd7d58dca4

Author: Samuli Piippo <samuli.piippo@digia.com>
Date:   Wed Mar  5 19:00:24 2014 +0000

libgles-omap3: create ESx.0 folders only if they exist

Instead of creating all folders, only create those that exist
in the Graphics SDK. This fixes QA issue with unshipped ES9.0
folder which does not exists in 4.09.00.01.

Signed-off-by: Samuli Piippo <samuli.piippo@digia.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-graphics/libgles/libgles-omap3-no-x.inc |   14 ++------------
 1 files changed, 2 insertions(+), 12 deletions(-)

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


