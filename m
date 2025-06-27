Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31EDCC77B7F
	for <webhook@archiver.kernel.org>; Fri, 27 Jun 2025 14:32:28 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.15226.1751034742838134068
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 27 Jun 2025 07:32:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Pbb80gpc;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: reatmon@ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55REWMAK2777520
	for <meta-ti@lists.yoctoproject.org>; Fri, 27 Jun 2025 09:32:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1751034742;
	bh=whtCtSNNOV2lUIr5m8YRY35EH4hXsXLwG4ZIdF7Zbs8=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Pbb80gpc4K+/obWGPDFt34zYBE+PD2cu9nGVbRfWlbG2mdBwX/5InNhloWBtBN23Q
	 qGwQ/yXpvA1nPKa4nwIVTCt9o5b2JX4U5UfSyTYHogjkrdQg3mozE1+ceMX7Ch4eKb
	 Rn8lp17KgtO5Ok5+RWnnX/w9KkXm2ECpp5Orvt1M=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55REWMH83042830
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 27 Jun 2025 09:32:22 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 27
 Jun 2025 09:32:22 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 27 Jun 2025 09:32:21 -0500
Received: from [10.249.37.202] ([10.249.37.202])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55REWL992953408;
	Fri, 27 Jun 2025 09:32:21 -0500
Message-ID: <5b7c7d3c-22d6-4810-9951-84844b6d0e87@ti.com>
Date: Fri, 27 Jun 2025 09:32:21 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] conf: machine: move UBOOR_*ADDRESS to top level
 ti-soc
To: Anshul Dalal <anshuld@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: <c-shilwant@ti.com>, <vigneshr@ti.com>, <praneeth@ti.com>
References: <20250627060416.639661-1-anshuld@ti.com>
 <20250627060416.639661-2-anshuld@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20250627060416.639661-2-anshuld@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 27 Jun 2025 14:32:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18703


UBOOR ?  Typo in the subject.


On 6/27/2025 1:04 AM, Anshul Dalal wrote:
> Since all k3 and legacy platforms share common load addresses for kernel
> and initrd in the fitImage, move them to top level ti-soc.inc.
> 
> No functional change is intended from this patch.
> 
> Signed-off-by: Anshul Dalal <anshuld@ti.com>
> ---
>   meta-ti-bsp/conf/machine/am335x-hs-evm.conf | 5 -----
>   meta-ti-bsp/conf/machine/am437x-hs-evm.conf | 5 -----
>   meta-ti-bsp/conf/machine/am57xx-hs-evm.conf | 5 -----
>   meta-ti-bsp/conf/machine/dra7xx-hs-evm.conf | 5 -----
>   meta-ti-bsp/conf/machine/include/k3.inc     | 4 ----
>   meta-ti-bsp/conf/machine/include/ti-soc.inc | 6 ++++++
>   6 files changed, 6 insertions(+), 24 deletions(-)
> 
> diff --git a/meta-ti-bsp/conf/machine/am335x-hs-evm.conf b/meta-ti-bsp/conf/machine/am335x-hs-evm.conf
> index ca102961..652496c2 100644
> --- a/meta-ti-bsp/conf/machine/am335x-hs-evm.conf
> +++ b/meta-ti-bsp/conf/machine/am335x-hs-evm.conf
> @@ -10,11 +10,6 @@ UBOOT_CONFIG ??= "uart mmc"
>   UBOOT_CONFIG[uart] = "am335x_hs_evm_uart_config"
>   UBOOT_CONFIG[mmc] = "am335x_hs_evm_config"
>   
> -UBOOT_ENTRYPOINT = "0x82000000"
> -UBOOT_LOADADDRESS = "0x82000000"
> -UBOOT_RD_LOADADDRESS = "0x84000000"
> -UBOOT_RD_ENTRYPOINT = "0x84000000"
> -
>   # FIT image for legacy secure devices
>   KERNEL_CLASSES += " kernel-fitimage-legacyhs"
>   KERNEL_IMAGETYPES += " fitImage"
> diff --git a/meta-ti-bsp/conf/machine/am437x-hs-evm.conf b/meta-ti-bsp/conf/machine/am437x-hs-evm.conf
> index 632b4995..fde38d39 100644
> --- a/meta-ti-bsp/conf/machine/am437x-hs-evm.conf
> +++ b/meta-ti-bsp/conf/machine/am437x-hs-evm.conf
> @@ -6,11 +6,6 @@ require conf/machine/am437x-evm.conf
>   
>   UBOOT_MACHINE = "am43xx_hs_evm_config"
>   
> -UBOOT_ENTRYPOINT = "0x82000000"
> -UBOOT_LOADADDRESS = "0x82000000"
> -UBOOT_RD_LOADADDRESS = "0x84000000"
> -UBOOT_RD_ENTRYPOINT = "0x84000000"
> -
>   OPTEEMACHINE = "ti-am43xx"
>   OPTEEFLAVOR = "am43xx"
>   
> diff --git a/meta-ti-bsp/conf/machine/am57xx-hs-evm.conf b/meta-ti-bsp/conf/machine/am57xx-hs-evm.conf
> index 4f36a847..fcdc5c0b 100644
> --- a/meta-ti-bsp/conf/machine/am57xx-hs-evm.conf
> +++ b/meta-ti-bsp/conf/machine/am57xx-hs-evm.conf
> @@ -6,11 +6,6 @@ require conf/machine/am57xx-evm.conf
>   
>   UBOOT_MACHINE = "am57xx_hs_evm_config"
>   
> -UBOOT_ENTRYPOINT = "0x82000000"
> -UBOOT_LOADADDRESS = "0x82000000"
> -UBOOT_RD_LOADADDRESS = "0x84000000"
> -UBOOT_RD_ENTRYPOINT = "0x84000000"
> -
>   OPTEEMACHINE = "ti-am57xx"
>   OPTEEFLAVOR = "am57xx"
>   OPTEEPAGER = "y"
> diff --git a/meta-ti-bsp/conf/machine/dra7xx-hs-evm.conf b/meta-ti-bsp/conf/machine/dra7xx-hs-evm.conf
> index 8e57a154..37ffef31 100644
> --- a/meta-ti-bsp/conf/machine/dra7xx-hs-evm.conf
> +++ b/meta-ti-bsp/conf/machine/dra7xx-hs-evm.conf
> @@ -6,11 +6,6 @@ require conf/machine/dra7xx-evm.conf
>   
>   UBOOT_MACHINE = "dra7xx_hs_evm_config"
>   
> -UBOOT_ENTRYPOINT = "0x82000000"
> -UBOOT_LOADADDRESS = "0x82000000"
> -UBOOT_RD_LOADADDRESS = "0x84000000"
> -UBOOT_RD_ENTRYPOINT = "0x84000000"
> -
>   OPTEEMACHINE = "ti-dra7xx"
>   OPTEEFLAVOR = "dra7xx"
>   OPTEEPAGER = "y"
> diff --git a/meta-ti-bsp/conf/machine/include/k3.inc b/meta-ti-bsp/conf/machine/include/k3.inc
> index 28785173..feb5a543 100644
> --- a/meta-ti-bsp/conf/machine/include/k3.inc
> +++ b/meta-ti-bsp/conf/machine/include/k3.inc
> @@ -13,10 +13,6 @@ KERNEL_IMAGETYPES = "Image fitImage"
>   KERNEL_CLASSES += "kernel-fitimage"
>   
>   UBOOT_ARCH = "arm"
> -UBOOT_ENTRYPOINT = "0x82000000"
> -UBOOT_LOADADDRESS = "0x82000000"
> -UBOOT_RD_LOADADDRESS = "0x84000000"
> -UBOOT_RD_ENTRYPOINT = "0x84000000"
>   UBOOT_DTB_LOADADDRESS = "0x88000000"
>   UBOOT_DTBO_LOADADDRESS = "0x88080000"
>   UBOOT_DTBO_OFFSET = "0x00010000"
> diff --git a/meta-ti-bsp/conf/machine/include/ti-soc.inc b/meta-ti-bsp/conf/machine/include/ti-soc.inc
> index 5d77e719..5125856f 100644
> --- a/meta-ti-bsp/conf/machine/include/ti-soc.inc
> +++ b/meta-ti-bsp/conf/machine/include/ti-soc.inc
> @@ -3,6 +3,12 @@
>   SOC_FAMILY = "ti-soc"
>   require conf/machine/include/soc-family.inc
>   
> +# kernel, initrd load addresses for the fitImage in all TI platforms
> +UBOOT_ENTRYPOINT = "0x82000000"
> +UBOOT_LOADADDRESS = "0x82000000"
> +UBOOT_RD_LOADADDRESS = "0x84000000"
> +UBOOT_RD_ENTRYPOINT = "0x84000000"
> +
>   # TI platforms all use devicetrees with overlays
>   MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "kernel-devicetree"
>   KERNEL_DTB_OVERLAY_SUPPORT ?= "1"

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

