Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C295C77B7C
	for <webhook@archiver.kernel.org>; Wed, 25 Jun 2025 18:33:52 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.23526.1750876424097329340
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 25 Jun 2025 11:33:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=noo7aR9T;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: reatmon@ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55PIXh7j1926135
	for <meta-ti@lists.yoctoproject.org>; Wed, 25 Jun 2025 13:33:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750876423;
	bh=FV8wBK7Srf9TFSER53BSa/gXkp7dFL4dDT8x7/cv7SE=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=noo7aR9TPnHyEi1jj9UCM6DwbSe8a95C2iF3YiK7Hyr8/QlhhWouxN861i4jJ7EN6
	 MxDciPHvpA3Gqs9W9TwQMyJxu7u881XsbTXk8KCXVSRZS4Y1TfjP/RoyttNEHVtilN
	 O5Ea30iINezd0tKHBPGSd3GyyX7ypjFPiJd9ZEUg=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55PIXhKB2826137
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Wed, 25 Jun 2025 13:33:43 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 25
 Jun 2025 13:33:31 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 25 Jun 2025 13:33:31 -0500
Received: from [128.247.81.69] (dtmxl9433pnr.dhcp.ti.com [128.247.81.69])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55PIXVbM3843455;
	Wed, 25 Jun 2025 13:33:31 -0500
Message-ID: <3f5b8e63-9cb1-4bfb-90b6-40c14559868d@ti.com>
Date: Wed, 25 Jun 2025 13:33:31 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master/scarthgap][PATCH v1 4/4] conf: machine:
 am62xxsip: update kernel dtbs
To: Anshul Dalal <anshuld@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: <c-shilwant@ti.com>, <vigneshr@ti.com>, <praneeth@ti.com>
References: <20250625171626.2863841-1-anshuld@ti.com>
 <20250625171626.2863841-5-anshuld@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20250625171626.2863841-5-anshuld@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 25 Jun 2025 18:33:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18685



On 6/25/2025 12:16 PM, Anshul Dalal wrote:
> The new kernel dtbs for am62x SiP have been merged to ti-linux-kernel as
> of f9579207b081 ("arm64: dts: ti: Add support for AM6254xxl SiP SK") on
> ti-linux-6.12.y-cicd.
> 
> Note that AM6254xxl is the OPN for am62x SiP and expands as follows:
> 
> AM6254XXL
>       ||||
>       |||+-- Feature Lookup (L indicates 512MiB of integrated LPDDR4)
>       ||+--- Clock Speed
>       |+---- Silicon PG Revision
>       +----- Core configuration (4 indicates A53's in Quad core config)
> 
> This patch updates am62x SiP machine config to make use of the new dtbs.
> 
> Signed-off-by: Anshul Dalal <anshuld@ti.com>
> ---
>   meta-ti-bsp/conf/machine/am62xxsip-evm.conf | 10 +++++++++-
>   1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-ti-bsp/conf/machine/am62xxsip-evm.conf b/meta-ti-bsp/conf/machine/am62xxsip-evm.conf
> index 0a7ebec3..ccbb0200 100644
> --- a/meta-ti-bsp/conf/machine/am62xxsip-evm.conf
> +++ b/meta-ti-bsp/conf/machine/am62xxsip-evm.conf
> @@ -10,10 +10,18 @@ KERNEL_DEVICETREE_PREFIX = " \
>   "

>   KERNEL_DEVICETREE = " \
> +    ti/k3-am6254xxl-sk.dtb \
> +"
> +KERNEL_DEVICETREE:bsp-ti-6_6 = " \
> +    ti/k3-am625-sk.dtb \
> +"
> +KERNEL_DEVICETREE:bsp-ti-6_1 = " \
>       ti/k3-am625-sk.dtb \
>   "

NAK.  We do not control the value of KERNEL_DEVICETREE, that is auto 
generated based on KERNEL_DEVICETREE_PREFIX and the latest mainline 
kernel version that we test.  The value for KERNEL_DEVICETREE is tied to 
the DTBs that exist only in the latest stable kernel.

For all other things we use KERNEL_DEVICETREE_PREFIX which already 
contains enough to pick up this new DTB.

So the above change needs to be removed.


> -FIT_CONF_DEFAULT_DTB = "ti/k3-am625-sk.dtb"
> +FIT_CONF_DEFAULT_DTB = "ti/k3-am6254xxl-sk.dtb"
> +FIT_CONF_DEFAULT_DTB:bsp-ti-6_6 = "ti/k3-am625-sk.dtb"
> +FIT_CONF_DEFAULT_DTB:bsp-ti-6_1 = "ti/k3-am625-sk.dtb"
>   
>   UBOOT_MACHINE = "am6254xxl_evm_a53_defconfig"
>   

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

