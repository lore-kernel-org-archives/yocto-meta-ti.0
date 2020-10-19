Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web12.12893.1603113956659534241
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 19 Oct 2020 06:25:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=DObVljMl;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: rogerq@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09JDPswH034720
	for <meta-ti@lists.yoctoproject.org>; Mon, 19 Oct 2020 08:25:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1603113954;
	bh=wfVRM5OsRq2R+HE7GUU+2UKEJ42wTMnYa9jdVh/0+9s=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=DObVljMlQdpf97IjyU0G1qjNUuFUvEYMY7ofrtYM/y43l6Qhhjau9l8ZaefEHceNw
	 bfDqzbFbpEddc8qxr9tjDaKmK9AmOZ8sDS4ts7gsCaBvKpj9oWVw7mNCZWBI/r8Q80
	 vX5fLL5s6/+ThKt0a2wWIgrXYMQVMSM+VTEVzjQA=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09JDPsXW101716
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 19 Oct 2020 08:25:54 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 19
 Oct 2020 08:25:54 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 19 Oct 2020 08:25:54 -0500
Received: from [192.168.2.14] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09JDPqpS101394;
	Mon, 19 Oct 2020 08:25:53 -0500
Subject: Re: [dunfell/master PATCH] prusw-fw: Update the firmware to 3.1.6 version
To: Dan Murphy <dmurphy@ti.com>, <meta-ti@lists.yoctoproject.org>,
        <denys@ti.com>
CC: <nsekhar@ti.com>, <vigneshr@ti.com>, <lokeshvutla@ti.com>
References: <20201019083620.6665-1-rogerq@ti.com>
 <81f7e96e-2141-acca-f6b3-760198ae1cb7@ti.com>
From: "Roger Quadros" <rogerq@ti.com>
Message-ID: <7d507f23-e31c-4bc5-a923-8b88e91c30a8@ti.com>
Date: Mon, 19 Oct 2020 16:25:52 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <81f7e96e-2141-acca-f6b3-760198ae1cb7@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Dan,

On 19/10/2020 14:36, Dan Murphy wrote:
> Roger
> 
> On 10/19/20 3:36 AM, Roger Quadros wrote:
>> Update the firmware to version 3.1.6
> 
> Thanks for the patch this one was already submitted
> 
> http://dflvsu0004.dal.design.ti.com/patch/57940/

Thank you. Please ignore my patch.

> 
> Dan
> 

cheers,
-roger

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
