Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.1152.1614886382457253983
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 04 Mar 2021 11:33:02 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 198.145.29.25, mailfrom: denis@denix.org)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 24A7B38C0845
	for <meta-ti@yoctoproject.org>; Thu,  4 Mar 2021 19:33:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9AE7D40BEA;
	Thu,  4 Mar 2021 19:33:01 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j-cWcidsuLV3; Thu,  4 Mar 2021 19:33:01 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 79B6340AB7;
	Thu,  4 Mar 2021 19:32:59 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 4751C174524; Thu,  4 Mar 2021 14:32:59 -0500 (EST)
Date: Thu, 4 Mar 2021 14:32:59 -0500
From: "Denys Dmytriyenko" <denis@denix.org>
To: Nishanth Menon <nm@ti.com>
Cc: "meta-ti @ yoctoproject . org" <meta-ti@yoctoproject.org>,
	"Bajjuri, Praneeth" <praneeth@ti.com>
Subject: Re: [PATCH dunfell/dunfell-next/master 2/2] linux-ti-mainline: Bump kernel version to v5.11
Message-ID: <20210304193259.GI4892@denix.org>
References: <20210304042808.9389-1-nm@ti.com>
 <20210304042808.9389-3-nm@ti.com>
MIME-Version: 1.0
In-Reply-To: <20210304042808.9389-3-nm@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 03, 2021 at 10:28:08PM -0600, Nishanth Menon wrote:
> And lets work with the latest kernel
> 
> Signed-off-by: Nishanth Menon <nm@ti.com>

Reviewed-by: Denys Dmytriyenko <denis@denix.org>


> ---
>  recipes-kernel/linux/linux-ti-mainline_git.bb | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/recipes-kernel/linux/linux-ti-mainline_git.bb b/recipes-kernel/linux/linux-ti-mainline_git.bb
> index b4881d0d3a40..ed7607046186 100644
> --- a/recipes-kernel/linux/linux-ti-mainline_git.bb
> +++ b/recipes-kernel/linux/linux-ti-mainline_git.bb
> @@ -15,9 +15,9 @@ S = "${WORKDIR}/git"
>  
>  BRANCH = "master"
>  
> -# 5.9 Mainline version
> -SRCREV = "bbf5c979011a099af5dc76498918ed7df445635b"
> -PV = "5.9+git${SRCPV}"
> +# 5.11 Mainline version
> +SRCREV = "f40ddce88593482919761f74910f42f4b84c004b"
> +PV = "5.11+git${SRCPV}"
>  
>  # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
>  MACHINE_KERNEL_PR_append = "a"
> -- 
> 2.25.1.377.g2d2118b814c1
