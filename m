Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web09.6994.1617310037349687857
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 01 Apr 2021 13:47:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=x+LFiCeB;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: praneeth@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 131KlDkB042234;
	Thu, 1 Apr 2021 15:47:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1617310033;
	bh=qe3kvgSHpAAAVfpT647e8hMbRpLbmG43itY3pBxo4JA=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=x+LFiCeBkf39/65HX0ffy591ZqOXy3Yz3p5+IJban4d+a5H8aJW3Qnc/gObX3pe8n
	 ZIlxu/mqYb2hFz9l7Us1lCHfGEkJKrQvgxX06ySV15LXHoTbipz6x+5aLEDpjyZsMA
	 kdgj1z6UVRbjOWxwDbK8nID7nydPC8mZ61n88/NA=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 131KlDxW130303
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 1 Apr 2021 15:47:13 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 1 Apr
 2021 15:47:13 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Thu, 1 Apr 2021 15:47:13 -0500
Received: from [10.250.78.56] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 131KlDOX093412;
	Thu, 1 Apr 2021 15:47:13 -0500
Subject: Re: [meta-ti] [dunfell/master PATCH] ti-rtos: Update metadata and versions for RTOS firmware
To: Denys Dmytriyenko <denis@denix.org>
CC: Shivalingappa Sujith <sujith.s@ti.com>, <meta-ti@lists.yoctoproject.org>
References: <20210401201629.10334-1-praneeth@ti.com>
 <20210401203105.GR23013@denix.org>
From: "praneeth" <praneeth@ti.com>
Message-ID: <b8df2797-8617-9c20-214e-6d0ad8672188@ti.com>
Date: Thu, 1 Apr 2021 15:47:13 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210401203105.GR23013@denix.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit


Hi Denys,

On 4/1/2021 3:31 PM, Denys Dmytriyenko wrote:
> Praneeth,
> 
> You didn't update metadata recipe, even though the commit says otherwise.

rtos firmware master from [1] is already pointing to same commit sha in 
metadata.bb at [2]

this is because of the recent AM64x firmware i picked for AM64x[3] in 
dunfell-next

[1]:
https://git.ti.com/gitweb?p=processor-sdk/coresdk_rtos_releases.git;a=commit;h=12a455643928b9fc22af4d85f2aac7894b80e6a5 

[2]:
https://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/tree/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb?h=dunfell-next#n21 

[3]: https://lists.yoctoproject.org/g/meta-ti/message/13606


> 
> So, if you pull metadata first, it will point to the old firmware version.
> 
> 
> On Thu, Apr 01, 2021 at 03:16:29PM -0500, praneeth via lists.yoctoproject.org wrote:
>> From: Praneeth Bajjuri <praneeth@ti.com>
>>
>> updated rtos firmwares
>> j721e, j7200: 07.03.00.26
>>
>> Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
>> ---
>>   recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb | 8 ++++----
>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
>> index 176d0ad0..84dae9a6 100644
>> --- a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
>> +++ b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
>> @@ -20,8 +20,8 @@ include ${DEPLOY_DIR_IMAGE}/${DEFAULT_METADATA_FILE}
>>   
>>   # Set some defaults for when metadata.inc is not available
>>   DEFAULT_RTOS_FAMILY = "jacinto"
>> -DEFAULT_RTOS_VERSION = "07_03_00_21"
>> -DEFAULT_RTOS_VERSION_DOT = "07.03.00.21"
>> +DEFAULT_RTOS_VERSION = "07_03_00_26"
>> +DEFAULT_RTOS_VERSION_DOT = "07.03.00.26"
>>   
>>   DEFAULT_RTOS_VERSION_am64xx = "07_03_00_18"
>>   DEFAULT_RTOS_VERSION_DOT_am64xx = "07.03.00.18"
>> @@ -48,8 +48,8 @@ DEFAULT_FIRMWARE_URL = "file://empty"
>>   DEFAULT_FIRMWARE_URL_k3 = "${CORESDK_RTOS_WEBLINK}/${DEFAULT_FIRMWARE_FILE}"
>>   
>>   DEFAULT_FIRMWARE_SHA256SUM = "unknown"
>> -DEFAULT_FIRMWARE_SHA256SUM_j7 = "fc7805ed3d6c1801efb2b85ac9af99a8657aa3a7a9327bc16a1163d566f11c2c"
>> -DEFAULT_FIRMWARE_SHA256SUM_j7200-evm = "71f282ba6768ad3b603a17d30851cc621986c88311c174960a50196bfc79f85c"
>> +DEFAULT_FIRMWARE_SHA256SUM_j7 = "d3fc9fbcfaf67ebd5a509e56ef30e9a54242c290baecfda15e7ff92c127738d0"
>> +DEFAULT_FIRMWARE_SHA256SUM_j7200-evm = "674040e161cb4b87845fd527dea166a2dd25d0df9136aa6206d73a9240058c40"
>>   DEFAULT_FIRMWARE_SHA256SUM_am65xx = "61e0be08bea8ab1055645bd96504a6a29c70318c5b277237dee9981cd94d7f79"
>>   DEFAULT_FIRMWARE_SHA256SUM_am64xx = "1b44bccd20b767568e996e924a2ef18cabd1c3e16d3412629ff72d83b81b152f"
>>   
>> -- 
>> 2.17.1
>>
> 
