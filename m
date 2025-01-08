Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D7D7E77188
	for <webhook@archiver.kernel.org>; Wed,  8 Jan 2025 18:24:23 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.27996.1736360653135109776
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 08 Jan 2025 10:24:13 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 0F4C040C6B;
	Wed,  8 Jan 2025 18:24:12 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tnsyUYVOf3qq; Wed,  8 Jan 2025 18:24:12 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E16AC40C2C;
	Wed,  8 Jan 2025 18:24:09 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 21D87164152; Wed,  8 Jan 2025 13:24:09 -0500 (EST)
Date: Wed, 8 Jan 2025 13:24:09 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Praneeth Bajjuri <praneeth@ti.com>, meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master/scarthgap][PATCH] ti-bsp: Change to 6.12 as
 the default
Message-ID: <20250108182409.GA21836@denix.org>
References: <20250108144108.26409-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250108144108.26409-1-reatmon@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 08 Jan 2025 18:24:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18167

On Wed, Jan 08, 2025 at 08:41:08AM -0600, Ryan Eatmon via lists.yoctoproject.org wrote:
> We are moving to 6.12 to be our new LTS, so we are switching the default
> BSP to that.  You can still access the 6.6 kernel if you need to by using
> the BSP system and setting TI_PREFERRED_BSP = "ti-6_6" in your
> local.conf.

Do you also need to drop DEFAULT_PREFERENCE = "-1" in corresponding recipes?


> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>  meta-ti-bsp/conf/machine/include/ti-bsp.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
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
> -- 
> 2.17.1

