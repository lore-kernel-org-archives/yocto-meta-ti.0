Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web08.4018.1627404853353294705
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 27 Jul 2021 09:54:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=XlRI1kxI;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: yogeshs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 16RGs6BK033909;
	Tue, 27 Jul 2021 11:54:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1627404846;
	bh=Egxk84bpEyrq2h/5X1iK0Xx4X+0Q7OBLztXKOc/JsCo=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=XlRI1kxIlDVusi3HoBcEtz2VZ5fJSWccyTaO85qUcAm7KDqaHIlge9obOmqc2edOb
	 M8Mr7aKCYKekDjLIVcRgrLZcm01rUNkzOJNj5qBNX+JWU5nqhfUXVlBB68YwpgY/wh
	 onTxmGw6v3wAUGsTcbc9Yfu/ftxzZfFP51RJi0jY=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 16RGs6gm002275
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 27 Jul 2021 11:54:06 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 27
 Jul 2021 11:54:05 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Tue, 27 Jul 2021 11:54:05 -0500
Received: from [10.250.38.213] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 16RGs5bV100706;
	Tue, 27 Jul 2021 11:54:05 -0500
Subject: Re: [meta-ti] [master][PATCH] ti-img-rogue-driver: unify with dunfell and fix double-patching
To: Denys Dmytriyenko <denis@denix.org>, <meta-ti@lists.yoctoproject.org>
References: <1692042B86EAB73A.9904@lists.yoctoproject.org>
 <20210726233658.GX1528@denix.org>
From: "Yogesh Siraswar" <yogeshs@ti.com>
Message-ID: <38392802-c9f5-688e-996b-95dc8c7e59b2@ti.com>
Date: Tue, 27 Jul 2021 11:54:05 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210726233658.GX1528@denix.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 7/26/2021 6:36 PM, Denys Dmytriyenko wrote:
> Ping.
> 
> On Thu, Jul 15, 2021 at 12:36:35PM -0400, Denys Dmytriyenko wrote:
>> From: Denys Dmytriyenko <denys@konsulko.com>
>>
>> There was a discrepancy between master and dunfell where 2 different versions
>> of the same patch existed, so when syncing branches, it resulted in appying
>> the same change twice. This cleans it up.
>>
>> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
>> ---
>>   ...k-support-OE-toolchain-alongside-Poky-one.patch | 26 ----------------------
>>   .../ti-img-rogue-driver_1.13.5776728.bb            |  4 ++--
>>   2 files changed, 2 insertions(+), 28 deletions(-)
>>   delete mode 100644 recipes-bsp/powervr-drivers/ti-img-rogue-driver/0001-compiler.mk-support-OE-toolchain-alongside-Poky-one.patch
>>
>> diff --git a/recipes-bsp/powervr-drivers/ti-img-rogue-driver/0001-compiler.mk-support-OE-toolchain-alongside-Poky-one.patch b/recipes-bsp/powervr-drivers/ti-img-rogue-driver/0001-compiler.mk-support-OE-toolchain-alongside-Poky-one.patch
>> deleted file mode 100644
>> index abe48df..0000000
>> --- a/recipes-bsp/powervr-drivers/ti-img-rogue-driver/0001-compiler.mk-support-OE-toolchain-alongside-Poky-one.patch
>> +++ /dev/null
>> @@ -1,26 +0,0 @@
>> -From 0d291f91d86e59d87ce023b4e7b89f6b00aa4aab Mon Sep 17 00:00:00 2001
>> -From: Denys Dmytriyenko <denis@denix.org>
>> -Date: Sat, 27 Mar 2021 00:20:57 -0400
>> -Subject: [PATCH] compiler.mk: support OE toolchain alongside Poky one
>> -
>> -Signed-off-by: Denys Dmytriyenko <denis@denix.org>
>> ----
>> - build/linux/config/compiler.mk | 2 +-
>> - 1 file changed, 1 insertion(+), 1 deletion(-)
>> -
>> -diff --git a/build/linux/config/compiler.mk b/build/linux/config/compiler.mk
>> -index 53a0bef..d45d438 100644
>> ---- a/build/linux/config/compiler.mk
>> -+++ b/build/linux/config/compiler.mk
>> -@@ -65,7 +65,7 @@ define calculate-compiler-preferred-target
>> -    ifneq ($$(filter i386-% i486-% i586-% i686-%,$$($(1)_compiler_preferred_target)),)
>> -     $(1)_compiler_preferred_target := i386-linux-gnu
>> -    endif
>> --   ifneq ($$(filter aarch64-poky-linux,$$($(1)_compiler_preferred_target)),)
>> -+   ifneq ($$(filter aarch64-poky-linux aarch64-oe-linux,$$($(1)_compiler_preferred_target)),)
>> -     $(1)_compiler_preferred_target := aarch64-linux-gnu
>> -    endif
>> -    ifneq ($$(filter armv7a-cros-linux-gnueabi armv7l-tizen-linux-gnueabi,$$($(1)_compiler_preferred_target)),)
>> ---
>> -2.7.4
>> -
>> diff --git a/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.13.5776728.bb b/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.13.5776728.bb
>> index 00f1d81..e6edebd 100644
>> --- a/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.13.5776728.bb
>> +++ b/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.13.5776728.bb
>> @@ -19,8 +19,8 @@ PROVIDES = "virtual/gpudriver"
>>   
>>   BRANCH = "1.13-5776728/linux-k5.10"
>>   
>> -SRC_URI = "git://git.ti.com/graphics/ti-img-rogue-driver.git;branch=${BRANCH} \
>> -    file://0001-compiler.mk-support-OE-toolchain-alongside-Poky-one.patch \
>> +SRC_URI = " \
>> +    git://git.ti.com/graphics/ti-img-rogue-driver.git;branch=${BRANCH} \
>>       file://0001-compiler-support-OpenEmbedded-nodistro-internal-aarc.patch \
>>   "

Shouldn't we revert the patch by removing 
file://0001-compiler-support-OpenEmbedded-nodistro-internal-aarc.patch?
And also back-port the patch to dunfell to use patch 
0001-compiler.mk-support-OE-toolchain-alongside-Poky-one.patch instead 
of /0001-compiler-support-OpenEmbedded-nodistro-internal-aarc.patch

>>   
>> -- 
>> 2.7.4
>>
> 
> 
> 
> 
> 
