Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E54AC00140
	for <webhook@archiver.kernel.org>; Wed, 10 Aug 2022 16:11:35 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.231.1660147891390214274
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 10 Aug 2022 09:11:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8333B40CEA;
	Wed, 10 Aug 2022 16:11:30 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HKyiOCbtI2js; Wed, 10 Aug 2022 16:11:30 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-80-88.washdc.fios.verizon.net
 [100.15.80.88])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 544E840CE4;
	Wed, 10 Aug 2022 16:11:27 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 7D06E1749C6; Wed, 10 Aug 2022 12:11:25 -0400 (EDT)
Date: Wed, 10 Aug 2022 12:11:25 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: afd@ti.com
Cc: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][dunfell][PATCH 2/2] conf: machine: am64xx-evm: Make
 HS-SE the default
Message-ID: <20220810161125.GI18692@denix.org>
References: <20220810144708.14171-1-afd@ti.com>
 <20220810144708.14171-2-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220810144708.14171-2-afd@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 10 Aug 2022 16:11:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14945

On Wed, Aug 10, 2022 at 09:47:08AM -0500, Andrew Davis via lists.yoctoproject.org wrote:
> The HS-SE AM64xx machine can now be run on GP devices and built without
> needing the TI_SECURE_DEV_PKG for the same. AM64xx will only be available
> in the HS-FS type going forward. Make the HS-SE the default and remove
> the original GP machine.

Why create another multiconfig? Can all this be done in regular -k3r5?


> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
>  ...m-k3r5-gp.conf => am64xx-evm-k3r5-gp.conf} |  6 ++++-
>  conf/machine/am64xx-evm-k3r5-hs-se.conf       | 14 +++++++++++
>  conf/machine/am64xx-evm-k3r5.conf             | 11 --------
>  conf/machine/am64xx-evm.conf                  |  6 +++++
>  conf/machine/am64xx-hs-evm-k3r5.conf          | 12 ---------
>  conf/machine/am64xx-hs-evm.conf               | 25 -------------------
>  conf/machine/include/am64xx.inc               |  5 ++--
>  conf/multiconfig/k3r5-hs-se.conf              |  3 +++
>  .../trusted-firmware-a_%.bbappend             |  2 +-
>  recipes-security/optee/optee-os_%.bbappend    |  2 +-
>  10 files changed, 33 insertions(+), 53 deletions(-)
>  rename conf/machine/{am64xx-hs-evm-k3r5-gp.conf => am64xx-evm-k3r5-gp.conf} (78%)
>  create mode 100644 conf/machine/am64xx-evm-k3r5-hs-se.conf
>  delete mode 100644 conf/machine/am64xx-evm-k3r5.conf
>  delete mode 100644 conf/machine/am64xx-hs-evm-k3r5.conf
>  delete mode 100644 conf/machine/am64xx-hs-evm.conf
>  create mode 100644 conf/multiconfig/k3r5-hs-se.conf
> 
> diff --git a/conf/machine/am64xx-hs-evm-k3r5-gp.conf b/conf/machine/am64xx-evm-k3r5-gp.conf
> similarity index 78%
> rename from conf/machine/am64xx-hs-evm-k3r5-gp.conf
> rename to conf/machine/am64xx-evm-k3r5-gp.conf
> index b255dca8..c599ee47 100644
> --- a/conf/machine/am64xx-hs-evm-k3r5-gp.conf
> +++ b/conf/machine/am64xx-evm-k3r5-gp.conf
> @@ -4,12 +4,16 @@
>  
>  # Booting GP requires different SYSFW, the rest is handled at runtime
>  
> -require conf/machine/am64xx-hs-evm-k3r5.conf
> +require conf/machine/include/k3r5.inc
>  SOC_FAMILY_append = ":k3r5-gp"
>  
> +SYSFW_SOC = "am64x"
> +SYSFW_CONFIG = "evm"
>  SYSFW_SUFFIX = "gp"
>  SYSFW_TIBOOT3_SYMLINK = ""
>  
> +UBOOT_MACHINE = "am64x_evm_r5_defconfig"
> +
>  SPL_BINARY = ""
>  UBOOT_BINARY = "u-boot-spl.${UBOOT_SUFFIX}"
>  UBOOT_IMAGE = "u-boot-r5spl-gp-${MAINMACHINE}-${PV}-${PR}.${UBOOT_SUFFIX}"
> diff --git a/conf/machine/am64xx-evm-k3r5-hs-se.conf b/conf/machine/am64xx-evm-k3r5-hs-se.conf
> new file mode 100644
> index 00000000..7cab7d15
> --- /dev/null
> +++ b/conf/machine/am64xx-evm-k3r5-hs-se.conf
> @@ -0,0 +1,14 @@
> +#@TYPE: Machine
> +#@NAME: AM64xx HS-SE EVM (R5F)
> +#@DESCRIPTION: Machine configuration for the TI AM64xx HS-SE EVM (R5F core)
> +
> +# Booting HS-SE requires different SYSFW, the rest is handled at runtime
> +
> +require conf/machine/include/k3r5.inc
> +SOC_FAMILY_append = ":k3r5-hs-se"
> +
> +SYSFW_SOC = "am64x"
> +SYSFW_CONFIG = "evm"
> +SYSFW_SUFFIX = "hs"
> +
> +UBOOT_MACHINE = "am64x_evm_r5_defconfig"
> diff --git a/conf/machine/am64xx-evm-k3r5.conf b/conf/machine/am64xx-evm-k3r5.conf
> deleted file mode 100644
> index afd36b72..00000000
> --- a/conf/machine/am64xx-evm-k3r5.conf
> +++ /dev/null
> @@ -1,11 +0,0 @@
> -#@TYPE: Machine
> -#@NAME: AM64xx EVM (R5F)
> -#@DESCRIPTION: Machine configuration for the TI AM64xx EVM (R5F core)
> -
> -require conf/machine/include/k3r5.inc
> -
> -SYSFW_SOC = "am64x"
> -SYSFW_CONFIG = "evm"
> -SYSFW_SUFFIX = "gp"
> -
> -UBOOT_MACHINE = "am64x_evm_r5_defconfig"
> diff --git a/conf/machine/am64xx-evm.conf b/conf/machine/am64xx-evm.conf
> index 2cb7f55a..d6efdf52 100644
> --- a/conf/machine/am64xx-evm.conf
> +++ b/conf/machine/am64xx-evm.conf
> @@ -9,3 +9,9 @@ UBOOT_MACHINE = "am64x_evm_a53_defconfig"
>  SPL_BINARY = "tispl.bin_HS"
>  UBOOT_BINARY = "u-boot.img_HS"
>  UBOOT_SYMLINK = "u-boot.img"
> +
> +# Since default tiboot3.bin on AM64x is for HS-SE, add a version for GP
> +BBMULTICONFIG += "k3r5-gp"
> +IMAGE_BOOT_FILES += " tiboot3-am64x-gp-evm.bin"
> +do_image_wic[mcdepends] += "mc::k3r5-gp:ti-sci-fw:do_deploy"
> +do_image_tar[mcdepends] += "mc::k3r5-gp:ti-sci-fw:do_deploy"
> diff --git a/conf/machine/am64xx-hs-evm-k3r5.conf b/conf/machine/am64xx-hs-evm-k3r5.conf
> deleted file mode 100644
> index 95e68751..00000000
> --- a/conf/machine/am64xx-hs-evm-k3r5.conf
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -#@TYPE: Machine
> -#@NAME: AM64xx HS EVM (R5F)
> -#@DESCRIPTION: Machine configuration for the TI AM64xx HS EVM (R5F core)
> -
> -require conf/machine/include/k3r5.inc
> -
> -SYSFW_SOC = "am64x"
> -SYSFW_CONFIG = "evm"
> -SYSFW_SUFFIX = "hs"
> -SYSFW_SYMLINK = ""
> -
> -UBOOT_MACHINE = "am64x_evm_r5_defconfig"
> diff --git a/conf/machine/am64xx-hs-evm.conf b/conf/machine/am64xx-hs-evm.conf
> deleted file mode 100644
> index 1149d4c7..00000000
> --- a/conf/machine/am64xx-hs-evm.conf
> +++ /dev/null
> @@ -1,25 +0,0 @@
> -#@TYPE: Machine
> -#@NAME: AM64xx HS EVM
> -#@DESCRIPTION: Machine configuration for the TI AM64xx HS EVM
> -
> -require conf/machine/include/am64xx.inc
> -
> -UBOOT_MACHINE = "am64x_evm_a53_defconfig"
> -
> -UBOOT_ENTRYPOINT =       "0x80080000"
> -UBOOT_LOADADDRESS =      "0x80080000"
> -UBOOT_RD_LOADADDRESS =   "0x84000000"
> -UBOOT_RD_ENTRYPOINT =    "0x84000000"
> -UBOOT_DTB_LOADADDRESS =  "0x83000000"
> -UBOOT_DTBO_LOADADDRESS = "0x83080000"
> -UBOOT_DTBO_OFFSET =      "0x00010000"
> -
> -SPL_BINARY = "tispl.bin_HS"
> -UBOOT_BINARY = "u-boot.img_HS"
> -UBOOT_SYMLINK = "u-boot.img"
> -
> -# Since default tiboot3.bin on AM64x is for HS, add a version for GP
> -BBMULTICONFIG += "k3r5-gp"
> -IMAGE_BOOT_FILES += " tiboot3-am64x-gp-evm.bin"
> -do_image_wic[mcdepends] += "mc::k3r5-gp:ti-sci-fw:do_deploy"
> -do_image_tar[mcdepends] += "mc::k3r5-gp:ti-sci-fw:do_deploy"
> diff --git a/conf/machine/include/am64xx.inc b/conf/machine/include/am64xx.inc
> index 930fba08..becc79d4 100644
> --- a/conf/machine/include/am64xx.inc
> +++ b/conf/machine/include/am64xx.inc
> @@ -14,8 +14,9 @@ KERNEL_DEVICETREE = " \
>      ti/k3-am642-evm-nand.dtbo \
>  "
>  
> -do_image_wic[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
> -do_image_tar[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
> +BBMULTICONFIG = "k3r5-hs-se"
> +do_image_wic[mcdepends] = "mc::k3r5-hs-se:ti-sci-fw:do_deploy"
> +do_image_tar[mcdepends] = "mc::k3r5-hs-se:ti-sci-fw:do_deploy"
>  
>  TFA_BOARD = "lite"
>  OPTEEMACHINE = "k3-am64x"
> diff --git a/conf/multiconfig/k3r5-hs-se.conf b/conf/multiconfig/k3r5-hs-se.conf
> new file mode 100644
> index 00000000..701f8e88
> --- /dev/null
> +++ b/conf/multiconfig/k3r5-hs-se.conf
> @@ -0,0 +1,3 @@
> +require k3r5.conf
> +
> +MACHINE_append = "-hs-se"
> diff --git a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
> index 965c99d4..dff244d2 100644
> --- a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
> +++ b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
> @@ -27,7 +27,7 @@ do_compile_append_am65xx-hs-evm() {
>  	tfa_sign_k3hs
>  }
>  
> -do_compile_append_am64xx-hs-evm() {
> +do_compile_append_am64xx-evm() {
>  	tfa_sign_k3hs
>  }
>  
> diff --git a/recipes-security/optee/optee-os_%.bbappend b/recipes-security/optee/optee-os_%.bbappend
> index 5a25bd99..8a429bbc 100644
> --- a/recipes-security/optee/optee-os_%.bbappend
> +++ b/recipes-security/optee/optee-os_%.bbappend
> @@ -66,7 +66,7 @@ do_compile_append_am65xx-hs-evm() {
>      optee_sign_k3hs
>  }
>  
> -do_compile_append_am64xx-hs-evm() {
> +do_compile_append_am64xx-evm() {
>      optee_sign_k3hs
>  }
>  
> -- 
> 2.36.1
> 

