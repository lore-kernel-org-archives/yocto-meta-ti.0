Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80BEBC7EE30
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 17:07:47 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.2612.1751389658515485742
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 01 Jul 2025 10:07:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Ce631LDY;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: reatmon@ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 561H7XMM3692022;
	Tue, 1 Jul 2025 12:07:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1751389653;
	bh=nTcws+VDX3ljDJ8nQHyZL4sBIwNBaBrKvxhj9IplNFQ=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Ce631LDYemnCdlV5xTxzgrGeMrSZ8LwgpMf+ppBHprVZlapIDXn2l1sQSE8DpYZim
	 gDLOB8nw+FG7AbZOEAwcsuQ+WYWBbNdlMU9Y8Rk8UOmLU+CyEilHLUyfZ61uOmIqLe
	 nizTd+5q5R4bqG5hY+i9FFu5g6dms1GKjHg9MA5Y=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 561H7XWU2750382
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 1 Jul 2025 12:07:33 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 1
 Jul 2025 12:07:32 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 1 Jul 2025 12:07:32 -0500
Received: from [10.249.37.202] ([10.249.37.202])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 561H7WCc1930742;
	Tue, 1 Jul 2025 12:07:32 -0500
Message-ID: <af1f6b63-e4c1-4459-b8e5-3da52e68c46a@ti.com>
Date: Tue, 1 Jul 2025 12:07:32 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master/scarthgap][PATCH] trusted-firmware-a: Move back
 to tfa upstream except for am62lxx
To: Denys Dmytriyenko <denis@denix.org>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20250701155042.5529-1-reatmon@ti.com>
 <20250701161313.GT18383@denix.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20250701161313.GT18383@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 01 Jul 2025 17:07:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18751



On 7/1/2025 11:13 AM, Denys Dmytriyenko wrote:
> On Tue, Jul 01, 2025 at 10:50:42AM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
>> This moves all of the platforms back to the main TFA repository, but
>> still points to the TI fork for the am62lxx platform while we continue
>> to work on upstreaming the needed patches.
> 
> When I stumbled upon this change being tested in master-wip last wekk, I
> noticed it was failing due to LIC_FILES_CHKSUM - I see you fixed it here.
> 
> Still, as previously discussed, should there be a brief comment explaining
> why the hash is different?

Sure.  In this case it is not "different" as much as it is matching what 
is in master now that we are pointing to it again.  But I'll send a v2.

> 
>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>> ---
>>   .../trusted-firmware-a-ti.inc                   | 17 ++++++++++++-----
>>   1 file changed, 12 insertions(+), 5 deletions(-)
>>
>> diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
>> index c17ac9de..ec52d09c 100644
>> --- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
>> +++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
>> @@ -1,12 +1,19 @@
>>   # NOTE: This .inc file with customizations only gets included for K3 platforms
>>   
>> -PV = "2.12+git"
>> -SRCREV_tfa = "2ab59f45ad0a5d95b5cb339c0f64686954377050"
>> -SRC_URI_TRUSTED_FIRMWARE_A = "git://github.com/TexasInstruments/arm-trusted-firmware.git;protocol=https"
>> -SRCBRANCH = "ti-master"
>> +PV = "2.13+git"
>> +
>> +LIC_FILES_CHKSUM = "file://docs/license.rst;md5=6ed7bace7b0bc63021c6eba7b524039e"
>> +SRCREV_tfa = "d90bb650fe4cb3784f62214ab5829f4051c38d0a"
>> +SRC_URI_TRUSTED_FIRMWARE_A = "git://git.trustedfirmware.org/TF-A/trusted-firmware-a.git;protocol=https"
>> +SRCBRANCH = "master"
>> +
>> +LIC_FILES_CHKSUM:am62lxx = "file://docs/license.rst;md5=1118e32884721c0be33267bd7ae11130"
>> +SRCREV_tfa:am62lxx = "2ab59f45ad0a5d95b5cb339c0f64686954377050"
>> +SRC_URI_TRUSTED_FIRMWARE_A:am62lxx = "git://github.com/TexasInstruments/arm-trusted-firmware.git;protocol=https"
>> +SRCBRANCH:am62lxx = "ti-master"
>> +
>>   SRC_URI = "${SRC_URI_TRUSTED_FIRMWARE_A};name=tfa;branch=${SRCBRANCH}"
>>   
>> -LIC_FILES_CHKSUM = "file://docs/license.rst;md5=1118e32884721c0be33267bd7ae11130"
>>   COMPATIBLE_MACHINE = "k3"
>>   
>>   TFA_BUILD_TARGET = "all"
>> -- 
>> 2.17.1

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

