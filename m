Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.8666.1614926758109099213
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 04 Mar 2021 22:45:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=jVwwPUju;
 spf=fail (domain: ti.com, ip: 198.145.29.25, mailfrom: nm@ti.com)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 9C70538C064F
	for <meta-ti@yoctoproject.org>; Fri,  5 Mar 2021 06:45:57 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1256jskj032408;
	Fri, 5 Mar 2021 00:45:54 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1614926754;
	bh=M73dBxpIxzcsruJ++V9GxwWVmaBSXvakAwZ2yy70IgU=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=jVwwPUjuHrjVUccvPUD1QK+qSTeKZx8QlFGJ/tUrNhSzISaXz5+ZsLJzo6h2mjMx+
	 aHtMN6oPdBLYJ2su6n+kGlf1s9M+/suUBw0T3ZZfbkk9Fo/ePzuUHaM5tgmmucGYEO
	 1bOmeAIgxCO/J2aNlsK19QEj78ujH1074y0cuvOQ=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1256jsBP037167
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 5 Mar 2021 00:45:54 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 5 Mar
 2021 00:45:54 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 5 Mar 2021 00:45:53 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1256jrQs093123;
	Fri, 5 Mar 2021 00:45:53 -0600
Date: Fri, 5 Mar 2021 00:45:53 -0600
From: "Nishanth Menon" <nm@ti.com>
To: meta-ti <meta-ti@yoctoproject.org>
CC: Denys Dmytriyenko <denis@denix.org>, "Bajjuri, Praneeth" <praneeth@ti.com>
Subject: Re: [PATCH dunfell] ti-rtos: Fix J7200 builds by dropping evm
Message-ID: <20210305064553.3pc6etlxil5noztr@collide>
References: <20210305064155.5125-1-nm@ti.com>
MIME-Version: 1.0
In-Reply-To: <20210305064155.5125-1-nm@ti.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On 00:41-20210305, Nishanth Menon wrote:
> "evm" prefix messes up the pattern matchup for J7200 and falls back into
> default, as a result, we attempt to pull [1] instead of [2].
> 
> [1] https://software-dl.ti.com/jacinto7/esd/processor-sdk-rtos-jacinto7/firmware/07_03_00_12/coresdk_rtos_j7200_07_03_00_12_firmware.tar.xz
> [2] https://software-dl.ti.com/jacinto7/esd/processor-sdk-rtos-jacinto7/firmware/07_03_00_10/coresdk_rtos_j7200_07_03_00_12_firmware.tar.xz

^^ above link should have been:
https://software-dl.ti.com/jacinto7/esd/processor-sdk-rtos-jacinto7/firmware/07_03_00_10/coresdk_rtos_j7200_07_03_00_10_firmware.tar.xz

if you need me to send a v2 with fixups, i can.. or if that is the only
comment, then might be helpful to get a fixup while applying..

> 
> Fixes: 77cdfa9f6560 ("ti-rtos: Update metadata and versions for RTOS firmware")
> Signed-off-by: Nishanth Menon <nm@ti.com>
> ---
>  recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> index ed62b876e4db..dffd51abda66 100644
> --- a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> +++ b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> @@ -31,7 +31,7 @@ DEFAULT_RTOS_VERSION_DOT_am65xx = "07.03.00.10"
>  
>  DEFAULT_RTOS_SOC = "undefined"
>  DEFAULT_RTOS_SOC_j7 = "j721e"
> -DEFAULT_RTOS_SOC_j7200-evm = "j7200"
> +DEFAULT_RTOS_SOC_j7200 = "j7200"
>  DEFAULT_RTOS_SOC_am65xx = "am65xx"
>  DEFAULT_RTOS_SOC_am64xx = "am64x"
>  
> @@ -47,7 +47,7 @@ DEFAULT_FIRMWARE_URL_k3 = "${CORESDK_RTOS_WEBLINK}/${DEFAULT_FIRMWARE_FILE}"
>  
>  DEFAULT_FIRMWARE_SHA256SUM = "unknown"
>  DEFAULT_FIRMWARE_SHA256SUM_j7 = "69cc16c30c895fe813002bd7bdb3d30e6ca622d86b008a6bf6e2a24b86550969"
> -DEFAULT_FIRMWARE_SHA256SUM_j7200-evm = "a16865d928b2b00bfca64e0c41b02dcfc0ac8ec1ce125fbfd3581a1c610847f8"
> +DEFAULT_FIRMWARE_SHA256SUM_j7200 = "a16865d928b2b00bfca64e0c41b02dcfc0ac8ec1ce125fbfd3581a1c610847f8"
>  DEFAULT_FIRMWARE_SHA256SUM_am65xx = "aa121c10d3099dd61ef898717245ecee25b501170607c9a95afd741e05783a5d"
>  DEFAULT_FIRMWARE_SHA256SUM_am64xx = "9e9efeef0b1dbb101de97e58cfda8bf052a697f2ea635fdf6ca5158fffdc212b"
>  
> -- 
> 2.25.1.377.g2d2118b814c1
> 

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
