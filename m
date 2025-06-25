Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A659CC77B7C
	for <webhook@archiver.kernel.org>; Wed, 25 Jun 2025 17:46:01 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.22437.1750873557701317028
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 25 Jun 2025 10:45:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=NUj0RmIj;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: afd@ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55PHjv8T1517752
	for <meta-ti@lists.yoctoproject.org>; Wed, 25 Jun 2025 12:45:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750873557;
	bh=8MLO9boxSpgiEJbzxXqv7ZthbQd0Ng6WASM89omgdGY=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=NUj0RmIjH/N2PjN6EeOHOLQSxKf6im4bRynaLgXvFZb4O1Wdc8VklX5vZHQ+0VpSz
	 TTtFBTpIESkBl52oeMRZ5jIcB+FDsq9oTVJylrEFkhSC4CIf8wysJ7pMli3f6AxIWR
	 yzLBFbAmWQbHm6CO2Agut/OMRy1J75X+wpAkP+IU=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55PHjvoE2792685
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Wed, 25 Jun 2025 12:45:57 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 25
 Jun 2025 12:45:56 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 25 Jun 2025 12:45:56 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55PHjufh3782789;
	Wed, 25 Jun 2025 12:45:56 -0500
Message-ID: <12653d81-23fe-4fb4-9b04-404642dcc577@ti.com>
Date: Wed, 25 Jun 2025 12:45:56 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master/scarthgap][PATCH v1 2/4] meta-ti-bsp: tfa: add
 build flags for am62xxsip-evm
To: <anshuld@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: <c-shilwant@ti.com>, <reatmon@ti.com>, <vigneshr@ti.com>,
        <praneeth@ti.com>
References: <20250625171626.2863841-1-anshuld@ti.com>
 <20250625171626.2863841-3-anshuld@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250625171626.2863841-3-anshuld@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 25 Jun 2025 17:46:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18675

On 6/25/25 12:16 PM, Anshul Dalal via lists.yoctoproject.org wrote:
> Due to 512MiB DDR limitation of am62x SiP, the memory map has been
> modified with OP-TEE moved to bottom of DDR after atf to 0x80080000,
> this requires modifications to ATF's BL32_BASE. PRELOADED_BL33_BASE has
> also been updated to 0x81880000 to reflect the updated SPL_TEXT_BASE
> from u-boot.
> 
> Signed-off-by: Anshul Dalal <anshuld@ti.com>
> ---
>   .../recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc     | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
> index cb956a00..805ded8e 100644
> --- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
> +++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
> @@ -19,4 +19,5 @@ TFA_SPD:am62lxx = ""
>   
>   EXTRA_OEMAKE += "${@ 'K3_USART=' + d.getVar('TFA_K3_USART') if d.getVar('TFA_K3_USART') else ''}"
>   EXTRA_OEMAKE += "${@ 'K3_PM_SYSTEM_SUSPEND=' + d.getVar('TFA_K3_SYSTEM_SUSPEND') if d.getVar('TFA_K3_SYSTEM_SUSPEND') else ''}"
> +EXTRA_OEMAKE:append:am62xxsip-evm:bsp-ti-6_12 = " PRELOADED_BL33_BASE=0x81880000 BL32_BASE=0x80080000"

I wonder if we want to do something like we did with TFA_K3_USART and TFA_K3_SYSTEM_SUSPEND here
so that we can set this is the machine .conf file, vs out here in the recipe.

Might be something we can do later, as the same needs done for CFG_TEE_CORE_LOG_LEVEL in OP-TEE.

Andrew

>   EXTRA_OEMAKE:append:ti-falcon = " PRELOADED_BL33_BASE=0x82000000 K3_HW_CONFIG_BASE=0x88000000"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#18672): https://lists.yoctoproject.org/g/meta-ti/message/18672
> Mute This Topic: https://lists.yoctoproject.org/mt/113829067/3619733
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [afd@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

