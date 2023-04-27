Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE6E1C7EE21
	for <webhook@archiver.kernel.org>; Thu, 27 Apr 2023 20:32:03 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.2940.1682627515393442768
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 27 Apr 2023 13:31:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9468F40C76;
	Thu, 27 Apr 2023 20:31:54 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id avz3uNbjdpni; Thu, 27 Apr 2023 20:31:54 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 478F440031;
	Thu, 27 Apr 2023 20:31:49 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 4968B163877; Thu, 27 Apr 2023 16:31:08 -0400 (EDT)
Date: Thu, 27 Apr 2023 16:31:08 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: afd@ti.com
Cc: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	Praneeth Bajjuri <praneeth@ti.com>,
	Neha Malcom Francis <n-francis@ti.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master/kirkstone][RFC 4/9] u-boot-bb.org: Remove
 this recipe
Message-ID: <20230427203108.GO9226@denix.org>
References: <20230425172345.12293-1-afd@ti.com>
 <20230425172345.12293-5-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230425172345.12293-5-afd@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 27 Apr 2023 20:32:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16443

On Tue, Apr 25, 2023 at 12:23:40PM -0500, Andrew Davis via lists.yoctoproject.org wrote:
> This will no longer build after we switch away from k3-image-gen. Remove
> this version until it can be rebased on the latest U-Boot with binman
> support.

> For now switch current users of this over to u-boot-ti v2021.01.

This comment is not very clear - aren't you also removing that here?

Would it be possible to preserve at least Beagle build flows intact? Can 
the existing ti-sci-fw recipe that uses k3-image-gen be kept for now 
alongside the new one, e.g. move it to ti-sci-fw-legacy or something?


> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
>  meta-ti-bsp/conf/machine/beagle-x15.conf      |  2 --
>  .../conf/machine/beaglebone-ai64-k3r5.conf    |  3 ---
>  meta-ti-bsp/conf/machine/beaglebone-ai64.conf |  2 --
>  meta-ti-bsp/conf/machine/beaglebone.conf      |  2 --
>  meta-ti-bsp/conf/machine/beagleplay-k3r5.conf |  3 ---
>  meta-ti-bsp/conf/machine/beagleplay.conf      |  2 --
>  .../recipes-bsp/u-boot/u-boot-bb.org_git.bb   | 24 -------------------
>  7 files changed, 38 deletions(-)
>  delete mode 100644 meta-ti-bsp/recipes-bsp/u-boot/u-boot-bb.org_git.bb
> 
> diff --git a/meta-ti-bsp/conf/machine/beagle-x15.conf b/meta-ti-bsp/conf/machine/beagle-x15.conf
> index fb52245b..be27705c 100644
> --- a/meta-ti-bsp/conf/machine/beagle-x15.conf
> +++ b/meta-ti-bsp/conf/machine/beagle-x15.conf
> @@ -5,8 +5,6 @@
>  require conf/machine/include/am57xx.inc
>  
>  PREFERRED_PROVIDER_virtual/kernel = "linux-bb.org"
> -PREFERRED_PROVIDER_virtual/bootloader = "u-boot-bb.org"
> -PREFERRED_PROVIDER_u-boot = "u-boot-bb.org"
>  
>  KERNEL_DEVICETREE_PREFIX = "am57xx-beagle-x15"
>  
> diff --git a/meta-ti-bsp/conf/machine/beaglebone-ai64-k3r5.conf b/meta-ti-bsp/conf/machine/beaglebone-ai64-k3r5.conf
> index 7c99b5d4..b893f380 100644
> --- a/meta-ti-bsp/conf/machine/beaglebone-ai64-k3r5.conf
> +++ b/meta-ti-bsp/conf/machine/beaglebone-ai64-k3r5.conf
> @@ -4,9 +4,6 @@
>  
>  require conf/machine/include/k3r5.inc
>  
> -PREFERRED_PROVIDER_virtual/bootloader = "u-boot-bb.org"
> -PREFERRED_PROVIDER_u-boot = "u-boot-bb.org"
> -
>  SYSFW_SOC = "j721e"
>  SYSFW_CONFIG = "evm"
>  SYSFW_SUFFIX = "gp"
> diff --git a/meta-ti-bsp/conf/machine/beaglebone-ai64.conf b/meta-ti-bsp/conf/machine/beaglebone-ai64.conf
> index 304cbb62..bd5f541f 100644
> --- a/meta-ti-bsp/conf/machine/beaglebone-ai64.conf
> +++ b/meta-ti-bsp/conf/machine/beaglebone-ai64.conf
> @@ -7,8 +7,6 @@ require conf/machine/include/j721e.inc
>  UBOOT_MACHINE = "j721e_evm_a72_config"
>  
>  PREFERRED_PROVIDER_virtual/kernel = "linux-bb.org"
> -PREFERRED_PROVIDER_virtual/bootloader = "u-boot-bb.org"
> -PREFERRED_PROVIDER_u-boot = "u-boot-bb.org"
>  
>  KERNEL_DEVICETREE = " \
>  ti/k3-j721e-beagleboneai64.dtb \
> diff --git a/meta-ti-bsp/conf/machine/beaglebone.conf b/meta-ti-bsp/conf/machine/beaglebone.conf
> index dceef1db..2d811d0d 100644
> --- a/meta-ti-bsp/conf/machine/beaglebone.conf
> +++ b/meta-ti-bsp/conf/machine/beaglebone.conf
> @@ -5,8 +5,6 @@
>  require conf/machine/include/ti33x.inc
>  
>  PREFERRED_PROVIDER_virtual/kernel = "linux-bb.org"
> -PREFERRED_PROVIDER_virtual/bootloader = "u-boot-bb.org"
> -PREFERRED_PROVIDER_u-boot = "u-boot-bb.org"
>  
>  KERNEL_DEVICETREE_PREFIX = "am335x-bone"
>  
> diff --git a/meta-ti-bsp/conf/machine/beagleplay-k3r5.conf b/meta-ti-bsp/conf/machine/beagleplay-k3r5.conf
> index c40615c9..f8f08d63 100644
> --- a/meta-ti-bsp/conf/machine/beagleplay-k3r5.conf
> +++ b/meta-ti-bsp/conf/machine/beagleplay-k3r5.conf
> @@ -4,9 +4,6 @@
>  
>  require conf/machine/include/k3r5.inc
>  
> -PREFERRED_PROVIDER_virtual/bootloader = "u-boot-bb.org"
> -PREFERRED_PROVIDER_u-boot = "u-boot-bb.org"
> -
>  SYSFW_SOC = "am62x"
>  SYSFW_CONFIG = "evm"
>  SYSFW_SUFFIX = "gp"
> diff --git a/meta-ti-bsp/conf/machine/beagleplay.conf b/meta-ti-bsp/conf/machine/beagleplay.conf
> index e8d25cd9..f4f6a49c 100644
> --- a/meta-ti-bsp/conf/machine/beagleplay.conf
> +++ b/meta-ti-bsp/conf/machine/beagleplay.conf
> @@ -20,8 +20,6 @@ OPTEEMACHINE = "k3-am62x"
>  UBOOT_MACHINE = "am62x_evm_a53_defconfig"
>  
>  PREFERRED_PROVIDER_virtual/kernel = "linux-bb.org"
> -PREFERRED_PROVIDER_virtual/bootloader = "u-boot-bb.org"
> -PREFERRED_PROVIDER_u-boot = "u-boot-bb.org"
>  
>  KERNEL_DEVICETREE = " \
>  ti/k3-am625-beagleplay.dtb \
> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-bb.org_git.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-bb.org_git.bb
> deleted file mode 100644
> index 4e4688aa..00000000
> --- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-bb.org_git.bb
> +++ /dev/null
> @@ -1,24 +0,0 @@
> -require u-boot-ti.inc
> -
> -SUMMARY = "BeagleBoard.org U-Boot"
> -
> -COMPATIBLE_MACHINE = "beagle.*"
> -
> -LIC_FILES_CHKSUM = "file://Licenses/README;md5=5a7450c57ffe5ae63fd732446b988025"
> -
> -PV = "2021.01"
> -
> -UBOOT_GIT_URI = "git://github.com/beagleboard/u-boot.git"
> -UBOOT_GIT_PROTOCOL = "https"
> -BRANCH = "v2021.01-ti-08.05.00.005-SDK-8.5"
> -SRCREV = "46ff4982b41067e5c93369bddd49b1541856d80b"
> -
> -BRANCH:beaglebone-ai64 = "v2021.01-ti-08.05.00.001"
> -BRANCH:beaglebone-ai64-k3r5 = "v2021.01-ti-08.05.00.001"
> -SRCREV:beaglebone-ai64 = "ea96725b5156135d5875415f75d2188f6f56622a"
> -SRCREV:beaglebone-ai64-k3r5 = "ea96725b5156135d5875415f75d2188f6f56622a"
> -
> -BRANCH:beagleplay = "v2021.01-ti-BeaglePlay-Release"
> -BRANCH:beagleplay-k3r5 = "v2021.01-ti-BeaglePlay-Release"
> -SRCREV:beagleplay = "f036fbdc25941d7585182d2552c767edb9b04114"
> -SRCREV:beagleplay-k3r5 = "f036fbdc25941d7585182d2552c767edb9b04114"
> -- 
> 2.39.2

