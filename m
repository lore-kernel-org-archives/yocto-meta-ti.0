Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 314A4C05027
	for <webhook@archiver.kernel.org>; Fri, 20 Jan 2023 18:27:10 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.82594.1674239220878649959
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 20 Jan 2023 10:27:01 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 3661540C1C;
	Fri, 20 Jan 2023 18:27:00 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6hBhc-D4vfQd; Fri, 20 Jan 2023 18:27:00 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E4FAC40C13;
	Fri, 20 Jan 2023 18:26:54 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 36EC7163700; Fri, 20 Jan 2023 13:26:36 -0500 (EST)
Date: Fri, 20 Jan 2023 13:26:36 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: rs@ti.com
Cc: denys@ti.com, reatmon@ti.com, detheridge@ti.com,
	meta-ti@lists.yoctoproject.org, k-bhargav@ti.com
Subject: Re: [meta-ti] [master/kirkstone][PATCH] all: Graphics recipe
 overhaul
Message-ID: <20230120182636.GP22689@denix.org>
References: <20230119204026.1297616-1-rs@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230119204026.1297616-1-rs@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 20 Jan 2023 18:27:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15612

First of all, thank you for including SGX into this, not just Rogue. Although, 
I don't see you plugging SGX into your Mesa rework, only Rogue?


But the already large patch grew even more to 60 KB and is impossible to 
review!

This should have been a series with several individual patches...

E.g. if you are copying the entire Mesa set of recipes, include files and 
patches, it should have been a separate patch with just that w/o any 
modifications, clearly stating that this is a verbatim copy and specify which 
repo and branch/tag they are being picked up from - openembedded-core repo, 
kirkstone branch.

But then I would argue that a simple mesa_%.bbappend is smaller and much 
easire to review. For example, I took your previous v4 revision of the patch 
and dropped all copies of upstream Mesa, replacing it with a bbappend:
https://patchwork.yoctoproject.org/project/ti/patch/20230119010333.3414485-1-denis@denix.org/

The functionality remains the same, but makes the patch much easier to review:
v4 of your patch is 50 KB, this v5 is 60 KB, and bbappend version is 15 KB.


On Thu, Jan 19, 2023 at 02:40:26PM -0600, Randolph Sapp via lists.yoctoproject.org wrote:
> Individually package rogue graphics components to prevent conflicts with
> other recipes.
> 
> The package ti-img-rogue-umlibs will now distribute the window system

Here you only mention Rogue.


> agnostic components of the DDK. This being the IMG's implementations of
> OpenGLES, OpenCL, and Vulkan in binary format and the device firmware.
> These are the only components that cannot be open source currently.
> 
> The mesa component is currently piggybacking off the default mesa
> package. It's not elegant, but it reflects the implementation well and
> allows users to config mesa as needed.
> 
> This introduces the following combined features:
>   - powervr-rogue-graphics
>   - powervr-sgx-graphics

Feels like a bit of an overkill with combined features and longer names...
At this point I already got used to your previous "rogue-gpu", or it could be 
"powervr-rogue-gpu" if you insist. After all, it is really a machine feature 
first of all, even if you want to extend it to distro features as well...


> Combined features work by requiring both a matching machine feature and
> distro feature to be present. This seemed to be the most applicable for
> us considering graphics support relies on out of tree modules users may
> want to exclude as well as specific hardware to be present.
> 
> Mesa and other userspace tools are modified to suite sgx / rogue when
> both features are present. Anything not specifically carrying patches
> for sgx / rogue was made to be dependent on opengl as a distro feature

And here you mention that SGX is supposed to also use the new Mesa-based 
framework...


> to align with oe-core.
> 
> This has a daughter patch with the same name submitted to meta-arago.
> 
> Signed-off-by: Randolph Sapp <rs@ti.com>
> ---
> 
> Sorry for the rename. This is actually the 5th version of this patch but
> I wanted it to keep a similar name between meta-arago and meta-ti since
> these two hinge off each other.

<snip>


> diff --git a/meta-ti-bsp/README b/meta-ti-bsp/README
> index c5780531..15fa627f 100644
> --- a/meta-ti-bsp/README
> +++ b/meta-ti-bsp/README
> @@ -22,6 +22,15 @@ distro-less (only with OE-Core), with Yocto/Poky, with Angstrom or Arago.
>  Please follow the recommended setup procedures of your OE distribution.
>  
>  
> +GRAPHICS NOTICE: Onboard graphics accelerators are enabled through the use of
> +one of the following DISTRO_FEATURES if present:
> + - powervr-sgx-graphics
> + - powervr-rogue-graphics
> +
> +If the according accelerator isn't present for the selected machine and opengl
> +is selected as a DISTRO_FEATURE, software rendering will be used.
> +

Layer README is not the right place for this information. Should probably be a 
separate file or part of the recipe(s).


>  Send pull requests, patches, comments or questions to:
>  meta-ti@lists.yoctoproject.org
>  
> diff --git a/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf b/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
> index ef8e8692..ec9ce596 100644
> --- a/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
> +++ b/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
> @@ -4,8 +4,6 @@
>  
>  require conf/machine/include/am62xx.inc
>  
> -MACHINE_FEATURES += "gpu"
> -
>  KERNEL_DEVICETREE = " \
>      ti/k3-am62x-lp-sk.dtb \
>      ti/k3-am625-skeleton.dtb \
> diff --git a/meta-ti-bsp/conf/machine/include/am62xx.inc b/meta-ti-bsp/conf/machine/include/am62xx.inc
> index a5aad994..d4c5fd6e 100644
> --- a/meta-ti-bsp/conf/machine/include/am62xx.inc
> +++ b/meta-ti-bsp/conf/machine/include/am62xx.inc
> @@ -1,17 +1,11 @@
>  require conf/machine/include/k3.inc
>  SOC_FAMILY:append = ":am62xx"
>  
> -MACHINE_FEATURES += "screen touchscreen gpu"
> +MACHINE_FEATURES += "screen touchscreen powervr-rogue-graphics"
>  SERIAL_CONSOLES = "115200;ttyS2"
>  SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
>  
> -PREFERRED_PROVIDER_virtual/egl ?= "ti-img-rogue-umlibs"
> -PREFERRED_PROVIDER_virtual/libgles1 ?= "ti-img-rogue-umlibs"
> -PREFERRED_PROVIDER_virtual/libgles2 ?= "ti-img-rogue-umlibs"
> -PREFERRED_PROVIDER_virtual/libgbm ?= "ti-img-rogue-umlibs"
> -PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-img-rogue-driver"
> -
>  do_image_wic[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
>  do_image_tar[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
>  

<snip>

> diff --git a/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_1.15.6133109.bb b/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_1.15.6133109.bb
> deleted file mode 100644

Please use the correct git flags (pass a lower threshold to -M) to make this 
remove/add into a proper diff that can be reviewed. Again, take a look at my 
copy of your v4 revision:

https://patchwork.yoctoproject.org/project/ti/patch/20230119010333.3414485-1-denis@denix.org/


> index a665c614..00000000
> --- a/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_1.15.6133109.bb
> +++ /dev/null
> @@ -1,71 +0,0 @@
> -DESCRIPTION = "Userspace libraries for PowerVR Rogue GPU on TI SoCs"
> -HOMEPAGE = "http://git.ti.com/graphics/ti-img-rogue-umlibs"
> -LICENSE = "TI-TFL"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=7232b98c1c58f99e3baa03de5207e76f"
> -
> -inherit features_check
> -
> -REQUIRED_MACHINE_FEATURES = "gpu"
> -
> -PACKAGE_ARCH = "${MACHINE_ARCH}"
> -COMPATIBLE_MACHINE = "j721e|j721s2|j784s4|am62xx"
> -
> -PR = "r2"
> -
> -BRANCH = "linuxws/dunfell/k5.10/${PV}_unified_fw_pagesize"
> -
> -SRC_URI = "git://git.ti.com/git/graphics/ti-img-rogue-umlibs.git;protocol=https;branch=${BRANCH}"
> -SRCREV = "5977e82b96028f783d39c7219f016c1faf8dc5f5"
> -
> -TARGET_PRODUCT:j721e = "j721e_linux"
> -TARGET_PRODUCT:j721s2 = "j721s2_linux"
> -TARGET_PRODUCT:j784s4 = "j784s4_linux"
> -TARGET_PRODUCT:am62xx = "am62_linux"
> -PVR_BUILD ?= "release"
> -PVR_WS = "wayland"
> -
> -INITSCRIPT_NAME = "rc.pvr"
> -INITSCRIPT_PARAMS = "defaults 8"
> -
> -inherit update-rc.d
> -
> -PROVIDES += "virtual/egl virtual/libgles1 virtual/libgles2 virtual/libgbm"
> -
> -DEPENDS += "libdrm wayland expat"
> -RDEPENDS:${PN} += "bash"
> -RDEPENDS:${PN} += "wayland expat"
> -
> -RPROVIDES:${PN} = "libegl libgles1 libgles2 libgbm"
> -RPROVIDES:${PN}-dev = "libegl-dev libgles1-dev libgles2-dev libgbm-dev"
> -RPROVIDES:${PN}-dbg = "libegl-dbg libgles1-dbg libgles2-dbg"
> -
> -RREPLACES:${PN} = "libegl libgles1 liblges2 libgbm"
> -RREPLACES:${PN}-dev = "libegl-dev libgles1-dev libgles2-dev libgbm-dev"
> -RREPLACES:${PN}-dbg = "libegl-dbg libgles1-dbg libgles2-dbg"
> -
> -RCONFLICTS:${PN} = "libegl libgles1 libgles2 libgbm"
> -RCONFLICTS:${PN}-dev = "libegl-dev libgles1-dev libgles2-dev libgbm-dev"
> -RCONFLICTS:${PN}-dbg = "libegl-dbg libgles1-dbg libgles2-dbg"
> -
> -RRECOMMENDS:${PN} += "ti-img-rogue-driver"
> -
> -S = "${WORKDIR}/git"
> -
> -do_install () {
> -    oe_runmake install DESTDIR=${D} TARGET_PRODUCT=${TARGET_PRODUCT} BUILD=${PVR_BUILD} WINDOW_SYSTEM=${PVR_WS}
> -    chown -R root:root ${D}
> -}
> -
> -FILES:${PN} += " ${nonarch_base_libdir}/firmware/"
> -FILES:${PN} += " ${datadir}/"
> -
> -PACKAGES =+ "${PN}-plugins"
> -FILES:${PN}-plugins = "${libdir}/libGLESv2.so ${libdir}/libGLESv1_CM.so ${libdir}/libEGL.so ${libdir}/dri/pvr_dri.so"
> -RDEPENDS:${PN} += "${PN}-plugins"
> -
> -ALLOW_EMPTY:${PN}-plugins = "1"
> -
> -INSANE_SKIP:${PN} += "ldflags arch already-stripped"
> -INSANE_SKIP:${PN}-plugins = "dev-so"
> -
> -CLEANBROKEN = "1"
> diff --git a/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_1.18.6276027.bb b/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_1.18.6276027.bb
> new file mode 100644
> index 00000000..cc3e720e
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_1.18.6276027.bb
> @@ -0,0 +1,41 @@
> +DESCRIPTION = "Userspace libraries for PowerVR Rogue GPU on TI SoCs"
> +HOMEPAGE = "http://git.ti.com/graphics/ti-img-rogue-umlibs"
> +LICENSE = "TI-TFL"
> +LIC_FILES_CHKSUM = "file://${WORKDIR}/git/LICENSE;md5=7232b98c1c58f99e3baa03de5207e76f"
> +
> +inherit features_check bin_package
> +
> +REQUIRED_COMBINED_FEATURES = "powervr-rogue-graphics"
> +
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +COMPATIBLE_MACHINE = "j721e|j721s2|j784s4|am62xx"
> +
> +PR = "r2"
> +
> +BRANCH = "linuxws/kirkstone/k5.10/${PV}"
> +SRC_URI = "git://git.ti.com/git/graphics/ti-img-rogue-umlibs.git;protocol=https;branch=${BRANCH}"
> +SRCREV = "51e598919641d51156a631efa5447124a3c0f543"
> +S = "${WORKDIR}/git/targetfs/${TARGET_PRODUCT}/${PVR_WS}/${PVR_BUILD}"
> +
> +TARGET_PRODUCT:j721e = "j721e_linux"
> +TARGET_PRODUCT:j721s2 = "j721s2_linux"
> +TARGET_PRODUCT:j784s4 = "j784s4_linux"
> +TARGET_PRODUCT:am62xx = "am62_linux"
> +PVR_BUILD = "release"
> +PVR_WS = "lws-generic"
> +
> +RDEPENDS:${PN} += "mesa-megadriver libdrm ti-img-rogue-driver"
> +
> +do_install:append() {
> +    rm -rf "${D}/etc/init.d"
> +    rm -rf "${D}/usr/lib/libvulkan.so"
> +    rm -rf "${D}/usr/lib/libvulkan.so.0"
> +    rm -rf "${D}/usr/lib/libvulkan.so.1"
> +}
> +
> +PACKAGES = "${PN}-tools ${PN}"
> +FILES:${PN}-tools = "${bindir}/"
> +RDEPENDS:${PN}-tools = "python3-core"
> +RRECOMMENDS:${PN} += "${PN}-tools"
> +
> +INSANE_SKIP:${PN} += "ldflags arch already-stripped dev-so"

<snip all the redundant Mesa stuff>


> diff --git a/meta-ti-bsp/recipes-graphics/mesa/rogue-mesa.inc b/meta-ti-bsp/recipes-graphics/mesa/rogue-mesa.inc
> new file mode 100644
> index 00000000..c5002fa7
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-graphics/mesa/rogue-mesa.inc
> @@ -0,0 +1,29 @@
> +# Rogue graphics related mesa overrides
> +
> +BRANCH = "rogue/kirkstone/pvr-1.18/22.0"
> +
> +SRC_URI = "git://gitlab.freedesktop.org/StaticRocket/mesa.git;protocol=https;branch=${BRANCH} \

I looked at this repo - it's a personal copy of upstream Mesa with Imagination 
PVR patches applied on top. Was it reviewed and approved by OSRB? Were the 
patches made public before and/or permitted to be published/distributed?


> +           file://0001-meson.build-check-for-all-linux-host_os-combinations.patch \
> +           file://0002-meson.build-make-TLS-ELF-optional.patch \
> +           file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
> +           file://0001-futex.h-Define-__NR_futex-if-it-does-not-exist.patch \
> +           file://0001-util-format-Check-for-NEON-before-using-it.patch \
> +           file://0001-Revert-egl-wayland-deprecate-drm_handle_format-and-d.patch \
> +           "
> +
> +S = "${WORKDIR}/git"
> +
> +SRCREV = "fddf5106f04de2bd35892d30e5574c0b2881edd9"
> +
> +PV:append = "+rogue"

Only rogue?


> +GALLIUMDRIVERS:append = ",pvr"
> +
> +EXTRA_OEMESON:append = " -Dgallium-pvr-alias=tidss"
> +
> +do_install:append () {
> +    # remove pvr custom pkgconfig
> +    rm -rf ${D}${datadir}/pkgconfig
> +}
> +
> +RRECOMMENDS:mesa-megadriver:class-target += "ti-img-rogue-driver ti-img-rogue-umlibs"

Only rogue?

