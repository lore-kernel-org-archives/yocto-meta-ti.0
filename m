Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web10.2777.1608236219067224786
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 17 Dec 2020 12:16:59 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 198.145.29.25, mailfrom: denis@denix.org)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by mail.yoctoproject.org (Postfix) with ESMTPS id CEDF038C0857
	for <meta-ti@yoctoproject.org>; Thu, 17 Dec 2020 20:16:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 1E66E40B98;
	Thu, 17 Dec 2020 20:16:57 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fOg4B_fTIEgh; Thu, 17 Dec 2020 20:16:57 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id EAD4940A3C;
	Thu, 17 Dec 2020 20:16:55 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 5E451174513; Thu, 17 Dec 2020 15:16:55 -0500 (EST)
Date: Thu, 17 Dec 2020 15:16:55 -0500
From: "Denys Dmytriyenko" <denis@denix.org>
To: dmurphy@ti.com
Cc: meta-ti@yoctoproject.org
Subject: Re: [meta-ti] [dunfell/master] [PATCH v3 09/10] ti-sci-fw: Update image gen and sysfw commit SHA
Message-ID: <20201217201655.GX24670@denix.org>
References: <20201217184929.18031-1-dmurphy@ti.com>
 <20201217184929.18031-9-dmurphy@ti.com>
MIME-Version: 1.0
In-Reply-To: <20201217184929.18031-9-dmurphy@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Dec 17, 2020 at 12:49:28PM -0600, Dan Murphy via lists.yoctoproject.org wrote:
> Update the image gen and sysfw commit SHAs.
> Temporarily pick up the firmware-next branch to get the AM64x firmware.
> This branch change will need to be reverted once the firmware is merged.

Don't see firmware-next in the code below.


> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
>  recipes-bsp/ti-sci-fw/ti-sci-fw.inc | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw.inc b/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
> index fe391e5fc40b..174d9539e152 100644
> --- a/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
> +++ b/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
> @@ -4,10 +4,11 @@ LICENSE = "TI-TFL"
>  LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=b5aebf0668bdf95621259288c4a46d76"
>  
>  PV = "2020.08b"
> +PV_am64xx-evm-k3r5 = "2020.23"
>  
> -SRCREV = "c26c279257c13a0ff5002b09113fcff0e1d18853"
> +SRCREV = "078c1bbf3d0a05b4045d4091c32e91ee1ae15ff8"
>  BRANCH ?= "ti-linux-firmware"
> -SRCREV_imggen = "7b4fe13d642d69a559724349aede4817891008a7"
> +SRCREV_imggen = "6d023674b0655f1a7bba192d2600c08be314e9ef"
>  SRCREV_FORMAT = "imggen"
>  
>  SRC_URI = " \
> -- 
> 2.29.2
