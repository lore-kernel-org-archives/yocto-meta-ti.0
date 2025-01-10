Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CC59E77188
	for <webhook@archiver.kernel.org>; Fri, 10 Jan 2025 18:06:31 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.26071.1736532387859453748
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 10 Jan 2025 10:06:28 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E371240C76;
	Fri, 10 Jan 2025 18:06:26 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 89FQzKbukn5i; Fri, 10 Jan 2025 18:06:26 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B53CE409EB;
	Fri, 10 Jan 2025 18:06:24 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 79A8216415A; Fri, 10 Jan 2025 13:06:24 -0500 (EST)
Date: Fri, 10 Jan 2025 13:06:24 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: afd@ti.com
Cc: Ryan Eatmon <reatmon@ti.com>, meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][scarthgap/master][PATCH v2] ti-bsp: Disable GC320
 support conditionally on BSP version
Message-ID: <20250110180624.GE21836@denix.org>
References: <20250108205145.542754-1-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250108205145.542754-1-afd@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 10 Jan 2025 18:06:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18178

On Wed, Jan 08, 2025 at 02:51:45PM -0600, Andrew Davis via lists.yoctoproject.org wrote:
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
> 
> Changes for v2:
>  - Rebased on latest with new meta-beagle layer
> 
>  meta-beagle/conf/machine/include/beagle-bsp.inc |  6 ++++++
>  meta-ti-bsp/conf/machine/include/ti-bsp.inc     | 15 +++++++++++++++
>  2 files changed, 21 insertions(+)
> 
> diff --git a/meta-beagle/conf/machine/include/beagle-bsp.inc b/meta-beagle/conf/machine/include/beagle-bsp.inc
> index 34889b41..06483ba9 100644
> --- a/meta-beagle/conf/machine/include/beagle-bsp.inc
> +++ b/meta-beagle/conf/machine/include/beagle-bsp.inc
> @@ -23,6 +23,9 @@ BSP_ROGUE_DRIVER_VERSION:bsp-bb_org-6_1 = "23%"
>  BSP_ROGUE_UMLIBS_VERSION:bsp-bb_org-6_1 = "23%"
>  BSP_MESA_PVR_VERSION:bsp-bb_org-6_1 = "22%"
>  
> +# GC320 support requires out-of-tree drivers not yet available in bb.org 6.1
> +MACHINE_FEATURES:remove:bsp-bb_org-6_1 = "gc320"
> +
>  # ==========
>  # bb_org-6_6
>  # BeagleBoard.org kernel 6.6, Upstream u-boot 2024.07
> @@ -41,3 +44,6 @@ BSP_ROGUE_DRIVER_PROVIDER:bsp-bb_org-6_6 = "ti-img-rogue-driver"
>  BSP_ROGUE_DRIVER_VERSION:bsp-bb_org-6_6 = "24%"
>  BSP_ROGUE_UMLIBS_VERSION:bsp-bb_org-6_6 = "24%"
>  BSP_MESA_PVR_VERSION:bsp-bb_org-6_6 = "23%"
> +
> +# GC320 support requires out-of-tree drivers not yet available in bb.org 6.6
> +MACHINE_FEATURES:remove:bsp-bb_org-6_6 = "gc320"
> diff --git a/meta-ti-bsp/conf/machine/include/ti-bsp.inc b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
> index 4bbe7668..6773bb7a 100644
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

Andrew, Ryan,

Something went wrong here ^^^
Instead of removing "gc320" for bsp-next, like in the patch here, it got 
committed removing it for bsp-ti-6_12 twice:

https://git.yoctoproject.org/meta-ti/commit/?h=master-wip&id=fe0b35f5f135b98d1ee0f8fe2488b10fbe9a7bb3

Was there any manual massaging involved?


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
>  # sane fallback defaults
>  # if specific values are not defined or bsp is set incorrectly
> -- 
> 2.39.2

