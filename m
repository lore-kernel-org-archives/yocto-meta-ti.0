Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46A0ED78781
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 15:35:59 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.1161.1732203353752502818
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 21 Nov 2024 07:35:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=gfAX0rt+;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: c-shilwant@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4ALFZqZn115559;
	Thu, 21 Nov 2024 09:35:52 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1732203352;
	bh=hVaUNlO0RLmiEXUZhgZSR6JLMTZm+HAKWqwkTbi7/ow=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=gfAX0rt+pltuHbF8cHzAX2GAdseKHaM88O0TIAJ9EaclNOkBnEesKGiEHLq0qk0/C
	 dmIYN7yFoVNJoIw6EsimMOn6+l+90osrQ20GUJQbI3GKT8fUu8RLRA+POaGwfAbcG6
	 o7LLzzQe94/N+8zEsLxAVXgx5CfyKGs9fQi2eej0=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4ALFZqc1014114;
	Thu, 21 Nov 2024 09:35:52 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 21
 Nov 2024 09:35:52 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 21 Nov 2024 09:35:52 -0600
Received: from [172.24.227.238] (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4ALFZnRk121592;
	Thu, 21 Nov 2024 09:35:50 -0600
Message-ID: <fdddc737-6e85-41bc-b65e-75259c15371d@ti.com>
Date: Thu, 21 Nov 2024 21:05:49 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] [scarthgap/master] [PATCH] conf: machine: am62pxx: Pick
 overlays for V3Link cameras
To: Devarsh Thakkar <devarsht@ti.com>, <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>, <denys@konsulko.com>
CC: <praneeth@ti.com>, <vigneshr@ti.com>, <r-donadkar@ti.com>,
        <s-jain1@ti.com>
References: <20241121151147.1920885-1-devarsht@ti.com>
Content-Language: en-US
From: Chirag Shilwant <c-shilwant@ti.com>
In-Reply-To: <20241121151147.1920885-1-devarsht@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 21 Nov 2024 15:35:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18074

On 21/11/24 20:41, Devarsh Thakkar wrote:
> From: Rishikesh Donadkar <r-donadkar@ti.com>
>
> The V3Link camera fusion board [1] can be used to connect upto 4
> OV5640 sensors to SK-AM62A.
>
> Overlays for interfacing OV5640 sensor with V3Link are built
> as part of the TI linux kernel. Pick these in the BSP filesystem.
>
> [1]: https://www.arducam.com/product/arducam-v3link-camera-kit-for-ti-development-boards/
>
> Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>

Acked-by: Chirag Shilwant <c-shilwant@ti.com>

> ---
>   meta-ti-bsp/conf/machine/am62pxx-evm.conf | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/meta-ti-bsp/conf/machine/am62pxx-evm.conf b/meta-ti-bsp/conf/machine/am62pxx-evm.conf
> index 676e64a40d99..bb3c34a3f9b8 100644
> --- a/meta-ti-bsp/conf/machine/am62pxx-evm.conf
> +++ b/meta-ti-bsp/conf/machine/am62pxx-evm.conf
> @@ -10,6 +10,7 @@ KERNEL_DEVICETREE_PREFIX = " \
>       ti/k3-am62x-sk-csi2 \
>       ti/k3-am62x-sk-hdmi \
>       ti/k3-am62x-sk-lpm \
> +    ti/k3-v3link \
>   "
>   
>   KERNEL_DEVICETREE = " \

