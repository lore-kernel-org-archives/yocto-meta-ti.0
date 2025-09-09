Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68742CAC582
	for <webhook@archiver.kernel.org>; Tue,  9 Sep 2025 20:42:15 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.1295.1757450525864264058
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 09 Sep 2025 13:42:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=JG0BhOsU;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: reatmon@ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 589Kg48S419489;
	Tue, 9 Sep 2025 15:42:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757450524;
	bh=xQpNf5UQekYP3oR3m5j2VeAH2OafSpAgsF4d6/X1lAM=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=JG0BhOsUfkVkV3SEC2e/Ll8ZCBlZkDUpxZjkMakuqTk+I3Qj6XbkmriamwvU7825g
	 nBjII4nA9BjDOX+ie/liOIiENd8tU8gd5UZEB0aEYy5MmIs0G86NQ+Gxpya+s19qez
	 VWHOK5K6tCwen8BoZ2IKd9LRtXBe9Gk24e+o0uWk=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 589Kg4AK3410528
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 9 Sep 2025 15:42:04 -0500
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 9
 Sep 2025 15:42:04 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 9 Sep 2025 15:42:04 -0500
Received: from [128.247.81.40] (dtmz023nlv.dhcp.ti.com [128.247.81.40])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 589Kg4TG3290186;
	Tue, 9 Sep 2025 15:42:04 -0500
Message-ID: <fd0d9488-7d3d-42d5-8c06-abeca2e6c7c0@ti.com>
Date: Tue, 9 Sep 2025 15:42:04 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][scarthgap][RFC 3/6] ti-bsp: Use same version for both
 UM and KM driver
To: Andrew Davis <afd@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
        Randolph Sapp <rs@ti.com>, <meta-ti@lists.yoctoproject.org>
References: <20250909151028.272925-1-afd@ti.com>
 <20250909151028.272925-3-afd@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20250909151028.272925-3-afd@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 09 Sep 2025 20:42:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18989



On 9/9/2025 10:10 AM, Andrew Davis wrote:
> The DRIVER and matching UMLIBS must always match, no need to define a
> version number for both. Keep this simple and remove the extra defines.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
>   meta-beagle/conf/machine/include/beagle-bsp.inc |  4 ----
>   meta-ti-bsp/conf/machine/include/ti-bsp.inc     | 10 ++--------
>   2 files changed, 2 insertions(+), 12 deletions(-)
> 
> diff --git a/meta-beagle/conf/machine/include/beagle-bsp.inc b/meta-beagle/conf/machine/include/beagle-bsp.inc
> index d180c297..448e2086 100644
> --- a/meta-beagle/conf/machine/include/beagle-bsp.inc
> +++ b/meta-beagle/conf/machine/include/beagle-bsp.inc
> @@ -18,10 +18,8 @@ KERNEL_DEVICETREE_PREFIX:bsp-bb_org-6_12 = ""
>   
>   BSP_SGX_DRIVER_PROVIDER:bsp-bb_org-6_12 = "ti-sgx-ddk-km"
>   BSP_SGX_DRIVER_VERSION:bsp-bb_org-6_12 = "1.17%"
> -BSP_SGX_UMLIBS_VERSION:bsp-bb_org-6_12 = "1.17%"
>   BSP_ROGUE_DRIVER_PROVIDER:bsp-bb_org-6_12 = "ti-img-rogue-driver"
>   BSP_ROGUE_DRIVER_VERSION:bsp-bb_org-6_12 = "24%"
> -BSP_ROGUE_UMLIBS_VERSION:bsp-bb_org-6_12 = "24%"
>   BSP_MESA_PVR_VERSION:bsp-bb_org-6_12 = "24%"
>   
>   # GC320 support requires out-of-tree drivers not yet available in bb.org 6.12
> @@ -41,10 +39,8 @@ KERNEL_DEVICETREE_PREFIX:bsp-bb_org-6_6 = ""
>   
>   BSP_SGX_DRIVER_PROVIDER:bsp-bb_org-6_6 = "ti-sgx-ddk-km"
>   BSP_SGX_DRIVER_VERSION:bsp-bb_org-6_6 = "1.17%"
> -BSP_SGX_UMLIBS_VERSION:bsp-bb_org-6_6 = "1.17%"
>   BSP_ROGUE_DRIVER_PROVIDER:bsp-bb_org-6_6 = "ti-img-rogue-driver"
>   BSP_ROGUE_DRIVER_VERSION:bsp-bb_org-6_6 = "24%"
> -BSP_ROGUE_UMLIBS_VERSION:bsp-bb_org-6_6 = "24%"
>   BSP_MESA_PVR_VERSION:bsp-bb_org-6_6 = "24%"
>   
>   # GC320 support requires out-of-tree drivers not yet available in bb.org 6.6
> diff --git a/meta-ti-bsp/conf/machine/include/ti-bsp.inc b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
> index a5d9a51f..dc0473de 100644
> --- a/meta-ti-bsp/conf/machine/include/ti-bsp.inc
> +++ b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
> @@ -44,10 +44,8 @@ BSP_BOOTLOADER_VERSION:bsp-ti-6_12 = "2025.01%"
>   
>   BSP_SGX_DRIVER_PROVIDER:bsp-ti-6_12 = "ti-sgx-ddk-km"
>   BSP_SGX_DRIVER_VERSION:bsp-ti-6_12 = "1.17%"
> -BSP_SGX_UMLIBS_VERSION:bsp-ti-6_12 = "1.17%"
>   BSP_ROGUE_DRIVER_PROVIDER:bsp-ti-6_12 = "ti-img-rogue-driver"
>   BSP_ROGUE_DRIVER_VERSION:bsp-ti-6_12 = "24%"
> -BSP_ROGUE_UMLIBS_VERSION:bsp-ti-6_12 = "24%"
>   BSP_MESA_PVR_VERSION:bsp-ti-6_12 = "24%"
>   
>   # ==========
> @@ -61,10 +59,8 @@ BSP_BOOTLOADER_VERSION:bsp-ti-6_6 = "2024.04%"
>   
>   BSP_SGX_DRIVER_PROVIDER:bsp-ti-6_6 = "ti-sgx-ddk-km"
>   BSP_SGX_DRIVER_VERSION:bsp-ti-6_6 = "1.17%"
> -BSP_SGX_UMLIBS_VERSION:bsp-ti-6_6 = "1.17%"
>   BSP_ROGUE_DRIVER_PROVIDER:bsp-ti-6_6 = "ti-img-rogue-driver"
>   BSP_ROGUE_DRIVER_VERSION:bsp-ti-6_6 = "24%"
> -BSP_ROGUE_UMLIBS_VERSION:bsp-ti-6_6 = "24%"
>   BSP_MESA_PVR_VERSION:bsp-ti-6_6 = "24%"
>   
>   # GC320 support requires out-of-tree drivers not yet available in 6.6
> @@ -84,8 +80,6 @@ BSP_SGX_DRIVER_PROVIDER ?= ""
>   BSP_SGX_DRIVER_VERSION ?= ""
>   BSP_ROGUE_DRIVER_PROVIDER ?= ""
>   BSP_ROGUE_DRIVER_VERSION ?= ""
> -BSP_SGX_UMLIBS_VERSION ?= ""
> -BSP_ROGUE_UMLIBS_VERSION ?= ""
>   BSP_MESA_PVR_VERSION ?= ""
>   
>   # ==========
> @@ -101,7 +95,7 @@ PREFERRED_VERSION_${BSP_BOOTLOADER_PROVIDER} ?= "${BSP_BOOTLOADER_VERSION}"
>   # GPU provider gets set in machine configs, as some machines are headless
>   # Select default preferred versions here
>   PREFERRED_VERSION_ti-sgx-ddk-km ?= "${BSP_SGX_DRIVER_VERSION}"
> -PREFERRED_VERSION_ti-sgx-ddk-um ?= "${BSP_SGX_UMLIBS_VERSION}"
> +PREFERRED_VERSION_ti-sgx-ddk-um ?= "${BSP_SGX_DRIVER_VERSION}"

Since we are simplifying, do we want to take it further and rename the 
XXX_DRIVER_VERSION to just XXX_VERSION?

BSP_ROGUE_DRIVER_VERSION -> BSP_ROGUE_VERSION
BSP_SGX_DRIVER_VERSION -> BSP_SGX_VERSION

>   PREFERRED_VERSION_ti-img-rogue-driver ?= "${BSP_ROGUE_DRIVER_VERSION}"
> -PREFERRED_VERSION_ti-img-rogue-umlibs ?= "${BSP_ROGUE_UMLIBS_VERSION}"
> +PREFERRED_VERSION_ti-img-rogue-umlibs ?= "${BSP_ROGUE_DRIVER_VERSION}"
>   PREFERRED_VERSION_mesa-pvr ?= "${BSP_MESA_PVR_VERSION}"

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS


