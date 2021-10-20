Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web08.2287.1634758317502426315
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 20 Oct 2021 12:31:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=tkrV5e18;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: yogeshs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 19KJVr3X087285;
	Wed, 20 Oct 2021 14:31:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1634758313;
	bh=28LQtQkdNSdC5HFER3OdFxvzEoIzGyFN3+AomAl+sp8=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=tkrV5e188sHucbzghZQ39oQ1FmRjf27dNKz7gz+zlONqIMO+cpuzcFzMLc+BI0YpW
	 YKgeMEEDmWBnVlz3eatRhnlQY6/qGuN6x1vKkZD7+bvfcPNHeQ5GjwgTBF7HNlUhpa
	 MznDpPVMA5h8xDM/Fas74Trr7Z0wXgXESPncze8k=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 19KJVrr7060487
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 20 Oct 2021 14:31:53 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 20
 Oct 2021 14:31:53 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 20 Oct 2021 14:31:53 -0500
Received: from [10.250.35.146] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 19KJVqIG082393;
	Wed, 20 Oct 2021 14:31:53 -0500
Subject: Re: [meta-ti][dunfell][PATCH] ti-sci-fw_git: Fix issue with using gp*.bin for TISCI firmware
To: Denys Dmytriyenko <denis@denix.org>
CC: Praneeth Bajjuri <praneeth@ti.com>, <meta-ti@lists.yoctoproject.org>
References: <20211020045220.49228-1-yogeshs@ti.com>
 <20211020191301.GX10132@denix.org>
From: "Yogesh Siraswar" <yogeshs@ti.com>
Message-ID: <c779a700-29c5-5317-c0c4-d5b62d1598fc@ti.com>
Date: Wed, 20 Oct 2021 14:31:52 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211020191301.GX10132@denix.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 10/20/2021 2:13 PM, Denys Dmytriyenko wrote:
> On Wed, Oct 20, 2021 at 04:52:20AM +0000, Yogesh Siraswar via lists.yoctoproject.org wrote:
>> With ti-sysfs also hosting *gp-cert.bin for am64x hs-fs breaks gp.
>> This patch removes * to directly reference the TISCI firmware
> 
> But wouldn't it in turn break HS platforms? That * was there specifically due
> to HS having multiple .bin files that need to be packaged.

Yes, it does. Need to machine specific override for GP and HS.

> 
> 
>> Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
>> ---
>>   recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
>> index ca56e1de..ef242476 100644
>> --- a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
>> +++ b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
>> @@ -28,7 +28,7 @@ SYSFW_SUFFIX ?= "unknown"
>>   
>>   SYSFW_BASE = "${SYSFW_PREFIX}-${SYSFW_SOC}-${SYSFW_SUFFIX}"
>>   
>> -SYSFW_TISCI = "${S}/ti-sysfw/${SYSFW_BASE}*.bin"
>> +SYSFW_TISCI = "${S}/ti-sysfw/${SYSFW_BASE}.bin"
>>   
>>   SYSFW_BINARY = "sysfw-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
>>   SYSFW_VBINARY = "sysfw-${PV}-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
>> -- 
>> 2.17.1
>>
> 
