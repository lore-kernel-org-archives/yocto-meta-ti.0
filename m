Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.9325.1645507731052049586
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 21 Feb 2022 21:28:51 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 09A3D40C24;
	Tue, 22 Feb 2022 05:28:50 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5qCFJPSGvfv8; Tue, 22 Feb 2022 05:28:50 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E765940A28;
	Tue, 22 Feb 2022 05:28:48 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 2971017476C; Tue, 22 Feb 2022 00:28:48 -0500 (EST)
Date: Tue, 22 Feb 2022 00:28:48 -0500
From: "Denys Dmytriyenko" <denis@denix.org>
To: Khem Raj <raj.khem@gmail.com>
Cc: meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] [PATCH] layers: Bump to use kirkstone
Message-ID: <20220222052848.GO26229@denix.org>
References: <20220222022306.1390127-1-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20220222022306.1390127-1-raj.khem@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

NAK, this has already been part of a larger restructure and cleanup effort 
going on for a while - see recent patchsets on the list.


On Mon, Feb 21, 2022 at 06:23:06PM -0800, Khem Raj wrote:
> its not going to be backward ABI compatible with honister due to variable renaming.
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  conf/layer.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/conf/layer.conf b/conf/layer.conf
> index f399ff03..c3b39c59 100644
> --- a/conf/layer.conf
> +++ b/conf/layer.conf
> @@ -9,7 +9,7 @@ BBFILE_COLLECTIONS += "meta-ti"
>  BBFILE_PATTERN_meta-ti := "^${LAYERDIR}/"
>  BBFILE_PRIORITY_meta-ti = "6"
>  
> -LAYERSERIES_COMPAT_meta-ti = "honister"
> +LAYERSERIES_COMPAT_meta-ti = "kirkstone"
>  
>  LICENSE_PATH += "${LAYERDIR}/licenses"
