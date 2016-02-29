Return-Path: <anandb@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 842A5E00D47; Sun, 28 Feb 2016 22:40:59 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2EFB7E00C69
	for <meta-ti@yoctoproject.org>; Sun, 28 Feb 2016 22:40:55 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id u1T6esfG013025
	for <meta-ti@yoctoproject.org>; Mon, 29 Feb 2016 00:40:54 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u1T6esjr007675
	for <meta-ti@yoctoproject.org>; Mon, 29 Feb 2016 00:40:54 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 29 Feb 2016 00:40:54 -0600
Received: from uda0876520.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u1T6erBT015838;	Mon, 29 Feb 2016 00:40:54 -0600
From: Anand Balagopalakrishnan <anandb@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 29 Feb 2016 12:12:37 +0530
Message-ID: <1456728158-25636-1-git-send-email-anandb@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 1/2] omap5-sgx-ddk-um-linux: remove version 1.9.0.12 as replaced by 1.14.3699939
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
X-List-Received-Date: Mon, 29 Feb 2016 06:40:59 -0000
Content-Type: text/plain

Signed-off-by: Anand Balagopalakrishnan <anandb@ti.com>
---
 .../libgles/omap5-sgx-ddk-um-linux/powervr.ini     |  0
 .../libgles/omap5-sgx-ddk-um-linux/rc.pvr          | 17 ------
 .../omap5-sgx-ddk-um-linux/ti33x/powervr.ini       |  4 --
 .../libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb     | 67 ----------------------
 4 files changed, 88 deletions(-)
 delete mode 100644 recipes-graphics/libgles/omap5-sgx-ddk-um-linux/powervr.ini
 delete mode 100644 recipes-graphics/libgles/omap5-sgx-ddk-um-linux/rc.pvr
 delete mode 100644 recipes-graphics/libgles/omap5-sgx-ddk-um-linux/ti33x/powervr.ini
 delete mode 100644 recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb

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
-- 
1.9.1


