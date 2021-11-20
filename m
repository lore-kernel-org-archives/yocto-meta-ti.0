Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.3220.1637377337578463619
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 19 Nov 2021 19:02:18 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 198D540C52;
	Sat, 20 Nov 2021 03:02:16 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Lt_-BfvqBYqQ; Sat, 20 Nov 2021 03:02:16 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E13FA40BEA;
	Sat, 20 Nov 2021 03:02:11 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 3FFE41746D5; Fri, 19 Nov 2021 22:02:11 -0500 (EST)
Date: Fri, 19 Nov 2021 22:02:11 -0500
From: "Denys Dmytriyenko" <denis@denix.org>
To: Vivien Didelot <vivien.didelot@gmail.com>
Cc: meta-ti@lists.yoctoproject.org, Denys Dmytriyenko <denys@konsulko.com>,
	Praneeth Bajjuri <praneeth@ti.com>,
	Vivien Didelot <vdidelot@pbsc.com>
Subject: Re: [meta-ti] [PATCH] ti33x: remove the screen machine feature
Message-ID: <20211120030211.GN18191@denix.org>
References: <20211119201533.2540388-1-vdidelot@pbsc.com>
MIME-Version: 1.0
In-Reply-To: <20211119201533.2540388-1-vdidelot@pbsc.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 19, 2021 at 03:15:33PM -0500, Vivien Didelot wrote:
> Some distros or image recipes may rely on the presence of the "screen"
> machine feature to install graphical front-end applications.
> 
> The ti33x SoC has an integrated GPU but does not have a screen per-se,
> thus having this feature in the SoC configuration may lead to unwanted
> packages being built.
> 
> Comment the 'screen' feature and remove it from MACHINE_FEATURES.

Well, 'screen' also implies not just a built-in LCD, but also external screens 
connected over HDMI or DVI. There are even remnant MACHINE_GUI_CLASS variables 
set in machine configs for either "bigscreen" or "smallscreen", although that 
one is no longer used.

All TI platforms with am335x SoC do have screen outputs, but I do understand 
there could be headless platforms from other manufacturers with this SoC. The 
correct way would be to not completely remove "screen" MACHINE_FEATURE from 
the SoC include file, but rather move it to corresponding machine configs that 
use it - am335x-evm, beaglebone, etc.


> Signed-off-by: Vivien Didelot <vdidelot@pbsc.com>
> ---
>  conf/machine/include/ti33x.inc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/conf/machine/include/ti33x.inc b/conf/machine/include/ti33x.inc
> index 197cac19..c499928c 100644
> --- a/conf/machine/include/ti33x.inc
> +++ b/conf/machine/include/ti33x.inc
> @@ -61,8 +61,8 @@ UBI_VOLNAME = "rootfs"
>  
>  EXTRA_IMAGEDEPENDS += "virtual/bootloader"
>  
> -# List common SoC features, may need to add touchscreen for specific machines
> -MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 screen alsa ethernet gpu"
> +# List common SoC features, may need to add "screen touchscreen" for specific machines
> +MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 alsa ethernet gpu"
>  
>  # Set the list of device targets for ti-pdk class recipes
>  TI_PDK_LIMIT_SOCS = "am335x"
> -- 
> 2.33.1
> 

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
