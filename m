Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.5739.1636419535471137626
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 08 Nov 2021 16:58:55 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 90F8840C16;
	Tue,  9 Nov 2021 00:58:53 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y89yts9PI1Lv; Tue,  9 Nov 2021 00:58:53 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 46FD940952;
	Tue,  9 Nov 2021 00:58:48 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 9486A1746B8; Mon,  8 Nov 2021 19:58:47 -0500 (EST)
Date: Mon, 8 Nov 2021 19:58:47 -0500
From: "Denys Dmytriyenko" <denis@denix.org>
To: Amjad Ouled-Ameur <aouledameur@baylibre.com>
Cc: meta-ti@lists.yoctoproject.org, khilman@baylibre.com,
	dfustini@baylibre.com, denys@konsulko.com, praneeth@ti.com
Subject: Re: [meta-ti] [PATCH] recipes-bsp: u-boot-ti-mainline: Update to v2021.10 release
Message-ID: <20211109005847.GI10132@denix.org>
References: <20211108233741.34788-1-aouledameur@baylibre.com>
MIME-Version: 1.0
In-Reply-To: <20211108233741.34788-1-aouledameur@baylibre.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 08, 2021 at 11:37:41PM +0000, Amjad Ouled-Ameur wrote:
> This introduces a critical fix for both AM335X EVM and AM43XX EVM, which
> can no longer boot because "uuid" is undefined.
> 
> v2021.10 has these two fixes, one for each platform:
> - commit ff8f277e9121 ("ti: am335x_evm: Switch to DISTRO_BOOT only")
> - commit e0c91ae24e5b ("ti: am43xx_evm: Switch to DISTRO_BOOT only")
> 
> Signed-off-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>

Reviewed-by: Denys Dmytriyenko <denys@konsulko.com>


> ---
>  recipes-bsp/u-boot/u-boot-ti-mainline_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb b/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb
> index 2db9899609d0..76aaa4b24ac0 100644
> --- a/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb
> +++ b/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb
> @@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://Licenses/README;md5=5a7450c57ffe5ae63fd732446b988025"
>  
>  PR = "r0"
>  
> -PV = "2021.07"
> +PV = "2021.10"
>  
>  # For the un-initiated:
>  # The actual URL you'd use with a git clone for example would be:
> @@ -15,4 +15,4 @@ PV = "2021.07"
>  # b) and we want git fetcher to use https protocol, hence GIT_PROTOCOL as https
>  UBOOT_GIT_URI = "git://source.denx.de/u-boot/u-boot.git"
>  UBOOT_GIT_PROTOCOL = "https"
> -SRCREV = "840658b093976390e9537724f802281c9c8439f5"
> +SRCREV = "d80bb749fab53da72c4a0e09b8c2d2aaa3103c91"
> -- 
> 2.17.1
