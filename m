Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B894C4345F
	for <webhook@archiver.kernel.org>; Thu,  2 May 2024 03:02:01 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.4791.1714618914300318809
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 01 May 2024 20:01:54 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 5B86640C2E
	for <meta-ti@lists.yoctoproject.org>; Thu,  2 May 2024 03:01:53 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EAm2lCztngtt for <meta-ti@lists.yoctoproject.org>;
	Thu,  2 May 2024 03:01:53 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 47E0F40A46
	for <meta-ti@lists.yoctoproject.org>; Thu,  2 May 2024 03:01:53 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 5E720163F55; Wed,  1 May 2024 23:01:52 -0400 (EDT)
Date: Wed, 1 May 2024 23:01:52 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] [master/scarthgap][PATCH 1/3] ti-img-rogue-*: add
 ddk 24.1 recipes for ltsprep
Message-ID: <20240502030152.GT28791@denix.org>
References: <17CB8455266768D4.4497@lists.yoctoproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <17CB8455266768D4.4497@lists.yoctoproject.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 02 May 2024 03:02:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17627

Reformatted to be a diff against the previous version to spot the actual 
changes and spot any issues. See below.


On Wed, May 01, 2024 at 08:26:19PM -0400, Denys Dmytriyenko wrote:
> From: Randolph Sapp <rs@ti.com>
> 
> Add these recipes but lock them behind ltsprep tags because they require
> device tree changes that does not work on the current default kernel for
> this layer.
> 
> Signed-off-by: Randolph Sapp <rs@ti.com>
> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> ---
>  ....6512818.bb => ti-img-rogue-driver_24.1.6554834.bb} |  4 +++-
>  ....6512818.bb => ti-img-rogue-umlibs_24.1.6554834.bb} | 10 +++++++---
>  2 files changed, 10 insertions(+), 4 deletions(-)
>  copy meta-ti-bsp/recipes-bsp/powervr-drivers/{ti-img-rogue-driver_23.3.6512818.bb => ti-img-rogue-driver_24.1.6554834.bb} (94%)
>  copy meta-ti-bsp/recipes-graphics/powervr-umlibs/{ti-img-rogue-umlibs_23.3.6512818.bb => ti-img-rogue-umlibs_24.1.6554834.bb} (94%)
> 
> diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.3.6512818.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_24.1.6554834.bb
> similarity index 94%
> copy from meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.3.6512818.bb
> copy to meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_24.1.6554834.bb
> index 02ec9fe9..a1b76d27 100644
> --- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.3.6512818.bb
> +++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_24.1.6554834.bb
> @@ -3,6 +3,8 @@ HOMEPAGE = "http://git.ti.com/graphics/ti-img-rogue-driver"
>  LICENSE = "MIT | GPL-2.0-only"
>  LIC_FILES_CHKSUM = "file://README;beginline=14;endline=19;md5=0403c7dea01a2b8232261e805325fac2"
>  
> +DEFAULT_PREFERENCE = "-1"
> +
>  inherit module
>  
>  PROVIDES = "virtual/gpudriver"
> @@ -22,7 +24,7 @@ SRC_URI = "git://git.ti.com/git/graphics/ti-img-rogue-driver.git;protocol=https;
>  
>  S = "${WORKDIR}/git"
>  
> -SRCREV = "2f409b4dd2540e896b54bff02219d4fc51129b81"
> +SRCREV = "e2dfdfee991dadc18175f27fe9e8676e910a2f8d"
>  
>  TARGET_PRODUCT:j721e = "j721e_linux"
>  TARGET_PRODUCT:j721s2 = "j721s2_linux"
> diff --git a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.3.6512818.bb b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_24.1.6554834.bb
> similarity index 94%
> copy from meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.3.6512818.bb
> copy to meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_24.1.6554834.bb
> index a0a9a295..df426d1a 100644
> --- a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.3.6512818.bb
> +++ b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_24.1.6554834.bb
> @@ -3,6 +3,8 @@ HOMEPAGE = "http://git.ti.com/graphics/ti-img-rogue-umlibs"
>  LICENSE = "TI-TFL"
>  LIC_FILES_CHKSUM = "file://${WORKDIR}/git/LICENSE;md5=7232b98c1c58f99e3baa03de5207e76f"
>  
> +DEFAULT_PREFERENCE = "-1"
> +
>  inherit bin_package
>  
>  INHIBIT_DEFAULT_DEPS = ""
> @@ -14,7 +16,7 @@ PR = "r3"
>  
>  BRANCH = "linuxws/scarthgap/k6.6/${PV}"
>  SRC_URI = "git://git.ti.com/git/graphics/ti-img-rogue-umlibs.git;protocol=https;branch=${BRANCH}"
> -SRCREV = "0b9e64254269be2fa95c4f3e1dd925d6e4d58199"
> +SRCREV = "e473234158c736248cf71a60080b7faf76fca561"
>  S = "${WORKDIR}/git/targetfs/${TARGET_PRODUCT}/${PVR_WS}/${PVR_BUILD}"
>  
>  TARGET_PRODUCT:j721e = "j721e_linux"
> @@ -109,7 +111,7 @@ python __anonymous() {
>          mlprefix = d.getVar("MLPREFIX")
>          pkgs = " " + " ".join(mlprefix + x + suffix for x in p[1:])
>          d.setVar("DEBIAN_NOAUTONAME:" + fullp, "1")
> -        d.setVar("INSANE_SKIP:" + fullp, "dev-so")
> +        d.setVar("INSANE_SKIP:" + fullp, "dev-so ldflags")
>          d.appendVar("RRECOMMENDS:" + fullp, " ${MLPREFIX}ti-img-rogue-umlibs" + suffix)
>  }
>  
> @@ -133,6 +135,8 @@ DEBIAN_NOAUTONAME:libopencl-rogue-tools = "1"
>  # optional tools and tests
>  FILES:${PN}-tools = "${bindir}/"
>  RDEPENDS:${PN}-tools = "python3-core ${PN}"

^^^

> +INSANE_SKIP:${PN}-tools = "ldflags"
> +RDEPENDS:${PN}-tools = "libdrm"

This overrides/replaces earlier RDEPENDS


>  
>  # required firmware
>  FILES:${PN}-firmware = "${base_libdir}/firmware/*"
> @@ -142,4 +146,4 @@ RRECOMMENDS:${PN} += " \
>      ${PN}-tools \
>  "
>  
> -INSANE_SKIP:${PN} += "already-stripped dev-so"
> +INSANE_SKIP:${PN} += "already-stripped dev-so ldflags"

Why is ldflags QA check needs to be skipped now?

