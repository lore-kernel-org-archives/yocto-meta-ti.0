Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2806FF6E95
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 22:41:12 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1852.1773787260644211671
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 17 Mar 2026 15:41:01 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E9F6440C3A;
	Tue, 17 Mar 2026 22:40:59 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e1no94nk-Vr9; Tue, 17 Mar 2026 22:40:59 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B099840A20;
	Tue, 17 Mar 2026 22:40:56 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 6A60D17A3DB; Tue, 17 Mar 2026 18:40:56 -0400 (EDT)
Date: Tue, 17 Mar 2026 18:40:56 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master][PATCH] layer.conf: Update the layers to
 support wrynose
Message-ID: <20260317224056.GI11121@denix.org>
References: <20260317223608.1973962-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260317223608.1973962-1-reatmon@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 17 Mar 2026 22:41:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19753

Ack

On Tue, Mar 17, 2026 at 05:36:08PM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>  meta-beagle/conf/layer.conf    | 2 +-
>  meta-ti-bsp/conf/layer.conf    | 2 +-
>  meta-ti-extras/conf/layer.conf | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/meta-beagle/conf/layer.conf b/meta-beagle/conf/layer.conf
> index 87a12268..5ef549d9 100644
> --- a/meta-beagle/conf/layer.conf
> +++ b/meta-beagle/conf/layer.conf
> @@ -8,7 +8,7 @@ BBFILE_COLLECTIONS += "meta-beagle"
>  BBFILE_PATTERN_meta-beagle := "^${LAYERDIR}/"
>  BBFILE_PRIORITY_meta-beagle = "6"
>  
> -LAYERSERIES_COMPAT_meta-beagle = "whinlatter"
> +LAYERSERIES_COMPAT_meta-beagle = "whinlatter wrynose"
>  
>  LAYERDEPENDS_meta-beagle = " \
>      meta-ti-bsp \
> diff --git a/meta-ti-bsp/conf/layer.conf b/meta-ti-bsp/conf/layer.conf
> index f78da573..86744b2f 100644
> --- a/meta-ti-bsp/conf/layer.conf
> +++ b/meta-ti-bsp/conf/layer.conf
> @@ -9,7 +9,7 @@ BBFILE_COLLECTIONS += "meta-ti-bsp"
>  BBFILE_PATTERN_meta-ti-bsp := "^${LAYERDIR}/"
>  BBFILE_PRIORITY_meta-ti-bsp = "6"
>  
> -LAYERSERIES_COMPAT_meta-ti-bsp = "whinlatter"
> +LAYERSERIES_COMPAT_meta-ti-bsp = "whinlatter wrynose"
>  
>  LICENSE_PATH += "${LAYERDIR}/licenses"
>  
> diff --git a/meta-ti-extras/conf/layer.conf b/meta-ti-extras/conf/layer.conf
> index af82e95b..23d54095 100644
> --- a/meta-ti-extras/conf/layer.conf
> +++ b/meta-ti-extras/conf/layer.conf
> @@ -9,7 +9,7 @@ BBFILE_COLLECTIONS += "meta-ti-extras"
>  BBFILE_PATTERN_meta-ti-extras := "^${LAYERDIR}/"
>  BBFILE_PRIORITY_meta-ti-extras = "6"
>  
> -LAYERSERIES_COMPAT_meta-ti-extras = "whinlatter"
> +LAYERSERIES_COMPAT_meta-ti-extras = "whinlatter wrynose"
>  
>  LICENSE_PATH += "${LAYERDIR}/licenses"
>  
> -- 
> 2.43.0

