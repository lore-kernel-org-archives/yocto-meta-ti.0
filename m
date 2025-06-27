Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54ED2C77B7F
	for <webhook@archiver.kernel.org>; Fri, 27 Jun 2025 19:48:39 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.1862.1751053715290336417
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 27 Jun 2025 12:48:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=YhOyvfbT;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: reatmon@ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55RJmXJo2830831;
	Fri, 27 Jun 2025 14:48:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1751053713;
	bh=e5InE9ywlpcnBFK+K6ooD09V6HkuDZzio2Pd3zsgARU=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=YhOyvfbTeegAAB555LrJaFApMEBbCg5dFGfOsgQMMa/Kl8hVqulOZoljwo54maRTo
	 dWK8HVlngqK0qgZ1lq1yKg/ehJv92vVVzQty8+BNzfvI4N162w5RcwY/Y4PY+KMYnL
	 Zg/tvewzPe4Pa2oKozA7BwmojG4Yij3kkWeqKH/o=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55RJmXUs3256324
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 27 Jun 2025 14:48:33 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 27
 Jun 2025 14:48:33 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 27 Jun 2025 14:48:33 -0500
Received: from [10.249.37.202] ([10.249.37.202])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55RJmXDf3615956;
	Fri, 27 Jun 2025 14:48:33 -0500
Message-ID: <2c5f05c9-80c8-4b08-980f-b124600e1156@ti.com>
Date: Fri, 27 Jun 2025 14:48:33 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][scarthgap/master][PATCH 2/2] meta-ti-bsp: Add all
 tiboot3.bin variants by wildcard
To: Andrew Davis <afd@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20250627193003.575911-1-afd@ti.com>
 <20250627193003.575911-2-afd@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20250627193003.575911-2-afd@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 27 Jun 2025 19:48:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18712



On 6/27/2025 2:30 PM, Andrew Davis wrote:
> U-Boot generates all the valid versions of tiboot3.bin and picks the
> default based on the board's binman files. No need to duplicate this
> logic here, simply deploy what U-Boot gives us.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
>   meta-ti-bsp/conf/machine/include/am62axx.inc |  6 ------
>   meta-ti-bsp/conf/machine/include/am62dxx.inc |  6 ------
>   meta-ti-bsp/conf/machine/include/am62pxx.inc |  6 ------
>   meta-ti-bsp/conf/machine/include/am62xx.inc  |  9 ---------
>   meta-ti-bsp/conf/machine/include/am64xx.inc  |  9 ---------
>   meta-ti-bsp/conf/machine/include/am65xx.inc  |  2 --
>   meta-ti-bsp/conf/machine/include/am68.inc    |  6 ------
>   meta-ti-bsp/conf/machine/include/am69.inc    |  6 ------
>   meta-ti-bsp/conf/machine/include/j7200.inc   | 15 ---------------
>   meta-ti-bsp/conf/machine/include/j721e.inc   |  6 ------
>   meta-ti-bsp/conf/machine/include/j721s2.inc  |  9 ---------
>   meta-ti-bsp/conf/machine/include/j722s.inc   |  6 ------
>   meta-ti-bsp/conf/machine/include/j742s2.inc  |  6 ------
>   meta-ti-bsp/conf/machine/include/j784s4.inc  |  9 ---------
>   meta-ti-bsp/conf/machine/include/k3.inc      |  1 +
>   15 files changed, 1 insertion(+), 101 deletions(-)
> 
> diff --git a/meta-ti-bsp/conf/machine/include/am62axx.inc b/meta-ti-bsp/conf/machine/include/am62axx.inc
> index e5f827a9..964be0ad 100644
> --- a/meta-ti-bsp/conf/machine/include/am62axx.inc
> +++ b/meta-ti-bsp/conf/machine/include/am62axx.inc
> @@ -7,12 +7,6 @@ MACHINE_FEATURES += "screen touchscreen"
>   
>   TFA_K3_SYSTEM_SUSPEND = "1"
>   
> -# Default tiboot3.bin on AM62A is for HS-FS
> -IMAGE_BOOT_FILES += "tiboot3-am62ax-hs-fs-evm.bin"
> -
> -# Since default tiboot3.bin on AM62A is for HS-FS, add a version for HS-SE
> -IMAGE_BOOT_FILES += "tiboot3-am62ax-hs-evm.bin"
> -
>   TFA_BOARD = "lite"
>   OPTEEMACHINE = "k3-am62x"
>   
> diff --git a/meta-ti-bsp/conf/machine/include/am62dxx.inc b/meta-ti-bsp/conf/machine/include/am62dxx.inc
> index ac4e8e17..fc2ce4a3 100644
> --- a/meta-ti-bsp/conf/machine/include/am62dxx.inc
> +++ b/meta-ti-bsp/conf/machine/include/am62dxx.inc
> @@ -5,11 +5,5 @@ SOC_FAMILY:append = ":am62dxx"
>   
>   TFA_K3_SYSTEM_SUSPEND = "1"
>   
> -# Default tiboot3.bin on AM62D is for HS-FS
> -IMAGE_BOOT_FILES += "tiboot3-am62dx-hs-fs-evm.bin"
> -
> -# Since default tiboot3.bin on AM62D is for HS-FS, add a version for HS-SE
> -IMAGE_BOOT_FILES += "tiboot3-am62dx-hs-evm.bin"
> -
>   TFA_BOARD = "lite"
>   OPTEEMACHINE = "k3-am62x"
> diff --git a/meta-ti-bsp/conf/machine/include/am62pxx.inc b/meta-ti-bsp/conf/machine/include/am62pxx.inc
> index 061d0e67..d59f607d 100644
> --- a/meta-ti-bsp/conf/machine/include/am62pxx.inc
> +++ b/meta-ti-bsp/conf/machine/include/am62pxx.inc
> @@ -8,12 +8,6 @@ MACHINE_FEATURES += "screen gpu"
>   require conf/machine/include/mesa-pvr.inc
>   PREFERRED_PROVIDER_virtual/gpudriver ?= "${BSP_ROGUE_DRIVER_PROVIDER}"
>   
> -# Default tiboot3.bin on AM62Px is for HS-FS
> -IMAGE_BOOT_FILES += "tiboot3-am62px-hs-fs-evm.bin"
> -
> -# Since default tiboot3.bin on AM62Px is for HS-FS, add a version for HS-SE
> -IMAGE_BOOT_FILES += "tiboot3-am62px-hs-evm.bin"
> -
>   TFA_BOARD = "lite"
>   TFA_K3_SYSTEM_SUSPEND = "1"
>   
> diff --git a/meta-ti-bsp/conf/machine/include/am62xx.inc b/meta-ti-bsp/conf/machine/include/am62xx.inc
> index 1eb77b4e..74054a78 100644
> --- a/meta-ti-bsp/conf/machine/include/am62xx.inc
> +++ b/meta-ti-bsp/conf/machine/include/am62xx.inc
> @@ -8,15 +8,6 @@ MACHINE_FEATURES += "screen gpu"
>   require conf/machine/include/mesa-pvr.inc
>   PREFERRED_PROVIDER_virtual/gpudriver ?= "${BSP_ROGUE_DRIVER_PROVIDER}"
>   
> -# Default tiboot3.bin on AM62x is for HS-FS
> -IMAGE_BOOT_FILES += "tiboot3-am62x-hs-fs-evm.bin"
> -
> -# Since default tiboot3.bin on AM62x is for HS-FS, add a version for GP
> -IMAGE_BOOT_FILES += "tiboot3-am62x-gp-evm.bin"
> -
> -# Since default tiboot3.bin on AM62x is for HS-FS, add a version for HS-SE
> -IMAGE_BOOT_FILES += "tiboot3-am62x-hs-evm.bin"
> -
>   # Bitmap image tarball for early splashscreen
>   IMAGE_BOOT_FILES += "ti_logo_414x97_32bpp.bmp.gz"
>   
> diff --git a/meta-ti-bsp/conf/machine/include/am64xx.inc b/meta-ti-bsp/conf/machine/include/am64xx.inc
> index 56b56afe..e353e687 100644
> --- a/meta-ti-bsp/conf/machine/include/am64xx.inc
> +++ b/meta-ti-bsp/conf/machine/include/am64xx.inc
> @@ -20,15 +20,6 @@ KERNEL_DEVICETREE = " \
>       ti/k3-am642-tqma64xxl-mbax4xxl.dtb \
>   "
>   
> -# Default tiboot3.bin on AM64x is for SR2.0 HS-FS
> -IMAGE_BOOT_FILES += "tiboot3-am64x_sr2-hs-fs-evm.bin"
> -
> -# Since default tiboot3.bin on AM64x is for SR2.0 HS-FS, add a version for GP
> -IMAGE_BOOT_FILES += "tiboot3-am64x-gp-evm.bin"
> -
> -# Since default tiboot3.bin on AM64x is for SR2.0 HS-FS, add a version for SR2.0 HS-SE
> -IMAGE_BOOT_FILES += "tiboot3-am64x_sr2-hs-evm.bin"
> -
>   TFA_BOARD = "lite"
>   
>   OPTEEMACHINE = "k3-am64x"
> diff --git a/meta-ti-bsp/conf/machine/include/am65xx.inc b/meta-ti-bsp/conf/machine/include/am65xx.inc
> index 99a3b12f..feab624a 100644
> --- a/meta-ti-bsp/conf/machine/include/am65xx.inc
> +++ b/meta-ti-bsp/conf/machine/include/am65xx.inc
> @@ -28,11 +28,9 @@ KERNEL_DEVICETREE = " \
>   IMAGE_BOOT_FILES += "sysfw.itb"
>   
>   # Default on AM65x is for GP
> -IMAGE_BOOT_FILES += "tiboot3-am65x_sr2-gp-evm.bin"
>   IMAGE_BOOT_FILES += "sysfw-am65x_sr2-gp-evm.itb"
>   
>   # Since default on AM65x is for GP, add a version for HS-SE
> -IMAGE_BOOT_FILES += "tiboot3-am65x_sr2-hs-evm.bin"
>   IMAGE_BOOT_FILES += "sysfw-am65x_sr2-hs-evm.itb"
>   
>   TFA_BOARD = "generic"
> diff --git a/meta-ti-bsp/conf/machine/include/am68.inc b/meta-ti-bsp/conf/machine/include/am68.inc
> index 330a2973..b6d18fe0 100644
> --- a/meta-ti-bsp/conf/machine/include/am68.inc
> +++ b/meta-ti-bsp/conf/machine/include/am68.inc
> @@ -8,12 +8,6 @@ MACHINE_FEATURES += "screen gpu"
>   require conf/machine/include/mesa-pvr.inc
>   PREFERRED_PROVIDER_virtual/gpudriver ?= "${BSP_ROGUE_DRIVER_PROVIDER}"
>   
> -# Default tiboot3.bin on AM68 is for SR1.0 HS-FS
> -IMAGE_BOOT_FILES += "tiboot3-j721s2-hs-fs-evm.bin"
> -
> -# Since default tiboot3.bin on AM68 is for HS-FS, add a version for SR1.0 HS-SE
> -IMAGE_BOOT_FILES += "tiboot3-j721s2-hs-evm.bin"
> -
>   TFA_BOARD = "generic"
>   
>   OPTEEMACHINE = "k3-j784s4"
> diff --git a/meta-ti-bsp/conf/machine/include/am69.inc b/meta-ti-bsp/conf/machine/include/am69.inc
> index 1a19410a..759984ea 100644
> --- a/meta-ti-bsp/conf/machine/include/am69.inc
> +++ b/meta-ti-bsp/conf/machine/include/am69.inc
> @@ -8,12 +8,6 @@ MACHINE_FEATURES += "screen gpu"
>   require conf/machine/include/mesa-pvr.inc
>   PREFERRED_PROVIDER_virtual/gpudriver ?= "${BSP_ROGUE_DRIVER_PROVIDER}"
>   
> -# Default tiboot3.bin on AM69 is for SR1.0 HS-FS
> -IMAGE_BOOT_FILES += "tiboot3-j784s4-hs-fs-evm.bin"
> -
> -# Since default tiboot3.bin on AM69 is for HS-FS, add a version for SR1.0 HS-SE
> -IMAGE_BOOT_FILES += "tiboot3-j784s4-hs-evm.bin"
> -
>   TFA_BOARD = "j784s4"
>   
>   OPTEEMACHINE = "k3-j784s4"
> diff --git a/meta-ti-bsp/conf/machine/include/j7200.inc b/meta-ti-bsp/conf/machine/include/j7200.inc
> index e7ab409f..be5cb4cd 100644
> --- a/meta-ti-bsp/conf/machine/include/j7200.inc
> +++ b/meta-ti-bsp/conf/machine/include/j7200.inc
> @@ -3,21 +3,6 @@ require conf/machine/include/mc_k3r5.inc
>   
>   SOC_FAMILY:append = ":j7200"
>   
> -# Default tiboot3.bin on J7200 is for GP
> -IMAGE_BOOT_FILES += "tiboot3-j7200-gp-evm.bin"
> -
> -# Since default tiboot3.bin on J7200 is for GP, add a version for SR1.0 HS-FS
> -IMAGE_BOOT_FILES += "tiboot3-j7200-hs-fs-evm.bin"
> -
> -# Since default tiboot3.bin on J7200 is for GP, add a version for SR1.0 HS-SE
> -IMAGE_BOOT_FILES += "tiboot3-j7200-hs-evm.bin"
> -
> -# Since default tiboot3.bin on J7200 is for GP, add a version for SR2.0 HS-FS
> -IMAGE_BOOT_FILES += "tiboot3-j7200_sr2-hs-fs-evm.bin"
> -
> -# Since default tiboot3.bin on J721e is for GP, add a version for SR2.0 HS-SE
> -IMAGE_BOOT_FILES += "tiboot3-j7200_sr2-hs-evm.bin"
> -
>   TFA_BOARD = "generic"
>   
>   OPTEEMACHINE = "k3-j721e"
> diff --git a/meta-ti-bsp/conf/machine/include/j721e.inc b/meta-ti-bsp/conf/machine/include/j721e.inc
> index 3a5a9af6..5c7ef3b7 100644
> --- a/meta-ti-bsp/conf/machine/include/j721e.inc
> +++ b/meta-ti-bsp/conf/machine/include/j721e.inc
> @@ -11,24 +11,18 @@ PREFERRED_PROVIDER_virtual/gpudriver ?= "${BSP_ROGUE_DRIVER_PROVIDER}"
>   IMAGE_BOOT_FILES += "sysfw.itb"
>   
>   # Default on J721e is for GP
> -IMAGE_BOOT_FILES += "tiboot3-j721e-gp-evm.bin"
>   IMAGE_BOOT_FILES += "sysfw-j721e-gp-evm.itb"
>   
>   # Since default on J721e is for GP, add a version for SR1.1 HS-FS
> -IMAGE_BOOT_FILES += "tiboot3-j721e_sr1_1-hs-fs-evm.bin"
>   IMAGE_BOOT_FILES += "sysfw-j721e_sr1_1-hs-fs-evm.itb"
>   
>   # Since default on J721e is for GP, add a version for SR1.1 HS-SE
> -IMAGE_SR1_1_HS_SE_FILES = " "
> -IMAGE_BOOT_FILES += "tiboot3-j721e_sr1_1-hs-evm.bin"
>   IMAGE_BOOT_FILES += "sysfw-j721e_sr1_1-hs-evm.itb"
>   
>   # Since default on J721e is for GP, add a version for SR2.0 HS-FS
> -IMAGE_BOOT_FILES += "tiboot3-j721e_sr2-hs-fs-evm.bin"
>   IMAGE_BOOT_FILES += "sysfw-j721e_sr2-hs-fs-evm.itb"
>   
>   # Since default on J721e is for GP, add a version for SR2.0 HS-SE
> -IMAGE_BOOT_FILES += "tiboot3-j721e_sr2-hs-evm.bin"
>   IMAGE_BOOT_FILES += "sysfw-j721e_sr2-hs-evm.itb"
>   
>   TFA_BOARD = "generic"
> diff --git a/meta-ti-bsp/conf/machine/include/j721s2.inc b/meta-ti-bsp/conf/machine/include/j721s2.inc
> index e6e4f162..b6d18fe0 100644
> --- a/meta-ti-bsp/conf/machine/include/j721s2.inc
> +++ b/meta-ti-bsp/conf/machine/include/j721s2.inc
> @@ -8,15 +8,6 @@ MACHINE_FEATURES += "screen gpu"
>   require conf/machine/include/mesa-pvr.inc
>   PREFERRED_PROVIDER_virtual/gpudriver ?= "${BSP_ROGUE_DRIVER_PROVIDER}"
>   
> -# Default tiboot3.bin on J721S2 is for GP
> -IMAGE_BOOT_FILES += "tiboot3-j721s2-gp-evm.bin"
> -
> -# Since default tiboot3.bin on J721S2 is for GP, add a version for SR1.0 HS-FS
> -IMAGE_BOOT_FILES += "tiboot3-j721s2-hs-fs-evm.bin"
> -
> -# Since default tiboot3.bin on J721S2 is for GP, add a version for SR1.0 HS-SE
> -IMAGE_BOOT_FILES += "tiboot3-j721s2-hs-evm.bin"
> -
>   TFA_BOARD = "generic"
>   
>   OPTEEMACHINE = "k3-j784s4"
> diff --git a/meta-ti-bsp/conf/machine/include/j722s.inc b/meta-ti-bsp/conf/machine/include/j722s.inc
> index d49da340..8a02441b 100644
> --- a/meta-ti-bsp/conf/machine/include/j722s.inc
> +++ b/meta-ti-bsp/conf/machine/include/j722s.inc
> @@ -8,12 +8,6 @@ MACHINE_FEATURES += "screen gpu"
>   require conf/machine/include/mesa-pvr.inc
>   PREFERRED_PROVIDER_virtual/gpudriver ?= "${BSP_ROGUE_DRIVER_PROVIDER}"
>   
> -# Default tiboot3.bin on J722S is for HS-FS
> -IMAGE_BOOT_FILES += "tiboot3-j722s-hs-fs-evm.bin"
> -
> -# Since default tiboot3.bin on J722S is for HS-FS, add a version for HS-SE
> -IMAGE_BOOT_FILES += "tiboot3-j722s-hs-evm.bin"
> -
>   TFA_BOARD = "lite"
>   TFA_K3_SYSTEM_SUSPEND = "1"
>   
> diff --git a/meta-ti-bsp/conf/machine/include/j742s2.inc b/meta-ti-bsp/conf/machine/include/j742s2.inc
> index 9a54e11e..d2de1d0d 100644
> --- a/meta-ti-bsp/conf/machine/include/j742s2.inc
> +++ b/meta-ti-bsp/conf/machine/include/j742s2.inc
> @@ -8,12 +8,6 @@ MACHINE_FEATURES += "screen gpu"
>   require conf/machine/include/mesa-pvr.inc
>   PREFERRED_PROVIDER_virtual/gpudriver ?= "${BSP_ROGUE_DRIVER_PROVIDER}"
>   
> -# Default tiboot3.bin on J742S2 is for HS-FS
> -IMAGE_BOOT_FILES += "tiboot3-j742s2-hs-fs-evm.bin"
> -
> -# Since default tiboot3.bin on J742S2 is for HS-FS, add a version for SR1.0 HS-SE
> -IMAGE_BOOT_FILES += "tiboot3-j742s2-hs-evm.bin"
> -
>   TFA_BOARD = "j784s4"
>   
>   OPTEEMACHINE = "k3-j784s4"
> diff --git a/meta-ti-bsp/conf/machine/include/j784s4.inc b/meta-ti-bsp/conf/machine/include/j784s4.inc
> index 33224ee3..759984ea 100644
> --- a/meta-ti-bsp/conf/machine/include/j784s4.inc
> +++ b/meta-ti-bsp/conf/machine/include/j784s4.inc
> @@ -8,15 +8,6 @@ MACHINE_FEATURES += "screen gpu"
>   require conf/machine/include/mesa-pvr.inc
>   PREFERRED_PROVIDER_virtual/gpudriver ?= "${BSP_ROGUE_DRIVER_PROVIDER}"
>   
> -# Default tiboot3.bin on J784S4 is for GP
> -IMAGE_BOOT_FILES += "tiboot3-j784s4-gp-evm.bin"
> -
> -# Since default tiboot3.bin on J784S4 is for GP, add a version for SR1.0 HS-FS
> -IMAGE_BOOT_FILES += "tiboot3-j784s4-hs-fs-evm.bin"
> -
> -# Since default tiboot3.bin on J784S4 is for GP, add a version for SR1.0 HS-SE
> -IMAGE_BOOT_FILES += "tiboot3-j784s4-hs-evm.bin"
> -
>   TFA_BOARD = "j784s4"
>   
>   OPTEEMACHINE = "k3-j784s4"
> diff --git a/meta-ti-bsp/conf/machine/include/k3.inc b/meta-ti-bsp/conf/machine/include/k3.inc
> index 9b85f867..d0f0bd62 100644
> --- a/meta-ti-bsp/conf/machine/include/k3.inc
> +++ b/meta-ti-bsp/conf/machine/include/k3.inc
> @@ -44,6 +44,7 @@ MACHINE_FEATURES = "apm usbgadget usbhost vfat ext2 alsa pci optee-ftpm"
>   IMAGE_FSTYPES += "tar.xz wic.xz wic.bmap"
>   
>   IMAGE_BOOT_FILES ?= "${SPL_BINARYNAME} u-boot.${UBOOT_SUFFIX} tiboot3.bin"
> +IMAGE_BOOT_FILES += "tiboot3-*-evm.bin"

Does this match for all platforms?  Even the -sk platform?


>   IMAGE_EFI_BOOT_FILES ?= "${IMAGE_BOOT_FILES}"
>   
>   EFI_PROVIDER ?= "grub-efi"

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

