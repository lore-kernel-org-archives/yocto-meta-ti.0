Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67A20CCFA13
	for <webhook@archiver.kernel.org>; Fri,  7 Nov 2025 01:22:46 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1876.1762478559215856427
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 06 Nov 2025 17:22:40 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 42D3A40C82;
	Fri,  7 Nov 2025 01:22:38 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MPUYBW1shVd6; Fri,  7 Nov 2025 01:22:38 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 083ED40A30;
	Fri,  7 Nov 2025 01:22:34 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 2AD151719B9; Thu,  6 Nov 2025 20:22:34 -0500 (EST)
Date: Thu, 6 Nov 2025 20:22:34 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: rs@ti.com
Cc: praneeth@ti.com, reatmon@ti.com, meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][scarthgap/master][PATCH] layer: add github MIRRORS
 definitions
Message-ID: <20251107012234.GQ3125@denix.org>
References: <20251107010115.1974047-2-rs@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251107010115.1974047-2-rs@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 07 Nov 2025 01:22:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19235

I wonder how that will affect the signatures for the YP Compat... [Not even 
talking about evil github reliance...]


On Thu, Nov 06, 2025 at 07:01:16PM -0600, rs@ti.com wrote:
> From: Randolph Sapp <rs@ti.com>
> 
> We have some projects mirrored to GitHub currently. It makes sense to
> add a MIRRORS entry for git.ti.com sources to fall back on in the event
> git.ti.com is unreachable.
> 
> Placing this in the main BSP layer configuration file should be all that
> is required for this and any other layers that depend this core layer to
> fall back to GitHub.
> 
> Signed-off-by: Randolph Sapp <rs@ti.com>
> ---
> 
> Tested locally by making git.ti.com ns lookups return NXDOMAIN and then
> requesting to fetch linux-ti-staging.
> 
>  meta-ti-bsp/conf/layer.conf | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/meta-ti-bsp/conf/layer.conf b/meta-ti-bsp/conf/layer.conf
> index e3a28628..d87d040b 100644
> --- a/meta-ti-bsp/conf/layer.conf
> +++ b/meta-ti-bsp/conf/layer.conf
> @@ -36,3 +36,8 @@ TI_COMMON_DEPLOY ?= "${TOPDIR}/deploy-ti"
>  DEPLOY_DIR_IMAGE:ti-soc = "${TI_COMMON_DEPLOY}/images/${MACHINE}"
>  SDK_DEPLOY:ti-soc = "${TI_COMMON_DEPLOY}/sdk"
>  PSEUDO_IGNORE_PATHS:append:ti-soc = ",${TI_COMMON_DEPLOY}"
> +
> +MIRRORS += " \
> +    git://git.ti.com/.* git://github.com/TexasInstruments/BASENAME;protocol=https \
> +    gitsm://git.ti.com/.* gitsm://github.com/TexasInstruments/BASENAME;protocol=https \
> +"
> -- 
> 2.51.1

