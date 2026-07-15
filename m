Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 508E8C4450F
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 16:09:18 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11302.1784131756746092690
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 15 Jul 2026 09:09:17 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 434D440CCA;
	Wed, 15 Jul 2026 16:09:15 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C2HQ2FlBYZcF; Wed, 15 Jul 2026 16:09:15 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 03CC940CB9;
	Wed, 15 Jul 2026 16:09:11 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 07C5217C2E7; Wed, 15 Jul 2026 12:09:11 -0400 (EDT)
Date: Wed, 15 Jul 2026 12:09:10 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master/wrynose][PATCH] u-boot-ti-mainline: Update
 git server
Message-ID: <20260715160910.GL10186@denix.org>
References: <20260715151023.464240-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260715151023.464240-1-reatmon@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 15 Jul 2026 16:09:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20146

On Wed, Jul 15, 2026 at 10:10:23AM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
> The u-boot project has moved to a new official git repository server [1] for
> all of their work.
> 
> [1] https://git.u-boot-project.org/u-boot/u-boot/-/commit/2a6ca4ad04e64488ac41c3683cacd44173a96d24

You'd also need to update the branch, as master won't get any more commits 
after 2026.07, while main already has tons of changes for upcoming 2026.10.


> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>  meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb
> index 03fd6193..2daf86f9 100644
> --- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb
> +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb
> @@ -4,6 +4,6 @@ SUMMARY = "Mainline U-Boot for TI devices"
>  
>  PV = "2026.04"
>  
> -UBOOT_GIT_URI = "git://source.denx.de/u-boot/u-boot.git"
> +UBOOT_GIT_URI = "git://git.u-boot-project.org/u-boot/u-boot.git"
>  
>  SRCREV_uboot = "88dc2788777babfd6322fa655df549a019aa1e69"
> -- 
> 2.43.0

