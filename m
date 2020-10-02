Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web12.7777.1601628000619175208
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 02 Oct 2020 01:40:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=tzOmqWTI;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: rogerq@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0928dxYT023735
	for <meta-ti@lists.yoctoproject.org>; Fri, 2 Oct 2020 03:39:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1601627999;
	bh=eTRWqPG9zcCof6JcdS4LbabolUcKK2tA6YiAXcSV/oc=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=tzOmqWTIxMywJZlXdZmATN+xH63Y0zZHBxjMHrgF1Hr7rN6brI1UOaW78FCEg8EUQ
	 x58cBhZewsj+xTUYhY0DZw3/ZBItyrCyrvA6nSEBryyzWxzSjiXDIFmYqcpbiglTkL
	 CCXqQ44Waqbnu1/I/GIAb+Jc7jCDinuZVEQWLqbU=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0928dxGB128025
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 2 Oct 2020 03:39:59 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 2 Oct
 2020 03:39:59 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 2 Oct 2020 03:39:58 -0500
Received: from [192.168.2.14] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0928duTF081366;
	Fri, 2 Oct 2020 03:39:57 -0500
Subject: Re: [PATCH] prueth-fw-am65x-sr2: update AM65 sr2.0 PRU ethernet firmware
To: Denys Dmytriyenko <denys@ti.com>
CC: "meta-ti@lists.yoctoproject.org" <meta-ti@lists.yoctoproject.org>,
        "Nori,
 Sekhar" <nsekhar@ti.com>, "Murphy, Dan" <dmurphy@ti.com>
References: <20200925075118.4861-1-rogerq@ti.com>
 <20200925203812.GE14006@beryl> <21f6545c-2a2b-31f3-4cc6-ea89024618ff@ti.com>
 <195ce1128d74495e99012d7c695c213c@ti.com> <20201001234203.GN7434@beryl>
From: "Roger Quadros" <rogerq@ti.com>
Message-ID: <4d077b95-8e57-7fb9-2743-fb7fe700a84c@ti.com>
Date: Fri, 2 Oct 2020 11:39:55 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201001234203.GN7434@beryl>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Denys,

On 02/10/2020 02:42, Denys Dmytriyenko wrote:
> Roger,
> 
> I think SRCREV should be 534ae9bba2481d76b3284a6df46baaffb8688e57:
> https://git.ti.com/cgit/processor-firmware/ti-linux-firmware/commit/?h=ti-linux-firmware&id=534ae9bba2481d76b3284a6df46baaffb8688e57

You are right. I made a copy paste error.

I think we can drop this patch since the f/w version got bumped again.
I will send a fresh patch once the patch is accepted in ti-linux-firmware
http://dflvsu0004.dal.design.ti.com/patch/57720/

> 
> Also, do you want to update PV from 2.2.0.2-rc1 to 2.2.4.2?
> 

currently it is
PV = "2.2.0.1+2.2.0.2-rc1"

So for the new patch it should be
PV = "2.2.7.2"
correct?

cheers,
-roger
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
