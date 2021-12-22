Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web08.16274.1640155093918988576
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 21 Dec 2021 22:38:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=gmBdRRCJ;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: praneeth@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1BM6c8Wg051838;
	Wed, 22 Dec 2021 00:38:08 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1640155088;
	bh=W6RlhivEoIyojRsTRuyJVWFsfSlN4y26R8o8nf3yq/U=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=gmBdRRCJfNH4Qrv+Al64HSq/FHYBqXxGgqKh+DtJHgHc7vyQtM36P6NhZJ8YvlBbN
	 CzSQf8ycK4TO3dtu6eI21VZqQfyZQu7DpWYTZg5POiyfF2J9nnaoCApk1g8QlDpzOJ
	 39hg8zfS+Nn5HgJvc2kLSCSqDB/Mtir8wMW2Zs8c=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1BM6c7aX099711
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 22 Dec 2021 00:38:07 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 22
 Dec 2021 00:38:07 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 22 Dec 2021 00:38:07 -0600
Received: from [10.250.220.125] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1BM6c6wG025867;
	Wed, 22 Dec 2021 00:38:07 -0600
Message-ID: <e6192a76-4192-2863-e893-c06b8a48f158@ti.com>
Date: Wed, 22 Dec 2021 00:38:06 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [meta-ti] [master][PATCH] ti-sgx-ddk-km: patches got merged upstream, update recipe accordingly
To: Denys Dmytriyenko <denis@denix.org>, <meta-ti@lists.yoctoproject.org>
CC: Denys Dmytriyenko <denys@konsulko.com>, Khem Raj <raj.khem@gmail.com>,
        Yogesh Siraswar <yogeshs@ti.com>, "Eatmon, Ryan" <reatmon@ti.com>
References: <1640047199-16505-1-git-send-email-denis@denix.org>
From: "praneeth" <praneeth@ti.com>
In-Reply-To: <1640047199-16505-1-git-send-email-denis@denix.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Language: en-US
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 12/20/2021 6:39 PM, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@konsulko.com>
> 
> Both of the local patches were merged upstream, so update the reecipe to pull
> the latest SRCREV and drop those patches from the OE metadata.
> 
> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> Cc: Khem Raj <raj.khem@gmail.com>

Reviewed-by: Praneeth Bajjuri <praneeth@ti.com>


> ---
>   ...OpenEmbedded-hardfp-toolchain-w-o-gnueabi.patch | 44 ----------------------
>   .../0002-Fix-driver-config-for-5.10-kernel.patch   | 29 --------------
>   .../powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb  |  7 +---
>   3 files changed, 2 insertions(+), 78 deletions(-)
>   delete mode 100644 recipes-bsp/powervr-drivers/ti-sgx-ddk-km/0001-km-support-OpenEmbedded-hardfp-toolchain-w-o-gnueabi.patch
>   delete mode 100644 recipes-bsp/powervr-drivers/ti-sgx-ddk-km/0002-Fix-driver-config-for-5.10-kernel.patch
> 
> diff --git a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km/0001-km-support-OpenEmbedded-hardfp-toolchain-w-o-gnueabi.patch b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km/0001-km-support-OpenEmbedded-hardfp-toolchain-w-o-gnueabi.patch
> deleted file mode 100644
> index 4f71ea9..0000000
> --- a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km/0001-km-support-OpenEmbedded-hardfp-toolchain-w-o-gnueabi.patch
> +++ /dev/null
> @@ -1,44 +0,0 @@
> -From a1c191a020f6eebc9a94b641be1fca7885fc9dd2 Mon Sep 17 00:00:00 2001
> -From: Denys Dmytriyenko <denys@ti.com>
> -Date: Mon, 9 Sep 2019 17:05:48 -0400
> -Subject: [PATCH 1/2] km: support OpenEmbedded hardfp toolchain w/o -gnueabihf
> - suffix
> -
> -OE toolchains are not having armhf in its name but they still are armhf
> -ABI, teach this to sgx module build system
> -
> -recognize musleabi in tuples as well
> -
> -Add yoe distro support
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - eurasia_km/eurasiacon/build/linux2/config/compiler.mk | 6 +++---
> - 1 file changed, 3 insertions(+), 3 deletions(-)
> -
> -diff --git a/eurasia_km/eurasiacon/build/linux2/config/compiler.mk b/eurasia_km/eurasiacon/build/linux2/config/compiler.mk
> -index dead2f9..1b5f090 100644
> ---- a/eurasia_km/eurasiacon/build/linux2/config/compiler.mk
> -+++ b/eurasia_km/eurasiacon/build/linux2/config/compiler.mk
> -@@ -68,12 +68,12 @@ define calculate-compiler-preferred-target
> -   ifneq ($$(filter aarch64-%,$$($(1)_compiler_preferred_target)),)
> -    $(1)_compiler_preferred_target := aarch64-linux-gnu
> -   endif
> -+  ifneq ($$(filter arm-%-gnueabihf arm-oe-linux-gnueabi arm-poky-linux-gnueabi arm-yoe-linux-gnueabi arm-oe-linux-musleabi arm-poky-linux-musleabi arm-yoe-linux-musleabi,$$($(1)_compiler_preferred_target)),)
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
> -2.34.1
> -
> diff --git a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km/0002-Fix-driver-config-for-5.10-kernel.patch b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km/0002-Fix-driver-config-for-5.10-kernel.patch
> deleted file mode 100644
> index 1f09790..0000000
> --- a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km/0002-Fix-driver-config-for-5.10-kernel.patch
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -From 57c3aafacde126786077afa7bfc07ec261acffaf Mon Sep 17 00:00:00 2001
> -From: Paul Barker <paul.barker@sancloud.com>
> -Date: Wed, 27 Oct 2021 10:34:32 +0100
> -Subject: [PATCH 2/2] Fix driver config for 5.10 kernel
> -
> -See https://github.com/openpvrsgx-devgroup/linux_openpvrsgx/issues/3.
> -
> -Upstream-Status: Pending
> -Ref: BSP-66
> -Signed-off-by: Paul Barker <paul.barker@sancloud.com>
> ----
> - eurasia_km/eurasiacon/build/linux2/config/core.mk | 1 +
> - 1 file changed, 1 insertion(+)
> -
> -diff --git a/eurasia_km/eurasiacon/build/linux2/config/core.mk b/eurasia_km/eurasiacon/build/linux2/config/core.mk
> -index 3f27926..18d515a 100644
> ---- a/eurasia_km/eurasiacon/build/linux2/config/core.mk
> -+++ b/eurasia_km/eurasiacon/build/linux2/config/core.mk
> -@@ -590,6 +590,7 @@ ifneq ($(BUFFERCLASS_MODULE),)
> - $(eval $(call BothConfigMake,BUFFERCLASS_MODULE,$(BUFFERCLASS_MODULE)))
> - endif
> -
> -+PVR_LINUX_MEM_AREA_USE_VMAP = 1
> - ifneq ($(strip $(KERNELDIR)),)
> - PVR_LINUX_MEM_AREA_POOL_MAX_PAGES ?= 0
> - ifneq ($(PVR_LINUX_MEM_AREA_POOL_MAX_PAGES),0)
> ---
> -2.34.1
> -
> diff --git a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
> index e6247e0..5657408 100644
> --- a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
> +++ b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
> @@ -20,14 +20,11 @@ PROVIDES = "virtual/gpudriver"
>   
>   BRANCH = "ti-img-sgx/${PV}/k5.10"
>   
> -SRC_URI = "git://git.ti.com/graphics/omap5-sgx-ddk-linux.git;protocol=git;branch=${BRANCH} \
> -    file://0001-km-support-OpenEmbedded-hardfp-toolchain-w-o-gnueabi.patch \
> -    file://0002-Fix-driver-config-for-5.10-kernel.patch \
> -"
> +SRC_URI = "git://git.ti.com/graphics/omap5-sgx-ddk-linux.git;protocol=git;branch=${BRANCH}"
>   
>   S = "${WORKDIR}/git"
>   
> -SRCREV = "62f31de3ceed156bff32abb3dd03693a02df117e"
> +SRCREV = "eda7780bfd5277e16913c9bc0b0e6892b4e79063"
>   
>   TARGET_PRODUCT:omap-a15 = "jacinto6evm"
>   TARGET_PRODUCT:ti33x = "ti335x"
> 
> 
> 
> 
> 
