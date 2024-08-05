Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9ADC8C3DA7F
	for <webhook@archiver.kernel.org>; Mon,  5 Aug 2024 14:03:57 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.8729.1722866631237494840
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 05 Aug 2024 07:03:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=iszRtr9Q;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 475E3lN8052359;
	Mon, 5 Aug 2024 09:03:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1722866627;
	bh=sqhN7zu8NFShk0iXtsnTfzuhIIfOhGSby3DVI1KXXgI=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=iszRtr9Qd0UcXWserQdEicTOmDujEoqrT53ZWDaK5Ff+N7q8zhfaBJI7+C8/EsEMf
	 2IyTwSeDLgCQVrfkOTx09ZHbV9ZklRikR2C0296E7UHl7J94wAZF5siWJgw2+FZCFn
	 dTmUvXRigBeWLJF1uBXoTx04uJ4EE3sHq6m8Hdn4=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 475E3lJ7069757
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 5 Aug 2024 09:03:47 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 5
 Aug 2024 09:03:46 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 5 Aug 2024 09:03:46 -0500
Received: from [10.249.36.103] ([10.249.36.103])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 475E3kPa038936;
	Mon, 5 Aug 2024 09:03:46 -0500
Message-ID: <6e08631f-e410-4def-9b25-7659798e62cb@ti.com>
Date: Mon, 5 Aug 2024 09:03:46 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master/scarthgap][PATCH] conf: machine: omapl138-lcdk:
 Update KERNEL_DEVICETREE
To: Denys Dmytriyenko <denis@denix.org>
CC: Praneeth Bajjuri <praneeth@ti.com>, <meta-ti@lists.yoctoproject.org>
References: <20240804221509.3434-1-reatmon@ti.com>
 <20240805031152.GV17572@denix.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20240805031152.GV17572@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 05 Aug 2024 14:03:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17925



On 8/4/2024 10:11 PM, Denys Dmytriyenko wrote:
> On Sun, Aug 04, 2024 at 05:15:09PM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
>> Update the entry for KERNEL_DEVICETREE to match what is in the 6.10
>> kernel.
> 
> Will this change work with 6.6 (or even 6.1)?

This is only changing the KERNEL_DEVICETREE which is meant to track 
mainline.  And mainline a while back moved the DTBs into ti/davinci. 
The KERNEL_DEVICETREE_PREFIX already had this change, so the builds were 
working.  As for if this platform boots under the change... that I 
cannot tell you.  But it builds now.

> 
>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>> ---
>>   meta-ti-bsp/conf/machine/omapl138-lcdk.conf | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta-ti-bsp/conf/machine/omapl138-lcdk.conf b/meta-ti-bsp/conf/machine/omapl138-lcdk.conf
>> index fdbaffae..458caaff 100644
>> --- a/meta-ti-bsp/conf/machine/omapl138-lcdk.conf
>> +++ b/meta-ti-bsp/conf/machine/omapl138-lcdk.conf
>> @@ -21,6 +21,6 @@ KERNEL_DEVICETREE_PREFIX = " \
>>   "
>>   
>>   KERNEL_DEVICETREE = " \
>> -    da850-evm.dtb \
>> -    da850-lcdk.dtb \
>> +    ti/davinci/da850-evm.dtb \
>> +    ti/davinci/da850-lcdk.dtb \
>>   "
>> -- 
>> 2.17.1

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

