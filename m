Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7179CC61DA4
	for <webhook@archiver.kernel.org>; Tue, 14 Feb 2023 20:41:18 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.5623.1676407277669756028
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 14 Feb 2023 12:41:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=R4qJqq6j;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 31EKfH4g050243;
	Tue, 14 Feb 2023 14:41:17 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1676407277;
	bh=TmcgOuIsGw8N3mg3Yz+jh/Ho+osyjcBfv1cDqBwUDz4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=R4qJqq6jF8gJIJLcLYy020ebB71fe/ZuRLW2lx38oQWFvH94QGty2+dJClD81CxbJ
	 bLVP+2W709PxJnQ/Y4iEzDYuan8Uh0Cmh9XK9g9d78b+inKhqyO+8GOMBkbMqViIDn
	 TTlhN9HVmL5GjHrCpkKuSNJ4nxysGCZBDEK+MV1w=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 31EKfH4N023195
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 14 Feb 2023 14:41:17 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 14
 Feb 2023 14:41:16 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Tue, 14 Feb 2023 14:41:16 -0600
Received: from [10.249.38.163] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 31EKfG4x010895;
	Tue, 14 Feb 2023 14:41:16 -0600
Message-ID: <1a7f81f5-ec7b-85b0-f26a-5861fb4bf953@ti.com>
Date: Tue, 14 Feb 2023 14:41:16 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [dunfell,RFC PATCH-V2] conf: machine: j784s4-evm: Add support for
 J784S4 HS-FS
Content-Language: en-US
To: <sabiya.d@mistralsolutions.com>, <denys@ti.com>, <detheridge@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, Dasnavis <sabiya.d@ti.com>
References: <20230214154939.340754-1-sabiya.d@ti.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20230214154939.340754-1-sabiya.d@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 14 Feb 2023 20:41:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15843



On 2/14/2023 9:49, sabiya.d@mistralsolutions.com wrote:
> From: Dasnavis <sabiya.d@ti.com>
> 
> Add the basic J784S4 HS-FS configuration.
> * Add configurations to support both HS-FS and GP keeping GP as default.
> * Add ti-sci-firmware overrides for HS-FS.
> * Remove evm conf file inclusion in hs-evm conf.
> * Add j784s4 hs-evm specific config to hs-evm conf.
> 
> Signed-off-by: Dasnavis Sabiya <sabiya.d@ti.com>
> Signed-off-by: Dasnavis <sabiya.d@ti.com>
> ---
>   conf/machine/j784s4-evm-k3r5-gp.conf        | 21 +++++++++++++++++++++
>   conf/machine/j784s4-evm-k3r5-sr1-hs-fs.conf | 15 +++++++++++++++
>   conf/machine/j784s4-evm-k3r5.conf           |  1 +
>   conf/machine/j784s4-evm.conf                | 13 ++++++++++---
>   conf/machine/j784s4-hs-evm-k3r5.conf        |  1 +
>   conf/machine/j784s4-hs-evm.conf             | 19 ++++++++++++++++++-
>   recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb      |  3 ++-
>   7 files changed, 68 insertions(+), 5 deletions(-)
>   create mode 100644 conf/machine/j784s4-evm-k3r5-gp.conf
>   create mode 100644 conf/machine/j784s4-evm-k3r5-sr1-hs-fs.conf
> 
> diff --git a/conf/machine/j784s4-evm-k3r5-gp.conf b/conf/machine/j784s4-evm-k3r5-gp.conf
> new file mode 100644
> index 00000000..b8693655
> --- /dev/null
> +++ b/conf/machine/j784s4-evm-k3r5-gp.conf
> @@ -0,0 +1,21 @@
> +#@TYPE: Machine
> +#@NAME: J784S4 GP EVM (R5F)
> +#@DESCRIPTION: Machine configuration for the TI J784S4 GP EVM (R5F core)
> +
> +# Booting GP requires different SYSFW, the rest is handled at runtime
> +
> +require conf/machine/include/k3r5.inc
> +SOC_FAMILY_append = ":k3r5-gp"
> +
> +SYSFW_SOC = "j784s4"
> +SYSFW_CONFIG = "evm"
> +SYSFW_SUFFIX = "gp"
> +SYSFW_TIBOOT3_SYMLINK = "tiboot3.bin"
> +SYSFW_SYMLINK = ""

You do not need the SYSFW_SIMLINK = "" here.


The rule basically is, if you have SYSFW_TIBOOT3_SYMLINK = "", then you 
also need SYSFW_SIMLINK = "".


> +
> +UBOOT_MACHINE = "j784s4_evm_r5_defconfig"
> +
> +SPL_BINARY = ""
> +UBOOT_BINARY = "u-boot-spl.${UBOOT_SUFFIX}"
> +UBOOT_IMAGE = "u-boot-r5spl-gp-${MAINMACHINE}-${PV}-${PR}.${UBOOT_SUFFIX}"
> +UBOOT_SYMLINK = "u-boot-r5spl-gp.${UBOOT_SUFFIX}"
> diff --git a/conf/machine/j784s4-evm-k3r5-sr1-hs-fs.conf b/conf/machine/j784s4-evm-k3r5-sr1-hs-fs.conf
> new file mode 100644
> index 00000000..8c77c910
> --- /dev/null
> +++ b/conf/machine/j784s4-evm-k3r5-sr1-hs-fs.conf
> @@ -0,0 +1,15 @@
> +#@TYPE: Machine
> +#@NAME: J784S4 HS-FS EVM (R5F)
> +#@DESCRIPTION: Machine configuration for the TI J784S4 HS-FS EVM (R5F core)
> +
> +# Booting HS-FS requires different SYSFW, the rest is handled at runtime
> +
> +require conf/machine/include/k3r5.inc
> +SOC_FAMILY_append = ":k3r5-sr1-hs-fs"
> +
> +SYSFW_SOC = "j784s4"
> +SYSFW_CONFIG = "evm"
> +SYSFW_SUFFIX = "hs-fs"
> +SYSFW_TIBOOT3_SYMLINK = ""

You do need it here....

> +
> +UBOOT_MACHINE = "j784s4_evm_r5_defconfig"
> diff --git a/conf/machine/j784s4-evm-k3r5.conf b/conf/machine/j784s4-evm-k3r5.conf
> index 04feebc6..3f010797 100644
> --- a/conf/machine/j784s4-evm-k3r5.conf
> +++ b/conf/machine/j784s4-evm-k3r5.conf
> @@ -7,5 +7,6 @@ require conf/machine/include/k3r5.inc
>   SYSFW_SOC = "j784s4"
>   SYSFW_CONFIG = "evm"
>   SYSFW_SUFFIX = "gp"
> +SYSFW_SYMLINK = ""

You do not need it here...


>   UBOOT_MACHINE = "j784s4_evm_r5_defconfig"
> diff --git a/conf/machine/j784s4-evm.conf b/conf/machine/j784s4-evm.conf
> index e892f597..c4548520 100644
> --- a/conf/machine/j784s4-evm.conf
> +++ b/conf/machine/j784s4-evm.conf
> @@ -39,8 +39,15 @@ KERNEL_DEVICETREE = " \
>   
>   UBOOT_MACHINE = "j784s4_evm_a72_defconfig"
>   
> -do_image_wic[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
> -do_image_tar[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
> +# Default tiboot3.bin on J784S4 is for GP
> +BBMULTICONFIG = "k3r5-gp"
> +do_image_wic[mcdepends] = "mc::k3r5-gp:ti-sci-fw:do_deploy"
> +do_image_tar[mcdepends] = "mc::k3r5-gp:ti-sci-fw:do_deploy"
>   
> -TFA_BOARD = "j784s4"
> +# Since default tiboot3.bin on J784S4 is for GP, add a version for SR1.0 HS-FS
> +BBMULTICONFIG += "k3r5-sr1-hs-fs"
> +IMAGE_BOOT_FILES += " tiboot3-j784s4-hs-fs-evm.bin"
> +do_image_wic[mcdepends] += "mc::k3r5-sr1-hs-fs:ti-sci-fw:do_deploy"
> +do_image_tar[mcdepends] += "mc::k3r5-sr1-hs-fs:ti-sci-fw:do_deploy"
>   
> +TFA_BOARD = "j784s4"
> diff --git a/conf/machine/j784s4-hs-evm-k3r5.conf b/conf/machine/j784s4-hs-evm-k3r5.conf
> index 80a228a0..0f5e69e4 100644
> --- a/conf/machine/j784s4-hs-evm-k3r5.conf
> +++ b/conf/machine/j784s4-hs-evm-k3r5.conf
> @@ -7,5 +7,6 @@ require conf/machine/include/k3r5.inc
>   SYSFW_SOC = "j784s4"
>   SYSFW_CONFIG = "evm"
>   SYSFW_SUFFIX = "hs"
> +SYSFW_SYMLINK = ""

You do not need it here either.


>   UBOOT_MACHINE = "j784s4_evm_r5_defconfig"
> diff --git a/conf/machine/j784s4-hs-evm.conf b/conf/machine/j784s4-hs-evm.conf
> index 62357d62..91ef3d6f 100644
> --- a/conf/machine/j784s4-hs-evm.conf
> +++ b/conf/machine/j784s4-hs-evm.conf
> @@ -2,10 +2,27 @@
>   #@NAME: J784S4 HS EVM
>   #@DESCRIPTION: Machine configuration for the TI J784S4 HS EVM
>   
> -require conf/machine/j784s4-evm.conf
> +require conf/machine/include/j7.inc
> +
> +MACHINE_FEATURES += "gpu"
> +
> +SERIAL_CONSOLES = "115200;ttyS2"
> +SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
> +TFA_K3_USART = "0x8"
> +OPTEEMACHINE = "k3-j784s4"
> +OPTEE_K3_USART = "0x8"
> +
> +KERNEL_DEVICETREE = " \
> +    ti/k3-j784s4-evm.dtb \
> +"
>   
>   UBOOT_MACHINE = "j784s4_evm_a72_defconfig"
>   
> +do_image_wic[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
> +do_image_tar[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
> +
> +TFA_BOARD = "j784s4"
> +
>   SPL_BINARY = "tispl.bin_HS"
>   UBOOT_BINARY = "u-boot.img_HS"
>   UBOOT_SYMLINK = "u-boot.img"
> diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> index c5fff3f7..cafb24e6 100644
> --- a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> +++ b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> @@ -36,7 +36,8 @@ SYSFW_PREFIX_j7200-hs-evm-k3r5 = "fs"
>   SYSFW_PREFIX_j721s2-evm-k3r5-gp = "fs"
>   SYSFW_PREFIX_j721s2-evm-k3r5-sr1-hs-fs = "fs"
>   SYSFW_PREFIX_j721s2-hs-evm-k3r5 = "fs"
> -SYSFW_PREFIX_j784s4-evm-k3r5 = "fs"
> +SYSFW_PREFIX_j784s4-evm-k3r5-gp = "fs"
> +SYSFW_PREFIX_j784s4-evm-k3r5-sr1-hs-fs = "fs"
>   SYSFW_PREFIX_j784s4-hs-evm-k3r5 = "fs"
>   SYSFW_PREFIX_am62xx-evm-k3r5-gp = "fs"
>   SYSFW_PREFIX_am62xx-evm-k3r5-hs-se = "fs"

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

