Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB919C54E4A
	for <webhook@archiver.kernel.org>; Thu,  7 Mar 2024 19:06:21 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.1883.1709838381367901371
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 07 Mar 2024 11:06:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=sZqqZHbk;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 427J6Jwe111807;
	Thu, 7 Mar 2024 13:06:19 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1709838379;
	bh=IDx6bCSnjSiWqfZbzWBIlivFKVcckI2+vA8AZYRwZI4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=sZqqZHbkgds9+2729OrPqBx4/rXG0NJ9jndJ6H0S4O8gOj4nwpck9QmKevutMfE47
	 IuZNcARHpXgudWLTOJz/nsc06fEB4Xpti7GFwMR69TfrlWyHDh6a+Qa4qx82d6o2nf
	 85R+dHhV07/rqlDUwxrTshAdfiWtf7XE/7Z1rNpY=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 427J6JXu026004
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 7 Mar 2024 13:06:19 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 7
 Mar 2024 13:06:19 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 7 Mar 2024 13:06:19 -0600
Received: from [10.249.34.17] ([10.249.34.17])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 427J6IQI063286;
	Thu, 7 Mar 2024 13:06:19 -0600
Message-ID: <65c48880-fbcc-4dc8-94ef-61266799a4b9@ti.com>
Date: Thu, 7 Mar 2024 13:06:18 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master][PATCH] ti-img-rogue-driver: bump version to
 align with dt
Content-Language: en-US
To: <rs@ti.com>, <denys@konsulko.com>, <detheridge@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
References: <17BA4E96805D5D0C.10210@lists.yoctoproject.org>
 <CZN26Z34WVP3.26UHLMEIIS7G6@ti.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <CZN26Z34WVP3.26UHLMEIIS7G6@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 07 Mar 2024 19:06:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17502



On 3/6/2024 5:34 PM, Randolph Sapp via lists.yoctoproject.org wrote:
> On Wed Mar 6, 2024 at 4:50 PM CST, Randolph Sapp via lists.yoctoproject.org wrote:
>> From: Randolph Sapp <rs@ti.com>
>>
>> Bump the package version to align with the changed AM62 GPU device tree
>> compatible string. This will make it easer to switch back and forth

Spelling error.  easer -> easier


>> between the proprietary and open source driver.
>>
>> Signed-off-by: Randolph Sapp <rs@ti.com>
>> ---
>>   .../powervr-drivers/ti-img-rogue-driver_23.3.6512818.bb         | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.3.6512818.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.3.6512818.bb
>> index 02ec9fe9..7f3cd27c 100644
>> --- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.3.6512818.bb
>> +++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.3.6512818.bb
>> @@ -22,7 +22,7 @@ SRC_URI = "git://git.ti.com/git/graphics/ti-img-rogue-driver.git;protocol=https;
>>   
>>   S = "${WORKDIR}/git"
>>   
>> -SRCREV = "2f409b4dd2540e896b54bff02219d4fc51129b81"
>> +SRCREV = "ee3fc7b2caaa1fc22bafd26c025bf0d824f6c5b8"
>>   
>>   TARGET_PRODUCT:j721e = "j721e_linux"
>>   TARGET_PRODUCT:j721s2 = "j721s2_linux"
> 
> I guess it's worth noting that this will break interoperability with kernel 6.1
> on master...

Well. That's not good then.  We aren't going to 6.6 until later.  Should 
we bump the recipe version and add that new version to the LTS prep 
brand?  Then later we can drop the current version in favor of this new one?


> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#17501): https://lists.yoctoproject.org/g/meta-ti/message/17501
> Mute This Topic: https://lists.yoctoproject.org/mt/104777040/6551054
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [reatmon@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

