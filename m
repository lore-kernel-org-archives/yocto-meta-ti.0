Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web08.3697.1613081615231098833
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 11 Feb 2021 14:13:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Kuf+ZYGs;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: praneeth@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 11BMDYC6023894
	for <meta-ti@lists.yoctoproject.org>; Thu, 11 Feb 2021 16:13:34 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1613081614;
	bh=493Fga79lf8FtmpRfOYtOnPRj8EJxdE1r8jObA6ibKs=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=Kuf+ZYGswsCoVkLnU+3+wl89l+nFAbcc2DMi/Y7qxl1/m7JcWntEHsV+6hkVj5NCm
	 dV3bMBZx0INquayBx23dDtgKBQw7XSPkOnaH6axeuGwQEl/TZAXS7YrohLbNmjq722
	 Ri/jzq0f4RiLrSSLWtPIOuVJuwmAPvFrBmrhsys4=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 11BMDXb4000370
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 11 Feb 2021 16:13:34 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 11
 Feb 2021 16:13:33 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 11 Feb 2021 16:13:33 -0600
Received: from [10.250.50.222] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 11BMDX8D008760;
	Thu, 11 Feb 2021 16:13:33 -0600
Subject: Re: [meta-ti] [dunfell/master PATCH] linux-ti-staging: Update 5.4 kernel to 07.03.00.000
To: Suman Anna <s-anna@ti.com>, Dan Murphy <dmurphy@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
References: <20210211215720.13920-1-praneeth@ti.com>
 <94870517-e1b3-499b-3f4c-940810d70609@ti.com>
From: "praneeth" <praneeth@ti.com>
Message-ID: <1045c3e0-e3ef-ba7a-69a3-eae8f3996787@ti.com>
Date: Thu, 11 Feb 2021 16:13:33 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <94870517-e1b3-499b-3f4c-940810d70609@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 2/11/2021 3:59 PM, Suman Anna wrote:
> On 2/11/21 3:57 PM, praneeth via lists.yoctoproject.org wrote:
>> From: Praneeth Bajjuri <praneeth@ti.com>
>>
>> Update 5.4 kernel to 07.03.00.000
> 
> Hmm, 07.03.00.001?

We are just running thru the tagging process so this RC0 hence used that 
convention.

We should have RC1 with 07.03.00.001 sometime next week.

> 
>>
>> Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
>> ---
>>   recipes-kernel/linux/linux-ti-staging-rt_5.4.bb | 2 +-
>>   recipes-kernel/linux/linux-ti-staging_5.4.bb    | 2 +-
>>   2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/recipes-kernel/linux/linux-ti-staging-rt_5.4.bb b/recipes-kernel/linux/linux-ti-staging-rt_5.4.bb
>> index d00ac054..475a3cd3 100644
>> --- a/recipes-kernel/linux/linux-ti-staging-rt_5.4.bb
>> +++ b/recipes-kernel/linux/linux-ti-staging-rt_5.4.bb
>> @@ -6,5 +6,5 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-5.4:"
>>   
>>   BRANCH = "ti-rt-linux-5.4.y"
>>   
>> -SRCREV = "cfa5bbe5258d318b6fcf9743ae9002ec0a5f158a"
>> +SRCREV = "21f8134c92d1f11ecca74291df672905612337ef"
>>   PV = "5.4.93+git${SRCPV}"
>> diff --git a/recipes-kernel/linux/linux-ti-staging_5.4.bb b/recipes-kernel/linux/linux-ti-staging_5.4.bb
>> index ed330469..f5e1ba5e 100644
>> --- a/recipes-kernel/linux/linux-ti-staging_5.4.bb
>> +++ b/recipes-kernel/linux/linux-ti-staging_5.4.bb
>> @@ -21,7 +21,7 @@ S = "${WORKDIR}/git"
>>   
>>   BRANCH = "ti-linux-5.4.y"
>>   
>> -SRCREV = "437d3ec51580225f89bc997dd06929c6aff03eef"
>> +SRCREV = "cabf941a8cd60a205353cb775e450ec225a5cc3b"
>>   PV = "5.4.93+git${SRCPV}"
>>   
>>   # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
>>
>>
>>
>> 
>>
> 
