Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25EAAC7619A
	for <webhook@archiver.kernel.org>; Wed,  5 Apr 2023 19:01:20 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.139579.1680721270018553112
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 05 Apr 2023 12:01:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 5724340C3A;
	Wed,  5 Apr 2023 19:01:09 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f9JS-4Tkustf; Wed,  5 Apr 2023 19:01:09 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 2AF6F406B5;
	Wed,  5 Apr 2023 19:01:06 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id EE4301637F9; Wed,  5 Apr 2023 15:00:29 -0400 (EDT)
Date: Wed, 5 Apr 2023 15:00:29 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: afd@ti.com
Cc: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master/kirkstone][PATCH 2/4] linux-ti-mainline:
 Update to v6.2 mainline version
Message-ID: <20230405190029.GG9226@denix.org>
References: <20230405184714.26036-1-afd@ti.com>
 <20230405184714.26036-2-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230405184714.26036-2-afd@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 05 Apr 2023 19:01:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16298

On Wed, Apr 05, 2023 at 01:47:12PM -0500, Andrew Davis via lists.yoctoproject.org wrote:
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
>  meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
> index 3f4b560d..eb8009df 100644
> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
> @@ -16,12 +16,10 @@ KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT} \
>  
>  S = "${WORKDIR}/git"
>  
> +# 6.2 Mainline version
>  BRANCH = "master"
> -TOOLS_BRANCH = "master"

But you haven't removed ti-upstream-tools from SRC_URI, which uses it...


> -
> -# 5.15 Mainline version
> -SRCREV = "8bb7eca972ad531c9b149c0a51ab43a417385813"
> -PV = "5.15+git${SRCPV}"
> +SRCREV = "c9c3395d5e3dcc6daee66c6908354d47bf98cb0c"
> +PV = "6.2+git${SRCPV}"
>  
>  # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
>  MACHINE_KERNEL_PR:append = "b"
> -- 
> 2.39.2

