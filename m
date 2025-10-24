Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ABA1CCF9E0
	for <webhook@archiver.kernel.org>; Fri, 24 Oct 2025 16:10:22 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.15355.1761322214308206326
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 24 Oct 2025 09:10:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=jAKFJHtF;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: reatmon@ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59OGABJ4781237;
	Fri, 24 Oct 2025 11:10:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1761322211;
	bh=4JUXMY8AloYVMWUXIucj7BlVyxhN2OvakJSM4Q0BP14=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=jAKFJHtFLusnbt2LAByjPdv0AN20zB/LF4BRgy8f2Co5WNXABpPGmuwRQssObL3ke
	 BnNcrEQ1sHCB1EShcTjBinPhaT7FNdZw8bLa77745zJueOBfHMF3B0CfvgkSxR0v4A
	 58py69v82qlYUXl1fRcF4mm6Y1lM3bJYRJjy/r/s=
Received: from DFLE208.ent.ti.com (dfle208.ent.ti.com [10.64.6.66])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59OGABQT3687739
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 24 Oct 2025 11:10:11 -0500
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 24 Oct
 2025 11:10:10 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 24 Oct 2025 11:10:10 -0500
Received: from [10.249.37.202] ([10.249.37.202])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59OGAApS582716;
	Fri, 24 Oct 2025 11:10:10 -0500
Message-ID: <9e4a1f0b-5ad5-4b09-b750-6244ab62b847@ti.com>
Date: Fri, 24 Oct 2025 11:10:10 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] meta-ti-bsp : ipc: update ti-librpmsg-dma srcrev &
 license
To: vishnu singh <v-singh1@ti.com>, <meta-ti@lists.yoctoproject.org>,
        <denis@denix.org>
References: <20251024155651.2688089-1-v-singh1@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20251024155651.2688089-1-v-singh1@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 24 Oct 2025 16:10:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19175



On 10/24/2025 10:56 AM, vishnu singh wrote:
> From: Vishnu Singh <v-singh1@ti.com>
> 
> Update recipe license to TI-TFL, use scarthgap branch
> Disable 2dfft and audio offload example build for rpmsg-dma library.
> 

Starting recently-ish in master, there is a new requirement that if you 
change any of the license information, you need to specify:

License-Update: explanation

https://docs.yoctoproject.org/contributor-guide/recipe-style-guide.html#license-updates


Please update the message and send a v2.


> Signed-off-by: Vishnu Singh <v-singh1@ti.com>
> ---
>   meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb b/meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb
> index b624871d..7600f867 100644
> --- a/meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb
> +++ b/meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb
> @@ -1,9 +1,9 @@
>   SUMMARY = "RPMsg DMA shared library"
> -LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=744e63d2bb8c6151dcdd97f49aa02c53"
> +LICENSE = "TI-TFL"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=91dc4ee6d125d0aaba4e5bd2fcc50ed3"
>   
> -SRC_URI = "git://github.com/TexasInstruments/rpmsg-dma.git;protocol=https;branch=main"
> -SRCREV = "609fd72f458ba56f80d06810509ef88d010d2c03"
> +SRC_URI = "git://github.com/TexasInstruments/rpmsg-dma.git;protocol=https;branch=scarthgap"
> +SRCREV = "33d20a5a488844ace45ffb9dbbad9f043c5c897f"
>   
>   S = "${WORKDIR}/git"
>   
> @@ -11,6 +11,6 @@ inherit cmake
>   
>   DEPENDS = "ti-rpmsg-char"
>   
> -EXTRA_OECMAKE += "-DBUILD_LIB=ON -DBUILD_EXAMPLE=OFF"
> +EXTRA_OECMAKE += "-DBUILD_LIB=ON -DBUILD_AUDIO_OFFLOAD_EXAMPLE=OFF -DBUILD_2DFFT_OFFLOAD_EXAMPLE=OFF"
>   
>   COMPATIBLE_MACHINE = "^(k3)$"

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

