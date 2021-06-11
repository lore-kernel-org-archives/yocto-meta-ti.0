Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.2015.1623370840048961522
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 10 Jun 2021 17:20:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 0D12D40C7B;
	Fri, 11 Jun 2021 00:20:39 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rEOCjPakUmov; Fri, 11 Jun 2021 00:20:39 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id D5D9F40BFF;
	Fri, 11 Jun 2021 00:20:35 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 32C25174603; Thu, 10 Jun 2021 20:20:35 -0400 (EDT)
Date: Thu, 10 Jun 2021 20:20:35 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: praneeth@ti.com
Cc: Yogesh Siraswar <yogeshs@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] [dunfell/master PATCH] ti-sci-fw: Update image gen to latest
Message-ID: <20210611002035.GY1528@denix.org>
References: <20210610225710.1259-1-praneeth@ti.com>
 <20210610225710.1259-2-praneeth@ti.com>
MIME-Version: 1.0
In-Reply-To: <20210610225710.1259-2-praneeth@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 10, 2021 at 05:57:10PM -0500, praneeth via lists.yoctoproject.org wrote:
> From: Praneeth Bajjuri <praneeth@ti.com>
> 
> update image get to latest.

Typo - image get?


> This commit also picks AM64x boot critical fix.
> commit e411dc16862b ("soc: am64x: Makefile: Move the SPL Load address to 0x70000000")
> 
> Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
> ---
>  recipes-bsp/ti-sci-fw/ti-sci-fw.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw.inc b/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
> index 72430ab6..dbf63ef5 100644
> --- a/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
> +++ b/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
> @@ -7,7 +7,7 @@ PV = "2021.01a"
>  
>  SRCREV = "34062b5670aac524ce3074b184ef2ef62daafca0"
>  BRANCH ?= "ti-linux-firmware"
> -SRCREV_imggen = "7b6f3832af6d334d335309d66d206ab829765c0e"
> +SRCREV_imggen = "e411dc16862b5bb2d8befb12496b03d7b01c87b2"
>  SRCREV_FORMAT = "imggen"
>  
>  SRC_URI = " \
> -- 
> 2.17.1
> 
