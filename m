Return-Path: <h-gou@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 86D51E0088C; Mon,  9 Nov 2015 14:49:33 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1B388E007C9
	for <meta-ti@yoctoproject.org>; Mon,  9 Nov 2015 14:49:31 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id tA9MnUEs010557
	for <meta-ti@yoctoproject.org>; Mon, 9 Nov 2015 16:49:30 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id tA9MnUEF016721
	for <meta-ti@yoctoproject.org>; Mon, 9 Nov 2015 16:49:30 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 9 Nov 2015 16:49:30 -0600
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	tA9MnS6w023959;	Mon, 9 Nov 2015 16:49:29 -0600
From: Hongmei Gou <h-gou@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 9 Nov 2015 17:49:25 -0500
Message-ID: <1447109365-11785-1-git-send-email-h-gou@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH v2] omap5-sgx-ddk-um-linux: bump SRCREV and update powervr.ini and .so inclusion for AM3
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
X-List-Received-Date: Mon, 09 Nov 2015 22:49:33 -0000
Content-Type: text/plain

* Bump SRCREV for DRM FLIP mode support, and update powervr.ini correspondingly
* Add plugins package to include the necessary .so files

Signed-off-by: Hongmei Gou <h-gou@ti.com>
---
v2 changes: rebase the patch due to the previous v2 patch for ti43x

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
-- 
1.9.1


