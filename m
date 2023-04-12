Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 143F1C7619A
	for <webhook@archiver.kernel.org>; Wed, 12 Apr 2023 21:09:05 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.1662.1681333736837656529
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 12 Apr 2023 14:08:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=nl45wFDm;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33CL8p1k130345;
	Wed, 12 Apr 2023 16:08:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1681333731;
	bh=yd3s/KPgN9NlvnPvJCJFYy2X/Y6iHgupVUhRqjCRmT0=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=nl45wFDmtJ+Dy01FlBkGVvSMW5EK8SU6DHJbZpVqY/dgY09w0dMu5akuWgEpJrR+l
	 Shh/a03ocWFct8d2IRRrwEAIDr3rBaQixV4icE0xa1U9NB4ILS3l+iMhqdOA5AV9To
	 VZ585FkIe3MpFhR7mNxgrb+qSGp4JLusIBmiivFk=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33CL8p9E048252
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 12 Apr 2023 16:08:51 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 12
 Apr 2023 16:08:50 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 12 Apr 2023 16:08:50 -0500
Received: from [10.249.34.94] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33CL8oZ1121988;
	Wed, 12 Apr 2023 16:08:50 -0500
Message-ID: <57e5d47d-3088-0df6-608b-35bb21f8c91f@ti.com>
Date: Wed, 12 Apr 2023 16:08:50 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [meta-ti][master/kirkstone][PATCH v2 5/6] meta-ti-bsp: Remove SGX
 driver from SIGGEN_EXCLUDERECIPES_ABISAFE
To: Denys Dmytriyenko <denis@denix.org>
CC: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        Randolph Sapp <rs@ti.com>, <meta-ti@lists.yoctoproject.org>
References: <20230412184242.29743-1-afd@ti.com>
 <20230412184242.29743-5-afd@ti.com> <20230412204312.GJ9226@denix.org>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20230412204312.GJ9226@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 12 Apr 2023 21:09:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16385

On 4/12/23 3:43 PM, Denys Dmytriyenko wrote:
> On Wed, Apr 12, 2023 at 01:42:41PM -0500, Andrew Davis via lists.yoctoproject.org wrote:
>> Neither of recipes nor their ABI is all that stable. OpenGL might be
>> slightly more stable, but that is not what these provide anymore.
>> Remove these.
> 
> This is not what you think it is... :) Actually, Rogue recipes should be added
> to the list.
> 
> This is specific to signatures/shared state. The ABI in this case is libgles
> and libegl (which are stable) and tells bitbake to avoid rebuilding generic
> apps depending on these packages between platfoms in the same architecture.
> 

These do not provide those API anymore, Mesa does. And nothing should depend
on the KM package other than the UM libs.

Andrew

> 
>> Signed-off-by: Andrew Davis <afd@ti.com>
>> ---
>>   meta-ti-bsp/conf/layer.conf | 5 -----
>>   1 file changed, 5 deletions(-)
>>
>> diff --git a/meta-ti-bsp/conf/layer.conf b/meta-ti-bsp/conf/layer.conf
>> index 39e7f9eb..31eb9db8 100644
>> --- a/meta-ti-bsp/conf/layer.conf
>> +++ b/meta-ti-bsp/conf/layer.conf
>> @@ -18,9 +18,4 @@ LAYERDEPENDS_meta-ti-bsp = " \
>>       meta-arm \
>>   "
>>   
>> -SIGGEN_EXCLUDERECIPES_ABISAFE += " \
>> -    ti-sgx-ddk-km \
>> -    ti-sgx-ddk-um \
>> -"
>> -
>>   HOSTTOOLS_NONFATAL += "truncate xxd comm"
>> -- 
>> 2.39.2

