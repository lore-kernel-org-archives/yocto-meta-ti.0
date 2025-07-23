Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02A61C83F1A
	for <webhook@archiver.kernel.org>; Wed, 23 Jul 2025 22:24:42 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.2940.1753309476743090910
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 23 Jul 2025 15:24:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=C7DQHnql;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: afd@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56NMOZd61359463;
	Wed, 23 Jul 2025 17:24:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1753309475;
	bh=w54gqTNOdbUmBCPHByUZAZYY4BUmCtXlEX2HNqPuCp0=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=C7DQHnqlJUCOq/IgM2SmAd2SjNN4sc30pMTEvkdAb/llmPhqLZEsHU8ciVGC1ZI4c
	 P5SNvHvTRQ95oa7UFlxtiFlnGM0NUbBwuMQo22b0ZhdUStNipJf0UQgsNaz+k2urA+
	 57a0z1T7eVVbOcx8i4D2ogtjon9bzYt1A8J+dGkI=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56NMOZIr3111854
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 23 Jul 2025 17:24:35 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 23
 Jul 2025 17:24:34 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 23 Jul 2025 17:24:34 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56NMOYGJ3669175;
	Wed, 23 Jul 2025 17:24:34 -0500
Message-ID: <8613b126-9e11-4dee-a24e-c84e0b7e4c6f@ti.com>
Date: Wed, 23 Jul 2025 17:24:34 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master/scarthgap][PATCH v2 2/2] meta-ti-bsp: Add
 KERNEL_DEVICETREE_PREFIX logic to Poky images
To: <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20250723213256.17071-1-reatmon@ti.com>
 <20250723213256.17071-2-reatmon@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250723213256.17071-2-reatmon@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 23 Jul 2025 22:24:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18819

On 7/23/25 4:32 PM, Ryan Eatmon via lists.yoctoproject.org wrote:
> The boot partition for things like the wic image, use the
> KERNEL_DEVICETREE to populate DTBs.  But for the meta-ti-bsp kernels we
> tend to rely on the KERNEL_DEVICETREE_PREFIX to glob pull in DTBs
> instead of a single list.  So using dynamic layers, we can inject the
> proper code to properly resolve the KERNEL_DEVICETREE in each image
> file.
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---

So will we need to do this for all images then, even custom ones? Seems messy,
is there no way we can bubble up this KERNEL_DEVICETREE_PREFIX support into
a more core layer. It seems like something that would be useful beyond just TI.

Maybe we could find a way with a custom kernel-devicetree.bbclass in our layer
until then also.

Andrew

> v2: Changed guard variable from poky to ti-soc and renamed .inc file.
> 
>   meta-ti-bsp/conf/layer.conf                                      | 1 +
>   .../recipes-core/images/core-image-base.bbappend}                | 0
>   .../recipes-core/images/core-image-minimal.bbappend}             | 0
>   .../{meta-arago-distro => core}/recipes-core/images/image-ti.inc | 0
>   4 files changed, 1 insertion(+)
>   copy meta-ti-bsp/dynamic-layers/{meta-arago-distro/recipes-core/images/tisdk-base-image.bbappend => core/recipes-core/images/core-image-base.bbappend} (100%)
>   copy meta-ti-bsp/dynamic-layers/{meta-arago-distro/recipes-core/images/tisdk-base-image.bbappend => core/recipes-core/images/core-image-minimal.bbappend} (100%)
>   copy meta-ti-bsp/dynamic-layers/{meta-arago-distro => core}/recipes-core/images/image-ti.inc (100%)
> 
> diff --git a/meta-ti-bsp/conf/layer.conf b/meta-ti-bsp/conf/layer.conf
> index 02519f76..828814ce 100644
> --- a/meta-ti-bsp/conf/layer.conf
> +++ b/meta-ti-bsp/conf/layer.conf
> @@ -25,6 +25,7 @@ LAYERRECOMMENDS_meta-ti-bsp = " \
>   BBFILES_DYNAMIC += " \
>       meta-arago-distro:${LAYERDIR}/dynamic-layers/meta-arago-distro/recipes*/*/*.bbappend \
>       openembedded-layer:${LAYERDIR}/dynamic-layers/openembedded-layer/recipes*/*/*.bbappend \
> +    core:${LAYERDIR}/dynamic-layers/core/recipes*/*/*.bbappend \
>   "
>   
>   SIGGEN_EXCLUDERECIPES_ABISAFE += " \
> diff --git a/meta-ti-bsp/dynamic-layers/meta-arago-distro/recipes-core/images/tisdk-base-image.bbappend b/meta-ti-bsp/dynamic-layers/core/recipes-core/images/core-image-base.bbappend
> similarity index 100%
> copy from meta-ti-bsp/dynamic-layers/meta-arago-distro/recipes-core/images/tisdk-base-image.bbappend
> copy to meta-ti-bsp/dynamic-layers/core/recipes-core/images/core-image-base.bbappend
> diff --git a/meta-ti-bsp/dynamic-layers/meta-arago-distro/recipes-core/images/tisdk-base-image.bbappend b/meta-ti-bsp/dynamic-layers/core/recipes-core/images/core-image-minimal.bbappend
> similarity index 100%
> copy from meta-ti-bsp/dynamic-layers/meta-arago-distro/recipes-core/images/tisdk-base-image.bbappend
> copy to meta-ti-bsp/dynamic-layers/core/recipes-core/images/core-image-minimal.bbappend
> diff --git a/meta-ti-bsp/dynamic-layers/meta-arago-distro/recipes-core/images/image-ti.inc b/meta-ti-bsp/dynamic-layers/core/recipes-core/images/image-ti.inc
> similarity index 100%
> copy from meta-ti-bsp/dynamic-layers/meta-arago-distro/recipes-core/images/image-ti.inc
> copy to meta-ti-bsp/dynamic-layers/core/recipes-core/images/image-ti.inc
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#18818): https://lists.yoctoproject.org/g/meta-ti/message/18818
> Mute This Topic: https://lists.yoctoproject.org/mt/114311625/3619733
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [afd@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


