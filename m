Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76B32C25B76
	for <webhook@archiver.kernel.org>; Wed,  5 Jun 2024 16:49:48 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.20850.1717606184230338557
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 05 Jun 2024 09:49:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=WUWBSns0;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 455GnaGv066308;
	Wed, 5 Jun 2024 11:49:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1717606176;
	bh=uH2K0Cdpd+6GySC7azXunSuhxsSXY7wVxOSgGO0B5NI=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=WUWBSns0VYsKDvSyaPIvEDgwJIpFq4kjQKnKSc+OLDs2uD24Mg5lhFLgskm70Dkke
	 C0s7lE6EnJ5OhPNVKYLk8Ym06BWKfJuNE6JZtpQ2fzedvDqLlDRn/wsjxL0DlgV4C7
	 dhvX6eIh2e2qVKy4pR56+oIvbBP2OWTI1LC1vXqM=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 455GnaEN019740
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 5 Jun 2024 11:49:36 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 5
 Jun 2024 11:49:36 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 5 Jun 2024 11:49:36 -0500
Received: from [10.250.32.138] ([10.250.32.138])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 455Gnah5059060;
	Wed, 5 Jun 2024 11:49:36 -0500
Message-ID: <f0af262b-7ffd-4555-9935-b578cadc052f@ti.com>
Date: Wed, 5 Jun 2024 11:49:36 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master/scarthgap][PATCH] gitignore: lift some sane
 defaults from others
To: Randolph Sapp <rs@ti.com>, Denys Dmytriyenko <denis@denix.org>
CC: <meta-ti@lists.yoctoproject.org>
References: <20240603195515.1089534-1-rs@ti.com>
 <20240604191231.GP21287@denix.org>
 <69324605-d0ab-40e1-bbe0-b13ce8712ade@ti.com>
 <D1S7OGYL8GE4.2LX587YKETRP4@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <D1S7OGYL8GE4.2LX587YKETRP4@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 05 Jun 2024 16:49:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17698



On 6/5/2024 11:07 AM, Randolph Sapp wrote:
> On Tue Jun 4, 2024 at 5:15 PM CDT, Ryan Eatmon wrote:
>>
>>
>> On 6/4/2024 2:12 PM, Denys Dmytriyenko wrote:
>>> On Mon, Jun 03, 2024 at 02:55:15PM -0500, rs@ti.com wrote:
>>>> From: Randolph Sapp <rs@ti.com>
>>>>
>>>> Lift the common parts of the top level gitignore from oe-core and
>>>> meta-openembedded. This masks out temporary python files, intermediate
>>>> artifacts, and patches at the root of the project.
>>>
>>> FWIW, this is a matter of a personal preference, e.g. I don't like when
>>> git ignores, essentially hiding patches in the top directory. I do prefer
>>> them to be visible with "git status". But I'll leave it to Ryan.
>>
>> Yeah.  I was testing it, but I was also thinking the same thing and
>> trying to decide if I wanted to take them.  Maybe a reduced set might
>> good.  Like leave the patches, but hide the temp files and what not?
>> What are your thoughts on that?  Just remove the *.patch from the list
>> below?
> 
> Up to you guys. I just noticed the different behavior in this layer and wanted
> to get us more in sync with core.

I say remove the patches and submit a v2.


>>>> Signed-off-by: Randolph Sapp <rs@ti.com>
>>>> ---
>>>>    .gitignore | 7 +++++++
>>>>    1 file changed, 7 insertions(+)
>>>>    create mode 100644 .gitignore
>>>>
>>>> diff --git a/.gitignore b/.gitignore
>>>> new file mode 100644
>>>> index 00000000..c01df45e
>>>> --- /dev/null
>>>> +++ b/.gitignore
>>>> @@ -0,0 +1,7 @@
>>>> +*.pyc
>>>> +*.pyo
>>>> +/*.patch
>>>> +*.swp
>>>> +*.orig
>>>> +*.rej
>>>> +*~
>>>> -- 
>>>> 2.45.1
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

