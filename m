Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B779C25B50
	for <webhook@archiver.kernel.org>; Mon, 23 Jan 2023 22:19:55 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.540.1674512391853315715
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 23 Jan 2023 14:19:52 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 3013D40C13;
	Mon, 23 Jan 2023 22:19:51 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1_9FdhWZyAga; Mon, 23 Jan 2023 22:19:51 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 0CE7C40A46;
	Mon, 23 Jan 2023 22:19:49 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 14CC7163701; Mon, 23 Jan 2023 17:19:29 -0500 (EST)
Date: Mon, 23 Jan 2023 17:19:29 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: jm@ti.com
Cc: Ryan Eatmon <reatmon@ti.com>, meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] [dunfell v4] trusted-firmware-a: upgrade to v2.8+
Message-ID: <20230123221929.GW22689@denix.org>
References: <20230123215646.24425-1-jm@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230123215646.24425-1-jm@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 23 Jan 2023 22:19:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15635

On Mon, Jan 23, 2023 at 03:56:46PM -0600, Mendez, Judith via lists.yoctoproject.org wrote:
> Upgrade arm-trusted-firmare to v2.8-226-g2fcd408bb.
> 
> This upgrade picks up K3 L2 cache, snoop delayed, and EA
> handling updates from upstream master.
> 
> Do not update to tip of master due to PSCI system off
> support breaking AM62x and AM62q platforms.
> 
> Signed-off-by: Judith Mendez <jm@ti.com>

LGTM.

Reviewed-by: Denys Dmytriyenko <denys@konsulko.com>


> ---
> 
> v4: Updated PV_append_k3 to PV_K3
> v3: v2 was the wrong patch sent with a typo
> v2: added PV_append_k3 = "+git${SRCPV}" since SRCREV does not point exactly to
> release tag
> 
>  recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
> index a5eb9ff8..caf27328 100644
> --- a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
> +++ b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
> @@ -1,6 +1,6 @@
> -PV_k3 = "2.6"
> +PV_k3 = "2.8+git${SRCPV}"
>  LIC_FILES_CHKSUM_k3 = "file://license.rst;md5=1dd070c98a281d18d9eefd938729b031"
> -SRCREV_tfa_k3 = "1309c6c805190bd376c0561597653f3f8ecd0f58"
> +SRCREV_tfa_k3 = "2fcd408bb3a6756767a43c073c597cef06e7f2d5"
>  COMPATIBLE_MACHINE_k3 = "k3"
>  TFA_BUILD_TARGET_k3 = "all"
>  TFA_INSTALL_TARGET_k3 = "bl31"
> -- 
> 2.17.1
> 

