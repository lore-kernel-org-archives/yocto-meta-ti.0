Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CC98C25B78
	for <webhook@archiver.kernel.org>; Tue,  4 Jun 2024 22:15:43 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.624.1717539336877166349
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 04 Jun 2024 15:15:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=YQsK8ruj;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 454MFWPM040788;
	Tue, 4 Jun 2024 17:15:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1717539333;
	bh=LydmbhfEYzD5bxYC47DPeY4fB5FXkXahLNuCgFRAJkk=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=YQsK8rujbNGO/cGmoyQhhBM8GyOusB4K1jIz9yfyqPoxc+A1H7he1Dzw1PoPejN+H
	 h8Jqf8DM/ppe/IekDPEnFECOGIg4johyZeZdOvRSxXObgkea5p1sNMWnN1VC59fRQd
	 eJJtxpx2Bhju7JenTM3HA2DQ2e05P/Kal2I2VjD0=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 454MFWKg030520
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 4 Jun 2024 17:15:32 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 4
 Jun 2024 17:15:32 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 4 Jun 2024 17:15:32 -0500
Received: from [10.249.34.39] ([10.249.34.39])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 454MFWiV033114;
	Tue, 4 Jun 2024 17:15:32 -0500
Message-ID: <69324605-d0ab-40e1-bbe0-b13ce8712ade@ti.com>
Date: Tue, 4 Jun 2024 17:15:32 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master/scarthgap][PATCH] gitignore: lift some sane
 defaults from others
To: Denys Dmytriyenko <denis@denix.org>, <rs@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
References: <20240603195515.1089534-1-rs@ti.com>
 <20240604191231.GP21287@denix.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20240604191231.GP21287@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 04 Jun 2024 22:15:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17695



On 6/4/2024 2:12 PM, Denys Dmytriyenko wrote:
> On Mon, Jun 03, 2024 at 02:55:15PM -0500, rs@ti.com wrote:
>> From: Randolph Sapp <rs@ti.com>
>>
>> Lift the common parts of the top level gitignore from oe-core and
>> meta-openembedded. This masks out temporary python files, intermediate
>> artifacts, and patches at the root of the project.
> 
> FWIW, this is a matter of a personal preference, e.g. I don't like when
> git ignores, essentially hiding patches in the top directory. I do prefer
> them to be visible with "git status". But I'll leave it to Ryan.

Yeah.  I was testing it, but I was also thinking the same thing and 
trying to decide if I wanted to take them.  Maybe a reduced set might 
good.  Like leave the patches, but hide the temp files and what not? 
What are your thoughts on that?  Just remove the *.patch from the list 
below?


>> Signed-off-by: Randolph Sapp <rs@ti.com>
>> ---
>>   .gitignore | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>   create mode 100644 .gitignore
>>
>> diff --git a/.gitignore b/.gitignore
>> new file mode 100644
>> index 00000000..c01df45e
>> --- /dev/null
>> +++ b/.gitignore
>> @@ -0,0 +1,7 @@
>> +*.pyc
>> +*.pyo
>> +/*.patch
>> +*.swp
>> +*.orig
>> +*.rej
>> +*~
>> -- 
>> 2.45.1

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

