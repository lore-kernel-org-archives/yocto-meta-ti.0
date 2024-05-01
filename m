Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDC37C4345F
	for <webhook@archiver.kernel.org>; Wed,  1 May 2024 16:47:15 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.1396.1714582034616049618
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 01 May 2024 09:47:15 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id A0E0E40C79;
	Wed,  1 May 2024 16:47:13 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mcxPkEV2rbgO; Wed,  1 May 2024 16:47:13 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 56B4540BE6;
	Wed,  1 May 2024 16:47:08 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id EBEB2163F54; Wed,  1 May 2024 12:47:07 -0400 (EDT)
Date: Wed, 1 May 2024 12:47:07 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: rs@ti.com
Cc: reatmon@ti.com, denys@konsulko.com, detheridge@ti.com,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master/scarthgap][PATCH 3/3] mesa-pvr_23.2.1: add
 recipe for 23.2.1
Message-ID: <20240501164707.GR28791@denix.org>
References: <20240430213821.3697267-1-rs@ti.com>
 <20240430213821.3697267-4-rs@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240430213821.3697267-4-rs@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 01 May 2024 16:47:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17621

On Tue, Apr 30, 2024 at 04:38:21PM -0500, Randolph Sapp via lists.yoctoproject.org wrote:
> From: Randolph Sapp <rs@ti.com>
> 
> Add a recipe for mesa-pvr to use a newer branch based on mesa 23.2.1.
> This branch does not currently contain SGX patches so it is also being
> masked by the ltsprep branding to prevent regressing those devices
> currently.
> 
> Please note that because this recipe is currently in
> SIGGEN_EXCLUDERECIPES_ABISAFE you may run into sstate errors when
> switching away from the ltsprep tag.

This is less specific to SIGGEN_EXCLUDERECIPES_ABISAFE and more generic to 
any time you downgrade a component version while having a local sstate with 
a new version (and use a PR server as well) - it will show "Version going 
backwards" errors.


> Please issue a clean to mesa and
> ti-img-rogue-umlibs if you get warnings from either package's
> do_create_runtime_spdx step.
> 
> Signed-off-by: Randolph Sapp <rs@ti.com>
> ---
>  .../recipes-graphics/mesa/mesa-pvr_23.2.1.bb  | 59 +++++++++++++++++++
>  1 file changed, 59 insertions(+)
>  create mode 100644 meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_23.2.1.bb
> 
> diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_23.2.1.bb b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_23.2.1.bb
> new file mode 100644
> index 00000000..c83ba87d
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_23.2.1.bb
> @@ -0,0 +1,59 @@
> +# PowerVR Graphics require several patches that have not made their way
> +# upstream yet. This allows us to build the shims we need without completely
> +# clobbering mesa.
> +
> +DEFAULT_PREFERENCE = "-1"
> +FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}_${PV}:"
> +
> +require recipes-graphics/mesa/mesa.inc
> +
> +SUMMARY += " (with PowerVR support for TI platforms)"
> +
> +LIC_FILES_CHKSUM = "file://docs/license.rst;md5=63779ec98d78d823a9dc533a0735ef10"
> +
> +BRANCH = "powervr/${PV}"
> +
> +SRC_URI = " \
> +    git://gitlab.freedesktop.org/StaticRocket/mesa.git;protocol=https;branch=${BRANCH} \
> +    file://0001-meson.build-check-for-all-linux-host_os-combinations.patch \
> +    file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
> +    file://0001-gallium-Fix-build-with-llvm-17.patch \
> +    file://0001-meson-Disable-cmake-dependency-detector-for-llvm.patch \
> +"
> +
> +S = "${WORKDIR}/git"
> +
> +PACKAGECONFIG:append = " \
> +    ${@bb.utils.contains('PREFERRED_PROVIDER_virtual/gpudriver', 'ti-img-rogue-driver', 'pvr', '', d)} \
> +    ${@bb.utils.contains('PREFERRED_PROVIDER_virtual/gpudriver', 'ti-sgx-ddk-km', 'sgx', '', d)} \
> +"
> +
> +SRCREV = "b12290126ba6a154f0e8b0a8c8b2b0d64f98e427"
> +
> +PVR_DISPLAY_CONTROLLER_ALIAS ??= "tidss"
> +PACKAGECONFIG[pvr] = "-Dgallium-pvr-alias=${PVR_DISPLAY_CONTROLLER_ALIAS},"
> +PACKAGECONFIG[sgx] = "-Dgallium-sgx-alias=${PVR_DISPLAY_CONTROLLER_ALIAS},"
> +
> +PACKAGECONFIG:remove = "video-codecs"
> +PACKAGECONFIG[video-codecs] = ""
> +PACKAGECONFIG:remove = "elf-tls"
> +PACKAGECONFIG[elf-tls] = ""
> +PACKAGECONFIG:remove = "xvmc"
> +PACKAGECONFIG[xvmc] = ""
> +
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +
> +GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'pvr', ',pvr', '', d)}"
> +GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'sgx', ',sgx', '', d)}"
> +
> +VULKAN_DRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'pvr', ',pvr', '', d)}"
> +
> +do_install:append () {
> +    # remove pvr custom pkgconfig
> +    rm -rf ${D}${datadir}/pkgconfig
> +}
> +
> +FILES:${PN}-dev += "${datadir}/mesa/wayland-drm.xml"
> +FILES:mesa-vulkan-drivers += "${libdir}/libpvr_mesa_wsi.so"
> +
> +RRECOMMENDS:mesa-megadriver:append:class-target = " ${@d.getVar('PREFERRED_PROVIDER_virtual/gpudriver')}"
> -- 
> 2.44.0
> 

