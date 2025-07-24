Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAC1AC83F26
	for <webhook@archiver.kernel.org>; Thu, 24 Jul 2025 22:07:10 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.5985.1753394828911153654
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 24 Jul 2025 15:07:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=XahbCks+;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: reatmon@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56OM74Uo1597089;
	Thu, 24 Jul 2025 17:07:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1753394824;
	bh=LHjbiFL8CODNlfyQaytlFvERAZ083JAwhChr93MzLdk=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=XahbCks+nQy0ZoZEEd461WY6MWvJY4zm/Rn6LvrHS3McSrjVtLsyGWh4Rfte8JSli
	 iBIZdMpKgVA+ZviJHA3YGFAxNSpYjbrDhRLxF/+cybpSKRH4Jre/SVeJ49ULcwk3kA
	 Ha1IyysY6Air9tVusY7EMXukyrgvtEYjjVaBxVWk=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56OM74jp3813122
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 24 Jul 2025 17:07:04 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 24
 Jul 2025 17:07:04 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 24 Jul 2025 17:07:04 -0500
Received: from [10.249.37.202] ([10.249.37.202])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56OM73N5791491;
	Thu, 24 Jul 2025 17:07:03 -0500
Message-ID: <49c6344e-7b34-4c07-ab2c-a187fd1c3b1d@ti.com>
Date: Thu, 24 Jul 2025 17:07:03 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][scarthgap][PATCH 1/3] conf: machine: am64xx: Cleanup
 assignment whitespace
To: Denys Dmytriyenko <denis@denix.org>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20250723211613.16164-1-reatmon@ti.com>
 <20250724215254.GI24899@denix.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20250724215254.GI24899@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 24 Jul 2025 22:07:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18824


Nope.  I meant to send this patch as a combo patch.  For both master and 
scarthgap.  Oops.  Good catch.


On 7/24/2025 4:52 PM, Denys Dmytriyenko wrote:
> Is this change scarthgap specific? I see the change that originally added
> TI_WKS_BOOTLOADER_APPEND to scarthgap is now being forward-ported to master,
> thus this fix appears to also be applicable to master?
> 
> 
> On Wed, Jul 23, 2025 at 04:16:11PM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
>> A recent change in bitbake requires that all variable assignments have
>> whitespace between the variable, the operator and the value.
>>
>> FOO = "1"
>>
>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>> ---
>>   meta-ti-bsp/conf/machine/include/am64xx.inc | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta-ti-bsp/conf/machine/include/am64xx.inc b/meta-ti-bsp/conf/machine/include/am64xx.inc
>> index 56b56afe..27165547 100644
>> --- a/meta-ti-bsp/conf/machine/include/am64xx.inc
>> +++ b/meta-ti-bsp/conf/machine/include/am64xx.inc
>> @@ -35,4 +35,4 @@ OPTEEMACHINE = "k3-am64x"
>>   
>>   MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "prueth-fw pruhsr-fw prusw-fw"
>>   
>> -TI_WKS_BOOTLOADER_APPEND="console=ttyS2,115200n8"
>> +TI_WKS_BOOTLOADER_APPEND = "console=ttyS2,115200n8"
>> -- 
>> 2.17.1

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

