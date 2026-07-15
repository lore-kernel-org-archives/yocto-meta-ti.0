Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A142DC44507
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 22:55:09 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1199.1784156099828751911
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 15 Jul 2026 15:55:00 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id AD22940CCA;
	Wed, 15 Jul 2026 22:54:58 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2JP36q6bvtRq; Wed, 15 Jul 2026 22:54:58 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 6923B40C2A;
	Wed, 15 Jul 2026 22:54:55 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 9518D17C2E7; Wed, 15 Jul 2026 18:54:54 -0400 (EDT)
Date: Wed, 15 Jul 2026 18:54:54 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master/wrynose][PATCH v2] u-boot-ti-mainline/next:
 Update git server
Message-ID: <20260715225454.GN10186@denix.org>
References: <20260715161432.1790195-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260715161432.1790195-1-reatmon@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 15 Jul 2026 22:55:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20149

On Wed, Jul 15, 2026 at 11:14:32AM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
> The u-boot project has moved to a new official git repository server [1] for
> all of their work.
> 
> [1] https://git.u-boot-project.org/u-boot/u-boot/-/commit/2a6ca4ad04e64488ac41c3683cacd44173a96d24
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
> v2: Needed to update the next branch since it changed in the move as well.
> 
>  meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb | 2 +-
>  meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-next_git.bb     | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb
> index 03fd6193..2daf86f9 100644
> --- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb
> +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb
> @@ -4,6 +4,6 @@ SUMMARY = "Mainline U-Boot for TI devices"
>  
>  PV = "2026.04"

Any specific reason mainline is stcuk at 2026.04?


> -UBOOT_GIT_URI = "git://source.denx.de/u-boot/u-boot.git"
> +UBOOT_GIT_URI = "git://git.u-boot-project.org/u-boot/u-boot.git"
>  
>  SRCREV_uboot = "88dc2788777babfd6322fa655df549a019aa1e69"
> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-next_git.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-next_git.bb
> index 9bdedfa3..4d5f4a38 100644
> --- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-next_git.bb
> +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-next_git.bb
> @@ -2,4 +2,4 @@ require u-boot-ti-mainline_git.bb
>  
>  SUMMARY = "U-Boot master-next for TI devices"
>  
> -BRANCH = "master-next"
> +BRANCH = "next"
> -- 
> 2.43.0

