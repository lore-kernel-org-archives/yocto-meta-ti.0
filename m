Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2A47C4345F
	for <webhook@archiver.kernel.org>; Wed, 17 Apr 2024 18:35:24 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.21870.1713378921281183916
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 17 Apr 2024 11:35:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=dZ9WfzFZ;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 43HIZGDB104420;
	Wed, 17 Apr 2024 13:35:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1713378916;
	bh=pJRS+sviIrdbnjBXXKxncgsGf90CdFC/gAhRaiDCbRM=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=dZ9WfzFZL8kzbj+jDEPk12NAPFc3uuqr39NC1OMl5Am9b2dG7LeoFibfxcvPFvAfc
	 OC9vzCgGNXvI/yJx4oO4gBRjAJDTVgwiwRZ58aKUxLCJcTXeRFGFHRawGbkRDZ0yWL
	 gDEAMtsvVr6h4/v0mGZ7jHGef2oWZp4VwuYw2fSE=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 43HIZGuh053531
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 17 Apr 2024 13:35:16 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 17
 Apr 2024 13:35:16 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 17 Apr 2024 13:35:16 -0500
Received: from [10.249.33.251] ([10.249.33.251])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 43HIZGUh066590;
	Wed, 17 Apr 2024 13:35:16 -0500
Message-ID: <7795280c-3ad7-4a84-b9b6-5e1049d2436e@ti.com>
Date: Wed, 17 Apr 2024 13:35:16 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master][PATCH 3/3] conf/layer.conf: Update
 LAYERSERIES_COMPAT
To: Denys Dmytriyenko <denis@denix.org>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20240417161129.9697-1-reatmon@ti.com>
 <20240417161129.9697-4-reatmon@ti.com> <20240417163012.GM28791@denix.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20240417163012.GM28791@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 17 Apr 2024 18:35:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17581



On 4/17/2024 11:30 AM, Denys Dmytriyenko wrote:
> On Wed, Apr 17, 2024 at 11:11:29AM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
>> Update LAYERSERIES_COMPAT to remove EOL branches and add future styhead.
>>
>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>> ---
>>   meta-ti-bsp/conf/layer.conf    | 2 +-
>>   meta-ti-extras/conf/layer.conf | 2 +-
>>   2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta-ti-bsp/conf/layer.conf b/meta-ti-bsp/conf/layer.conf
>> index 502e355f..03cbd7ea 100644
>> --- a/meta-ti-bsp/conf/layer.conf
>> +++ b/meta-ti-bsp/conf/layer.conf
>> @@ -9,7 +9,7 @@ BBFILE_COLLECTIONS += "meta-ti-bsp"
>>   BBFILE_PATTERN_meta-ti-bsp := "^${LAYERDIR}/"
>>   BBFILE_PRIORITY_meta-ti-bsp = "6"
>>   
>> -LAYERSERIES_COMPAT_meta-ti-bsp = "kirkstone langdale mickledore nanbield scarthgap"
>> +LAYERSERIES_COMPAT_meta-ti-bsp = "nanbield scarthgap styhead"
>>   
>>   LICENSE_PATH += "${LAYERDIR}/licenses"
>>   
>> diff --git a/meta-ti-extras/conf/layer.conf b/meta-ti-extras/conf/layer.conf
>> index a05dbe5f..a8c68343 100644
>> --- a/meta-ti-extras/conf/layer.conf
>> +++ b/meta-ti-extras/conf/layer.conf
>> @@ -9,7 +9,7 @@ BBFILE_COLLECTIONS += "meta-ti-extras"
>>   BBFILE_PATTERN_meta-ti-extras := "^${LAYERDIR}/"
>>   BBFILE_PRIORITY_meta-ti-extras = "6"
>>   
>> -LAYERSERIES_COMPAT_meta-ti-extras = "kirkstone langdale mickledore nanbield scarthgap"
>> +LAYERSERIES_COMPAT_meta-ti-extras = "scarthgap styhead"
> 
> nanbield is missing here?

Yes it is... but I swear it wasn't...  I did make the change...  I'll 
send a v2.


> 
>>   LICENSE_PATH += "${LAYERDIR}/licenses"
>>   
>> -- 
>> 2.17.1

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

