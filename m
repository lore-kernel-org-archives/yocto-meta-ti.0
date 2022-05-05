Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3A3AC433EF
	for <webhook@archiver.kernel.org>; Thu,  5 May 2022 01:30:41 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web09.5721.1651714236911402785
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 04 May 2022 18:30:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=murHytOh;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2451UXiu051931;
	Wed, 4 May 2022 20:30:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1651714233;
	bh=jn0txIbK+g2FFG2ntfoJh5NWJwQG9tHNcRzz3Lvae8c=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=murHytOhxbAz+qn0D8ZMTtMUWZpoPhg180wuSl+nRWurolFuMmmYBk1kar0hojHHb
	 WgBWt6FvFlbZd9fxpqvi+a+/jWBMeIyQhsfQkxeeyHrX+QSdDE2NUN8AponUjcxyVY
	 GhPHvebEw3TQeZ22eF+9U52QNxB9gqtD8zk1lJW4=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2451UXwQ129584
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 4 May 2022 20:30:33 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 4
 May 2022 20:30:32 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 4 May 2022 20:30:32 -0500
Received: from [10.250.37.187] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2451UWbl042816;
	Wed, 4 May 2022 20:30:32 -0500
Message-ID: <64f66450-3b51-72a8-7cbc-27f096b2ce94@ti.com>
Date: Wed, 4 May 2022 20:30:32 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [dunfell PATCH v2 2/2] conf/machine: am62xx: Update build flag
 for low power mode
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>, Praneeth Bajjuri <praneeth@ti.com>
CC: Nishanth Menon <nm@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
        Dave
 Gerlach <d-gerlach@ti.com>, <meta-ti@lists.yoctoproject.org>
References: <20220504234930.6508-1-praneeth@ti.com>
 <20220504234930.6508-3-praneeth@ti.com> <20220505003627.GM9834@denix.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20220505003627.GM9834@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 05 May 2022 01:30:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14705



On 5/4/2022 19:36, Denys Dmytriyenko wrote:
> On Wed, May 04, 2022 at 06:49:30PM -0500, Praneeth Bajjuri wrote:
>> From: Nishanth Menon <nm@ti.com>
>>
>> Update build flag for arm-trusted-firmware to include low power mode
>> support
>>
>> K3_PM_SYSTEM_SUSPEND is added in arm-trusted-firmware now which enables
>> low power mode support for am62xx.
>>
>> Signed-off-by: Nishanth Menon <nm@ti.com>
>> Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
>> ---
>>   conf/machine/include/am62xx.inc                              | 2 ++
>>   recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend | 1 +
>>   2 files changed, 3 insertions(+)
>>
>> diff --git a/conf/machine/include/am62xx.inc b/conf/machine/include/am62xx.inc
>> index e8823dd2..ff857b97 100644
>> --- a/conf/machine/include/am62xx.inc
>> +++ b/conf/machine/include/am62xx.inc
>> @@ -6,6 +6,8 @@ MACHINE_FEATURES += "screen touchscreen"
>>   SERIAL_CONSOLES = "115200;ttyS2"
>>   SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
>>   
>> +TFA_K3_SYSTEM_SUSPEND = "1"
>> +
>>   # AM62 supports multi-certificate images, use the same
>>   IMAGE_BOOT_FILES = "${IMAGE_BOOT_FILES_MULTI_CERT}"
>>   
>> diff --git a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
>> index 80b1d664..5264fa97 100644
>> --- a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
>> +++ b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
>> @@ -9,6 +9,7 @@ TFA_INSTALL_TARGET_k3 = "bl31"
>>   TFA_SPD_k3 = "opteed"
>>   
>>   EXTRA_OEMAKE_append_k3 = "${@ 'K3_USART=' + d.getVar('TFA_K3_USART') if d.getVar('TFA_K3_USART') else ''}"
>> +EXTRA_OEMAKE_append_k3 += "${@ 'K3_PM_SYSTEM_SUSPEND=' + d.getVar('TFA_K3_SYSTEM_SUSPEND') if d.getVar('TFA_K3_SYSTEM_SUSPEND') else ''}"
> 
> NAK
> 
> Either append or +=, not both!

Sending a v3 for Praneeth.

> 
>>   do_compile_append_am65xx-hs-evm() {
>>   	export TI_SECURE_DEV_PKG=${TI_SECURE_DEV_PKG}
>> -- 
>> 2.17.1
>>
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

