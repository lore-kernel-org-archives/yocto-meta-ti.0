Return-Path: <m-chawdhry@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3118C433EF
	for <webhook@archiver.kernel.org>; Tue, 14 Jun 2022 08:21:13 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web08.3758.1655194867121420040
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 14 Jun 2022 01:21:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=ck7xqklL;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: m-chawdhry@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 25E8L4fe097617;
	Tue, 14 Jun 2022 03:21:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1655194864;
	bh=vd1gVz7hsnidPY+jHyXSjPCz36AvpL7edAOOeK3RoPA=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=ck7xqklLQuRpolgrevhWAc96jbS/AqVZFDpDv+w5lbuFN8/C/4cI0/SN1ouCtff9Q
	 uA7NlO7WZc4lAfZ9/DEq3STdWeMWFiui+R2ReWPbU+N3eryew1b8eKeBQZOInDtJRF
	 P9NrtUBMuS5PhmJK50sZ43qETiO0hZPvKdFhzmVI=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 25E8L4xo022520
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 14 Jun 2022 03:21:04 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 14
 Jun 2022 03:21:03 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 14 Jun 2022 03:21:03 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 25E8L0n1120380;
	Tue, 14 Jun 2022 03:21:02 -0500
Date: Tue, 14 Jun 2022 13:50:59 +0530
From: Manorit Chawdhry <m-chawdhry@ti.com>
To: Andrew Davis <afd@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][dunfell][PATCH v3] conf: machine: wic: Fix HS image
 boot partition
Message-ID: <20220614082059.jjouefku4pf3f3jn@ula0497581>
References: <20220609145909.15483-1-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220609145909.15483-1-afd@ti.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 14 Jun 2022 08:21:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14813

On 09:59-20220609, Andrew Davis wrote:
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
>  - Added UBOOT_SYMLINK to fix missing u-boot.img image

LGTM.

Acked-by: Manorit Chawdhry <m-chawdhry@ti.com>

> 
>  conf/machine/am64xx-hs-evm.conf | 3 +--
>  conf/machine/am65xx-hs-evm.conf | 3 +--
>  conf/machine/include/k3.inc     | 5 +++--
>  conf/machine/j7-hs-evm.conf     | 3 +--
>  conf/machine/j7200-hs-evm.conf  | 3 +--
>  5 files changed, 7 insertions(+), 10 deletions(-)
> 
> diff --git a/conf/machine/am64xx-hs-evm.conf b/conf/machine/am64xx-hs-evm.conf
> index 44e81463..ebbe2e62 100644
> --- a/conf/machine/am64xx-hs-evm.conf
> +++ b/conf/machine/am64xx-hs-evm.conf
> @@ -15,8 +15,7 @@ UBOOT_DTBO_LOADADDRESS = "0x83080000"
>  UBOOT_DTBO_OFFSET =      "0x00010000"
>  
>  SPL_BINARY = "tispl.bin_HS"
> -SPL_BINARYNAME = "tispl.bin"
>  UBOOT_BINARY = "u-boot.img_HS"
> -IMAGE_BOOT_FILES = "${UBOOT_BINARY}"
> +UBOOT_SYMLINK = "u-boot.img"
>  
>  TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_K3}"
> diff --git a/conf/machine/am65xx-hs-evm.conf b/conf/machine/am65xx-hs-evm.conf
> index e4eebb6a..de92cacb 100644
> --- a/conf/machine/am65xx-hs-evm.conf
> +++ b/conf/machine/am65xx-hs-evm.conf
> @@ -15,8 +15,7 @@ UBOOT_DTBO_LOADADDRESS = "0x83080000"
>  UBOOT_DTBO_OFFSET =      "0x00010000"
>  
>  SPL_BINARY = "tispl.bin_HS"
> -SPL_BINARYNAME = "tispl.bin"
>  UBOOT_BINARY = "u-boot.img_HS"
> -IMAGE_BOOT_FILES = "${UBOOT_BINARY}"
> +UBOOT_SYMLINK = "u-boot.img"
>  
>  TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_K3}"
> diff --git a/conf/machine/include/k3.inc b/conf/machine/include/k3.inc
> index e0970698..f85e6b98 100644
> --- a/conf/machine/include/k3.inc
> +++ b/conf/machine/include/k3.inc
> @@ -22,6 +22,7 @@ UBOOT_ENTRYPOINT = "0x80008000"
>  UBOOT_LOADADDRESS = "0x80008000"
>  
>  SPL_BINARY = "tispl.bin"
> +SPL_BINARYNAME = "tispl.bin"
>  UBOOT_SUFFIX = "img"
>  
>  EXTRA_IMAGEDEPENDS += "virtual/bootloader"
> @@ -40,8 +41,8 @@ MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 alsa ethernet pci"
>  
>  IMAGE_FSTYPES += "tar.xz wic.xz wic.bmap"
>  
> -IMAGE_BOOT_FILES_LEGACY = "${SPL_BINARY} u-boot.${UBOOT_SUFFIX} tiboot3.bin sysfw.itb"
> -IMAGE_BOOT_FILES_MULTI_CERT = "${SPL_BINARY} u-boot.${UBOOT_SUFFIX} tiboot3.bin"
> +IMAGE_BOOT_FILES_LEGACY = "${SPL_BINARYNAME} u-boot.${UBOOT_SUFFIX} tiboot3.bin sysfw.itb"
> +IMAGE_BOOT_FILES_MULTI_CERT = "${SPL_BINARYNAME} u-boot.${UBOOT_SUFFIX} tiboot3.bin"
>  
>  IMAGE_BOOT_FILES ?= "${IMAGE_BOOT_FILES_LEGACY}"
>  
> diff --git a/conf/machine/j7-hs-evm.conf b/conf/machine/j7-hs-evm.conf
> index f2e3ccf5..ece0d85e 100644
> --- a/conf/machine/j7-hs-evm.conf
> +++ b/conf/machine/j7-hs-evm.conf
> @@ -15,9 +15,8 @@ UBOOT_DTBO_LOADADDRESS = "0x83080000"
>  UBOOT_DTBO_OFFSET =      "0x00010000"
>  
>  SPL_BINARY = "tispl.bin_HS"
> -SPL_BINARYNAME = "tispl.bin"
>  UBOOT_BINARY = "u-boot.img_HS"
> -IMAGE_BOOT_FILES = "${UBOOT_BINARY}"
> +UBOOT_SYMLINK = "u-boot.img"
>  
>  BBMULTICONFIG += "k3r5-sr1-1"
>  
> diff --git a/conf/machine/j7200-hs-evm.conf b/conf/machine/j7200-hs-evm.conf
> index a5bd637e..8821ffac 100644
> --- a/conf/machine/j7200-hs-evm.conf
> +++ b/conf/machine/j7200-hs-evm.conf
> @@ -15,8 +15,7 @@ UBOOT_DTBO_LOADADDRESS = "0x83080000"
>  UBOOT_DTBO_OFFSET =      "0x00010000"
>  
>  SPL_BINARY = "tispl.bin_HS"
> -SPL_BINARYNAME = "tispl.bin"
>  UBOOT_BINARY = "u-boot.img_HS"
> -IMAGE_BOOT_FILES = "${UBOOT_BINARY}"
> +UBOOT_SYMLINK = "u-boot.img"
>  
>  TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_K3}"
> -- 
> 2.36.1
> 

