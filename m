Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web12.434.1610061366338716317
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 07 Jan 2021 15:16:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=NWCweXU4;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: praneeth@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 107NG5N5084386
	for <meta-ti@lists.yoctoproject.org>; Thu, 7 Jan 2021 17:16:05 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1610061365;
	bh=dwHl8ORLTu8sArFxfazGDGx9e4h4bvVXFZRSOK7J0jw=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=NWCweXU4NQlTmwof0kAnpWoSwhgANKBQMeR0hzpuyuf8jAXsLTGzEA86Mj0q1ynVa
	 qq8uW99XnMIy0lk5vo6F53LjYsAADJSR+/uH5eJW2UOjB9dcen1uwVutK3nRLyQ28B
	 NGua/ekAm8G0Sjky0rGAFpSyQCsi482O0dOz7tC8=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 107NG5WP124335
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 7 Jan 2021 17:16:05 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 7 Jan
 2021 17:16:05 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 7 Jan 2021 17:16:05 -0600
Received: from [128.247.81.61] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 107NG4Zk102155;
	Thu, 7 Jan 2021 17:16:05 -0600
Subject: Re: [meta-ti] [dunfell/master PATCH] ti-sci-fw: Update image gen and sysfw commit SHA
To: Suman Anna <s-anna@ti.com>, Dan Murphy <dmurphy@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
References: <20210107023726.5867-1-praneeth@ti.com>
 <b7d04a45-a1d2-61be-e449-b10d8d708ff5@ti.com>
From: "praneeth" <praneeth@ti.com>
Message-ID: <a286fcb9-a678-1bda-5e86-3d3b5fa4ed2b@ti.com>
Date: Thu, 7 Jan 2021 17:16:04 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <b7d04a45-a1d2-61be-e449-b10d8d708ff5@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 1/7/21 12:57 PM, Suman Anna wrote:
> Hi Praneeth,
> 
> On 1/6/21 8:37 PM, praneeth via lists.yoctoproject.org wrote:
>> From: Praneeth Bajjuri <praneeth@ti.com>
>>
>> Update the image gen and sysfw commit SHAs
> 
> Would prefer some meaningful commit message. Would be nice to see the upgrade
> information of SYSFW 2020.12 for AM64x in the patch.

submitted v2. Thanks for review.

> 
> regards
> Suman
> 
>>
>> Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
>> ---
>>   recipes-bsp/ti-sci-fw/ti-sci-fw.inc | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw.inc b/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
>> index 174d9539..ae22b7a5 100644
>> --- a/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
>> +++ b/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
>> @@ -4,11 +4,11 @@ LICENSE = "TI-TFL"
>>   LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=b5aebf0668bdf95621259288c4a46d76"
>>   
>>   PV = "2020.08b"
>> -PV_am64xx-evm-k3r5 = "2020.23"
>> +PV_am64xx-evm-k3r5 = "2020.12"
>>   
>> -SRCREV = "078c1bbf3d0a05b4045d4091c32e91ee1ae15ff8"
>> +SRCREV = "0c268f292f3b3a71d3bd0b367f492304b45e37b1"
>>   BRANCH ?= "ti-linux-firmware"
>> -SRCREV_imggen = "6d023674b0655f1a7bba192d2600c08be314e9ef"
>> +SRCREV_imggen = "a4796e5f1304fe8197cba54ccea3d18b9998ff02"
>>   SRCREV_FORMAT = "imggen"
>>   
>>   SRC_URI = " \
>>
>>
>>
>> 
>>
> 
