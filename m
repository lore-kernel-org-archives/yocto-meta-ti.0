Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E026C4332F
	for <webhook@archiver.kernel.org>; Mon, 12 Dec 2022 22:48:03 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.58817.1670885280328003299
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 12 Dec 2022 14:48:00 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 3798840BA9;
	Mon, 12 Dec 2022 22:47:59 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xg1ahBK2F85g; Mon, 12 Dec 2022 22:47:59 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 0307540A3F;
	Mon, 12 Dec 2022 22:47:55 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 6880F1636AE; Mon, 12 Dec 2022 17:47:46 -0500 (EST)
Date: Mon, 12 Dec 2022 17:47:46 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: afd@ti.com
Cc: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master/kirkstone][PATCH 5/7] conf: machine: Remove
 OPTEEOUTPUTMACHINE definition
Message-ID: <20221212224746.GL22689@denix.org>
References: <20221207214312.21735-1-afd@ti.com>
 <20221207214312.21735-5-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221207214312.21735-5-afd@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 12 Dec 2022 22:48:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15459

On Wed, Dec 07, 2022 at 03:43:10PM -0600, Andrew Davis via lists.yoctoproject.org wrote:
> This was used in the base Linaro optee-os_git.bb recipe, it is
> no longer used, remove it from our boards.

Well, it was still used in meta-arm up to and including Dunfell:
https://git.yoctoproject.org/meta-arm/tree/meta-arm/recipes-security/optee/optee-os_git.bb?h=dunfell#n57

Even though it got removed after Dunfell, there's one small reference 
remaining in meta-arago, which I assume you'd be taking care of next? :)
https://git.yoctoproject.org/meta-arago/tree/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk.bb#n30


> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
>  meta-ti-bsp/conf/machine/am437x-hs-evm.conf | 1 -
>  meta-ti-bsp/conf/machine/am57xx-hs-evm.conf | 1 -
>  meta-ti-bsp/conf/machine/dra7xx-hs-evm.conf | 1 -
>  meta-ti-bsp/conf/machine/include/am62xx.inc | 1 -
>  meta-ti-bsp/conf/machine/include/am64xx.inc | 1 -
>  meta-ti-bsp/conf/machine/include/am65xx.inc | 1 -
>  meta-ti-bsp/conf/machine/include/j7200.inc  | 1 -
>  meta-ti-bsp/conf/machine/include/j721e.inc  | 1 -
>  meta-ti-bsp/conf/machine/include/j721s2.inc | 1 -
>  meta-ti-bsp/conf/machine/include/j784s4.inc | 1 -
>  10 files changed, 10 deletions(-)
> 
> diff --git a/meta-ti-bsp/conf/machine/am437x-hs-evm.conf b/meta-ti-bsp/conf/machine/am437x-hs-evm.conf
> index 68b808d2..cdd664ac 100644
> --- a/meta-ti-bsp/conf/machine/am437x-hs-evm.conf
> +++ b/meta-ti-bsp/conf/machine/am437x-hs-evm.conf
> @@ -15,6 +15,5 @@ TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_CAT}/am4x"
>  
>  OPTEEMACHINE = "ti-am43xx"
>  OPTEEFLAVOR = "am43xx"
> -OPTEEOUTPUTMACHINE = "ti"
>  
>  EXTRA_IMAGEDEPENDS += "optee-os"
> diff --git a/meta-ti-bsp/conf/machine/am57xx-hs-evm.conf b/meta-ti-bsp/conf/machine/am57xx-hs-evm.conf
> index 5232cbd9..1e63f5d2 100644
> --- a/meta-ti-bsp/conf/machine/am57xx-hs-evm.conf
> +++ b/meta-ti-bsp/conf/machine/am57xx-hs-evm.conf
> @@ -15,7 +15,6 @@ TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_AUTO}/am5x"
>  
>  OPTEEMACHINE = "ti-am57xx"
>  OPTEEFLAVOR = "am57xx"
> -OPTEEOUTPUTMACHINE = "ti"
>  OPTEEPAGER = "y"
>  
>  EXTRA_IMAGEDEPENDS += "optee-os"
> diff --git a/meta-ti-bsp/conf/machine/dra7xx-hs-evm.conf b/meta-ti-bsp/conf/machine/dra7xx-hs-evm.conf
> index 49630081..810d53ed 100644
> --- a/meta-ti-bsp/conf/machine/dra7xx-hs-evm.conf
> +++ b/meta-ti-bsp/conf/machine/dra7xx-hs-evm.conf
> @@ -15,7 +15,6 @@ TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_AUTO}/dra7"
>  
>  OPTEEMACHINE = "ti-dra7xx"
>  OPTEEFLAVOR = "dra7xx"
> -OPTEEOUTPUTMACHINE = "ti"
>  OPTEEPAGER = "y"
>  
>  EXTRA_IMAGEDEPENDS += "optee-os"
> diff --git a/meta-ti-bsp/conf/machine/include/am62xx.inc b/meta-ti-bsp/conf/machine/include/am62xx.inc
> index a5aad994..9d8bc87c 100644
> --- a/meta-ti-bsp/conf/machine/include/am62xx.inc
> +++ b/meta-ti-bsp/conf/machine/include/am62xx.inc
> @@ -19,4 +19,3 @@ TFA_BOARD = "lite"
>  TFA_K3_SYSTEM_SUSPEND = "1"
>  
>  OPTEEMACHINE = "k3-am62x"
> -OPTEEOUTPUTMACHINE = "k3"
> diff --git a/meta-ti-bsp/conf/machine/include/am64xx.inc b/meta-ti-bsp/conf/machine/include/am64xx.inc
> index 055f6036..7c46b630 100644
> --- a/meta-ti-bsp/conf/machine/include/am64xx.inc
> +++ b/meta-ti-bsp/conf/machine/include/am64xx.inc
> @@ -33,4 +33,3 @@ do_image_tar[mcdepends] += "mc::k3r5-sr2-hs-se:ti-sci-fw:do_deploy"
>  
>  TFA_BOARD = "lite"
>  OPTEEMACHINE = "k3-am64x"
> -OPTEEOUTPUTMACHINE = "k3"
> diff --git a/meta-ti-bsp/conf/machine/include/am65xx.inc b/meta-ti-bsp/conf/machine/include/am65xx.inc
> index 80aa6d27..14e0d07f 100644
> --- a/meta-ti-bsp/conf/machine/include/am65xx.inc
> +++ b/meta-ti-bsp/conf/machine/include/am65xx.inc
> @@ -38,4 +38,3 @@ do_image_wic[mcdepends] += "mc::k3r5-sr2:ti-sci-fw:do_deploy"
>  do_image_tar[mcdepends] += "mc::k3r5-sr2:ti-sci-fw:do_deploy"
>  
>  OPTEEMACHINE = "k3-am65x"
> -OPTEEOUTPUTMACHINE = "k3"
> diff --git a/meta-ti-bsp/conf/machine/include/j7200.inc b/meta-ti-bsp/conf/machine/include/j7200.inc
> index 3aedb3f8..1eaf7806 100644
> --- a/meta-ti-bsp/conf/machine/include/j7200.inc
> +++ b/meta-ti-bsp/conf/machine/include/j7200.inc
> @@ -2,4 +2,3 @@ require conf/machine/include/k3.inc
>  SOC_FAMILY:append = ":j7200"
>  
>  OPTEEMACHINE = "k3-j721e"
> -OPTEEOUTPUTMACHINE = "k3"
> diff --git a/meta-ti-bsp/conf/machine/include/j721e.inc b/meta-ti-bsp/conf/machine/include/j721e.inc
> index 8a6c2bec..34569a01 100644
> --- a/meta-ti-bsp/conf/machine/include/j721e.inc
> +++ b/meta-ti-bsp/conf/machine/include/j721e.inc
> @@ -2,7 +2,6 @@ require conf/machine/include/k3.inc
>  SOC_FAMILY:append = ":j721e"
>  
>  OPTEEMACHINE = "k3-j721e"
> -OPTEEOUTPUTMACHINE = "k3"
>  
>  MACHINE_FEATURES += "gpu"
>  
> diff --git a/meta-ti-bsp/conf/machine/include/j721s2.inc b/meta-ti-bsp/conf/machine/include/j721s2.inc
> index 4959ad8f..2a60458e 100644
> --- a/meta-ti-bsp/conf/machine/include/j721s2.inc
> +++ b/meta-ti-bsp/conf/machine/include/j721s2.inc
> @@ -2,7 +2,6 @@ require conf/machine/include/k3.inc
>  SOC_FAMILY:append = ":j721s2"
>  
>  OPTEEMACHINE = "k3-j721e"
> -OPTEEOUTPUTMACHINE = "k3"
>  
>  MACHINE_FEATURES += "gpu"
>  
> diff --git a/meta-ti-bsp/conf/machine/include/j784s4.inc b/meta-ti-bsp/conf/machine/include/j784s4.inc
> index 83d7c760..e2f053ac 100644
> --- a/meta-ti-bsp/conf/machine/include/j784s4.inc
> +++ b/meta-ti-bsp/conf/machine/include/j784s4.inc
> @@ -2,7 +2,6 @@ require conf/machine/include/k3.inc
>  SOC_FAMILY:append = ":j784s4"
>  
>  OPTEEMACHINE = "k3-j721e"
> -OPTEEOUTPUTMACHINE = "k3"
>  
>  MACHINE_FEATURES += "gpu"
>  
> -- 
> 2.38.1

