Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A2C4C6FA9D
	for <webhook@archiver.kernel.org>; Fri, 24 Feb 2023 10:12:29 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.14447.1677233542667551737
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 24 Feb 2023 02:12:23 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id BAB7340C46
	for <meta-ti@lists.yoctoproject.org>; Fri, 24 Feb 2023 10:12:21 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FqD6JqmRt6gA for <meta-ti@lists.yoctoproject.org>;
	Fri, 24 Feb 2023 10:12:21 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A1D6940C8C
	for <meta-ti@lists.yoctoproject.org>; Fri, 24 Feb 2023 10:12:21 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 678C3163765
	for <meta-ti@lists.yoctoproject.org>; Fri, 24 Feb 2023 05:11:54 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master/kirkstone][PATCH v8 2/6] meta-ti-bsp: graphics: Resolve dependency chain
Date: Fri, 24 Feb 2023 10:12:15 +0000
Message-Id: <20230224101219.4130589-3-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230224101219.4130589-1-denis@denix.org>
References: <20230224101219.4130589-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 24 Feb 2023 10:12:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15948

From: Randolph Sapp <rs@ti.com>

Patched mesa will now be configured based on what virtual/gpudriver
preferred provider is selected. The gpu drivers will now runtime
recommend the associated UM components.

Signed-off-by: Randolph Sapp <rs@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
v8 changes:
* generate proper diff of ti-img-rogue-umlibs upgrade from 1.15 to 1.18
* in pvr-mesa.inc add FILESEXTRAPATHS to locate local patches
* set LIC_FILES_CHKSUM corresponding to 22.0
* clear out video-codecs PACKAGECONFIG non-existent in 22.0
* fixup RRECOMMENDS nested overrides order
* mark pvr-mesa machine-specific and set correct PV

 ...bb =3D> ti-img-rogue-driver_1.18.6276027.bb} | 20 +++---
 .../ti-sgx-ddk-km_1.17.4948957.bb             |  8 +--
 ...bb =3D> ti-img-rogue-umlibs_1.18.6276027.bb} | 68 +++++--------------
 .../libgles/ti-sgx-ddk-um_1.17.4948957.bb     | 30 +-------
 .../mesa/mesa-gl_22.%.bbappend                |  1 +
 .../recipes-graphics/mesa/mesa_22.%.bbappend  |  1 +
 .../recipes-graphics/mesa/pvr-mesa.inc        | 48 +++++++++++++
 7 files changed, 84 insertions(+), 92 deletions(-)
 rename meta-ti-bsp/recipes-bsp/powervr-drivers/{ti-img-rogue-driver_1.15=
.6133109.bb =3D> ti-img-rogue-driver_1.18.6276027.bb} (72%)
 rename meta-ti-bsp/recipes-graphics/libgles/{ti-img-rogue-umlibs_1.15.61=
33109.bb =3D> ti-img-rogue-umlibs_1.18.6276027.bb} (22%)
 create mode 100644 meta-ti-bsp/recipes-graphics/mesa/mesa-gl_22.%.bbappe=
nd
 create mode 100644 meta-ti-bsp/recipes-graphics/mesa/mesa_22.%.bbappend
 create mode 100644 meta-ti-bsp/recipes-graphics/mesa/pvr-mesa.inc

diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_=
1.15.6133109.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-dr=
iver_1.18.6276027.bb
similarity index 72%
rename from meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1=
.15.6133109.bb
rename to meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.1=
8.6276027.bb
index b4d19195..96fb7484 100644
--- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.61=
33109.bb
+++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.18.62=
76027.bb
@@ -3,40 +3,38 @@ HOMEPAGE =3D "http://git.ti.com/graphics/ti-img-rogue-d=
river"
 LICENSE =3D "MIT | GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://README;beginline=3D14;endline=3D19;md5=3D04=
03c7dea01a2b8232261e805325fac2"
=20
-inherit module features_check
+inherit module
=20
-REQUIRED_MACHINE_FEATURES =3D "gpu"
+PROVIDES =3D "virtual/gpudriver"
=20
 MACHINE_KERNEL_PR:append =3D "b"
 PR =3D "${MACHINE_KERNEL_PR}"
=20
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
+
 COMPATIBLE_MACHINE =3D "j721e|j721s2|j784s4|am62xx"
=20
 DEPENDS =3D "virtual/kernel"
=20
-PROVIDES =3D "virtual/gpudriver"
+BRANCH =3D "linuxws/kirkstone/k5.10/${PV}"
=20
-BRANCH =3D "linuxws/dunfell/k5.10/${PV}_unified_fw_pagesize"
-
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
 do_install() {
     make -C ${STAGING_KERNEL_DIR} M=3D${B}/binary_${TARGET_PRODUCT}_${PV=
R_WS}_${PVR_BUILD}/target_aarch64/kbuild INSTALL_MOD_PATH=3D${D}${root_pr=
efix} PREFIX=3D${STAGING_DIR_HOST} modules_install
 }
+
+RRECOMMENDS:${PN} +=3D "ti-img-rogue-umlibs"
diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4=
948957.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.49=
48957.bb
index c22e3096..13b8757c 100644
--- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.=
bb
+++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.=
bb
@@ -3,9 +3,9 @@ HOMEPAGE =3D "https://git.ti.com/graphics/omap5-sgx-ddk-l=
inux"
 LICENSE =3D "MIT | GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://eurasia_km/README;beginline=3D13;endline=3D=
22;md5=3D74506d9b8e5edbce66c2747c50fcef12"
=20
-inherit module features_check
+inherit module
=20
-REQUIRED_MACHINE_FEATURES =3D "gpu"
+PROVIDES =3D "virtual/gpudriver"
=20
 COMPATIBLE_MACHINE =3D "ti33x|ti43x|omap-a15|k3"
=20
@@ -16,8 +16,6 @@ PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
 DEPENDS =3D "virtual/kernel"
=20
-PROVIDES =3D "virtual/gpudriver"
-
 BRANCH =3D "ti-img-sgx/${PV}/k5.10"
=20
 SRC_URI =3D "git://git.ti.com/git/graphics/omap5-sgx-ddk-linux.git;proto=
col=3Dhttps;branch=3D${BRANCH}"
@@ -44,3 +42,5 @@ do_install() {
 do_install:k3() {
     make -C ${STAGING_KERNEL_DIR} M=3D${B}/eurasia_km/eurasiacon/binary_=
omap_linux_nulldrmws_release/target_aarch64/kbuild INSTALL_MOD_PATH=3D${D=
}${root_prefix} PREFIX=3D${STAGING_DIR_HOST} modules_install
 }
+
+RRECOMMENDS:${PN} +=3D "ti-sgx-ddk-um"
diff --git a/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_1.1=
5.6133109.bb b/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_1=
.18.6276027.bb
similarity index 22%
rename from meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_1.15=
.6133109.bb
rename to meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_1.18.6=
276027.bb
index a665c614..924e46ba 100644
--- a/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_1.15.61331=
09.bb
+++ b/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_1.18.62760=
27.bb
@@ -1,71 +1,39 @@
 DESCRIPTION =3D "Userspace libraries for PowerVR Rogue GPU on TI SoCs"
 HOMEPAGE =3D "http://git.ti.com/graphics/ti-img-rogue-umlibs"
 LICENSE =3D "TI-TFL"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D7232b98c1c58f99e3baa03de5207e=
76f"
+LIC_FILES_CHKSUM =3D "file://${WORKDIR}/git/LICENSE;md5=3D7232b98c1c58f9=
9e3baa03de5207e76f"
=20
-inherit features_check
-
-REQUIRED_MACHINE_FEATURES =3D "gpu"
+inherit bin_package
=20
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
 COMPATIBLE_MACHINE =3D "j721e|j721s2|j784s4|am62xx"
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
+    rm -rf "${D}/usr/lib/libvulkan.so"
+    rm -rf "${D}/usr/lib/libvulkan.so.0"
+    rm -rf "${D}/usr/lib/libvulkan.so.1"
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
diff --git a/meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948=
957.bb b/meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.=
bb
index 1c479ee0..f1fbed15 100644
--- a/meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
+++ b/meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
@@ -3,22 +3,18 @@ HOMEPAGE =3D "https://git.ti.com/graphics/omap5-sgx-ddk=
-um-linux"
 LICENSE =3D "TI-TSPA"
 LIC_FILES_CHKSUM =3D "file://TI-Linux-Graphics-DDK-UM-Manifest.doc;md5=3D=
b17390502bc89535c86cfbbae961a2a8"
=20
-inherit features_check
-
-REQUIRED_MACHINE_FEATURES =3D "gpu"
-
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
 COMPATIBLE_MACHINE =3D "ti33x|ti43x|omap-a15|am65xx"
=20
 PR =3D "r38"
=20
-BRANCH =3D "ti-img-sgx/kirkstone/${PV}"
+BRANCH =3D "ti-img-sgx/kirkstone-mesa/${PV}"
=20
 SRC_URI =3D " \
     git://git.ti.com/git/graphics/omap5-sgx-ddk-um-linux.git;protocol=3D=
https;branch=3D${BRANCH} \
     file://pvrsrvkm.rules \
 "
-SRCREV =3D "905809029b877fea42e91b9738825a6294ff1775"
+SRCREV =3D "bbae7217051341f515515ec190e165119102f45a"
=20
 TARGET_PRODUCT:ti33x =3D "ti335x"
 TARGET_PRODUCT:ti43x =3D "ti437x"
@@ -33,26 +29,7 @@ inherit update-rc.d
 PACKAGECONFIG ??=3D "udev"
 PACKAGECONFIG[udev] =3D ",,,udev"
=20
-PROVIDES +=3D "virtual/egl virtual/libgles1 virtual/libgles2 virtual/lib=
gbm"
-
-DEPENDS +=3D "libdrm udev wayland wayland-protocols libffi expat"
-DEPENDS:append:libc-musl =3D " gcompat"
-RDEPENDS:${PN} +=3D "libdrm libdrm-omap udev wayland wayland-protocols l=
ibffi expat"
-
-RPROVIDES:${PN} =3D "libegl libgles1 libgles2 libgbm"
-RPROVIDES:${PN}-dev =3D "libegl-dev libgles1-dev libgles2-dev libgbm-dev=
"
-RPROVIDES:${PN}-dbg =3D "libegl-dbg libgles1-dbg libgles2-dbg libgbm-dbg=
"
-
-RREPLACES:${PN} =3D "libegl libgles1 libgles2 libgbm"
-RREPLACES:${PN}-dev =3D "libegl-dev libgles1-dev libgles2-dev libgbm-dev=
"
-RREPLACES:${PN}-dbg =3D "libegl-dbg libgles1-dbg libgles2-dbg libgbm-dbg=
"
-
-RCONFLICTS:${PN} =3D "libegl libgles1 libgles2 libgbm"
-RCONFLICTS:${PN}-dev =3D "libegl-dev libgles1-dev libgles2-dev libgbm-de=
v"
-RCONFLICTS:${PN}-dbg =3D "libegl-dbg libgles1-dbg libgles2-dbg libgbm-db=
g"
-
-# The actual SONAME is libGLESv2.so.2, so need to explicitly specify RPR=
OVIDES for .so.1 here
-RPROVIDES:${PN} +=3D "libGLESv2.so.1"
+RDEPENDS:${PN} +=3D "libdrm libdrm-omap"
=20
 RRECOMMENDS:${PN} +=3D "ti-sgx-ddk-km"
=20
@@ -60,7 +37,6 @@ S =3D "${WORKDIR}/git"
=20
 do_install () {
     oe_runmake install DESTDIR=3D${D} TARGET_PRODUCT=3D${TARGET_PRODUCT}
-    ln -sf libGLESv2.so.2 ${D}${libdir}/libGLESv2.so.1
=20
     without_sysvinit=3D${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit=
', 'false', 'true', d)}
     with_udev=3D${@bb.utils.contains('PACKAGECONFIG', 'udev', 'true', 'f=
alse', d)}
diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-gl_22.%.bbappend b/me=
ta-ti-bsp/recipes-graphics/mesa/mesa-gl_22.%.bbappend
new file mode 100644
index 00000000..912e9e9d
--- /dev/null
+++ b/meta-ti-bsp/recipes-graphics/mesa/mesa-gl_22.%.bbappend
@@ -0,0 +1 @@
+require ${@bb.utils.contains_any('PREFERRED_PROVIDER_virtual/gpudriver',=
 'ti-img-rogue-driver ti-sgx-ddk-km', 'pvr-mesa.inc', '', d)}
diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa_22.%.bbappend b/meta-=
ti-bsp/recipes-graphics/mesa/mesa_22.%.bbappend
new file mode 100644
index 00000000..912e9e9d
--- /dev/null
+++ b/meta-ti-bsp/recipes-graphics/mesa/mesa_22.%.bbappend
@@ -0,0 +1 @@
+require ${@bb.utils.contains_any('PREFERRED_PROVIDER_virtual/gpudriver',=
 'ti-img-rogue-driver ti-sgx-ddk-km', 'pvr-mesa.inc', '', d)}
diff --git a/meta-ti-bsp/recipes-graphics/mesa/pvr-mesa.inc b/meta-ti-bsp=
/recipes-graphics/mesa/pvr-mesa.inc
new file mode 100644
index 00000000..96c484a7
--- /dev/null
+++ b/meta-ti-bsp/recipes-graphics/mesa/pvr-mesa.inc
@@ -0,0 +1,48 @@
+# PowerVR Graphics require several patches that have not made their way
+# upstream yet. This allows us to build the shims we need without comple=
tely
+# clobbering mesa.
+
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files:"
+
+LIC_FILES_CHKSUM =3D "file://docs/license.rst;md5=3D9a383ee9f65a4e939d66=
30e9b067ff58"
+
+BRANCH =3D "powervr/kirkstone/22.0"
+
+SRC_URI =3D " \
+    git://gitlab.freedesktop.org/StaticRocket/mesa.git;protocol=3Dhttps;=
branch=3D${BRANCH} \
+    file://0001-meson.build-check-for-all-linux-host_os-combinations.pat=
ch \
+    file://0002-meson.build-make-TLS-ELF-optional.patch \
+    file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
+    file://0001-futex.h-Define-__NR_futex-if-it-does-not-exist.patch \
+    file://0001-util-format-Check-for-NEON-before-using-it.patch \
+    file://0001-Revert-egl-wayland-deprecate-drm_handle_format-and-d.pat=
ch \
+"
+
+S =3D "${WORKDIR}/git"
+
+SRCREV =3D "44b82a7b6fa8a86243911b1b0d6a07b0fd8ecfba"
+
+PACKAGECONFIG:append =3D " \
+    ${@bb.utils.contains('PREFERRED_PROVIDER_virtual/gpudriver', 'ti-img=
-rogue-driver', 'pvr', '', d)} \
+    ${@bb.utils.contains('PREFERRED_PROVIDER_virtual/gpudriver', 'ti-sgx=
-ddk-km', 'sgx', '', d)} \
+"
+
+PVR_DISPLAY_CONTROLLER_ALIAS ??=3D "tidss"
+PACKAGECONFIG[pvr] =3D "-Dgallium-pvr-alias=3D${PVR_DISPLAY_CONTROLLER_A=
LIAS},"
+PACKAGECONFIG[sgx] =3D "-Dgallium-sgx-alias=3D${PVR_DISPLAY_CONTROLLER_A=
LIAS},"
+
+PACKAGECONFIG:remove =3D "video-codecs"
+PACKAGECONFIG[video-codecs] =3D ""
+
+PACKAGE_ARCH =3D "${MACHINE_ARCH}"
+PV =3D "22.0.3+pvr"
+
+GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'pvr', =
',pvr', '', d)}"
+GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'sgx', =
',sgx', '', d)}"
+
+do_install:append () {
+    # remove pvr custom pkgconfig
+    rm -rf ${D}${datadir}/pkgconfig
+}
+
+RRECOMMENDS:mesa-megadriver:append:class-target =3D " ${@d.getVar('PREFE=
RRED_PROVIDER_virtual/gpudriver')}"
--=20
2.25.1


