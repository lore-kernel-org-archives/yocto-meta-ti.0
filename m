Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D8D5C05027
	for <webhook@archiver.kernel.org>; Thu, 26 Jan 2023 18:02:15 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.81110.1674756129728406028
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 26 Jan 2023 10:02:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=efosOv99;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 30QI29Bp087958
	for <meta-ti@lists.yoctoproject.org>; Thu, 26 Jan 2023 12:02:09 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1674756129;
	bh=zjX6hKP0CXhdebSUwsm4CxWINDfreL9+QBC4YYcmKdI=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=efosOv99PwaAIMjj2eGunARTMxKPEpryR40I5znKV/rh5E3vPt/RkApKVZC+teBtf
	 TEeu9gyj1PVzZjDdQc5RQX8fhuyehphnNC2wCwNhzEkAySQs5GoVTywJPZqjYQTx29
	 UymXFwXYEiTeMNahCjfS7lERst7oymEwsx2awL5g=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 30QI29oh026077
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 26 Jan 2023 12:02:09 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Thu, 26
 Jan 2023 12:02:08 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Thu, 26 Jan 2023 12:02:08 -0600
Received: from [10.250.32.60] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 30QI28Yh079542;
	Thu, 26 Jan 2023 12:02:08 -0600
Message-ID: <475e77fb-0d0e-24de-5d9f-567078615ad5@ti.com>
Date: Thu, 26 Jan 2023 12:02:07 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [kirkstone PATCH 3/4] meta-ti-bsp: machine: Remove all gpu
 features
Content-Language: en-US
To: Randolph Sapp <rs@ti.com>, <denys@ti.com>, <reatmon@ti.com>,
        <detheridge@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <k-bhargav@ti.com>
References: <20230126030834.3889448-1-rs@ti.com>
 <20230126030834.3889448-4-rs@ti.com>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20230126030834.3889448-4-rs@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 26 Jan 2023 18:02:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15678

On 1/25/23 9:08 PM, Randolph Sapp wrote:
> Remove all gpu machine features and instead rely on the new dependency
> chain for resolving gpu dependencies. Set preferred providers for
> virtual/gpudriver where needed.
> 
> Signed-off-by: Randolph Sapp <rs@ti.com>
> ---
>   meta-ti-bsp/conf/machine/am62xx-lp-evm.conf   | 2 --
>   meta-ti-bsp/conf/machine/include/am62xx.inc   | 6 +-----
>   meta-ti-bsp/conf/machine/include/am65xx.inc   | 6 +-----
>   meta-ti-bsp/conf/machine/include/j721e.inc    | 6 ------
>   meta-ti-bsp/conf/machine/include/j721s2.inc   | 6 ------
>   meta-ti-bsp/conf/machine/include/j784s4.inc   | 6 ------
>   meta-ti-bsp/conf/machine/include/omap-a15.inc | 6 +-----
>   meta-ti-bsp/conf/machine/include/ti33x.inc    | 6 +-----
>   meta-ti-bsp/conf/machine/include/ti43x.inc    | 6 +-----
>   meta-ti-bsp/conf/machine/j784s4-evm.conf      | 2 ++
>   10 files changed, 7 insertions(+), 45 deletions(-)
> 
> diff --git a/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf b/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
> index ef8e8692..ec9ce596 100644
> --- a/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
> +++ b/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
> @@ -4,8 +4,6 @@
>   
>   require conf/machine/include/am62xx.inc
>   
> -MACHINE_FEATURES += "gpu"
> -
>   KERNEL_DEVICETREE = " \
>       ti/k3-am62x-lp-sk.dtb \
>       ti/k3-am625-skeleton.dtb \
> diff --git a/meta-ti-bsp/conf/machine/include/am62xx.inc b/meta-ti-bsp/conf/machine/include/am62xx.inc
> index 411e5265..35f3f071 100644
> --- a/meta-ti-bsp/conf/machine/include/am62xx.inc
> +++ b/meta-ti-bsp/conf/machine/include/am62xx.inc
> @@ -1,15 +1,11 @@
>   require conf/machine/include/k3.inc
>   SOC_FAMILY:append = ":am62xx"
>   
> -MACHINE_FEATURES += "screen touchscreen gpu"
> +MACHINE_FEATURES += "screen touchscreen"
>   
>   SERIAL_CONSOLES = "115200;ttyS2"
>   SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
>   
> -PREFERRED_PROVIDER_virtual/egl ?= "ti-img-rogue-umlibs"
> -PREFERRED_PROVIDER_virtual/libgles1 ?= "ti-img-rogue-umlibs"
> -PREFERRED_PROVIDER_virtual/libgles2 ?= "ti-img-rogue-umlibs"
> -PREFERRED_PROVIDER_virtual/libgbm ?= "ti-img-rogue-umlibs"
>   PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-img-rogue-driver"
>   
>   TFA_BOARD = "lite"
> diff --git a/meta-ti-bsp/conf/machine/include/am65xx.inc b/meta-ti-bsp/conf/machine/include/am65xx.inc
> index 424864d3..385bb164 100644
> --- a/meta-ti-bsp/conf/machine/include/am65xx.inc
> +++ b/meta-ti-bsp/conf/machine/include/am65xx.inc
> @@ -1,15 +1,11 @@
>   require conf/machine/include/k3.inc
>   SOC_FAMILY:append = ":am65xx"
>   
> -MACHINE_FEATURES += "screen touchscreen gpu"
> +MACHINE_FEATURES += "screen touchscreen"
>   
>   SERIAL_CONSOLES = "115200;ttyS2 115200;ttyS1"
>   SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
>   
> -PREFERRED_PROVIDER_virtual/egl ?= "ti-sgx-ddk-um"
> -PREFERRED_PROVIDER_virtual/libgles1 ?= "ti-sgx-ddk-um"
> -PREFERRED_PROVIDER_virtual/libgles2 ?= "ti-sgx-ddk-um"
> -PREFERRED_PROVIDER_virtual/libgbm ?= "ti-sgx-ddk-um"
>   PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-sgx-ddk-km"
>   
>   KERNEL_DEVICETREE = " \
> diff --git a/meta-ti-bsp/conf/machine/include/j721e.inc b/meta-ti-bsp/conf/machine/include/j721e.inc
> index eba10d8d..67f5fe0f 100644
> --- a/meta-ti-bsp/conf/machine/include/j721e.inc
> +++ b/meta-ti-bsp/conf/machine/include/j721e.inc
> @@ -1,12 +1,6 @@
>   require conf/machine/include/k3.inc
>   SOC_FAMILY:append = ":j721e"
>   
> -MACHINE_FEATURES += "gpu"
> -
> -PREFERRED_PROVIDER_virtual/egl ?= "ti-img-rogue-umlibs"
> -PREFERRED_PROVIDER_virtual/libgles1 ?= "ti-img-rogue-umlibs"
> -PREFERRED_PROVIDER_virtual/libgles2 ?= "ti-img-rogue-umlibs"
> -PREFERRED_PROVIDER_virtual/libgbm ?= "ti-img-rogue-umlibs"
>   PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-img-rogue-driver"
>   
>   # On J721e the file tiboot3.bin comes from the bootloader not ti-sci-fw
> diff --git a/meta-ti-bsp/conf/machine/include/j721s2.inc b/meta-ti-bsp/conf/machine/include/j721s2.inc
> index fc6493b8..f33a3aba 100644
> --- a/meta-ti-bsp/conf/machine/include/j721s2.inc
> +++ b/meta-ti-bsp/conf/machine/include/j721s2.inc
> @@ -1,12 +1,6 @@
>   require conf/machine/include/k3.inc
>   SOC_FAMILY:append = ":j721s2"
>   
> -MACHINE_FEATURES += "gpu"
> -
> -PREFERRED_PROVIDER_virtual/egl ?= "ti-img-rogue-umlibs"
> -PREFERRED_PROVIDER_virtual/libgles1 ?= "ti-img-rogue-umlibs"
> -PREFERRED_PROVIDER_virtual/libgles2 ?= "ti-img-rogue-umlibs"
> -PREFERRED_PROVIDER_virtual/libgbm ?= "ti-img-rogue-umlibs"
>   PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-img-rogue-driver"
>   
>   TFA_BOARD = "generic"
> diff --git a/meta-ti-bsp/conf/machine/include/j784s4.inc b/meta-ti-bsp/conf/machine/include/j784s4.inc
> index d268b810..df0faede 100644
> --- a/meta-ti-bsp/conf/machine/include/j784s4.inc
> +++ b/meta-ti-bsp/conf/machine/include/j784s4.inc
> @@ -1,12 +1,6 @@
>   require conf/machine/include/k3.inc
>   SOC_FAMILY:append = ":j784s4"
>   
> -MACHINE_FEATURES += "gpu"
> -
> -PREFERRED_PROVIDER_virtual/egl ?= "ti-img-rogue-umlibs"
> -PREFERRED_PROVIDER_virtual/libgles1 ?= "ti-img-rogue-umlibs"
> -PREFERRED_PROVIDER_virtual/libgles2 ?= "ti-img-rogue-umlibs"
> -PREFERRED_PROVIDER_virtual/libgbm ?= "ti-img-rogue-umlibs"
>   PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-img-rogue-driver"
>   
>   TFA_BOARD = "j784s4"
> diff --git a/meta-ti-bsp/conf/machine/include/omap-a15.inc b/meta-ti-bsp/conf/machine/include/omap-a15.inc
> index 0843fb28..efa33a10 100644
> --- a/meta-ti-bsp/conf/machine/include/omap-a15.inc
> +++ b/meta-ti-bsp/conf/machine/include/omap-a15.inc
> @@ -10,10 +10,6 @@ MACHINE_KERNEL_PR = "r7"
>   PREFERRED_PROVIDER_virtual/kernel ?= "linux-ti-staging"
>   PREFERRED_PROVIDER_virtual/bootloader ?= "u-boot-ti-staging"
>   PREFERRED_PROVIDER_u-boot ?= "u-boot-ti-staging"
> -PREFERRED_PROVIDER_virtual/egl ?= "ti-sgx-ddk-um"
> -PREFERRED_PROVIDER_virtual/libgles1 ?= "ti-sgx-ddk-um"
> -PREFERRED_PROVIDER_virtual/libgles2 ?= "ti-sgx-ddk-um"
> -PREFERRED_PROVIDER_virtual/libgbm ?= "ti-sgx-ddk-um"
>   PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-sgx-ddk-km"
>   
>   KERNEL_IMAGETYPE = "zImage"
> @@ -45,7 +41,7 @@ EXTRA_IMAGEDEPENDS += "virtual/bootloader"
>   UBI_VOLNAME = "rootfs"
>   
>   # List common SoC features, may need to add touchscreen for specific machines
> -MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 screen alsa ethernet gpu mmip dsp gc320"
> +MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 screen alsa ethernet mmip dsp gc320"
>   
>   IMAGE_FSTYPES += "tar.xz wic.xz wic.bmap"
>   WKS_FILE ?= "sdimage-2part.wks"
> diff --git a/meta-ti-bsp/conf/machine/include/ti33x.inc b/meta-ti-bsp/conf/machine/include/ti33x.inc
> index cfacc30d..e2f75359 100644
> --- a/meta-ti-bsp/conf/machine/include/ti33x.inc
> +++ b/meta-ti-bsp/conf/machine/include/ti33x.inc
> @@ -11,10 +11,6 @@ MACHINE_KERNEL_PR = "r22"
>   PREFERRED_PROVIDER_virtual/kernel ?= "linux-ti-staging"
>   PREFERRED_PROVIDER_virtual/bootloader ?= "u-boot-ti-staging"
>   PREFERRED_PROVIDER_u-boot ?= "u-boot-ti-staging"
> -PREFERRED_PROVIDER_virtual/egl ?= "ti-sgx-ddk-um"
> -PREFERRED_PROVIDER_virtual/libgles1 ?= "ti-sgx-ddk-um"
> -PREFERRED_PROVIDER_virtual/libgles2 ?= "ti-sgx-ddk-um"
> -PREFERRED_PROVIDER_virtual/libgbm ?= "ti-sgx-ddk-um"
>   PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-sgx-ddk-km"
>   
>   KERNEL_IMAGETYPE = "zImage"
> @@ -55,7 +51,7 @@ UBI_VOLNAME = "rootfs"
>   EXTRA_IMAGEDEPENDS += "virtual/bootloader"
>   
>   # List common SoC features, may need to add touchscreen for specific machines
> -MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 alsa ethernet gpu"
> +MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 alsa ethernet"
>   
>   IMAGE_FSTYPES += "tar.xz wic.xz wic.bmap"
>   WKS_FILE ?= "sdimage-2part.wks"
> diff --git a/meta-ti-bsp/conf/machine/include/ti43x.inc b/meta-ti-bsp/conf/machine/include/ti43x.inc
> index 74a964db..e9999910 100644
> --- a/meta-ti-bsp/conf/machine/include/ti43x.inc
> +++ b/meta-ti-bsp/conf/machine/include/ti43x.inc
> @@ -11,10 +11,6 @@ MACHINE_KERNEL_PR = "r3"
>   PREFERRED_PROVIDER_virtual/kernel ?= "linux-ti-staging"
>   PREFERRED_PROVIDER_virtual/bootloader ?= "u-boot-ti-staging"
>   PREFERRED_PROVIDER_u-boot ?= "u-boot-ti-staging"
> -PREFERRED_PROVIDER_virtual/egl ?= "ti-sgx-ddk-um"
> -PREFERRED_PROVIDER_virtual/libgles1 ?= "ti-sgx-ddk-um"
> -PREFERRED_PROVIDER_virtual/libgles2 ?= "ti-sgx-ddk-um"
> -PREFERRED_PROVIDER_virtual/libgbm ?= "ti-sgx-ddk-um"

Thought we were going to call our version of mesa "ti-mesa" or similar,
then we could PREFERRED_PROVIDER_virtual/x ?= "ti-mesa" here in these
machine specific includes. Otherwise everyone who includes our BSP gets
our hacky version of Mesa no matter what machine they are building for
since we call it the same name..

As before, not a blocker, lets iterate later

>   PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-sgx-ddk-km"
>   
>   KERNEL_IMAGETYPE = "zImage"
> @@ -54,7 +50,7 @@ UBI_VOLNAME = "rootfs"
>   EXTRA_IMAGEDEPENDS += "u-boot"
>   
>   # List common SoC features, may need to add touchscreen for specific machines
> -MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 screen alsa ethernet gpu"
> +MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 screen alsa ethernet"
>   
>   IMAGE_FSTYPES += "tar.xz wic.xz wic.bmap"
>   WKS_FILE ?= "sdimage-2part.wks"
> diff --git a/meta-ti-bsp/conf/machine/j784s4-evm.conf b/meta-ti-bsp/conf/machine/j784s4-evm.conf
> index 73f3eb8c..796ca116 100644
> --- a/meta-ti-bsp/conf/machine/j784s4-evm.conf
> +++ b/meta-ti-bsp/conf/machine/j784s4-evm.conf
> @@ -9,6 +9,8 @@ SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
>   TFA_K3_USART = "0x8"
>   OPTEE_K3_USART = "0x8"
>   
> +PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-img-rogue-driver"
> +

Don't think this is needed as we already do this in j784s4.inc.

Otherwise,

Acked-by: Andrew Davis <afd@ti.com>

>   KERNEL_DEVICETREE = " \
>       ti/k3-j784s4-evm.dtb \
>   "

