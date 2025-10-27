Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 205C8CCF9EA
	for <webhook@archiver.kernel.org>; Mon, 27 Oct 2025 13:04:05 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.32044.1761570242718053052
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 27 Oct 2025 06:04:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=AvXRY/KE;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: reatmon@ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59RD3x3Z1269169;
	Mon, 27 Oct 2025 08:03:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1761570239;
	bh=SidrBTFO42jcIFxvfT9aNE0XmiPFGL3BenQE9LS3hx4=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=AvXRY/KEgxKI2h4LJrBiUGB7LfOll7R4jVx9FR+hnEsQ1j5iZBvhuRzUytU7f4tUH
	 HjhgpTDkYDt1a3ZesyleQMNh3ht+7JGfIJ3PAZbrX+s2RMUsEvRYhx9Z3GdIbtN4vN
	 TLsyuSl7c/borEC4xIF6TXogpJVxf6qd+JzeZ87c=
Received: from DLEE209.ent.ti.com (dlee209.ent.ti.com [157.170.170.98])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59RD3xXv1401772
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 27 Oct 2025 08:03:59 -0500
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 27 Oct
 2025 08:03:59 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 27 Oct 2025 08:03:59 -0500
Received: from [128.247.81.40] (dtmz023nlvx.dhcp.ti.com [128.247.81.40])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59RD3xTv685978;
	Mon, 27 Oct 2025 08:03:59 -0500
Message-ID: <03baf840-71b6-4260-ad63-7f3f3d781c74@ti.com>
Date: Mon, 27 Oct 2025 08:03:59 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] meta-ti-bsp : ipc: update ti-librpmsg-dma srcrev &
 license
To: vishnu singh <v-singh1@ti.com>, <meta-ti@lists.yoctoproject.org>,
        <denis@denix.org>
References: <20251027040535.3340080-1-v-singh1@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20251027040535.3340080-1-v-singh1@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 27 Oct 2025 13:04:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19183


The subject does not state which recipe is being updated.  Please change 
it to:

ti-librpmsg-dma: update ti-librpmsg-dma SRCREV & LICENSE

Also you did not include the branches in the subject so PRC only checked 
against master.  Likely you will need two patches, one for scarthgap and 
one for master making the same changes in both.

Also, when sending v2 and higher you should always include the version 
history in the patch after the --- to document what each revision was 
changing.

On 10/26/2025 11:05 PM, vishnu singh wrote:
> From: Vishnu Singh <v-singh1@ti.com>
> 
> Update recipe license to TI-TFL, use scarthgap branch
> Disable 2dfft and audio offload example build for rpmsg-dma library.
> 
> License-Update: license change to TI-TFL
> 
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


