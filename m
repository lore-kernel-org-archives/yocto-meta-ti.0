Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DEA1C61DA4
	for <webhook@archiver.kernel.org>; Thu,  9 Feb 2023 17:53:19 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.23497.1675965191417314804
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 09 Feb 2023 09:53:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=n0vUmwAa;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: afd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 319HrAxn032509;
	Thu, 9 Feb 2023 11:53:10 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1675965190;
	bh=BVOGrdQdAMScdAfP9fG45CkD/xcJLOH+2ZKZWMwEDZ0=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=n0vUmwAa5D/e+5AOuZZiRoFknEWTvZ3lYRmPVFQg/dTfV73PLo5r3QNOxV8boPX9G
	 Tj1FvCYgZWhf8BehJT4kGlKHkedYB7IpUv4LodCXC3P2TCdGtCBdJBANwakuO39/3W
	 LX/3txpHpcacZxMI52oZ3m/8GxUp9d8oJsY8LTBo=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 319HrAIp073405
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 9 Feb 2023 11:53:10 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Thu, 9
 Feb 2023 11:53:10 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Thu, 9 Feb 2023 11:53:10 -0600
Received: from [10.250.32.173] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 319Hr9gb016962;
	Thu, 9 Feb 2023 11:53:09 -0600
Message-ID: <2fdd8e8f-421f-380f-157a-fc6b0f66a1cc@ti.com>
Date: Thu, 9 Feb 2023 11:53:09 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [meta-ti][dunfell][PATCH] conf: machine: j721s2-evm: Add support
 for J721S2 HS-FS
Content-Language: en-US
To: <sinthu.raja@mistralsolutions.com>, <reatmon@ti.com>, <denys@ti.com>,
        <detheridge@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, Sinthu Raja <sinthu.raja@ti.com>,
        Aniket
 Limaye <a-limaye@ti.com>
References: <20230209151933.4735-1-sinthu.raja@ti.com>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20230209151933.4735-1-sinthu.raja@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 09 Feb 2023 17:53:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15773

On 2/9/23 9:19 AM, Sinthu Raja M via lists.yoctoproject.org wrote:
> From: Sinthu Raja <sinthu.raja@ti.com>
> 
> Add the basic J721S2 HS-FS configuration.
>      - Add configurations to support both HS-FS and GP.
>      - Add ti-sci-firmware overrides for HS-FS.

I see HS-FS was made the default here. I'm all for this change, but for
Dunfell we are already established with GP as the default in j721s2-evm.conf.
Documentation, test farm, and SDK deployment all expect it. Unless there
was some alignment for dropping "GP as default" for J721s2 that I'm not aware
of we will need to keep GP default for now.

I'd suggest making a new j721s2-hs-fs-evm.conf, or leaving the default GP
and having HS-FS be the selectable option in this file.

For Kirkstone, we should go HS-FS by default and also add HS-SE as
an option to this one conf (j721s2-evm.conf) along with GP. That way we
can also remove j721s2-hs-evm.conf and have one config for all types.

See AM64x for an example of 3 types in one when you make this change
on kirkstone/master branches.

Andrew

> 
> Signed-off-by: Aniket Limaye <a-limaye@ti.com>
> Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
> ---
> 
> Hi,
> This patch is validated locally by Aniket.
> 
> RFC Link: https://lists.yoctoproject.org/g/meta-ti/message/15651
> 
>   conf/machine/j721s2-evm-k3r5-gp.conf        | 20 ++++++++++++++++++++
>   conf/machine/j721s2-evm-k3r5-sr1-hs-fs.conf | 15 +++++++++++++++
>   conf/machine/j721s2-evm.conf                | 12 ++++++++++++
>   conf/multiconfig/k3r5-sr1-hs-fs.conf        |  3 +++
>   conf/multiconfig/k3r5-sr1.conf              |  3 +++
>   recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb      |  3 ++-
>   6 files changed, 55 insertions(+), 1 deletion(-)
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
> index 7c120dcc..9cec9631 100644
> --- a/conf/machine/j721s2-evm.conf
> +++ b/conf/machine/j721s2-evm.conf
> @@ -42,3 +42,15 @@ UBOOT_MACHINE = "j721s2_evm_a72_defconfig"
>   
>   do_image_wic[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
>   do_image_tar[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
> +
> +# Default tiboot3.bin on J721S2 is for SR1.0 HS-FS
> +BBMULTICONFIG = "k3r5-sr1-hs-fs"
> +IMAGE_BOOT_FILES += " tiboot3-j721s2-hs-fs-evm.bin"
> +do_image_wic[mcdepends] = "mc::k3r5-sr1-hs-fs:ti-sci-fw:do_deploy"
> +do_image_tar[mcdepends] = "mc::k3r5-sr1-hs-fs:ti-sci-fw:do_deploy"
> +
> +# Since default tiboot3.bin on J721S2 is for SR1.0 HS-FS, add a version for GP
> +BBMULTICONFIG += "k3r5-gp"
> +IMAGE_BOOT_FILES += " tiboot3-j721s2-gp-evm.bin"
> +do_image_wic[mcdepends] += "mc::k3r5-gp:ti-sci-fw:do_deploy"
> +do_image_tar[mcdepends] += "mc::k3r5-gp:ti-sci-fw:do_deploy"
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
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#15771): https://lists.yoctoproject.org/g/meta-ti/message/15771
> Mute This Topic: https://lists.yoctoproject.org/mt/96854989/3619733
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [afd@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

