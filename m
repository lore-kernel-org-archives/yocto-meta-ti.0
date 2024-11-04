Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 082A8D1CA08
	for <webhook@archiver.kernel.org>; Mon,  4 Nov 2024 22:37:35 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.4071.1730759852108233955
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 04 Nov 2024 14:37:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=a++GY7Za;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4A4MbV0Y124929;
	Mon, 4 Nov 2024 16:37:31 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1730759851;
	bh=ZyeAVtpMfWjZtKBCbPpf61Fi3UBkMswso5vOq2VwDIA=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=a++GY7ZanWdua73aVsvA6Si3m5XjpvVS88DJBvRLQFQ48+t+1qxXTWf2XpY4S6D+v
	 AJPbUzUe0+7v3tHgGTaoZYMKV2ec+jM+HC4q45XFppq1tMtB9c6e7ybdrrkRWnzVCY
	 LvvE0zdGwVYzYp+n3n/pWjjZsvh+6YN1ow3/B540=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4A4MbVHb010847;
	Mon, 4 Nov 2024 16:37:31 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 4
 Nov 2024 16:37:30 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 4 Nov 2024 16:37:30 -0600
Received: from [10.249.32.170] ([10.249.32.170])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4A4MbUhh031989;
	Mon, 4 Nov 2024 16:37:30 -0600
Message-ID: <bdd2942e-a2a5-4bd1-906d-34ef8fba833c@ti.com>
Date: Mon, 4 Nov 2024 16:37:30 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master/scarthgap][PATCH] mesa-pvr: Fix build issues
 with llvm 18+
To: Randolph Sapp <rs@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20241104194638.14864-1-reatmon@ti.com>
 <D5DQS43VL7FF.3AYS98PYYLZKQ@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <D5DQS43VL7FF.3AYS98PYYLZKQ@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 04 Nov 2024 22:37:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18039



On 11/4/2024 4:19 PM, Randolph Sapp wrote:
> On Mon Nov 4, 2024 at 1:46 PM CST, Ryan Eatmon via lists.yoctoproject.org wrote:
>> Backport two fixes from the latest mesa project to fix two builds issues
>> related to newer llvm versions.
>>
>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>> ---
>>   ...allium-Fix-build-with-llvm-18-and-19.patch | 53 +++++++++++++++++++
>>   .../recipes-graphics/mesa/mesa-pvr_23.2.1.bb  |  1 +
>>   2 files changed, 54 insertions(+)
>>   create mode 100644 meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-23.2.1/0001-gallium-Fix-build-with-llvm-18-and-19.patch
>>
>> diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-23.2.1/0001-gallium-Fix-build-with-llvm-18-and-19.patch b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-23.2.1/0001-gallium-Fix-build-with-llvm-18-and-19.patch
>> new file mode 100644
>> index 00000000..ad5059f1
>> --- /dev/null
>> +++ b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-23.2.1/0001-gallium-Fix-build-with-llvm-18-and-19.patch
>> @@ -0,0 +1,53 @@
>> +From 6c5033bb01a3a1341d4db5007586a5f2e2727b0a Mon Sep 17 00:00:00 2001
>> +From: Ryan Eatmon <reatmon@ti.com>
>> +Date: Mon, 4 Nov 2024 13:37:29 -0600
>> +Subject: [PATCH] gallium: Fix build with llvm 18 and 19
>> +
>> +- CodeGenOpt::Level changed to CodeGenOoptLevel. [1]
>> +- llvm::sys::getHostCPUFeatures() now returns the features instead of
>> +modifying the passed in argument. [2]
>> +
>> +Upstream-Status: Backport [1][https://gitlab.freedesktop.org/mesa/mesa/-/commit/f79617fe804ea6524651ff1bc3a91098d3199179]
>> +Upstream-Status: Backport [2][https://gitlab.freedesktop.org/mesa/mesa/-/commit/fa9cd89a85b904615ebc11da609445b5b751e68d]
>> +
>> +Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>> +---
>> + src/gallium/auxiliary/gallivm/lp_bld_misc.cpp | 14 ++++++++++++--
>> + 1 file changed, 12 insertions(+), 2 deletions(-)
>> +
>> +diff --git a/src/gallium/auxiliary/gallivm/lp_bld_misc.cpp b/src/gallium/auxiliary/gallivm/lp_bld_misc.cpp
>> +index 5e7a30a6cc2..dbc777e3096 100644
>> +--- a/src/gallium/auxiliary/gallivm/lp_bld_misc.cpp
>> ++++ b/src/gallium/auxiliary/gallivm/lp_bld_misc.cpp
>> +@@ -366,7 +366,11 @@ lp_build_create_jit_compiler_for_module(LLVMExecutionEngineRef *OutJIT,
>> +    builder.setEngineKind(EngineKind::JIT)
>> +           .setErrorStr(&Error)
>> +           .setTargetOptions(options)
>> ++#if LLVM_VERSION_MAJOR >= 18
>> ++          .setOptLevel((CodeGenOptLevel)OptLevel);
>> ++#else
>> +           .setOptLevel((CodeGenOpt::Level)OptLevel);
>> ++#endif
>> +
>> + #if DETECT_OS_WINDOWS
>> +     /*
>> +@@ -394,8 +398,14 @@ lp_build_create_jit_compiler_for_module(LLVMExecutionEngineRef *OutJIT,
>> +     * which allows us to enable/disable code generation based
>> +     * on the results of cpuid on these architectures.
>> +     */
>> +-   llvm::StringMap<bool> features;
>> +-   llvm::sys::getHostCPUFeatures(features);
>> ++   #if LLVM_VERSION_MAJOR >= 19
>> ++      /* llvm-19+ returns StringMap from getHostCPUFeatures.
>> ++      */
>> ++      auto features = llvm::sys::getHostCPUFeatures();
>> ++   #else
>> ++      llvm::StringMap<bool> features;
>> ++      llvm::sys::getHostCPUFeatures(features);
>> ++   #endif
>> +
>> +    for (StringMapIterator<bool> f = features.begin();
>> +         f != features.end();
>> +--
>> +2.17.1
>> +
>> diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_23.2.1.bb b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_23.2.1.bb
>> index 21134bc7..33af456d 100644
>> --- a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_23.2.1.bb
>> +++ b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_23.2.1.bb
>> @@ -16,6 +16,7 @@ SRC_URI = " \
>>       file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
>>       file://0001-gallium-Fix-build-with-llvm-17.patch \
>>       file://0001-meson-Disable-cmake-dependency-detector-for-llvm.patch \
>> +    file://0001-gallium-Fix-build-with-llvm-18-and-19.patch \
>>   "
>>   
>>   S = "${WORKDIR}/git"
> 
> Thanks Ryan! Since it's an upstream commit, I can carry it on the powervr mesa
> branches directly, if that's preferable. Up to you.

That's up to you.  But you will need to fix both of the versions.


> Worth noting that in my tests right now I'm seeing a runtime fault. Don't
> believe it's related to this patch but I would be cautious enabling
> gallium-llvmpipe at this moment.

I'll hold off on accepting it while you fully test it.  Just let me know.


> Reviewed-by: Randolph Sapp <rs@ti.com>

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

