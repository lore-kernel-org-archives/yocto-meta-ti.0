Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 769F8CAC5AC
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 21:15:03 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.206.1758662101530562816
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 23 Sep 2025 14:15:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=XPzkm6F5;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: reatmon@ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58NLExfE1533899;
	Tue, 23 Sep 2025 16:14:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758662099;
	bh=+dhDzLlceZ4AjVQtH8h15bKW352h7Hmevq9KaV4DmOA=;
	h=Date:From:Subject:To:CC:References:In-Reply-To;
	b=XPzkm6F5KBOKugIuO1ZhdealM1yTL7mDRfDC5Eq1oZVJQG/2Lge1BfJXJ+DrK9STc
	 8wLI6KqHBSJK7iX1ZOjrVX51sogoBn5SZQ/qnqO3bNG0vcxrY9Q8/DbjtJxC+99J8o
	 xLvmJX3TE/yIPCuhuR55gQcQ6SgmJy/+80W5zNuQ=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58NLExkH1359521
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 23 Sep 2025 16:14:59 -0500
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 23
 Sep 2025 16:14:59 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 23 Sep 2025 16:14:59 -0500
Received: from [10.249.37.202] ([10.249.37.202])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58NLExpP909977;
	Tue, 23 Sep 2025 16:14:59 -0500
Message-ID: <1058b2e6-7196-4cb2-b851-3f2b6e015b99@ti.com>
Date: Tue, 23 Sep 2025 16:14:59 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Ryan Eatmon <reatmon@ti.com>
Subject: Re: [master][PATCH 2/4 v2] recipes-ti: initrd: Make minimal initrd
 image
To: Moteen Shah <m-shah@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: <vigneshr@ti.com>, <u-kumar1@ti.com>, <a-limaye@ti.com>,
        <n-francis@ti.com>, <praneeth@ti.com>, <jm@ti.com>, <b-padhi@ti.com>,
        <bb@ti.com>, <denys@konsulko.com>, <rs@ti.com>
References: <20250919093831.20609-1-m-shah@ti.com>
 <20250919093831.20609-3-m-shah@ti.com>
Content-Language: en-US
In-Reply-To: <20250919093831.20609-3-m-shah@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 23 Sep 2025 21:15:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19056



On 9/19/2025 4:38 AM, Moteen Shah wrote:
> Introduce a new minimal initramfs image which will be used
> for all K3 devices in the boot flow. The image will package
> boot essential and other modules which will be modprobed by
> initramfs-udev once the inbuilt drivers gets probed.
> 
> Signed-off-by: Moteen Shah <m-shah@ti.com>
> ---
>   .../initrd/packagegroup-ti-initrd.bb          |  5 ++
>   .../recipes-ti/initrd/ti-initrd-image.bb      | 50 +++++++++++++++++++
>   2 files changed, 55 insertions(+)
>   create mode 100644 meta-ti-bsp/recipes-ti/initrd/packagegroup-ti-initrd.bb
>   create mode 100644 meta-ti-bsp/recipes-ti/initrd/ti-initrd-image.bb
> 
> diff --git a/meta-ti-bsp/recipes-ti/initrd/packagegroup-ti-initrd.bb b/meta-ti-bsp/recipes-ti/initrd/packagegroup-ti-initrd.bb
> new file mode 100644
> index 00000000..8847cb2e
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-ti/initrd/packagegroup-ti-initrd.bb

We are using initrd and initramfs in different places.  Yocto seems to 
use initramfs everywhere.  Let's unify to initramfs instead of initrd.

Change the recipe name to packagegroup-ti-core-initramfs.bb

> @@ -0,0 +1,5 @@
> +SUMMARY = "Minimal initrd for boot requirements"
> +
> +require recipes-core/packagegroups/packagegroup-core-boot.bb
> +
> +RDEPENDS:${PN}:remove = "grub-efi kernel"
> diff --git a/meta-ti-bsp/recipes-ti/initrd/ti-initrd-image.bb b/meta-ti-bsp/recipes-ti/initrd/ti-initrd-image.bb
> new file mode 100644
> index 00000000..f47307e5
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-ti/initrd/ti-initrd-image.bb

Change the recipe name to ti-core-initramfs.bb


> @@ -0,0 +1,50 @@
> +SUMMARY = "TI SDK minimal initrd image"

s/initrd/initramfs/

> +
> +DESCRIPTION = "Image meant to probe boot essential modules\
> + and other modules to reach the userspace, which cannot be\
> + built inside the upstream linux kernel image.\
> +"
> +
> +LICENSE = "MIT"
> +
> +inherit core-image
> +
> +IMAGE_NAME = "initrd"

Change the image name to ti-core-initramfs.  There is no good reason to 
not use more characters and be more descriptive.

> +IMAGE_NAME_SUFFIX = ""
> +
> +IMAGE_FEATURES:remove = "package-management"
> +
> +INITRAMFS_FSTYPES = "cpio cpio.xz"
> +
> +IMAGE_FSTYPES = "${INITRAMFS_FSTYPES}"
> +
> +INITRAMFS_SCRIPTS ?= "\
> +    initramfs-framework-base \
> +    initramfs-module-udev \
> +    initramfs-module-nfsrootfs \
> +"
> +
> +UTILS = "\
> +    cifs-utils \
> +    nfs-utils \
> +    nfs-utils-client \
> +"

I think the two variables above all need to move into the packagegroup 
and not directly in the image recipe.  Otherwise what is the point of 
the packagegroup at all?

Use RDEPENDS to make the packagegroup depend on the variables, and then 
remove them from the list below.  And move the 
TI_INITRAMFS_KERNEL_MODULES entry as well.

That way if someone else wants to create another initramfs to do 
something like secure boot (or whatever) they have a single point to 
include and pull in all of the files required for boot.

> +PACKAGE_INSTALL = "\
> +    ${INITRAMFS_SCRIPTS} \
> +    ${UTILS} \
> +    ${TI_INITRAMFS_KERNEL_MODULES} \
> +    packagegroup-ti-initrd \

s/packagegroup-ti-initrd/packagegroup-ti-core-initramfs/

> +"
> +
> +export IMAGE_BASENAME = "ti-initrd-image"

s/ti-initrd-image/ti-core-initramfs/

> +
> +# To further reduce the size of the rootfs, remove the /boot directory from
> +# the final image this is usually done by adding RDEPENDS_kernel-base = ""
> +# in the configuration file. In our case we can't use this method. Instead we
> +# just wipe out the content of "/boot" before creating the image.
> +ROOTFS_POSTPROCESS_COMMAND += "empty_boot_dir; "
> +empty_boot_dir () {
> +	rm -rf ${IMAGE_ROOTFS}/boot/*
> +}

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

