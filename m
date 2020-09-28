Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.30868.1601275112167538434
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 27 Sep 2020 23:38:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=ZSW40Jfu;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: rogerq@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08S6cVns125889
	for <meta-ti@lists.yoctoproject.org>; Mon, 28 Sep 2020 01:38:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1601275111;
	bh=O+pkW9E06WePQZO9SNltTCmd3scH+rNexYHsTJWogQI=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=ZSW40Jfu/dpCKvI+L9dXRlLto6dZOyuI0pAEKJC70qfApuPkDe77/MtJG2sJp2BfB
	 yaWkDUrrN6/jBqiu5bjX1NfRrcmpCB8z+41OoAIhnOdd48m0A8sGH/Zjth36n6M3uO
	 +ECUedCWVFdx9eg94w3qG9EX7KqH9Wj78B9JB7rw=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 08S6cV2f043882
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 28 Sep 2020 01:38:31 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 28
 Sep 2020 01:38:30 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 28 Sep 2020 01:38:30 -0500
Received: from [192.168.2.14] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08S6cTRl110459;
	Mon, 28 Sep 2020 01:38:29 -0500
Subject: Re: [PATCH] prueth-fw-am65x-sr2: update AM65 sr2.0 PRU ethernet firmware
To: Denys Dmytriyenko <denys@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <nsekhar@ti.com>, <dmurphy@ti.com>
References: <20200925075118.4861-1-rogerq@ti.com>
 <20200925203812.GE14006@beryl>
From: "Roger Quadros" <rogerq@ti.com>
Message-ID: <21f6545c-2a2b-31f3-4cc6-ea89024618ff@ti.com>
Date: Mon, 28 Sep 2020 09:38:28 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200925203812.GE14006@beryl>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Denys,

On 25/09/2020 23:38, Denys Dmytriyenko wrote:
> Is it v2? What's the difference from v1? I already merged v1 to dunfell-next -
> should I drop it and merge this one instead?

There is no difference. Your merge is fine. Thanks!

cheers,
-roger
> 
> 
> On Fri, Sep 25, 2020 at 10:51:18AM +0300, Roger Quadros wrote:
>> Update to release REL.PRU-ICSS-PROFINET-SWITCH_02.02.04.02
>>
>> Signed-off-by: Roger Quadros <rogerq@ti.com>
>> ---
>>   recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb b/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb
>> index 6e17c4aa..734ca9c1 100644
>> --- a/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb
>> +++ b/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb
>> @@ -11,7 +11,7 @@ COMPATIBLE_MACHINE = "am65xx-evm"
>>   
>>   PACKAGE_ARCH = "${MACHINE_ARCH}"
>>   
>> -SRCREV = "ea4bf53ba0a4a30bb7e0e8b6138fdb22fe50372a"
>> +SRCREV = "80a55e27024ad52433509e056e70e0e767a56038"
>>   BRANCH ?= "ti-linux-firmware"
>>   
>>   SRC_URI = "git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=git;branch=${BRANCH}"
>> -- 
>> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
>> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
>>

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
