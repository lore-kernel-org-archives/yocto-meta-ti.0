Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.5438.1607788984362661001
 for <meta-ti@lists.yoctoproject.org>;
 Sat, 12 Dec 2020 08:03:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=drbusvoW;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: dmurphy@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BCG33me034099
	for <meta-ti@lists.yoctoproject.org>; Sat, 12 Dec 2020 10:03:03 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1607788983;
	bh=T8rZc/PjHObK8Bl9JBKBlDUJJteJTuTpUgpfntg3RWA=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=drbusvoWDv2/3fcovxuTLyqy67iKJmgm3OLri+mK3H3DntqKfwPKUOOUJmXl2MOFr
	 KK8CLSuTvPRB+Ex8QfEQqWUddmrZl4czlHui9lrPw79YtZt3d36a+MhbaJAAW5Bx6q
	 UE86EmTPrClruxZP89clOiL4t1P7jMYTWJedEQ9g=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BCG32d4027076
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Sat, 12 Dec 2020 10:03:03 -0600
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Sat, 12
 Dec 2020 10:03:02 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Sat, 12 Dec 2020 10:03:02 -0600
Received: from [10.250.40.192] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BCG32LE026768;
	Sat, 12 Dec 2020 10:03:02 -0600
Subject: Re: [meta-ti] [PATCH 2/4] linux-ti-staging: Update kernel to pick up AM64 platform
To: Suman Anna <s-anna@ti.com>, <meta-ti@lists.yoctoproject.org>
References: <20201211133201.10923-1-dmurphy@ti.com>
 <20201211133201.10923-2-dmurphy@ti.com>
 <1ce70d24-32c3-37dc-e0e5-315e52e39026@ti.com>
From: "Dan Murphy" <dmurphy@ti.com>
Message-ID: <cdcf8a93-19ac-c37e-e2b7-3be2fc09dfec@ti.com>
Date: Sat, 12 Dec 2020 10:02:57 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1ce70d24-32c3-37dc-e0e5-315e52e39026@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Suman

On 12/12/20 1:03 AM, Suman Anna wrote:
> On 12/11/20 7:31 AM, Dan Murphy via lists.yoctoproject.org wrote:
>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>> ---
>>   recipes-kernel/linux/linux-ti-staging_5.4.bb | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/recipes-kernel/linux/linux-ti-staging_5.4.bb b/recipes-kernel/linux/linux-ti-staging_5.4.bb
>> index 0e7fa2dff29c..8275988bb1a7 100644
>> --- a/recipes-kernel/linux/linux-ti-staging_5.4.bb
>> +++ b/recipes-kernel/linux/linux-ti-staging_5.4.bb
>> @@ -21,7 +21,7 @@ S = "${WORKDIR}/git"
>>   
>>   BRANCH = "ti-linux-5.4.y"
>>   
>> -SRCREV = "673043a513673aaddded01f52124c37d0e28f4f9"
>> +SRCREV = "7a5e2e57a39a097b4dde09bad8f72a2d31dc09c4"
> You can probably merge this patch first in preparation. Also, the SHA is already
> stale, might just pick the latest, even 5.4.82..
>
OK I will send another patch to update the SHA and rev

Dan

