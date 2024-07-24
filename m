Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F96CC3DA61
	for <webhook@archiver.kernel.org>; Wed, 24 Jul 2024 21:35:42 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.22067.1721856932356675100
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 24 Jul 2024 14:35:32 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 437E740C56;
	Wed, 24 Jul 2024 21:35:31 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JtUBNtudJYbW; Wed, 24 Jul 2024 21:35:31 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 2983540301;
	Wed, 24 Jul 2024 21:35:30 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 54D38164000; Wed, 24 Jul 2024 17:35:29 -0400 (EDT)
Date: Wed, 24 Jul 2024 17:35:29 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master/scarthgap][PATCH v2] linux: Manage the kernel
 patches using the BSP system
Message-ID: <20240724213529.GT17572@denix.org>
References: <20240719151018.8521-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240719151018.8521-1-reatmon@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 24 Jul 2024 21:35:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17905

On Fri, Jul 19, 2024 at 10:10:18AM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
> Applying the patches to all kernels is not going to work.  Each kernel
> might need different patches to address reproducibility issues.

Can you also backport this to scarthgap, as these patches fon't apply cleanly 
to bb.org and currently break Beagle builds. Thanks.


> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
> v2: Fix BSP tag for bsp-ti-6_6
> 
>  meta-ti-bsp/recipes-kernel/linux/ti-kernel.inc | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/meta-ti-bsp/recipes-kernel/linux/ti-kernel.inc b/meta-ti-bsp/recipes-kernel/linux/ti-kernel.inc
> index f24fbe51..1831ba66 100644
> --- a/meta-ti-bsp/recipes-kernel/linux/ti-kernel.inc
> +++ b/meta-ti-bsp/recipes-kernel/linux/ti-kernel.inc
> @@ -13,8 +13,12 @@ EXTRA_DTC_ARGS += "${@get_extra_dtc_args(d)}"
>  KERNEL_DTBDEST = "${KERNEL_IMAGEDEST}/dtb"
>  KERNEL_DTBVENDORED = "1"
>  
> -SRC_URI:append = " \
> -file://0001-lib-build_OID_registry-fix-reproducibility-issues.patch \
> -file://0001-vt-conmakehash-improve-reproducibility.patch \
> -file://0001-pnmtologo-use-relocatable-file-name.patch \
> +KERNEL_PATCHES = ""
> +
> +KERNEL_PATCHES:bsp-ti-6_6 = " \
> +    file://0001-lib-build_OID_registry-fix-reproducibility-issues.patch \
> +    file://0001-vt-conmakehash-improve-reproducibility.patch \
> +    file://0001-pnmtologo-use-relocatable-file-name.patch \
>  "
> +
> +SRC_URI:append = " ${KERNEL_PATCHES} "
> -- 
> 2.17.1

