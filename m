Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.2997.1616185874913940268
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 19 Mar 2021 13:31:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 277C640BA9;
	Fri, 19 Mar 2021 20:31:14 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UKuVjmEqIpNp; Fri, 19 Mar 2021 20:31:14 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 0F0DD40BA7;
	Fri, 19 Mar 2021 20:31:13 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id C4F75174558; Fri, 19 Mar 2021 16:31:12 -0400 (EDT)
Date: Fri, 19 Mar 2021 16:31:12 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Praneeth Bajjuri <praneeth@ti.com>
Cc: meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] [master][PATCH] layer.conf: add hardknott to compatible release branches
Message-ID: <20210319203112.GE18041@denix.org>
References: <166DD7328409F7DB.26345@lists.yoctoproject.org>
MIME-Version: 1.0
In-Reply-To: <166DD7328409F7DB.26345@lists.yoctoproject.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Praneeth,

When merging, please make sure the correct patch goes to correct branch, 
as indicated in the subject tag - this one is for master and the other 
for dunfell. Best time to merge them is when you don't have anything 
pending in -next. So, instead of cherry-picking between branches, just 
merge different patches. Thanks!


On Fri, Mar 19, 2021 at 04:07:19PM -0400, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@konsulko.com>
> 
> While at it, remove old releases before dunfell.
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> ---
>  conf/layer.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/conf/layer.conf b/conf/layer.conf
> index 2393e61..3bed9fc 100644
> --- a/conf/layer.conf
> +++ b/conf/layer.conf
> @@ -8,7 +8,7 @@ BBFILE_COLLECTIONS += "meta-ti"
>  BBFILE_PATTERN_meta-ti := "^${LAYERDIR}/"
>  BBFILE_PRIORITY_meta-ti = "6"
>  
> -LAYERSERIES_COMPAT_meta-ti = "sumo thud warrior zeus dunfell gatesgarth"
> +LAYERSERIES_COMPAT_meta-ti = "dunfell gatesgarth hardknott"
>  
>  LICENSE_PATH += "${LAYERDIR}/licenses"
>  
> -- 
> 2.7.4

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
