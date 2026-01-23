Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60D97D6CFC6
	for <webhook@archiver.kernel.org>; Fri, 23 Jan 2026 05:15:45 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.61452.1769145340248282674
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 22 Jan 2026 21:15:40 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8DC5240C83;
	Fri, 23 Jan 2026 05:15:39 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gunqZKp3KfRt; Fri, 23 Jan 2026 05:15:39 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 53F8340C2A;
	Fri, 23 Jan 2026 05:15:36 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 07FF8177D30; Fri, 23 Jan 2026 00:15:36 -0500 (EST)
Date: Fri, 23 Jan 2026 00:15:35 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: a-christidis@ti.com
Cc: denys@konsulko.com, reatmon@ti.com, meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master][PATCH] ti-gc320-driver: Port module for
 kernel 6.18
Message-ID: <20260123051535.GB11121@denix.org>
References: <20260122193522.302216-1-a-christidis@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260122193522.302216-1-a-christidis@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 23 Jan 2026 05:15:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19440

On Thu, Jan 22, 2026 at 01:35:22PM -0600, Antonios Christidis via lists.yoctoproject.org wrote:
> From: Antonios Christidis <a-christidis@ti.com>
> 
> Port the kernel module for gc320 driver to build on linux kernel 6.18.

Does it work with other older kernel versions? E.g. 6.12 is still the default 
even in master.


> The overall version of the driver remains the same.
> 
> Signed-off-by: Antonios Christidis <a-christidis@ti.com>
> ---
>  .../recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb    | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-ti-bsp/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb b/meta-ti-bsp/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
> index 3acdd130..336f4ce4 100644
> --- a/meta-ti-bsp/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
> +++ b/meta-ti-bsp/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
> @@ -8,9 +8,9 @@ inherit module features_check
>  REQUIRED_MACHINE_FEATURES = "gc320"
>  
>  # Need to branch out with ${PV} var
> -BRANCH = "ti-${PV}-k6.12"
> +BRANCH = "ti-${PV}-k6.18"
>  
> -SRCREV = "83afddf9dbf6a8458267b4dae21ee35bfb11f3d1"
> +SRCREV = "a7e9a51e89c97fbea974c7d674aa0a95d7c96403"
>  
>  SRC_URI = "git://git.ti.com/git/graphics/ti-gc320-driver.git;protocol=https;branch=${BRANCH}"
>  
> -- 
> 2.34.1

