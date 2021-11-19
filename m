Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.3247.1637290024442980563
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 18 Nov 2021 18:47:04 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id BE59940C47;
	Fri, 19 Nov 2021 02:47:02 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GkGkRpCuN6Lj; Fri, 19 Nov 2021 02:47:02 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 9934540BEA;
	Fri, 19 Nov 2021 02:46:58 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id D4DB81746D4; Thu, 18 Nov 2021 21:46:57 -0500 (EST)
Date: Thu, 18 Nov 2021 21:46:57 -0500
From: "Denys Dmytriyenko" <denis@denix.org>
To: yogeshs@ti.com
Cc: Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-ti@lists.yoctoproject.org, trini@konsulko.com
Subject: Re: [meta-ti][dunfell][PATCH] wic: revert grub-efi patch
Message-ID: <20211119024657.GK18191@denix.org>
References: <20211119022952.6588-1-yogeshs@ti.com>
MIME-Version: 1.0
In-Reply-To: <20211119022952.6588-1-yogeshs@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

+Tom

On Fri, Nov 19, 2021 at 02:29:52AM +0000, Yogesh Siraswar via lists.yoctoproject.org wrote:
> Revert "conf/machine: k3: Enable grub-efi by default in wic images"
> 
> This reverts commit d0b09833b44fa23cce86fd99dd8ca6631c61c476.

It is customary to provide a reason for revert.


> ---
>  conf/machine/include/k3.inc | 6 +-----
>  wic/sdimage-2part-efi.wks   | 7 -------
>  2 files changed, 1 insertion(+), 12 deletions(-)
>  delete mode 100644 wic/sdimage-2part-efi.wks
> 
> diff --git a/conf/machine/include/k3.inc b/conf/machine/include/k3.inc
> index 166c0923..e0970698 100644
> --- a/conf/machine/include/k3.inc
> +++ b/conf/machine/include/k3.inc
> @@ -44,12 +44,8 @@ IMAGE_BOOT_FILES_LEGACY = "${SPL_BINARY} u-boot.${UBOOT_SUFFIX} tiboot3.bin sysf
>  IMAGE_BOOT_FILES_MULTI_CERT = "${SPL_BINARY} u-boot.${UBOOT_SUFFIX} tiboot3.bin"
>  
>  IMAGE_BOOT_FILES ?= "${IMAGE_BOOT_FILES_LEGACY}"
> -IMAGE_EFI_BOOT_FILES ?= "${IMAGE_BOOT_FILES}"
>  
> -EFI_PROVIDER ?= "grub-efi"
> -MACHINE_FEATURES += "efi"
> -
> -WKS_FILE ?= "sdimage-2part-efi.wks"
> +WKS_FILE ?= "sdimage-2part.wks"
>  do_image_wic[depends] += "virtual/bootloader:do_deploy"
>  do_image_wic[mcdepends] += "mc::k3r5:virtual/bootloader:do_deploy mc::k3r5:ti-sci-fw:do_deploy"
>  do_image_tar[mcdepends] += "mc::k3r5:virtual/bootloader:do_deploy mc::k3r5:ti-sci-fw:do_deploy"
> diff --git a/wic/sdimage-2part-efi.wks b/wic/sdimage-2part-efi.wks
> deleted file mode 100644
> index ffb8d24b..00000000
> --- a/wic/sdimage-2part-efi.wks
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -# short-description: Create SD card image with 2 partitions and EFI support
> -# long-description: Creates a partitioned SD card image for TI platforms that
> -# supports EFI.  Boot files are located in the first vfat partition with extra
> -# reserved space.  We cannot use a GPT here.
> -bootloader --append="rootfstype=ext4 ro"
> -part /boot --source bootimg-efi --sourceparams="loader=grub-efi" --fstype=vfat --label boot --active --align 1024 --use-uuid --fixed-size 128M
> -part / --source rootfs --fstype=ext4 --label root --align 1024 --use-uuid
> -- 
> 2.17.1
> 
