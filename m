Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F9C2C636D3
	for <webhook@archiver.kernel.org>; Thu,  9 Feb 2023 18:41:09 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.25117.1675968065395593630
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 09 Feb 2023 10:41:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=qJt98kGP;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 319If4S5095276;
	Thu, 9 Feb 2023 12:41:04 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1675968064;
	bh=VJgJzOFq6ONt2k8mVYqckGUPKydStZfgfkOC1Za1YlM=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=qJt98kGPqeGczotSRGJZuuvlP4KQIZh856C8u/aBye10+ltf4Pbc8AwzhdDoHf2Qk
	 4HpLZ1faBVmz6txbS/YVe+I6U7tP+pa3JKLCYQDhaqYz11y85NCVgVShubK6CNYoiy
	 365JVhz0sFvUerrCOgCxJQ6wdA62sbpWB3lNu5sQ=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 319If4TP058372
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 9 Feb 2023 12:41:04 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Thu, 9
 Feb 2023 12:41:04 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Thu, 9 Feb 2023 12:41:04 -0600
Received: from [10.250.32.173] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 319If3jc024452;
	Thu, 9 Feb 2023 12:41:03 -0600
Message-ID: <4024a7f4-1ea7-0d97-6549-a6a702f21188@ti.com>
Date: Thu, 9 Feb 2023 12:41:03 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [meta-ti][dunfell][PATCH V5] conf: machine: k3: Define RD, DTB
 and DTBO load address for FIT image
Content-Language: en-US
To: <sinthu.raja@mistralsolutions.com>, <reatmon@ti.com>, <denys@ti.com>,
        <detheridge@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, Sinthu Raja <sinthu.raja@ti.com>
References: <20230209183110.8213-1-sinthu.raja@ti.com>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20230209183110.8213-1-sinthu.raja@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 09 Feb 2023 18:41:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15779

On 2/9/23 12:31 PM, Sinthu Raja M via lists.yoctoproject.org wrote:
> From: Sinthu Raja <sinthu.raja@ti.com>
> 
> K3 platforms include the FIT image-based kernel by default. The bootloader
> loads the kernel and DTB from the FIT image. The DTB/DTBOs are added to the
> FIT image but the load address is not included in the image section of
> each DTB/DTBO. This load address is determined by the LOADADDRESS macros
> in the kernel-fitmage class.
> 
> Hence, define the RD/DTB/DTBOs LOADADDRESS and OFFSET macros in the k3
> common include, and remove those macros defined in the k3 board specific
> conf.

Capitalize K3 everywhere. "conf" should be plural, maybe "config files".

> 
> Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
> ---
> 
> Change in V4 & V5:
> =================
> - Update commit description, keep FIT as capitalized.
> 
> Changes in V3:
> =============
> Address review comments:
> - Update commit description.
> - Define UBOOT_RD_* in k3 common include.
> - Remove the UBOOT* defines from k3 board specific files.
> 
> Changes in V2:
> =============
> Address review comment:
> - Move the change to k3.inc as the FIT image is included as default
>    image across all platforms
> 
> V1: https://lists.yoctoproject.org/g/meta-ti/message/15754
> V2: https://lists.yoctoproject.org/g/meta-ti/message/15768
> V3: https://lists.yoctoproject.org/g/meta-ti/message/15776
> 
>   conf/machine/am65xx-hs-evm.conf | 8 --------
>   conf/machine/include/k3.inc     | 5 +++++
>   conf/machine/j7-hs-evm.conf     | 8 --------
>   conf/machine/j7200-hs-evm.conf  | 8 --------
>   conf/machine/j721s2-hs-evm.conf | 8 --------
>   5 files changed, 5 insertions(+), 32 deletions(-)
> 
> diff --git a/conf/machine/am65xx-hs-evm.conf b/conf/machine/am65xx-hs-evm.conf
> index ea1f8ff1..2c1256d0 100644
> --- a/conf/machine/am65xx-hs-evm.conf
> +++ b/conf/machine/am65xx-hs-evm.conf
> @@ -6,14 +6,6 @@ require conf/machine/include/am65xx.inc
>   
>   UBOOT_MACHINE = "am65x_hs_evm_a53_defconfig"
>   
> -UBOOT_ENTRYPOINT =       "0x80080000"
> -UBOOT_LOADADDRESS =      "0x80080000"
> -UBOOT_RD_LOADADDRESS =   "0x84000000"
> -UBOOT_RD_ENTRYPOINT =    "0x84000000"
> -UBOOT_DTB_LOADADDRESS =  "0x83000000"
> -UBOOT_DTBO_LOADADDRESS = "0x83080000"
> -UBOOT_DTBO_OFFSET =      "0x00010000"
> -
>   SPL_BINARY = "tispl.bin_HS"
>   UBOOT_BINARY = "u-boot.img_HS"
>   UBOOT_SYMLINK = "u-boot.img"
> diff --git a/conf/machine/include/k3.inc b/conf/machine/include/k3.inc
> index 81139571..611d5cce 100644
> --- a/conf/machine/include/k3.inc
> +++ b/conf/machine/include/k3.inc
> @@ -21,6 +21,11 @@ KERNEL_CLASSES += "kernel-fitimage"
>   UBOOT_ARCH = "arm"
>   UBOOT_ENTRYPOINT = "0x80008000"
>   UBOOT_LOADADDRESS = "0x80008000"
> +UBOOT_RD_LOADADDRESS =   "0x84000000"
> +UBOOT_RD_ENTRYPOINT =    "0x84000000"
> +UBOOT_DTB_LOADADDRESS =  "0x83000000"
> +UBOOT_DTBO_LOADADDRESS = "0x83080000"
> +UBOOT_DTBO_OFFSET =      "0x00010000"

I know it was space aligned before, but since the first entries do
not do it here, don't do it for any, or change the first to have
it for all. Mixing doesn't look good.

Otherwise,

Reviewed-by: Andrew Davis <afd@ti.com>

>   
>   SPL_BINARY = "tispl.bin"
>   SPL_BINARYNAME = "tispl.bin"
> diff --git a/conf/machine/j7-hs-evm.conf b/conf/machine/j7-hs-evm.conf
> index bbfe6fcb..68d36d5f 100644
> --- a/conf/machine/j7-hs-evm.conf
> +++ b/conf/machine/j7-hs-evm.conf
> @@ -6,14 +6,6 @@ require conf/machine/j7-evm.conf
>   
>   UBOOT_MACHINE = "j721e_hs_evm_a72_defconfig"
>   
> -UBOOT_ENTRYPOINT =       "0x80080000"
> -UBOOT_LOADADDRESS =      "0x80080000"
> -UBOOT_RD_LOADADDRESS =   "0x84000000"
> -UBOOT_RD_ENTRYPOINT =    "0x84000000"
> -UBOOT_DTB_LOADADDRESS =  "0x83000000"
> -UBOOT_DTBO_LOADADDRESS = "0x83080000"
> -UBOOT_DTBO_OFFSET =      "0x00010000"
> -
>   SPL_BINARY = "tispl.bin_HS"
>   UBOOT_BINARY = "u-boot.img_HS"
>   UBOOT_SYMLINK = "u-boot.img"
> diff --git a/conf/machine/j7200-hs-evm.conf b/conf/machine/j7200-hs-evm.conf
> index ef7268b1..dc928974 100644
> --- a/conf/machine/j7200-hs-evm.conf
> +++ b/conf/machine/j7200-hs-evm.conf
> @@ -6,14 +6,6 @@ require conf/machine/j7200-evm.conf
>   
>   UBOOT_MACHINE = "j7200_hs_evm_a72_defconfig"
>   
> -UBOOT_ENTRYPOINT =       "0x80080000"
> -UBOOT_LOADADDRESS =      "0x80080000"
> -UBOOT_RD_LOADADDRESS =   "0x84000000"
> -UBOOT_RD_ENTRYPOINT =    "0x84000000"
> -UBOOT_DTB_LOADADDRESS =  "0x83000000"
> -UBOOT_DTBO_LOADADDRESS = "0x83080000"
> -UBOOT_DTBO_OFFSET =      "0x00010000"
> -
>   SPL_BINARY = "tispl.bin_HS"
>   UBOOT_BINARY = "u-boot.img_HS"
>   UBOOT_SYMLINK = "u-boot.img"
> diff --git a/conf/machine/j721s2-hs-evm.conf b/conf/machine/j721s2-hs-evm.conf
> index 84db90bb..3d737f44 100644
> --- a/conf/machine/j721s2-hs-evm.conf
> +++ b/conf/machine/j721s2-hs-evm.conf
> @@ -6,14 +6,6 @@ require conf/machine/j721s2-evm.conf
>   
>   UBOOT_MACHINE = "j721s2_hs_evm_a72_defconfig"
>   
> -UBOOT_ENTRYPOINT =       "0x80080000"
> -UBOOT_LOADADDRESS =      "0x80080000"
> -UBOOT_RD_LOADADDRESS =   "0x84000000"
> -UBOOT_RD_ENTRYPOINT =    "0x84000000"
> -UBOOT_DTB_LOADADDRESS =  "0x83000000"
> -UBOOT_DTBO_LOADADDRESS = "0x83080000"
> -UBOOT_DTBO_OFFSET =      "0x00010000"
> -
>   SPL_BINARY = "tispl.bin_HS"
>   UBOOT_BINARY = "u-boot.img_HS"
>   UBOOT_SYMLINK = "u-boot.img"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#15778): https://lists.yoctoproject.org/g/meta-ti/message/15778
> Mute This Topic: https://lists.yoctoproject.org/mt/96859570/3619733
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [afd@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

