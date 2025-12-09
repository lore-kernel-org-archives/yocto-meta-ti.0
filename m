Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7567ED3B9AF
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 23:48:18 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2075.1765324093153504823
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 09 Dec 2025 15:48:14 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 3413D40C50;
	Tue,  9 Dec 2025 23:48:12 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l5A2P4v1FLug; Tue,  9 Dec 2025 23:48:12 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 02EF7406B5;
	Tue,  9 Dec 2025 23:48:09 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 0ED2E1704B2; Tue,  9 Dec 2025 18:48:09 -0500 (EST)
Date: Tue, 9 Dec 2025 18:48:08 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: afd@ti.com
Cc: Ryan Eatmon <reatmon@ti.com>, meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master][PATCH 1/4] conf: machine: Remove remaining
 K3 HS machines
Message-ID: <20251209234808.GJ11121@denix.org>
References: <20251202223210.3816583-1-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251202223210.3816583-1-afd@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 09 Dec 2025 23:48:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19338

On Tue, Dec 02, 2025 at 04:32:07PM -0600, Andrew Davis via lists.yoctoproject.org wrote:
> Every MACHINE build deploys a tiboot3.bin file for all three K3 security
> types (GP, HS-FS, HS-SE). These extra MACHINE configs existed to select
> a different default. As U-Boot now selects a default for us this logic
> does not need to exist here. Instead if one wants to use a non-default
> security type for an EVM then can simply rename the tiboot3.bin file in
> the boot partition. Testing automation already handles this and Sitara-
> family devices have dropped the dedicated MACHINE configs, do the same
> for Jacinto-family devices.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>

Reviewed-by: Denys Dmytriyenko <denys@konsulko.com>


> ---
>  meta-ti-bsp/conf/machine/am65xx-hs-evm-k3r5.conf | 11 -----------
>  meta-ti-bsp/conf/machine/am65xx-hs-evm.conf      |  7 -------
>  meta-ti-bsp/conf/machine/j7200-hs-evm-k3r5.conf  | 11 -----------
>  meta-ti-bsp/conf/machine/j7200-hs-evm.conf       |  7 -------
>  meta-ti-bsp/conf/machine/j721e-hs-evm-k3r5.conf  | 11 -----------
>  meta-ti-bsp/conf/machine/j721e-hs-evm.conf       |  7 -------
>  meta-ti-bsp/conf/machine/j721s2-hs-evm-k3r5.conf | 11 -----------
>  meta-ti-bsp/conf/machine/j721s2-hs-evm.conf      |  5 -----
>  meta-ti-bsp/conf/machine/j784s4-hs-evm-k3r5.conf | 11 -----------
>  meta-ti-bsp/conf/machine/j784s4-hs-evm.conf      |  5 -----
>  10 files changed, 86 deletions(-)
>  delete mode 100644 meta-ti-bsp/conf/machine/am65xx-hs-evm-k3r5.conf
>  delete mode 100644 meta-ti-bsp/conf/machine/am65xx-hs-evm.conf
>  delete mode 100644 meta-ti-bsp/conf/machine/j7200-hs-evm-k3r5.conf
>  delete mode 100644 meta-ti-bsp/conf/machine/j7200-hs-evm.conf
>  delete mode 100644 meta-ti-bsp/conf/machine/j721e-hs-evm-k3r5.conf
>  delete mode 100644 meta-ti-bsp/conf/machine/j721e-hs-evm.conf
>  delete mode 100644 meta-ti-bsp/conf/machine/j721s2-hs-evm-k3r5.conf
>  delete mode 100644 meta-ti-bsp/conf/machine/j721s2-hs-evm.conf
>  delete mode 100644 meta-ti-bsp/conf/machine/j784s4-hs-evm-k3r5.conf
>  delete mode 100644 meta-ti-bsp/conf/machine/j784s4-hs-evm.conf
> 
> diff --git a/meta-ti-bsp/conf/machine/am65xx-hs-evm-k3r5.conf b/meta-ti-bsp/conf/machine/am65xx-hs-evm-k3r5.conf
> deleted file mode 100644
> index 337c8413..00000000
> --- a/meta-ti-bsp/conf/machine/am65xx-hs-evm-k3r5.conf
> +++ /dev/null
> @@ -1,11 +0,0 @@
> -#@TYPE: Machine
> -#@NAME: AM65xx HS EVM (R5F)
> -#@DESCRIPTION: Machine configuration for the TI AM65xx HS EVM (R5F core)
> -
> -require conf/machine/include/k3r5.inc
> -
> -SYSFW_SOC = "am65x_sr2"
> -SYSFW_CONFIG = "evm"
> -SYSFW_SUFFIX = "hs"
> -
> -UBOOT_MACHINE = "am65x_evm_r5_defconfig"
> diff --git a/meta-ti-bsp/conf/machine/am65xx-hs-evm.conf b/meta-ti-bsp/conf/machine/am65xx-hs-evm.conf
> deleted file mode 100644
> index f8221f31..00000000
> --- a/meta-ti-bsp/conf/machine/am65xx-hs-evm.conf
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -#@TYPE: Machine
> -#@NAME: AM65xx HS EVM
> -#@DESCRIPTION: Machine configuration for the TI AM65xx HS EVM
> -
> -require conf/machine/include/am65xx.inc
> -
> -UBOOT_MACHINE = "am65x_evm_a53_defconfig"
> diff --git a/meta-ti-bsp/conf/machine/j7200-hs-evm-k3r5.conf b/meta-ti-bsp/conf/machine/j7200-hs-evm-k3r5.conf
> deleted file mode 100644
> index 1922d5c8..00000000
> --- a/meta-ti-bsp/conf/machine/j7200-hs-evm-k3r5.conf
> +++ /dev/null
> @@ -1,11 +0,0 @@
> -#@TYPE: Machine
> -#@NAME: J7200 HS EVM (R5F)
> -#@DESCRIPTION: Machine configuration for the TI J7200 HS EVM (R5F core)
> -
> -require conf/machine/include/k3r5.inc
> -
> -SYSFW_SOC = "j7200_sr2"
> -SYSFW_CONFIG = "evm"
> -SYSFW_SUFFIX = "hs"
> -
> -UBOOT_MACHINE = "j7200_evm_r5_defconfig"
> diff --git a/meta-ti-bsp/conf/machine/j7200-hs-evm.conf b/meta-ti-bsp/conf/machine/j7200-hs-evm.conf
> deleted file mode 100644
> index 54fd2b4a..00000000
> --- a/meta-ti-bsp/conf/machine/j7200-hs-evm.conf
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -#@TYPE: Machine
> -#@NAME: J7200 HS EVM
> -#@DESCRIPTION: Machine configuration for the TI J7200 HS EVM
> -
> -require conf/machine/j7200-evm.conf
> -
> -UBOOT_MACHINE = "j7200_evm_a72_defconfig"
> diff --git a/meta-ti-bsp/conf/machine/j721e-hs-evm-k3r5.conf b/meta-ti-bsp/conf/machine/j721e-hs-evm-k3r5.conf
> deleted file mode 100644
> index 7904c660..00000000
> --- a/meta-ti-bsp/conf/machine/j721e-hs-evm-k3r5.conf
> +++ /dev/null
> @@ -1,11 +0,0 @@
> -#@TYPE: Machine
> -#@NAME: J721e HS EVM (R5F)
> -#@DESCRIPTION: Machine configuration for the TI J721e HS EVM (R5F core)
> -
> -require conf/machine/include/k3r5.inc
> -
> -SYSFW_SOC = "j721e_sr1_1"
> -SYSFW_CONFIG = "evm"
> -SYSFW_SUFFIX = "hs"
> -
> -UBOOT_MACHINE = "j721e_evm_r5_defconfig"
> diff --git a/meta-ti-bsp/conf/machine/j721e-hs-evm.conf b/meta-ti-bsp/conf/machine/j721e-hs-evm.conf
> deleted file mode 100644
> index 441ca169..00000000
> --- a/meta-ti-bsp/conf/machine/j721e-hs-evm.conf
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -#@TYPE: Machine
> -#@NAME: J721e HS EVM
> -#@DESCRIPTION: Machine configuration for the TI J721e HS EVM
> -
> -require conf/machine/j721e-evm.conf
> -
> -UBOOT_MACHINE = "j721e_evm_a72_defconfig"
> diff --git a/meta-ti-bsp/conf/machine/j721s2-hs-evm-k3r5.conf b/meta-ti-bsp/conf/machine/j721s2-hs-evm-k3r5.conf
> deleted file mode 100644
> index 58cd92c4..00000000
> --- a/meta-ti-bsp/conf/machine/j721s2-hs-evm-k3r5.conf
> +++ /dev/null
> @@ -1,11 +0,0 @@
> -#@TYPE: Machine
> -#@NAME: J721S2 HS EVM (R5F)
> -#@DESCRIPTION: Machine configuration for the TI J721S2 HS EVM (R5F core)
> -
> -require conf/machine/include/k3r5.inc
> -
> -SYSFW_SOC = "j721s2"
> -SYSFW_CONFIG = "evm"
> -SYSFW_SUFFIX = "hs"
> -
> -UBOOT_MACHINE = "j721s2_evm_r5_defconfig"
> diff --git a/meta-ti-bsp/conf/machine/j721s2-hs-evm.conf b/meta-ti-bsp/conf/machine/j721s2-hs-evm.conf
> deleted file mode 100644
> index 4cf32a28..00000000
> --- a/meta-ti-bsp/conf/machine/j721s2-hs-evm.conf
> +++ /dev/null
> @@ -1,5 +0,0 @@
> -#@TYPE: Machine
> -#@NAME: J721S2 HS EVM
> -#@DESCRIPTION: Machine configuration for the TI J721S2 HS EVM
> -
> -require conf/machine/j721s2-evm.conf
> diff --git a/meta-ti-bsp/conf/machine/j784s4-hs-evm-k3r5.conf b/meta-ti-bsp/conf/machine/j784s4-hs-evm-k3r5.conf
> deleted file mode 100644
> index 80a228a0..00000000
> --- a/meta-ti-bsp/conf/machine/j784s4-hs-evm-k3r5.conf
> +++ /dev/null
> @@ -1,11 +0,0 @@
> -#@TYPE: Machine
> -#@NAME: J784S4 HS EVM (R5F)
> -#@DESCRIPTION: Machine configuration for the TI J784S4 HS EVM (R5F core)
> -
> -require conf/machine/include/k3r5.inc
> -
> -SYSFW_SOC = "j784s4"
> -SYSFW_CONFIG = "evm"
> -SYSFW_SUFFIX = "hs"
> -
> -UBOOT_MACHINE = "j784s4_evm_r5_defconfig"
> diff --git a/meta-ti-bsp/conf/machine/j784s4-hs-evm.conf b/meta-ti-bsp/conf/machine/j784s4-hs-evm.conf
> deleted file mode 100644
> index 8fa1c1fd..00000000
> --- a/meta-ti-bsp/conf/machine/j784s4-hs-evm.conf
> +++ /dev/null
> @@ -1,5 +0,0 @@
> -#@TYPE: Machine
> -#@NAME: J784S4 HS EVM
> -#@DESCRIPTION: Machine configuration for the TI J784S4 HS EVM
> -
> -require conf/machine/j784s4-evm.conf
> -- 
> 2.39.2

