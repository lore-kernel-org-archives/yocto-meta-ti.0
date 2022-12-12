Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AADBC4167B
	for <webhook@archiver.kernel.org>; Mon, 12 Dec 2022 22:11:43 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.57837.1670883099488062253
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 12 Dec 2022 14:11:39 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 7CD3740BA9;
	Mon, 12 Dec 2022 22:11:38 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qe3n0KnIVkXw; Mon, 12 Dec 2022 22:11:38 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 4899940A3F;
	Mon, 12 Dec 2022 22:11:35 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 1C2251636AE; Mon, 12 Dec 2022 17:11:25 -0500 (EST)
Date: Mon, 12 Dec 2022 17:11:25 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: afd@ti.com
Cc: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master/kirkstone][PATCH 1/7] conf: machine: Remove
 multi-certificate image comment
Message-ID: <20221212221125.GI22689@denix.org>
References: <20221207214312.21735-1-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221207214312.21735-1-afd@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 12 Dec 2022 22:11:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15456

Finally was able to spend some time reviewing this patchset - see comments to 
individual patches.


On Wed, Dec 07, 2022 at 03:43:06PM -0600, Andrew Davis via lists.yoctoproject.org wrote:
> Multi-cert is already now the default, no need to add a comment on that.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
>  meta-ti-bsp/conf/machine/include/j7.inc | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/meta-ti-bsp/conf/machine/include/j7.inc b/meta-ti-bsp/conf/machine/include/j7.inc
> index 4ea3a5d8..cf4cc440 100644
> --- a/meta-ti-bsp/conf/machine/include/j7.inc
> +++ b/meta-ti-bsp/conf/machine/include/j7.inc
> @@ -3,5 +3,3 @@ SOC_FAMILY:append = ":j7"
>  
>  OPTEEMACHINE = "k3-j721e"
>  OPTEEOUTPUTMACHINE = "k3"
> -
> -# Use default IMAGE_BOOT_FILES_LEGACY files
> -- 
> 2.38.1

