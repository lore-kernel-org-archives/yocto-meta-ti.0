Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web09.3192.1634871000355960599
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 21 Oct 2021 19:50:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=W60twdIm;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: yogeshs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 19M2nuOu086883;
	Thu, 21 Oct 2021 21:49:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1634870996;
	bh=fOr+Co+q2zhU8KwsiDXB1BAWYNMcM4k4qbJrSN2jhHM=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=W60twdImtPxEUwl5akdQUYlH+piANmCCvXc6l470CQFfokoVUWfhXrg19mw/ziy3y
	 NL9ZZxBXOQC/9an7VmnV+8J3cgwMBdLQRf95MlZmmKmxPIFCK3Aqr8usRhn+eIv2sm
	 k758tdv5IYLBVRvFHqhKKsPequXrQM2LzThprzQg=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 19M2nuKn081920
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 21 Oct 2021 21:49:56 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 21
 Oct 2021 21:49:55 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 21 Oct 2021 21:49:55 -0500
Received: from [10.250.35.146] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 19M2nt76021611;
	Thu, 21 Oct 2021 21:49:55 -0500
Message-ID: <83cc149e-8184-093f-4204-4f29d74f30df@ti.com>
Date: Thu, 21 Oct 2021 21:49:55 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [meta-ti][dunfell][PATCH v2] ti-sci-fw_git: Fix issue with using gp*.bin for TISCI firmware
To: Denys Dmytriyenko <denis@denix.org>
CC: Praneeth Bajjuri <praneeth@ti.com>, <meta-ti@lists.yoctoproject.org>
References: <20211021070441.37565-1-yogeshs@ti.com>
 <20211021205218.GD10132@denix.org>
From: "Yogesh Siraswar" <yogeshs@ti.com>
In-Reply-To: <20211021205218.GD10132@denix.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Language: en-US
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 10/21/2021 3:52 PM, Denys Dmytriyenko wrote:
> On Thu, Oct 21, 2021 at 07:04:41AM +0000, Yogesh Siraswar via lists.yoctoproject.org wrote:
>> With ti-sysfs also hosting *gp-cert.bin for am64x hs-fs breaks gp.
>> This patch removes * to directly reference the TISCI firmware
>>
>> Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
>> ---
>>
>> Change from v1:
>> Previous version caused issue with the HS platforms.
>> Added conditional statement for HS device.
>>
>>   recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
>> index ca56e1de..a1a7446b 100644
>> --- a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
>> +++ b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
>> @@ -27,8 +27,9 @@ SYSFW_PREFIX_j7-hs-evm-k3r5 = "ti-fs-firmware"
>>   SYSFW_SUFFIX ?= "unknown"
>>   
>>   SYSFW_BASE = "${SYSFW_PREFIX}-${SYSFW_SOC}-${SYSFW_SUFFIX}"
>> +SYSFW_BASE_append = "${@['','*']['${SYSFW_SUFFIX}' == 'hs']}"
> 
> This kind of makes sense, but I'm afraid it could negatively affect
> SYSFW_HS_PATH and SYSFW_HS_INNER_CERT_PATH having * and passed to the
> Makefile:
> 
> EXTRA_OEMAKE_HS = " \
>      HS=1 SYSFW_HS_PATH="${S}/ti-sysfw/${SYSFW_BASE}-enc.bin" SYSFW_HS_INNER_CERT_PATH="${S}/ti-sysfw/${SYSFW_BASE}-cert.bin" \
> "

This is similar to what we had for GP device :). Yes, its not idle but 
need more time to think this through. So will merge this for now since 
the builds are passing for both GP and HS..

> 
> 
>> -SYSFW_TISCI = "${S}/ti-sysfw/${SYSFW_BASE}*.bin"
>> +SYSFW_TISCI = "${S}/ti-sysfw/${SYSFW_BASE}.bin"
>>   
>>   SYSFW_BINARY = "sysfw-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
>>   SYSFW_VBINARY = "sysfw-${PV}-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
>> -- 
>> 2.17.1
>>
> 
