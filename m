Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.7038.1601066293899835638
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 25 Sep 2020 13:38:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=EDJAGEff;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: denys@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08PKcDIa083181
	for <meta-ti@lists.yoctoproject.org>; Fri, 25 Sep 2020 15:38:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1601066293;
	bh=sh7E+oZ5o2JHvinGJK3n++hkGG+JEC2Iepzie14Y9BU=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=EDJAGEff0dIuCfxVo1UB4rtytmWcEDt/WZc8AczPM2iorPhC62AS7JwEQ9unMpxD5
	 O2pfjt3/B9oHAp/jukIkMWioNPk4lAjKxBMp2Q1K6Ta5CGXkJAafYJ5rwxr0uLIHBj
	 G0/KXmXtb6KbOq9z48ONQIhI2xvHTiFVadt96Mok=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 08PKcDeG116601
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 25 Sep 2020 15:38:13 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 25
 Sep 2020 15:38:12 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 25 Sep 2020 15:38:12 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08PKcCuH075747;
	Fri, 25 Sep 2020 15:38:12 -0500
Date: Fri, 25 Sep 2020 16:38:12 -0400
From: "Denys Dmytriyenko" <denys@ti.com>
To: Roger Quadros <rogerq@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <nsekhar@ti.com>, <dmurphy@ti.com>
Subject: Re: [PATCH] prueth-fw-am65x-sr2: update AM65 sr2.0 PRU ethernet firmware
Message-ID: <20200925203812.GE14006@beryl>
References: <20200925075118.4861-1-rogerq@ti.com>
MIME-Version: 1.0
In-Reply-To: <20200925075118.4861-1-rogerq@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Is it v2? What's the difference from v1? I already merged v1 to dunfell-next - 
should I drop it and merge this one instead?


On Fri, Sep 25, 2020 at 10:51:18AM +0300, Roger Quadros wrote:
> Update to release REL.PRU-ICSS-PROFINET-SWITCH_02.02.04.02
> 
> Signed-off-by: Roger Quadros <rogerq@ti.com>
> ---
>  recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb b/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb
> index 6e17c4aa..734ca9c1 100644
> --- a/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb
> +++ b/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb
> @@ -11,7 +11,7 @@ COMPATIBLE_MACHINE = "am65xx-evm"
>  
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
> -SRCREV = "ea4bf53ba0a4a30bb7e0e8b6138fdb22fe50372a"
> +SRCREV = "80a55e27024ad52433509e056e70e0e767a56038"
>  BRANCH ?= "ti-linux-firmware"
>  
>  SRC_URI = "git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=git;branch=${BRANCH}"
> -- 
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
> 
