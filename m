Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60B46C4345F
	for <webhook@archiver.kernel.org>; Tue, 30 Apr 2024 20:47:43 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.27032.1714510055061881295
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 30 Apr 2024 13:47:35 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 14BEC40C21;
	Tue, 30 Apr 2024 20:47:34 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4xOaDDz8wpy2; Tue, 30 Apr 2024 20:47:34 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E993A40031;
	Tue, 30 Apr 2024 20:47:31 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id C91C2163F51; Tue, 30 Apr 2024 16:47:30 -0400 (EDT)
Date: Tue, 30 Apr 2024 16:47:30 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Praneeth Bajjuri <praneeth@ti.com>, meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master/scarthgap][PATCH v2] conf: machine: am69-sk:
 Create a new am69.inc file
Message-ID: <20240430204730.GQ28791@denix.org>
References: <20240430195811.2512-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240430195811.2512-1-reatmon@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 30 Apr 2024 20:47:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17615

On Tue, Apr 30, 2024 at 02:58:11PM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
> Reusing the j784s4.inc file presents problems as the am69-sk platform
> does not support GP.  So copy the j784s4.inc to am69.inc and update
> accordingly.

Any chance to get this as a diff against j784s4.inc to simplify the review? 
Maybe by playing with -C and -M options?


> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
> v2: Fix commit message.
> 
>  meta-ti-bsp/conf/machine/am69-sk.conf     |  2 +-
>  meta-ti-bsp/conf/machine/include/am69.inc | 19 +++++++++++++++++++
>  2 files changed, 20 insertions(+), 1 deletion(-)
>  create mode 100644 meta-ti-bsp/conf/machine/include/am69.inc
> 
> diff --git a/meta-ti-bsp/conf/machine/am69-sk.conf b/meta-ti-bsp/conf/machine/am69-sk.conf
> index 233a4618..6341a6fa 100644
> --- a/meta-ti-bsp/conf/machine/am69-sk.conf
> +++ b/meta-ti-bsp/conf/machine/am69-sk.conf
> @@ -2,7 +2,7 @@
>  #@NAME: AM69 SK
>  #@DESCRIPTION: Machine configuration for the TI AM69 SK
>  
> -require conf/machine/include/j784s4.inc
> +require conf/machine/include/am69.inc
>  
>  TFA_K3_USART = "0x8"
>  OPTEE_K3_USART = "0x8"
> diff --git a/meta-ti-bsp/conf/machine/include/am69.inc b/meta-ti-bsp/conf/machine/include/am69.inc
> new file mode 100644
> index 00000000..81be1397
> --- /dev/null
> +++ b/meta-ti-bsp/conf/machine/include/am69.inc
> @@ -0,0 +1,19 @@
> +require conf/machine/include/k3.inc
> +SOC_FAMILY:append = ":j784s4"
> +
> +MACHINE_FEATURES += "screen gpu"
> +
> +require conf/machine/include/mesa-pvr.inc
> +PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-img-rogue-driver"
> +
> +# Default tiboot3.bin on AM69 is for SR1.0 HS-FS
> +IMAGE_BOOT_FILES += "tiboot3-j784s4-hs-fs-evm.bin"
> +
> +# Since default tiboot3.bin on AM69 is for HS-FS, add a version for SR1.0 HS-SE
> +IMAGE_BOOT_FILES += "tiboot3-j784s4-hs-evm.bin"
> +
> +TFA_BOARD = "j784s4"
> +
> +OPTEEMACHINE = "k3-j784s4"
> +
> +MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "cadence-mhdp-fw cnm-wave-fw ti-eth-fw"
> -- 
> 2.17.1

