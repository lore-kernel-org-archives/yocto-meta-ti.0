Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E35D0C369AB
	for <webhook@archiver.kernel.org>; Wed, 16 Apr 2025 00:13:49 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.8452.1744762429105555377
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 15 Apr 2025 17:13:49 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 2E71240C61;
	Wed, 16 Apr 2025 00:13:48 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k7pNISSrbzU4; Wed, 16 Apr 2025 00:13:48 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id EF70140A46;
	Wed, 16 Apr 2025 00:13:45 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id A85421662FD; Tue, 15 Apr 2025 20:13:45 -0400 (EDT)
Date: Tue, 15 Apr 2025 20:13:45 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: anshuld@ti.com
Cc: meta-ti@lists.yoctoproject.org, vigneshr@ti.com
Subject: Re: [meta-ti] [master/scarthgap][PATCH v1 2/3] bsp: conf: machine:
 add ti-falcon.inc
Message-ID: <20250416001345.GT13634@denix.org>
References: <20250415093645.435281-1-anshuld@ti.com>
 <20250415093645.435281-2-anshuld@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415093645.435281-2-anshuld@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 16 Apr 2025 00:13:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18473

On Tue, Apr 15, 2025 at 03:06:43PM +0530, Anshul Dalal via lists.yoctoproject.org wrote:
> ti-falcon.inc configures the following things for enabling falcon boot:
> 
> 1. Change fitImage class to kernel-fitimage-legacyhs
> 2. Update kernel and dtb address for falcon boot
> 3. Disable kernel compression
> 
> Signed-off-by: Anshul Dalal <anshuld@ti.com>
> ---
>  meta-ti-bsp/conf/machine/include/k3.inc        | 4 ++++
>  meta-ti-bsp/conf/machine/include/ti-falcon.inc | 5 +++++
>  2 files changed, 9 insertions(+)
>  create mode 100644 meta-ti-bsp/conf/machine/include/ti-falcon.inc
> 
> diff --git a/meta-ti-bsp/conf/machine/include/k3.inc b/meta-ti-bsp/conf/machine/include/k3.inc
> index ea6a5028..329ac037 100644
> --- a/meta-ti-bsp/conf/machine/include/k3.inc
> +++ b/meta-ti-bsp/conf/machine/include/k3.inc
> @@ -56,3 +56,7 @@ TI_WKS_BOOTLOADER_APPEND ?= ""
>  do_image_wic[depends] += "virtual/bootloader:do_deploy"
>  
>  SERIAL_CONSOLES = "115200;ttyS0 115200;ttyS2"
> +
> +FALCON_INCLUDE:ti-falcon = "conf/machine/include/ti-falcon.inc"

Where and how ti-falcon override is being defined/set?


> +require ${FALCON_INCLUDE}
> diff --git a/meta-ti-bsp/conf/machine/include/ti-falcon.inc b/meta-ti-bsp/conf/machine/include/ti-falcon.inc
> new file mode 100644
> index 00000000..b571c04d
> --- /dev/null
> +++ b/meta-ti-bsp/conf/machine/include/ti-falcon.inc
> @@ -0,0 +1,5 @@
> +KERNEL_CLASSES:remove = "kernel-fitimage"
> +KERNEL_CLASSES += "kernel-fitimage-legacyhs"
> +UBOOT_DTB_LOADADDRESS = "0x82000000"
> +UBOOT_LOADADDRESS = "0x82200000"
> +FIT_KERNEL_COMP_ALG = "none"

