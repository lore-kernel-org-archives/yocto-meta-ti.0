Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D31C3C48260
	for <webhook@archiver.kernel.org>; Fri, 16 Feb 2024 20:23:11 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.8576.1708114987198593204
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 16 Feb 2024 12:23:08 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 13E7B40C81;
	Fri, 16 Feb 2024 20:23:06 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jocjhQCgw5WS; Fri, 16 Feb 2024 20:23:06 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 76B5F40C21;
	Fri, 16 Feb 2024 20:23:01 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 829C3163EB4; Fri, 16 Feb 2024 15:23:00 -0500 (EST)
Date: Fri, 16 Feb 2024 15:23:00 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: afd@ti.com
Cc: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master/kirkstone][PATCH] conf: machine: k3: Use
 Cortex-A53/A72 CPU tune
Message-ID: <20240216202300.GC1572@denix.org>
References: <20240215212613.57012-1-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240215212613.57012-1-afd@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 16 Feb 2024 20:23:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17486

Unfortunately, NAK.

This is considered an antisocial behavior for a BSP in the Yocto Project 
world. And the performance benefit is questionable with 1%-2%, if at all.

The proper place for any extra optimization tunes is in a distro config. Maybe 
even by end customer's final product, not a reference distro.

Consider a distro that supports multiple HW platforms and uses multiple BSPs 
besides meta-ti - YoE, AGL, etc. You do want a common denominator tunes in 
order to get the most binary re-use across the platforms.

For example, AGL goes to some extreme lengths to override such custom tunes 
set by misbehaving BSPs and it's quite ugly.

And moreover, we've gone through this motion in the past many years ago when 
we had our ARMv7 platforms set to their corresponding cortex-a8/a9/a15 tunes 
by default, but eventually ended up setting a common ARMv7 tune:

DEFAULTTUNE ?= "armv7athf-neon"

So, you should either leave the current arch-arm64.inc inclusion as is, or if 
you insist on including tune-cortexa72-cortexa53.inc, set the default tune 
back to plain aarch64:

DEFAULTTUNE ?= "aarch64"


On Thu, Feb 15, 2024 at 03:26:13PM -0600, Andrew Davis via lists.yoctoproject.org wrote:
> All current K3 devices use either A53 or A72. Use the compile tune
> configuration specific for these to allow the compiler to make
> better optimizations.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
>  meta-ti-bsp/conf/machine/include/k3.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-ti-bsp/conf/machine/include/k3.inc b/meta-ti-bsp/conf/machine/include/k3.inc
> index 2415f0ba..7c3579af 100644
> --- a/meta-ti-bsp/conf/machine/include/k3.inc
> +++ b/meta-ti-bsp/conf/machine/include/k3.inc
> @@ -3,7 +3,7 @@
>  require conf/machine/include/ti-soc.inc
>  SOC_FAMILY:append = ":k3"
>  
> -require conf/machine/include/arm/arch-arm64.inc
> +require conf/machine/include/arm/armv8a/tune-cortexa72-cortexa53.inc
>  
>  BBMULTICONFIG += "k3r5"
>  
> -- 
> 2.39.2

