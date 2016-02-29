Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C0BD9E008EE; Mon, 29 Feb 2016 13:16:27 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 183D5E008EE
	for <meta-ti@yoctoproject.org>; Mon, 29 Feb 2016 13:16:25 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 72C0B52AC2; Mon, 29 Feb 2016 21:16:22 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160229211622.72C0B52AC2@arago-project.org>
Date: Mon, 29 Feb 2016 21:16:22 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Anand Balagopalakrishnan : omap5-sgx-ddk-um-linux: remove version 1.9.0. 12 as replaced by 1.14.3699939
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
X-List-Received-Date: Mon, 29 Feb 2016 21:16:27 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: a64524579aed9a7954e0366f810e6a9e2c7efd56
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=a64524579aed9a7954e0366f810e6a9e2c7efd56

Author: Anand Balagopalakrishnan <anandb@ti.com>
Date:   Mon Feb 29 12:42:37 2016 +0000

omap5-sgx-ddk-um-linux: remove version 1.9.0.12 as replaced by 1.14.3699939

Signed-off-by: Anand Balagopalakrishnan <anandb@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../libgles/omap5-sgx-ddk-um-linux/rc.pvr          |   17 -----
 .../omap5-sgx-ddk-um-linux/ti33x/powervr.ini       |    4 -
 .../libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb     |   67 --------------------
 3 files changed, 0 insertions(+), 88 deletions(-)

diff --git a/recipes-graphics/libgles/omap5-sgx-ddk-um-linux/powervr.ini b/recipes-graphics/libgles/omap5-sgx-ddk-um-linux/powervr.ini
deleted file mode 100644
index e69de29..0000000
diff --git a/recipes-graphics/libgles/omap5-sgx-ddk-um-linux/rc.pvr b/recipes-graphics/libgles/omap5-sgx-ddk-um-linux/rc.pvr
deleted file mode 100644
index 2711d6b..0000000
--- a/recipes-graphics/libgles/omap5-sgx-ddk-um-linux/rc.pvr
+++ /dev/null
@@ -1,17 +0,0 @@
-#!/bin/bash
-
-case "$1" in
-  start)
-
-  echo "Initializing the graphics driver ..."
-  pvrsrvinit
-
-  ;;
-  stop)
-    # Nothing to be done.
-  ;;
-  *)
-    echo "Usage: $0 {start|stop}"
-    exit 1
-  ;;
-esac
diff --git a/recipes-graphics/libgles/omap5-sgx-ddk-um-linux/ti33x/powervr.ini b/recipes-graphics/libgles/omap5-sgx-ddk-um-linux/ti33x/powervr.ini
deleted file mode 100644
index 5b5608e..0000000
--- a/recipes-graphics/libgles/omap5-sgx-ddk-um-linux/ti33x/powervr.ini
+++ /dev/null
@@ -1,4 +0,0 @@
-[default]
-WindowSystem=libpvrDRMWSEGL_FRONT.so
-#WindowSystem=libpvrDRMWSEGL.so
-DisableHWTQTextureUpload=1
diff --git a/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb b/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb
deleted file mode 100644
index 0cdab96..0000000
--- a/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb
+++ /dev/null
@@ -1,67 +0,0 @@
-DESCRIPTION = "Userspace libraries for SGX"
-HOMEPAGE = "http://downloads.ti.com/dsps/dsps_public_sw/gfxsdk"
-LICENSE = "TI-TSPA"
-LIC_FILES_CHKSUM = "file://OMAP5-Linux-Graphics-DDK-UM-Manifest.doc;md5=360d293df455e4f2d363bb4014a49603"
-
-COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15"
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-BRANCH_omap-a15 = "master"
-BRANCH_ti33x = "am3/k4.1"
-BRANCH_ti43x = "am4/k4.1"
-
-SRC_URI = "git://git.ti.com/graphics/omap5-sgx-ddk-um-linux.git;protocol=git;branch=${BRANCH}"
-SRCREV_omap-a15 = "b6801bf89e00d69893c2957455bbeb3195c0ed52"
-SRCREV_ti33x    = "84ae5444c7cbc3f4c65a226b9fea62d4a513f3e0"
-SRCREV_ti43x    = "fdf4c0b594ca142a68aabb4c3f82b75be50b46cc"
-
-INITSCRIPT_NAME = "pvr-init"
-INITSCRIPT_PARAMS = "defaults 8"
-
-inherit update-rc.d
-
-PR = "r15"
-PROVIDES += "virtual/egl virtual/libgles1 virtual/libgles2"
-
-RDEPENDS_${PN} += "libdrm"
-
-RREPLACES_${PN} = "libegl libgles1 libgles2"
-RREPLACES_${PN}-dev = "libegl-dev libgles1-dev libgles2-dev"
-RREPLACES_${PN}-dbg = "libegl-dbg"
-
-S = "${WORKDIR}/git"
-
-SRC_URI_append = " \
-    file://rc.pvr \
-    file://powervr.ini \
-"
-
-do_install () {
-    oe_runmake install DESTDIR=${D}
-    install -d ${D}${sysconfdir}/init.d
-    install -m 0755 ${WORKDIR}/rc.pvr ${D}${sysconfdir}/init.d/pvr-init
-
-    install -d ${D}${sysconfdir}
-    install -m 0644 ${WORKDIR}/powervr.ini ${D}${sysconfdir}/
-}
-
-FILES_${PN} =  "${bindir}/*"
-FILES_${PN} += " ${libdir}/*"
-FILES_${PN} +=  "${includedir}/* /usr/share/sgx-lib/"
-FILES_${PN} += "${sysconfdir}/init.d/pvr-init"
-FILES_${PN} += "${sysconfdir}/powervr.ini"
-
-PACKAGES =+ "${PN}-plugins"
-FILES_${PN}-plugins = ""
-FILES_${PN}-plugins_ti43x = "${libdir}/libsrv_init.so ${libdir}/libsrv_um.so ${libdir}/libglslcompiler.so ${libdir}/libpvrws_WAYLAND.so ${libdir}/libpvrws_KMS.so "
-FILES_${PN}-plugins_ti33x = "${libdir}/libsrv_init.so ${libdir}/libsrv_um.so ${libdir}/libglslcompiler.so ${libdir}/libpvrDRMWSEGL.so ${libdir}/libpvrDRMWSEGL_FRONT.so "
-RDEPENDS_${PN} += "${PN}-plugins"
-
-ALLOW_EMPTY_${PN}-plugins = "1"
-
-INHIBIT_PACKAGE_STRIP = "1"
-
-INSANE_SKIP_${PN} += "dev-so ldflags useless-rpaths"
-INSANE_SKIP_${PN}-plugins = "dev-so"
-
-CLEANBROKEN = "1"


