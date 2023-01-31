Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85381C38142
	for <webhook@archiver.kernel.org>; Tue, 31 Jan 2023 20:31:07 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.5429.1675197065604336354
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 31 Jan 2023 12:31:05 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8E2B640C1C;
	Tue, 31 Jan 2023 20:31:04 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mbvB6BN8qGzz; Tue, 31 Jan 2023 20:31:04 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 4D821406B5;
	Tue, 31 Jan 2023 20:30:58 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id CAB05163714; Tue, 31 Jan 2023 15:30:37 -0500 (EST)
Date: Tue, 31 Jan 2023 15:30:37 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: rs@ti.com
Cc: denys@ti.com, reatmon@ti.com, detheridge@ti.com, afd@ti.com,
	meta-ti@lists.yoctoproject.org, k-bhargav@ti.com
Subject: Re: [meta-ti] [kirkstone][PATCH v7 2/3] meta-ti-bsp: machine:
 Remove all gpu features
Message-ID: <20230131203037.GO22689@denix.org>
References: <20230130232007.2393097-1-rs@ti.com>
 <20230130232007.2393097-3-rs@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230130232007.2393097-3-rs@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 31 Jan 2023 20:31:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15717

On Mon, Jan 30, 2023 at 05:20:06PM -0600, Randolph Sapp via lists.yoctoproject.org wrote:
> Remove all gpu machine features and instead rely on the new dependency
> chain for resolving gpu dependencies.

Seems unnecessary to remove this feature, even if you are not going to use it.


> Set preferred providers for virtual/gpudriver where needed.

This part of the commit message does not match the code changes - there are no 
addition to gpudriver preferences, only removal of libegl/libgles preferences.


> Signed-off-by: Randolph Sapp <rs@ti.com>
> ---
>  meta-ti-bsp/conf/machine/am62xx-lp-evm.conf   | 2 --
>  meta-ti-bsp/conf/machine/include/am62xx.inc   | 6 +-----
>  meta-ti-bsp/conf/machine/include/am65xx.inc   | 6 +-----
>  meta-ti-bsp/conf/machine/include/j721e.inc    | 6 ------
>  meta-ti-bsp/conf/machine/include/j721s2.inc   | 6 ------
>  meta-ti-bsp/conf/machine/include/j784s4.inc   | 6 ------
>  meta-ti-bsp/conf/machine/include/omap-a15.inc | 6 +-----
>  meta-ti-bsp/conf/machine/include/ti33x.inc    | 6 +-----
>  meta-ti-bsp/conf/machine/include/ti43x.inc    | 6 +-----
>  9 files changed, 5 insertions(+), 45 deletions(-)
> 
> diff --git a/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf b/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
> index ef8e8692..ec9ce596 100644
> --- a/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
> +++ b/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
> @@ -4,8 +4,6 @@
>  
>  require conf/machine/include/am62xx.inc
>  
> -MACHINE_FEATURES += "gpu"
> -
>  KERNEL_DEVICETREE = " \
>      ti/k3-am62x-lp-sk.dtb \
>      ti/k3-am625-skeleton.dtb \
> diff --git a/meta-ti-bsp/conf/machine/include/am62xx.inc b/meta-ti-bsp/conf/machine/include/am62xx.inc
> index 411e5265..35f3f071 100644
> --- a/meta-ti-bsp/conf/machine/include/am62xx.inc
> +++ b/meta-ti-bsp/conf/machine/include/am62xx.inc
> @@ -1,15 +1,11 @@
>  require conf/machine/include/k3.inc
>  SOC_FAMILY:append = ":am62xx"
>  
> -MACHINE_FEATURES += "screen touchscreen gpu"
> +MACHINE_FEATURES += "screen touchscreen"
>  
>  SERIAL_CONSOLES = "115200;ttyS2"
>  SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
>  
> -PREFERRED_PROVIDER_virtual/egl ?= "ti-img-rogue-umlibs"
> -PREFERRED_PROVIDER_virtual/libgles1 ?= "ti-img-rogue-umlibs"
> -PREFERRED_PROVIDER_virtual/libgles2 ?= "ti-img-rogue-umlibs"
> -PREFERRED_PROVIDER_virtual/libgbm ?= "ti-img-rogue-umlibs"
>  PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-img-rogue-driver"
>  
>  TFA_BOARD = "lite"
> diff --git a/meta-ti-bsp/conf/machine/include/am65xx.inc b/meta-ti-bsp/conf/machine/include/am65xx.inc
> index 424864d3..385bb164 100644
> --- a/meta-ti-bsp/conf/machine/include/am65xx.inc
> +++ b/meta-ti-bsp/conf/machine/include/am65xx.inc
> @@ -1,15 +1,11 @@
>  require conf/machine/include/k3.inc
>  SOC_FAMILY:append = ":am65xx"
>  
> -MACHINE_FEATURES += "screen touchscreen gpu"
> +MACHINE_FEATURES += "screen touchscreen"
>  
>  SERIAL_CONSOLES = "115200;ttyS2 115200;ttyS1"
>  SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
>  
> -PREFERRED_PROVIDER_virtual/egl ?= "ti-sgx-ddk-um"
> -PREFERRED_PROVIDER_virtual/libgles1 ?= "ti-sgx-ddk-um"
> -PREFERRED_PROVIDER_virtual/libgles2 ?= "ti-sgx-ddk-um"
> -PREFERRED_PROVIDER_virtual/libgbm ?= "ti-sgx-ddk-um"
>  PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-sgx-ddk-km"
>  
>  KERNEL_DEVICETREE = " \
> diff --git a/meta-ti-bsp/conf/machine/include/j721e.inc b/meta-ti-bsp/conf/machine/include/j721e.inc
> index eba10d8d..67f5fe0f 100644
> --- a/meta-ti-bsp/conf/machine/include/j721e.inc
> +++ b/meta-ti-bsp/conf/machine/include/j721e.inc
> @@ -1,12 +1,6 @@
>  require conf/machine/include/k3.inc
>  SOC_FAMILY:append = ":j721e"
>  
> -MACHINE_FEATURES += "gpu"
> -
> -PREFERRED_PROVIDER_virtual/egl ?= "ti-img-rogue-umlibs"
> -PREFERRED_PROVIDER_virtual/libgles1 ?= "ti-img-rogue-umlibs"
> -PREFERRED_PROVIDER_virtual/libgles2 ?= "ti-img-rogue-umlibs"
> -PREFERRED_PROVIDER_virtual/libgbm ?= "ti-img-rogue-umlibs"
>  PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-img-rogue-driver"
>  
>  # On J721e the file tiboot3.bin comes from the bootloader not ti-sci-fw
> diff --git a/meta-ti-bsp/conf/machine/include/j721s2.inc b/meta-ti-bsp/conf/machine/include/j721s2.inc
> index fc6493b8..f33a3aba 100644
> --- a/meta-ti-bsp/conf/machine/include/j721s2.inc
> +++ b/meta-ti-bsp/conf/machine/include/j721s2.inc
> @@ -1,12 +1,6 @@
>  require conf/machine/include/k3.inc
>  SOC_FAMILY:append = ":j721s2"
>  
> -MACHINE_FEATURES += "gpu"
> -
> -PREFERRED_PROVIDER_virtual/egl ?= "ti-img-rogue-umlibs"
> -PREFERRED_PROVIDER_virtual/libgles1 ?= "ti-img-rogue-umlibs"
> -PREFERRED_PROVIDER_virtual/libgles2 ?= "ti-img-rogue-umlibs"
> -PREFERRED_PROVIDER_virtual/libgbm ?= "ti-img-rogue-umlibs"
>  PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-img-rogue-driver"
>  
>  TFA_BOARD = "generic"
> diff --git a/meta-ti-bsp/conf/machine/include/j784s4.inc b/meta-ti-bsp/conf/machine/include/j784s4.inc
> index d268b810..df0faede 100644
> --- a/meta-ti-bsp/conf/machine/include/j784s4.inc
> +++ b/meta-ti-bsp/conf/machine/include/j784s4.inc
> @@ -1,12 +1,6 @@
>  require conf/machine/include/k3.inc
>  SOC_FAMILY:append = ":j784s4"
>  
> -MACHINE_FEATURES += "gpu"
> -
> -PREFERRED_PROVIDER_virtual/egl ?= "ti-img-rogue-umlibs"
> -PREFERRED_PROVIDER_virtual/libgles1 ?= "ti-img-rogue-umlibs"
> -PREFERRED_PROVIDER_virtual/libgles2 ?= "ti-img-rogue-umlibs"
> -PREFERRED_PROVIDER_virtual/libgbm ?= "ti-img-rogue-umlibs"
>  PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-img-rogue-driver"
>  
>  TFA_BOARD = "j784s4"
> diff --git a/meta-ti-bsp/conf/machine/include/omap-a15.inc b/meta-ti-bsp/conf/machine/include/omap-a15.inc
> index 0843fb28..efa33a10 100644
> --- a/meta-ti-bsp/conf/machine/include/omap-a15.inc
> +++ b/meta-ti-bsp/conf/machine/include/omap-a15.inc
> @@ -10,10 +10,6 @@ MACHINE_KERNEL_PR = "r7"
>  PREFERRED_PROVIDER_virtual/kernel ?= "linux-ti-staging"
>  PREFERRED_PROVIDER_virtual/bootloader ?= "u-boot-ti-staging"
>  PREFERRED_PROVIDER_u-boot ?= "u-boot-ti-staging"
> -PREFERRED_PROVIDER_virtual/egl ?= "ti-sgx-ddk-um"
> -PREFERRED_PROVIDER_virtual/libgles1 ?= "ti-sgx-ddk-um"
> -PREFERRED_PROVIDER_virtual/libgles2 ?= "ti-sgx-ddk-um"
> -PREFERRED_PROVIDER_virtual/libgbm ?= "ti-sgx-ddk-um"
>  PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-sgx-ddk-km"
>  
>  KERNEL_IMAGETYPE = "zImage"
> @@ -45,7 +41,7 @@ EXTRA_IMAGEDEPENDS += "virtual/bootloader"
>  UBI_VOLNAME = "rootfs"
>  
>  # List common SoC features, may need to add touchscreen for specific machines
> -MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 screen alsa ethernet gpu mmip dsp gc320"
> +MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 screen alsa ethernet mmip dsp gc320"
>  
>  IMAGE_FSTYPES += "tar.xz wic.xz wic.bmap"
>  WKS_FILE ?= "sdimage-2part.wks"
> diff --git a/meta-ti-bsp/conf/machine/include/ti33x.inc b/meta-ti-bsp/conf/machine/include/ti33x.inc
> index cfacc30d..e2f75359 100644
> --- a/meta-ti-bsp/conf/machine/include/ti33x.inc
> +++ b/meta-ti-bsp/conf/machine/include/ti33x.inc
> @@ -11,10 +11,6 @@ MACHINE_KERNEL_PR = "r22"
>  PREFERRED_PROVIDER_virtual/kernel ?= "linux-ti-staging"
>  PREFERRED_PROVIDER_virtual/bootloader ?= "u-boot-ti-staging"
>  PREFERRED_PROVIDER_u-boot ?= "u-boot-ti-staging"
> -PREFERRED_PROVIDER_virtual/egl ?= "ti-sgx-ddk-um"
> -PREFERRED_PROVIDER_virtual/libgles1 ?= "ti-sgx-ddk-um"
> -PREFERRED_PROVIDER_virtual/libgles2 ?= "ti-sgx-ddk-um"
> -PREFERRED_PROVIDER_virtual/libgbm ?= "ti-sgx-ddk-um"
>  PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-sgx-ddk-km"
>  
>  KERNEL_IMAGETYPE = "zImage"
> @@ -55,7 +51,7 @@ UBI_VOLNAME = "rootfs"
>  EXTRA_IMAGEDEPENDS += "virtual/bootloader"
>  
>  # List common SoC features, may need to add touchscreen for specific machines
> -MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 alsa ethernet gpu"
> +MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 alsa ethernet"
>  
>  IMAGE_FSTYPES += "tar.xz wic.xz wic.bmap"
>  WKS_FILE ?= "sdimage-2part.wks"
> diff --git a/meta-ti-bsp/conf/machine/include/ti43x.inc b/meta-ti-bsp/conf/machine/include/ti43x.inc
> index 74a964db..e9999910 100644
> --- a/meta-ti-bsp/conf/machine/include/ti43x.inc
> +++ b/meta-ti-bsp/conf/machine/include/ti43x.inc
> @@ -11,10 +11,6 @@ MACHINE_KERNEL_PR = "r3"
>  PREFERRED_PROVIDER_virtual/kernel ?= "linux-ti-staging"
>  PREFERRED_PROVIDER_virtual/bootloader ?= "u-boot-ti-staging"
>  PREFERRED_PROVIDER_u-boot ?= "u-boot-ti-staging"
> -PREFERRED_PROVIDER_virtual/egl ?= "ti-sgx-ddk-um"
> -PREFERRED_PROVIDER_virtual/libgles1 ?= "ti-sgx-ddk-um"
> -PREFERRED_PROVIDER_virtual/libgles2 ?= "ti-sgx-ddk-um"
> -PREFERRED_PROVIDER_virtual/libgbm ?= "ti-sgx-ddk-um"
>  PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-sgx-ddk-km"
>  
>  KERNEL_IMAGETYPE = "zImage"
> @@ -54,7 +50,7 @@ UBI_VOLNAME = "rootfs"
>  EXTRA_IMAGEDEPENDS += "u-boot"
>  
>  # List common SoC features, may need to add touchscreen for specific machines
> -MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 screen alsa ethernet gpu"
> +MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 screen alsa ethernet"
>  
>  IMAGE_FSTYPES += "tar.xz wic.xz wic.bmap"
>  WKS_FILE ?= "sdimage-2part.wks"
> -- 
> 2.34.1

