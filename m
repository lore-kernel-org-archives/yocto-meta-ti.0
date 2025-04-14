Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9110DC369A2
	for <webhook@archiver.kernel.org>; Mon, 14 Apr 2025 14:24:53 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.51077.1744640685137216986
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 14 Apr 2025 07:24:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=tx/J3iNG;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53EEOh9f2772239
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 14 Apr 2025 09:24:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744640683;
	bh=yu339ygV8//RdQNaPhH6NYBOBaQzZqTD8CduxE+i73A=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=tx/J3iNGcJ2D3v182WxTVFL42dOWyFt9nCaAJmny9oqjY8dzl0HLCp6Q5GONO23qW
	 ucH+A+jy/sSzs3v8GX8yawGrFXSj0M9BwP8u3yOuYULlQrOu9A5QZn+e0DcowLS7b/
	 V/QkPZCCdtg/qH6JyXkoNYQpx61uaqAAUsCH532U=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53EEOh5Z078815
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 14 Apr 2025 09:24:43 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 14
 Apr 2025 09:24:43 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 14 Apr 2025 09:24:42 -0500
Received: from [10.249.33.29] ([10.249.33.29])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53EEOhwF128987;
	Mon, 14 Apr 2025 09:24:43 -0500
Message-ID: <54301279-5493-433e-a4a1-91450d507e48@ti.com>
Date: Mon, 14 Apr 2025 09:24:43 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] [PATCH] mesa-pvr: add local copy of mesa.inc
To: <max.oss.09@gmail.com>, <meta-ti@lists.yoctoproject.org>
CC: <rs@ti.com>, Max Krummenacher <max.krummenacher@toradex.com>
References: <20250414094441.3181639-1-max.oss.09@gmail.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20250414094441.3181639-1-max.oss.09@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 14 Apr 2025 14:24:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18465


I assume this is for master only?  It's missing in the subject...


On 4/14/2025 4:44 AM, Max Krummenacher via lists.yoctoproject.org wrote:
> From: Max Krummenacher <max.krummenacher@toradex.com>
> 
> OE-core updated mesa to 25.0.2 [1]. The resulting mesa.inc file no
> longer matches mesa recipes building older versions.
> Copy the mesa.inc version from before the update renamed to
> mesa-pvr.inc to work around the issue.
> 
> | ../git/meson.build:21:0: ERROR: Value "softpipe" for option "gallium-drivers" is not in allowed choices: "auto, kmsro, radeonsi, r300, r600, nouveau, freedreno, swrast, v3d, vc4, etnaviv, tegra, i915, svga, virgl, panfrost, iris, lima, zink, d3d12, asahi, crocus, pvr, sgx, all"
> 
> [1] https://git.openembedded.org/openembedded-core/commit/?id=f9eb0468e45ee5a6a3b3195ef5e78c328c4347c9
> 
> Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
> ---
> 
> I don't know if mesa 25.0.2 does have the changes from meta-pvr merged
> so that instead of keeping meta-pvr working one could now use mesa 25
> from OE with the appropriate packageconfigs.
> 
> Regards
> Max
> 
>   .../recipes-graphics/mesa/mesa-pvr.inc        | 380 ++++++++++++++++++
>   .../recipes-graphics/mesa/mesa-pvr_22.3.5.bb  |   2 +-
>   .../recipes-graphics/mesa/mesa-pvr_24.0.1.bb  |   2 +-
>   3 files changed, 382 insertions(+), 2 deletions(-)
>   create mode 100644 meta-ti-bsp/recipes-graphics/mesa/mesa-pvr.inc
> 
> diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr.inc b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr.inc
> new file mode 100644
> index 000000000000..471475ff58cf
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr.inc
> @@ -0,0 +1,380 @@
> +# Copy of mesa.inc from OE-core before commit f9eb0468e45e ("mesa: upgrade 24.0.7 -> 25.0.2")
> +
> +SUMMARY = "A free implementation of the OpenGL API"
> +DESCRIPTION = "Mesa is an open-source implementation of the OpenGL specification - \
> +a system for rendering interactive 3D graphics.  \
> +A variety of device drivers allows Mesa to be used in many different environments \
> +ranging from software emulation to complete hardware acceleration for modern GPUs. \
> +Mesa is used as part of the overall Direct Rendering Infrastructure and X.org \
> +environment."
> +
> +HOMEPAGE = "http://mesa3d.org"
> +BUGTRACKER = "https://bugs.freedesktop.org"
> +SECTION = "x11"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://docs/license.rst;md5=63779ec98d78d823a9dc533a0735ef10"
> +
> +PE = "2"
> +
> +SRC_URI = "https://archive.mesa3d.org/mesa-${PV}.tar.xz \
> +           file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
> +           file://0001-drisw-fix-build-without-dri3.patch \
> +           file://0002-glxext-don-t-try-zink-if-not-enabled-in-mesa.patch \
> +           file://0001-Revert-meson-do-not-pull-in-clc-for-clover.patch \
> +           file://0001-amd-Include-missing-llvm-IR-header-Module.h.patch \
> +           file://0001-freedreno-don-t-encode-build-path-into-binaries.patch\
> +"
> +
> +SRC_URI[sha256sum] = "7454425f1ed4a6f1b5b107e1672b30c88b22ea0efea000ae2c7d96db93f6c26a"
> +PV = "24.0.7"
> +
> +UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
> +
> +#because we cannot rely on the fact that all apps will use pkgconfig,
> +#make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
> +do_install:append() {
> +  # sed can't find EGL/eglplatform.h as it doesn't get installed when glvnd enabled.
> +  # So, check if EGL/eglplatform.h exists before running sed.
> +  if ${@bb.utils.contains('PACKAGECONFIG', 'egl', 'true', 'false', d)} && [ -f ${D}${includedir}/EGL/eglplatform.h ]; then
> +      sed -i -e 's/^#elif defined(__unix__) && defined(EGL_NO_X11)$/#elif defined(__unix__) \&\& defined(EGL_NO_X11) || ${@bb.utils.contains('PACKAGECONFIG', 'x11', '0', '1', d)}/' ${D}${includedir}/EGL/eglplatform.h
> +  fi
> +}
> +
> +DEPENDS = "expat makedepend-native flex-native bison-native libxml2-native zlib chrpath-replacement-native python3-mako-native gettext-native"
> +DEPENDS:append:class-target = " ${@bb.utils.contains('PACKAGECONFIG', 'opencl', 'mesa-native', '', d)}"
> +EXTRANATIVEPATH += "chrpath-native"
> +PROVIDES = " \
> +    ${@bb.utils.contains('PACKAGECONFIG', 'opengl', 'virtual/libgl', '', d)} \
> +    ${@bb.utils.contains('PACKAGECONFIG', 'glvnd', 'virtual/libglx', '', d)} \
> +    ${@bb.utils.contains('PACKAGECONFIG', 'gles', 'virtual/libgles1 virtual/libgles2 virtual/libgles3', '', d)} \
> +    ${@bb.utils.contains('PACKAGECONFIG', 'egl', 'virtual/egl', '', d)} \
> +    ${@bb.utils.contains('PACKAGECONFIG', 'gbm', 'virtual/libgbm', '', d)} \
> +    virtual/mesa \
> +    "
> +
> +inherit meson pkgconfig python3native gettext features_check
> +
> +BBCLASSEXTEND = "native nativesdk"
> +
> +ANY_OF_DISTRO_FEATURES = "opengl vulkan"
> +
> +PLATFORMS ??= "${@bb.utils.filter('PACKAGECONFIG', 'x11 wayland', d)}"
> +
> +# set the MESA_BUILD_TYPE to either 'release' (default) or 'debug'
> +# by default the upstream mesa sources build a debug release
> +# here we assume the user will want a release build by default
> +MESA_BUILD_TYPE ?= "release"
> +def check_buildtype(d):
> +    _buildtype = d.getVar('MESA_BUILD_TYPE')
> +    if _buildtype not in ['release', 'debug']:
> +        bb.fatal("unknown build type (%s), please set MESA_BUILD_TYPE to either 'release' or 'debug'" % _buildtype)
> +    if _buildtype == 'debug':
> +        return 'debugoptimized'
> +    return 'plain'
> +MESON_BUILDTYPE = "${@check_buildtype(d)}"
> +
> +EXTRA_OEMESON = " \
> +    -Dshared-glapi=enabled \
> +    -Dglx-read-only-text=true \
> +    -Dplatforms='${@",".join("${PLATFORMS}".split())}' \
> +"
> +
> +EXTRA_OEMESON:append:class-target = " ${@bb.utils.contains('PACKAGECONFIG', 'opencl', '-Dintel-clc=system', '', d)}"
> +EXTRA_OEMESON:append:class-native = " ${@bb.utils.contains('PACKAGECONFIG', 'opencl', '-Dintel-clc=enabled', '', d)}"
> +
> +def strip_comma(s):
> +    return s.strip(',')
> +
> +PACKAGECONFIG = " \
> +	gallium \
> +	video-codecs \
> +	${@bb.utils.filter('DISTRO_FEATURES', 'x11 vulkan wayland', d)} \
> +	${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'opengl egl gles gbm virgl', '', d)} \
> +	${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'dri3', '', d)} \
> +	${@bb.utils.contains('DISTRO_FEATURES', 'x11 vulkan', 'dri3', '', d)} \
> +	${@bb.utils.contains('DISTRO_FEATURES', 'vulkan', 'zink', '', d)} \
> +"
> +
> +PACKAGECONFIG:append:class-native = " gallium-llvm r600"
> +
> +# "gbm" requires "opengl"
> +PACKAGECONFIG[gbm] = "-Dgbm=enabled,-Dgbm=disabled"
> +
> +X11_DEPS = "xorgproto virtual/libx11 libxext libxxf86vm libxdamage libxfixes xrandr"
> +# "x11" requires "opengl"
> +PACKAGECONFIG[x11] = ",-Dglx=disabled,${X11_DEPS}"
> +PACKAGECONFIG[wayland] = ",,wayland-native wayland libdrm wayland-protocols"
> +
> +PACKAGECONFIG[dri3] = "-Ddri3=enabled, -Ddri3=disabled, xorgproto libxshmfence"
> +
> +# Vulkan drivers need dri3 enabled
> +# amd could be enabled as well but requires gallium-llvm with llvm >= 3.9
> +VULKAN_DRIVERS = ""
> +VULKAN_DRIVERS:append:x86 = ",intel,amd"
> +VULKAN_DRIVERS:append:x86-64 = ",intel,amd"
> +# i686 is a 32 bit override for mesa-native
> +VULKAN_DRIVERS:append:i686 = ",intel,amd"
> +VULKAN_DRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'freedreno', ',freedreno', '', d)}"
> +VULKAN_DRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'broadcom', ',broadcom', '', d)}"
> +VULKAN_DRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'gallium-llvm', ',swrast', '', d)}"
> +VULKAN_DRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'imagination', ',imagination-experimental', '', d)}"
> +PACKAGECONFIG[vulkan] = "-Dvulkan-drivers=${@strip_comma('${VULKAN_DRIVERS}')}, -Dvulkan-drivers='',glslang-native vulkan-loader vulkan-headers"
> +
> +# mesa development and testing tools support, per driver
> +TOOLS = ""
> +TOOLS_DEPS = ""
> +TOOLS:append = "${@bb.utils.contains('PACKAGECONFIG', 'etnaviv', ',etnaviv', '', d)}"
> +TOOLS:append = "${@bb.utils.contains('PACKAGECONFIG', 'freedreno', ',freedreno', '', d)}"
> +TOOLS:append = "${@bb.utils.contains('PACKAGECONFIG', 'lima', ',lima', '', d)}"
> +TOOLS:append = "${@bb.utils.contains('PACKAGECONFIG', 'panfrost', ',panfrost', '', d)}"
> +TOOLS:append = "${@bb.utils.contains('PACKAGECONFIG', 'imagination', ',imagination', '', d)}"
> +
> +# dependencies for tools.
> +TOOLS_DEPS:append = "${@bb.utils.contains('PACKAGECONFIG', 'freedreno', ' ncurses libxml2 ', '', d)}"
> +
> +# the fdperf tool requires libconfig (a part of meta-oe) so it needs special
> +# treatment in addition to the usual 'freedreno tools'.
> +PACKAGECONFIG[freedreno-fdperf] = ",,libconfig"
> +
> +PACKAGECONFIG[tools] = "-Dtools=${@strip_comma('${TOOLS}')}, -Dtools='', ${TOOLS_DEPS}"
> +
> +PACKAGECONFIG[opengl] = "-Dopengl=true, -Dopengl=false"
> +PACKAGECONFIG[glvnd] = "-Dglvnd=true, -Dglvnd=false, libglvnd"
> +
> +# "gles" requires "opengl"
> +PACKAGECONFIG[gles] = "-Dgles1=enabled -Dgles2=enabled, -Dgles1=disabled -Dgles2=disabled"
> +
> +# "egl" requires "opengl"
> +PACKAGECONFIG[egl] = "-Degl=enabled, -Degl=disabled"
> +
> +# "opencl" requires libclc from meta-clang and spirv-tools from OE-Core
> +OPENCL_NATIVE = "${@bb.utils.contains('PACKAGECONFIG', 'freedreno', '-Dopencl-native=true', '', d)}"
> +PACKAGECONFIG[opencl] = "-Dgallium-opencl=icd -Dopencl-spirv=true ${OPENCL_NATIVE},-Dgallium-opencl=disabled -Dopencl-spirv=false,libclc spirv-tools python3-ply-native"
> +
> +PACKAGECONFIG[broadcom] = ""
> +PACKAGECONFIG[etnaviv] = ",,python3-pycparser-native"
> +PACKAGECONFIG[freedreno] = ""
> +PACKAGECONFIG[kmsro] = ""
> +PACKAGECONFIG[vc4] = ""
> +PACKAGECONFIG[v3d] = ""
> +PACKAGECONFIG[zink] = ""
> +
> +GALLIUMDRIVERS = "swrast"
> +# gallium swrast was found to crash Xorg on startup in x32 qemu
> +GALLIUMDRIVERS:x86-x32 = ""
> +GALLIUMDRIVERS:append:x86 = ",i915,iris,crocus"
> +GALLIUMDRIVERS:append:x86-64 = ",i915,iris,crocus"
> +# i686 is a 32 bit override for mesa-native
> +GALLIUMDRIVERS:append:i686 = ",i915,iris,crocus"
> +
> +GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'etnaviv', ',etnaviv', '', d)}"
> +GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'freedreno', ',freedreno', '', d)}"
> +GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'kmsro', ',kmsro', '', d)}"
> +GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'vc4', ',vc4', '', d)}"
> +GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'v3d', ',v3d', '', d)}"
> +GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'zink', ',zink', '', d)}"
> +
> +# radeonsi requires LLVM
> +GALLIUMDRIVERS_RADEONSI = "${@bb.utils.contains('PACKAGECONFIG', 'r600', ',radeonsi', '', d)}"
> +GALLIUMDRIVERS_LLVM = ",r300,nouveau${GALLIUMDRIVERS_RADEONSI}"
> +GALLIUMDRIVERS_LLVM:append:x86 = ",svga"
> +GALLIUMDRIVERS_LLVM:append:x86-64 = ",svga"
> +# i686 is a 32 bit override for mesa-native
> +GALLIUMDRIVERS_LLVM:append:i686 = ",svga"
> +
> +PACKAGECONFIG[r600] = ""
> +PACKAGECONFIG[virgl] = ""
> +
> +GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'gallium-llvm', '${GALLIUMDRIVERS_LLVM}', '', d)}"
> +GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'r600', ',r600', '', d)}"
> +GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'virgl', ',virgl', '', d)}"
> +
> +PACKAGECONFIG[gallium] = "-Dgallium-drivers=${@strip_comma('${GALLIUMDRIVERS}')}, -Dgallium-drivers='', libdrm"
> +PACKAGECONFIG[gallium-llvm] = "-Dllvm=enabled -Dshared-llvm=enabled, -Dllvm=disabled, llvm llvm-native elfutils"
> +PACKAGECONFIG[xa]  = "-Dgallium-xa=enabled, -Dgallium-xa=disabled"
> +PACKAGECONFIG[va] = "-Dgallium-va=enabled,-Dgallium-va=disabled,libva-initial"
> +PACKAGECONFIG[vdpau] = "-Dgallium-vdpau=enabled,-Dgallium-vdpau=disabled,libvdpau"
> +
> +PACKAGECONFIG[imagination] = "-Dimagination-srv=true,-Dimagination-srv=false"
> +
> +PACKAGECONFIG[lima] = ""
> +GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'lima', ',lima', '', d)}"
> +
> +PACKAGECONFIG[panfrost] = ""
> +GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'panfrost', ',panfrost', '', d)}"
> +
> +PACKAGECONFIG[tegra] = ""
> +GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'tegra', ',tegra,nouveau', '', d)}"
> +
> +PACKAGECONFIG[vulkan-beta] = "-Dvulkan-beta=true,-Dvulkan-beta=false"
> +
> +PACKAGECONFIG[osmesa] = "-Dosmesa=true,-Dosmesa=false"
> +
> +PACKAGECONFIG[perfetto] = "-Dperfetto=true,-Dperfetto=false,libperfetto"
> +
> +PACKAGECONFIG[unwind] = "-Dlibunwind=enabled,-Dlibunwind=disabled,libunwind"
> +
> +PACKAGECONFIG[lmsensors] = "-Dlmsensors=enabled,-Dlmsensors=disabled,lmsensors"
> +
> +VIDEO_CODECS ?= "${@bb.utils.contains('LICENSE_FLAGS_ACCEPTED', 'commercial', 'all', 'all_free', d)}"
> +PACKAGECONFIG[video-codecs] = "-Dvideo-codecs=${VIDEO_CODECS}, -Dvideo-codecs=''"
> +
> +# llvmpipe is slow if compiled with -fomit-frame-pointer (e.g. -O2)
> +FULL_OPTIMIZATION:append = " -fno-omit-frame-pointer"
> +
> +CFLAGS:append:armv5 = " -DMISSING_64BIT_ATOMICS"
> +CFLAGS:append:armv6 = " -DMISSING_64BIT_ATOMICS"
> +
> +# Remove the mesa dependency on mesa-dev, as mesa is empty
> +DEV_PKG_DEPENDENCY = ""
> +
> +# Khronos documentation says that include/GLES2/gl2ext.h can be used for
> +# OpenGL ES 3 specification as well as for OpenGL ES 2.
> +# There can be applications including GLES2/gl2ext.h instead of GLES3/gl3ext.h
> +# meaning we should probably bring in GLES2/gl2ext.h if someone asks for
> +# development package of libgles3.
> +RDEPENDS:libgles3-mesa-dev += "libgles2-mesa-dev"
> +
> +# GLES2 and GLES3 implementations are packaged in a single library in libgles2-mesa.
> +# Add a dependency so the GLES3 dev package is associated with its implementation.
> +RDEPENDS:libgles2-mesa += "libgles3-mesa"
> +ALLOW_EMPTY:libgles3-mesa = "1"
> +
> +RDEPENDS:libopencl-mesa += "${@bb.utils.contains('PACKAGECONFIG', 'opencl', 'libclc spirv-tools', '', d)}"
> +
> +PACKAGES =+ "libegl-mesa libegl-mesa-dev \
> +             libosmesa libosmesa-dev \
> +             libgl-mesa libgl-mesa-dev \
> +             libglx-mesa libglx-mesa-dev \
> +             libglapi libglapi-dev \
> +             libgbm libgbm-dev \
> +             libgles1-mesa libgles1-mesa-dev \
> +             libgles2-mesa libgles2-mesa-dev \
> +             libgles3-mesa libgles3-mesa-dev \
> +             libopencl-mesa libopencl-mesa-dev \
> +             libxatracker libxatracker-dev \
> +             mesa-megadriver mesa-vulkan-drivers \
> +             mesa-vdpau-drivers mesa-tools \
> +            "
> +
> +do_install:append () {
> +    # Drivers never need libtool .la files
> +    rm -f ${D}${libdir}/dri/*.la
> +    rm -f ${D}${libdir}/egl/*.la
> +    rm -f ${D}${libdir}/gallium-pipe/*.la
> +    rm -f ${D}${libdir}/gbm/*.la
> +
> +    # libwayland-egl has been moved to wayland 1.15+
> +    rm -f ${D}${libdir}/libwayland-egl*
> +    rm -f ${D}${libdir}/pkgconfig/wayland-egl.pc
> +}
> +
> +do_install:append:class-native () {
> +    if ${@bb.utils.contains('PACKAGECONFIG', 'opencl', 'true', 'false', d)}; then
> +        install -d ${D}${bindir}
> +        install -m0755 ${B}/src/intel/compiler/intel_clc ${D}${bindir}
> +    fi
> +}
> +
> +# For the packages that make up the OpenGL interfaces, inject variables so that
> +# they don't get Debian-renamed (which would remove the -mesa suffix), and
> +# RPROVIDEs/RCONFLICTs on the generic libgl name.
> +python __anonymous() {
> +    pkgconfig = (d.getVar('PACKAGECONFIG') or "").split()
> +    suffix = ""
> +    if "-native" in d.getVar("PN"):
> +        suffix = "-native"
> +    for p in (("egl", "libegl", "libegl1"),
> +              ("opengl", "libgl", "libgl1"),
> +              ("glvnd", "libglx",),
> +              ("gles", "libgles1", "libglesv1-cm1"),
> +              ("gles", "libgles2", "libglesv2-2"),
> +              ("gles", "libgles3",),
> +              ("opencl", "libopencl",)):
> +        if not p[0] in pkgconfig:
> +            continue
> +        mlprefix = d.getVar("MLPREFIX")
> +        fullp = mlprefix + p[1] + "-mesa" + suffix
> +        mlprefix = d.getVar("MLPREFIX")
> +        pkgs = " " + " ".join(mlprefix + x + suffix for x in p[1:])
> +        d.setVar("DEBIAN_NOAUTONAME:" + fullp, "1")
> +        d.appendVar("RREPLACES:" + fullp, pkgs)
> +        d.appendVar("RPROVIDES:" + fullp, pkgs)
> +        d.appendVar("RCONFLICTS:" + fullp, pkgs)
> +
> +        d.appendVar("RRECOMMENDS:" + fullp, " ${MLPREFIX}mesa-megadriver" + suffix)
> +
> +        # For -dev, the first element is both the Debian and original name
> +        fullp = mlprefix + p[1] + "-mesa-dev" + suffix
> +        pkgs = " " + mlprefix + p[1] + "-dev" + suffix
> +        d.setVar("DEBIAN_NOAUTONAME:" + fullp, "1")
> +        d.appendVar("RREPLACES:" + fullp, pkgs)
> +        d.appendVar("RPROVIDES:" + fullp, pkgs)
> +        d.appendVar("RCONFLICTS:" + fullp, pkgs)
> +}
> +
> +python mesa_populate_packages() {
> +    pkgs = ['mesa', 'mesa-dev', 'mesa-dbg']
> +    for pkg in pkgs:
> +        d.setVar("RPROVIDES:%s" % pkg, pkg.replace("mesa", "mesa-dri", 1))
> +        d.setVar("RCONFLICTS:%s" % pkg, pkg.replace("mesa", "mesa-dri", 1))
> +        d.setVar("RREPLACES:%s" % pkg, pkg.replace("mesa", "mesa-dri", 1))
> +
> +    import re
> +    dri_drivers_root = oe.path.join(d.getVar('PKGD'), d.getVar('libdir'), "dri")
> +    if os.path.isdir(dri_drivers_root):
> +        dri_pkgs = sorted(os.listdir(dri_drivers_root))
> +        lib_name = d.expand("${MLPREFIX}mesa-megadriver")
> +        for p in dri_pkgs:
> +            m = re.match(r'^(.*)_dri\.so$', p)
> +            if m:
> +                pkg_name = " ${MLPREFIX}mesa-driver-%s" % legitimize_package_name(m.group(1))
> +                d.appendVar("RPROVIDES:%s" % lib_name, pkg_name)
> +                d.appendVar("RCONFLICTS:%s" % lib_name, pkg_name)
> +                d.appendVar("RREPLACES:%s" % lib_name, pkg_name)
> +
> +    pipe_drivers_root = os.path.join(d.getVar('libdir'), "gallium-pipe")
> +    do_split_packages(d, pipe_drivers_root, r'^pipe_(.*)\.so$', 'mesa-driver-pipe-%s', 'Mesa %s pipe driver', extra_depends='')
> +}
> +
> +PACKAGESPLITFUNCS =+ "mesa_populate_packages"
> +
> +PACKAGES_DYNAMIC += "^mesa-driver-.*"
> +PACKAGES_DYNAMIC:class-native = "^mesa-driver-.*-native"
> +
> +FILES:mesa-megadriver = "${libdir}/dri/* ${datadir}/drirc.d"
> +FILES:mesa-vulkan-drivers = "${libdir}/libvulkan_*.so ${libdir}/libpowervr_rogue.so ${datadir}/vulkan"
> +FILES:${PN}-vdpau-drivers = "${libdir}/vdpau/*.so.*"
> +FILES:libegl-mesa = "${libdir}/libEGL*.so.* ${datadir}/glvnd/egl_vendor.d"
> +FILES:libgbm = "${libdir}/libgbm.so.*"
> +FILES:libgles1-mesa = "${libdir}/libGLESv1*.so.*"
> +FILES:libgles2-mesa = "${libdir}/libGLESv2.so.*"
> +FILES:libgl-mesa = "${libdir}/libGL.so.*"
> +FILES:libglx-mesa = "${libdir}/libGLX*.so.*"
> +FILES:libopencl-mesa = "${libdir}/libMesaOpenCL.so.* ${libdir}/gallium-pipe/*.so ${sysconfdir}/OpenCL/vendors/mesa.icd"
> +FILES:libglapi = "${libdir}/libglapi.so.*"
> +FILES:libosmesa = "${libdir}/libOSMesa.so.*"
> +FILES:libxatracker = "${libdir}/libxatracker.so.*"
> +
> +FILES:${PN}-dev = "${libdir}/pkgconfig/dri.pc ${includedir}/vulkan ${libdir}/vdpau/*.so"
> +FILES:libegl-mesa-dev = "${libdir}/libEGL*.* ${includedir}/EGL ${includedir}/KHR ${libdir}/pkgconfig/egl.pc"
> +FILES:libgbm-dev = "${libdir}/libgbm.* ${libdir}/pkgconfig/gbm.pc ${includedir}/gbm.h"
> +FILES:libgl-mesa-dev = "${libdir}/libGL.* ${includedir}/GL ${libdir}/pkgconfig/gl.pc"
> +FILES:libglx-mesa-dev = "${libdir}/libGLX*.*"
> +FILES:libglapi-dev = "${libdir}/libglapi.*"
> +FILES:libgles1-mesa-dev = "${libdir}/libGLESv1*.* ${includedir}/GLES ${libdir}/pkgconfig/glesv1*.pc"
> +FILES:libgles2-mesa-dev = "${libdir}/libGLESv2.* ${includedir}/GLES2 ${libdir}/pkgconfig/glesv2.pc"
> +FILES:libgles3-mesa-dev = "${includedir}/GLES3"
> +FILES:libopencl-mesa-dev = "${libdir}/libMesaOpenCL.so"
> +FILES:libosmesa-dev = "${libdir}/libOSMesa.* ${includedir}/GL/osmesa.h ${libdir}/pkgconfig/osmesa.pc"
> +FILES:libxatracker-dev = "${libdir}/libxatracker.so ${libdir}/libxatracker.la \
> +                          ${includedir}/xa_tracker.h ${includedir}/xa_composite.h ${includedir}/xa_context.h \
> +                          ${libdir}/pkgconfig/xatracker.pc"
> +# catch all to get all the tools and data
> +FILES:${PN}-tools = "${bindir} ${datadir}"
> +ALLOW_EMPTY:${PN}-tools = "1"
> +
> +# Fix upgrade path from mesa to mesa-megadriver
> +RREPLACES:mesa-megadriver = "mesa"
> +RCONFLICTS:mesa-megadriver = "mesa"
> +RPROVIDES:mesa-megadriver = "mesa"
> diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_22.3.5.bb b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_22.3.5.bb
> index bdc9ce16dcbd..5af196aa7df4 100644
> --- a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_22.3.5.bb
> +++ b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_22.3.5.bb
> @@ -2,7 +2,7 @@
>   # upstream yet. This allows us to build the shims we need without completely
>   # clobbering mesa.
>   
> -require recipes-graphics/mesa/mesa.inc
> +require recipes-graphics/mesa/mesa-pvr.inc
>   
>   SUMMARY += " (with PowerVR support for TI platforms)"
>   
> diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_24.0.1.bb b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_24.0.1.bb
> index 1ac022d2f8ab..e834355cf208 100644
> --- a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_24.0.1.bb
> +++ b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_24.0.1.bb
> @@ -2,7 +2,7 @@
>   # upstream yet. This allows us to build the shims we need without completely
>   # clobbering mesa.
>   
> -require recipes-graphics/mesa/mesa.inc
> +require recipes-graphics/mesa/mesa-pvr.inc
>   
>   SUMMARY += " (with PowerVR support for TI platforms)"
>   
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#18464): https://lists.yoctoproject.org/g/meta-ti/message/18464
> Mute This Topic: https://lists.yoctoproject.org/mt/112254197/6551054
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [reatmon@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

