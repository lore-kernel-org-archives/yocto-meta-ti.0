Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.3276.1616824427314069726
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 26 Mar 2021 22:53:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 198.145.29.25, mailfrom: denis@denix.org)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 0E0A438C0523
	for <meta-ti@yoctoproject.org>; Sat, 27 Mar 2021 05:53:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 32EFB40C2A;
	Sat, 27 Mar 2021 05:53:46 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xnqBZyxR12NT; Sat, 27 Mar 2021 05:53:46 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 0663B40AB7;
	Sat, 27 Mar 2021 05:53:42 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 5EE34174568; Sat, 27 Mar 2021 01:53:42 -0400 (EDT)
Date: Sat, 27 Mar 2021 01:53:42 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: g-tammana@ti.com
Cc: meta-ti@yoctoproject.org, Praneeth Bajjuri <praneeth@ti.com>,
	denys@konsulko.com
Subject: Re: [meta-ti][dunfell/master][PATCH] ti-img-rogue-umlibs: Update to pick rpath fixes
Message-ID: <20210327055342.GZ18041@denix.org>
References: <20210323230709.9607-1-g-tammana@ti.com>
MIME-Version: 1.0
In-Reply-To: <20210323230709.9607-1-g-tammana@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 23, 2021 at 06:07:09PM -0500, Gowtham Tammana via lists.yoctoproject.org wrote:
> Update srcrev to pick the rpath warning fixes.
> 
> Signed-off-by: Gowtham Tammana <g-tammana@ti.com>

Tested-by: Denys Dmytriyenko <denys@konsulko.com>

Praneeth,

Has this been picked up yet? Especially needed for the master, where it's no 
longer a warning, but an error.


> ---
>  recipes-graphics/libgles/ti-img-rogue-umlibs_1.13.5776728.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes-graphics/libgles/ti-img-rogue-umlibs_1.13.5776728.bb b/recipes-graphics/libgles/ti-img-rogue-umlibs_1.13.5776728.bb
> index d8fae3dd..dafb9dd8 100644
> --- a/recipes-graphics/libgles/ti-img-rogue-umlibs_1.13.5776728.bb
> +++ b/recipes-graphics/libgles/ti-img-rogue-umlibs_1.13.5776728.bb
> @@ -10,13 +10,13 @@ REQUIRED_MACHINE_FEATURES = "gpu"
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  COMPATIBLE_MACHINE = "j7"
>  
> -PR = "r1"
> +PR = "r2"
>  
>  BRANCH = "linuxws/dunfell/k5.4/${PV}"
>  
>  SRC_URI = "git://git.ti.com/graphics/ti-img-rogue-umlibs.git;branch=${BRANCH}"
>  
> -SRCREV = "3c4cabc8df10a066569e5f959cbbd4c0ce9961cd"
> +SRCREV = "5ef38353c38d921a65ea6df75c7b6ce710b66034"
>  
>  PVR_SOC ?= "j721e_linux"
>  PVR_BUILD ?= "release"
> -- 
> 2.31.0
> 
