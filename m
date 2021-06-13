Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.20976.1623613003542379964
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 13 Jun 2021 12:36:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E062840C7C;
	Sun, 13 Jun 2021 19:36:42 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tY68m52Fn5xi; Sun, 13 Jun 2021 19:36:42 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C6EB640B66;
	Sun, 13 Jun 2021 19:36:41 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 1FEFD174603; Sun, 13 Jun 2021 15:36:41 -0400 (EDT)
Date: Sun, 13 Jun 2021 15:36:41 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Tom Rini <tom.rini@gmail.com>
Cc: meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] [PATCHv2] conf: am335x-evm: Add extlinux.conf support
Message-ID: <20210613193641.GB1528@denix.org>
References: <16875AD11A54340A.8333@lists.yoctoproject.org>
 <20210612131331.13439-1-trini@konsulko.com>
MIME-Version: 1.0
In-Reply-To: <20210612131331.13439-1-trini@konsulko.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Jun 12, 2021 at 09:13:31AM -0400, Tom Rini wrote:
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
> Changes in v2:
> - Elaborate on how this feature works in the commit message.
> ---
>  conf/machine/include/ti33x.inc | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
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
> -- 
> 2.17.1
> 
