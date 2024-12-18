Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CA22E77187
	for <webhook@archiver.kernel.org>; Wed, 18 Dec 2024 21:19:38 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.115986.1734556771147611521
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 18 Dec 2024 13:19:31 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 78C5E40CB0;
	Wed, 18 Dec 2024 21:19:30 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 36-xFmotgj9m; Wed, 18 Dec 2024 21:19:30 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 456F940BD4;
	Wed, 18 Dec 2024 21:19:28 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id AB395164135; Wed, 18 Dec 2024 16:19:27 -0500 (EST)
Date: Wed, 18 Dec 2024 16:19:27 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: afd@ti.com
Cc: Ryan Eatmon <reatmon@ti.com>, meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][scarthgap/master][PATCH] ti-bsp: Disable GC320
 support conditionally on BSP version
Message-ID: <20241218211927.GI23825@denix.org>
References: <20241217205945.46805-1-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241217205945.46805-1-afd@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 18 Dec 2024 21:19:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18142

Andrew,

Thanks for the patches. Ryan and I were discussing them yesterday.

Couple points/questions:

1. There's meta-beagle restructuring going on in master right now - the 
changes are in master-next and should be merged to master shortly. I also 
just posted a series to backport these changes to scarthgap. That will 
affect your change below to ti-bsp.inc and will need to be re-spinned.

2. A more generic question... GC320 is a unique peripheral of legacy AM57/J6 
platforms and the driver for it hasn't been updated since 5.10 times. It 
has been disabled globally in the Distro layer for a couple years now. While 
I do understand your change to move this disablenent from the Distro to 
BSP, are there any plans to revive GC320 support and not simply remove it 
altogether?


On Tue, Dec 17, 2024 at 02:59:45PM -0600, Andrew Davis via lists.yoctoproject.org wrote:
> Like we do with GPU support, GC320 support is conditional on the
> kernel we are building and so should be disabled here for kernels
> on which it is not functional yet.
> 
> We can then remove these disabling lines as the driver is updated
> for each supported kernel, instead of blanket disabling in the
> distro layer as done currently.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
>  meta-ti-bsp/conf/machine/include/ti-bsp.inc | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/meta-ti-bsp/conf/machine/include/ti-bsp.inc b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
> index 814c6ca8..bdc8bef7 100644
> --- a/meta-ti-bsp/conf/machine/include/ti-bsp.inc
> +++ b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
> @@ -22,6 +22,9 @@ BSP_BOOTLOADER_VERSION:bsp-mainline = "%"
>  # in mainline, usually present in TI staging or derivative like BB.org
>  MACHINE_FEATURES:remove:bsp-mainline = "gpu"
>  
> +# GC320 support requires out-of-tree drivers not available in mainline
> +MACHINE_FEATURES:remove:bsp-mainline = "gc320"
> +
>  # ==========
>  # next
>  # upcoming upstream/mainline kernel, u-boot
> @@ -35,6 +38,9 @@ BSP_BOOTLOADER_VERSION:bsp-next = "%"
>  # in next, usually present in TI staging or derivative like BB.org
>  MACHINE_FEATURES:remove:bsp-next = "gpu"
>  
> +# GC320 support requires out-of-tree drivers not available in next
> +MACHINE_FEATURES:remove:bsp-next = "gc320"
> +
>  # ==========
>  # ti-6_12
>  # TI staging kernel 6.12, u-boot 2024.10
> @@ -48,6 +54,9 @@ BSP_BOOTLOADER_VERSION:bsp-ti-6_12 = "2024.10%"
>  # in 6.12 yet
>  MACHINE_FEATURES:remove:bsp-ti-6_12 = "gpu"
>  
> +# GC320 support requires out-of-tree drivers not yet available in 6.12
> +MACHINE_FEATURES:remove:bsp-ti-6_12 = "gc320"
> +
>  # ==========
>  # ti-6_6
>  # TI staging kernel 6.6, u-boot 2024.04
> @@ -65,6 +74,9 @@ BSP_ROGUE_DRIVER_VERSION:bsp-ti-6_6 = "24%"
>  BSP_ROGUE_UMLIBS_VERSION:bsp-ti-6_6 = "24%"
>  BSP_MESA_PVR_VERSION:bsp-ti-6_6 = "23%"
>  
> +# GC320 support requires out-of-tree drivers not yet available in 6.6
> +MACHINE_FEATURES:remove:bsp-ti-6_6 = "gc320"
> +
>  # ==========
>  # ti-6_1
>  # TI staging kernel 6.1, u-boot 2023.04
> @@ -82,6 +94,9 @@ BSP_ROGUE_DRIVER_VERSION:bsp-ti-6_1 = "23%"
>  BSP_ROGUE_UMLIBS_VERSION:bsp-ti-6_1 = "23%"
>  BSP_MESA_PVR_VERSION:bsp-ti-6_1 = "22%"
>  
> +# GC320 support requires out-of-tree drivers not yet available in 6.1
> +MACHINE_FEATURES:remove:bsp-ti-6_1 = "gc320"
> +
>  # ==========
>  # bb_org
>  # BeagleBoard.org kernel 6.1, u-boot 2023.04
> @@ -101,6 +116,9 @@ BSP_ROGUE_DRIVER_VERSION:bsp-bb_org = "23%"
>  BSP_ROGUE_UMLIBS_VERSION:bsp-bb_org = "23%"
>  BSP_MESA_PVR_VERSION:bsp-bb_org = "22%"
>  
> +# GC320 support requires out-of-tree drivers not yet available in bb.org
> +MACHINE_FEATURES:remove:bsp-bb_org = "gc320"
> +
>  # ==========
>  # sane fallback defaults
>  # if specific values are not defined or bsp is set incorrectly
> -- 
> 2.39.2

