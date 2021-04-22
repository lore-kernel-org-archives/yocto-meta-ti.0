Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web08.1269.1619128622761518622
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 22 Apr 2021 14:57:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=nsui/UcD;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: praneeth@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 13MLv1Ej127960;
	Thu, 22 Apr 2021 16:57:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1619128621;
	bh=S8+EjjdPs4WYCH7npkIUjLAkb8uLhpSB9fdX9O63/fc=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=nsui/UcD0/MfvzMgPCIqIkPWiLbSszsTV7m4drPMG0oxQmivO+csIzZiJIuV6zLr5
	 eAhUMGbmWYdCcThFs9QC7KX3MN9CBoItZKKVP5Sa2fCjgy9LumlhRFggTJq35w13un
	 njvrY+vtsvbVU/WuSjef9VQ4uptH885wsnBy/HUA=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 13MLv1up006435
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 22 Apr 2021 16:57:01 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 22
 Apr 2021 16:57:00 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Thu, 22 Apr 2021 16:57:00 -0500
Received: from [10.247.25.23] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 13MLv0Y0117690;
	Thu, 22 Apr 2021 16:57:00 -0500
Subject: Re: [meta-ti] [dunfell/master PATCH 1/4] cmem: Update to new version 4.20.00.00
To: Suman Anna <s-anna@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, Lokesh Vutla <lokeshvutla@ti.com>,
        Yogesh Siraswar <yogeshs@ti.com>, Nishanth Menon <nm@ti.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20210421205326.22047-1-praneeth@ti.com>
 <20210421205326.22047-2-praneeth@ti.com>
 <1677FB31053272E2.8702@lists.yoctoproject.org>
 <f1472c48-b4c2-ec13-6fd9-a18ae0e60c18@ti.com>
From: "praneeth" <praneeth@ti.com>
Message-ID: <f9bea277-b102-7567-2b46-b3e5e6d658e4@ti.com>
Date: Thu, 22 Apr 2021 16:57:00 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <f1472c48-b4c2-ec13-6fd9-a18ae0e60c18@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 4/22/2021 10:00 AM, Suman Anna wrote:
> Hi Praneeth,
> 
> On 4/21/21 3:59 PM, Suman Anna via lists.yoctoproject.org wrote:
>> On 4/21/21 3:53 PM, praneeth@ti.com wrote:
>>> From: Praneeth Bajjuri <praneeth@ti.com>
>>>
>>> The update brings the fix for 5.10.x linux kernel.
>>> commit 8aba20e20bf7 ("cmemk: Fix build errors for 5.10+ kernels")
>>>
>>> Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
>>
>> Reviewed-by: Suman Anna <s-anna@ti.com>
> 
> Sorry, realized that my patches fixed the issue only for K2 builds originally,
> and I had a bug that fails the builds for non-K2 platforms. I have since fixed
> those, so please update use 4.20.00.01 instead.

Thanks for the note, sent a v2.

> 
> regards
> Suman
> 
>>
>> regards
>> Suman
>>
>>> ---
>>>   recipes-bsp/cmem/cmem.inc | 6 +++---
>>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/recipes-bsp/cmem/cmem.inc b/recipes-bsp/cmem/cmem.inc
>>> index c2719403..385e1084 100644
>>> --- a/recipes-bsp/cmem/cmem.inc
>>> +++ b/recipes-bsp/cmem/cmem.inc
>>> @@ -4,10 +4,10 @@ LICENSE = "GPLv2"
>>>   LIC_FILES_CHKSUM = "file://include/ti/cmem.h;beginline=1;endline=30;md5=26be509e4bb413905bda8309e338e2b1"
>>>   
>>>   BRANCH = "master"
>>> -# This corresponds to version 4.16.00.00
>>> -SRCREV = "4f970f053b42e8d2a6f1a8cd4b14786196468fd3"
>>> +# This corresponds to version 4.20.00.00
>>> +SRCREV = "b0b57a4e810d27cbb23cb752ef437019f56a5506"
>>>   
>>> -PV = "4.16.00.00+git${SRCPV}"
>>> +PV = "4.20.00.00+git${SRCPV}"
>>>   
>>>   SRC_URI = "git://git.ti.com/ipc/ludev.git;protocol=git;branch=${BRANCH}"
>>>   
>>>
>>
>>
>>
>> 
>>
> 
