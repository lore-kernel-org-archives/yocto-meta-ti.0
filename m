Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 587D2C2BA15
	for <webhook@archiver.kernel.org>; Mon, 17 Jun 2024 15:44:27 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.59797.1718639062402159005
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 17 Jun 2024 08:44:23 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6FBC740C8E;
	Mon, 17 Jun 2024 15:44:21 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SbR_Pe5CK-c7; Mon, 17 Jun 2024 15:44:21 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 1BE0940023;
	Mon, 17 Jun 2024 15:44:17 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 55C1F163FAF; Mon, 17 Jun 2024 11:44:16 -0400 (EDT)
Date: Mon, 17 Jun 2024 11:44:16 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: c-shilwant@ti.com
Cc: meta-ti@lists.yoctoproject.org, Ryan Eatmon <reatmon@ti.com>,
	Gyan Gupta <g-gupta@ti.com>, Denys <denys@konsulko.com>
Subject: Re: [meta-ti][master/scarthgap][PATCH] conf: machine: Update
 am62xxsip-evm for multi-BSP support
Message-ID: <20240617154416.GA5475@denix.org>
References: <20240617083351.4120728-1-c-shilwant@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240617083351.4120728-1-c-shilwant@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 17 Jun 2024 15:44:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17755

On Mon, Jun 17, 2024 at 02:03:51PM +0530, Chirag Shilwant via lists.yoctoproject.org wrote:
> Update am62xxsip-evm machine configuration to support
> TI kernel 6.1 & ti-u-boot-2024.04

Should it be ti-u-boot-2023.04 here?

Otherwise looks good to me.

Do you know if there are any changes needed for the mainline U-boot? Or should 
it work with the same defconfigs as ti-u-boot-2024.04?


> Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
> ---
>  meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf | 4 ++++
>  meta-ti-bsp/conf/machine/am62xxsip-evm.conf      | 2 ++
>  2 files changed, 6 insertions(+)
> 
> diff --git a/meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf b/meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf
> index c35edc6e..55bc530b 100644
> --- a/meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf
> +++ b/meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf
> @@ -9,3 +9,7 @@ SYSFW_CONFIG = "evm"
>  SYSFW_SUFFIX = "hs-fs"
>  
>  UBOOT_MACHINE = "am62xsip_evm_r5_defconfig"
> +
> +UBOOT_MACHINE:bsp-ti-6_1 = "am62x_evm_r5_defconfig"
> +
> +UBOOT_CONFIG_FRAGMENTS:bsp-ti-6_1 = "am62xsip_sk_r5.config"
> diff --git a/meta-ti-bsp/conf/machine/am62xxsip-evm.conf b/meta-ti-bsp/conf/machine/am62xxsip-evm.conf
> index 38fe04c9..8104329e 100644
> --- a/meta-ti-bsp/conf/machine/am62xxsip-evm.conf
> +++ b/meta-ti-bsp/conf/machine/am62xxsip-evm.conf
> @@ -14,3 +14,5 @@ KERNEL_DEVICETREE = " \
>  "
>  
>  UBOOT_MACHINE = "am62xsip_evm_a53_defconfig"
> +
> +UBOOT_MACHINE:bsp-ti-6_1 = "am62x_evm_a53_defconfig"
> -- 
> 2.34.1

