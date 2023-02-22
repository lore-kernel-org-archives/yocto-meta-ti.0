Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 620B5C636D6
	for <webhook@archiver.kernel.org>; Wed, 22 Feb 2023 19:41:08 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.2918.1677094866932126237
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 22 Feb 2023 11:41:07 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 5C83340C2E;
	Wed, 22 Feb 2023 19:41:06 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uIyd9heK7sNo; Wed, 22 Feb 2023 19:41:06 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 3853340AC9;
	Wed, 22 Feb 2023 19:41:04 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 7176E163764; Wed, 22 Feb 2023 14:40:39 -0500 (EST)
Date: Wed, 22 Feb 2023 14:40:39 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: afd@ti.com
Cc: Ryan Eatmon <reatmon@ti.com>, meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master/kirkstone][PATCH v2 07/15] conf: machine: k3:
 Remove unneeded TI_SECURE_DEV_PKG_K3 assignments
Message-ID: <20230222194039.GY22689@denix.org>
References: <20230215193355.9676-1-afd@ti.com>
 <20230215193355.9676-8-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230215193355.9676-8-afd@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 22 Feb 2023 19:41:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15913

On Wed, Feb 15, 2023 at 01:33:47PM -0600, Andrew Davis via lists.yoctoproject.org wrote:
> For K3 machines the SECDEV selection happens in the recipes that use it.
> This assignment is therefor no longer needed. Remove it.
> 
> Suggested-by: Ryan Eatmon <reatmon@ti.com>
> Signed-off-by: Andrew Davis <afd@ti.com>

Tested-by: Denys Dmytriyenko <denys@konsulko.com>


> ---
>  meta-ti-bsp/classes/kernel-fitimage-legacyhs.bbclass | 4 ++--
>  meta-ti-bsp/conf/machine/am335x-hs-evm.conf          | 2 --
>  meta-ti-bsp/conf/machine/am437x-hs-evm.conf          | 2 --
>  meta-ti-bsp/conf/machine/am57xx-hs-evm.conf          | 2 --
>  meta-ti-bsp/conf/machine/beaglebone-ai64-k3r5.conf   | 2 --
>  meta-ti-bsp/conf/machine/dra7xx-hs-evm.conf          | 2 --
>  meta-ti-bsp/conf/machine/include/k3.inc              | 2 --
>  meta-ti-bsp/conf/machine/include/k3r5.inc            | 2 --
>  8 files changed, 2 insertions(+), 16 deletions(-)
> 
> diff --git a/meta-ti-bsp/classes/kernel-fitimage-legacyhs.bbclass b/meta-ti-bsp/classes/kernel-fitimage-legacyhs.bbclass
> index 69fa0ed2..5e1fa56a 100644
> --- a/meta-ti-bsp/classes/kernel-fitimage-legacyhs.bbclass
> +++ b/meta-ti-bsp/classes/kernel-fitimage-legacyhs.bbclass
> @@ -1,4 +1,4 @@
> -inherit kernel-uboot uboot-sign-legacyhs
> +inherit ti-secdev kernel-uboot uboot-sign-legacyhs
>  
>  FITIMAGE_HASH_ALGO ?= "sha1"
>  FITIMAGE_PACK_TEE ?= "0"
> @@ -51,7 +51,7 @@ python __anonymous () {
>  UBOOT_MKIMAGE_DTCOPTS ??= ""
>  
>  fitimage_ti_secure() {
> -	if test -n "${TI_SECURE_DEV_PKG}"; then
> +	if test -f "${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh"; then
>  		export TI_SECURE_DEV_PKG=${TI_SECURE_DEV_PKG}
>  		${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh $1 $2
>  	else
> diff --git a/meta-ti-bsp/conf/machine/am335x-hs-evm.conf b/meta-ti-bsp/conf/machine/am335x-hs-evm.conf
> index 670a584c..ca102961 100644
> --- a/meta-ti-bsp/conf/machine/am335x-hs-evm.conf
> +++ b/meta-ti-bsp/conf/machine/am335x-hs-evm.conf
> @@ -15,8 +15,6 @@ UBOOT_LOADADDRESS = "0x82000000"
>  UBOOT_RD_LOADADDRESS = "0x84000000"
>  UBOOT_RD_ENTRYPOINT = "0x84000000"
>  
> -TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_CAT}/am3x"
> -
>  # FIT image for legacy secure devices
>  KERNEL_CLASSES += " kernel-fitimage-legacyhs"
>  KERNEL_IMAGETYPES += " fitImage"
> diff --git a/meta-ti-bsp/conf/machine/am437x-hs-evm.conf b/meta-ti-bsp/conf/machine/am437x-hs-evm.conf
> index bcea9acb..632b4995 100644
> --- a/meta-ti-bsp/conf/machine/am437x-hs-evm.conf
> +++ b/meta-ti-bsp/conf/machine/am437x-hs-evm.conf
> @@ -11,8 +11,6 @@ UBOOT_LOADADDRESS = "0x82000000"
>  UBOOT_RD_LOADADDRESS = "0x84000000"
>  UBOOT_RD_ENTRYPOINT = "0x84000000"
>  
> -TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_CAT}/am4x"
> -
>  OPTEEMACHINE = "ti-am43xx"
>  OPTEEFLAVOR = "am43xx"
>  
> diff --git a/meta-ti-bsp/conf/machine/am57xx-hs-evm.conf b/meta-ti-bsp/conf/machine/am57xx-hs-evm.conf
> index 0f157829..4f36a847 100644
> --- a/meta-ti-bsp/conf/machine/am57xx-hs-evm.conf
> +++ b/meta-ti-bsp/conf/machine/am57xx-hs-evm.conf
> @@ -11,8 +11,6 @@ UBOOT_LOADADDRESS = "0x82000000"
>  UBOOT_RD_LOADADDRESS = "0x84000000"
>  UBOOT_RD_ENTRYPOINT = "0x84000000"
>  
> -TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_AUTO}/am5x"
> -
>  OPTEEMACHINE = "ti-am57xx"
>  OPTEEFLAVOR = "am57xx"
>  OPTEEPAGER = "y"
> diff --git a/meta-ti-bsp/conf/machine/beaglebone-ai64-k3r5.conf b/meta-ti-bsp/conf/machine/beaglebone-ai64-k3r5.conf
> index 21b8702b..7c99b5d4 100644
> --- a/meta-ti-bsp/conf/machine/beaglebone-ai64-k3r5.conf
> +++ b/meta-ti-bsp/conf/machine/beaglebone-ai64-k3r5.conf
> @@ -18,5 +18,3 @@ UBOOT_IMAGE = "tiboot3-${MAINMACHINE}-${PV}-${PR}.${UBOOT_SUFFIX}"
>  UBOOT_SYMLINK = "tiboot3-${MAINMACHINE}.${UBOOT_SUFFIX}"
>  
>  UBOOT_MACHINE = "j721e_evm_r5_defconfig"
> -
> -TI_SECURE_DEV_PKG_K3 = "none"
> diff --git a/meta-ti-bsp/conf/machine/dra7xx-hs-evm.conf b/meta-ti-bsp/conf/machine/dra7xx-hs-evm.conf
> index 02eaf9ee..8e57a154 100644
> --- a/meta-ti-bsp/conf/machine/dra7xx-hs-evm.conf
> +++ b/meta-ti-bsp/conf/machine/dra7xx-hs-evm.conf
> @@ -11,8 +11,6 @@ UBOOT_LOADADDRESS = "0x82000000"
>  UBOOT_RD_LOADADDRESS = "0x84000000"
>  UBOOT_RD_ENTRYPOINT = "0x84000000"
>  
> -TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_AUTO}/dra7"
> -
>  OPTEEMACHINE = "ti-dra7xx"
>  OPTEEFLAVOR = "dra7xx"
>  OPTEEPAGER = "y"
> diff --git a/meta-ti-bsp/conf/machine/include/k3.inc b/meta-ti-bsp/conf/machine/include/k3.inc
> index a34b67ff..3b59645b 100644
> --- a/meta-ti-bsp/conf/machine/include/k3.inc
> +++ b/meta-ti-bsp/conf/machine/include/k3.inc
> @@ -48,5 +48,3 @@ MACHINE_FEATURES += "efi"
>  WKS_FILE ?= "sdimage-2part-efi.wks"
>  do_image_wic[depends] += "virtual/bootloader:do_deploy"
>  do_image_wic[mcdepends] += "mc::k3r5:ti-sci-fw:do_deploy"
> -
> -TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_K3}"
> diff --git a/meta-ti-bsp/conf/machine/include/k3r5.inc b/meta-ti-bsp/conf/machine/include/k3r5.inc
> index 31646f5a..d000404e 100644
> --- a/meta-ti-bsp/conf/machine/include/k3r5.inc
> +++ b/meta-ti-bsp/conf/machine/include/k3r5.inc
> @@ -22,5 +22,3 @@ UBOOT_SYMLINK = "u-boot-r5spl.${UBOOT_SUFFIX}"
>  
>  PACKAGECONFIG:pn-u-boot-ti-staging = ""
>  PACKAGECONFIG:pn-u-boot-ti-mainline = ""
> -
> -TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_K3}"
> -- 
> 2.39.1

