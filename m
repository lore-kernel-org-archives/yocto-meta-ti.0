Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web12.2707.1614746634739912264
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 02 Mar 2021 20:43:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=tEnrBx32;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: praneeth@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1234hqDd032757;
	Tue, 2 Mar 2021 22:43:52 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1614746632;
	bh=q8LqYV1A95fWWap+F4ayOnon47XwRH8xo5lgqj7EdTc=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=tEnrBx32N2RZgBFIn5S1A79903sM8gmFyz+YowbkM5DZAndr7s/EEEMWTCg/EZ94v
	 4KXZLnwpjM6HLx2ou6YBPr6hMnNB9gGB6s+y07Sb+lvwXaOXUd2mAaSmFHxHPHKhN0
	 5KtNuebzZE/eGotf/3aEfShikh5TrheCIIWqCtnc=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1234hqcp019707
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 2 Mar 2021 22:43:52 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 2 Mar
 2021 22:43:52 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 2 Mar 2021 22:43:52 -0600
Received: from [10.250.50.222] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1234hqpT038108;
	Tue, 2 Mar 2021 22:43:52 -0600
Subject: Re: [meta-ti] [dunfell/master PATCH] ti-rtos: Update metadata and versions for RTOS firmware
To: Denys Dmytriyenko <denis@denix.org>
CC: Lokesh Vutla <lokeshvutla@ti.com>, Shivalingappa Sujith <sujith.s@ti.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20210301235735.24491-1-praneeth@ti.com>
 <20210302205252.GP4892@denix.org>
From: "praneeth" <praneeth@ti.com>
Message-ID: <d401616e-cb4b-29c6-8e84-6e856cddcfc3@ti.com>
Date: Tue, 2 Mar 2021 22:43:52 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210302205252.GP4892@denix.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 3/2/2021 2:52 PM, Denys Dmytriyenko wrote:
> On Mon, Mar 01, 2021 at 05:57:35PM -0600, praneeth via lists.yoctoproject.org wrote:
>> From: Praneeth Bajjuri <praneeth@ti.com>
>>
>> updated rtos firmwares
>> am64xx: 07.03.01.06
>> am65xx: 07.03.00.16
>> j721e: 07.03.00.16
>> j7200: 07.03.00.16
> 
> Since most of the versions are now the same, you can simplify it by setting
> common variable once and then altering it for am64xx only:
> 
> DEFAULT_RTOS_VERSION = "07_03_00_16"
> DEFAULT_RTOS_VERSION_DOT = "07.03.00.16"
> 
> DEFAULT_RTOS_VERSION_am64xx = "07_03_01_06"
> DEFAULT_RTOS_VERSION_DOT_am64xx = "07.03.01.06"

Thanks Denys, Sent a V2 also added your signed-off-by
Hope you are ok with it.

> 
> I.e. no need to set _j7200 and _am65xx separately.
> 
> 
>> Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
>> ---
>>   recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb | 24 +++++++++++-----------
>>   recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb |  2 +-
>>   2 files changed, 13 insertions(+), 13 deletions(-)
>>
>> diff --git a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
>> index ed62b876..2cd19ac8 100644
>> --- a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
>> +++ b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
>> @@ -17,17 +17,17 @@ include ${DEPLOY_DIR_IMAGE}/metadata.inc
>>   
>>   # Set some defaults for when metadata.inc is not available
>>   DEFAULT_RTOS_FAMILY = "jacinto"
>> -DEFAULT_RTOS_VERSION = "07_03_00_12"
>> -DEFAULT_RTOS_VERSION_DOT = "07.03.00.12"
>> +DEFAULT_RTOS_VERSION = "07_03_00_16"
>> +DEFAULT_RTOS_VERSION_DOT = "07.03.00.16"
>>   
>> -DEFAULT_RTOS_VERSION_j7200 = "07_03_00_10"
>> -DEFAULT_RTOS_VERSION_DOT_j7200 = "07.03.00.10"
>> +DEFAULT_RTOS_VERSION_j7200 = "07_03_00_16"
>> +DEFAULT_RTOS_VERSION_DOT_j7200 = "07.03.00.16"
>>   
>> -DEFAULT_RTOS_VERSION_am64xx = "07_03_01_02"
>> -DEFAULT_RTOS_VERSION_DOT_am64xx = "07.03.01.02"
>> +DEFAULT_RTOS_VERSION_am64xx = "07_03_01_06"
>> +DEFAULT_RTOS_VERSION_DOT_am64xx = "07.03.01.06"
>>   
>> -DEFAULT_RTOS_VERSION_am65xx = "07_03_00_10"
>> -DEFAULT_RTOS_VERSION_DOT_am65xx = "07.03.00.10"
>> +DEFAULT_RTOS_VERSION_am65xx = "07_03_00_16"
>> +DEFAULT_RTOS_VERSION_DOT_am65xx = "07.03.00.16"
>>   
>>   DEFAULT_RTOS_SOC = "undefined"
>>   DEFAULT_RTOS_SOC_j7 = "j721e"
>> @@ -46,10 +46,10 @@ DEFAULT_FIRMWARE_URL = "file://empty"
>>   DEFAULT_FIRMWARE_URL_k3 = "${CORESDK_RTOS_WEBLINK}/${DEFAULT_FIRMWARE_FILE}"
>>   
>>   DEFAULT_FIRMWARE_SHA256SUM = "unknown"
>> -DEFAULT_FIRMWARE_SHA256SUM_j7 = "69cc16c30c895fe813002bd7bdb3d30e6ca622d86b008a6bf6e2a24b86550969"
>> -DEFAULT_FIRMWARE_SHA256SUM_j7200-evm = "a16865d928b2b00bfca64e0c41b02dcfc0ac8ec1ce125fbfd3581a1c610847f8"
>> -DEFAULT_FIRMWARE_SHA256SUM_am65xx = "aa121c10d3099dd61ef898717245ecee25b501170607c9a95afd741e05783a5d"
>> -DEFAULT_FIRMWARE_SHA256SUM_am64xx = "9e9efeef0b1dbb101de97e58cfda8bf052a697f2ea635fdf6ca5158fffdc212b"
>> +DEFAULT_FIRMWARE_SHA256SUM_j7 = "78f3ab929a0f3c6e2907538061de82e16d8aff7ffb2fac0c3c4d56df8abec3b0"
>> +DEFAULT_FIRMWARE_SHA256SUM_j7200-evm = "5bae696d35e206bbcd9b26ab6508af59a2c2d72f9b89aa1d3fc1aa808f7a8615"
>> +DEFAULT_FIRMWARE_SHA256SUM_am65xx = "7bd854dbf96c25683d684ac731fde3edd7fb8a65f8727f7aae3802a2e9a9cab6"
>> +DEFAULT_FIRMWARE_SHA256SUM_am64xx = "450bf23d659756695d62168fe06eebe4641522293d89692a9eea837426bac0f9"
>>   
>>   # Use weak assignment for CORESDK_RTOS_* variables to use defaults if not yet set
>>   CORESDK_RTOS_FAMILY ?= "${DEFAULT_RTOS_FAMILY}"
>> diff --git a/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb b/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb
>> index 1bbe5f22..9bb0d3c5 100644
>> --- a/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb
>> +++ b/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb
>> @@ -18,7 +18,7 @@ PLAT_SFX_am64xx = "/am64x"
>>   # Use weak assignment to set defaults to TI_RTOS_METADATA_* variables
>>   TI_RTOS_METADATA_URI ?= "git://git.ti.com/processor-sdk/coresdk_rtos_releases.git"
>>   TI_RTOS_METADATA_PROTOCOL ?= "git"
>> -TI_RTOS_METADATA_SRCREV ?= "e15de0d731606abdf112f2910543fd08b781ad64"
>> +TI_RTOS_METADATA_SRCREV ?= "ba81dc5a9342fc35435920092a0df2cb2ab342ef"
>>   TI_RTOS_METADATA_BRANCH ?= "master"
>>   TI_RTOS_METADATA_DIR ?= "${PLAT_SFX}"
>>   TI_RTOS_METADATA_FILE ?= "${S}${TI_RTOS_METADATA_DIR}/metadata.inc"
>> -- 
>> 2.17.1
