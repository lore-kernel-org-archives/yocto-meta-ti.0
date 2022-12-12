Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4234AC4332F
	for <webhook@archiver.kernel.org>; Mon, 12 Dec 2022 22:52:03 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.58903.1670885513521285284
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 12 Dec 2022 14:51:53 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id EC6E540BA9;
	Mon, 12 Dec 2022 22:51:52 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b5rN8eLGhS1G; Mon, 12 Dec 2022 22:51:52 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id BB55240A3F;
	Mon, 12 Dec 2022 22:51:49 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id BEFD91636AE; Mon, 12 Dec 2022 17:51:39 -0500 (EST)
Date: Mon, 12 Dec 2022 17:51:39 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: afd@ti.com
Cc: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master/kirkstone][PATCH 6/7] conf: machine: Move
 TFA_BOARD and OPTEEMACHINE to the SoC level
Message-ID: <20221212225139.GM22689@denix.org>
References: <20221207214312.21735-1-afd@ti.com>
 <20221207214312.21735-6-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221207214312.21735-6-afd@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 12 Dec 2022 22:52:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15460

On Wed, Dec 07, 2022 at 03:43:11PM -0600, Andrew Davis via lists.yoctoproject.org wrote:
> These defines are specific to a SoC, not a SoC family (K3) nor
> any specific board. Move these to the SoC level for all boards
> to be consistent with boards already doing this correctly.

See the question below


> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
>  meta-ti-bsp/conf/machine/include/am64xx.inc | 1 +
>  meta-ti-bsp/conf/machine/include/am65xx.inc | 2 ++
>  meta-ti-bsp/conf/machine/include/j7200.inc  | 2 ++
>  meta-ti-bsp/conf/machine/include/j721e.inc  | 6 ++++--
>  meta-ti-bsp/conf/machine/include/j721s2.inc | 6 ++++--
>  meta-ti-bsp/conf/machine/include/j784s4.inc | 6 ++++--
>  meta-ti-bsp/conf/machine/include/k3.inc     | 1 -
>  meta-ti-bsp/conf/machine/j721s2-evm.conf    | 1 -
>  meta-ti-bsp/conf/machine/j784s4-evm.conf    | 4 ----
>  9 files changed, 17 insertions(+), 12 deletions(-)
> 
> diff --git a/meta-ti-bsp/conf/machine/include/am64xx.inc b/meta-ti-bsp/conf/machine/include/am64xx.inc
> index 7c46b630..f1a91991 100644
> --- a/meta-ti-bsp/conf/machine/include/am64xx.inc
> +++ b/meta-ti-bsp/conf/machine/include/am64xx.inc
> @@ -32,4 +32,5 @@ do_image_wic[mcdepends] += "mc::k3r5-sr2-hs-se:ti-sci-fw:do_deploy"
>  do_image_tar[mcdepends] += "mc::k3r5-sr2-hs-se:ti-sci-fw:do_deploy"
>  
>  TFA_BOARD = "lite"
> +
>  OPTEEMACHINE = "k3-am64x"
> diff --git a/meta-ti-bsp/conf/machine/include/am65xx.inc b/meta-ti-bsp/conf/machine/include/am65xx.inc
> index 14e0d07f..88259717 100644
> --- a/meta-ti-bsp/conf/machine/include/am65xx.inc
> +++ b/meta-ti-bsp/conf/machine/include/am65xx.inc
> @@ -37,4 +37,6 @@ IMAGE_BOOT_FILES += "sysfw-am65x-evm.itb"
>  do_image_wic[mcdepends] += "mc::k3r5-sr2:ti-sci-fw:do_deploy"
>  do_image_tar[mcdepends] += "mc::k3r5-sr2:ti-sci-fw:do_deploy"
>  
> +TFA_BOARD = "generic"
> +
>  OPTEEMACHINE = "k3-am65x"
> diff --git a/meta-ti-bsp/conf/machine/include/j7200.inc b/meta-ti-bsp/conf/machine/include/j7200.inc
> index 1eaf7806..d21e26cc 100644
> --- a/meta-ti-bsp/conf/machine/include/j7200.inc
> +++ b/meta-ti-bsp/conf/machine/include/j7200.inc
> @@ -1,4 +1,6 @@
>  require conf/machine/include/k3.inc
>  SOC_FAMILY:append = ":j7200"
>  
> +TFA_BOARD = "generic"
> +
>  OPTEEMACHINE = "k3-j721e"
> diff --git a/meta-ti-bsp/conf/machine/include/j721e.inc b/meta-ti-bsp/conf/machine/include/j721e.inc
> index 34569a01..12ee0c90 100644
> --- a/meta-ti-bsp/conf/machine/include/j721e.inc
> +++ b/meta-ti-bsp/conf/machine/include/j721e.inc
> @@ -1,8 +1,6 @@
>  require conf/machine/include/k3.inc
>  SOC_FAMILY:append = ":j721e"
>  
> -OPTEEMACHINE = "k3-j721e"
> -
>  MACHINE_FEATURES += "gpu"
>  
>  PREFERRED_PROVIDER_virtual/egl ?= "ti-img-rogue-umlibs"
> @@ -10,3 +8,7 @@ PREFERRED_PROVIDER_virtual/libgles1 ?= "ti-img-rogue-umlibs"
>  PREFERRED_PROVIDER_virtual/libgles2 ?= "ti-img-rogue-umlibs"
>  PREFERRED_PROVIDER_virtual/libgbm ?= "ti-img-rogue-umlibs"
>  PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-img-rogue-driver"
> +
> +TFA_BOARD = "generic"
> +
> +OPTEEMACHINE = "k3-j721e"
> diff --git a/meta-ti-bsp/conf/machine/include/j721s2.inc b/meta-ti-bsp/conf/machine/include/j721s2.inc
> index 2a60458e..fc6493b8 100644
> --- a/meta-ti-bsp/conf/machine/include/j721s2.inc
> +++ b/meta-ti-bsp/conf/machine/include/j721s2.inc
> @@ -1,8 +1,6 @@
>  require conf/machine/include/k3.inc
>  SOC_FAMILY:append = ":j721s2"
>  
> -OPTEEMACHINE = "k3-j721e"
> -
>  MACHINE_FEATURES += "gpu"
>  
>  PREFERRED_PROVIDER_virtual/egl ?= "ti-img-rogue-umlibs"
> @@ -10,3 +8,7 @@ PREFERRED_PROVIDER_virtual/libgles1 ?= "ti-img-rogue-umlibs"
>  PREFERRED_PROVIDER_virtual/libgles2 ?= "ti-img-rogue-umlibs"
>  PREFERRED_PROVIDER_virtual/libgbm ?= "ti-img-rogue-umlibs"
>  PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-img-rogue-driver"
> +
> +TFA_BOARD = "generic"
> +
> +OPTEEMACHINE = "k3-j784s4"
> diff --git a/meta-ti-bsp/conf/machine/include/j784s4.inc b/meta-ti-bsp/conf/machine/include/j784s4.inc
> index e2f053ac..d268b810 100644
> --- a/meta-ti-bsp/conf/machine/include/j784s4.inc
> +++ b/meta-ti-bsp/conf/machine/include/j784s4.inc
> @@ -1,8 +1,6 @@
>  require conf/machine/include/k3.inc
>  SOC_FAMILY:append = ":j784s4"
>  
> -OPTEEMACHINE = "k3-j721e"
> -
>  MACHINE_FEATURES += "gpu"
>  
>  PREFERRED_PROVIDER_virtual/egl ?= "ti-img-rogue-umlibs"
> @@ -10,3 +8,7 @@ PREFERRED_PROVIDER_virtual/libgles1 ?= "ti-img-rogue-umlibs"
>  PREFERRED_PROVIDER_virtual/libgles2 ?= "ti-img-rogue-umlibs"
>  PREFERRED_PROVIDER_virtual/libgbm ?= "ti-img-rogue-umlibs"
>  PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-img-rogue-driver"
> +
> +TFA_BOARD = "j784s4"

Just wanted to check that it is the correct TFA_BOARD used here. I know that 
you are simply moving the existing value from EVM to SOC config, but I still 
wonder that we have these inconsistent values for all the K3 platforms:

1. generic
2. lite
3. j784s4


> +
> +OPTEEMACHINE = "k3-j784s4"
> diff --git a/meta-ti-bsp/conf/machine/include/k3.inc b/meta-ti-bsp/conf/machine/include/k3.inc
> index 84afd2e2..bd71becf 100644
> --- a/meta-ti-bsp/conf/machine/include/k3.inc
> +++ b/meta-ti-bsp/conf/machine/include/k3.inc
> @@ -29,7 +29,6 @@ UBOOT_SUFFIX = "img"
>  EXTRA_IMAGEDEPENDS += "virtual/bootloader"
>  
>  TFA_PLATFORM = "k3"
> -TFA_BOARD = "generic"
>  
>  # Use the expected value of the ubifs filesystem's volume name in the kernel
>  # and u-boot.
> diff --git a/meta-ti-bsp/conf/machine/j721s2-evm.conf b/meta-ti-bsp/conf/machine/j721s2-evm.conf
> index 37353df4..46d5dbf6 100644
> --- a/meta-ti-bsp/conf/machine/j721s2-evm.conf
> +++ b/meta-ti-bsp/conf/machine/j721s2-evm.conf
> @@ -7,7 +7,6 @@ require conf/machine/include/j721s2.inc
>  SERIAL_CONSOLES = "115200;ttyS2"
>  SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
>  TFA_K3_USART = "0x8"
> -OPTEEMACHINE = "k3-j784s4"
>  OPTEE_K3_USART = "0x8"
>  
>  KERNEL_DEVICETREE = " \
> diff --git a/meta-ti-bsp/conf/machine/j784s4-evm.conf b/meta-ti-bsp/conf/machine/j784s4-evm.conf
> index 10d8aad0..f8be7d18 100644
> --- a/meta-ti-bsp/conf/machine/j784s4-evm.conf
> +++ b/meta-ti-bsp/conf/machine/j784s4-evm.conf
> @@ -7,7 +7,6 @@ require conf/machine/include/j784s4.inc
>  SERIAL_CONSOLES = "115200;ttyS2"
>  SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
>  TFA_K3_USART = "0x8"
> -OPTEEMACHINE = "k3-j784s4"
>  OPTEE_K3_USART = "0x8"
>  
>  KERNEL_DEVICETREE = " \
> @@ -18,6 +17,3 @@ UBOOT_MACHINE = "j784s4_evm_a72_defconfig"
>  
>  do_image_wic[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
>  do_image_tar[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
> -
> -TFA_BOARD = "j784s4"
> -
> -- 
> 2.38.1
> 

