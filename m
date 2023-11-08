Return-Path: <jm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A382C4332F
	for <webhook@archiver.kernel.org>; Wed,  8 Nov 2023 17:03:28 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.19953.1699463001244872563
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 08 Nov 2023 09:03:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=yYHx7QnP;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: jm@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3A8H3K02086231
	for <meta-ti@lists.yoctoproject.org>; Wed, 8 Nov 2023 11:03:20 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1699463000;
	bh=rx/9FIH6mTXtSgEoVF+/vmuhG7eTjLIbHeMI1PLMbzI=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=yYHx7QnPXG6WO5oj6q+qZ0TwCs823TKJ+6+Ko/y13LxshyHxgbbv2ssthW1EsCVcZ
	 nu0LtH+bCMjxh3r3uXnzqsrbBDXW8ZlW5GsCf+A7QjVOisNIDnHDBUQG6ry6tcfjT+
	 YZlbtMYBXGcxvswU48pwNnflzobI6pGxITl5KlUc=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3A8H3KaK024146
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Wed, 8 Nov 2023 11:03:20 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 8
 Nov 2023 11:03:19 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 8 Nov 2023 11:03:19 -0600
Received: from [128.247.81.105] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3A8H3JSZ093061;
	Wed, 8 Nov 2023 11:03:19 -0600
Message-ID: <25354ef9-9809-4b4b-a7fd-e79fdfc92aa2@ti.com>
Date: Wed, 8 Nov 2023 11:03:19 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kirkstone PATCH v2] conf: machine: am62*: extend picking common
 overlays by prefix
Content-Language: en-US
To: Praneeth Bajjuri <praneeth@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: Ryan Eatmon <reatmon@ti.com>, Jai Luthra <j-luthra@ti.com>
References: <20231108160437.15536-1-praneeth@ti.com>
From: Judith Mendez <jm@ti.com>
In-Reply-To: <20231108160437.15536-1-praneeth@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 08 Nov 2023 17:03:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17282

Hi all,

On 11/8/23 10:04 AM, Praneeth Bajjuri wrote:
> commit f5851386 ("conf: machine: am62*: Pick common overlays by prefix")
> picks common HDMI and CSI overlays for am62 platform variants.
> 
> Adding capability to extend the same prefix for common overlays for applicable
> am62 platforms in more generic way to include new mcan overlays added [1]
> 
> [1]: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/commit/?&id=3b01c392627f
> 
> given the differences in SK-AM62-LP containing  B2B HDMI Samtec connector,
> just added the kernel prefix to pick common mcan overlay.
> 
> for am62pxx: It has 4 MCANs vs all other am62xx devices have 3 MCANs,
> hence keeping this prefix seperate for am62pxx to pick right overlay.
> 

Looks good to me.

Reviewed-by: Judith Mendez <jm@ti.com>

> Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
> ---
> v2: updated am62xxsip conf and updated for am62pxx to pick different
> mcan overlay
> 
>   meta-ti-bsp/conf/machine/am62axx-evm.conf   | 3 +--
>   meta-ti-bsp/conf/machine/am62xx-evm.conf    | 3 +--
>   meta-ti-bsp/conf/machine/am62xx-lp-evm.conf | 1 +
>   meta-ti-bsp/conf/machine/am62xxsip-evm.conf | 4 ++--
>   4 files changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/meta-ti-bsp/conf/machine/am62axx-evm.conf b/meta-ti-bsp/conf/machine/am62axx-evm.conf
> index ef60e9d1..22f61401 100644
> --- a/meta-ti-bsp/conf/machine/am62axx-evm.conf
> +++ b/meta-ti-bsp/conf/machine/am62axx-evm.conf
> @@ -6,8 +6,7 @@ require conf/machine/include/am62axx.inc
>   
>   KERNEL_DEVICETREE_PREFIX = " \
>       ti/k3-am62a7 \
> -    ti/k3-am62x-sk-csi2 \
> -    ti/k3-am62x-sk-hdmi \
> +    ti/k3-am62x-sk \
>       ti/k3-fpdlink \
>   "
>   
> diff --git a/meta-ti-bsp/conf/machine/am62xx-evm.conf b/meta-ti-bsp/conf/machine/am62xx-evm.conf
> index b60ba156..fadbc6f4 100644
> --- a/meta-ti-bsp/conf/machine/am62xx-evm.conf
> +++ b/meta-ti-bsp/conf/machine/am62xx-evm.conf
> @@ -7,8 +7,7 @@ require conf/machine/include/ti-extras.inc
>   
>   KERNEL_DEVICETREE_PREFIX = " \
>       ti/k3-am625 \
> -    ti/k3-am62x-sk-csi2 \
> -    ti/k3-am62x-sk-hdmi \
> +    ti/k3-am62x-sk \
>   "
>   
>   KERNEL_DEVICETREE = " \
> diff --git a/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf b/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
> index 0d2f89ca..afa5e061 100644
> --- a/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
> +++ b/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
> @@ -8,6 +8,7 @@ KERNEL_DEVICETREE_PREFIX = " \
>       ti/k3-am62-lp \
>       ti/k3-am625-sk \
>       ti/k3-am62x-sk-hdmi \
> +    ti/k3-am62x-sk-mcan \
>   "
>   
>   KERNEL_DEVICETREE = " \
> diff --git a/meta-ti-bsp/conf/machine/am62xxsip-evm.conf b/meta-ti-bsp/conf/machine/am62xxsip-evm.conf
> index b3bda44a..cae58afe 100644
> --- a/meta-ti-bsp/conf/machine/am62xxsip-evm.conf
> +++ b/meta-ti-bsp/conf/machine/am62xxsip-evm.conf
> @@ -6,8 +6,8 @@ require conf/machine/include/am62xx.inc
>   
>   KERNEL_DEVICETREE_PREFIX = " \
>       ti/k3-am625 \
> -    ti/k3-am62x-sk-csi2 \
> -    ti/k3-am62x-sk-hdmi \
> +    ti/k3-am62x-sk \
> +
>   "
>   
>   KERNEL_DEVICETREE = " \


