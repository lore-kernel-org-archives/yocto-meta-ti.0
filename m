Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.2486.1601595849801997906
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 01 Oct 2020 16:44:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=bNJ1RbbS;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: denys@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 091Ni9nH006295
	for <meta-ti@lists.yoctoproject.org>; Thu, 1 Oct 2020 18:44:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1601595849;
	bh=PZMC3vlZF7Cwzs+Y7EBhNLff6JDtH3Xu9JdZR+FpRKg=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=bNJ1RbbSF0MeVDxnjHPmdjFKpkA9eb8OCsPMdIsmBnczfyp44DVbF7L64Z/AkE3ac
	 QLueK9vz5iK1pFfg9zGCLRQkC/h0xX5jcG6FmCkK0zNVtTjSh1Xye54+NSHSFljgQ4
	 7Vs3LWtlIfF0i/Pdby7jJNgJCufeRV09O8fGcG74=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 091Ni9Af109265
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 1 Oct 2020 18:44:09 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 1 Oct
 2020 18:44:08 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 1 Oct 2020 18:44:08 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 091Ni89t089926;
	Thu, 1 Oct 2020 18:44:08 -0500
Date: Thu, 1 Oct 2020 19:44:08 -0400
From: "Denys Dmytriyenko" <denys@ti.com>
To: Roger Quadros <rogerq@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <nsekhar@ti.com>, <vigneshr@ti.com>,
        <lokeshvutla@ti.com>, <dmurphy@ti.com>
Subject: Re: [meta-ti][dunfell/master PATCH 2/2] prusw-fw: Update the firmware to 3.1.4 version
Message-ID: <20201001234408.GP7434@beryl>
References: <20201001135321.7470-1-rogerq@ti.com>
 <20201001135321.7470-3-rogerq@ti.com>
MIME-Version: 1.0
In-Reply-To: <20201001135321.7470-3-rogerq@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Oct 01, 2020 at 04:53:21PM +0300, Roger Quadros wrote:
> Update the firmware to version 3.1.4
> 
> Signed-off-by: Roger Quadros <rogerq@ti.com>

Reviewed-by: Denys Dmytriyenko <denys@ti.com>


> ---
>  recipes-bsp/prusw-fw/{prusw-fw_3.0.3.bb => prusw-fw_3.1.4.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename recipes-bsp/prusw-fw/{prusw-fw_3.0.3.bb => prusw-fw_3.1.4.bb} (94%)
> 
> diff --git a/recipes-bsp/prusw-fw/prusw-fw_3.0.3.bb b/recipes-bsp/prusw-fw/prusw-fw_3.1.4.bb
> similarity index 94%
> rename from recipes-bsp/prusw-fw/prusw-fw_3.0.3.bb
> rename to recipes-bsp/prusw-fw/prusw-fw_3.1.4.bb
> index 6eac87c5..b8897e4b 100644
> --- a/recipes-bsp/prusw-fw/prusw-fw_3.0.3.bb
> +++ b/recipes-bsp/prusw-fw/prusw-fw_3.1.4.bb
> @@ -11,7 +11,7 @@ COMPATIBLE_MACHINE = "ti33x|ti43x|am57xx-evm|am57xx-hs-evm"
>  
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
> -SRCREV = "7ba9722b74608ad4472790972917e1205eb3c049"
> +SRCREV = "b19bf13a16d7f5c1260cf4d48cf967e5c7e15128"
>  BRANCH ?= "ti-linux-firmware"
>  
>  SRC_URI = "git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=git;branch=${BRANCH}"
> -- 
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
> 
