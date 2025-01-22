Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C8F6C02181
	for <webhook@archiver.kernel.org>; Wed, 22 Jan 2025 18:29:36 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.1238.1737570567209181842
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 22 Jan 2025 10:29:28 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 28C7940C83;
	Wed, 22 Jan 2025 18:29:26 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rfJhVqGGgDmO; Wed, 22 Jan 2025 18:29:26 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E3F6140A46;
	Wed, 22 Jan 2025 18:29:22 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 532E716415C; Wed, 22 Jan 2025 13:29:22 -0500 (EST)
Date: Wed, 22 Jan 2025 13:29:22 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master/scarthgap][PATCH v2 1/2] conf: machine:
 beagleplay*: Update defaults to mainline
Message-ID: <20250122182922.GQ21836@denix.org>
References: <20250122170732.20970-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250122170732.20970-1-reatmon@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 22 Jan 2025 18:29:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18218

On Wed, Jan 22, 2025 at 11:07:31AM -0600, Ryan Eatmon via lists.yoctoproject.org wrote:
> The defaults for UBOOT_MACHINE and SPL_BINARY are now aligned with the
> mainline values and new ti-6_1 values for the previous defaults were
> created to capture those.  Also updated the meta-beagle beagleplay since
> it inherits the beagleplay-ti settings.

I have already sent my Tested-by for v1 - do I need to re-test v2 here? Are 
there any other changes besides the typo fix in the second patch?


> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>  meta-beagle/conf/machine/beagleplay-k3r5.conf    | 2 +-
>  meta-beagle/conf/machine/beagleplay.conf         | 5 +----
>  meta-ti-bsp/conf/machine/beagleplay-ti-k3r5.conf | 6 ++----
>  meta-ti-bsp/conf/machine/beagleplay-ti.conf      | 9 +++------
>  4 files changed, 7 insertions(+), 15 deletions(-)
> 
> diff --git a/meta-beagle/conf/machine/beagleplay-k3r5.conf b/meta-beagle/conf/machine/beagleplay-k3r5.conf
> index 3e7f0c1b..f053c11e 100644
> --- a/meta-beagle/conf/machine/beagleplay-k3r5.conf
> +++ b/meta-beagle/conf/machine/beagleplay-k3r5.conf
> @@ -6,6 +6,6 @@ require conf/machine/beagleplay-ti-k3r5.conf
>  
>  require conf/machine/include/beagle-bsp.inc
>  
> -UBOOT_MACHINE:bsp-bb_org-6_6 = "am62x_beagleplay_r5_defconfig"
> +UBOOT_MACHINE:bsp-bb_org-6_1 = "am62x_evm_r5_defconfig"
>  
>  UBOOT_CONFIG_FRAGMENTS:bsp-bb_org-6_1 = "am625_beagleplay_r5.config"
> diff --git a/meta-beagle/conf/machine/beagleplay.conf b/meta-beagle/conf/machine/beagleplay.conf
> index b1a463e1..bc0de3f0 100644
> --- a/meta-beagle/conf/machine/beagleplay.conf
> +++ b/meta-beagle/conf/machine/beagleplay.conf
> @@ -6,13 +6,10 @@ require conf/machine/beagleplay-ti.conf
>  
>  require conf/machine/include/beagle-bsp.inc
>  
> -UBOOT_MACHINE:bsp-bb_org-6_6 = "am62x_beagleplay_a53_defconfig"
> +UBOOT_MACHINE:bsp-bb_org-6_1 = "am62x_evm_a53_defconfig"
>  
>  UBOOT_CONFIG_FRAGMENTS:bsp-bb_org-6_1 = "am625_beagleplay_a53.config"
>  
> -SPL_BINARY:bsp-bb_org-6_6 = "tispl.bin_unsigned"
> -SPL_BINARYNAME:bsp-bb_org-6_6 = "tispl.bin"
> -
>  KERNEL_DEVICETREE:append:bsp-bb_org-6_1 = " \
>  ti/k3-am625-beagleplay-csi2-ov5640.dtbo \
>  ti/k3-am625-beagleplay-csi2-tevi-ov5640.dtbo \
> diff --git a/meta-ti-bsp/conf/machine/beagleplay-ti-k3r5.conf b/meta-ti-bsp/conf/machine/beagleplay-ti-k3r5.conf
> index c27e0abc..72dc145b 100644
> --- a/meta-ti-bsp/conf/machine/beagleplay-ti-k3r5.conf
> +++ b/meta-ti-bsp/conf/machine/beagleplay-ti-k3r5.conf
> @@ -8,9 +8,7 @@ SYSFW_SOC = "am62x"
>  SYSFW_CONFIG = "evm"
>  SYSFW_SUFFIX = "gp"
>  
> -UBOOT_MACHINE = "am62x_evm_r5_defconfig"
> -UBOOT_MACHINE:bsp-ti-6_6 = "am62x_beagleplay_r5_defconfig"
> -UBOOT_MACHINE:bsp-ti-6_12 = "am62x_beagleplay_r5_defconfig"
> +UBOOT_MACHINE = "am62x_beagleplay_r5_defconfig"
> +UBOOT_MACHINE:bsp-ti-6_1 = "am62x_evm_r5_defconfig"
>  
>  UBOOT_CONFIG_FRAGMENTS:bsp-ti-6_1 = "am625_beagleplay_r5.config"
> -UBOOT_CONFIG_FRAGMENTS:bsp-mainline = "beagleplay_r5.config"
> diff --git a/meta-ti-bsp/conf/machine/beagleplay-ti.conf b/meta-ti-bsp/conf/machine/beagleplay-ti.conf
> index 68d6dced..3824d867 100644
> --- a/meta-ti-bsp/conf/machine/beagleplay-ti.conf
> +++ b/meta-ti-bsp/conf/machine/beagleplay-ti.conf
> @@ -19,15 +19,12 @@ TFA_K3_SYSTEM_SUSPEND = "1"
>  
>  OPTEEMACHINE = "k3-am62x"
>  
> -UBOOT_MACHINE = "am62x_evm_a53_defconfig"
> -UBOOT_MACHINE:bsp-ti-6_6 = "am62x_beagleplay_a53_defconfig"
> -UBOOT_MACHINE:bsp-ti-6_12 = "am62x_beagleplay_a53_defconfig"
> +UBOOT_MACHINE = "am62x_beagleplay_a53_defconfig"
> +UBOOT_MACHINE:bsp-ti-6_1 = "am62x_evm_a53_defconfig"
>  
>  UBOOT_CONFIG_FRAGMENTS:bsp-ti-6_1 = "am625_beagleplay_a53.config"
> -UBOOT_CONFIG_FRAGMENTS:bsp-mainline = "beagleplay_a53.config"
>  
> -SPL_BINARY:bsp-ti-6_6 = "tispl.bin_unsigned"
> -SPL_BINARYNAME:bsp-ti-6_6 = "tispl.bin"
> +SPL_BINARY = "tispl.bin_unsigned"
>  
>  KERNEL_DEVICETREE_PREFIX = " \
>      ti/k3-am625-beagle \
> -- 
> 2.17.1

