Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49A79CCA470
	for <webhook@archiver.kernel.org>; Tue, 30 Sep 2025 22:11:27 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.2511.1759270278175670808
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 30 Sep 2025 15:11:19 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 207EE40CC0;
	Tue, 30 Sep 2025 22:11:17 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pEJj-BsDVQxA; Tue, 30 Sep 2025 22:11:17 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 70B6640C06;
	Tue, 30 Sep 2025 22:11:04 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 8C2FA163FF5; Tue, 30 Sep 2025 18:11:03 -0400 (EDT)
Date: Tue, 30 Sep 2025 18:11:03 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: m-shah@ti.com
Cc: meta-ti@lists.yoctoproject.org, vigneshr@ti.com, u-kumar1@ti.com,
	reatmon@ti.com, a-limaye@ti.com, n-francis@ti.com, praneeth@ti.com,
	jm@ti.com, b-padhi@ti.com, bb@ti.com, denys@konsulko.com, rs@ti.com
Subject: Re: [meta-ti] [master][PATCH 4/4 v3] meta-ti-bsp: conf: machine:
 include: Build initramfs for all K3 platforms
Message-ID: <20250930221103.GY3125@denix.org>
References: <20250930134131.1149453-1-m-shah@ti.com>
 <20250930134131.1149453-5-m-shah@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250930134131.1149453-5-m-shah@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 30 Sep 2025 22:11:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19088

On Tue, Sep 30, 2025 at 07:11:31PM +0530, Moteen Shah via lists.yoctoproject.org wrote:
> Trigger build for initramfs image and package it in the boot partition
> of all K3 platforms whenever an image recipe is built with upstream
> kernel(mainline or mainline-next).
> 
> Signed-off-by: Moteen Shah <m-shah@ti.com>
> ---
>  meta-ti-bsp/conf/machine/include/k3.inc | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-ti-bsp/conf/machine/include/k3.inc b/meta-ti-bsp/conf/machine/include/k3.inc
> index 50411a8e..69684a15 100644
> --- a/meta-ti-bsp/conf/machine/include/k3.inc
> +++ b/meta-ti-bsp/conf/machine/include/k3.inc
> @@ -43,7 +43,12 @@ MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "ti-pka-fw"
>  
>  IMAGE_FSTYPES += "tar.xz wic.xz wic.bmap"
>  
> -IMAGE_BOOT_FILES ?= "${SPL_BINARYNAME} u-boot.${UBOOT_SUFFIX} tiboot3.bin tiboot3-*-evm.bin"
> +BUILD_CORE_INITRD_IMAGE ?= ""

The variable name still uses INITRD here - please be consistent.


> +BUILD_CORE_INITRD_IMAGE:bsp-mainline = "ti-core-initramfs:do_image_complete"
> +BUILD_CORE_INITRD_IMAGE:bsp-next = "ti-core-initramfs:do_image_complete"
> +do_image_complete[depends] += "${BUILD_CORE_INITRD_IMAGE}"
> +
> +IMAGE_BOOT_FILES ?= "${SPL_BINARYNAME} u-boot.${UBOOT_SUFFIX} tiboot3.bin tiboot3-*-evm.bin ti-core-initramfs.cpio.xz"

ti-core-initramfs.cpio.xz gets added here unconditionally - what if it's not 
enabled and is not getting built?


>  IMAGE_EFI_BOOT_FILES ?= "${IMAGE_BOOT_FILES}"
>  
>  EFI_PROVIDER ?= "grub-efi"
> -- 
> 2.34.1

