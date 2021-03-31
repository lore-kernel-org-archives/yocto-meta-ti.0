Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.829.1617229174469648275
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 31 Mar 2021 15:19:35 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id A7A1940C3A;
	Wed, 31 Mar 2021 22:19:33 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K4A_CqApc8b4; Wed, 31 Mar 2021 22:19:33 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 3D33940BA9;
	Wed, 31 Mar 2021 22:19:31 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 938FB174567; Wed, 31 Mar 2021 18:19:30 -0400 (EDT)
Date: Wed, 31 Mar 2021 18:19:30 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Nishanth Menon <nm@ti.com>
Cc: praneeth@ti.com, meta-ti@lists.yoctoproject.org
Subject: Re: [dunfell/master][PATCH 1/7] conf/machine: k3: Add multi-certificate boot image support
Message-ID: <20210331221930.GE23013@denix.org>
References: <20210331165133.3746-1-nm@ti.com>
 <20210331165133.3746-2-nm@ti.com>
MIME-Version: 1.0
In-Reply-To: <20210331165133.3746-2-nm@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 31, 2021 at 11:51:27AM -0500, Nishanth Menon wrote:
> Lets keep things consistent by providing two possibilities for platforms
> to pick from - legacy boot and multi-certificate boot.
> 
> In legacy boot, the base bootloader and system firmware are
> maintained as separate binaries (tiboot3.bin and sysfw.itb).
> 
> In multi-certificate boot that newer K3 devices support, ROM is smarter
> and can handle multiple x509 certificate based images: so we can strip
> out the sysfw.itb and integrate it as part of tiboot3.bin itself. This
> improves authentication and overall system boot times since we are now
> able to boot both the system controller and the boot processor in
> parallel.
> 
> We do have a scheme currently to identify the images necessary for boot
> etc, but things are handled on a platform conf file basis. We can
> improve that by introducing the pattern at the top level include and use
> the relevant pattern in platforms as needed.

Thanks for detailed explanation of K3 boot modes!


> Signed-off-by: Nishanth Menon <nm@ti.com>

Reviewed-by: Denys Dmytriyenko <denys@konsulko.com>


> ---
>  conf/machine/include/k3.inc | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/conf/machine/include/k3.inc b/conf/machine/include/k3.inc
> index c727d724ac28..56ad40c3f963 100644
> --- a/conf/machine/include/k3.inc
> +++ b/conf/machine/include/k3.inc
> @@ -40,7 +40,11 @@ MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 alsa ethernet pci"
>  
>  IMAGE_FSTYPES += "tar.xz wic.xz"
>  
> -IMAGE_BOOT_FILES ?= "${SPL_BINARY} u-boot.${UBOOT_SUFFIX} tiboot3.bin sysfw.itb"
> +IMAGE_BOOT_FILES_LEGACY = "${SPL_BINARY} u-boot.${UBOOT_SUFFIX} tiboot3.bin sysfw.itb"
> +IMAGE_BOOT_FILES_MULTI_CERT = "${SPL_BINARY} u-boot.${UBOOT_SUFFIX} tiboot3.bin"
> +
> +IMAGE_BOOT_FILES ?= "${IMAGE_BOOT_FILES_LEGACY}"
> +
>  WKS_FILE ?= "sdimage-2part.wks"
>  do_image_wic[depends] += "virtual/bootloader:do_deploy"
>  do_image_wic[mcdepends] += "mc::k3r5:virtual/bootloader:do_deploy mc::k3r5:ti-sci-fw:do_deploy"
> -- 
> 2.31.0
> 

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
