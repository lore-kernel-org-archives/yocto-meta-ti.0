Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68D70C71153
	for <webhook@archiver.kernel.org>; Mon, 11 Sep 2023 19:38:18 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.7289.1694461092067373165
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 11 Sep 2023 12:38:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=QFf4ZOcB;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: c-shilwant@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 38BJcBVf019657
	for <meta-ti@lists.yoctoproject.org>; Mon, 11 Sep 2023 14:38:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1694461091;
	bh=uIYsk8E0uXX3ZxJ9n3XYXqUZ6GCP5+Cgh25xud3heWE=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=QFf4ZOcBhld2lt784JSA7UNbdFQiJOaYS0KjBLlhefv7mHr0AK0PQ5CSNTImraewI
	 k74y5EluOia9Zk/3Quiv7hkZLWEGyOUtkkOphfKsbZNklWGZXy0xiiICZ6+ckY88ii
	 5t5F4U3dM1exwgcvPHqSVVukWB/CaQVMn4oe+N2Y=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 38BJcBQb017501
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 11 Sep 2023 14:38:11 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 11
 Sep 2023 14:38:10 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 11 Sep 2023 14:38:10 -0500
Received: from [172.24.227.238] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 38BJc9kZ025558
	for <meta-ti@lists.yoctoproject.org>; Mon, 11 Sep 2023 14:38:10 -0500
Message-ID: <9a306a4f-473b-fd0a-f63d-6825faa8fd1a@ti.com>
Date: Tue, 12 Sep 2023 01:08:09 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [EXTERNAL] [meta-ti][master/kirkstone][PATCH]
 conf/machine/include/am65xx,omap-a15,ti33x,ti43x: Enable gpudriver
Content-Language: en-US
To: <meta-ti@lists.yoctoproject.org>
References: <20230825171501.25609-1-reatmon@ti.com>
From: Chirag Shilwant <c-shilwant@ti.com>
In-Reply-To: <20230825171501.25609-1-reatmon@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 11 Sep 2023 19:38:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16948


On 25/08/23 22:45, Ryan Eatmon via lists.yoctoproject.org wrote:
> Now that we have a solution for the SGX parts we can enable gpudriver
> support for the affected platforms.
>
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>

Reviewed-by: Chirag Shilwant <c-shilwant@ti.com>


> ---
>   meta-ti-bsp/conf/machine/include/am65xx.inc   | 2 +-
>   meta-ti-bsp/conf/machine/include/omap-a15.inc | 2 +-
>   meta-ti-bsp/conf/machine/include/ti33x.inc    | 2 +-
>   meta-ti-bsp/conf/machine/include/ti43x.inc    | 2 +-
>   4 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/meta-ti-bsp/conf/machine/include/am65xx.inc b/meta-ti-bsp/conf/machine/include/am65xx.inc
> index 405d82ad..2c427b88 100644
> --- a/meta-ti-bsp/conf/machine/include/am65xx.inc
> +++ b/meta-ti-bsp/conf/machine/include/am65xx.inc
> @@ -4,7 +4,7 @@ SOC_FAMILY:append = ":am65xx"
>   MACHINE_FEATURES += "screen touchscreen gpu"
>   
>   require conf/machine/include/mesa-pvr.inc
> -PREFERRED_PROVIDER_virtual/gpudriver ?= ""
> +PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-sgx-ddk-km"
>   
>   KERNEL_DEVICETREE_PREFIX = "ti/k3-am654"
>   
> diff --git a/meta-ti-bsp/conf/machine/include/omap-a15.inc b/meta-ti-bsp/conf/machine/include/omap-a15.inc
> index c9d16f3c..c1eb659b 100644
> --- a/meta-ti-bsp/conf/machine/include/omap-a15.inc
> +++ b/meta-ti-bsp/conf/machine/include/omap-a15.inc
> @@ -13,7 +13,7 @@ PREFERRED_PROVIDER_u-boot ?= "u-boot-ti-staging"
>   
>   # Graphics providers and variables
>   require conf/machine/include/mesa-pvr.inc
> -PREFERRED_PROVIDER_virtual/gpudriver ?= ""
> +PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-sgx-ddk-km"
>   PVR_DISPLAY_CONTROLLER_ALIAS ?= "omapdrm"
>   
>   KERNEL_IMAGETYPE = "zImage"
> diff --git a/meta-ti-bsp/conf/machine/include/ti33x.inc b/meta-ti-bsp/conf/machine/include/ti33x.inc
> index ad19798d..567cf128 100644
> --- a/meta-ti-bsp/conf/machine/include/ti33x.inc
> +++ b/meta-ti-bsp/conf/machine/include/ti33x.inc
> @@ -14,7 +14,7 @@ PREFERRED_PROVIDER_u-boot ?= "u-boot-ti-staging"
>   
>   # Graphics providers and variables
>   require conf/machine/include/mesa-pvr.inc
> -PREFERRED_PROVIDER_virtual/gpudriver ?= ""
> +PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-sgx-ddk-km"
>   PVR_DISPLAY_CONTROLLER_ALIAS ?= "tilcdc"
>   
>   KERNEL_IMAGETYPE = "zImage"
> diff --git a/meta-ti-bsp/conf/machine/include/ti43x.inc b/meta-ti-bsp/conf/machine/include/ti43x.inc
> index ea5d1505..c70a8363 100644
> --- a/meta-ti-bsp/conf/machine/include/ti43x.inc
> +++ b/meta-ti-bsp/conf/machine/include/ti43x.inc
> @@ -14,7 +14,7 @@ PREFERRED_PROVIDER_u-boot ?= "u-boot-ti-staging"
>   
>   # Graphics providers and variables
>   require conf/machine/include/mesa-pvr.inc
> -PREFERRED_PROVIDER_virtual/gpudriver ?= ""
> +PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-sgx-ddk-km"
>   PVR_DISPLAY_CONTROLLER_ALIAS ?= "omapdrm"
>   
>   KERNEL_IMAGETYPE = "zImage"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#16893): https://lists.yoctoproject.org/g/meta-ti/message/16893
> Mute This Topic: https://lists.yoctoproject.org/mt/100960025/7030289
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/leave/11470056/7030289/1265141306/xyzzy [c-shilwant@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

