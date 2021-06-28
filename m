Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.541.1624911090276553147
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 28 Jun 2021 13:11:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B503540CA0;
	Mon, 28 Jun 2021 20:11:29 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ft1wkHsy9tTb; Mon, 28 Jun 2021 20:11:29 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 98D2F40C16;
	Mon, 28 Jun 2021 20:11:28 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 6500317461A; Mon, 28 Jun 2021 16:11:28 -0400 (EDT)
Date: Mon, 28 Jun 2021 16:11:28 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Tom Rini <tom.rini@gmail.com>
Cc: meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] [PATCHv2] conf/machine: k3: Enable grub-efi by default in wic images
Message-ID: <20210628201128.GY1528@denix.org>
References: <20210628180617.789-1-trini@konsulko.com>
MIME-Version: 1.0
In-Reply-To: <20210628180617.789-1-trini@konsulko.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 28, 2021 at 02:06:17PM -0400, Tom Rini wrote:
> All of our platforms here support running EFI binaries.  We can have wic
> generate a simple grub.cfg file for us that will find the root partition
> via PARTUUID and utilize the device tree that is already discoverable
> via the EFI configuration tables.  Assuming the EFI loader is U-Boot,
> this device tree can be replaced at run-time by the normal mechanism of
> loading in to memory and passing that address as an argument to bootefi.
> 
> Signed-off-by: Tom Rini <trini@konsulko.com>

Reviewed-by: Denys Dmytriyenko <denys@konsulko.com>


> ---
> Changes in v2:
> - Add missing IMAGE_EFI_BOOT_FILES which is how we populate in the
>   various firmware portions.
> - Use --fixed-size 128M to ensure we have some spare room on the boot
>   partition.
> ---
>  conf/machine/include/k3.inc | 6 +++++-
>  wic/sdimage-2part-efi.wks   | 7 +++++++
>  2 files changed, 12 insertions(+), 1 deletion(-)
>  create mode 100644 wic/sdimage-2part-efi.wks
> 
> diff --git a/conf/machine/include/k3.inc b/conf/machine/include/k3.inc
> index e0970698b33d..166c09239069 100644
> --- a/conf/machine/include/k3.inc
> +++ b/conf/machine/include/k3.inc
> @@ -44,8 +44,12 @@ IMAGE_BOOT_FILES_LEGACY = "${SPL_BINARY} u-boot.${UBOOT_SUFFIX} tiboot3.bin sysf
>  IMAGE_BOOT_FILES_MULTI_CERT = "${SPL_BINARY} u-boot.${UBOOT_SUFFIX} tiboot3.bin"
>  
>  IMAGE_BOOT_FILES ?= "${IMAGE_BOOT_FILES_LEGACY}"
> +IMAGE_EFI_BOOT_FILES ?= "${IMAGE_BOOT_FILES}"
>  
> -WKS_FILE ?= "sdimage-2part.wks"
> +EFI_PROVIDER ?= "grub-efi"
> +MACHINE_FEATURES += "efi"
> +
> +WKS_FILE ?= "sdimage-2part-efi.wks"
>  do_image_wic[depends] += "virtual/bootloader:do_deploy"
>  do_image_wic[mcdepends] += "mc::k3r5:virtual/bootloader:do_deploy mc::k3r5:ti-sci-fw:do_deploy"
>  do_image_tar[mcdepends] += "mc::k3r5:virtual/bootloader:do_deploy mc::k3r5:ti-sci-fw:do_deploy"
> diff --git a/wic/sdimage-2part-efi.wks b/wic/sdimage-2part-efi.wks
> new file mode 100644
> index 000000000000..ffb8d24bacd1
> --- /dev/null
> +++ b/wic/sdimage-2part-efi.wks
> @@ -0,0 +1,7 @@
> +# short-description: Create SD card image with 2 partitions and EFI support
> +# long-description: Creates a partitioned SD card image for TI platforms that
> +# supports EFI.  Boot files are located in the first vfat partition with extra
> +# reserved space.  We cannot use a GPT here.
> +bootloader --append="rootfstype=ext4 ro"
> +part /boot --source bootimg-efi --sourceparams="loader=grub-efi" --fstype=vfat --label boot --active --align 1024 --use-uuid --fixed-size 128M
> +part / --source rootfs --fstype=ext4 --label root --align 1024 --use-uuid
> -- 
> 2.17.1
> 

> 
> 
> 


-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
