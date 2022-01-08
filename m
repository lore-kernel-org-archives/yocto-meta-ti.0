Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web09.9305.1641668272646848787
 for <meta-ti@lists.yoctoproject.org>;
 Sat, 08 Jan 2022 10:57:53 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 0975B40C7B;
	Sat,  8 Jan 2022 18:57:51 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KLw2CfP-1XYb; Sat,  8 Jan 2022 18:57:51 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id D464A40B13;
	Sat,  8 Jan 2022 18:57:47 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 3933617471A; Sat,  8 Jan 2022 13:57:47 -0500 (EST)
Date: Sat, 8 Jan 2022 13:57:47 -0500
From: "Denys Dmytriyenko" <denis@denix.org>
To: praneeth@ti.com
Cc: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [dunfell PATCH] ti-sgx-ddk-km: update srcrev to pick latest
Message-ID: <20220108185747.GB26229@denix.org>
References: <20220107235608.27595-1-praneeth@ti.com>
MIME-Version: 1.0
In-Reply-To: <20220107235608.27595-1-praneeth@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Is this a duplicate?
https://lists.yoctoproject.org/g/meta-ti/topic/master_patch/87869018


On Fri, Jan 07, 2022 at 05:56:08PM -0600, praneeth@ti.com wrote:
> From: Praneeth Bajjuri <praneeth@ti.com>
> 
> Update the srcrev to pick the latest of ti-img-sgx/1.17.4948957/k5.10.
> 
> commit eaa9fcd3acff ("km: support OpenEmbedded hardfp toolchain w/o -gnueabihf suffix")
> is not picked up on the sdk-ddk-km repo already, hence removing the patch from here.
> 
> commit eda7780bfd52 ("Fix driver config for 5.10 kernel") fixes graphics
> init failures on sgx platforms
> 
> Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
> ---
>  ...mbedded-hardfp-toolchain-w-o-gnueabi.patch | 34 -------------------
>  .../ti-sgx-ddk-km_1.17.4948957.bb             |  8 ++---
>  2 files changed, 3 insertions(+), 39 deletions(-)
>  delete mode 100644 recipes-bsp/powervr-drivers/ti-sgx-ddk-km/0001-km-support-OpenEmbedded-hardfp-toolchain-w-o-gnueabi.patch
> 
> diff --git a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km/0001-km-support-OpenEmbedded-hardfp-toolchain-w-o-gnueabi.patch b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km/0001-km-support-OpenEmbedded-hardfp-toolchain-w-o-gnueabi.patch
> deleted file mode 100644
> index 15105eac..00000000
> --- a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km/0001-km-support-OpenEmbedded-hardfp-toolchain-w-o-gnueabi.patch
> +++ /dev/null
> @@ -1,34 +0,0 @@
> -From 755632b4f3a40996a12bc7816a9839af7112040a Mon Sep 17 00:00:00 2001
> -From: Denys Dmytriyenko <denys@ti.com>
> -Date: Mon, 9 Sep 2019 17:05:48 -0400
> -Subject: [PATCH] km: support OpenEmbedded hardfp toolchain w/o -gnueabihf
> - suffix
> -
> -Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ----
> - eurasia_km/eurasiacon/build/linux2/config/compiler.mk | 6 +++---
> - 1 file changed, 3 insertions(+), 3 deletions(-)
> -
> -diff --git a/eurasia_km/eurasiacon/build/linux2/config/compiler.mk b/eurasia_km/eurasiacon/build/linux2/config/compiler.mk
> -index dead2f9..2ba3e5e 100644
> ---- a/eurasia_km/eurasiacon/build/linux2/config/compiler.mk
> -+++ b/eurasia_km/eurasiacon/build/linux2/config/compiler.mk
> -@@ -68,12 +68,12 @@ define calculate-compiler-preferred-target
> -   ifneq ($$(filter aarch64-%,$$($(1)_compiler_preferred_target)),)
> -    $(1)_compiler_preferred_target := aarch64-linux-gnu
> -   endif
> -+  ifneq ($$(filter arm-%-gnueabihf arm-oe-linux-gnueabi arm-poky-linux-gnueabi,$$($(1)_compiler_preferred_target)),)
> -+   $(1)_compiler_preferred_target := arm-linux-gnueabihf
> -+  endif
> -   ifneq ($$(filter arm-%-gnueabi armv7a-cros-linux-gnueabi armv7hl-redhat-linux-gnueabi,$$($(1)_compiler_preferred_target)),)
> -    $(1)_compiler_preferred_target := arm-linux-gnueabi
> -   endif
> --  ifneq ($$(filter arm-%-gnueabihf,$$($(1)_compiler_preferred_target)),)
> --   $(1)_compiler_preferred_target := arm-linux-gnueabihf
> --  endif
> -  endif
> - endef
> - 
> --- 
> -2.7.4
> -
> diff --git a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
> index e21ccc7f..a1b0765c 100644
> --- a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
> +++ b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
> @@ -9,7 +9,7 @@ REQUIRED_MACHINE_FEATURES = "gpu"
>  
>  COMPATIBLE_MACHINE = "pandaboard|beagleboard|ti33x|ti43x|omap-a15|k3"
>  
> -MACHINE_KERNEL_PR_append = "x"
> +MACHINE_KERNEL_PR_append = "y"
>  PR = "${MACHINE_KERNEL_PR}"
>  
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
> @@ -20,13 +20,11 @@ PROVIDES = "virtual/gpudriver"
>  
>  BRANCH = "ti-img-sgx/${PV}/k5.10"
>  
> -SRC_URI = "git://git.ti.com/graphics/omap5-sgx-ddk-linux.git;protocol=git;branch=${BRANCH} \
> -    file://0001-km-support-OpenEmbedded-hardfp-toolchain-w-o-gnueabi.patch \
> -"
> +SRC_URI = "git://git.ti.com/graphics/omap5-sgx-ddk-linux.git;protocol=git;branch=${BRANCH}"
>  
>  S = "${WORKDIR}/git"
>  
> -SRCREV = "62f31de3ceed156bff32abb3dd03693a02df117e"
> +SRCREV = "eda7780bfd5277e16913c9bc0b0e6892b4e79063"
>  
>  TARGET_PRODUCT_omap-a15 = "jacinto6evm"
>  TARGET_PRODUCT_ti33x = "ti335x"
> -- 
> 2.17.1
> 

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
