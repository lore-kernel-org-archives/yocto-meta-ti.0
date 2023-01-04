Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB0DEC46467
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 20:03:43 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.1246.1672862616334306161
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 04 Jan 2023 12:03:36 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4A2AE40AC9;
	Wed,  4 Jan 2023 20:03:35 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ybCrYCKDCJOK; Wed,  4 Jan 2023 20:03:35 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 2712040027;
	Wed,  4 Jan 2023 20:03:34 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id D14A71636B8; Wed,  4 Jan 2023 15:03:17 -0500 (EST)
Date: Wed, 4 Jan 2023 15:03:17 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Khem Raj <raj.khem@gmail.com>
Cc: meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] [PATCH] layer.conf: Update LAYERSERIES_COMPAT for
 mickledore
Message-ID: <20230104200317.GH22689@denix.org>
References: <20230103183607.1256069-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230103183607.1256069-1-raj.khem@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 04 Jan 2023 20:03:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15524

I see that meta-arm lists both langdale and mickledore as compatible and I 
don't believe meta-ti will have any issues doing the same...


On Tue, Jan 03, 2023 at 10:36:07AM -0800, Khem Raj wrote:
> oe-core switched to mickedore [1]
> 
> [1] https://git.openembedded.org/openembedded-core/commit/?id=57239d66b933c4313cf331d35d13ec2d0661c38f
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta-ti-bsp/conf/layer.conf    | 2 +-
>  meta-ti-extras/conf/layer.conf | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-ti-bsp/conf/layer.conf b/meta-ti-bsp/conf/layer.conf
> index 39e7f9eb..f3d43eee 100644
> --- a/meta-ti-bsp/conf/layer.conf
> +++ b/meta-ti-bsp/conf/layer.conf
> @@ -9,7 +9,7 @@ BBFILE_COLLECTIONS += "meta-ti-bsp"
>  BBFILE_PATTERN_meta-ti-bsp := "^${LAYERDIR}/"
>  BBFILE_PRIORITY_meta-ti-bsp = "6"
>  
> -LAYERSERIES_COMPAT_meta-ti-bsp = "kirkstone langdale"
> +LAYERSERIES_COMPAT_meta-ti-bsp = "mickledore"
>  
>  LICENSE_PATH += "${LAYERDIR}/licenses"
>  
> diff --git a/meta-ti-extras/conf/layer.conf b/meta-ti-extras/conf/layer.conf
> index b42c1a6a..cbe9d83a 100644
> --- a/meta-ti-extras/conf/layer.conf
> +++ b/meta-ti-extras/conf/layer.conf
> @@ -9,7 +9,7 @@ BBFILE_COLLECTIONS += "meta-ti-extras"
>  BBFILE_PATTERN_meta-ti-extras := "^${LAYERDIR}/"
>  BBFILE_PRIORITY_meta-ti-extras = "6"
>  
> -LAYERSERIES_COMPAT_meta-ti-extras = "kirkstone langdale"
> +LAYERSERIES_COMPAT_meta-ti-extras = "mickledore"
>  
>  LICENSE_PATH += "${LAYERDIR}/licenses"
>  
> -- 
> 2.39.0

