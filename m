Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF4C4C02192
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 14:46:29 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.89236.1738593988220490967
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 03 Feb 2025 06:46:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=bIG0vcdx;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 513EkRwY2210622
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <meta-ti@lists.yoctoproject.org>; Mon, 3 Feb 2025 08:46:27 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738593987;
	bh=IaU/fcdbk3Y5WlgLyCQ0gf2KJZOPcleP9KhGa4n5RcU=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=bIG0vcdxR8DHXwUkWdERz0XW+2n7VyzwHZdQRLw3X2MAUHui/84mJuBfECNIBIEtD
	 WjDS9qGMWmZ+NyMUaoThxWsJZq2WjntSJPbHI6GbO5lTy0+30zMbWv62qjnAFLraqT
	 6UekkPjLd+Pr+PymAGGmQr5S6y8rzPpAoFJfmjYA=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 513EkRno003561
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 3 Feb 2025 08:46:27 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 3
 Feb 2025 08:46:26 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 3 Feb 2025 08:46:26 -0600
Received: from [10.249.32.112] ([10.249.32.112])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 513EkQMl085631;
	Mon, 3 Feb 2025 08:46:26 -0600
Message-ID: <3e299711-bbf8-4176-a101-0baec7df9772@ti.com>
Date: Mon, 3 Feb 2025 08:46:26 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][scarthgap][PATCH] conf: machine: am69: Update filenames
 for initial bootloader tiboot3
To: Aniket Limaye <a-limaye@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: <u-kumar1@ti.com>, <m-chawdhry@ti.com>, <r-ravikumar@ti.com>,
        <s-sinha@ti.com>
References: <20250203132307.2862016-1-a-limaye@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20250203132307.2862016-1-a-limaye@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 03 Feb 2025 14:46:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18243



On 2/3/2025 7:18 AM, Aniket Limaye wrote:
> Update the filenames for tiboot3.bin variants built by the u-boot recipe
> and also the files expected by the wic image.
> 
> So far am69-sk and j784s4-evm have shared the same binman include file
> and hence the same filenames for u-boot images. However, with the
> configs and the devicetree being different, the same built binary does
> not support both boards. Hence the filenames of images built for am69-sk
> should reflect support for the same. The corresponding
> 
> This change is currently only applicable to ti-u-boot-2025.01, and hence
> it is restricted to the override bsp-ti-6_12.

Actually... I would prefer to align all of the defaults with the current 
default BSP.  Which right now is 6.12.

So can you flip this patch around?  Make the default be the new name and 
add multiple settings for the old name on the other BSPs?  I think it 
would be more confusing to try and unravel the twisty maze of settings 
otherwise if we don't have a standard.


> Signed-off-by: Aniket Limaye <a-limaye@ti.com>
> ---
> This patch needs to be merged in sync with the corresponding patch for
> ti-u-boot-2025.01.
> 
> The u-boot patch has also been posted to upstream u-boot and when merged
> there, the next/upstream BSP packages will also need this change.
> https://lore.kernel.org/u-boot/20250106-b4-upstream-j742s2-v2-2-42d6129ce333@ti.com/
> ---
>   meta-ti-bsp/conf/machine/am69-sk-k3r5.conf | 2 ++
>   meta-ti-bsp/conf/machine/include/am69.inc  | 7 ++++---
>   2 files changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/meta-ti-bsp/conf/machine/am69-sk-k3r5.conf b/meta-ti-bsp/conf/machine/am69-sk-k3r5.conf
> index 9d2b4cd6..376d8153 100644
> --- a/meta-ti-bsp/conf/machine/am69-sk-k3r5.conf
> +++ b/meta-ti-bsp/conf/machine/am69-sk-k3r5.conf
> @@ -5,7 +5,9 @@
>   require conf/machine/include/k3r5.inc
>   
>   SYSFW_SOC = "j784s4"
> +SYSFW_SOC:bsp-ti-6_12 = "am69"
>   SYSFW_CONFIG = "evm"
> +SYSFW_CONFIG:bsp-ti-6_12 = "sk"
>   SYSFW_SUFFIX = "hs-fs"
>   
>   UBOOT_MACHINE = "am69_sk_r5_defconfig"
> diff --git a/meta-ti-bsp/conf/machine/include/am69.inc b/meta-ti-bsp/conf/machine/include/am69.inc
> index da8a5a8b..e82d58e2 100644
> --- a/meta-ti-bsp/conf/machine/include/am69.inc
> +++ b/meta-ti-bsp/conf/machine/include/am69.inc
> @@ -9,10 +9,11 @@ require conf/machine/include/mesa-pvr.inc
>   PREFERRED_PROVIDER_virtual/gpudriver ?= "${BSP_ROGUE_DRIVER_PROVIDER}"
>   
>   # Default tiboot3.bin on AM69 is for SR1.0 HS-FS
> -IMAGE_BOOT_FILES += "tiboot3-j784s4-hs-fs-evm.bin"
> +# Add tiboot3.bin for all SOC types, to the wic image.
> +BSP_BOOTLOADER_FILES = "tiboot3-j784s4-hs-fs-evm.bin tiboot3-j784s4-hs-evm.bin"
> +BSP_BOOTLOADER_FILES:bsp-ti-6_12 = "tiboot3-am69-hs-fs-sk.bin tiboot3-am69-hs-sk.bin"
>   
> -# Since default tiboot3.bin on AM69 is for HS-FS, add a version for SR1.0 HS-SE
> -IMAGE_BOOT_FILES += "tiboot3-j784s4-hs-evm.bin"
> +IMAGE_BOOT_FILES += "${BSP_BOOTLOADER_FILES}"
>   
>   TFA_BOARD = "j784s4"
>   

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

