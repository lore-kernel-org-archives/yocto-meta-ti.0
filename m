Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75F91D3B9B3
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 23:52:28 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2080.1765324344669658835
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 09 Dec 2025 15:52:24 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 1A39040C50;
	Tue,  9 Dec 2025 23:52:24 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0K5DN-WcVPpJ; Tue,  9 Dec 2025 23:52:24 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E741C406B5;
	Tue,  9 Dec 2025 23:52:21 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id A9268175ED7; Tue,  9 Dec 2025 18:52:21 -0500 (EST)
Date: Tue, 9 Dec 2025 18:52:21 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: afd@ti.com
Cc: Ryan Eatmon <reatmon@ti.com>, meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master][PATCH 1/2] linux-ti-staging: Remove unused
 EXTRA_DTC_ARGS from kernel args
Message-ID: <20251209235221.GN11121@denix.org>
References: <20251203151446.3889979-1-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251203151446.3889979-1-afd@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 09 Dec 2025 23:52:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19342

On Wed, Dec 03, 2025 at 09:14:45AM -0600, Andrew Davis via lists.yoctoproject.org wrote:
> This is no longer used anywhere, drop it out.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>

Reviewed-by: Denys Dmytriyenko <denys@konsulko.com>


> ---
>  meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb | 2 +-
>  meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb | 3 +--
>  meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb  | 3 +--
>  3 files changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
> index 92fb1e6c..180a5d92 100644
> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
> @@ -9,7 +9,7 @@ inherit ${KERNEL_BASE_CLASS}
>  
>  DEPENDS += "gmp-native libmpc-native"
>  
> -KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT} ${EXTRA_DTC_ARGS}"
> +KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT}"
>  
>  S = "${UNPACKDIR}/${BB_GIT_DEFAULT_DESTSUFFIX}"
>  
> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
> index ba1e6ed6..4dfdc42d 100644
> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
> @@ -15,8 +15,7 @@ DEPENDS += "gmp-native libmpc-native"
>  # Look in the generic major.minor directory for files
>  FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}-6.12:"
>  
> -KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT} \
> -		      ${EXTRA_DTC_ARGS}"
> +KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT}"
>  
>  S = "${UNPACKDIR}/${BB_GIT_DEFAULT_DESTSUFFIX}"
>  
> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb
> index b6d882d8..9acc95c8 100644
> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb
> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb
> @@ -15,8 +15,7 @@ DEPENDS += "gmp-native libmpc-native"
>  # Look in the generic major.minor directory for files
>  FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}-6.6:"
>  
> -KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT} \
> -		      ${EXTRA_DTC_ARGS}"
> +KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT}"
>  
>  S = "${UNPACKDIR}/${BB_GIT_DEFAULT_DESTSUFFIX}"
>  
> -- 
> 2.39.2

