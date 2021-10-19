Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web12.14283.1634668704922346923
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 19 Oct 2021 11:38:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=cMFruXMZ;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: yogeshs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 19JIcKZ3065125;
	Tue, 19 Oct 2021 13:38:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1634668700;
	bh=3cJDGWuOjtGiHoco74izCZOvfd6aW5f98mIoVQ8ERSE=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=cMFruXMZrpf5LNDlfKHH0PyjCfH+W5hrB9+ZGIz/o+QSEd4rqmmMIJ0bfhQFN1m5K
	 yYJn77eUS0+86tjYO88fciE2R1HJB5VU27MM98nqhKUCkxcbeJh1wQvJU6XrVaXKMf
	 rsttWRyhsNAkjuZD6ZsA89UzjseGUuPqRYoE9bmo=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 19JIcKFC126106
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 19 Oct 2021 13:38:20 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 19
 Oct 2021 13:38:21 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 19 Oct 2021 13:38:20 -0500
Received: from [10.250.71.246] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 19JIcKlK012883;
	Tue, 19 Oct 2021 13:38:20 -0500
Subject: Re: [EXTERNAL] [meta-ti][master/dunfell][PATCH v2] ti-linux-fw: Support common inc for all firmware
To: Denys Dmytriyenko <denis@denix.org>, <vigneshr@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, <meta-ti@lists.yoctoproject.org>
References: <20211019131951.18210-1-yogeshs@ti.com>
 <727cc120-9113-42d6-f1dd-d4d9f31d9b6f@ti.com>
 <20211019170322.GM10132@denix.org>
From: "Yogesh Siraswar" <yogeshs@ti.com>
Message-ID: <e83b4f49-0a6b-c671-70b9-7e39f420c085@ti.com>
Date: Tue, 19 Oct 2021 13:38:19 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211019170322.GM10132@denix.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 10/19/2021 12:03 PM, Denys Dmytriyenko wrote:
> On Tue, Oct 19, 2021 at 08:46:29PM +0530, Vignesh Raghavendra via lists.yoctoproject.org wrote:
>>
>>
>> On 10/19/21 6:49 PM, Yogesh Siraswar via lists.yoctoproject.org wrote:
>>> Change to support common INC for all firmware
>>> This will help with:
>>> 1) Eliminating requirement to change multiple recipes for firmware
>>> update
>>> 2) This will help support AUTOREV
>>>
>>> Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
>>> ---
>>
>> [...]
>>> diff --git a/recipes-bsp/prueth-fw/prueth-fw-am65x_git.bb b/recipes-bsp/prueth-fw/prueth-fw-am65x_git.bb
>>> index d447df33..246b872e 100644
>>> --- a/recipes-bsp/prueth-fw/prueth-fw-am65x_git.bb
>>> +++ b/recipes-bsp/prueth-fw/prueth-fw-am65x_git.bb
>>> @@ -1,9 +1,9 @@
>>>   SUMMARY = "PRU Ethernet firmware for AM65x SR1.0"
>>>   
>>> -LICENSE = "TI-TFL"
>>> -LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=b5aebf0668bdf95621259288c4a46d76"
>>> +require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
>>>   
>>> -PV = "08.00.00.20"
>>> +PV = "${PRUETH_FW_AM65x_SR2_VERSION}"
>>
>> Should be
>>
>> 	PV = "${PRUETH_FW_AM65x_VERSION}"
> 
> Also, "AM65x" lower case "x" here
> 
Yes, Vignesh also pointed that. Will fix in the next version.
> 
>>> +PR = "${INC_PR}.0"
>>>   
>>>   CLEANBROKEN = "1"
>>>   
>> [...]
>>> diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw.inc b/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
>>> similarity index 75%
>>> rename from recipes-bsp/ti-sci-fw/ti-sci-fw.inc
>>> rename to recipes-bsp/ti-linux-fw/ti-linux-fw.inc
>>> index 9ce9f6c8..a910af2c 100644
>>> --- a/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
>>> +++ b/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
>>> @@ -4,9 +4,18 @@ LICENSE = "TI-TFL"
>>>   LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=b5aebf0668bdf95621259288c4a46d76"
>>>   
>>>   PV = "2021.05"
>>> -INC_PR = "r0"
>>> -# RTOS firmware version
>>> +INC_PR = "r1"
>>> +
>>> +# Firmware versions
>>>   CORESDK_RTOS_VERSION = "08.00.00.32"
>>> +SERDES_FW_VERSION = "3.3.0.2c"
>>> +NETCP_SA_FW_VERSION = "1.0.0"
>>> +NETCP_PA_FW_VERSION = "3.0.2.3"
>>> +QMSS_PDSP_FW_VERSION = "1.0.0.9"
>>> +PRUETH_FW_AM65X_VERSION = "08.00.00.20"
>>
>> ^^^
> 
> AM65X has uppercase X here. better to be consistent.
> 
> 
>>> +PRUETH_FW_AM65x_SR2_VERSION = "02.02.09.03"

SR1 and SR2 will be consistent with use of AM65X and not AM65x in next
version

>>> +GOODIX_FW_VERSION = "1.0.0.0"
>>> +CADENCE_MHDP_FW_VERSION = "1.2.17"
>>>   
>>>   SRCREV = "793309716bce2e443f798dd5c5f0d8dd310970c0"
>>>   BRANCH ?= "ti-linux-firmware"
>>
>> [...]
>> Regards
>> Vignesh
