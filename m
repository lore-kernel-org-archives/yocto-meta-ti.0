Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA205C369CA
	for <webhook@archiver.kernel.org>; Thu, 17 Apr 2025 18:07:39 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.15686.1744913257020093770
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 17 Apr 2025 11:07:37 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 3AB8E40C2C;
	Thu, 17 Apr 2025 18:07:36 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Szt44MVPdX1K; Thu, 17 Apr 2025 18:07:36 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 1065840BA7;
	Thu, 17 Apr 2025 18:07:34 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id C00EB1664E6; Thu, 17 Apr 2025 14:07:33 -0400 (EDT)
Date: Thu, 17 Apr 2025 14:07:33 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Chirag Shilwant <c-shilwant@ti.com>
Cc: meta-ti@lists.yoctoproject.org, Ryan Eatmon <reatmon@ti.com>
Subject: Re: [meta-ti][master/scarthgap][PATCH] recipes-bsp: u-boot: Remove
 do_install from bootsplash image
Message-ID: <20250417180733.GW13634@denix.org>
References: <20250417145131.3966302-1-c-shilwant@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417145131.3966302-1-c-shilwant@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 17 Apr 2025 18:07:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18484

Chirag,

The commit message below looks a bit confusing - can you please rephrase it?


On Thu, Apr 17, 2025 at 08:21:31PM +0530, Chirag Shilwant wrote:
> * U-Boot reads the bootsplash image file from the /boot (i.e vfat)
> partition

Well, vfat boot partition and /boot directory on the rootfs are 2 different 
things.


> & displays it during boot-up showcasing early splash screen
> support.
> 
> * There's no significance of having an additional do_install
> as the logo file need not be added in the rootfs/image.
> 
> * Fixes 277f04df4c94de44bcea95b46d59cf057f571e45 & 1fed958bfe8a8825996134f62097ac02206f43b2
> 
> Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
> ---
>  meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc | 10 ----------
>  1 file changed, 10 deletions(-)
> 
> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
> index 41d4abdd..6fe7ddf1 100644
> --- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
> +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
> @@ -353,21 +353,11 @@ uboot_deploy:append () {
>      fi
>  }
>  
> -do_install:append:am62xx() {
> -	install -d ${D}/boot
> -	install -m 0644 ${S}/tools/logos/ti_logo_414x97_32bpp.bmp.gz ${D}/boot
> -}
> -
>  do_deploy:append:am62xx() {
>  	install -d ${DEPLOYDIR}
>  	install -m 0644 ${S}/tools/logos/ti_logo_414x97_32bpp.bmp.gz ${DEPLOYDIR}
>  }
>  
> -do_install:append:am62pxx() {
> -	install -d ${D}/boot
> -	install -m 0644 ${S}/tools/logos/ti_logo_414x97_32bpp.bmp.gz ${D}/boot
> -}
> -
>  do_deploy:append:am62pxx() {
>  	install -d ${DEPLOYDIR}
>  	install -m 0644 ${S}/tools/logos/ti_logo_414x97_32bpp.bmp.gz ${DEPLOYDIR}
> -- 
> 2.34.1

