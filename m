Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F75BC3DA61
	for <webhook@archiver.kernel.org>; Thu, 25 Jul 2024 01:18:23 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.26066.1721870302964699317
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 24 Jul 2024 18:18:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=r4m9aIfS;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 46P1IHK9127663;
	Wed, 24 Jul 2024 20:18:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1721870297;
	bh=OUw6oRhRSJrEef79/10hgV3vj3I5EQW/7QledOHKxTk=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=r4m9aIfS9wYhtgpmhaKSlhWHclNrD4cnKBBYJAyzIU291zbLCkbmj2YsjxuKdONft
	 jIKjKXqaftJm2G8d/xZt/dYsYwtzCmN614iDAzGhWAPt+Y8jpQxzogkcKbjp9wtfgy
	 8J3IJ02KrtoxbCA8MgfoSGC+79LzqmqkdGk1iSk0=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 46P1IHIM011381
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 24 Jul 2024 20:18:17 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 24
 Jul 2024 20:18:17 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 24 Jul 2024 20:18:17 -0500
Received: from [10.250.34.197] ([10.250.34.197])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 46P1IH57049891;
	Wed, 24 Jul 2024 20:18:17 -0500
Message-ID: <8e9a0648-accf-4699-b828-9882f962f772@ti.com>
Date: Wed, 24 Jul 2024 20:18:17 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master/scarthgap][PATCH v2] linux: Manage the kernel
 patches using the BSP system
To: Denys Dmytriyenko <denis@denix.org>
CC: <meta-ti@lists.yoctoproject.org>
References: <20240719151018.8521-1-reatmon@ti.com>
 <20240724213529.GT17572@denix.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20240724213529.GT17572@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 25 Jul 2024 01:18:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17906


On 7/24/2024 4:35 PM, Denys Dmytriyenko wrote:
> On Fri, Jul 19, 2024 at 10:10:18AM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
>> Applying the patches to all kernels is not going to work.  Each kernel
>> might need different patches to address reproducibility issues.
> 
> Can you also backport this to scarthgap, as these patches fon't apply cleanly
> to bb.org and currently break Beagle builds. Thanks.

It is staged in next waiting for a CICD run.


> 
>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>> ---
>> v2: Fix BSP tag for bsp-ti-6_6
>>
>>   meta-ti-bsp/recipes-kernel/linux/ti-kernel.inc | 12 ++++++++----
>>   1 file changed, 8 insertions(+), 4 deletions(-)
>>
>> diff --git a/meta-ti-bsp/recipes-kernel/linux/ti-kernel.inc b/meta-ti-bsp/recipes-kernel/linux/ti-kernel.inc
>> index f24fbe51..1831ba66 100644
>> --- a/meta-ti-bsp/recipes-kernel/linux/ti-kernel.inc
>> +++ b/meta-ti-bsp/recipes-kernel/linux/ti-kernel.inc
>> @@ -13,8 +13,12 @@ EXTRA_DTC_ARGS += "${@get_extra_dtc_args(d)}"
>>   KERNEL_DTBDEST = "${KERNEL_IMAGEDEST}/dtb"
>>   KERNEL_DTBVENDORED = "1"
>>   
>> -SRC_URI:append = " \
>> -file://0001-lib-build_OID_registry-fix-reproducibility-issues.patch \
>> -file://0001-vt-conmakehash-improve-reproducibility.patch \
>> -file://0001-pnmtologo-use-relocatable-file-name.patch \
>> +KERNEL_PATCHES = ""
>> +
>> +KERNEL_PATCHES:bsp-ti-6_6 = " \
>> +    file://0001-lib-build_OID_registry-fix-reproducibility-issues.patch \
>> +    file://0001-vt-conmakehash-improve-reproducibility.patch \
>> +    file://0001-pnmtologo-use-relocatable-file-name.patch \
>>   "
>> +
>> +SRC_URI:append = " ${KERNEL_PATCHES} "
>> -- 
>> 2.17.1

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

