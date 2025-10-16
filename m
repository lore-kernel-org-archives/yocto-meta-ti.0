Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 099AECCD183
	for <webhook@archiver.kernel.org>; Thu, 16 Oct 2025 15:29:28 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.134.1760628558133802334
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 16 Oct 2025 08:29:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=VjQXScaC;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: afd@ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59GFTGC6045738;
	Thu, 16 Oct 2025 10:29:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1760628556;
	bh=t73PCMorUBwSj2wyNc028A/TJH7KnXmWzIHDgKAD9wg=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=VjQXScaCZiHizG+G9+kC0iejWZw7hKIqswcLsJDNBtF7TTlNNtcPV/+eZqwEtiS+C
	 VOnQFcUmotozUVi/UOvZsW1Zr2e96dGGM3JAJ/h1y+/exa4jRmgH3gGXGi56rPXaO7
	 FowJd9fapklV+WXjA3u08Zf9kOXFL80p7ewrieM4=
Received: from DLEE206.ent.ti.com (dlee206.ent.ti.com [157.170.170.90])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59GFTGrc1706377
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 16 Oct 2025 10:29:16 -0500
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 16 Oct
 2025 10:29:16 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 16 Oct 2025 10:29:16 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59GFTGqr3943953;
	Thu, 16 Oct 2025 10:29:16 -0500
Message-ID: <d4d68382-39f4-409f-bbf6-131f53027611@ti.com>
Date: Thu, 16 Oct 2025 10:29:16 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][scarthgap][PATCH] 1/2 conf: machine: Include MCSPI
 overlay for am62p and am62 LP
To: <jm@ti.com>, Ryan Eatmon <reatmon@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>
CC: <meta-ti@lists.yoctoproject.org>
References: <20251014200702.933617-1-jm@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20251014200702.933617-1-jm@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 16 Oct 2025 15:29:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19140

On 10/14/25 3:07 PM, Mendez, Judith via lists.yoctoproject.org wrote:
> MCSPI overlay can be used for all am62* SK boards as well as
> am62p SK, so include the overlay for am62p and am62 LP SK builds
> since it is not included in the default configuration.
> 
> Signed-off-by: Judith Mendez <jm@ti.com>
> ---
>   meta-ti-bsp/conf/machine/am62pxx-evm.conf   | 1 +
>   meta-ti-bsp/conf/machine/am62xx-lp-evm.conf | 1 +
>   2 files changed, 2 insertions(+)
> 
> diff --git a/meta-ti-bsp/conf/machine/am62pxx-evm.conf b/meta-ti-bsp/conf/machine/am62pxx-evm.conf
> index a923d3e9..8a3747f8 100644
> --- a/meta-ti-bsp/conf/machine/am62pxx-evm.conf
> +++ b/meta-ti-bsp/conf/machine/am62pxx-evm.conf
> @@ -18,6 +18,7 @@ KERNEL_DEVICETREE = " \
>       ti/k3-am62x-sk-csi2-ov5640.dtbo \
>       ti/k3-am62x-sk-csi2-tevi-ov5640.dtbo \
>       ti/k3-am62x-sk-hdmi-audio.dtbo \
> +    ti/k3-am62x-sk-mcspi-loopback.dtbo \
>   "
>   
>   FIT_CONF_DEFAULT_DTB = "ti/k3-am62p5-sk.dtb"
> diff --git a/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf b/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
> index 78bca1ab..d34801f2 100644
> --- a/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
> +++ b/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
> @@ -20,6 +20,7 @@ KERNEL_DEVICETREE = " \
>       ti/k3-am62-lp-sk.dtb \
>       ti/k3-am625-sk.dtb \
>       ti/k3-am62x-sk-hdmi-audio.dtbo \
> +    ti/k3-am62x-sk-mcspi-loopback.dtbo \

Should just add `ti/k3-am62x-sk` to KERNEL_DEVICETREE_PREFIX to include
all these for us.

Andrew

>   "
>   
>   FIT_CONF_DEFAULT_DTB = "ti/k3-am62-lp-sk.dtb"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#19121): https://lists.yoctoproject.org/g/meta-ti/message/19121
> Mute This Topic: https://lists.yoctoproject.org/mt/115759762/3619733
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [afd@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


