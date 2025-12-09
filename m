Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44A36D3B9B1
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 23:50:18 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2029.1765324213815502806
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 09 Dec 2025 15:50:13 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 3829240C50;
	Tue,  9 Dec 2025 23:50:13 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nw97iCCXTJAg; Tue,  9 Dec 2025 23:50:13 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 0EA30406B5;
	Tue,  9 Dec 2025 23:50:11 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id C415B170661; Tue,  9 Dec 2025 18:50:10 -0500 (EST)
Date: Tue, 9 Dec 2025 18:50:10 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: afd@ti.com
Cc: Ryan Eatmon <reatmon@ti.com>, meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master][PATCH 3/4] k3r5: Use UBOOT_BINARY for R5
 U-Boot Image
Message-ID: <20251209235010.GL11121@denix.org>
References: <20251202223210.3816583-1-afd@ti.com>
 <20251202223210.3816583-3-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251202223210.3816583-3-afd@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 09 Dec 2025 23:50:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19340

On Tue, Dec 02, 2025 at 04:32:09PM -0600, Andrew Davis via lists.yoctoproject.org wrote:
> As R5 only builds one working image (tiboot3.bin), define this as the
> "UBOOT_BINARY", even though it was technically build using the SPL build
> pass in U-Boot. This allows some simplification and removes deploying of
> a dummy file (u-boot-spl.bin) which is not a usable boot file. It was only
> deployed as UBOOT_BINARY is not optional and so something needed to be set
> here.
> 
> BeagleBone-AI64 already did something similar to this so the overrides
> in that MACHINE conf can now be removed.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>

Reviewed-by: Denys Dmytriyenko <denys@konsulko.com>


> ---
>  meta-beagle/conf/machine/beaglebone-ai64-k3r5.conf | 6 ------
>  meta-ti-bsp/conf/machine/include/k3r5.inc          | 8 ++------
>  2 files changed, 2 insertions(+), 12 deletions(-)
> 
> diff --git a/meta-beagle/conf/machine/beaglebone-ai64-k3r5.conf b/meta-beagle/conf/machine/beaglebone-ai64-k3r5.conf
> index 1bdfd7a1..65616b67 100644
> --- a/meta-beagle/conf/machine/beaglebone-ai64-k3r5.conf
> +++ b/meta-beagle/conf/machine/beaglebone-ai64-k3r5.conf
> @@ -9,10 +9,4 @@ SYSFW_SOC = "j721e"
>  SYSFW_CONFIG = "evm"
>  SYSFW_SUFFIX = "gp"
>  
> -SPL_BINARY = "spl/u-boot-spl.${UBOOT_SUFFIX}"
> -SPL_SYMLINK = "u-boot-r5spl.${UBOOT_SUFFIX}"
> -UBOOT_BINARY = "tiboot3.${UBOOT_SUFFIX}"
> -UBOOT_IMAGE = "tiboot3-${MAINMACHINE}-${PV}-${PR}.${UBOOT_SUFFIX}"
> -UBOOT_SYMLINK = "tiboot3-${MAINMACHINE}.${UBOOT_SUFFIX}"
> -
>  UBOOT_MACHINE = "j721e_beagleboneai64_r5_defconfig"
> diff --git a/meta-ti-bsp/conf/machine/include/k3r5.inc b/meta-ti-bsp/conf/machine/include/k3r5.inc
> index fcd54254..0408c09c 100644
> --- a/meta-ti-bsp/conf/machine/include/k3r5.inc
> +++ b/meta-ti-bsp/conf/machine/include/k3r5.inc
> @@ -15,13 +15,9 @@ require conf/machine/include/arm/armv7a/tune-cortexa8.inc
>  require conf/machine/include/ti-bsp.inc
>  PREFERRED_PROVIDER_virtual/kernel = "linux-dummy"
>  
> -SPL_SUFFIX = "bin"
> -SPL_BINARY = "tiboot3-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONFIG}.${SPL_SUFFIX}"
> -SPL_SYMLINK = "tiboot3.${SPL_SUFFIX}"
>  UBOOT_SUFFIX = "bin"
> -UBOOT_BINARY = "u-boot-r5spl.${UBOOT_SUFFIX}"
> -UBOOT_IMAGE = "u-boot-r5spl-${MAINMACHINE}-${PV}-${PR}.${UBOOT_SUFFIX}"
> -UBOOT_SYMLINK = "u-boot-r5spl-${MAINMACHINE}.${UBOOT_SUFFIX}"
> +UBOOT_BINARY = "tiboot3-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONFIG}.${UBOOT_SUFFIX}"
> +UBOOT_SYMLINK = "tiboot3.${UBOOT_SUFFIX}"
>  
>  PACKAGECONFIG:pn-u-boot-ti-staging = ""
>  PACKAGECONFIG:pn-u-boot-ti-mainline = ""
> -- 
> 2.39.2

