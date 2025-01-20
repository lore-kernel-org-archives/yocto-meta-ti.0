Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02D6EC02182
	for <webhook@archiver.kernel.org>; Mon, 20 Jan 2025 20:14:38 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.183.1737404076441077358
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 20 Jan 2025 12:14:36 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id DB0D040C2B;
	Mon, 20 Jan 2025 20:14:35 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ixtqYLQPJuOa; Mon, 20 Jan 2025 20:14:35 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B917940B13;
	Mon, 20 Jan 2025 20:14:33 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 84B6216415A; Mon, 20 Jan 2025 15:14:33 -0500 (EST)
Date: Mon, 20 Jan 2025 15:14:33 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Praneeth Bajjuri <praneeth@ti.com>, meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master/scarthgap][PATCH 2/2] conf: machine:
 beaglebone-ai64: Update SPLY_BINARY
Message-ID: <20250120201433.GJ21836@denix.org>
References: <20250113225222.13622-1-reatmon@ti.com>
 <20250113225222.13622-2-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250113225222.13622-2-reatmon@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 20 Jan 2025 20:14:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18209

On Mon, Jan 13, 2025 at 04:52:22PM -0600, Ryan Eatmon via lists.yoctoproject.org wrote:
> Rather than override the value for SPL_BINARY for all bsps, simply just
> set the value to the correct value.  This should be ok since all
> beaglebone-ai64 variations should use tispl.bin_unsigned.
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>

Tested-by: Denys Dmytriyenko <denys@konsulko.com>


> ---
>  meta-beagle/conf/machine/beaglebone-ai64.conf | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/meta-beagle/conf/machine/beaglebone-ai64.conf b/meta-beagle/conf/machine/beaglebone-ai64.conf
> index a521c8cf..ecd3a6e7 100644
> --- a/meta-beagle/conf/machine/beaglebone-ai64.conf
> +++ b/meta-beagle/conf/machine/beaglebone-ai64.conf
> @@ -18,11 +18,7 @@ UBOOT_CONFIG_FRAGMENTS:bsp-ti-6_1 = "j721e_beagleboneai64_a72.config"
>  UBOOT_MACHINE:bsp-bb_org-6_1 = "j721e_evm_a72_config"
>  UBOOT_CONFIG_FRAGMENTS:bsp-bb_org-6_1 = "j721e_beagleboneai64_a72.config"
>  
> -SPL_BINARY:bsp-ti-6_6 = "tispl.bin_unsigned"
> -SPL_BINARYNAME:bsp-ti-6_6 = "tispl.bin"
> -
> -SPL_BINARY:bsp-bb_org-6_6 = "tispl.bin_unsigned"
> -SPL_BINARYNAME:bsp-bb_org-6_6 = "tispl.bin"
> +SPL_BINARY = "tispl.bin_unsigned"
>  
>  KERNEL_DEVICETREE_PREFIX = " \
>      ti/k3-j721e \
> -- 
> 2.17.1

