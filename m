Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D193AC61DA4
	for <webhook@archiver.kernel.org>; Tue, 14 Feb 2023 18:48:47 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.2524.1676400518673518770
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 14 Feb 2023 10:48:39 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id ABAC740C37;
	Tue, 14 Feb 2023 18:48:37 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kYwvXpJZBJ0g; Tue, 14 Feb 2023 18:48:37 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 7CACA40A3D;
	Tue, 14 Feb 2023 18:48:34 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 9C207163759; Tue, 14 Feb 2023 13:48:10 -0500 (EST)
Date: Tue, 14 Feb 2023 13:48:10 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: afd@ti.com
Cc: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master/kirkstone][PATCH 2/4] conf: machine: Add
 proper SOC_FAMILY for R5 builds
Message-ID: <20230214184810.GJ22689@denix.org>
References: <20230214145352.12093-1-afd@ti.com>
 <20230214145352.12093-2-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230214145352.12093-2-afd@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 14 Feb 2023 18:48:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15842

NAK, you should not mix overrides for different archs.

I also have this cleanup for R5 machine overrides pending, but using unique 
names rather than the same ones with the main cores. I'll try to submit that 
one shortly...


On Tue, Feb 14, 2023 at 08:53:50AM -0600, Andrew Davis via lists.yoctoproject.org wrote:
> Having our SOC_FAMILY set to our SoC name can be useful in recipes
> that need SoC specific configuration. Add SoC names.
> 
> Setting the revision and security type is less useful here and not
> used. Remove that while here.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
>  meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf           | 1 +
>  meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf        | 1 +
>  meta-ti-bsp/conf/machine/am64xx-evm-k3r5-gp.conf        | 2 +-
>  meta-ti-bsp/conf/machine/am64xx-evm-k3r5-sr2-hs-fs.conf | 2 +-
>  meta-ti-bsp/conf/machine/am64xx-evm-k3r5-sr2-hs-se.conf | 2 +-
>  meta-ti-bsp/conf/machine/am65xx-evm-k3r5-sr2.conf       | 1 -
>  meta-ti-bsp/conf/machine/am65xx-evm-k3r5.conf           | 1 +
>  meta-ti-bsp/conf/machine/am65xx-hs-evm-k3r5-sr2.conf    | 1 -
>  meta-ti-bsp/conf/machine/am65xx-hs-evm-k3r5.conf        | 1 +
>  meta-ti-bsp/conf/machine/beaglebone-ai64-k3r5.conf      | 1 +
>  meta-ti-bsp/conf/machine/j7200-evm-k3r5.conf            | 1 +
>  meta-ti-bsp/conf/machine/j7200-hs-evm-k3r5.conf         | 1 +
>  meta-ti-bsp/conf/machine/j721e-evm-k3r5.conf            | 1 +
>  meta-ti-bsp/conf/machine/j721e-hs-evm-k3r5.conf         | 1 +
>  meta-ti-bsp/conf/machine/j721s2-evm-k3r5.conf           | 1 +
>  meta-ti-bsp/conf/machine/j721s2-hs-evm-k3r5.conf        | 1 +
>  meta-ti-bsp/conf/machine/j784s4-evm-k3r5.conf           | 1 +
>  17 files changed, 15 insertions(+), 5 deletions(-)
> 
> diff --git a/meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf b/meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf
> index 724a8d4a..2fb43256 100644
> --- a/meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf
> +++ b/meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf
> @@ -3,6 +3,7 @@
>  #@DESCRIPTION: Machine configuration for the TI AM62xx EVM (R5F core)
>  
>  require conf/machine/include/k3r5.inc
> +SOC_FAMILY:append = ":am62xx"
>  
>  SYSFW_SOC = "am62x"
>  SYSFW_CONFIG = "evm"
> diff --git a/meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf b/meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf
> index ca4ced5a..14246300 100644
> --- a/meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf
> +++ b/meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf
> @@ -3,6 +3,7 @@
>  #@DESCRIPTION: Machine configuration for the TI AM62xx LP EVM (R5F core)
>  
>  require conf/machine/include/k3r5.inc
> +SOC_FAMILY:append = ":am62xx"
>  
>  SYSFW_SOC = "am62x"
>  SYSFW_CONFIG = "evm"
> diff --git a/meta-ti-bsp/conf/machine/am64xx-evm-k3r5-gp.conf b/meta-ti-bsp/conf/machine/am64xx-evm-k3r5-gp.conf
> index 50bf6a07..e6a1a9d7 100644
> --- a/meta-ti-bsp/conf/machine/am64xx-evm-k3r5-gp.conf
> +++ b/meta-ti-bsp/conf/machine/am64xx-evm-k3r5-gp.conf
> @@ -5,7 +5,7 @@
>  # Booting GP requires different SYSFW, the rest is handled at runtime
>  
>  require conf/machine/include/k3r5.inc
> -SOC_FAMILY:append = ":k3r5-gp"
> +SOC_FAMILY:append = ":am64xx"
>  
>  SYSFW_SOC = "am64x"
>  SYSFW_CONFIG = "evm"
> diff --git a/meta-ti-bsp/conf/machine/am64xx-evm-k3r5-sr2-hs-fs.conf b/meta-ti-bsp/conf/machine/am64xx-evm-k3r5-sr2-hs-fs.conf
> index 42ddbb4c..29d000ef 100644
> --- a/meta-ti-bsp/conf/machine/am64xx-evm-k3r5-sr2-hs-fs.conf
> +++ b/meta-ti-bsp/conf/machine/am64xx-evm-k3r5-sr2-hs-fs.conf
> @@ -5,7 +5,7 @@
>  # Booting SR2.0 HS-FS requires different SYSFW, the rest is handled at runtime
>  
>  require conf/machine/include/k3r5.inc
> -SOC_FAMILY:append = ":k3r5-sr2-hs-fs"
> +SOC_FAMILY:append = ":am64xx"
>  
>  SYSFW_SOC = "am64x_sr2"
>  SYSFW_CONFIG = "evm"
> diff --git a/meta-ti-bsp/conf/machine/am64xx-evm-k3r5-sr2-hs-se.conf b/meta-ti-bsp/conf/machine/am64xx-evm-k3r5-sr2-hs-se.conf
> index a1c2b3e6..37457f00 100644
> --- a/meta-ti-bsp/conf/machine/am64xx-evm-k3r5-sr2-hs-se.conf
> +++ b/meta-ti-bsp/conf/machine/am64xx-evm-k3r5-sr2-hs-se.conf
> @@ -5,7 +5,7 @@
>  # Booting SR2.0 HS-SE requires different SYSFW, the rest is handled at runtime
>  
>  require conf/machine/include/k3r5.inc
> -SOC_FAMILY:append = ":k3r5-sr2-hs-se"
> +SOC_FAMILY:append = ":am64xx"
>  
>  SYSFW_SOC = "am64x_sr2"
>  SYSFW_CONFIG = "evm"
> diff --git a/meta-ti-bsp/conf/machine/am65xx-evm-k3r5-sr2.conf b/meta-ti-bsp/conf/machine/am65xx-evm-k3r5-sr2.conf
> index e74dd3ab..09625c51 100644
> --- a/meta-ti-bsp/conf/machine/am65xx-evm-k3r5-sr2.conf
> +++ b/meta-ti-bsp/conf/machine/am65xx-evm-k3r5-sr2.conf
> @@ -5,7 +5,6 @@
>  # Booting SR2 requires different SYSFW, the rest is handled at runtime
>  
>  require conf/machine/am65xx-evm-k3r5.conf
> -SOC_FAMILY:append = ":k3r5-sr2"
>  
>  SYSFW_SOC = "am65x_sr2"
>  SYSFW_SYMLINK = "sysfw.itb"
> diff --git a/meta-ti-bsp/conf/machine/am65xx-evm-k3r5.conf b/meta-ti-bsp/conf/machine/am65xx-evm-k3r5.conf
> index a484e444..f8afad9b 100644
> --- a/meta-ti-bsp/conf/machine/am65xx-evm-k3r5.conf
> +++ b/meta-ti-bsp/conf/machine/am65xx-evm-k3r5.conf
> @@ -3,6 +3,7 @@
>  #@DESCRIPTION: Machine configuration for the TI AM65xx EVM (R5F core)
>  
>  require conf/machine/include/k3r5.inc
> +SOC_FAMILY:append = ":am65xx"
>  
>  SYSFW_SOC = "am65x"
>  SYSFW_CONFIG = "evm"
> diff --git a/meta-ti-bsp/conf/machine/am65xx-hs-evm-k3r5-sr2.conf b/meta-ti-bsp/conf/machine/am65xx-hs-evm-k3r5-sr2.conf
> index ff1645e4..90ad313b 100644
> --- a/meta-ti-bsp/conf/machine/am65xx-hs-evm-k3r5-sr2.conf
> +++ b/meta-ti-bsp/conf/machine/am65xx-hs-evm-k3r5-sr2.conf
> @@ -5,7 +5,6 @@
>  # Booting SR2 requires different SYSFW, the rest is handled at runtime
>  
>  require conf/machine/am65xx-hs-evm-k3r5.conf
> -SOC_FAMILY:append = ":k3r5-sr2"
>  
>  SYSFW_SOC = "am65x_sr2"
>  SYSFW_SYMLINK = "sysfw.itb"
> diff --git a/meta-ti-bsp/conf/machine/am65xx-hs-evm-k3r5.conf b/meta-ti-bsp/conf/machine/am65xx-hs-evm-k3r5.conf
> index d9041c9d..49983ba9 100644
> --- a/meta-ti-bsp/conf/machine/am65xx-hs-evm-k3r5.conf
> +++ b/meta-ti-bsp/conf/machine/am65xx-hs-evm-k3r5.conf
> @@ -3,6 +3,7 @@
>  #@DESCRIPTION: Machine configuration for the TI AM65xx HS EVM (R5F core)
>  
>  require conf/machine/include/k3r5.inc
> +SOC_FAMILY:append = ":am65xx"
>  
>  SYSFW_SOC = "am65x"
>  SYSFW_CONFIG = "evm"
> diff --git a/meta-ti-bsp/conf/machine/beaglebone-ai64-k3r5.conf b/meta-ti-bsp/conf/machine/beaglebone-ai64-k3r5.conf
> index 21b8702b..d0694122 100644
> --- a/meta-ti-bsp/conf/machine/beaglebone-ai64-k3r5.conf
> +++ b/meta-ti-bsp/conf/machine/beaglebone-ai64-k3r5.conf
> @@ -3,6 +3,7 @@
>  #@DESCRIPTION: Machine configuration for the BeagleBone AI-64 (R5F core)
>  
>  require conf/machine/include/k3r5.inc
> +SOC_FAMILY:append = ":j721e"
>  
>  PREFERRED_PROVIDER_virtual/bootloader = "u-boot-bb.org"
>  PREFERRED_PROVIDER_u-boot = "u-boot-bb.org"
> diff --git a/meta-ti-bsp/conf/machine/j7200-evm-k3r5.conf b/meta-ti-bsp/conf/machine/j7200-evm-k3r5.conf
> index 68061883..4cd6accf 100644
> --- a/meta-ti-bsp/conf/machine/j7200-evm-k3r5.conf
> +++ b/meta-ti-bsp/conf/machine/j7200-evm-k3r5.conf
> @@ -3,6 +3,7 @@
>  #@DESCRIPTION: Machine configuration for the TI J7200 EVM (R5F core)
>  
>  require conf/machine/include/k3r5.inc
> +SOC_FAMILY:append = ":j7200"
>  
>  SYSFW_SOC = "j7200"
>  SYSFW_CONFIG = "evm"
> diff --git a/meta-ti-bsp/conf/machine/j7200-hs-evm-k3r5.conf b/meta-ti-bsp/conf/machine/j7200-hs-evm-k3r5.conf
> index 3fe06e74..c3584193 100644
> --- a/meta-ti-bsp/conf/machine/j7200-hs-evm-k3r5.conf
> +++ b/meta-ti-bsp/conf/machine/j7200-hs-evm-k3r5.conf
> @@ -3,6 +3,7 @@
>  #@DESCRIPTION: Machine configuration for the TI J7200 HS EVM (R5F core)
>  
>  require conf/machine/include/k3r5.inc
> +SOC_FAMILY:append = ":j7200"
>  
>  SYSFW_SOC = "j7200_sr2"
>  SYSFW_CONFIG = "evm"
> diff --git a/meta-ti-bsp/conf/machine/j721e-evm-k3r5.conf b/meta-ti-bsp/conf/machine/j721e-evm-k3r5.conf
> index 9544cdb6..678b79b1 100644
> --- a/meta-ti-bsp/conf/machine/j721e-evm-k3r5.conf
> +++ b/meta-ti-bsp/conf/machine/j721e-evm-k3r5.conf
> @@ -3,6 +3,7 @@
>  #@DESCRIPTION: Machine configuration for the TI J721e EVM (R5F core)
>  
>  require conf/machine/include/k3r5.inc
> +SOC_FAMILY:append = ":j721e"
>  
>  SYSFW_SOC = "j721e"
>  SYSFW_CONFIG = "evm"
> diff --git a/meta-ti-bsp/conf/machine/j721e-hs-evm-k3r5.conf b/meta-ti-bsp/conf/machine/j721e-hs-evm-k3r5.conf
> index 56312c0c..d7f0cfcc 100644
> --- a/meta-ti-bsp/conf/machine/j721e-hs-evm-k3r5.conf
> +++ b/meta-ti-bsp/conf/machine/j721e-hs-evm-k3r5.conf
> @@ -3,6 +3,7 @@
>  #@DESCRIPTION: Machine configuration for the TI J721e HS EVM (R5F core)
>  
>  require conf/machine/include/k3r5.inc
> +SOC_FAMILY:append = ":j721e"
>  
>  SYSFW_SOC = "j721e_sr1_1"
>  SYSFW_CONFIG = "evm"
> diff --git a/meta-ti-bsp/conf/machine/j721s2-evm-k3r5.conf b/meta-ti-bsp/conf/machine/j721s2-evm-k3r5.conf
> index 508e96e5..7fb6ef28 100644
> --- a/meta-ti-bsp/conf/machine/j721s2-evm-k3r5.conf
> +++ b/meta-ti-bsp/conf/machine/j721s2-evm-k3r5.conf
> @@ -3,6 +3,7 @@
>  #@DESCRIPTION: Machine configuration for the TI J721S2 EVM (R5F core)
>  
>  require conf/machine/include/k3r5.inc
> +SOC_FAMILY:append = ":j721s2"
>  
>  SYSFW_SOC = "j721s2"
>  SYSFW_CONFIG = "evm"
> diff --git a/meta-ti-bsp/conf/machine/j721s2-hs-evm-k3r5.conf b/meta-ti-bsp/conf/machine/j721s2-hs-evm-k3r5.conf
> index a4d51904..fa1284c3 100644
> --- a/meta-ti-bsp/conf/machine/j721s2-hs-evm-k3r5.conf
> +++ b/meta-ti-bsp/conf/machine/j721s2-hs-evm-k3r5.conf
> @@ -3,6 +3,7 @@
>  #@DESCRIPTION: Machine configuration for the TI J721S2 HS EVM (R5F core)
>  
>  require conf/machine/include/k3r5.inc
> +SOC_FAMILY:append = ":j721s2"
>  
>  SYSFW_SOC = "j721s2"
>  SYSFW_CONFIG = "evm"
> diff --git a/meta-ti-bsp/conf/machine/j784s4-evm-k3r5.conf b/meta-ti-bsp/conf/machine/j784s4-evm-k3r5.conf
> index 04feebc6..37dad149 100644
> --- a/meta-ti-bsp/conf/machine/j784s4-evm-k3r5.conf
> +++ b/meta-ti-bsp/conf/machine/j784s4-evm-k3r5.conf
> @@ -3,6 +3,7 @@
>  #@DESCRIPTION: Machine configuration for the TI J784S4 EVM (R5F core)
>  
>  require conf/machine/include/k3r5.inc
> +SOC_FAMILY:append = ":j784s4"
>  
>  SYSFW_SOC = "j784s4"
>  SYSFW_CONFIG = "evm"
> -- 
> 2.39.1

