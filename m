Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3364BC7619A
	for <webhook@archiver.kernel.org>; Tue, 11 Apr 2023 22:00:24 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.29040.1681250419529585609
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 11 Apr 2023 15:00:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id DCD4940C90;
	Tue, 11 Apr 2023 22:00:18 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EOugPio_6TuO; Tue, 11 Apr 2023 22:00:18 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id AE5C740C13;
	Tue, 11 Apr 2023 22:00:15 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id EF24F163800; Tue, 11 Apr 2023 17:59:37 -0400 (EDT)
Date: Tue, 11 Apr 2023 17:59:37 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: afd@ti.com
Cc: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master/kirkstone][PATCH v3 3/6] linux-ti-mainline:
 Update to v6.2 mainline version
Message-ID: <20230411215937.GC9226@denix.org>
References: <20230411215243.18230-1-afd@ti.com>
 <20230411215243.18230-3-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230411215243.18230-3-afd@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 11 Apr 2023 22:00:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16369

On Tue, Apr 11, 2023 at 04:52:40PM -0500, Andrew Davis via lists.yoctoproject.org wrote:
> Signed-off-by: Andrew Davis <afd@ti.com>

Reviewed-by: Denys Dmytriyenko <denys@konsulko.com>


> ---
>  meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
> index 842864cd..dfa46f48 100644
> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
> @@ -15,9 +15,9 @@ KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT} \
>  
>  S = "${WORKDIR}/git"
>  
> -# 5.15 Mainline version
> -SRCREV = "8bb7eca972ad531c9b149c0a51ab43a417385813"
> -PV = "5.15+git${SRCPV}"
> +# 6.2 Mainline version
> +SRCREV = "c9c3395d5e3dcc6daee66c6908354d47bf98cb0c"
> +PV = "6.2+git${SRCPV}"
>  
>  # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
>  MACHINE_KERNEL_PR:append = "b"
> -- 
> 2.39.2

