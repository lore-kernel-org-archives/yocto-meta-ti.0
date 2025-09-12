Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6285ACA101F
	for <webhook@archiver.kernel.org>; Fri, 12 Sep 2025 16:31:27 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.21227.1757694685182346081
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 12 Sep 2025 09:31:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=sjEw1eK3;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: afd@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58CGVKRf557619;
	Fri, 12 Sep 2025 11:31:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757694680;
	bh=jtPTmUVJFBXGn/7hx3Z2pTRWSx7Q7ogScDZ3Xiwhogs=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=sjEw1eK3aHAZxKjWlR7RXsbmWTHQxd4jmS+0onoKTwhDhQosiOuuOqoBBakbphO6r
	 uHq+d+7Wjz5edcpLlaxJFxvZL1cE9i7WOf/Xeo1aBuJCmrAKmNn0VTgQVqxUFszxjI
	 ukXiNwduBpS5Gn/r7XCQ34rajfhn1z7J3aRPhYi4=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58CGVK4f1982417
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 12 Sep 2025 11:31:20 -0500
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 12
 Sep 2025 11:31:20 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 12 Sep 2025 11:31:20 -0500
Received: from [10.250.32.255] ([10.250.32.255])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58CGVKMq4184097;
	Fri, 12 Sep 2025 11:31:20 -0500
Message-ID: <843d1ceb-0d14-4b23-96dd-8bc0e8508a8b@ti.com>
Date: Fri, 12 Sep 2025 11:31:19 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][scarthgap][RFC 2/6] ti-bsp: Do not remove gpu
 MACHINE_FEATURE conditionally on BSP version
To: Denys Dmytriyenko <denis@denix.org>
CC: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        Randolph Sapp <rs@ti.com>, <meta-ti@lists.yoctoproject.org>
References: <20250909151028.272925-1-afd@ti.com>
 <20250909151028.272925-2-afd@ti.com> <20250909204425.GE3125@denix.org>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250909204425.GE3125@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 12 Sep 2025 16:31:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19007

On 9/9/25 3:44 PM, Denys Dmytriyenko wrote:
> On Tue, Sep 09, 2025 at 10:10:24AM -0500, Andrew Davis via lists.yoctoproject.org wrote:
>> Setting or removing the gpu MACHINE_FEATURE does not actually change
>> if the GPU driver is built or not. That is done based on the setting
>> of the BSP_{SGX,ROGUE}_{DRIVER,UMLIBS}_{PROVIDER,VERSION} vars. These
>> are default empty for BSP versions without supported GPU drivers, which
>> will correctly cause a fallback to SW rendering when the GPU driver is
>> not available.
> 
> While cleaning the remaining uses of "gpu" MACHINE_FEATURE, why not remove it
> completely from all the machine configs?
> 

I thought about that, but it could still be useful to key off of that for
other reasons, or even maybe turn the "gpu" MACHINE_FEATURE into "rgx" and
"sgx" so we can later switch on that in the mesa-pvr driver.

Andrew

> 
>> Signed-off-by: Andrew Davis <afd@ti.com>
>> ---
>>   meta-ti-bsp/conf/machine/include/ti-bsp.inc | 8 --------
>>   1 file changed, 8 deletions(-)
>>
>> diff --git a/meta-ti-bsp/conf/machine/include/ti-bsp.inc b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
>> index 262aa884..a5d9a51f 100644
>> --- a/meta-ti-bsp/conf/machine/include/ti-bsp.inc
>> +++ b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
>> @@ -18,10 +18,6 @@ BSP_KERNEL_VERSION:bsp-mainline = "%"
>>   BSP_BOOTLOADER_PROVIDER:bsp-mainline = "u-boot-ti-mainline"
>>   BSP_BOOTLOADER_VERSION:bsp-mainline = "%"
>>   
>> -# GPU support requires out-of-tree SGX and Rogue drivers not available
>> -# in mainline, usually present in TI staging or derivative like BB.org
>> -MACHINE_FEATURES:remove:bsp-mainline = "gpu"
>> -
>>   # GC320 support requires out-of-tree drivers not available in mainline
>>   MACHINE_FEATURES:remove:bsp-mainline = "gc320"
>>   
>> @@ -34,10 +30,6 @@ BSP_KERNEL_VERSION:bsp-next = "%"
>>   BSP_BOOTLOADER_PROVIDER:bsp-next = "u-boot-ti-next"
>>   BSP_BOOTLOADER_VERSION:bsp-next = "%"
>>   
>> -# GPU support requires out-of-tree SGX and Rogue drivers not available
>> -# in next, usually present in TI staging or derivative like BB.org
>> -MACHINE_FEATURES:remove:bsp-next = "gpu"
>> -
>>   # GC320 support requires out-of-tree drivers not available in next
>>   MACHINE_FEATURES:remove:bsp-next = "gc320"
>>   
>> -- 
>> 2.39.2


