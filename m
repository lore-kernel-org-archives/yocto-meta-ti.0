Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 754F0C4321E
	for <webhook@archiver.kernel.org>; Mon,  5 Dec 2022 14:23:25 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.16430.1670250195724423758
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 05 Dec 2022 06:23:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=HjRbGhnl;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2B5ENAZw116550;
	Mon, 5 Dec 2022 08:23:10 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1670250190;
	bh=TTIF/VCED9wsbNK+a5iIHHOmIyjkqBm/HrP3XXuXL30=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=HjRbGhnlmozzwu7y9+SWxFn1dX5/UySeieeXZFN8P4UCiHUD+EqvkkimZLMGzJYSg
	 YwooD7PKu/ijccn6nVE8wWADYiE/Psa9tVttxZ5IWWtra3X+Ax9Q6JkVX7ZeO+8A2s
	 oxrorUIJB7wTt5kWD1j430w8jQq8EK8aFrstR6RM=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2B5ENASs050515
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 5 Dec 2022 08:23:10 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Mon, 5
 Dec 2022 08:23:10 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Mon, 5 Dec 2022 08:23:09 -0600
Received: from [10.249.38.163] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2B5EN9p4005075;
	Mon, 5 Dec 2022 08:23:09 -0600
Message-ID: <02829bd2-ce97-ad10-98de-18e2d6f9c0b5@ti.com>
Date: Mon, 5 Dec 2022 08:23:09 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [meta-ti][dunfell][PATCH] optee: update optee-client, optee-test,
 optee-examples to 3.19 tag
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>
CC: Manorit Chawdhry <m-chawdhry@ti.com>, <meta-ti@lists.yoctoproject.org>,
        Andrew Davis <afd@ti.com>, Jayesh Choudhary <j-choudhary@ti.com>,
        Praneeth
 Bajjuri <praneeth@ti.com>
References: <20221202100452.1868797-1-m-chawdhry@ti.com>
 <b1812e45-6c73-4a2a-16a1-704393f35e3a@ti.com>
 <20221203154808.GV22689@denix.org>
 <811707e3-c815-000d-75a9-49fd4d4242e7@ti.com>
 <20221204225634.GX22689@denix.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20221204225634.GX22689@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 05 Dec 2022 14:23:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15407



On 12/4/2022 16:56, Denys Dmytriyenko wrote:
> On Sat, Dec 03, 2022 at 11:04:00AM -0600, Ryan Eatmon wrote:
>>
>>
>> On 12/3/2022 9:48, Denys Dmytriyenko wrote:
>>> On Fri, Dec 02, 2022 at 08:04:52PM -0600, Ryan Eatmon via lists.yoctoproject.org wrote:
>>>>
>>>>
>>>> On 12/2/2022 4:04, Manorit Chawdhry wrote:
>>>>> optee-os was updated to 3.19 tag but the others were still outdated.
>>>>>
>>>>> Updates other optee components to 3.19 tag
>>>>>
>>>>> Signed-off-by: Manorit Chawdhry <m-chawdhry@ti.com>
>>>>> ---
>>>>>   recipes-security/optee/optee-client_%.bbappend   | 4 ++--
>>>>>   recipes-security/optee/optee-examples_%.bbappend | 4 ++--
>>>>>   recipes-security/optee/optee-test_%.bbappend     | 4 ++--
>>>>>   3 files changed, 6 insertions(+), 6 deletions(-)
>>>>>
>>>>> diff --git a/recipes-security/optee/optee-client_%.bbappend b/recipes-security/optee/optee-client_%.bbappend
>>>>> index 5675570a..6737ba92 100644
>>>>> --- a/recipes-security/optee/optee-client_%.bbappend
>>>>> +++ b/recipes-security/optee/optee-client_%.bbappend
>>>>> @@ -1,2 +1,2 @@
>>>>> -PV_ti-soc = "3.17.0+git${SRCPV}"
>>>>> -SRCREV_ti-soc = "a5c30b1277466a9bf85b62f45a6b00e79774e29c"
>>>>> +PV_ti-soc = "3.19.0+git${SRCPV}"
>>>>> +SRCREV_ti-soc = "140bf463046071d3ca5ebbde3fb21ee0854e1951"
>>>>
>>>> optee-client will not build against this SRCREV.  They added a call
>>>> to pkg-config which is not readily available to the recipe without a
>>>> change to your patch.
>>>>
>>>> You need to add:
>>>>
>>>> DEPENDS += "pkgconfig"
>>>
>>> You probably don't want a target pkgconfig, but a native one.
>>> Do this instead:
>>>
>>> inherit pkgconfig
>>
>> Actually, I thought that at first too and tried all variations of
>> the native (inherit, depends, hosttools, etc...).  The only thing
>> that actually made it work was the above.
>>
>> In this case, pkg-config is not being called from configure, but
>> from the Makefile.  The Makefile is trying to make sure that libuuid
>> is installed for the target.  And the native would only make sure it
>> is installed on the native side, where as pkgconfig for target looks
>> in all of the places for the target library.  At least that was my
>> understanding in reading online docs about it.
>>
>> But depending on pkgconfig (for target) actually fixed the compile
>> issue.  If you want to verify that or disprove it I would be most
>> appreciative.  I spent a few hours banging my head on this one.
> 
> Looks like you've done your research - it's a bit strange use of pkgconfig
> by optee-client, not a basic normal use case I was referring to.
> 
> If the Makefile is trying to check if libuuid is installed, don't you need to
> also have it the DEPENDS?
> 
> And we'll see how meta-arm/master handles it soon enough, when updating to
> 3.19 upstream...
> 

I was thinking about the libuuid dependency over the weekend.

And I agree, I can't wait to see how upstream meta-arm handles this. 
Luckily this is just a "temporary" patch to get it working for us since 
our preference is to get upstream to handle things like this and not 
carry patches like this in the long term in meta-ti.



-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

