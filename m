Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3BCEC433FE
	for <webhook@archiver.kernel.org>; Wed,  5 Oct 2022 12:02:54 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web09.22762.1664971367617284984
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 05 Oct 2022 05:02:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=yN5xoPZJ;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 295C2hXh125401;
	Wed, 5 Oct 2022 07:02:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1664971363;
	bh=I54kSGMlCKVje2U14ZMtKVHY0vBRlihAX2BSisaw1wA=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=yN5xoPZJC18egvH+SXBjM2fheVb0ji+SXqrA5Y9ct3nq7Ea4zsmf1L50AeK2SV9qr
	 +UQ5Boh+mOMP5u4RGcu+dcnEm/ZDv4skIxomCJ940CHyX7a7MAqjU8IQJ+rm7tXAK/
	 T5k0OU+LVSaxrKjeQxDnKcQu8lYvLP2hIE0xfJTs=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 295C2hHF121236
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 5 Oct 2022 07:02:43 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Wed, 5 Oct
 2022 07:02:43 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Wed, 5 Oct 2022 07:02:43 -0500
Received: from [10.250.37.187] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 295C2gN6032915;
	Wed, 5 Oct 2022 07:02:42 -0500
Message-ID: <29fb064a-6395-86a9-6d75-a30a17ac704e@ti.com>
Date: Wed, 5 Oct 2022 07:02:42 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [meta-ti] [master/kirkstone][PATCH 61/65] conf: machine: Make
 multi-certificate image the default
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>, Andrew Davis <afd@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
References: <20220913035541.2364351-1-denis@denix.org>
 <20220913035541.2364351-62-denis@denix.org>
 <91d1794f-ed22-7f0f-ad4a-b33ba93500f9@ti.com>
 <20221004194238.GZ18429@denix.org>
 <56965ade-a93e-edf8-a40d-77d104c88221@ti.com>
 <20221004194909.GA18429@denix.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20221004194909.GA18429@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 05 Oct 2022 12:02:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15109



On 10/4/2022 14:49, Denys Dmytriyenko wrote:
> On Tue, Oct 04, 2022 at 02:46:24PM -0500, Andrew Davis wrote:
>> On 10/4/22 2:42 PM, Denys Dmytriyenko wrote:
>>> On Tue, Oct 04, 2022 at 02:38:11PM -0500, Andrew Davis wrote:
>>>> On 9/12/22 10:55 PM, Denys Dmytriyenko wrote:
>>>>> From: Andrew Davis <afd@ti.com>
>>>>>
>>>>> Only the first two K3 devices do not support multi-cert boot so
>>>>> lets make multi-cert the default and only add back sysfw.itb
>>>>> for these two devices.
>>>>>
>>>>> Signed-off-by: Andrew Davis <afd@ti.com>
>>>>> Reviewed-by: lines be preserved?
>>>>
>>>> By who?..
>>>
>>> That's how the original patch got merged :)
>>>
>>> https://git.yoctoproject.org/meta-ti/commit/?h=dunfell&id=038148a6d018c971e15a89c80192179fc04cf170
>>>
>>> I'm guessing patchwork picked up part of our discussion.
>>>
>>> https://patchwork.yoctoproject.org/project/ti/patch/20220801214007.25463-1-afd@ti.com/
>>>
>>
>> Ah, yup there it is :)
>>
>> Also looks like this forward port dropped the removal of some lines in
>> j7.inc,
> 
> There's batch #2 with remaining dunfell commits pending.
> 
> 
>> but at this point I'll just clean that up after, this has been
>> in -next long enough and should just go in already..
> 
> Ryan?

Going in today.


> 
>> Andrew
>>
>>>
>>>>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>>>>> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
>>>>>
>>>>>
>>>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>>> Links: You receive all messages sent to this group.
>>>>> View/Reply Online (#15108): https://lists.yoctoproject.org/g/meta-ti/message/15108
>>>>> Mute This Topic: https://lists.yoctoproject.org/mt/93648962/6551054
>>>>> Group Owner: meta-ti+owner@lists.yoctoproject.org
>>>>> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [reatmon@ti.com]
>>>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>>>

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

