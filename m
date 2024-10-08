Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F405FCEFC31
	for <webhook@archiver.kernel.org>; Tue,  8 Oct 2024 16:34:52 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.256.1728405285790901279
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 08 Oct 2024 09:34:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=USzQ1adz;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 498GYiLj018079;
	Tue, 8 Oct 2024 11:34:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1728405284;
	bh=ajzFvQgjb2SU7FVQG641DRGYvZD6C64EXQTjId7n1oc=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=USzQ1adzU/0sik/RUqdKSk7DGCJiJbQad1U/A4kktmfxH2YtI3QQmGAxGrn5KiD3Q
	 aQoob8nPuSdiHQphyeySfEDw7bTj/b1Q4Fj2Pc7hQ2yo+2+KC0N+0DfSpBKkvNX+7+
	 PZ6BC5Q7aFp2ra69CA2BzFZ2jOJ7ZPZej/GZxb8o=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 498GYiDO040928;
	Tue, 8 Oct 2024 11:34:44 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 8
 Oct 2024 11:34:44 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 8 Oct 2024 11:34:44 -0500
Received: from [10.250.37.153] ([10.250.37.153])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 498GYhqE052743;
	Tue, 8 Oct 2024 11:34:44 -0500
Message-ID: <54a7513a-75aa-41e5-a9db-89bb48044c8e@ti.com>
Date: Tue, 8 Oct 2024 11:34:43 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master/scarthgap][PATCH] ti-bsp: Add RT and systest
 support
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <17FC8761EC6E231C.26051@lists.yoctoproject.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <17FC8761EC6E231C.26051@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 08 Oct 2024 16:34:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17985


Denys, thoughts on this?


On 10/8/2024 11:33 AM, Ryan Eatmon via lists.yoctoproject.org wrote:
> We were missing controlling the versions for linux-ti-staging-rt and
> linux-ti-staging-systest using the BSP framework.  Since the
> PREFERRED_VERSION is not tied to the virtual/kernel we need two
> additional settings for those alternate kernel package names.  For BSPs
> that do not support the RT and systest variants, just set their name to
> the main kernel package.
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>   meta-ti-bsp/conf/machine/include/ti-bsp.inc | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
> 
> diff --git a/meta-ti-bsp/conf/machine/include/ti-bsp.inc b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
> index 9a15e164..96321e03 100644
> --- a/meta-ti-bsp/conf/machine/include/ti-bsp.inc
> +++ b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
> @@ -14,6 +14,8 @@ MACHINEOVERRIDES =. "bsp-${TI_PREFERRED_BSP}:"
>   # latest upstream/mainline kernel, u-boot
>   # ==========
>   BSP_KERNEL_PROVIDER:bsp-mainline = "linux-ti-mainline"
> +BSP_KERNEL_RT_PROVIDER:bsp-mainline = "linux-ti-mainline"
> +BSP_KERNEL_SYSTEST_PROVIDER:bsp-mainline = "linux-ti-mainline"
>   BSP_KERNEL_VERSION:bsp-mainline = "%"
>   BSP_BOOTLOADER_PROVIDER:bsp-mainline = "u-boot-ti-mainline"
>   BSP_BOOTLOADER_VERSION:bsp-mainline = "%"
> @@ -27,6 +29,8 @@ MACHINE_FEATURES:remove:bsp-mainline = "gpu"
>   # upcoming upstream/mainline kernel, u-boot
>   # ==========
>   BSP_KERNEL_PROVIDER:bsp-next = "linux-ti-next"
> +BSP_KERNEL_RT_PROVIDER:bsp-next = "linux-ti-next"
> +BSP_KERNEL_SYSTEST_PROVIDER:bsp-next = "linux-ti-next"
>   BSP_KERNEL_VERSION:bsp-next = "%"
>   BSP_BOOTLOADER_PROVIDER:bsp-next = "u-boot-ti-mainline"
>   BSP_BOOTLOADER_VERSION:bsp-next = "%"
> @@ -40,6 +44,8 @@ MACHINE_FEATURES:remove:bsp-next = "gpu"
>   # TI staging kernel 6.12, u-boot 2024.10
>   # ==========
>   BSP_KERNEL_PROVIDER:bsp-ti-6_12 = "linux-ti-staging"
> +BSP_KERNEL_RT_PROVIDER:bsp-ti-6_12 = "linux-ti-staging-rt"
> +BSP_KERNEL_SYSTEST_PROVIDER:bsp-ti-6_12 = "linux-ti-staging-systest"
>   BSP_KERNEL_VERSION:bsp-ti-6_12 = "6.12%"
>   BSP_BOOTLOADER_PROVIDER:bsp-ti-6_12 = "u-boot-ti-staging"
>   BSP_BOOTLOADER_VERSION:bsp-ti-6_12 = "2024.10%"
> @@ -53,6 +59,8 @@ MACHINE_FEATURES:remove:bsp-next = "gpu"
>   # TI staging kernel 6.6, u-boot 2024.04
>   # ==========
>   BSP_KERNEL_PROVIDER:bsp-ti-6_6 = "linux-ti-staging"
> +BSP_KERNEL_RT_PROVIDER:bsp-ti-6_6 = "linux-ti-staging-rt"
> +BSP_KERNEL_SYSTEST_PROVIDER:bsp-ti-6_6 = "linux-ti-staging-systest"
>   BSP_KERNEL_VERSION:bsp-ti-6_6 = "6.6%"
>   BSP_BOOTLOADER_PROVIDER:bsp-ti-6_6 = "u-boot-ti-staging"
>   BSP_BOOTLOADER_VERSION:bsp-ti-6_6 = "2024.04%"
> @@ -68,6 +76,8 @@ BSP_MESA_PVR_VERSION:bsp-ti-6_6 = "23%"
>   # TI staging kernel 6.1, u-boot 2023.04
>   # ==========
>   BSP_KERNEL_PROVIDER:bsp-ti-6_1 = "linux-ti-staging"
> +BSP_KERNEL_RT_PROVIDER:bsp-ti-6_1 = "linux-ti-staging-rt"
> +BSP_KERNEL_SYSTEST_PROVIDER:bsp-ti-6_1 = "linux-ti-staging-systest"
>   BSP_KERNEL_VERSION:bsp-ti-6_1 = "6.1%"
>   BSP_BOOTLOADER_PROVIDER:bsp-ti-6_1 = "u-boot-ti-staging"
>   BSP_BOOTLOADER_VERSION:bsp-ti-6_1 = "2023%"
> @@ -87,6 +97,8 @@ BSP_MESA_PVR_VERSION:bsp-ti-6_1 = "22%"
>   # but may not be up-to-date with TI version
>   # ==========
>   BSP_KERNEL_PROVIDER:bsp-bb_org = "linux-bb.org"
> +BSP_KERNEL_RT_PROVIDER:bsp-bb_org = "linux-bb.org"
> +BSP_KERNEL_SYSTEST_PROVIDER:bsp-bb_org = "linux-bb.org"
>   BSP_KERNEL_VERSION:bsp-bb_org = "%"
>   BSP_BOOTLOADER_PROVIDER:bsp-bb_org = "u-boot-bb.org"
>   BSP_BOOTLOADER_VERSION:bsp-bb_org = "%"
> @@ -105,6 +117,8 @@ BSP_MESA_PVR_VERSION:bsp-bb_org = "22%"
>   # use default preference TI staging and SW-rendering graphics
>   # ==========
>   BSP_KERNEL_PROVIDER ?= "linux-ti-staging"
> +BSP_KERNEL_RT_PROVIDER ?= "linux-ti-staging-rt"
> +BSP_KERNEL_SYSTEST_PROVIDER ?= "linux-ti-staging-systest"
>   BSP_KERNEL_VERSION ?= "%"
>   BSP_BOOTLOADER_PROVIDER ?= "u-boot-ti-staging"
>   BSP_BOOTLOADER_VERSION ?= "%"
> @@ -122,6 +136,8 @@ BSP_MESA_PVR_VERSION ?= ""
>   # ==========
>   PREFERRED_PROVIDER_virtual/kernel ?= "${BSP_KERNEL_PROVIDER}"
>   PREFERRED_VERSION_${BSP_KERNEL_PROVIDER} ?= "${BSP_KERNEL_VERSION}"
> +PREFERRED_VERSION_${BSP_KERNEL_RT_PROVIDER} ?= "${BSP_KERNEL_VERSION}"
> +PREFERRED_VERSION_${BSP_KERNEL_SYSTEST_PROVIDER} ?= "${BSP_KERNEL_VERSION}"
>   PREFERRED_PROVIDER_virtual/bootloader ?= "${BSP_BOOTLOADER_PROVIDER}"
>   PREFERRED_PROVIDER_u-boot ?= "${BSP_BOOTLOADER_PROVIDER}"
>   PREFERRED_VERSION_${BSP_BOOTLOADER_PROVIDER} ?= "${BSP_BOOTLOADER_VERSION}"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#17984): https://lists.yoctoproject.org/g/meta-ti/message/17984
> Mute This Topic: https://lists.yoctoproject.org/mt/108892648/6551054
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [reatmon@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

