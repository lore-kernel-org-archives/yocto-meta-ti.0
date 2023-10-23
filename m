Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9E6CC25B45
	for <webhook@archiver.kernel.org>; Mon, 23 Oct 2023 18:48:13 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.129577.1698086893260658550
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 23 Oct 2023 11:48:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=aVKsZ5aW;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: afd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 39NIm7XN109854;
	Mon, 23 Oct 2023 13:48:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1698086887;
	bh=kvknIqtExq06Vo3mw6tHs9XOdffDnqn2V7vLmyPVgdc=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=aVKsZ5aWKXz1fcZhlG0xBIwzaUzJU3bDhQBKdjKUaZ9d/hC/yJ6x8SbDDbz+VEyU1
	 BVz7WwmHDQ14kFUIW+r7ZEWJVm80eYCKnCDtRM3zXSo3f/HHSDPZq137492I8//Hr2
	 Pjq+PZwcPxFCjArshaICoChI0Py37tQEUQZWcGuQ=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 39NIm7PI051204
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 23 Oct 2023 13:48:07 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 23
 Oct 2023 13:48:07 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 23 Oct 2023 13:48:07 -0500
Received: from [10.250.38.120] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 39NIm60k027321;
	Mon, 23 Oct 2023 13:48:06 -0500
Message-ID: <894c5dcb-d84d-41f5-8b25-8902458b35e9@ti.com>
Date: Mon, 23 Oct 2023 13:48:06 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] [RFC][master/kirkstone][PATCH] conf: machine: move
 RDEPENDS and RRECOMMENDS from kernel-rdepends.inc
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>, <meta-ti@lists.yoctoproject.org>
CC: Denys Dmytriyenko <denys@konsulko.com>
References: <20231023181902.1152453-1-denis@denix.org>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20231023181902.1152453-1-denis@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 23 Oct 2023 18:48:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17176

On 10/23/23 1:19 PM, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@konsulko.com>
> 
> Instead of making kernel RDEPENDS on devicetree and different FW images with
> lots of machine-override appends that are hard to modify downstream, use proper
> MACHINE_ESSENTIAL_EXTRA_RDEPENDS and MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS vars
> that are specifically designed for this purpose.
> 
> This also makes such dependencies generic and not tied to a particular kernel
> recipe including kernel-rdepends.inc with the entire machine-specific list.
> 
> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> ---

Acked-by: Andrew Davis <afd@ti.com>

>   meta-ti-bsp/conf/machine/am65xx-evm.conf      |  2 +
>   meta-ti-bsp/conf/machine/beagle-x15.conf      |  2 -
>   meta-ti-bsp/conf/machine/beaglebone-ai64.conf |  4 --
>   meta-ti-bsp/conf/machine/beaglebone.conf      |  4 --
>   meta-ti-bsp/conf/machine/beagleplay.conf      |  4 --
>   meta-ti-bsp/conf/machine/include/am62axx.inc  |  2 +
>   meta-ti-bsp/conf/machine/include/am64xx.inc   |  2 +
>   meta-ti-bsp/conf/machine/include/am65xx.inc   |  2 +
>   meta-ti-bsp/conf/machine/include/j7200.inc    |  2 +
>   meta-ti-bsp/conf/machine/include/j721e.inc    |  2 +
>   meta-ti-bsp/conf/machine/include/j721s2.inc   |  2 +
>   meta-ti-bsp/conf/machine/include/j784s4.inc   |  2 +
>   meta-ti-bsp/conf/machine/include/k3.inc       |  2 +
>   meta-ti-bsp/conf/machine/include/omap-a15.inc |  4 ++
>   meta-ti-bsp/conf/machine/include/omapl138.inc |  2 +
>   meta-ti-bsp/conf/machine/include/ti-soc.inc   |  4 ++
>   meta-ti-bsp/conf/machine/include/ti33x.inc    |  4 ++
>   meta-ti-bsp/conf/machine/include/ti43x.inc    |  6 ++-
>   .../recipes-kernel/linux/kernel-rdepends.inc  | 38 -------------------
>   .../linux/linux-ti-mainline_git.bb            |  1 -
>   .../linux/linux-ti-staging_5.10.bb            |  1 -
>   .../linux/linux-ti-staging_6.1.bb             |  1 -
>   22 files changed, 37 insertions(+), 56 deletions(-)
>   delete mode 100644 meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc
> 
> diff --git a/meta-ti-bsp/conf/machine/am65xx-evm.conf b/meta-ti-bsp/conf/machine/am65xx-evm.conf
> index 8b6ef546..f6eb6f0c 100644
> --- a/meta-ti-bsp/conf/machine/am65xx-evm.conf
> +++ b/meta-ti-bsp/conf/machine/am65xx-evm.conf
> @@ -5,3 +5,5 @@
>   require conf/machine/include/am65xx.inc
>   
>   UBOOT_MACHINE = "am65x_evm_a53_defconfig"
> +
> +MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "prueth-fw-am65x-sr2 pruhsr-fw-am65x-sr2 prusw-fw-am65x-sr2"
> diff --git a/meta-ti-bsp/conf/machine/beagle-x15.conf b/meta-ti-bsp/conf/machine/beagle-x15.conf
> index 3b857165..be27705c 100644
> --- a/meta-ti-bsp/conf/machine/beagle-x15.conf
> +++ b/meta-ti-bsp/conf/machine/beagle-x15.conf
> @@ -19,5 +19,3 @@ MACHINE_GUI_CLASS = "bigscreen"
>   SERIAL_CONSOLES = "115200;ttyS2"
>   
>   UBOOT_MACHINE = "am57xx_evm_config"
> -
> -MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "kernel-devicetree kernel-image-zimage"
> diff --git a/meta-ti-bsp/conf/machine/beaglebone-ai64.conf b/meta-ti-bsp/conf/machine/beaglebone-ai64.conf
> index 3f5a027e..e529f565 100644
> --- a/meta-ti-bsp/conf/machine/beaglebone-ai64.conf
> +++ b/meta-ti-bsp/conf/machine/beaglebone-ai64.conf
> @@ -24,7 +24,3 @@ ti/k3-j721e-sk.dtb \
>   "
>   
>   MACHINE_GUI_CLASS = "bigscreen"
> -
> -MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "kernel-devicetree kernel-image-image"
> -
> -MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "cadence-mhdp-fw vxd-dec-fw"
> diff --git a/meta-ti-bsp/conf/machine/beaglebone.conf b/meta-ti-bsp/conf/machine/beaglebone.conf
> index 45944ce8..d9353e9b 100644
> --- a/meta-ti-bsp/conf/machine/beaglebone.conf
> +++ b/meta-ti-bsp/conf/machine/beaglebone.conf
> @@ -21,7 +21,3 @@ MACHINE_GUI_CLASS = "bigscreen"
>   MACHINE_FEATURES += "screen"
>   
>   SERIAL_CONSOLES = "115200;ttyS0"
> -
> -MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "kernel-devicetree kernel-image-zimage"
> -
> -MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "amx3-cm3"
> diff --git a/meta-ti-bsp/conf/machine/beagleplay.conf b/meta-ti-bsp/conf/machine/beagleplay.conf
> index 4dd550a1..978bbc5a 100644
> --- a/meta-ti-bsp/conf/machine/beagleplay.conf
> +++ b/meta-ti-bsp/conf/machine/beagleplay.conf
> @@ -42,7 +42,3 @@ ti/k3-am625-sk-rpi-hdr-pwm.dtbo \
>   "
>   
>   MACHINE_GUI_CLASS = "bigscreen"
> -
> -MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "kernel-devicetree kernel-image-image"
> -
> -MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += ""
> diff --git a/meta-ti-bsp/conf/machine/include/am62axx.inc b/meta-ti-bsp/conf/machine/include/am62axx.inc
> index 12889057..93a41d8d 100644
> --- a/meta-ti-bsp/conf/machine/include/am62axx.inc
> +++ b/meta-ti-bsp/conf/machine/include/am62axx.inc
> @@ -16,3 +16,5 @@ IMAGE_BOOT_FILES += "tiboot3-am62ax-hs-evm.bin"
>   
>   TFA_BOARD = "lite"
>   OPTEEMACHINE = "k3-am62x"
> +
> +MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "cnm-wave-fw"
> diff --git a/meta-ti-bsp/conf/machine/include/am64xx.inc b/meta-ti-bsp/conf/machine/include/am64xx.inc
> index 9112b78b..85652eef 100644
> --- a/meta-ti-bsp/conf/machine/include/am64xx.inc
> +++ b/meta-ti-bsp/conf/machine/include/am64xx.inc
> @@ -20,3 +20,5 @@ IMAGE_BOOT_FILES += "tiboot3-am64x_sr2-hs-evm.bin"
>   TFA_BOARD = "lite"
>   
>   OPTEEMACHINE = "k3-am64x"
> +
> +MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "prueth-fw-am65x-sr2 pruhsr-fw-am65x-sr2 prusw-fw-am65x-sr2"
> diff --git a/meta-ti-bsp/conf/machine/include/am65xx.inc b/meta-ti-bsp/conf/machine/include/am65xx.inc
> index 2c427b88..7c9d5fb1 100644
> --- a/meta-ti-bsp/conf/machine/include/am65xx.inc
> +++ b/meta-ti-bsp/conf/machine/include/am65xx.inc
> @@ -25,3 +25,5 @@ IMAGE_BOOT_FILES += "sysfw-am65x_sr2-hs-evm.itb"
>   TFA_BOARD = "generic"
>   
>   OPTEEMACHINE = "k3-am65x"
> +
> +MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "prueth-fw-am65x"
> diff --git a/meta-ti-bsp/conf/machine/include/j7200.inc b/meta-ti-bsp/conf/machine/include/j7200.inc
> index d21e26cc..f23e70cd 100644
> --- a/meta-ti-bsp/conf/machine/include/j7200.inc
> +++ b/meta-ti-bsp/conf/machine/include/j7200.inc
> @@ -4,3 +4,5 @@ SOC_FAMILY:append = ":j7200"
>   TFA_BOARD = "generic"
>   
>   OPTEEMACHINE = "k3-j721e"
> +
> +MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "ti-eth-fw"
> diff --git a/meta-ti-bsp/conf/machine/include/j721e.inc b/meta-ti-bsp/conf/machine/include/j721e.inc
> index ca653770..92235527 100644
> --- a/meta-ti-bsp/conf/machine/include/j721e.inc
> +++ b/meta-ti-bsp/conf/machine/include/j721e.inc
> @@ -23,3 +23,5 @@ IMAGE_BOOT_FILES += "sysfw-j721e_sr1_1-hs-evm.itb"
>   TFA_BOARD = "generic"
>   
>   OPTEEMACHINE = "k3-j721e"
> +
> +MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "cadence-mhdp-fw vxd-dec-fw ti-eth-fw"
> diff --git a/meta-ti-bsp/conf/machine/include/j721s2.inc b/meta-ti-bsp/conf/machine/include/j721s2.inc
> index 98cc611f..cc58fb89 100644
> --- a/meta-ti-bsp/conf/machine/include/j721s2.inc
> +++ b/meta-ti-bsp/conf/machine/include/j721s2.inc
> @@ -9,3 +9,5 @@ PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-img-rogue-driver"
>   TFA_BOARD = "generic"
>   
>   OPTEEMACHINE = "k3-j784s4"
> +
> +MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "cadence-mhdp-fw cnm-wave-fw"
> diff --git a/meta-ti-bsp/conf/machine/include/j784s4.inc b/meta-ti-bsp/conf/machine/include/j784s4.inc
> index de207687..d4cf876b 100644
> --- a/meta-ti-bsp/conf/machine/include/j784s4.inc
> +++ b/meta-ti-bsp/conf/machine/include/j784s4.inc
> @@ -9,3 +9,5 @@ PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-img-rogue-driver"
>   TFA_BOARD = "j784s4"
>   
>   OPTEEMACHINE = "k3-j784s4"
> +
> +MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "cadence-mhdp-fw cnm-wave-fw ti-eth-fw"
> diff --git a/meta-ti-bsp/conf/machine/include/k3.inc b/meta-ti-bsp/conf/machine/include/k3.inc
> index a8e80fa7..2415f0ba 100644
> --- a/meta-ti-bsp/conf/machine/include/k3.inc
> +++ b/meta-ti-bsp/conf/machine/include/k3.inc
> @@ -40,6 +40,8 @@ FIT_SIGN_ALG ?= "rsa4096"
>   
>   EXTRA_IMAGEDEPENDS += "virtual/bootloader"
>   
> +MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "kernel-image-image"
> +
>   TFA_PLATFORM = "k3"
>   
>   # Use the expected value of the ubifs filesystem's volume name in the kernel
> diff --git a/meta-ti-bsp/conf/machine/include/omap-a15.inc b/meta-ti-bsp/conf/machine/include/omap-a15.inc
> index c1eb659b..b68b32f6 100644
> --- a/meta-ti-bsp/conf/machine/include/omap-a15.inc
> +++ b/meta-ti-bsp/conf/machine/include/omap-a15.inc
> @@ -40,6 +40,10 @@ UBOOT_SUFFIX = "img"
>   
>   EXTRA_IMAGEDEPENDS += "virtual/bootloader"
>   
> +MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "kernel-image-zimage"
> +
> +MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "vpdma-fw goodix-fw prueth-fw prusw-fw pruhsr-fw pruprp-fw"
> +
>   # Use the expected value of the ubifs filesystem's volume name in the kernel
>   # and u-boot.
>   UBI_VOLNAME = "rootfs"
> diff --git a/meta-ti-bsp/conf/machine/include/omapl138.inc b/meta-ti-bsp/conf/machine/include/omapl138.inc
> index 72cfd659..7f8262a5 100644
> --- a/meta-ti-bsp/conf/machine/include/omapl138.inc
> +++ b/meta-ti-bsp/conf/machine/include/omapl138.inc
> @@ -11,4 +11,6 @@ PREFERRED_PROVIDER_u-boot = "u-boot-ti-staging"
>   
>   EXTRA_IMAGEDEPENDS += "virtual/bootloader"
>   
> +MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "kernel-image-zimage"
> +
>   MACHINE_FEATURES = "serial usbhost usbgadget alsa"
> diff --git a/meta-ti-bsp/conf/machine/include/ti-soc.inc b/meta-ti-bsp/conf/machine/include/ti-soc.inc
> index 2792d2a0..a1fd3cbf 100644
> --- a/meta-ti-bsp/conf/machine/include/ti-soc.inc
> +++ b/meta-ti-bsp/conf/machine/include/ti-soc.inc
> @@ -1,5 +1,9 @@
>   # This is a generic TI SOC family. It is a superset of all other SOCs
>   # and platforms defined in meta-ti to allow BSP-level overrides.
>   SOC_FAMILY = "ti-soc"
> +
> +# TI platforms all use devicetrees with overlays
> +MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "kernel-devicetree"
>   KERNEL_DTB_OVERLAY_SUPPORT ?= "1"
> +
>   require conf/machine/include/soc-family.inc
> diff --git a/meta-ti-bsp/conf/machine/include/ti33x.inc b/meta-ti-bsp/conf/machine/include/ti33x.inc
> index 567cf128..d6a70895 100644
> --- a/meta-ti-bsp/conf/machine/include/ti33x.inc
> +++ b/meta-ti-bsp/conf/machine/include/ti33x.inc
> @@ -63,6 +63,10 @@ UBI_VOLNAME = "rootfs"
>   
>   EXTRA_IMAGEDEPENDS += "virtual/bootloader"
>   
> +MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "kernel-image-zimage"
> +
> +MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "amx3-cm3 prueth-fw pruhsr-fw pruprp-fw"
> +
>   # List common SoC features, may need to add touchscreen for specific machines
>   MACHINE_FEATURES = "apm usbgadget usbhost vfat ext2 alsa gpu"
>   
> diff --git a/meta-ti-bsp/conf/machine/include/ti43x.inc b/meta-ti-bsp/conf/machine/include/ti43x.inc
> index c70a8363..05a28b77 100644
> --- a/meta-ti-bsp/conf/machine/include/ti43x.inc
> +++ b/meta-ti-bsp/conf/machine/include/ti43x.inc
> @@ -57,7 +57,11 @@ UBOOT_SUFFIX = "img"
>   # and u-boot.
>   UBI_VOLNAME = "rootfs"
>   
> -EXTRA_IMAGEDEPENDS += "u-boot"
> +EXTRA_IMAGEDEPENDS += "virtual/bootloader"
> +
> +MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "kernel-image-zimage"
> +
> +MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "amx3-cm3 prueth-fw pruhsr-fw pruprp-fw"
>   
>   # List common SoC features, may need to add touchscreen for specific machines
>   MACHINE_FEATURES = "apm usbgadget usbhost vfat ext2 screen alsa gpu"
> diff --git a/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc b/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc
> deleted file mode 100644
> index 266a7ef5..00000000
> --- a/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc
> +++ /dev/null
> @@ -1,38 +0,0 @@
> -# Pull in the devicetree files into the rootfs
> -RDEPENDS:${KERNEL_PACKAGE_NAME}-base += "kernel-devicetree"
> -
> -# Add run-time dependency for PM firmware to the rootfs
> -RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:ti33x = " amx3-cm3"
> -RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:ti43x = " amx3-cm3"
> -
> -# Add run-time dependency for VPE VPDMA firmware to the rootfs
> -RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:dra7xx = " vpdma-fw"
> -
> -# Add run-time dependency for Goodix firmware to the rootfs
> -RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:dra7xx = " goodix-fw"
> -
> -# Add run-time dependency for PRU Ethernet firmware to the rootfs
> -RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:am57xx = " prueth-fw prusw-fw pruhsr-fw pruprp-fw"
> -RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:ti43x = " prueth-fw pruhsr-fw pruprp-fw"
> -RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:ti33x = " prueth-fw pruhsr-fw pruprp-fw"
> -RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:am65xx = " prueth-fw-am65x"
> -RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:am65xx-evm = " prueth-fw-am65x-sr2 pruhsr-fw-am65x-sr2 prusw-fw-am65x-sr2"
> -RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:am64xx = " prueth-fw-am65x-sr2 pruhsr-fw-am65x-sr2 prusw-fw-am65x-sr2"
> -
> -# Add run-time dependency for Cadence MHDP firmware to the rootfs
> -RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:j721e = " cadence-mhdp-fw"
> -RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:j721s2 = " cadence-mhdp-fw"
> -RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:j784s4 = " cadence-mhdp-fw"
> -
> -# Add run-time dependency for Video Decoding firmware to the rootfs
> -RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:j721e = " vxd-dec-fw"
> -
> -# Add run-time dependency for Chips&Media Wave521 firmware to the rootfs
> -RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:j721s2 = " cnm-wave-fw"
> -RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:j784s4 = " cnm-wave-fw"
> -RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:am62axx = " cnm-wave-fw"
> -
> -# Add run-time dependency for TI ETH firmware to the rootfs
> -RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:j721e = " ti-eth-fw"
> -RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:j7200 = " ti-eth-fw"
> -RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:j784s4 = " ti-eth-fw"
> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
> index dfa46f48..a7b5ca74 100644
> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
> @@ -5,7 +5,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
>   
>   inherit kernel
>   
> -require recipes-kernel/linux/kernel-rdepends.inc
>   require recipes-kernel/linux/ti-kernel.inc
>   
>   DEPENDS += "gmp-native libmpc-native"
> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_5.10.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_5.10.bb
> index 7f3911e4..0cf0a319 100644
> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_5.10.bb
> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_5.10.bb
> @@ -9,7 +9,6 @@ inherit kernel
>   
>   DEFCONFIG_BUILDER = "${S}/ti_config_fragments/defconfig_builder.sh"
>   require recipes-kernel/linux/setup-defconfig.inc
> -require recipes-kernel/linux/kernel-rdepends.inc
>   require recipes-kernel/linux/ti-kernel.inc
>   include ${@ 'recipes-kernel/linux/ti-kernel-devicetree-prefix.inc' if d.getVar('KERNEL_DEVICETREE_PREFIX') else ''}
>   
> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
> index 66be6944..ee106a7f 100644
> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
> @@ -7,7 +7,6 @@ inherit ti-secdev
>   inherit kernel
>   
>   require recipes-kernel/linux/setup-defconfig.inc
> -require recipes-kernel/linux/kernel-rdepends.inc
>   require recipes-kernel/linux/ti-kernel.inc
>   include ${@ 'recipes-kernel/linux/ti-kernel-devicetree-prefix.inc' if d.getVar('KERNEL_DEVICETREE_PREFIX') else ''}
>   include ${@ 'recipes-kernel/linux/ti-extras.inc' if d.getVar('TI_EXTRAS') else ''}
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#17175): https://lists.yoctoproject.org/g/meta-ti/message/17175
> Mute This Topic: https://lists.yoctoproject.org/mt/102141624/3619733
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/leave/6695306/3619733/2033773410/xyzzy [afd@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

