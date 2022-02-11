Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.6623.1644583263020218838
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 11 Feb 2022 04:41:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=k6KHRt8Q;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 21BCeuTT102777;
	Fri, 11 Feb 2022 06:40:56 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1644583256;
	bh=Od2byct+DSu9iOweKXlQ84zgXGyUrE/mlpjznTFIwlE=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=k6KHRt8QKWFioo77TkeOIrrQVea1//1/mFdgOGydh7XJ/JFLG/vLGbRhAFNJvjBHj
	 uFV16R+bYcYmV61QjbucAK1PeUYlW75zcN3C0BtkNiiLhqMqDkgs0UcA6Nc5o6Kp6A
	 9PUgAfe29hz7ez28WptIOI7RIQRtGyGbaPOu3R0A=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 21BCeuHR106142
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 11 Feb 2022 06:40:56 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 11
 Feb 2022 06:40:56 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 11 Feb 2022 06:40:56 -0600
Received: from [10.250.33.180] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 21BCeu7O103110;
	Fri, 11 Feb 2022 06:40:56 -0600
Message-ID: <9178138e-0639-5006-5a70-436f59f61653@ti.com>
Date: Fri, 11 Feb 2022 06:40:56 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [meta-ti][dunfell][PATCH 1/3] linux-ti-staging: Bump to 08.02.00.001 release
To: Denys Dmytriyenko <denis@denix.org>
CC: Yogesh Siraswar <yogeshs@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20220207153950.22274-1-reatmon@ti.com>
 <20220207153950.22274-2-reatmon@ti.com> <20220211034128.GE26229@denix.org>
From: "Ryan Eatmon" <reatmon@ti.com>
In-Reply-To: <20220211034128.GE26229@denix.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Language: en-US
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


My auto script is not picking up that change.  I'll fix that for future 
releases.  Thanks for pointing it out.


On 2/10/2022 21:41, Denys Dmytriyenko wrote:
> On Mon, Feb 07, 2022 at 09:39:48AM -0600, Ryan Eatmon via lists.yoctoproject.org wrote:
>> Updated the linux version for 08.02.00.001
>>
>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>> ---
>>   recipes-kernel/linux/linux-ti-staging_5.10.bb | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/recipes-kernel/linux/linux-ti-staging_5.10.bb b/recipes-kernel/linux/linux-ti-staging_5.10.bb
>> index 3f3d50af..51083382 100644
>> --- a/recipes-kernel/linux/linux-ti-staging_5.10.bb
>> +++ b/recipes-kernel/linux/linux-ti-staging_5.10.bb
>> @@ -23,7 +23,7 @@ S = "${WORKDIR}/git"
>>   
>>   BRANCH = "ti-linux-5.10.y"
>>   
>> -SRCREV = "dcc6bedb2c2bdb509709e4ae08303206e95ce6c2"
>> +SRCREV = "a523aa26d870552a44c5f48b01c3c1ea3a48751a"
>>   PV = "5.10.65+git${SRCPV}"
> 
> Why is it still versioned as 5.10.65? Quick glance at ti-linux-kernel shows
> it's been updating with the latest stable on a regular basis and the latest
> version now is 5.10.90, which is 25 minor releases ahead:
> 
> https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/tree/Makefile?h=ti-linux-5.10.y
> 
> 
>>   # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
>> -- 
>> 2.17.1
>>

-- 
Ryan Eatmon
reatmon@ti.com
