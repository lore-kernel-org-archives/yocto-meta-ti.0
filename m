Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web09.2636.1614980189956984193
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 05 Mar 2021 13:36:30 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id CBFDF40BEC;
	Fri,  5 Mar 2021 21:36:28 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JPP56WciR-mn; Fri,  5 Mar 2021 21:36:28 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id ADCF5407E5;
	Fri,  5 Mar 2021 21:36:27 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id F2D09174525; Fri,  5 Mar 2021 16:36:26 -0500 (EST)
Date: Fri, 5 Mar 2021 16:36:26 -0500
From: "Denys Dmytriyenko" <denis@denix.org>
To: praneeth@ti.com
Cc: meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] [dunfell/master PATCH] ti-rtos: Update path for firmwares on j7200
Message-ID: <20210305213626.GX4892@denix.org>
References: <20210305211942.19238-1-praneeth@ti.com>
MIME-Version: 1.0
In-Reply-To: <20210305211942.19238-1-praneeth@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 05, 2021 at 03:19:42PM -0600, praneeth via lists.yoctoproject.org wrote:
> From: Praneeth Bajjuri <praneeth@ti.com>
> 
> Between j7200 firmware tags 07.03.00.10 to 07.03.00.16
> the downloadable weburl link changed
> from *processor-sdk-rtos-jacinto7 to *processor-sdk-rtos-j7200.
> 
> This patch is to fix the recipe to pick the firmware from the
> expected location on the new tag.
> 
> Fixes j7200 build error reported due to
> 77cdfa9f6560 ("ti-rtos: Update metadata and versions for RTOS firmware")
> 
> Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>

This one looks good, thanks.

Reviewed-by: Denys Dmytriyenko <denis@denix.org>


> ---
>  recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> index e5c35689..507d0000 100644
> --- a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> +++ b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> @@ -31,6 +31,7 @@ DEFAULT_RTOS_SOC_am64xx = "am64x"
>  
>  DEFAULT_RTOS_WEBLINK = "undefined"
>  DEFAULT_RTOS_WEBLINK_j7 = "https://software-dl.ti.com/jacinto7/esd/processor-sdk-rtos-jacinto7/firmware/${CORESDK_RTOS_VERSION}"
> +DEFAULT_RTOS_WEBLINK_j7200-evm = "https://software-dl.ti.com/jacinto7/esd/processor-sdk-rtos-j7200/firmware/${CORESDK_RTOS_VERSION}"
>  DEFAULT_RTOS_WEBLINK_am65xx = "https://software-dl.ti.com/processor-sdk-rtos/esd/AM65X/firmware/${CORESDK_RTOS_VERSION}"
>  DEFAULT_RTOS_WEBLINK_am64xx = "https://software-dl.ti.com/processor-sdk-rtos/esd/AM64X/firmware/${CORESDK_RTOS_VERSION}"
>  
> -- 
> 2.17.1
