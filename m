Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C363AE00B94; Tue, 10 Nov 2015 07:45:41 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,RDNS_DYNAMIC
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  1.0 RDNS_DYNAMIC Delivered to internal network by host with
	*      dynamic-looking rDNS
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EA2FCE00ADB
	for <meta-ti@yoctoproject.org>; Tue, 10 Nov 2015 07:45:38 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 0223252A42; Tue, 10 Nov 2015 15:45:37 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20151110154538.0223252A42@arago-project.org>
Date: Tue, 10 Nov 2015 15:45:37 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Gou, Hongmei : omap5-sgx-ddk-um-linux: bump SRCREV and update powervr. ini and .so inclusion for AM3
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
X-List-Received-Date: Tue, 10 Nov 2015 15:45:41 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: cd3fcb02fc02897e3c771e274f6af2ddfb44014b
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=cd3fcb02fc02897e3c771e274f6af2ddfb44014b

Author: Gou, Hongmei <h-gou@ti.com>
Date:   Tue Nov 10 04:49:25 2015 +0000

omap5-sgx-ddk-um-linux: bump SRCREV and update powervr.ini and .so inclusion for AM3

* Bump SRCREV for DRM FLIP mode support, and update powervr.ini correspondingly
* Add plugins package to include the necessary .so files

Signed-off-by: Hongmei Gou <h-gou@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../omap5-sgx-ddk-um-linux/ti33x/powervr.ini       |    3 ++-
 .../libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb     |    7 ++++---
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
index 9918128..a3a4e6d 100644
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
 
 ALLOW_EMPTY_${PN}-plugins = "1"


