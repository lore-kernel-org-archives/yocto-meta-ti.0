Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50DDCC369AB
	for <webhook@archiver.kernel.org>; Mon, 21 Apr 2025 06:37:35 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.10164.1745217454288019988
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 20 Apr 2025 23:37:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Ye5yB8sN;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: c-shilwant@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53L6bVTM1476949
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 21 Apr 2025 01:37:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745217451;
	bh=WdgBtKC70ASlbhhWro1KF+04rdmfVwrRnKWonH99If4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Ye5yB8sN4QIpKd+0mdBxDvevmv4t+Pk7re7Df6epC3Oy5C4+Kuqq2DwTA/JvT3klg
	 Za8TCW7TqpSvNJcfDphtRsK62ksHHVlRwOntCn+xziu7NEnn8ej0TT8hVyvPYf+P8n
	 JqnoUCu81KGvmfZwT11zb0GO9kzgEh2RbMUNufYI=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53L6bV81082486
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 21 Apr 2025 01:37:31 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 21
 Apr 2025 01:37:30 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 21 Apr 2025 01:37:30 -0500
Received: from [172.24.227.238] (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53L6bTVb027130;
	Mon, 21 Apr 2025 01:37:29 -0500
Message-ID: <0feaf15d-e3ec-4f10-b651-db4225a40437@ti.com>
Date: Mon, 21 Apr 2025 12:07:28 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master/scarthgap][PATCH] conf: machine: am62axx:
 Exclude tiboot3.bin for GP
To: Denys Dmytriyenko <denis@denix.org>
CC: <meta-ti@lists.yoctoproject.org>, Ryan Eatmon <reatmon@ti.com>
References: <20250417033514.3429633-1-c-shilwant@ti.com>
 <20250417182828.GX13634@denix.org>
Content-Language: en-US
From: Chirag Shilwant <c-shilwant@ti.com>
In-Reply-To: <20250417182828.GX13634@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 21 Apr 2025 06:37:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18488


On 17/04/25 23:58, Denys Dmytriyenko wrote:
> On Thu, Apr 17, 2025 at 09:05:14AM +0530, Chirag Shilwant wrote:
>> * The GP variant of SK-AM62A-LP is no longer tested.
> * Is it still being built?
>
> * Also, what about other BSPs, e.g. 6.1?


The GP part was built during the device bring-up (~ 2years back)
Apparently GP samples are limited to TI internal. Hence, the logic to
deploy tiboot3 for it was added in meta-ti-bsp at that time to support
internal development.

Post device APL, all TI internal development is moved to HS-FS part.
(Ideally, this logic of deploying tiboot3 for GP should have been 
removed at that time)

 From customer / 3rd party SOM pov, all receive HS-FS part by default 
from TI.
So, they shouldn't be affected if meta-ti-bsp no longer deploys 
|tiboot3-am62ax-gp-evm.bin|



>
> * What about derivative or customer platforms, besides SK-AM62A-LP? I.e. you
> are modifying the entire am62axx SoC family, which is supposed to be shared
> by multiple platforms in the AM62A SoC family.



In meta-ti-bsp, am62axx-evm (which represents SK-AM62A-LP) is the only
machine which utilizes AM62A SoC.

& for customer platforms...as mentioned above, ideally they shouldn't be 
affected
as GP parts weren't shipped to them

For reference, we can checkout prebuilt-images folder of phyCORE-AM62A [0]

[0] : 
https://download.phytec.de/Software/Linux/BSP-Yocto-AM62Ax/BSP-Yocto-Ampliphy-AM62Ax-PD24.1.2/images/ampliphy/phyboard-lyra-am62axx-2/


--
Chirag



>
>
>> Hence, don't include it under IMAGE_BOOT_FILES to ensure
>> tiboot3-am62ax-gp-evm.bin is not packaged inside /boot
>> partition of wic image
>>
>> Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
>> ---
>>   meta-ti-bsp/conf/machine/include/am62axx.inc | 3 ---
>>   1 file changed, 3 deletions(-)
>>
>> diff --git a/meta-ti-bsp/conf/machine/include/am62axx.inc b/meta-ti-bsp/conf/machine/include/am62axx.inc
>> index 98cea203..e5f827a9 100644
>> --- a/meta-ti-bsp/conf/machine/include/am62axx.inc
>> +++ b/meta-ti-bsp/conf/machine/include/am62axx.inc
>> @@ -10,9 +10,6 @@ TFA_K3_SYSTEM_SUSPEND = "1"
>>   # Default tiboot3.bin on AM62A is for HS-FS
>>   IMAGE_BOOT_FILES += "tiboot3-am62ax-hs-fs-evm.bin"
>>   
>> -# Since default tiboot3.bin on AM62A is for HS-FS, add a version for GP
>> -IMAGE_BOOT_FILES += "tiboot3-am62ax-gp-evm.bin"
>> -
>>   # Since default tiboot3.bin on AM62A is for HS-FS, add a version for HS-SE
>>   IMAGE_BOOT_FILES += "tiboot3-am62ax-hs-evm.bin"
>>   
>> -- 
>> 2.34.1

