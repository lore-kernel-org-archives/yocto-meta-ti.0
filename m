Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAD94C5B543
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 15:34:27 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.89795.1749569659479573632
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 10 Jun 2025 08:34:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=UaZOR4ea;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: afd@ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55AFYGsh2333029;
	Tue, 10 Jun 2025 10:34:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1749569656;
	bh=dkiNtZRe/S8+Cj0QEXscy0bfY6Fhyv50DIw6FtJV6Po=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=UaZOR4eaP+kGKZG60p4jV5OXfWVW/cGOckUeNtX5aZ+/kN/wmUxyWYG77poiNRkjj
	 Nu9BqN3i6qcdRm4aR6Yf5UFgQpBr6IfjAxV/QHyrtPs+G5mu8DK7/qe6rctIPsCMyD
	 +PynHCno2XLPY7bmfdj4aKI3Get4yoTTCJG/C7Ec=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55AFYGmi352989
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 10 Jun 2025 10:34:16 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 10
 Jun 2025 10:34:16 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 10 Jun 2025 10:34:16 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55AFYGlb3114442;
	Tue, 10 Jun 2025 10:34:16 -0500
Message-ID: <8561cc0b-fe5f-48f4-97d5-e51599509738@ti.com>
Date: Tue, 10 Jun 2025 10:34:15 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] [scarthgap][PATCH V5] meta-ti-bsp : ipc: Add RPMsg DMA
 library
To: <v-singh1@ti.com>, <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>,
        <denis@denix.org>
CC: <praneeth@ti.com>, <c-shilwant@ti.com>, <khasim@ti.com>, <p-bhagat@ti.com>
References: <20250610151623.211459-1-v-singh1@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250610151623.211459-1-v-singh1@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 10 Jun 2025 15:34:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18636

On 6/10/25 10:16 AM, Vishnu Singh via lists.yoctoproject.org wrote:
> From: Vishnu Singh <v-singh1@ti.com>
> 
> This commit introduces the RPMsg DMA library:
> 
> RPMsg DMA library (meta-ti-bsp/recipes-ti/ipc):

The "meta-ti-bsp/recipes-ti/ipc" part isn't needed, we can see
where it is at from the patch below. Otherwise the recipe itself
looks good to me,

Reviewed-by: Andrew Davis <afd@ti.com>

>     - Provides librpmsg_dma.so shared library.
>     - Includes APIs for:
>       - RPMsg interface initialization
>       - RPMsg-based send/receive communication
>       - DMA heap buffer management
>       - DSP firmware dynamic load/unload
> 
> Signed-off-by: Vishnu Singh <v-singh1@ti.com>
> ---
>   meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
>   create mode 100644 meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb
> 
> diff --git a/meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb b/meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb
> new file mode 100644
> index 00000000..5dd3d6c7
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb
> @@ -0,0 +1,14 @@
> +SUMMARY = "RPMsg DMA shared library"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=744e63d2bb8c6151dcdd97f49aa02c53"
> +
> +SRC_URI = "git://github.com/TexasInstruments/rpmsg-dma.git;protocol=https;branch=main"
> +SRCREV = "609fd72f458ba56f80d06810509ef88d010d2c03"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit cmake
> +
> +DEPENDS = "ti-rpmsg-char"
> +
> +EXTRA_OECMAKE += "-DBUILD_LIB=ON -DBUILD_EXAMPLE=OFF"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#18635): https://lists.yoctoproject.org/g/meta-ti/message/18635
> Mute This Topic: https://lists.yoctoproject.org/mt/113571551/3619733
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [afd@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

