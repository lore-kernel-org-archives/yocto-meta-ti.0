Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web09.262.1618845335662389064
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 19 Apr 2021 08:15:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=AUMsYm05;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: praneeth@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 13JFFYfF025109;
	Mon, 19 Apr 2021 10:15:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1618845334;
	bh=5ArJiCpVrqUVlGgl67i3er1C2WzqOXXlNra/XJBpqb0=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=AUMsYm05EmsZu5QvWACtKZtDjErIeazwY6W9SWss6B37Ze1s9KNJLNpUS4JI4WeEy
	 zvTdZpLO6eO1Q+MGiFn05fSPzIgRrs5CCaJ+Q8MTXr/yQra30mg6CQaezyo2yoHdu6
	 LeFk8/gzOaeS6dONRTB+Z4mX2lAw8Bs4RL/M324Y=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 13JFFYcU009008
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 19 Apr 2021 10:15:34 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Mon, 19
 Apr 2021 10:15:33 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Mon, 19 Apr 2021 10:15:33 -0500
Received: from [10.250.50.222] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 13JFFXlE081842;
	Mon, 19 Apr 2021 10:15:33 -0500
Subject: Re: [meta-ti] [dunfell/master PATCH v2 4/6] conf: k2g-evm: Remove non-existent dtb* from 5.10
To: Suman Anna <s-anna@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, Lokesh Vutla <lokeshvutla@ti.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>, <meta-ti@lists.yoctoproject.org>
References: <20210416050600.16593-1-praneeth@ti.com>
 <20210416050600.16593-5-praneeth@ti.com>
 <e265111a-7169-cdc6-4d5f-0df4804c2725@ti.com>
From: "praneeth" <praneeth@ti.com>
Message-ID: <7f56c37c-1631-c991-14ca-f95728fb4a1e@ti.com>
Date: Mon, 19 Apr 2021 10:15:33 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <e265111a-7169-cdc6-4d5f-0df4804c2725@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 4/19/2021 10:04 AM, Suman Anna wrote:
> Hi Praneeth,
> 
> On 4/16/21 12:05 AM, praneeth via lists.yoctoproject.org wrote:
>> From: Praneeth Bajjuri <praneeth@ti.com>
>>
>> Remove the non-existent dtb* , as they are not currently present on
>> ti-linux-5.10.y.
>>
>> -    keystone-k2g-evm-lcd.dtb
>> -    keystone-k2g-ice.dtb
> 

Thanks, for review.. will take care of keystone-k2g-ice.dtb in next 
version and before pulling to dunfell branch

keystone-k2g-evm-lcd.dtb i dont see in 5.10 kernel

> FWIW, keystone-k2g-ice.dtb is not an overlay, and is present even on upstream
> kernel. Why are you removing this?
> 
> regards
> Suman
> 
>>
>> Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
>> ---
>>   conf/machine/k2g-evm.conf | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/conf/machine/k2g-evm.conf b/conf/machine/k2g-evm.conf
>> index 7681a752..e032068e 100644
>> --- a/conf/machine/k2g-evm.conf
>> +++ b/conf/machine/k2g-evm.conf
>> @@ -6,7 +6,7 @@ require conf/machine/include/k2g.inc
>>   
>>   MACHINE_FEATURES += "alsa"
>>   
>> -KERNEL_DEVICETREE = "keystone-k2g-evm.dtb keystone-k2g-evm-lcd.dtb keystone-k2g-ice.dtb \
>> +KERNEL_DEVICETREE = "keystone-k2g-evm.dtb \
>>                        ${@oe.utils.conditional('ENABLE_TI_UIO_DEVICES', '1', 'keystone-k2g-ice-pru-excl-uio.dtb', '', d)}"
>>   
>>   UBOOT_MACHINE = "k2g_evm_config"
>>
>>
>>
>> 
>>
> 
