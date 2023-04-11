Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34E15C76196
	for <webhook@archiver.kernel.org>; Tue, 11 Apr 2023 22:01:34 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.28870.1681250483959424505
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 11 Apr 2023 15:01:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 5286F40C90;
	Tue, 11 Apr 2023 22:01:23 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vNPwd4lh9iTD; Tue, 11 Apr 2023 22:01:23 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 27F7240C13;
	Tue, 11 Apr 2023 22:01:20 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 67514163800; Tue, 11 Apr 2023 18:00:42 -0400 (EDT)
Date: Tue, 11 Apr 2023 18:00:42 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: afd@ti.com
Cc: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master/kirkstone][PATCH v3 6/6] linux-ti-next:
 Update to v6.3-rc6 next version
Message-ID: <20230411220042.GF9226@denix.org>
References: <20230411215243.18230-1-afd@ti.com>
 <20230411215243.18230-6-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230411215243.18230-6-afd@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 11 Apr 2023 22:01:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16372

On Tue, Apr 11, 2023 at 04:52:43PM -0500, Andrew Davis via lists.yoctoproject.org wrote:
> Signed-off-by: Andrew Davis <afd@ti.com>

Reviewed-by: Denys Dmytriyenko <denys@konsulko.com>


> ---
>  meta-ti-bsp/recipes-kernel/linux/linux-ti-next_git.bb | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-next_git.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-next_git.bb
> index 1e86ed97..9138c7c5 100644
> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-next_git.bb
> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-next_git.bb
> @@ -13,9 +13,9 @@ KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT} ${EXTRA_DTC_ARGS}"
>  
>  S = "${WORKDIR}/git"
>  
> -# 6.1.0-rc1+ version
> -SRCREV = "4d48f589d294ddc5e01d3b0dc7cecc55324c05ca"
> -PV = "6.1.0-rc1+git${SRCPV}"
> +# 6.3.0-rc6+ version
> +SRCREV = "009795d283d1f9f043e5a4ff97d4140cde17e2d3"
> +PV = "6.3.0-rc6+git${SRCPV}"
>  
>  SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git;protocol=https;branch=master"
>  
> -- 
> 2.39.2

