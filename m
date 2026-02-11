Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF635ECD6EA
	for <webhook@archiver.kernel.org>; Wed, 11 Feb 2026 20:25:59 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28542.1770841551708240031
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 11 Feb 2026 12:25:52 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 80F4340CB1;
	Wed, 11 Feb 2026 20:25:50 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0UThPSD4Amhl; Wed, 11 Feb 2026 20:25:50 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 45F5240BA8;
	Wed, 11 Feb 2026 20:25:47 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 693D7173883; Wed, 11 Feb 2026 15:25:46 -0500 (EST)
Date: Wed, 11 Feb 2026 15:25:46 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master][PATCH] ti-core-initramfs: Rework logic
Message-ID: <20260211202546.GJ11121@denix.org>
References: <20260211200414.1642061-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260211200414.1642061-1-reatmon@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 11 Feb 2026 20:25:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19488

On Wed, Feb 11, 2026 at 02:04:14PM -0600, Ryan Eatmon via lists.yoctoproject.org wrote:
> Clean up the logic of the new ti-core-initramfs to reduce the impact on
> downstream layers.
> 
> - Flip the logic in the machine .conf files to track the list of
>   required kernel modules for that platform, but if the variable is set
>   to "" then the ti-core-initramfs will not be created.
> 
> - Redo the logic of when we require creation/usage of the initramfs to
>   just platforms that need it (ie that set TI_CORE_INITRAMFS_KERNEL_MODULES).
> 
> - Add a big switch to disable the initramfs entirely.  In that case, the
>   user is on their own to make sure that the kernel has everything it
>   needs to boot either via config fragments to turn on the needed
>   modules, or by using the TI_CORE_INITRAMFS_KERNEL_MODULES
>   variable to populate their own initramfs.

In our discussion we agreed to use TI_CORE_INITRAMFS_KERNEL_MODULES to 
determine whether to enable initramfs or not. While I don't mind adding 
a separate global TI_CORE_INITRAMFS_ENABLED switch, but I now wonder if 
two checks are redundant and whether it makes sense to create initramfs 
even when the list of modules is empty, if it's enabled?

Also see below for another comment.


> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>  meta-ti-bsp/conf/machine/include/am62axx.inc  |  6 ++--
>  meta-ti-bsp/conf/machine/include/j721e.inc    |  6 ++--
>  meta-ti-bsp/conf/machine/include/j784s4.inc   |  6 ++--
>  .../machine/include/ti-core-initramfs.inc     | 29 +++++++++++++++++++
>  meta-ti-bsp/conf/machine/include/ti-soc.inc   | 20 +------------
>  .../packagegroup-ti-core-initramfs.bb         |  4 +--
>  6 files changed, 41 insertions(+), 30 deletions(-)
>  create mode 100644 meta-ti-bsp/conf/machine/include/ti-core-initramfs.inc
> 
> diff --git a/meta-ti-bsp/conf/machine/include/am62axx.inc b/meta-ti-bsp/conf/machine/include/am62axx.inc
> index 1fd4a1ac..0577ffaa 100644
> --- a/meta-ti-bsp/conf/machine/include/am62axx.inc
> +++ b/meta-ti-bsp/conf/machine/include/am62axx.inc
> @@ -12,6 +12,6 @@ OPTEEMACHINE = "k3-am62x"
>  
>  MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "cnm-wave-fw"
>  
> -TI_INITRAMFS_KERNEL_MODULES:append:bsp-ti-6_18 = " kernel-module-tps6594-i2c kernel-module-tps6594-regulator kernel-module-tps6594-core"
> -TI_INITRAMFS_KERNEL_MODULES:append:bsp-mainline = " kernel-module-tps6594-i2c kernel-module-tps6594-regulator kernel-module-tps6594-core"
> -TI_INITRAMFS_KERNEL_MODULES:append:bsp-next = " kernel-module-tps6594-i2c kernel-module-tps6594-regulator kernel-module-tps6594-core"
> +TI_CORE_INITRAMFS_KERNEL_MODULES = "kernel-module-tps6594-i2c kernel-module-tps6594-regulator kernel-module-tps6594-core"
> +TI_CORE_INITRAMFS_KERNEL_MODULES:bsp-ti-6_6 = ""
> +TI_CORE_INITRAMFS_KERNEL_MODULES:bsp-ti-6_12 = ""
> diff --git a/meta-ti-bsp/conf/machine/include/j721e.inc b/meta-ti-bsp/conf/machine/include/j721e.inc
> index f329e269..3e4fbf17 100644
> --- a/meta-ti-bsp/conf/machine/include/j721e.inc
> +++ b/meta-ti-bsp/conf/machine/include/j721e.inc
> @@ -21,6 +21,6 @@ TI_VXE_VXD_DRIVER:bsp-ti-6_18 = ""
>  
>  MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "cadence-mhdp-fw vxd-dec-fw ti-eth-fw-j721e ${TI_VXE_VXD_DRIVER}"
>  
> -TI_INITRAMFS_KERNEL_MODULES:append:bsp-ti-6_18 = " kernel-module-cdns-pltfrm kernel-module-ti-j721e-ufs"
> -TI_INITRAMFS_KERNEL_MODULES:append:bsp-mainline = " kernel-module-cdns-pltfrm kernel-module-ti-j721e-ufs"
> -TI_INITRAMFS_KERNEL_MODULES:append:bsp-next = " kernel-module-cdns-pltfrm kernel-module-ti-j721e-ufs"
> +TI_CORE_INITRAMFS_KERNEL_MODULES = "kernel-module-cdns-pltfrm kernel-module-ti-j721e-ufs"
> +TI_CORE_INITRAMFS_KERNEL_MODULES:bsp-ti-6_6 = ""
> +TI_CORE_INITRAMFS_KERNEL_MODULES:bsp-ti-6_12 = ""
> diff --git a/meta-ti-bsp/conf/machine/include/j784s4.inc b/meta-ti-bsp/conf/machine/include/j784s4.inc
> index 42c95b11..4dc3a71b 100644
> --- a/meta-ti-bsp/conf/machine/include/j784s4.inc
> +++ b/meta-ti-bsp/conf/machine/include/j784s4.inc
> @@ -14,6 +14,6 @@ OPTEEMACHINE = "k3-j784s4"
>  
>  MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "cadence-mhdp-fw cnm-wave-fw ti-eth-fw-j784s4"
>  
> -TI_INITRAMFS_KERNEL_MODULES:append:bsp-ti-6_18 = " kernel-module-cdns-pltfrm kernel-module-ti-j721e-ufs"
> -TI_INITRAMFS_KERNEL_MODULES:append:bsp-mainline = " kernel-module-cdns-pltfrm kernel-module-ti-j721e-ufs"
> -TI_INITRAMFS_KERNEL_MODULES:append:bsp-next = " kernel-module-cdns-pltfrm kernel-module-ti-j721e-ufs"
> +TI_CORE_INITRAMFS_KERNEL_MODULES = "kernel-module-cdns-pltfrm kernel-module-ti-j721e-ufs"
> +TI_CORE_INITRAMFS_KERNEL_MODULES:bsp-ti-6_6 = ""
> +TI_CORE_INITRAMFS_KERNEL_MODULES:bsp-ti-6_12 = ""
> diff --git a/meta-ti-bsp/conf/machine/include/ti-core-initramfs.inc b/meta-ti-bsp/conf/machine/include/ti-core-initramfs.inc
> new file mode 100644
> index 00000000..2b210169
> --- /dev/null
> +++ b/meta-ti-bsp/conf/machine/include/ti-core-initramfs.inc
> @@ -0,0 +1,29 @@
> +#------------------------------------------------------------------------------
> +#
> +# To turn off the ti-core-initramfs.cpio creation just set:
> +#
> +#   TI_CORE_INITRAMFS_ENABLED = "0"
> +#
> +#------------------------------------------------------------------------------
> +TI_CORE_INITRAMFS_ENABLED ?= "0"

Did you mean to weakly set it to "1" here? :)


> +TI_CORE_INITRAMFS_KERNEL_MODULES ?= ""
> +
> +TI_CORE_INITRAMFS_IMAGE = "ti-core-initramfs"
> +TI_CORE_INITRAMFS_IMAGE_FILE = "${TI_CORE_INITRAMFS_IMAGE}.cpio.xz"
> +
> +#------------------------------------------------------------------------------
> +# Only enable the initramf code if TI_CORE_INITRAMFS_KERNEL_MODULES is set.
> +#------------------------------------------------------------------------------
> +TI_CORE_INITRAMFS_DO_IMAGE_WIC = "${@ '${TI_CORE_INITRAMFS_IMAGE}:do_image_complete' if d.getVar('TI_CORE_INITRAMFS_KERNEL_MODULES') else ''}"
> +TI_CORE_INITRAMFS_WKS_FLAG = "${@ ',initrd=${TI_CORE_INITRAMFS_IMAGE_FILE}' if d.getVar('TI_CORE_INITRAMFS_KERNEL_MODULES') else ''}"
> +TI_CORE_INITRAMFS_IMAGE_BOOT_FILES = "${@ '${TI_CORE_INITRAMFS_IMAGE_FILE}' if d.getVar('TI_CORE_INITRAMFS_KERNEL_MODULES') else ''}"
> +
> +#------------------------------------------------------------------------------
> +# Apply all of the needed changes to create/use the initramfs (if enabled).
> +#------------------------------------------------------------------------------
> +do_image_wic[depends] += "${@ '${TI_CORE_INITRAMFS_DO_IMAGE_WIC}' if d.getVar('TI_CORE_INITRAMFS_ENABLED') == "1" else ''}"
> +
> +TI_WKS_INITRAMFS ?= "${@ '${TI_CORE_INITRAMFS_WKS_FLAG}' if d.getVar('TI_CORE_INITRAMFS_ENABLED') == "1" else ''}"
> +
> +IMAGE_BOOT_FILES += "${@ '${TI_CORE_INITRAMFS_IMAGE_BOOT_FILES}' if d.getVar('TI_CORE_INITRAMFS_ENABLED') == "1" else ''}"
> diff --git a/meta-ti-bsp/conf/machine/include/ti-soc.inc b/meta-ti-bsp/conf/machine/include/ti-soc.inc
> index 74346430..c4472113 100644
> --- a/meta-ti-bsp/conf/machine/include/ti-soc.inc
> +++ b/meta-ti-bsp/conf/machine/include/ti-soc.inc
> @@ -3,6 +3,7 @@
>  SOC_FAMILY = "ti-soc"
>  require conf/machine/include/soc-family.inc
>  require conf/machine/include/ti-extras.inc
> +require conf/machine/include/ti-core-initramfs.inc
>  
>  # kernel, initrd load addresses for the fitImage in all TI platforms
>  UBOOT_ENTRYPOINT = "0x82000000"
> @@ -28,22 +29,3 @@ CLASS_DEVICETREE_PREFIX = "${@ 'ti-devicetree-prefix' if d.getVar('KERNEL_DEVICE
>  
>  KERNEL_CLASSES += "${CLASS_DEVICETREE_PREFIX}"
>  IMAGE_CLASSES += "${CLASS_DEVICETREE_PREFIX}"
> -
> -BUILD_CORE_INITRAMFS_IMAGE = "ti-core-initramfs"
> -BUILD_CORE_INITRAMFS_IMAGE_FILE = "${BUILD_CORE_INITRAMFS_IMAGE}.cpio.xz"
> -
> -BUILD_CORE_INITRAMFS_IMAGE_STEP ?= ""
> -BUILD_CORE_INITRAMFS_IMAGE_STEP:bsp-ti-6_18 = "${BUILD_CORE_INITRAMFS_IMAGE}:do_image_complete"
> -BUILD_CORE_INITRAMFS_IMAGE_STEP:bsp-mainline = "${BUILD_CORE_INITRAMFS_IMAGE}:do_image_complete"
> -BUILD_CORE_INITRAMFS_IMAGE_STEP:bsp-next = "${BUILD_CORE_INITRAMFS_IMAGE}:do_image_complete"
> -
> -do_image_wic[depends] += "${BUILD_CORE_INITRAMFS_IMAGE_STEP}"
> -
> -TI_WKS_INITRAMFS ?= ""
> -TI_WKS_INITRAMFS:bsp-ti-6_18 = ",initrd=${BUILD_CORE_INITRAMFS_IMAGE_FILE}"
> -TI_WKS_INITRAMFS:bsp-mainline = ",initrd=${BUILD_CORE_INITRAMFS_IMAGE_FILE}"
> -TI_WKS_INITRAMFS:bsp-next = ",initrd=${BUILD_CORE_INITRAMFS_IMAGE_FILE}"
> -
> -IMAGE_BOOT_FILES:append:bsp-ti-6_18 = " ${BUILD_CORE_INITRAMFS_IMAGE_FILE}"
> -IMAGE_BOOT_FILES:append:bsp-mainline = " ${BUILD_CORE_INITRAMFS_IMAGE_FILE}"
> -IMAGE_BOOT_FILES:append:bsp-next = " ${BUILD_CORE_INITRAMFS_IMAGE_FILE}"
> diff --git a/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb b/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb
> index c759808c..aae63495 100644
> --- a/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb
> +++ b/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb
> @@ -6,10 +6,10 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
>  inherit packagegroup
>  
> -TI_INITRAMFS_KERNEL_MODULES ?= ""
> +TI_CORE_INITRAMFS_KERNEL_MODULES ?= ""
>  
>  RDEPENDS:${PN} += "\
> -    ${TI_INITRAMFS_KERNEL_MODULES} \
> +    ${TI_CORE_INITRAMFS_KERNEL_MODULES} \
>      ${VIRTUAL-RUNTIME_base-utils} \
>      base-passwd \
>      initramfs-framework-base \
> -- 
> 2.43.0

