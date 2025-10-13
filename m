Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C8F2CCD185
	for <webhook@archiver.kernel.org>; Mon, 13 Oct 2025 22:10:24 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.1515.1760393417322063736
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 13 Oct 2025 15:10:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Hjgl/5CH;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: reatmon@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59DMAGY7995686;
	Mon, 13 Oct 2025 17:10:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1760393416;
	bh=hrMBOi0Su0m2xHDtIA0tfdUFBHwKkISW+1GJzHDRYNU=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Hjgl/5CHyMiPR/SMjdW07czF2dAgiSucB+z9T0i0rHOfNfYC0g+n+v3sL6aw9VBNj
	 Z6eRPLxuAFux2Or09tq+8yDvL3HYthzYCveFMpAANqJ+QZa9c8jQex/gxnScW1KeuA
	 1YoiJjhHx4nI2ZOFSLnd13spRj2pQ7sdVppOjdZg=
Received: from DFLE208.ent.ti.com (dfle208.ent.ti.com [10.64.6.66])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59DMAGAD4118334
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 13 Oct 2025 17:10:16 -0500
Received: from DFLE212.ent.ti.com (10.64.6.70) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 13 Oct
 2025 17:10:15 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 13 Oct 2025 17:10:15 -0500
Received: from [10.249.37.202] ([10.249.37.202])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59DMAFUW2519940;
	Mon, 13 Oct 2025 17:10:15 -0500
Message-ID: <5602c21c-9db1-4634-a790-c9631ba4888a@ti.com>
Date: Mon, 13 Oct 2025 17:10:15 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [master][PATCH v4 4/4] meta-ti-bsp: conf: machine: include: Build
 initramfs for all TI SoC's
To: Moteen Shah <m-shah@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: <vigneshr@ti.com>, <u-kumar1@ti.com>, <a-limaye@ti.com>,
        <n-francis@ti.com>, <praneeth@ti.com>, <jm@ti.com>, <b-padhi@ti.com>,
        <bb@ti.com>, <denys@konsulko.com>, <rs@ti.com>
References: <20251006115010.1530509-1-m-shah@ti.com>
 <20251006115010.1530509-5-m-shah@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20251006115010.1530509-5-m-shah@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 13 Oct 2025 22:10:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19120



On 10/6/2025 6:50 AM, Moteen Shah wrote:
> Trigger build for initramfs image and package it in the boot partition
> of all TI SoC's whenever an image recipe is built with upstream
> kernel(mainline or mainline-next).
> 
> Signed-off-by: Moteen Shah <m-shah@ti.com>
> ---
>   meta-ti-bsp/conf/machine/include/ti-soc.inc | 10 +++++++++-
>   1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-ti-bsp/conf/machine/include/ti-soc.inc b/meta-ti-bsp/conf/machine/include/ti-soc.inc
> index 1d18ceab..68606cc4 100644
> --- a/meta-ti-bsp/conf/machine/include/ti-soc.inc
> +++ b/meta-ti-bsp/conf/machine/include/ti-soc.inc
> @@ -28,4 +28,12 @@ CLASS_DEVICETREE_PREFIX = "${@ 'ti-devicetree-prefix' if d.getVar('KERNEL_DEVICE
>   KERNEL_CLASSES += "${CLASS_DEVICETREE_PREFIX}"
>   IMAGE_CLASSES += "${CLASS_DEVICETREE_PREFIX}"
>   
> -TI_INITRAMFS_KERNEL_MODULES ?= ""
> \ No newline at end of file
> +TI_INITRAMFS_KERNEL_MODULES ?= ""
> +
> +BUILD_CORE_INITRAMFS_IMAGE ?= ""
> +BUILD_CORE_INITRAMFS_IMAGE:bsp-mainline = "ti-core-initramfs:do_image_complete"
> +BUILD_CORE_INITRAMFS_IMAGE:bsp-next = "ti-core-initramfs:do_image_complete"

To avoid hard-coding "ti-core-initramfs" in so many places, let's use 
variables to contain the variations of the string.  That way we onyl 
have to change a single variable to update the name in all places (not 
that I think we will ever want to change it...)

BUILD_CORE_INITRAMFS_IMAGE = "ti-core-initramfs"
BUILD_CORE_INITRAMFS_IMAGE_FILE = "${BUILD_CORE_INITRAMFS_IMAGE}.cpio.xz"

BUILD_CORE_INITRAMFS_IMAGE_STEP ?= ""
BUILD_CORE_INITRAMFS_IMAGE_STEP:bsp-mainline = 
"${BUILD_CORE_INITRAMFS_IMAGE}:do_image_complete"
BUILD_CORE_INITRAMFS_IMAGE_STEP:bsp-next = 
"${BUILD_CORE_INITRAMFS_IMAGE}:do_image_complete"


> +do_image_complete[depends] += "${BUILD_CORE_INITRAMFS_IMAGE}"

This needs to change to do_image_wic since the initramfs file needs to 
be complete for the wic step:

do_image_wic[depends] += "${BUILD_CORE_INITRAMFS_IMAGE_STEP}"


> +
> +IMAGE_BOOT_FILES:append:bsp-mainline = " ti-core-initramfs.cpio.xz"
> +IMAGE_BOOT_FILES:append:bsp-next = " ti-core-initramfs.cpio.xz"

Change these to use the new variable:

IMAGE_BOOT_FILES:append:bsp-mainline = " ${BUILD_CORE_INITRAMFS_IMAGE_FILE}"
IMAGE_BOOT_FILES:append:bsp-next = " ${BUILD_CORE_INITRAMFS_IMAGE_FILE}"


And finally, define the TI_WKS_INITRAMFS variable that patch 3 now 
references.

TI_WKS_INITRAMFS ?= ""
TI_WKS_INITRAMFS:bsp-mainline = ",initrd=${BUILD_CORE_INITRAMFS_IMAGE_FILE}"
TI_WKS_INITRAMFS:bsp-next = ",initrd=${BUILD_CORE_INITRAMFS_IMAGE_FILE}"


I think that with all of this in place, we can start doing some builds 
and working with the test team to update the board configs to start 
picking them up (if available) and using them in the test farm.



-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

