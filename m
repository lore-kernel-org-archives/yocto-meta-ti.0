Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 762F7C25B7A
	for <webhook@archiver.kernel.org>; Wed, 22 May 2024 13:29:53 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.10064.1716384584705504407
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 22 May 2024 06:29:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=cKhxFVyj;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 44MDTfNd114459;
	Wed, 22 May 2024 08:29:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1716384581;
	bh=j3cplG2/j+NQx84YdWWFFDVOH6iy5IZ1SCcNjwzzqcY=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=cKhxFVyjBNWqzQ4rmQxjoDyYunqJIzOLE0iHYFJhlYYngAKeUjuqDE7TMjx5sOdNU
	 /ATXvP1XhuT/k1+qALYr1YQ9E4ixigNr/JkcI501qATw1y7/gBcenzwaEgMPI4TPZj
	 pG8YrhKY9yjKuAXF/l6+biO4OaEa7FfW5eOe7cB4=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 44MDTfep009686
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 22 May 2024 08:29:41 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 22
 May 2024 08:29:41 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 22 May 2024 08:29:41 -0500
Received: from [10.249.32.242] ([10.249.32.242])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 44MDTfX1000702;
	Wed, 22 May 2024 08:29:41 -0500
Message-ID: <b5a20e24-132b-4987-bff9-21a7c627cdca@ti.com>
Date: Wed, 22 May 2024 08:29:41 -0500
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
 <meta-ti@lists.yoctoproject.org>; Wed, 22 May 2024 13:29:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17672



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


These changes will break the current default uboot version in 
scarthgap/master.  You need to do one of two things:

1)  If this change is only in the ti uboot 2024.04 version right now 
then the u-boot-ti-staging-2024.04.bb recipe should have the lines above 
to change UBOOT_MACHINE for these two entries.  We can then migrate 
these lines to the configs once all of the default versions are in place.

2) If the change is in both the ti version AND in upstream, then we need 
to make the flip changes above in the 2023.04 version to keep the names 
it is known by there.

Bottom line, while we are still in the migration time for this change we 
will need to do extra work to support both flows.  We can then unravel 
these changes at a later time once all of the uboot versions support the 
new defconfig name.


-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

