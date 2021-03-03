Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web08.19.1614795479779189340
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 03 Mar 2021 10:18:00 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 198.145.29.25, mailfrom: denis@denix.org)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 6EE7038C0625
	for <meta-ti@yoctoproject.org>; Wed,  3 Mar 2021 18:17:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6DDC640C3E;
	Wed,  3 Mar 2021 18:17:57 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XIWKuBFSjqmJ; Wed,  3 Mar 2021 18:17:57 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 1110A40C3A;
	Wed,  3 Mar 2021 18:17:50 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 60979174521; Wed,  3 Mar 2021 13:17:49 -0500 (EST)
Date: Wed, 3 Mar 2021 13:17:49 -0500
From: "Denys Dmytriyenko" <denis@denix.org>
To: nikhil.nd@ti.com
Cc: meta-ti@yoctoproject.org, praneeth@ti.com, lokeshvutla@ti.com,
	kishon@ti.com, nsekhar@ti.com, hnagalla@ti.com,
	saurabhnarang@ti.com
Subject: Re: [meta-ti][PATCH] recipes-bsp: wl18xx-fw: update SRCREV to latest
Message-ID: <20210303181749.GW4892@denix.org>
References: <20210303180917.12872-1-nikhil.nd@ti.com>
MIME-Version: 1.0
In-Reply-To: <20210303180917.12872-1-nikhil.nd@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 03, 2021 at 11:39:17PM +0530, Nikhil Devshatwar via lists.yoctoproject.org wrote:
> Update the wl18xx firmware recipe to latest version 8.9.0.0.86

Do you also need to update the version from 8.7.3 to 8.9.x?


> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> ---
>  recipes-bsp/wl18xx-fw/wl18xx-fw_8.7.3.bb | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/recipes-bsp/wl18xx-fw/wl18xx-fw_8.7.3.bb b/recipes-bsp/wl18xx-fw/wl18xx-fw_8.7.3.bb
> index a52ec898..50b6c297 100644
> --- a/recipes-bsp/wl18xx-fw/wl18xx-fw_8.7.3.bb
> +++ b/recipes-bsp/wl18xx-fw/wl18xx-fw_8.7.3.bb
> @@ -7,8 +7,7 @@ SRC_URI = " \
>  	file://0001-Add-Makefile-to-install-firmware-files.patch \
>  "
>  
> -# Tag: R8.7-SP3 (8.7.3)
> -SRCREV = "f659be25473e4bde8dc790bff703ecacde6e21da"
> +SRCREV = "5ec05007f2662f460f881c5868311fd3ab7e6e71"
>  BRANCH = "master"
>  
>  S = "${WORKDIR}/git"
> -- 
> 2.17.1

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
