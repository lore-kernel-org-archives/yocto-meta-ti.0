Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1CA6CAC59A
	for <webhook@archiver.kernel.org>; Wed, 17 Sep 2025 21:54:35 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.36046.1758146069803308241
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 17 Sep 2025 14:54:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=SJIzKZE/;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: afd@ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58HLsPju346722;
	Wed, 17 Sep 2025 16:54:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758146065;
	bh=9et/KVY/Qk7U1hc0psSdS4l9fcJS1gN/2vX4P8bNePk=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=SJIzKZE/S1Sxt0NTM2KxiwHwZ8MuOU3Hdf9tg1aRjHmqqP0x7U0R/TeOYwm+KVqnN
	 IpkadM7jcSbgCZagTv6uVNVjeXqKCXBYEMxoU1Xzmw9P/MlEUzf4g76HHYkxdHyvZL
	 cO9Rjg0d3nfkARi55vGMx3+WDq0Eczb6VbRLE3iA=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58HLsPLL1067724
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 17 Sep 2025 16:54:25 -0500
Received: from DFLE212.ent.ti.com (10.64.6.70) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 17
 Sep 2025 16:54:24 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 17 Sep 2025 16:54:24 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58HLsOWI4030690;
	Wed, 17 Sep 2025 16:54:24 -0500
Message-ID: <d068ed20-5536-4ed5-a513-5da529aa39ff@ti.com>
Date: Wed, 17 Sep 2025 16:54:24 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][scarthgap][RFC 2/6] ti-bsp: Do not remove gpu
 MACHINE_FEATURE conditionally on BSP version
To: Denys Dmytriyenko <denis@denix.org>
CC: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        Randolph Sapp <rs@ti.com>, <meta-ti@lists.yoctoproject.org>
References: <20250909151028.272925-1-afd@ti.com>
 <20250909151028.272925-2-afd@ti.com> <20250909204425.GE3125@denix.org>
 <843d1ceb-0d14-4b23-96dd-8bc0e8508a8b@ti.com>
 <20250912182425.GJ3125@denix.org>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250912182425.GJ3125@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 17 Sep 2025 21:54:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19023

On 9/12/25 1:24 PM, Denys Dmytriyenko wrote:
> On Fri, Sep 12, 2025 at 11:31:19AM -0500, Andrew Davis wrote:
>> On 9/9/25 3:44 PM, Denys Dmytriyenko wrote:
>>> On Tue, Sep 09, 2025 at 10:10:24AM -0500, Andrew Davis via lists.yoctoproject.org wrote:
>>>> Setting or removing the gpu MACHINE_FEATURE does not actually change
>>>> if the GPU driver is built or not. That is done based on the setting
>>>> of the BSP_{SGX,ROGUE}_{DRIVER,UMLIBS}_{PROVIDER,VERSION} vars. These
>>>> are default empty for BSP versions without supported GPU drivers, which
>>>> will correctly cause a fallback to SW rendering when the GPU driver is
>>>> not available.
>>>
>>> While cleaning the remaining uses of "gpu" MACHINE_FEATURE, why not remove it
>>> completely from all the machine configs?
>>>
>>
>> I thought about that, but it could still be useful to key off of that for
>> other reasons, or even maybe turn the "gpu" MACHINE_FEATURE into "rgx" and
>> "sgx" so we can later switch on that in the mesa-pvr driver.
> 
> Heh, this MACHINE_FEATURE used to be called "sgx" back in the day. When Rogue
> was being added, I briefly had a separate "rgx" flag, but eventually combined
> both into "gpu" one...
> 

Okay so then I have two options, I can switch back to "sgx" and "rgx" for
some later use, or I can just drop the MACHINE_FEATURE completely, any
preference?

> 
>>>> Signed-off-by: Andrew Davis <afd@ti.com>
>>>> ---
>>>>   meta-ti-bsp/conf/machine/include/ti-bsp.inc | 8 --------
>>>>   1 file changed, 8 deletions(-)
>>>>
>>>> diff --git a/meta-ti-bsp/conf/machine/include/ti-bsp.inc b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
>>>> index 262aa884..a5d9a51f 100644
>>>> --- a/meta-ti-bsp/conf/machine/include/ti-bsp.inc
>>>> +++ b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
>>>> @@ -18,10 +18,6 @@ BSP_KERNEL_VERSION:bsp-mainline = "%"
>>>>   BSP_BOOTLOADER_PROVIDER:bsp-mainline = "u-boot-ti-mainline"
>>>>   BSP_BOOTLOADER_VERSION:bsp-mainline = "%"
>>>> -# GPU support requires out-of-tree SGX and Rogue drivers not available
>>>> -# in mainline, usually present in TI staging or derivative like BB.org
>>>> -MACHINE_FEATURES:remove:bsp-mainline = "gpu"
>>>> -
>>>>   # GC320 support requires out-of-tree drivers not available in mainline
>>>>   MACHINE_FEATURES:remove:bsp-mainline = "gc320"
>>>> @@ -34,10 +30,6 @@ BSP_KERNEL_VERSION:bsp-next = "%"
>>>>   BSP_BOOTLOADER_PROVIDER:bsp-next = "u-boot-ti-next"
>>>>   BSP_BOOTLOADER_VERSION:bsp-next = "%"
>>>> -# GPU support requires out-of-tree SGX and Rogue drivers not available
>>>> -# in next, usually present in TI staging or derivative like BB.org
>>>> -MACHINE_FEATURES:remove:bsp-next = "gpu"
>>>> -
>>>>   # GC320 support requires out-of-tree drivers not available in next
>>>>   MACHINE_FEATURES:remove:bsp-next = "gc320"
>>>> -- 
>>>> 2.39.2


