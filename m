Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.21.1623171696533923560
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 08 Jun 2021 10:01:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=SGp5hmt1;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: praneeth@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 158H1ViZ044362;
	Tue, 8 Jun 2021 12:01:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1623171691;
	bh=UPuQbPuNXrwzqIQzmHz81CsfKrB60609LeO6s7uGJzg=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=SGp5hmt16ZLnXeeGauuZsMuXU9hGvW39EFfYdUYQqrIGuoF1gdVOO5Db8v/TyVLAT
	 ChlN6SiVTV+9IoJACoERVcUBHZ8copELQNWMup7hlQA6yfCTgYhs7Ey2pNiKFH2knk
	 lHMFzJyA+VKuieDU7YcXob57bCeRiGnYUFFvmdJY=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 158H1V0m128840
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 8 Jun 2021 12:01:31 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 8 Jun
 2021 12:01:31 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Tue, 8 Jun 2021 12:01:31 -0500
Received: from [128.247.81.61] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 158H1VXX102864;
	Tue, 8 Jun 2021 12:01:31 -0500
Subject: Re: [meta-ti] [dunfell/master PATCH] ti-uboot-staging: Update to the latest ti-u-boot-2021.01
To: Denys Dmytriyenko <denis@denix.org>
CC: Yogesh Siraswar <yogeshs@ti.com>, <meta-ti@lists.yoctoproject.org>
References: <20210608000254.12042-1-praneeth@ti.com>
 <20210608003054.GR1528@denix.org>
From: "praneeth" <praneeth@ti.com>
Message-ID: <0f8ff8a4-7462-2a30-4660-e2b7d1307c4e@ti.com>
Date: Tue, 8 Jun 2021 12:01:31 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210608003054.GR1528@denix.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 6/7/21 7:30 PM, Denys Dmytriyenko wrote:
> Series looks good to me, including v2. Maybe better to specify sequence number
> [PATCH 01/04] to keep the order?

Thanks for the feedback.

Will do, Will send a updated version for the kernel and overlay patches 
today once the kernel tree gets updated.

The uboot patch can go independently.

> 
> Acked-by: Denys Dmytriyenko <denys@konsulko.com>
> 
> 
> On Mon, Jun 07, 2021 at 07:02:51PM -0500, praneeth via lists.yoctoproject.org wrote:
>> From: Praneeth Bajjuri <praneeth@ti.com>
>>
>> Update to the latest commit of ti-u-boot-2021.01
>>
>> Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
>> ---
>>   recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
>> index 437f6eba..4c3f0a47 100644
>> --- a/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
>> +++ b/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
>> @@ -2,8 +2,8 @@ require u-boot-ti.inc
>>   
>>   LIC_FILES_CHKSUM = "file://Licenses/README;md5=5a7450c57ffe5ae63fd732446b988025"
>>   
>> -PR = "r6"
>> +PR = "r7"
>>   
>>   BRANCH = "ti-u-boot-2021.01"
>>   
>> -SRCREV = "a6e78929575b6969c15ced9685441fc430ee9510"
>> +SRCREV = "c66dd9b8467472278803c2426098a2828c93ebcc"
>> -- 
>> 2.17.1
>>
> 
> 
> 
> 
> 
