Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.8787.1614927998456683213
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 04 Mar 2021 23:06:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=AIl8vsM1;
 spf=fail (domain: ti.com, ip: 198.145.29.25, mailfrom: lokeshvutla@ti.com)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 0D8B038C0655
	for <meta-ti@yoctoproject.org>; Fri,  5 Mar 2021 07:06:36 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12574Vat039464;
	Fri, 5 Mar 2021 01:04:31 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1614927871;
	bh=Tl6UpmgoHJlLC4ggkm7e9lB+7HIWI1Lg/KO7itGgdkM=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=AIl8vsM1Hoq882m7mpWn0OYQD1dvF2Arz+A6/RIWoneuvVLc2hbYiLcIxj46WG/rT
	 y7C2JxDtF/oTYW4P/grwMGWvyJiFQGDOyzvYojeLSK/vV7F+m8TfyVNZIK8H6YHdTD
	 9/oLyt95dHlZ4aOEk/9fPp6UjlKzOS8Czkb8hEF0=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12574VX1031803
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 5 Mar 2021 01:04:31 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 5 Mar
 2021 01:04:30 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 5 Mar 2021 01:04:30 -0600
Received: from [10.24.69.20] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 12574Sw7023020;
	Fri, 5 Mar 2021 01:04:29 -0600
Subject: Re: [EXTERNAL,dunfell] ti-rtos: Fix J7200 builds by dropping evm
To: "Nishanth Menon via lists.yoctoproject.org"
	<nm=ti.com@lists.yoctoproject.org>,
        meta-ti <meta-ti@yoctoproject.org>
CC: Denys Dmytriyenko <denis@denix.org>,
        "Bajjuri, Praneeth"
	<praneeth@ti.com>, Nishanth Menon <nm@ti.com>
References: <20210305064155.5125-1-nm@ti.com>
From: "Lokesh Vutla" <lokeshvutla@ti.com>
Message-ID: <31751cf2-ce18-5e68-57e8-58f347865683@ti.com>
Date: Fri, 5 Mar 2021 12:34:27 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210305064155.5125-1-nm@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 05/03/21 6:11 pm, Nishanth Menon via lists.yoctoproject.org wrote:
> "evm" prefix messes up the pattern matchup for J7200 and falls back into
> default, as a result, we attempt to pull [1] instead of [2].
> 
> [1] https://software-dl.ti.com/jacinto7/esd/processor-sdk-rtos-jacinto7/firmware/07_03_00_12/coresdk_rtos_j7200_07_03_00_12_firmware.tar.xz
> [2] https://software-dl.ti.com/jacinto7/esd/processor-sdk-rtos-jacinto7/firmware/07_03_00_10/coresdk_rtos_j7200_07_03_00_12_firmware.tar.xz
> 
> Fixes: 77cdfa9f6560 ("ti-rtos: Update metadata and versions for RTOS firmware")
> Signed-off-by: Nishanth Menon <nm@ti.com>

For the sake of completeness can you add default web link for j7200? I still
couldn't figure out how the weblink is populated when default is undefined.

  DEFAULT_RTOS_WEBLINK_j7200 =
"https://software-dl.ti.com/jacinto7/esd/processor-sdk-rtos-jacinto7/firmware/${CORESDK_RTOS_VERSION}"

However, for the patch

Tested-by: Lokesh Vutla <lokeshvutla@ti.com>

Thanks and regards,
Lokesh



> 
> ---
> recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb | 4 ++--
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
> 
