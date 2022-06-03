Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85353C43334
	for <webhook@archiver.kernel.org>; Fri,  3 Jun 2022 21:02:05 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.3443.1654290123372931694
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 03 Jun 2022 14:02:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 1D7CA40D25;
	Fri,  3 Jun 2022 21:02:02 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7srIOjonjxZo; Fri,  3 Jun 2022 21:02:02 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id EC85C40D22;
	Fri,  3 Jun 2022 21:01:58 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id B95CB17495D; Fri,  3 Jun 2022 17:01:58 -0400 (EDT)
Date: Fri, 3 Jun 2022 17:01:58 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: afd@ti.com
Cc: Ryan Eatmon <reatmon@ti.com>, Manorit Chawdhry <m-chawdhry@ti.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][dunfell][PATCH 1/2] conf: machine: wic: Fix HS image
 boot partition
Message-ID: <20220603210158.GN9834@denix.org>
References: <20220602202448.18068-1-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220602202448.18068-1-afd@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 03 Jun 2022 21:02:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14780

On Thu, Jun 02, 2022 at 03:24:47PM -0500, Andrew Davis via lists.yoctoproject.org wrote:
> From: Manorit Chawdhry <m-chawdhry@ti.com>
> 
> IMAGE_BOOT_FILES was being overwritten in the HS recipes leading to
> incomplete binaries in /boot and the naming of the binaries were not
> correct.
> 
> Fixes /boot partition for HS devices.
> 
> Signed-off-by: Manorit Chawdhry <m-chawdhry@ti.com>
> [afd: Extended fix to all HS platforms]
> Signed-off-by: Andrew Davis <afd@ti.com>

Reviewed-by: Denys Dmytriyenko <denys@konsulko.com>


> ---
>  conf/machine/am64xx-hs-evm.conf | 4 +---
>  conf/machine/am65xx-hs-evm.conf | 4 +---
>  conf/machine/include/k3.inc     | 5 +++--
>  conf/machine/j7-hs-evm.conf     | 4 +---
>  conf/machine/j7200-hs-evm.conf  | 4 +---
>  5 files changed, 7 insertions(+), 14 deletions(-)
> 
> diff --git a/conf/machine/am64xx-hs-evm.conf b/conf/machine/am64xx-hs-evm.conf
> index 44e81463..c0d904e1 100644
> --- a/conf/machine/am64xx-hs-evm.conf
> +++ b/conf/machine/am64xx-hs-evm.conf
> @@ -15,8 +15,6 @@ UBOOT_DTBO_LOADADDRESS = "0x83080000"
>  UBOOT_DTBO_OFFSET =      "0x00010000"
>  
>  SPL_BINARY = "tispl.bin_HS"
> -SPL_BINARYNAME = "tispl.bin"
> -UBOOT_BINARY = "u-boot.img_HS"
> -IMAGE_BOOT_FILES = "${UBOOT_BINARY}"
> +UBOOT_IMAGE = "u-boot.img_HS"
>  
>  TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_K3}"
> diff --git a/conf/machine/am65xx-hs-evm.conf b/conf/machine/am65xx-hs-evm.conf
> index e4eebb6a..a7514663 100644
> --- a/conf/machine/am65xx-hs-evm.conf
> +++ b/conf/machine/am65xx-hs-evm.conf
> @@ -15,8 +15,6 @@ UBOOT_DTBO_LOADADDRESS = "0x83080000"
>  UBOOT_DTBO_OFFSET =      "0x00010000"
>  
>  SPL_BINARY = "tispl.bin_HS"
> -SPL_BINARYNAME = "tispl.bin"
> -UBOOT_BINARY = "u-boot.img_HS"
> -IMAGE_BOOT_FILES = "${UBOOT_BINARY}"
> +UBOOT_IMAGE = "u-boot.img_HS"
>  
>  TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_K3}"
> diff --git a/conf/machine/include/k3.inc b/conf/machine/include/k3.inc
> index e0970698..f85e6b98 100644
> --- a/conf/machine/include/k3.inc
> +++ b/conf/machine/include/k3.inc
> @@ -22,6 +22,7 @@ UBOOT_ENTRYPOINT = "0x80008000"
>  UBOOT_LOADADDRESS = "0x80008000"
>  
>  SPL_BINARY = "tispl.bin"
> +SPL_BINARYNAME = "tispl.bin"
>  UBOOT_SUFFIX = "img"
>  
>  EXTRA_IMAGEDEPENDS += "virtual/bootloader"
> @@ -40,8 +41,8 @@ MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 alsa ethernet pci"
>  
>  IMAGE_FSTYPES += "tar.xz wic.xz wic.bmap"
>  
> -IMAGE_BOOT_FILES_LEGACY = "${SPL_BINARY} u-boot.${UBOOT_SUFFIX} tiboot3.bin sysfw.itb"
> -IMAGE_BOOT_FILES_MULTI_CERT = "${SPL_BINARY} u-boot.${UBOOT_SUFFIX} tiboot3.bin"
> +IMAGE_BOOT_FILES_LEGACY = "${SPL_BINARYNAME} u-boot.${UBOOT_SUFFIX} tiboot3.bin sysfw.itb"
> +IMAGE_BOOT_FILES_MULTI_CERT = "${SPL_BINARYNAME} u-boot.${UBOOT_SUFFIX} tiboot3.bin"
>  
>  IMAGE_BOOT_FILES ?= "${IMAGE_BOOT_FILES_LEGACY}"
>  
> diff --git a/conf/machine/j7-hs-evm.conf b/conf/machine/j7-hs-evm.conf
> index f2e3ccf5..629a5ccd 100644
> --- a/conf/machine/j7-hs-evm.conf
> +++ b/conf/machine/j7-hs-evm.conf
> @@ -15,9 +15,7 @@ UBOOT_DTBO_LOADADDRESS = "0x83080000"
>  UBOOT_DTBO_OFFSET =      "0x00010000"
>  
>  SPL_BINARY = "tispl.bin_HS"
> -SPL_BINARYNAME = "tispl.bin"
> -UBOOT_BINARY = "u-boot.img_HS"
> -IMAGE_BOOT_FILES = "${UBOOT_BINARY}"
> +UBOOT_IMAGE = "u-boot.img_HS"
>  
>  BBMULTICONFIG += "k3r5-sr1-1"
>  
> diff --git a/conf/machine/j7200-hs-evm.conf b/conf/machine/j7200-hs-evm.conf
> index a5bd637e..54b7906f 100644
> --- a/conf/machine/j7200-hs-evm.conf
> +++ b/conf/machine/j7200-hs-evm.conf
> @@ -15,8 +15,6 @@ UBOOT_DTBO_LOADADDRESS = "0x83080000"
>  UBOOT_DTBO_OFFSET =      "0x00010000"
>  
>  SPL_BINARY = "tispl.bin_HS"
> -SPL_BINARYNAME = "tispl.bin"
> -UBOOT_BINARY = "u-boot.img_HS"
> -IMAGE_BOOT_FILES = "${UBOOT_BINARY}"
> +UBOOT_IMAGE = "u-boot.img_HS"
>  
>  TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_K3}"
> -- 
> 2.36.1
> 

