Return-Path: <max.oss.09@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5BEAC369A2
	for <webhook@archiver.kernel.org>; Mon, 14 Apr 2025 15:07:13 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.52171.1744643231273069737
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 14 Apr 2025 08:07:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=A/559f+v;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: max.oss.09@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43ce71582e9so36644595e9.1
        for <meta-ti@lists.yoctoproject.org>; Mon, 14 Apr 2025 08:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744643230; x=1745248030; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r9Mj+Jz2OVBLLZjn6AVjBXKaBTa7WLAKhYT9U2lOtOs=;
        b=A/559f+vsaZ114MQJxgKH+XciT8rJcCI+dVxhNw7DmkbxUbrJCMIVO3f56JkkwM2Ho
         9clW5GDC1KaHG06j+i3CTi8v6kXnahwOYKhSQoVSZ1OvPhLCjwSb4xZXQbhFJmUqkzp1
         y/9IKXBvaqXwH/M5+/QV0+38IRTTVwdyyYsKHbYeQdxqRqUJMSM1i4kE7wEvqEoczDNp
         fa8zj1gu61shSNZ0It1e2rD7Lf+JWnVNxwH5y4V8IWpNKT3tO152xr8+/nOLp8DWBjSX
         xRjTSrHPs1QzkpgekXFvTXbnnPS6oUmDjHMS/Ra7T8tNFSqIkzOYYo4TTCDl1e2JTMuE
         Nr0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744643230; x=1745248030;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r9Mj+Jz2OVBLLZjn6AVjBXKaBTa7WLAKhYT9U2lOtOs=;
        b=UDpZ7uKx26fNO4hwwF1QNOxt6blA1gJ4NPmDp5JPRw/Ct2BOkrlE4/3G3StoLcQCZM
         HuElNHGICGsVdx9BPLkd+vdM1sK00/2mscr/L86rsO7hrnxiJcxcuqfLSpIZeRkqS+BA
         h0Xn8LhiRSHYAW/NWS37IkBtSOZDaGjcAJYhJa+Mea587LOy3CW3cCcfFTi4sEnuWwhW
         P1reTYt73rsTjOcal8gbHBe/OsQdNB+4TZpXc8UjA4+iatBuBEtMPnYFRZz4cTV+i7ce
         aQTtl8HWfcscAQzG6+ve+1FBBNK+bSAv90M+EwqrJGA/hkwhY1/gD8+PlE17yoKkoia9
         IRRA==
X-Gm-Message-State: AOJu0YzoUBegkI1sMa+oxuGp1ohDc76A4wqBd558DcSsRPO+am0unDTr
	UuBaU+n8/hUf7CEXbs2LWTUehdkJY15wbCqMyhN3Lv023cy7Jy5OCfXP4kIfohfYBv1cGglfnNy
	6DFMzAUp0YpE0lFSoUmZKTcYYiZw=
X-Gm-Gg: ASbGncsyLmoDwXVFNCvKLq6RMRGDkSmwVZABekXyHNa+X0+UEvRpFIcX1mQfqmIZa25
	bftx7k6Ra7XeTBwt4PtBCF8kwLtxqw0NmVGYU/tNVJ63vjq8Gjb1YNHK4l1l+lt/eA4ulnlstFC
	LS2t0QNtz2CBpzyncIZncf8lHJpM7xzTfi
X-Google-Smtp-Source: AGHT+IFk66+chzrL6xXeT7sWtCftVlEkRImMvrAJCZrHxq/ZfWssYXt86UqW4nNWv6mpeCSiLclondY2X6CuIrHth/c=
X-Received: by 2002:a05:600c:1d93:b0:43a:ed4d:716c with SMTP id
 5b1f17b1804b1-43f3a9aadffmr98490785e9.22.1744643228919; Mon, 14 Apr 2025
 08:07:08 -0700 (PDT)
MIME-Version: 1.0
References: <20250414094441.3181639-1-max.oss.09@gmail.com> <54301279-5493-433e-a4a1-91450d507e48@ti.com>
In-Reply-To: <54301279-5493-433e-a4a1-91450d507e48@ti.com>
From: Max Krummenacher <max.oss.09@gmail.com>
Date: Mon, 14 Apr 2025 17:06:57 +0200
X-Gm-Features: ATxdqUEFb8RNoT8oflv1AVNAZ4akB-OnRPR9fVmtQsuXm50EjY0fQv57yvoiSm4
Message-ID: <CAEHkU3WdAa8XvNz_mC0HZhk3KSe0b0mXWXBALSt+B0Qqf8=x4Q@mail.gmail.com>
Subject: Re: [meta-ti] [PATCH] mesa-pvr: add local copy of mesa.inc
To: Ryan Eatmon <reatmon@ti.com>
Cc: meta-ti@lists.yoctoproject.org, rs@ti.com, 
	Max Krummenacher <max.krummenacher@toradex.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 14 Apr 2025 15:07:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18466

Hi Ryan

On Mon, Apr 14, 2025 at 4:24=E2=80=AFPM Ryan Eatmon <reatmon@ti.com> wrote:
>
>
> I assume this is for master only?  It's missing in the subject...

Yes. I don't expect that mesa 25.0.2 will be backported to something
before walnascar (if it is even backported to walnascar).
Sorry for the confusion.

It fixes building mesa-pvr with current master branches.

However I'm not sure if mesa now contains whatever is needed so
that mesa-pvr can be dropped.

Regards
Max

>
>
> On 4/14/2025 4:44 AM, Max Krummenacher via lists.yoctoproject.org wrote:
> > From: Max Krummenacher <max.krummenacher@toradex.com>
> >
> > OE-core updated mesa to 25.0.2 [1]. The resulting mesa.inc file no
> > longer matches mesa recipes building older versions.
> > Copy the mesa.inc version from before the update renamed to
> > mesa-pvr.inc to work around the issue.
> >
> > | ../git/meson.build:21:0: ERROR: Value "softpipe" for option "gallium-=
drivers" is not in allowed choices: "auto, kmsro, radeonsi, r300, r600, nou=
veau, freedreno, swrast, v3d, vc4, etnaviv, tegra, i915, svga, virgl, panfr=
ost, iris, lima, zink, d3d12, asahi, crocus, pvr, sgx, all"
> >
> > [1] https://git.openembedded.org/openembedded-core/commit/?id=3Df9eb046=
8e45ee5a6a3b3195ef5e78c328c4347c9
> >
> > Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
> > ---
> >
> > I don't know if mesa 25.0.2 does have the changes from meta-pvr merged
> > so that instead of keeping meta-pvr working one could now use mesa 25
> > from OE with the appropriate packageconfigs.
> >
> > Regards
> > Max
> >
> >   .../recipes-graphics/mesa/mesa-pvr.inc        | 380 +++++++++++++++++=
+
> >   .../recipes-graphics/mesa/mesa-pvr_22.3.5.bb  |   2 +-
> >   .../recipes-graphics/mesa/mesa-pvr_24.0.1.bb  |   2 +-
> >   3 files changed, 382 insertions(+), 2 deletions(-)
> >   create mode 100644 meta-ti-bsp/recipes-graphics/mesa/mesa-pvr.inc
> >
> > diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr.inc b/meta-ti-b=
sp/recipes-graphics/mesa/mesa-pvr.inc
> > new file mode 100644
> > index 000000000000..471475ff58cf
> > --- /dev/null
> > +++ b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr.inc
> > @@ -0,0 +1,380 @@
> > +# Copy of mesa.inc from OE-core before commit f9eb0468e45e ("mesa: upg=
rade 24.0.7 -> 25.0.2")
> > +
> > +SUMMARY =3D "A free implementation of the OpenGL API"
> > +DESCRIPTION =3D "Mesa is an open-source implementation of the OpenGL s=
pecification - \
> > +a system for rendering interactive 3D graphics.  \
> > +A variety of device drivers allows Mesa to be used in many different e=
nvironments \
> > +ranging from software emulation to complete hardware acceleration for =
modern GPUs. \
> > +Mesa is used as part of the overall Direct Rendering Infrastructure an=
d X.org \
> > +environment."
> > +
> > +HOMEPAGE =3D "http://mesa3d.org"
> > +BUGTRACKER =3D "https://bugs.freedesktop.org"
> > +SECTION =3D "x11"
> > +LICENSE =3D "MIT"
> > +LIC_FILES_CHKSUM =3D "file://docs/license.rst;md5=3D63779ec98d78d823a9=
dc533a0735ef10"
> > +
> > +PE =3D "2"
> > +
> > +SRC_URI =3D "https://archive.mesa3d.org/mesa-${PV}.tar.xz \
> > +           file://0001-meson-misdetects-64bit-atomics-on-mips-clang.pa=
tch \
> > +           file://0001-drisw-fix-build-without-dri3.patch \
> > +           file://0002-glxext-don-t-try-zink-if-not-enabled-in-mesa.pa=
tch \
> > +           file://0001-Revert-meson-do-not-pull-in-clc-for-clover.patc=
h \
> > +           file://0001-amd-Include-missing-llvm-IR-header-Module.h.pat=
ch \
> > +           file://0001-freedreno-don-t-encode-build-path-into-binaries=
.patch\
> > +"
> > +
> > +SRC_URI[sha256sum] =3D "7454425f1ed4a6f1b5b107e1672b30c88b22ea0efea000=
ae2c7d96db93f6c26a"
> > +PV =3D "24.0.7"
> > +
> > +UPSTREAM_CHECK_GITTAGREGEX =3D "mesa-(?P<pver>\d+(\.\d+)+)"
> > +
> > +#because we cannot rely on the fact that all apps will use pkgconfig,
> > +#make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
> > +do_install:append() {
> > +  # sed can't find EGL/eglplatform.h as it doesn't get installed when =
glvnd enabled.
> > +  # So, check if EGL/eglplatform.h exists before running sed.
> > +  if ${@bb.utils.contains('PACKAGECONFIG', 'egl', 'true', 'false', d)}=
 && [ -f ${D}${includedir}/EGL/eglplatform.h ]; then
> > +      sed -i -e 's/^#elif defined(__unix__) && defined(EGL_NO_X11)$/#e=
lif defined(__unix__) \&\& defined(EGL_NO_X11) || ${@bb.utils.contains('PAC=
KAGECONFIG', 'x11', '0', '1', d)}/' ${D}${includedir}/EGL/eglplatform.h
> > +  fi
> > +}
> > +
> > +DEPENDS =3D "expat makedepend-native flex-native bison-native libxml2-=
native zlib chrpath-replacement-native python3-mako-native gettext-native"
> > +DEPENDS:append:class-target =3D " ${@bb.utils.contains('PACKAGECONFIG'=
, 'opencl', 'mesa-native', '', d)}"
> > +EXTRANATIVEPATH +=3D "chrpath-native"
> > +PROVIDES =3D " \
> > +    ${@bb.utils.contains('PACKAGECONFIG', 'opengl', 'virtual/libgl', '=
', d)} \
> > +    ${@bb.utils.contains('PACKAGECONFIG', 'glvnd', 'virtual/libglx', '=
', d)} \
> > +    ${@bb.utils.contains('PACKAGECONFIG', 'gles', 'virtual/libgles1 vi=
rtual/libgles2 virtual/libgles3', '', d)} \
> > +    ${@bb.utils.contains('PACKAGECONFIG', 'egl', 'virtual/egl', '', d)=
} \
> > +    ${@bb.utils.contains('PACKAGECONFIG', 'gbm', 'virtual/libgbm', '',=
 d)} \
> > +    virtual/mesa \
> > +    "
> > +
> > +inherit meson pkgconfig python3native gettext features_check
> > +
> > +BBCLASSEXTEND =3D "native nativesdk"
> > +
> > +ANY_OF_DISTRO_FEATURES =3D "opengl vulkan"
> > +
> > +PLATFORMS ??=3D "${@bb.utils.filter('PACKAGECONFIG', 'x11 wayland', d)=
}"
> > +
> > +# set the MESA_BUILD_TYPE to either 'release' (default) or 'debug'
> > +# by default the upstream mesa sources build a debug release
> > +# here we assume the user will want a release build by default
> > +MESA_BUILD_TYPE ?=3D "release"
> > +def check_buildtype(d):
> > +    _buildtype =3D d.getVar('MESA_BUILD_TYPE')
> > +    if _buildtype not in ['release', 'debug']:
> > +        bb.fatal("unknown build type (%s), please set MESA_BUILD_TYPE =
to either 'release' or 'debug'" % _buildtype)
> > +    if _buildtype =3D=3D 'debug':
> > +        return 'debugoptimized'
> > +    return 'plain'
> > +MESON_BUILDTYPE =3D "${@check_buildtype(d)}"
> > +
> > +EXTRA_OEMESON =3D " \
> > +    -Dshared-glapi=3Denabled \
> > +    -Dglx-read-only-text=3Dtrue \
> > +    -Dplatforms=3D'${@",".join("${PLATFORMS}".split())}' \
> > +"
> > +
> > +EXTRA_OEMESON:append:class-target =3D " ${@bb.utils.contains('PACKAGEC=
ONFIG', 'opencl', '-Dintel-clc=3Dsystem', '', d)}"
> > +EXTRA_OEMESON:append:class-native =3D " ${@bb.utils.contains('PACKAGEC=
ONFIG', 'opencl', '-Dintel-clc=3Denabled', '', d)}"
> > +
> > +def strip_comma(s):
> > +    return s.strip(',')
> > +
> > +PACKAGECONFIG =3D " \
> > +     gallium \
> > +     video-codecs \
> > +     ${@bb.utils.filter('DISTRO_FEATURES', 'x11 vulkan wayland', d)} \
> > +     ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'opengl egl gle=
s gbm virgl', '', d)} \
> > +     ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'dri3', '',=
 d)} \
> > +     ${@bb.utils.contains('DISTRO_FEATURES', 'x11 vulkan', 'dri3', '',=
 d)} \
> > +     ${@bb.utils.contains('DISTRO_FEATURES', 'vulkan', 'zink', '', d)}=
 \
> > +"
> > +
> > +PACKAGECONFIG:append:class-native =3D " gallium-llvm r600"
> > +
> > +# "gbm" requires "opengl"
> > +PACKAGECONFIG[gbm] =3D "-Dgbm=3Denabled,-Dgbm=3Ddisabled"
> > +
> > +X11_DEPS =3D "xorgproto virtual/libx11 libxext libxxf86vm libxdamage l=
ibxfixes xrandr"
> > +# "x11" requires "opengl"
> > +PACKAGECONFIG[x11] =3D ",-Dglx=3Ddisabled,${X11_DEPS}"
> > +PACKAGECONFIG[wayland] =3D ",,wayland-native wayland libdrm wayland-pr=
otocols"
> > +
> > +PACKAGECONFIG[dri3] =3D "-Ddri3=3Denabled, -Ddri3=3Ddisabled, xorgprot=
o libxshmfence"
> > +
> > +# Vulkan drivers need dri3 enabled
> > +# amd could be enabled as well but requires gallium-llvm with llvm >=
=3D 3.9
> > +VULKAN_DRIVERS =3D ""
> > +VULKAN_DRIVERS:append:x86 =3D ",intel,amd"
> > +VULKAN_DRIVERS:append:x86-64 =3D ",intel,amd"
> > +# i686 is a 32 bit override for mesa-native
> > +VULKAN_DRIVERS:append:i686 =3D ",intel,amd"
> > +VULKAN_DRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'free=
dreno', ',freedreno', '', d)}"
> > +VULKAN_DRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'broa=
dcom', ',broadcom', '', d)}"
> > +VULKAN_DRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'gall=
ium-llvm', ',swrast', '', d)}"
> > +VULKAN_DRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'imag=
ination', ',imagination-experimental', '', d)}"
> > +PACKAGECONFIG[vulkan] =3D "-Dvulkan-drivers=3D${@strip_comma('${VULKAN=
_DRIVERS}')}, -Dvulkan-drivers=3D'',glslang-native vulkan-loader vulkan-hea=
ders"
> > +
> > +# mesa development and testing tools support, per driver
> > +TOOLS =3D ""
> > +TOOLS_DEPS =3D ""
> > +TOOLS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'etnaviv', ',e=
tnaviv', '', d)}"
> > +TOOLS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'freedreno', '=
,freedreno', '', d)}"
> > +TOOLS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'lima', ',lima=
', '', d)}"
> > +TOOLS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'panfrost', ',=
panfrost', '', d)}"
> > +TOOLS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'imagination',=
 ',imagination', '', d)}"
> > +
> > +# dependencies for tools.
> > +TOOLS_DEPS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'freedren=
o', ' ncurses libxml2 ', '', d)}"
> > +
> > +# the fdperf tool requires libconfig (a part of meta-oe) so it needs s=
pecial
> > +# treatment in addition to the usual 'freedreno tools'.
> > +PACKAGECONFIG[freedreno-fdperf] =3D ",,libconfig"
> > +
> > +PACKAGECONFIG[tools] =3D "-Dtools=3D${@strip_comma('${TOOLS}')}, -Dtoo=
ls=3D'', ${TOOLS_DEPS}"
> > +
> > +PACKAGECONFIG[opengl] =3D "-Dopengl=3Dtrue, -Dopengl=3Dfalse"
> > +PACKAGECONFIG[glvnd] =3D "-Dglvnd=3Dtrue, -Dglvnd=3Dfalse, libglvnd"
> > +
> > +# "gles" requires "opengl"
> > +PACKAGECONFIG[gles] =3D "-Dgles1=3Denabled -Dgles2=3Denabled, -Dgles1=
=3Ddisabled -Dgles2=3Ddisabled"
> > +
> > +# "egl" requires "opengl"
> > +PACKAGECONFIG[egl] =3D "-Degl=3Denabled, -Degl=3Ddisabled"
> > +
> > +# "opencl" requires libclc from meta-clang and spirv-tools from OE-Cor=
e
> > +OPENCL_NATIVE =3D "${@bb.utils.contains('PACKAGECONFIG', 'freedreno', =
'-Dopencl-native=3Dtrue', '', d)}"
> > +PACKAGECONFIG[opencl] =3D "-Dgallium-opencl=3Dicd -Dopencl-spirv=3Dtru=
e ${OPENCL_NATIVE},-Dgallium-opencl=3Ddisabled -Dopencl-spirv=3Dfalse,libcl=
c spirv-tools python3-ply-native"
> > +
> > +PACKAGECONFIG[broadcom] =3D ""
> > +PACKAGECONFIG[etnaviv] =3D ",,python3-pycparser-native"
> > +PACKAGECONFIG[freedreno] =3D ""
> > +PACKAGECONFIG[kmsro] =3D ""
> > +PACKAGECONFIG[vc4] =3D ""
> > +PACKAGECONFIG[v3d] =3D ""
> > +PACKAGECONFIG[zink] =3D ""
> > +
> > +GALLIUMDRIVERS =3D "swrast"
> > +# gallium swrast was found to crash Xorg on startup in x32 qemu
> > +GALLIUMDRIVERS:x86-x32 =3D ""
> > +GALLIUMDRIVERS:append:x86 =3D ",i915,iris,crocus"
> > +GALLIUMDRIVERS:append:x86-64 =3D ",i915,iris,crocus"
> > +# i686 is a 32 bit override for mesa-native
> > +GALLIUMDRIVERS:append:i686 =3D ",i915,iris,crocus"
> > +
> > +GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'etna=
viv', ',etnaviv', '', d)}"
> > +GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'free=
dreno', ',freedreno', '', d)}"
> > +GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'kmsr=
o', ',kmsro', '', d)}"
> > +GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'vc4'=
, ',vc4', '', d)}"
> > +GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'v3d'=
, ',v3d', '', d)}"
> > +GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'zink=
', ',zink', '', d)}"
> > +
> > +# radeonsi requires LLVM
> > +GALLIUMDRIVERS_RADEONSI =3D "${@bb.utils.contains('PACKAGECONFIG', 'r6=
00', ',radeonsi', '', d)}"
> > +GALLIUMDRIVERS_LLVM =3D ",r300,nouveau${GALLIUMDRIVERS_RADEONSI}"
> > +GALLIUMDRIVERS_LLVM:append:x86 =3D ",svga"
> > +GALLIUMDRIVERS_LLVM:append:x86-64 =3D ",svga"
> > +# i686 is a 32 bit override for mesa-native
> > +GALLIUMDRIVERS_LLVM:append:i686 =3D ",svga"
> > +
> > +PACKAGECONFIG[r600] =3D ""
> > +PACKAGECONFIG[virgl] =3D ""
> > +
> > +GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'gall=
ium-llvm', '${GALLIUMDRIVERS_LLVM}', '', d)}"
> > +GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'r600=
', ',r600', '', d)}"
> > +GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'virg=
l', ',virgl', '', d)}"
> > +
> > +PACKAGECONFIG[gallium] =3D "-Dgallium-drivers=3D${@strip_comma('${GALL=
IUMDRIVERS}')}, -Dgallium-drivers=3D'', libdrm"
> > +PACKAGECONFIG[gallium-llvm] =3D "-Dllvm=3Denabled -Dshared-llvm=3Denab=
led, -Dllvm=3Ddisabled, llvm llvm-native elfutils"
> > +PACKAGECONFIG[xa]  =3D "-Dgallium-xa=3Denabled, -Dgallium-xa=3Ddisable=
d"
> > +PACKAGECONFIG[va] =3D "-Dgallium-va=3Denabled,-Dgallium-va=3Ddisabled,=
libva-initial"
> > +PACKAGECONFIG[vdpau] =3D "-Dgallium-vdpau=3Denabled,-Dgallium-vdpau=3D=
disabled,libvdpau"
> > +
> > +PACKAGECONFIG[imagination] =3D "-Dimagination-srv=3Dtrue,-Dimagination=
-srv=3Dfalse"
> > +
> > +PACKAGECONFIG[lima] =3D ""
> > +GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'lima=
', ',lima', '', d)}"
> > +
> > +PACKAGECONFIG[panfrost] =3D ""
> > +GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'panf=
rost', ',panfrost', '', d)}"
> > +
> > +PACKAGECONFIG[tegra] =3D ""
> > +GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'tegr=
a', ',tegra,nouveau', '', d)}"
> > +
> > +PACKAGECONFIG[vulkan-beta] =3D "-Dvulkan-beta=3Dtrue,-Dvulkan-beta=3Df=
alse"
> > +
> > +PACKAGECONFIG[osmesa] =3D "-Dosmesa=3Dtrue,-Dosmesa=3Dfalse"
> > +
> > +PACKAGECONFIG[perfetto] =3D "-Dperfetto=3Dtrue,-Dperfetto=3Dfalse,libp=
erfetto"
> > +
> > +PACKAGECONFIG[unwind] =3D "-Dlibunwind=3Denabled,-Dlibunwind=3Ddisable=
d,libunwind"
> > +
> > +PACKAGECONFIG[lmsensors] =3D "-Dlmsensors=3Denabled,-Dlmsensors=3Ddisa=
bled,lmsensors"
> > +
> > +VIDEO_CODECS ?=3D "${@bb.utils.contains('LICENSE_FLAGS_ACCEPTED', 'com=
mercial', 'all', 'all_free', d)}"
> > +PACKAGECONFIG[video-codecs] =3D "-Dvideo-codecs=3D${VIDEO_CODECS}, -Dv=
ideo-codecs=3D''"
> > +
> > +# llvmpipe is slow if compiled with -fomit-frame-pointer (e.g. -O2)
> > +FULL_OPTIMIZATION:append =3D " -fno-omit-frame-pointer"
> > +
> > +CFLAGS:append:armv5 =3D " -DMISSING_64BIT_ATOMICS"
> > +CFLAGS:append:armv6 =3D " -DMISSING_64BIT_ATOMICS"
> > +
> > +# Remove the mesa dependency on mesa-dev, as mesa is empty
> > +DEV_PKG_DEPENDENCY =3D ""
> > +
> > +# Khronos documentation says that include/GLES2/gl2ext.h can be used f=
or
> > +# OpenGL ES 3 specification as well as for OpenGL ES 2.
> > +# There can be applications including GLES2/gl2ext.h instead of GLES3/=
gl3ext.h
> > +# meaning we should probably bring in GLES2/gl2ext.h if someone asks f=
or
> > +# development package of libgles3.
> > +RDEPENDS:libgles3-mesa-dev +=3D "libgles2-mesa-dev"
> > +
> > +# GLES2 and GLES3 implementations are packaged in a single library in =
libgles2-mesa.
> > +# Add a dependency so the GLES3 dev package is associated with its imp=
lementation.
> > +RDEPENDS:libgles2-mesa +=3D "libgles3-mesa"
> > +ALLOW_EMPTY:libgles3-mesa =3D "1"
> > +
> > +RDEPENDS:libopencl-mesa +=3D "${@bb.utils.contains('PACKAGECONFIG', 'o=
pencl', 'libclc spirv-tools', '', d)}"
> > +
> > +PACKAGES =3D+ "libegl-mesa libegl-mesa-dev \
> > +             libosmesa libosmesa-dev \
> > +             libgl-mesa libgl-mesa-dev \
> > +             libglx-mesa libglx-mesa-dev \
> > +             libglapi libglapi-dev \
> > +             libgbm libgbm-dev \
> > +             libgles1-mesa libgles1-mesa-dev \
> > +             libgles2-mesa libgles2-mesa-dev \
> > +             libgles3-mesa libgles3-mesa-dev \
> > +             libopencl-mesa libopencl-mesa-dev \
> > +             libxatracker libxatracker-dev \
> > +             mesa-megadriver mesa-vulkan-drivers \
> > +             mesa-vdpau-drivers mesa-tools \
> > +            "
> > +
> > +do_install:append () {
> > +    # Drivers never need libtool .la files
> > +    rm -f ${D}${libdir}/dri/*.la
> > +    rm -f ${D}${libdir}/egl/*.la
> > +    rm -f ${D}${libdir}/gallium-pipe/*.la
> > +    rm -f ${D}${libdir}/gbm/*.la
> > +
> > +    # libwayland-egl has been moved to wayland 1.15+
> > +    rm -f ${D}${libdir}/libwayland-egl*
> > +    rm -f ${D}${libdir}/pkgconfig/wayland-egl.pc
> > +}
> > +
> > +do_install:append:class-native () {
> > +    if ${@bb.utils.contains('PACKAGECONFIG', 'opencl', 'true', 'false'=
, d)}; then
> > +        install -d ${D}${bindir}
> > +        install -m0755 ${B}/src/intel/compiler/intel_clc ${D}${bindir}
> > +    fi
> > +}
> > +
> > +# For the packages that make up the OpenGL interfaces, inject variable=
s so that
> > +# they don't get Debian-renamed (which would remove the -mesa suffix),=
 and
> > +# RPROVIDEs/RCONFLICTs on the generic libgl name.
> > +python __anonymous() {
> > +    pkgconfig =3D (d.getVar('PACKAGECONFIG') or "").split()
> > +    suffix =3D ""
> > +    if "-native" in d.getVar("PN"):
> > +        suffix =3D "-native"
> > +    for p in (("egl", "libegl", "libegl1"),
> > +              ("opengl", "libgl", "libgl1"),
> > +              ("glvnd", "libglx",),
> > +              ("gles", "libgles1", "libglesv1-cm1"),
> > +              ("gles", "libgles2", "libglesv2-2"),
> > +              ("gles", "libgles3",),
> > +              ("opencl", "libopencl",)):
> > +        if not p[0] in pkgconfig:
> > +            continue
> > +        mlprefix =3D d.getVar("MLPREFIX")
> > +        fullp =3D mlprefix + p[1] + "-mesa" + suffix
> > +        mlprefix =3D d.getVar("MLPREFIX")
> > +        pkgs =3D " " + " ".join(mlprefix + x + suffix for x in p[1:])
> > +        d.setVar("DEBIAN_NOAUTONAME:" + fullp, "1")
> > +        d.appendVar("RREPLACES:" + fullp, pkgs)
> > +        d.appendVar("RPROVIDES:" + fullp, pkgs)
> > +        d.appendVar("RCONFLICTS:" + fullp, pkgs)
> > +
> > +        d.appendVar("RRECOMMENDS:" + fullp, " ${MLPREFIX}mesa-megadriv=
er" + suffix)
> > +
> > +        # For -dev, the first element is both the Debian and original =
name
> > +        fullp =3D mlprefix + p[1] + "-mesa-dev" + suffix
> > +        pkgs =3D " " + mlprefix + p[1] + "-dev" + suffix
> > +        d.setVar("DEBIAN_NOAUTONAME:" + fullp, "1")
> > +        d.appendVar("RREPLACES:" + fullp, pkgs)
> > +        d.appendVar("RPROVIDES:" + fullp, pkgs)
> > +        d.appendVar("RCONFLICTS:" + fullp, pkgs)
> > +}
> > +
> > +python mesa_populate_packages() {
> > +    pkgs =3D ['mesa', 'mesa-dev', 'mesa-dbg']
> > +    for pkg in pkgs:
> > +        d.setVar("RPROVIDES:%s" % pkg, pkg.replace("mesa", "mesa-dri",=
 1))
> > +        d.setVar("RCONFLICTS:%s" % pkg, pkg.replace("mesa", "mesa-dri"=
, 1))
> > +        d.setVar("RREPLACES:%s" % pkg, pkg.replace("mesa", "mesa-dri",=
 1))
> > +
> > +    import re
> > +    dri_drivers_root =3D oe.path.join(d.getVar('PKGD'), d.getVar('libd=
ir'), "dri")
> > +    if os.path.isdir(dri_drivers_root):
> > +        dri_pkgs =3D sorted(os.listdir(dri_drivers_root))
> > +        lib_name =3D d.expand("${MLPREFIX}mesa-megadriver")
> > +        for p in dri_pkgs:
> > +            m =3D re.match(r'^(.*)_dri\.so$', p)
> > +            if m:
> > +                pkg_name =3D " ${MLPREFIX}mesa-driver-%s" % legitimize=
_package_name(m.group(1))
> > +                d.appendVar("RPROVIDES:%s" % lib_name, pkg_name)
> > +                d.appendVar("RCONFLICTS:%s" % lib_name, pkg_name)
> > +                d.appendVar("RREPLACES:%s" % lib_name, pkg_name)
> > +
> > +    pipe_drivers_root =3D os.path.join(d.getVar('libdir'), "gallium-pi=
pe")
> > +    do_split_packages(d, pipe_drivers_root, r'^pipe_(.*)\.so$', 'mesa-=
driver-pipe-%s', 'Mesa %s pipe driver', extra_depends=3D'')
> > +}
> > +
> > +PACKAGESPLITFUNCS =3D+ "mesa_populate_packages"
> > +
> > +PACKAGES_DYNAMIC +=3D "^mesa-driver-.*"
> > +PACKAGES_DYNAMIC:class-native =3D "^mesa-driver-.*-native"
> > +
> > +FILES:mesa-megadriver =3D "${libdir}/dri/* ${datadir}/drirc.d"
> > +FILES:mesa-vulkan-drivers =3D "${libdir}/libvulkan_*.so ${libdir}/libp=
owervr_rogue.so ${datadir}/vulkan"
> > +FILES:${PN}-vdpau-drivers =3D "${libdir}/vdpau/*.so.*"
> > +FILES:libegl-mesa =3D "${libdir}/libEGL*.so.* ${datadir}/glvnd/egl_ven=
dor.d"
> > +FILES:libgbm =3D "${libdir}/libgbm.so.*"
> > +FILES:libgles1-mesa =3D "${libdir}/libGLESv1*.so.*"
> > +FILES:libgles2-mesa =3D "${libdir}/libGLESv2.so.*"
> > +FILES:libgl-mesa =3D "${libdir}/libGL.so.*"
> > +FILES:libglx-mesa =3D "${libdir}/libGLX*.so.*"
> > +FILES:libopencl-mesa =3D "${libdir}/libMesaOpenCL.so.* ${libdir}/galli=
um-pipe/*.so ${sysconfdir}/OpenCL/vendors/mesa.icd"
> > +FILES:libglapi =3D "${libdir}/libglapi.so.*"
> > +FILES:libosmesa =3D "${libdir}/libOSMesa.so.*"
> > +FILES:libxatracker =3D "${libdir}/libxatracker.so.*"
> > +
> > +FILES:${PN}-dev =3D "${libdir}/pkgconfig/dri.pc ${includedir}/vulkan $=
{libdir}/vdpau/*.so"
> > +FILES:libegl-mesa-dev =3D "${libdir}/libEGL*.* ${includedir}/EGL ${inc=
ludedir}/KHR ${libdir}/pkgconfig/egl.pc"
> > +FILES:libgbm-dev =3D "${libdir}/libgbm.* ${libdir}/pkgconfig/gbm.pc ${=
includedir}/gbm.h"
> > +FILES:libgl-mesa-dev =3D "${libdir}/libGL.* ${includedir}/GL ${libdir}=
/pkgconfig/gl.pc"
> > +FILES:libglx-mesa-dev =3D "${libdir}/libGLX*.*"
> > +FILES:libglapi-dev =3D "${libdir}/libglapi.*"
> > +FILES:libgles1-mesa-dev =3D "${libdir}/libGLESv1*.* ${includedir}/GLES=
 ${libdir}/pkgconfig/glesv1*.pc"
> > +FILES:libgles2-mesa-dev =3D "${libdir}/libGLESv2.* ${includedir}/GLES2=
 ${libdir}/pkgconfig/glesv2.pc"
> > +FILES:libgles3-mesa-dev =3D "${includedir}/GLES3"
> > +FILES:libopencl-mesa-dev =3D "${libdir}/libMesaOpenCL.so"
> > +FILES:libosmesa-dev =3D "${libdir}/libOSMesa.* ${includedir}/GL/osmesa=
.h ${libdir}/pkgconfig/osmesa.pc"
> > +FILES:libxatracker-dev =3D "${libdir}/libxatracker.so ${libdir}/libxat=
racker.la \
> > +                          ${includedir}/xa_tracker.h ${includedir}/xa_=
composite.h ${includedir}/xa_context.h \
> > +                          ${libdir}/pkgconfig/xatracker.pc"
> > +# catch all to get all the tools and data
> > +FILES:${PN}-tools =3D "${bindir} ${datadir}"
> > +ALLOW_EMPTY:${PN}-tools =3D "1"
> > +
> > +# Fix upgrade path from mesa to mesa-megadriver
> > +RREPLACES:mesa-megadriver =3D "mesa"
> > +RCONFLICTS:mesa-megadriver =3D "mesa"
> > +RPROVIDES:mesa-megadriver =3D "mesa"
> > diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_22.3.5.bb b/met=
a-ti-bsp/recipes-graphics/mesa/mesa-pvr_22.3.5.bb
> > index bdc9ce16dcbd..5af196aa7df4 100644
> > --- a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_22.3.5.bb
> > +++ b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_22.3.5.bb
> > @@ -2,7 +2,7 @@
> >   # upstream yet. This allows us to build the shims we need without com=
pletely
> >   # clobbering mesa.
> >
> > -require recipes-graphics/mesa/mesa.inc
> > +require recipes-graphics/mesa/mesa-pvr.inc
> >
> >   SUMMARY +=3D " (with PowerVR support for TI platforms)"
> >
> > diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_24.0.1.bb b/met=
a-ti-bsp/recipes-graphics/mesa/mesa-pvr_24.0.1.bb
> > index 1ac022d2f8ab..e834355cf208 100644
> > --- a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_24.0.1.bb
> > +++ b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_24.0.1.bb
> > @@ -2,7 +2,7 @@
> >   # upstream yet. This allows us to build the shims we need without com=
pletely
> >   # clobbering mesa.
> >
> > -require recipes-graphics/mesa/mesa.inc
> > +require recipes-graphics/mesa/mesa-pvr.inc
> >
> >   SUMMARY +=3D " (with PowerVR support for TI platforms)"
> >
> >
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#18464): https://lists.yoctoproject.org/g/meta-ti/me=
ssage/18464
> > Mute This Topic: https://lists.yoctoproject.org/mt/112254197/6551054
> > Group Owner: meta-ti+owner@lists.yoctoproject.org
> > Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [reatmon@ti=
.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
> --
> Ryan Eatmon                reatmon@ti.com
> -----------------------------------------
> Texas Instruments, Inc.  -  LCPD  -  MGTS

