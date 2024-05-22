Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80C49C25B7A
	for <webhook@archiver.kernel.org>; Wed, 22 May 2024 13:16:53 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.9731.1716383804371297301
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 22 May 2024 06:16:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=ZxaP/gTN;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 44MDGf2r001965;
	Wed, 22 May 2024 08:16:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1716383801;
	bh=Vb3yqEVBuo5OB38bjGxErWtevCJ/XTjYoLJSto07WNs=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=ZxaP/gTNWqLIoEHZGVTtwE6C31H0wxxH1aq1r88LI08YlqjZjWPoG0vQkjo6wfOKD
	 Ij3DQvI7Y+6u4+Brk2vqFwUA0qkWVaVZuirO8ItHbKm9oo2+EJ1TCM7ewi/ZoF9iv6
	 da7pydX/C/PFJ16kILCUByeHxp40Kdtio6cWGGz8=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 44MDGfmO057108
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 22 May 2024 08:16:41 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 22
 May 2024 08:16:41 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 22 May 2024 08:16:41 -0500
Received: from [10.249.32.242] ([10.249.32.242])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 44MDGfWo111242;
	Wed, 22 May 2024 08:16:41 -0500
Message-ID: <6b9f0fc1-077d-4d03-a54b-5b72996925dd@ti.com>
Date: Wed, 22 May 2024 08:16:40 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master/scarthgap][PATCH] conf: machine: Update
 UBOOT_MACHINE for am62xx-lp-evm
To: Chirag Shilwant <c-shilwant@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: Denys Dmytriyenko <denis@denix.org>, Gyan Gupta <g-gupta@ti.com>,
        Praneeth
	<praneeth@ti.com>
References: <20240522130057.1346796-1-c-shilwant@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20240522130057.1346796-1-c-shilwant@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 22 May 2024 13:16:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17671


This changes make scarthgap and master incompatible with the current 
default for uboot...  2024.04 is not the default yet.  Why was this 
change made in uboot?

We cannot accept this change until we default to 2024.04.


On 5/22/2024 8:00 AM, Chirag Shilwant wrote:
> Modify the U-Boot defconfig names for A53 and R5
> machine configurations based on ti-u-boot-2024.04 [1]
> 
> [1]: https://git.ti.com/cgit/ti-u-boot/ti-u-boot/commit/?h=ti-u-boot-2024.04&id=781b6a4a9ffde2428484d5c061b80e6c192b2049
> 
> Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
> ---
>   meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf | 2 +-
>   meta-ti-bsp/conf/machine/am62xx-lp-evm.conf      | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf b/meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf
> index 52b69a72..ddcd79c4 100644
> --- a/meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf
> +++ b/meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf
> @@ -9,4 +9,4 @@ SYSFW_SOC = "am62x"
>   SYSFW_CONFIG = "evm"
>   SYSFW_SUFFIX = "hs-fs"
>   
> -UBOOT_MACHINE = "am62x_lpsk_r5_defconfig"
> +UBOOT_MACHINE = "am62x_lp_sk_r5_defconfig"
> diff --git a/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf b/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
> index 51e99728..9ffb9898 100644
> --- a/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
> +++ b/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
> @@ -17,4 +17,4 @@ KERNEL_DEVICETREE = " \
>       ti/k3-am62-lp-sk.dtb \
>   "
>   
> -UBOOT_MACHINE = "am62x_lpsk_a53_defconfig"
> +UBOOT_MACHINE = "am62x_lp_sk_a53_defconfig"

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

