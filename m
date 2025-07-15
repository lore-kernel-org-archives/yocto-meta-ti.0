Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8250FC83F22
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 18:11:39 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.2111.1752603088995768889
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 15 Jul 2025 11:11:29 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id EE82540CA8;
	Tue, 15 Jul 2025 18:11:27 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2SD-ftewY0_m; Tue, 15 Jul 2025 18:11:27 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id AC4A540A2F;
	Tue, 15 Jul 2025 18:11:23 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id CD89216BEF3; Tue, 15 Jul 2025 14:11:22 -0400 (EDT)
Date: Tue, 15 Jul 2025 14:11:22 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>, afd@ti.com,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master][PATCH] ti-kernel-fitimage: Add ti-secdev
Message-ID: <20250715181122.GF24899@denix.org>
References: <20250715175445.28647-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250715175445.28647-1-reatmon@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 15 Jul 2025 18:11:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18789

On Tue, Jul 15, 2025 at 12:54:45PM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
> In order to turn the fitImage signing back on, we need to inherit the
> ti-secdev class to setup all of the needed signing variables.

+ Andrew

I don't believe we need ti-secdev in the main kernel recipe any more now that 
fitImage got split out into its own recipe...

So this patch should rather be "move" ti-secdev instead of "add"?


> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>  meta-ti-bsp/recipes-kernel/linux/ti-kernel-fitimage.bb | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/meta-ti-bsp/recipes-kernel/linux/ti-kernel-fitimage.bb b/meta-ti-bsp/recipes-kernel/linux/ti-kernel-fitimage.bb
> index dae76387..a5e6a280 100644
> --- a/meta-ti-bsp/recipes-kernel/linux/ti-kernel-fitimage.bb
> +++ b/meta-ti-bsp/recipes-kernel/linux/ti-kernel-fitimage.bb
> @@ -3,6 +3,8 @@ FIT_CONF_PREFIX ?= "conf-ti_"
>  
>  require recipes-kernel/linux/linux-yocto-fitimage.bb
>  
> +inherit ti-secdev
> +
>  include ${@ 'recipes-kernel/linux/ti-kernel-devicetree-prefix.inc' if d.getVar('KERNEL_DEVICETREE_PREFIX') else ''}
>  
>  do_compile[depends] += "virtual/kernel:do_shared_workdir"
> -- 
> 2.17.1

