Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61031E6F082
	for <webhook@archiver.kernel.org>; Fri,  1 Nov 2024 18:46:04 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.1757.1730486756391532908
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 01 Nov 2024 11:45:57 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 70FDC41255;
	Fri,  1 Nov 2024 18:45:55 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xBK6rBHVS4Ud; Fri,  1 Nov 2024 18:45:55 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 3F76641243;
	Fri,  1 Nov 2024 18:45:52 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 9FB7A1640C3; Fri,  1 Nov 2024 14:45:51 -0400 (EDT)
Date: Fri, 1 Nov 2024 14:45:51 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master/scarthgap][PATCH] ti-bsp: Tighten up versions
 for PREFERRED_VERSION
Message-ID: <20241101184551.GI20070@denix.org>
References: <20241031204955.23594-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241031204955.23594-1-reatmon@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 01 Nov 2024 18:46:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18033

On Thu, Oct 31, 2024 at 03:49:55PM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
> PREFERRED_VERSION matches against the PV in the recipe, not against the
> file name.  With the upcoming 6.12, the 6.1 kernel version string was a
> little too loose. The "6.1%" could glob onto the 6.12 recipe.  Take
> this time to also clean up a couple of the other versions and narrow
> them down.

While this is Ok for stable versions in general, which have 6.1.y versioning, 
the first release in the series has implied ".0" and when Linus released it, 
it was versioned as 6.1 (not 6.1.0) until Greg made the first stable release 
as 6.1.1. Just something to keep in mind... I see you haven't changed 6.12% 
matching, so it should be fine even for the first release, when it's out.


> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>  meta-ti-bsp/conf/machine/include/ti-bsp.inc | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/meta-ti-bsp/conf/machine/include/ti-bsp.inc b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
> index 2eb3bd19..d27bbe3c 100644
> --- a/meta-ti-bsp/conf/machine/include/ti-bsp.inc
> +++ b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
> @@ -53,7 +53,7 @@ MACHINE_FEATURES:remove:bsp-ti-6_12 = "gpu"
>  # TI staging kernel 6.6, u-boot 2024.04
>  # ==========
>  BSP_KERNEL_PROVIDER:bsp-ti-6_6 = "linux-ti-staging"
> -BSP_KERNEL_VERSION:bsp-ti-6_6 = "6.6%"
> +BSP_KERNEL_VERSION:bsp-ti-6_6 = "6.6.%"
>  BSP_BOOTLOADER_PROVIDER:bsp-ti-6_6 = "u-boot-ti-staging"
>  BSP_BOOTLOADER_VERSION:bsp-ti-6_6 = "2024.04%"
>  
> @@ -68,9 +68,9 @@ BSP_MESA_PVR_VERSION:bsp-ti-6_6 = "23%"
>  # TI staging kernel 6.1, u-boot 2023.04
>  # ==========
>  BSP_KERNEL_PROVIDER:bsp-ti-6_1 = "linux-ti-staging"
> -BSP_KERNEL_VERSION:bsp-ti-6_1 = "6.1%"
> +BSP_KERNEL_VERSION:bsp-ti-6_1 = "6.1.%"
>  BSP_BOOTLOADER_PROVIDER:bsp-ti-6_1 = "u-boot-ti-staging"
> -BSP_BOOTLOADER_VERSION:bsp-ti-6_1 = "2023%"
> +BSP_BOOTLOADER_VERSION:bsp-ti-6_1 = "2023.04%"
>  
>  BSP_SGX_DRIVER_PROVIDER:bsp-ti-6_1 = "ti-sgx-ddk-km"
>  BSP_SGX_DRIVER_VERSION:bsp-ti-6_1 = "1.17%"
> -- 
> 2.17.1

