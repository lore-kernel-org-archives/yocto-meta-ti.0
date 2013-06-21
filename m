Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E7348E014C3
	for <meta-ti@yoctoproject.org>; Fri, 21 Jun 2013 11:54:29 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id A3A4452A97; Fri, 21 Jun 2013 18:54:28 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130621185428.A3A4452A97@arago-project.org>
Date: Fri, 21 Jun 2013 18:54:28 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Prabindh Sundareson : libgles-omap3: Add missing RPROVIDES
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
X-List-Received-Date: Fri, 21 Jun 2013 18:54:30 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 0783a113fa6726f184a826f7d94214ad60b0670b
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=0783a113fa6726f184a826f7d94214ad60b0670b

Author: Prabindh Sundareson <prabu@ti.com>
Date:   Wed Jun 12 23:10:39 2013 +0530

libgles-omap3: Add missing RPROVIDES

RPROVIDES specifies the libraries that are dynamically loaded
at runtime. This patch fixes "no package provides libGLESv2.so" and
similar errors that occur when including packages like qtbase.

Signed-off-by: Prabindh Sundareson <prabu at ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-graphics/libgles/libgles-omap3-no-x.inc |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/recipes-graphics/libgles/libgles-omap3-no-x.inc b/recipes-graphics/libgles/libgles-omap3-no-x.inc
index 094ad81..9569350 100644
--- a/recipes-graphics/libgles/libgles-omap3-no-x.inc
+++ b/recipes-graphics/libgles/libgles-omap3-no-x.inc
@@ -201,6 +201,8 @@ PRIVATE_LIBS_${PN}-es5 = "libGLESv2.so libIMGegl.so libsrv_um.so libpvr2d.so lib
 PRIVATE_LIBS_${PN}-es6 = "libGLESv2.so libIMGegl.so libsrv_um.so libpvr2d.so libsrv_init.so libEGL.so libsrv_um_dri.so libglslcompiler.so libGLES_CM.so"
 PRIVATE_LIBS_${PN}-es8 = "libGLESv2.so libIMGegl.so libsrv_um.so libpvr2d.so libsrv_init.so libEGL.so libsrv_um_dri.so libglslcompiler.so libGLES_CM.so"
 
+RPROVIDES_${PN} += "libGLESv2.so libEGL.so libGLES_CM.so libpvr2d.so libIMGegl.so libsrv_init.so libsrv_um.so libsrv_um_dri.so libglslcompiler.so"
+
 PACKAGES =+ "${PN}-blitwsegl ${PN}-flipwsegl ${PN}-frontwsegl ${PN}-linuxfbwsegl"
 FILES_${PN}-blitwsegl = "${libdir}/libpvrPVR2D_BLITWSEGL.so.*"
 FILES_${PN}-flipwsegl = "${libdir}/libpvrPVR2D_FLIPWSEGL.so.*"


