Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E22DDE77188
	for <webhook@archiver.kernel.org>; Fri, 10 Jan 2025 19:31:00 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.912.1736537454966509757
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 10 Jan 2025 11:30:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=wishI/Td;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 50AJUpjZ118822;
	Fri, 10 Jan 2025 13:30:51 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1736537451;
	bh=fevOUSxsHNBe7Ew5TWEwXAUhglDvfWstFaJAIQkeJIg=;
	h=Date:From:Subject:To:CC:References:In-Reply-To;
	b=wishI/Tdea6W6zWvCLY9J/Eqbvc7vPZNIR+S+eKlQ1Ny3lVRoKnPSag3mZ23PpMMb
	 mchElIabaFJeCFW4Qr0Y24zr/OA8VyGFNULjrXSo193UnX9azlrcuZITflTjCI0T1A
	 I/Jx3pxvnLV319+7Ac2vJPmFsun4mQEjtNfrbT2E=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50AJUpbK029342;
	Fri, 10 Jan 2025 13:30:51 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 10
 Jan 2025 13:30:51 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 10 Jan 2025 13:30:51 -0600
Received: from [10.249.33.244] ([10.249.33.244])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50AJUpn1054597;
	Fri, 10 Jan 2025 13:30:51 -0600
Message-ID: <3ede03c7-b900-441c-8568-5f55833dc47b@ti.com>
Date: Fri, 10 Jan 2025 13:30:51 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Ryan Eatmon <reatmon@ti.com>
Subject: Re: [meta-ti][scarthgap/master][PATCH v2] ti-bsp: Disable GC320
 support conditionally on BSP version
To: Denys Dmytriyenko <denis@denix.org>, <afd@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
References: <20250108205145.542754-1-afd@ti.com>
 <20250110180624.GE21836@denix.org>
Content-Language: en-US
In-Reply-To: <20250110180624.GE21836@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 10 Jan 2025 19:31:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18179



On 1/10/2025 12:06 PM, Denys Dmytriyenko wrote:
> On Wed, Jan 08, 2025 at 02:51:45PM -0600, Andrew Davis via lists.yoctoproject.org wrote:
>> Like we do with GPU support, GC320 support is conditional on the
>> kernel we are building and so should be disabled here for kernels
>> on which it is not functional yet.
>>
>> We can then remove these disabling lines as the driver is updated
>> for each supported kernel, instead of blanket disabling in the
>> distro layer as done currently.
>>
>> Signed-off-by: Andrew Davis <afd@ti.com>
>> ---
>>
>> Changes for v2:
>>   - Rebased on latest with new meta-beagle layer
>>
>>   meta-beagle/conf/machine/include/beagle-bsp.inc |  6 ++++++
>>   meta-ti-bsp/conf/machine/include/ti-bsp.inc     | 15 +++++++++++++++
>>   2 files changed, 21 insertions(+)
>>
>> diff --git a/meta-beagle/conf/machine/include/beagle-bsp.inc b/meta-beagle/conf/machine/include/beagle-bsp.inc
>> index 34889b41..06483ba9 100644
>> --- a/meta-beagle/conf/machine/include/beagle-bsp.inc
>> +++ b/meta-beagle/conf/machine/include/beagle-bsp.inc
>> @@ -23,6 +23,9 @@ BSP_ROGUE_DRIVER_VERSION:bsp-bb_org-6_1 = "23%"
>>   BSP_ROGUE_UMLIBS_VERSION:bsp-bb_org-6_1 = "23%"
>>   BSP_MESA_PVR_VERSION:bsp-bb_org-6_1 = "22%"
>>   
>> +# GC320 support requires out-of-tree drivers not yet available in bb.org 6.1
>> +MACHINE_FEATURES:remove:bsp-bb_org-6_1 = "gc320"
>> +
>>   # ==========
>>   # bb_org-6_6
>>   # BeagleBoard.org kernel 6.6, Upstream u-boot 2024.07
>> @@ -41,3 +44,6 @@ BSP_ROGUE_DRIVER_PROVIDER:bsp-bb_org-6_6 = "ti-img-rogue-driver"
>>   BSP_ROGUE_DRIVER_VERSION:bsp-bb_org-6_6 = "24%"
>>   BSP_ROGUE_UMLIBS_VERSION:bsp-bb_org-6_6 = "24%"
>>   BSP_MESA_PVR_VERSION:bsp-bb_org-6_6 = "23%"
>> +
>> +# GC320 support requires out-of-tree drivers not yet available in bb.org 6.6
>> +MACHINE_FEATURES:remove:bsp-bb_org-6_6 = "gc320"
>> diff --git a/meta-ti-bsp/conf/machine/include/ti-bsp.inc b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
>> index 4bbe7668..6773bb7a 100644
>> --- a/meta-ti-bsp/conf/machine/include/ti-bsp.inc
>> +++ b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
>> @@ -22,6 +22,9 @@ BSP_BOOTLOADER_VERSION:bsp-mainline = "%"
>>   # in mainline, usually present in TI staging or derivative like BB.org
>>   MACHINE_FEATURES:remove:bsp-mainline = "gpu"
>>   
>> +# GC320 support requires out-of-tree drivers not available in mainline
>> +MACHINE_FEATURES:remove:bsp-mainline = "gc320"
>> +
>>   # ==========
>>   # next
>>   # upcoming upstream/mainline kernel, u-boot
>> @@ -35,6 +38,9 @@ BSP_BOOTLOADER_VERSION:bsp-next = "%"
>>   # in next, usually present in TI staging or derivative like BB.org
>>   MACHINE_FEATURES:remove:bsp-next = "gpu"
>>   
>> +# GC320 support requires out-of-tree drivers not available in next
>> +MACHINE_FEATURES:remove:bsp-next = "gc320"
> 
> Andrew, Ryan,
> 
> Something went wrong here ^^^
> Instead of removing "gc320" for bsp-next, like in the patch here, it got
> committed removing it for bsp-ti-6_12 twice:
> 
> https://git.yoctoproject.org/meta-ti/commit/?h=master-wip&id=fe0b35f5f135b98d1ee0f8fe2488b10fbe9a7bb3
> 
> Was there any manual massaging involved?

Yes.  I did.  Let me look at it.


> 
>> +
>>   # ==========
>>   # ti-6_12
>>   # TI staging kernel 6.12, u-boot 2024.10
>> @@ -48,6 +54,9 @@ BSP_BOOTLOADER_VERSION:bsp-ti-6_12 = "2024.10%"
>>   # in 6.12 yet
>>   MACHINE_FEATURES:remove:bsp-ti-6_12 = "gpu"
>>   
>> +# GC320 support requires out-of-tree drivers not yet available in 6.12
>> +MACHINE_FEATURES:remove:bsp-ti-6_12 = "gc320"
>> +
>>   # ==========
>>   # ti-6_6
>>   # TI staging kernel 6.6, u-boot 2024.04
>> @@ -65,6 +74,9 @@ BSP_ROGUE_DRIVER_VERSION:bsp-ti-6_6 = "24%"
>>   BSP_ROGUE_UMLIBS_VERSION:bsp-ti-6_6 = "24%"
>>   BSP_MESA_PVR_VERSION:bsp-ti-6_6 = "23%"
>>   
>> +# GC320 support requires out-of-tree drivers not yet available in 6.6
>> +MACHINE_FEATURES:remove:bsp-ti-6_6 = "gc320"
>> +
>>   # ==========
>>   # ti-6_1
>>   # TI staging kernel 6.1, u-boot 2023.04
>> @@ -82,6 +94,9 @@ BSP_ROGUE_DRIVER_VERSION:bsp-ti-6_1 = "23%"
>>   BSP_ROGUE_UMLIBS_VERSION:bsp-ti-6_1 = "23%"
>>   BSP_MESA_PVR_VERSION:bsp-ti-6_1 = "22%"
>>   
>> +# GC320 support requires out-of-tree drivers not yet available in 6.1
>> +MACHINE_FEATURES:remove:bsp-ti-6_1 = "gc320"
>> +
>>   # ==========
>>   # sane fallback defaults
>>   # if specific values are not defined or bsp is set incorrectly
>> -- 
>> 2.39.2

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

