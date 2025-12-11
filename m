Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09C91D43352
	for <webhook@archiver.kernel.org>; Thu, 11 Dec 2025 20:36:03 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.451.1765485359708115385
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 11 Dec 2025 12:36:00 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id C117F40BD4;
	Thu, 11 Dec 2025 20:35:58 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EW79vGEfRu-h; Thu, 11 Dec 2025 20:35:58 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 8F34F406B5;
	Thu, 11 Dec 2025 20:35:55 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id A31BE176715; Thu, 11 Dec 2025 15:35:54 -0500 (EST)
Date: Thu, 11 Dec 2025 15:35:54 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master][PATCH v2 3/5] ti-bsp: Add ti-6_18 for LTS
 development
Message-ID: <20251211203554.GW11121@denix.org>
References: <20251211202234.4064350-1-reatmon@ti.com>
 <20251211202234.4064350-3-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251211202234.4064350-3-reatmon@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 11 Dec 2025 20:36:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19352

On Thu, Dec 11, 2025 at 02:22:32PM -0600, Ryan Eatmon via lists.yoctoproject.org wrote:
> Add entries for ti-6_18 for the upcoming LTS development effort.  This
> includes:
> 
> kernel: 6.18
> u-boot: 2026.01
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
> v2: No change.
> 
>  meta-ti-bsp/conf/machine/include/ti-bsp.inc | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-ti-bsp/conf/machine/include/ti-bsp.inc b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
> index eaa501c3..0ca2de64 100644
> --- a/meta-ti-bsp/conf/machine/include/ti-bsp.inc
> +++ b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
> @@ -3,7 +3,7 @@
>  # preferences for kernel, bootloader and graphics components, as
>  # well as a dedicated machine override.
>  
> -# Supported options are: mainline, next, ti-6_12, ti-6_6
> +# Supported options are: mainline, next, ti-6_18, ti-6_12, ti-6_6
>  TI_PREFERRED_BSP ??= "ti-6_12"
>  
>  # Use bsp-* namespace for overrides
> @@ -33,6 +33,15 @@ BSP_BOOTLOADER_VERSION:bsp-next = "%"
>  # GC320 support requires out-of-tree drivers not yet available in next
>  MACHINE_FEATURES:remove:bsp-next = "gc320"

Is this needed for 6.18 as well, or is it already enabled there?


> +# ==========
> +# ti-6_18
> +# TI staging kernel 6.18, u-boot 2026.01
> +# ==========
> +BSP_KERNEL_PROVIDER:bsp-ti-6_18 = "linux-ti-staging"
> +BSP_KERNEL_VERSION:bsp-ti-6_18 = "6.18%"
> +BSP_BOOTLOADER_PROVIDER:bsp-ti-6_18 = "u-boot-ti-staging"
> +BSP_BOOTLOADER_VERSION:bsp-ti-6_18 = "2026.01%"
> +
>  # ==========
>  # ti-6_12
>  # TI staging kernel 6.12, u-boot 2025.01
> -- 
> 2.43.0

