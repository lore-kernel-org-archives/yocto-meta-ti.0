Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E4B1D64060
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 22:55:02 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.637.1765925699934458495
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 16 Dec 2025 14:55:00 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 31E1240C7B;
	Tue, 16 Dec 2025 22:54:59 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5pfFYB6RASKO; Tue, 16 Dec 2025 22:54:59 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E171040A30;
	Tue, 16 Dec 2025 22:54:55 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id EE965176B61; Tue, 16 Dec 2025 17:54:54 -0500 (EST)
Date: Tue, 16 Dec 2025 17:54:54 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Judith Mendez <jm@ti.com>
Cc: meta-ti@lists.yoctoproject.org, Ryan Eatmon <reatmon@ti.com>,
	Andrew Davis <afd@ti.com>
Subject: Re: [PATCH v2 1/2] meta-ti-bsp: Add support for BeagleBadge
Message-ID: <20251216225454.GX11121@denix.org>
References: <20251216221652.2231748-1-jm@ti.com>
 <20251216221652.2231748-2-jm@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251216221652.2231748-2-jm@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 16 Dec 2025 22:55:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19367

On Tue, Dec 16, 2025 at 04:16:51PM -0600, Judith Mendez wrote:
> Add support for the BeagleBadge which is an AM62L
> based device that requires new build configuration
> for U-Boot and TF-A sources.
> 
> Signed-off-by: Judith Mendez <jm@ti.com>
> ---
>  meta-ti-bsp/conf/machine/beaglebadge-ti.conf | 22 ++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>  create mode 100644 meta-ti-bsp/conf/machine/beaglebadge-ti.conf
> 
> diff --git a/meta-ti-bsp/conf/machine/beaglebadge-ti.conf b/meta-ti-bsp/conf/machine/beaglebadge-ti.conf
> new file mode 100644
> index 00000000..ff870c92
> --- /dev/null
> +++ b/meta-ti-bsp/conf/machine/beaglebadge-ti.conf
> @@ -0,0 +1,22 @@
> +#@TYPE: Machine
> +#@NAME: AM62L Badge
> +#@DESCRIPTION: Machine configuration for the TI AM62L Badge
> +
> +require conf/machine/include/am62lxx.inc
> +
> +IMAGE_FSTYPES += "ubifs ubi"
> +
> +MKUBIFS_ARGS ?= "-F -m 4096 -e 258048 -c 8500"
> +
> +UBINIZE_ARGS ?= "-m 4096 -p 256KiB -s 1024 -O 1024"
> +
> +KERNEL_DEVICETREE_PREFIX = " \
> +    ti/k3-am62l3-badge \
> +"
> +
> +KERNEL_DEVICETREE = ""
> +
> +UBOOT_MACHINE = "am62lx_badge_defconfig"
> +
> +TFA_BOARD = "am62l-badge"

So, everywhere here the platform is referred to as "AM62L Badge", including 
device tree, TFA and U-boot configs. Why is the machine config then called 
BeagleBadge? Does this come from the BeagleBoard.org?

-- 
Denys

