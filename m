Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 454CAD3B9B3
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 23:52:58 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2092.1765324372017844504
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 09 Dec 2025 15:52:52 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6F9C640C50;
	Tue,  9 Dec 2025 23:52:51 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n3Ey6M1AAi6j; Tue,  9 Dec 2025 23:52:51 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 47FE5406B5;
	Tue,  9 Dec 2025 23:52:49 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 0A792175ED9; Tue,  9 Dec 2025 18:52:49 -0500 (EST)
Date: Tue, 9 Dec 2025 18:52:49 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: afd@ti.com
Cc: Ryan Eatmon <reatmon@ti.com>, meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master][PATCH 2/2] linux-bb.org: Remove unused
 EXTRA_DTC_ARGS from kernel args
Message-ID: <20251209235249.GO11121@denix.org>
References: <20251203151446.3889979-1-afd@ti.com>
 <20251203151446.3889979-2-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251203151446.3889979-2-afd@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 09 Dec 2025 23:52:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19343

On Wed, Dec 03, 2025 at 09:14:46AM -0600, Andrew Davis via lists.yoctoproject.org wrote:
> This is no longer used anywhere, drop it out.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>

Reviewed-by: Denys Dmytriyenko <denys@konsulko.com>


> ---
>  meta-beagle/recipes-kernel/linux/linux-bb.org_6.12.bb | 2 +-
>  meta-beagle/recipes-kernel/linux/linux-bb.org_6.6.bb  | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-beagle/recipes-kernel/linux/linux-bb.org_6.12.bb b/meta-beagle/recipes-kernel/linux/linux-bb.org_6.12.bb
> index 8ab9fc67..64b11045 100644
> --- a/meta-beagle/recipes-kernel/linux/linux-bb.org_6.12.bb
> +++ b/meta-beagle/recipes-kernel/linux/linux-bb.org_6.12.bb
> @@ -15,7 +15,7 @@ require recipes-kernel/linux/ti-kernel.inc
>  
>  DEPENDS += "gmp-native libmpc-native"
>  
> -KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT} ${EXTRA_DTC_ARGS}"
> +KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT}"
>  
>  # Extra DT overlays/capes
>  KERNEL_DEVICETREE:append:armv7a = " \
> diff --git a/meta-beagle/recipes-kernel/linux/linux-bb.org_6.6.bb b/meta-beagle/recipes-kernel/linux/linux-bb.org_6.6.bb
> index 4873500d..37626a1d 100644
> --- a/meta-beagle/recipes-kernel/linux/linux-bb.org_6.6.bb
> +++ b/meta-beagle/recipes-kernel/linux/linux-bb.org_6.6.bb
> @@ -15,7 +15,7 @@ require recipes-kernel/linux/ti-kernel.inc
>  
>  DEPENDS += "gmp-native libmpc-native"
>  
> -KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT} ${EXTRA_DTC_ARGS}"
> +KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT}"
>  
>  # Extra DT overlays/capes
>  KERNEL_DEVICETREE:append:armv7a = " \
> -- 
> 2.39.2

