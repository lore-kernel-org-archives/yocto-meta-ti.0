Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D522FC83F26
	for <webhook@archiver.kernel.org>; Thu, 24 Jul 2025 21:53:00 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.5625.1753393979391545064
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 24 Jul 2025 14:53:00 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 875C040C3E;
	Thu, 24 Jul 2025 21:52:58 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d5oV-mcMMFiJ; Thu, 24 Jul 2025 21:52:58 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 5209140C06;
	Thu, 24 Jul 2025 21:52:55 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 79C5116CCD9; Thu, 24 Jul 2025 17:52:54 -0400 (EDT)
Date: Thu, 24 Jul 2025 17:52:54 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][scarthgap][PATCH 1/3] conf: machine: am64xx: Cleanup
 assignment whitespace
Message-ID: <20250724215254.GI24899@denix.org>
References: <20250723211613.16164-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250723211613.16164-1-reatmon@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 24 Jul 2025 21:53:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18823

Is this change scarthgap specific? I see the change that originally added 
TI_WKS_BOOTLOADER_APPEND to scarthgap is now being forward-ported to master, 
thus this fix appears to also be applicable to master?


On Wed, Jul 23, 2025 at 04:16:11PM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
> A recent change in bitbake requires that all variable assignments have
> whitespace between the variable, the operator and the value.
> 
> FOO = "1"
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>  meta-ti-bsp/conf/machine/include/am64xx.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-ti-bsp/conf/machine/include/am64xx.inc b/meta-ti-bsp/conf/machine/include/am64xx.inc
> index 56b56afe..27165547 100644
> --- a/meta-ti-bsp/conf/machine/include/am64xx.inc
> +++ b/meta-ti-bsp/conf/machine/include/am64xx.inc
> @@ -35,4 +35,4 @@ OPTEEMACHINE = "k3-am64x"
>  
>  MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "prueth-fw pruhsr-fw prusw-fw"
>  
> -TI_WKS_BOOTLOADER_APPEND="console=ttyS2,115200n8"
> +TI_WKS_BOOTLOADER_APPEND = "console=ttyS2,115200n8"
> -- 
> 2.17.1

