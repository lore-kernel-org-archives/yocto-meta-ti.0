Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E377CA101F
	for <webhook@archiver.kernel.org>; Fri, 12 Sep 2025 16:12:17 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.20785.1757693530886422417
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 12 Sep 2025 09:12:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=RDepx2cG;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: reatmon@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58CGCAXS1006112
	for <meta-ti@lists.yoctoproject.org>; Fri, 12 Sep 2025 11:12:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757693530;
	bh=z2pMPWXLHyJzWQDgXscfc7zWSPwH51gxk9D8XKld2jg=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=RDepx2cGyTytYw51IwC4nLpglUuup6wOm/ozg6/FrJTu/7Q1+IGYSelT5eaBc0pws
	 5ttEDF8+lyWHc7kAKjUyay7vDl67eK3NvALdLV4q4HP8mQjm3jf1KzVMtbIIi2MFGI
	 +N4szZeKgko+E1l/FPjSvwaKojWBgvvIxNsrWdhw=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58CGCAHn1972433
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 12 Sep 2025 11:12:10 -0500
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 12
 Sep 2025 11:12:09 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 12 Sep 2025 11:12:09 -0500
Received: from [10.249.37.202] ([10.249.37.202])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58CGC9BO4161224;
	Fri, 12 Sep 2025 11:12:09 -0500
Message-ID: <d5b52951-ad23-4a2a-b541-ea20a1b54b81@ti.com>
Date: Fri, 12 Sep 2025 11:12:09 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [master][PATCH 1/2] recipes-ti: initrd: Make minimal initrd image
To: Moteen Shah <m-shah@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: <vigneshr@ti.com>, <u-kumar1@ti.com>, <a-limaye@ti.com>,
        <n-francis@ti.com>, <praneeth@ti.com>, <jm@ti.com>, <b-padhi@ti.com>
References: <20250908105315.19583-1-m-shah@ti.com>
 <20250908105315.19583-2-m-shah@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20250908105315.19583-2-m-shah@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 12 Sep 2025 16:12:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19005


After some discussion in a call with Denys today, I think we have some 
feedback on what is needed to better leverage this patch idea.

1) We need the way to get this image built as part of the build process. 
  The best way to accomplish that will likely be to follow the firmware 
approach and include it in the MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS 
variable for each platform that requires it.

2) We need a better way to specify the list of MODULES rather than 
hardcoding the list in the recipe.  The list of required modules will 
likely be different for different platforms.

To that end we recommend creating a new variable that should be defined 
in the ti-soc.inc:

   TI_INITRAMFS_KERNEL_MODULES ?= ""

Then in each platform specific .inc file we can set that list to the 
needed modules based on the ti-bsp need.  Our vendor kernels do not need 
it, so it could remain blank, but the mainline/next bsps could set it 
since those actually create the kernel module packages.

   TI_INITRAMFS_KERNEL_MODULES:append:bsp-mainline = " mod1 mod2"
   TI_INITRAMFS_KERNEL_MODULES:append:bsp-next = " mod1 mod2"

Then in the ti-initrd-image.bb you would drop the MODULES="" setting and 
just change to the variable TI_INITRAMFS_KERNEL_MODULES.

This way, if there are other layers that want to create their own 
initramfs we have a variable in place for them to use to include the 
required modules based on the kernel version that is being built.


So, I would probably break all of this up into multiple patches.  The 
first patch would the work in #2 above to establish the needed variable 
for all platforms.  The next patches are your patches but moving to 
TI_INITRAMFS_KERNEL_MODULES.  And the final patch would be adding your 
new ti-initrd-image into MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS list for 
all platforms.

Did I miss anything, Denys?


On 9/8/2025 5:53 AM, Moteen Shah wrote:
> Introduce a new minimal initramfs image which will be used
> for all K3 devices in the boot flow. The image will package
> boot essential and other modules which will be modprobed by
> initramfs-udev once the inbuilt drivers gets probed.
> 
> Signed-off-by: Moteen Shah <m-shah@ti.com>
> ---
>   .../initrd/packagegroup-ti-initrd.bb          |  5 ++
>   .../recipes-ti/initrd/ti-initrd-image.bb      | 56 +++++++++++++++++++
>   2 files changed, 61 insertions(+)
>   create mode 100644 meta-ti-bsp/recipes-ti/initrd/packagegroup-ti-initrd.bb
>   create mode 100644 meta-ti-bsp/recipes-ti/initrd/ti-initrd-image.bb
> 
> diff --git a/meta-ti-bsp/recipes-ti/initrd/packagegroup-ti-initrd.bb b/meta-ti-bsp/recipes-ti/initrd/packagegroup-ti-initrd.bb
> new file mode 100644
> index 00000000..8847cb2e
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-ti/initrd/packagegroup-ti-initrd.bb
> @@ -0,0 +1,5 @@
> +SUMMARY = "Minimal initrd for boot requirements"
> +
> +require recipes-core/packagegroups/packagegroup-core-boot.bb
> +
> +RDEPENDS:${PN}:remove = "grub-efi kernel"
> diff --git a/meta-ti-bsp/recipes-ti/initrd/ti-initrd-image.bb b/meta-ti-bsp/recipes-ti/initrd/ti-initrd-image.bb
> new file mode 100644
> index 00000000..f6b99073
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-ti/initrd/ti-initrd-image.bb
> @@ -0,0 +1,56 @@
> +SUMMARY = "TI SDK minimal initrd image"
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
> +
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
> +MODULES = "\
> +    kernel-module-cdns-pltfrm \
> +    kernel-module-ti-j721e-ufs \
> +    kernel-module-tps6594-i2c \
> +"
> +
> +UTILS = "\
> +    cifs-utils \
> +    nfs-utils \
> +    nfs-utils-client \
> +"
> +
> +PACKAGE_INSTALL = "\
> +    ${INITRAMFS_SCRIPTS} \
> +    ${UTILS} \
> +    ${MODULES} \
> +    packagegroup-ti-initrd \
> +"
> +
> +export IMAGE_BASENAME = "ti-initrd-image"
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

