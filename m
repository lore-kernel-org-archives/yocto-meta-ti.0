Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32CE8C7EE31
	for <webhook@archiver.kernel.org>; Thu, 26 Jun 2025 18:43:11 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.3260.1750963388050143402
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 26 Jun 2025 11:43:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=hpqFP52M;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: reatmon@ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55QIh7Me2217840
	for <meta-ti@lists.yoctoproject.org>; Thu, 26 Jun 2025 13:43:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750963387;
	bh=TpLYBYAMsMl8KFCpxF9k39lCzMGe8RbFJ95g0e/1hCQ=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=hpqFP52MuPgp/pjNyS9J67G1bJ2ul721w9yliXW7RNcR5l06SftN8qcy0DUSJkXaZ
	 cLo3XGbz+OqngT8HTM2v8eJFf5t0rl3Xxzpw8yAb44UZL3VTHkxAkyMsZun36kpzl9
	 cUUmjrR68npEzS+pLJfuR08pBTGZ6aII4bvzBWdg=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55QIh7W32233657
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 26 Jun 2025 13:43:07 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 26
 Jun 2025 13:43:06 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 26 Jun 2025 13:43:06 -0500
Received: from [10.249.37.202] ([10.249.37.202])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55QIh6ZR1748427;
	Thu, 26 Jun 2025 13:43:06 -0500
Message-ID: <9a38bb9d-85ca-4433-9a57-09fadedc9a80@ti.com>
Date: Thu, 26 Jun 2025 13:43:06 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][scarthgap/master][PATCH] Revert "conf: machine: k3:
 disable all fit signing for uboot"
To: Suman Anna <s-anna@ti.com>, <m-chawdhry@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Aniket Limaye <a-limaye@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Kamlesh Gurudasani <kamlesh@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>, Udit Kumar <u-kumar1@ti.com>,
        Bryan Brattlof <bb@ti.com>
References: <20250626105933.564282-1-m-chawdhry@ti.com>
 <19eebdc9-dbb3-5c94-0f4c-65123cec35ef@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <19eebdc9-dbb3-5c94-0f4c-65123cec35ef@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 26 Jun 2025 18:43:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18694



On 6/26/2025 12:11 PM, Suman Anna wrote:
> Hi Manorit,
> 
> On 6/26/25 05:59, Manorit Chawdhry via lists.yoctoproject.org wrote:
>> The following revert requires a patch in U-boot as well which has been
>> posted upstream [0] and backported internally too.
>>
>> This reverts commit 9656b79cb557a46d2611b67e7e51702f6da05594.
>>
> 
> Please add detail on what this patch is fixing and why we are reverting this
> commit. The current description gives zero information on why we are doing this.


To add more... am65 is now failing again with this patch reverted.  So, 
NAK on taking this revert.  Someone needs to actually fix the am65 issue 
that made us disable this in the first place.



> regards
> Suman
> 
> 
>> [0]: https://lore.kernel.org/all/20250626-b4-upstream-fix-icssg-fit-v1-1-95eff1c853a4@ti.com/
>>
>> Signed-off-by: Manorit Chawdhry <m-chawdhry@ti.com>
>> ---
>>   meta-ti-bsp/conf/machine/include/k3.inc | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/meta-ti-bsp/conf/machine/include/k3.inc b/meta-ti-bsp/conf/machine/include/k3.inc
>> index 9b85f867c206..14d7db8a1184 100644
>> --- a/meta-ti-bsp/conf/machine/include/k3.inc
>> +++ b/meta-ti-bsp/conf/machine/include/k3.inc
>> @@ -25,6 +25,10 @@ SPL_BINARY = "tispl.bin"
>>   SPL_BINARYNAME = "tispl.bin"
>>   UBOOT_SUFFIX = "img"
>>   
>> +UBOOT_SIGN_ENABLE = "1"
>> +UBOOT_MKIMAGE_DTCOPTS = "-I dts -O dtb"
>> +UBOOT_SIGN_KEYNAME ?= "custMpk"
>> +UBOOT_SIGN_KEYDIR ?= "${TI_SECURE_DEV_PKG}/keys"
>>   FIT_HASH_ALG ?= "sha512"
>>   FIT_SIGN_ALG ?= "rsa4096"
>>   
>>
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#18692): https://lists.yoctoproject.org/g/meta-ti/message/18692
>> Mute This Topic: https://lists.yoctoproject.org/mt/113841171/4594561
>> Group Owner: meta-ti+owner@lists.yoctoproject.org
>> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [s-anna@ti.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

