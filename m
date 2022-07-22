Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BD3CC43334
	for <webhook@archiver.kernel.org>; Fri, 22 Jul 2022 18:53:38 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.11580.1658516014595436465
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 22 Jul 2022 11:53:35 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B948340D12;
	Fri, 22 Jul 2022 18:53:33 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h6CL1f6McEra; Fri, 22 Jul 2022 18:53:33 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-80-88.washdc.fios.verizon.net
 [100.15.80.88])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 9614540D08;
	Fri, 22 Jul 2022 18:53:31 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 9B10E1749B9; Fri, 22 Jul 2022 14:53:30 -0400 (EDT)
Date: Fri, 22 Jul 2022 14:53:30 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Praneeth Bajjuri <praneeth@ti.com>, meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][dunfell][PATCH v2] kernel u-boot: Fix formulation of
 LOCALVERSION
Message-ID: <20220722185330.GQ18692@denix.org>
References: <20220722020328.7150-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220722020328.7150-1-reatmon@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 22 Jul 2022 18:53:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14900

On Thu, Jul 21, 2022 at 09:03:28PM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
> devtool does not work with the current formulation of
> the LOCALVERSION variables.  We need to use SRCPV to
> avoid AUTOREV on bleeding builds, but there will be no
> + in the string, so we cannot split on that.  Just
> use SRCPV directly.

I guess the description is a bit off?


> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
> v2: More testing showed the first pass caused some problems.
> 
>  recipes-bsp/u-boot/u-boot-ti.inc         | 2 +-
>  recipes-kernel/linux/setup-defconfig.inc | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes-bsp/u-boot/u-boot-ti.inc b/recipes-bsp/u-boot/u-boot-ti.inc
> index e7c93335..1f8fb6de 100644
> --- a/recipes-bsp/u-boot/u-boot-ti.inc
> +++ b/recipes-bsp/u-boot/u-boot-ti.inc
> @@ -1,6 +1,6 @@
>  # UBOOT_LOCALVERSION can be set to add a tag to the end of the
>  # U-boot version string.  such as the commit id
> -UBOOT_LOCALVERSION = "-g${@d.getVar('SRCPV', True).split('+')[1]}"
> +UBOOT_LOCALVERSION = "-g${@d.getVar('SRCPV', True).replace('AUTOINC+','')[:10]}"
>  
>  UBOOT_SUFFIX ?= "img"
>  SPL_BINARY ?= "MLO"
> diff --git a/recipes-kernel/linux/setup-defconfig.inc b/recipes-kernel/linux/setup-defconfig.inc
> index 1e97acc0..df7d9ac8 100644
> --- a/recipes-kernel/linux/setup-defconfig.inc
> +++ b/recipes-kernel/linux/setup-defconfig.inc
> @@ -1,6 +1,6 @@
>  # KERNEL_LOCALVERSION can be set to add a tag to the end of the
>  # kernel version string.  such as the commit id
> -KERNEL_LOCALVERSION = "-g${@d.getVar('SRCPV', True).split('+')[1]}"
> +KERNEL_LOCALVERSION = "-g${@d.getVar('SRCPV', True).replace('AUTOINC+','')[:10]}"
>  
>  # Check the defconfig file and see if it points to an in kernel
>  # defconfig that should be used, or if it is a complete config file
> -- 
> 2.17.1
> 

