Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1EE7C61DA3
	for <webhook@archiver.kernel.org>; Thu, 26 Jan 2023 18:07:54 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.81270.1674756465742888387
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 26 Jan 2023 10:07:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=TsscqN5R;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 30QI7jBD088985
	for <meta-ti@lists.yoctoproject.org>; Thu, 26 Jan 2023 12:07:45 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1674756465;
	bh=vl6XmtL3KYmdrMgdxWq3mOrHKQ9NSTtx2kiEkGUC6I8=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=TsscqN5ReWzZtXxoilY2VudR0m7SHkpBawT9P7eXMQsYAfi26ngvZEI8a+b/zt+x3
	 amMDvtKHGVNDmyeioiqCj9bPojPSxuYK7uj2VydK/rHWs4Z57vaNnaPybgAm6SyOYX
	 EkGcv5lRf9a9Q7iRN2DcpQLIiLM6ghtkvXQt6M0Q=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 30QI7j74108988
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 26 Jan 2023 12:07:45 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Thu, 26
 Jan 2023 12:07:44 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Thu, 26 Jan 2023 12:07:44 -0600
Received: from [10.250.32.60] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 30QI7he6071923;
	Thu, 26 Jan 2023 12:07:43 -0600
Message-ID: <20095955-a41d-6e1d-70ba-76f6bbfcb884@ti.com>
Date: Thu, 26 Jan 2023 12:07:42 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [kirkstone PATCH 4/4] meta-ti-bsp: machine: Attempt to update DC
 alias
Content-Language: en-US
To: Randolph Sapp <rs@ti.com>, <denys@ti.com>, <reatmon@ti.com>,
        <detheridge@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <k-bhargav@ti.com>
References: <20230126030834.3889448-1-rs@ti.com>
 <20230126030834.3889448-5-rs@ti.com>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20230126030834.3889448-5-rs@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 26 Jan 2023 18:07:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15679

On 1/25/23 9:08 PM, Randolph Sapp wrote:
> Attempt to update the SGX display controller alias variable according to
> what Andrew told me. SGX apparently had a few different aliases across
> platforms.
> 

This Andrew seems like a smart fellow as these all look correct :)

Acked-by: Andrew Davis <afd@ti.com>

> Signed-off-by: Randolph Sapp <rs@ti.com>
> ---
>   meta-ti-bsp/conf/machine/include/omap-a15.inc | 3 +++
>   meta-ti-bsp/conf/machine/include/ti33x.inc    | 3 +++
>   meta-ti-bsp/conf/machine/include/ti43x.inc    | 3 +++
>   3 files changed, 9 insertions(+)
> 
> diff --git a/meta-ti-bsp/conf/machine/include/omap-a15.inc b/meta-ti-bsp/conf/machine/include/omap-a15.inc
> index efa33a10..e5349134 100644
> --- a/meta-ti-bsp/conf/machine/include/omap-a15.inc
> +++ b/meta-ti-bsp/conf/machine/include/omap-a15.inc
> @@ -10,7 +10,10 @@ MACHINE_KERNEL_PR = "r7"
>   PREFERRED_PROVIDER_virtual/kernel ?= "linux-ti-staging"
>   PREFERRED_PROVIDER_virtual/bootloader ?= "u-boot-ti-staging"
>   PREFERRED_PROVIDER_u-boot ?= "u-boot-ti-staging"
> +
> +# Graphics providers and variables
>   PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-sgx-ddk-km"
> +PVR_DISPLAY_CONTROLLER_ALIAS ?= "omapdrm"
>   
>   KERNEL_IMAGETYPE = "zImage"
>   KERNEL_IMAGETYPES = "zImage uImage"
> diff --git a/meta-ti-bsp/conf/machine/include/ti33x.inc b/meta-ti-bsp/conf/machine/include/ti33x.inc
> index e2f75359..97c7d3c8 100644
> --- a/meta-ti-bsp/conf/machine/include/ti33x.inc
> +++ b/meta-ti-bsp/conf/machine/include/ti33x.inc
> @@ -11,7 +11,10 @@ MACHINE_KERNEL_PR = "r22"
>   PREFERRED_PROVIDER_virtual/kernel ?= "linux-ti-staging"
>   PREFERRED_PROVIDER_virtual/bootloader ?= "u-boot-ti-staging"
>   PREFERRED_PROVIDER_u-boot ?= "u-boot-ti-staging"
> +
> +# Graphics providers and variables
>   PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-sgx-ddk-km"
> +PVR_DISPLAY_CONTROLLER_ALIAS ?= "tilcdc"
>   
>   KERNEL_IMAGETYPE = "zImage"
>   
> diff --git a/meta-ti-bsp/conf/machine/include/ti43x.inc b/meta-ti-bsp/conf/machine/include/ti43x.inc
> index e9999910..ddd430d5 100644
> --- a/meta-ti-bsp/conf/machine/include/ti43x.inc
> +++ b/meta-ti-bsp/conf/machine/include/ti43x.inc
> @@ -11,7 +11,10 @@ MACHINE_KERNEL_PR = "r3"
>   PREFERRED_PROVIDER_virtual/kernel ?= "linux-ti-staging"
>   PREFERRED_PROVIDER_virtual/bootloader ?= "u-boot-ti-staging"
>   PREFERRED_PROVIDER_u-boot ?= "u-boot-ti-staging"
> +
> +# Graphics providers and variables
>   PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-sgx-ddk-km"
> +PVR_DISPLAY_CONTROLLER_ALIAS ?= "omapdrm"
>   
>   KERNEL_IMAGETYPE = "zImage"
>   

