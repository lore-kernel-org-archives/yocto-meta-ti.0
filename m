Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F658CAC5A5
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 21:15:33 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.223.1758662128410294617
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 23 Sep 2025 14:15:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=D9Hs74Ug;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: reatmon@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58NLFRhi1071848;
	Tue, 23 Sep 2025 16:15:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758662127;
	bh=Z/rJTFKbxq0ymtBNzhxPWV/Iyxm+oQDeZyCok7Yncjk=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=D9Hs74Ughltw1EiHjNjrxXEj59puZUqwjq/v2wRWLYsRdu+wP93ZNtQZJHcGwM6K0
	 VnwFH3T4rbko5qifATYoRKpay2+jaJwXl1RLwI3DkVXjgPOe07t9SuKNS2VqJQoK5i
	 cM1VjrbP+4jh4aCPpDi5SmojwTUOKN2m9p7WGzuY=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58NLFQJH3065901
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 23 Sep 2025 16:15:27 -0500
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 23
 Sep 2025 16:15:26 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 23 Sep 2025 16:15:26 -0500
Received: from [10.249.37.202] ([10.249.37.202])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58NLFQ6o653541;
	Tue, 23 Sep 2025 16:15:26 -0500
Message-ID: <81a30ddf-5067-447b-adf2-ade8d683a8df@ti.com>
Date: Tue, 23 Sep 2025 16:15:26 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [master][PATCH 4/4 v2] meta-ti-bsp: conf: machine: include: Build
 initrd for all K3 platforms
To: Moteen Shah <m-shah@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: <vigneshr@ti.com>, <u-kumar1@ti.com>, <a-limaye@ti.com>,
        <n-francis@ti.com>, <praneeth@ti.com>, <jm@ti.com>, <b-padhi@ti.com>,
        <bb@ti.com>, <denys@konsulko.com>, <rs@ti.com>
References: <20250919093831.20609-1-m-shah@ti.com>
 <20250919093831.20609-5-m-shah@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20250919093831.20609-5-m-shah@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 23 Sep 2025 21:15:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19058



On 9/19/2025 4:38 AM, Moteen Shah wrote:
> Trigger build for initramfs image and package it in the boot partition
> of all K3 platforms whenever an image recipe is built with upstream
> kernel(mainline or mainline-next).
> 
> Signed-off-by: Moteen Shah <m-shah@ti.com>
> ---
>   meta-ti-bsp/conf/machine/include/k3.inc | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-ti-bsp/conf/machine/include/k3.inc b/meta-ti-bsp/conf/machine/include/k3.inc

If this flow is meant to apply to ALL TI platforms, then these changes 
should be in ti-soc.inc and not k3.inc.  You are missing am335, am43, 
and am57 with this change.


> index 50411a8e..c0c49e0d 100644
> --- a/meta-ti-bsp/conf/machine/include/k3.inc
> +++ b/meta-ti-bsp/conf/machine/include/k3.inc
> @@ -33,6 +33,8 @@ MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "kernel-image-image ti-kernel-fitimage"
>   
>   TFA_PLATFORM = "k3"
>   
> +BUILD_INITRD_IMAGE = ""
> +

Don't split the default assignment of this variable from the overrides. 
Moved it down below.

>   # Use the expected value of the ubifs filesystem's volume name in the kernel
>   # and u-boot.
>   UBI_VOLNAME = "rootfs"
> @@ -43,7 +45,11 @@ MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "ti-pka-fw"
>   
>   IMAGE_FSTYPES += "tar.xz wic.xz wic.bmap"
>   
> -IMAGE_BOOT_FILES ?= "${SPL_BINARYNAME} u-boot.${UBOOT_SUFFIX} tiboot3.bin tiboot3-*-evm.bin"
> +BUILD_INITRD_IMAGE:bsp-mainline = "ti-initrd-image:do_image_complete"
> +BUILD_INITRD_IMAGE:bsp-next = "ti-initrd-image:do_image_complete"
> +do_image_complete[depends] += "${BUILD_INITRD_IMAGE}"

After speaking with Denys, he is suggesting to use EXTRA_IMAGEDEPENDS 
instead of the do_image_complete to make it be built.

BUILD_CORE_INITRAMFS_IMAGE ?= ""
BUILD_CORE_INITRAMFS_IMAGE:bsp-mainline = "ti-core-initramfs"
BUILD_CORE_INITRAMFS_IMAGE:bsp-next = "ti-core-initramfs"
EXTRA_IMAGEDEPENDS += "${BUILD_CORE_INITRAMFS_IMAGE}"

Give that a try and see if it makes the initramfs be built correctly.

> +
> +IMAGE_BOOT_FILES ?= "${SPL_BINARYNAME} u-boot.${UBOOT_SUFFIX} tiboot3.bin tiboot3-*-evm.bin initrd.cpio.xz"

Fix filename here too.  s/initrd/ti-core-initramfs/

>   IMAGE_EFI_BOOT_FILES ?= "${IMAGE_BOOT_FILES}"
>   
>   EFI_PROVIDER ?= "grub-efi"

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

