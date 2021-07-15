Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web08.6842.1626350892686591460
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 15 Jul 2021 05:08:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Zvr6DIuK;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: yogeshs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 16FC83W1054470;
	Thu, 15 Jul 2021 07:08:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1626350883;
	bh=Nd+JNxBUKPdHPw/mwpIk2xgR1fgaO93T/3UU0XkHDDQ=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=Zvr6DIuKvOoJQCTYwCis8hzDDhrJqlIFHSPrKxA59Jr4GlwsZorKNT14kN45/4kMF
	 HPHmDfcJLOlIJCx9Aoj6aCEwSIa0nyy0uhzXO2PmQfsTDgOWDZID+AGMqpjxef7BOY
	 vbSJbydQlo9VSCQ5cKB8jTtiRaxBu42ILnlGYzbw=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 16FC838j062456
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 15 Jul 2021 07:08:03 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 15
 Jul 2021 07:08:03 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Thu, 15 Jul 2021 07:08:03 -0500
Received: from [10.250.38.184] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 16FC83PU008156;
	Thu, 15 Jul 2021 07:08:03 -0500
Subject: Re: [EXTERNAL] [meta-ti] Merge confict chunk
To: Denys Dmytriyenko <denis@denix.org>
CC: Khem Raj <raj.khem@gmail.com>, <meta-ti@lists.yoctoproject.org>
References: <CAMKF1srKvR3KrWyKtW18J6rqzLH2H2SaYQLLzSs+sa8QHQh+7w@mail.gmail.com>
 <5070d889-b8c6-e6b1-d86d-0dbc966d1707@ti.com>
 <20210714195739.GY1528@denix.org>
From: "Yogesh Siraswar" <yogeshs@ti.com>
Message-ID: <d0e85501-7c6b-6c5d-f894-e2c24c4000ef@ti.com>
Date: Thu, 15 Jul 2021 07:08:02 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210714195739.GY1528@denix.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Denys,
This patch was marked for both master and dunfell. The patch file name 
were different so missed on the changes. My bad. I guess, we need to 
back-port master patch to dunfell instead of creating new patch.

Thanks
Yogesh

On 7/14/2021 2:57 PM, Denys Dmytriyenko wrote:
> Yogesh,
> 
> You should not rebase master or release branches like dunfell.
> 
> It appears master already had a similar patch from March, which was never
> merged to dunfell. So master now tries to patch it twice...
> 
> I'll send a cleanup for master shortly.
> 
> 
> On Wed, Jul 14, 2021 at 01:21:11PM -0500, Yogesh Siraswar wrote:
>> Hi Raj,
>> Thanks for pointing  it out. Have fixed the same. Will try to be
>> more careful in future.
>>
>> Thanks
>> Yogesh
>>
>>   more
>> On 7/14/21 12:15 PM, Khem Raj wrote:
>>> Hi Denys
>>>
>>> This commit
>>>
>>> https://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/commit/?id=4c1d26f6282b9959b9ee10aa77b3e05ed56299fb
>>>
>>> has a merge anchor thats committed perhaps accidentally.
>>>
>>> Thanks
>>> -Khem
> 
