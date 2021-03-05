Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.2425.1614979552567065147
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 05 Mar 2021 13:25:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=QMrTrIf5;
 spf=fail (domain: ti.com, ip: 198.145.29.25, mailfrom: praneeth@ti.com)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 0E03D38C07CE
	for <meta-ti@yoctoproject.org>; Fri,  5 Mar 2021 21:25:49 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 125LPfFT043434;
	Fri, 5 Mar 2021 15:25:41 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1614979541;
	bh=2qDFRY/2zh8yBHkvF1hkzPPCpAMfBkMagspXpVYU+6U=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=QMrTrIf5oAMzPyBrI5EPIOlJmNCBVYouw8a4tm2aoxgMn9WxZVwjuECRy2HNE8lZ7
	 RKdUpDzGqjn8quZcQhmq8CkxAiSrepzTaHCiymFz12SEqfhI4md4XSdth0lIidrrgv
	 69DtvRRUDqOOVvlNlvYbzNYKcVUiMDxO3JiPR54Q=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 125LPfMl035505
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 5 Mar 2021 15:25:41 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 5 Mar
 2021 15:25:41 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 5 Mar 2021 15:25:41 -0600
Received: from [128.247.81.61] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 125LPfuB021233;
	Fri, 5 Mar 2021 15:25:41 -0600
Subject: Re: [meta-ti] [arago-commits] Praneeth Bajjuri : ti-rtos: Update path for firmwares on j7200
To: Denys Dmytriyenko <denis@denix.org>, <meta-ti@yoctoproject.org>
References: <20210305172351.2ADC4529B6@arago-project.org>
 <20210305200405.GW4892@denix.org>
From: "praneeth" <praneeth@ti.com>
Message-ID: <2098d0b8-042b-a908-0e13-fc29afc8552d@ti.com>
Date: Fri, 5 Mar 2021 15:25:41 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210305200405.GW4892@denix.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Denys,

On 3/5/21 2:04 PM, Denys Dmytriyenko wrote:
> Praneeth,
> 
> Haven't seen this patch on the list yet...

Thanks for reviewing ahead, yeah i didnot push yet. Was using 
dunfell-next to experiment on the fix.

> 
> 
> On Fri, Mar 05, 2021 at 05:23:51PM +0000, Arago Project git wrote:
>> Module: meta-ti
>> Branch: dunfell-next
>> Commit: b93298f444b7180c88f30b33240394a4e38241cb
>> URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=b93298f444b7180c88f30b33240394a4e38241cb
>>
>> Author: Praneeth Bajjuri <praneeth@ti.com>
>> Date:   Fri Mar  5 11:17:26 2021 -0600
>>
>> ti-rtos: Update path for firmwares on j7200
>>
>> Between j7200 firmware tags 07.03.00.10 to 07.03.00.16
>> the downloadable weburl link changed
>> from *processor-sdk-rtos-jacinto7 to processor-sdk-rtos-j7200
> 
> Ok, this actually explains what was going on and what Nishanth was trying to
> fix.
> 

updated the description little more in the patch i just posted for review.
Basically in the new RTOS firmware tag the firmware public downloadable 
link has changed the location.

New location based on the metadata.inc associated with the tag for j7200 
is at
https://software-dl.ti.com/jacinto7/esd/processor-sdk-rtos-j7200/firmware/07_03_00_16/coresdk_rtos_j7200_07_03_00_16_firmware.tar.xz

The builds were failing because the firmware was not present at this 
location till sometime back.


> 
>> This patch is to fix the recipe to pick the firmware from the
>> expected location.
>>
>> Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
>>
>>   DEFAULT_RTOS_WEBLINK = "undefined"
>>   DEFAULT_RTOS_WEBLINK_j7 = "https://software-dl.ti.com/jacinto7/esd/processor-sdk-rtos-jacinto7/firmware/${CORESDK_RTOS_VERSION}"
>> +DEFAULT_RTOS_WEBLINK_j7200 = "https://software-dl.ti.com/jacinto7/esd/processor-sdk-rtos-j7200/firmware/${CORESDK_RTOS_VERSION}"
> 
> That won't work, need to use _j7200-evm, as there's no _j7200 override
> defined, as explained here:
> https://lists.yoctoproject.org/g/meta-ti/message/13488
> 
> 

Thanks for the recommendation, fixed the name in the patch i just posted 
for review.


>>   DEFAULT_RTOS_WEBLINK_am65xx = "https://software-dl.ti.com/processor-sdk-rtos/esd/AM65X/firmware/${CORESDK_RTOS_VERSION}"
>>   DEFAULT_RTOS_WEBLINK_am64xx = "https://software-dl.ti.com/processor-sdk-rtos/esd/AM64X/firmware/${CORESDK_RTOS_VERSION}"
> 
> 
> 
> 
> 
