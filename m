Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCF38C7EE22
	for <webhook@archiver.kernel.org>; Thu, 11 May 2023 18:41:17 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.4696.1683830468382894187
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 11 May 2023 11:41:08 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id A135440C98;
	Thu, 11 May 2023 18:41:07 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r1jfW3WiBDYN; Thu, 11 May 2023 18:41:07 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 689C340C93;
	Thu, 11 May 2023 18:41:04 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 6A272163843;
	Thu, 11 May 2023 14:40:21 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: afd@ti.com,
	rs@ti.com,
	Denys Dmytriyenko <denys@konsulko.com>
Subject: [master/kirkstone][PATCH] mesa-pvr: convert bbappend into standalone alternative provider
Date: Thu, 11 May 2023 18:40:49 +0000
Message-Id: <20230511184049.1074923-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 11 May 2023 18:41:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16516

From: Denys Dmytriyenko <denys@konsulko.com>

There are some unobvious issues with adding PVR support to Mesa
via a bbappend:

1. We need to mark mesa package as machine-specific, due to
differences in builds between SGX, Rogue and software-rendering

2. We also need to then mark mesa package as providing safe
ABIs (EGL/GLES/GBM) in order for all generic dependent packages
to not be treated as machine-specific, allowing their re-use
across different machines of the same architecture

But doing the above alters the upstream mesa package and changes
its signatures even when not building for TI platforms, which is
a Yocto Project compliance violation.

In order to resolve this issue, convert Mesa bbappend, that adds
PVR support, into its own standalone alternative provider, called
mesa-pvr and allow selecting it with PREFERRED_PROVIDER settings.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/conf/layer.conf                            |  2 +-
 meta-ti-bsp/conf/machine/beagleplay.conf               |  1 +
 meta-ti-bsp/conf/machine/include/am62xx.inc            |  1 +
 meta-ti-bsp/conf/machine/include/am65xx.inc            |  1 +
 meta-ti-bsp/conf/machine/include/j721e.inc             |  1 +
 meta-ti-bsp/conf/machine/include/j721s2.inc            |  1 +
 meta-ti-bsp/conf/machine/include/j784s4.inc            |  1 +
 meta-ti-bsp/conf/machine/include/mesa-pvr.inc          |  8 ++++++++
 meta-ti-bsp/conf/machine/include/omap-a15.inc          |  1 +
 meta-ti-bsp/conf/machine/include/ti33x.inc             |  1 +
 meta-ti-bsp/conf/machine/include/ti43x.inc             |  1 +
 .../recipes-graphics/mesa/mesa-gl_23.%.bbappend        |  1 -
 .../mesa/{pvr-mesa.inc =3D> mesa-pvr_22.3.5.bb}          | 10 ++++++----
 meta-ti-bsp/recipes-graphics/mesa/mesa_23.%.bbappend   |  1 -
 14 files changed, 24 insertions(+), 7 deletions(-)
 create mode 100644 meta-ti-bsp/conf/machine/include/mesa-pvr.inc
 delete mode 100644 meta-ti-bsp/recipes-graphics/mesa/mesa-gl_23.%.bbappe=
nd
 rename meta-ti-bsp/recipes-graphics/mesa/{pvr-mesa.inc =3D> mesa-pvr_22.=
3.5.bb} (88%)
 delete mode 100644 meta-ti-bsp/recipes-graphics/mesa/mesa_23.%.bbappend

diff --git a/meta-ti-bsp/conf/layer.conf b/meta-ti-bsp/conf/layer.conf
index 5520c7c2..bb286c2b 100644
--- a/meta-ti-bsp/conf/layer.conf
+++ b/meta-ti-bsp/conf/layer.conf
@@ -19,7 +19,7 @@ LAYERDEPENDS_meta-ti-bsp =3D " \
 "
=20
 SIGGEN_EXCLUDERECIPES_ABISAFE +=3D " \
-    mesa \
+    mesa-pvr \
 "
=20
 HOSTTOOLS_NONFATAL +=3D "truncate xxd comm"
diff --git a/meta-ti-bsp/conf/machine/beagleplay.conf b/meta-ti-bsp/conf/=
machine/beagleplay.conf
index e8d25cd9..c7b1414a 100644
--- a/meta-ti-bsp/conf/machine/beagleplay.conf
+++ b/meta-ti-bsp/conf/machine/beagleplay.conf
@@ -10,6 +10,7 @@ MACHINE_FEATURES +=3D "screen gpu"
 SERIAL_CONSOLES =3D "115200;ttyS2"
 SERIAL_CONSOLES_CHECK =3D "${SERIAL_CONSOLES}"
=20
+require conf/machine/include/mesa-pvr.inc
 PREFERRED_PROVIDER_virtual/gpudriver ?=3D "ti-img-rogue-driver"
=20
 TFA_BOARD =3D "lite"
diff --git a/meta-ti-bsp/conf/machine/include/am62xx.inc b/meta-ti-bsp/co=
nf/machine/include/am62xx.inc
index 623d90eb..c4582c13 100644
--- a/meta-ti-bsp/conf/machine/include/am62xx.inc
+++ b/meta-ti-bsp/conf/machine/include/am62xx.inc
@@ -3,6 +3,7 @@ SOC_FAMILY:append =3D ":am62xx"
=20
 MACHINE_FEATURES +=3D "screen gpu"
=20
+require conf/machine/include/mesa-pvr.inc
 PREFERRED_PROVIDER_virtual/gpudriver ?=3D "ti-img-rogue-driver"
=20
 # Default tiboot3.bin on AM62x is for HS-FS
diff --git a/meta-ti-bsp/conf/machine/include/am65xx.inc b/meta-ti-bsp/co=
nf/machine/include/am65xx.inc
index 9fe851f4..9cbce243 100644
--- a/meta-ti-bsp/conf/machine/include/am65xx.inc
+++ b/meta-ti-bsp/conf/machine/include/am65xx.inc
@@ -3,6 +3,7 @@ SOC_FAMILY:append =3D ":am65xx"
=20
 MACHINE_FEATURES +=3D "screen touchscreen gpu"
=20
+require conf/machine/include/mesa-pvr.inc
 PREFERRED_PROVIDER_virtual/gpudriver ?=3D ""
=20
 KERNEL_DEVICETREE_PREFIX =3D "ti/k3-am654"
diff --git a/meta-ti-bsp/conf/machine/include/j721e.inc b/meta-ti-bsp/con=
f/machine/include/j721e.inc
index 5e325ffe..f707cf26 100644
--- a/meta-ti-bsp/conf/machine/include/j721e.inc
+++ b/meta-ti-bsp/conf/machine/include/j721e.inc
@@ -3,6 +3,7 @@ SOC_FAMILY:append =3D ":j721e"
=20
 MACHINE_FEATURES +=3D "screen gpu"
=20
+require conf/machine/include/mesa-pvr.inc
 PREFERRED_PROVIDER_virtual/gpudriver ?=3D "ti-img-rogue-driver"
=20
 # On J721e the file tiboot3.bin comes from the bootloader not ti-sci-fw
diff --git a/meta-ti-bsp/conf/machine/include/j721s2.inc b/meta-ti-bsp/co=
nf/machine/include/j721s2.inc
index 70569a16..98cc611f 100644
--- a/meta-ti-bsp/conf/machine/include/j721s2.inc
+++ b/meta-ti-bsp/conf/machine/include/j721s2.inc
@@ -3,6 +3,7 @@ SOC_FAMILY:append =3D ":j721s2"
=20
 MACHINE_FEATURES +=3D "screen gpu"
=20
+require conf/machine/include/mesa-pvr.inc
 PREFERRED_PROVIDER_virtual/gpudriver ?=3D "ti-img-rogue-driver"
=20
 TFA_BOARD =3D "generic"
diff --git a/meta-ti-bsp/conf/machine/include/j784s4.inc b/meta-ti-bsp/co=
nf/machine/include/j784s4.inc
index d03ee4a4..de207687 100644
--- a/meta-ti-bsp/conf/machine/include/j784s4.inc
+++ b/meta-ti-bsp/conf/machine/include/j784s4.inc
@@ -3,6 +3,7 @@ SOC_FAMILY:append =3D ":j784s4"
=20
 MACHINE_FEATURES +=3D "screen gpu"
=20
+require conf/machine/include/mesa-pvr.inc
 PREFERRED_PROVIDER_virtual/gpudriver ?=3D "ti-img-rogue-driver"
=20
 TFA_BOARD =3D "j784s4"
diff --git a/meta-ti-bsp/conf/machine/include/mesa-pvr.inc b/meta-ti-bsp/=
conf/machine/include/mesa-pvr.inc
new file mode 100644
index 00000000..d5581315
--- /dev/null
+++ b/meta-ti-bsp/conf/machine/include/mesa-pvr.inc
@@ -0,0 +1,8 @@
+PREFERRED_PROVIDER_virtual/mesa ?=3D "mesa-pvr"
+PREFERRED_PROVIDER_virtual/egl ?=3D "mesa-pvr"
+PREFERRED_PROVIDER_virtual/libgles1 ?=3D "mesa-pvr"
+PREFERRED_PROVIDER_virtual/libgles2 ?=3D "mesa-pvr"
+PREFERRED_PROVIDER_virtual/libgles3 ?=3D "mesa-pvr"
+PREFERRED_PROVIDER_virtual/libgbm ?=3D "mesa-pvr"
+PREFERRED_PROVIDER_virtual/libglx ?=3D "mesa-pvr"
+PREFERRED_PROVIDER_virtual/libgl ?=3D "mesa-pvr"
diff --git a/meta-ti-bsp/conf/machine/include/omap-a15.inc b/meta-ti-bsp/=
conf/machine/include/omap-a15.inc
index 49db1cb6..700b1a11 100644
--- a/meta-ti-bsp/conf/machine/include/omap-a15.inc
+++ b/meta-ti-bsp/conf/machine/include/omap-a15.inc
@@ -12,6 +12,7 @@ PREFERRED_PROVIDER_virtual/bootloader ?=3D "u-boot-ti-s=
taging"
 PREFERRED_PROVIDER_u-boot ?=3D "u-boot-ti-staging"
=20
 # Graphics providers and variables
+require conf/machine/include/mesa-pvr.inc
 PREFERRED_PROVIDER_virtual/gpudriver ?=3D ""
 PVR_DISPLAY_CONTROLLER_ALIAS ?=3D "omapdrm"
=20
diff --git a/meta-ti-bsp/conf/machine/include/ti33x.inc b/meta-ti-bsp/con=
f/machine/include/ti33x.inc
index 4f6d90bf..bce88309 100644
--- a/meta-ti-bsp/conf/machine/include/ti33x.inc
+++ b/meta-ti-bsp/conf/machine/include/ti33x.inc
@@ -13,6 +13,7 @@ PREFERRED_PROVIDER_virtual/bootloader ?=3D "u-boot-ti-s=
taging"
 PREFERRED_PROVIDER_u-boot ?=3D "u-boot-ti-staging"
=20
 # Graphics providers and variables
+require conf/machine/include/mesa-pvr.inc
 PREFERRED_PROVIDER_virtual/gpudriver ?=3D ""
 PVR_DISPLAY_CONTROLLER_ALIAS ?=3D "tilcdc"
=20
diff --git a/meta-ti-bsp/conf/machine/include/ti43x.inc b/meta-ti-bsp/con=
f/machine/include/ti43x.inc
index 5b40925e..c1009dc6 100644
--- a/meta-ti-bsp/conf/machine/include/ti43x.inc
+++ b/meta-ti-bsp/conf/machine/include/ti43x.inc
@@ -13,6 +13,7 @@ PREFERRED_PROVIDER_virtual/bootloader ?=3D "u-boot-ti-s=
taging"
 PREFERRED_PROVIDER_u-boot ?=3D "u-boot-ti-staging"
=20
 # Graphics providers and variables
+require conf/machine/include/mesa-pvr.inc
 PREFERRED_PROVIDER_virtual/gpudriver ?=3D ""
 PVR_DISPLAY_CONTROLLER_ALIAS ?=3D "omapdrm"
=20
diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-gl_23.%.bbappend b/me=
ta-ti-bsp/recipes-graphics/mesa/mesa-gl_23.%.bbappend
deleted file mode 100644
index 912e9e9d..00000000
--- a/meta-ti-bsp/recipes-graphics/mesa/mesa-gl_23.%.bbappend
+++ /dev/null
@@ -1 +0,0 @@
-require ${@bb.utils.contains_any('PREFERRED_PROVIDER_virtual/gpudriver',=
 'ti-img-rogue-driver ti-sgx-ddk-km', 'pvr-mesa.inc', '', d)}
diff --git a/meta-ti-bsp/recipes-graphics/mesa/pvr-mesa.inc b/meta-ti-bsp=
/recipes-graphics/mesa/mesa-pvr_22.3.5.bb
similarity index 88%
rename from meta-ti-bsp/recipes-graphics/mesa/pvr-mesa.inc
rename to meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_22.3.5.bb
index caf94156..0de3cb94 100644
--- a/meta-ti-bsp/recipes-graphics/mesa/pvr-mesa.inc
+++ b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_22.3.5.bb
@@ -2,11 +2,13 @@
 # upstream yet. This allows us to build the shims we need without comple=
tely
 # clobbering mesa.
=20
-FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files:"
+require recipes-graphics/mesa/mesa.inc
+
+SUMMARY +=3D " (with PowerVR support for TI platforms)"
=20
 LIC_FILES_CHKSUM =3D "file://docs/license.rst;md5=3D63779ec98d78d823a9dc=
533a0735ef10"
=20
-BRANCH =3D "powervr/kirkstone/22.3.5"
+BRANCH =3D "powervr/kirkstone/${PV}"
=20
 SRC_URI =3D " \
     git://gitlab.freedesktop.org/StaticRocket/mesa.git;protocol=3Dhttps;=
branch=3D${BRANCH} \
@@ -38,7 +40,6 @@ PACKAGECONFIG:remove =3D "xvmc"
 PACKAGECONFIG[xvmc] =3D ""
=20
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-PV =3D "22.3.5+pvr"
=20
 GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'pvr', =
',pvr', '', d)}"
 GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'sgx', =
',sgx', '', d)}"
@@ -50,6 +51,7 @@ do_install:append () {
     rm -rf ${D}${datadir}/pkgconfig
 }
=20
-FILES:mesa-vulkan-drivers +=3D " ${libdir}/libpvr_mesa_wsi.so"
+FILES:${PN}-dev +=3D "${datadir}/mesa/wayland-drm.xml"
+FILES:mesa-vulkan-drivers +=3D "${libdir}/libpvr_mesa_wsi.so"
=20
 RRECOMMENDS:mesa-megadriver:append:class-target =3D " ${@d.getVar('PREFE=
RRED_PROVIDER_virtual/gpudriver')}"
diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa_23.%.bbappend b/meta-=
ti-bsp/recipes-graphics/mesa/mesa_23.%.bbappend
deleted file mode 100644
index 912e9e9d..00000000
--- a/meta-ti-bsp/recipes-graphics/mesa/mesa_23.%.bbappend
+++ /dev/null
@@ -1 +0,0 @@
-require ${@bb.utils.contains_any('PREFERRED_PROVIDER_virtual/gpudriver',=
 'ti-img-rogue-driver ti-sgx-ddk-km', 'pvr-mesa.inc', '', d)}
--=20
2.25.1


