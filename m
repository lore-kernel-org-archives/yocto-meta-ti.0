Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 872F4C433F5
	for <webhook@archiver.kernel.org>; Tue,  3 May 2022 16:07:05 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.1010.1651594022253106752
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 03 May 2022 09:07:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 51C8E40BE9;
	Tue,  3 May 2022 16:07:01 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Azd2iRpS5zfn; Tue,  3 May 2022 16:07:01 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 33B3C40A3D;
	Tue,  3 May 2022 16:06:59 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 42FEC174917; Tue,  3 May 2022 12:06:58 -0400 (EDT)
Date: Tue, 3 May 2022 12:06:58 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Praneeth Bajjuri <praneeth@ti.com>, meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master][PATCH] uio-module-drv-test: Fix build with
 clang
Message-ID: <20220503160658.GZ9834@denix.org>
References: <20220503160048.16789-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220503160048.16789-1-reatmon@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 03 May 2022 16:07:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14685

On Tue, May 03, 2022 at 11:00:48AM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
> Point to an updated SRCREV that fixes a compile error with the clang
> compiler.
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>

Reviewed-by: Denys Dmytriyenko <denys@konsulko.com>


> ---
>  meta-ti-bsp/recipes-bsp/uio-module-drv/uio-module-drv.inc | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/meta-ti-bsp/recipes-bsp/uio-module-drv/uio-module-drv.inc b/meta-ti-bsp/recipes-bsp/uio-module-drv/uio-module-drv.inc
> index 2c22e0cf..5b9ac50e 100644
> --- a/meta-ti-bsp/recipes-bsp/uio-module-drv/uio-module-drv.inc
> +++ b/meta-ti-bsp/recipes-bsp/uio-module-drv/uio-module-drv.inc
> @@ -2,10 +2,10 @@ LICENSE = "BSD-3-Clause"
>  LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2b7c96eb2aed7b0f6f922214dbde9016"
>  
>  BRANCH = "master"
> -# This corresponds to version 02.02.01.00
> -UIO_MODULE_DRV_SRCREV = "bda9260f2220840a60ec0fbc8011cbadf3cf1b91"
> +# This corresponds to version 02.03.01.00
> +UIO_MODULE_DRV_SRCREV = "78c535afe8f8cc0b715500a63eab0bc3606c0579"
>  
> -PV = "2.2.1.0+git${SRCPV}"
> +PV = "2.3.1.0+git${SRCPV}"
>  
>  UIO_MODULE_DRV_GIT_URI = "git://git.ti.com/keystone-linux/uio-module-drv.git"
>  UIO_MODULE_DRV_GIT_PROTOCOL = "git"
> -- 
> 2.17.1
> 

