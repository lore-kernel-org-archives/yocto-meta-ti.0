Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.1183.1623870569009933791
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 16 Jun 2021 12:09:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id BA72C40C1C;
	Wed, 16 Jun 2021 19:09:27 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UC5oFiR92SlW; Wed, 16 Jun 2021 19:09:27 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A0A6840B66;
	Wed, 16 Jun 2021 19:09:26 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 0AB19174603; Wed, 16 Jun 2021 15:09:26 -0400 (EDT)
Date: Wed, 16 Jun 2021 15:09:26 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Tom Rini <tom.rini@gmail.com>
Cc: meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] [PATCH] conf/machine: k3: Enable grub-efi by default in wic images
Message-ID: <20210616190925.GH1528@denix.org>
References: <20210616183718.25134-1-trini@konsulko.com>
MIME-Version: 1.0
In-Reply-To: <20210616183718.25134-1-trini@konsulko.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 16, 2021 at 02:37:18PM -0400, Tom Rini wrote:
> All of our platforms here support running EFI binaries.  We can have wic
> generate a simple grub.cfg file for us that will find the root partition
> via PARTUUID and utilize the device tree that is already discoverable
> via the EFI configuration tables.  Assuming the EFI loader is U-Boot,
> this device tree can be replaced at run-time by the normal mechanism of
> loading in to memory and passing that address as an argument to bootefi.
> 
> Signed-off-by: Tom Rini <trini@konsulko.com>
> ---
>  conf/machine/include/k3.inc | 5 ++++-
>  wic/sdimage-2part-efi.wks   | 7 +++++++
>  2 files changed, 11 insertions(+), 1 deletion(-)
>  create mode 100644 wic/sdimage-2part-efi.wks
> 
> diff --git a/conf/machine/include/k3.inc b/conf/machine/include/k3.inc
> index e0970698b33d..61438abe8f19 100644
> --- a/conf/machine/include/k3.inc
> +++ b/conf/machine/include/k3.inc
> @@ -45,7 +45,10 @@ IMAGE_BOOT_FILES_MULTI_CERT = "${SPL_BINARY} u-boot.${UBOOT_SUFFIX} tiboot3.bin"
>  
>  IMAGE_BOOT_FILES ?= "${IMAGE_BOOT_FILES_LEGACY}"
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
> index 000000000000..6b03080eb5bf
> --- /dev/null
> +++ b/wic/sdimage-2part-efi.wks
> @@ -0,0 +1,7 @@
> +# short-description: Create SD card image with 2 partitions and EFI support
> +# long-description: Creates a partitioned SD card image for TI platforms that
> +# supports EFI.  Boot files are located in the first vfat partition with extra
> +# reserved space.  We cannot use a GPT here.

Was "extra reserved space" in the boot partition lost?
Not sure if it's still needed - it was used for testing.


> +bootloader --append="rootfstype=ext4 ro"
> +part /boot --source bootimg-efi --sourceparams="loader=grub-efi" --fstype=vfat --label boot --active --align 1024 --use-uuid
> +part / --source rootfs --fstype=ext4 --label root --align 1024 --use-uuid
> -- 
> 2.17.1
> 

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
