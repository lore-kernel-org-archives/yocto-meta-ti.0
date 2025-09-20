Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6691CAC59A
	for <webhook@archiver.kernel.org>; Sat, 20 Sep 2025 02:32:39 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.2229.1758335556863850803
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 19 Sep 2025 19:32:37 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id DF1C540BD6;
	Sat, 20 Sep 2025 02:32:35 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Uoqs4-5E-3DP; Sat, 20 Sep 2025 02:32:35 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 969FA40B13;
	Sat, 20 Sep 2025 02:32:31 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id DA12A1752E8; Fri, 19 Sep 2025 22:32:30 -0400 (EDT)
Date: Fri, 19 Sep 2025 22:32:30 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: afd@ti.com
Cc: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	Randolph Sapp <rs@ti.com>, meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master][PATCH 1/5] ti-sgx-ddk-um: UM side driver
 depends on KM side driver
Message-ID: <20250920023230.GS3125@denix.org>
References: <20250918132842.1183883-1-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250918132842.1183883-1-afd@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sat, 20 Sep 2025 02:32:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19048

On Thu, Sep 18, 2025 at 08:28:38AM -0500, Andrew Davis via lists.yoctoproject.org wrote:
> This also matches what is done for ti-img-rogue-umlibs.

FWIW, I've built several different platforms (ARMv7 vs. ARMv8) against the 
latest master with different GPU settings (SGX vs. Rogue vs. headless) and 
everything seems to work fine.


> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
>  .../powervr-umlibs/ti-sgx-ddk-um_1.17.4948957.bb              | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-sgx-ddk-um_1.17.4948957.bb b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-sgx-ddk-um_1.17.4948957.bb
> index 84a9afcf..af27981f 100644
> --- a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-sgx-ddk-um_1.17.4948957.bb
> +++ b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-sgx-ddk-um_1.17.4948957.bb
> @@ -40,9 +40,7 @@ TARGET_PRODUCT:ti43x = "ti437x_linux"
>  TARGET_PRODUCT:omap-a15 = "ti572x_linux"
>  TARGET_PRODUCT:am65xx = "ti654x_linux"
>  
> -RDEPENDS:${PN} += "libdrm"
> -
> -RRECOMMENDS:${PN} += "ti-sgx-ddk-km"
> +RDEPENDS:${PN} += "libdrm ti-sgx-ddk-km"
>  
>  EXTRA_OEMAKE += "DESTDIR=${D} TARGET_PRODUCT=${TARGET_PRODUCT} ${PACKAGECONFIG_CONFARGS}"

