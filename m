Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 210C3C369A2
	for <webhook@archiver.kernel.org>; Mon, 14 Apr 2025 18:11:18 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.1830.1744654272685999275
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 14 Apr 2025 11:11:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=IpEBMdZ6;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53EIBBK32140344
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 14 Apr 2025 13:11:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744654271;
	bh=70zjocB6xRvOM3OmJeFR2wDDu+9l2V19tym5crtEPIY=;
	h=Date:CC:Subject:From:To:References:In-Reply-To;
	b=IpEBMdZ6t34DoxUL+0VshHo5Xv4U4SrgyvxxG2GRemxacwd+DyyNgyh3wbYu25vS/
	 N6ZRBvf/1EERUxspkG2esIAPcLpbxad4M0+s9jvFMibaJxP1auTX5xfaZkAwELAvXF
	 tsSEjy/BlzRPCmevPM9DyuRL99iUWzUyy56Gwang=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53EIBBLK078863
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 14 Apr 2025 13:11:11 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 14
 Apr 2025 13:11:10 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 14 Apr 2025 13:11:11 -0500
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53EIBBkD023162;
	Mon, 14 Apr 2025 13:11:11 -0500
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 14 Apr 2025 13:11:11 -0500
Message-ID: <D96KBNO840KY.3NV1N81Y6JRCS@ti.com>
CC: <meta-ti@lists.yoctoproject.org>,
        Max Krummenacher
	<max.krummenacher@toradex.com>
Subject: Re: [meta-ti] [PATCH] mesa-pvr: add local copy of mesa.inc
From: Randolph Sapp <rs@ti.com>
To: Max Krummenacher <max.oss.09@gmail.com>, Ryan Eatmon <reatmon@ti.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250414094441.3181639-1-max.oss.09@gmail.com>
 <54301279-5493-433e-a4a1-91450d507e48@ti.com>
 <CAEHkU3WdAa8XvNz_mC0HZhk3KSe0b0mXWXBALSt+B0Qqf8=x4Q@mail.gmail.com>
In-Reply-To: <CAEHkU3WdAa8XvNz_mC0HZhk3KSe0b0mXWXBALSt+B0Qqf8=x4Q@mail.gmail.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 14 Apr 2025 18:11:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18467

On Mon Apr 14, 2025 at 10:06 AM CDT, Max Krummenacher wrote:
> Hi Ryan
>
> On Mon, Apr 14, 2025 at 4:24=E2=80=AFPM Ryan Eatmon <reatmon@ti.com> wrot=
e:
>>
>>
>> I assume this is for master only?  It's missing in the subject...
>
> Yes. I don't expect that mesa 25.0.2 will be backported to something
> before walnascar (if it is even backported to walnascar).
> Sorry for the confusion.
>
> It fixes building mesa-pvr with current master branches.
>
> However I'm not sure if mesa now contains whatever is needed so
> that mesa-pvr can be dropped.
>
> Regards
> Max

Reviewed-by: Randolph Sapp <rs@ti.com>

We're about to migrate to a newer version of mesa, but it'll still be 24.X.
We'll need it either way.

>>
>>
>> On 4/14/2025 4:44 AM, Max Krummenacher via lists.yoctoproject.org wrote:
>> > From: Max Krummenacher <max.krummenacher@toradex.com>
>> >
>> > OE-core updated mesa to 25.0.2 [1]. The resulting mesa.inc file no
>> > longer matches mesa recipes building older versions.
>> > Copy the mesa.inc version from before the update renamed to
>> > mesa-pvr.inc to work around the issue.
>> >
>> > | ../git/meson.build:21:0: ERROR: Value "softpipe" for option "gallium=
-drivers" is not in allowed choices: "auto, kmsro, radeonsi, r300, r600, no=
uveau, freedreno, swrast, v3d, vc4, etnaviv, tegra, i915, svga, virgl, panf=
rost, iris, lima, zink, d3d12, asahi, crocus, pvr, sgx, all"
>> >
>> > [1] https://git.openembedded.org/openembedded-core/commit/?id=3Df9eb04=
68e45ee5a6a3b3195ef5e78c328c4347c9
>> >
>> > Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
>> > ---
>> >
>> > I don't know if mesa 25.0.2 does have the changes from meta-pvr merged
>> > so that instead of keeping meta-pvr working one could now use mesa 25
>> > from OE with the appropriate packageconfigs.
>> >
>> > Regards
>> > Max
>> >
>> >   .../recipes-graphics/mesa/mesa-pvr.inc        | 380 ++++++++++++++++=
++
>> >   .../recipes-graphics/mesa/mesa-pvr_22.3.5.bb  |   2 +-
>> >   .../recipes-graphics/mesa/mesa-pvr_24.0.1.bb  |   2 +-
>> >   3 files changed, 382 insertions(+), 2 deletions(-)
>> >   create mode 100644 meta-ti-bsp/recipes-graphics/mesa/mesa-pvr.inc
>> >
>> > diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr.inc b/meta-ti-=
bsp/recipes-graphics/mesa/mesa-pvr.inc
>> > new file mode 100644
>> > index 000000000000..471475ff58cf
>> > --- /dev/null
>> > +++ b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr.inc
>> > @@ -0,0 +1,380 @@
>> > +# Copy of mesa.inc from OE-core before commit f9eb0468e45e ("mesa: up=
grade 24.0.7 -> 25.0.2")
>> > +
>> > +SUMMARY =3D "A free implementation of the OpenGL API"
>> > +DESCRIPTION =3D "Mesa is an open-source implementation of the OpenGL =
specification - \
>> > +a system for rendering interactive 3D graphics.  \
>> > +A variety of device drivers allows Mesa to be used in many different =
environments \
>> > +ranging from software emulation to complete hardware acceleration for=
 modern GPUs. \
>> > +Mesa is used as part of the overall Direct Rendering Infrastructure a=
nd X.org \
>> > +environment."
>> > +
>> > +HOMEPAGE =3D "http://mesa3d.org"
>> > +BUGTRACKER =3D "https://bugs.freedesktop.org"
>> > +SECTION =3D "x11"
>> > +LICENSE =3D "MIT"
>> > +LIC_FILES_CHKSUM =3D "file://docs/license.rst;md5=3D63779ec98d78d823a=
9dc533a0735ef10"
>> > +
>> > +PE =3D "2"
>> > +
>> > +SRC_URI =3D "https://archive.mesa3d.org/mesa-${PV}.tar.xz \
>> > +           file://0001-meson-misdetects-64bit-atomics-on-mips-clang.p=
atch \
>> > +           file://0001-drisw-fix-build-without-dri3.patch \
>> > +           file://0002-glxext-don-t-try-zink-if-not-enabled-in-mesa.p=
atch \
>> > +           file://0001-Revert-meson-do-not-pull-in-clc-for-clover.pat=
ch \
>> > +           file://0001-amd-Include-missing-llvm-IR-header-Module.h.pa=
tch \
>> > +           file://0001-freedreno-don-t-encode-build-path-into-binarie=
s.patch\
>> > +"
>> > +
>> > +SRC_URI[sha256sum] =3D "7454425f1ed4a6f1b5b107e1672b30c88b22ea0efea00=
0ae2c7d96db93f6c26a"
>> > +PV =3D "24.0.7"
>> > +
>> > +UPSTREAM_CHECK_GITTAGREGEX =3D "mesa-(?P<pver>\d+(\.\d+)+)"
>> > +
>> > +#because we cannot rely on the fact that all apps will use pkgconfig,
>> > +#make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
>> > +do_install:append() {
>> > +  # sed can't find EGL/eglplatform.h as it doesn't get installed when=
 glvnd enabled.
>> > +  # So, check if EGL/eglplatform.h exists before running sed.
>> > +  if ${@bb.utils.contains('PACKAGECONFIG', 'egl', 'true', 'false', d)=
} && [ -f ${D}${includedir}/EGL/eglplatform.h ]; then
>> > +      sed -i -e 's/^#elif defined(__unix__) && defined(EGL_NO_X11)$/#=
elif defined(__unix__) \&\& defined(EGL_NO_X11) || ${@bb.utils.contains('PA=
CKAGECONFIG', 'x11', '0', '1', d)}/' ${D}${includedir}/EGL/eglplatform.h
>> > +  fi
>> > +}
>> > +
>> > +DEPENDS =3D "expat makedepend-native flex-native bison-native libxml2=
-native zlib chrpath-replacement-native python3-mako-native gettext-native"
>> > +DEPENDS:append:class-target =3D " ${@bb.utils.contains('PACKAGECONFIG=
', 'opencl', 'mesa-native', '', d)}"
>> > +EXTRANATIVEPATH +=3D "chrpath-native"
>> > +PROVIDES =3D " \
>> > +    ${@bb.utils.contains('PACKAGECONFIG', 'opengl', 'virtual/libgl', =
'', d)} \
>> > +    ${@bb.utils.contains('PACKAGECONFIG', 'glvnd', 'virtual/libglx', =
'', d)} \
>> > +    ${@bb.utils.contains('PACKAGECONFIG', 'gles', 'virtual/libgles1 v=
irtual/libgles2 virtual/libgles3', '', d)} \
>> > +    ${@bb.utils.contains('PACKAGECONFIG', 'egl', 'virtual/egl', '', d=
)} \
>> > +    ${@bb.utils.contains('PACKAGECONFIG', 'gbm', 'virtual/libgbm', ''=
, d)} \
>> > +    virtual/mesa \
>> > +    "
>> > +
>> > +inherit meson pkgconfig python3native gettext features_check
>> > +
>> > +BBCLASSEXTEND =3D "native nativesdk"
>> > +
>> > +ANY_OF_DISTRO_FEATURES =3D "opengl vulkan"
>> > +
>> > +PLATFORMS ??=3D "${@bb.utils.filter('PACKAGECONFIG', 'x11 wayland', d=
)}"
>> > +
>> > +# set the MESA_BUILD_TYPE to either 'release' (default) or 'debug'
>> > +# by default the upstream mesa sources build a debug release
>> > +# here we assume the user will want a release build by default
>> > +MESA_BUILD_TYPE ?=3D "release"
>> > +def check_buildtype(d):
>> > +    _buildtype =3D d.getVar('MESA_BUILD_TYPE')
>> > +    if _buildtype not in ['release', 'debug']:
>> > +        bb.fatal("unknown build type (%s), please set MESA_BUILD_TYPE=
 to either 'release' or 'debug'" % _buildtype)
>> > +    if _buildtype =3D=3D 'debug':
>> > +        return 'debugoptimized'
>> > +    return 'plain'
>> > +MESON_BUILDTYPE =3D "${@check_buildtype(d)}"
>> > +
>> > +EXTRA_OEMESON =3D " \
>> > +    -Dshared-glapi=3Denabled \
>> > +    -Dglx-read-only-text=3Dtrue \
>> > +    -Dplatforms=3D'${@",".join("${PLATFORMS}".split())}' \
>> > +"
>> > +
>> > +EXTRA_OEMESON:append:class-target =3D " ${@bb.utils.contains('PACKAGE=
CONFIG', 'opencl', '-Dintel-clc=3Dsystem', '', d)}"
>> > +EXTRA_OEMESON:append:class-native =3D " ${@bb.utils.contains('PACKAGE=
CONFIG', 'opencl', '-Dintel-clc=3Denabled', '', d)}"
>> > +
>> > +def strip_comma(s):
>> > +    return s.strip(',')
>> > +
>> > +PACKAGECONFIG =3D " \
>> > +     gallium \
>> > +     video-codecs \
>> > +     ${@bb.utils.filter('DISTRO_FEATURES', 'x11 vulkan wayland', d)} =
\
>> > +     ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'opengl egl gl=
es gbm virgl', '', d)} \
>> > +     ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'dri3', ''=
, d)} \
>> > +     ${@bb.utils.contains('DISTRO_FEATURES', 'x11 vulkan', 'dri3', ''=
, d)} \
>> > +     ${@bb.utils.contains('DISTRO_FEATURES', 'vulkan', 'zink', '', d)=
} \
>> > +"
>> > +
>> > +PACKAGECONFIG:append:class-native =3D " gallium-llvm r600"
>> > +
>> > +# "gbm" requires "opengl"
>> > +PACKAGECONFIG[gbm] =3D "-Dgbm=3Denabled,-Dgbm=3Ddisabled"
>> > +
>> > +X11_DEPS =3D "xorgproto virtual/libx11 libxext libxxf86vm libxdamage =
libxfixes xrandr"
>> > +# "x11" requires "opengl"
>> > +PACKAGECONFIG[x11] =3D ",-Dglx=3Ddisabled,${X11_DEPS}"
>> > +PACKAGECONFIG[wayland] =3D ",,wayland-native wayland libdrm wayland-p=
rotocols"
>> > +
>> > +PACKAGECONFIG[dri3] =3D "-Ddri3=3Denabled, -Ddri3=3Ddisabled, xorgpro=
to libxshmfence"
>> > +
>> > +# Vulkan drivers need dri3 enabled
>> > +# amd could be enabled as well but requires gallium-llvm with llvm >=
=3D 3.9
>> > +VULKAN_DRIVERS =3D ""
>> > +VULKAN_DRIVERS:append:x86 =3D ",intel,amd"
>> > +VULKAN_DRIVERS:append:x86-64 =3D ",intel,amd"
>> > +# i686 is a 32 bit override for mesa-native
>> > +VULKAN_DRIVERS:append:i686 =3D ",intel,amd"
>> > +VULKAN_DRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'fre=
edreno', ',freedreno', '', d)}"
>> > +VULKAN_DRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'bro=
adcom', ',broadcom', '', d)}"
>> > +VULKAN_DRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'gal=
lium-llvm', ',swrast', '', d)}"
>> > +VULKAN_DRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'ima=
gination', ',imagination-experimental', '', d)}"
>> > +PACKAGECONFIG[vulkan] =3D "-Dvulkan-drivers=3D${@strip_comma('${VULKA=
N_DRIVERS}')}, -Dvulkan-drivers=3D'',glslang-native vulkan-loader vulkan-he=
aders"
>> > +
>> > +# mesa development and testing tools support, per driver
>> > +TOOLS =3D ""
>> > +TOOLS_DEPS =3D ""
>> > +TOOLS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'etnaviv', ',=
etnaviv', '', d)}"
>> > +TOOLS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'freedreno', =
',freedreno', '', d)}"
>> > +TOOLS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'lima', ',lim=
a', '', d)}"
>> > +TOOLS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'panfrost', '=
,panfrost', '', d)}"
>> > +TOOLS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'imagination'=
, ',imagination', '', d)}"
>> > +
>> > +# dependencies for tools.
>> > +TOOLS_DEPS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'freedre=
no', ' ncurses libxml2 ', '', d)}"
>> > +
>> > +# the fdperf tool requires libconfig (a part of meta-oe) so it needs =
special
>> > +# treatment in addition to the usual 'freedreno tools'.
>> > +PACKAGECONFIG[freedreno-fdperf] =3D ",,libconfig"
>> > +
>> > +PACKAGECONFIG[tools] =3D "-Dtools=3D${@strip_comma('${TOOLS}')}, -Dto=
ols=3D'', ${TOOLS_DEPS}"
>> > +
>> > +PACKAGECONFIG[opengl] =3D "-Dopengl=3Dtrue, -Dopengl=3Dfalse"
>> > +PACKAGECONFIG[glvnd] =3D "-Dglvnd=3Dtrue, -Dglvnd=3Dfalse, libglvnd"
>> > +
>> > +# "gles" requires "opengl"
>> > +PACKAGECONFIG[gles] =3D "-Dgles1=3Denabled -Dgles2=3Denabled, -Dgles1=
=3Ddisabled -Dgles2=3Ddisabled"
>> > +
>> > +# "egl" requires "opengl"
>> > +PACKAGECONFIG[egl] =3D "-Degl=3Denabled, -Degl=3Ddisabled"
>> > +
>> > +# "opencl" requires libclc from meta-clang and spirv-tools from OE-Co=
re
>> > +OPENCL_NATIVE =3D "${@bb.utils.contains('PACKAGECONFIG', 'freedreno',=
 '-Dopencl-native=3Dtrue', '', d)}"
>> > +PACKAGECONFIG[opencl] =3D "-Dgallium-opencl=3Dicd -Dopencl-spirv=3Dtr=
ue ${OPENCL_NATIVE},-Dgallium-opencl=3Ddisabled -Dopencl-spirv=3Dfalse,libc=
lc spirv-tools python3-ply-native"
>> > +
>> > +PACKAGECONFIG[broadcom] =3D ""
>> > +PACKAGECONFIG[etnaviv] =3D ",,python3-pycparser-native"
>> > +PACKAGECONFIG[freedreno] =3D ""
>> > +PACKAGECONFIG[kmsro] =3D ""
>> > +PACKAGECONFIG[vc4] =3D ""
>> > +PACKAGECONFIG[v3d] =3D ""
>> > +PACKAGECONFIG[zink] =3D ""
>> > +
>> > +GALLIUMDRIVERS =3D "swrast"
>> > +# gallium swrast was found to crash Xorg on startup in x32 qemu
>> > +GALLIUMDRIVERS:x86-x32 =3D ""
>> > +GALLIUMDRIVERS:append:x86 =3D ",i915,iris,crocus"
>> > +GALLIUMDRIVERS:append:x86-64 =3D ",i915,iris,crocus"
>> > +# i686 is a 32 bit override for mesa-native
>> > +GALLIUMDRIVERS:append:i686 =3D ",i915,iris,crocus"
>> > +
>> > +GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'etn=
aviv', ',etnaviv', '', d)}"
>> > +GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'fre=
edreno', ',freedreno', '', d)}"
>> > +GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'kms=
ro', ',kmsro', '', d)}"
>> > +GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'vc4=
', ',vc4', '', d)}"
>> > +GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'v3d=
', ',v3d', '', d)}"
>> > +GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'zin=
k', ',zink', '', d)}"
>> > +
>> > +# radeonsi requires LLVM
>> > +GALLIUMDRIVERS_RADEONSI =3D "${@bb.utils.contains('PACKAGECONFIG', 'r=
600', ',radeonsi', '', d)}"
>> > +GALLIUMDRIVERS_LLVM =3D ",r300,nouveau${GALLIUMDRIVERS_RADEONSI}"
>> > +GALLIUMDRIVERS_LLVM:append:x86 =3D ",svga"
>> > +GALLIUMDRIVERS_LLVM:append:x86-64 =3D ",svga"
>> > +# i686 is a 32 bit override for mesa-native
>> > +GALLIUMDRIVERS_LLVM:append:i686 =3D ",svga"
>> > +
>> > +PACKAGECONFIG[r600] =3D ""
>> > +PACKAGECONFIG[virgl] =3D ""
>> > +
>> > +GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'gal=
lium-llvm', '${GALLIUMDRIVERS_LLVM}', '', d)}"
>> > +GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'r60=
0', ',r600', '', d)}"
>> > +GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'vir=
gl', ',virgl', '', d)}"
>> > +
>> > +PACKAGECONFIG[gallium] =3D "-Dgallium-drivers=3D${@strip_comma('${GAL=
LIUMDRIVERS}')}, -Dgallium-drivers=3D'', libdrm"
>> > +PACKAGECONFIG[gallium-llvm] =3D "-Dllvm=3Denabled -Dshared-llvm=3Dena=
bled, -Dllvm=3Ddisabled, llvm llvm-native elfutils"
>> > +PACKAGECONFIG[xa]  =3D "-Dgallium-xa=3Denabled, -Dgallium-xa=3Ddisabl=
ed"
>> > +PACKAGECONFIG[va] =3D "-Dgallium-va=3Denabled,-Dgallium-va=3Ddisabled=
,libva-initial"
>> > +PACKAGECONFIG[vdpau] =3D "-Dgallium-vdpau=3Denabled,-Dgallium-vdpau=
=3Ddisabled,libvdpau"
>> > +
>> > +PACKAGECONFIG[imagination] =3D "-Dimagination-srv=3Dtrue,-Dimaginatio=
n-srv=3Dfalse"
>> > +
>> > +PACKAGECONFIG[lima] =3D ""
>> > +GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'lim=
a', ',lima', '', d)}"
>> > +
>> > +PACKAGECONFIG[panfrost] =3D ""
>> > +GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'pan=
frost', ',panfrost', '', d)}"
>> > +
>> > +PACKAGECONFIG[tegra] =3D ""
>> > +GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'teg=
ra', ',tegra,nouveau', '', d)}"
>> > +
>> > +PACKAGECONFIG[vulkan-beta] =3D "-Dvulkan-beta=3Dtrue,-Dvulkan-beta=3D=
false"
>> > +
>> > +PACKAGECONFIG[osmesa] =3D "-Dosmesa=3Dtrue,-Dosmesa=3Dfalse"
>> > +
>> > +PACKAGECONFIG[perfetto] =3D "-Dperfetto=3Dtrue,-Dperfetto=3Dfalse,lib=
perfetto"
>> > +
>> > +PACKAGECONFIG[unwind] =3D "-Dlibunwind=3Denabled,-Dlibunwind=3Ddisabl=
ed,libunwind"
>> > +
>> > +PACKAGECONFIG[lmsensors] =3D "-Dlmsensors=3Denabled,-Dlmsensors=3Ddis=
abled,lmsensors"
>> > +
>> > +VIDEO_CODECS ?=3D "${@bb.utils.contains('LICENSE_FLAGS_ACCEPTED', 'co=
mmercial', 'all', 'all_free', d)}"
>> > +PACKAGECONFIG[video-codecs] =3D "-Dvideo-codecs=3D${VIDEO_CODECS}, -D=
video-codecs=3D''"
>> > +
>> > +# llvmpipe is slow if compiled with -fomit-frame-pointer (e.g. -O2)
>> > +FULL_OPTIMIZATION:append =3D " -fno-omit-frame-pointer"
>> > +
>> > +CFLAGS:append:armv5 =3D " -DMISSING_64BIT_ATOMICS"
>> > +CFLAGS:append:armv6 =3D " -DMISSING_64BIT_ATOMICS"
>> > +
>> > +# Remove the mesa dependency on mesa-dev, as mesa is empty
>> > +DEV_PKG_DEPENDENCY =3D ""
>> > +
>> > +# Khronos documentation says that include/GLES2/gl2ext.h can be used =
for
>> > +# OpenGL ES 3 specification as well as for OpenGL ES 2.
>> > +# There can be applications including GLES2/gl2ext.h instead of GLES3=
/gl3ext.h
>> > +# meaning we should probably bring in GLES2/gl2ext.h if someone asks =
for
>> > +# development package of libgles3.
>> > +RDEPENDS:libgles3-mesa-dev +=3D "libgles2-mesa-dev"
>> > +
>> > +# GLES2 and GLES3 implementations are packaged in a single library in=
 libgles2-mesa.
>> > +# Add a dependency so the GLES3 dev package is associated with its im=
plementation.
>> > +RDEPENDS:libgles2-mesa +=3D "libgles3-mesa"
>> > +ALLOW_EMPTY:libgles3-mesa =3D "1"
>> > +
>> > +RDEPENDS:libopencl-mesa +=3D "${@bb.utils.contains('PACKAGECONFIG', '=
opencl', 'libclc spirv-tools', '', d)}"
>> > +
>> > +PACKAGES =3D+ "libegl-mesa libegl-mesa-dev \
>> > +             libosmesa libosmesa-dev \
>> > +             libgl-mesa libgl-mesa-dev \
>> > +             libglx-mesa libglx-mesa-dev \
>> > +             libglapi libglapi-dev \
>> > +             libgbm libgbm-dev \
>> > +             libgles1-mesa libgles1-mesa-dev \
>> > +             libgles2-mesa libgles2-mesa-dev \
>> > +             libgles3-mesa libgles3-mesa-dev \
>> > +             libopencl-mesa libopencl-mesa-dev \
>> > +             libxatracker libxatracker-dev \
>> > +             mesa-megadriver mesa-vulkan-drivers \
>> > +             mesa-vdpau-drivers mesa-tools \
>> > +            "
>> > +
>> > +do_install:append () {
>> > +    # Drivers never need libtool .la files
>> > +    rm -f ${D}${libdir}/dri/*.la
>> > +    rm -f ${D}${libdir}/egl/*.la
>> > +    rm -f ${D}${libdir}/gallium-pipe/*.la
>> > +    rm -f ${D}${libdir}/gbm/*.la
>> > +
>> > +    # libwayland-egl has been moved to wayland 1.15+
>> > +    rm -f ${D}${libdir}/libwayland-egl*
>> > +    rm -f ${D}${libdir}/pkgconfig/wayland-egl.pc
>> > +}
>> > +
>> > +do_install:append:class-native () {
>> > +    if ${@bb.utils.contains('PACKAGECONFIG', 'opencl', 'true', 'false=
', d)}; then
>> > +        install -d ${D}${bindir}
>> > +        install -m0755 ${B}/src/intel/compiler/intel_clc ${D}${bindir=
}
>> > +    fi
>> > +}
>> > +
>> > +# For the packages that make up the OpenGL interfaces, inject variabl=
es so that
>> > +# they don't get Debian-renamed (which would remove the -mesa suffix)=
, and
>> > +# RPROVIDEs/RCONFLICTs on the generic libgl name.
>> > +python __anonymous() {
>> > +    pkgconfig =3D (d.getVar('PACKAGECONFIG') or "").split()
>> > +    suffix =3D ""
>> > +    if "-native" in d.getVar("PN"):
>> > +        suffix =3D "-native"
>> > +    for p in (("egl", "libegl", "libegl1"),
>> > +              ("opengl", "libgl", "libgl1"),
>> > +              ("glvnd", "libglx",),
>> > +              ("gles", "libgles1", "libglesv1-cm1"),
>> > +              ("gles", "libgles2", "libglesv2-2"),
>> > +              ("gles", "libgles3",),
>> > +              ("opencl", "libopencl",)):
>> > +        if not p[0] in pkgconfig:
>> > +            continue
>> > +        mlprefix =3D d.getVar("MLPREFIX")
>> > +        fullp =3D mlprefix + p[1] + "-mesa" + suffix
>> > +        mlprefix =3D d.getVar("MLPREFIX")
>> > +        pkgs =3D " " + " ".join(mlprefix + x + suffix for x in p[1:])
>> > +        d.setVar("DEBIAN_NOAUTONAME:" + fullp, "1")
>> > +        d.appendVar("RREPLACES:" + fullp, pkgs)
>> > +        d.appendVar("RPROVIDES:" + fullp, pkgs)
>> > +        d.appendVar("RCONFLICTS:" + fullp, pkgs)
>> > +
>> > +        d.appendVar("RRECOMMENDS:" + fullp, " ${MLPREFIX}mesa-megadri=
ver" + suffix)
>> > +
>> > +        # For -dev, the first element is both the Debian and original=
 name
>> > +        fullp =3D mlprefix + p[1] + "-mesa-dev" + suffix
>> > +        pkgs =3D " " + mlprefix + p[1] + "-dev" + suffix
>> > +        d.setVar("DEBIAN_NOAUTONAME:" + fullp, "1")
>> > +        d.appendVar("RREPLACES:" + fullp, pkgs)
>> > +        d.appendVar("RPROVIDES:" + fullp, pkgs)
>> > +        d.appendVar("RCONFLICTS:" + fullp, pkgs)
>> > +}
>> > +
>> > +python mesa_populate_packages() {
>> > +    pkgs =3D ['mesa', 'mesa-dev', 'mesa-dbg']
>> > +    for pkg in pkgs:
>> > +        d.setVar("RPROVIDES:%s" % pkg, pkg.replace("mesa", "mesa-dri"=
, 1))
>> > +        d.setVar("RCONFLICTS:%s" % pkg, pkg.replace("mesa", "mesa-dri=
", 1))
>> > +        d.setVar("RREPLACES:%s" % pkg, pkg.replace("mesa", "mesa-dri"=
, 1))
>> > +
>> > +    import re
>> > +    dri_drivers_root =3D oe.path.join(d.getVar('PKGD'), d.getVar('lib=
dir'), "dri")
>> > +    if os.path.isdir(dri_drivers_root):
>> > +        dri_pkgs =3D sorted(os.listdir(dri_drivers_root))
>> > +        lib_name =3D d.expand("${MLPREFIX}mesa-megadriver")
>> > +        for p in dri_pkgs:
>> > +            m =3D re.match(r'^(.*)_dri\.so$', p)
>> > +            if m:
>> > +                pkg_name =3D " ${MLPREFIX}mesa-driver-%s" % legitimiz=
e_package_name(m.group(1))
>> > +                d.appendVar("RPROVIDES:%s" % lib_name, pkg_name)
>> > +                d.appendVar("RCONFLICTS:%s" % lib_name, pkg_name)
>> > +                d.appendVar("RREPLACES:%s" % lib_name, pkg_name)
>> > +
>> > +    pipe_drivers_root =3D os.path.join(d.getVar('libdir'), "gallium-p=
ipe")
>> > +    do_split_packages(d, pipe_drivers_root, r'^pipe_(.*)\.so$', 'mesa=
-driver-pipe-%s', 'Mesa %s pipe driver', extra_depends=3D'')
>> > +}
>> > +
>> > +PACKAGESPLITFUNCS =3D+ "mesa_populate_packages"
>> > +
>> > +PACKAGES_DYNAMIC +=3D "^mesa-driver-.*"
>> > +PACKAGES_DYNAMIC:class-native =3D "^mesa-driver-.*-native"
>> > +
>> > +FILES:mesa-megadriver =3D "${libdir}/dri/* ${datadir}/drirc.d"
>> > +FILES:mesa-vulkan-drivers =3D "${libdir}/libvulkan_*.so ${libdir}/lib=
powervr_rogue.so ${datadir}/vulkan"
>> > +FILES:${PN}-vdpau-drivers =3D "${libdir}/vdpau/*.so.*"
>> > +FILES:libegl-mesa =3D "${libdir}/libEGL*.so.* ${datadir}/glvnd/egl_ve=
ndor.d"
>> > +FILES:libgbm =3D "${libdir}/libgbm.so.*"
>> > +FILES:libgles1-mesa =3D "${libdir}/libGLESv1*.so.*"
>> > +FILES:libgles2-mesa =3D "${libdir}/libGLESv2.so.*"
>> > +FILES:libgl-mesa =3D "${libdir}/libGL.so.*"
>> > +FILES:libglx-mesa =3D "${libdir}/libGLX*.so.*"
>> > +FILES:libopencl-mesa =3D "${libdir}/libMesaOpenCL.so.* ${libdir}/gall=
ium-pipe/*.so ${sysconfdir}/OpenCL/vendors/mesa.icd"
>> > +FILES:libglapi =3D "${libdir}/libglapi.so.*"
>> > +FILES:libosmesa =3D "${libdir}/libOSMesa.so.*"
>> > +FILES:libxatracker =3D "${libdir}/libxatracker.so.*"
>> > +
>> > +FILES:${PN}-dev =3D "${libdir}/pkgconfig/dri.pc ${includedir}/vulkan =
${libdir}/vdpau/*.so"
>> > +FILES:libegl-mesa-dev =3D "${libdir}/libEGL*.* ${includedir}/EGL ${in=
cludedir}/KHR ${libdir}/pkgconfig/egl.pc"
>> > +FILES:libgbm-dev =3D "${libdir}/libgbm.* ${libdir}/pkgconfig/gbm.pc $=
{includedir}/gbm.h"
>> > +FILES:libgl-mesa-dev =3D "${libdir}/libGL.* ${includedir}/GL ${libdir=
}/pkgconfig/gl.pc"
>> > +FILES:libglx-mesa-dev =3D "${libdir}/libGLX*.*"
>> > +FILES:libglapi-dev =3D "${libdir}/libglapi.*"
>> > +FILES:libgles1-mesa-dev =3D "${libdir}/libGLESv1*.* ${includedir}/GLE=
S ${libdir}/pkgconfig/glesv1*.pc"
>> > +FILES:libgles2-mesa-dev =3D "${libdir}/libGLESv2.* ${includedir}/GLES=
2 ${libdir}/pkgconfig/glesv2.pc"
>> > +FILES:libgles3-mesa-dev =3D "${includedir}/GLES3"
>> > +FILES:libopencl-mesa-dev =3D "${libdir}/libMesaOpenCL.so"
>> > +FILES:libosmesa-dev =3D "${libdir}/libOSMesa.* ${includedir}/GL/osmes=
a.h ${libdir}/pkgconfig/osmesa.pc"
>> > +FILES:libxatracker-dev =3D "${libdir}/libxatracker.so ${libdir}/libxa=
tracker.la \
>> > +                          ${includedir}/xa_tracker.h ${includedir}/xa=
_composite.h ${includedir}/xa_context.h \
>> > +                          ${libdir}/pkgconfig/xatracker.pc"
>> > +# catch all to get all the tools and data
>> > +FILES:${PN}-tools =3D "${bindir} ${datadir}"
>> > +ALLOW_EMPTY:${PN}-tools =3D "1"
>> > +
>> > +# Fix upgrade path from mesa to mesa-megadriver
>> > +RREPLACES:mesa-megadriver =3D "mesa"
>> > +RCONFLICTS:mesa-megadriver =3D "mesa"
>> > +RPROVIDES:mesa-megadriver =3D "mesa"
>> > diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_22.3.5.bb b/me=
ta-ti-bsp/recipes-graphics/mesa/mesa-pvr_22.3.5.bb
>> > index bdc9ce16dcbd..5af196aa7df4 100644
>> > --- a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_22.3.5.bb
>> > +++ b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_22.3.5.bb
>> > @@ -2,7 +2,7 @@
>> >   # upstream yet. This allows us to build the shims we need without co=
mpletely
>> >   # clobbering mesa.
>> >
>> > -require recipes-graphics/mesa/mesa.inc
>> > +require recipes-graphics/mesa/mesa-pvr.inc
>> >
>> >   SUMMARY +=3D " (with PowerVR support for TI platforms)"
>> >
>> > diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_24.0.1.bb b/me=
ta-ti-bsp/recipes-graphics/mesa/mesa-pvr_24.0.1.bb
>> > index 1ac022d2f8ab..e834355cf208 100644
>> > --- a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_24.0.1.bb
>> > +++ b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_24.0.1.bb
>> > @@ -2,7 +2,7 @@
>> >   # upstream yet. This allows us to build the shims we need without co=
mpletely
>> >   # clobbering mesa.
>> >
>> > -require recipes-graphics/mesa/mesa.inc
>> > +require recipes-graphics/mesa/mesa-pvr.inc
>> >
>> >   SUMMARY +=3D " (with PowerVR support for TI platforms)"
>> >
>> >
>> >
>> >
>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> > Links: You receive all messages sent to this group.
>> > View/Reply Online (#18464): https://lists.yoctoproject.org/g/meta-ti/m=
essage/18464
>> > Mute This Topic: https://lists.yoctoproject.org/mt/112254197/6551054
>> > Group Owner: meta-ti+owner@lists.yoctoproject.org
>> > Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [reatmon@t=
i.com]
>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> >
>>
>> --
>> Ryan Eatmon                reatmon@ti.com
>> -----------------------------------------
>> Texas Instruments, Inc.  -  LCPD  -  MGTS


