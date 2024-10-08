Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57617CEFC52
	for <webhook@archiver.kernel.org>; Tue,  8 Oct 2024 19:57:14 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.5249.1728417432878631793
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 08 Oct 2024 12:57:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=XUQiHSgn;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 498JvAQ7018939;
	Tue, 8 Oct 2024 14:57:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1728417430;
	bh=SPblkRJafhllhtlzG8HWRtMTbUpd6C6rhiu43yQ56CQ=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=XUQiHSgnyIttnr5Vjj8R1TqVyv8U4pEBZ5OyS8XEKFlSk7YTEemXz8MNRCsZRpcuC
	 ehZ/KJl/DoUqcV/+NH2tIkP/uFEHu7fXYoFHu6fcIrVAuqcsRDl3Lps03My9vVG6jX
	 pw959U2bdGa8Fpfm5shvI6RZRwwZ5McOthK+3R/s=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 498JvAMf030320;
	Tue, 8 Oct 2024 14:57:10 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 8
 Oct 2024 14:57:10 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 8 Oct 2024 14:57:10 -0500
Received: from [10.249.35.83] ([10.249.35.83])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 498JvAwM016882;
	Tue, 8 Oct 2024 14:57:10 -0500
Message-ID: <1c08e4ee-3beb-453b-b8fb-ba803b8d5d82@ti.com>
Date: Tue, 8 Oct 2024 14:57:10 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master/scarthgap][PATCH 3/4] ti-bsp: Add ti-6_12
To: Denys Dmytriyenko <denis@denix.org>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20241004151857.24578-1-reatmon@ti.com>
 <20241004151857.24578-3-reatmon@ti.com> <20241008195514.GJ14676@denix.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20241008195514.GJ14676@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 08 Oct 2024 19:57:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17989



On 10/8/2024 2:55 PM, Denys Dmytriyenko wrote:
> On Fri, Oct 04, 2024 at 10:18:56AM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
>> Add new BSP for the 6.12 kernel and u-boot 2024.10 versions.
>>
>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>> ---
>>   meta-ti-bsp/conf/machine/include/ti-bsp.inc | 15 ++++++++++++++-
>>   1 file changed, 14 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta-ti-bsp/conf/machine/include/ti-bsp.inc b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
>> index 33611689..9a15e164 100644
>> --- a/meta-ti-bsp/conf/machine/include/ti-bsp.inc
>> +++ b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
>> @@ -35,6 +35,19 @@ BSP_BOOTLOADER_VERSION:bsp-next = "%"
>>   # in next, usually present in TI staging or derivative like BB.org
>>   MACHINE_FEATURES:remove:bsp-next = "gpu"
>>   
>> +# ==========
>> +# ti-6_12
>> +# TI staging kernel 6.12, u-boot 2024.10
>> +# ==========
>> +BSP_KERNEL_PROVIDER:bsp-ti-6_12 = "linux-ti-staging"
>> +BSP_KERNEL_VERSION:bsp-ti-6_12 = "6.12%"
>> +BSP_BOOTLOADER_PROVIDER:bsp-ti-6_12 = "u-boot-ti-staging"
>> +BSP_BOOTLOADER_VERSION:bsp-ti-6_12 = "2024.10%"
>> +
>> +# GPU support requires out-of-tree SGX and Rogue drivers not available
>> +# in 6.12 yet
>> +MACHINE_FEATURES:remove:bsp-next = "gpu"
> 
> Copy/paste error? bsp-ti_6.12 vs. bsp-next

Yes.  I'll fix that.


> 
>> +
>>   # ==========
>>   # ti-6_6
>>   # TI staging kernel 6.6, u-boot 2024.04
>> @@ -42,7 +55,7 @@ MACHINE_FEATURES:remove:bsp-next = "gpu"
>>   BSP_KERNEL_PROVIDER:bsp-ti-6_6 = "linux-ti-staging"
>>   BSP_KERNEL_VERSION:bsp-ti-6_6 = "6.6%"
>>   BSP_BOOTLOADER_PROVIDER:bsp-ti-6_6 = "u-boot-ti-staging"
>> -BSP_BOOTLOADER_VERSION:bsp-ti-6_6 = "2024%"
>> +BSP_BOOTLOADER_VERSION:bsp-ti-6_6 = "2024.04%"
>>   
>>   # Only Rogue is enabled so far, SGX falls back to SW rendering
>>   BSP_ROGUE_DRIVER_PROVIDER:bsp-ti-6_6 = "ti-img-rogue-driver"
>> -- 
>> 2.17.1

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

