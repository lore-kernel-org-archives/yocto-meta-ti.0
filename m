Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web12.2696.1601020183796162972
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 25 Sep 2020 00:49:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=l8u73bHN;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: rogerq@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08P7ngFg078016
	for <meta-ti@lists.yoctoproject.org>; Fri, 25 Sep 2020 02:49:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1601020182;
	bh=1xYY0OP5gbd9UZ9D1a+mS/rUy1ymSHoauA0BiooLLiI=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=l8u73bHNhwgOaIdPe8TtAxBoFWuExEe+9V/EhblWSgSMACcdA9I6slBUlK8vpu0u2
	 LvusHHvqn0deEyBjKZbLfPycFoAlXWWblrjowizkTaDKNRBH5iffU7HdzFkco7DLh/
	 m9S3dWF0B665AEDg5P63sKyggTkFQop9LtxK6ZhM=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 08P7ng6B130880
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 25 Sep 2020 02:49:42 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 25
 Sep 2020 02:49:42 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 25 Sep 2020 02:49:42 -0500
Received: from [192.168.2.14] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08P7neZI096750;
	Fri, 25 Sep 2020 02:49:41 -0500
Subject: Re: [meti-ti][dunfell][PATCH] prueth-fw-am65x-sr2: update AM65 SR2.0 PRU ethernet firmware
To: <meta-ti@lists.yoctoproject.org>
CC: <denys@ti.com>, <nsekhar@ti.com>, <dmurphy@ti.com>
References: <20200924134440.18133-1-rogerq@ti.com>
 <20200924134440.18133-2-rogerq@ti.com>
From: "Roger Quadros" <rogerq@ti.com>
Message-ID: <2bce7439-de40-95ef-15e9-dc38e62bee53@ti.com>
Date: Fri, 25 Sep 2020 10:49:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200924134440.18133-2-rogerq@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi,

Please ignore this patch. It was sent by error.

cheers,
-roger

On 24/09/2020 16:44, Roger Quadros wrote:
> Update to release REL.PRU-ICSS-PROFINET-SWITCH_02.02.04.02
> 
> Signed-off-by: Roger Quadros <rogerq@ti.com>
> ---
>   recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb b/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb
> index 6e17c4aa..734ca9c1 100644
> --- a/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb
> +++ b/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb
> @@ -11,7 +11,7 @@ COMPATIBLE_MACHINE = "am65xx-evm"
>   
>   PACKAGE_ARCH = "${MACHINE_ARCH}"
>   
> -SRCREV = "ea4bf53ba0a4a30bb7e0e8b6138fdb22fe50372a"
> +SRCREV = "80a55e27024ad52433509e056e70e0e767a56038"
>   BRANCH ?= "ti-linux-firmware"
>   
>   SRC_URI = "git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=git;branch=${BRANCH}"
> 

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
