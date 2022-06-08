Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 767CEC433EF
	for <webhook@archiver.kernel.org>; Wed,  8 Jun 2022 19:19:37 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.1649.1654715974289778089
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 08 Jun 2022 12:19:34 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 1B77A40CC3;
	Wed,  8 Jun 2022 19:19:33 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2KP0TM1TP5f9; Wed,  8 Jun 2022 19:19:33 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 0007540C4E;
	Wed,  8 Jun 2022 19:19:30 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id B4A3D174968; Wed,  8 Jun 2022 15:19:30 -0400 (EDT)
Date: Wed, 8 Jun 2022 15:19:30 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Nishanth Menon <nm@ti.com>
Cc: Ryan Eatmon <reatmon@ti.com>, meta-ti@lists.yoctoproject.org
Subject: Re: [dunfell/master PATCH] linux-ti-mainline: Bump kernel version
 to v5.18
Message-ID: <20220608191930.GV9834@denix.org>
References: <20220608171958.19272-1-nm@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220608171958.19272-1-nm@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 08 Jun 2022 19:19:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14799

On Wed, Jun 08, 2022 at 12:19:58PM -0500, Nishanth Menon wrote:
> This adds up numerous fixes for various k3 platforms, adds platform such
> as AM62x, J721S2.
> 
> While at it, bump the ti-upstream-tools repo as this sync up gives us:
> - Switch over to 4k as default, configs needed for containers for k3 platforms
>   among other config updates
> - Enable fixes for various pinmuxes and overlays for system test images.
> 
> Signed-off-by: Nishanth Menon <nm@ti.com>

Reviewed-by: Denys Dmytriyenko <denys@konsulko.com>


> ---
>  recipes-bsp/u-boot/u-boot-ti-mainline_git.bb  | 6 +++---
>  recipes-kernel/linux/linux-ti-mainline_git.bb | 8 ++++----
>  2 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/recipes-kernel/linux/linux-ti-mainline_git.bb b/recipes-kernel/linux/linux-ti-mainline_git.bb
> index 4a5034fd048c..48c8bd4f440a 100644
> --- a/recipes-kernel/linux/linux-ti-mainline_git.bb
> +++ b/recipes-kernel/linux/linux-ti-mainline_git.bb
> @@ -20,9 +20,9 @@ S = "${WORKDIR}/git"
>  BRANCH = "master"
>  TOOLS_BRANCH = "master"
>  
> -# 5.15 Mainline version
> -SRCREV = "8bb7eca972ad531c9b149c0a51ab43a417385813"
> -PV = "5.15+git${SRCPV}"
> +# 5.18 Mainline version
> +SRCREV = "4b0986a3613c92f4ec1bdc7f60ec66fea135991f"
> +PV = "5.18+git${SRCPV}"
>  
>  # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
>  MACHINE_KERNEL_PR_append = "b"
> @@ -36,7 +36,7 @@ SRC_URI += " \
>      file://defconfig \
>  "
>  
> -SRCREV_ti-upstream-tools = "0f60697843bba6f8d721b14da92b1652563ccb95"
> +SRCREV_ti-upstream-tools = "2536a656f0fb620bae9e3a0793a23caee0e11023"
>  SRCREV_FORMAT = "linux"
>  
>  KERNEL_DEVICETREE = ""
> -- 
> 2.31.1
> 

