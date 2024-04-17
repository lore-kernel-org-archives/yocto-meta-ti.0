Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 038D4C4345F
	for <webhook@archiver.kernel.org>; Wed, 17 Apr 2024 18:55:25 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.22375.1713380123096099357
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 17 Apr 2024 11:55:23 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 76A3240C7B;
	Wed, 17 Apr 2024 18:55:22 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id itHuEQZOjhp8; Wed, 17 Apr 2024 18:55:22 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id DC22540A0B;
	Wed, 17 Apr 2024 18:55:18 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 94E85163F21; Wed, 17 Apr 2024 14:55:18 -0400 (EDT)
Date: Wed, 17 Apr 2024 14:55:18 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Praneeth Bajjuri <praneeth@ti.com>, meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master][PATCH v2 3/3] conf/layer.conf: Update
 LAYERSERIES_COMPAT
Message-ID: <20240417185518.GR28791@denix.org>
References: <20240417184031.17308-1-reatmon@ti.com>
 <20240417184031.17308-4-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240417184031.17308-4-reatmon@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 17 Apr 2024 18:55:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17589

On Wed, Apr 17, 2024 at 01:40:31PM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
> Update LAYERSERIES_COMPAT to remove EOL branches and add future styhead.
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>

Acked-by: Denys Dmytriyenko <denys@konsulko.com>


> ---
> v2: Add missing nanbield in meta-ti-extras/conf/layer.conf
> 
>  meta-ti-bsp/conf/layer.conf    | 2 +-
>  meta-ti-extras/conf/layer.conf | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-ti-bsp/conf/layer.conf b/meta-ti-bsp/conf/layer.conf
> index 502e355f..03cbd7ea 100644
> --- a/meta-ti-bsp/conf/layer.conf
> +++ b/meta-ti-bsp/conf/layer.conf
> @@ -9,7 +9,7 @@ BBFILE_COLLECTIONS += "meta-ti-bsp"
>  BBFILE_PATTERN_meta-ti-bsp := "^${LAYERDIR}/"
>  BBFILE_PRIORITY_meta-ti-bsp = "6"
>  
> -LAYERSERIES_COMPAT_meta-ti-bsp = "kirkstone langdale mickledore nanbield scarthgap"
> +LAYERSERIES_COMPAT_meta-ti-bsp = "nanbield scarthgap styhead"
>  
>  LICENSE_PATH += "${LAYERDIR}/licenses"
>  
> diff --git a/meta-ti-extras/conf/layer.conf b/meta-ti-extras/conf/layer.conf
> index a05dbe5f..f2d6b250 100644
> --- a/meta-ti-extras/conf/layer.conf
> +++ b/meta-ti-extras/conf/layer.conf
> @@ -9,7 +9,7 @@ BBFILE_COLLECTIONS += "meta-ti-extras"
>  BBFILE_PATTERN_meta-ti-extras := "^${LAYERDIR}/"
>  BBFILE_PRIORITY_meta-ti-extras = "6"
>  
> -LAYERSERIES_COMPAT_meta-ti-extras = "kirkstone langdale mickledore nanbield scarthgap"
> +LAYERSERIES_COMPAT_meta-ti-extras = "nanbield scarthgap styhead"
>  
>  LICENSE_PATH += "${LAYERDIR}/licenses"
>  
> -- 
> 2.17.1

