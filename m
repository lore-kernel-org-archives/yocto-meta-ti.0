Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web09.7912.1616731110979503734
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 25 Mar 2021 20:58:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 7799C40C82;
	Fri, 26 Mar 2021 03:58:30 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3sgEd6Es-QIb; Fri, 26 Mar 2021 03:58:30 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 5225B40952;
	Fri, 26 Mar 2021 03:58:27 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 1F731174566; Thu, 25 Mar 2021 23:58:27 -0400 (EDT)
Date: Thu, 25 Mar 2021 23:58:27 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: praneeth@ti.com
Cc: Lucas Weaver <l-weaver@ti.com>, meta-ti@lists.yoctoproject.org,
	denys@konsulko.com
Subject: Re: [meta-ti] [dunfell/master PATCH] conf/machine: fix OPTEEMACHINE name for J721e
Message-ID: <20210326035827.GV18041@denix.org>
References: <20210326034110.15713-1-praneeth@ti.com>
MIME-Version: 1.0
In-Reply-To: <20210326034110.15713-1-praneeth@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

ACK

On Thu, Mar 25, 2021 at 10:41:10PM -0500, praneeth via lists.yoctoproject.org wrote:
> From: Praneeth Bajjuri <praneeth@ti.com>
> 
> OPTEEMACHINE name as defined in the optee_os project [1] for
> j721e is k3-j721e.
> 
> This patch fixes the name to correct target.
> 
> [1]: https://github.com/OP-TEE/optee_os/commit/87613cf9520db2e65bc8367d3e13c4217c13bdad
> 
> Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
> ---
>  conf/machine/include/j7.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/conf/machine/include/j7.inc b/conf/machine/include/j7.inc
> index 7d326f4a..c187f299 100644
> --- a/conf/machine/include/j7.inc
> +++ b/conf/machine/include/j7.inc
> @@ -1,7 +1,7 @@
>  require conf/machine/include/k3.inc
>  SOC_FAMILY_append = ":j7"
>  
> -OPTEEMACHINE = "k3-j7"
> +OPTEEMACHINE = "k3-j721e"
>  OPTEEOUTPUTMACHINE = "k3"
>  
>  # Set the list of device targets for ti-pdk class recipes
> -- 
> 2.17.1
> 
