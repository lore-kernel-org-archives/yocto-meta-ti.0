Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 415FBC636D4
	for <webhook@archiver.kernel.org>; Tue, 14 Feb 2023 00:13:21 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.32098.1676333599332280339
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 13 Feb 2023 16:13:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=PYbBP9KU;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 31E0DHxt083439;
	Mon, 13 Feb 2023 18:13:17 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1676333597;
	bh=+2ewhXpR066QY66TN9ukJew0G8PSVm4kpMHGWYmX8yY=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=PYbBP9KUMv7ULgQTlY/cweI76P9KiTRNmqJv3/O4V8OPhwPf7jp3JIfYOODScU0y7
	 CyfwfT8l4KRBG57KoDQEMJbJaLyQrMgkoWFoozpZMpELogfs5MKJdhnZvRaQL+LvIc
	 jHdfRrmJauUiyMbxZAzSqoveOi6G513GSnX6An+M=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 31E0DH6g040126
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 13 Feb 2023 18:13:17 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Mon, 13
 Feb 2023 18:13:17 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Mon, 13 Feb 2023 18:13:17 -0600
Received: from [10.249.38.163] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 31E0DHEs076865;
	Mon, 13 Feb 2023 18:13:17 -0600
Message-ID: <06f942e1-8f2c-8253-ffb6-a9d69db69724@ti.com>
Date: Mon, 13 Feb 2023 18:13:17 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [dunfell,RFC] conf: machine: j784s4-evm: Add support for J784S4
 HS-FS
Content-Language: en-US
To: <sabiya.d@mistralsolutions.com>, <denys@ti.com>, <detheridge@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, Dasnavis Sabiya <sabiya.d@ti.com>
References: <20230213160344.174110-1-sabiya.d@ti.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20230213160344.174110-1-sabiya.d@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 14 Feb 2023 00:13:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15830


First, you need to create the multiconfig files that you are referencing 
in the files:

conf/multiconfig/k3r5-sr1.conf
conf/multiconfig/k3r5-sr1-hs-fs.conf

Just copy what the sr2 files are doing and change the sr2 to sr1.


More comments inline....


On 2/13/2023 10:03, sabiya.d@mistralsolutions.com wrote:
> From: Dasnavis Sabiya <sabiya.d@ti.com>
> 
> Add the basic J784S4 HS-FS configuration.
> * Add configurations to support both HS-FS and GP and keep GP as default.
> * Add ti-sci-firmware overrides for HS-FS.
> 
> Signed-off-by: Dasnavis Sabiya <sabiya.d@ti.com>
> ---
>   conf/machine/j784s4-evm-k3r5-gp.conf        | 20 ++++++++++++++++++++
>   conf/machine/j784s4-evm-k3r5-sr1-hs-fs.conf | 15 +++++++++++++++
>   conf/machine/j784s4-evm.conf                | 13 ++++++++++---
>   recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb      |  3 ++-
>   4 files changed, 47 insertions(+), 4 deletions(-)
>   create mode 100644 conf/machine/j784s4-evm-k3r5-gp.conf
>   create mode 100644 conf/machine/j784s4-evm-k3r5-sr1-hs-fs.conf
> 
> diff --git a/conf/machine/j784s4-evm-k3r5-gp.conf b/conf/machine/j784s4-evm-k3r5-gp.conf
> new file mode 100644
> index 00000000..5fd47b70
> --- /dev/null
> +++ b/conf/machine/j784s4-evm-k3r5-gp.conf
> @@ -0,0 +1,20 @@
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

There are build errors with this patch.  k3-image-gen is configured to 
build sysfw for j784s4 so you need to configure the variables to not 
deploy the same files for all multiconfigs.  We do this by setting the 
following variable:

    SYSFW_SYMLINK = ""


> +
> +UBOOT_MACHINE = "j784s4_evm_r5_defconfig"
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
> diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> index cb197954..1bc8fab7 100644
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

