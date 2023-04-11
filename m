Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EFCBC7619A
	for <webhook@archiver.kernel.org>; Tue, 11 Apr 2023 21:14:54 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.27408.1681247692174955224
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 11 Apr 2023 14:14:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=nLmzUnYm;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33BLEm3t020699;
	Tue, 11 Apr 2023 16:14:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1681247688;
	bh=mBqUCxi7D0J+O871fW4ubz4sQLh93hL6nrpX1mZD8OA=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=nLmzUnYmwdvqUbbpAiQLYAOKwYskJii7WHAU4OJlk5JvXWfd4ePhaFeFJpOUhnfWC
	 g7xRDpYXV3USZgicvckQnnhEBNRPU8tDv8WWDDozhNJqjRahQWdRUntHXXJ5WMWVma
	 Jc1U0FK615hyZh1aLcbsYt9awibDX0LhRH6xLPMA=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33BLEmDG015630
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 11 Apr 2023 16:14:48 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 11
 Apr 2023 16:14:48 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Tue, 11 Apr 2023 16:14:48 -0500
Received: from [10.250.33.184] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33BLElDP032574;
	Tue, 11 Apr 2023 16:14:47 -0500
Message-ID: <d87090de-aa5f-e36a-63a2-dcbe11a9102c@ti.com>
Date: Tue, 11 Apr 2023 16:14:47 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [meta-ti][master/kirkstone][PATCH v2 4/5] linux-ti-next: Add
 defconfig for OMAP-L138
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>
CC: Ryan Eatmon <reatmon@ti.com>, <meta-ti@lists.yoctoproject.org>
References: <20230411174037.32244-1-afd@ti.com>
 <20230411174037.32244-4-afd@ti.com> <20230411195104.GY9226@denix.org>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20230411195104.GY9226@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 11 Apr 2023 21:14:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16358

On 4/11/23 2:51 PM, Denys Dmytriyenko wrote:
> On Tue, Apr 11, 2023 at 12:40:36PM -0500, Andrew Davis via lists.yoctoproject.org wrote:
>> Not sure if anyone is testing on this device with -next, but for
>> completeness add its defconfig.
>>
>> Signed-off-by: Andrew Davis <afd@ti.com>
>> ---
>>   meta-ti-bsp/recipes-kernel/linux/linux-ti-next_git.bb | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-next_git.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-next_git.bb
>> index b540e508..62831c9c 100644
>> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-next_git.bb
>> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-next_git.bb
>> @@ -20,6 +20,7 @@ PV = "6.1.0-rc1+git${SRCPV}"
> 
> Should PV/SRCREV be bumped past 6.1-rc1?
> 

Someone should. But unless we automate then it will get stale again.

It could be part of the build automation scripts when we start -next testing..

Andrew

> 
>>   SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git;protocol=https;branch=master"
>>   
>>   DEFCONFIG_NAME = "multi_v7_defconfig"
>> +DEFCONFIG_NAME:omapl138 = "davinci_all_defconfig"
>>   DEFCONFIG_NAME:k3 = "defconfig"
>>   KERNEL_CONFIG_COMMAND = "oe_runmake -C ${S} O=${B} ${DEFCONFIG_NAME}"
>>   
>> -- 
>> 2.39.2

