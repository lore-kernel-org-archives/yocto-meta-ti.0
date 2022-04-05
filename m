Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F874C47090
	for <webhook@archiver.kernel.org>; Tue,  5 Apr 2022 17:24:48 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.8153.1649173934795604954
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 05 Apr 2022 08:52:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=NZzOhLr/;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 235FqA1J093531;
	Tue, 5 Apr 2022 10:52:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1649173930;
	bh=YTfgbWJ18RNwTaP8nJS5jC1tw+3X3uWuPUegRrdHynU=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=NZzOhLr/fSc1S5YrckvFUuGEuS+7B1GnEwSpRFdUCWIEo7s9+A1h8NG+k9orMBJh4
	 eTP2nz5GyuoL9+M3W2P7gdkDmZBjfekuKFIcnI1875kNIwwmqHwwfqxQYy0m9QRmnJ
	 1DkNFl/5mrQpi6wkrX/yoSaSQRJFPpw/gNw1QSng=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 235FqAoi123583
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 5 Apr 2022 10:52:10 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 5
 Apr 2022 10:52:10 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 5 Apr 2022 10:52:10 -0500
Received: from [10.249.39.108] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 235FqAYa013023;
	Tue, 5 Apr 2022 10:52:10 -0500
Message-ID: <ac7b0bd0-12f8-c744-2680-c98562fa2479@ti.com>
Date: Tue, 5 Apr 2022 10:52:10 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [meta-ti] [PATCH] uim-sysfs: Specify branch and protocol for git
 fetcher
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>, Khem Raj <raj.khem@gmail.com>
CC: <meta-ti@lists.yoctoproject.org>
References: <20220404010922.2841052-1-raj.khem@gmail.com>
 <20220405035317.GG23554@denix.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20220405035317.GG23554@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 05 Apr 2022 17:24:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14592



On 4/4/2022 22:53, Denys Dmytriyenko wrote:
> On Sun, Apr 03, 2022 at 06:09:22PM -0700, Khem Raj wrote:
>> bitbake git fetcher warns about protocol and fall back branches
>> therefore be explicit about these parameters in source uri
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> 
> Reviewed-by: Denys Dmytriyenko <denys@konsulko.com>

Signed-off-by: Ryan Eatmon <reatmon@ti.com>

Applied patch to master.

> 
>> ---
>>   meta-ti-extras/recipes-connectivity/uim/uim-sysfs_8.5.bb | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta-ti-extras/recipes-connectivity/uim/uim-sysfs_8.5.bb b/meta-ti-extras/recipes-connectivity/uim/uim-sysfs_8.5.bb
>> index 8d4f9182..e5912e81 100644
>> --- a/meta-ti-extras/recipes-connectivity/uim/uim-sysfs_8.5.bb
>> +++ b/meta-ti-extras/recipes-connectivity/uim/uim-sysfs_8.5.bb
>> @@ -8,7 +8,7 @@ INITSCRIPT_PARAMS = "defaults 03"
>>   inherit update-rc.d
>>   
>>   SRCREV = "a75f45be2d5c74fc1dd913d08afc30f09a230aa9"
>> -SRC_URI = "git://git.ti.com/ti-bt/uim.git"
>> +SRC_URI = "git://git.ti.com/ti-bt/uim.git;branch=master;protocol=https"
>>   
>>   S = "${WORKDIR}/git"
>>   
>> -- 
>> 2.35.1
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#14589): https://lists.yoctoproject.org/g/meta-ti/message/14589
>> Mute This Topic: https://lists.yoctoproject.org/mt/90232070/6551054
>> Group Owner: meta-ti+owner@lists.yoctoproject.org
>> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [reatmon@ti.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

