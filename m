Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.990.1644439877895663005
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 09 Feb 2022 12:51:18 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B725040BA8;
	Wed,  9 Feb 2022 20:51:16 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1RsVWyVNYIbb; Wed,  9 Feb 2022 20:51:16 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A0A0C406B5;
	Wed,  9 Feb 2022 20:51:15 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 63350174746; Wed,  9 Feb 2022 15:51:15 -0500 (EST)
Date: Wed, 9 Feb 2022 15:51:15 -0500
From: "Denys Dmytriyenko" <denis@denix.org>
To: Kevin Hilman <khilman@baylibre.com>
Cc: meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] [dunfell][PATCH] conf/machine/am57xx-evm: add overlay for OV10635 sensor
Message-ID: <20220209205115.GB26229@denix.org>
References: <20220209195625.2203204-1-khilman@baylibre.com>
MIME-Version: 1.0
In-Reply-To: <20220209195625.2203204-1-khilman@baylibre.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 09, 2022 at 11:56:25AM -0800, Kevin Hilman wrote:
> The VIP camera capture driver recently ported to ti-linux-5.10.y adds
> a DT overlay for the OV10635 camera sensor.  Add this to
> KERNEL_DEVICTREE so it's added to the artifacts.
> 
> Signed-off-by: Kevin Hilman <khilman@baylibre.com>

Reviewed-by: Denys Dmytriyenko <denys@konsulko.com>


> ---
> Fixes: LCPD-24423
> 
>  conf/machine/am57xx-evm.conf | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/conf/machine/am57xx-evm.conf b/conf/machine/am57xx-evm.conf
> index f977c5c62872..afcfbb4318ad 100644
> --- a/conf/machine/am57xx-evm.conf
> +++ b/conf/machine/am57xx-evm.conf
> @@ -25,6 +25,7 @@ KERNEL_DEVICETREE = " \
>      ti/am572x-idk-touchscreen.dtbo \
>      ti/lcd-osd101t2587.dtbo \
>      ti/lcd-osd101t2045.dtbo \
> +    ti/ov10635.dtbo \
>  "
>  
>  KERNEL_DEVICETREE += "${@oe.utils.conditional('ENABLE_TI_UIO_DEVICES', '1', 'am574x-idk-pru-excl-uio.dtb am572x-idk-pru-excl-uio.dtb am571x-idk-pru-excl-uio.dtb', '', d)}"
> -- 
> 2.34.0
> 
