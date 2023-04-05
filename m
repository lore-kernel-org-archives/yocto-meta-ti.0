Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49CDDC7619A
	for <webhook@archiver.kernel.org>; Wed,  5 Apr 2023 19:08:10 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.139579.1680721682047136055
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 05 Apr 2023 12:08:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 5FEF940C3A;
	Wed,  5 Apr 2023 19:08:01 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lj94S8spm8Rz; Wed,  5 Apr 2023 19:08:01 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 1345B406B5;
	Wed,  5 Apr 2023 19:07:58 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id D9B331637F9; Wed,  5 Apr 2023 15:07:21 -0400 (EDT)
Date: Wed, 5 Apr 2023 15:07:21 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: afd@ti.com
Cc: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master/kirkstone][PATCH 4/4] linux-ti-next: Remove
 unneeded do_compile append
Message-ID: <20230405190721.GH9226@denix.org>
References: <20230405184714.26036-1-afd@ti.com>
 <20230405184714.26036-4-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230405184714.26036-4-afd@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 05 Apr 2023 19:08:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16299

On Wed, Apr 05, 2023 at 01:47:14PM -0500, Andrew Davis via lists.yoctoproject.org wrote:
> Looks to be a leftover copy/paste error from when we did more in this
> append for other kernel build types. Not needed here so remove.

It isn't a copy/paste error - it used to build kernel DTBs prior to 
KERNEL_DEVICETREE getting populated with the list of built .dtb/.dtbo 
files. Now KERNEL_DEVICETREE contains a preset of upstream DTBs and 
the code can be removed, true.


> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
>  meta-ti-bsp/recipes-kernel/linux/linux-ti-next_git.bb | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-next_git.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-next_git.bb
> index 62831c9c..1e86ed97 100644
> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-next_git.bb
> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-next_git.bb
> @@ -23,7 +23,3 @@ DEFCONFIG_NAME = "multi_v7_defconfig"
>  DEFCONFIG_NAME:omapl138 = "davinci_all_defconfig"
>  DEFCONFIG_NAME:k3 = "defconfig"
>  KERNEL_CONFIG_COMMAND = "oe_runmake -C ${S} O=${B} ${DEFCONFIG_NAME}"
> -
> -kernel_do_compile:append() {
> -	oe_runmake dtbs CC="${KERNEL_CC} $cc_extra " LD="${KERNEL_LD}" ${KERNEL_EXTRA_ARGS}
> -}
> -- 
> 2.39.2

