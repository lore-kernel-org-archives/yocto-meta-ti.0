Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52C2CC43334
	for <webhook@archiver.kernel.org>; Mon, 20 Jun 2022 19:11:59 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web09.34603.1655752318052727055
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 20 Jun 2022 12:11:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=qYGzHzRX;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 25KJBuph031999;
	Mon, 20 Jun 2022 14:11:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1655752316;
	bh=dTXzXW0AJrSHn+GF9jr6xqOFsh1NLpZKc2j+U4u0mXo=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=qYGzHzRXPiY6lWjOZGosmbvIdQCCqbfKDeaIOOgF0eD6oUsHIOfNgkpSMCw/CaKu5
	 9eN/Kr/DQ9AIYw9SkWoLTLc2EUp9h5bdm2GZF9ItWFTTcj3B1+YMPd+E46/x1M4q5L
	 IT3O6Pw3Mumv8PYr0rf7UZRDQRv4suCi7hjG7tUc=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 25KJBuqT053101
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 20 Jun 2022 14:11:56 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 20
 Jun 2022 14:11:56 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 20 Jun 2022 14:11:56 -0500
Received: from [10.250.37.187] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 25KJBtie087239;
	Mon, 20 Jun 2022 14:11:55 -0500
Message-ID: <293f769d-d60e-4945-4f0b-fbed2dbbb4b7@ti.com>
Date: Mon, 20 Jun 2022 14:11:55 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [meta-ti][dunfell][PATCH v3] conf: machine: wic: Fix HS image
 boot partition
Content-Language: en-US
To: Andrew Davis <afd@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
        Manorit
 Chawdhry <m-chawdhry@ti.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20220609145909.15483-1-afd@ti.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20220609145909.15483-1-afd@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 20 Jun 2022 19:11:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14833



On 6/9/2022 9:59, Andrew Davis wrote:
> From: Manorit Chawdhry <m-chawdhry@ti.com>
> 
> IMAGE_BOOT_FILES was being overwritten in the HS recipes leading to
> incomplete binaries in /boot and the naming of the binaries were not
> correct.
> 
> Fixes /boot partition for HS devices.
> 
> Signed-off-by: Manorit Chawdhry <m-chawdhry@ti.com>
> [afd: Extended fix to all HS platforms]
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
> 
> Changes from v2:
>   - Added UBOOT_SYMLINK to fix missing u-boot.img image
> 
>   conf/machine/am64xx-hs-evm.conf | 3 +--
>   conf/machine/am65xx-hs-evm.conf | 3 +--
>   conf/machine/include/k3.inc     | 5 +++--
>   conf/machine/j7-hs-evm.conf     | 3 +--
>   conf/machine/j7200-hs-evm.conf  | 3 +--
>   5 files changed, 7 insertions(+), 10 deletions(-)


I am getting build errors for several of the HS platforms related to 
this change.  The 
meta-arago/meta-arago-distro/recipces-core/images/tisdk-core-bundle.bb 
recipe is failing because the u-boot-<MACHINE>.img file is not in the 
deploy/images directory.

When I drop the patch all of the builds work correctly.



> diff --git a/conf/machine/am64xx-hs-evm.conf b/conf/machine/am64xx-hs-evm.conf
> index 44e81463..ebbe2e62 100644
> --- a/conf/machine/am64xx-hs-evm.conf
> +++ b/conf/machine/am64xx-hs-evm.conf
> @@ -15,8 +15,7 @@ UBOOT_DTBO_LOADADDRESS = "0x83080000"
>   UBOOT_DTBO_OFFSET =      "0x00010000"
>   
>   SPL_BINARY = "tispl.bin_HS"
> -SPL_BINARYNAME = "tispl.bin"
>   UBOOT_BINARY = "u-boot.img_HS"
> -IMAGE_BOOT_FILES = "${UBOOT_BINARY}"
> +UBOOT_SYMLINK = "u-boot.img"
>   
>   TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_K3}"
> diff --git a/conf/machine/am65xx-hs-evm.conf b/conf/machine/am65xx-hs-evm.conf
> index e4eebb6a..de92cacb 100644
> --- a/conf/machine/am65xx-hs-evm.conf
> +++ b/conf/machine/am65xx-hs-evm.conf
> @@ -15,8 +15,7 @@ UBOOT_DTBO_LOADADDRESS = "0x83080000"
>   UBOOT_DTBO_OFFSET =      "0x00010000"
>   
>   SPL_BINARY = "tispl.bin_HS"
> -SPL_BINARYNAME = "tispl.bin"
>   UBOOT_BINARY = "u-boot.img_HS"
> -IMAGE_BOOT_FILES = "${UBOOT_BINARY}"
> +UBOOT_SYMLINK = "u-boot.img"
>   
>   TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_K3}"
> diff --git a/conf/machine/include/k3.inc b/conf/machine/include/k3.inc
> index e0970698..f85e6b98 100644
> --- a/conf/machine/include/k3.inc
> +++ b/conf/machine/include/k3.inc
> @@ -22,6 +22,7 @@ UBOOT_ENTRYPOINT = "0x80008000"
>   UBOOT_LOADADDRESS = "0x80008000"
>   
>   SPL_BINARY = "tispl.bin"
> +SPL_BINARYNAME = "tispl.bin"
>   UBOOT_SUFFIX = "img"
>   
>   EXTRA_IMAGEDEPENDS += "virtual/bootloader"
> @@ -40,8 +41,8 @@ MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 alsa ethernet pci"
>   
>   IMAGE_FSTYPES += "tar.xz wic.xz wic.bmap"
>   
> -IMAGE_BOOT_FILES_LEGACY = "${SPL_BINARY} u-boot.${UBOOT_SUFFIX} tiboot3.bin sysfw.itb"
> -IMAGE_BOOT_FILES_MULTI_CERT = "${SPL_BINARY} u-boot.${UBOOT_SUFFIX} tiboot3.bin"
> +IMAGE_BOOT_FILES_LEGACY = "${SPL_BINARYNAME} u-boot.${UBOOT_SUFFIX} tiboot3.bin sysfw.itb"
> +IMAGE_BOOT_FILES_MULTI_CERT = "${SPL_BINARYNAME} u-boot.${UBOOT_SUFFIX} tiboot3.bin"
>   
>   IMAGE_BOOT_FILES ?= "${IMAGE_BOOT_FILES_LEGACY}"
>   
> diff --git a/conf/machine/j7-hs-evm.conf b/conf/machine/j7-hs-evm.conf
> index f2e3ccf5..ece0d85e 100644
> --- a/conf/machine/j7-hs-evm.conf
> +++ b/conf/machine/j7-hs-evm.conf
> @@ -15,9 +15,8 @@ UBOOT_DTBO_LOADADDRESS = "0x83080000"
>   UBOOT_DTBO_OFFSET =      "0x00010000"
>   
>   SPL_BINARY = "tispl.bin_HS"
> -SPL_BINARYNAME = "tispl.bin"
>   UBOOT_BINARY = "u-boot.img_HS"
> -IMAGE_BOOT_FILES = "${UBOOT_BINARY}"
> +UBOOT_SYMLINK = "u-boot.img"
>   
>   BBMULTICONFIG += "k3r5-sr1-1"
>   
> diff --git a/conf/machine/j7200-hs-evm.conf b/conf/machine/j7200-hs-evm.conf
> index a5bd637e..8821ffac 100644
> --- a/conf/machine/j7200-hs-evm.conf
> +++ b/conf/machine/j7200-hs-evm.conf
> @@ -15,8 +15,7 @@ UBOOT_DTBO_LOADADDRESS = "0x83080000"
>   UBOOT_DTBO_OFFSET =      "0x00010000"
>   
>   SPL_BINARY = "tispl.bin_HS"
> -SPL_BINARYNAME = "tispl.bin"
>   UBOOT_BINARY = "u-boot.img_HS"
> -IMAGE_BOOT_FILES = "${UBOOT_BINARY}"
> +UBOOT_SYMLINK = "u-boot.img"
>   
>   TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_K3}"

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

