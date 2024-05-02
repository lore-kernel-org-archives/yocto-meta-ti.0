Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87618C4345F
	for <webhook@archiver.kernel.org>; Thu,  2 May 2024 03:06:21 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.4825.1714619178003368815
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 01 May 2024 20:06:18 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 5CA8740C2E
	for <meta-ti@lists.yoctoproject.org>; Thu,  2 May 2024 03:06:17 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FWb7ckXMff7G for <meta-ti@lists.yoctoproject.org>;
	Thu,  2 May 2024 03:06:17 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 49CB640A46
	for <meta-ti@lists.yoctoproject.org>; Thu,  2 May 2024 03:06:16 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 8702E163F55; Wed,  1 May 2024 23:06:16 -0400 (EDT)
Date: Wed, 1 May 2024 23:06:16 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] [master/scarthgap][PATCH 3/3] mesa-pvr_23.2.1: add
 recipe for 23.2.1
Message-ID: <20240502030616.GU28791@denix.org>
References: <20240502002621.3456112-1-denis@denix.org>
 <17CB845523E152B6.4497@lists.yoctoproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <17CB845523E152B6.4497@lists.yoctoproject.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 02 May 2024 03:06:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17628

On Wed, May 01, 2024 at 08:26:21PM -0400, Denys Dmytriyenko wrote:
> From: Randolph Sapp <rs@ti.com>
> 
> Add a recipe for mesa-pvr to use a newer branch based on mesa 23.2.1.
> This branch does not currently contain SGX patches so it is also being
> masked by the ltsprep branding to prevent regressing those devices
> currently.
> 
> Please note that because this recipe is currently in
> SIGGEN_EXCLUDERECIPES_ABISAFE you may run into sstate errors when
> switching away from the ltsprep tag. Please issue a clean to mesa and
> ti-img-rogue-umlibs if you get warnings from either package's
> do_create_runtime_spdx step.
> 
> Signed-off-by: Randolph Sapp <rs@ti.com>
> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> ---
>  .../mesa/{mesa-pvr_22.3.5.bb => mesa-pvr_23.2.1.bb}  | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>  copy meta-ti-bsp/recipes-graphics/mesa/{mesa-pvr_22.3.5.bb => mesa-pvr_23.2.1.bb} (83%)
> 
> diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_22.3.5.bb b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_23.2.1.bb
> similarity index 83%
> copy from meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_22.3.5.bb
> copy to meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_23.2.1.bb
> index 5abd0793..c83ba87d 100644
> --- a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_22.3.5.bb
> +++ b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_23.2.1.bb
> @@ -2,23 +2,23 @@
>  # upstream yet. This allows us to build the shims we need without completely
>  # clobbering mesa.
>  
> +DEFAULT_PREFERENCE = "-1"
> +FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}_${PV}:"

This is wrong - ${PN}-${PV} is one of the default locations for patches, 
not ${PN}_${PV}.


> +
>  require recipes-graphics/mesa/mesa.inc
>  
>  SUMMARY += " (with PowerVR support for TI platforms)"
>  
>  LIC_FILES_CHKSUM = "file://docs/license.rst;md5=63779ec98d78d823a9dc533a0735ef10"
>  
> -BRANCH = "powervr/kirkstone/${PV}"
> +BRANCH = "powervr/${PV}"
>  
>  SRC_URI = " \
>      git://gitlab.freedesktop.org/StaticRocket/mesa.git;protocol=https;branch=${BRANCH} \
>      file://0001-meson.build-check-for-all-linux-host_os-combinations.patch \
>      file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
> -    file://0001-util-format-Check-for-NEON-before-using-it.patch \
> -    file://0001-gbm-backend-fix-gbm-compile-without-dri.patch \
> -    file://0001-freedreno-pm4-Use-unsigned-instead-of-uint-to-fix-mu.patch \
>      file://0001-gallium-Fix-build-with-llvm-17.patch \
> -    file://0001-fix-gallivm-limit-usage-of-LLVMContextSetOpaquePoint.patch \
> +    file://0001-meson-Disable-cmake-dependency-detector-for-llvm.patch \
>  "
>  
>  S = "${WORKDIR}/git"
> @@ -28,7 +28,7 @@ PACKAGECONFIG:append = " \
>      ${@bb.utils.contains('PREFERRED_PROVIDER_virtual/gpudriver', 'ti-sgx-ddk-km', 'sgx', '', d)} \
>  "
>  
> -SRCREV = "1be98ba80452ebe38546a7fca26b5a70f2629083"
> +SRCREV = "b12290126ba6a154f0e8b0a8c8b2b0d64f98e427"
>  
>  PVR_DISPLAY_CONTROLLER_ALIAS ??= "tidss"
>  PACKAGECONFIG[pvr] = "-Dgallium-pvr-alias=${PVR_DISPLAY_CONTROLLER_ALIAS},"
> -- 
> 2.25.1

