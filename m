Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DBA2EE00F73; Fri,  9 Oct 2015 06:22:57 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.41 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A3FCEE0086D
	for <meta-ti@yoctoproject.org>; Fri,  9 Oct 2015 06:22:52 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t99DMpGg029430
	for <meta-ti@yoctoproject.org>; Fri, 9 Oct 2015 08:22:51 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t99DMoeG009751
	for <meta-ti@yoctoproject.org>; Fri, 9 Oct 2015 08:22:51 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 9 Oct 2015 08:22:51 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t99DMow3028348;	Fri, 9 Oct 2015 08:22:50 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 9 Oct 2015 09:22:48 -0400
Message-ID: <1444396968-19536-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] omap5-sgx-ddk-um-linux: Bump SRCREV and update powervr.ini
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
X-List-Received-Date: Fri, 09 Oct 2015 13:22:57 -0000
Content-Type: text/plain

* Latest commit indroduces the following:
  - Use updated libUMGegl library with end of call protection
  - Add Null-Window DRM FLIP mode support
  - Replace null_libdrm.so with libpvrDRMWSEGL.so and
    libpvrDRMWSEGL_FRONT.so
  - Add EGL API call clear protections at function_table.c
  - Supress the OpenDC warning since DC is no longer used.
  - Enhance drmModeSetCrtc to take the current configuration if set.

* Package *.so libraries in main package since it is the DDK
  convention to not create the version suffixed libraries with
  symlinks

* Update powervr.ini as null_libdrm.so is replaced with
  libpvrDRMWSEGL.so and libpvrDRMWSEGL_FRONT.so

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-graphics/libgles/omap5-sgx-ddk-um-linux/ti33x/powervr.ini | 3 ++-
 recipes-graphics/libgles/omap5-sgx-ddk-um-linux/ti43x/powervr.ini | 3 ++-
 recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb       | 8 +++++---
 3 files changed, 9 insertions(+), 5 deletions(-)

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
diff --git a/recipes-graphics/libgles/omap5-sgx-ddk-um-linux/ti43x/powervr.ini b/recipes-graphics/libgles/omap5-sgx-ddk-um-linux/ti43x/powervr.ini
index 0657ab8..5b5608e 100644
--- a/recipes-graphics/libgles/omap5-sgx-ddk-um-linux/ti43x/powervr.ini
+++ b/recipes-graphics/libgles/omap5-sgx-ddk-um-linux/ti43x/powervr.ini
@@ -1,3 +1,4 @@
 [default]
-WindowSystem=null_libdrm.so
+WindowSystem=libpvrDRMWSEGL_FRONT.so
+#WindowSystem=libpvrDRMWSEGL.so
 DisableHWTQTextureUpload=1
diff --git a/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb b/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb
index cd01d6f..ed24ada 100644
--- a/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb
+++ b/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb
@@ -11,15 +11,15 @@ BRANCH_ti43x = "am4/k4.1"
 
 SRC_URI = "git://git.ti.com/graphics/omap5-sgx-ddk-um-linux.git;protocol=git;branch=${BRANCH}"
 SRCREV_omap-a15 = "d63cd6469fff610317a8e1c986f227bb3e7922f6"
-SRCREV_ti33x    = "188575c7ba16c00a15499ed88a126af2506fdba5"
-SRCREV_ti43x    = "188575c7ba16c00a15499ed88a126af2506fdba5"
+SRCREV_ti33x    = "e15f1543bab4de9e8927a2c4934addf3fd16ffcb"
+SRCREV_ti43x    = "e15f1543bab4de9e8927a2c4934addf3fd16ffcb"
 
 INITSCRIPT_NAME = "pvr-init"
 INITSCRIPT_PARAMS = "defaults 8"
 
 inherit update-rc.d
 
-PR = "r11"
+PR = "r12"
 PROVIDES += "virtual/egl virtual/libgles1 virtual/libgles2"
 
 RDEPENDS_${PN} += "libdrm"
@@ -52,6 +52,8 @@ FILES_${PN} += "${sysconfdir}/powervr.ini"
 
 INHIBIT_PACKAGE_STRIP = "1"
 
+FILES_SOLIBSDEV = ""
+
 INSANE_SKIP_${PN} += "dev-so ldflags useless-rpaths"
 
 CLEANBROKEN = "1"
-- 
1.9.1


