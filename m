Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F565109190F
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 18:53:44 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3615.1773946420382168469
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 19 Mar 2026 11:53:41 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 67EF140C79;
	Thu, 19 Mar 2026 18:53:39 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q8gBgP9wwEPp; Thu, 19 Mar 2026 18:53:39 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 1FCB540BC0;
	Thu, 19 Mar 2026 18:53:35 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 7871817A378; Thu, 19 Mar 2026 14:53:34 -0400 (EDT)
Date: Thu, 19 Mar 2026 14:53:34 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: jm@ti.com
Cc: Ryan Eatmon <reatmon@ti.com>, meta-ti@lists.yoctoproject.org,
	Andrew Davis <afd@ti.com>, Praneeth Bajjuri <praneeth@ti.com>
Subject: Re: [meta-ti][master][PATCH] RFC: meta-beagle: Fix TF-A machine
 name for badge
Message-ID: <20260319185334.GR11121@denix.org>
References: <20260319175402.2517003-1-jm@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260319175402.2517003-1-jm@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 19 Mar 2026 18:53:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19790

On Thu, Mar 19, 2026 at 12:54:02PM -0500, Mendez, Judith via lists.yoctoproject.org wrote:
> BeagleBadge board has been renamed to am62l3-badge
> in the new TFA ti-tfa-2.14.y branch [0], so update
> recipe TFA_BOARD accordingly.
> 
> [0] https://github.com/TexasInstruments/arm-trusted-firmware/commit/d203b8453905178252094416448de009931087e0
> Signed-off-by: Judith Mendez <jm@ti.com>
> ---
> Due to build errors with arago-master-config, this patch
> has not been built tested, thus sending as RFC.
> ---
>  meta-beagle/conf/machine/beaglebadge-ti.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-beagle/conf/machine/beaglebadge-ti.conf b/meta-beagle/conf/machine/beaglebadge-ti.conf
> index d62730ed..78525030 100644
> --- a/meta-beagle/conf/machine/beaglebadge-ti.conf
> +++ b/meta-beagle/conf/machine/beaglebadge-ti.conf
> @@ -18,4 +18,4 @@ KERNEL_DEVICETREE = ""
>  
>  UBOOT_MACHINE = "am62lx_badge_defconfig"
>  
> -TFA_BOARD = "am62l-badge"
> +TFA_BOARD = "am62l3-badge"

This looks reasonable, on the surface at least.

Andrew, Praneeth,

How stable is the API around TFA?

Do we want to keep multiple versions of TFA and select the corresponding one 
based on which BSP is in use (6.6, 6.12, 6.18)?

I realize it's not specific to the kernel version, but to other low-level boot 
pieces, which all get updated at the same time, even though U-boot and kernel 
may be old...

-- 
Denys

