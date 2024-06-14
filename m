Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F300DC27C6E
	for <webhook@archiver.kernel.org>; Fri, 14 Jun 2024 19:29:51 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.2658.1718393381481058728
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 14 Jun 2024 12:29:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=GtnJU0M7;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45EJTaAI048392;
	Fri, 14 Jun 2024 14:29:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1718393376;
	bh=5FY1CG86056Qthp5vTg2mozH6meOV2AiMmeuZSFBdwo=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=GtnJU0M7m4CWOJUC294HAczGVLQfTljRWdjtvhCWm0fSDtxeRTwevXW3W9HoKyAqr
	 m38agYA67t5Q4bWtEKnDFcOwj6n1yXXqnBX3oG4GTvD5U09YixhV/0GoODerZupB7Q
	 kJmt/AV5kYeu5H+Dh1CDMrmGaglmqvriom6fUhM0=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45EJTaJL077743
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 14 Jun 2024 14:29:36 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 14
 Jun 2024 14:29:36 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 14 Jun 2024 14:29:36 -0500
Received: from [10.249.34.39] ([10.249.34.39])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45EJTaeF019629;
	Fri, 14 Jun 2024 14:29:36 -0500
Message-ID: <8aa192c5-615f-4a66-b1ad-57c22fd43ee6@ti.com>
Date: Fri, 14 Jun 2024 14:29:36 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] [master/scarthgap][PATCH 1/4] conf/machine, ti-bsp: add
 support for multiple BSP providers
To: Denys Dmytriyenko <denis@denix.org>
CC: <meta-ti@lists.yoctoproject.org>, Denys Dmytriyenko <denys@konsulko.com>
References: <20240613172254.770920-1-denis@denix.org>
 <f74e3a99-3dbc-4a68-b4b8-a5f77f6e149a@ti.com>
 <17D8EC1D0CB8CAB1.25108@lists.yoctoproject.org>
 <20240614185555.GC21287@denix.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20240614185555.GC21287@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 14 Jun 2024 19:29:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17742



On 6/14/2024 1:55 PM, Denys Dmytriyenko wrote:
> On Fri, Jun 14, 2024 at 12:34:23PM -0400, Denys Dmytriyenko wrote:
>> On Thu, Jun 13, 2024 at 04:18:16PM -0500, Ryan Eatmon wrote:
>>>
>>>
>>> On 6/13/2024 12:22 PM, Denys Dmytriyenko wrote:
>>>> From: Denys Dmytriyenko <denys@konsulko.com>
>>>>
>>>> This adds a facility to define multiple supported BSPs with their own
>>>> preferences for individual components, as well as lets machine configs
>>>> specify conditional configurations for different BSPs.
>>>>
>>>> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
>>>
>>>
>>>
>>>> diff --git a/meta-ti-bsp/conf/machine/include/ti-bsp.inc b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
>>>> new file mode 100644
>>>> index 00000000..3bb94a7f
>>>> --- /dev/null
>>>> +++ b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
>>>> @@ -0,0 +1,109 @@
>>>> +# Support multiple BSP providers
>>>> +# The main input is TI_DEFAULT_BSP, which translates into default
>>>> +# preferences for kernel, bootloader and graphics components, as
>>>> +# well as a dedicated machine override.
>>>> +
>>>> +# Supported options are: mainline, ti-6_6, ti-6_1, bb_org
>>>> +TI_DEFAULT_BSP ??= "ti-6_6"
>>>
>>> Should this variable be named TI_DEFAULT_BSP?  That implies that
>>> this is the value of the default for this feature.  But in reality
>>> this variable is what chooses the TI BSP version.  Should it be
>>> something like TI_BSP_VERSION instead?
>>
>> It's not just the version, it's entire BSP stack. E.g. "mainline" vs. "bb_org"
>> Initially I started with only 2 options - "ti" vs. "bb_org", but eventually
>> expanded it to support "mainline" and in case of "ti" also different LTS
>> versions - "ti-6_1" and "ti-6_6"... Hence the original name stayed. And not
>> sure how long both LTS versions will be supported in meta-ti...
>>
>> Anyway, I'm fine changing it to something else, but I thing calling it
>> "version" will be more confusing.
> 
> How about TI_PREFERRED_BSP or something along those lines?

I like that.


-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

