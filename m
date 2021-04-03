Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web09.26176.1617416376684922648
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 02 Apr 2021 19:19:37 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 17ACA40C2A
	for <meta-ti@lists.yoctoproject.org>; Sat,  3 Apr 2021 02:19:36 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZkyoRaMBbkzo for <meta-ti@lists.yoctoproject.org>;
	Sat,  3 Apr 2021 02:19:36 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 06CE440429
	for <meta-ti@lists.yoctoproject.org>; Sat,  3 Apr 2021 02:19:35 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id BF37A174597; Fri,  2 Apr 2021 22:19:35 -0400 (EDT)
Date: Fri, 2 Apr 2021 22:19:35 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: Re: [dunfell/master][PATCH] common-csl-ip-rtos: drop unnecessary dependency on ti-sysbios
Message-ID: <20210403021935.GZ23013@denix.org>
References: <1615611147-28437-1-git-send-email-denis@denix.org>
MIME-Version: 1.0
In-Reply-To: <1615611147-28437-1-git-send-email-denis@denix.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I see this hasn't been merged, nor got any comments. W/o patchwork access I 
won't be able to keep track of all the patches sent and applied...


On Fri, Mar 12, 2021 at 11:52:27PM -0500, Denys Dmytriyenko wrote:
> It appears common-csl-ip-rtos does not require ti-sysbios dependency to build,
> but ti-pdk.bbclass adds it by default. While most of PDK-based components do
> require ti-sysbios to be built from sources, it is safe to remove it from CSL,
> reducing the dependency tree for special cases like PRU FW based on CSL, but
> not needing ti-sysbios.
> 
> This only affects firmwares built from sources against PDK and CSL, not when
> RTOS firmwares are delivered in binary form for newer K3 platforms.
> 
> Build-tested on am335x, am57xx, k2g and am65xx.
> 
> Signed-off-by: Denys Dmytriyenko <denis@denix.org>
> ---
>  recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb b/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb
> index 98b2d13..6479d9f 100644
> --- a/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb
> +++ b/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb
> @@ -7,6 +7,7 @@ COMPATIBLE_MACHINE_append = "|c66x|k3"
>  inherit ti-pdk
>  
>  DEPENDS_remove = "${PN}"
> +DEPENDS_remove = "ti-sysbios"
>  
>  # Build with make instead of XDC
>  TI_PDK_XDCMAKE = "0"
> -- 
> 2.7.4
> 

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
