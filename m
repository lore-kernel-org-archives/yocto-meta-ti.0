Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89010C5CFDB
	for <webhook@archiver.kernel.org>; Tue, 11 Aug 2026 18:19:23 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.60824.1786472358032142289
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 11 Aug 2026 11:19:19 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E698A40C79;
	Tue, 11 Aug 2026 18:19:16 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4brXkl6tM1F8; Tue, 11 Aug 2026 18:19:16 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 939A9407DA;
	Tue, 11 Aug 2026 18:19:12 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 779A117C257; Tue, 11 Aug 2026 14:19:11 -0400 (EDT)
Date: Tue, 11 Aug 2026 14:19:11 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: antoine.gouby@gmail.com
Cc: meta-ti@lists.yoctoproject.org,
	Antoine Gouby <antoine.gouby@toradex.com>,
	Francesco Dolcini <francesco@dolcini.it>, reatmon@ti.com
Subject: Re: [meta-ti][master][PATCH] weston: upgrade weston bbappend to
 16.0.0
Message-ID: <20260811181911.GG19759@denix.org>
References: <20260811150043.97146-1-antoine.gouby@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260811150043.97146-1-antoine.gouby@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 11 Aug 2026 18:19:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20247

On Tue, Aug 11, 2026 at 05:00:40PM +0200, Antoine Gouby via lists.yoctoproject.org wrote:
> From: Antoine Gouby <antoine.gouby@toradex.com>
> 
> Commit ad85da159d41 ("weston: upgrade 15.0.1 -> 16.0.0") from OE-core
> bumped weston to 16.0.0, but the meta-ti bbappend was still named for
> the 15.0.x version and was therefore no longer being applied. Rename
> the bbappend to match the new version.

NAK.

This hasn't been tested at all. The bbappend applies 2 patches that no longer 
apply cleanly to version 16.

I have a proper change that I'm currently testing locally.


> Signed-off-by: Antoine Gouby <antoine.gouby@toradex.com>
> ---
>  .../wayland/{weston_15.0.%.bbappend => weston_16.0.%.bbappend}    | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename meta-ti-bsp/recipes-graphics/wayland/{weston_15.0.%.bbappend => weston_16.0.%.bbappend} (100%)
> 
> diff --git a/meta-ti-bsp/recipes-graphics/wayland/weston_15.0.%.bbappend b/meta-ti-bsp/recipes-graphics/wayland/weston_16.0.%.bbappend
> similarity index 100%
> rename from meta-ti-bsp/recipes-graphics/wayland/weston_15.0.%.bbappend
> rename to meta-ti-bsp/recipes-graphics/wayland/weston_16.0.%.bbappend
> -- 
> 2.55.0

