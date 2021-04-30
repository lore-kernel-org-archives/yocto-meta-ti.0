Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web12.2823.1619813019366442970
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 30 Apr 2021 13:03:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=wYR8D5A2;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: praneeth@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 13UK3cge020580;
	Fri, 30 Apr 2021 15:03:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1619813018;
	bh=H8d/yM1UsvPcSdBH/whGJWZ/kMHSDgbSREuy3XufmdA=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=wYR8D5A2V+FOq6LZViVKUgsP0F+YlWR0jQHacH6puVfDOfOczxuey2e2klRGJO+Ly
	 3nqVGd6MX06FmOZCRlb+dl5v6BCvltC74V3aAkRLOOO+8g7rq8Cr7lMBwfWE4a9Cyc
	 eekiqXRz8j8KrMZPzeBdD8O/bOZAQUjCrnhzIqIM=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 13UK3c9j012079
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 30 Apr 2021 15:03:38 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 30
 Apr 2021 15:03:37 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Fri, 30 Apr 2021 15:03:37 -0500
Received: from [10.250.78.56] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 13UK3bAZ016445;
	Fri, 30 Apr 2021 15:03:37 -0500
Subject: Re: [meta-ti] [dunfell/master PATCH 2/2] linux-ti-staging: Update 5.10 kernel to 5.10.30
To: Suman Anna <s-anna@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, Yogesh Siraswar <yogeshs@ti.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20210430182006.12039-1-praneeth@ti.com>
 <20210430182006.12039-2-praneeth@ti.com>
 <0979d12e-4d89-768a-3da1-c6989502059c@ti.com>
From: "praneeth" <praneeth@ti.com>
Message-ID: <ddc8ac30-f441-73c5-f2f0-9568294e770d@ti.com>
Date: Fri, 30 Apr 2021 15:03:37 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <0979d12e-4d89-768a-3da1-c6989502059c@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 4/30/2021 3:02 PM, Suman Anna wrote:
> Hi Praneeth,
> 
> On 4/30/21 1:20 PM, praneeth via lists.yoctoproject.org wrote:
>> From: Praneeth Bajjuri <praneeth@ti.com>
>>
>> Update linux 5.10 to 5.10.30 stable.
> 
> I guess you are redoing this patch to reflect the latest tagged kernel commit SHAs?

Yes i will update this one in 10 mins .

> 
> regards
> Suman
> 
>>
>> Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
>> ---
>>   recipes-kernel/linux/linux-ti-staging-rt_5.10.bb | 4 ++--
>>   recipes-kernel/linux/linux-ti-staging_5.10.bb    | 4 ++--
>>   2 files changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb b/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
>> index d4104b6d..a6f104a2 100644
>> --- a/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
>> +++ b/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
>> @@ -6,5 +6,5 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-5.10:"
>>   
>>   BRANCH = "ti-rt-linux-5.10.y"
>>   
>> -SRCREV = "00634c794573abb7fcbbf44437b2969214edfc7a"
>> -PV = "5.10.21+git${SRCPV}"
>> +SRCREV = "bafb98f9e116d9f41e40299d4f900b66d6f673fe"
>> +PV = "5.10.30+git${SRCPV}"
>> diff --git a/recipes-kernel/linux/linux-ti-staging_5.10.bb b/recipes-kernel/linux/linux-ti-staging_5.10.bb
>> index b4de40de..6121f912 100644
>> --- a/recipes-kernel/linux/linux-ti-staging_5.10.bb
>> +++ b/recipes-kernel/linux/linux-ti-staging_5.10.bb
>> @@ -21,8 +21,8 @@ S = "${WORKDIR}/git"
>>   
>>   BRANCH = "ti-linux-5.10.y"
>>   
>> -SRCREV = "bdfd5b0c1ee5617c9a94bacad0d818920d95b486"
>> -PV = "5.10.21+git${SRCPV}"
>> +SRCREV = "d29eceaef9c09b732d8e95afb47429a9fe602275"
>> +PV = "5.10.30+git${SRCPV}"
>>   
>>   # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
>>   MACHINE_KERNEL_PR_append = "a"
>>
>>
>>
>> 
>>
> 
