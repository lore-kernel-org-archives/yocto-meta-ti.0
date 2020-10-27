Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web12.8399.1603766754744792484
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 26 Oct 2020 19:45:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=m/YLFUS7;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: s-anna@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09R2jr2J096838;
	Mon, 26 Oct 2020 21:45:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1603766753;
	bh=RUSvtvpN7FKvZLdEawUjWTpS7asr74xnve1s0HBBQc4=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=m/YLFUS7wmJmZA3aPPdvvJoaiUiWWCiJth90tJxPn3ehkUQ16EIvnu6T3f7Qg7dbM
	 8qs8p6rQzlliLHQKdY9hHWHG7k5RCIBjESnJ07zujXWswvBqcTUdZvn4dFldp4GAyq
	 /ysV/Tq4o0xTOGopkGd3pWftz7q9M9hV16kCzdLk=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09R2jrTT082711
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 26 Oct 2020 21:45:53 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 26
 Oct 2020 21:45:53 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 26 Oct 2020 21:45:53 -0500
Received: from [10.250.64.251] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09R2jrGI067647;
	Mon, 26 Oct 2020 21:45:53 -0500
Subject: Re: [meta-ti] [PATCH 2/2] ti-rpmsg-char: Mark these recipes to be TI SOC specific
To: Khem Raj <raj.khem@gmail.com>
CC: <meta-ti@lists.yoctoproject.org>
References: <20201025065934.3308920-1-raj.khem@gmail.com>
 <20201025065934.3308920-2-raj.khem@gmail.com>
 <03f490f1-ff1a-b3fc-6511-00b8d707eb6e@ti.com>
 <CAMKF1so1wH-hQQQ1L3E6dAFLEAxdXkbDjpd9xRzt3tjjdDqPrg@mail.gmail.com>
From: "Suman Anna" <s-anna@ti.com>
Message-ID: <d4dc4e73-f643-3dea-7d49-c696d8091f3f@ti.com>
Date: Mon, 26 Oct 2020 21:45:53 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1so1wH-hQQQ1L3E6dAFLEAxdXkbDjpd9xRzt3tjjdDqPrg@mail.gmail.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 10/26/20 9:30 PM, Khem Raj wrote:
> On Mon, Oct 26, 2020 at 7:19 PM Suman Anna <s-anna@ti.com> wrote:
>>
>> Hi Raj,
>>
>> On 10/25/20 1:59 AM, Khem Raj wrote:
>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>> ---
>>>  recipes-ti/ipc/ti-rpmsg-char.inc | 3 +++
>>>  1 file changed, 3 insertions(+)
>>>
>>> diff --git a/recipes-ti/ipc/ti-rpmsg-char.inc b/recipes-ti/ipc/ti-rpmsg-char.inc
>>> index b41e68eb..d08031cb 100644
>>> --- a/recipes-ti/ipc/ti-rpmsg-char.inc
>>> +++ b/recipes-ti/ipc/ti-rpmsg-char.inc
>>> @@ -13,3 +13,6 @@ SRCREV = "9be402c2bf4053900b6b9a8092fbb42e7e303108"
>>>  PV = "0.1.0+git${SRCPV}"
>>>
>>>  S = "${WORKDIR}/git"
>>> +
>>> +COMPATIBLE_HOST ?= "null"
>>> +COMPATIBLE_HOST_ti-soc = "(.*)"
>>>
>>
>> This looks ok, but I am trying to understand why this is needed in general (am
>> still getting familiar with OE). Aren't the recipes processed only on
>> packagegroups that include them?
> 
> on image builds yes. however in yoe distro CI builds we test multi-BSP
> setups and do world builds which catch
> such issues, where BSP layers are exposing general packages which are
> not compatible with other BSPs.

Thanks for the clarification!

regards
Suman

> 
>>
>> regards
>> Suman
>>
>>>
>>>
>>> 
>>>
>>

