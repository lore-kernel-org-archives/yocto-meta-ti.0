Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD75DC636D6
	for <webhook@archiver.kernel.org>; Mon, 30 Jan 2023 23:20:47 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.1338.1675120844577301854
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 30 Jan 2023 15:20:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=f93+lP9Q;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: rs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 30UNKiZw074480
	for <meta-ti@lists.yoctoproject.org>; Mon, 30 Jan 2023 17:20:44 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1675120844;
	bh=rsz4I+vgXvgKufahPNKCO04vP+b3hvrYD1SqPrKkDcw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=f93+lP9QLO9kBoG6r+USw27lfp+T89Xu3fN4VJaitSHtraOgBeXgsVTg1NyysY3W7
	 7VAetS4rKCXfBclyFwAg59/MxBasGC0GJc+44hUbu1sX3hufIQA9/DC32k5HgM/yKz
	 RQ/sPHWe925yxz9/kNa9OWPQtTZwRyyKhripFGmo=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 30UNKiku008920
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 30 Jan 2023 17:20:44 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Mon, 30
 Jan 2023 17:20:43 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Mon, 30 Jan 2023 17:20:43 -0600
Received: from res.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 30UNKdM4024673;
	Mon, 30 Jan 2023 17:20:43 -0600
From: Randolph Sapp <rs@ti.com>
To: <denys@ti.com>, <reatmon@ti.com>, <detheridge@ti.com>, <afd@ti.com>
CC: Randolph Sapp <rs@ti.com>, <meta-ti@lists.yoctoproject.org>,
        <k-bhargav@ti.com>
Subject: [kirkstone][PATCH v7 1/3] meta-ti-bsp: graphics: Resolve dependency chain
Date: Mon, 30 Jan 2023 17:20:05 -0600
Message-ID: <20230130232007.2393097-2-rs@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230130232007.2393097-1-rs@ti.com>
References: <20230130232007.2393097-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 30 Jan 2023 23:20:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15708

Patched mesa will now be configured based on what virtual/gpudriver
preferred provider is selected. The gpu drivers will now runtime
recommend the associated um components.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 ...-OpenEmbedded-nodistro-internal-aarc.patch | 29 --------
 ...bb => ti-img-rogue-driver_1.18.6276027.bb} | 20 +++---
 .../ti-sgx-ddk-km_1.17.4948957.bb             |  8 +--
 .../ti-img-rogue-umlibs_1.15.6133109.bb       | 71 -------------------
 .../ti-img-rogue-umlibs_1.18.6276027.bb       | 39 ++++++++++
 .../libgles/ti-sgx-ddk-um_1.17.4948957.bb     | 30 +-------
 .../mesa/mesa-gl_22.0.%.bbappend              |  1 +
 .../mesa/mesa_22.0.%.bbappend                 |  1 +
 .../recipes-graphics/mesa/pvr-mesa.inc        | 40 +++++++++++
 9 files changed, 97 insertions(+), 142 deletions(-)
 delete mode 100644 meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver/0001-compiler-support-OpenEmbedded-nodistro-internal-aarc.patch
 rename meta-ti-bsp/recipes-bsp/powervr-drivers/{ti-img-rogue-driver_1.15.6133109.bb => ti-img-rogue-driver_1.18.6276027.bb} (72%)
 delete mode 100644 meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_1.15.6133109.bb
 create mode 100644 meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_1.18.6276027.bb
 create mode 100644 meta-ti-bsp/recipes-graphics/mesa/mesa-gl_22.0.%.bbappend
 create mode 100644 meta-ti-bsp/recipes-graphics/mesa/mesa_22.0.%.bbappend
 create mode 100644 meta-ti-bsp/recipes-graphics/mesa/pvr-mesa.inc

diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver/0001-compiler-support-OpenEmbedded-nodistro-internal-aarc.patch b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver/0001-compiler-support-OpenEmbedded-nodistro-internal-aarc.patch
deleted file mode 100644
index f021cc39..00000000
--- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver/0001-compiler-support-OpenEmbedded-nodistro-internal-aarc.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 80d32fee3d768abbd77cce77ea9a7574651460a9 Mon Sep 17 00:00:00 2001
-From: Denys Dmytriyenko <denis@denix.org>
-Date: Wed, 7 Jul 2021 13:11:56 -0400
-Subject: [PATCH] compiler: support OpenEmbedded "nodistro" internal aarch64
- toolchain
-
-Upstream-Status: Pending
-
-Signed-off-by: Denys Dmytriyenko <denis@denix.org>
----
- build/linux/config/compiler.mk | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/build/linux/config/compiler.mk b/build/linux/config/compiler.mk
-index 53a0bef..d788579 100644
---- a/build/linux/config/compiler.mk
-+++ b/build/linux/config/compiler.mk
-@@ -65,7 +65,7 @@ define calculate-compiler-preferred-target
-    ifneq ($$(filter i386-% i486-% i586-% i686-%,$$($(1)_compiler_preferred_target)),)
-     $(1)_compiler_preferred_target := i386-linux-gnu
-    endif
--   ifneq ($$(filter aarch64-poky-linux,$$($(1)_compiler_preferred_target)),)
-+   ifneq ($$(filter aarch64-oe-linux aarch64-poky-linux,$$($(1)_compiler_preferred_target)),)
-     $(1)_compiler_preferred_target := aarch64-linux-gnu
-    endif
-    ifneq ($$(filter armv7a-cros-linux-gnueabi armv7l-tizen-linux-gnueabi,$$($(1)_compiler_preferred_target)),)
--- 
-2.7.4
-
diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.18.6276027.bb
similarity index 72%
rename from meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb
rename to meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.18.6276027.bb
index b4d19195..96fb7484 100644
--- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb
+++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.18.6276027.bb
@@ -3,40 +3,38 @@ HOMEPAGE = "http://git.ti.com/graphics/ti-img-rogue-driver"
 LICENSE = "MIT | GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://README;beginline=14;endline=19;md5=0403c7dea01a2b8232261e805325fac2"
 
-inherit module features_check
+inherit module
 
-REQUIRED_MACHINE_FEATURES = "gpu"
+PROVIDES = "virtual/gpudriver"
 
 MACHINE_KERNEL_PR:append = "b"
 PR = "${MACHINE_KERNEL_PR}"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
+
 COMPATIBLE_MACHINE = "j721e|j721s2|j784s4|am62xx"
 
 DEPENDS = "virtual/kernel"
 
-PROVIDES = "virtual/gpudriver"
+BRANCH = "linuxws/kirkstone/k5.10/${PV}"
 
-BRANCH = "linuxws/dunfell/k5.10/${PV}_unified_fw_pagesize"
-
-SRC_URI = " \
-    git://git.ti.com/git/graphics/ti-img-rogue-driver.git;protocol=https;branch=${BRANCH} \
-    file://0001-compiler-support-OpenEmbedded-nodistro-internal-aarc.patch \
-"
+SRC_URI = "git://git.ti.com/git/graphics/ti-img-rogue-driver.git;protocol=https;branch=${BRANCH}"
 
 S = "${WORKDIR}/git"
 
-SRCREV = "c901804e8221d477983a6f7224a9cdc6e832f050"
+SRCREV = "d575e4f64c95a3534e10e85da15bd303febf133f"
 
 TARGET_PRODUCT:j721e = "j721e_linux"
 TARGET_PRODUCT:j721s2 = "j721s2_linux"
 TARGET_PRODUCT:j784s4 = "j784s4_linux"
 TARGET_PRODUCT:am62xx = "am62_linux"
 PVR_BUILD = "release"
-PVR_WS = "wayland"
+PVR_WS = "lws-generic"
 
 EXTRA_OEMAKE += 'KERNELDIR="${STAGING_KERNEL_DIR}" BUILD=${PVR_BUILD} PVR_BUILD_DIR=${TARGET_PRODUCT} WINDOW_SYSTEM=${PVR_WS}'
 
 do_install() {
     make -C ${STAGING_KERNEL_DIR} M=${B}/binary_${TARGET_PRODUCT}_${PVR_WS}_${PVR_BUILD}/target_aarch64/kbuild INSTALL_MOD_PATH=${D}${root_prefix} PREFIX=${STAGING_DIR_HOST} modules_install
 }
+
+RRECOMMENDS:${PN} += "ti-img-rogue-umlibs"
diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
index c22e3096..13b8757c 100644
--- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
+++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
@@ -3,9 +3,9 @@ HOMEPAGE = "https://git.ti.com/graphics/omap5-sgx-ddk-linux"
 LICENSE = "MIT | GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://eurasia_km/README;beginline=13;endline=22;md5=74506d9b8e5edbce66c2747c50fcef12"
 
-inherit module features_check
+inherit module
 
-REQUIRED_MACHINE_FEATURES = "gpu"
+PROVIDES = "virtual/gpudriver"
 
 COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|k3"
 
@@ -16,8 +16,6 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 DEPENDS = "virtual/kernel"
 
-PROVIDES = "virtual/gpudriver"
-
 BRANCH = "ti-img-sgx/${PV}/k5.10"
 
 SRC_URI = "git://git.ti.com/git/graphics/omap5-sgx-ddk-linux.git;protocol=https;branch=${BRANCH}"
@@ -44,3 +42,5 @@ do_install() {
 do_install:k3() {
     make -C ${STAGING_KERNEL_DIR} M=${B}/eurasia_km/eurasiacon/binary_omap_linux_nulldrmws_release/target_aarch64/kbuild INSTALL_MOD_PATH=${D}${root_prefix} PREFIX=${STAGING_DIR_HOST} modules_install
 }
+
+RRECOMMENDS:${PN} += "ti-sgx-ddk-um"
diff --git a/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_1.15.6133109.bb b/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_1.15.6133109.bb
deleted file mode 100644
index a665c614..00000000
--- a/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_1.15.6133109.bb
+++ /dev/null
@@ -1,71 +0,0 @@
-DESCRIPTION = "Userspace libraries for PowerVR Rogue GPU on TI SoCs"
-HOMEPAGE = "http://git.ti.com/graphics/ti-img-rogue-umlibs"
-LICENSE = "TI-TFL"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=7232b98c1c58f99e3baa03de5207e76f"
-
-inherit features_check
-
-REQUIRED_MACHINE_FEATURES = "gpu"
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-COMPATIBLE_MACHINE = "j721e|j721s2|j784s4|am62xx"
-
-PR = "r2"
-
-BRANCH = "linuxws/dunfell/k5.10/${PV}_unified_fw_pagesize"
-
-SRC_URI = "git://git.ti.com/git/graphics/ti-img-rogue-umlibs.git;protocol=https;branch=${BRANCH}"
-SRCREV = "5977e82b96028f783d39c7219f016c1faf8dc5f5"
-
-TARGET_PRODUCT:j721e = "j721e_linux"
-TARGET_PRODUCT:j721s2 = "j721s2_linux"
-TARGET_PRODUCT:j784s4 = "j784s4_linux"
-TARGET_PRODUCT:am62xx = "am62_linux"
-PVR_BUILD ?= "release"
-PVR_WS = "wayland"
-
-INITSCRIPT_NAME = "rc.pvr"
-INITSCRIPT_PARAMS = "defaults 8"
-
-inherit update-rc.d
-
-PROVIDES += "virtual/egl virtual/libgles1 virtual/libgles2 virtual/libgbm"
-
-DEPENDS += "libdrm wayland expat"
-RDEPENDS:${PN} += "bash"
-RDEPENDS:${PN} += "wayland expat"
-
-RPROVIDES:${PN} = "libegl libgles1 libgles2 libgbm"
-RPROVIDES:${PN}-dev = "libegl-dev libgles1-dev libgles2-dev libgbm-dev"
-RPROVIDES:${PN}-dbg = "libegl-dbg libgles1-dbg libgles2-dbg"
-
-RREPLACES:${PN} = "libegl libgles1 liblges2 libgbm"
-RREPLACES:${PN}-dev = "libegl-dev libgles1-dev libgles2-dev libgbm-dev"
-RREPLACES:${PN}-dbg = "libegl-dbg libgles1-dbg libgles2-dbg"
-
-RCONFLICTS:${PN} = "libegl libgles1 libgles2 libgbm"
-RCONFLICTS:${PN}-dev = "libegl-dev libgles1-dev libgles2-dev libgbm-dev"
-RCONFLICTS:${PN}-dbg = "libegl-dbg libgles1-dbg libgles2-dbg"
-
-RRECOMMENDS:${PN} += "ti-img-rogue-driver"
-
-S = "${WORKDIR}/git"
-
-do_install () {
-    oe_runmake install DESTDIR=${D} TARGET_PRODUCT=${TARGET_PRODUCT} BUILD=${PVR_BUILD} WINDOW_SYSTEM=${PVR_WS}
-    chown -R root:root ${D}
-}
-
-FILES:${PN} += " ${nonarch_base_libdir}/firmware/"
-FILES:${PN} += " ${datadir}/"
-
-PACKAGES =+ "${PN}-plugins"
-FILES:${PN}-plugins = "${libdir}/libGLESv2.so ${libdir}/libGLESv1_CM.so ${libdir}/libEGL.so ${libdir}/dri/pvr_dri.so"
-RDEPENDS:${PN} += "${PN}-plugins"
-
-ALLOW_EMPTY:${PN}-plugins = "1"
-
-INSANE_SKIP:${PN} += "ldflags arch already-stripped"
-INSANE_SKIP:${PN}-plugins = "dev-so"
-
-CLEANBROKEN = "1"
diff --git a/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_1.18.6276027.bb b/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_1.18.6276027.bb
new file mode 100644
index 00000000..924e46ba
--- /dev/null
+++ b/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_1.18.6276027.bb
@@ -0,0 +1,39 @@
+DESCRIPTION = "Userspace libraries for PowerVR Rogue GPU on TI SoCs"
+HOMEPAGE = "http://git.ti.com/graphics/ti-img-rogue-umlibs"
+LICENSE = "TI-TFL"
+LIC_FILES_CHKSUM = "file://${WORKDIR}/git/LICENSE;md5=7232b98c1c58f99e3baa03de5207e76f"
+
+inherit bin_package
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+COMPATIBLE_MACHINE = "j721e|j721s2|j784s4|am62xx"
+
+PR = "r2"
+
+BRANCH = "linuxws/kirkstone/k5.10/${PV}"
+SRC_URI = "git://git.ti.com/git/graphics/ti-img-rogue-umlibs.git;protocol=https;branch=${BRANCH}"
+SRCREV = "51e598919641d51156a631efa5447124a3c0f543"
+S = "${WORKDIR}/git/targetfs/${TARGET_PRODUCT}/${PVR_WS}/${PVR_BUILD}"
+
+TARGET_PRODUCT:j721e = "j721e_linux"
+TARGET_PRODUCT:j721s2 = "j721s2_linux"
+TARGET_PRODUCT:j784s4 = "j784s4_linux"
+TARGET_PRODUCT:am62xx = "am62_linux"
+PVR_BUILD = "release"
+PVR_WS = "lws-generic"
+
+RDEPENDS:${PN} += "mesa-megadriver libdrm ti-img-rogue-driver"
+
+do_install:append() {
+    rm -rf "${D}/etc/init.d"
+    rm -rf "${D}/usr/lib/libvulkan.so"
+    rm -rf "${D}/usr/lib/libvulkan.so.0"
+    rm -rf "${D}/usr/lib/libvulkan.so.1"
+}
+
+PACKAGES = "${PN}-tools ${PN}"
+FILES:${PN}-tools = "${bindir}/"
+RDEPENDS:${PN}-tools = "python3-core"
+RRECOMMENDS:${PN} += "${PN}-tools"
+
+INSANE_SKIP:${PN} += "ldflags arch already-stripped dev-so"
diff --git a/meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb b/meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
index fb98eb68..d7f67c59 100644
--- a/meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
+++ b/meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
@@ -3,19 +3,15 @@ HOMEPAGE = "https://git.ti.com/graphics/omap5-sgx-ddk-um-linux"
 LICENSE = "TI-TSPA"
 LIC_FILES_CHKSUM = "file://TI-Linux-Graphics-DDK-UM-Manifest.doc;md5=b17390502bc89535c86cfbbae961a2a8"
 
-inherit features_check
-
-REQUIRED_MACHINE_FEATURES = "gpu"
-
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|am65xx"
 
 PR = "r38"
 
-BRANCH = "ti-img-sgx/kirkstone/${PV}"
+BRANCH = "ti-img-sgx/kirkstone-mesa/${PV}"
 
 SRC_URI = "git://git.ti.com/graphics/omap5-sgx-ddk-um-linux.git;protocol=git;branch=${BRANCH}"
-SRCREV = "905809029b877fea42e91b9738825a6294ff1775"
+SRCREV = "bbae7217051341f515515ec190e165119102f45a"
 
 TARGET_PRODUCT:ti33x = "ti335x"
 TARGET_PRODUCT:ti43x = "ti437x"
@@ -27,26 +23,7 @@ INITSCRIPT_PARAMS = "defaults 8"
 
 inherit update-rc.d
 
-PROVIDES += "virtual/egl virtual/libgles1 virtual/libgles2 virtual/libgbm"
-
-DEPENDS += "libdrm udev wayland wayland-protocols libffi expat"
-DEPENDS:append:libc-musl = " gcompat"
-RDEPENDS:${PN} += "libdrm libdrm-omap udev wayland wayland-protocols libffi expat"
-
-RPROVIDES:${PN} = "libegl libgles1 libgles2 libgbm"
-RPROVIDES:${PN}-dev = "libegl-dev libgles1-dev libgles2-dev libgbm-dev"
-RPROVIDES:${PN}-dbg = "libegl-dbg libgles1-dbg libgles2-dbg libgbm-dbg"
-
-RREPLACES:${PN} = "libegl libgles1 libgles2 libgbm"
-RREPLACES:${PN}-dev = "libegl-dev libgles1-dev libgles2-dev libgbm-dev"
-RREPLACES:${PN}-dbg = "libegl-dbg libgles1-dbg libgles2-dbg libgbm-dbg"
-
-RCONFLICTS:${PN} = "libegl libgles1 libgles2 libgbm"
-RCONFLICTS:${PN}-dev = "libegl-dev libgles1-dev libgles2-dev libgbm-dev"
-RCONFLICTS:${PN}-dbg = "libegl-dbg libgles1-dbg libgles2-dbg libgbm-dbg"
-
-# The actual SONAME is libGLESv2.so.2, so need to explicitly specify RPROVIDES for .so.1 here
-RPROVIDES:${PN} += "libGLESv2.so.1"
+RDEPENDS:${PN} += "libdrm libdrm-omap"
 
 RRECOMMENDS:${PN} += "ti-sgx-ddk-km"
 
@@ -54,7 +31,6 @@ S = "${WORKDIR}/git"
 
 do_install () {
     oe_runmake install DESTDIR=${D} TARGET_PRODUCT=${TARGET_PRODUCT}
-    ln -sf libGLESv2.so.2 ${D}${libdir}/libGLESv2.so.1
 
     chown -R root:root ${D}
 }
diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-gl_22.0.%.bbappend b/meta-ti-bsp/recipes-graphics/mesa/mesa-gl_22.0.%.bbappend
new file mode 100644
index 00000000..912e9e9d
--- /dev/null
+++ b/meta-ti-bsp/recipes-graphics/mesa/mesa-gl_22.0.%.bbappend
@@ -0,0 +1 @@
+require ${@bb.utils.contains_any('PREFERRED_PROVIDER_virtual/gpudriver', 'ti-img-rogue-driver ti-sgx-ddk-km', 'pvr-mesa.inc', '', d)}
diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa_22.0.%.bbappend b/meta-ti-bsp/recipes-graphics/mesa/mesa_22.0.%.bbappend
new file mode 100644
index 00000000..912e9e9d
--- /dev/null
+++ b/meta-ti-bsp/recipes-graphics/mesa/mesa_22.0.%.bbappend
@@ -0,0 +1 @@
+require ${@bb.utils.contains_any('PREFERRED_PROVIDER_virtual/gpudriver', 'ti-img-rogue-driver ti-sgx-ddk-km', 'pvr-mesa.inc', '', d)}
diff --git a/meta-ti-bsp/recipes-graphics/mesa/pvr-mesa.inc b/meta-ti-bsp/recipes-graphics/mesa/pvr-mesa.inc
new file mode 100644
index 00000000..17edee8d
--- /dev/null
+++ b/meta-ti-bsp/recipes-graphics/mesa/pvr-mesa.inc
@@ -0,0 +1,40 @@
+# PowerVR Graphics require several patches that have not made their way
+# upstream yet. This allows us to build the shims we need without completely
+# clobbering mesa.
+
+BRANCH = "powervr/kirkstone/22.0"
+
+SRC_URI = " \
+    git://gitlab.freedesktop.org/StaticRocket/mesa.git;protocol=https;branch=${BRANCH} \
+    file://0001-meson.build-check-for-all-linux-host_os-combinations.patch \
+    file://0002-meson.build-make-TLS-ELF-optional.patch \
+    file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
+    file://0001-futex.h-Define-__NR_futex-if-it-does-not-exist.patch \
+    file://0001-util-format-Check-for-NEON-before-using-it.patch \
+    file://0001-Revert-egl-wayland-deprecate-drm_handle_format-and-d.patch \
+"
+
+S = "${WORKDIR}/git"
+
+SRCREV = "44b82a7b6fa8a86243911b1b0d6a07b0fd8ecfba"
+
+PACKAGECONFIG:append = " \
+    ${@bb.utils.contains('PREFERRED_PROVIDER_virtual/gpudriver', 'ti-img-rogue-driver', 'pvr', '', d)} \
+    ${@bb.utils.contains('PREFERRED_PROVIDER_virtual/gpudriver', 'ti-sgx-ddk-km', 'sgx', '', d)} \
+"
+
+PVR_DISPLAY_CONTROLLER_ALIAS ??= "tidss"
+PACKAGECONFIG[pvr] = "-Dgallium-pvr-alias=${PVR_DISPLAY_CONTROLLER_ALIAS},"
+PACKAGECONFIG[sgx] = "-Dgallium-sgx-alias=${PVR_DISPLAY_CONTROLLER_ALIAS},"
+
+PV:append = "+pvr"
+
+GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'pvr', ',pvr', '', d)}"
+GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'sgx', ',sgx', '', d)}"
+
+do_install:append () {
+    # remove pvr custom pkgconfig
+    rm -rf ${D}${datadir}/pkgconfig
+}
+
+RRECOMMENDS:mesa-megadriver:class-target:append = "${@d.getVar('PREFERRED_PROVIDER_virtual/gpudriver')}"
-- 
2.34.1


