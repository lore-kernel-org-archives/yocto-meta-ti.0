Return-Path: <u-kumar1@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21CEEC54E58
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 04:43:58 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.8976.1710305036118402607
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 12 Mar 2024 21:43:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=yvFLNmv9;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: u-kumar1@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 42D4hoGW011813;
	Tue, 12 Mar 2024 23:43:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1710305030;
	bh=VEMwoD7/00APBfdzR1bIb4MCQ8rEtMiYjcnW4w1+uLg=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=yvFLNmv946gKpmGGqUbYOH/jeemq9+Ug2Omm2En4WVjKO9GP+Y7MDqGmBp0dI0Yfy
	 58nxzcyPz18OtiYNU6e3Uu5mBAJh6YNTXesVbltbjCgdejA2ksoiww6qTV61B7H37r
	 0KY3W+F3VCMkxe4mBfghxee99bAoHj1BWOdeafBA=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 42D4hoi4081577
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 12 Mar 2024 23:43:50 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 12
 Mar 2024 23:43:50 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 12 Mar 2024 23:43:50 -0500
Received: from [172.24.20.156] (lt5cd2489kgj.dhcp.ti.com [172.24.20.156])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 42D4hmjq060363;
	Tue, 12 Mar 2024 23:43:48 -0500
Message-ID: <712e0516-202a-4a47-905b-6edb5ab4f079@ti.com>
Date: Wed, 13 Mar 2024 10:13:47 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][kirkstone][PATCH v2] conf: machine: am57xx: export
 ov10635 camera device tree overlay
To: Denys Dmytriyenko <denis@denix.org>
CC: <meta-ti@lists.yoctoproject.org>, <sbellary@baylibre.com>,
        <sinthu.raja@mistralsolutions.com>, <reatmon@ti.com>
References: <20240312171132.1330699-1-u-kumar1@ti.com>
 <20240312215009.GL6072@denix.org>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20240312215009.GL6072@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 13 Mar 2024 04:43:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17521


On 3/13/2024 3:20 AM, Denys Dmytriyenko wrote:
> On Tue, Mar 12, 2024 at 10:41:32PM +0530, Udit Kumar via lists.yoctoproject.org wrote:
>> Signed-off-by: Udit Kumar <u-kumar1@ti.com>
>> ---
>> Changelog:
>> Changes in v2:
>> 1) Updated subject of patch
>> 2) moved overlay to KERNEL_DEVICETREE_PREFIX
>> link to v1:
>> https://lore.kernel.org/all/20240311111359.1556157-1-u-kumar1@ti.com/
>>
>>   meta-ti-bsp/conf/machine/am57xx-evm.conf | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/meta-ti-bsp/conf/machine/am57xx-evm.conf b/meta-ti-bsp/conf/machine/am57xx-evm.conf
>> index 43a6a833..8bcf20ea 100644
>> --- a/meta-ti-bsp/conf/machine/am57xx-evm.conf
>> +++ b/meta-ti-bsp/conf/machine/am57xx-evm.conf
>> @@ -10,6 +10,7 @@ SERIAL_CONSOLES = "115200;ttyS2"
>>   
>>   KERNEL_DEVICETREE_PREFIX = " \
>>       am57 \
>
>> +    ov10635 \
>>       ti/ov10635 \
> What is the difference between these 2 entries? Which one is correct?


Kernel 5.10 is hosting inside ti folder (arch/arm/boot/dts/ti/ov10635.dts)

whereas in 6.1 moved to base folder. (./arch/arm/boot/dts/ov10635.dtso)



>

