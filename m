Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B3BDE77188
	for <webhook@archiver.kernel.org>; Fri, 10 Jan 2025 17:52:21 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.25696.1736531537856876978
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 10 Jan 2025 09:52:18 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 1EDC640C76;
	Fri, 10 Jan 2025 17:52:17 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rGeTXeb-zA5M; Fri, 10 Jan 2025 17:52:17 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E99CD409EB;
	Fri, 10 Jan 2025 17:52:14 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 5A08516415A; Fri, 10 Jan 2025 12:52:14 -0500 (EST)
Date: Fri, 10 Jan 2025 12:52:14 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Praneeth Bajjuri <praneeth@ti.com>, meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master/scarthgap][PATCH v2] ti-bsp: Change to 6.12
 as the default
Message-ID: <20250110175214.GD21836@denix.org>
References: <20250108195344.13985-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250108195344.13985-1-reatmon@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 10 Jan 2025 17:52:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18177

On Wed, Jan 08, 2025 at 01:53:44PM -0600, Ryan Eatmon via lists.yoctoproject.org wrote:
> We are moving to 6.12 to be our new LTS, so we are switching the default
> BSP to that.  You can still access the 6.6 kernel if you need to by using
> the BSP system and setting TI_PREFERRED_BSP = "ti-6_6" in your
> local.conf.

Sorry for piecemealing my comments one by one, but I just though it might be 
a very good idea to explicitly call out a complete lack of graphics support 
in 6.12 BSP (at least for now), especially since this is also targeted for 
scarthgap. 


> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
> v2: Remove the DEFAULT_PREFERENCE settings on the kernel/u-boot recipes.
> 
>  meta-ti-bsp/conf/machine/include/ti-bsp.inc                     | 2 +-
>  meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb     | 2 --
>  .../recipes-kernel/linux/linux-ti-staging-systest_6.12.bb       | 2 --
>  meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb       | 2 --
>  4 files changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/meta-ti-bsp/conf/machine/include/ti-bsp.inc b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
> index 083177dc..f19a0c9c 100644
> --- a/meta-ti-bsp/conf/machine/include/ti-bsp.inc
> +++ b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
> @@ -4,7 +4,7 @@
>  # well as a dedicated machine override.
>  
>  # Supported options are: mainline, next, ti-6_12, ti-6_6, ti-6_1
> -TI_PREFERRED_BSP ??= "ti-6_6"
> +TI_PREFERRED_BSP ??= "ti-6_12"
>  
>  # Use bsp-* namespace for overrides
>  MACHINEOVERRIDES =. "bsp-${TI_PREFERRED_BSP}:"
> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
> index e71008fa..4a3b347d 100644
> --- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
> +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
> @@ -1,7 +1,5 @@
>  require u-boot-ti.inc
>  
> -DEFAULT_PREFERENCE = "-1"
> -
>  include ${@ 'recipes-bsp/u-boot/ti-extras.inc' if d.getVar('TI_EXTRAS') else ''}
>  
>  PR = "r0"
> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest_6.12.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest_6.12.bb
> index 8ce23368..b0dcab52 100644
> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest_6.12.bb
> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest_6.12.bb
> @@ -1,7 +1,5 @@
>  require linux-ti-staging_6.12.bb
>  
> -DEFAULT_PREFERENCE = "-1"
> -
>  # Look in the generic major.minor directory for files
>  # This will have priority over generic non-rt path
>  FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}-6.12:"
> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
> index 7f61b8ab..2ddced64 100644
> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
> @@ -6,8 +6,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
>  inherit ti-secdev
>  inherit kernel
>  
> -DEFAULT_PREFERENCE = "-1"
> -
>  require recipes-kernel/linux/setup-defconfig.inc
>  require recipes-kernel/linux/ti-kernel.inc
>  include ${@ 'recipes-kernel/linux/ti-kernel-devicetree-prefix.inc' if d.getVar('KERNEL_DEVICETREE_PREFIX') else ''}
> -- 
> 2.17.1
> 

