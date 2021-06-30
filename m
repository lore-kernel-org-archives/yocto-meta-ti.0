Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.1456.1625079924238176230
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 30 Jun 2021 12:05:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8F5EC40C90;
	Wed, 30 Jun 2021 19:05:23 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8Sk4PfZL20lr; Wed, 30 Jun 2021 19:05:23 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 57F4D40C1E;
	Wed, 30 Jun 2021 19:05:18 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 1DB6917461F; Wed, 30 Jun 2021 15:05:18 -0400 (EDT)
Date: Wed, 30 Jun 2021 15:05:18 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: nm@ti.com
Cc: praneeth@ti.com, yogeshs@ti.com, denys@konsulko.com,
	Tom Rini <trini@konsulko.com>, meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] [dunfell PATCH] ti-sci-fw: Update linux firmware repo to 08.00.00.001
Message-ID: <20210630190518.GH1528@denix.org>
References: <20210630180128.13766-1-nm@ti.com>
MIME-Version: 1.0
In-Reply-To: <20210630180128.13766-1-nm@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 30, 2021 at 01:01:28PM -0500, Nishanth Menon via lists.yoctoproject.org wrote:
> Just updating imggen to a configuration compatible with latest firmware
> should not have been accepted, we should have ensured that firmware
> commit has moved correspondingly as well. Fix the same, else we get a
> broken system.
> 
> Fixes: 406f5998227e ("ti-sci-fw: Update imggen to release 08.00.00.001 tag")
> 
> Signed-off-by: Nishanth Menon <nm@ti.com>

Reviewed-by: Denys Dmytriyenko <denys@konsulko.com>


> ---
> 
> NOTE: NOTHING has gotten into master for the last 6 weeks, so I might as
> well not tag master - This is just going to creep back at us.
> 
>  recipes-bsp/ti-sci-fw/ti-sci-fw.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw.inc b/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
> index 9e22e461354d..966042820aac 100644
> --- a/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
> +++ b/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
> @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=b5aebf0668bdf95621259288c4a46d76"
>  
>  PV = "2021.05"
>  
> -SRCREV = "0468c7a78cd26f9190d374e198e37c63c7660ba9"
> +SRCREV = "1e73d9387980f4d425742738968e55395c19e26c"
>  BRANCH ?= "ti-linux-firmware"
>  SRCREV_imggen = "b65ae80847f5a0d1885ed6e4de4d9d635544053c"
>  SRCREV_FORMAT = "imggen"
> -- 
> 2.32.0
> 

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
