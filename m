Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18F53CEDD98
	for <webhook@archiver.kernel.org>; Wed,  9 Oct 2024 13:51:41 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.16910.1728481891987463780
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 09 Oct 2024 06:51:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=RLxNBlYM;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 499DpVOL111921;
	Wed, 9 Oct 2024 08:51:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1728481891;
	bh=+GH2aYZsGBDWnrPhsoo8nKXc/l5vXaJk8zngKXGFyXU=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=RLxNBlYMx9PnXwXpxbBId0jImlPlDPScS0A4Xig2rA4WzeartRm/5DNpDfCCAIOY+
	 toLzRVLzT+dwcntMlklqN1IKuO2HtatDbCgb7LciLwxQp1AAgBd23t8oweqMqhpxKR
	 54W7c35J5XHarrK3VSFiK/Ahsvz0UJp/OslgZ5bY=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 499DpV7V012905;
	Wed, 9 Oct 2024 08:51:31 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 9
 Oct 2024 08:51:30 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 9 Oct 2024 08:51:30 -0500
Received: from [10.249.35.83] ([10.249.35.83])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 499DpU6n059492;
	Wed, 9 Oct 2024 08:51:30 -0500
Message-ID: <05f64b4e-cd65-49a1-a221-bb0dbee09b06@ti.com>
Date: Wed, 9 Oct 2024 08:51:30 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master/scarthgap][PATCH v3] ti-bsp: Add RT and systest
 support
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <17FCCCED966E3629.19251@lists.yoctoproject.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <17FCCCED966E3629.19251@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 09 Oct 2024 13:51:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18001


I thought of this in the middle of the night and realized it was a 
simpler fix.  Rather than create the extra variable and have to set it 
in all of the BSPs, just add two new PREFERRED_VERSION settings with -rt 
and -system.  The effect is the same, and has the benefit of still 
erroring out if you try to build an RT version of mainline, next, or bb_org.


On 10/9/2024 8:47 AM, Ryan Eatmon via lists.yoctoproject.org wrote:
> We were missing controlling the versions for linux-ti-staging-rt and
> linux-ti-staging-systest using the BSP framework.  Since the
> PREFERRED_VERSION is not tied to the virtual/kernel we need two
> additional settings for those alternate kernel package names.
> 
> For BSPs that do not have the -rt and -systest recipes then the two
> new variable settings should effectively be ignored and cause no issues.
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
> v3: Typo in commit message.
> v2: Remove the extra variables and just set PREFERRED_VERSION.
> 
>   meta-ti-bsp/conf/machine/include/ti-bsp.inc | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/meta-ti-bsp/conf/machine/include/ti-bsp.inc b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
> index 4cb2aab4..0c8f657d 100644
> --- a/meta-ti-bsp/conf/machine/include/ti-bsp.inc
> +++ b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
> @@ -122,6 +122,8 @@ BSP_MESA_PVR_VERSION ?= ""
>   # ==========
>   PREFERRED_PROVIDER_virtual/kernel ?= "${BSP_KERNEL_PROVIDER}"
>   PREFERRED_VERSION_${BSP_KERNEL_PROVIDER} ?= "${BSP_KERNEL_VERSION}"
> +PREFERRED_VERSION_${BSP_KERNEL_PROVIDER}-rt ?= "${BSP_KERNEL_VERSION}"
> +PREFERRED_VERSION_${BSP_KERNEL_PROVIDER}-systest ?= "${BSP_KERNEL_VERSION}"
>   PREFERRED_PROVIDER_virtual/bootloader ?= "${BSP_BOOTLOADER_PROVIDER}"
>   PREFERRED_PROVIDER_u-boot ?= "${BSP_BOOTLOADER_PROVIDER}"
>   PREFERRED_VERSION_${BSP_BOOTLOADER_PROVIDER} ?= "${BSP_BOOTLOADER_VERSION}"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#18000): https://lists.yoctoproject.org/g/meta-ti/message/18000
> Mute This Topic: https://lists.yoctoproject.org/mt/108909108/6551054
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [reatmon@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

