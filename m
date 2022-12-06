Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA73AC352A1
	for <webhook@archiver.kernel.org>; Tue,  6 Dec 2022 17:46:03 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.54792.1670348756264751903
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 06 Dec 2022 09:45:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Tw++MmT/;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: rs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2B6HjtLm048422
	for <meta-ti@lists.yoctoproject.org>; Tue, 6 Dec 2022 11:45:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1670348755;
	bh=0noCPfeOlMJ+eAraX8Cf5pIwJWvSs+KVZHXdi7FVwF0=;
	h=From:To:CC:Subject:Date;
	b=Tw++MmT/qdkfiFfMtND7xQcqoAvSkad83IEGyT2RJqLpfcfW0iK8R7VboF5pncY4V
	 tTXg8lWfukmHdoAJUpzZ7dAoGW/lQcZjm6Rncbd8hZLnEg/iVu2eDvXm4lgJ4IhYts
	 wVq8yr0vt0qRcytj1lWqNhmk8m5W+u8E4+R3q7gk=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2B6HjtDO121355
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Tue, 6 Dec 2022 11:45:55 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 6
 Dec 2022 11:45:54 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Tue, 6 Dec 2022 11:45:55 -0600
Received: from res.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2B6HjtBO000564;
	Tue, 6 Dec 2022 11:45:55 -0600
From: Randolph Sapp <rs@ti.com>
To: <reatmon@ti.com>, <denys@ti.com>, <detheridge@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, Randolph Sapp <rs@ti.com>
Subject: [master][PATCH v2] meta-ti-bsp: Graphics recipe overhaul
Date: Tue, 6 Dec 2022 11:45:53 -0600
Message-ID: <20221206174553.2391187-1-rs@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 06 Dec 2022 17:46:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15414

Individually package rogue graphics components to prevent conflicts with
other recipes.

The package ti-img-rogue-umlibs will now distribute the window system
agnostic components of the DDK. This being the IMG's implementations of
OpenGLES, OpenCL, and Vulkan in binary format and the device firmware.
These are the only components that cannot be open source currently.

The mesa component is currently piggybacking off the default mesa
package. It's not elegant, but it reflects the implementation well and
allows users to config mesa as needed.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 meta-ti-bsp/conf/machine/include/am62xx.inc   |   4 -
 meta-ti-bsp/conf/machine/include/j721e.inc    |   4 -
 meta-ti-bsp/conf/machine/include/j721s2.inc   |   4 -
 ...-OpenEmbedded-nodistro-internal-aarc.patch |  29 --
 ...bb => ti-img-rogue-driver_1.18.6276027.bb} |  12 +-
 .../ti-img-rogue-umlibs_1.15.6133109.bb       |  71 ----
 .../ti-img-rogue-umlibs_1.18.6276027.bb       |  55 +++
 ...nd-deprecate-drm_handle_format-and-d.patch | 158 +++++++++
 ...fine-__NR_futex-if-it-does-not-exist.patch |  34 ++
 ...sdetects-64bit-atomics-on-mips-clang.patch |  25 ++
 ...k-for-all-linux-host_os-combinations.patch |  43 +++
 ...ormat-Check-for-NEON-before-using-it.patch |  47 +++
 ...02-meson.build-make-TLS-ELF-optional.patch |  61 ++++
 .../recipes-graphics/mesa/mesa-gl_22.0.3.bb   |  13 +
 .../recipes-graphics/mesa/mesa_22.0.3.bb      |   1 +
 .../recipes-graphics/mesa/rogue-mesa.inc      |  28 ++
 .../recipes-graphics/mesa/vanilla-mesa.inc    | 320 ++++++++++++++++++
 17 files changed, 790 insertions(+), 119 deletions(-)
 delete mode 100644 meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver/0001-compiler-support-OpenEmbedded-nodistro-internal-aarc.patch
 rename meta-ti-bsp/recipes-bsp/powervr-drivers/{ti-img-rogue-driver_1.15.6133109.bb => ti-img-rogue-driver_1.18.6276027.bb} (77%)
 delete mode 100644 meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_1.15.6133109.bb
 create mode 100644 meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_1.18.6276027.bb
 create mode 100644 meta-ti-bsp/recipes-graphics/mesa/files/0001-Revert-egl-wayland-deprecate-drm_handle_format-and-d.patch
 create mode 100644 meta-ti-bsp/recipes-graphics/mesa/files/0001-futex.h-Define-__NR_futex-if-it-does-not-exist.patch
 create mode 100644 meta-ti-bsp/recipes-graphics/mesa/files/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch
 create mode 100644 meta-ti-bsp/recipes-graphics/mesa/files/0001-meson.build-check-for-all-linux-host_os-combinations.patch
 create mode 100644 meta-ti-bsp/recipes-graphics/mesa/files/0001-util-format-Check-for-NEON-before-using-it.patch
 create mode 100644 meta-ti-bsp/recipes-graphics/mesa/files/0002-meson.build-make-TLS-ELF-optional.patch
 create mode 100644 meta-ti-bsp/recipes-graphics/mesa/mesa-gl_22.0.3.bb
 create mode 100644 meta-ti-bsp/recipes-graphics/mesa/mesa_22.0.3.bb
 create mode 100644 meta-ti-bsp/recipes-graphics/mesa/rogue-mesa.inc
 create mode 100644 meta-ti-bsp/recipes-graphics/mesa/vanilla-mesa.inc

diff --git a/meta-ti-bsp/conf/machine/include/am62xx.inc b/meta-ti-bsp/conf/machine/include/am62xx.inc
index a5aad994..3dc70b9b 100644
--- a/meta-ti-bsp/conf/machine/include/am62xx.inc
+++ b/meta-ti-bsp/conf/machine/include/am62xx.inc
@@ -6,10 +6,6 @@ MACHINE_FEATURES += "screen touchscreen gpu"
 SERIAL_CONSOLES = "115200;ttyS2"
 SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
 
-PREFERRED_PROVIDER_virtual/egl ?= "ti-img-rogue-umlibs"
-PREFERRED_PROVIDER_virtual/libgles1 ?= "ti-img-rogue-umlibs"
-PREFERRED_PROVIDER_virtual/libgles2 ?= "ti-img-rogue-umlibs"
-PREFERRED_PROVIDER_virtual/libgbm ?= "ti-img-rogue-umlibs"
 PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-img-rogue-driver"
 
 do_image_wic[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
diff --git a/meta-ti-bsp/conf/machine/include/j721e.inc b/meta-ti-bsp/conf/machine/include/j721e.inc
index fe260178..387a6407 100644
--- a/meta-ti-bsp/conf/machine/include/j721e.inc
+++ b/meta-ti-bsp/conf/machine/include/j721e.inc
@@ -3,8 +3,4 @@ SOC_FAMILY:append = ":j721e"
 
 MACHINE_FEATURES += "gpu"
 
-PREFERRED_PROVIDER_virtual/egl ?= "ti-img-rogue-umlibs"
-PREFERRED_PROVIDER_virtual/libgles1 ?= "ti-img-rogue-umlibs"
-PREFERRED_PROVIDER_virtual/libgles2 ?= "ti-img-rogue-umlibs"
-PREFERRED_PROVIDER_virtual/libgbm ?= "ti-img-rogue-umlibs"
 PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-img-rogue-driver"
diff --git a/meta-ti-bsp/conf/machine/include/j721s2.inc b/meta-ti-bsp/conf/machine/include/j721s2.inc
index 5cd74683..10d639fe 100644
--- a/meta-ti-bsp/conf/machine/include/j721s2.inc
+++ b/meta-ti-bsp/conf/machine/include/j721s2.inc
@@ -3,8 +3,4 @@ SOC_FAMILY:append = ":j721s2"
 
 MACHINE_FEATURES += "gpu"
 
-PREFERRED_PROVIDER_virtual/egl ?= "ti-img-rogue-umlibs"
-PREFERRED_PROVIDER_virtual/libgles1 ?= "ti-img-rogue-umlibs"
-PREFERRED_PROVIDER_virtual/libgles2 ?= "ti-img-rogue-umlibs"
-PREFERRED_PROVIDER_virtual/libgbm ?= "ti-img-rogue-umlibs"
 PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-img-rogue-driver"
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
similarity index 77%
rename from meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb
rename to meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.18.6276027.bb
index b4d19195..45df7c4b 100644
--- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb
+++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.18.6276027.bb
@@ -11,29 +11,27 @@ MACHINE_KERNEL_PR:append = "b"
 PR = "${MACHINE_KERNEL_PR}"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
+
 COMPATIBLE_MACHINE = "j721e|j721s2|j784s4|am62xx"
 
 DEPENDS = "virtual/kernel"
 
 PROVIDES = "virtual/gpudriver"
 
-BRANCH = "linuxws/dunfell/k5.10/${PV}_unified_fw_pagesize"
+BRANCH = "linuxws/kirkstone/k5.10/${PV}"
 
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
index 00000000..c9110053
--- /dev/null
+++ b/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_1.18.6276027.bb
@@ -0,0 +1,55 @@
+DESCRIPTION = "Userspace libraries for PowerVR Rogue GPU on TI SoCs"
+HOMEPAGE = "http://git.ti.com/graphics/ti-img-rogue-umlibs"
+LICENSE = "TI-TFL"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=7232b98c1c58f99e3baa03de5207e76f"
+
+inherit features_check
+
+REQUIRED_MACHINE_FEATURES = "gpu"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+COMPATIBLE_MACHINE = "j721e|j721s2|j784s4|am62xx"
+
+PR = "r2"
+
+BRANCH = "linuxws/kirkstone/k5.10/${PV}"
+
+SRC_URI = "git://git.ti.com/git/graphics/ti-img-rogue-umlibs.git;protocol=https;branch=${BRANCH}"
+SRCREV = "540919e26f2a3674ba6a3044a113905298125894"
+
+TARGET_PRODUCT:j721e = "j721e_linux"
+TARGET_PRODUCT:j721s2 = "j721s2_linux"
+TARGET_PRODUCT:j784s4 = "j784s4_linux"
+TARGET_PRODUCT:am62xx = "am62_linux"
+PVR_BUILD ?= "release"
+PVR_WS = "lws-generic"
+
+INITSCRIPT_NAME = "rc.pvr"
+INITSCRIPT_PARAMS = "defaults 8"
+
+inherit update-rc.d
+
+DEPENDS += "libdrm wayland expat"
+RDEPENDS:${PN} += "bash mesa-megadriver ti-img-rogue-driver"
+RDEPENDS:${PN} += "wayland expat"
+
+S = "${WORKDIR}/git"
+
+do_install () {
+    oe_runmake install DESTDIR=${D} TARGET_PRODUCT=${TARGET_PRODUCT} BUILD=${PVR_BUILD} WINDOW_SYSTEM=${PVR_WS}
+    chown -R root:root ${D}
+}
+
+PACKAGES = "${PN}-tools ${PN}"
+FILES:${PN}-tools += " ${bindir}/"
+RDEPENDS:${PN}-tools += "python3-core"
+RRECOMMENDS:${PN} += "${PN}-tools"
+
+FILES:${PN} += " ${nonarch_base_libdir}/firmware/"
+FILES:${PN} += " ${datadir}/"
+FILES:${PN} += " ${libdir}/"
+FILES:${PN} += " ${etcdir}/OpenCL ${etcdir}/vulkan"
+
+INSANE_SKIP:${PN} += "ldflags arch already-stripped dev-so"
+
+CLEANBROKEN = "1"
diff --git a/meta-ti-bsp/recipes-graphics/mesa/files/0001-Revert-egl-wayland-deprecate-drm_handle_format-and-d.patch b/meta-ti-bsp/recipes-graphics/mesa/files/0001-Revert-egl-wayland-deprecate-drm_handle_format-and-d.patch
new file mode 100644
index 00000000..dac2de4e
--- /dev/null
+++ b/meta-ti-bsp/recipes-graphics/mesa/files/0001-Revert-egl-wayland-deprecate-drm_handle_format-and-d.patch
@@ -0,0 +1,158 @@
+From 7796c2c56c960ac55e49246f0349ac52539ada55 Mon Sep 17 00:00:00 2001
+From: Leandro Ribeiro <leandro.ribeiro@collabora.com>
+Date: Sun, 10 Apr 2022 22:54:36 -0300
+Subject: [PATCH] Revert "egl/wayland: deprecate drm_handle_format() and
+ drm_handle_capabilities()"
+
+Commit af1ee8e010441f8f2ed8c77065b159652a4ac9fe dropped support to
+wl_drm, as we thought that most compositors from active projects were
+already supporting zwp_linux_dmabuf_v1.
+
+But that's not true, so revert this commit in order to give these
+projects a longer transition period.
+
+Note that we didn't add back the support to GEM name API, and that was
+on purpose.
+
+Signed-off-by: Leandro Ribeiro <leandro.ribeiro@collabora.com>
+Reviewed-by: Simon Ser <contact@emersion.fr>
+Part-of: <https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/15822>
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+Upstream-Status: Backport [https://gitlab.freedesktop.org/mesa/mesa/-/commit/c60fea8c228ae3f32e20d6b65c473d9f04871d20]
+---
+ src/egl/drivers/dri2/egl_dri2.h         |  1 +
+ src/egl/drivers/dri2/platform_wayland.c | 59 +++++++++++++++++++------
+ 2 files changed, 47 insertions(+), 13 deletions(-)
+
+diff --git a/src/egl/drivers/dri2/egl_dri2.h b/src/egl/drivers/dri2/egl_dri2.h
+index c466ff83c53..eecb32a53fd 100644
+--- a/src/egl/drivers/dri2/egl_dri2.h
++++ b/src/egl/drivers/dri2/egl_dri2.h
+@@ -283,6 +283,7 @@ struct dri2_egl_display
+    struct zwp_linux_dmabuf_feedback_v1 *wl_dmabuf_feedback;
+    struct dmabuf_feedback_format_table format_table;
+    bool authenticated;
++   uint32_t capabilities;
+    char *device_name;
+ #endif
+ 
+diff --git a/src/egl/drivers/dri2/platform_wayland.c b/src/egl/drivers/dri2/platform_wayland.c
+index 5ff83cce08a..843434376a7 100644
+--- a/src/egl/drivers/dri2/platform_wayland.c
++++ b/src/egl/drivers/dri2/platform_wayland.c
+@@ -1343,7 +1343,7 @@ create_wl_buffer(struct dri2_egl_display *dri2_dpy,
+                  struct dri2_egl_surface *dri2_surf,
+                  __DRIimage *image)
+ {
+-   struct wl_buffer *ret;
++   struct wl_buffer *ret = NULL;
+    EGLBoolean query;
+    int width, height, fourcc, num_planes;
+    uint64_t modifier = DRM_FORMAT_MOD_INVALID;
+@@ -1447,11 +1447,28 @@ create_wl_buffer(struct dri2_egl_display *dri2_dpy,
+       ret = zwp_linux_buffer_params_v1_create_immed(params, width, height,
+                                                     fourcc, 0);
+       zwp_linux_buffer_params_v1_destroy(params);
++   } else {
++      struct wl_drm *wl_drm =
++         dri2_surf ? dri2_surf->wl_drm_wrapper : dri2_dpy->wl_drm;
++      int fd = -1, stride;
++
++      if (num_planes > 1)
++         return NULL;
++
++      query = dri2_dpy->image->queryImage(image, __DRI_IMAGE_ATTRIB_FD, &fd);
++      query &= dri2_dpy->image->queryImage(image, __DRI_IMAGE_ATTRIB_STRIDE, &stride);
++      if (!query) {
++         if (fd >= 0)
++            close(fd);
++         return NULL;
++      }
+ 
+-      return ret;
++      ret = wl_drm_create_prime_buffer(wl_drm, fd, width, height, fourcc, 0,
++                                       stride, 0, 0, 0, 0);
++      close(fd);
+    }
+ 
+-   return NULL;
++   return ret;
+ }
+ 
+ static EGLBoolean
+@@ -1698,16 +1715,21 @@ drm_handle_device(void *data, struct wl_drm *drm, const char *device)
+ static void
+ drm_handle_format(void *data, struct wl_drm *drm, uint32_t format)
+ {
+-   /* deprecated, as compositors already support the dma-buf protocol extension
+-    * and so we can rely on dmabuf_handle_modifier() to receive formats and
+-    * modifiers */
++   struct dri2_egl_display *dri2_dpy = data;
++   int visual_idx = dri2_wl_visual_idx_from_fourcc(format);
++
++   if (visual_idx == -1)
++      return;
++
++   BITSET_SET(dri2_dpy->formats.formats_bitmap, visual_idx);
+ }
+ 
+ static void
+ drm_handle_capabilities(void *data, struct wl_drm *drm, uint32_t value)
+ {
+-   /* deprecated, as compositors already support the dma-buf protocol extension
+-    * and so we can rely on it to create wl_buffer's */
++   struct dri2_egl_display *dri2_dpy = data;
++
++   dri2_dpy->capabilities = value;
+ }
+ 
+ static void
+@@ -2075,13 +2097,12 @@ dri2_initialize_wayland_drm(_EGLDisplay *disp)
+    wl_registry_add_listener(dri2_dpy->wl_registry,
+                             &registry_listener_drm, dri2_dpy);
+ 
+-   /* The compositor must expose the dma-buf interface. */
+-   if (roundtrip(dri2_dpy) < 0 || dri2_dpy->wl_dmabuf == NULL)
++   if (roundtrip(dri2_dpy) < 0)
+       goto cleanup;
+ 
+    /* Get default dma-buf feedback */
+-   if (zwp_linux_dmabuf_v1_get_version(dri2_dpy->wl_dmabuf) >=
+-       ZWP_LINUX_DMABUF_V1_GET_DEFAULT_FEEDBACK_SINCE_VERSION) {
++   if (dri2_dpy->wl_dmabuf && zwp_linux_dmabuf_v1_get_version(dri2_dpy->wl_dmabuf) >=
++                              ZWP_LINUX_DMABUF_V1_GET_DEFAULT_FEEDBACK_SINCE_VERSION) {
+       dmabuf_feedback_format_table_init(&dri2_dpy->format_table);
+       dri2_dpy->wl_dmabuf_feedback =
+          zwp_linux_dmabuf_v1_get_default_feedback(dri2_dpy->wl_dmabuf);
+@@ -2089,7 +2110,6 @@ dri2_initialize_wayland_drm(_EGLDisplay *disp)
+                                                 &dmabuf_feedback_listener, dri2_dpy);
+    }
+ 
+-   /* Receive events from the interfaces */
+    if (roundtrip(dri2_dpy) < 0)
+       goto cleanup;
+ 
+@@ -2176,6 +2196,19 @@ dri2_initialize_wayland_drm(_EGLDisplay *disp)
+ 
+    dri2_wl_setup_swap_interval(disp);
+ 
++   if (dri2_dpy->wl_drm) {
++      /* To use Prime, we must have _DRI_IMAGE v7 at least. createImageFromFds
++       * support indicates that Prime export/import is supported by the driver.
++       * We deprecated the support to GEM names API, so we bail out if the
++       * driver does not suport Prime. */
++      if (!(dri2_dpy->capabilities & WL_DRM_CAPABILITY_PRIME) ||
++          (dri2_dpy->image->base.version < 7) ||
++          (dri2_dpy->image->createImageFromFds == NULL)) {
++         _eglLog(_EGL_WARNING, "wayland-egl: display does not support prime");
++         goto cleanup;
++      }
++   }
++
+    if (dri2_dpy->is_different_gpu &&
+        (dri2_dpy->image->base.version < 9 ||
+         dri2_dpy->image->blitImage == NULL)) {
+-- 
+2.35.1
+
diff --git a/meta-ti-bsp/recipes-graphics/mesa/files/0001-futex.h-Define-__NR_futex-if-it-does-not-exist.patch b/meta-ti-bsp/recipes-graphics/mesa/files/0001-futex.h-Define-__NR_futex-if-it-does-not-exist.patch
new file mode 100644
index 00000000..3b0bfa32
--- /dev/null
+++ b/meta-ti-bsp/recipes-graphics/mesa/files/0001-futex.h-Define-__NR_futex-if-it-does-not-exist.patch
@@ -0,0 +1,34 @@
+From 253b042d2bf10e9abfa9cc508e0782aefd834145 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 16 Oct 2020 11:03:47 -0700
+Subject: [PATCH] futex.h: Define __NR_futex if it does not exist
+
+__NR_futex is not defines by newer architectures e.g. arc, riscv32 as
+they only have 64bit variant of time_t. Glibc defines SYS_futex interface based on
+__NR_futex, since this is used in applications, such applications start
+to fail to build for these newer architectures. This patch defines a
+fallback to alias __NR_futex to __NR_futex_tim64 so SYS_futex keeps
+working
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+---
+ src/util/futex.h | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/util/futex.h b/src/util/futex.h
+index 43097f4..941b0ec 100644
+--- a/src/util/futex.h
++++ b/src/util/futex.h
+@@ -34,6 +34,10 @@
+ #include <sys/syscall.h>
+ #include <sys/time.h>
+ 
++#if !defined(SYS_futex) && defined(SYS_futex_time64)
++# define SYS_futex SYS_futex_time64
++#endif
++
+ static inline long sys_futex(void *addr1, int op, int val1, const struct timespec *timeout, void *addr2, int val3)
+ {
+    return syscall(SYS_futex, addr1, op, val1, timeout, addr2, val3);
diff --git a/meta-ti-bsp/recipes-graphics/mesa/files/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch b/meta-ti-bsp/recipes-graphics/mesa/files/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch
new file mode 100644
index 00000000..b08e4d86
--- /dev/null
+++ b/meta-ti-bsp/recipes-graphics/mesa/files/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch
@@ -0,0 +1,25 @@
+From d34bdbd80e5a1f309d2ba280cdc66ff0ee0e5c43 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 13 Jan 2020 15:23:47 -0800
+Subject: [PATCH] meson misdetects 64bit atomics on mips/clang
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+---
+ src/util/u_atomic.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/util/u_atomic.c b/src/util/u_atomic.c
+index 5a5eab4..e499516 100644
+--- a/src/util/u_atomic.c
++++ b/src/util/u_atomic.c
+@@ -21,7 +21,7 @@
+  * IN THE SOFTWARE.
+  */
+ 
+-#if defined(MISSING_64BIT_ATOMICS) && defined(HAVE_PTHREAD)
++#if !defined(__clang__) && defined(MISSING_64BIT_ATOMICS) && defined(HAVE_PTHREAD)
+ 
+ #include <stdint.h>
+ #include <pthread.h>
diff --git a/meta-ti-bsp/recipes-graphics/mesa/files/0001-meson.build-check-for-all-linux-host_os-combinations.patch b/meta-ti-bsp/recipes-graphics/mesa/files/0001-meson.build-check-for-all-linux-host_os-combinations.patch
new file mode 100644
index 00000000..aea23d0e
--- /dev/null
+++ b/meta-ti-bsp/recipes-graphics/mesa/files/0001-meson.build-check-for-all-linux-host_os-combinations.patch
@@ -0,0 +1,43 @@
+From f9c597a2c517eb85c23cbeeb2e95c55794c74cda Mon Sep 17 00:00:00 2001
+From: Alistair Francis <alistair@alistair23.me>
+Date: Thu, 14 Nov 2019 13:04:49 -0800
+Subject: [PATCH] meson.build: check for all linux host_os combinations
+
+Make sure that we are also looking for our host_os combinations like
+linux-musl etc. when assuming support for DRM/KMS.
+
+Also delete a duplicate line.
+
+Upstream-Status: Pending
+
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
+Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
+Signed-off-by: Alistair Francis <alistair@alistair23.me>
+
+---
+ meson.build | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index bca6b1f..70d06c0 100644
+--- a/meson.build
++++ b/meson.build
+@@ -172,7 +172,7 @@ with_any_opengl = with_opengl or with_gles1 or with_gles2
+ # Only build shared_glapi if at least one OpenGL API is enabled
+ with_shared_glapi = with_shared_glapi and with_any_opengl
+ 
+-system_has_kms_drm = ['openbsd', 'netbsd', 'freebsd', 'gnu/kfreebsd', 'dragonfly', 'linux', 'sunos'].contains(host_machine.system())
++system_has_kms_drm = ['openbsd', 'netbsd', 'freebsd', 'dragonfly'].contains(host_machine.system()) or host_machine.system().startswith('linux')
+ 
+ dri_drivers = get_option('dri-drivers')
+ if dri_drivers.length() != 0
+@@ -1074,7 +1074,7 @@ if cc.compiles('__uint128_t foo(void) { return 0; }',
+ endif
+ 
+ # TODO: this is very incomplete
+-if ['linux', 'cygwin', 'gnu', 'freebsd', 'gnu/kfreebsd', 'haiku'].contains(host_machine.system())
++if ['linux', 'cygwin', 'gnu', 'freebsd', 'gnu/kfreebsd', 'haiku'].contains(host_machine.system()) or host_machine.system().startswith('linux')
+   pre_args += '-D_GNU_SOURCE'
+ elif host_machine.system() == 'sunos'
+   pre_args += '-D__EXTENSIONS__'
diff --git a/meta-ti-bsp/recipes-graphics/mesa/files/0001-util-format-Check-for-NEON-before-using-it.patch b/meta-ti-bsp/recipes-graphics/mesa/files/0001-util-format-Check-for-NEON-before-using-it.patch
new file mode 100644
index 00000000..5c6165c2
--- /dev/null
+++ b/meta-ti-bsp/recipes-graphics/mesa/files/0001-util-format-Check-for-NEON-before-using-it.patch
@@ -0,0 +1,47 @@
+From fdb2face4eeac3c20eedcca7520f4e7014225fb4 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 2 Dec 2021 19:57:42 -0800
+Subject: [PATCH] util/format: Check for NEON before using it
+
+This fixes build on rpi0-w and any other machine which does not have
+neon unit and is not used as FPU unit
+
+Fixes errors e.g.
+
+In file included from ../mesa-21.3.0/src/util/format/u_format_unpack_neon.c:35:
+/mnt/b/yoe/master/build/tmp/work/arm1176jzfshf-vfp-yoe-linux-gnueabi/mesa/2_21.3.0-r0/recipe-sysroot-native/usr/lib/clang/13.0.1/include/arm_neon.h:32:2: error: "NEON support not enabled"
+
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/14032]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+---
+ src/util/format/u_format.c             | 2 +-
+ src/util/format/u_format_unpack_neon.c | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/util/format/u_format.c b/src/util/format/u_format.c
+index 36c5e52..f0a0097 100644
+--- a/src/util/format/u_format.c
++++ b/src/util/format/u_format.c
+@@ -1138,7 +1138,7 @@ static void
+ util_format_unpack_table_init(void)
+ {
+    for (enum pipe_format format = PIPE_FORMAT_NONE; format < PIPE_FORMAT_COUNT; format++) {
+-#if (defined(PIPE_ARCH_AARCH64) || defined(PIPE_ARCH_ARM)) && !defined(NO_FORMAT_ASM) && !defined(__SOFTFP__)
++#if (defined(PIPE_ARCH_AARCH64) || (defined(__ARM_NEON) && defined(PIPE_ARCH_ARM))) && !defined(NO_FORMAT_ASM)
+       const struct util_format_unpack_description *unpack = util_format_unpack_description_neon(format);
+       if (unpack) {
+          util_format_unpack_table[format] = unpack;
+diff --git a/src/util/format/u_format_unpack_neon.c b/src/util/format/u_format_unpack_neon.c
+index a4a5cb1..1e4f794 100644
+--- a/src/util/format/u_format_unpack_neon.c
++++ b/src/util/format/u_format_unpack_neon.c
+@@ -23,7 +23,7 @@
+ 
+ #include <u_format.h>
+ 
+-#if (defined(PIPE_ARCH_AARCH64) || defined(PIPE_ARCH_ARM)) && !defined(NO_FORMAT_ASM) && !defined(__SOFTFP__)
++#if (defined(PIPE_ARCH_AARCH64) || (defined(__ARM_NEON) && defined(PIPE_ARCH_ARM))) && !defined(NO_FORMAT_ASM)
+ 
+ /* armhf builds default to vfp, not neon, and refuses to compile neon intrinsics
+  * unless you tell it "no really".
diff --git a/meta-ti-bsp/recipes-graphics/mesa/files/0002-meson.build-make-TLS-ELF-optional.patch b/meta-ti-bsp/recipes-graphics/mesa/files/0002-meson.build-make-TLS-ELF-optional.patch
new file mode 100644
index 00000000..af11baee
--- /dev/null
+++ b/meta-ti-bsp/recipes-graphics/mesa/files/0002-meson.build-make-TLS-ELF-optional.patch
@@ -0,0 +1,61 @@
+From bf41fa026ae3d378e62fd83d03a6f5933b52ca04 Mon Sep 17 00:00:00 2001
+From: Alistair Francis <alistair@alistair23.me>
+Date: Thu, 14 Nov 2019 13:08:31 -0800
+Subject: [PATCH] meson.build: make TLS ELF optional
+
+USE_ELF_TLS has replaced GLX_USE_TLS so this patch is the original "make
+TLS GLX optional again" patch updated to the latest mesa.
+
+For details, see:
+https://gitlab.freedesktop.org/mesa/mesa/-/issues/966
+
+This prevents runtime segfault on musl:
+
+Traceback (most recent call last):
+  File "/home/pokybuild/yocto-worker/musl-qemux86/build/meta/lib/oeqa/core/decorator/__init__.py", line 36, in wrapped_f
+    return func(*args, **kwargs)
+  File "/home/pokybuild/yocto-worker/musl-qemux86/build/meta/lib/oeqa/runtime/cases/parselogs.py", line 378, in test_parselogs
+    self.assertEqual(errcount, 0, msg=self.msg)
+AssertionError: 1 != 0 : Log: /home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/qemux86-poky-linux-musl/core-image-sato-sdk/1.0-r0/target_logs/Xorg.0.log
+
+Upstream-Status: Inappropriate [configuration]
+---
+ meson.build       | 7 +++++--
+ meson_options.txt | 6 ++++++
+ 2 files changed, 11 insertions(+), 2 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index 70d06c0..1441611 100644
+--- a/meson.build
++++ b/meson.build
+@@ -490,8 +490,11 @@ foreach platform : _platforms
+   pre_args += '-DHAVE_@0@_PLATFORM'.format(platform.to_upper())
+ endforeach
+ 
+-use_elf_tls = true
+-pre_args += '-DUSE_ELF_TLS'
++use_elf_tls = false
++if get_option('elf-tls')
++  use_elf_tls = true
++  pre_args += '-DUSE_ELF_TLS'
++endif
+ 
+ if with_platform_android and get_option('platform-sdk-version') >= 29
+   # By default the NDK compiler, at least, emits emutls references instead of
+diff --git a/meson_options.txt b/meson_options.txt
+index 1f6ef38..99cc5cb 100644
+--- a/meson_options.txt
++++ b/meson_options.txt
+@@ -440,6 +440,12 @@ option(
+   value : true,
+   description : 'Enable direct rendering in GLX and EGL for DRI',
+ )
++option(
++  'elf-tls',
++  type : 'boolean',
++  value : true,
++  description : 'Enable TLS support in ELF',
++)
+ option('egl-lib-suffix',
+   type : 'string',
+   value : '',
diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-gl_22.0.3.bb b/meta-ti-bsp/recipes-graphics/mesa/mesa-gl_22.0.3.bb
new file mode 100644
index 00000000..bc87e9fc
--- /dev/null
+++ b/meta-ti-bsp/recipes-graphics/mesa/mesa-gl_22.0.3.bb
@@ -0,0 +1,13 @@
+require ${@ 'rogue' if d.getVar('PREFERRED_PROVIDER_virtual/gpudriver') == 'ti-img-rogue-driver' else 'vanilla' }-mesa.inc
+
+SUMMARY += " (OpenGL only, no EGL/GLES)"
+
+PROVIDES = "virtual/libgl virtual/mesa"
+
+S = "${WORKDIR}/mesa-${PV}"
+
+# At least one DRI rendering engine is required to build mesa.
+# When no X11 is available, use osmesa for the rendering engine.
+PACKAGECONFIG ??= "opengl ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', 'osmesa gallium', d)}"
+PACKAGECONFIG:class-target = "opengl ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', 'osmesa gallium', d)}"
+
diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa_22.0.3.bb b/meta-ti-bsp/recipes-graphics/mesa/mesa_22.0.3.bb
new file mode 100644
index 00000000..53f8e6e5
--- /dev/null
+++ b/meta-ti-bsp/recipes-graphics/mesa/mesa_22.0.3.bb
@@ -0,0 +1 @@
+require ${@ 'rogue' if d.getVar('PREFERRED_PROVIDER_virtual/gpudriver') == 'ti-img-rogue-driver' else 'vanilla' }-mesa.inc
diff --git a/meta-ti-bsp/recipes-graphics/mesa/rogue-mesa.inc b/meta-ti-bsp/recipes-graphics/mesa/rogue-mesa.inc
new file mode 100644
index 00000000..23fc708b
--- /dev/null
+++ b/meta-ti-bsp/recipes-graphics/mesa/rogue-mesa.inc
@@ -0,0 +1,28 @@
+require vanilla-mesa.inc
+BRANCH = "rogue/kirkstone/pvr-1.18/22.0"
+
+SRC_URI = "git://gitlab.freedesktop.org/StaticRocket/mesa.git;protocol=https;branch=${BRANCH} \
+           file://0001-meson.build-check-for-all-linux-host_os-combinations.patch \
+           file://0002-meson.build-make-TLS-ELF-optional.patch \
+           file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
+           file://0001-futex.h-Define-__NR_futex-if-it-does-not-exist.patch \
+           file://0001-util-format-Check-for-NEON-before-using-it.patch \
+           file://0001-Revert-egl-wayland-deprecate-drm_handle_format-and-d.patch \
+           "
+
+S = "${WORKDIR}/git"
+
+SRCREV = "fddf5106f04de2bd35892d30e5574c0b2881edd9"
+
+PV:append = "+rogue"
+
+GALLIUMDRIVERS:append = ",pvr"
+
+EXTRA_OEMESON:append = " -Dgallium-pvr-alias=tidss"
+
+do_install:append () {
+    # remove pvr custom pkgconfig
+    rm -rf ${D}${datadir}/pkgconfig
+}
+
+RRECOMMENDS:mesa-megadriver += "ti-img-rogue-driver ti-img-rogue-umlibs"
diff --git a/meta-ti-bsp/recipes-graphics/mesa/vanilla-mesa.inc b/meta-ti-bsp/recipes-graphics/mesa/vanilla-mesa.inc
new file mode 100644
index 00000000..afac8014
--- /dev/null
+++ b/meta-ti-bsp/recipes-graphics/mesa/vanilla-mesa.inc
@@ -0,0 +1,320 @@
+SUMMARY = "A free implementation of the OpenGL API"
+DESCRIPTION = "Mesa is an open-source implementation of the OpenGL specification - \
+a system for rendering interactive 3D graphics.  \
+A variety of device drivers allows Mesa to be used in many different environments \
+ranging from software emulation to complete hardware acceleration for modern GPUs. \
+Mesa is used as part of the overall Direct Rendering Infrastructure and X.org \
+environment."
+
+HOMEPAGE = "http://mesa3d.org"
+BUGTRACKER = "https://bugs.freedesktop.org"
+SECTION = "x11"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://docs/license.rst;md5=9a383ee9f65a4e939d6630e9b067ff58"
+
+PE = "2"
+
+SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
+           file://0001-meson.build-check-for-all-linux-host_os-combinations.patch \
+           file://0002-meson.build-make-TLS-ELF-optional.patch \
+           file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
+           file://0001-futex.h-Define-__NR_futex-if-it-does-not-exist.patch \
+           file://0001-util-format-Check-for-NEON-before-using-it.patch \
+           file://0001-Revert-egl-wayland-deprecate-drm_handle_format-and-d.patch \
+           "
+
+SRC_URI[sha256sum] = "9f2b30f5276a9abaf71aafc6979685e2636189de1a87aea2c9e69744a6d0ebb9"
+
+UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
+
+#because we cannot rely on the fact that all apps will use pkgconfig,
+#make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
+do_install:append() {
+    if ${@bb.utils.contains('PACKAGECONFIG', 'egl', 'true', 'false', d)}; then
+        sed -i -e 's/^#elif defined(__unix__) && defined(EGL_NO_X11)$/#elif defined(__unix__) \&\& defined(EGL_NO_X11) || ${@bb.utils.contains('PACKAGECONFIG', 'x11', '0', '1', d)}/' ${D}${includedir}/EGL/eglplatform.h
+    fi
+}
+
+DEPENDS = "expat makedepend-native flex-native bison-native libxml2-native zlib chrpath-replacement-native python3-mako-native gettext-native"
+EXTRANATIVEPATH += "chrpath-native"
+PROVIDES = " \
+    ${@bb.utils.contains('PACKAGECONFIG', 'opengl', 'virtual/libgl', '', d)} \
+    ${@bb.utils.contains('PACKAGECONFIG', 'gles', 'virtual/libgles1 virtual/libgles2 virtual/libgles3', '', d)} \
+    ${@bb.utils.contains('PACKAGECONFIG', 'egl', 'virtual/egl', '', d)} \
+    ${@bb.utils.contains('PACKAGECONFIG', 'gbm', 'virtual/libgbm', '', d)} \
+    virtual/mesa \
+    "
+
+inherit meson pkgconfig python3native gettext features_check
+
+BBCLASSEXTEND = "native nativesdk"
+
+ANY_OF_DISTRO_FEATURES:class-target = "opengl vulkan"
+
+PLATFORMS ??= "${@bb.utils.filter('PACKAGECONFIG', 'x11 wayland', d)}"
+
+export YOCTO_ALTERNATE_EXE_PATH = "${STAGING_LIBDIR}/llvm${MESA_LLVM_RELEASE}/llvm-config"
+export YOCTO_ALTERNATE_MULTILIB_NAME = "${base_libdir}"
+export LLVM_CONFIG = "${STAGING_BINDIR_NATIVE}/llvm-config${MESA_LLVM_RELEASE}"
+export WANT_LLVM_RELEASE = "${MESA_LLVM_RELEASE}"
+
+MESA_LLVM_RELEASE ?= "${LLVMVERSION}"
+
+# set the MESA_BUILD_TYPE to either 'release' (default) or 'debug'
+# by default the upstream mesa sources build a debug release
+# here we assume the user will want a release build by default
+MESA_BUILD_TYPE ?= "release"
+def check_buildtype(d):
+    _buildtype = d.getVar('MESA_BUILD_TYPE')
+    if _buildtype not in ['release', 'debug']:
+        bb.fatal("unknown build type (%s), please set MESA_BUILD_TYPE to either 'release' or 'debug'" % _buildtype)
+    if _buildtype == 'debug':
+        return 'debugoptimized'
+    return 'plain'
+MESON_BUILDTYPE = "${@check_buildtype(d)}"
+
+EXTRA_OEMESON = " \
+    -Dshared-glapi=enabled \
+    -Dglx-read-only-text=true \
+    -Dplatforms='${@",".join("${PLATFORMS}".split())}' \
+"
+
+def strip_comma(s):
+    return s.strip(',')
+
+PACKAGECONFIG = " \
+	gallium \
+	${@bb.utils.filter('DISTRO_FEATURES', 'x11 vulkan wayland', d)} \
+	${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'opengl egl gles gbm virgl', '', d)} \
+	${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'dri3', '', d)} \
+	${@bb.utils.contains('DISTRO_FEATURES', 'x11 vulkan', 'dri3', '', d)} \
+	${@bb.utils.contains('TCLIBC', 'glibc', 'elf-tls', '', d)} \
+"
+
+# "gbm" requires "opengl"
+PACKAGECONFIG[gbm] = "-Dgbm=enabled,-Dgbm=disabled"
+
+X11_DEPS = "xorgproto virtual/libx11 libxext libxxf86vm libxdamage libxfixes xrandr"
+# "x11" requires "opengl"
+PACKAGECONFIG[x11] = ",-Dglx=disabled,${X11_DEPS}"
+PACKAGECONFIG[elf-tls] = "-Delf-tls=true, -Delf-tls=false"
+PACKAGECONFIG[xvmc] = "-Dgallium-xvmc=enabled,-Dgallium-xvmc=disabled,libxvmc"
+PACKAGECONFIG[wayland] = ",,wayland-native wayland libdrm wayland-protocols"
+
+PACKAGECONFIG[dri3] = "-Ddri3=enabled, -Ddri3=disabled, xorgproto libxshmfence"
+
+# Vulkan drivers need dri3 enabled
+# amd could be enabled as well but requires gallium-llvm with llvm >= 3.9
+VULKAN_DRIVERS = ""
+VULKAN_DRIVERS:append:x86:class-target = ",intel"
+VULKAN_DRIVERS:append:x86-64:class-target = ",intel"
+VULKAN_DRIVERS:append ="${@bb.utils.contains('PACKAGECONFIG', 'freedreno', ',freedreno', '', d)}"
+VULKAN_DRIVERS:append ="${@bb.utils.contains('PACKAGECONFIG', 'broadcom', ',broadcom', '', d)}"
+PACKAGECONFIG[vulkan] = "-Dvulkan-drivers=${@strip_comma('${VULKAN_DRIVERS}')}, -Dvulkan-drivers='',"
+
+PACKAGECONFIG[opengl] = "-Dopengl=true, -Dopengl=false"
+
+# "gles" requires "opengl"
+PACKAGECONFIG[gles] = "-Dgles1=enabled -Dgles2=enabled, -Dgles1=disabled -Dgles2=disabled"
+
+# "egl" requires "opengl"
+PACKAGECONFIG[egl] = "-Degl=enabled, -Degl=disabled"
+
+# "opencl" requires libclc from meta-clang and spirv-tools from OE-Core
+PACKAGECONFIG[opencl] = "-Dgallium-opencl=icd -Dopencl-spirv=true,-Dgallium-opencl=disabled -Dopencl-spirv=false,libclc spirv-tools"
+
+PACKAGECONFIG[broadcom] = ""
+PACKAGECONFIG[etnaviv] = ""
+PACKAGECONFIG[freedreno] = ""
+PACKAGECONFIG[kmsro] = ""
+PACKAGECONFIG[vc4] = ""
+PACKAGECONFIG[v3d] = ""
+
+GALLIUMDRIVERS = "swrast"
+# gallium swrast was found to crash Xorg on startup in x32 qemu
+GALLIUMDRIVERS:x86-x32 = ""
+GALLIUMDRIVERS:append:x86:class-target = ",i915,iris,crocus"
+GALLIUMDRIVERS:append:x86-64:class-target = ",i915,iris,crocus"
+
+GALLIUMDRIVERS:append ="${@bb.utils.contains('PACKAGECONFIG', 'etnaviv', ',etnaviv', '', d)}"
+GALLIUMDRIVERS:append ="${@bb.utils.contains('PACKAGECONFIG', 'freedreno', ',freedreno', '', d)}"
+GALLIUMDRIVERS:append ="${@bb.utils.contains('PACKAGECONFIG', 'kmsro', ',kmsro', '', d)}"
+GALLIUMDRIVERS:append ="${@bb.utils.contains('PACKAGECONFIG', 'vc4', ',vc4', '', d)}"
+GALLIUMDRIVERS:append ="${@bb.utils.contains('PACKAGECONFIG', 'v3d', ',v3d', '', d)}"
+
+# radeonsi requires LLVM
+GALLIUMDRIVERS_RADEONSI = "${@bb.utils.contains('PACKAGECONFIG', 'r600', ',radeonsi', '', d)}"
+GALLIUMDRIVERS_LLVM = "r300,nouveau${GALLIUMDRIVERS_RADEONSI}"
+GALLIUMDRIVERS_LLVM:append:x86:class-target = ",svga"
+GALLIUMDRIVERS_LLVM:append:x86-64:class-target = ",svga"
+
+PACKAGECONFIG[r600] = ""
+PACKAGECONFIG[virgl] = ""
+
+GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'gallium-llvm', ',${GALLIUMDRIVERS_LLVM}', '', d)}"
+GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'r600', ',r600', '', d)}"
+GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'virgl', ',virgl', '', d)}"
+
+PACKAGECONFIG[gallium] = "-Dgallium-drivers=${@strip_comma('${GALLIUMDRIVERS}')}, -Dgallium-drivers='', libdrm"
+PACKAGECONFIG[gallium-llvm] = "-Dllvm=enabled -Dshared-llvm=enabled, -Dllvm=disabled, llvm${MESA_LLVM_RELEASE} llvm-native \
+                               elfutils"
+PACKAGECONFIG[xa]  = "-Dgallium-xa=enabled, -Dgallium-xa=disabled"
+PACKAGECONFIG[va] = "-Dgallium-va=enabled,-Dgallium-va=disabled,libva-initial"
+
+PACKAGECONFIG[vdpau] = "-Dgallium-vdpau=enabled,-Dgallium-vdpau=disabled,libvdpau"
+
+PACKAGECONFIG[lima] = ""
+GALLIUMDRIVERS:append ="${@bb.utils.contains('PACKAGECONFIG', 'lima', ',lima', '', d)}"
+
+PACKAGECONFIG[panfrost] = ""
+GALLIUMDRIVERS:append ="${@bb.utils.contains('PACKAGECONFIG', 'panfrost', ',panfrost', '', d)}"
+
+PACKAGECONFIG[osmesa] = "-Dosmesa=true,-Dosmesa=false"
+
+PACKAGECONFIG[unwind] = "-Dlibunwind=enabled,-Dlibunwind=disabled,libunwind"
+
+PACKAGECONFIG[lmsensors] = "-Dlmsensors=enabled,-Dlmsensors=disabled,lmsensors"
+
+# llvmpipe is slow if compiled with -fomit-frame-pointer (e.g. -O2)
+FULL_OPTIMIZATION:append = " -fno-omit-frame-pointer"
+
+CFLAGS:append:armv5 = " -DMISSING_64BIT_ATOMICS"
+CFLAGS:append:armv6 = " -DMISSING_64BIT_ATOMICS"
+
+# Remove the mesa dependency on mesa-dev, as mesa is empty
+RDEPENDS:${PN}-dev = ""
+
+# Khronos documentation says that include/GLES2/gl2ext.h can be used for
+# OpenGL ES 3 specification as well as for OpenGL ES 2.
+# There can be applications including GLES2/gl2ext.h instead of GLES3/gl3ext.h
+# meaning we should probably bring in GLES2/gl2ext.h if someone asks for
+# development package of libgles3.
+RDEPENDS:libgles3-mesa-dev += "libgles2-mesa-dev"
+
+RDEPENDS:libopencl-mesa += "${@bb.utils.contains('PACKAGECONFIG', 'opencl', 'libclc spirv-tools', '', d)}"
+
+PACKAGES =+ "libegl-mesa libegl-mesa-dev \
+             libosmesa libosmesa-dev \
+             libgl-mesa libgl-mesa-dev \
+             libglapi libglapi-dev \
+             libgbm libgbm-dev \
+             libgles1-mesa libgles1-mesa-dev \
+             libgles2-mesa libgles2-mesa-dev \
+             libgles3-mesa libgles3-mesa-dev \
+             libopencl-mesa libopencl-mesa-dev \
+             libxatracker libxatracker-dev \
+             mesa-megadriver mesa-vulkan-drivers \
+             mesa-vdpau-drivers \
+            "
+
+do_install:append () {
+    # Drivers never need libtool .la files
+    rm -f ${D}${libdir}/dri/*.la
+    rm -f ${D}${libdir}/egl/*.la
+    rm -f ${D}${libdir}/gallium-pipe/*.la
+    rm -f ${D}${libdir}/gbm/*.la
+
+    # it was packaged in libdricore9.1.3-1 and preventing upgrades when debian.bbclass was used 
+    chrpath --delete ${D}${libdir}/dri/*_dri.so || true
+
+    # libwayland-egl has been moved to wayland 1.15+
+    rm -f ${D}${libdir}/libwayland-egl*
+    rm -f ${D}${libdir}/pkgconfig/wayland-egl.pc
+}
+
+# For the packages that make up the OpenGL interfaces, inject variables so that
+# they don't get Debian-renamed (which would remove the -mesa suffix), and
+# RPROVIDEs/RCONFLICTs on the generic libgl name.
+python __anonymous() {
+    pkgconfig = (d.getVar('PACKAGECONFIG') or "").split()
+    suffix = ""
+    if "-native" in d.getVar("PN"):
+        suffix = "-native"
+    for p in (("egl", "libegl", "libegl1"),
+              ("opengl", "libgl", "libgl1"),
+              ("gles", "libgles1", "libglesv1-cm1"),
+              ("gles", "libgles2", "libglesv2-2"),
+              ("gles", "libgles3",),
+              ("opencl", "libopencl",)):
+        if not p[0] in pkgconfig:
+            continue
+        mlprefix = d.getVar("MLPREFIX")
+        fullp = mlprefix + p[1] + "-mesa" + suffix
+        mlprefix = d.getVar("MLPREFIX")
+        pkgs = " " + " ".join(mlprefix + x + suffix for x in p[1:])
+        d.setVar("DEBIAN_NOAUTONAME:" + fullp, "1")
+        d.appendVar("RREPLACES:" + fullp, pkgs)
+        d.appendVar("RPROVIDES:" + fullp, pkgs)
+        d.appendVar("RCONFLICTS:" + fullp, pkgs)
+
+        d.appendVar("RRECOMMENDS:" + fullp, " ${MLPREFIX}mesa-megadriver" + suffix)
+
+        # For -dev, the first element is both the Debian and original name
+        fullp = mlprefix + p[1] + "-mesa-dev" + suffix
+        pkgs = " " + mlprefix + p[1] + "-dev" + suffix
+        d.setVar("DEBIAN_NOAUTONAME:" + fullp, "1")
+        d.appendVar("RREPLACES:" + fullp, pkgs)
+        d.appendVar("RPROVIDES:" + fullp, pkgs)
+        d.appendVar("RCONFLICTS:" + fullp, pkgs)
+}
+
+python mesa_populate_packages() {
+    pkgs = ['mesa', 'mesa-dev', 'mesa-dbg']
+    for pkg in pkgs:
+        d.setVar("RPROVIDES:%s" % pkg, pkg.replace("mesa", "mesa-dri", 1))
+        d.setVar("RCONFLICTS:%s" % pkg, pkg.replace("mesa", "mesa-dri", 1))
+        d.setVar("RREPLACES:%s" % pkg, pkg.replace("mesa", "mesa-dri", 1))
+
+    import re
+    dri_drivers_root = oe.path.join(d.getVar('PKGD'), d.getVar('libdir'), "dri")
+    if os.path.isdir(dri_drivers_root):
+        dri_pkgs = sorted(os.listdir(dri_drivers_root))
+        lib_name = d.expand("${MLPREFIX}mesa-megadriver")
+        for p in dri_pkgs:
+            m = re.match(r'^(.*)_dri\.so$', p)
+            if m:
+                pkg_name = " ${MLPREFIX}mesa-driver-%s" % legitimize_package_name(m.group(1))
+                d.appendVar("RPROVIDES:%s" % lib_name, pkg_name)
+                d.appendVar("RCONFLICTS:%s" % lib_name, pkg_name)
+                d.appendVar("RREPLACES:%s" % lib_name, pkg_name)
+
+    pipe_drivers_root = os.path.join(d.getVar('libdir'), "gallium-pipe")
+    do_split_packages(d, pipe_drivers_root, r'^pipe_(.*)\.so$', 'mesa-driver-pipe-%s', 'Mesa %s pipe driver', extra_depends='')
+}
+
+PACKAGESPLITFUNCS:prepend = "mesa_populate_packages "
+
+PACKAGES_DYNAMIC += "^mesa-driver-.*"
+PACKAGES_DYNAMIC:class-native = "^mesa-driver-.*-native"
+
+FILES:mesa-megadriver = "${libdir}/dri/* ${datadir}/drirc.d"
+FILES:mesa-vulkan-drivers = "${libdir}/libvulkan_*.so ${datadir}/vulkan"
+FILES:${PN}-vdpau-drivers = "${libdir}/vdpau/*.so.*"
+FILES:libegl-mesa = "${libdir}/libEGL.so.*"
+FILES:libgbm = "${libdir}/libgbm.so.*"
+FILES:libgles1-mesa = "${libdir}/libGLESv1*.so.*"
+FILES:libgles2-mesa = "${libdir}/libGLESv2.so.*"
+FILES:libgl-mesa = "${libdir}/libGL.so.*"
+FILES:libopencl-mesa = "${libdir}/libMesaOpenCL.so.* ${sysconfdir}/OpenCL/vendors/mesa.icd"
+FILES:libglapi = "${libdir}/libglapi.so.*"
+FILES:libosmesa = "${libdir}/libOSMesa.so.*"
+FILES:libxatracker = "${libdir}/libxatracker.so.*"
+
+FILES:${PN}-dev = "${libdir}/pkgconfig/dri.pc ${includedir}/vulkan ${libdir}/vdpau/*.so"
+FILES:libegl-mesa-dev = "${libdir}/libEGL.* ${includedir}/EGL ${includedir}/KHR ${libdir}/pkgconfig/egl.pc"
+FILES:libgbm-dev = "${libdir}/libgbm.* ${libdir}/pkgconfig/gbm.pc ${includedir}/gbm.h"
+FILES:libgl-mesa-dev = "${libdir}/libGL.* ${includedir}/GL ${libdir}/pkgconfig/gl.pc"
+FILES:libglapi-dev = "${libdir}/libglapi.*"
+FILES:libgles1-mesa-dev = "${libdir}/libGLESv1*.* ${includedir}/GLES ${libdir}/pkgconfig/glesv1*.pc"
+FILES:libgles2-mesa-dev = "${libdir}/libGLESv2.* ${includedir}/GLES2 ${libdir}/pkgconfig/glesv2.pc"
+FILES:libgles3-mesa-dev = "${includedir}/GLES3"
+FILES:libopencl-mesa-dev = "${libdir}/libMesaOpenCL.so"
+FILES:libosmesa-dev = "${libdir}/libOSMesa.* ${includedir}/GL/osmesa.h ${libdir}/pkgconfig/osmesa.pc"
+FILES:libxatracker-dev = "${libdir}/libxatracker.so ${libdir}/libxatracker.la \
+                          ${includedir}/xa_tracker.h ${includedir}/xa_composite.h ${includedir}/xa_context.h \
+                          ${libdir}/pkgconfig/xatracker.pc"
+
+# Fix upgrade path from mesa to mesa-megadriver
+RREPLACES:mesa-megadriver = "mesa"
+RCONFLICTS:mesa-megadriver = "mesa"
+RPROVIDES:mesa-megadriver = "mesa"
-- 
2.34.1


