Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B57EDC77B7C
	for <webhook@archiver.kernel.org>; Sat,  6 May 2023 01:41:22 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.14497.1683337273068115420
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 05 May 2023 18:41:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 1325340C61;
	Sat,  6 May 2023 01:41:12 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m0o7x2Y-iQ2A; Sat,  6 May 2023 01:41:12 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B3F1840A3D;
	Sat,  6 May 2023 01:41:04 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 8B4E51638C9; Fri,  5 May 2023 21:40:21 -0400 (EDT)
Date: Fri, 5 May 2023 21:40:21 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: a-bhatia1@ti.com
Cc: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
	Meta-TI List <meta-ti@lists.yoctoproject.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Paresh Bhagat <p-bhagat@ti.com>,
	Sai Sree Kartheek Adivi <s-adivi@ti.com>,
	Gyan Gupta <g-gupta@ti.com>
Subject: Re: [meta-ti] [kirkstone-next][PATCH] meta-ti: conf:
 am62xx-lp-evm: Fix DT and DT prefixes
Message-ID: <20230506014021.GI9226@denix.org>
References: <20230505083824.27085-1-a-bhatia1@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230505083824.27085-1-a-bhatia1@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sat, 06 May 2023 01:41:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16489

Couple minor comments regarding the subject tags:

1. You want to specify the target release branch, such as "kirkstone", not the 
intermediate branches, like "*-wip" or "*-next".

2. We want to keep master up-to-date and in most cases the change is quite 
straightforward and applies to both master and kirkstone, so it's best to 
specify that in the tag as "master/kirkstone". And testing against those 
branches is highly recommended! :)


On Fri, May 05, 2023 at 02:08:24PM +0530, Aradhya Bhatia via lists.yoctoproject.org wrote:
> The DT name k3-am62-lp-sk.dts was adopted instead of k3-am62x-lp-sk.dts
> because the community prefers avoiding the wildcard letter 'x'.[1]
> 
> Drop the letter 'x' from the strings in KERNEL_DEVICETREE_PREFIX and
> KERNEL_DEVICETREE to accurately reflect the DT names.
> 
> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
> 
> [1]:
> https://lore.kernel.org/all/06cbcd7d-bc83-bfeb-0821-72c7caf9a5e7@linaro.org/
> ---
>  meta-ti-bsp/conf/machine/am62xx-lp-evm.conf | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf b/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
> index ba1a12a7fdb7..ce306a2a0e17 100644
> --- a/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
> +++ b/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
> @@ -5,12 +5,12 @@
>  require conf/machine/include/am62xx-lp.inc
>  
>  KERNEL_DEVICETREE_PREFIX = " \
> -    ti/k3-am62x-lp \
> +    ti/k3-am62-lp \
>      ti/k3-am625-sk \
>  "
>  
>  KERNEL_DEVICETREE = " \
> -    ti/k3-am62x-lp-sk.dtb \
> +    ti/k3-am62-lp-sk.dtb \
>  "
>  
>  SPL_BINARY = "tispl.bin_HS"
> -- 
> 2.40.1

