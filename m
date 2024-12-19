Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A26EE7718A
	for <webhook@archiver.kernel.org>; Thu, 19 Dec 2024 00:05:49 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.119068.1734566739212502291
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 18 Dec 2024 16:05:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=FAZePbLh;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4BJ05Zc23699585
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 18 Dec 2024 18:05:35 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1734566735;
	bh=iLapVNUUc2pTh8toLVYKIfR377w95iE9Ew6tqAkmEro=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=FAZePbLhKjCgprFktDtEULzg6qomNwGwo6oltvWBUoTcOF7E1IWr0r+RxdomRxDAW
	 CNeyYSKTGxmpxeTj7EXBostjWmOLGbsPS7pGXd5Q1UrADBaGMnseujiA5GZN9rRjdt
	 VtTZbya0ZTvlY6c4Xq7KwA4fvs7ZmcUkfQFW+RnU=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BJ05ZAX048806;
	Wed, 18 Dec 2024 18:05:35 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 18
 Dec 2024 18:05:34 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 18 Dec 2024 18:05:34 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BJ05YHF099475;
	Wed, 18 Dec 2024 18:05:34 -0600
Message-ID: <85f7d35e-67ab-4e83-bbc3-ac20f3a29890@ti.com>
Date: Wed, 18 Dec 2024 18:05:34 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][scarthgap/master][PATCH] ti-bsp: Disable GC320 support
 conditionally on BSP version
To: Denys Dmytriyenko <denis@denix.org>
CC: Ryan Eatmon <reatmon@ti.com>, <meta-ti@lists.yoctoproject.org>
References: <20241217205945.46805-1-afd@ti.com>
 <20241218211927.GI23825@denix.org>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20241218211927.GI23825@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 19 Dec 2024 00:05:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18143

On 12/18/24 3:19 PM, Denys Dmytriyenko wrote:
> Andrew,
> 
> Thanks for the patches. Ryan and I were discussing them yesterday.
> 
> Couple points/questions:
> 
> 1. There's meta-beagle restructuring going on in master right now - the
> changes are in master-next and should be merged to master shortly. I also
> just posted a series to backport these changes to scarthgap. That will
> affect your change below to ti-bsp.inc and will need to be re-spinned.
> 

No worries. The restructure looks good btw, looking forward to having
cleaner separation (and the new BeagleY-AI builds :D). I'll re-spin this
when meta-beagle lands in master and scarthgap.

> 2. A more generic question... GC320 is a unique peripheral of legacy AM57/J6
> platforms and the driver for it hasn't been updated since 5.10 times. It
> has been disabled globally in the Distro layer for a couple years now. While
> I do understand your change to move this disablenent from the Distro to
> BSP, are there any plans to revive GC320 support and not simply remove it
> altogether?
> 

The fix to get the GC320 kernel module building again is rather trivial. Just
never got around to pushing the fixes. So mostly just wishful thinking that it
will get re-enabled here at some point..

Andrew

> 
> On Tue, Dec 17, 2024 at 02:59:45PM -0600, Andrew Davis via lists.yoctoproject.org wrote:
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
>>   meta-ti-bsp/conf/machine/include/ti-bsp.inc | 18 ++++++++++++++++++
>>   1 file changed, 18 insertions(+)
>>
>> diff --git a/meta-ti-bsp/conf/machine/include/ti-bsp.inc b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
>> index 814c6ca8..bdc8bef7 100644
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
>>   # bb_org
>>   # BeagleBoard.org kernel 6.1, u-boot 2023.04
>> @@ -101,6 +116,9 @@ BSP_ROGUE_DRIVER_VERSION:bsp-bb_org = "23%"
>>   BSP_ROGUE_UMLIBS_VERSION:bsp-bb_org = "23%"
>>   BSP_MESA_PVR_VERSION:bsp-bb_org = "22%"
>>   
>> +# GC320 support requires out-of-tree drivers not yet available in bb.org
>> +MACHINE_FEATURES:remove:bsp-bb_org = "gc320"
>> +
>>   # ==========
>>   # sane fallback defaults
>>   # if specific values are not defined or bsp is set incorrectly
>> -- 
>> 2.39.2

