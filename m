Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D73FECDB471
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 15:56:31 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24390.1782230181319451365
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 23 Jun 2026 08:56:22 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 2C22540C2C;
	Tue, 23 Jun 2026 15:56:20 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ivsl_Tby5Ikz; Tue, 23 Jun 2026 15:56:20 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id BCFA840C1C;
	Tue, 23 Jun 2026 15:56:15 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id F357D176DE5; Tue, 23 Jun 2026 11:56:14 -0400 (EDT)
Date: Tue, 23 Jun 2026 11:56:14 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: a-christidis@ti.com
Cc: Andrew Davis <afd@ti.com>, reatmon@ti.com, denys@konsulko.com,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master/wrynose][PATCH v3 1/2] mesa-pvr: Add
 versioned mesa.inc copies from oe-core
Message-ID: <20260623155614.GA10186@denix.org>
References: <20260623150317.1127756-1-a-christidis@ti.com>
 <20260623150317.1127756-2-a-christidis@ti.com>
 <275ad764-f9c8-48f5-81f6-2b8559810837@ti.com>
 <32b1097c-3662-471f-bd85-8a2c8ff9deeb@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <32b1097c-3662-471f-bd85-8a2c8ff9deeb@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 23 Jun 2026 15:56:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20060

On Tue, Jun 23, 2026 at 10:45:45AM -0500, Antonios Christidis via lists.y=
octoproject.org wrote:
>=20
> On 6/23/26 10:43 AM, Andrew Davis wrote:
> >On 6/23/26 10:03 AM, Antonios Christidis via
> >lists.yoctoproject.org wrote:
> >>From: Antonios Christidis <a-christidis@ti.com>
> >>
> >>Add local copies of mesa.inc from oe-core, renamed with version suffi=
xes
> >>to avoid conflicts:
> >>
> >>- mesa-pvr-24.inc: verbatim copy for v24.0.1 (existing content, renam=
ed)
> >
> >Why do this at all? You delete this file in the very next patch. And y=
ou
> >also make additional modifications to mesa-pvr-25.inc in the next patc=
h
> >when you first make use of it. Why not just merge these two patches an=
d
> >skip all this in-the-middle state?
> >
> >Andrew
> >
> Denys wanted to track the copy and paste from oe-core on a
> individual patch.
>=20
> Rather than my previous approach where everything was done in 1 patch.

Recommendation was to copy v25 from OE-Core as is, before making any chan=
ges=20
to it, so it's easy to review and track changes.

Now, the patch rather makes it backwards, as v25 is copied from v24 with =
50%=20
similarity index, making this rather useless for the original purpose.

Why do you mix v24 and v25 in the same patch, confusing git into making w=
rong=20
diff?

And removing v24 in the next patch - shouldn't it stay for older BSPs?


> >>- mesa-pvr-25.inc: verbatim copy for v25.2.8 (new)
> >>
> >>The "-pvr" suffix follows the v24 naming convention. Major
> >>version numbers
> >>are appended to distinguish between the two.
> >>
> >>Signed-off-by: Antonios Christidis <a-christidis@ti.com>
> >>---
> >>=A0 .../mesa/{mesa-pvr.inc =3D> mesa-pvr-24.inc}=A0=A0=A0 |=A0=A0 0
> >>=A0 .../mesa/{mesa-pvr.inc =3D> mesa-pvr-25.inc}=A0=A0=A0 | 353 +++++=
++++---------
> >>=A0 .../recipes-graphics/mesa/mesa-pvr_24.0.1.bb=A0 |=A0=A0 2 +-
> >>=A0 3 files changed, 168 insertions(+), 187 deletions(-)
> >>=A0 copy meta-ti-bsp/recipes-graphics/mesa/{mesa-pvr.inc =3D>
> >>mesa-pvr-24.inc} (100%)
> >>=A0 rename meta-ti-bsp/recipes-graphics/mesa/{mesa-pvr.inc =3D>
> >>mesa-pvr-25.inc} (50%)
> >>
> >>diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr.inc
> >>b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.inc
> >>similarity index 100%
> >>copy from meta-ti-bsp/recipes-graphics/mesa/mesa-pvr.inc
> >>copy to meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.inc
> >>diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr.inc
> >>b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-25.inc
> >>similarity index 50%
> >>rename from meta-ti-bsp/recipes-graphics/mesa/mesa-pvr.inc
> >>rename to meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-25.inc
> >>index 5ce93d27..af674c83 100644
> >>--- a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr.inc
> >>+++ b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-25.inc
> >>@@ -1,5 +1,4 @@
> >>-# Copy of mesa.inc from OE-core before commit f9eb0468e45e
> >>("mesa: upgrade 24.0.7 -> 25.0.2")
> >>-
> >>+# Verbatim copy of mesa.inc file from commit 2c0c7c3e5b71
> >>=A0 SUMMARY =3D "A free implementation of the OpenGL API"
> >>=A0 DESCRIPTION =3D "Mesa is an open-source implementation of the
> >>OpenGL specification - \
> >>=A0 a system for rendering interactive 3D graphics.=A0 \
> >>@@ -12,24 +11,22 @@ HOMEPAGE =3D "http://mesa3d.org"
> >>=A0 BUGTRACKER =3D "https://bugs.freedesktop.org"
> >>=A0 SECTION =3D "x11"
> >>=A0 LICENSE =3D "MIT"
> >>-LIC_FILES_CHKSUM =3D
> >>"file://docs/license.rst;md5=3D63779ec98d78d823a9dc533a0735ef10"
> >>+LIC_FILES_CHKSUM =3D
> >>"file://docs/license.rst;md5=3Dffe678546d4337b732cfd12262e6af11"
> >>=A0 =A0 PE =3D "2"
> >>=A0 =A0 SRC_URI =3D "https://archive.mesa3d.org/mesa-${PV}.tar.xz \
> >>file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
> >>-=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 file://0001-drisw-fix-build-without-d=
ri3.patch \
> >>- file://0002-glxext-don-t-try-zink-if-not-enabled-in-mesa.patch \
> >>- file://0001-Revert-meson-do-not-pull-in-clc-for-clover.patch \
> >>- file://0001-amd-Include-missing-llvm-IR-header-Module.h.patch \
> >>- file://0001-freedreno-don-t-encode-build-path-into-binaries.patch\
> >>+ file://0001-freedreno-don-t-encode-build-path-into-binaries.patch \
> >>=A0 "
> >>=A0 -SRC_URI[sha256sum] =3D
> >>"7454425f1ed4a6f1b5b107e1672b30c88b22ea0efea000ae2c7d96db93f6c26a"
> >>-PV =3D "24.0.7"
> >>+SRC_URI[sha256sum] =3D
> >>"097842f3e49d996868b38688db87b006f7d4541e93ce86d2f341d8b3e7be7c93"
> >>+PV =3D "25.2.8"
> >>=A0 =A0 UPSTREAM_CHECK_GITTAGREGEX =3D "mesa-(?P<pver>\d+(\.\d+)+)"
> >>=A0 +S =3D "${UNPACKDIR}/mesa-${PV}"
> >>+
> >>=A0 #because we cannot rely on the fact that all apps will use pkgcon=
fig,
> >>=A0 #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
> >>=A0 do_install:append() {
> >>@@ -38,25 +35,18 @@ do_install:append() {
> >>=A0=A0=A0 if ${@bb.utils.contains('PACKAGECONFIG', 'egl', 'true',
> >>'false', d)} && [ -f ${D}${includedir}/EGL/eglplatform.h ]; then
> >>=A0=A0=A0=A0=A0=A0=A0 sed -i -e 's/^#elif defined(__unix__) &&
> >>defined(EGL_NO_X11)$/#elif defined(__unix__) \&\&
> >>defined(EGL_NO_X11) || ${@bb.utils.contains('PACKAGECONFIG',
> >>'x11', '0', '1', d)}/' ${D}${includedir}/EGL/eglplatform.h
> >>=A0=A0=A0 fi
> >>+=A0 # These are ICDs, apps are not supposed to link against them
> >>+=A0 if ${@bb.utils.contains('PACKAGECONFIG', 'glvnd', 'true',
> >>'false', d)} ; then
> >>+=A0=A0=A0=A0=A0 rm -f ${D}${libdir}/libEGL_mesa.so ${D}${libdir}/lib=
GLX_mesa.so
> >>+=A0 fi
> >>=A0 }
> >>=A0 -DEPENDS =3D "expat makedepend-native flex-native bison-native
> >>libxml2-native zlib chrpath-replacement-native
> >>python3-mako-native gettext-native"
> >>-DEPENDS:append:class-target =3D "
> >>${@bb.utils.contains('PACKAGECONFIG', 'opencl', 'mesa-native',
> >>'', d)}"
> >>+DEPENDS =3D "expat makedepend-native flex-native bison-native
> >>libxml2-native zlib chrpath-replacement-native
> >>python3-mako-native gettext-native python3-pyyaml-native"
> >>=A0 EXTRANATIVEPATH +=3D "chrpath-native"
> >>-PROVIDES =3D " \
> >>-=A0=A0=A0 ${@bb.utils.contains('PACKAGECONFIG', 'opengl',
> >>'virtual/libgl', '', d)} \
> >>-=A0=A0=A0 ${@bb.utils.contains('PACKAGECONFIG', 'glvnd',
> >>'virtual/libglx', '', d)} \
> >>-=A0=A0=A0 ${@bb.utils.contains('PACKAGECONFIG', 'gles',
> >>'virtual/libgles1 virtual/libgles2 virtual/libgles3', '', d)} \
> >>-=A0=A0=A0 ${@bb.utils.contains('PACKAGECONFIG', 'egl', 'virtual/egl'=
,
> >>'', d)} \
> >>-=A0=A0=A0 ${@bb.utils.contains('PACKAGECONFIG', 'gbm',
> >>'virtual/libgbm', '', d)} \
> >>-=A0=A0=A0 virtual/mesa \
> >>-=A0=A0=A0 "
> >>=A0 -inherit meson pkgconfig python3native gettext features_check
> >>+inherit meson pkgconfig python3native gettext features_check rust
> >>=A0 -BBCLASSEXTEND =3D "native nativesdk"
> >>-
> >>-ANY_OF_DISTRO_FEATURES =3D "opengl vulkan"
> >>+ANY_OF_DISTRO_FEATURES =3D "opencl opengl vulkan"
> >>=A0 =A0 PLATFORMS ??=3D "${@bb.utils.filter('PACKAGECONFIG', 'x11
> >>wayland', d)}"
> >>=A0 @@ -74,141 +64,141 @@ def check_buildtype(d):
> >>=A0 MESON_BUILDTYPE =3D "${@check_buildtype(d)}"
> >>=A0 =A0 EXTRA_OEMESON =3D " \
> >>-=A0=A0=A0 -Dshared-glapi=3Denabled \
> >>=A0=A0=A0=A0=A0 -Dglx-read-only-text=3Dtrue \
> >>=A0=A0=A0=A0=A0 -Dplatforms=3D'${@",".join("${PLATFORMS}".split())}' =
\
> >>=A0 "
> >>=A0 -EXTRA_OEMESON:append:class-target =3D "
> >>${@bb.utils.contains('PACKAGECONFIG', 'opencl',
> >>'-Dintel-clc=3Dsystem', '', d)}"
> >>-EXTRA_OEMESON:append:class-native =3D "
> >>${@bb.utils.contains('PACKAGECONFIG', 'opencl',
> >>'-Dintel-clc=3Denabled', '', d)}"
> >>-
> >>=A0 def strip_comma(s):
> >>=A0=A0=A0=A0=A0 return s.strip(',')
> >>=A0 -PACKAGECONFIG =3D " \
> >>-=A0=A0=A0 gallium \
> >>-=A0=A0=A0 video-codecs \
> >>-=A0=A0=A0 ${@bb.utils.filter('DISTRO_FEATURES', 'x11 vulkan wayland'=
, d)} \
> >>-=A0=A0=A0 ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'opengl
> >>egl gles gbm virgl', '', d)} \
> >>-=A0=A0=A0 ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl',
> >>'dri3', '', d)} \
> >>-=A0=A0=A0 ${@bb.utils.contains('DISTRO_FEATURES', 'x11 vulkan',
> >>'dri3', '', d)} \
> >>-=A0=A0=A0 ${@bb.utils.contains('DISTRO_FEATURES', 'vulkan', 'zink', =
'', d)} \
> >>-"
> >>+# skip all Rust dependencies if we are not building OpenCL"
> >>+INHIBIT_DEFAULT_RUST_DEPS =3D
> >>"${@bb.utils.contains('PACKAGECONFIG', 'opencl', '', '1', d)}"
> >>=A0 -PACKAGECONFIG:append:class-native =3D " gallium-llvm r600"
> >>+# "egl" requires "opengl"
> >>+PACKAGECONFIG[egl] =3D "-Degl=3Denabled, -Degl=3Ddisabled"
> >>=A0 =A0 # "gbm" requires "opengl"
> >>=A0 PACKAGECONFIG[gbm] =3D "-Dgbm=3Denabled,-Dgbm=3Ddisabled"
> >>=A0 -X11_DEPS =3D "xorgproto virtual/libx11 libxext libxxf86vm
> >>libxdamage libxfixes xrandr"
> >>+# "gles" requires "opengl"
> >>+PACKAGECONFIG[gles] =3D "-Dgles1=3Denabled -Dgles2=3Denabled,
> >>-Dgles1=3Ddisabled -Dgles2=3Ddisabled"
> >>+
> >>+PACKAGECONFIG[glvnd] =3D "-Dglvnd=3Denabled, -Dglvnd=3Ddisabled, lib=
glvnd"
> >>+
> >>+PACKAGECONFIG[opengl] =3D "-Dopengl=3Dtrue, -Dopengl=3Dfalse"
> >>+
> >>+# "opencl" also requires libclc and gallium-llvm to be present
> >>in PKGCONFIG!
> >>+# Be sure to enable them both for the target and for the native buil=
d.
> >>+PACKAGECONFIG[opencl] =3D "-Dgallium-rusticl=3Dtrue
> >>-Dmesa-clc-bundle-headers=3Denabled, -Dgallium-rusticl=3Dfalse,
> >>bindgen-cli-native clang"
> >>+
> >>+X11_DEPS =3D "xorgproto virtual/libx11 libxext libxxf86vm
> >>libxdamage libxfixes xrandr xorgproto libxshmfence"
> >>=A0 # "x11" requires "opengl"
> >>=A0 PACKAGECONFIG[x11] =3D ",-Dglx=3Ddisabled,${X11_DEPS}"
> >>=A0 PACKAGECONFIG[wayland] =3D ",,wayland-native wayland libdrm
> >>wayland-protocols"
> >>=A0 -PACKAGECONFIG[dri3] =3D "-Ddri3=3Denabled, -Ddri3=3Ddisabled,
> >>xorgproto libxshmfence"
> >>+# Entries for GPU vendors.
> >>+# Some of the drivers might have extra dependencies (libclc,
> >>gallium-llvm).
> >>+# Check them in the individual driver settings in VULKAN_DRIVERS and
> >>+# GALLIUMDRIVERS.
> >>+PACKAGECONFIG[amd] =3D ""
> >>+PACKAGECONFIG[asahi] =3D ""
> >>+PACKAGECONFIG[broadcom] =3D ""
> >>+PACKAGECONFIG[etnaviv] =3D ",,python3-pycparser-native"
> >>+PACKAGECONFIG[freedreno] =3D ""
> >>+PACKAGECONFIG[imagination] =3D
> >>"-Dimagination-srv=3Dtrue,-Dimagination-srv=3Dfalse"
> >>+PACKAGECONFIG[intel] =3D ""
> >>+PACKAGECONFIG[lima] =3D ""
> >>+PACKAGECONFIG[nouveau] =3D ""
> >>+PACKAGECONFIG[panfrost] =3D ""
> >>+PACKAGECONFIG[svga] =3D ""
> >>+PACKAGECONFIG[tegra] =3D ""
> >>+PACKAGECONFIG[v3d] =3D ""
> >>+PACKAGECONFIG[vc4] =3D ""
> >>+PACKAGECONFIG[virgl] =3D ""
> >>+PACKAGECONFIG[zink] =3D ""
> >>+
> >>+
> >>+VULKAN_DRIVERS_SWRAST =3D ",swrast"
> >>+# Crashes on x32
> >>+VULKAN_DRIVERS_SWRAST:x86-x32 =3D ""
> >>=A0 -# Vulkan drivers need dri3 enabled
> >>-# amd could be enabled as well but requires gallium-llvm with
> >>llvm >=3D 3.9
> >>+# keep sorted by the driver name (rather than PKGCONFIG)
> >>=A0 VULKAN_DRIVERS =3D ""
> >>-VULKAN_DRIVERS:append:x86 =3D ",intel,amd"
> >>-VULKAN_DRIVERS:append:x86-64 =3D ",intel,amd"
> >>-# i686 is a 32 bit override for mesa-native
> >>-VULKAN_DRIVERS:append:i686 =3D ",intel,amd"
> >>-VULKAN_DRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG',
> >>'freedreno', ',freedreno', '', d)}"
> >>-VULKAN_DRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG',
> >>'broadcom', ',broadcom', '', d)}"
> >>-VULKAN_DRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG',
> >>'gallium-llvm', ',swrast', '', d)}"
> >>-VULKAN_DRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG',
> >>'imagination', ',imagination-experimental', '', d)}"
> >>+VULKAN_DRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'amd
> >>gallium-llvm', ',amd', '', d)}"
> >>+VULKAN_DRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'asahi
> >>libclc gallium-llvm', ',asahi', '', d)}"
> >>+VULKAN_DRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG',
> >>'broadcom', ',broadcom', '', d)}"
> >>+VULKAN_DRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG',
> >>'freedreno', ',freedreno', '', d)}"
> >>+VULKAN_DRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG',
> >>'imagination', ',imagination-experimental', '', d)}"
> >>+VULKAN_DRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'intel
> >>libclc gallium-llvm', ',intel', '', d)}"
> >>+VULKAN_DRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG',
> >>'gallium-llvm', '${VULKAN_DRIVERS_SWRAST}', '', d)}"
> >>+VULKAN_DRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG',
> >>'panfrost libclc', ',panfrost', '', d)}"
> >>+
> >>=A0 PACKAGECONFIG[vulkan] =3D
> >>"-Dvulkan-drivers=3D${@strip_comma('${VULKAN_DRIVERS}')},
> >>-Dvulkan-drivers=3D'',glslang-native vulkan-loader vulkan-headers"
> >>+PACKAGECONFIG[vulkan-beta] =3D "-Dvulkan-beta=3Dtrue,-Dvulkan-beta=3D=
false"
> >>=A0 =A0 # mesa development and testing tools support, per driver
> >>+
> >>+# keep sorted by the driver name (rather than PKGCONFIG)
> >>=A0 TOOLS =3D ""
> >>-TOOLS_DEPS =3D ""
> >>-TOOLS:append =3D "${@bb.utils.contains('PACKAGECONFIG',
> >>'etnaviv', ',etnaviv', '', d)}"
> >>-TOOLS:append =3D "${@bb.utils.contains('PACKAGECONFIG',
> >>'freedreno', ',freedreno', '', d)}"
> >>-TOOLS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'lima',
> >>',lima', '', d)}"
> >>-TOOLS:append =3D "${@bb.utils.contains('PACKAGECONFIG',
> >>'panfrost', ',panfrost', '', d)}"
> >>-TOOLS:append =3D "${@bb.utils.contains('PACKAGECONFIG',
> >>'imagination', ',imagination', '', d)}"
> >>+TOOLS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'asahi',
> >>',asahi', '', d)}"
> >>+TOOLS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'etnaviv',
> >>',etnaviv', '', d)}"
> >>+TOOLS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'freedreno',
> >>',freedreno', '', d)}"
> >>+TOOLS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'imagination',
> >>',imagination', '', d)}"
> >>+TOOLS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'lima',
> >>',lima', '', d)}"
> >>+TOOLS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'panfrost',
> >>',panfrost', '', d)}"
> >>=A0 =A0 # dependencies for tools.
> >>-TOOLS_DEPS:append =3D "${@bb.utils.contains('PACKAGECONFIG',
> >>'freedreno', ' ncurses libxml2 ', '', d)}"
> >>+TOOLS_DEPS =3D "${@bb.utils.contains('PACKAGECONFIG',
> >>'freedreno', ' ncurses libxml2 ', '', d)}"
> >>=A0 =A0 # the fdperf tool requires libconfig (a part of meta-oe) so
> >>it needs special
> >>=A0 # treatment in addition to the usual 'freedreno tools'.
> >>=A0 PACKAGECONFIG[freedreno-fdperf] =3D ",,libconfig"
> >>=A0 =A0 PACKAGECONFIG[tools] =3D "-Dtools=3D${@strip_comma('${TOOLS}'=
)},
> >>-Dtools=3D'', ${TOOLS_DEPS}"
> >>-
> >>-PACKAGECONFIG[opengl] =3D "-Dopengl=3Dtrue, -Dopengl=3Dfalse"
> >>-PACKAGECONFIG[glvnd] =3D "-Dglvnd=3Dtrue, -Dglvnd=3Dfalse, libglvnd"
> >>-
> >>-# "gles" requires "opengl"
> >>-PACKAGECONFIG[gles] =3D "-Dgles1=3Denabled -Dgles2=3Denabled,
> >>-Dgles1=3Ddisabled -Dgles2=3Ddisabled"
> >>-
> >>-# "egl" requires "opengl"
> >>-PACKAGECONFIG[egl] =3D "-Degl=3Denabled, -Degl=3Ddisabled"
> >>-
> >>-# "opencl" requires libclc from meta-clang and spirv-tools from OE-C=
ore
> >>-OPENCL_NATIVE =3D "${@bb.utils.contains('PACKAGECONFIG',
> >>'freedreno', '-Dopencl-native=3Dtrue', '', d)}"
> >>-PACKAGECONFIG[opencl] =3D "-Dgallium-opencl=3Dicd
> >>-Dopencl-spirv=3Dtrue ${OPENCL_NATIVE},-Dgallium-opencl=3Ddisabled
> >>-Dopencl-spirv=3Dfalse,libclc spirv-tools python3-ply-native"
> >>-
> >>-PACKAGECONFIG[broadcom] =3D ""
> >>-PACKAGECONFIG[etnaviv] =3D ",,python3-pycparser-native"
> >>-PACKAGECONFIG[freedreno] =3D ""
> >>-PACKAGECONFIG[kmsro] =3D ""
> >>-PACKAGECONFIG[vc4] =3D ""
> >>-PACKAGECONFIG[v3d] =3D ""
> >>-PACKAGECONFIG[zink] =3D ""
> >>-
> >>-GALLIUMDRIVERS =3D "swrast"
> >>-# gallium swrast was found to crash Xorg on startup in x32 qemu
> >>-GALLIUMDRIVERS:x86-x32 =3D ""
> >>-GALLIUMDRIVERS:append:x86 =3D ",i915,iris,crocus"
> >>-GALLIUMDRIVERS:append:x86-64 =3D ",i915,iris,crocus"
> >>-# i686 is a 32 bit override for mesa-native
> >>-GALLIUMDRIVERS:append:i686 =3D ",i915,iris,crocus"
> >>-
> >>-GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG',
> >>'etnaviv', ',etnaviv', '', d)}"
> >>-GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG',
> >>'freedreno', ',freedreno', '', d)}"
> >>-GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG',
> >>'kmsro', ',kmsro', '', d)}"
> >>-GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG',
> >>'vc4', ',vc4', '', d)}"
> >>-GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG',
> >>'v3d', ',v3d', '', d)}"
> >>-GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG',
> >>'zink', ',zink', '', d)}"
> >>-
> >>-# radeonsi requires LLVM
> >>-GALLIUMDRIVERS_RADEONSI =3D
> >>"${@bb.utils.contains('PACKAGECONFIG', 'r600', ',radeonsi', '',
> >>d)}"
> >>-GALLIUMDRIVERS_LLVM =3D ",r300,nouveau${GALLIUMDRIVERS_RADEONSI}"
> >>-GALLIUMDRIVERS_LLVM:append:x86 =3D ",svga"
> >>-GALLIUMDRIVERS_LLVM:append:x86-64 =3D ",svga"
> >>-# i686 is a 32 bit override for mesa-native
> >>-GALLIUMDRIVERS_LLVM:append:i686 =3D ",svga"
> >>-
> >>-PACKAGECONFIG[r600] =3D ""
> >>-PACKAGECONFIG[virgl] =3D ""
> >>-
> >>-GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG',
> >>'gallium-llvm', '${GALLIUMDRIVERS_LLVM}', '', d)}"
> >>-GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG',
> >>'r600', ',r600', '', d)}"
> >>-GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG',
> >>'virgl', ',virgl', '', d)}"
> >>+PACKAGECONFIG[xmlconfig] =3D "-Dxmlconfig=3Denabled,
> >>-Dxmlconfig=3Ddisabled, expat"
> >>+
> >>+GALLIUMDRIVERS_LLVMPIPE =3D ",llvmpipe"
> >>+GALLIUMDRIVERS_SOFTPIPE =3D ",softpipe"
> >>+# gallium softpipe and llvmpipe was found to crash Xorg on
> >>startup in x32 qemu
> >>+GALLIUMDRIVERS_LLVMPIPE:x86-x32 =3D ""
> >>+GALLIUMDRIVERS_SOFTPIPE:x86-x32 =3D ""
> >>+
> >>+# keep sorted by the driver name (rather than PKGCONFIG)
> >>+GALLIUMDRIVERS =3D ""
> >>+GALLIUMDRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'asahi
> >>libclc gallium-llvm', ',asahi', '', d)}"
> >>+GALLIUMDRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG',
> >>'intel', ',crocus', '', d)}"
> >>+GALLIUMDRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG',
> >>'etnaviv', ',etnaviv', '', d)}"
> >>+GALLIUMDRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG',
> >>'freedreno', ',freedreno', '', d)}"
> >>+GALLIUMDRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG',
> >>'intel', ',i915', '', d)}"
> >>+GALLIUMDRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'intel
> >>libclc gallium-llvm', ',iris', '', d)}"
> >>+GALLIUMDRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG',
> >>'lima', ',lima', '', d)}"
> >>+GALLIUMDRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG',
> >>'gallium-llvm', '${GALLIUMDRIVERS_LLVMPIPE}', '', d)}"
> >>+GALLIUMDRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG',
> >>'nouveau gallium-llvm', ',nouveau', '', d)}"
> >>+GALLIUMDRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG',
> >>'panfrost libclc', ',panfrost', '', d)}"
> >>+GALLIUMDRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'amd
> >>gallium-llvm', ',r300', '', d)}"
> >>+GALLIUMDRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'amd',
> >>',r600', '', d)}"
> >>+GALLIUMDRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'amd
> >>gallium-llvm', ',radeonsi', '', d)}"
> >>+GALLIUMDRIVERS .=3D "${GALLIUMDRIVERS_SOFTPIPE}"
> >>+GALLIUMDRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'svga
> >>gallium-llvm', ',svga', '', d)}"
> >>+GALLIUMDRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG',
> >>'tegra', ',tegra', '', d)}"
> >>+GALLIUMDRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG',
> >>'virgl', ',virgl', '', d)}"
> >>+GALLIUMDRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'vc4',
> >>',vc4', '', d)}"
> >>+GALLIUMDRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'v3d',
> >>',v3d', '', d)}"
> >>+GALLIUMDRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG',
> >>'zink', ',zink', '', d)}"
> >>=A0 =A0 PACKAGECONFIG[gallium] =3D
> >>"-Dgallium-drivers=3D${@strip_comma('${GALLIUMDRIVERS}')},
> >>-Dgallium-drivers=3D'', libdrm"
> >>=A0 PACKAGECONFIG[gallium-llvm] =3D "-Dllvm=3Denabled
> >>-Dshared-llvm=3Denabled, -Dllvm=3Ddisabled, llvm llvm-native
> >>elfutils"
> >>-PACKAGECONFIG[xa]=A0 =3D "-Dgallium-xa=3Denabled, -Dgallium-xa=3Ddis=
abled"
> >>-PACKAGECONFIG[va] =3D
> >>"-Dgallium-va=3Denabled,-Dgallium-va=3Ddisabled,libva-initial"
> >>-PACKAGECONFIG[vdpau] =3D
> >>"-Dgallium-vdpau=3Denabled,-Dgallium-vdpau=3Ddisabled,libvdpau"
> >>-
> >>-PACKAGECONFIG[imagination] =3D
> >>"-Dimagination-srv=3Dtrue,-Dimagination-srv=3Dfalse"
> >>-
> >>-PACKAGECONFIG[lima] =3D ""
> >>-GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG',
> >>'lima', ',lima', '', d)}"
> >>=A0 -PACKAGECONFIG[panfrost] =3D ""
> >>-GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG',
> >>'panfrost', ',panfrost', '', d)}"
> >>+MESA_CLC =3D "system"
> >>+MESA_CLC:class-native =3D "enabled"
> >>+INSTALL_MESA_CLC =3D "false"
> >>+INSTALL_MESA_CLC:class-native =3D "true"
> >>+MESA_NATIVE =3D "mesa-native"
> >>+MESA_NATIVE:class-native =3D ""
> >>=A0 -PACKAGECONFIG[tegra] =3D ""
> >>-GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG',
> >>'tegra', ',tegra,nouveau', '', d)}"
> >>-
> >>-PACKAGECONFIG[vulkan-beta] =3D "-Dvulkan-beta=3Dtrue,-Dvulkan-beta=3D=
false"
> >>-
> >>-PACKAGECONFIG[osmesa] =3D "-Dosmesa=3Dtrue,-Dosmesa=3Dfalse"
> >>+PACKAGECONFIG[libclc] =3D "-Dmesa-clc=3D${MESA_CLC}
> >>-Dinstall-mesa-clc=3D${INSTALL_MESA_CLC}
> >>-Dmesa-clc-bundle-headers=3Denabled,,libclc spirv-tools
> >>spirv-llvm-translator ${MESA_NATIVE}"
> >>+PACKAGECONFIG[va] =3D
> >>"-Dgallium-va=3Denabled,-Dgallium-va=3Ddisabled,libva-initial"
> >>+PACKAGECONFIG[vdpau] =3D
> >>"-Dgallium-vdpau=3Denabled,-Dgallium-vdpau=3Ddisabled,libvdpau"
> >>=A0 =A0 PACKAGECONFIG[perfetto] =3D
> >>"-Dperfetto=3Dtrue,-Dperfetto=3Dfalse,libperfetto"
> >>=A0 @@ -219,6 +209,8 @@ PACKAGECONFIG[lmsensors] =3D
> >>"-Dlmsensors=3Denabled,-Dlmsensors=3Ddisabled,lmsensors"
> >>=A0 VIDEO_CODECS ?=3D
> >>"${@bb.utils.contains('LICENSE_FLAGS_ACCEPTED', 'commercial',
> >>'all', 'all_free', d)}"
> >>=A0 PACKAGECONFIG[video-codecs] =3D "-Dvideo-codecs=3D${VIDEO_CODECS}=
,
> >>-Dvideo-codecs=3D''"
> >>=A0 +PACKAGECONFIG[teflon] =3D "-Dteflon=3Dtrue, -Dteflon=3Dfalse"
> >>+
> >>=A0 # llvmpipe is slow if compiled with -fomit-frame-pointer (e.g. -O=
2)
> >>=A0 FULL_OPTIMIZATION:append =3D " -fno-omit-frame-pointer"
> >>=A0 @@ -237,75 +229,63 @@ RPROVIDES:libopencl-mesa +=3D "virtual-open=
cl-icd"
> >>=A0 RPROVIDES:libgles2-mesa +=3D "libgles3-mesa"
> >>=A0 RPROVIDES:libgles2-mesa-dev +=3D "libgles3-mesa-dev"
> >>=A0 -RDEPENDS:libopencl-mesa +=3D
> >>"${@bb.utils.contains('PACKAGECONFIG', 'opencl', 'libclc
> >>spirv-tools', '', d)}"
> >>+RDEPENDS:libopencl-mesa +=3D
> >>"${@bb.utils.contains('PACKAGECONFIG', 'opencl', 'libclc', '',
> >>d)}"
> >>=A0 =A0 PACKAGES =3D+ "libegl-mesa libegl-mesa-dev \
> >>-=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 libosmesa libosmesa-dev \
> >>+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 libgallium \
> >>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 libgl-mesa libgl-mesa-dev =
\
> >>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 libglx-mesa libglx-mesa-de=
v \
> >>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 libglapi libglapi-dev \
> >>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 libgbm libgbm-dev \
> >>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 libgles1-mesa libgles1-mes=
a-dev \
> >>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 libgles2-mesa libgles2-mes=
a-dev \
> >>-=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 libopencl-mesa libopencl-mesa-d=
ev \
> >>-=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 libxatracker libxatracker-dev \
> >>+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 libopencl-mesa \
> >>+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 libteflon \
> >>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 mesa-megadriver mesa-vulka=
n-drivers \
> >>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 mesa-vdpau-drivers mesa-to=
ols \
> >>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "
> >>=A0 -do_install:append () {
> >>-=A0=A0=A0 # Drivers never need libtool .la files
> >>-=A0=A0=A0 rm -f ${D}${libdir}/dri/*.la
> >>-=A0=A0=A0 rm -f ${D}${libdir}/egl/*.la
> >>-=A0=A0=A0 rm -f ${D}${libdir}/gallium-pipe/*.la
> >>-=A0=A0=A0 rm -f ${D}${libdir}/gbm/*.la
> >>-
> >>-=A0=A0=A0 # libwayland-egl has been moved to wayland 1.15+
> >>-=A0=A0=A0 rm -f ${D}${libdir}/libwayland-egl*
> >>-=A0=A0=A0 rm -f ${D}${libdir}/pkgconfig/wayland-egl.pc
> >>-}
> >>-
> >>-do_install:append:class-native () {
> >>-=A0=A0=A0 if ${@bb.utils.contains('PACKAGECONFIG', 'opencl', 'true',
> >>'false', d)}; then
> >>-=A0=A0=A0=A0=A0=A0=A0 install -d ${D}${bindir}
> >>-=A0=A0=A0=A0=A0=A0=A0 install -m0755 ${B}/src/intel/compiler/intel_c=
lc ${D}${bindir}
> >>-=A0=A0=A0 fi
> >>-}
> >>-
> >>=A0 # For the packages that make up the OpenGL interfaces, inject
> >>variables so that
> >>=A0 # they don't get Debian-renamed (which would remove the -mesa
> >>suffix), and
> >>=A0 # RPROVIDEs/RCONFLICTs on the generic libgl name.
> >>=A0 python __anonymous() {
> >>=A0=A0=A0=A0=A0 pkgconfig =3D (d.getVar('PACKAGECONFIG') or "").split=
()
> >>+=A0=A0=A0 mlprefix =3D d.getVar("MLPREFIX")
> >>=A0=A0=A0=A0=A0 suffix =3D ""
> >>=A0=A0=A0=A0=A0 if "-native" in d.getVar("PN"):
> >>=A0=A0=A0=A0=A0=A0=A0=A0=A0 suffix =3D "-native"
> >>-=A0=A0=A0 for p in (("egl", "libegl", "libegl1"),
> >>-=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ("opengl", "libgl", "libgl1"=
),
> >>-=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ("glvnd", "libglx",),
> >>-=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ("gles", "libgles1", "libgle=
sv1-cm1"),
> >>-=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ("gles", "libgles2", "libgle=
sv2-2", "libgles3"),
> >>-=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ("opencl", "libopencl",)):
> >>-=A0=A0=A0=A0=A0=A0=A0 if not p[0] in pkgconfig:
> >>-=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 continue
> >>-=A0=A0=A0=A0=A0=A0=A0 mlprefix =3D d.getVar("MLPREFIX")
> >>-=A0=A0=A0=A0=A0=A0=A0 fullp =3D mlprefix + p[1] + "-mesa" + suffix
> >>-=A0=A0=A0=A0=A0=A0=A0 mlprefix =3D d.getVar("MLPREFIX")
> >>-=A0=A0=A0=A0=A0=A0=A0 pkgs =3D " " + " ".join(mlprefix + x + suffix =
for x in p[1:])
> >>-=A0=A0=A0=A0=A0=A0=A0 d.setVar("DEBIAN_NOAUTONAME:" + fullp, "1")
> >>-=A0=A0=A0=A0=A0=A0=A0 d.appendVar("RREPLACES:" + fullp, pkgs)
> >>-=A0=A0=A0=A0=A0=A0=A0 d.appendVar("RPROVIDES:" + fullp, pkgs)
> >>-=A0=A0=A0=A0=A0=A0=A0 d.appendVar("RCONFLICTS:" + fullp, pkgs)
> >>=A0 +=A0=A0=A0 for p in ("libegl", "libgl", "libglx", "libgles1",
> >>"libgles2", "libgles3", "libopencl"):
> >>+=A0=A0=A0=A0=A0=A0=A0 fullp =3D mlprefix + p + "-mesa" + suffix
> >>=A0=A0=A0=A0=A0=A0=A0=A0=A0 d.appendVar("RRECOMMENDS:" + fullp, "
> >>${MLPREFIX}mesa-megadriver" + suffix)
> >>=A0 -=A0=A0=A0=A0=A0=A0=A0 # For -dev, the first element is both the =
Debian and
> >>original name
> >>-=A0=A0=A0=A0=A0=A0=A0 fullp =3D mlprefix + p[1] + "-mesa-dev" + suff=
ix
> >>-=A0=A0=A0=A0=A0=A0=A0 pkgs =3D " " + mlprefix + p[1] + "-dev" + suff=
ix
> >>-=A0=A0=A0=A0=A0=A0=A0 d.setVar("DEBIAN_NOAUTONAME:" + fullp, "1")
> >>-=A0=A0=A0=A0=A0=A0=A0 d.appendVar("RREPLACES:" + fullp, pkgs)
> >>-=A0=A0=A0=A0=A0=A0=A0 d.appendVar("RPROVIDES:" + fullp, pkgs)
> >>-=A0=A0=A0=A0=A0=A0=A0 d.appendVar("RCONFLICTS:" + fullp, pkgs)
> >>+=A0=A0=A0 d.setVar("DEBIAN_NOAUTONAME:%slibopencl-mesa%s" %
> >>(mlprefix, suffix), "1")
> >>+
> >>+=A0=A0=A0 if 'glvnd' in pkgconfig:
> >>+=A0=A0=A0=A0=A0=A0=A0 for p in ("libegl", "libglx"):
> >>+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 fullp =3D mlprefix + p + "-mesa" +=
 suffix
> >>+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 d.appendVar("RPROVIDES:" + fullp, =
' virtual-%s-icd' % p)
> >>+=A0=A0=A0 else:
> >>+=A0=A0=A0=A0=A0=A0=A0 for p in (("egl", "libegl", "libegl1"),
> >>+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ("opengl", "libg=
l", "libgl1"),
> >>+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ("gles", "libgle=
s1", "libglesv1-cm1"),
> >>+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ("gles", "libgle=
s2", "libglesv2-2", "libgles3")):
> >>+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if not p[0] in pkgconfig:
> >>+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 continue
> >>+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 fullp =3D mlprefix + p[1] + "-mesa=
" + suffix
> >>+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 pkgs =3D " " + " ".join(mlprefix +=
 x + suffix for x in p[1:])
> >>+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 d.setVar("DEBIAN_NOAUTONAME:" + fu=
llp, "1")
> >>+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 d.appendVar("RREPLACES:" + fullp, =
pkgs)
> >>+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 d.appendVar("RPROVIDES:" + fullp, =
pkgs)
> >>+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 d.appendVar("RCONFLICTS:" + fullp,=
 pkgs)
> >>+
> >>+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 # For -dev, the first element is b=
oth the Debian
> >>and original name
> >>+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 fullp =3D mlprefix + p[1] + "-mesa=
-dev" + suffix
> >>+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 pkgs =3D " " + mlprefix + p[1] + "=
-dev" + suffix
> >>+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 d.setVar("DEBIAN_NOAUTONAME:" + fu=
llp, "1")
> >>+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 d.appendVar("RREPLACES:" + fullp, =
pkgs)
> >>+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 d.appendVar("RPROVIDES:" + fullp, =
pkgs)
> >>+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 d.appendVar("RCONFLICTS:" + fullp,=
 pkgs)
> >>=A0 }
> >>=A0 =A0 python mesa_populate_packages() {
> >>@@ -327,9 +307,6 @@ python mesa_populate_packages() {
> >>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 d.appendVar("RPRO=
VIDES:%s" % lib_name, pkg_name)
> >>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 d.appendVar("RCON=
FLICTS:%s" % lib_name, pkg_name)
> >>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 d.appendVar("RREP=
LACES:%s" % lib_name, pkg_name)
> >>-
> >>-=A0=A0=A0 pipe_drivers_root =3D os.path.join(d.getVar('libdir'),
> >>"gallium-pipe")
> >>-=A0=A0=A0 do_split_packages(d, pipe_drivers_root, r'^pipe_(.*)\.so$'=
,
> >>'mesa-driver-pipe-%s', 'Mesa %s pipe driver', extra_depends=3D'')
> >>=A0 }
> >>=A0 =A0 PACKAGESPLITFUNCS =3D+ "mesa_populate_packages"
> >>@@ -341,34 +318,38 @@ FILES:mesa-megadriver =3D "${libdir}/dri/*
> >>${datadir}/drirc.d"
> >>=A0 FILES:mesa-vulkan-drivers =3D "${libdir}/libvulkan_*.so
> >>${libdir}/libpowervr_rogue.so ${datadir}/vulkan"
> >>=A0 FILES:${PN}-vdpau-drivers =3D "${libdir}/vdpau/*.so.*"
> >>=A0 FILES:libegl-mesa =3D "${libdir}/libEGL*.so.*
> >>${datadir}/glvnd/egl_vendor.d"
> >>-FILES:libgbm =3D "${libdir}/libgbm.so.*"
> >>+FILES:libgbm =3D "${libdir}/libgbm.so.* ${libdir}/gbm/*_gbm.so"
> >>+FILES:libgallium =3D "${libdir}/libgallium-*.so"
> >>=A0 FILES:libgles1-mesa =3D "${libdir}/libGLESv1*.so.*"
> >>=A0 FILES:libgles2-mesa =3D "${libdir}/libGLESv2.so.*"
> >>=A0 FILES:libgl-mesa =3D "${libdir}/libGL.so.*"
> >>=A0 FILES:libglx-mesa =3D "${libdir}/libGLX*.so.*"
> >>-FILES:libopencl-mesa =3D "${libdir}/libMesaOpenCL.so.*
> >>${libdir}/gallium-pipe/*.so
> >>${sysconfdir}/OpenCL/vendors/mesa.icd"
> >>+FILES:libopencl-mesa =3D "${libdir}/lib*OpenCL.so*
> >>${sysconfdir}/OpenCL/vendors/*.icd"
> >>=A0 FILES:libglapi =3D "${libdir}/libglapi.so.*"
> >>-FILES:libosmesa =3D "${libdir}/libOSMesa.so.*"
> >>-FILES:libxatracker =3D "${libdir}/libxatracker.so.*"
> >>=A0 -FILES:${PN}-dev =3D "${libdir}/pkgconfig/dri.pc
> >>${includedir}/vulkan ${libdir}/vdpau/*.so"
> >>+FILES:${PN}-dev =3D "${libdir}/pkgconfig/dri.pc
> >>${includedir}/GL/internal/dri_interface.h ${includedir}/vulkan
> >>${libdir}/vdpau/*.so"
> >>=A0 FILES:libegl-mesa-dev =3D "${libdir}/libEGL*.* ${includedir}/EGL
> >>${includedir}/KHR ${libdir}/pkgconfig/egl.pc"
> >>-FILES:libgbm-dev =3D "${libdir}/libgbm.*
> >>${libdir}/pkgconfig/gbm.pc ${includedir}/gbm.h"
> >>-FILES:libgl-mesa-dev =3D "${libdir}/libGL.* ${includedir}/GL
> >>${libdir}/pkgconfig/gl.pc"
> >>-FILES:libglx-mesa-dev =3D "${libdir}/libGLX*.*"
> >>+FILES:libgbm-dev =3D "${libdir}/libgbm.*
> >>${libdir}/pkgconfig/gbm.pc ${includedir}/gbm.h
> >>${includedir}/gbm_backend_abi.h"
> >>+FILES:libgl-mesa-dev =3D "${libdir}/libGL.* ${includedir}/GL/*.h
> >>${libdir}/pkgconfig/gl.pc ${libdir}/pkgconfig/glx.pc"
> >>=A0 FILES:libglapi-dev =3D "${libdir}/libglapi.*"
> >>=A0 FILES:libgles1-mesa-dev =3D "${libdir}/libGLESv1*.*
> >>${includedir}/GLES ${libdir}/pkgconfig/glesv1*.pc"
> >>=A0 FILES:libgles2-mesa-dev =3D "${libdir}/libGLESv2.*
> >>${includedir}/GLES2 ${includedir}/GLES3
> >>${libdir}/pkgconfig/glesv2.pc"
> >>-FILES:libopencl-mesa-dev =3D "${libdir}/libMesaOpenCL.so"
> >>-FILES:libosmesa-dev =3D "${libdir}/libOSMesa.*
> >>${includedir}/GL/osmesa.h ${libdir}/pkgconfig/osmesa.pc"
> >>-FILES:libxatracker-dev =3D "${libdir}/libxatracker.so
> >>${libdir}/libxatracker.la \
> >>-=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 ${includedir}/xa_tracker.h
> >>${includedir}/xa_composite.h ${includedir}/xa_context.h \
> >>-=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 ${libdir}/pkgconfig/xatracker.pc"
> >>+FILES:libteflon =3D "${libdir}/libteflon.so"
> >>=A0 # catch all to get all the tools and data
> >>=A0 FILES:${PN}-tools =3D "${bindir} ${datadir}"
> >>=A0 ALLOW_EMPTY:${PN}-tools =3D "1"
> >>=A0 +# All DRI drivers are symlinks to libdril_dri.so
> >>+INSANE_SKIP:${PN}-megadriver +=3D "dev-so"
> >>+
> >>+# OpenCL ICDs package also ship correspondig .so files, there
> >>is no -dev package
> >>+INSANE_SKIP:libopencl-mesa +=3D "dev-so"
> >>+
> >>=A0 # Fix upgrade path from mesa to mesa-megadriver
> >>=A0 RREPLACES:mesa-megadriver =3D "mesa"
> >>=A0 RCONFLICTS:mesa-megadriver =3D "mesa"
> >>=A0 RPROVIDES:mesa-megadriver =3D "mesa"
> >>+
> >>+# As of May 2025 it is known that LTO breaks Mesa, for example:
> >>+# https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/34318
> >>+LTO =3D ""
> >>diff --git
> >>a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_24.0.1.bb
> >>b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_24.0.1.bb
> >>index 8ec06800..2c20a538 100644
> >>--- a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_24.0.1.bb
> >>+++ b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_24.0.1.bb
> >>@@ -2,7 +2,7 @@
> >>=A0 # upstream yet. This allows us to build the shims we need
> >>without completely
> >>=A0 # clobbering mesa.
> >>=A0 -require recipes-graphics/mesa/mesa-pvr.inc
> >>+require recipes-graphics/mesa/mesa-pvr-24.inc
> >>=A0 =A0 SUMMARY +=3D " (with PowerVR for TI parts)"
> >>
> >>
> >>
> >>
> >>
> >

