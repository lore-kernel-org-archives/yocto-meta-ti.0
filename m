Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17946C27C4F
	for <webhook@archiver.kernel.org>; Thu, 13 Jun 2024 21:10:00 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.3853.1718312992926414381
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 13 Jun 2024 14:09:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=j5cJkeLR;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45DL9lek026222;
	Thu, 13 Jun 2024 16:09:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1718312987;
	bh=2NgMl00nZdd0cDKEzTUcT8SL31nOG7sqZzgdKpCYEo8=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=j5cJkeLRwSiVs6xedVLi7fpr0s7GW/S2IfLzSjYfXJ+xa3xEEt07wNRaDmTWPJF1b
	 wCpZnQxOevAPt4j55saytiZTpaQ0XO+3szmaRNLo/gcT+jINwCfmhQCmEN4ImIjld0
	 BY3ztw9ondSiHIABigJ/64VUpAWsmOhSPf6paPzY=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45DL9lh7112524
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 13 Jun 2024 16:09:47 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 13
 Jun 2024 16:09:46 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 13 Jun 2024 16:09:46 -0500
Received: from [10.249.34.39] ([10.249.34.39])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45DL9kbh038115;
	Thu, 13 Jun 2024 16:09:46 -0500
Message-ID: <4c6fbb27-1a10-4eeb-90f0-3b11b18639e4@ti.com>
Date: Thu, 13 Jun 2024 16:09:46 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] [master/scarthgap][PATCH 1/4] conf/machine, ti-bsp: add
 support for multiple BSP providers
To: Denys Dmytriyenko <denis@denix.org>
CC: <meta-ti@lists.yoctoproject.org>, Denys Dmytriyenko <denys@konsulko.com>
References: <20240613172254.770920-1-denis@denix.org>
 <28a0c396-3450-45b7-b411-fba68f06f129@ti.com>
 <20240613194731.GV21287@denix.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20240613194731.GV21287@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 13 Jun 2024 21:10:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17725



On 6/13/2024 2:47 PM, Denys Dmytriyenko wrote:
> On Thu, Jun 13, 2024 at 02:29:34PM -0500, Ryan Eatmon wrote:
>>
>>
>> On 6/13/2024 12:22 PM, Denys Dmytriyenko wrote:
>>> From: Denys Dmytriyenko <denys@konsulko.com>
>>>
>>> This adds a facility to define multiple supported BSPs with their own
>>> preferences for individual components, as well as lets machine configs
>>> specify conditional configurations for different BSPs.
>>>
>>> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
>>> ---
>>
>> <snip>
>>
>>> +
>>> +# ==========
>>> +# ti-6_6
>>> +# TI staging kernel 6.6, u-boot 2024.04
>>> +# ==========
>>> +BSP_KERNEL_PROVIDER:bsp-ti-6_6 = "linux-ti-staging"
>>> +BSP_KERNEL_VERSION:bsp-ti-6_6 = "6.6%"
>>> +BSP_BOOTLOADER_PROVIDER:bsp-ti-6_6 = "u-boot-ti-staging"
>>> +BSP_BOOTLOADER_VERSION:bsp-ti-6_6 = "2024%"
>>> +
>>> +# Only Rogue is enabled so far, SGX falls back to SW rendering
>>> +BSP_ROGUE_DRIVER_PROVIDER:bsp-ti-6_6 = "ti-img-rogue-driver"
>>> +BSP_ROGUE_DRIVER_VERSION:bsp-ti-6_6 = "24%"
>>> +BSP_ROGUE_UMLIBS_VERSION:bsp-ti-6_6 = "24%"
>>> +BSP_MESA_PVR_VERSION:bsp-ti-6_6 = "23%"
>>> +
>>> +# ==========
>>> +# ti-6_1
>>> +# TI staging kernel 6.1, u-boot 2023.04
>>> +# ==========
>>> +BSP_KERNEL_PROVIDER:bsp-ti-6_1 = "linux-ti-staging"
>>> +BSP_KERNEL_VERSION:bsp-ti-6_1 = "6.1%"
>>> +BSP_BOOTLOADER_PROVIDER:bsp-ti-6_1 = "u-boot-ti-staging"
>>> +BSP_BOOTLOADER_VERSION:bsp-ti-6_1 = "2023%"
>>> +
>>> +BSP_SGX_DRIVER_PROVIDER:bsp-ti-6_1 = "ti-sgx-ddk-km"
>>> +BSP_SGX_DRIVER_VERSION:bsp-ti-6_1 = "1.17%"
>>> +BSP_SGX_UMLIBS_VERSION:bsp-ti-6_1 = "1.17%"
>>> +BSP_ROGUE_DRIVER_PROVIDER:bsp-ti-6_1 = "ti-img-rogue-driver"
>>> +BSP_ROGUE_DRIVER_VERSION:bsp-ti-6_1 = "23%"
>>> +BSP_ROGUE_UMLIBS_VERSION:bsp-ti-6_1 = "23%"
>>> +BSP_MESA_PVR_VERSION:bsp-ti-6_1 = "22%"
>>
>> I wonder if I can use this same system to support the upstream
>> testing...  After we accept this series I need to look at how the
>> upstream testing flow can leverage this concept.
> 
> That's the mainline setup...

For the kernel we use linux-ti-next not mainline.


-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

