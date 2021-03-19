Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.2409.1616183454396292716
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 19 Mar 2021 12:50:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9770340BA9;
	Fri, 19 Mar 2021 19:50:53 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id klnAIc48C99k; Fri, 19 Mar 2021 19:50:53 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 7F1D3409E0;
	Fri, 19 Mar 2021 19:50:52 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 40DAD174558; Fri, 19 Mar 2021 15:50:52 -0400 (EDT)
Date: Fri, 19 Mar 2021 15:50:52 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Khem Raj <raj.khem@gmail.com>
Cc: meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] [PATCH] layer.conf: add hardknott to compatible release branches
Message-ID: <20210319195052.GB18041@denix.org>
References: <20210318061816.1562693-1-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210318061816.1562693-1-raj.khem@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 17, 2021 at 11:18:16PM -0700, Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  conf/layer.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/conf/layer.conf b/conf/layer.conf
> index 2393e61a..6fb214c6 100644
> --- a/conf/layer.conf
> +++ b/conf/layer.conf
> @@ -8,7 +8,7 @@ BBFILE_COLLECTIONS += "meta-ti"
>  BBFILE_PATTERN_meta-ti := "^${LAYERDIR}/"
>  BBFILE_PRIORITY_meta-ti = "6"
>  
> -LAYERSERIES_COMPAT_meta-ti = "sumo thud warrior zeus dunfell gatesgarth"
> +LAYERSERIES_COMPAT_meta-ti = "sumo thud warrior zeus dunfell gatesgarth hardknott"

This should probably be cleaned to list the correct compatible releases...


>  LICENSE_PATH += "${LAYERDIR}/licenses"
>  
> -- 
> 2.31.0
> 

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
