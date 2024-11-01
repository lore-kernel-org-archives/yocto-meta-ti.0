Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2AAFE6F062
	for <webhook@archiver.kernel.org>; Fri,  1 Nov 2024 14:25:45 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.39227.1730471136877043460
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 01 Nov 2024 07:25:37 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 173C340DDC;
	Fri,  1 Nov 2024 14:25:36 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g1m7PW-RTHmV; Fri,  1 Nov 2024 14:25:36 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id D7B8841262;
	Fri,  1 Nov 2024 14:25:31 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id C392E1640BD; Fri,  1 Nov 2024 10:25:30 -0400 (EDT)
Date: Fri, 1 Nov 2024 10:25:30 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: rs@ti.com
Cc: reatmon@ti.com, detheridge@ti.com, meta-ti@lists.yoctoproject.org,
	mike@mdb977.de
Subject: Re: [meta-ti][scarthgap/master][PATCH] sgx: bump version for
 kernel 6.6 / mesa 23.2.1
Message-ID: <20241101142530.GG20070@denix.org>
References: <20241031234743.435950-1-rs@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241031234743.435950-1-rs@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 01 Nov 2024 14:25:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18032

On Thu, Oct 31, 2024 at 06:47:43PM -0500, rs@ti.com wrote:
> From: Randolph Sapp <rs@ti.com>
> 
> Bump versions of mesa-pvr and ti-sgx-ddk-km to support SGX with kernel
> 6.6 and the same version of mesa rogue is using right now (23.2.1).
> These commits are currently compatible with both kernel 6.1 and 6.6.
> 
> Enable SGX by default in the 6.6 BSP provider section logic.

Great to finally get "legacy" SGX working on 6.6! Thanks for doing it.


> Signed-off-by: Randolph Sapp <rs@ti.com>
> ---
>  meta-ti-bsp/conf/machine/include/ti-bsp.inc                   | 4 +++-
>  .../recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb | 2 +-
>  meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_23.2.1.bb          | 2 +-
>  3 files changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/meta-ti-bsp/conf/machine/include/ti-bsp.inc b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
> index 0c8f657d..d06fed1e 100644
> --- a/meta-ti-bsp/conf/machine/include/ti-bsp.inc
> +++ b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
> @@ -57,7 +57,9 @@ BSP_KERNEL_VERSION:bsp-ti-6_6 = "6.6%"
>  BSP_BOOTLOADER_PROVIDER:bsp-ti-6_6 = "u-boot-ti-staging"
>  BSP_BOOTLOADER_VERSION:bsp-ti-6_6 = "2024.04%"
>  
> -# Only Rogue is enabled so far, SGX falls back to SW rendering
> +BSP_SGX_DRIVER_PROVIDER:bsp-ti-6_6 = "ti-sgx-ddk-km"
> +BSP_SGX_DRIVER_VERSION:bsp-ti-6_6 = "1.17%"
> +BSP_SGX_UMLIBS_VERSION:bsp-ti-6_6 = "1.17%"
>  BSP_ROGUE_DRIVER_PROVIDER:bsp-ti-6_6 = "ti-img-rogue-driver"
>  BSP_ROGUE_DRIVER_VERSION:bsp-ti-6_6 = "24%"
>  BSP_ROGUE_UMLIBS_VERSION:bsp-ti-6_6 = "24%"
> diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
> index 100c10c1..31cffaf1 100644
> --- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
> +++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
> @@ -19,7 +19,7 @@ SRC_URI = "git://git.ti.com/git/graphics/omap5-sgx-ddk-linux.git;protocol=https;
>  
>  S = "${WORKDIR}/git"
>  
> -SRCREV = "652ae16657cc4acda664e669d0c9b4891252f37f"
> +SRCREV = "97c49d302efd50d1e52bf55a25fe8ecf3e5476c3"
>  
>  TARGET_PRODUCT:omap-a15 = "ti572x_linux"
>  TARGET_PRODUCT:ti33x = "ti335x_linux"
> diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_23.2.1.bb b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_23.2.1.bb
> index 21134bc7..fa765a64 100644
> --- a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_23.2.1.bb
> +++ b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_23.2.1.bb
> @@ -25,7 +25,7 @@ PACKAGECONFIG:append = " \
>      ${@bb.utils.contains('PREFERRED_PROVIDER_virtual/gpudriver', 'ti-sgx-ddk-km', 'sgx', '', d)} \
>  "
>  
> -SRCREV = "b12290126ba6a154f0e8b0a8c8b2b0d64f98e427"
> +SRCREV = "0e75e7ded360ea6aee4140393b30960e152f3994"
>  PV = "23.2.1"
>  
>  PVR_DISPLAY_CONTROLLER_ALIAS ??= "tidss"
> -- 
> 2.47.0
> 

