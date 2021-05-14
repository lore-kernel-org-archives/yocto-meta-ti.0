Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.165.1621025139882342849
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 14 May 2021 13:45:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=PfP21vLs;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: s-anna@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 14EKjcrm103594;
	Fri, 14 May 2021 15:45:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1621025138;
	bh=596djiPN4TobCK9NXw8CYz0xDBhepKgEQmeRCEaxaSk=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=PfP21vLs1yjjab8gsTHnGAWawcJ+Q1CSA5IuKhkT8F0+tBXwWRJ2Loa7+U7oI2Noi
	 11kY+FFqjpOBY3AD/sCToj/kife1raZ38Yrqzr7pjrMrxVlX4gWTjb6WdT7xDZwgWJ
	 imPHb+k7L2045AtYxgzZdGXVbWvWhwYbatv61tlM=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 14EKjcqE033759
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 14 May 2021 15:45:38 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 14
 May 2021 15:45:37 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Fri, 14 May 2021 15:45:37 -0500
Received: from [10.250.35.60] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 14EKjbki055580;
	Fri, 14 May 2021 15:45:37 -0500
Subject: Re: [meta-ti] [dunfell/master PATCH] ti-uboot-staging: Update to the latest ti-u-boot-2021.01
To: Nishanth Menon <nm@ti.com>, <praneeth@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, Yogesh Siraswar <yogeshs@ti.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20210507050149.8672-1-praneeth@ti.com>
 <20210514192333.oj5jo7h7kjc2cbip@smoky>
From: "Suman Anna" <s-anna@ti.com>
Message-ID: <41d962a3-e740-f004-7ce7-904e1bf3077b@ti.com>
Date: Fri, 14 May 2021 15:45:37 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210514192333.oj5jo7h7kjc2cbip@smoky>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 5/14/21 2:23 PM, Nishanth Menon wrote:
> On 00:01-20210507, praneeth via lists.yoctoproject.org wrote:
>> From: Praneeth Bajjuri <praneeth@ti.com>
>>
>> Update to the latest commit of ti-u-boot-2021.01
>>
>> Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
>> ---
>>  recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
>> index 015cd028..b911042c 100644
>> --- a/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
>> +++ b/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
>> @@ -2,8 +2,8 @@ require u-boot-ti.inc
>>  
>>  LIC_FILES_CHKSUM = "file://Licenses/README;md5=5a7450c57ffe5ae63fd732446b988025"
>>  
>> -PR = "r4"
>> +PR = "r5"
>>  
>>  BRANCH = "ti-u-boot-2021.01"
>>  
>> -SRCREV = "51a19c4274ca897cec279d1b2d883957ab4705c5"
>> +SRCREV = "fbbc964a3514d99430f66600603b7ae348b64cd4"
>> -- 
>> 2.17.1
> 
> 
> Dont we need to fix up am64x- build?
> 

Not for this commit SHA. The am64x config consolidation happened with the latest
commit a6e78929575b6969c15ced9685441fc430ee9510

regards
Suman
