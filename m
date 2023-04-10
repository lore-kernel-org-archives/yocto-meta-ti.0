Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52A59C76196
	for <webhook@archiver.kernel.org>; Mon, 10 Apr 2023 14:16:40 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.45285.1681136193845211602
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 10 Apr 2023 07:16:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=qK2GYLsc;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33AEGSBG003735;
	Mon, 10 Apr 2023 09:16:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1681136188;
	bh=eTmsY19IqJdYk//DbGr3gV6/4/W9nDEb27RoEJG7Q3c=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=qK2GYLsc+hE1JXukgCVR4wF790yYWMNnk45hfRiGtAi8/14NRbFYqkGr6dS/OMkz+
	 BRxMHFWrIL9n1Ii9NzADW/QqwiokdIYPUiGEfqyMZE6W2LcyJJNHOrOlfMotGzocVS
	 MWWVPbaMd9MWFR4rSX9/kGHRNk9/DRgKkCUKWtn4=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33AEGSU0085177
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 10 Apr 2023 09:16:28 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Mon, 10
 Apr 2023 09:16:27 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Mon, 10 Apr 2023 09:16:27 -0500
Received: from [10.250.33.184] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33AEGRH0041816;
	Mon, 10 Apr 2023 09:16:27 -0500
Message-ID: <d7ff8d60-748c-1657-509e-3a19947c00cb@ti.com>
Date: Mon, 10 Apr 2023 09:16:27 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [EXTERNAL] Re: [meta-ti][master/kirkstone][PATCH 5/5]
 meta-ti-bsp: graphics: Correct dependency chain
To: Randolph Sapp <rs@ti.com>, Denys Dmytriyenko <denis@denix.org>
CC: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20230406192847.7934-1-afd@ti.com>
 <20230406192847.7934-5-afd@ti.com> <20230406194653.GN9226@denix.org>
 <be1d8c94-1b46-5b26-399d-e0baa054e824@ti.com>
 <20230406212558.GO9226@denix.org>
 <87c83179-6894-8950-e519-71936c7b6935@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <87c83179-6894-8950-e519-71936c7b6935@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 10 Apr 2023 14:16:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16336

On 4/6/23 4:30 PM, Randolph Sapp wrote:
> On 4/6/23 16:25, Denys Dmytriyenko wrote:
>> On Thu, Apr 06, 2023 at 03:58:41PM -0500, Andrew Davis via lists.yoctoproject.org wrote:
>>> On 4/6/23 2:46 PM, Denys Dmytriyenko wrote:
>>>> On Thu, Apr 06, 2023 at 02:28:47PM -0500, Andrew Davis via lists.yoctoproject.org wrote:
>>>>> Previously the virtual/gpudriver provider would point to the kernel-mode
>>>>> driver, which would cause Mesa libraries to depend on those and not the
>>>>> user-mode driver. It is the user-mode driver that should depend on the
>>>>> kernel-mode driver, not the other way around. The logical dependency
>>>>> chain should be:
>>>>
>>>> No, umlibs already has lots of virtual providers to choose from - virtual/egl,
>>>> virtual/gles and even virtual/mesa. And virtual/gpudriver was specifically
>>>> added to point to a kernel-mode driver - rogue-driver or sgx-km.
>>>>
>>>
>>> But none of these virtual providers actually point to the umlibs anymore,
>>> those all point to Mesa.
>>
>> Ah, right...
>>
>>
>>>> So, flipping the dependency chain is probably the correct change, but changing
>>>> what virtual/gpudriver means seems wrong.
>>>>
>>>
>>> Not sure what the issue is with changing what this virtual provider means.
>>> It is our creation that no one else uses, it exists today only as a flag to
>>> tell our Mesa bbappend which backend to choose.
>>
>> It seems confusing - the kernel-mode for Rogue has the word "driver" in it.
>> If it's not being used anywhere else any longer, and it should point to
>> user-mode part now, why not also rename it to, let's say, virtual/gpulibs?
>>

For GPU drivers, they are always two part drivers, so both mode drivers are
"drivers". In SGX we use "UM/KM" instead of "umlib/driver", we could always
rename the Rogue recipes if it's more clear. Since both are parts of the
"gpudriver" I still don't see an issue with pointing to either with that
label.

If a rename like "virtual/umlibs" makes it easier then I also have no
issue doing that.

>> How does Imagination Tech call this proprietary piece?
>>
> They just refer to the whole bag of software as the DDK. No specific terminology for the components. Even if there was it, wouldn't apply here, unfortunately, as this is specifically our packaged version. But no, they don't even give us a hint to create a naming convention here.

In the DDK they just call the UM side without a postfix, and the KM
side with "_km". So maybe "driver" and "driver_km", but as you say
it doesn't much matter here.

Andrew

