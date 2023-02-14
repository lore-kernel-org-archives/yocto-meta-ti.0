Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25AE8C61DA4
	for <webhook@archiver.kernel.org>; Tue, 14 Feb 2023 15:20:45 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.9672.1676388042187680773
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 14 Feb 2023 07:20:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=iBG6fvyn;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 31EFKfIX108437;
	Tue, 14 Feb 2023 09:20:41 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1676388041;
	bh=Z5v10NffEHdtaArtEJNy7d0R/arBB2dDzB+xpxCGwdU=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=iBG6fvynInmYEP6i49yHqJmzdRTYVxCz12jHZYnIVvQC82/l6Z344XhgYr1X1K6QL
	 5K1oHZm1n+gr2wDgyhI9MAYAzyCD6XQeUlKS/vs2fTSijLUKHmJUCxx6aNxCCGEuwV
	 9WYrYeVnj6zr5AahYH09HjzDdvCR2jbMRQYSyRjs=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 31EFKfed014485
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 14 Feb 2023 09:20:41 -0600
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 14
 Feb 2023 09:20:41 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Tue, 14 Feb 2023 09:20:41 -0600
Received: from [10.249.38.163] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 31EFKed3106761;
	Tue, 14 Feb 2023 09:20:41 -0600
Message-ID: <fd8350b7-ef60-f17b-283e-99e1901d8d04@ti.com>
Date: Tue, 14 Feb 2023 09:20:40 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [meta-ti][dunfell][PATCH V4] conf: machine: j721s2-evm: Add
 support for J721S2 HS-FS
Content-Language: en-US
To: Sinthu Raja <sinthu.raja@mistralsolutions.com>, <denys@ti.com>,
        <detheridge@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, Sinthu Raja <sinthu.raja@ti.com>,
        Aniket
 Limaye <a-limaye@ti.com>
References: <20230214105642.16320-1-sinthu.raja@ti.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20230214105642.16320-1-sinthu.raja@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 14 Feb 2023 15:20:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15839


Initial builds for both j721s2-evm and j721s2-hs-evm look good.  Thank 
you for being patient and getting this working.


On 2/14/2023 4:56, Sinthu Raja wrote:
> From: Sinthu Raja <sinthu.raja@ti.com>
> 
> Add the basic J721S2 HS-FS configuration.
>      - Add configurations to support both HS-FS and GP keeping GP
>        as default.
>      - Add ti-sci-firmware overrides for HS-FS.
>      - Remove evm conf file inclusion in hs-evm conf.
>      - Add j721s2 hs-evm specific config to hs-evm conf.
> 
> Signed-off-by: Aniket Limaye <a-limaye@ti.com>
> Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
> ---
> 
> Change in V4:
> ============
> - Remove evm conf file inclusion in hs-evm conf.
> - Add j721s2 hs-evm specific config to hs-evm conf.
> 
> Change in V3:
> ============
> Fix build issue.
> 
> Changes in V2:
> =============
> Address review comment:
> - Keep GP as the default.
> 
> V1: https://lists.yoctoproject.org/g/meta-ti/message/15771
> V2: https://lists.yoctoproject.org/g/meta-ti/message/15793
> V3: https://lists.yoctoproject.org/g/meta-ti/message/15818
> 
>   conf/machine/j721s2-evm-k3r5-gp.conf        | 20 ++++++++++++++++++++
>   conf/machine/j721s2-evm-k3r5-sr1-hs-fs.conf | 15 +++++++++++++++
>   conf/machine/j721s2-evm.conf                | 12 ++++++++++--
>   conf/machine/j721s2-hs-evm.conf             | 18 +++++++++++++++++-
>   conf/multiconfig/k3r5-sr1-hs-fs.conf        |  3 +++
>   conf/multiconfig/k3r5-sr1.conf              |  3 +++
>   recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb      |  3 ++-
>   7 files changed, 70 insertions(+), 4 deletions(-)
>   create mode 100644 conf/machine/j721s2-evm-k3r5-gp.conf
>   create mode 100644 conf/machine/j721s2-evm-k3r5-sr1-hs-fs.conf
>   create mode 100644 conf/multiconfig/k3r5-sr1-hs-fs.conf
>   create mode 100644 conf/multiconfig/k3r5-sr1.conf
> 
> diff --git a/conf/machine/j721s2-evm-k3r5-gp.conf b/conf/machine/j721s2-evm-k3r5-gp.conf
> new file mode 100644
> index 00000000..06456ef7
> --- /dev/null
> +++ b/conf/machine/j721s2-evm-k3r5-gp.conf
> @@ -0,0 +1,20 @@
> +#@TYPE: Machine
> +#@NAME: J721S2 GP EVM (R5F)
> +#@DESCRIPTION: Machine configuration for the TI J721S2 GP EVM (R5F core)
> +
> +# Booting GP requires different SYSFW, the rest is handled at runtime
> +
> +require conf/machine/include/k3r5.inc
> +SOC_FAMILY_append = ":k3r5-gp"
> +
> +SYSFW_SOC = "j721s2"
> +SYSFW_CONFIG = "evm"
> +SYSFW_SUFFIX = "gp"
> +SYSFW_TIBOOT3_SYMLINK = "tiboot3.bin"
> +
> +UBOOT_MACHINE = "j721s2_evm_r5_defconfig"
> +
> +SPL_BINARY = ""
> +UBOOT_BINARY = "u-boot-spl.${UBOOT_SUFFIX}"
> +UBOOT_IMAGE = "u-boot-r5spl-gp-${MAINMACHINE}-${PV}-${PR}.${UBOOT_SUFFIX}"
> +UBOOT_SYMLINK = "u-boot-r5spl-gp.${UBOOT_SUFFIX}"
> diff --git a/conf/machine/j721s2-evm-k3r5-sr1-hs-fs.conf b/conf/machine/j721s2-evm-k3r5-sr1-hs-fs.conf
> new file mode 100644
> index 00000000..786338a9
> --- /dev/null
> +++ b/conf/machine/j721s2-evm-k3r5-sr1-hs-fs.conf
> @@ -0,0 +1,15 @@
> +#@TYPE: Machine
> +#@NAME: J721S2 HS-FS EVM (R5F)
> +#@DESCRIPTION: Machine configuration for the TI J721S2 HS-FS EVM (R5F core)
> +
> +# Booting HS-FS requires different SYSFW, the rest is handled at runtime
> +
> +require conf/machine/include/k3r5.inc
> +SOC_FAMILY_append = ":k3r5-sr1-hs-fs"
> +
> +SYSFW_SOC = "j721s2"
> +SYSFW_CONFIG = "evm"
> +SYSFW_SUFFIX = "hs-fs"
> +SYSFW_TIBOOT3_SYMLINK = ""
> +
> +UBOOT_MACHINE = "j721s2_evm_r5_defconfig"
> diff --git a/conf/machine/j721s2-evm.conf b/conf/machine/j721s2-evm.conf
> index 7c120dcc..7d2597b5 100644
> --- a/conf/machine/j721s2-evm.conf
> +++ b/conf/machine/j721s2-evm.conf
> @@ -40,5 +40,13 @@ KERNEL_DEVICETREE = " \
>   
>   UBOOT_MACHINE = "j721s2_evm_a72_defconfig"
>   
> -do_image_wic[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
> -do_image_tar[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
> +# Default tiboot3.bin on J721S2 is for GP
> +BBMULTICONFIG = "k3r5-gp"
> +do_image_wic[mcdepends] = "mc::k3r5-gp:ti-sci-fw:do_deploy"
> +do_image_tar[mcdepends] = "mc::k3r5-gp:ti-sci-fw:do_deploy"
> +
> +# Since default tiboot3.bin on J721S2 is for GP, add a version for SR1.0 HS-FS
> +BBMULTICONFIG += "k3r5-sr1-hs-fs"
> +IMAGE_BOOT_FILES += " tiboot3-j721s2-hs-fs-evm.bin"
> +do_image_wic[mcdepends] += "mc::k3r5-sr1-hs-fs:ti-sci-fw:do_deploy"
> +do_image_tar[mcdepends] += "mc::k3r5-sr1-hs-fs:ti-sci-fw:do_deploy"
> diff --git a/conf/machine/j721s2-hs-evm.conf b/conf/machine/j721s2-hs-evm.conf
> index 3d737f44..2895787b 100644
> --- a/conf/machine/j721s2-hs-evm.conf
> +++ b/conf/machine/j721s2-hs-evm.conf
> @@ -2,10 +2,26 @@
>   #@NAME: J721S2 HS EVM
>   #@DESCRIPTION: Machine configuration for the TI J721S2 HS EVM
>   
> -require conf/machine/j721s2-evm.conf
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
> +    ti/k3-j721s2-common-proc-board.dtb \
> +    ti/k3-j721s2-gesi-exp-board.dtbo \
> +"
>   
>   UBOOT_MACHINE = "j721s2_hs_evm_a72_defconfig"
>   
> +do_image_wic[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
> +do_image_tar[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
> +
>   SPL_BINARY = "tispl.bin_HS"
>   UBOOT_BINARY = "u-boot.img_HS"
>   UBOOT_SYMLINK = "u-boot.img"
> diff --git a/conf/multiconfig/k3r5-sr1-hs-fs.conf b/conf/multiconfig/k3r5-sr1-hs-fs.conf
> new file mode 100644
> index 00000000..2fa28c95
> --- /dev/null
> +++ b/conf/multiconfig/k3r5-sr1-hs-fs.conf
> @@ -0,0 +1,3 @@
> +require k3r5-sr1.conf
> +
> +MACHINE_append = "-hs-fs"
> diff --git a/conf/multiconfig/k3r5-sr1.conf b/conf/multiconfig/k3r5-sr1.conf
> new file mode 100644
> index 00000000..2b87de8a
> --- /dev/null
> +++ b/conf/multiconfig/k3r5-sr1.conf
> @@ -0,0 +1,3 @@
> +require k3r5.conf
> +
> +MACHINE_append = "-sr1"
> diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> index 7896c366..cb197954 100644
> --- a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> +++ b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> @@ -33,7 +33,8 @@ SYSFW_PREFIX_j7-hs-evm-k3r5 = "fs"
>   SYSFW_PREFIX_j7-hs-evm-k3r5-sr1-1 = "fs"
>   SYSFW_PREFIX_j7200-evm-k3r5 = "fs"
>   SYSFW_PREFIX_j7200-hs-evm-k3r5 = "fs"
> -SYSFW_PREFIX_j721s2-evm-k3r5 = "fs"
> +SYSFW_PREFIX_j721s2-evm-k3r5-gp = "fs"
> +SYSFW_PREFIX_j721s2-evm-k3r5-sr1-hs-fs = "fs"
>   SYSFW_PREFIX_j721s2-hs-evm-k3r5 = "fs"
>   SYSFW_PREFIX_j784s4-evm-k3r5 = "fs"
>   SYSFW_PREFIX_j784s4-hs-evm-k3r5 = "fs"

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

