Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.4109.1637253505230174729
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 18 Nov 2021 08:38:25 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B3F0240C3A;
	Thu, 18 Nov 2021 16:38:23 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qSw9TaN3U622; Thu, 18 Nov 2021 16:38:23 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 8371B40BA8;
	Thu, 18 Nov 2021 16:38:20 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id DDB831746CE; Thu, 18 Nov 2021 11:38:19 -0500 (EST)
Date: Thu, 18 Nov 2021 11:38:19 -0500
From: "Denys Dmytriyenko" <denis@denix.org>
To: yogeshs@ti.com
Cc: Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][dunfell][PATCH] j721e-sr1_1: Add j721e sr1.1 HS support
Message-ID: <20211118163819.GB18191@denix.org>
References: <20211117114611.47729-1-yogeshs@ti.com>
MIME-Version: 1.0
In-Reply-To: <20211117114611.47729-1-yogeshs@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 17, 2021 at 11:46:11AM +0000, Yogesh Siraswar via lists.yoctoproject.org wrote:
> This patch adds support for J721e HS SR1.1
> HS SR1.1 requires updated sysfw binary. Both SR1.0 and SR1.1 sysfw
> binary will be generated. sysfw.itb will point to SR1.1
> 
> This patch requires J7 SR 1.1 support in K3 Image gen.
> 
> Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
> ---
>  conf/machine/j7-hs-evm-k3r5-sr1-1.conf | 11 +++++++++++
>  conf/machine/j7-hs-evm.conf            |  8 ++++++++
>  conf/multiconfig/k3r5-sr1-1.conf       |  3 +++
>  recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb |  1 +
>  4 files changed, 23 insertions(+)
>  create mode 100644 conf/machine/j7-hs-evm-k3r5-sr1-1.conf
>  create mode 100644 conf/multiconfig/k3r5-sr1-1.conf
> 
> diff --git a/conf/machine/j7-hs-evm-k3r5-sr1-1.conf b/conf/machine/j7-hs-evm-k3r5-sr1-1.conf
> new file mode 100644
> index 00000000..e05b5c9d
> --- /dev/null
> +++ b/conf/machine/j7-hs-evm-k3r5-sr1-1.conf
> @@ -0,0 +1,11 @@
> +#@TYPE: Machine
> +#@NAME: J7 SR1.1 HS EVM (R5F)
> +#@DESCRIPTION: Machine configuration for the TI J7 SR1.1 HS EVM (R5F core)
> +
> +# Booting SR1.1 requires different SYSFW, the rest is handled at runtime
> +
> +require conf/machine/am65xx-hs-evm-k3r5.conf

Copy/paste error here ^ - it's j7 not am65xx


> +SOC_FAMILY_append = ":k3r5-sr1-1"
> +
> +SYSFW_SOC = "j721e_sr1_1"
> +SYSFW_SYMLINK = "sysfw.itb"
> diff --git a/conf/machine/j7-hs-evm.conf b/conf/machine/j7-hs-evm.conf
> index 70e14754..ab0fa474 100644
> --- a/conf/machine/j7-hs-evm.conf
> +++ b/conf/machine/j7-hs-evm.conf
> @@ -19,4 +19,12 @@ SPL_BINARYNAME = "tispl.bin"
>  UBOOT_BINARY = "u-boot.img_HS"
>  IMAGE_BOOT_FILES = "${UBOOT_BINARY}"
>  
> +BBMULTICONFIG += "k3r5-sr1-1"
> +
> +# Use default IMAGE_BOOT_FILES_LEGACY files
> +# Since default sysfw.itb on J7 is for SR1.1, add a version for SR1.0
> +IMAGE_BOOT_FILES += "sysfw-j7-hs-evm.itb"
> +do_image_wic[mcdepends] += "mc::k3r5-sr1-1:ti-sci-fw:do_deploy"
> +do_image_tar[mcdepends] += "mc::k3r5-sr1-1:ti-sci-fw:do_deploy"
> +
>  TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_K3}"
> diff --git a/conf/multiconfig/k3r5-sr1-1.conf b/conf/multiconfig/k3r5-sr1-1.conf
> new file mode 100644
> index 00000000..2dc93b2f
> --- /dev/null
> +++ b/conf/multiconfig/k3r5-sr1-1.conf
> @@ -0,0 +1,3 @@
> +require k3r5.conf
> +
> +MACHINE_append = "-sr1-1"
> diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> index 4f1dd145..6d48bf23 100644
> --- a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> +++ b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> @@ -25,6 +25,7 @@ SYSFW_PREFIX = "ti-sci-firmware"
>  SYSFW_PREFIX_j7-evm-k3r5 = "ti-fs-firmware"
>  SYSFW_PREFIX_j7200-evm-k3r5 = "ti-fs-firmware"
>  SYSFW_PREFIX_j7-hs-evm-k3r5 = "ti-fs-firmware"
> +SYSFW_PREFIX_j7-hs-evm-k3r5-sr1-1 = "ti-fs-firmware"
>  SYSFW_PREFIX_j7200-hs-evm-k3r5 = "ti-fs-firmware"
>  
>  SYSFW_SUFFIX ?= "unknown"
> -- 
> 2.17.1
> 

> 
> 
> 


-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
