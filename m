Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14DCACAC598
	for <webhook@archiver.kernel.org>; Wed, 17 Sep 2025 19:15:25 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.32416.1758136516264257454
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 17 Sep 2025 12:15:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Wr8XbMy6;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: afd@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58HJFEXq1583946;
	Wed, 17 Sep 2025 14:15:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758136514;
	bh=T0/yeXdT5jaHK+uPRHWtBx1KOjQdQYT5EySWh7pCpf4=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=Wr8XbMy6btmtyeeqD1KxbAPTjsL1RgBbvb/PiafMKjCqB1etyHCaLmxkIWcEhnREm
	 G2YVclqINnVqwsD7m39/+26HpTPZX7hsGZCKQd9tznk6oDbTVvMvJ/Nq+Jzmc0shog
	 JOzi0I3H2crioOE2L96hfM3566B8C/Y+IYVbMhG8=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58HJFElf2572217
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 17 Sep 2025 14:15:14 -0500
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 17
 Sep 2025 14:15:14 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 17 Sep 2025 14:15:14 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58HJFE7n3849724;
	Wed, 17 Sep 2025 14:15:14 -0500
Message-ID: <1c3e6c5c-1854-4641-b86c-72a9d4025f5a@ti.com>
Date: Wed, 17 Sep 2025 14:15:14 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][scarthgap][RFC 6/6] mesa-pvr: Use mesa-pvr for all TI
 SoCs
To: Randolph Sapp <rs@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
        Ryan
 Eatmon <reatmon@ti.com>, <meta-ti@lists.yoctoproject.org>
References: <20250909151028.272925-1-afd@ti.com>
 <20250909151028.272925-6-afd@ti.com> <DCOKFZNU5ZM9.1PL3UQTDARDKL@ti.com>
 <3bb49aca-f4b6-4205-baec-51f556e5bb0c@ti.com>
 <DCVA9O56NNYP.3LRTIEDU4CVL2@ti.com>
 <0d960b20-a1b2-4592-8bd7-11d229fca1e8@ti.com>
 <DCVBB7QC6QT8.103H9CBS1MEZ6@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <DCVBB7QC6QT8.103H9CBS1MEZ6@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 17 Sep 2025 19:15:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19021

On 9/17/25 2:12 PM, Randolph Sapp wrote:
> On Wed Sep 17, 2025 at 1:40 PM CDT, Andrew Davis wrote:
>> On 9/17/25 1:22 PM, Randolph Sapp wrote:
>>> On Fri Sep 12, 2025 at 11:38 AM CDT, Andrew Davis wrote:
>>>> On 9/9/25 3:52 PM, Randolph Sapp wrote:
>>>>> On Tue Sep 9, 2025 at 10:10 AM CDT, Andrew Davis wrote:
>>>>>> TI SoCs without GPUs can still use mesa-pvr as it will simply fallback to
>>>>>> SW rendering just like the normal mesa package. The benefit is using the
>>>>>> same version across all supported devices is more consistent and only
>>>>>> one version of Mesa is needed for all TI SoCs.
>>>>>>
>>>>>> Signed-off-by: Andrew Davis <afd@ti.com>
>>>>>> ---
>>>>>
>>>>> [snip]
>>>>>
>>>>> Originally this was done to mitigate damage in the event where there is an
>>>>> issue with mesa. I'm not entirely sure we want to move everything over to
>>>>> pvr-mesa as they still hijack some of the common dri code for their own goofy
>>>>> stuff.
>>>>>
>>>>
>>>> Fair point, would be nice if the PVR support didn't touch the core/common DRI
>>>> at all. Having this the common Mesa for all boards would help in identifying
>>>> if they broke anything in the common/sw rendering side though, right now we
>>>> would only find those bugs if one was both using a device with GPU *and* it
>>>> falls back to SW.
>>>>
>>>>> My opinion is we should use vanilla software where we can. Especially
>>>>> considering we'll need to be able to access vanilla mesa for AM62 later if I get
>>>>> my way.
>>>>>
>>>>
>>>> Could you expand on that? Outside of the eventual switch to the upstream
>>>> PVR driver, what would we need vanilla mesa for on AM62?
>>>>
>>>> Andrew
>>>
>>> Ah, not much to expand on really. Upstream driver needs vanilla mesa, and I'd
>>> like to avoid shipping hacked libraries on devices that don't need em.
>>>
>>> - Randolph
>>
>> What is the timeline looking like for that? This series is for scarthgap and
>> I'd guess the upstream driver won't be usable in time for the next LTS either.
>> We can always switch back to vanilla when it can be used on these devices.
>>
>> Andrew
> 
> That's still ignoring my last comment. I don't think this is necessary, and
> bringing up timelines to apply pressure here isn't useful. Merging an
> unnecessary patch now just to remove it later is goofy.
> 
> - Randolph

Oh I wasn't trying to pressure you, in fact this patch was meant to
help you out specifically, if you don't want it then I'll drop it
from v2, no worries :)

Andrew

