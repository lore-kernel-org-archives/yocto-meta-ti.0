Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 47ED0E00B43; Fri,  1 Mar 2019 13:07:59 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=BAYES_00, URI_HEX autolearn=no
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  1.1 URI_HEX URI: URI hostname has long hexadecimal sequence
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2AE20E009A0
	for <meta-ti@yoctoproject.org>; Fri,  1 Mar 2019 13:07:56 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6032040ACD;
	Fri,  1 Mar 2019 21:07:56 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id ssG0_6upVzCK; Fri,  1 Mar 2019 21:07:56 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-91-218.washdc.fios.verizon.net
	[100.15.91.218])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 4885040A55;
	Fri,  1 Mar 2019 21:07:55 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 8142116BAA9;
	Fri,  1 Mar 2019 16:07:54 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-ti@yoctoproject.org
Date: Fri,  1 Mar 2019 16:07:54 -0500
Message-Id: <1551474474-26476-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [master][PATCH] ti-sgx-ddk: remove old 1.14 version of DDK KM and UM
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
X-List-Received-Date: Fri, 01 Mar 2019 21:07:59 -0000

DDK 1.17 is now supported for same platforms.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...-buildvars.mk-pass-Wno-cast-function-type.patch | 26 -------
 ...inux-osfunc.c-fix-gcc8-stringop-truncatio.patch | 34 ---------
 .../powervr-drivers/ti-sgx-ddk-km_1.14.3699939.bb  | 45 -----------
 .../libgles/ti-sgx-ddk-um_1.14.3699939.bb          | 87 ----------------------
 4 files changed, 192 deletions(-)
 delete mode 100644 recipes-bsp/powervr-drivers/ti-sgx-ddk-km/0001-buildvars.mk-pass-Wno-cast-function-type.patch
 delete mode 100644 recipes-bsp/powervr-drivers/ti-sgx-ddk-km/0001-srvkm-env-linux-osfunc.c-fix-gcc8-stringop-truncatio.patch
 delete mode 100644 recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.14.3699939.bb
 delete mode 100644 recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb

diff --git a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km/0001-buildvars.mk-pass-Wno-cast-function-type.patch b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km/0001-buildvars.mk-pass-Wno-cast-function-type.patch
deleted file mode 100644
index e1d2d10..0000000
--- a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km/0001-buildvars.mk-pass-Wno-cast-function-type.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 287ca27cdf9004b4ba9bb0ce30d6139f707246f9 Mon Sep 17 00:00:00 2001
-From: Denys Dmytriyenko <denys@ti.com>
-Date: Sun, 14 Oct 2018 19:53:14 -0400
-Subject: [PATCH] buildvars.mk: pass -Wno-cast-function-type
-
-Signed-off-by: Denys Dmytriyenko <denys@ti.com>
----
- eurasia_km/eurasiacon/build/linux2/buildvars.mk | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/eurasia_km/eurasiacon/build/linux2/buildvars.mk b/eurasia_km/eurasiacon/build/linux2/buildvars.mk
-index f30e467..f00f852 100644
---- a/eurasia_km/eurasiacon/build/linux2/buildvars.mk
-+++ b/eurasia_km/eurasiacon/build/linux2/buildvars.mk
-@@ -48,7 +48,7 @@
- 
- # These flags are used for kernel, User C and User C++
- #
--COMMON_FLAGS := -W -Wall
-+COMMON_FLAGS := -W -Wall -Wno-cast-function-type
- 
- # Some GCC warnings are C only, so we must mask them from C++
- #
--- 
-2.7.4
-
diff --git a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km/0001-srvkm-env-linux-osfunc.c-fix-gcc8-stringop-truncatio.patch b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km/0001-srvkm-env-linux-osfunc.c-fix-gcc8-stringop-truncatio.patch
deleted file mode 100644
index 96e657d..0000000
--- a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km/0001-srvkm-env-linux-osfunc.c-fix-gcc8-stringop-truncatio.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 353d8b9313abc492e5938171cea4ac697fd991f0 Mon Sep 17 00:00:00 2001
-From: Denys Dmytriyenko <denys@ti.com>
-Date: Sun, 14 Oct 2018 19:41:49 -0400
-Subject: [PATCH] srvkm/env/linux/osfunc.c: fix gcc8 stringop-truncation error
-
-gcc8 now checks for strncpy function that potentially truncate the terminating
-NUL charcter from the source string. Fails like this:
-
-.../services4/srvkm/env/linux/osfunc.c:3051:13: error: 'strncpy' specified bound 50 equals destination size [-Werror=stringop-truncation]
-|              strncpy(psEventObject->szName, pszName, EVENTOBJNAME_MAXLENGTH);
-|              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-| cc1: all warnings being treated as errors
-
-Signed-off-by: Denys Dmytriyenko <denys@ti.com>
----
- eurasia_km/services4/srvkm/env/linux/osfunc.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/eurasia_km/services4/srvkm/env/linux/osfunc.c b/eurasia_km/services4/srvkm/env/linux/osfunc.c
-index 02dfe9b..02c8e3b 100644
---- a/eurasia_km/services4/srvkm/env/linux/osfunc.c
-+++ b/eurasia_km/services4/srvkm/env/linux/osfunc.c
-@@ -3048,7 +3048,7 @@ PVRSRV_ERROR OSEventObjectCreateKM(const IMG_CHAR *pszName, PVRSRV_EVENTOBJECT *
-         if(pszName)
-         {
-             /* copy over the event object name */
--            strncpy(psEventObject->szName, pszName, EVENTOBJNAME_MAXLENGTH);
-+            strncpy(psEventObject->szName, pszName, EVENTOBJNAME_MAXLENGTH-1);
-         }
-         else
-         {
--- 
-2.7.4
-
diff --git a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.14.3699939.bb b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.14.3699939.bb
deleted file mode 100644
index 4283587..0000000
--- a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.14.3699939.bb
+++ /dev/null
@@ -1,45 +0,0 @@
-DESCRIPTION =  "Kernel drivers for the PowerVR SGX chipset found in the TI SoCs"
-HOMEPAGE = "https://git.ti.com/graphics/omap5-sgx-ddk-linux"
-LICENSE = "MIT | GPLv2"
-LIC_FILES_CHKSUM = "file://eurasia_km/README;beginline=13;endline=22;md5=74506d9b8e5edbce66c2747c50fcef12"
-
-inherit module
-
-COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15"
-
-MACHINE_KERNEL_PR_append = "p"
-PR = "${MACHINE_KERNEL_PR}"
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-DEPENDS = "virtual/kernel"
-
-PROVIDES = "omapdrm-pvr"
-
-RPROVIDES_${PN} = "omapdrm-pvr"
-RREPLACES_${PN} = "omapdrm-pvr"
-RCONFLICTS_${PN} = "omapdrm-pvr"
-
-BRANCH = "ti-img-sgx/${PV}/k4.14"
-
-SRC_URI = "git://git.ti.com/graphics/omap5-sgx-ddk-linux.git;protocol=git;branch=${BRANCH} \
-	file://0001-srvkm-env-linux-osfunc.c-fix-gcc8-stringop-truncatio.patch \
-	file://0001-buildvars.mk-pass-Wno-cast-function-type.patch"
-
-S = "${WORKDIR}/git"
-
-SRCREV = "76da7d73976f0a5dc04fdc84a3af899d6c2b1fe2"
-
-TARGET_PRODUCT_omap-a15 = "jacinto6evm"
-TARGET_PRODUCT_ti33x = "ti335x"
-TARGET_PRODUCT_ti43x = "ti437x"
-
-EXTRA_OEMAKE += 'KERNELDIR="${STAGING_KERNEL_DIR}" TARGET_PRODUCT=${TARGET_PRODUCT}'
-
-do_compile_prepend() {
-    cd ${S}/eurasia_km/eurasiacon/build/linux2/omap_linux
-}
-
-do_install() {
-    make -C ${STAGING_KERNEL_DIR} SUBDIRS=${B}/eurasia_km/eurasiacon/binary2_omap_linux_release/target/kbuild INSTALL_MOD_PATH=${D} PREFIX=${STAGING_DIR_HOST} modules_install
-}
diff --git a/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb b/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb
deleted file mode 100644
index 1c9fad9..0000000
--- a/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb
+++ /dev/null
@@ -1,87 +0,0 @@
-DESCRIPTION = "Userspace libraries for PowerVR SGX chipset on TI SoCs"
-HOMEPAGE = "https://git.ti.com/graphics/omap5-sgx-ddk-um-linux"
-LICENSE = "TI-TSPA"
-LIC_FILES_CHKSUM = "file://TI-Linux-Graphics-DDK-UM-Manifest.doc;md5=550702a031857e0426ef7d6f6cf2d9f4"
-
-COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15"
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-BRANCH = "ti-img-sgx/rocko/${PV}"
-
-SRC_URI = "git://git.ti.com/graphics/omap5-sgx-ddk-um-linux.git;protocol=git;branch=${BRANCH}"
-SRCREV = "bc62c9d0c590dfbc801bf6b10176c3a8b6a39d98"
-
-# There's only hardfp version available
-python __anonymous() {
-    tunes = d.getVar("TUNE_FEATURES")
-    if not tunes:
-        return
-    pkgn = d.getVar("PN")
-    pkgv = d.getVar("PV")
-    if "callconvention-hard" not in tunes:
-        bb.warn("%s-%s ONLY supports hardfp mode for now" % (pkgn, pkgv))
-        raise bb.parse.SkipPackage("%s-%s ONLY supports hardfp mode for now" % (pkgn, pkgv))
-}
-
-TARGET_PRODUCT_omap-a15 = "jacinto6evm"
-TARGET_PRODUCT_ti33x = "ti335x"
-TARGET_PRODUCT_ti43x = "ti437x"
-
-INITSCRIPT_NAME = "rc.pvr"
-INITSCRIPT_PARAMS = "defaults 8"
-
-inherit update-rc.d
-
-PR = "r32"
-PROVIDES += "virtual/egl virtual/libgles1 virtual/libgles2 omap5-sgx-ddk-um-linux"
-
-DEPENDS += "libdrm udev libgbm wayland libffi"
-RDEPENDS_${PN} += "libdrm libudev libgbm wayland libffi libdrm-omap"
-
-RPROVIDES_${PN} = "libegl libgles1 libgles2 omap5-sgx-ddk-um-linux"
-RPROVIDES_${PN}-dev = "libegl-dev libgles1-dev libgles2-dev omap5-sgx-ddk-um-linux-dev"
-RPROVIDES_${PN}-dbg = "libegl-dbg libgles1-dbg libgles2-dbg omap5-sgx-ddk-um-linux-dbg"
-
-RREPLACES_${PN} = "libegl libgles1 libgles2 omap5-sgx-ddk-um-linux"
-RREPLACES_${PN}-dev = "libegl-dev libgles1-dev libgles2-dev omap5-sgx-ddk-um-linux-dev"
-RREPLACES_${PN}-dbg = "libegl-dbg libgles1-dbg libgles2-dbg omap5-sgx-ddk-um-linux-dbg"
-
-RCONFLICTS_${PN} = "libegl libgles1 libgles2 omap5-sgx-ddk-um-linux"
-RCONFLICTS_${PN}-dev = "libegl-dev libgles1-dev libgles2-dev omap5-sgx-ddk-um-linux-dev"
-RCONFLICTS_${PN}-dbg = "libegl-dbg libgles1-dbg libgles2-dbg omap5-sgx-ddk-um-linux-dbg"
-
-# The actual SONAME is libGLESv2.so.2, so need to explicitly specify RPROVIDES for .so.1 here
-RPROVIDES_${PN} += "libGLESv2.so.1"
-
-S = "${WORKDIR}/git"
-
-do_install () {
-    oe_runmake install DESTDIR=${D} TARGET_PRODUCT=${TARGET_PRODUCT}
-    mkdir -p ${D}${libdir}/gbm
-    ln -sf ../libpvrGBMWSEGL.so.${PV} ${D}${libdir}/gbm/gbm_pvr.so
-    ln -sf libGLESv2.so.${PV} ${D}${libdir}/libGLESv2.so.1
-
-    rm -f ${D}${libdir}/pkgconfig/wayland-egl.pc
-
-    chown -R root:root ${D}
-}
-
-FILES_${PN} =  "${bindir}/*"
-FILES_${PN} += " ${libdir}/*"
-FILES_${PN} +=  "${includedir}/*"
-FILES_${PN} +=  "${sysconfdir}/*"
-
-PACKAGES =+ "${PN}-plugins"
-FILES_${PN}-plugins = "${libdir}/libsrv_init.so ${libdir}/libsrv_um.so ${libdir}/libglslcompiler.so ${libdir}/libPVRScopeServices.so ${libdir}/libGLESv2.so ${libdir}/libGLES_CM.so ${libdir}/libpvrDRMWSEGL.so  ${libdir}/libpvrGBMWSEGL.so  ${libdir}/libpvrws_WAYLAND.so"
-RDEPENDS_${PN} += "${PN}-plugins"
-
-ALLOW_EMPTY_${PN}-plugins = "1"
-
-INHIBIT_PACKAGE_STRIP = "1"
-INHIBIT_SYSROOT_STRIP = "1"
-
-INSANE_SKIP_${PN} += "dev-so ldflags useless-rpaths"
-INSANE_SKIP_${PN}-plugins = "dev-so"
-INSANE_SKIP_${PN} += "already-stripped"
-
-CLEANBROKEN = "1"
-- 
2.7.4


