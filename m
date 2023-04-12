Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01835C7619A
	for <webhook@archiver.kernel.org>; Wed, 12 Apr 2023 20:46:15 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.1212.1681332372555593073
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 12 Apr 2023 13:46:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E1AEF40C37;
	Wed, 12 Apr 2023 20:46:11 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nOp35kX_pFkZ; Wed, 12 Apr 2023 20:46:11 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id ADCFC40C21;
	Wed, 12 Apr 2023 20:46:07 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id B72F6163816; Wed, 12 Apr 2023 16:45:29 -0400 (EDT)
Date: Wed, 12 Apr 2023 16:45:29 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: afd@ti.com
Cc: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	Randolph Sapp <rs@ti.com>, meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master/kirkstone][PATCH v2 1/6] ti-sgx-ddk-um:
 Remove RDEPENDS on libdrm-omap
Message-ID: <20230412204529.GK9226@denix.org>
References: <20230412184242.29743-1-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230412184242.29743-1-afd@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 12 Apr 2023 20:46:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16384

I'm fine with the first 4 patches in this series, if Ryan wants to merge them.


On Wed, Apr 12, 2023 at 01:42:37PM -0500, Andrew Davis via lists.yoctoproject.org wrote:
> We no longer use libdrm-omap so remove it.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
>  .../recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb      | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb b/meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
> index 73d7acb9..9ea3add7 100644
> --- a/meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
> +++ b/meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
> @@ -34,7 +34,7 @@ def use_initscript(d):
>  
>  inherit ${@oe.utils.ifelse(use_initscript(d), 'update-rc.d', '')}
>  
> -RDEPENDS:${PN} += "libdrm libdrm-omap"
> +RDEPENDS:${PN} += "libdrm"
>  
>  RRECOMMENDS:${PN} += "ti-sgx-ddk-km"
>  
> -- 
> 2.39.2

