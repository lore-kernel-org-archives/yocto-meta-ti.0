Return-Path: <praneeth@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5CF7C61D85
	for <webhook@archiver.kernel.org>; Tue, 21 Nov 2023 23:41:59 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.14392.1700610112404117455
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 21 Nov 2023 15:41:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=QuTRVZgx;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: praneeth@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3ALNfmxo038320;
	Tue, 21 Nov 2023 17:41:48 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1700610108;
	bh=Jq2aRWt15UaEOJsmk4ur8lptjLUryUbbtC4LRaUv3Qk=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=QuTRVZgxQAN0KpgjTfY+rIrsZDoVnsfKihP5TEG+kUysU3q617NikglQFnQtw85Hp
	 bzWAATtQY+ONv1p/aiXp0IXMFs/bicWluobPsPDU4xRxmjfzJCUyZDmhpztNej3XIj
	 T2xR6gItdARv4xRo4TQFVw+CglpvIInl+df35KdY=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3ALNfmCl114561
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 21 Nov 2023 17:41:48 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 21
 Nov 2023 17:41:48 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 21 Nov 2023 17:41:48 -0600
Received: from [10.249.33.249] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3ALNfm9d041624;
	Tue, 21 Nov 2023 17:41:48 -0600
Message-ID: <fe18fb39-c7a4-47fb-adf2-79d76382f9ec@ti.com>
Date: Tue, 21 Nov 2023 17:41:47 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] [kirkstone PATCH] pru-icss_git.bb: update to PSSP
 v6.3.0
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>
CC: <meta-ti@lists.yoctoproject.org>, Ryan Eatmon <reatmon@ti.com>,
        Nick
 Saulnier <nsaulnier@ti.com>
References: <20231121232436.3701-1-praneeth@ti.com>
 <20231121234000.GE26739@denix.org>
From: "Bajjuri, Praneeth" <praneeth@ti.com>
In-Reply-To: <20231121234000.GE26739@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 21 Nov 2023 23:41:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17324



On 11/21/2023 5:40 PM, Denys Dmytriyenko wrote:
> On Tue, Nov 21, 2023 at 05:24:36PM -0600, praneeth via lists.yoctoproject.org wrote:
>> Upgrade to v6.3.0 version.
>>
>> This release adds resources for using AM243x & AM64x PRU cores with cores
>> running FreeRTOS:
>>   * The RTOS Getting Started Labs
>>   * Examples for using PRU GPIO and the broadside interface
>>   * SORTE_G example (a custom networking interface)
>>
>> Bug fixes:
>>   * AM64x & AM65x header files, fix the names of extended sections to be in the
>>     format of
>>     ConstantsTableName_0x100
>>
>> Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
>> Signed-off-by: Nick Saulnier <nsaulnier@ti.com>
>> ---
>>   meta-ti-extras/recipes-bsp/pru/pru-icss_git.bb | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta-ti-extras/recipes-bsp/pru/pru-icss_git.bb b/meta-ti-extras/recipes-bsp/pru/pru-icss_git.bb
>> index 6acce94b..4c76ccfd 100644
>> --- a/meta-ti-extras/recipes-bsp/pru/pru-icss_git.bb
>> +++ b/meta-ti-extras/recipes-bsp/pru/pru-icss_git.bb
>> @@ -8,10 +8,10 @@ inherit update-alternatives
>>   
>>   BRANCH = "master"
>>   SRC_URI = "git://git.ti.com/git/pru-software-support-package/pru-software-support-package.git;protocol=https;branch=${BRANCH}"
>> -SRCREV = "3d0e311580d8967d0854ca789e9069e2810e9c1a"
>> +SRCREV = "00a5efa5157feb84cb2e4bf50b481f7082acca82"
>>   
>> -PV = "6.2.0"
>> -PR = "r1"
>> +PV = "6.3.0"
>> +PR = "r2"
> 
> Minor nitpick - when PV/version gets bumped, PR/revision gets reset back to
> r0. But better yet, just remove PR completely - it's no longer required to
> maintain it manually in a recipe...

Thanks , sending v2.


> 
> 
>>   require recipes-ti/includes/ti-paths.inc
>>   
>> -- 
>> 2.17.1

