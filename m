Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4FD5C77B6E
	for <webhook@archiver.kernel.org>; Wed, 12 Apr 2023 20:44:04 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.1101.1681332235826878485
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 12 Apr 2023 13:43:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E467D40C22;
	Wed, 12 Apr 2023 20:43:54 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eqhTjT_7Htu4; Wed, 12 Apr 2023 20:43:54 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id AF72740C21;
	Wed, 12 Apr 2023 20:43:50 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id B77F9163816; Wed, 12 Apr 2023 16:43:12 -0400 (EDT)
Date: Wed, 12 Apr 2023 16:43:12 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: afd@ti.com
Cc: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	Randolph Sapp <rs@ti.com>, meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master/kirkstone][PATCH v2 5/6] meta-ti-bsp: Remove
 SGX driver from SIGGEN_EXCLUDERECIPES_ABISAFE
Message-ID: <20230412204312.GJ9226@denix.org>
References: <20230412184242.29743-1-afd@ti.com>
 <20230412184242.29743-5-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230412184242.29743-5-afd@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 12 Apr 2023 20:44:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16383

On Wed, Apr 12, 2023 at 01:42:41PM -0500, Andrew Davis via lists.yoctoproject.org wrote:
> Neither of recipes nor their ABI is all that stable. OpenGL might be
> slightly more stable, but that is not what these provide anymore.
> Remove these.

This is not what you think it is... :) Actually, Rogue recipes should be added 
to the list.

This is specific to signatures/shared state. The ABI in this case is libgles 
and libegl (which are stable) and tells bitbake to avoid rebuilding generic 
apps depending on these packages between platfoms in the same architecture.


> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
>  meta-ti-bsp/conf/layer.conf | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/meta-ti-bsp/conf/layer.conf b/meta-ti-bsp/conf/layer.conf
> index 39e7f9eb..31eb9db8 100644
> --- a/meta-ti-bsp/conf/layer.conf
> +++ b/meta-ti-bsp/conf/layer.conf
> @@ -18,9 +18,4 @@ LAYERDEPENDS_meta-ti-bsp = " \
>      meta-arm \
>  "
>  
> -SIGGEN_EXCLUDERECIPES_ABISAFE += " \
> -    ti-sgx-ddk-km \
> -    ti-sgx-ddk-um \
> -"
> -
>  HOSTTOOLS_NONFATAL += "truncate xxd comm"
> -- 
> 2.39.2

