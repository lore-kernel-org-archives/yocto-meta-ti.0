Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD5FCF428F6
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 20:47:19 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5287.1776286032854119886
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 15 Apr 2026 13:47:13 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 03E0640C8C;
	Wed, 15 Apr 2026 20:47:12 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u6WTn8cHA51B; Wed, 15 Apr 2026 20:47:11 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B02C140B96;
	Wed, 15 Apr 2026 20:47:07 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id B070117BF73; Wed, 15 Apr 2026 16:47:06 -0400 (EDT)
Date: Wed, 15 Apr 2026 16:47:06 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: fra.schnyder@gmail.com
Cc: meta-ti@lists.yoctoproject.org,
	Franz Schnyder <franz.schnyder@toradex.com>,
	Ryan Eatmon <reatmon@ti.com>,
	Francesco Dolcini <francesco@dolcini.it>
Subject: Re: [meta-ti][master][PATCH v1] conf: machine: j784s4: Move
 ti-eth-fw-j784s4 to EVM conf
Message-ID: <20260415204706.GC4186@denix.org>
References: <20260415114107.1643556-1-fra.schnyder@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260415114107.1643556-1-fra.schnyder@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 15 Apr 2026 20:47:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19852

On Wed, Apr 15, 2026 at 01:41:04PM +0200, Franz Schnyder via lists.yoctoproject.org wrote:
> From: Franz Schnyder <franz.schnyder@toradex.com>
> 
> The `ti-eth-fw-j784s4` firmware is added in the generic J784s4 SoC
> include, which is therefore used for all the J784s4-based machines.
> That firmware seems to be developed specifically for the EVM, as it
> takes control of pins used for the Ethernet board setup on the EVM. On
> non-EVM boards, like the Aquila-AM69, those signals are used for other
> functions, so enabling the firmware in the SoC include is too broad
> and breaks functionality.
> 
> Move the machine-essential recommend from the SoC include
> to the EVM configuration.
> 
> Signed-off-by: Franz Schnyder <franz.schnyder@toradex.com>
> ---
>  meta-ti-bsp/conf/machine/include/j784s4.inc | 2 +-
>  meta-ti-bsp/conf/machine/j784s4-evm.conf    | 2 ++
>  2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-ti-bsp/conf/machine/include/j784s4.inc b/meta-ti-bsp/conf/machine/include/j784s4.inc
> index 4dc3a71b..e0ce81b5 100644
> --- a/meta-ti-bsp/conf/machine/include/j784s4.inc
> +++ b/meta-ti-bsp/conf/machine/include/j784s4.inc
> @@ -12,7 +12,7 @@ TFA_BOARD = "j784s4"
>  
>  OPTEEMACHINE = "k3-j784s4"
>  
> -MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "cadence-mhdp-fw cnm-wave-fw ti-eth-fw-j784s4"
> +MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "cadence-mhdp-fw cnm-wave-fw"
>  
>  TI_CORE_INITRAMFS_KERNEL_MODULES = "kernel-module-cdns-pltfrm kernel-module-ti-j721e-ufs"
>  TI_CORE_INITRAMFS_KERNEL_MODULES:bsp-ti-6_6 = ""
> diff --git a/meta-ti-bsp/conf/machine/j784s4-evm.conf b/meta-ti-bsp/conf/machine/j784s4-evm.conf
> index bf53b07c..f80e030f 100644
> --- a/meta-ti-bsp/conf/machine/j784s4-evm.conf
> +++ b/meta-ti-bsp/conf/machine/j784s4-evm.conf
> @@ -27,3 +27,5 @@ KERNEL_DEVICETREE = " \
>  "
>  
>  UBOOT_MACHINE = "j784s4_evm_a72_defconfig"
> +
> +MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS:append = " ti-eth-fw-j784s4"

Can this be done with += instead of :append?

