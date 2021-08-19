Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web08.67149.1629366150495512992
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 19 Aug 2021 02:42:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=aFjdimjF;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: yogeshs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 17J9gPYl096759;
	Thu, 19 Aug 2021 04:42:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1629366145;
	bh=QytdG1QXptbOv3WyzsBOZ2rOVhXi9XT4nauJAOrO6vk=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=aFjdimjFh/eq8MgxE/SBClf/ssIcKSgcTnAizawLjraNaDnNWWCvSwZHsaVDlHDPi
	 XuC3Y6itzUVGflxh3oJQD7Rbix123U69enUHbwZ9eeVxV3ZC/oa2b0MTLqmjf8YswV
	 +9xRoHTFyiQcNj9c+iMvU5FTFn5ZZjXkYxcyepn0=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 17J9gO4i059315
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 19 Aug 2021 04:42:25 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 19
 Aug 2021 04:42:24 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Thu, 19 Aug 2021 04:42:24 -0500
Received: from [10.250.39.223] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 17J9gOn3007909;
	Thu, 19 Aug 2021 04:42:24 -0500
Subject: Re: [meta-ti][PATCH] machines: Adjust to use new location of tune files in oe-core
To: Denys Dmytriyenko <denis@denix.org>, Khem Raj <raj.khem@gmail.com>
CC: <meta-ti@lists.yoctoproject.org>
References: <20210818181748.3887480-1-raj.khem@gmail.com>
 <20210818191938.GK1528@denix.org>
From: "Yogesh Siraswar" <yogeshs@ti.com>
Message-ID: <7b4692bb-8b17-536b-7562-4c22156732c3@ti.com>
Date: Thu, 19 Aug 2021 04:42:24 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210818191938.GK1528@denix.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Applied to master. Thanks.

On 8/18/2021 2:19 PM, Denys Dmytriyenko wrote:
> Right, this has been in my pipeline as well, but I got distracted before
> finishing it up...
> 
> Tested-by: Denys Dmytriyenko <denys@konsulko.com>
> 
> This is only for master.
> 
> 
> On Wed, Aug 18, 2021 at 11:17:48AM -0700, Khem Raj wrote:
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>   conf/machine/include/davinci.inc  | 2 +-
>>   conf/machine/include/k3r5.inc     | 2 +-
>>   conf/machine/include/keystone.inc | 2 +-
>>   conf/machine/include/omap-a15.inc | 2 +-
>>   conf/machine/include/omap3.inc    | 2 +-
>>   conf/machine/include/omap4.inc    | 2 +-
>>   conf/machine/include/ti33x.inc    | 2 +-
>>   conf/machine/include/ti43x.inc    | 2 +-
>>   8 files changed, 8 insertions(+), 8 deletions(-)
>>
>> diff --git a/conf/machine/include/davinci.inc b/conf/machine/include/davinci.inc
>> index d2681740..b8d207de 100644
>> --- a/conf/machine/include/davinci.inc
>> +++ b/conf/machine/include/davinci.inc
>> @@ -1,4 +1,4 @@
>> -require conf/machine/include/tune-arm926ejs.inc
>> +require conf/machine/include/arm/armv5/tune-arm926ejs.inc
>>
>>   # Increase this everytime you change something in the kernel
>>   MACHINE_KERNEL_PR = "r54"
>> diff --git a/conf/machine/include/k3r5.inc b/conf/machine/include/k3r5.inc
>> index 93f08c04..3cc79061 100644
>> --- a/conf/machine/include/k3r5.inc
>> +++ b/conf/machine/include/k3r5.inc
>> @@ -5,7 +5,7 @@ SOC_FAMILY:append = ":k3r5"
>>
>>   # The closest of existing tunes for Cortex-R5F
>>   DEFAULTTUNE = "armv7athf"
>> -require conf/machine/include/tune-cortexa8.inc
>> +require conf/machine/include/arm/armv7a/tune-cortexa8.inc
>>
>>   # R5 runs early bootloader and loads SYSFW
>>   # https://git.ti.com/cgit/ti-u-boot/ti-u-boot/tree/board/ti/am65x/README
>> diff --git a/conf/machine/include/keystone.inc b/conf/machine/include/keystone.inc
>> index 83dca19d..851328ac 100644
>> --- a/conf/machine/include/keystone.inc
>> +++ b/conf/machine/include/keystone.inc
>> @@ -2,7 +2,7 @@ require conf/machine/include/ti-soc.inc
>>   SOC_FAMILY:append = ":keystone"
>>
>>   DEFAULTTUNE ?= "armv7athf-neon"
>> -require conf/machine/include/tune-cortexa15.inc
>> +require conf/machine/include/arm/armv7a/tune-cortexa15.inc
>>
>>   PREFERRED_PROVIDER_virtual/kernel ?= "linux-ti-staging"
>>   PREFERRED_PROVIDER_virtual/bootloader = "u-boot-ti-staging"
>> diff --git a/conf/machine/include/omap-a15.inc b/conf/machine/include/omap-a15.inc
>> index 553835c8..57295a85 100644
>> --- a/conf/machine/include/omap-a15.inc
>> +++ b/conf/machine/include/omap-a15.inc
>> @@ -2,7 +2,7 @@ require conf/machine/include/ti-soc.inc
>>   SOC_FAMILY:append = ":omap-a15"
>>
>>   DEFAULTTUNE ?= "armv7athf-neon"
>> -require conf/machine/include/tune-cortexa15.inc
>> +require conf/machine/include/arm/armv7a/tune-cortexa15.inc
>>
>>   # Increase this everytime you change something in the kernel
>>   MACHINE_KERNEL_PR = "r7"
>> diff --git a/conf/machine/include/omap3.inc b/conf/machine/include/omap3.inc
>> index ab069b00..6e0d8dbc 100644
>> --- a/conf/machine/include/omap3.inc
>> +++ b/conf/machine/include/omap3.inc
>> @@ -2,7 +2,7 @@ require conf/machine/include/ti-soc.inc
>>   SOC_FAMILY:append = ":omap3"
>>
>>   DEFAULTTUNE ?= "armv7athf-neon"
>> -require conf/machine/include/tune-cortexa8.inc
>> +require conf/machine/include/arm/armv7a/tune-cortexa8.inc
>>
>>   PREFERRED_PROVIDER_virtual/xserver = "xserver-xorg"
>>
>> diff --git a/conf/machine/include/omap4.inc b/conf/machine/include/omap4.inc
>> index b6f43744..b8bd9d37 100644
>> --- a/conf/machine/include/omap4.inc
>> +++ b/conf/machine/include/omap4.inc
>> @@ -2,7 +2,7 @@ require conf/machine/include/ti-soc.inc
>>   SOC_FAMILY:append = ":omap4"
>>
>>   DEFAULTTUNE ?= "armv7athf-neon"
>> -require conf/machine/include/tune-cortexa9.inc
>> +require conf/machine/include/arm/armv7a/tune-cortexa9.inc
>>
>>   PREFERRED_PROVIDER_virtual/kernel ?= "linux-ti-staging"
>>   PREFERRED_PROVIDER_virtual/bootloader = "u-boot-ti-staging"
>> diff --git a/conf/machine/include/ti33x.inc b/conf/machine/include/ti33x.inc
>> index 3da2aba5..896328d9 100644
>> --- a/conf/machine/include/ti33x.inc
>> +++ b/conf/machine/include/ti33x.inc
>> @@ -2,7 +2,7 @@ require conf/machine/include/ti-soc.inc
>>   SOC_FAMILY:append = ":ti33x"
>>
>>   DEFAULTTUNE ?= "armv7athf-neon"
>> -require conf/machine/include/tune-cortexa8.inc
>> +require conf/machine/include/arm/armv7a/tune-cortexa8.inc
>>
>>   PREFERRED_PROVIDER_virtual/xserver = "xserver-xorg"
>>
>> diff --git a/conf/machine/include/ti43x.inc b/conf/machine/include/ti43x.inc
>> index eaed1812..0f28cc91 100644
>> --- a/conf/machine/include/ti43x.inc
>> +++ b/conf/machine/include/ti43x.inc
>> @@ -2,7 +2,7 @@ require conf/machine/include/ti-soc.inc
>>   SOC_FAMILY:append = ":ti43x"
>>
>>   DEFAULTTUNE ?= "armv7athf-neon"
>> -require conf/machine/include/tune-cortexa9.inc
>> +require conf/machine/include/arm/armv7a/tune-cortexa9.inc
>>
>>   PREFERRED_PROVIDER_virtual/xserver = "xserver-xorg"
>>
>> --
>> 2.33.0
> 
>>
>>
>>
> 
> 
> 
> 
> 
> 
