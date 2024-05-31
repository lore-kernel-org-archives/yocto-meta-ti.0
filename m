Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A2F8C25B75
	for <webhook@archiver.kernel.org>; Fri, 31 May 2024 19:48:21 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.22690.1717184891442017854
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 31 May 2024 12:48:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=BjQtaZmA;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 44VJmABO112341;
	Fri, 31 May 2024 14:48:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1717184890;
	bh=ABwuFwCzjekfWFxgowngFAZNz64NbvdMeVTCWJpFTAE=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=BjQtaZmAkrFW0ZF9YQBopY7QV0Z0VC44JkNelzJlu7QqDdTW4CvZukt+pL58LkN3+
	 wl5JEhfYjnEhagx3Kz8Urzu22IxFRJbXlcNnQ0jHM5nkIk9OoVaxj6aj8U8s4+ZFbB
	 8+SUHvZlbpMH03ZsHXQQIIGAhGFzOD3j2rGJZW3M=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 44VJmA5s120613
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 31 May 2024 14:48:10 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 31
 May 2024 14:48:10 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 31 May 2024 14:48:10 -0500
Received: from [10.249.34.39] ([10.249.34.39])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 44VJmAO7058164;
	Fri, 31 May 2024 14:48:10 -0500
Message-ID: <943f754b-550a-4be5-8b26-e11f9d2e5f01@ti.com>
Date: Fri, 31 May 2024 14:48:09 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master/scarthgap][PATCH 1/2] conf: machine: Fallback to
 software rendering
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20240531194540.24017-1-reatmon@ti.com>
 <17D4AA6CCF2F048C.14802@lists.yoctoproject.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <17D4AA6CCF2F048C.14802@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 31 May 2024 19:48:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17689

Ignore this.  I didn't realize this patch was still in the directory 
when I sent all the patches in...

On 5/31/2024 2:45 PM, Ryan Eatmon via lists.yoctoproject.org wrote:
> While we are working to finish our kernel migration 6.6, we are falling
> aback to software rendering for platforms that do not currently have a
> solution for GPU drivers (namely the boards that use SGX).
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>   meta-ti-bsp/conf/machine/include/am65xx.inc   | 2 +-
>   meta-ti-bsp/conf/machine/include/omap-a15.inc | 2 +-
>   meta-ti-bsp/conf/machine/include/ti33x.inc    | 2 +-
>   meta-ti-bsp/conf/machine/include/ti43x.inc    | 2 +-
>   4 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/meta-ti-bsp/conf/machine/include/am65xx.inc b/meta-ti-bsp/conf/machine/include/am65xx.inc
> index 80a7744a..48b89638 100644
> --- a/meta-ti-bsp/conf/machine/include/am65xx.inc
> +++ b/meta-ti-bsp/conf/machine/include/am65xx.inc
> @@ -4,7 +4,7 @@ SOC_FAMILY:append = ":am65xx"
>   MACHINE_FEATURES += "screen touchscreen gpu"
>   
>   require conf/machine/include/mesa-pvr.inc
> -PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-sgx-ddk-km"
> +PREFERRED_PROVIDER_virtual/gpudriver ?= ""
>   
>   KERNEL_DEVICETREE_PREFIX = "ti/k3-am654"
>   
> diff --git a/meta-ti-bsp/conf/machine/include/omap-a15.inc b/meta-ti-bsp/conf/machine/include/omap-a15.inc
> index a875713f..9ca41403 100644
> --- a/meta-ti-bsp/conf/machine/include/omap-a15.inc
> +++ b/meta-ti-bsp/conf/machine/include/omap-a15.inc
> @@ -13,7 +13,7 @@ PREFERRED_PROVIDER_u-boot ?= "u-boot-ti-staging"
>   
>   # Graphics providers and variables
>   require conf/machine/include/mesa-pvr.inc
> -PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-sgx-ddk-km"
> +PREFERRED_PROVIDER_virtual/gpudriver ?= ""
>   PVR_DISPLAY_CONTROLLER_ALIAS ?= "omapdrm"
>   
>   KERNEL_IMAGETYPE = "zImage"
> diff --git a/meta-ti-bsp/conf/machine/include/ti33x.inc b/meta-ti-bsp/conf/machine/include/ti33x.inc
> index b0ed1c69..6fd65b2d 100644
> --- a/meta-ti-bsp/conf/machine/include/ti33x.inc
> +++ b/meta-ti-bsp/conf/machine/include/ti33x.inc
> @@ -14,7 +14,7 @@ PREFERRED_PROVIDER_u-boot ?= "u-boot-ti-staging"
>   
>   # Graphics providers and variables
>   require conf/machine/include/mesa-pvr.inc
> -PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-sgx-ddk-km"
> +PREFERRED_PROVIDER_virtual/gpudriver ?= ""
>   PVR_DISPLAY_CONTROLLER_ALIAS ?= "tilcdc"
>   
>   KERNEL_IMAGETYPE = "zImage"
> diff --git a/meta-ti-bsp/conf/machine/include/ti43x.inc b/meta-ti-bsp/conf/machine/include/ti43x.inc
> index 17ca5240..0a3ef4c3 100644
> --- a/meta-ti-bsp/conf/machine/include/ti43x.inc
> +++ b/meta-ti-bsp/conf/machine/include/ti43x.inc
> @@ -14,7 +14,7 @@ PREFERRED_PROVIDER_u-boot ?= "u-boot-ti-staging"
>   
>   # Graphics providers and variables
>   require conf/machine/include/mesa-pvr.inc
> -PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-sgx-ddk-km"
> +PREFERRED_PROVIDER_virtual/gpudriver ?= ""
>   PVR_DISPLAY_CONTROLLER_ALIAS ?= "omapdrm"
>   
>   KERNEL_IMAGETYPE = "zImage"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#17686): https://lists.yoctoproject.org/g/meta-ti/message/17686
> Mute This Topic: https://lists.yoctoproject.org/mt/106415247/6551054
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [reatmon@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

