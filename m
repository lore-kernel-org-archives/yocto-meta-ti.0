Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7AACC83F27
	for <webhook@archiver.kernel.org>; Wed, 16 Jul 2025 14:43:06 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.23895.1752676979306326672
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 16 Jul 2025 07:42:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=neXXev7Z;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: reatmon@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56GEgsga272364;
	Wed, 16 Jul 2025 09:42:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1752676974;
	bh=tZZd/8ujv8DHVe10h4qtV2TrvkqjddQflN9jGIRffnc=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=neXXev7ZUura0eVs7vbxKwVz/T4xnui3qZbAovk9pidphFsGDwPRjeucJzxbgv0lm
	 zpaXmeX5hoUQ3nffBjLeL4P/0cDbNHkpLQHUVTzSS1UxUljHlCGCUbXdd5ALWTdRqR
	 dnCsRAGyAcdqzINBotropqb/qfxRKoGk369WqWlU=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56GEgsHk2112176
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 16 Jul 2025 09:42:54 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 16
 Jul 2025 09:42:54 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 16 Jul 2025 09:42:54 -0500
Received: from [128.247.81.69] (dtmxl9433pnr.dhcp.ti.com [128.247.81.69])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56GEgsqY641218;
	Wed, 16 Jul 2025 09:42:54 -0500
Message-ID: <52f88c5a-708b-42bb-a6a4-feac28e4d846@ti.com>
Date: Wed, 16 Jul 2025 09:42:54 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master][PATCH] ti-kernel-fitimage: Add ti-secdev
To: Denys Dmytriyenko <denis@denix.org>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>, <afd@ti.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20250715175445.28647-1-reatmon@ti.com>
 <20250715181122.GF24899@denix.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20250715181122.GF24899@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 16 Jul 2025 14:43:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18791



On 7/15/2025 1:11 PM, Denys Dmytriyenko wrote:
> On Tue, Jul 15, 2025 at 12:54:45PM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
>> In order to turn the fitImage signing back on, we need to inherit the
>> ti-secdev class to setup all of the needed signing variables.
> 
> + Andrew
> 
> I don't believe we need ti-secdev in the main kernel recipe any more now that
> fitImage got split out into its own recipe...
> 
> So this patch should rather be "move" ti-secdev instead of "add"?

Good point.  I'll send a v2.


> 
>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>> ---
>>   meta-ti-bsp/recipes-kernel/linux/ti-kernel-fitimage.bb | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/meta-ti-bsp/recipes-kernel/linux/ti-kernel-fitimage.bb b/meta-ti-bsp/recipes-kernel/linux/ti-kernel-fitimage.bb
>> index dae76387..a5e6a280 100644
>> --- a/meta-ti-bsp/recipes-kernel/linux/ti-kernel-fitimage.bb
>> +++ b/meta-ti-bsp/recipes-kernel/linux/ti-kernel-fitimage.bb
>> @@ -3,6 +3,8 @@ FIT_CONF_PREFIX ?= "conf-ti_"
>>   
>>   require recipes-kernel/linux/linux-yocto-fitimage.bb
>>   
>> +inherit ti-secdev
>> +
>>   include ${@ 'recipes-kernel/linux/ti-kernel-devicetree-prefix.inc' if d.getVar('KERNEL_DEVICETREE_PREFIX') else ''}
>>   
>>   do_compile[depends] += "virtual/kernel:do_shared_workdir"
>> -- 
>> 2.17.1

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

