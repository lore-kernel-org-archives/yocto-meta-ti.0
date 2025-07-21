Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C37D3C83F1A
	for <webhook@archiver.kernel.org>; Mon, 21 Jul 2025 20:37:25 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.52352.1753130238672821072
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 21 Jul 2025 13:37:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=R3+KYcKq;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: reatmon@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56LKbH3N887286;
	Mon, 21 Jul 2025 15:37:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1753130237;
	bh=5U1QjbGIrVxZb02euPCo5bEGQadcUrFPazN4AdPnH5M=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=R3+KYcKqr6muSazMdUPwKwA5Lz6zpbS76PmCPVk8rbZvgA+ACOic41EBEJfONzdqH
	 w/t7+rJJo8+pVk74F/GnzZpZoQSzpTKgt2AkMsyAhmposeuwA+DcoVtiHvL4DBZLJY
	 H6y4yCVNA1WtDwxW0tT9JpHTWJH3pKV3GkoIEGYU=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56LKbHTW1608196
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 21 Jul 2025 15:37:17 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 21
 Jul 2025 15:37:17 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 21 Jul 2025 15:37:17 -0500
Received: from [10.249.37.202] ([10.249.37.202])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56LKbHZx215110;
	Mon, 21 Jul 2025 15:37:17 -0500
Message-ID: <4f781891-fc7d-4e4c-a9d3-97418e2a6bf3@ti.com>
Date: Mon, 21 Jul 2025 15:37:17 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master/scarthgap][PATCH 2/2] meta-ti-bsp: Add
 KERNEL_DEVICETREE_PREFIX logic to Poky images
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20250721164531.7051-1-reatmon@ti.com>
 <185452045E457140.8282@lists.yoctoproject.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <185452045E457140.8282@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 21 Jul 2025 20:37:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18805



On 7/21/2025 11:45 AM, Ryan Eatmon via lists.yoctoproject.org wrote:
> The boot partition for things like the wic image, use the
> KERNEL_DEVICETREE to populate DTBs.  But for the meta-ti-bsp kernels we
> tend to rely on the KERNEL_DEVICETREE_PREFIX to glob pull in DTBs
> instead of a single list.  So using dynamic layers, we can inject the
> proper code to properly resolve the KERNEL_DEVICETREE in each image
> file.
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>   meta-ti-bsp/conf/layer.conf                                   | 1 +
>   .../core/recipes-core/images/core-image-base.bbappend         | 4 ++++
>   .../core/recipes-core/images/core-image-minimal.bbappend      | 4 ++++
>   .../recipes-core/images/image-poky.inc}                       | 0
>   4 files changed, 9 insertions(+)
>   create mode 100644 meta-ti-bsp/dynamic-layers/core/recipes-core/images/core-image-base.bbappend
>   create mode 100644 meta-ti-bsp/dynamic-layers/core/recipes-core/images/core-image-minimal.bbappend
>   copy meta-ti-bsp/dynamic-layers/{meta-arago-distro/recipes-core/images/image-arago.inc => core/recipes-core/images/image-poky.inc} (100%)
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
> diff --git a/meta-ti-bsp/dynamic-layers/core/recipes-core/images/core-image-base.bbappend b/meta-ti-bsp/dynamic-layers/core/recipes-core/images/core-image-base.bbappend
> new file mode 100644
> index 00000000..b6c70dc5
> --- /dev/null
> +++ b/meta-ti-bsp/dynamic-layers/core/recipes-core/images/core-image-base.bbappend
> @@ -0,0 +1,4 @@
> +IMAGE_POKY = ""
> +IMAGE_POKY:poky = "image-poky.inc"

I just realized that I meant to use ti-soc as the guard and not "poky". 
So only apply this bbappend logic if you are actually building a ti-soc 
part.

This is not a critical change, but I'll send a v2 with this change for 
both patches.


> +
> +require ${IMAGE_POKY}
> diff --git a/meta-ti-bsp/dynamic-layers/core/recipes-core/images/core-image-minimal.bbappend b/meta-ti-bsp/dynamic-layers/core/recipes-core/images/core-image-minimal.bbappend
> new file mode 100644
> index 00000000..b6c70dc5
> --- /dev/null
> +++ b/meta-ti-bsp/dynamic-layers/core/recipes-core/images/core-image-minimal.bbappend
> @@ -0,0 +1,4 @@
> +IMAGE_POKY = ""
> +IMAGE_POKY:poky = "image-poky.inc"
> +
> +require ${IMAGE_POKY}
> diff --git a/meta-ti-bsp/dynamic-layers/meta-arago-distro/recipes-core/images/image-arago.inc b/meta-ti-bsp/dynamic-layers/core/recipes-core/images/image-poky.inc
> similarity index 100%
> copy from meta-ti-bsp/dynamic-layers/meta-arago-distro/recipes-core/images/image-arago.inc
> copy to meta-ti-bsp/dynamic-layers/core/recipes-core/images/image-poky.inc
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#18803): https://lists.yoctoproject.org/g/meta-ti/message/18803
> Mute This Topic: https://lists.yoctoproject.org/mt/114271595/6551054
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [reatmon@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

