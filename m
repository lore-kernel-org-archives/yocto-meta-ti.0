Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E866C8302F
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 12:06:33 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.8767.1751371585965788998
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 01 Jul 2025 05:06:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=OKwRGFer;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: c-shilwant@ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 561C6NMZ3303317;
	Tue, 1 Jul 2025 07:06:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1751371583;
	bh=GYX2L7EEaeMpq2XiN3MGGw/nrCTXgLX10QNUFkqtky0=;
	h=Date:Subject:To:References:From:CC:In-Reply-To;
	b=OKwRGFerUiteKMKEpNOz0OHss1dik4z0rfE9sw9LOMtl56wGZp/EMGX/dLqTVALqc
	 ag9/C9vWK6wN534xH9aYzjDQ/lkZ5Jm0Sd14X5+Z/Wuqi22tnKeMmKmNkte8gm6KVZ
	 eUcpTVWprHAWmGuks6SPsJdmWtxIcNX40gqpUMKM=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 561C6NCs197243
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 1 Jul 2025 07:06:23 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 1
 Jul 2025 07:06:23 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 1 Jul 2025 07:06:23 -0500
Received: from [172.24.227.238] (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 561C6Ld11518193;
	Tue, 1 Jul 2025 07:06:21 -0500
Message-ID: <112eaca7-e4ba-411a-847c-cb352eae23da@ti.com>
Date: Tue, 1 Jul 2025 17:36:20 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][scarthgap/master][PATCH 2/2] meta-ti-bsp: Add all
 tiboot3.bin variants by wildcard
To: <afd@ti.com>, <meta-ti@lists.yoctoproject.org>
References: <20250627193003.575911-1-afd@ti.com>
 <20250627193003.575911-2-afd@ti.com>
Content-Language: en-US
From: Chirag Shilwant <c-shilwant@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        "Raghavendra, Vignesh" <vigneshr@ti.com>,
        Praneeth Bajjuri <praneeth@ti.com>
In-Reply-To: <20250627193003.575911-2-afd@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 01 Jul 2025 12:06:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18739

Hi Andrew,
On 28/06/25 01:00, Andrew Davis via lists.yoctoproject.org wrote:
> U-Boot generates all the valid versions of tiboot3.bin and picks the
> default based on the board's binman files. No need to duplicate this
> logic here, simply deploy what U-Boot gives us.
>
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
>   meta-ti-bsp/conf/machine/include/am62axx.inc |  6 ------
>   meta-ti-bsp/conf/machine/include/am62dxx.inc |  6 ------
>   meta-ti-bsp/conf/machine/include/am62pxx.inc |  6 ------
>   meta-ti-bsp/conf/machine/include/am62xx.inc  |  9 ---------
>   meta-ti-bsp/conf/machine/include/am64xx.inc  |  9 ---------
>   meta-ti-bsp/conf/machine/include/am65xx.inc  |  2 --
>   meta-ti-bsp/conf/machine/include/am68.inc    |  6 ------
>   meta-ti-bsp/conf/machine/include/am69.inc    |  6 ------
>   meta-ti-bsp/conf/machine/include/j7200.inc   | 15 ---------------
>   meta-ti-bsp/conf/machine/include/j721e.inc   |  6 ------
>   meta-ti-bsp/conf/machine/include/j721s2.inc  |  9 ---------
>   meta-ti-bsp/conf/machine/include/j722s.inc   |  6 ------
>   meta-ti-bsp/conf/machine/include/j742s2.inc  |  6 ------
>   meta-ti-bsp/conf/machine/include/j784s4.inc  |  9 ---------
>   meta-ti-bsp/conf/machine/include/k3.inc      |  1 +
>   15 files changed, 1 insertion(+), 101 deletions(-)
>

<snip>

> diff --git a/meta-ti-bsp/conf/machine/include/k3.inc b/meta-ti-bsp/conf/machine/include/k3.inc
> index 9b85f867..d0f0bd62 100644
> --- a/meta-ti-bsp/conf/machine/include/k3.inc
> +++ b/meta-ti-bsp/conf/machine/include/k3.inc
> @@ -44,6 +44,7 @@ MACHINE_FEATURES = "apm usbgadget usbhost vfat ext2 alsa pci optee-ftpm"
>   IMAGE_FSTYPES += "tar.xz wic.xz wic.bmap"
>   
>   IMAGE_BOOT_FILES ?= "${SPL_BINARYNAME} u-boot.${UBOOT_SUFFIX} tiboot3.bin"
> +IMAGE_BOOT_FILES += "tiboot3-*-evm.bin"


This commit seems to undo the effect of [0] which resolved SITSW-7159
There was a request to not package tiboot3-am62ax-gp-evm.bin inside vfat 
boot partition of wic image
but k3-am62a-sk-binman.dtsi [1] would still have it for Astc/vlab folks 
who know how to use the u-boot sources.


Hence, even if this approach to ship all tiboot3.bin generated by u-boot 
build seems logically correct
but it ends up deploying tiboot3 for GP samples which were only used 
internally for initial device bring-up
& not available publicly.


[0] 
https://git.yoctoproject.org/meta-ti/commit/?h=scarthgap-next&id=492a9aa4a92787185b41023e1026369d4028c1eb

[1] 
https://git.ti.com/cgit/ti-u-boot/ti-u-boot/tree/arch/arm/dts/k3-am62a-sk-binman.dtsi?h=11.01.04#n104


Chirag


>   IMAGE_EFI_BOOT_FILES ?= "${IMAGE_BOOT_FILES}"
>   
>   EFI_PROVIDER ?= "grub-efi"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#18710): https://lists.yoctoproject.org/g/meta-ti/message/18710
> Mute This Topic: https://lists.yoctoproject.org/mt/113867726/7030289
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [c-shilwant@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

