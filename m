Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web09.3069.1642037458900822794
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 12 Jan 2022 17:30:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=abs4zqx6;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: praneeth@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 20D1UrYv110647;
	Wed, 12 Jan 2022 19:30:53 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1642037453;
	bh=Pt3QsyJ4GMhdBXlkLQ/Y24J0TPOKG1fT853rkvxsJzE=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=abs4zqx6+DPhTpuza8RKhvx2vKE5twIplTrgRwKspbBzwlBvub8mfT4El5WZ9Fb0a
	 PXlGoYWtQ2CZjA437WY9uKjTQmksBMGtyjRkD7lzI6apKYN4ZOUWxnkHsFa0amNjYn
	 d9Y/b60MFeFY7uGC5SApWL6lFhZIfnVkM1smwpY8=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 20D1Uqeb129748
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 12 Jan 2022 19:30:52 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 12
 Jan 2022 19:30:52 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 12 Jan 2022 19:30:52 -0600
Received: from [10.247.28.135] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 20D1Uq6b107753;
	Wed, 12 Jan 2022 19:30:52 -0600
Message-ID: <957cf274-b6f7-9644-e3eb-57dc6612b883@ti.com>
Date: Wed, 12 Jan 2022 19:30:52 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [dunfell PATCH] ti-sgx-ddk-km: update srcrev to pick latest
To: Denys Dmytriyenko <denis@denix.org>
CC: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20220107235608.27595-1-praneeth@ti.com>
 <20220108185747.GB26229@denix.org>
From: "praneeth" <praneeth@ti.com>
In-Reply-To: <20220108185747.GB26229@denix.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Language: en-US
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 1/8/2022 12:57 PM, Denys Dmytriyenko wrote:
> Is this a duplicate?
> https://lists.yoctoproject.org/g/meta-ti/topic/master_patch/87869018

Its a similar patch for dunfell branch.

dunfell had only *OpenEmbedded-hardfp-toolchain-w-o-gnueabi.patch 
instead of 2 patches on master.

hence made a updated one for dunfell.

> 
> 
> On Fri, Jan 07, 2022 at 05:56:08PM -0600, praneeth@ti.com wrote:
>> From: Praneeth Bajjuri <praneeth@ti.com>
>>
>> Update the srcrev to pick the latest of ti-img-sgx/1.17.4948957/k5.10.
>>
>> commit eaa9fcd3acff ("km: support OpenEmbedded hardfp toolchain w/o -gnueabihf suffix")
>> is not picked up on the sdk-ddk-km repo already, hence removing the patch from here.
>>
>> commit eda7780bfd52 ("Fix driver config for 5.10 kernel") fixes graphics
>> init failures on sgx platforms
>>
>> Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
>> ---
>>   ...mbedded-hardfp-toolchain-w-o-gnueabi.patch | 34 -------------------
>>   .../ti-sgx-ddk-km_1.17.4948957.bb             |  8 ++---
>>   2 files changed, 3 insertions(+), 39 deletions(-)
>>   delete mode 100644 recipes-bsp/powervr-drivers/ti-sgx-ddk-km/0001-km-support-OpenEmbedded-hardfp-toolchain-w-o-gnueabi.patch
>>
>> diff --git a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km/0001-km-support-OpenEmbedded-hardfp-toolchain-w-o-gnueabi.patch b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km/0001-km-support-OpenEmbedded-hardfp-toolchain-w-o-gnueabi.patch
>> deleted file mode 100644
>> index 15105eac..00000000
>> --- a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km/0001-km-support-OpenEmbedded-hardfp-toolchain-w-o-gnueabi.patch
>> +++ /dev/null
>> @@ -1,34 +0,0 @@
>> -From 755632b4f3a40996a12bc7816a9839af7112040a Mon Sep 17 00:00:00 2001
>> -From: Denys Dmytriyenko <denys@ti.com>
>> -Date: Mon, 9 Sep 2019 17:05:48 -0400
>> -Subject: [PATCH] km: support OpenEmbedded hardfp toolchain w/o -gnueabihf
>> - suffix
>> -
>> -Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>> ----
>> - eurasia_km/eurasiacon/build/linux2/config/compiler.mk | 6 +++---
>> - 1 file changed, 3 insertions(+), 3 deletions(-)
>> -
>> -diff --git a/eurasia_km/eurasiacon/build/linux2/config/compiler.mk b/eurasia_km/eurasiacon/build/linux2/config/compiler.mk
>> -index dead2f9..2ba3e5e 100644
>> ---- a/eurasia_km/eurasiacon/build/linux2/config/compiler.mk
>> -+++ b/eurasia_km/eurasiacon/build/linux2/config/compiler.mk
>> -@@ -68,12 +68,12 @@ define calculate-compiler-preferred-target
>> -   ifneq ($$(filter aarch64-%,$$($(1)_compiler_preferred_target)),)
>> -    $(1)_compiler_preferred_target := aarch64-linux-gnu
>> -   endif
>> -+  ifneq ($$(filter arm-%-gnueabihf arm-oe-linux-gnueabi arm-poky-linux-gnueabi,$$($(1)_compiler_preferred_target)),)
>> -+   $(1)_compiler_preferred_target := arm-linux-gnueabihf
>> -+  endif
>> -   ifneq ($$(filter arm-%-gnueabi armv7a-cros-linux-gnueabi armv7hl-redhat-linux-gnueabi,$$($(1)_compiler_preferred_target)),)
>> -    $(1)_compiler_preferred_target := arm-linux-gnueabi
>> -   endif
>> --  ifneq ($$(filter arm-%-gnueabihf,$$($(1)_compiler_preferred_target)),)
>> --   $(1)_compiler_preferred_target := arm-linux-gnueabihf
>> --  endif
>> -  endif
>> - endef
>> -
>> ---
>> -2.7.4
>> -
>> diff --git a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
>> index e21ccc7f..a1b0765c 100644
>> --- a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
>> +++ b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
>> @@ -9,7 +9,7 @@ REQUIRED_MACHINE_FEATURES = "gpu"
>>   
>>   COMPATIBLE_MACHINE = "pandaboard|beagleboard|ti33x|ti43x|omap-a15|k3"
>>   
>> -MACHINE_KERNEL_PR_append = "x"
>> +MACHINE_KERNEL_PR_append = "y"
>>   PR = "${MACHINE_KERNEL_PR}"
>>   
>>   PACKAGE_ARCH = "${MACHINE_ARCH}"
>> @@ -20,13 +20,11 @@ PROVIDES = "virtual/gpudriver"
>>   
>>   BRANCH = "ti-img-sgx/${PV}/k5.10"
>>   
>> -SRC_URI = "git://git.ti.com/graphics/omap5-sgx-ddk-linux.git;protocol=git;branch=${BRANCH} \
>> -    file://0001-km-support-OpenEmbedded-hardfp-toolchain-w-o-gnueabi.patch \
>> -"
>> +SRC_URI = "git://git.ti.com/graphics/omap5-sgx-ddk-linux.git;protocol=git;branch=${BRANCH}"
>>   
>>   S = "${WORKDIR}/git"
>>   
>> -SRCREV = "62f31de3ceed156bff32abb3dd03693a02df117e"
>> +SRCREV = "eda7780bfd5277e16913c9bc0b0e6892b4e79063"
>>   
>>   TARGET_PRODUCT_omap-a15 = "jacinto6evm"
>>   TARGET_PRODUCT_ti33x = "ti335x"
>> -- 
>> 2.17.1
>>
> 
