Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web09.445.1637009555366429965
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 15 Nov 2021 12:52:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=cBKP3GHU;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: yogeshs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1AFKqVgM053555;
	Mon, 15 Nov 2021 14:52:31 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1637009551;
	bh=8ru9bQQqL5gUk2ZA4H+apExH8d0VDTFjBXIK4/QklJE=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=cBKP3GHUuQsD/U609gFgJu1QPQRTIExCuZh+Y5dTP0M5ksAtPypGXjMh2OLFdcOTx
	 hobtw7j/fzfhl4Q8gOremBYw0lv7ESyE0ZLxBRNtYZyNoyCTClidlpzFnoJLS7ymvz
	 Gy4Y5J01hMYR5bmmeN4kYyZK4XZ5I4iAEUDPar88=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1AFKqVrV031595
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 15 Nov 2021 14:52:31 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 15
 Nov 2021 14:52:31 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 15 Nov 2021 14:52:31 -0600
Received: from [10.250.38.249] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1AFKqVqE007836;
	Mon, 15 Nov 2021 14:52:31 -0600
Message-ID: <c4da11b7-79b6-e63d-e318-01908ea85432@ti.com>
Date: Mon, 15 Nov 2021 14:52:31 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [meta-ti] [PATCH] mpm-transport: Do not use append with += operator
To: Denys Dmytriyenko <denis@denix.org>, <meta-ti@lists.yoctoproject.org>
References: <20211104172934.4088591-1-raj.khem@gmail.com>
 <16B46967FE386BDB.15444@lists.yoctoproject.org>
 <20211115202445.GV10132@denix.org>
From: "Yogesh Siraswar" <yogeshs@ti.com>
In-Reply-To: <20211115202445.GV10132@denix.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Language: en-US
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 11/15/2021 2:24 PM, Denys Dmytriyenko wrote:
> On Thu, Nov 04, 2021 at 01:54:16PM -0400, Denys Dmytriyenko wrote:
>> On Thu, Nov 04, 2021 at 10:29:34AM -0700, Khem Raj wrote:
>>> this is undefined behaviour, mant times devs used them together to get
>>> the missing space at the beginning of string which append/prepend needs
>>> but thats not intended behaviour
>>>
>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>
>> Acked-by: Denys Dmytriyenko <denys@konsulko.com>
> 
> Yogesh,
> 
> I don't believe this patch has made it into master...

Yes, I have not sync master. Is this applicable for dunfell?

> 
> 
>>> ---
>>>   recipes-ti/mpm-transport/mpm-transport_git.bb | 4 ++--
>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/recipes-ti/mpm-transport/mpm-transport_git.bb b/recipes-ti/mpm-transport/mpm-transport_git.bb
>>> index 38aefc24..3b80af34 100644
>>> --- a/recipes-ti/mpm-transport/mpm-transport_git.bb
>>> +++ b/recipes-ti/mpm-transport/mpm-transport_git.bb
>>> @@ -21,8 +21,8 @@ PR = "r0"
>>>   
>>>   CC += "-fcommon"
>>>   EXTRA_OEMAKE = "PDK_INSTALL_PATH=${STAGING_INCDIR}"
>>> -EXTRA_OEMAKE:append:k2hk += "HYPLNK_TRANSPORT=true SRIO_TRANSPORT=true"
>>> -EXTRA_OEMAKE:append:k2e += "HYPLNK_TRANSPORT=true"
>>> +EXTRA_OEMAKE:append:k2hk = " HYPLNK_TRANSPORT=true SRIO_TRANSPORT=true"
>>> +EXTRA_OEMAKE:append:k2e = " HYPLNK_TRANSPORT=true"
>>>   INSANE_SKIP:${PN} += "ldflags"
>>>   
>>>   S = "${WORKDIR}/git"
>>> -- 
>>> 2.33.1
>>>
> 
> 
> 
> 
> 
