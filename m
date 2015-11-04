Return-Path: <h-gou@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id AAC12E00AAA; Wed,  4 Nov 2015 15:49:56 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.152 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0B546E00A9C
	for <meta-ti@yoctoproject.org>; Wed,  4 Nov 2015 15:49:54 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id tA4NnrRd021148
	for <meta-ti@yoctoproject.org>; Wed, 4 Nov 2015 17:49:53 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id tA4NnrQ7015014
	for <meta-ti@yoctoproject.org>; Wed, 4 Nov 2015 17:49:53 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 4 Nov 2015 17:49:53 -0600
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	tA4NnlUV017545;	Wed, 4 Nov 2015 17:49:50 -0600
From: Hongmei Gou <h-gou@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 4 Nov 2015 18:49:44 -0500
Message-ID: <1446680984-26212-1-git-send-email-h-gou@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] omap5-sgx-ddk-um-linux: bump SRCREV and update powervr.ini and .so inclusion for AM3
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
X-List-Received-Date: Wed, 04 Nov 2015 23:49:56 -0000
Content-Type: text/plain

* Bump SRCREV for DRM FLIP mode support, and update powervr.ini correspondingly
* Add plugins package to include the necessary .so files

Signed-off-by: Hongmei Gou <h-gou@ti.com>
---
 recipes-graphics/libgles/omap5-sgx-ddk-um-linux/ti33x/powervr.ini | 3 ++-
 recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb       | 7 ++++---
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/recipes-graphics/libgles/omap5-sgx-ddk-um-linux/ti33x/powervr.ini b/recipes-graphics/libgles/omap5-sgx-ddk-um-linux/ti33x/powervr.ini
index 0657ab8..5b5608e 100644
--- a/recipes-graphics/libgles/omap5-sgx-ddk-um-linux/ti33x/powervr.ini
+++ b/recipes-graphics/libgles/omap5-sgx-ddk-um-linux/ti33x/powervr.ini
@@ -1,3 +1,4 @@
 [default]
-WindowSystem=null_libdrm.so
+WindowSystem=libpvrDRMWSEGL_FRONT.so
+#WindowSystem=libpvrDRMWSEGL.so
 DisableHWTQTextureUpload=1
diff --git a/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb b/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb
index 557c442..b8a0445 100644
--- a/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb
+++ b/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb
@@ -6,12 +6,12 @@ LIC_FILES_CHKSUM = "file://OMAP5-Linux-Graphics-DDK-UM-Manifest.doc;md5=360d293d
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 BRANCH_omap-a15 = "master"
-BRANCH_ti33x = "am4/k4.1"
+BRANCH_ti33x = "am3/k4.1"
 BRANCH_ti43x = "am4/k4.1"
 
 SRC_URI = "git://git.ti.com/graphics/omap5-sgx-ddk-um-linux.git;protocol=git;branch=${BRANCH}"
 SRCREV_omap-a15 = "d63cd6469fff610317a8e1c986f227bb3e7922f6"
-SRCREV_ti33x    = "188575c7ba16c00a15499ed88a126af2506fdba5"
+SRCREV_ti33x    = "b535b96043ae2206e0c3d24b66599ca0fbe706d3"
 SRCREV_ti43x    = "fdf4c0b594ca142a68aabb4c3f82b75be50b46cc"
 
 INITSCRIPT_NAME = "pvr-init"
@@ -19,7 +19,7 @@ INITSCRIPT_PARAMS = "defaults 8"
 
 inherit update-rc.d
 
-PR = "r12"
+PR = "r13"
 PROVIDES += "virtual/egl virtual/libgles1 virtual/libgles2"
 
 RDEPENDS_${PN} += "libdrm"
@@ -53,6 +53,7 @@ FILES_${PN} += "${sysconfdir}/powervr.ini"
 PACKAGES =+ "${PN}-plugins"
 FILES_${PN}-plugins = ""
 FILES_${PN}-plugins_ti43x = "${libdir}/libsrv_init.so ${libdir}/libsrv_um.so ${libdir}/libglslcompiler.so ${libdir}/libpvrws_WAYLAND.so ${libdir}/libpvrws_KMS.so "
+FILES_${PN}-plugins_ti33x = "${libdir}/libsrv_init.so ${libdir}/libsrv_um.so ${libdir}/libglslcompiler.so ${libdir}/libpvrDRMWSEGL.so ${libdir}/libpvrDRMWSEGL_FRONT.so "
 RDEPENDS_${PN} += "${PN}-plugins"
 
 INHIBIT_PACKAGE_STRIP = "1"
-- 
1.9.1


