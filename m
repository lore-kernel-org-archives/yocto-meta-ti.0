Return-Path: <jm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA00CC07E98
	for <webhook@archiver.kernel.org>; Wed, 29 Nov 2023 21:44:37 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.51696.1701294272097024724
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 29 Nov 2023 13:44:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=xIAWOK6+;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: jm@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3ATLiVwn071517
	for <meta-ti@lists.yoctoproject.org>; Wed, 29 Nov 2023 15:44:31 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1701294271;
	bh=dJ/Th1D6cCDgCMn1FSyagdditdJBZBkUQRy7c1VXLCU=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=xIAWOK6+H+HQgwck/Zf+Cb6Cq0VMd8fVkQmI2M/XghJL+5JugPx2Y8EWTyQSdq2sD
	 GRplI502HQ8FvyPEtErAH5rIbSDosBZCsjK256L5VC2HbhxQR3Ijnb14GrbI7t0p3t
	 wS230vXbJTTpcG6ME27k3maOughrRG16NqvW1W00=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3ATLiV5k048942
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Wed, 29 Nov 2023 15:44:31 -0600
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 29
 Nov 2023 15:44:31 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 29 Nov 2023 15:44:30 -0600
Received: from [128.247.81.105] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3ATLiVTU026572;
	Wed, 29 Nov 2023 15:44:31 -0600
Message-ID: <20e8b519-e0a8-409e-8faf-9b96525c6b26@ti.com>
Date: Wed, 29 Nov 2023 15:44:31 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kirkstone PATCH] conf: machine: am62xx-lp-evm.conf: Pick LPM
 wkup sources overlay
To: Praneeth Bajjuri <praneeth@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: Ryan Eatmon <reatmon@ti.com>, Vibhore Vardhan <vibhore@ti.com>
References: <20231129214059.11612-1-praneeth@ti.com>
Content-Language: en-US
From: Judith Mendez <jm@ti.com>
In-Reply-To: <20231129214059.11612-1-praneeth@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 29 Nov 2023 21:44:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17339

On 11/29/23 3:40 PM, Praneeth Bajjuri wrote:
> commit [1] created a common LPM wkup sources overlay and removes
> k3-am62x-sk-mcu-gpio-wakeup.dtso for am62 device family.
> k3-am62x-sk prefix picks this overlay for am62xx, am62axx and am62xxsip already.
> 
> This patch picks the necessary overlay for am62xx-lp-evm since it doesnt use
> the same prefix as other am62 platforms.
> 
> [1]: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/commit/?&id=4ba1886b886d
> 

LGTM

Reviewed-by: Judith Mendez <jm@ti.com>

> Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
> ---
>   meta-ti-bsp/conf/machine/am62xx-lp-evm.conf | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf b/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
> index dfb9cbfa..229b74bc 100644
> --- a/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
> +++ b/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
> @@ -8,8 +8,8 @@ KERNEL_DEVICETREE_PREFIX = " \
>       ti/k3-am62-lp \
>       ti/k3-am625-sk \
>       ti/k3-am62x-sk-hdmi \
> +    ti/k3-am62x-sk-lpm \
>       ti/k3-am62x-sk-mcan \
> -    ti/k3-am62x-sk-mcu \
>   "
>   
>   KERNEL_DEVICETREE = " \


