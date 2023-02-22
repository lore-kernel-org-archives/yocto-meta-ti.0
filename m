Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6041FC636D6
	for <webhook@archiver.kernel.org>; Wed, 22 Feb 2023 19:40:08 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.2807.1677094807205220702
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 22 Feb 2023 11:40:07 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9E92540C2E;
	Wed, 22 Feb 2023 19:40:06 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9BLHFWPETl9Q; Wed, 22 Feb 2023 19:40:06 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 7FEF540AC9;
	Wed, 22 Feb 2023 19:40:04 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id BE8C8163764; Wed, 22 Feb 2023 14:39:39 -0500 (EST)
Date: Wed, 22 Feb 2023 14:39:39 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: afd@ti.com
Cc: Ryan Eatmon <reatmon@ti.com>, meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master/kirkstone][PATCH v2 06/15] ti-sci-fw: Use new
 ti-secdev class to sign the images
Message-ID: <20230222193939.GX22689@denix.org>
References: <20230215193355.9676-1-afd@ti.com>
 <20230215193355.9676-7-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230215193355.9676-7-afd@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 22 Feb 2023 19:40:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15912

On Wed, Feb 15, 2023 at 01:33:46PM -0600, Andrew Davis via lists.yoctoproject.org wrote:
> Use the new ti-k3-secdev package to pull in the signing tools if they are
> not provided by the environment.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>

Tested-by: Denys Dmytriyenko <denys@konsulko.com>


> ---
>  meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> index 578f56b8..46d5111d 100644
> --- a/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> +++ b/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> @@ -1,7 +1,4 @@
>  require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
> -# set a default value for TI_K3_SECDEV_INSTALL_DIR
> -export TI_K3_SECDEV_INSTALL_DIR = "${STAGING_DIR_NATIVE}${datadir}/ti/ti-k3-secdev"
> -include recipes-ti/includes/ti-paths.inc
>  
>  DEPENDS = "openssl-native u-boot-mkimage-native dtc-native virtual/bootloader"
>  DEPENDS:remove:am65xx-evm-k3r5 = "virtual/bootloader"
> @@ -12,7 +9,6 @@ DEPENDS:remove:j721e-evm-k3r5 = "virtual/bootloader"
>  DEPENDS:remove:j721e-hs-evm-k3r5 = "virtual/bootloader"
>  DEPENDS:remove:j721e-hs-evm-k3r5-sr1-1 = "virtual/bootloader"
>  DEPENDS:remove:beaglebone-ai64-k3r5 = "virtual/bootloader"
> -DEPENDS:append = "${@ '' if d.getVar('TI_SECURE_DEV_PKG_K3') else ' ti-k3-secdev-native' }"
>  
>  CLEANBROKEN = "1"
>  PR = "${INC_PR}.2"
> @@ -23,8 +19,8 @@ COMPATIBLE_MACHINE:aarch64 = "null"
>  
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
> -TI_SECURE_DEV_PKG = "${@ d.getVar('TI_SECURE_DEV_PKG_K3') or d.getVar('TI_K3_SECDEV_INSTALL_DIR') }"
> -export TI_SECURE_DEV_PKG
> +# Use TI SECDEV for signing
> +inherit ti-secdev
>  
>  SYSFW_SOC ?= "unknown"
>  SYSFW_SUFFIX ?= "unknown"
> -- 
> 2.39.1

