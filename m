Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.1064.1617230657323632880
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 31 Mar 2021 15:44:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B4BC540C3A;
	Wed, 31 Mar 2021 22:44:16 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qcPHjXcJ-lN3; Wed, 31 Mar 2021 22:44:16 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 8DBD340BA9;
	Wed, 31 Mar 2021 22:44:14 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 51316174567; Wed, 31 Mar 2021 18:44:14 -0400 (EDT)
Date: Wed, 31 Mar 2021 18:44:14 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Nishanth Menon <nm@ti.com>
Cc: praneeth@ti.com, meta-ti@lists.yoctoproject.org
Subject: Re: [dunfell/master][PATCH 7/7] conf/machine: k3: Lets build bmap files by default
Message-ID: <20210331224414.GL23013@denix.org>
References: <20210331165133.3746-1-nm@ti.com>
 <20210331165133.3746-8-nm@ti.com>
MIME-Version: 1.0
In-Reply-To: <20210331165133.3746-8-nm@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 31, 2021 at 11:51:33AM -0500, Nishanth Menon wrote:
> Lets generate bmap files for bmaptool to use as well as default to use
> with wic files.
> 
> https://www.yoctoproject.org/docs/current/mega-manual/mega-manual.html#flashing-images-using-bmaptool

Thank you! I've been enjoying bmap a lot lately - can speed up SD card 
flashing 2x-3x by skipping empty blocks of the image. And was going to 
submit the same change, but you beat me to it... :)


> Signed-off-by: Nishanth Menon <nm@ti.com>

Reviewed-by: Denys Dmytriyenko <denys@konsulko.com>


> ---
>  conf/machine/include/k3.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/conf/machine/include/k3.inc b/conf/machine/include/k3.inc
> index 56ad40c3f963..e0970698b33d 100644
> --- a/conf/machine/include/k3.inc
> +++ b/conf/machine/include/k3.inc
> @@ -38,7 +38,7 @@ UBI_VOLNAME = "rootfs"
>  # List common SoC features, may need to add touchscreen for specific machines
>  MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 alsa ethernet pci"
>  
> -IMAGE_FSTYPES += "tar.xz wic.xz"
> +IMAGE_FSTYPES += "tar.xz wic.xz wic.bmap"
>  
>  IMAGE_BOOT_FILES_LEGACY = "${SPL_BINARY} u-boot.${UBOOT_SUFFIX} tiboot3.bin sysfw.itb"
>  IMAGE_BOOT_FILES_MULTI_CERT = "${SPL_BINARY} u-boot.${UBOOT_SUFFIX} tiboot3.bin"
> -- 
> 2.31.0
> 

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
