Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.16831.1601997292537336285
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 06 Oct 2020 08:14:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=N5+hbSJl;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: rogerq@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 096FEpBi117951
	for <meta-ti@lists.yoctoproject.org>; Tue, 6 Oct 2020 10:14:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1601997291;
	bh=yPWjw49cqgoSmekDeNPjRHQITLsKnqoXjW4mtA59+0M=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=N5+hbSJlD9R7wr6sFm8LDFAzhTfOWcP0fyGNA1Njhj0V/YtGxCOVbh0Cte+wVxQpV
	 rTpmQu8Gjd9FvE22ko1Nn+ERER2UnEv2orZvbmPm3k3hrit07+3O3EUmVu70l3XvKE
	 cS9NCdKwoQIpuTjldpajWA9Ex4DyLBfzYR0CeBpU=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 096FEpEY127900
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Tue, 6 Oct 2020 10:14:51 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 6 Oct
 2020 10:14:51 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 6 Oct 2020 10:14:51 -0500
Received: from [192.168.2.14] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 096FEmYl089384;
	Tue, 6 Oct 2020 10:14:49 -0500
Subject: Re: [dunfell/master PATCH] prueth-fw-am65x-sr2: update AM65 SR2.0 PRU ethernet firmware
To: Dan Murphy <dmurphy@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: <denys@ti.com>, <nsekhar@ti.com>, <vigneshr@ti.com>, <lokeshvutla@ti.com>
References: <20201006082310.5161-1-rogerq@ti.com>
 <000d4e4a-37f2-67b3-9af9-a08b20d8d034@ti.com>
From: "Roger Quadros" <rogerq@ti.com>
Message-ID: <76af0979-96e2-a1df-e9a8-387855b43310@ti.com>
Date: Tue, 6 Oct 2020 18:14:48 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <000d4e4a-37f2-67b3-9af9-a08b20d8d034@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Dan,

On 06/10/2020 14:45, Dan Murphy wrote:
> Roger
> 
> On 10/6/20 3:23 AM, Roger Quadros wrote:
>> Update to release REL.PRU-ICSS-PROFINET-SWITCH_02.02.07.02
> 
> Thanks for the patch but I did this yesterday
> 
> http://dflvsu0004.dal.design.ti.com/patch/57752/

Thanks. we can use that one instead.

cheers,
-roger
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
