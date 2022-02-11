Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.3033.1644550894662782982
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 10 Feb 2022 19:41:35 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9948C40C6B;
	Fri, 11 Feb 2022 03:41:33 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Pfr67bbS5KMf; Fri, 11 Feb 2022 03:41:33 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 6707040BE9;
	Fri, 11 Feb 2022 03:41:29 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 6A069174747; Thu, 10 Feb 2022 22:41:28 -0500 (EST)
Date: Thu, 10 Feb 2022 22:41:28 -0500
From: "Denys Dmytriyenko" <denis@denix.org>
To: reatmon@ti.com
Cc: Yogesh Siraswar <yogeshs@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][dunfell][PATCH 1/3] linux-ti-staging: Bump to 08.02.00.001 release
Message-ID: <20220211034128.GE26229@denix.org>
References: <20220207153950.22274-1-reatmon@ti.com>
 <20220207153950.22274-2-reatmon@ti.com>
MIME-Version: 1.0
In-Reply-To: <20220207153950.22274-2-reatmon@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 07, 2022 at 09:39:48AM -0600, Ryan Eatmon via lists.yoctoproject.org wrote:
> Updated the linux version for 08.02.00.001
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>  recipes-kernel/linux/linux-ti-staging_5.10.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-kernel/linux/linux-ti-staging_5.10.bb b/recipes-kernel/linux/linux-ti-staging_5.10.bb
> index 3f3d50af..51083382 100644
> --- a/recipes-kernel/linux/linux-ti-staging_5.10.bb
> +++ b/recipes-kernel/linux/linux-ti-staging_5.10.bb
> @@ -23,7 +23,7 @@ S = "${WORKDIR}/git"
>  
>  BRANCH = "ti-linux-5.10.y"
>  
> -SRCREV = "dcc6bedb2c2bdb509709e4ae08303206e95ce6c2"
> +SRCREV = "a523aa26d870552a44c5f48b01c3c1ea3a48751a"
>  PV = "5.10.65+git${SRCPV}"

Why is it still versioned as 5.10.65? Quick glance at ti-linux-kernel shows 
it's been updating with the latest stable on a regular basis and the latest 
version now is 5.10.90, which is 25 minor releases ahead:

https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/tree/Makefile?h=ti-linux-5.10.y


>  # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
> -- 
> 2.17.1
> 
