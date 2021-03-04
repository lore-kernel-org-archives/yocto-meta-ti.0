Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web10.1179.1614886340880531338
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 04 Mar 2021 11:32:21 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 198.145.29.25, mailfrom: denis@denix.org)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 7CC3E38C0845
	for <meta-ti@yoctoproject.org>; Thu,  4 Mar 2021 19:32:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id D363E40BEA;
	Thu,  4 Mar 2021 19:32:19 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P5uvxoVBBQTq; Thu,  4 Mar 2021 19:32:19 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B0F1440AB7;
	Thu,  4 Mar 2021 19:32:17 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 58E40174524; Thu,  4 Mar 2021 14:32:17 -0500 (EST)
Date: Thu, 4 Mar 2021 14:32:17 -0500
From: "Denys Dmytriyenko" <denis@denix.org>
To: nm@ti.com
Cc: "meta-ti @ yoctoproject . org" <meta-ti@yoctoproject.org>,
	"Bajjuri, Praneeth" <praneeth@ti.com>
Subject: Re: [meta-ti] [PATCH dunfell/dunfell-next/master 1/2] linux-ti-mainline: Bump up ti-upstream-tools SRCREV
Message-ID: <20210304193217.GH4892@denix.org>
References: <20210304042808.9389-1-nm@ti.com>
 <20210304042808.9389-2-nm@ti.com>
MIME-Version: 1.0
In-Reply-To: <20210304042808.9389-2-nm@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 03, 2021 at 10:28:07PM -0600, Nishanth Menon via lists.yoctoproject.org wrote:
> Bump up our recipe version for ti-upstream-tools for updates in config
> files needed for latest kernel
> 
> Signed-off-by: Nishanth Menon <nm@ti.com>

Reviewed-by: Denys Dmytriyenko <denis@denix.org>


> ---
>  recipes-kernel/linux/linux-ti-mainline_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-kernel/linux/linux-ti-mainline_git.bb b/recipes-kernel/linux/linux-ti-mainline_git.bb
> index 6159725aa5df..b4881d0d3a40 100644
> --- a/recipes-kernel/linux/linux-ti-mainline_git.bb
> +++ b/recipes-kernel/linux/linux-ti-mainline_git.bb
> @@ -31,7 +31,7 @@ SRC_URI += " \
>      file://defconfig \
>  "
>  
> -SRCREV_ti-upstream-tools = "3f36f66594d7905f7b97bc7870931173fd2466bd"
> +SRCREV_ti-upstream-tools = "d59b7471d99b806e3dc22342c8f42d5bb33f8cce"
>  SRCREV_FORMAT = "linux"
>  
>  KERNEL_DEVICETREE = ""
> -- 
> 2.25.1.377.g2d2118b814c1
