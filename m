Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web09.9469.1614935413300395441
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 05 Mar 2021 01:10:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=A/LRdmFv;
 spf=fail (domain: ti.com, ip: 198.145.29.25, mailfrom: lokeshvutla@ti.com)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 1A6BE38C0831
	for <meta-ti@yoctoproject.org>; Fri,  5 Mar 2021 09:10:13 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12598669088340;
	Fri, 5 Mar 2021 03:08:06 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1614935286;
	bh=sl5zgi9maqrLX8oWabKVLoKj9TGqNb8uFxzBY0VHrag=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=A/LRdmFvamMJRJpehsFJS9pwlUNNj4RmcxQXKi3OFzEbyQFIHWeKLr+sKhQQ4a8Iz
	 6OyuNHUXFRyRmYhmgAjdSXh5yJomnfTDBW1fV48EbxXr+m+uaOLfmMl2f/B1ftt+hb
	 3op89bh/y7XwOVprDqfuXrpAI4kythvSieUN7OrU=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 125985Bx003587
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 5 Mar 2021 03:08:05 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 5 Mar
 2021 03:08:04 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 5 Mar 2021 03:08:05 -0600
Received: from [10.24.69.20] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 125981SE123786;
	Fri, 5 Mar 2021 03:08:03 -0600
Subject: Re: [EXTERNAL,dunfell] ti-rtos: Fix J7200 builds by dropping evm
To: Denys Dmytriyenko <denis@denix.org>, Nishanth Menon <nm@ti.com>
CC: "Nishanth Menon via lists.yoctoproject.org"
	<nm=ti.com@lists.yoctoproject.org>,
        meta-ti <meta-ti@yoctoproject.org>,
        "Bajjuri, Praneeth" <praneeth@ti.com>
References: <20210305064155.5125-1-nm@ti.com>
 <31751cf2-ce18-5e68-57e8-58f347865683@ti.com>
 <20210305071105.o46acaxismlevh2i@clergyman> <20210305082358.GT4892@denix.org>
From: "Lokesh Vutla" <lokeshvutla@ti.com>
Message-ID: <72eb91ce-5e29-a79b-cdb4-0a12e6200ee4@ti.com>
Date: Fri, 5 Mar 2021 14:38:00 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210305082358.GT4892@denix.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Denys,

On 05/03/21 1:53 pm, Denys Dmytriyenko wrote:
> On Fri, Mar 05, 2021 at 01:11:05AM -0600, Nishanth Menon wrote:
>> On 12:34-20210305, Lokesh Vutla wrote:
>>>
>>>
>>> On 05/03/21 6:11 pm, Nishanth Menon via lists.yoctoproject.org wrote:
>>>> "evm" prefix messes up the pattern matchup for J7200 and falls back into
>>>> default, as a result, we attempt to pull [1] instead of [2].
>>>>
>>>> [1] https://software-dl.ti.com/jacinto7/esd/processor-sdk-rtos-jacinto7/firmware/07_03_00_12/coresdk_rtos_j7200_07_03_00_12_firmware.tar.xz
>>>> [2] https://software-dl.ti.com/jacinto7/esd/processor-sdk-rtos-jacinto7/firmware/07_03_00_10/coresdk_rtos_j7200_07_03_00_12_firmware.tar.xz
>>>>
>>>> Fixes: 77cdfa9f6560 ("ti-rtos: Update metadata and versions for RTOS firmware")
>>>> Signed-off-by: Nishanth Menon <nm@ti.com>
>>>
>>> For the sake of completeness can you add default web link for j7200? I still
>>> couldn't figure out how the weblink is populated when default is undefined.
>>>
>>>   DEFAULT_RTOS_WEBLINK_j7200 =
>>> "https://software-dl.ti.com/jacinto7/esd/processor-sdk-rtos-jacinto7/firmware/${CORESDK_RTOS_VERSION}"
>>>
>>
>> I believe _j7 does matchup j7200, hence it works and adding _j7200 will
>> be redundant..
> 
> From least specific to most specific for j7200-evm machine:
> 
> MACHINEOVERRIDES="aarch64:ti-soc:k3:j7:j7200-evm"

Thanks for the explanation. Where does this variable (MACHINEOVERRIDES) get
populated?

Thanks and regards,
Lokesh

> 
> For comparison, the same for j7-evm:
> 
> MACHINEOVERRIDES="aarch64:ti-soc:k3:j7:j7-evm"
> 
> Or j7-hs-evm:
> 
> MACHINEOVERRIDES="aarch64:ti-soc:k3:j7:j7-hs-evm"
> 
> All of them are in the same "j7" SOC_FAMILY, as that was supposed to be a 
> superset for J7 family, even though ended up being rather specific to j721e...
> 
> So, when you use _j7 override, that covers j7-evm, j7-hs-evm, j7200-evm an so 
> on.
> 
> 
>> DEFAULT_RTOS_WEBLINK_j7 = "https://software-dl.ti.com/jacinto7/esd/processor-sdk-rtos-jacinto7/firmware/${CORESDK_RTOS_VERSION}"
>>
>> I am a noobie on this, so will be interested in folk's feedback.
>>
>> -- 
>> Regards,
>> Nishanth Menon
>> Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
>>
> 
