Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCA92C54791
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 16:53:46 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.980.1710348824003322543
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 13 Mar 2024 09:53:44 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id C5F3C40C8C;
	Wed, 13 Mar 2024 16:53:42 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yVl-ISHTvh3Z; Wed, 13 Mar 2024 16:53:42 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 4054E40C85;
	Wed, 13 Mar 2024 16:53:38 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 2F444163ED4; Wed, 13 Mar 2024 12:53:38 -0400 (EDT)
Date: Wed, 13 Mar 2024 12:53:38 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master][PATCH] conf: machine: beagle: Centralize
 some settings for all beagle boards
Message-ID: <20240313165338.GM6072@denix.org>
References: <20240313162149.18098-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240313162149.18098-1-reatmon@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 13 Mar 2024 16:53:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17525

On Wed, Mar 13, 2024 at 11:21:49AM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
> We have a request to be able to override the beagle kernel set in
> PREFERRED_PROVIDER_virtual/kernel, but it is being absolutely set and
> not loosely set with ?=.

One can always use override - any override will do, e.g. machine:

PREFERRED_PROVIDER_virtual/kernel:beagleplay = "linux-custom"


>  Take this time to create a central include for
> all beagle boards like we have for the k3.inc.

Should virtual/bootloader and u-boot preferences be moved there as well?


> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>  meta-ti-bsp/conf/machine/beagle-x15.conf      | 3 +--
>  meta-ti-bsp/conf/machine/beaglebone-ai64.conf | 3 +--
>  meta-ti-bsp/conf/machine/beaglebone.conf      | 3 +--
>  meta-ti-bsp/conf/machine/beagleplay.conf      | 2 +-
>  meta-ti-bsp/conf/machine/include/beagle.inc   | 3 +++
>  5 files changed, 7 insertions(+), 7 deletions(-)
>  create mode 100644 meta-ti-bsp/conf/machine/include/beagle.inc
> 
> diff --git a/meta-ti-bsp/conf/machine/beagle-x15.conf b/meta-ti-bsp/conf/machine/beagle-x15.conf
> index d368fe1a..6fc7957c 100644
> --- a/meta-ti-bsp/conf/machine/beagle-x15.conf
> +++ b/meta-ti-bsp/conf/machine/beagle-x15.conf
> @@ -2,10 +2,9 @@
>  #@NAME: BeagleBoard X15
>  #@DESCRIPTION: Machine configuration for the BeagleBoard X15
>  
> +require conf/machine/include/beagle.inc
>  require conf/machine/include/am57xx.inc
>  
> -PREFERRED_PROVIDER_virtual/kernel = "linux-bb.org"
> -
>  KERNEL_DEVICETREE_PREFIX = "am57xx-beagle-x15"
>  
>  KERNEL_DEVICETREE = " \
> diff --git a/meta-ti-bsp/conf/machine/beaglebone-ai64.conf b/meta-ti-bsp/conf/machine/beaglebone-ai64.conf
> index a19a3e29..8ec52bba 100644
> --- a/meta-ti-bsp/conf/machine/beaglebone-ai64.conf
> +++ b/meta-ti-bsp/conf/machine/beaglebone-ai64.conf
> @@ -2,6 +2,7 @@
>  #@NAME: BeagleBone AI-64 (A72)
>  #@DESCRIPTION: Machine configuration for the BeagleBone AI-64 board (A72 core)
>  
> +require conf/machine/include/beagle.inc
>  require conf/machine/include/j721e.inc
>  
>  UBOOT_MACHINE = "j721e_evm_a72_config"
> @@ -12,8 +13,6 @@ UBOOT_MACHINE = "j721e_evm_a72_config"
>  # under meta-ti-bsp/recipes-bsp/u-boot/ for more details.
>  UBOOT_CONFIG_FRAGMENTS = "j721e_beagleboneai64_a72.config"
>  
> -PREFERRED_PROVIDER_virtual/kernel = "linux-bb.org"
> -
>  KERNEL_DEVICETREE = " \
>  ti/k3-j721e-beagleboneai64.dtb \
>  ti/k3-j721e-common-proc-board.dtb \
> diff --git a/meta-ti-bsp/conf/machine/beaglebone.conf b/meta-ti-bsp/conf/machine/beaglebone.conf
> index 7f78b297..8b8b9d29 100644
> --- a/meta-ti-bsp/conf/machine/beaglebone.conf
> +++ b/meta-ti-bsp/conf/machine/beaglebone.conf
> @@ -2,10 +2,9 @@
>  #@NAME: BeagleBone machine
>  #@DESCRIPTION: Machine configuration for the http://beagleboard.org/bone board
>  
> +require conf/machine/include/beagle.inc
>  require conf/machine/include/ti33x.inc
>  
> -PREFERRED_PROVIDER_virtual/kernel = "linux-bb.org"
> -
>  KERNEL_DEVICETREE_PREFIX = "am335x-bone"
>  
>  KERNEL_DEVICETREE = " \
> diff --git a/meta-ti-bsp/conf/machine/beagleplay.conf b/meta-ti-bsp/conf/machine/beagleplay.conf
> index 9f926b86..75e62afd 100644
> --- a/meta-ti-bsp/conf/machine/beagleplay.conf
> +++ b/meta-ti-bsp/conf/machine/beagleplay.conf
> @@ -2,6 +2,7 @@
>  #@NAME: BeaglePlay (A53)
>  #@DESCRIPTION: Machine configuration for the BeaglePlay board (A53 core)
>  
> +require conf/machine//include/beagle.inc
>  require conf/machine/include/k3.inc
>  SOC_FAMILY:append = ":am62xx"
>  
> @@ -24,7 +25,6 @@ UBOOT_MACHINE = "am62x_evm_a53_defconfig"
>  # under meta-ti-bsp/recipes-bsp/u-boot/ for more details.
>  UBOOT_CONFIG_FRAGMENTS = "am625_beagleplay_a53.config"
>  
> -PREFERRED_PROVIDER_virtual/kernel = "linux-bb.org"
>  PREFERRED_PROVIDER_virtual/bootloader = "u-boot-bb.org"
>  PREFERRED_PROVIDER_u-boot = "u-boot-bb.org"
>  
> diff --git a/meta-ti-bsp/conf/machine/include/beagle.inc b/meta-ti-bsp/conf/machine/include/beagle.inc
> new file mode 100644
> index 00000000..27e3298d
> --- /dev/null
> +++ b/meta-ti-bsp/conf/machine/include/beagle.inc
> @@ -0,0 +1,3 @@
> +
> +PREFERRED_PROVIDER_virtual/kernel ?= "linux-bb.org"
> +
> -- 
> 2.17.1

