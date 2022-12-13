Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D7FDC4332F
	for <webhook@archiver.kernel.org>; Tue, 13 Dec 2022 21:06:50 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.85854.1670965602820402777
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 13 Dec 2022 13:06:43 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B6A1140C2B;
	Tue, 13 Dec 2022 21:06:41 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9VAkU3qooiSx; Tue, 13 Dec 2022 21:06:41 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 9173940A3F;
	Tue, 13 Dec 2022 21:06:38 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 735941636B0; Tue, 13 Dec 2022 16:06:28 -0500 (EST)
Date: Tue, 13 Dec 2022 16:06:28 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: meta-ti@lists.yoctoproject.org, ricardo@foundries.io,
	Jose Quaresma <jose.quaresma@foundries.io>
Subject: Re: [meta-ti][dunfell][PATCH 1/2] Revert "conf: machine: k3: Add
 fitImage to the default kernel image types"
Message-ID: <20221213210628.GN22689@denix.org>
References: <20221213183818.206660-1-jose.quaresma@foundries.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221213183818.206660-1-jose.quaresma@foundries.io>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 13 Dec 2022 21:06:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15468

On Tue, Dec 13, 2022 at 06:38:17PM +0000, Jose Quaresma wrote:
> This reverts commit e6deeba806d2145fa16b0b5f444f2985e63e6366.

NAK. There's a fix in kirkstone/master...


> Currently building with am62xx-evm/am64xx-evm machine fails with:
> 
> | make[1]: *** No rule to make target 'fitImage'.  Stop.
> | make: *** [/build/tmp/work-shared/am62xx-evm/kernel-source/Makefile:185: __sub-make] Error 2
> | ERROR: oe_runmake failed
> 
> Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> ---
>  conf/machine/include/k3.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/conf/machine/include/k3.inc b/conf/machine/include/k3.inc
> index 349f4fda..ef4f107f 100644
> --- a/conf/machine/include/k3.inc
> +++ b/conf/machine/include/k3.inc
> @@ -15,7 +15,7 @@ PREFERRED_PROVIDER_virtual/bootloader = "u-boot-ti-staging"
>  PREFERRED_PROVIDER_u-boot = "u-boot-ti-staging"
>  
>  KERNEL_IMAGETYPE = "Image"
> -KERNEL_IMAGETYPES = "Image fitImage"
> +KERNEL_IMAGETYPES = "Image"
>  
>  UBOOT_ARCH = "arm"
>  UBOOT_ENTRYPOINT = "0x80008000"
> -- 
> 2.38.2
> 

