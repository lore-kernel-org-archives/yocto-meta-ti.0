Return-Path: <prabu@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 37AEFE015E1
	for <meta-ti@yoctoproject.org>; Wed, 12 Jun 2013 10:23:19 -0700 (PDT)
Received: from dbdlxv05.itg.ti.com ([172.24.171.60])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r5CHNITm018989
	for <meta-ti@yoctoproject.org>; Wed, 12 Jun 2013 12:23:19 -0500
Received: from DBDE73.ent.ti.com (dbde73.ent.ti.com [172.24.171.98])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id r5CHNGBq005000
	for <meta-ti@yoctoproject.org>; Wed, 12 Jun 2013 12:23:17 -0500
Received: from dbdp32.itg.ti.com (172.24.170.251) by DBDE73.ent.ti.com
	(172.24.171.98) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 13 Jun 2013 01:23:15 +0800
Received: from bangubntigfx.india.ti.com (smtpvbd.itg.ti.com [172.24.170.250])
	by dbdp32.itg.ti.com (8.13.8/8.13.8) with ESMTP id r5CHMsO7027868;
	Wed, 12 Jun 2013 22:53:16 +0530
From: Prabindh Sundareson <prabu@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 12 Jun 2013 22:52:39 +0530
Message-ID: <1371057762-17055-7-git-send-email-prabu@ti.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <Prabindh Sundareson <prabu@ti.com>
References: <Prabindh Sundareson <prabu@ti.com>
MIME-Version: 1.0
Subject: [PATCH 6/9] libgles-omap3: Add missing RPROVIDES
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
X-List-Received-Date: Wed, 12 Jun 2013 17:23:22 -0000
Content-Type: text/plain

RPROVIDES specifies the libraries that are dynamically loaded
at runtime. This patch fixes "no package provides libGLESv2.so" and
similar errors that occur when including packages like qtbase.

Signed-off-by: Prabindh Sundareson <prabu at ti.com>
---
 recipes-graphics/libgles/libgles-omap3-no-x.inc |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/recipes-graphics/libgles/libgles-omap3-no-x.inc b/recipes-graphics/libgles/libgles-omap3-no-x.inc
index 1704e1a..8e5dad6 100644
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
-- 
1.7.1


