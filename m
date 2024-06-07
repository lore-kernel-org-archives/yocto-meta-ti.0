Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B331C27C55
	for <webhook@archiver.kernel.org>; Fri,  7 Jun 2024 20:15:53 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.52766.1717791350767586197
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 07 Jun 2024 13:15:51 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id C821040C61;
	Fri,  7 Jun 2024 20:15:49 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fsyY9bZKhcrn; Fri,  7 Jun 2024 20:15:49 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 4B70940C1E;
	Fri,  7 Jun 2024 20:15:43 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 34E09163FA0; Fri,  7 Jun 2024 16:15:42 -0400 (EDT)
Date: Fri, 7 Jun 2024 16:15:42 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Chirag Shilwant <c-shilwant@ti.com>
Cc: meta-ti@lists.yoctoproject.org, Ryan Eatmon <reatmon@ti.com>,
	Gyan Gupta <g-gupta@ti.com>, Khasim <khasim@ti.com>,
	Praneeth <praneeth@ti.com>, Dhruva <d-gole@ti.com>
Subject: Re: [meta-ti][master/scarthgap][PATCH] conf: machine: Switch
 beagleplay to TI baseline by default
Message-ID: <20240607201542.GU21287@denix.org>
References: <20240606060555.1544271-1-c-shilwant@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240606060555.1544271-1-c-shilwant@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 07 Jun 2024 20:15:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17713

On Thu, Jun 06, 2024 at 11:35:55AM +0530, Chirag Shilwant wrote:
> - From LTS scarthgap, the beagleplay yocto machine will by
> default build with TI baseline (i.e kernel 6.6 & U-Boot 2024.04 as of today).
> Hence, remove all the references of bb.org from machine configuration file.
> 
> - Users can still build with Beagle's baseline (i.e. linux-bb.org & u-boot-bb.org)
> by adding the following in their local.conf,
> 
> ```
>    PREFERRED_PROVIDER_virtual/bootloader = "u-boot-bb.org"
>    PREFERRED_PROVIDER_u-boot = "u-boot-bb.org"
>    PREFERRED_PROVIDER_virtual/kernel = "linux-bb.org"
> ```

This won't work as expected, as it can be seen in the code that defconfigs are 
different and there are other differences between 6.1 and 6.6 LTSs...


> Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
> ---
>  meta-ti-bsp/conf/machine/beagleplay-k3r5.conf | 10 +---------
>  meta-ti-bsp/conf/machine/beagleplay.conf      | 12 +++---------
>  2 files changed, 4 insertions(+), 18 deletions(-)
> 
> diff --git a/meta-ti-bsp/conf/machine/beagleplay-k3r5.conf b/meta-ti-bsp/conf/machine/beagleplay-k3r5.conf
> index 601cbbf7..b597c702 100644
> --- a/meta-ti-bsp/conf/machine/beagleplay-k3r5.conf
> +++ b/meta-ti-bsp/conf/machine/beagleplay-k3r5.conf
> @@ -4,16 +4,8 @@
>  
>  require conf/machine/include/k3r5.inc
>  
> -PREFERRED_PROVIDER_virtual/bootloader = "u-boot-bb.org"
> -PREFERRED_PROVIDER_u-boot = "u-boot-bb.org"
> -
>  SYSFW_SOC = "am62x"
>  SYSFW_CONFIG = "evm"
>  SYSFW_SUFFIX = "gp"
>  
> -UBOOT_MACHINE = "am62x_evm_r5_defconfig"
> -
> -# UBOOT_CONFIG_FRAGMENTS holds the list of u-boot config fragments which has to be build
> -# along with the base defconfig mentioned in UBOOT_MACHINE. Refer u-boot-mergeconfig.inc
> -# under meta-ti-bsp/recipes-bsp/u-boot/ for more details.
> -UBOOT_CONFIG_FRAGMENTS = "am625_beagleplay_r5.config"
> +UBOOT_MACHINE = "am62x_beagleplay_r5_defconfig"
> diff --git a/meta-ti-bsp/conf/machine/beagleplay.conf b/meta-ti-bsp/conf/machine/beagleplay.conf
> index 65c14333..1420d439 100644
> --- a/meta-ti-bsp/conf/machine/beagleplay.conf
> +++ b/meta-ti-bsp/conf/machine/beagleplay.conf
> @@ -2,7 +2,6 @@
>  #@NAME: BeaglePlay (A53)
>  #@DESCRIPTION: Machine configuration for the BeaglePlay board (A53 core)
>  
> -require conf/machine//include/beagle.inc
>  require conf/machine/include/k3.inc
>  SOC_FAMILY:append = ":am62xx"
>  
> @@ -18,15 +17,10 @@ TFA_K3_SYSTEM_SUSPEND = "1"
>  
>  OPTEEMACHINE = "k3-am62x"
>  
> -UBOOT_MACHINE = "am62x_evm_a53_defconfig"
> +SPL_BINARY = "tispl.bin_unsigned"
> +SPL_BINARYNAME = "tispl.bin"
>  
> -# UBOOT_CONFIG_FRAGMENTS holds the list of u-boot config fragments which has to be build
> -# along with the base defconfig mentioned in UBOOT_MACHINE. Refer u-boot-mergeconfig.inc
> -# under meta-ti-bsp/recipes-bsp/u-boot/ for more details.
> -UBOOT_CONFIG_FRAGMENTS = "am625_beagleplay_a53.config"
> -
> -PREFERRED_PROVIDER_virtual/bootloader = "u-boot-bb.org"
> -PREFERRED_PROVIDER_u-boot = "u-boot-bb.org"
> +UBOOT_MACHINE = "am62x_beagleplay_a53_defconfig"
>  
>  KERNEL_DEVICETREE_PREFIX = " \
>      ti/k3-am625 \
> -- 
> 2.34.1
> 

