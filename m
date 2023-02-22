Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57A38C636D6
	for <webhook@archiver.kernel.org>; Wed, 22 Feb 2023 19:39:18 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.2860.1677094752218397175
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 22 Feb 2023 11:39:12 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id A0E1E40C2E;
	Wed, 22 Feb 2023 19:39:11 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aQgfoRG2OPDi; Wed, 22 Feb 2023 19:39:11 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 806A940AC9;
	Wed, 22 Feb 2023 19:39:09 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id C11F7163764; Wed, 22 Feb 2023 14:38:44 -0500 (EST)
Date: Wed, 22 Feb 2023 14:38:44 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: afd@ti.com
Cc: Ryan Eatmon <reatmon@ti.com>, meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master/kirkstone][PATCH v2 04/15] u-boot-ti: Use new
 ti-secdev class to sign the images
Message-ID: <20230222193844.GV22689@denix.org>
References: <20230215193355.9676-1-afd@ti.com>
 <20230215193355.9676-5-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230215193355.9676-5-afd@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 22 Feb 2023 19:39:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15910

On Wed, Feb 15, 2023 at 01:33:44PM -0600, Andrew Davis via lists.yoctoproject.org wrote:
> Use the new ti-k3-secdev package to pull in the signing tools if they are
> not provided by the environment. This allows us to use these tools
> unconditionally. Remove the checks for the script and do the signing
> for all K3 machines. The signature is automatically stripped from
> the binaries on non-HS devices at boot time as needed so this change
> is harmless for GP devices.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>

Tested-by: Denys Dmytriyenko <denys@konsulko.com>


> ---
>  meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
> index 6f5b6313..83c4af59 100644
> --- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
> +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
> @@ -50,8 +50,7 @@ PKG:${PN}-dbg = "u-boot-dbg"
>  S = "${WORKDIR}/git"
>  
>  # Support for secure devices - detailed info is in doc/README.ti-secure
> -TI_SECURE_DEV_PKG ?= ""
> -export TI_SECURE_DEV_PKG
> +inherit ti-secdev
>  
>  SYSROOT_DIRS += "/boot"
>  
> -- 
> 2.39.1

