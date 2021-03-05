Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.9018.1614930414712309731
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 04 Mar 2021 23:46:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=TVOnQZG8;
 spf=fail (domain: ti.com, ip: 198.145.29.25, mailfrom: lokeshvutla@ti.com)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 95DED38C0655
	for <meta-ti@yoctoproject.org>; Fri,  5 Mar 2021 07:46:53 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1257imJc053961;
	Fri, 5 Mar 2021 01:44:48 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1614930288;
	bh=kRc8iUVVpsqkATOJX0VN7rWuY5Sniopl/psFYqfnt3M=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=TVOnQZG8chbsiRWqR6zhnkka4fqpsxnc+XV3LkNl/xEaIHMFdM6uU5P2DL9DcOAex
	 pWHO8Uvsv+cty48HXGyQKAgmBtytigqxAxGJm4eDSDndv59RjGSvorPMkcJ06yy8Bc
	 7cBP8D1BhN4hQK1VxLHYojUhIRi2GgSb/LKbax6w=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1257imTC122026
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 5 Mar 2021 01:44:48 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 5 Mar
 2021 01:44:47 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 5 Mar 2021 01:44:47 -0600
Received: from [10.24.69.20] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1257ihQp120292;
	Fri, 5 Mar 2021 01:44:45 -0600
Subject: Re: [EXTERNAL,dunfell] ti-rtos: Fix J7200 builds by dropping evm
To: Nishanth Menon <nm@ti.com>
CC: "Nishanth Menon via lists.yoctoproject.org"
	<nm=ti.com@lists.yoctoproject.org>,
        meta-ti <meta-ti@yoctoproject.org>,
        Denys
 Dmytriyenko <denis@denix.org>,
        "Bajjuri, Praneeth" <praneeth@ti.com>
References: <20210305064155.5125-1-nm@ti.com>
 <31751cf2-ce18-5e68-57e8-58f347865683@ti.com>
 <20210305071105.o46acaxismlevh2i@clergyman>
From: "Lokesh Vutla" <lokeshvutla@ti.com>
Message-ID: <ee43a6ec-1840-35d3-8521-1f085d863c6f@ti.com>
Date: Fri, 5 Mar 2021 13:14:43 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210305071105.o46acaxismlevh2i@clergyman>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 05/03/21 12:41 pm, Nishanth Menon wrote:
> On 12:34-20210305, Lokesh Vutla wrote:
>>
>>
>> On 05/03/21 6:11 pm, Nishanth Menon via lists.yoctoproject.org wrote:
>>> "evm" prefix messes up the pattern matchup for J7200 and falls back into
>>> default, as a result, we attempt to pull [1] instead of [2].
>>>
>>> [1] https://software-dl.ti.com/jacinto7/esd/processor-sdk-rtos-jacinto7/firmware/07_03_00_12/coresdk_rtos_j7200_07_03_00_12_firmware.tar.xz
>>> [2] https://software-dl.ti.com/jacinto7/esd/processor-sdk-rtos-jacinto7/firmware/07_03_00_10/coresdk_rtos_j7200_07_03_00_12_firmware.tar.xz
>>>
>>> Fixes: 77cdfa9f6560 ("ti-rtos: Update metadata and versions for RTOS firmware")
>>> Signed-off-by: Nishanth Menon <nm@ti.com>
>>
>> For the sake of completeness can you add default web link for j7200? I still
>> couldn't figure out how the weblink is populated when default is undefined.
>>
>>   DEFAULT_RTOS_WEBLINK_j7200 =
>> "https://software-dl.ti.com/jacinto7/esd/processor-sdk-rtos-jacinto7/firmware/${CORESDK_RTOS_VERSION}"
>>
> 
> I believe _j7 does matchup j7200, hence it works and adding _j7200 will
> be redundant..
> 
> DEFAULT_RTOS_WEBLINK_j7 = "https://software-dl.ti.com/jacinto7/esd/processor-sdk-rtos-jacinto7/firmware/${CORESDK_RTOS_VERSION}"

looks like it is...
j7200 machine include conf/machine/include/j7.inc

which has SOC_FAMILY_append = ":j7"


I see URLs for all the SoCs except for j7200. Just trying to be consistent :)

Thanks and regards,
Lokesh

> 
> I am a noobie on this, so will be interested in folk's feedback.
> 
