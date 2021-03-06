Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.1477.1614990584513443349
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 05 Mar 2021 16:29:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=JTNb7kHP;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: praneeth@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1260TbNk030388;
	Fri, 5 Mar 2021 18:29:37 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1614990577;
	bh=epSlQOjrY/wsEokaLZUDI3s8hRTJqcwCFbxfWHO6Peo=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=JTNb7kHPDiau6BDPpL3BrKAuLTFng0u0Da+HTTewZI6i5sdBDLgs1MMlocBLkocUc
	 0g8ra7tjPXtsNPpfui/KX/Q28Bmks0z3X7iXz/A70GY562NQ796MLgEKtH+PV1SLfv
	 2W2rdJIISWxuF9/kM1ofgAmwlDWGTuoPCMFLEGag=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1260Tbhv059337
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 5 Mar 2021 18:29:37 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 5 Mar
 2021 18:29:36 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 5 Mar 2021 18:29:37 -0600
Received: from [128.247.81.61] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1260Tada025061;
	Fri, 5 Mar 2021 18:29:36 -0600
Subject: Re: [meta-ti] [dunfell/master PATCH 2/2] linux-ti-staging: Update 5.4 kernel to the latest commit SHA
To: Denys Dmytriyenko <denis@denix.org>
CC: <meta-ti@lists.yoctoproject.org>, "nm >> Menon, Nishanth" <nm@ti.com>
References: <20210305232525.5790-1-praneeth@ti.com>
 <20210305232525.5790-2-praneeth@ti.com> <20210306001718.GY4892@denix.org>
From: "praneeth" <praneeth@ti.com>
Message-ID: <10ea26d2-8157-3c22-b5a2-dc5fb35adda3@ti.com>
Date: Fri, 5 Mar 2021 18:29:36 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210306001718.GY4892@denix.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 3/5/21 6:17 PM, Denys Dmytriyenko wrote:
> On Fri, Mar 05, 2021 at 05:25:25PM -0600, praneeth via lists.yoctoproject.org wrote:
>> From: Praneeth Bajjuri <praneeth@ti.com>
>>
>> Update 5.4 kernel to the latest commit SHA
> 
> Praneeth,
> 
> Is the stable automerger currently off? There haven't been stable merges for
> over a month. Is it due to the ongoing release?

RT stable is still on 5.4.93
https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-stable-rt.git/log/?h=v5.4-rt

hence didnot move beyond that version for RT and non RT kernel.

> 
> 
>> Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
>> ---
>>   recipes-kernel/linux/linux-ti-staging-rt_5.4.bb | 2 +-
>>   recipes-kernel/linux/linux-ti-staging_5.4.bb    | 2 +-
>>   2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/recipes-kernel/linux/linux-ti-staging-rt_5.4.bb b/recipes-kernel/linux/linux-ti-staging-rt_5.4.bb
>> index b6831c34..a9dac5af 100644
>> --- a/recipes-kernel/linux/linux-ti-staging-rt_5.4.bb
>> +++ b/recipes-kernel/linux/linux-ti-staging-rt_5.4.bb
>> @@ -6,5 +6,5 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-5.4:"
>>   
>>   BRANCH = "ti-rt-linux-5.4.y"
>>   
>> -SRCREV = "f88a6c0071660458ed8985500ed5c4b5c8a7f372"
>> +SRCREV = "6cd92cf89235d5ddb3c0104d02c0f3db48efdba4"
>>   PV = "5.4.93+git${SRCPV}"
>> diff --git a/recipes-kernel/linux/linux-ti-staging_5.4.bb b/recipes-kernel/linux/linux-ti-staging_5.4.bb
>> index 052c8971..37f387c3 100644
>> --- a/recipes-kernel/linux/linux-ti-staging_5.4.bb
>> +++ b/recipes-kernel/linux/linux-ti-staging_5.4.bb
>> @@ -21,7 +21,7 @@ S = "${WORKDIR}/git"
>>   
>>   BRANCH = "ti-linux-5.4.y"
>>   
>> -SRCREV = "d36781593d111abb7c56bbc7094ab6b5673d6a01"
>> +SRCREV = "87c0425824b4169e4d697c4f6219243249a8c08b"
>>   PV = "5.4.93+git${SRCPV}"
>>   
>>   # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
>> -- 
>> 2.17.1
