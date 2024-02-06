Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8584C48260
	for <webhook@archiver.kernel.org>; Tue,  6 Feb 2024 00:28:11 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.10794.1707179285405818282
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 05 Feb 2024 16:28:06 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 0117640C61;
	Tue,  6 Feb 2024 00:28:04 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 78UHxDGlJFyA; Tue,  6 Feb 2024 00:28:03 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B6093400CF;
	Tue,  6 Feb 2024 00:27:59 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id A3624163DFE; Mon,  5 Feb 2024 19:27:58 -0500 (EST)
Date: Mon, 5 Feb 2024 19:27:57 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: rs@ti.com
Cc: detheridge@ti.com, reatmon@ti.com, denys@konsulko.com,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master][PATCH] cairo: remove cairo append and include
Message-ID: <20240206002757.GD15614@denix.org>
References: <20240206000254.2916314-1-rs@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240206000254.2916314-1-rs@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 06 Feb 2024 00:28:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17444

NAK

On Mon, Feb 05, 2024 at 06:02:54PM -0600, Randolph Sapp via lists.yoctoproject.org wrote:
> From: Randolph Sapp <rs@ti.com>
> 
> Cairo versions >= 1.17.8 dropped all GL render backends entirely,
> invalidating both the opengl and glesv2 PACKAGECONFIGS. As such this
> override is no longer necessary.
> 
> Signed-off-by: Randolph Sapp <rs@ti.com>
> ---
>  meta-ti-bsp/recipes-graphics/cairo/cairo_%.bbappend | 1 -
>  meta-ti-bsp/recipes-graphics/cairo/pvr-cairo.inc    | 5 -----
>  2 files changed, 6 deletions(-)
>  delete mode 100644 meta-ti-bsp/recipes-graphics/cairo/cairo_%.bbappend
>  delete mode 100644 meta-ti-bsp/recipes-graphics/cairo/pvr-cairo.inc
> 
> diff --git a/meta-ti-bsp/recipes-graphics/cairo/cairo_%.bbappend b/meta-ti-bsp/recipes-graphics/cairo/cairo_%.bbappend
> deleted file mode 100644
> index 459d8d09..00000000
> --- a/meta-ti-bsp/recipes-graphics/cairo/cairo_%.bbappend
> +++ /dev/null
> @@ -1 +0,0 @@
> -require ${@bb.utils.contains_any('PREFERRED_PROVIDER_virtual/gpudriver', 'ti-img-rogue-driver ti-sgx-ddk-km', 'pvr-cairo.inc', '', d)}
> diff --git a/meta-ti-bsp/recipes-graphics/cairo/pvr-cairo.inc b/meta-ti-bsp/recipes-graphics/cairo/pvr-cairo.inc
> deleted file mode 100644
> index b41f1a01..00000000
> --- a/meta-ti-bsp/recipes-graphics/cairo/pvr-cairo.inc
> +++ /dev/null
> @@ -1,5 +0,0 @@
> -# This is required since cairo expects the opengl distro feature to refer to
> -# the desktop version of OpenGL. Imagination drivers only provide OpenGLES.
> -
> -PACKAGECONFIG:remove = "opengl"
> -PACKAGECONFIG:append = " glesv2"
> -- 
> 2.43.0

