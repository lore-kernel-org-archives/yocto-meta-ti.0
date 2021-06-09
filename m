Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web12.1674.1623199210124692042
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 08 Jun 2021 17:40:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=yg9Ac43J;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: praneeth@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1590e8Yh093251;
	Tue, 8 Jun 2021 19:40:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1623199208;
	bh=c71Kn9u4qrWrlhzIsYOjawHn4SPX3RUYXsqRpNz2HK4=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=yg9Ac43JgONkiNSxvy5emCNrLKQUtN1Y2LWgod1E4OQAyuhGWgkiiq6kcK7uEzcPb
	 mhlx7zN43Lz9kpGZVTwuqgg3A1ncxH51/fZdV1dywYbLNcvNnEVDY/EP5Msc2Vhxqn
	 zr/ZOHGGZjrCcz7pkdDTGONX2Jehe3iMy0di3eu8=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1590e8A6053246
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 8 Jun 2021 19:40:08 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 8 Jun
 2021 19:40:07 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Tue, 8 Jun 2021 19:40:07 -0500
Received: from [128.247.81.61] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1590e7Ns124740;
	Tue, 8 Jun 2021 19:40:07 -0500
Subject: Re: [meta-ti] [dunfell/master PATCH] linux-ti-staging: Update 5.10 kernel to the latest commit SHA
To: Lukas Wunner <lukas@wunner.de>
CC: Yogesh Siraswar <yogeshs@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20210608000254.12042-1-praneeth@ti.com>
 <20210608000254.12042-2-praneeth@ti.com> <20210608140436.GA6013@wunner.de>
From: "praneeth" <praneeth@ti.com>
Message-ID: <ea5b4665-09fe-285c-7fdd-2447b610216a@ti.com>
Date: Tue, 8 Jun 2021 19:40:07 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210608140436.GA6013@wunner.de>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 6/8/21 9:04 AM, Lukas Wunner wrote:
> On Mon, Jun 07, 2021 at 07:02:52PM -0500, praneeth via lists.yoctoproject.org wrote:
>> diff --git a/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb b/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
>> index 4654d92d..834df5ff 100644
>> --- a/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
>> +++ b/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
>> @@ -6,5 +6,5 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-5.10:"
>>   
>>   BRANCH = "ti-rt-linux-5.10.y"
>>   
>> -SRCREV = "afe9ba17bb94cd226f9e5dc3685e4fe32be28c5c"
>> +SRCREV = "433ef931c699f08bef8c67de8458302c5f971c8b"
>>   PV = "5.10.35+git${SRCPV}"
>> diff --git a/recipes-kernel/linux/linux-ti-staging_5.10.bb b/recipes-kernel/linux/linux-ti-staging_5.10.bb
>> index 72a6c49c..47f1669e 100644
>> --- a/recipes-kernel/linux/linux-ti-staging_5.10.bb
>> +++ b/recipes-kernel/linux/linux-ti-staging_5.10.bb
>> @@ -23,7 +23,7 @@ S = "${WORKDIR}/git"
>>   
>>   BRANCH = "ti-linux-5.10.y"
>>   
>> -SRCREV = "72d727fe733f2610e937a063bcebedce329948ec"
>> +SRCREV = "ae876c7c91df646ab198331e676f250f06cfdeb5"
>>   PV = "5.10.35+git${SRCPV}"
>>   
>>   # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
> 
> This doesn't apply cleanly to any of the dunfell, dunfell-next nor master
> branches.  SRCREV is currently 8fbd16658d11 and d85aee3e19aa, respectively
> on those branches.
> 
> Which branch did you base this patch on?

The patch was made based on dunfell-next.
The conflict is seen because dunfell-next is not in sync with dunfell yet.
Once the following patches are pulled to dunfell branch, the patch can 
be applied cleanly. I am sending a v2 shortly.

Ref:
2de2c5ec linux-ti-staging: Update 5.10 kernel to the latest commit SHA
6983b50e linux-ti-staging: Update 5.10 kernel to 5.10.35

> 
> Thanks,
> 
> Lukas
> 
