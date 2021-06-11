Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web08.2318.1623371585866594147
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 10 Jun 2021 17:33:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=cgCiOsgJ;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: praneeth@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 15B0X1Cl066323;
	Thu, 10 Jun 2021 19:33:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1623371581;
	bh=eM0a0jFPyUkqFfXWnEqL3bmC/nWJwpkC8KRJ4M3IV/g=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=cgCiOsgJVL+5pjlHNZE15msNxnhsnaasXDZwpuc4ngrwX2j1sCMe9c6N5BZQb3UNn
	 jMsyxt2lrZiXPtOIzY023iErG676qUi8ODOkKHR3TFB9gL6OozIEfq75Qgwdpyyv1L
	 HpYS4RsBeFIw7wvUy7K6/MWo0uHnu5bao06bz21c=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 15B0X1aU052771
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 10 Jun 2021 19:33:01 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 10
 Jun 2021 19:33:01 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Thu, 10 Jun 2021 19:33:01 -0500
Received: from [128.247.81.61] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 15B0X1ra004212;
	Thu, 10 Jun 2021 19:33:01 -0500
Subject: Re: [meta-ti] [dunfell/master PATCH] ti-sci-fw: Update image gen to latest
To: Denys Dmytriyenko <denis@denix.org>
CC: Yogesh Siraswar <yogeshs@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20210610225710.1259-1-praneeth@ti.com>
 <20210610225710.1259-2-praneeth@ti.com> <20210611002035.GY1528@denix.org>
From: "praneeth" <praneeth@ti.com>
Message-ID: <76e2d08a-88b9-8a82-ade5-cdf74facabf6@ti.com>
Date: Thu, 10 Jun 2021 19:33:01 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210611002035.GY1528@denix.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 6/10/21 7:20 PM, Denys Dmytriyenko wrote:
> On Thu, Jun 10, 2021 at 05:57:10PM -0500, praneeth via lists.yoctoproject.org wrote:
>> From: Praneeth Bajjuri <praneeth@ti.com>
>>
>> update image get to latest.
> 
> Typo - image get?

you are right . will send v2 : its image gen*

> 
> 
>> This commit also picks AM64x boot critical fix.
>> commit e411dc16862b ("soc: am64x: Makefile: Move the SPL Load address to 0x70000000")
>>
>> Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
>> ---
>>   recipes-bsp/ti-sci-fw/ti-sci-fw.inc | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw.inc b/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
>> index 72430ab6..dbf63ef5 100644
>> --- a/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
>> +++ b/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
>> @@ -7,7 +7,7 @@ PV = "2021.01a"
>>   
>>   SRCREV = "34062b5670aac524ce3074b184ef2ef62daafca0"
>>   BRANCH ?= "ti-linux-firmware"
>> -SRCREV_imggen = "7b6f3832af6d334d335309d66d206ab829765c0e"
>> +SRCREV_imggen = "e411dc16862b5bb2d8befb12496b03d7b01c87b2"
>>   SRCREV_FORMAT = "imggen"
>>   
>>   SRC_URI = " \
>> -- 
>> 2.17.1
>>
