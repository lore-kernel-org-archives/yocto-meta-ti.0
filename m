Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web12.8762.1604031598219020482
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 29 Oct 2020 21:19:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=F0x3mKLm;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: s-anna@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09U4JvoE018451;
	Thu, 29 Oct 2020 23:19:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1604031597;
	bh=eczVpujRWXpAdBxyczUpPR0WrN/uJ1khIklmPoSRlRc=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=F0x3mKLmJGfA20slo4ghlHG1VRG1zgHIuQEAO0iGcBS0fXkyGM5Ui8l+CkrXjluHF
	 0sMnzt/YugVdRCuSHyTVgb8HMTYZk7vnayoaHxmqVFMHK8v1MgRhjqXl3kwVxdg5a5
	 NJYH89YWHgOOaWTFZUhR+uAMOYFdgNK+Fgsr0f9Y=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09U4JvUc024477
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 29 Oct 2020 23:19:57 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 29
 Oct 2020 23:19:56 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 29 Oct 2020 23:19:56 -0500
Received: from [10.250.64.251] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09U4Ju4I038823;
	Thu, 29 Oct 2020 23:19:56 -0500
Subject: Re: [meta-ti] [PATCH v2 2/2] ti-rpmsg-char: Mark these recipes to be TI SOC specific
To: <denys@ti.com>, Khem Raj <raj.khem@gmail.com>
CC: <meta-ti@lists.yoctoproject.org>
References: <20201030014601.395106-1-raj.khem@gmail.com>
 <20201030014601.395106-2-raj.khem@gmail.com> <20201030041526.GT15849@beryl>
From: "Suman Anna" <s-anna@ti.com>
Message-ID: <a567be43-b5d5-13b9-4e78-6baf31bcb7b8@ti.com>
Date: Thu, 29 Oct 2020 23:19:56 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201030041526.GT15849@beryl>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 10/29/20 11:15 PM, Denys Dmytriyenko via lists.yoctoproject.org wrote:
> On Thu, Oct 29, 2020 at 06:46:01PM -0700, Khem Raj wrote:
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> 
> Reviewed-by: Denys Dmytriyenko <denys@ti.com>

Adding mine back again,

Reviewed-by: Suman Anna <s-anna@ti.com>

regards
Suman

> 
> 
>> ---
>>  recipes-ti/ipc/ti-rpmsg-char.inc | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/recipes-ti/ipc/ti-rpmsg-char.inc b/recipes-ti/ipc/ti-rpmsg-char.inc
>> index b41e68eb..d08031cb 100644
>> --- a/recipes-ti/ipc/ti-rpmsg-char.inc
>> +++ b/recipes-ti/ipc/ti-rpmsg-char.inc
>> @@ -13,3 +13,6 @@ SRCREV = "9be402c2bf4053900b6b9a8092fbb42e7e303108"
>>  PV = "0.1.0+git${SRCPV}"
>>  
>>  S = "${WORKDIR}/git"
>> +
>> +COMPATIBLE_HOST ?= "null"
>> +COMPATIBLE_HOST_ti-soc = "(.*)"
>> -- 
>> 2.29.1
>>
> 
>>
>>
>>
> 
> 
> 
> 
> 

