Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC54AC54E94
	for <webhook@archiver.kernel.org>; Wed, 25 Jan 2023 16:14:17 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.49217.1674663249579709074
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 25 Jan 2023 08:14:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=gxCChXeX;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: afd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 30PGE8EO104861;
	Wed, 25 Jan 2023 10:14:08 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1674663248;
	bh=YAGnDxrDk/2KChK4o4mGHlS2vhhB8e7T/N6u4MMJFho=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=gxCChXeXKIXb3SJSMG+eZpInU/qocj1mp5I+jecNhbCac/qeGDr5q4//I4UWrnpCP
	 dpJIRgaPEgSV5YP3mCIjMRfEybtlon37UUr0QIfHSkTmysxYvsXhSO+c0UzMWWOkp4
	 BAl7Up3GvGqnCCbdIovjD61dUpVCcUUu9L7q7iVc=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 30PGE8rJ044388
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 25 Jan 2023 10:14:08 -0600
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 25
 Jan 2023 10:14:08 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 25 Jan 2023 10:14:08 -0600
Received: from [10.250.32.60] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 30PGE7xE104806;
	Wed, 25 Jan 2023 10:14:08 -0600
Message-ID: <435688f1-4bb0-34b2-e1c5-fcd2e5654faf@ti.com>
Date: Wed, 25 Jan 2023 10:14:07 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [meta-ti][master/dunfell][RFC PATCH] conf: machine: j721s2-evm:
 Add support for J721S2 HS-FS
Content-Language: en-US
To: <sinthu.raja@mistralsolutions.com>, <reatmon@ti.com>, <denys@ti.com>,
        <detheridge@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, Sinthu Raja <sinthu.raja@ti.com>,
        Aniket
 Limaye <a-limaye@ti.com>
References: <20230125133754.692-1-sinthu.raja@ti.com>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20230125133754.692-1-sinthu.raja@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 25 Jan 2023 16:14:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15652

On 1/25/23 7:37 AM, Sinthu Raja M via lists.yoctoproject.org wrote:
> From: Sinthu Raja <sinthu.raja@ti.com>
> 
> Add the basic J721S2 HS-FS configuration.
>      - Add configurations to support both HS-FS and GP.
>      - Add ti-sci-firmware overrides.
> 
> Signed-off-by: Aniket Limaye <a-limaye@ti.com>
> Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
> ---
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
> index 1ed693c5..bf1c82a1 100644
> --- a/conf/machine/j721s2-evm.conf
> +++ b/conf/machine/j721s2-evm.conf
> @@ -25,3 +25,15 @@ UBOOT_MACHINE = "j721s2_evm_a72_defconfig"
>   
>   do_image_wic[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
>   do_image_tar[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
> +
> +# Since default tiboot3.bin on AM64x is for SR2.0 HS-FS, add a version for GP

This comment and the one below are not right, SoC name, version, and HS types
are all wrong.

> +BBMULTICONFIG = "k3r5-sr1-hs-fs"
> +IMAGE_BOOT_FILES += " tiboot3-j721s2-hs-fs-evm.bin"
> +do_image_wic[mcdepends] = "mc::k3r5-sr1-hs-fs:ti-sci-fw:do_deploy"
> +do_image_tar[mcdepends] = "mc::k3r5-sr1-hs-fs:ti-sci-fw:do_deploy"
> +
> +# Since default tiboot3.bin on AM64x is for SR2.0 HS-FS, add a version for GP
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

Why "-sr1", do you expect an SR2 anytime soon?

Andrew

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
> index 0fb3a832..39e5907f 100644
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
> View/Reply Online (#15651): https://lists.yoctoproject.org/g/meta-ti/message/15651
> Mute This Topic: https://lists.yoctoproject.org/mt/96519981/3619733
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [afd@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

