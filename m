Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A717CE008D2; Mon,  9 Nov 2015 11:34:11 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6F1E2E009D9
	for <meta-ti@yoctoproject.org>; Mon,  9 Nov 2015 11:34:09 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id EF3FA52A88; Mon,  9 Nov 2015 19:34:08 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20151109193408.EF3FA52A88@arago-project.org>
Date: Mon,  9 Nov 2015 19:34:08 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Gou, Hongmei : omap5-sgx-ddk-um-linux: bump SRCREV and other changes to support wayland/DRM on AM4
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
X-List-Received-Date: Mon, 09 Nov 2015 19:34:11 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: d5e19628cf33afdba7f154f5b346933ccaa80b28
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=d5e19628cf33afdba7f154f5b346933ccaa80b28

Author: Gou, Hongmei <h-gou@ti.com>
Date:   Sat Nov  7 03:54:23 2015 +0000

omap5-sgx-ddk-um-linux: bump SRCREV and other changes to support wayland/DRM on AM4

* Support wayland/DRM mode
* Remove powervr.ini which is no longer needed
* Add plugins package to include the necessary .so files

Signed-off-by: Hongmei Gou <h-gou@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../omap5-sgx-ddk-um-linux/ti43x/powervr.ini       |    3 ---
 .../libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb     |   12 ++++++++++--
 2 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/recipes-graphics/libgles/omap5-sgx-ddk-um-linux/ti43x/powervr.ini b/recipes-graphics/libgles/omap5-sgx-ddk-um-linux/ti43x/powervr.ini
deleted file mode 100644
index 0657ab8..0000000
--- a/recipes-graphics/libgles/omap5-sgx-ddk-um-linux/ti43x/powervr.ini
+++ /dev/null
@@ -1,3 +0,0 @@
-[default]
-WindowSystem=null_libdrm.so
-DisableHWTQTextureUpload=1
diff --git a/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb b/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb
index cd01d6f..9918128 100644
--- a/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb
+++ b/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb
@@ -12,14 +12,14 @@ BRANCH_ti43x = "am4/k4.1"
 SRC_URI = "git://git.ti.com/graphics/omap5-sgx-ddk-um-linux.git;protocol=git;branch=${BRANCH}"
 SRCREV_omap-a15 = "d63cd6469fff610317a8e1c986f227bb3e7922f6"
 SRCREV_ti33x    = "188575c7ba16c00a15499ed88a126af2506fdba5"
-SRCREV_ti43x    = "188575c7ba16c00a15499ed88a126af2506fdba5"
+SRCREV_ti43x    = "fdf4c0b594ca142a68aabb4c3f82b75be50b46cc"
 
 INITSCRIPT_NAME = "pvr-init"
 INITSCRIPT_PARAMS = "defaults 8"
 
 inherit update-rc.d
 
-PR = "r11"
+PR = "r12"
 PROVIDES += "virtual/egl virtual/libgles1 virtual/libgles2"
 
 RDEPENDS_${PN} += "libdrm"
@@ -50,8 +50,16 @@ FILES_${PN} +=  "${includedir}/* /usr/share/sgx-lib/"
 FILES_${PN} += "${sysconfdir}/init.d/pvr-init"
 FILES_${PN} += "${sysconfdir}/powervr.ini"
 
+PACKAGES =+ "${PN}-plugins"
+FILES_${PN}-plugins = ""
+FILES_${PN}-plugins_ti43x = "${libdir}/libsrv_init.so ${libdir}/libsrv_um.so ${libdir}/libglslcompiler.so ${libdir}/libpvrws_WAYLAND.so ${libdir}/libpvrws_KMS.so "
+RDEPENDS_${PN} += "${PN}-plugins"
+
+ALLOW_EMPTY_${PN}-plugins = "1"
+
 INHIBIT_PACKAGE_STRIP = "1"
 
 INSANE_SKIP_${PN} += "dev-so ldflags useless-rpaths"
+INSANE_SKIP_${PN}-plugins = "dev-so"
 
 CLEANBROKEN = "1"


