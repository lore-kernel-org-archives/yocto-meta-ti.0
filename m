Return-Path: <jm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C9C1C07533
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 15:03:27 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.15408.1700060597204144679
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 15 Nov 2023 07:03:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=MfwG5u16;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: jm@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3AFF3GN9099499
	for <meta-ti@lists.yoctoproject.org>; Wed, 15 Nov 2023 09:03:16 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1700060596;
	bh=vyYZRPFI9qwHQyE6bKBwM7NzU4AKYHCAmVs3Rbshuxo=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=MfwG5u16f+0AkaFxb5catYtux4gGqFFcWSI3niWBD1eckG2J8w53off11q6ERPVL4
	 3HR9odp67Rt3dHeclKnEJ7mJ/Sackg/OQXPIz8qWm637Bo3IlCLYcASF6tM6ZhOLM8
	 yNnFeYukwlnUOZrOOY1GZUs4RfJe8rGMS1/qdBCw=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3AFF3GEJ018211
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Wed, 15 Nov 2023 09:03:16 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 15
 Nov 2023 09:03:16 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 15 Nov 2023 09:03:16 -0600
Received: from [128.247.81.105] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3AFF3GIZ003553;
	Wed, 15 Nov 2023 09:03:16 -0600
Message-ID: <83d54fc5-0a5a-419d-bb33-f75a27988e5d@ti.com>
Date: Wed, 15 Nov 2023 09:03:16 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kirkstone PATCH] conf: machine: am62xx-lp-evm.conf: Pick MCU
 GPIO wakeup overlay
To: Praneeth Bajjuri <praneeth@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: Ryan Eatmon <reatmon@ti.com>, Vishal Mahaveer <vishalm@ti.com>
References: <20231114235156.6608-1-praneeth@ti.com>
Content-Language: en-US
From: Judith Mendez <jm@ti.com>
In-Reply-To: <20231114235156.6608-1-praneeth@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 15 Nov 2023 15:03:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17300

On 11/14/23 5:51 PM, Praneeth Bajjuri wrote:
> commit [1] renamed the MCU GPIO wakeup overlay as k3-am62x-sk-mcu-gpio-wakeup.dtbo
> k3-am62x-sk prefix picks this overlay for am62xx, am62axx and am62xxsip already.
> 
> This patch picks the necessary overlay for am62xx-lp-evm since it doesnt use
> the same prefix as other am62 platforms.
> 
> [1]: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/commit/?&id=24bd6ce832cd
> 

Looks good (:

Reviewed-by: Judith Mendez <jm@ti.com>

> Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
> ---
>   meta-ti-bsp/conf/machine/am62xx-lp-evm.conf | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf b/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
> index afa5e061..dfb9cbfa 100644
> --- a/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
> +++ b/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
> @@ -9,6 +9,7 @@ KERNEL_DEVICETREE_PREFIX = " \
>       ti/k3-am625-sk \
>       ti/k3-am62x-sk-hdmi \
>       ti/k3-am62x-sk-mcan \
> +    ti/k3-am62x-sk-mcu \
>   "
>   
>   KERNEL_DEVICETREE = " \


