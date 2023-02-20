Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 894E5C636CC
	for <webhook@archiver.kernel.org>; Mon, 20 Feb 2023 11:06:49 +0000 (UTC)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
 by mx.groups.io with SMTP id smtpd.web10.10318.1676891200740778251
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 20 Feb 2023 03:06:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XotcwCyH;
 spf=pass (domain: gmail.com, ip: 209.85.217.44, mailfrom: quaresma.jose@gmail.com)
Received: by mail-vs1-f44.google.com with SMTP id n62so2527588vsc.8
        for <meta-ti@lists.yoctoproject.org>; Mon, 20 Feb 2023 03:06:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LTYlD8BTVMXQ2sH9/cB5aTvXqT5VQOd62/BDYmwP7CA=;
        b=XotcwCyHoq7wVyXD/NiUU+iC/HuZaz7Y51p8A0EF5xSIbTH94BNfVfWm5Z00zQcOWo
         GrW1U5E/gswx+YUqV/70861I4eUPwawUGtH8yb/IzQ9EXNWCZQCYkspkyhUkNMz5+N9U
         doN32B6iXeXGwbXPlwCOn91CVZlxIWsQQy7I8lb3ymijaW+JfXyNMlNDL8KdtHgw53nW
         hfzsvb2pQdDpdpA+Fjiu9NZruvY/RW5eZHVrKv+ZD7/3oGkAMoiXNEfjoDEr/BOHuDis
         C78OQD9ncw5lPOxj/GhUUMQqwPBBci6RUhj26YxuNXGNxW7RgDP2snoNiVgc3rsLqnxg
         +Wdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LTYlD8BTVMXQ2sH9/cB5aTvXqT5VQOd62/BDYmwP7CA=;
        b=JpiIauXK60pT041hULvr1O6cdl0GOSZ4MoOeyNqIE/hiKZ6i7iPmOPkXGvEd6HccRg
         H4C+0Uxc8lOhrOpi0SbMg7IDfXa27V+1Qf5TcmXDua2ceE4RBLp8pQY50N0TfblWxZVv
         PbCB+9H5fEPAUi78qmsziWDqswHJY75i/lWezcJx+QdmC8L6CWtuZBX6aqfwjr2RW/vM
         5heuWoESMBUtWEtQUhnle+u+CUmNlYRC3SVriBbjUdTfxOtctB91azoqXXA5v2YXcJJ+
         DwqHdjlGcAv+3hb0L9T1TzFNb0eaSQkqYg6eMljZkSFJ+WxR9gRVzdDixhZKseAFq8g2
         1Vrg==
X-Gm-Message-State: AO0yUKXZH1+KnAVo9+ZTZkUz26KCO12Jw3jBk+14Pceb+HbivCsabrQK
	irpxPMcgrybmX+8/6+dinjUvvz9WrfMj1Y7J+HM=
X-Google-Smtp-Source: AK7set8SHMXS84p1PQh3hWCopvZe/j0o/x3RtYwAY1PByJbgzOJ0w7JcJtp3rOu4BSELXCT42F2zmVFoeYIMqerjkSc=
X-Received: by 2002:a67:c48f:0:b0:3f0:be66:8037 with SMTP id
 d15-20020a67c48f000000b003f0be668037mr98731vsk.80.1676891199654; Mon, 20 Feb
 2023 03:06:39 -0800 (PST)
MIME-Version: 1.0
References: <20230130232007.2393097-1-rs@ti.com> <20230130232007.2393097-2-rs@ti.com>
In-Reply-To: <20230130232007.2393097-2-rs@ti.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Mon, 20 Feb 2023 11:06:28 +0000
Message-ID: <CANPvuRkm6pxPOuchL0cwLkk-dx35PeMB8euNu7vRnsuSDFzZ2Q@mail.gmail.com>
Subject: Re: [meta-ti] [kirkstone][PATCH v7 1/3] meta-ti-bsp: graphics:
 Resolve dependency chain
To: rs@ti.com
Cc: denys@ti.com, reatmon@ti.com, detheridge@ti.com, afd@ti.com, 
	meta-ti@lists.yoctoproject.org, k-bhargav@ti.com
Content-Type: multipart/alternative; boundary="00000000000048517b05f51fa82d"
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 20 Feb 2023 11:06:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15881

--00000000000048517b05f51fa82d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Randolph Sapp via lists.yoctoproject.org <rs=3Dti.com@lists.yoctoproject.or=
g>
escreveu no dia segunda, 30/01/2023 =C3=A0(s) 23:20:

> Patched mesa will now be configured based on what virtual/gpudriver
> preferred provider is selected. The gpu drivers will now runtime
> recommend the associated um components.
>
> Signed-off-by: Randolph Sapp <rs@ti.com>
> ---
>  ...-OpenEmbedded-nodistro-internal-aarc.patch | 29 --------
>  ...bb =3D> ti-img-rogue-driver_1.18.6276027.bb} | 20 +++---
>  .../ti-sgx-ddk-km_1.17.4948957.bb             |  8 +--
>  .../ti-img-rogue-umlibs_1.15.6133109.bb       | 71 -------------------
>  .../ti-img-rogue-umlibs_1.18.6276027.bb       | 39 ++++++++++
>  .../libgles/ti-sgx-ddk-um_1.17.4948957.bb     | 30 +-------
>  .../mesa/mesa-gl_22.0.%.bbappend              |  1 +
>  .../mesa/mesa_22.0.%.bbappend                 |  1 +
>  .../recipes-graphics/mesa/pvr-mesa.inc        | 40 +++++++++++
>  9 files changed, 97 insertions(+), 142 deletions(-)
>  delete mode 100644
> meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver/0001-compiler=
-support-OpenEmbedded-nodistro-internal-aarc.patch
>  rename meta-ti-bsp/recipes-bsp/powervr-drivers/{
> ti-img-rogue-driver_1.15.6133109.bb =3D> ti-img-rogue-driver_1.18.6276027=
.bb}
> (72%)
>  delete mode 100644 meta-ti-bsp/recipes-graphics/libgles/
> ti-img-rogue-umlibs_1.15.6133109.bb
>  create mode 100644 meta-ti-bsp/recipes-graphics/libgles/
> ti-img-rogue-umlibs_1.18.6276027.bb
>  create mode 100644
> meta-ti-bsp/recipes-graphics/mesa/mesa-gl_22.0.%.bbappend
>  create mode 100644 meta-ti-bsp/recipes-graphics/mesa/mesa_22.0.%.bbappen=
d
>  create mode 100644 meta-ti-bsp/recipes-graphics/mesa/pvr-mesa.inc
>
> diff --git
> a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver/0001-compil=
er-support-OpenEmbedded-nodistro-internal-aarc.patch
> b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver/0001-compil=
er-support-OpenEmbedded-nodistro-internal-aarc.patch
> deleted file mode 100644
> index f021cc39..00000000
> ---
> a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver/0001-compil=
er-support-OpenEmbedded-nodistro-internal-aarc.patch
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -From 80d32fee3d768abbd77cce77ea9a7574651460a9 Mon Sep 17 00:00:00 2001
> -From: Denys Dmytriyenko <denis@denix.org>
> -Date: Wed, 7 Jul 2021 13:11:56 -0400
> -Subject: [PATCH] compiler: support OpenEmbedded "nodistro" internal
> aarch64
> - toolchain
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Denys Dmytriyenko <denis@denix.org>
> ----
> - build/linux/config/compiler.mk | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/build/linux/config/compiler.mk b/build/linux/config/
> compiler.mk
> -index 53a0bef..d788579 100644
> ---- a/build/linux/config/compiler.mk
> -+++ b/build/linux/config/compiler.mk
> -@@ -65,7 +65,7 @@ define calculate-compiler-preferred-target
> -    ifneq ($$(filter i386-% i486-% i586-%
> i686-%,$$($(1)_compiler_preferred_target)),)
> -     $(1)_compiler_preferred_target :=3D i386-linux-gnu
> -    endif
> --   ifneq ($$(filter
> aarch64-poky-linux,$$($(1)_compiler_preferred_target)),)
> -+   ifneq ($$(filter aarch64-oe-linux
> aarch64-poky-linux,$$($(1)_compiler_preferred_target)),)
> -     $(1)_compiler_preferred_target :=3D aarch64-linux-gnu
> -    endif
> -    ifneq ($$(filter armv7a-cros-linux-gnueabi
> armv7l-tizen-linux-gnueabi,$$($(1)_compiler_preferred_target)),)
> ---
> -2.7.4
> -
> diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/
> ti-img-rogue-driver_1.15.6133109.bb
> b/meta-ti-bsp/recipes-bsp/powervr-drivers/
> ti-img-rogue-driver_1.18.6276027.bb
> similarity index 72%
> rename from meta-ti-bsp/recipes-bsp/powervr-drivers/
> ti-img-rogue-driver_1.15.6133109.bb
> rename to meta-ti-bsp/recipes-bsp/powervr-drivers/
> ti-img-rogue-driver_1.18.6276027.bb
> index b4d19195..96fb7484 100644
> --- a/meta-ti-bsp/recipes-bsp/powervr-drivers/
> ti-img-rogue-driver_1.15.6133109.bb
> +++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/
> ti-img-rogue-driver_1.18.6276027.bb
> @@ -3,40 +3,38 @@ HOMEPAGE =3D "
> http://git.ti.com/graphics/ti-img-rogue-driver"
>  LICENSE =3D "MIT | GPL-2.0-only"
>  LIC_FILES_CHKSUM =3D
> "file://README;beginline=3D14;endline=3D19;md5=3D0403c7dea01a2b8232261e80=
5325fac2"
>
> -inherit module features_check
> +inherit module
>
> -REQUIRED_MACHINE_FEATURES =3D "gpu"
> +PROVIDES =3D "virtual/gpudriver"
>
>  MACHINE_KERNEL_PR:append =3D "b"
>  PR =3D "${MACHINE_KERNEL_PR}"
>
>  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> +
>  COMPATIBLE_MACHINE =3D "j721e|j721s2|j784s4|am62xx"
>
>  DEPENDS =3D "virtual/kernel"
>
> -PROVIDES =3D "virtual/gpudriver"
> +BRANCH =3D "linuxws/kirkstone/k5.10/${PV}"
>
> -BRANCH =3D "linuxws/dunfell/k5.10/${PV}_unified_fw_pagesize"
> -
> -SRC_URI =3D " \
> -    git://
> git.ti.com/git/graphics/ti-img-rogue-driver.git;protocol=3Dhttps;branch=
=3D${BRANCH}
> <http://git.ti.com/git/graphics/ti-img-rogue-driver.git;protocol=3Dhttps;=
branch=3D$%7BBRANCH%7D>
> \
> -
> file://0001-compiler-support-OpenEmbedded-nodistro-internal-aarc.patch \
> -"
> +SRC_URI =3D "git://
> git.ti.com/git/graphics/ti-img-rogue-driver.git;protocol=3Dhttps;branch=
=3D${BRANCH}
> <http://git.ti.com/git/graphics/ti-img-rogue-driver.git;protocol=3Dhttps;=
branch=3D$%7BBRANCH%7D>
> "
>
>  S =3D "${WORKDIR}/git"
>
> -SRCREV =3D "c901804e8221d477983a6f7224a9cdc6e832f050"
> +SRCREV =3D "d575e4f64c95a3534e10e85da15bd303febf133f"
>
>  TARGET_PRODUCT:j721e =3D "j721e_linux"
>  TARGET_PRODUCT:j721s2 =3D "j721s2_linux"
>  TARGET_PRODUCT:j784s4 =3D "j784s4_linux"
>  TARGET_PRODUCT:am62xx =3D "am62_linux"
>  PVR_BUILD =3D "release"
> -PVR_WS =3D "wayland"
> +PVR_WS =3D "lws-generic"
>
>  EXTRA_OEMAKE +=3D 'KERNELDIR=3D"${STAGING_KERNEL_DIR}" BUILD=3D${PVR_BUI=
LD}
> PVR_BUILD_DIR=3D${TARGET_PRODUCT} WINDOW_SYSTEM=3D${PVR_WS}'
>
>  do_install() {
>      make -C ${STAGING_KERNEL_DIR}
> M=3D${B}/binary_${TARGET_PRODUCT}_${PVR_WS}_${PVR_BUILD}/target_aarch64/k=
build
> INSTALL_MOD_PATH=3D${D}${root_prefix} PREFIX=3D${STAGING_DIR_HOST}
> modules_install
>  }
> +
> +RRECOMMENDS:${PN} +=3D "ti-img-rogue-umlibs"
> diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/
> ti-sgx-ddk-km_1.17.4948957.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/
> ti-sgx-ddk-km_1.17.4948957.bb
> index c22e3096..13b8757c 100644
> --- a/meta-ti-bsp/recipes-bsp/powervr-drivers/
> ti-sgx-ddk-km_1.17.4948957.bb
> +++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/
> ti-sgx-ddk-km_1.17.4948957.bb
> @@ -3,9 +3,9 @@ HOMEPAGE =3D "
> https://git.ti.com/graphics/omap5-sgx-ddk-linux"
>  LICENSE =3D "MIT | GPL-2.0-only"
>  LIC_FILES_CHKSUM =3D
> "file://eurasia_km/README;beginline=3D13;endline=3D22;md5=3D74506d9b8e5ed=
bce66c2747c50fcef12"
>
> -inherit module features_check
> +inherit module
>
> -REQUIRED_MACHINE_FEATURES =3D "gpu"
> +PROVIDES =3D "virtual/gpudriver"
>
>  COMPATIBLE_MACHINE =3D "ti33x|ti43x|omap-a15|k3"
>
> @@ -16,8 +16,6 @@ PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>
>  DEPENDS =3D "virtual/kernel"
>
> -PROVIDES =3D "virtual/gpudriver"
> -
>  BRANCH =3D "ti-img-sgx/${PV}/k5.10"
>
>  SRC_URI =3D "git://
> git.ti.com/git/graphics/omap5-sgx-ddk-linux.git;protocol=3Dhttps;branch=
=3D${BRANCH}
> <http://git.ti.com/git/graphics/omap5-sgx-ddk-linux.git;protocol=3Dhttps;=
branch=3D$%7BBRANCH%7D>
> "
> @@ -44,3 +42,5 @@ do_install() {
>  do_install:k3() {
>      make -C ${STAGING_KERNEL_DIR}
> M=3D${B}/eurasia_km/eurasiacon/binary_omap_linux_nulldrmws_release/target=
_aarch64/kbuild
> INSTALL_MOD_PATH=3D${D}${root_prefix} PREFIX=3D${STAGING_DIR_HOST}
> modules_install
>  }
> +
> +RRECOMMENDS:${PN} +=3D "ti-sgx-ddk-um"
> diff --git a/meta-ti-bsp/recipes-graphics/libgles/
> ti-img-rogue-umlibs_1.15.6133109.bb
> b/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_1.15.6133109.b=
b
> deleted file mode 100644
> index a665c614..00000000
> --- a/meta-ti-bsp/recipes-graphics/libgles/
> ti-img-rogue-umlibs_1.15.6133109.bb
> +++ /dev/null
> @@ -1,71 +0,0 @@
> -DESCRIPTION =3D "Userspace libraries for PowerVR Rogue GPU on TI SoCs"
> -HOMEPAGE =3D "http://git.ti.com/graphics/ti-img-rogue-umlibs"
> -LICENSE =3D "TI-TFL"
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D7232b98c1c58f99e3baa03de5207e=
76f"
> -
> -inherit features_check
> -
> -REQUIRED_MACHINE_FEATURES =3D "gpu"
> -
> -PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> -COMPATIBLE_MACHINE =3D "j721e|j721s2|j784s4|am62xx"
> -
> -PR =3D "r2"
> -
> -BRANCH =3D "linuxws/dunfell/k5.10/${PV}_unified_fw_pagesize"
> -
> -SRC_URI =3D "git://
> git.ti.com/git/graphics/ti-img-rogue-umlibs.git;protocol=3Dhttps;branch=
=3D${BRANCH}
> <http://git.ti.com/git/graphics/ti-img-rogue-umlibs.git;protocol=3Dhttps;=
branch=3D$%7BBRANCH%7D>
> "
> -SRCREV =3D "5977e82b96028f783d39c7219f016c1faf8dc5f5"
> -
> -TARGET_PRODUCT:j721e =3D "j721e_linux"
> -TARGET_PRODUCT:j721s2 =3D "j721s2_linux"
> -TARGET_PRODUCT:j784s4 =3D "j784s4_linux"
> -TARGET_PRODUCT:am62xx =3D "am62_linux"
> -PVR_BUILD ?=3D "release"
> -PVR_WS =3D "wayland"
> -
> -INITSCRIPT_NAME =3D "rc.pvr"
> -INITSCRIPT_PARAMS =3D "defaults 8"
> -
> -inherit update-rc.d
> -
> -PROVIDES +=3D "virtual/egl virtual/libgles1 virtual/libgles2 virtual/lib=
gbm"
> -
> -DEPENDS +=3D "libdrm wayland expat"
> -RDEPENDS:${PN} +=3D "bash"
> -RDEPENDS:${PN} +=3D "wayland expat"
> -
> -RPROVIDES:${PN} =3D "libegl libgles1 libgles2 libgbm"
> -RPROVIDES:${PN}-dev =3D "libegl-dev libgles1-dev libgles2-dev libgbm-dev=
"
> -RPROVIDES:${PN}-dbg =3D "libegl-dbg libgles1-dbg libgles2-dbg"
> -
> -RREPLACES:${PN} =3D "libegl libgles1 liblges2 libgbm"
> -RREPLACES:${PN}-dev =3D "libegl-dev libgles1-dev libgles2-dev libgbm-dev=
"
> -RREPLACES:${PN}-dbg =3D "libegl-dbg libgles1-dbg libgles2-dbg"
> -
> -RCONFLICTS:${PN} =3D "libegl libgles1 libgles2 libgbm"
> -RCONFLICTS:${PN}-dev =3D "libegl-dev libgles1-dev libgles2-dev libgbm-de=
v"
> -RCONFLICTS:${PN}-dbg =3D "libegl-dbg libgles1-dbg libgles2-dbg"
> -
> -RRECOMMENDS:${PN} +=3D "ti-img-rogue-driver"
> -
> -S =3D "${WORKDIR}/git"
> -
> -do_install () {
> -    oe_runmake install DESTDIR=3D${D} TARGET_PRODUCT=3D${TARGET_PRODUCT}
> BUILD=3D${PVR_BUILD} WINDOW_SYSTEM=3D${PVR_WS}
> -    chown -R root:root ${D}
> -}
> -
> -FILES:${PN} +=3D " ${nonarch_base_libdir}/firmware/"
> -FILES:${PN} +=3D " ${datadir}/"
> -
> -PACKAGES =3D+ "${PN}-plugins"
> -FILES:${PN}-plugins =3D "${libdir}/libGLESv2.so ${libdir}/libGLESv1_CM.s=
o
> ${libdir}/libEGL.so ${libdir}/dri/pvr_dri.so"
> -RDEPENDS:${PN} +=3D "${PN}-plugins"
> -
> -ALLOW_EMPTY:${PN}-plugins =3D "1"
> -
> -INSANE_SKIP:${PN} +=3D "ldflags arch already-stripped"
> -INSANE_SKIP:${PN}-plugins =3D "dev-so"
> -
> -CLEANBROKEN =3D "1"
> diff --git a/meta-ti-bsp/recipes-graphics/libgles/
> ti-img-rogue-umlibs_1.18.6276027.bb
> b/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_1.18.6276027.b=
b
> new file mode 100644
> index 00000000..924e46ba
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-graphics/libgles/
> ti-img-rogue-umlibs_1.18.6276027.bb
> @@ -0,0 +1,39 @@
> +DESCRIPTION =3D "Userspace libraries for PowerVR Rogue GPU on TI SoCs"
> +HOMEPAGE =3D "http://git.ti.com/graphics/ti-img-rogue-umlibs"
> +LICENSE =3D "TI-TFL"
> +LIC_FILES_CHKSUM =3D
> "file://${WORKDIR}/git/LICENSE;md5=3D7232b98c1c58f99e3baa03de5207e76f"
> +
> +inherit bin_package
> +
> +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> +COMPATIBLE_MACHINE =3D "j721e|j721s2|j784s4|am62xx"
> +
> +PR =3D "r2"
> +
> +BRANCH =3D "linuxws/kirkstone/k5.10/${PV}"
> +SRC_URI =3D "git://
> git.ti.com/git/graphics/ti-img-rogue-umlibs.git;protocol=3Dhttps;branch=
=3D${BRANCH}
> <http://git.ti.com/git/graphics/ti-img-rogue-umlibs.git;protocol=3Dhttps;=
branch=3D$%7BBRANCH%7D>
> "
> +SRCREV =3D "51e598919641d51156a631efa5447124a3c0f543"
> +S =3D "${WORKDIR}/git/targetfs/${TARGET_PRODUCT}/${PVR_WS}/${PVR_BUILD}"
> +
> +TARGET_PRODUCT:j721e =3D "j721e_linux"
> +TARGET_PRODUCT:j721s2 =3D "j721s2_linux"
> +TARGET_PRODUCT:j784s4 =3D "j784s4_linux"
> +TARGET_PRODUCT:am62xx =3D "am62_linux"
> +PVR_BUILD =3D "release"
> +PVR_WS =3D "lws-generic"
> +
> +RDEPENDS:${PN} +=3D "mesa-megadriver libdrm ti-img-rogue-driver"
> +
> +do_install:append() {
> +    rm -rf "${D}/etc/init.d"
> +    rm -rf "${D}/usr/lib/libvulkan.so"
> +    rm -rf "${D}/usr/lib/libvulkan.so.0"
> +    rm -rf "${D}/usr/lib/libvulkan.so.1"
> +}
> +
> +PACKAGES =3D "${PN}-tools ${PN}"
> +FILES:${PN}-tools =3D "${bindir}/"
> +RDEPENDS:${PN}-tools =3D "python3-core"
> +RRECOMMENDS:${PN} +=3D "${PN}-tools"
> +
> +INSANE_SKIP:${PN} +=3D "ldflags arch already-stripped dev-so"
> diff --git a/meta-ti-bsp/recipes-graphics/libgles/
> ti-sgx-ddk-um_1.17.4948957.bb b/meta-ti-bsp/recipes-graphics/libgles/
> ti-sgx-ddk-um_1.17.4948957.bb
> index fb98eb68..d7f67c59 100644
> --- a/meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
> +++ b/meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
> @@ -3,19 +3,15 @@ HOMEPAGE =3D "
> https://git.ti.com/graphics/omap5-sgx-ddk-um-linux"
>  LICENSE =3D "TI-TSPA"
>  LIC_FILES_CHKSUM =3D
> "file://TI-Linux-Graphics-DDK-UM-Manifest.doc;md5=3Db17390502bc89535c86cf=
bbae961a2a8"
>
> -inherit features_check
> -
> -REQUIRED_MACHINE_FEATURES =3D "gpu"
> -
>  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>  COMPATIBLE_MACHINE =3D "ti33x|ti43x|omap-a15|am65xx"
>
>  PR =3D "r38"
>
> -BRANCH =3D "ti-img-sgx/kirkstone/${PV}"
> +BRANCH =3D "ti-img-sgx/kirkstone-mesa/${PV}"
>
>  SRC_URI =3D "git://
> git.ti.com/graphics/omap5-sgx-ddk-um-linux.git;protocol=3Dgit;branch=3D${=
BRANCH}
> <http://git.ti.com/graphics/omap5-sgx-ddk-um-linux.git;protocol=3Dgit;bra=
nch=3D$%7BBRANCH%7D>
> "
> -SRCREV =3D "905809029b877fea42e91b9738825a6294ff1775"
> +SRCREV =3D "bbae7217051341f515515ec190e165119102f45a"
>
>  TARGET_PRODUCT:ti33x =3D "ti335x"
>  TARGET_PRODUCT:ti43x =3D "ti437x"
> @@ -27,26 +23,7 @@ INITSCRIPT_PARAMS =3D "defaults 8"
>
>  inherit update-rc.d
>
> -PROVIDES +=3D "virtual/egl virtual/libgles1 virtual/libgles2 virtual/lib=
gbm"
> -
> -DEPENDS +=3D "libdrm udev wayland wayland-protocols libffi expat"
> -DEPENDS:append:libc-musl =3D " gcompat"
> -RDEPENDS:${PN} +=3D "libdrm libdrm-omap udev wayland wayland-protocols
> libffi expat"
> -
> -RPROVIDES:${PN} =3D "libegl libgles1 libgles2 libgbm"
> -RPROVIDES:${PN}-dev =3D "libegl-dev libgles1-dev libgles2-dev libgbm-dev=
"
> -RPROVIDES:${PN}-dbg =3D "libegl-dbg libgles1-dbg libgles2-dbg libgbm-dbg=
"
> -
> -RREPLACES:${PN} =3D "libegl libgles1 libgles2 libgbm"
> -RREPLACES:${PN}-dev =3D "libegl-dev libgles1-dev libgles2-dev libgbm-dev=
"
> -RREPLACES:${PN}-dbg =3D "libegl-dbg libgles1-dbg libgles2-dbg libgbm-dbg=
"
> -
> -RCONFLICTS:${PN} =3D "libegl libgles1 libgles2 libgbm"
> -RCONFLICTS:${PN}-dev =3D "libegl-dev libgles1-dev libgles2-dev libgbm-de=
v"
> -RCONFLICTS:${PN}-dbg =3D "libegl-dbg libgles1-dbg libgles2-dbg libgbm-db=
g"
> -
> -# The actual SONAME is libGLESv2.so.2, so need to explicitly specify
> RPROVIDES for .so.1 here
> -RPROVIDES:${PN} +=3D "libGLESv2.so.1"
> +RDEPENDS:${PN} +=3D "libdrm libdrm-omap"
>
>  RRECOMMENDS:${PN} +=3D "ti-sgx-ddk-km"
>
> @@ -54,7 +31,6 @@ S =3D "${WORKDIR}/git"
>
>  do_install () {
>      oe_runmake install DESTDIR=3D${D} TARGET_PRODUCT=3D${TARGET_PRODUCT}
> -    ln -sf libGLESv2.so.2 ${D}${libdir}/libGLESv2.so.1
>
>      chown -R root:root ${D}
>  }
> diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-gl_22.0.%.bbappend
> b/meta-ti-bsp/recipes-graphics/mesa/mesa-gl_22.0.%.bbappend
> new file mode 100644
> index 00000000..912e9e9d
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-graphics/mesa/mesa-gl_22.0.%.bbappend
> @@ -0,0 +1 @@
> +require ${@bb.utils.contains_any('PREFERRED_PROVIDER_virtual/gpudriver',
> 'ti-img-rogue-driver ti-sgx-ddk-km', 'pvr-mesa.inc', '', d)}
> diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa_22.0.%.bbappend
> b/meta-ti-bsp/recipes-graphics/mesa/mesa_22.0.%.bbappend
> new file mode 100644
> index 00000000..912e9e9d
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-graphics/mesa/mesa_22.0.%.bbappend
> @@ -0,0 +1 @@
> +require ${@bb.utils.contains_any('PREFERRED_PROVIDER_virtual/gpudriver',
> 'ti-img-rogue-driver ti-sgx-ddk-km', 'pvr-mesa.inc', '', d)}
> diff --git a/meta-ti-bsp/recipes-graphics/mesa/pvr-mesa.inc
> b/meta-ti-bsp/recipes-graphics/mesa/pvr-mesa.inc
> new file mode 100644
> index 00000000..17edee8d
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-graphics/mesa/pvr-mesa.inc
> @@ -0,0 +1,40 @@
> +# PowerVR Graphics require several patches that have not made their way
> +# upstream yet. This allows us to build the shims we need without
> completely
> +# clobbering mesa.
> +
> +BRANCH =3D "powervr/kirkstone/22.0"
> +
> +SRC_URI =3D " \
> +    git://
> gitlab.freedesktop.org/StaticRocket/mesa.git;protocol=3Dhttps;branch=3D${=
BRANCH}
> <http://gitlab.freedesktop.org/StaticRocket/mesa.git;protocol=3Dhttps;bra=
nch=3D$%7BBRANCH%7D>
> \
> +
> file://0001-meson.build-check-for-all-linux-host_os-combinations.patch \
> +    file://0002-meson.build-make-TLS-ELF-optional.patch \
> +    file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
> +    file://0001-futex.h-Define-__NR_futex-if-it-does-not-exist.patch \
> +    file://0001-util-format-Check-for-NEON-before-using-it.patch \
> +
> file://0001-Revert-egl-wayland-deprecate-drm_handle_format-and-d.patch \
> +"
>

Having here all the patches in oe-core will stop working if someone changes
the main recipe.
This already happens in the master branch of oe-core.

IMO If these patches are needed they should be merged on the ti fork branch=
.

Jose


> +
> +S =3D "${WORKDIR}/git"
> +
> +SRCREV =3D "44b82a7b6fa8a86243911b1b0d6a07b0fd8ecfba"
> +
> +PACKAGECONFIG:append =3D " \
> +    ${@bb.utils.contains('PREFERRED_PROVIDER_virtual/gpudriver',
> 'ti-img-rogue-driver', 'pvr', '', d)} \
> +    ${@bb.utils.contains('PREFERRED_PROVIDER_virtual/gpudriver',
> 'ti-sgx-ddk-km', 'sgx', '', d)} \
> +"
> +
> +PVR_DISPLAY_CONTROLLER_ALIAS ??=3D "tidss"
> +PACKAGECONFIG[pvr] =3D
> "-Dgallium-pvr-alias=3D${PVR_DISPLAY_CONTROLLER_ALIAS},"
> +PACKAGECONFIG[sgx] =3D
> "-Dgallium-sgx-alias=3D${PVR_DISPLAY_CONTROLLER_ALIAS},"
> +
> +PV:append =3D "+pvr"
> +
> +GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'pvr',
> ',pvr', '', d)}"
> +GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'sgx',
> ',sgx', '', d)}"
> +
> +do_install:append () {
> +    # remove pvr custom pkgconfig
> +    rm -rf ${D}${datadir}/pkgconfig
> +}
> +
> +RRECOMMENDS:mesa-megadriver:class-target:append =3D
> "${@d.getVar('PREFERRED_PROVIDER_virtual/gpudriver')}"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#15708):
> https://lists.yoctoproject.org/g/meta-ti/message/15708
> Mute This Topic: https://lists.yoctoproject.org/mt/96641366/5052612
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--00000000000048517b05f51fa82d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Randolph Sapp via <a href=3D"http://l=
ists.yoctoproject.org">lists.yoctoproject.org</a> &lt;rs=3D<a href=3D"mailt=
o:ti.com@lists.yoctoproject.org">ti.com@lists.yoctoproject.org</a>&gt; escr=
eveu no dia segunda, 30/01/2023 =C3=A0(s) 23:20:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">Patched mesa will now be configured based =
on what virtual/gpudriver<br>
preferred provider is selected. The gpu drivers will now runtime<br>
recommend the associated um components.<br>
<br>
Signed-off-by: Randolph Sapp &lt;<a href=3D"mailto:rs@ti.com" target=3D"_bl=
ank">rs@ti.com</a>&gt;<br>
---<br>
=C2=A0...-OpenEmbedded-nodistro-internal-aarc.patch | 29 --------<br>
=C2=A0...bb =3D&gt; <a href=3D"http://ti-img-rogue-driver_1.18.6276027.bb" =
rel=3D"noreferrer" target=3D"_blank">ti-img-rogue-driver_1.18.6276027.bb</a=
>} | 20 +++---<br>
=C2=A0.../<a href=3D"http://ti-sgx-ddk-km_1.17.4948957.bb" rel=3D"noreferre=
r" target=3D"_blank">ti-sgx-ddk-km_1.17.4948957.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 8 +--<br>
=C2=A0.../<a href=3D"http://ti-img-rogue-umlibs_1.15.6133109.bb" rel=3D"nor=
eferrer" target=3D"_blank">ti-img-rogue-umlibs_1.15.6133109.bb</a>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0| 71 -------------------<br>
=C2=A0.../<a href=3D"http://ti-img-rogue-umlibs_1.18.6276027.bb" rel=3D"nor=
eferrer" target=3D"_blank">ti-img-rogue-umlibs_1.18.6276027.bb</a>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0| 39 ++++++++++<br>
=C2=A0.../libgles/<a href=3D"http://ti-sgx-ddk-um_1.17.4948957.bb" rel=3D"n=
oreferrer" target=3D"_blank">ti-sgx-ddk-um_1.17.4948957.bb</a>=C2=A0 =C2=A0=
 =C2=A0| 30 +-------<br>
=C2=A0.../mesa/mesa-gl_22.0.%.bbappend=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 1 +<br>
=C2=A0.../mesa/mesa_22.0.%.bbappend=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
=C2=A0.../recipes-graphics/mesa/pvr-mesa.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 4=
0 +++++++++++<br>
=C2=A09 files changed, 97 insertions(+), 142 deletions(-)<br>
=C2=A0delete mode 100644 meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rog=
ue-driver/0001-compiler-support-OpenEmbedded-nodistro-internal-aarc.patch<b=
r>
=C2=A0rename meta-ti-bsp/recipes-bsp/powervr-drivers/{<a href=3D"http://ti-=
img-rogue-driver_1.15.6133109.bb" rel=3D"noreferrer" target=3D"_blank">ti-i=
mg-rogue-driver_1.15.6133109.bb</a> =3D&gt; <a href=3D"http://ti-img-rogue-=
driver_1.18.6276027.bb" rel=3D"noreferrer" target=3D"_blank">ti-img-rogue-d=
river_1.18.6276027.bb</a>} (72%)<br>
=C2=A0delete mode 100644 meta-ti-bsp/recipes-graphics/libgles/<a href=3D"ht=
tp://ti-img-rogue-umlibs_1.15.6133109.bb" rel=3D"noreferrer" target=3D"_bla=
nk">ti-img-rogue-umlibs_1.15.6133109.bb</a><br>
=C2=A0create mode 100644 meta-ti-bsp/recipes-graphics/libgles/<a href=3D"ht=
tp://ti-img-rogue-umlibs_1.18.6276027.bb" rel=3D"noreferrer" target=3D"_bla=
nk">ti-img-rogue-umlibs_1.18.6276027.bb</a><br>
=C2=A0create mode 100644 meta-ti-bsp/recipes-graphics/mesa/mesa-gl_22.0.%.b=
bappend<br>
=C2=A0create mode 100644 meta-ti-bsp/recipes-graphics/mesa/mesa_22.0.%.bbap=
pend<br>
=C2=A0create mode 100644 meta-ti-bsp/recipes-graphics/mesa/pvr-mesa.inc<br>
<br>
diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver/00=
01-compiler-support-OpenEmbedded-nodistro-internal-aarc.patch b/meta-ti-bsp=
/recipes-bsp/powervr-drivers/ti-img-rogue-driver/0001-compiler-support-Open=
Embedded-nodistro-internal-aarc.patch<br>
deleted file mode 100644<br>
index f021cc39..00000000<br>
--- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver/0001-comp=
iler-support-OpenEmbedded-nodistro-internal-aarc.patch<br>
+++ /dev/null<br>
@@ -1,29 +0,0 @@<br>
-From 80d32fee3d768abbd77cce77ea9a7574651460a9 Mon Sep 17 00:00:00 2001<br>
-From: Denys Dmytriyenko &lt;<a href=3D"mailto:denis@denix.org" target=3D"_=
blank">denis@denix.org</a>&gt;<br>
-Date: Wed, 7 Jul 2021 13:11:56 -0400<br>
-Subject: [PATCH] compiler: support OpenEmbedded &quot;nodistro&quot; inter=
nal aarch64<br>
- toolchain<br>
-<br>
-Upstream-Status: Pending<br>
-<br>
-Signed-off-by: Denys Dmytriyenko &lt;<a href=3D"mailto:denis@denix.org" ta=
rget=3D"_blank">denis@denix.org</a>&gt;<br>
----<br>
- build/linux/config/<a href=3D"http://compiler.mk" rel=3D"noreferrer" targ=
et=3D"_blank">compiler.mk</a> | 2 +-<br>
- 1 file changed, 1 insertion(+), 1 deletion(-)<br>
-<br>
-diff --git a/build/linux/config/<a href=3D"http://compiler.mk" rel=3D"nore=
ferrer" target=3D"_blank">compiler.mk</a> b/build/linux/config/<a href=3D"h=
ttp://compiler.mk" rel=3D"noreferrer" target=3D"_blank">compiler.mk</a><br>
-index 53a0bef..d788579 100644<br>
---- a/build/linux/config/<a href=3D"http://compiler.mk" rel=3D"noreferrer"=
 target=3D"_blank">compiler.mk</a><br>
-+++ b/build/linux/config/<a href=3D"http://compiler.mk" rel=3D"noreferrer"=
 target=3D"_blank">compiler.mk</a><br>
-@@ -65,7 +65,7 @@ define calculate-compiler-preferred-target<br>
-=C2=A0 =C2=A0 ifneq ($$(filter i386-% i486-% i586-% i686-%,$$($(1)_compile=
r_preferred_target)),)<br>
-=C2=A0 =C2=A0 =C2=A0$(1)_compiler_preferred_target :=3D i386-linux-gnu<br>
-=C2=A0 =C2=A0 endif<br>
--=C2=A0 =C2=A0ifneq ($$(filter aarch64-poky-linux,$$($(1)_compiler_preferr=
ed_target)),)<br>
-+=C2=A0 =C2=A0ifneq ($$(filter aarch64-oe-linux aarch64-poky-linux,$$($(1)=
_compiler_preferred_target)),)<br>
-=C2=A0 =C2=A0 =C2=A0$(1)_compiler_preferred_target :=3D aarch64-linux-gnu<=
br>
-=C2=A0 =C2=A0 endif<br>
-=C2=A0 =C2=A0 ifneq ($$(filter armv7a-cros-linux-gnueabi armv7l-tizen-linu=
x-gnueabi,$$($(1)_compiler_preferred_target)),)<br>
--- <br>
-2.7.4<br>
-<br>
diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/<a href=3D"http://ti-i=
mg-rogue-driver_1.15.6133109.bb" rel=3D"noreferrer" target=3D"_blank">ti-im=
g-rogue-driver_1.15.6133109.bb</a> b/meta-ti-bsp/recipes-bsp/powervr-driver=
s/<a href=3D"http://ti-img-rogue-driver_1.18.6276027.bb" rel=3D"noreferrer"=
 target=3D"_blank">ti-img-rogue-driver_1.18.6276027.bb</a><br>
similarity index 72%<br>
rename from meta-ti-bsp/recipes-bsp/powervr-drivers/<a href=3D"http://ti-im=
g-rogue-driver_1.15.6133109.bb" rel=3D"noreferrer" target=3D"_blank">ti-img=
-rogue-driver_1.15.6133109.bb</a><br>
rename to meta-ti-bsp/recipes-bsp/powervr-drivers/<a href=3D"http://ti-img-=
rogue-driver_1.18.6276027.bb" rel=3D"noreferrer" target=3D"_blank">ti-img-r=
ogue-driver_1.18.6276027.bb</a><br>
index b4d19195..96fb7484 100644<br>
--- a/meta-ti-bsp/recipes-bsp/powervr-drivers/<a href=3D"http://ti-img-rogu=
e-driver_1.15.6133109.bb" rel=3D"noreferrer" target=3D"_blank">ti-img-rogue=
-driver_1.15.6133109.bb</a><br>
+++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/<a href=3D"http://ti-img-rogu=
e-driver_1.18.6276027.bb" rel=3D"noreferrer" target=3D"_blank">ti-img-rogue=
-driver_1.18.6276027.bb</a><br>
@@ -3,40 +3,38 @@ HOMEPAGE =3D &quot;<a href=3D"http://git.ti.com/graphics/=
ti-img-rogue-driver" rel=3D"noreferrer" target=3D"_blank">http://git.ti.com=
/graphics/ti-img-rogue-driver</a>&quot;<br>
=C2=A0LICENSE =3D &quot;MIT | GPL-2.0-only&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://README;beginline=3D14;endline=3D19;=
md5=3D0403c7dea01a2b8232261e805325fac2&quot;<br>
<br>
-inherit module features_check<br>
+inherit module<br>
<br>
-REQUIRED_MACHINE_FEATURES =3D &quot;gpu&quot;<br>
+PROVIDES =3D &quot;virtual/gpudriver&quot;<br>
<br>
=C2=A0MACHINE_KERNEL_PR:append =3D &quot;b&quot;<br>
=C2=A0PR =3D &quot;${MACHINE_KERNEL_PR}&quot;<br>
<br>
=C2=A0PACKAGE_ARCH =3D &quot;${MACHINE_ARCH}&quot;<br>
+<br>
=C2=A0COMPATIBLE_MACHINE =3D &quot;j721e|j721s2|j784s4|am62xx&quot;<br>
<br>
=C2=A0DEPENDS =3D &quot;virtual/kernel&quot;<br>
<br>
-PROVIDES =3D &quot;virtual/gpudriver&quot;<br>
+BRANCH =3D &quot;linuxws/kirkstone/k5.10/${PV}&quot;<br>
<br>
-BRANCH =3D &quot;linuxws/dunfell/k5.10/${PV}_unified_fw_pagesize&quot;<br>
-<br>
-SRC_URI =3D &quot; \<br>
-=C2=A0 =C2=A0 git://<a href=3D"http://git.ti.com/git/graphics/ti-img-rogue=
-driver.git;protocol=3Dhttps;branch=3D$%7BBRANCH%7D" rel=3D"noreferrer" tar=
get=3D"_blank">git.ti.com/git/graphics/ti-img-rogue-driver.git;protocol=3Dh=
ttps;branch=3D${BRANCH}</a> \<br>
-=C2=A0 =C2=A0 file://0001-compiler-support-OpenEmbedded-nodistro-internal-=
aarc.patch \<br>
-&quot;<br>
+SRC_URI =3D &quot;git://<a href=3D"http://git.ti.com/git/graphics/ti-img-r=
ogue-driver.git;protocol=3Dhttps;branch=3D$%7BBRANCH%7D" rel=3D"noreferrer"=
 target=3D"_blank">git.ti.com/git/graphics/ti-img-rogue-driver.git;protocol=
=3Dhttps;branch=3D${BRANCH}</a>&quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
<br>
-SRCREV =3D &quot;c901804e8221d477983a6f7224a9cdc6e832f050&quot;<br>
+SRCREV =3D &quot;d575e4f64c95a3534e10e85da15bd303febf133f&quot;<br>
<br>
=C2=A0TARGET_PRODUCT:j721e =3D &quot;j721e_linux&quot;<br>
=C2=A0TARGET_PRODUCT:j721s2 =3D &quot;j721s2_linux&quot;<br>
=C2=A0TARGET_PRODUCT:j784s4 =3D &quot;j784s4_linux&quot;<br>
=C2=A0TARGET_PRODUCT:am62xx =3D &quot;am62_linux&quot;<br>
=C2=A0PVR_BUILD =3D &quot;release&quot;<br>
-PVR_WS =3D &quot;wayland&quot;<br>
+PVR_WS =3D &quot;lws-generic&quot;<br>
<br>
=C2=A0EXTRA_OEMAKE +=3D &#39;KERNELDIR=3D&quot;${STAGING_KERNEL_DIR}&quot; =
BUILD=3D${PVR_BUILD} PVR_BUILD_DIR=3D${TARGET_PRODUCT} WINDOW_SYSTEM=3D${PV=
R_WS}&#39;<br>
<br>
=C2=A0do_install() {<br>
=C2=A0 =C2=A0 =C2=A0make -C ${STAGING_KERNEL_DIR} M=3D${B}/binary_${TARGET_=
PRODUCT}_${PVR_WS}_${PVR_BUILD}/target_aarch64/kbuild INSTALL_MOD_PATH=3D${=
D}${root_prefix} PREFIX=3D${STAGING_DIR_HOST} modules_install<br>
=C2=A0}<br>
+<br>
+RRECOMMENDS:${PN} +=3D &quot;ti-img-rogue-umlibs&quot;<br>
diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/<a href=3D"http://ti-s=
gx-ddk-km_1.17.4948957.bb" rel=3D"noreferrer" target=3D"_blank">ti-sgx-ddk-=
km_1.17.4948957.bb</a> b/meta-ti-bsp/recipes-bsp/powervr-drivers/<a href=3D=
"http://ti-sgx-ddk-km_1.17.4948957.bb" rel=3D"noreferrer" target=3D"_blank"=
>ti-sgx-ddk-km_1.17.4948957.bb</a><br>
index c22e3096..13b8757c 100644<br>
--- a/meta-ti-bsp/recipes-bsp/powervr-drivers/<a href=3D"http://ti-sgx-ddk-=
km_1.17.4948957.bb" rel=3D"noreferrer" target=3D"_blank">ti-sgx-ddk-km_1.17=
.4948957.bb</a><br>
+++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/<a href=3D"http://ti-sgx-ddk-=
km_1.17.4948957.bb" rel=3D"noreferrer" target=3D"_blank">ti-sgx-ddk-km_1.17=
.4948957.bb</a><br>
@@ -3,9 +3,9 @@ HOMEPAGE =3D &quot;<a href=3D"https://git.ti.com/graphics/o=
map5-sgx-ddk-linux" rel=3D"noreferrer" target=3D"_blank">https://git.ti.com=
/graphics/omap5-sgx-ddk-linux</a>&quot;<br>
=C2=A0LICENSE =3D &quot;MIT | GPL-2.0-only&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://eurasia_km/README;beginline=3D13;en=
dline=3D22;md5=3D74506d9b8e5edbce66c2747c50fcef12&quot;<br>
<br>
-inherit module features_check<br>
+inherit module<br>
<br>
-REQUIRED_MACHINE_FEATURES =3D &quot;gpu&quot;<br>
+PROVIDES =3D &quot;virtual/gpudriver&quot;<br>
<br>
=C2=A0COMPATIBLE_MACHINE =3D &quot;ti33x|ti43x|omap-a15|k3&quot;<br>
<br>
@@ -16,8 +16,6 @@ PACKAGE_ARCH =3D &quot;${MACHINE_ARCH}&quot;<br>
<br>
=C2=A0DEPENDS =3D &quot;virtual/kernel&quot;<br>
<br>
-PROVIDES =3D &quot;virtual/gpudriver&quot;<br>
-<br>
=C2=A0BRANCH =3D &quot;ti-img-sgx/${PV}/k5.10&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://git.ti.com/git/graphics/oma=
p5-sgx-ddk-linux.git;protocol=3Dhttps;branch=3D$%7BBRANCH%7D" rel=3D"norefe=
rrer" target=3D"_blank">git.ti.com/git/graphics/omap5-sgx-ddk-linux.git;pro=
tocol=3Dhttps;branch=3D${BRANCH}</a>&quot;<br>
@@ -44,3 +42,5 @@ do_install() {<br>
=C2=A0do_install:k3() {<br>
=C2=A0 =C2=A0 =C2=A0make -C ${STAGING_KERNEL_DIR} M=3D${B}/eurasia_km/euras=
iacon/binary_omap_linux_nulldrmws_release/target_aarch64/kbuild INSTALL_MOD=
_PATH=3D${D}${root_prefix} PREFIX=3D${STAGING_DIR_HOST} modules_install<br>
=C2=A0}<br>
+<br>
+RRECOMMENDS:${PN} +=3D &quot;ti-sgx-ddk-um&quot;<br>
diff --git a/meta-ti-bsp/recipes-graphics/libgles/<a href=3D"http://ti-img-=
rogue-umlibs_1.15.6133109.bb" rel=3D"noreferrer" target=3D"_blank">ti-img-r=
ogue-umlibs_1.15.6133109.bb</a> b/meta-ti-bsp/recipes-graphics/libgles/<a h=
ref=3D"http://ti-img-rogue-umlibs_1.15.6133109.bb" rel=3D"noreferrer" targe=
t=3D"_blank">ti-img-rogue-umlibs_1.15.6133109.bb</a><br>
deleted file mode 100644<br>
index a665c614..00000000<br>
--- a/meta-ti-bsp/recipes-graphics/libgles/<a href=3D"http://ti-img-rogue-u=
mlibs_1.15.6133109.bb" rel=3D"noreferrer" target=3D"_blank">ti-img-rogue-um=
libs_1.15.6133109.bb</a><br>
+++ /dev/null<br>
@@ -1,71 +0,0 @@<br>
-DESCRIPTION =3D &quot;Userspace libraries for PowerVR Rogue GPU on TI SoCs=
&quot;<br>
-HOMEPAGE =3D &quot;<a href=3D"http://git.ti.com/graphics/ti-img-rogue-umli=
bs" rel=3D"noreferrer" target=3D"_blank">http://git.ti.com/graphics/ti-img-=
rogue-umlibs</a>&quot;<br>
-LICENSE =3D &quot;TI-TFL&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D7232b98c1c58f99e3baa03de52=
07e76f&quot;<br>
-<br>
-inherit features_check<br>
-<br>
-REQUIRED_MACHINE_FEATURES =3D &quot;gpu&quot;<br>
-<br>
-PACKAGE_ARCH =3D &quot;${MACHINE_ARCH}&quot;<br>
-COMPATIBLE_MACHINE =3D &quot;j721e|j721s2|j784s4|am62xx&quot;<br>
-<br>
-PR =3D &quot;r2&quot;<br>
-<br>
-BRANCH =3D &quot;linuxws/dunfell/k5.10/${PV}_unified_fw_pagesize&quot;<br>
-<br>
-SRC_URI =3D &quot;git://<a href=3D"http://git.ti.com/git/graphics/ti-img-r=
ogue-umlibs.git;protocol=3Dhttps;branch=3D$%7BBRANCH%7D" rel=3D"noreferrer"=
 target=3D"_blank">git.ti.com/git/graphics/ti-img-rogue-umlibs.git;protocol=
=3Dhttps;branch=3D${BRANCH}</a>&quot;<br>
-SRCREV =3D &quot;5977e82b96028f783d39c7219f016c1faf8dc5f5&quot;<br>
-<br>
-TARGET_PRODUCT:j721e =3D &quot;j721e_linux&quot;<br>
-TARGET_PRODUCT:j721s2 =3D &quot;j721s2_linux&quot;<br>
-TARGET_PRODUCT:j784s4 =3D &quot;j784s4_linux&quot;<br>
-TARGET_PRODUCT:am62xx =3D &quot;am62_linux&quot;<br>
-PVR_BUILD ?=3D &quot;release&quot;<br>
-PVR_WS =3D &quot;wayland&quot;<br>
-<br>
-INITSCRIPT_NAME =3D &quot;rc.pvr&quot;<br>
-INITSCRIPT_PARAMS =3D &quot;defaults 8&quot;<br>
-<br>
-inherit update-rc.d<br>
-<br>
-PROVIDES +=3D &quot;virtual/egl virtual/libgles1 virtual/libgles2 virtual/=
libgbm&quot;<br>
-<br>
-DEPENDS +=3D &quot;libdrm wayland expat&quot;<br>
-RDEPENDS:${PN} +=3D &quot;bash&quot;<br>
-RDEPENDS:${PN} +=3D &quot;wayland expat&quot;<br>
-<br>
-RPROVIDES:${PN} =3D &quot;libegl libgles1 libgles2 libgbm&quot;<br>
-RPROVIDES:${PN}-dev =3D &quot;libegl-dev libgles1-dev libgles2-dev libgbm-=
dev&quot;<br>
-RPROVIDES:${PN}-dbg =3D &quot;libegl-dbg libgles1-dbg libgles2-dbg&quot;<b=
r>
-<br>
-RREPLACES:${PN} =3D &quot;libegl libgles1 liblges2 libgbm&quot;<br>
-RREPLACES:${PN}-dev =3D &quot;libegl-dev libgles1-dev libgles2-dev libgbm-=
dev&quot;<br>
-RREPLACES:${PN}-dbg =3D &quot;libegl-dbg libgles1-dbg libgles2-dbg&quot;<b=
r>
-<br>
-RCONFLICTS:${PN} =3D &quot;libegl libgles1 libgles2 libgbm&quot;<br>
-RCONFLICTS:${PN}-dev =3D &quot;libegl-dev libgles1-dev libgles2-dev libgbm=
-dev&quot;<br>
-RCONFLICTS:${PN}-dbg =3D &quot;libegl-dbg libgles1-dbg libgles2-dbg&quot;<=
br>
-<br>
-RRECOMMENDS:${PN} +=3D &quot;ti-img-rogue-driver&quot;<br>
-<br>
-S =3D &quot;${WORKDIR}/git&quot;<br>
-<br>
-do_install () {<br>
-=C2=A0 =C2=A0 oe_runmake install DESTDIR=3D${D} TARGET_PRODUCT=3D${TARGET_=
PRODUCT} BUILD=3D${PVR_BUILD} WINDOW_SYSTEM=3D${PVR_WS}<br>
-=C2=A0 =C2=A0 chown -R root:root ${D}<br>
-}<br>
-<br>
-FILES:${PN} +=3D &quot; ${nonarch_base_libdir}/firmware/&quot;<br>
-FILES:${PN} +=3D &quot; ${datadir}/&quot;<br>
-<br>
-PACKAGES =3D+ &quot;${PN}-plugins&quot;<br>
-FILES:${PN}-plugins =3D &quot;${libdir}/libGLESv2.so ${libdir}/libGLESv1_C=
M.so ${libdir}/libEGL.so ${libdir}/dri/pvr_dri.so&quot;<br>
-RDEPENDS:${PN} +=3D &quot;${PN}-plugins&quot;<br>
-<br>
-ALLOW_EMPTY:${PN}-plugins =3D &quot;1&quot;<br>
-<br>
-INSANE_SKIP:${PN} +=3D &quot;ldflags arch already-stripped&quot;<br>
-INSANE_SKIP:${PN}-plugins =3D &quot;dev-so&quot;<br>
-<br>
-CLEANBROKEN =3D &quot;1&quot;<br>
diff --git a/meta-ti-bsp/recipes-graphics/libgles/<a href=3D"http://ti-img-=
rogue-umlibs_1.18.6276027.bb" rel=3D"noreferrer" target=3D"_blank">ti-img-r=
ogue-umlibs_1.18.6276027.bb</a> b/meta-ti-bsp/recipes-graphics/libgles/<a h=
ref=3D"http://ti-img-rogue-umlibs_1.18.6276027.bb" rel=3D"noreferrer" targe=
t=3D"_blank">ti-img-rogue-umlibs_1.18.6276027.bb</a><br>
new file mode 100644<br>
index 00000000..924e46ba<br>
--- /dev/null<br>
+++ b/meta-ti-bsp/recipes-graphics/libgles/<a href=3D"http://ti-img-rogue-u=
mlibs_1.18.6276027.bb" rel=3D"noreferrer" target=3D"_blank">ti-img-rogue-um=
libs_1.18.6276027.bb</a><br>
@@ -0,0 +1,39 @@<br>
+DESCRIPTION =3D &quot;Userspace libraries for PowerVR Rogue GPU on TI SoCs=
&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"http://git.ti.com/graphics/ti-img-rogue-umli=
bs" rel=3D"noreferrer" target=3D"_blank">http://git.ti.com/graphics/ti-img-=
rogue-umlibs</a>&quot;<br>
+LICENSE =3D &quot;TI-TFL&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://${WORKDIR}/git/LICENSE;md5=3D7232b98c1c5=
8f99e3baa03de5207e76f&quot;<br>
+<br>
+inherit bin_package<br>
+<br>
+PACKAGE_ARCH =3D &quot;${MACHINE_ARCH}&quot;<br>
+COMPATIBLE_MACHINE =3D &quot;j721e|j721s2|j784s4|am62xx&quot;<br>
+<br>
+PR =3D &quot;r2&quot;<br>
+<br>
+BRANCH =3D &quot;linuxws/kirkstone/k5.10/${PV}&quot;<br>
+SRC_URI =3D &quot;git://<a href=3D"http://git.ti.com/git/graphics/ti-img-r=
ogue-umlibs.git;protocol=3Dhttps;branch=3D$%7BBRANCH%7D" rel=3D"noreferrer"=
 target=3D"_blank">git.ti.com/git/graphics/ti-img-rogue-umlibs.git;protocol=
=3Dhttps;branch=3D${BRANCH}</a>&quot;<br>
+SRCREV =3D &quot;51e598919641d51156a631efa5447124a3c0f543&quot;<br>
+S =3D &quot;${WORKDIR}/git/targetfs/${TARGET_PRODUCT}/${PVR_WS}/${PVR_BUIL=
D}&quot;<br>
+<br>
+TARGET_PRODUCT:j721e =3D &quot;j721e_linux&quot;<br>
+TARGET_PRODUCT:j721s2 =3D &quot;j721s2_linux&quot;<br>
+TARGET_PRODUCT:j784s4 =3D &quot;j784s4_linux&quot;<br>
+TARGET_PRODUCT:am62xx =3D &quot;am62_linux&quot;<br>
+PVR_BUILD =3D &quot;release&quot;<br>
+PVR_WS =3D &quot;lws-generic&quot;<br>
+<br>
+RDEPENDS:${PN} +=3D &quot;mesa-megadriver libdrm ti-img-rogue-driver&quot;=
<br>
+<br>
+do_install:append() {<br>
+=C2=A0 =C2=A0 rm -rf &quot;${D}/etc/init.d&quot;<br>
+=C2=A0 =C2=A0 rm -rf &quot;${D}/usr/lib/libvulkan.so&quot;<br>
+=C2=A0 =C2=A0 rm -rf &quot;${D}/usr/lib/libvulkan.so.0&quot;<br>
+=C2=A0 =C2=A0 rm -rf &quot;${D}/usr/lib/libvulkan.so.1&quot;<br>
+}<br>
+<br>
+PACKAGES =3D &quot;${PN}-tools ${PN}&quot;<br>
+FILES:${PN}-tools =3D &quot;${bindir}/&quot;<br>
+RDEPENDS:${PN}-tools =3D &quot;python3-core&quot;<br>
+RRECOMMENDS:${PN} +=3D &quot;${PN}-tools&quot;<br>
+<br>
+INSANE_SKIP:${PN} +=3D &quot;ldflags arch already-stripped dev-so&quot;<br=
>
diff --git a/meta-ti-bsp/recipes-graphics/libgles/<a href=3D"http://ti-sgx-=
ddk-um_1.17.4948957.bb" rel=3D"noreferrer" target=3D"_blank">ti-sgx-ddk-um_=
1.17.4948957.bb</a> b/meta-ti-bsp/recipes-graphics/libgles/<a href=3D"http:=
//ti-sgx-ddk-um_1.17.4948957.bb" rel=3D"noreferrer" target=3D"_blank">ti-sg=
x-ddk-um_1.17.4948957.bb</a><br>
index fb98eb68..d7f67c59 100644<br>
--- a/meta-ti-bsp/recipes-graphics/libgles/<a href=3D"http://ti-sgx-ddk-um_=
1.17.4948957.bb" rel=3D"noreferrer" target=3D"_blank">ti-sgx-ddk-um_1.17.49=
48957.bb</a><br>
+++ b/meta-ti-bsp/recipes-graphics/libgles/<a href=3D"http://ti-sgx-ddk-um_=
1.17.4948957.bb" rel=3D"noreferrer" target=3D"_blank">ti-sgx-ddk-um_1.17.49=
48957.bb</a><br>
@@ -3,19 +3,15 @@ HOMEPAGE =3D &quot;<a href=3D"https://git.ti.com/graphics=
/omap5-sgx-ddk-um-linux" rel=3D"noreferrer" target=3D"_blank">https://git.t=
i.com/graphics/omap5-sgx-ddk-um-linux</a>&quot;<br>
=C2=A0LICENSE =3D &quot;TI-TSPA&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://TI-Linux-Graphics-DDK-UM-Manifest.d=
oc;md5=3Db17390502bc89535c86cfbbae961a2a8&quot;<br>
<br>
-inherit features_check<br>
-<br>
-REQUIRED_MACHINE_FEATURES =3D &quot;gpu&quot;<br>
-<br>
=C2=A0PACKAGE_ARCH =3D &quot;${MACHINE_ARCH}&quot;<br>
=C2=A0COMPATIBLE_MACHINE =3D &quot;ti33x|ti43x|omap-a15|am65xx&quot;<br>
<br>
=C2=A0PR =3D &quot;r38&quot;<br>
<br>
-BRANCH =3D &quot;ti-img-sgx/kirkstone/${PV}&quot;<br>
+BRANCH =3D &quot;ti-img-sgx/kirkstone-mesa/${PV}&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://git.ti.com/graphics/omap5-s=
gx-ddk-um-linux.git;protocol=3Dgit;branch=3D$%7BBRANCH%7D" rel=3D"noreferre=
r" target=3D"_blank">git.ti.com/graphics/omap5-sgx-ddk-um-linux.git;protoco=
l=3Dgit;branch=3D${BRANCH}</a>&quot;<br>
-SRCREV =3D &quot;905809029b877fea42e91b9738825a6294ff1775&quot;<br>
+SRCREV =3D &quot;bbae7217051341f515515ec190e165119102f45a&quot;<br>
<br>
=C2=A0TARGET_PRODUCT:ti33x =3D &quot;ti335x&quot;<br>
=C2=A0TARGET_PRODUCT:ti43x =3D &quot;ti437x&quot;<br>
@@ -27,26 +23,7 @@ INITSCRIPT_PARAMS =3D &quot;defaults 8&quot;<br>
<br>
=C2=A0inherit update-rc.d<br>
<br>
-PROVIDES +=3D &quot;virtual/egl virtual/libgles1 virtual/libgles2 virtual/=
libgbm&quot;<br>
-<br>
-DEPENDS +=3D &quot;libdrm udev wayland wayland-protocols libffi expat&quot=
;<br>
-DEPENDS:append:libc-musl =3D &quot; gcompat&quot;<br>
-RDEPENDS:${PN} +=3D &quot;libdrm libdrm-omap udev wayland wayland-protocol=
s libffi expat&quot;<br>
-<br>
-RPROVIDES:${PN} =3D &quot;libegl libgles1 libgles2 libgbm&quot;<br>
-RPROVIDES:${PN}-dev =3D &quot;libegl-dev libgles1-dev libgles2-dev libgbm-=
dev&quot;<br>
-RPROVIDES:${PN}-dbg =3D &quot;libegl-dbg libgles1-dbg libgles2-dbg libgbm-=
dbg&quot;<br>
-<br>
-RREPLACES:${PN} =3D &quot;libegl libgles1 libgles2 libgbm&quot;<br>
-RREPLACES:${PN}-dev =3D &quot;libegl-dev libgles1-dev libgles2-dev libgbm-=
dev&quot;<br>
-RREPLACES:${PN}-dbg =3D &quot;libegl-dbg libgles1-dbg libgles2-dbg libgbm-=
dbg&quot;<br>
-<br>
-RCONFLICTS:${PN} =3D &quot;libegl libgles1 libgles2 libgbm&quot;<br>
-RCONFLICTS:${PN}-dev =3D &quot;libegl-dev libgles1-dev libgles2-dev libgbm=
-dev&quot;<br>
-RCONFLICTS:${PN}-dbg =3D &quot;libegl-dbg libgles1-dbg libgles2-dbg libgbm=
-dbg&quot;<br>
-<br>
-# The actual SONAME is libGLESv2.so.2, so need to explicitly specify RPROV=
IDES for .so.1 here<br>
-RPROVIDES:${PN} +=3D &quot;libGLESv2.so.1&quot;<br>
+RDEPENDS:${PN} +=3D &quot;libdrm libdrm-omap&quot;<br>
<br>
=C2=A0RRECOMMENDS:${PN} +=3D &quot;ti-sgx-ddk-km&quot;<br>
<br>
@@ -54,7 +31,6 @@ S =3D &quot;${WORKDIR}/git&quot;<br>
<br>
=C2=A0do_install () {<br>
=C2=A0 =C2=A0 =C2=A0oe_runmake install DESTDIR=3D${D} TARGET_PRODUCT=3D${TA=
RGET_PRODUCT}<br>
-=C2=A0 =C2=A0 ln -sf libGLESv2.so.2 ${D}${libdir}/libGLESv2.so.1<br>
<br>
=C2=A0 =C2=A0 =C2=A0chown -R root:root ${D}<br>
=C2=A0}<br>
diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-gl_22.0.%.bbappend b/me=
ta-ti-bsp/recipes-graphics/mesa/mesa-gl_22.0.%.bbappend<br>
new file mode 100644<br>
index 00000000..912e9e9d<br>
--- /dev/null<br>
+++ b/meta-ti-bsp/recipes-graphics/mesa/mesa-gl_22.0.%.bbappend<br>
@@ -0,0 +1 @@<br>
+require ${@bb.utils.contains_any(&#39;PREFERRED_PROVIDER_virtual/gpudriver=
&#39;, &#39;ti-img-rogue-driver ti-sgx-ddk-km&#39;, &#39;pvr-mesa.inc&#39;,=
 &#39;&#39;, d)}<br>
diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa_22.0.%.bbappend b/meta-=
ti-bsp/recipes-graphics/mesa/mesa_22.0.%.bbappend<br>
new file mode 100644<br>
index 00000000..912e9e9d<br>
--- /dev/null<br>
+++ b/meta-ti-bsp/recipes-graphics/mesa/mesa_22.0.%.bbappend<br>
@@ -0,0 +1 @@<br>
+require ${@bb.utils.contains_any(&#39;PREFERRED_PROVIDER_virtual/gpudriver=
&#39;, &#39;ti-img-rogue-driver ti-sgx-ddk-km&#39;, &#39;pvr-mesa.inc&#39;,=
 &#39;&#39;, d)}<br>
diff --git a/meta-ti-bsp/recipes-graphics/mesa/pvr-mesa.inc b/meta-ti-bsp/r=
ecipes-graphics/mesa/pvr-mesa.inc<br>
new file mode 100644<br>
index 00000000..17edee8d<br>
--- /dev/null<br>
+++ b/meta-ti-bsp/recipes-graphics/mesa/pvr-mesa.inc<br>
@@ -0,0 +1,40 @@<br>
+# PowerVR Graphics require several patches that have not made their way<br=
>
+# upstream yet. This allows us to build the shims we need without complete=
ly<br>
+# clobbering mesa.<br>
+<br>
+BRANCH =3D &quot;powervr/kirkstone/22.0&quot;<br>
+<br>
+SRC_URI =3D &quot; \<br>
+=C2=A0 =C2=A0 git://<a href=3D"http://gitlab.freedesktop.org/StaticRocket/=
mesa.git;protocol=3Dhttps;branch=3D$%7BBRANCH%7D" rel=3D"noreferrer" target=
=3D"_blank">gitlab.freedesktop.org/StaticRocket/mesa.git;protocol=3Dhttps;b=
ranch=3D${BRANCH}</a> \<br>
+=C2=A0 =C2=A0 file://0001-meson.build-check-for-all-linux-host_os-combinat=
ions.patch \<br>
+=C2=A0 =C2=A0 file://0002-meson.build-make-TLS-ELF-optional.patch \<br>
+=C2=A0 =C2=A0 file://0001-meson-misdetects-64bit-atomics-on-mips-clang.pat=
ch \<br>
+=C2=A0 =C2=A0 file://0001-futex.h-Define-__NR_futex-if-it-does-not-exist.p=
atch \<br>
+=C2=A0 =C2=A0 file://0001-util-format-Check-for-NEON-before-using-it.patch=
 \<br>
+=C2=A0 =C2=A0 file://0001-Revert-egl-wayland-deprecate-drm_handle_format-a=
nd-d.patch \<br>
+&quot;<br></blockquote><div><br></div><div>Having here all the patches in =
oe-core will stop working if someone changes the main recipe.<br>This alrea=
dy happens in the master branch of oe-core.<br></div><div><br></div><div>IM=
O If these patches=C2=A0are needed=C2=A0they should=C2=A0be merged on the t=
i fork branch.<br><br>Jose</div><div>=C2=A0</div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">
+<br>
+S =3D &quot;${WORKDIR}/git&quot;<br>
+<br>
+SRCREV =3D &quot;44b82a7b6fa8a86243911b1b0d6a07b0fd8ecfba&quot;<br>
+<br>
+PACKAGECONFIG:append =3D &quot; \<br>
+=C2=A0 =C2=A0 ${@bb.utils.contains(&#39;PREFERRED_PROVIDER_virtual/gpudriv=
er&#39;, &#39;ti-img-rogue-driver&#39;, &#39;pvr&#39;, &#39;&#39;, d)} \<br=
>
+=C2=A0 =C2=A0 ${@bb.utils.contains(&#39;PREFERRED_PROVIDER_virtual/gpudriv=
er&#39;, &#39;ti-sgx-ddk-km&#39;, &#39;sgx&#39;, &#39;&#39;, d)} \<br>
+&quot;<br>
+<br>
+PVR_DISPLAY_CONTROLLER_ALIAS ??=3D &quot;tidss&quot;<br>
+PACKAGECONFIG[pvr] =3D &quot;-Dgallium-pvr-alias=3D${PVR_DISPLAY_CONTROLLE=
R_ALIAS},&quot;<br>
+PACKAGECONFIG[sgx] =3D &quot;-Dgallium-sgx-alias=3D${PVR_DISPLAY_CONTROLLE=
R_ALIAS},&quot;<br>
+<br>
+PV:append =3D &quot;+pvr&quot;<br>
+<br>
+GALLIUMDRIVERS:append =3D &quot;${@bb.utils.contains(&#39;PACKAGECONFIG&#3=
9;, &#39;pvr&#39;, &#39;,pvr&#39;, &#39;&#39;, d)}&quot;<br>
+GALLIUMDRIVERS:append =3D &quot;${@bb.utils.contains(&#39;PACKAGECONFIG&#3=
9;, &#39;sgx&#39;, &#39;,sgx&#39;, &#39;&#39;, d)}&quot;<br>
+<br>
+do_install:append () {<br>
+=C2=A0 =C2=A0 # remove pvr custom pkgconfig<br>
+=C2=A0 =C2=A0 rm -rf ${D}${datadir}/pkgconfig<br>
+}<br>
+<br>
+RRECOMMENDS:mesa-megadriver:class-target:append =3D &quot;${@d.getVar(&#39=
;PREFERRED_PROVIDER_virtual/gpudriver&#39;)}&quot;<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#15708): <a href=3D"https://lists.yoctoproject.org/g/met=
a-ti/message/15708" rel=3D"noreferrer" target=3D"_blank">https://lists.yoct=
oproject.org/g/meta-ti/message/15708</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/96641366/5052=
612" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/mt=
/96641366/5052612</a><br>
Group Owner: <a href=3D"mailto:meta-ti%2Bowner@lists.yoctoproject.org" targ=
et=3D"_blank">meta-ti+owner@lists.yoctoproject.org</a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-ti/unsub" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/g/meta-ti/=
unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com" target=3D"_blank">qua=
resma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9=
 Quaresma</div></div></div></div>

--00000000000048517b05f51fa82d--

