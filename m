Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 649A9C46467
	for <webhook@archiver.kernel.org>; Wed, 11 Jan 2023 22:34:13 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.39352.1673476451785448894
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 11 Jan 2023 14:34:12 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id F1F1440C50;
	Wed, 11 Jan 2023 22:34:10 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BR9V4FozKhGO; Wed, 11 Jan 2023 22:34:10 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id CC114400CF;
	Wed, 11 Jan 2023 22:34:07 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id E0DD91636F4; Wed, 11 Jan 2023 17:33:49 -0500 (EST)
Date: Wed, 11 Jan 2023 17:33:49 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: rs@ti.com
Cc: reatmon@ti.com, denys@ti.com, meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] [dunfell][PATCH v2] ti-img-rogue-driver: AM62 Active
 power management
Message-ID: <20230111223349.GV22689@denix.org>
References: <20230111221434.2399898-1-rs@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230111221434.2399898-1-rs@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 11 Jan 2023 22:34:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15551

On Wed, Jan 11, 2023 at 04:14:34PM -0600, Randolph Sapp via lists.yoctoproject.org wrote:
> Bump source revision. Changelog from source:
>   - Cleanup the device initialization routine for all platforms
>   - Add a power safeguard for multicore initialization
>   - Enable active power management for AM62 devices
> 
> v2: This revision actually uses the correct commit hash. Not sure where
> I got the old one from.

Thanks, but patch revision changes are usually listed after the --- cut line 
below to not get into the commit log history.


> Signed-off-by: Randolph Sapp <rs@ti.com>
> ---

Here.


>  recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb b/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb
> index 94a7f220..9a5bc479 100644
> --- a/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb
> +++ b/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb
> @@ -26,7 +26,7 @@ SRC_URI = " \
>  
>  S = "${WORKDIR}/git"
>  
> -SRCREV = "c901804e8221d477983a6f7224a9cdc6e832f050"
> +SRCREV = "1dd6291a5cad4f2b909fc2a14bd717a3bc5f0bb2"
>  
>  TARGET_PRODUCT_j7-evm = "j721e_linux"
>  TARGET_PRODUCT_j7-hs-evm = "j721e_linux"
> -- 
> 2.34.1

