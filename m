Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web12.508.1601595831625296827
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 01 Oct 2020 16:43:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=rkw5Vxhu;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: denys@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 091Nhoc3006257
	for <meta-ti@lists.yoctoproject.org>; Thu, 1 Oct 2020 18:43:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1601595830;
	bh=kgLX1W9wVs6GOtKS2NqzyfuKjy1Gj+/VlZo6R1JJ9UA=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=rkw5Vxhu73KWzq07DsIDQo8GlGAYE5pxjOsjZtrVJbkcLZZhQL4PmWAm2sK0WE9N3
	 2ckeoxvjsg/i/ZBYxGZl35G5ALdFKQTxC0acEIEyqfVWYoA8Hu9fcQgy4dZ1LcSpen
	 ANbXAq0vPVQzwqsy5+i7W9i4hnXPCuI/3dNNUyb0=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 091NhoPJ117978
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 1 Oct 2020 18:43:50 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 1 Oct
 2020 18:43:50 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 1 Oct 2020 18:43:50 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 091Nhoam043290;
	Thu, 1 Oct 2020 18:43:50 -0500
Date: Thu, 1 Oct 2020 19:43:50 -0400
From: "Denys Dmytriyenko" <denys@ti.com>
To: Roger Quadros <rogerq@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <nsekhar@ti.com>, <vigneshr@ti.com>,
        <lokeshvutla@ti.com>, <dmurphy@ti.com>
Subject: Re: [meta-ti][dunfell/master PATCH 1/2] prueth-fw: Update the firmware to 5.3.9 version
Message-ID: <20201001234349.GO7434@beryl>
References: <20201001135321.7470-1-rogerq@ti.com>
 <20201001135321.7470-2-rogerq@ti.com>
MIME-Version: 1.0
In-Reply-To: <20201001135321.7470-2-rogerq@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Oct 01, 2020 at 04:53:20PM +0300, Roger Quadros wrote:
> Update the firmware to version 5.3.9
> 
> Signed-off-by: Roger Quadros <rogerq@ti.com>

Reviewed-by: Denys Dmytriyenko <denys@ti.com>


> ---
>  .../prueth-fw/{prueth-fw_5.2.8.bb => prueth-fw_5.3.9.bb}        | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename recipes-bsp/prueth-fw/{prueth-fw_5.2.8.bb => prueth-fw_5.3.9.bb} (94%)
> 
> diff --git a/recipes-bsp/prueth-fw/prueth-fw_5.2.8.bb b/recipes-bsp/prueth-fw/prueth-fw_5.3.9.bb
> similarity index 94%
> rename from recipes-bsp/prueth-fw/prueth-fw_5.2.8.bb
> rename to recipes-bsp/prueth-fw/prueth-fw_5.3.9.bb
> index 04a32dad..ec9d7ffc 100644
> --- a/recipes-bsp/prueth-fw/prueth-fw_5.2.8.bb
> +++ b/recipes-bsp/prueth-fw/prueth-fw_5.3.9.bb
> @@ -11,7 +11,7 @@ COMPATIBLE_MACHINE = "ti33x|ti43x|am57xx-evm|am57xx-hs-evm"
>  
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
> -SRCREV = "48e2c46ff62d796345b6587be58f88f0e608addc"
> +SRCREV = "b19bf13a16d7f5c1260cf4d48cf967e5c7e15128"
>  BRANCH ?= "ti-linux-firmware"
>  
>  SRC_URI = "git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=git;branch=${BRANCH}"
> -- 
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
> 
