Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EB409E00D2A; Tue, 26 Apr 2016 11:55:22 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=BAYES_00, RDNS_DYNAMIC, URI_HEX
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * 1.1 URI_HEX URI: URI hostname has long hexadecimal
	sequence
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  1.0 RDNS_DYNAMIC Delivered to internal network by host with
	*      dynamic-looking rDNS
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id ACF48E00D29
	for <meta-ti@yoctoproject.org>; Tue, 26 Apr 2016 11:55:17 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 2A11B529E7; Tue, 26 Apr 2016 18:55:16 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160426185516.2A11B529E7@arago-project.org>
Date: Tue, 26 Apr 2016 18:55:16 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : sgx: rename and clean up kernel and user space components
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
X-List-Received-Date: Tue, 26 Apr 2016 18:55:23 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: c70102c671f120822edc7743401e821ea4f40e4f
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=c70102c671f120822edc7743401e821ea4f40e4f

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Mon Apr 25 23:56:26 2016 +0000

sgx: rename and clean up kernel and user space components

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/layer.conf                                    |    4 +-
 ...14.3699939.bb => ti-sgx-ddk-km_1.14.3699939.bb} |    8 ++
 .../libgles/omap5-sgx-ddk-um-linux_1.14.3699939.bb |   55 --------------
 .../libgles/ti-sgx-ddk-um_1.14.3699939.bb          |   76 ++++++++++++++++++++
 4 files changed, 86 insertions(+), 57 deletions(-)

diff --git a/conf/layer.conf b/conf/layer.conf
index 95ffe8e..4ad5022 100644
--- a/conf/layer.conf
+++ b/conf/layer.conf
@@ -11,8 +11,8 @@ BBFILE_PRIORITY_meta-ti = "6"
 LICENSE_PATH += "${LAYERDIR}/licenses"
 
 SIGGEN_EXCLUDERECIPES_ABISAFE += " \
-    omapdrm-pvr \
-    omap5-sgx-ddk-um-linux \
+    ti-sgx-ddk-km \
+    ti-sgx-ddk-um \
     ti-ipc \
     ti-ipc-rtos \
     cmem-mod \
diff --git a/recipes-bsp/powervr-drivers/omapdrm-pvr_1.14.3699939.bb b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.14.3699939.bb
similarity index 87%
rename from recipes-bsp/powervr-drivers/omapdrm-pvr_1.14.3699939.bb
rename to recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.14.3699939.bb
index e6e4e5d..0e99791 100644
--- a/recipes-bsp/powervr-drivers/omapdrm-pvr_1.14.3699939.bb
+++ b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.14.3699939.bb
@@ -12,6 +12,14 @@ PR = "${MACHINE_KERNEL_PR}"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
+DEPENDS = "virtual/kernel"
+
+PROVIDES = "omapdrm-pvr"
+
+RPROVIDES_${PN} = "omapdrm-pvr"
+RREPLACES_${PN} = "omapdrm-pvr"
+RCONFLICTS_${PN} = "omapdrm-pvr"
+
 BRANCH = "ti-img-sgx/${PV}/k4.1"
 
 SRC_URI = "git://git.ti.com/graphics/omap5-sgx-ddk-linux.git;protocol=git;branch=${BRANCH}"
diff --git a/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.14.3699939.bb b/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.14.3699939.bb
deleted file mode 100644
index a79c61f..0000000
--- a/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.14.3699939.bb
+++ /dev/null
@@ -1,55 +0,0 @@
-DESCRIPTION = "Userspace libraries for PowerVR SGX chipset on TI SoCs"
-HOMEPAGE = "https://git.ti.com/graphics/omap5-sgx-ddk-um-linux"
-LICENSE = "TI-TSPA"
-LIC_FILES_CHKSUM = "file://TI-Linux-Graphics-DDK-UM-Manifest.doc;md5=550702a031857e0426ef7d6f6cf2d9f4"
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-BRANCH = "ti-img-sgx/${PV}"
-
-SRC_URI = "git://git.ti.com/graphics/omap5-sgx-ddk-um-linux.git;protocol=git;branch=${BRANCH}"
-SRCREV = "626c4f773b7c704f1d9a55ca80f60a79f809186d"
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
-PR = "r8"
-PROVIDES += "virtual/egl virtual/libgles1 virtual/libgles2"
-
-RDEPENDS_${PN} += "libdrm libudev libgbm wayland libffi libdrm-omap"
-
-RREPLACES_${PN} = "libegl libgles1 libgles2"
-RREPLACES_${PN}-dev = "libegl-dev libgles1-dev libgles2-dev"
-RREPLACES_${PN}-dbg = "libegl-dbg"
-
-S = "${WORKDIR}/git"
-
-do_install () {
-    oe_runmake install DESTDIR=${D} TARGET_PRODUCT=${TARGET_PRODUCT}
-    mkdir -p ${D}${libdir}/gbm
-    ln -sf ../libpvrGBMWSEGL.so.${PV} ${D}${libdir}/gbm/gbm_pvr.so
-}
-
-FILES_${PN} =  "${bindir}/*"
-FILES_${PN} += " ${libdir}/*"
-FILES_${PN} +=  "${includedir}/*"
-FILES_${PN} +=  "${sysconfdir}/*"
-
-PACKAGES =+ "${PN}-plugins"
-FILES_${PN}-plugins = "${libdir}/libsrv_init.so ${libdir}/libsrv_um.so ${libdir}/libglslcompiler.so ${libdir}/libGLESv2.so ${libdir}/libpvrDRMWSEGL.so  ${libdir}/libpvrGBMWSEGL.so  ${libdir}/libpvrws_WAYLAND.so"
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
diff --git a/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb b/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb
new file mode 100644
index 0000000..c29b9fe
--- /dev/null
+++ b/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb
@@ -0,0 +1,76 @@
+DESCRIPTION = "Userspace libraries for PowerVR SGX chipset on TI SoCs"
+HOMEPAGE = "https://git.ti.com/graphics/omap5-sgx-ddk-um-linux"
+LICENSE = "TI-TSPA"
+LIC_FILES_CHKSUM = "file://TI-Linux-Graphics-DDK-UM-Manifest.doc;md5=550702a031857e0426ef7d6f6cf2d9f4"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+BRANCH = "ti-img-sgx/${PV}"
+
+SRC_URI = "git://git.ti.com/graphics/omap5-sgx-ddk-um-linux.git;protocol=git;branch=${BRANCH}"
+SRCREV = "626c4f773b7c704f1d9a55ca80f60a79f809186d"
+
+# There's only hardfp version available
+python __anonymous() {
+    tunes = bb.data.getVar("TUNE_FEATURES", d, 1)
+    if not tunes:
+        return
+    pkgn = bb.data.getVar("PN", d, 1)
+    pkgv = bb.data.getVar("PV", d, 1)
+    if "callconvention-hard" not in tunes:
+        bb.warn("%s-%s ONLY supports hardfp mode for now" % (pkgn, pkgv))
+        raise bb.parse.SkipPackage("%s-%s ONLY supports hardfp mode for now" % (pkgn, pkgv))
+}
+
+TARGET_PRODUCT_omap-a15 = "jacinto6evm"
+TARGET_PRODUCT_ti33x = "ti335x"
+TARGET_PRODUCT_ti43x = "ti437x"
+
+INITSCRIPT_NAME = "rc.pvr"
+INITSCRIPT_PARAMS = "defaults 8"
+
+inherit update-rc.d
+
+PR = "r8"
+PROVIDES += "virtual/egl virtual/libgles1 virtual/libgles2 omap5-sgx-ddk-um-linux"
+
+RDEPENDS_${PN} += "libdrm libudev libgbm wayland libffi libdrm-omap"
+
+RPROVIDES_${PN} = "libegl libgles1 libgles2 omap5-sgx-ddk-um-linux"
+RPROVIDES_${PN}-dev = "libegl-dev libgles1-dev libgles2-dev omap5-sgx-ddk-um-linux-dev"
+RPROVIDES_${PN}-dbg = "libegl-dbg libgles1-dbg libgles2-dbg omap5-sgx-ddk-um-linux-dbg"
+
+RREPLACES_${PN} = "libegl libgles1 libgles2 omap5-sgx-ddk-um-linux"
+RREPLACES_${PN}-dev = "libegl-dev libgles1-dev libgles2-dev omap5-sgx-ddk-um-linux-dev"
+RREPLACES_${PN}-dbg = "libegl-dbg libgles1-dbg libgles2-dbg omap5-sgx-ddk-um-linux-dbg"
+
+RCONFLICTS_${PN} = "libegl libgles1 libgles2 omap5-sgx-ddk-um-linux"
+RCONFLICTS_${PN}-dev = "libegl-dev libgles1-dev libgles2-dev omap5-sgx-ddk-um-linux-dev"
+RCONFLICTS_${PN}-dbg = "libegl-dbg libgles1-dbg libgles2-dbg omap5-sgx-ddk-um-linux-dbg"
+
+S = "${WORKDIR}/git"
+
+do_install () {
+    oe_runmake install DESTDIR=${D} TARGET_PRODUCT=${TARGET_PRODUCT}
+    mkdir -p ${D}${libdir}/gbm
+    ln -sf ../libpvrGBMWSEGL.so.${PV} ${D}${libdir}/gbm/gbm_pvr.so
+}
+
+FILES_${PN} =  "${bindir}/*"
+FILES_${PN} += " ${libdir}/*"
+FILES_${PN} +=  "${includedir}/*"
+FILES_${PN} +=  "${sysconfdir}/*"
+
+PACKAGES =+ "${PN}-plugins"
+FILES_${PN}-plugins = "${libdir}/libsrv_init.so ${libdir}/libsrv_um.so ${libdir}/libglslcompiler.so ${libdir}/libGLESv2.so ${libdir}/libpvrDRMWSEGL.so  ${libdir}/libpvrGBMWSEGL.so  ${libdir}/libpvrws_WAYLAND.so"
+RDEPENDS_${PN} += "${PN}-plugins"
+
+ALLOW_EMPTY_${PN}-plugins = "1"
+
+INHIBIT_PACKAGE_STRIP = "1"
+INHIBIT_SYSROOT_STRIP = "1"
+
+INSANE_SKIP_${PN} += "dev-so ldflags useless-rpaths"
+INSANE_SKIP_${PN}-plugins = "dev-so"
+
+CLEANBROKEN = "1"


