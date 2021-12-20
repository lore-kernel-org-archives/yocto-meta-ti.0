Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.2521.1639981997955126524
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 19 Dec 2021 22:33:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=MFsA/rb6;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: praneeth@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1BK6XBbQ044461;
	Mon, 20 Dec 2021 00:33:11 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1639981991;
	bh=Yb1dXhfw0MzqP6/DiWBtAnNOteoQnkNcPJlvUwkgG4Y=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=MFsA/rb63sffJmdA1xTJDex5gmO79+joamd/ial7faV/K8TzrgN0riFF4hi2mZlaP
	 RFBpbqO+PwaU/0mw1h3vr/mPxxLoYk/h+X2TmVTqRQJfxicHZFFBjhCHJneyQobfQH
	 kUKxJJzud4gUTPdBRfWt7wFabbQbqd8WadRyoXiw=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1BK6XBkL021458
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 20 Dec 2021 00:33:11 -0600
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 20
 Dec 2021 00:33:11 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 20 Dec 2021 00:33:11 -0600
Received: from [10.250.220.125] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1BK6XAGf074755;
	Mon, 20 Dec 2021 00:33:10 -0600
Message-ID: <1b7c15e9-c45a-1546-45f5-f1da20c26935@ti.com>
Date: Mon, 20 Dec 2021 00:33:10 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [meta-ti] [PATCH v2] ti-sgx-ddk-km: Fix build with kernel 5.10 and musl support
To: Denys Dmytriyenko <denis@denix.org>, Khem Raj <raj.khem@gmail.com>
CC: <meta-ti@lists.yoctoproject.org>, Denys Dmytriyenko <denys@konsulko.com>,
        "Eatmon, Ryan" <reatmon@ti.com>,
        "Etheridge, Darren" <detheridge@ti.com>,
        Yogesh Siraswar <yogeshs@ti.com>
References: <20211210002522.1561830-1-raj.khem@gmail.com>
 <20211210005138.GD18191@denix.org>
From: "praneeth" <praneeth@ti.com>
In-Reply-To: <20211210005138.GD18191@denix.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Language: en-US
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 12/9/2021 6:51 PM, Denys Dmytriyenko wrote:
> On Thu, Dec 09, 2021 at 04:25:22PM -0800, Khem Raj wrote:
>> This adds a patch to fix runtime problems loading the kernel module with
>> kernel 5.10
>>
>> Adds support to build with musl targets
>>
>> Add yoe to recognised OE distributions
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> Cc: Denys Dmytriyenko <denys@konsulko.com>
> 
> Reviewed-by: Denys Dmytriyenko <denys@konsulko.com>

this fix is now present here:
https://git.ti.com/cgit/graphics/omap5-sgx-ddk-linux/commit/?h=ti-img-sgx/1.17.4948957/k5.10&id=eda7780bfd5277e16913c9bc0b0e6892b4e79063


> 
> 
>> ---
>> v2: Add upstream status to patches
> 
> Thanks! Although I wonder if the first patch should be treated as
> "Inappropriate [OE-specific]", as it was there for few years already
> and does actually add support for OE-specific toolchains...
> 
> 
>>   ...mbedded-hardfp-toolchain-w-o-gnueabi.patch | 20 +++++++++----
>>   ...02-Fix-driver-config-for-5.10-kernel.patch | 29 +++++++++++++++++++
>>   .../ti-sgx-ddk-km_1.17.4948957.bb             |  1 +
>>   .../libgles/ti-sgx-ddk-um_1.17.4948957.bb     |  1 +
>>   4 files changed, 46 insertions(+), 5 deletions(-)
>>   create mode 100644 recipes-bsp/powervr-drivers/ti-sgx-ddk-km/0002-Fix-driver-config-for-5.10-kernel.patch
>>
>> diff --git a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km/0001-km-support-OpenEmbedded-hardfp-toolchain-w-o-gnueabi.patch b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km/0001-km-support-OpenEmbedded-hardfp-toolchain-w-o-gnueabi.patch
>> index 15105eac..4f71ea9d 100644
>> --- a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km/0001-km-support-OpenEmbedded-hardfp-toolchain-w-o-gnueabi.patch
>> +++ b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km/0001-km-support-OpenEmbedded-hardfp-toolchain-w-o-gnueabi.patch
>> @@ -1,23 +1,33 @@
>> -From 755632b4f3a40996a12bc7816a9839af7112040a Mon Sep 17 00:00:00 2001
>> +From a1c191a020f6eebc9a94b641be1fca7885fc9dd2 Mon Sep 17 00:00:00 2001
>>   From: Denys Dmytriyenko <denys@ti.com>
>>   Date: Mon, 9 Sep 2019 17:05:48 -0400
>> -Subject: [PATCH] km: support OpenEmbedded hardfp toolchain w/o -gnueabihf
>> +Subject: [PATCH 1/2] km: support OpenEmbedded hardfp toolchain w/o -gnueabihf
>>    suffix
>>   
>> +OE toolchains are not having armhf in its name but they still are armhf
>> +ABI, teach this to sgx module build system
>> +
>> +recognize musleabi in tuples as well
>> +
>> +Add yoe distro support
>> +
>> +Upstream-Status: Pending
>> +
>>   Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>   ---
>>    eurasia_km/eurasiacon/build/linux2/config/compiler.mk | 6 +++---
>>    1 file changed, 3 insertions(+), 3 deletions(-)
>>   
>>   diff --git a/eurasia_km/eurasiacon/build/linux2/config/compiler.mk b/eurasia_km/eurasiacon/build/linux2/config/compiler.mk
>> -index dead2f9..2ba3e5e 100644
>> +index dead2f9..1b5f090 100644
>>   --- a/eurasia_km/eurasiacon/build/linux2/config/compiler.mk
>>   +++ b/eurasia_km/eurasiacon/build/linux2/config/compiler.mk
>>   @@ -68,12 +68,12 @@ define calculate-compiler-preferred-target
>>      ifneq ($$(filter aarch64-%,$$($(1)_compiler_preferred_target)),)
>>       $(1)_compiler_preferred_target := aarch64-linux-gnu
>>      endif
>> -+  ifneq ($$(filter arm-%-gnueabihf arm-oe-linux-gnueabi arm-poky-linux-gnueabi,$$($(1)_compiler_preferred_target)),)
>> ++  ifneq ($$(filter arm-%-gnueabihf arm-oe-linux-gnueabi arm-poky-linux-gnueabi arm-yoe-linux-gnueabi arm-oe-linux-musleabi arm-poky-linux-musleabi arm-yoe-linux-musleabi,$$($(1)_compiler_preferred_target)),)
>>   +   $(1)_compiler_preferred_target := arm-linux-gnueabihf
>>   +  endif
>>      ifneq ($$(filter arm-%-gnueabi armv7a-cros-linux-gnueabi armv7hl-redhat-linux-gnueabi,$$($(1)_compiler_preferred_target)),)
>> @@ -30,5 +40,5 @@ index dead2f9..2ba3e5e 100644
>>    endef
>>    
>>   --
>> -2.7.4
>> +2.34.1
>>   
>> diff --git a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km/0002-Fix-driver-config-for-5.10-kernel.patch b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km/0002-Fix-driver-config-for-5.10-kernel.patch
>> new file mode 100644
>> index 00000000..1f097909
>> --- /dev/null
>> +++ b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km/0002-Fix-driver-config-for-5.10-kernel.patch
>> @@ -0,0 +1,29 @@
>> +From 57c3aafacde126786077afa7bfc07ec261acffaf Mon Sep 17 00:00:00 2001
>> +From: Paul Barker <paul.barker@sancloud.com>
>> +Date: Wed, 27 Oct 2021 10:34:32 +0100
>> +Subject: [PATCH 2/2] Fix driver config for 5.10 kernel
>> +
>> +See https://github.com/openpvrsgx-devgroup/linux_openpvrsgx/issues/3.
>> +
>> +Upstream-Status: Pending
>> +Ref: BSP-66
>> +Signed-off-by: Paul Barker <paul.barker@sancloud.com>
>> +---
>> + eurasia_km/eurasiacon/build/linux2/config/core.mk | 1 +
>> + 1 file changed, 1 insertion(+)
>> +
>> +diff --git a/eurasia_km/eurasiacon/build/linux2/config/core.mk b/eurasia_km/eurasiacon/build/linux2/config/core.mk
>> +index 3f27926..18d515a 100644
>> +--- a/eurasia_km/eurasiacon/build/linux2/config/core.mk
>> ++++ b/eurasia_km/eurasiacon/build/linux2/config/core.mk
>> +@@ -590,6 +590,7 @@ ifneq ($(BUFFERCLASS_MODULE),)
>> + $(eval $(call BothConfigMake,BUFFERCLASS_MODULE,$(BUFFERCLASS_MODULE)))
>> + endif
>> +
>> ++PVR_LINUX_MEM_AREA_USE_VMAP = 1
>> + ifneq ($(strip $(KERNELDIR)),)
>> + PVR_LINUX_MEM_AREA_POOL_MAX_PAGES ?= 0
>> + ifneq ($(PVR_LINUX_MEM_AREA_POOL_MAX_PAGES),0)
>> +--
>> +2.34.1
>> +
>> diff --git a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
>> index 3848e84e..e6247e08 100644
>> --- a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
>> +++ b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
>> @@ -22,6 +22,7 @@ BRANCH = "ti-img-sgx/${PV}/k5.10"
>>   
>>   SRC_URI = "git://git.ti.com/graphics/omap5-sgx-ddk-linux.git;protocol=git;branch=${BRANCH} \
>>       file://0001-km-support-OpenEmbedded-hardfp-toolchain-w-o-gnueabi.patch \
>> +    file://0002-Fix-driver-config-for-5.10-kernel.patch \
>>   "
>>   
>>   S = "${WORKDIR}/git"
>> diff --git a/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb b/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
>> index 87bbb437..9d55122c 100644
>> --- a/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
>> +++ b/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
>> @@ -32,6 +32,7 @@ inherit update-rc.d
>>   PROVIDES += "virtual/egl virtual/libgles1 virtual/libgles2 virtual/libgbm"
>>   
>>   DEPENDS += "libdrm udev wayland wayland-protocols libffi expat"
>> +DEPENDS:append:libc-musl = " gcompat"
>>   RDEPENDS:${PN} += "libdrm libdrm-omap udev wayland wayland-protocols libffi expat"
>>   
>>   RPROVIDES:${PN} = "libegl libgles1 libgles2 libgbm"
>> -- 
>> 2.34.1
>>
>>
>>
>> 
>>
