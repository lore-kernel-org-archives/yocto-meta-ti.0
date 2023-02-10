Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C77CC05027
	for <webhook@archiver.kernel.org>; Fri, 10 Feb 2023 20:23:45 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.5130.1676060621353607397
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 10 Feb 2023 12:23:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=I0EnE7fy;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 31AKNdrS098975;
	Fri, 10 Feb 2023 14:23:39 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1676060619;
	bh=/Noj920MWSVzwLiCyDi0NVOMZNQPvStjzmpqRfSJoQc=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=I0EnE7fy/Zd8KqcFctniBunqLLE0pr7yaMeGm47o+9Xf5EZapPOq8bpNcs5dXakyM
	 Qd/R6sQmSP6/QXmT99nRagj4u4NcF6FZ57nx0u0uR4FTbVf5i3B55mJDaAEutBlt61
	 szK669wYqUe/+lGxxbOrNVqGdt3SzV0PeKR/0YeE=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 31AKNdv5054171
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 10 Feb 2023 14:23:39 -0600
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Fri, 10
 Feb 2023 14:23:39 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Fri, 10 Feb 2023 14:23:39 -0600
Received: from [10.249.38.163] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 31AKNd6S073016;
	Fri, 10 Feb 2023 14:23:39 -0600
Message-ID: <976cd56a-968b-dcc5-a50f-873b32d4239f@ti.com>
Date: Fri, 10 Feb 2023 14:23:39 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [meta-ti][dunfell][PATCH V2] conf: machine: j721s2-evm: Add
 support for J721S2 HS-FS
Content-Language: en-US
To: Sinthu Raja <sinthu.raja@mistralsolutions.com>, <denys@ti.com>,
        <detheridge@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, Sinthu Raja <sinthu.raja@ti.com>,
        Aniket
 Limaye <a-limaye@ti.com>
References: <20230210152641.14513-1-sinthu.raja@ti.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20230210152641.14513-1-sinthu.raja@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 10 Feb 2023 20:23:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15803



On 2/10/2023 9:26, Sinthu Raja wrote:
> From: Sinthu Raja <sinthu.raja@ti.com>
> 
> Add the basic J721S2 HS-FS configuration.
>      - Add configurations to support both HS-FS and GP and keep GP
>        as the default.
>      - Add ti-sci-firmware overrides for HS-FS.
> 
> Signed-off-by: Aniket Limaye <a-limaye@ti.com>
> Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>

This patch does not even build.  Both j721s2-evm and j721s2-hs-evm are 
broken.

What the reasoning for trying to get this into dunfell given that the 
transition to kirkstone is right around the corner and the plan is to 
redo all of HS stuff for all platforms at that time?



> ---
> 
> Changes in V2:
> =============
> Address review comment:
> - Keep GP as the default.
> 
> V1: https://lists.yoctoproject.org/g/meta-ti/message/15771
> 
>   conf/machine/j721s2-evm-k3r5-gp.conf        | 20 ++++++++++++++++++++
>   conf/machine/j721s2-evm-k3r5-sr1-hs-fs.conf | 15 +++++++++++++++
>   conf/machine/j721s2-evm.conf                | 12 ++++++++++--
>   conf/multiconfig/k3r5-sr1-hs-fs.conf        |  3 +++
>   conf/multiconfig/k3r5-sr1.conf              |  3 +++
>   recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb      |  3 ++-
>   6 files changed, 53 insertions(+), 3 deletions(-)
>   create mode 100644 conf/machine/j721s2-evm-k3r5-gp.conf
>   create mode 100644 conf/machine/j721s2-evm-k3r5-sr1-hs-fs.conf
>   create mode 100644 conf/multiconfig/k3r5-sr1-hs-fs.conf
>   create mode 100644 conf/multiconfig/k3r5-sr1.conf
> 
> diff --git a/conf/machine/j721s2-evm-k3r5-gp.conf b/conf/machine/j721s2-evm-k3r5-gp.conf
> new file mode 100644
> index 00000000..51362b85
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
> +SYSFW_TIBOOT3_SYMLINK = ""
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

