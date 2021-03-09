Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.381.1615322056088861893
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 09 Mar 2021 12:34:16 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id CBD0940C2C;
	Tue,  9 Mar 2021 20:34:14 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v8LMgp8zKCvM; Tue,  9 Mar 2021 20:34:14 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B00CF406B5;
	Tue,  9 Mar 2021 20:34:13 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 73E7D17452F; Tue,  9 Mar 2021 15:34:13 -0500 (EST)
Date: Tue, 9 Mar 2021 15:34:13 -0500
From: "Denys Dmytriyenko" <denis@denix.org>
To: Vivien Didelot <vivien.didelot@gmail.com>
Cc: meta-ti@lists.yoctoproject.org
Subject: Re: [PATCH] ti33x: allow different virtual/bootloader
Message-ID: <20210309203413.GL4892@denix.org>
References: <20210309172331.22122-1-vdidelot@pbsc.com>
MIME-Version: 1.0
In-Reply-To: <20210309172331.22122-1-vdidelot@pbsc.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 09, 2021 at 12:23:31PM -0500, Vivien Didelot wrote:
> Boards like the beaglebone currently hardcode "u-boot" as a dependency
> for the image and the wic format, and this prevents one from choosing
> a different bootloader via:
> 
>     PREFERRED_PROVIDER_virtual/bootloader = "non-u-boot-bootloader"
> 
> Depending on "virtual/bootloader" instead of "u-boot" fixes this.
> 
> Signed-off-by: Vivien Didelot <vdidelot@pbsc.com>

Could have added Suggested-by: here. Oh, well...

Reviewed-by: Denys Dmytriyenko <denis@denix.org>


> ---
>  conf/machine/include/ti33x.inc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/conf/machine/include/ti33x.inc b/conf/machine/include/ti33x.inc
> index abfd7ec7..b3c3b6d7 100644
> --- a/conf/machine/include/ti33x.inc
> +++ b/conf/machine/include/ti33x.inc
> @@ -51,7 +51,7 @@ UBOOT_SUFFIX = "img"
>  # and u-boot.
>  UBI_VOLNAME = "rootfs"
>  
> -EXTRA_IMAGEDEPENDS += "u-boot"
> +EXTRA_IMAGEDEPENDS += "virtual/bootloader"
>  
>  # List common SoC features, may need to add touchscreen for specific machines
>  MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 screen alsa ethernet gpu"
> @@ -63,4 +63,4 @@ TI_PDK_LIMIT_BOARDS = "evmAM335x icev2AM335x iceAMIC110 bbbAM335x skAM335x"
>  IMAGE_FSTYPES += "tar.xz wic.xz"
>  WKS_FILE ?= "sdimage-2part.wks"
>  IMAGE_BOOT_FILES ?= "${SPL_BINARY} u-boot.${UBOOT_SUFFIX}"
> -do_image_wic[depends] += "u-boot:do_deploy"
> +do_image_wic[depends] += "virtual/bootloader:do_deploy"
> -- 
> 2.30.1
> 

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
