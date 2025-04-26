Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B5E1C369CB
	for <webhook@archiver.kernel.org>; Sat, 26 Apr 2025 16:05:22 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.11652.1745683503769363007
 for <meta-ti@lists.yoctoproject.org>;
 Sat, 26 Apr 2025 09:05:04 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id D4B3E40A20;
	Sat, 26 Apr 2025 16:05:02 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EhWRa7G973uE; Sat, 26 Apr 2025 16:05:02 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 92AD2407E5;
	Sat, 26 Apr 2025 16:04:58 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id B3DD9166C8C; Sat, 26 Apr 2025 12:04:57 -0400 (EDT)
Date: Sat, 26 Apr 2025 12:04:57 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Chirag Shilwant <c-shilwant@ti.com>
Cc: meta-ti@lists.yoctoproject.org, Ryan Eatmon <reatmon@ti.com>,
	Andrew <afd@ti.com>, Neha <n-francis@ti.com>
Subject: Re: [meta-ti][master/scarthgap][PATCH] recipes-bsp: u-boot: Fix
 PACKAGECONFIG[dm] arguments
Message-ID: <20250426160457.GN13634@denix.org>
References: <20250425204857.3271868-1-c-shilwant@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425204857.3271868-1-c-shilwant@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sat, 26 Apr 2025 16:05:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18513

On Sat, Apr 26, 2025 at 02:18:57AM +0530, Chirag Shilwant wrote:
> * As observed in the u-boot makefile [0][1], the argument
> anticipated by u-boot binman is "TI_DM" instead of "DM".
> Hence, fix the same in meta-ti-bsp.

Was it always "TI_DM", or was it "DM" initially in TI U-boot and later got 
changed tp "TI_DM" in upstream?


> * The behavior went unnoticed until now because "ti-dm"
> was still being sourced from BINMAN_INDIRS, which referred
> to "ti-linux-firmware" and the PACKAGECONFIG[dm] feature
> was redundant.
> 
> [0]: https://github.com/u-boot/u-boot/blob/v2025.01/Makefile#L1408
> 
> [1]: https://git.ti.com/cgit/ti-u-boot/ti-u-boot/tree/Makefile?h=ti-u-boot-2025.01#n1409
> 
> Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
> ---
>  meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
> index 9a74b840..e337f84f 100644
> --- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
> +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
> @@ -63,7 +63,7 @@ PLAT_SFX:am62pxx = "am62pxx"
>  PACKAGECONFIG[ap-trusted-rom] = "BL1=${STAGING_DIR_HOST}/firmware/bl1.bin,,trusted-firmware-a"
>  PACKAGECONFIG[atf] = "BL31=${STAGING_DIR_HOST}/firmware/bl31.bin,,trusted-firmware-a"
>  PACKAGECONFIG[optee] = "TEE=${STAGING_DIR_HOST}${nonarch_base_libdir}/firmware/bl32.bin,,optee-os"
> -PACKAGECONFIG[dm] = "DM=${STAGING_DIR_HOST}${nonarch_base_libdir}/firmware/ti-dm/${PLAT_SFX}/${DM_FIRMWARE},,ti-dm-fw"
> +PACKAGECONFIG[dm] = "TI_DM=${STAGING_DIR_HOST}${nonarch_base_libdir}/firmware/ti-dm/${PLAT_SFX}/${DM_FIRMWARE},,ti-dm-fw"
>  
>  PACKAGECONFIG:append:aarch64 = " atf optee"
>  PACKAGECONFIG:append:j721e = " dm"
> -- 
> 2.34.1

