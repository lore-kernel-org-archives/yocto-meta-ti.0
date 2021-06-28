Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.505.1624910899284001675
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 28 Jun 2021 13:08:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9EE3740CA0;
	Mon, 28 Jun 2021 20:08:18 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JNvuTfNWGu_a; Mon, 28 Jun 2021 20:08:18 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 7841D40C16;
	Mon, 28 Jun 2021 20:08:17 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id E19FB17461A; Mon, 28 Jun 2021 16:08:16 -0400 (EDT)
Date: Mon, 28 Jun 2021 16:08:16 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Tom Rini <tom.rini@gmail.com>
Cc: meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] [PATCHv3] conf: Add extlinux.conf support on some 32bit platforms
Message-ID: <20210628200816.GX1528@denix.org>
References: <20210628180624.842-1-trini@konsulko.com>
MIME-Version: 1.0
In-Reply-To: <20210628180624.842-1-trini@konsulko.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 28, 2021 at 02:06:24PM -0400, Tom Rini wrote:
> To make use of the "generic distro boot" support in U-Boot, an
> extlinux.conf file needs to be generated and reside in the extlinux
> directory.  The extlinux.conf file will be parsed by U-Boot and the
> "append" line will be evaluated and expanded and used entirely as the
> bootargs passed to the kernel.  Our generated extlinux.conf states
> that the kernel image and device trees live one level up (so the root
> directory) from it, so populate that location with our kernel and device
> trees.
> 
> Signed-off-by: Tom Rini <trini@konsulko.com>

Reviewed-by: Denys Dmytriyenko <denys@konsulko.com>


> ---
> Changes in v3:
> - Merge in a number of other SoCs.
> Changes in v2:
> - Elaborate on how this feature works in the commit message.
> ---
>  conf/machine/include/omap-a15.inc | 11 ++++++++++-
>  conf/machine/include/ti33x.inc    | 11 ++++++++++-
>  conf/machine/include/ti43x.inc    | 11 ++++++++++-
>  3 files changed, 30 insertions(+), 3 deletions(-)
> 
> diff --git a/conf/machine/include/omap-a15.inc b/conf/machine/include/omap-a15.inc
> index e491d2b501f1..c95b0cccaa42 100644
> --- a/conf/machine/include/omap-a15.inc
> +++ b/conf/machine/include/omap-a15.inc
> @@ -19,6 +19,15 @@ UBOOT_ARCH = "arm"
>  UBOOT_ENTRYPOINT = "0x80008000"
>  UBOOT_LOADADDRESS = "0x80008000"
>  
> +# Generate an extlinux.conf file
> +UBOOT_EXTLINUX = "1"
> +UBOOT_EXTLINUX_ROOT = "root=PARTUUID=${uuid}"
> +UBOOT_EXTLINUX_BOOT_FILES = " \
> +    extlinux.conf;extlinux/extlinux.conf \
> +    ${KERNEL_IMAGETYPE} \
> +    ${KERNEL_DEVICETREE} \
> +"
> +
>  SPL_BINARY = "MLO"
>  UBOOT_SUFFIX = "img"
>  
> @@ -40,5 +49,5 @@ MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 screen alsa etherne
>  
>  IMAGE_FSTYPES += "tar.xz wic.xz"
>  WKS_FILE ?= "sdimage-2part.wks"
> -IMAGE_BOOT_FILES ?= "${SPL_BINARY} u-boot.${UBOOT_SUFFIX}"
> +IMAGE_BOOT_FILES ?= "${SPL_BINARY} u-boot.${UBOOT_SUFFIX} ${UBOOT_EXTLINUX_BOOT_FILES}"
>  do_image_wic[depends] += "u-boot:do_deploy"
> diff --git a/conf/machine/include/ti33x.inc b/conf/machine/include/ti33x.inc
> index 6dfda754e9dd..35e057d57497 100644
> --- a/conf/machine/include/ti33x.inc
> +++ b/conf/machine/include/ti33x.inc
> @@ -43,6 +43,15 @@ UBOOT_MACHINE = "am335x_evm_config"
>  UBOOT_ENTRYPOINT = "0x80008000"
>  UBOOT_LOADADDRESS = "0x80008000"
>  
> +# Generate an extlinux.conf file
> +UBOOT_EXTLINUX = "1"
> +UBOOT_EXTLINUX_ROOT = "root=PARTUUID=${uuid}"
> +UBOOT_EXTLINUX_BOOT_FILES = " \
> +    extlinux.conf;extlinux/extlinux.conf \
> +    ${KERNEL_IMAGETYPE} \
> +    ${KERNEL_DEVICETREE} \
> +"
> +
>  SPL_BINARY = "MLO"
>  UBOOT_SUFFIX = "img"
>  
> @@ -61,5 +70,5 @@ TI_PDK_LIMIT_BOARDS = "evmAM335x icev2AM335x iceAMIC110 bbbAM335x skAM335x"
>  
>  IMAGE_FSTYPES += "tar.xz wic.xz"
>  WKS_FILE ?= "sdimage-2part.wks"
> -IMAGE_BOOT_FILES ?= "${SPL_BINARY} u-boot.${UBOOT_SUFFIX}"
> +IMAGE_BOOT_FILES ?= "${SPL_BINARY} u-boot.${UBOOT_SUFFIX} ${UBOOT_EXTLINUX_BOOT_FILES}"
>  do_image_wic[depends] += "virtual/bootloader:do_deploy"
> diff --git a/conf/machine/include/ti43x.inc b/conf/machine/include/ti43x.inc
> index b1a27f93a2a4..75b745b37839 100644
> --- a/conf/machine/include/ti43x.inc
> +++ b/conf/machine/include/ti43x.inc
> @@ -40,6 +40,15 @@ UBOOT_MACHINE = "am43xx_evm_config"
>  UBOOT_ENTRYPOINT = "0x80008000"
>  UBOOT_LOADADDRESS = "0x80008000"
>  
> +# Generate an extlinux.conf file
> +UBOOT_EXTLINUX = "1"
> +UBOOT_EXTLINUX_ROOT = "root=PARTUUID=${uuid}"
> +UBOOT_EXTLINUX_BOOT_FILES = " \
> +    extlinux.conf;extlinux/extlinux.conf \
> +    ${KERNEL_IMAGETYPE} \
> +    ${KERNEL_DEVICETREE} \
> +"
> +
>  SPL_BINARY = "MLO"
>  UBOOT_SUFFIX = "img"
>  
> @@ -58,5 +67,5 @@ TI_PDK_LIMIT_BOARDS = "evmAM437x idkAM437x skAM437x"
>  
>  IMAGE_FSTYPES += "tar.xz wic.xz"
>  WKS_FILE ?= "sdimage-2part.wks"
> -IMAGE_BOOT_FILES ?= "${SPL_BINARY} u-boot.${UBOOT_SUFFIX}"
> +IMAGE_BOOT_FILES ?= "${SPL_BINARY} u-boot.${UBOOT_SUFFIX} ${UBOOT_EXTLINUX_BOOT_FILES}"
>  do_image_wic[depends] += "u-boot:do_deploy"
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
