Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7453ACEFC50
	for <webhook@archiver.kernel.org>; Tue,  8 Oct 2024 19:55:24 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.5193.1728417318576380425
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 08 Oct 2024 12:55:19 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id DB42040C7B;
	Tue,  8 Oct 2024 19:55:17 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2MDQEKDEXDU4; Tue,  8 Oct 2024 19:55:17 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A9FD240023;
	Tue,  8 Oct 2024 19:55:14 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 15AAB1640AC; Tue,  8 Oct 2024 15:55:14 -0400 (EDT)
Date: Tue, 8 Oct 2024 15:55:14 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master/scarthgap][PATCH 3/4] ti-bsp: Add ti-6_12
Message-ID: <20241008195514.GJ14676@denix.org>
References: <20241004151857.24578-1-reatmon@ti.com>
 <20241004151857.24578-3-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241004151857.24578-3-reatmon@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 08 Oct 2024 19:55:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17987

On Fri, Oct 04, 2024 at 10:18:56AM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
> Add new BSP for the 6.12 kernel and u-boot 2024.10 versions.
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>  meta-ti-bsp/conf/machine/include/ti-bsp.inc | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-ti-bsp/conf/machine/include/ti-bsp.inc b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
> index 33611689..9a15e164 100644
> --- a/meta-ti-bsp/conf/machine/include/ti-bsp.inc
> +++ b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
> @@ -35,6 +35,19 @@ BSP_BOOTLOADER_VERSION:bsp-next = "%"
>  # in next, usually present in TI staging or derivative like BB.org
>  MACHINE_FEATURES:remove:bsp-next = "gpu"
>  
> +# ==========
> +# ti-6_12
> +# TI staging kernel 6.12, u-boot 2024.10
> +# ==========
> +BSP_KERNEL_PROVIDER:bsp-ti-6_12 = "linux-ti-staging"
> +BSP_KERNEL_VERSION:bsp-ti-6_12 = "6.12%"
> +BSP_BOOTLOADER_PROVIDER:bsp-ti-6_12 = "u-boot-ti-staging"
> +BSP_BOOTLOADER_VERSION:bsp-ti-6_12 = "2024.10%"
> +
> +# GPU support requires out-of-tree SGX and Rogue drivers not available
> +# in 6.12 yet
> +MACHINE_FEATURES:remove:bsp-next = "gpu"

Copy/paste error? bsp-ti_6.12 vs. bsp-next


> +
>  # ==========
>  # ti-6_6
>  # TI staging kernel 6.6, u-boot 2024.04
> @@ -42,7 +55,7 @@ MACHINE_FEATURES:remove:bsp-next = "gpu"
>  BSP_KERNEL_PROVIDER:bsp-ti-6_6 = "linux-ti-staging"
>  BSP_KERNEL_VERSION:bsp-ti-6_6 = "6.6%"
>  BSP_BOOTLOADER_PROVIDER:bsp-ti-6_6 = "u-boot-ti-staging"
> -BSP_BOOTLOADER_VERSION:bsp-ti-6_6 = "2024%"
> +BSP_BOOTLOADER_VERSION:bsp-ti-6_6 = "2024.04%"
>  
>  # Only Rogue is enabled so far, SGX falls back to SW rendering
>  BSP_ROGUE_DRIVER_PROVIDER:bsp-ti-6_6 = "ti-img-rogue-driver"
> -- 
> 2.17.1

