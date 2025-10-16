Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E63C7CCD199
	for <webhook@archiver.kernel.org>; Thu, 16 Oct 2025 15:33:47 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.313.1760628824223728360
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 16 Oct 2025 08:33:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=cr+cIexQ;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: afd@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59GFXhFB2137787;
	Thu, 16 Oct 2025 10:33:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1760628823;
	bh=pK05yQ70Q+3dFeHGbGPAVsTFt8AfT1RmMl2w4ec9Klg=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=cr+cIexQ5W6eMsVJyt2BM/1p95sfrqQsZkBFvgZZPL8bIKWbAW5oziKrxfz8XIf8B
	 Sq/N8A5HHI78zJ9tCMZfrfsux+7t+jL8MrXy/Bz54o2qVqwv/htIpKIV+VJTYUcFOC
	 TfsJDCXaeMM9Jhg7lRa3O96JqThK4hcspYpbwQOw=
Received: from DLEE211.ent.ti.com (dlee211.ent.ti.com [157.170.170.113])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59GFXhCo2110525
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 16 Oct 2025 10:33:43 -0500
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 16 Oct
 2025 10:33:43 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 16 Oct 2025 10:33:42 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59GFXg6u3956013;
	Thu, 16 Oct 2025 10:33:42 -0500
Message-ID: <e1f05c83-5029-4e1a-b4e6-c1512b850e09@ti.com>
Date: Thu, 16 Oct 2025 10:33:42 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] [master][PATCH v5 1/4] meta-ti-bsp: conf: machine:
 include: Add common module variable for TI Initramfs image
To: <m-shah@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: <vigneshr@ti.com>, <u-kumar1@ti.com>, <reatmon@ti.com>, <a-limaye@ti.com>,
        <n-francis@ti.com>, <praneeth@ti.com>, <jm@ti.com>, <b-padhi@ti.com>,
        <bb@ti.com>, <denys@konsulko.com>, <rs@ti.com>
References: <20251015120032.288741-1-m-shah@ti.com>
 <20251015120032.288741-2-m-shah@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20251015120032.288741-2-m-shah@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 16 Oct 2025 15:33:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19142

On 10/15/25 7:00 AM, Moteen Shah via lists.yoctoproject.org wrote:
> Add a new variable in ti-soc.inc which would be populated by individual
> platforms with the required modules which would later be packaged inside
> the initramfs image.
> 
> Signed-off-by: Moteen Shah <m-shah@ti.com>
> ---
>   meta-ti-bsp/conf/machine/include/am62axx.inc | 3 +++
>   meta-ti-bsp/conf/machine/include/j721e.inc   | 3 +++
>   meta-ti-bsp/conf/machine/include/j784s4.inc  | 3 +++
>   meta-ti-bsp/conf/machine/include/ti-soc.inc  | 2 ++
>   4 files changed, 11 insertions(+)
> 
> diff --git a/meta-ti-bsp/conf/machine/include/am62axx.inc b/meta-ti-bsp/conf/machine/include/am62axx.inc
> index 964be0ad..bacee3a6 100644
> --- a/meta-ti-bsp/conf/machine/include/am62axx.inc
> +++ b/meta-ti-bsp/conf/machine/include/am62axx.inc
> @@ -11,3 +11,6 @@ TFA_BOARD = "lite"
>   OPTEEMACHINE = "k3-am62x"
>   
>   MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "cnm-wave-fw"
> +
> +TI_INITRAMFS_KERNEL_MODULES:append:bsp-mainline  = "kernel-module-tps6594-i2c"
> +TI_INITRAMFS_KERNEL_MODULES:append:bsp-next  = "kernel-module-tps6594-i2c"
> diff --git a/meta-ti-bsp/conf/machine/include/j721e.inc b/meta-ti-bsp/conf/machine/include/j721e.inc
> index f9fdac0c..f413f5d8 100644
> --- a/meta-ti-bsp/conf/machine/include/j721e.inc
> +++ b/meta-ti-bsp/conf/machine/include/j721e.inc
> @@ -19,3 +19,6 @@ TI_VXE_VXD_DRIVER = "ti-vxe-vxd-driver"
>   TI_VXE_VXD_DRIVER:bsp-ti-6_6 = ""
>   
>   MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "cadence-mhdp-fw vxd-dec-fw ti-eth-fw-j721e ${TI_VXE_VXD_DRIVER}"
> +
> +TI_INITRAMFS_KERNEL_MODULES:append:bsp-mainline = " kernel-module-cdns-pltfrm kernel-module-ti-j721e-ufs"
> +TI_INITRAMFS_KERNEL_MODULES:append:bsp-next = " kernel-module-cdns-pltfrm kernel-module-ti-j721e-ufs"
> diff --git a/meta-ti-bsp/conf/machine/include/j784s4.inc b/meta-ti-bsp/conf/machine/include/j784s4.inc
> index 759984ea..ebc3d576 100644
> --- a/meta-ti-bsp/conf/machine/include/j784s4.inc
> +++ b/meta-ti-bsp/conf/machine/include/j784s4.inc
> @@ -13,3 +13,6 @@ TFA_BOARD = "j784s4"
>   OPTEEMACHINE = "k3-j784s4"
>   
>   MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "cadence-mhdp-fw cnm-wave-fw ti-eth-fw-j784s4"
> +
> +TI_INITRAMFS_KERNEL_MODULES:append:bsp-mainline = " kernel-module-cdns-pltfrm kernel-module-ti-j721e-ufs"
> +TI_INITRAMFS_KERNEL_MODULES:append:bsp-next = " kernel-module-cdns-pltfrm kernel-module-ti-j721e-ufs"
> diff --git a/meta-ti-bsp/conf/machine/include/ti-soc.inc b/meta-ti-bsp/conf/machine/include/ti-soc.inc
> index 018e9bfb..1d18ceab 100644
> --- a/meta-ti-bsp/conf/machine/include/ti-soc.inc
> +++ b/meta-ti-bsp/conf/machine/include/ti-soc.inc
> @@ -27,3 +27,5 @@ CLASS_DEVICETREE_PREFIX = "${@ 'ti-devicetree-prefix' if d.getVar('KERNEL_DEVICE
>   
>   KERNEL_CLASSES += "${CLASS_DEVICETREE_PREFIX}"
>   IMAGE_CLASSES += "${CLASS_DEVICETREE_PREFIX}"
> +
> +TI_INITRAMFS_KERNEL_MODULES ?= ""
> \ No newline at end of file

Add newlines at end of files.

Andrew

> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#19127): https://lists.yoctoproject.org/g/meta-ti/message/19127
> Mute This Topic: https://lists.yoctoproject.org/mt/115769464/3619733
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [afd@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


