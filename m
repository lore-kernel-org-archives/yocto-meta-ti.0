Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.217.1621289679949381733
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 17 May 2021 15:14:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=bvnWu8Lr;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: praneeth@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 14HMEcAx052920
	for <meta-ti@lists.yoctoproject.org>; Mon, 17 May 2021 17:14:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1621289678;
	bh=L92F8aiQmzXdbpGbjnI4streswSdsl5vPW2dVivRekM=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=bvnWu8Lr6SnAyajsdmC6WyPNTKz0wwSB3Mx/ak0wy38OfgHPrdiqWbG6naSEpL2h6
	 +j/YkwXlXX1BC5ZTX66Qdus21XjUv8VpHQQwtgQq2T2ejfSn/ltLBzlEYbglZn8+OJ
	 5a9jzxKeH0WzCqGBo0N+2zn3q1+0iuIIt6gABR+A=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 14HMEcBU076025
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 17 May 2021 17:14:38 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Mon, 17
 May 2021 17:14:38 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Mon, 17 May 2021 17:14:38 -0500
Received: from [10.247.25.23] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 14HMEc0r026309;
	Mon, 17 May 2021 17:14:38 -0500
Subject: Re: [dunfell/master PATCH] conf/machine: am64xx: Include SK dtb for machine am64xx-evm
To: Lokesh Vutla <lokeshvutla@ti.com>, <meta-ti@lists.yoctoproject.org>
References: <20210507142949.25741-1-lokeshvutla@ti.com>
 <01502adb-ab0f-4233-a8b7-9136521829cf@ti.com>
From: "praneeth" <praneeth@ti.com>
Message-ID: <bc05b1e0-0901-9b04-f9f2-b72e54de35d3@ti.com>
Date: Mon, 17 May 2021 17:14:38 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <01502adb-ab0f-4233-a8b7-9136521829cf@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 5/17/2021 3:08 AM, Lokesh Vutla wrote:
> Praneeth,
> 
> On 07/05/21 7:59 pm, Lokesh Vutla wrote:
>> As a step towards unification for am64xx-evm and am64xx-sk,
>> start including am64xx-sk dtb for machine=am64xx-evm.
>>
>> Once U-Boot merges support for unified bootloader, am64xx-sk
>> machine can be dropped.
>>
>> Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
> 
> Can you merge this patch?

This is already on dunfell-next.
I will sanity verify along with the associated new patch submitted for 
review and pull together to dunfell based on regression test.

> 
> Thanks and regards,
> Lokesh
> 
