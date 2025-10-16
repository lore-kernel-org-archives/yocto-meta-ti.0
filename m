Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9365CCD19A
	for <webhook@archiver.kernel.org>; Thu, 16 Oct 2025 15:29:47 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.150.1760628585490279412
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 16 Oct 2025 08:29:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Vp0ZHtJC;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: afd@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59GFTifI046034;
	Thu, 16 Oct 2025 10:29:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1760628584;
	bh=EDzoa6mnK4Pg1xY46rUkWVe9XwwiQq1r4UkF0cWCly0=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Vp0ZHtJCP40Cf15obt9MIY1yd4wnX8DZG3E7HJ8NbxAHg3QTDhUXWMMnKrhUMdGJU
	 6yfGZc0Wh7dOS0gZNil5Y2EiqumK/Cu7E/8dCZDjuWBWPFaAUpy4psxU1+xr5ct1wq
	 5IaKICELtHNCuy/qlC+kjlfPF5UtYScuVh6/1yjQ=
Received: from DLEE214.ent.ti.com (dlee214.ent.ti.com [157.170.170.117])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59GFTivE1303399
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 16 Oct 2025 10:29:44 -0500
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 16 Oct
 2025 10:29:43 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 16 Oct 2025 10:29:43 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59GFThEa3948899;
	Thu, 16 Oct 2025 10:29:43 -0500
Message-ID: <531876c7-0684-4c12-be84-f7c784579da7@ti.com>
Date: Thu, 16 Oct 2025 10:29:43 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][scarthgap][PATCH] 2/2 conf: machine: Explicitly include
 overlays for am62 LP
To: <jm@ti.com>, Ryan Eatmon <reatmon@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>
CC: <meta-ti@lists.yoctoproject.org>
References: <20251014200702.933617-1-jm@ti.com>
 <20251014200702.933617-2-jm@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20251014200702.933617-2-jm@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 16 Oct 2025 15:29:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19141

On 10/14/25 3:07 PM, Mendez, Judith via lists.yoctoproject.org wrote:
> AM62 LP SK configuration  includes all PWM/EQEP/MCAN overlay
> in KERNEL_DEVICETREE_PREFIX but move to KERNEL_DEVICETREE  and
> explicitly state the name of overlays that should be included for
> am62 LP SK build.

Why?

> 
> Signed-off-by: Judith Mendez <jm@ti.com>
> ---
>   meta-ti-bsp/conf/machine/am62xx-lp-evm.conf | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf b/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
> index d34801f2..94457053 100644
> --- a/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
> +++ b/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
> @@ -7,20 +7,20 @@ require conf/machine/include/am62xx.inc
>   KERNEL_DEVICETREE_PREFIX = " \
>       ti/k3-am62-lp \
>       ti/k3-am625-sk \
> -    ti/k3-am62x-sk-dmtimer-pwm \
> -    ti/k3-am62x-sk-eqep \
>       ti/k3-am62x-sk-hdmi \
>       ti/k3-am62x-sk-lpm \
> -    ti/k3-am62x-sk-mcan \
> -    ti/k3-am62x-sk-pwm \
>   "
>   
>   KERNEL_DEVICETREE = " \
>       ti/k3-am62-lp-sk-nand.dtbo \
>       ti/k3-am62-lp-sk.dtb \
>       ti/k3-am625-sk.dtb \
> +    ti/k3-am62x-sk-dmtimer-pwm.dtbo \
> +    ti/k3-am62x-sk-eqep.dtbo \
>       ti/k3-am62x-sk-hdmi-audio.dtbo \
> +    ti/k3-am62x-sk-mcan.dtbo \
>       ti/k3-am62x-sk-mcspi-loopback.dtbo \
> +    ti/k3-am62x-sk-pwm.dtbo \
>   "
>   
>   FIT_CONF_DEFAULT_DTB = "ti/k3-am62-lp-sk.dtb"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#19122): https://lists.yoctoproject.org/g/meta-ti/message/19122
> Mute This Topic: https://lists.yoctoproject.org/mt/115759763/3619733
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [afd@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


