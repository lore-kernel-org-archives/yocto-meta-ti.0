Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5ADEC7EE23
	for <webhook@archiver.kernel.org>; Thu,  1 Jun 2023 19:26:48 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.1833.1685647602640677038
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 01 Jun 2023 12:26:43 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 7489640C93;
	Thu,  1 Jun 2023 19:26:41 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5_V2Kv2iBa77; Thu,  1 Jun 2023 19:26:41 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 43C9040C37;
	Thu,  1 Jun 2023 19:26:37 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 3BAF3163940; Thu,  1 Jun 2023 15:25:50 -0400 (EDT)
Date: Thu, 1 Jun 2023 15:25:50 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Bryan Brattlof <bb@ti.com>
Cc: Ryan Eatmon <reatmon@ti.com>, Andrew Davis <afd@ti.com>,
	Meta-TI <meta-ti@lists.yoctoproject.org>, Res Sapp <rs@ti.com>
Subject: Re: [meta-ti kirkstone/master PATCH] ti-kernel: Apply RT config
 fragments to RT kernel defconfig
Message-ID: <20230601192550.GL9226@denix.org>
References: <20230601185739.2862707-1-bb@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230601185739.2862707-1-bb@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 01 Jun 2023 19:26:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16647

On Thu, Jun 01, 2023 at 01:57:39PM -0500, Bryan Brattlof wrote:
> For the v6.1 LTS kernel, we (TI) have moved to using defconfig fragments
> to build the different kernel configurations.

FWIW, config fragments have been in use for many years...

Otherwise LGTM.


> To properly build a kernel
> with full preemption support, add the ti_arm64_rt.config to the
> linux-ti-staging-rt-6.1/k3/defconfig
> 
> Signed-off-by: Bryan Brattlof <bb@ti.com>
> ---
>  .../recipes-kernel/linux/linux-ti-staging-rt-6.1/k3/defconfig   | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.1/k3/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.1/k3/defconfig
> index ef1d3efd50118..54dc86b407c7c 100644
> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.1/k3/defconfig
> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.1/k3/defconfig
> @@ -1,2 +1,2 @@
>  use-kernel-config=defconfig
> -config-fragment=kernel/configs/ti_arm64_prune.config
> +config-fragment=kernel/configs/ti_arm64_prune.config kernel/configs/ti_arm64_rt.config
> 
> base-commit: 8fa9ec7dcd2e816cee18aaf7e8947b3eaee9923c
> -- 
> 2.40.1
> 

