Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.466.1637078668365129416
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 16 Nov 2021 08:04:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=c2CsCUX3;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: yogeshs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1AGG4QNQ055730;
	Tue, 16 Nov 2021 10:04:26 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1637078666;
	bh=HgoTrKy8Jq2BUSWQzM1oJYT529tvg62gEQWzVuxt/Ck=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=c2CsCUX3YMv81nSjvVTLNOQ+3ON5kv0CVAsJOJaVqVpITf0x7h8vl0zjmxXTgbLXs
	 11Fj5IVOrFTVT/sstxGJ5A0SuR9H4MCcrgnIzYKpAxQYcqlVEYKzhMdxEmbixv/EE5
	 zbSRGcgrz07riUSEODWcQy9TrNAgPXyNAJ6Gn9Q8=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1AGG4QjS123888
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 16 Nov 2021 10:04:26 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 16
 Nov 2021 10:04:25 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 16 Nov 2021 10:04:25 -0600
Received: from [10.250.38.249] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1AGG4PjA058031;
	Tue, 16 Nov 2021 10:04:25 -0600
Message-ID: <fe50367e-f304-1e96-9f01-3e8a5a414c19@ti.com>
Date: Tue, 16 Nov 2021 10:04:25 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [meta-ti][dunfell][PATCH 1/2] conf: machine: am64xx: Add missing dtbo
To: Vignesh Raghavendra <vigneshr@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20211115171811.34908-1-yogeshs@ti.com>
 <7a6bba7e-49b0-7fc8-4fc8-3bbb2ae204d4@ti.com>
From: "Yogesh Siraswar" <yogeshs@ti.com>
In-Reply-To: <7a6bba7e-49b0-7fc8-4fc8-3bbb2ae204d4@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Language: en-US
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 11/16/2021 4:59 AM, Vignesh Raghavendra wrote:
> 
> 
> On 11/15/21 10:48 PM, Yogesh Siraswar via lists.yoctoproject.org wrote:
>> Add missing k3-am642-evm-nand.dtbo required for system test
>>
>> Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
>> ---
>>   conf/machine/include/am64xx.inc | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/conf/machine/include/am64xx.inc b/conf/machine/include/am64xx.inc
>> index 95fdc79d..7646c70a 100644
>> --- a/conf/machine/include/am64xx.inc
>> +++ b/conf/machine/include/am64xx.inc
>> @@ -10,6 +10,7 @@ KERNEL_DEVICETREE = " \
>>       ti/k3-am642-evm.dtb \
>>       ti/k3-am642-sk.dtb \
>>       ti/k3-am642-evm-icssg1-dualemac.dtbo \
>> +    ti/k3-am642-evm-nand.dtbo \
>>   "
> 
> 
> Just wondering why this list cannot be wild carded? Would avoid need to
> remember and add new dtbos to the list every time new dtbo is added in
> kernel.

I did reach out to Denys on this. Seems KERNEL_DEVICETREE is being used 
at multiple places not only for adding to deploy directory. I will let 
Denys comment.

> 
> Regards
> Vignesh
> 
