Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14F69C25B46
	for <webhook@archiver.kernel.org>; Mon, 23 Oct 2023 17:02:33 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.126449.1698080549186688040
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 23 Oct 2023 10:02:29 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8021340C06;
	Mon, 23 Oct 2023 17:02:28 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j6oJmluPDy-N; Mon, 23 Oct 2023 17:02:28 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id F3C7040BD4;
	Mon, 23 Oct 2023 17:02:24 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 75365163D10; Mon, 23 Oct 2023 13:02:24 -0400 (EDT)
Date: Mon, 23 Oct 2023 13:02:24 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master][PATCH] linux-bb.org: Remove unneeded patches
Message-ID: <20231023170224.GT2408@denix.org>
References: <20231023155107.12518-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231023155107.12518-1-reatmon@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 23 Oct 2023 17:02:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17173

On Mon, Oct 23, 2023 at 10:51:07AM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
> With the move to the 6.1 kernel, we no longer need any of the 5.10 based
> patches.

Yeah, I was running master builds over the weekend and noticed master had 
those extra gcc13 patches that kirkstone didn't have... Thanks for the fix.


> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>  meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb b/meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb
> index a416adcb..4b921919 100644
> --- a/meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb
> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb
> @@ -31,11 +31,6 @@ BRANCH:aarch64 = "v6.1.46-ti-arm64-r9"
>  
>  SRC_URI = "git://github.com/beagleboard/linux.git;protocol=https;branch=${BRANCH} \
>             file://defconfig \
> -           file://init_disassemble_info-signature-changes-causes-compile-failures.patch \
> -           file://0001-gcc-plugins-Fix-build-for-upcoming-GCC-release.patch \
> -           file://0001-ata-ahci-fix-enum-constants-for-gcc-13.patch \
> -           file://0001-blk-iocost-avoid-64-bit-division-in-ioc_timer_fn.patch \
> -           file://0001-block-blk-iocost-gcc13-keep-large-values-in-a-new-en.patch \
>  "
>  
>  FILES:${KERNEL_PACKAGE_NAME}-devicetree += " \
> -- 
> 2.17.1

