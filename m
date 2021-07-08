Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web12.969.1625772189496134537
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 08 Jul 2021 12:23:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=vdNKLPl1;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: yogeshs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 168JN8np049185;
	Thu, 8 Jul 2021 14:23:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1625772188;
	bh=ezADTl996BLZGxMzArPZeUjm/OzBFZCkp8R/ga62yVg=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=vdNKLPl1WjrbR+1Z/UD1zyWkZCnQ+ocj9u1rg6w1Gw6vXfBLWIXhgoJ4IQ+49tq6M
	 sXNBOCna3BJ2wBknvY8HLs777DDBS0nhO/nl5Ce4bVsOuXa/BtPBY+XYakekNXp0Pe
	 5wRYQs7tSBeSwBD/Nt+8jueWE2Y2kMpyMN29hmm4=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 168JN8Qo034453
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 8 Jul 2021 14:23:08 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 8 Jul
 2021 14:23:07 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Thu, 8 Jul 2021 14:23:07 -0500
Received: from [10.250.32.9] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 168JN5Ih009168;
	Thu, 8 Jul 2021 14:23:05 -0500
Subject: Re: [meta-ti][dunfell/master][PATCH 1/4] linux-ti-staging: Update to 08.00.00.002 release tag
To: Nishanth Menon <nm@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>,
        Praneeth Bajjuri
	<praneeth@ti.com>, <meta-ti@lists.yoctoproject.org>
References: <20210708051232.10077-1-yogeshs@ti.com>
 <20210708051232.10077-2-yogeshs@ti.com>
 <20210708132612.ftfkal4vovdrprfj@anymore>
From: "Yogesh Siraswar" <yogeshs@ti.com>
Message-ID: <44f3f5d1-5356-3c82-f14e-b1ac26a910c9@ti.com>
Date: Thu, 8 Jul 2021 14:23:05 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210708132612.ftfkal4vovdrprfj@anymore>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 7/8/21 8:26 AM, Nishanth Menon wrote:
> On 05:12-20210708, Yogesh Siraswar via lists.yoctoproject.org wrote:
>> Update to 08.00.00.002 release tag
>>
>> Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
>> ---
>>   recipes-kernel/linux/linux-ti-staging_5.10.bb | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/recipes-kernel/linux/linux-ti-staging_5.10.bb b/recipes-kernel/linux/linux-ti-staging_5.10.bb
>> index ff807108..59c9bba9 100644
>> --- a/recipes-kernel/linux/linux-ti-staging_5.10.bb
>> +++ b/recipes-kernel/linux/linux-ti-staging_5.10.bb
>> @@ -23,7 +23,7 @@ S = "${WORKDIR}/git"
>>   
>>   BRANCH = "ti-linux-5.10.y"
>>   
>> -SRCREV = "73aa709ca10103b61fba3a07471dbb4dcb56db45"
>> +SRCREV = "08058130545674a175939922532dc3ca76d8bbad"
>>   PV = "5.10.41+git${SRCPV}"
>>   
>>   # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
> 
> 
> If you are picking up eaidk board patches, it will need to be after
> this.

We are not picking any EIDK patches for 08.00.00.002
> 
