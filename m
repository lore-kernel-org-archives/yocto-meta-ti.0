Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23809C7EE2A
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 03:55:40 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.4832.1685678137538704463
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 01 Jun 2023 20:55:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=SxMjjqk4;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3523tY9u002450;
	Thu, 1 Jun 2023 22:55:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1685678134;
	bh=naMmNFWsGgpJghzm+djFPnqZRwqbjrazjs0IgZxpTc8=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=SxMjjqk4j2V+ThHgT7TRpWUuy3h/Ni2tVZcAkPx5QKgWTYlbrv2UDrVCfR3v9je9I
	 7iy1gSj5wJudiuU/3pZvqRJpzynnobss7OgSguWVsCkYNM0Q3QWu2WSr+eaUPV+yVc
	 h7Cz55GTioxQddUxRr4ODScSkkU6W8Vin1chKA8A=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3523tXkM088388
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 1 Jun 2023 22:55:34 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 1
 Jun 2023 22:55:33 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 1 Jun 2023 22:55:33 -0500
Received: from [128.247.81.144] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3523tXYl057607;
	Thu, 1 Jun 2023 22:55:33 -0500
Message-ID: <28b6fa0a-e8b0-01aa-d72d-dc0b21ffa115@ti.com>
Date: Thu, 1 Jun 2023 22:55:33 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [EXTERNAL] [meta-ti][master/kirkstone][PATCHv2 2/2]
 ti-img-rogue-umlibs: bump version and explicitly package
Content-Language: en-US, en-US-large
To: <reatmon@ti.com>, <denis@denix.org>, <detheridge@ti.com>, <afd@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
References: <20230530215827.3737116-1-rs@ti.com>
 <17640AB0A10C79B5.20735@lists.yoctoproject.org>
From: Randolph Sapp <rs@ti.com>
In-Reply-To: <17640AB0A10C79B5.20735@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 02 Jun 2023 03:55:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16650

On 5/30/23 16:58, Randolph Sapp via lists.yoctoproject.org wrote:
> From: Randolph Sapp <rs@ti.com>
> 
> Bump the version and explicitly package all Khronos APIs separately.
> This should be nice for those folks that want a headless opencl system
> for tinkering and such.
> 
> This version includes experimental GEM support (for applications like
> Chromium that like to poke at the render node) and a new Vulkan ICD
> loader interface for better support with the Vulkan ICD loaders present
> in Yocto.
> 
> This lifts a method from mesa used to force a common naming convention
> for Vulkan, OpenCL, and OpenGLES libs to make things a little easier to
> follow. Without it the target package names get scrambled based on the
> shared object name.
> 
> Signed-off-by: Randolph Sapp <rs@ti.com>
> ---
>   .../ti-img-rogue-driver_23.1.6404501.bb       |  2 +-
>   .../ti-img-rogue-umlibs_23.1.6404501.bb       | 89 +++++++++++++------
>   2 files changed, 65 insertions(+), 26 deletions(-)
> 
> diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.1.6404501.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.1.6404501.bb
> index 76e3d801..1a08a441 100644
> --- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.1.6404501.bb
> +++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.1.6404501.bb
> @@ -22,7 +22,7 @@ SRC_URI = "git://git.ti.com/git/graphics/ti-img-rogue-driver.git;protocol=https;
>   
>   S = "${WORKDIR}/git"
>   
> -SRCREV = "93c66ec66136654849809132b86d3b880ee96ed6"
> +SRCREV = "ebddb087ef140ca83e4c30d66580b0bb33b003fd"
>   
>   TARGET_PRODUCT:j721e = "j721e_linux"
>   TARGET_PRODUCT:j721s2 = "j721s2_linux"
> diff --git a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.1.6404501.bb b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.1.6404501.bb
> index f22cd1d1..3fcb786c 100644
> --- a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.1.6404501.bb
> +++ b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.1.6404501.bb
> @@ -12,7 +12,7 @@ PR = "r2"
>   
>   BRANCH = "linuxws/kirkstone/k6.1/${PV}"
>   SRC_URI = "git://git.ti.com/git/graphics/ti-img-rogue-umlibs.git;protocol=https;branch=${BRANCH}"
> -SRCREV = "452b0f50d2984171c81d5a0d3b22198177d919ad"
> +SRCREV = "bfacba50b004d0e93ee1f8b42d2217131453f5fd"
>   S = "${WORKDIR}/git/targetfs/${TARGET_PRODUCT}/${PVR_WS}/${PVR_BUILD}"
>   
>   TARGET_PRODUCT:j721e = "j721e_linux"
> @@ -22,52 +22,91 @@ TARGET_PRODUCT:am62xx = "am62_linux"
>   PVR_BUILD = "release"
>   PVR_WS = "lws-generic"
>   
> -RDEPENDS:${PN} += "mesa-megadriver libdrm ti-img-rogue-driver"
> +RDEPENDS:${PN} = " \
> +    libdrm \
> +    ti-img-rogue-driver \
> +    ${PN}-firmware \
> +"
>   
>   do_install:append() {
>       if ${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', 'true', 'false', d)}; then
>           mv ${D}/lib/firmware ${D}${nonarch_base_libdir}
>           rmdir ${D}/lib
>       fi
> -    if ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'false', 'true', d)}; then
> -        rm -rf ${D}${libdir}/libVK_IMG.so*
> -    fi
> -    rm -rf "${D}/etc/init.d"
>   }
>   
>   PACKAGES = " \
> -    ${@bb.utils.contains("DISTRO_FEATURES", "x11", "${PN}-vulkan", "", d)} \
> +    libgles1-rogue libgles1-rogue-dev \
> +    libgles2-rogue libgles2-rogue-dev \
> +    libgles3-rogue libgles3-rogue-dev \
> +    libvk-rogue libvk-rogue-dev \
> +    libopencl-rogue libopencl-rogue-dev \
> +    libopencl-rogue-tools \
>       ${PN}-tools \
>       ${PN}-firmware \
> +    ${PN}-dev \

Rats, I just realized I left this in. This will break the required 
devlink for libpvr_dri_support.so

Expect a v3.

>       ${PN} \
>   "
>   
> -FILES:${PN}-vulkan = " \
> -    ${datadir}/vulkan \
> -    ${libdir}/libVK_IMG.so* \
> -"
> -RDEPENDS:${PN}-vulkan += " \
> -    mesa-vulkan-drivers \
> -    libdrm \
> -    ti-img-rogue-driver \
> -    libx11-xcb \
> -    wayland \
> -"
> -INSANE_SKIP:${PN}-vulkan += " \
> -    already-stripped \
> -    dev-so \
> -"
> +# Inject variables so that packages don't get Debian-renamed (which would
> +# remove the -rogue suffix), but don't RPROVIDEs/RCONFLICTs on the generic
> +# libgl name to prevent colliding with swrast libs
> +python __anonymous() {
> +    suffix = ""
> +    if "-native" in d.getVar("PN"):
> +        suffix = "-native"
> +    for p in (("vulkan", "libvk",),
> +              ("gles", "libgles1", "libglesv1-cm1"),
> +              ("gles", "libgles2", "libglesv2-2"),
> +              ("gles", "libgles3",),
> +              ("opencl", "libopencl",)):
> +        mlprefix = d.getVar("MLPREFIX")
> +        fullp = mlprefix + p[1] + "-rogue" + suffix
> +        mlprefix = d.getVar("MLPREFIX")
> +        pkgs = " " + " ".join(mlprefix + x + suffix for x in p[1:])
> +        d.setVar("DEBIAN_NOAUTONAME:" + fullp, "1")
> +        d.appendVar("RRECOMMENDS:" + fullp, " ${MLPREFIX}ti-img-rogue-umlibs" + suffix)
> +
> +        # For -dev, the first element is both the Debian and original name
> +        fullp = mlprefix + p[1] + "-rogue-dev" + suffix
> +        pkgs = " " + mlprefix + p[1] + "-dev" + suffix
> +        d.setVar("DEBIAN_NOAUTONAME:" + fullp, "1")
> +}
> +
> +# gles specific shared objects
> +FILES:libgles1-rogue = "${libdir}/libGLESv1*.so.*"
> +FILES:libgles1-rogue-dev = "${libdir}/libGLESv1*.so"
> +FILES:libgles2-rogue = "${libdir}/libGLESv2*.so.*"
> +FILES:libgles2-rogue-dev = "${libdir}/libGLESv2*.so"
> +RDEPENDS:libgles1-rogue += "mesa-megadriver"
> +RDEPENDS:libgles2-rogue += "mesa-megadriver"
> +RDEPENDS:libgles3-rogue-dev += "libgles2-rogue-dev"
> +
> +# vulkan specific shared objects and configs
> +FILES:libvk-rogue = "${libdir}/libVK_IMG.so.* ${datadir}/vulkan"
> +FILES:libvk-rogue-dev = "${libdir}/libVK_IMG.so"
> +RDEPENDS:libvk-rogue += "vulkan-loader libx11-xcb wayland libdrm"
> +
> +# opencl specific shared objects and configs
> +FILES:libopencl-rogue = "${libdir}/libPVROCL.so.* ${sysconfdir}/OpenCL"
> +FILES:libopencl-rogue-dev = "${libdir}/libPVROCL.so"
> +RDEPENDS:libopencl-rogue += "opencl-icd-loader"
> +RRECOMMENDS:libopencl-rogue += "libopencl-rogue-tools"
> +FILES:libopencl-rogue-tools += "${bindir}/ocl*"
>   
> +# optional tools and tests
>   FILES:${PN}-tools = "${bindir}/"
> -RDEPENDS:${PN}-tools = "python3-core"
> +RDEPENDS:${PN}-tools = "python3-core ${PN}"
>   
> +# required firmware
>   FILES:${PN}-firmware = "${base_libdir}/firmware/*"
>   INSANE_SKIP:${PN}-firmware += "arch"
>   
>   RRECOMMENDS:${PN} += " \
> -    ${@bb.utils.contains("DISTRO_FEATURES", "x11", "${PN}-vulkan", "", d)} \
> +    ${@bb.utils.contains("DISTRO_FEATURES", "opengl", "libgles1-rogue libgles2-rogue", "", d)} \
> +    ${@bb.utils.contains("DISTRO_FEATURES", "vulkan x11 wayland", "libvk-rogue", "", d)} \
> +    ${@bb.utils.contains("DISTRO_FEATURES", "opencl", "libopencl-rogue", "", d)} \
>       ${PN}-tools \
>   "
> -RDEPENDS:${PN} += " ${PN}-firmware"
>   
>   INSANE_SKIP:${PN} += "already-stripped dev-so"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#16641): https://lists.yoctoproject.org/g/meta-ti/message/16641
> Mute This Topic: https://lists.yoctoproject.org/mt/99230102/7094281
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [rs@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


