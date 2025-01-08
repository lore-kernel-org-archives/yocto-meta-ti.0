Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B7DBE77188
	for <webhook@archiver.kernel.org>; Wed,  8 Jan 2025 19:44:13 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.30104.1736365448708479983
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 08 Jan 2025 11:44:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=QRRtgbLA;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 508Ji5uB3149706
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 8 Jan 2025 13:44:06 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1736365446;
	bh=SMpklnz444/r3GUB/c5QHmnZva/Oo7auNE7r2Qr4A5k=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=QRRtgbLA4XWDH02/Y4h6AE6BZNFJzR1WNQxyao28s9jII7byubzAf76yH1e+/20Dq
	 JlvbpXwH+ZU0i4gakENQYZoZ0XwZY7s4yqudnaSkVHabB35yoaqr/M4YJSFioR5PIi
	 RphDRpx/en5CPRmvzRLQdXrg7uMlRaBDoApP4pcw=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 508Ji5Pc016549
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 8 Jan 2025 13:44:05 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 8
 Jan 2025 13:44:05 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 8 Jan 2025 13:44:05 -0600
Received: from [10.249.33.244] ([10.249.33.244])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 508Ji5mR080234;
	Wed, 8 Jan 2025 13:44:05 -0600
Message-ID: <8d01798d-aea8-45f5-92c8-2f937fd1bcb8@ti.com>
Date: Wed, 8 Jan 2025 13:44:05 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master/scarthgap][PATCH] ti-bsp: Change to 6.12 as the
 default
To: Denys Dmytriyenko <denis@denix.org>
CC: Praneeth Bajjuri <praneeth@ti.com>, <meta-ti@lists.yoctoproject.org>
References: <20250108144108.26409-1-reatmon@ti.com>
 <20250108182409.GA21836@denix.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20250108182409.GA21836@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 08 Jan 2025 19:44:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18168



On 1/8/2025 12:24 PM, Denys Dmytriyenko wrote:
> On Wed, Jan 08, 2025 at 08:41:08AM -0600, Ryan Eatmon via lists.yoctoproject.org wrote:
>> We are moving to 6.12 to be our new LTS, so we are switching the default
>> BSP to that.  You can still access the 6.6 kernel if you need to by using
>> the BSP system and setting TI_PREFERRED_BSP = "ti-6_6" in your
>> local.conf.
> 
> Do you also need to drop DEFAULT_PREFERENCE = "-1" in corresponding recipes?

For 100% correctness, yes.  But with the BSP system, it's just working. 
I'll send a v2.

> 
>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>> ---
>>   meta-ti-bsp/conf/machine/include/ti-bsp.inc | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta-ti-bsp/conf/machine/include/ti-bsp.inc b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
>> index 083177dc..f19a0c9c 100644
>> --- a/meta-ti-bsp/conf/machine/include/ti-bsp.inc
>> +++ b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
>> @@ -4,7 +4,7 @@
>>   # well as a dedicated machine override.
>>   
>>   # Supported options are: mainline, next, ti-6_12, ti-6_6, ti-6_1
>> -TI_PREFERRED_BSP ??= "ti-6_6"
>> +TI_PREFERRED_BSP ??= "ti-6_12"
>>   
>>   # Use bsp-* namespace for overrides
>>   MACHINEOVERRIDES =. "bsp-${TI_PREFERRED_BSP}:"
>> -- 
>> 2.17.1

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

