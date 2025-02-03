Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65AEBC02193
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 21:44:13 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.100549.1738619051675535971
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 03 Feb 2025 13:44:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=MQCHmomN;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 513LiA2r3095728
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
	for <meta-ti@lists.yoctoproject.org>; Mon, 3 Feb 2025 15:44:10 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738619050;
	bh=8FwpWmsNiv25lETVRIvTpkZJ3BxerNvNFP0ZPf9umoA=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=MQCHmomNuC3+YPe+i7xd9aTkvVAt64TzpEwXAWWly0ZN6uCifBkfSrxsr8nzSsdWO
	 72kRl1UVXtQlCeiFwSzYjh28wmKjlrzurN7a0vMYVu2MXaIMzJMomqsAaMuf1mita9
	 uEJWb8uOdmftO2Y9K/jqSJWGHacpxnRMOsCspbsU=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 513LiAKj037908
	for <meta-ti@lists.yoctoproject.org>; Mon, 3 Feb 2025 15:44:10 -0600
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 3
 Feb 2025 15:44:10 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 3 Feb 2025 15:44:10 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 513Li9xT048685;
	Mon, 3 Feb 2025 15:44:09 -0600
Message-ID: <e94e89f3-7c02-4320-8429-367ad68b6bd6@ti.com>
Date: Mon, 3 Feb 2025 15:44:09 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][scarthgap][PATCH] conf: machine: am69: Update filenames
 for initial bootloader tiboot3
To: <a-limaye@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <u-kumar1@ti.com>, <m-chawdhry@ti.com>,
        <r-ravikumar@ti.com>, <s-sinha@ti.com>
References: <20250203132307.2862016-1-a-limaye@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250203132307.2862016-1-a-limaye@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 03 Feb 2025 21:44:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18251

On 2/3/25 7:18 AM, Aniket Limaye via lists.yoctoproject.org wrote:
> Update the filenames for tiboot3.bin variants built by the u-boot recipe
> and also the files expected by the wic image.
> 
> So far am69-sk and j784s4-evm have shared the same binman include file
> and hence the same filenames for u-boot images. However, with the
> configs and the devicetree being different, the same built binary does
> not support both boards. Hence the filenames of images built for am69-sk
> should reflect support for the same. The corresponding

This is not correct. The SK and EVM use different defconfigs, there is
no issue with two different builds producing output with the same filename.
All builds produce a u-boot.img for example, no issue here.

I've root caused the real issue, looks like a simple mistake in naming
was made in the patch taken in our  U-Boot evil vendor tree. The same
patch was posted upstream also, which I've commented[0] on. So the
correct name will go in upstream, and a fix backported to our tree.

That means this patch will not be needed.

Andrew

[0] https://lore.kernel.org/u-boot/e815500f-e4a0-4deb-ae33-f98ca7021503@ti.com/

> 
> This change is currently only applicable to ti-u-boot-2025.01, and hence
> it is restricted to the override bsp-ti-6_12.
> 
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
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#18242): https://lists.yoctoproject.org/g/meta-ti/message/18242
> Mute This Topic: https://lists.yoctoproject.org/mt/110970137/3619733
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [afd@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

