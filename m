Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D49FC38159
	for <webhook@archiver.kernel.org>; Thu, 19 Jan 2023 01:03:37 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.34994.1674090215852198947
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 18 Jan 2023 17:03:36 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9759A40C52
	for <meta-ti@lists.yoctoproject.org>; Thu, 19 Jan 2023 01:03:34 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OJ3I3h5fLcSS for <meta-ti@lists.yoctoproject.org>;
	Thu, 19 Jan 2023 01:03:34 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 826A240C2B
	for <meta-ti@lists.yoctoproject.org>; Thu, 19 Jan 2023 01:03:34 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 2FCB61636FE
	for <meta-ti@lists.yoctoproject.org>; Wed, 18 Jan 2023 20:03:15 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [PATCH] meta-ti-bsp: Graphics recipe overhaul
Date: Thu, 19 Jan 2023 01:03:33 +0000
Message-Id: <20230119010333.3414485-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 19 Jan 2023 01:03:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15590

From: Randolph Sapp <rs@ti.com>

Individually package rogue graphics components to prevent conflicts with
other recipes.

The package ti-img-rogue-umlibs will now distribute the window system
agnostic components of the DDK. This being the IMG's implementations of
OpenGLES, OpenCL, and Vulkan in binary format and the device firmware.
These are the only components that cannot be open source currently.

The mesa component is currently piggybacking off the default mesa
package. It's not elegant, but it reflects the implementation well and
allows users to config mesa as needed.

This all hinges off of the new rogue-gpu machine feature.

Signed-off-by: Randolph Sapp <rs@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denis@denix.org>
---
 meta-ti-bsp/conf/machine/include/am62xx.inc   |  8 +--
 meta-ti-bsp/conf/machine/include/j721e.inc    |  8 +--
 meta-ti-bsp/conf/machine/include/j721s2.inc   |  8 +--
 ...-OpenEmbedded-nodistro-internal-aarc.patch | 29 ---------
 ...bb =3D> ti-img-rogue-driver_1.18.6276027.bb} | 12 ++--
 ...bb =3D> ti-img-rogue-umlibs_1.18.6276027.bb} | 63 +++++--------------
 .../recipes-graphics/mesa/mesa_%.bbappend     |  2 +
 .../recipes-graphics/mesa/rogue-mesa.inc      | 29 +++++++++
 8 files changed, 54 insertions(+), 105 deletions(-)
 delete mode 100644 meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-=
driver/0001-compiler-support-OpenEmbedded-nodistro-internal-aarc.patch
 rename meta-ti-bsp/recipes-bsp/powervr-drivers/{ti-img-rogue-driver_1.15=
.6133109.bb =3D> ti-img-rogue-driver_1.18.6276027.bb} (77%)
 rename meta-ti-bsp/recipes-graphics/libgles/{ti-img-rogue-umlibs_1.15.61=
33109.bb =3D> ti-img-rogue-umlibs_1.18.6276027.bb} (24%)
 create mode 100644 meta-ti-bsp/recipes-graphics/mesa/mesa_%.bbappend
 create mode 100644 meta-ti-bsp/recipes-graphics/mesa/rogue-mesa.inc

diff --git a/meta-ti-bsp/conf/machine/include/am62xx.inc b/meta-ti-bsp/co=
nf/machine/include/am62xx.inc
index 411e5265..8635a630 100644
--- a/meta-ti-bsp/conf/machine/include/am62xx.inc
+++ b/meta-ti-bsp/conf/machine/include/am62xx.inc
@@ -1,17 +1,11 @@
 require conf/machine/include/k3.inc
 SOC_FAMILY:append =3D ":am62xx"
=20
-MACHINE_FEATURES +=3D "screen touchscreen gpu"
+MACHINE_FEATURES +=3D "screen touchscreen gpu rogue-gpu"
=20
 SERIAL_CONSOLES =3D "115200;ttyS2"
 SERIAL_CONSOLES_CHECK =3D "${SERIAL_CONSOLES}"
=20
-PREFERRED_PROVIDER_virtual/egl ?=3D "ti-img-rogue-umlibs"
-PREFERRED_PROVIDER_virtual/libgles1 ?=3D "ti-img-rogue-umlibs"
-PREFERRED_PROVIDER_virtual/libgles2 ?=3D "ti-img-rogue-umlibs"
-PREFERRED_PROVIDER_virtual/libgbm ?=3D "ti-img-rogue-umlibs"
-PREFERRED_PROVIDER_virtual/gpudriver ?=3D "ti-img-rogue-driver"
-
 TFA_BOARD =3D "lite"
 TFA_K3_SYSTEM_SUSPEND =3D "1"
=20
diff --git a/meta-ti-bsp/conf/machine/include/j721e.inc b/meta-ti-bsp/con=
f/machine/include/j721e.inc
index 6322fe46..e71782a7 100644
--- a/meta-ti-bsp/conf/machine/include/j721e.inc
+++ b/meta-ti-bsp/conf/machine/include/j721e.inc
@@ -1,13 +1,7 @@
 require conf/machine/include/k3.inc
 SOC_FAMILY:append =3D ":j721e"
=20
-MACHINE_FEATURES +=3D "gpu"
-
-PREFERRED_PROVIDER_virtual/egl ?=3D "ti-img-rogue-umlibs"
-PREFERRED_PROVIDER_virtual/libgles1 ?=3D "ti-img-rogue-umlibs"
-PREFERRED_PROVIDER_virtual/libgles2 ?=3D "ti-img-rogue-umlibs"
-PREFERRED_PROVIDER_virtual/libgbm ?=3D "ti-img-rogue-umlibs"
-PREFERRED_PROVIDER_virtual/gpudriver ?=3D "ti-img-rogue-driver"
+MACHINE_FEATURES +=3D "gpu rogue-gpu"
=20
 # On J721e the file tiboot3.bin comes from the bootloader not ti-sci-fw
 do_image_wic[mcdepends] +=3D "mc::k3r5:virtual/bootloader:do_deploy"
diff --git a/meta-ti-bsp/conf/machine/include/j721s2.inc b/meta-ti-bsp/co=
nf/machine/include/j721s2.inc
index fc6493b8..15f2a506 100644
--- a/meta-ti-bsp/conf/machine/include/j721s2.inc
+++ b/meta-ti-bsp/conf/machine/include/j721s2.inc
@@ -1,13 +1,7 @@
 require conf/machine/include/k3.inc
 SOC_FAMILY:append =3D ":j721s2"
=20
-MACHINE_FEATURES +=3D "gpu"
-
-PREFERRED_PROVIDER_virtual/egl ?=3D "ti-img-rogue-umlibs"
-PREFERRED_PROVIDER_virtual/libgles1 ?=3D "ti-img-rogue-umlibs"
-PREFERRED_PROVIDER_virtual/libgles2 ?=3D "ti-img-rogue-umlibs"
-PREFERRED_PROVIDER_virtual/libgbm ?=3D "ti-img-rogue-umlibs"
-PREFERRED_PROVIDER_virtual/gpudriver ?=3D "ti-img-rogue-driver"
+MACHINE_FEATURES +=3D "gpu rogue-gpu"
=20
 TFA_BOARD =3D "generic"
=20
diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver/=
0001-compiler-support-OpenEmbedded-nodistro-internal-aarc.patch b/meta-ti=
-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver/0001-compiler-suppor=
t-OpenEmbedded-nodistro-internal-aarc.patch
deleted file mode 100644
index f021cc39..00000000
--- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver/0001-co=
mpiler-support-OpenEmbedded-nodistro-internal-aarc.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 80d32fee3d768abbd77cce77ea9a7574651460a9 Mon Sep 17 00:00:00 2001
-From: Denys Dmytriyenko <denis@denix.org>
-Date: Wed, 7 Jul 2021 13:11:56 -0400
-Subject: [PATCH] compiler: support OpenEmbedded "nodistro" internal aarc=
h64
- toolchain
-
-Upstream-Status: Pending
-
-Signed-off-by: Denys Dmytriyenko <denis@denix.org>
----
- build/linux/config/compiler.mk | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/build/linux/config/compiler.mk b/build/linux/config/compile=
r.mk
-index 53a0bef..d788579 100644
---- a/build/linux/config/compiler.mk
-+++ b/build/linux/config/compiler.mk
-@@ -65,7 +65,7 @@ define calculate-compiler-preferred-target
-    ifneq ($$(filter i386-% i486-% i586-% i686-%,$$($(1)_compiler_prefer=
red_target)),)
-     $(1)_compiler_preferred_target :=3D i386-linux-gnu
-    endif
--   ifneq ($$(filter aarch64-poky-linux,$$($(1)_compiler_preferred_targe=
t)),)
-+   ifneq ($$(filter aarch64-oe-linux aarch64-poky-linux,$$($(1)_compile=
r_preferred_target)),)
-     $(1)_compiler_preferred_target :=3D aarch64-linux-gnu
-    endif
-    ifneq ($$(filter armv7a-cros-linux-gnueabi armv7l-tizen-linux-gnueab=
i,$$($(1)_compiler_preferred_target)),)
---=20
-2.7.4
-
diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_=
1.15.6133109.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-dr=
iver_1.18.6276027.bb
similarity index 77%
rename from meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1=
.15.6133109.bb
rename to meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.1=
8.6276027.bb
index b4d19195..45df7c4b 100644
--- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.61=
33109.bb
+++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.18.62=
76027.bb
@@ -11,29 +11,27 @@ MACHINE_KERNEL_PR:append =3D "b"
 PR =3D "${MACHINE_KERNEL_PR}"
=20
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
+
 COMPATIBLE_MACHINE =3D "j721e|j721s2|j784s4|am62xx"
=20
 DEPENDS =3D "virtual/kernel"
=20
 PROVIDES =3D "virtual/gpudriver"
=20
-BRANCH =3D "linuxws/dunfell/k5.10/${PV}_unified_fw_pagesize"
+BRANCH =3D "linuxws/kirkstone/k5.10/${PV}"
=20
-SRC_URI =3D " \
-    git://git.ti.com/git/graphics/ti-img-rogue-driver.git;protocol=3Dhtt=
ps;branch=3D${BRANCH} \
-    file://0001-compiler-support-OpenEmbedded-nodistro-internal-aarc.pat=
ch \
-"
+SRC_URI =3D "git://git.ti.com/git/graphics/ti-img-rogue-driver.git;proto=
col=3Dhttps;branch=3D${BRANCH}"
=20
 S =3D "${WORKDIR}/git"
=20
-SRCREV =3D "c901804e8221d477983a6f7224a9cdc6e832f050"
+SRCREV =3D "d575e4f64c95a3534e10e85da15bd303febf133f"
=20
 TARGET_PRODUCT:j721e =3D "j721e_linux"
 TARGET_PRODUCT:j721s2 =3D "j721s2_linux"
 TARGET_PRODUCT:j784s4 =3D "j784s4_linux"
 TARGET_PRODUCT:am62xx =3D "am62_linux"
 PVR_BUILD =3D "release"
-PVR_WS =3D "wayland"
+PVR_WS =3D "lws-generic"
=20
 EXTRA_OEMAKE +=3D 'KERNELDIR=3D"${STAGING_KERNEL_DIR}" BUILD=3D${PVR_BUI=
LD} PVR_BUILD_DIR=3D${TARGET_PRODUCT} WINDOW_SYSTEM=3D${PVR_WS}'
=20
diff --git a/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_1.1=
5.6133109.bb b/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_1=
.18.6276027.bb
similarity index 24%
rename from meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_1.15=
.6133109.bb
rename to meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_1.18.6=
276027.bb
index a665c614..0375b442 100644
--- a/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_1.15.61331=
09.bb
+++ b/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_1.18.62760=
27.bb
@@ -1,9 +1,9 @@
 DESCRIPTION =3D "Userspace libraries for PowerVR Rogue GPU on TI SoCs"
 HOMEPAGE =3D "http://git.ti.com/graphics/ti-img-rogue-umlibs"
 LICENSE =3D "TI-TFL"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D7232b98c1c58f99e3baa03de5207e=
76f"
+LIC_FILES_CHKSUM =3D "file://${WORKDIR}/git/LICENSE;md5=3D7232b98c1c58f9=
9e3baa03de5207e76f"
=20
-inherit features_check
+inherit features_check bin_package
=20
 REQUIRED_MACHINE_FEATURES =3D "gpu"
=20
@@ -12,60 +12,27 @@ COMPATIBLE_MACHINE =3D "j721e|j721s2|j784s4|am62xx"
=20
 PR =3D "r2"
=20
-BRANCH =3D "linuxws/dunfell/k5.10/${PV}_unified_fw_pagesize"
-
+BRANCH =3D "linuxws/kirkstone/k5.10/${PV}"
 SRC_URI =3D "git://git.ti.com/git/graphics/ti-img-rogue-umlibs.git;proto=
col=3Dhttps;branch=3D${BRANCH}"
-SRCREV =3D "5977e82b96028f783d39c7219f016c1faf8dc5f5"
+SRCREV =3D "51e598919641d51156a631efa5447124a3c0f543"
+S =3D "${WORKDIR}/git/targetfs/${TARGET_PRODUCT}/${PVR_WS}/${PVR_BUILD}"
=20
 TARGET_PRODUCT:j721e =3D "j721e_linux"
 TARGET_PRODUCT:j721s2 =3D "j721s2_linux"
 TARGET_PRODUCT:j784s4 =3D "j784s4_linux"
 TARGET_PRODUCT:am62xx =3D "am62_linux"
-PVR_BUILD ?=3D "release"
-PVR_WS =3D "wayland"
-
-INITSCRIPT_NAME =3D "rc.pvr"
-INITSCRIPT_PARAMS =3D "defaults 8"
-
-inherit update-rc.d
-
-PROVIDES +=3D "virtual/egl virtual/libgles1 virtual/libgles2 virtual/lib=
gbm"
-
-DEPENDS +=3D "libdrm wayland expat"
-RDEPENDS:${PN} +=3D "bash"
-RDEPENDS:${PN} +=3D "wayland expat"
-
-RPROVIDES:${PN} =3D "libegl libgles1 libgles2 libgbm"
-RPROVIDES:${PN}-dev =3D "libegl-dev libgles1-dev libgles2-dev libgbm-dev=
"
-RPROVIDES:${PN}-dbg =3D "libegl-dbg libgles1-dbg libgles2-dbg"
+PVR_BUILD =3D "release"
+PVR_WS =3D "lws-generic"
=20
-RREPLACES:${PN} =3D "libegl libgles1 liblges2 libgbm"
-RREPLACES:${PN}-dev =3D "libegl-dev libgles1-dev libgles2-dev libgbm-dev=
"
-RREPLACES:${PN}-dbg =3D "libegl-dbg libgles1-dbg libgles2-dbg"
+RDEPENDS:${PN} +=3D "mesa-megadriver libdrm ti-img-rogue-driver"
=20
-RCONFLICTS:${PN} =3D "libegl libgles1 libgles2 libgbm"
-RCONFLICTS:${PN}-dev =3D "libegl-dev libgles1-dev libgles2-dev libgbm-de=
v"
-RCONFLICTS:${PN}-dbg =3D "libegl-dbg libgles1-dbg libgles2-dbg"
-
-RRECOMMENDS:${PN} +=3D "ti-img-rogue-driver"
-
-S =3D "${WORKDIR}/git"
-
-do_install () {
-    oe_runmake install DESTDIR=3D${D} TARGET_PRODUCT=3D${TARGET_PRODUCT}=
 BUILD=3D${PVR_BUILD} WINDOW_SYSTEM=3D${PVR_WS}
-    chown -R root:root ${D}
+do_install:append() {
+    rm -rf "${D}/etc/init.d"
 }
=20
-FILES:${PN} +=3D " ${nonarch_base_libdir}/firmware/"
-FILES:${PN} +=3D " ${datadir}/"
-
-PACKAGES =3D+ "${PN}-plugins"
-FILES:${PN}-plugins =3D "${libdir}/libGLESv2.so ${libdir}/libGLESv1_CM.s=
o ${libdir}/libEGL.so ${libdir}/dri/pvr_dri.so"
-RDEPENDS:${PN} +=3D "${PN}-plugins"
-
-ALLOW_EMPTY:${PN}-plugins =3D "1"
-
-INSANE_SKIP:${PN} +=3D "ldflags arch already-stripped"
-INSANE_SKIP:${PN}-plugins =3D "dev-so"
+PACKAGES =3D "${PN}-tools ${PN}"
+FILES:${PN}-tools =3D "${bindir}/"
+RDEPENDS:${PN}-tools =3D "python3-core"
+RRECOMMENDS:${PN} +=3D "${PN}-tools"
=20
-CLEANBROKEN =3D "1"
+INSANE_SKIP:${PN} +=3D "ldflags arch already-stripped dev-so"
diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa_%.bbappend b/meta-ti-=
bsp/recipes-graphics/mesa/mesa_%.bbappend
new file mode 100644
index 00000000..c367cb7e
--- /dev/null
+++ b/meta-ti-bsp/recipes-graphics/mesa/mesa_%.bbappend
@@ -0,0 +1,2 @@
+# Apply rogue driver overrides if applicable
+require ${@bb.utils.contains('MACHINE_FEATURES', 'rogue-gpu', 'rogue-mes=
a.inc', '', d)}
diff --git a/meta-ti-bsp/recipes-graphics/mesa/rogue-mesa.inc b/meta-ti-b=
sp/recipes-graphics/mesa/rogue-mesa.inc
new file mode 100644
index 00000000..c5002fa7
--- /dev/null
+++ b/meta-ti-bsp/recipes-graphics/mesa/rogue-mesa.inc
@@ -0,0 +1,29 @@
+# Rogue graphics related mesa overrides
+
+BRANCH =3D "rogue/kirkstone/pvr-1.18/22.0"
+
+SRC_URI =3D "git://gitlab.freedesktop.org/StaticRocket/mesa.git;protocol=
=3Dhttps;branch=3D${BRANCH} \
+           file://0001-meson.build-check-for-all-linux-host_os-combinati=
ons.patch \
+           file://0002-meson.build-make-TLS-ELF-optional.patch \
+           file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patc=
h \
+           file://0001-futex.h-Define-__NR_futex-if-it-does-not-exist.pa=
tch \
+           file://0001-util-format-Check-for-NEON-before-using-it.patch =
\
+           file://0001-Revert-egl-wayland-deprecate-drm_handle_format-an=
d-d.patch \
+           "
+
+S =3D "${WORKDIR}/git"
+
+SRCREV =3D "fddf5106f04de2bd35892d30e5574c0b2881edd9"
+
+PV:append =3D "+rogue"
+
+GALLIUMDRIVERS:append =3D ",pvr"
+
+EXTRA_OEMESON:append =3D " -Dgallium-pvr-alias=3Dtidss"
+
+do_install:append () {
+    # remove pvr custom pkgconfig
+    rm -rf ${D}${datadir}/pkgconfig
+}
+
+RRECOMMENDS:mesa-megadriver:class-target +=3D "ti-img-rogue-driver ti-im=
g-rogue-umlibs"
--=20
2.25.1


