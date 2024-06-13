Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B025BC27C4F
	for <webhook@archiver.kernel.org>; Thu, 13 Jun 2024 19:29:49 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.1594.1718306981873404437
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 13 Jun 2024 12:29:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=e1rk5dZA;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45DJTY8x053407;
	Thu, 13 Jun 2024 14:29:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1718306974;
	bh=QARZGGm6Y+fvPWcWGkPd/N+g/MJQSmqUh8XPljegTCQ=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=e1rk5dZA9DsXcq5e6MG34wbYmQpZSMF0yL5ySuJzvukNxZKxTTuyQkHrtNgKPk/GK
	 xh0Sn4/RkzFE2FFPLrNWXnNEFoNZFaM1OITUWPA817oFn3gFfJtqWyFBIIVPGiJUE8
	 hSPMd3dnP+UiwGMCP2k39wdTS7J10SnKKXFcNo+I=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45DJTYp3068352
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 13 Jun 2024 14:29:34 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 13
 Jun 2024 14:29:34 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 13 Jun 2024 14:29:34 -0500
Received: from [10.249.34.39] ([10.249.34.39])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45DJTYrK004617;
	Thu, 13 Jun 2024 14:29:34 -0500
Message-ID: <28a0c396-3450-45b7-b411-fba68f06f129@ti.com>
Date: Thu, 13 Jun 2024 14:29:34 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] [master/scarthgap][PATCH 1/4] conf/machine, ti-bsp: add
 support for multiple BSP providers
To: Denys Dmytriyenko <denis@denix.org>, <meta-ti@lists.yoctoproject.org>
CC: Denys Dmytriyenko <denys@konsulko.com>
References: <20240613172254.770920-1-denis@denix.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20240613172254.770920-1-denis@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 13 Jun 2024 19:29:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17723



On 6/13/2024 12:22 PM, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@konsulko.com>
> 
> This adds a facility to define multiple supported BSPs with their own
> preferences for individual components, as well as lets machine configs
> specify conditional configurations for different BSPs.
> 
> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> ---

<snip>

> +
> +# ==========
> +# ti-6_6
> +# TI staging kernel 6.6, u-boot 2024.04
> +# ==========
> +BSP_KERNEL_PROVIDER:bsp-ti-6_6 = "linux-ti-staging"
> +BSP_KERNEL_VERSION:bsp-ti-6_6 = "6.6%"
> +BSP_BOOTLOADER_PROVIDER:bsp-ti-6_6 = "u-boot-ti-staging"
> +BSP_BOOTLOADER_VERSION:bsp-ti-6_6 = "2024%"
> +
> +# Only Rogue is enabled so far, SGX falls back to SW rendering
> +BSP_ROGUE_DRIVER_PROVIDER:bsp-ti-6_6 = "ti-img-rogue-driver"
> +BSP_ROGUE_DRIVER_VERSION:bsp-ti-6_6 = "24%"
> +BSP_ROGUE_UMLIBS_VERSION:bsp-ti-6_6 = "24%"
> +BSP_MESA_PVR_VERSION:bsp-ti-6_6 = "23%"
> +
> +# ==========
> +# ti-6_1
> +# TI staging kernel 6.1, u-boot 2023.04
> +# ==========
> +BSP_KERNEL_PROVIDER:bsp-ti-6_1 = "linux-ti-staging"
> +BSP_KERNEL_VERSION:bsp-ti-6_1 = "6.1%"
> +BSP_BOOTLOADER_PROVIDER:bsp-ti-6_1 = "u-boot-ti-staging"
> +BSP_BOOTLOADER_VERSION:bsp-ti-6_1 = "2023%"
> +
> +BSP_SGX_DRIVER_PROVIDER:bsp-ti-6_1 = "ti-sgx-ddk-km"
> +BSP_SGX_DRIVER_VERSION:bsp-ti-6_1 = "1.17%"
> +BSP_SGX_UMLIBS_VERSION:bsp-ti-6_1 = "1.17%"
> +BSP_ROGUE_DRIVER_PROVIDER:bsp-ti-6_1 = "ti-img-rogue-driver"
> +BSP_ROGUE_DRIVER_VERSION:bsp-ti-6_1 = "23%"
> +BSP_ROGUE_UMLIBS_VERSION:bsp-ti-6_1 = "23%"
> +BSP_MESA_PVR_VERSION:bsp-ti-6_1 = "22%"

I wonder if I can use this same system to support the upstream 
testing...  After we accept this series I need to look at how the 
upstream testing flow can leverage this concept.



-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

