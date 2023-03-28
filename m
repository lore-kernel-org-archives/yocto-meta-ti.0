Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D32AFC6FD18
	for <webhook@archiver.kernel.org>; Tue, 28 Mar 2023 15:26:16 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.70022.1680017171022044186
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 28 Mar 2023 08:26:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9F0B640BD4;
	Tue, 28 Mar 2023 15:26:09 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z0mB65I2qXgU; Tue, 28 Mar 2023 15:26:09 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 7F09740ACD;
	Tue, 28 Mar 2023 15:26:07 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id BBF8C1637E5; Tue, 28 Mar 2023 11:25:32 -0400 (EDT)
Date: Tue, 28 Mar 2023 11:25:32 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: "Theodore A. Roth" <troth@openavr.org>
Cc: meta-ti@lists.yoctoproject.org,
	"Theodore A . Roth" <theodore_roth@trimble.com>
Subject: Re: [RFC][meta-ti][master][PATCH] meta-ti-bsp: Update mesa
 bbappend files for mesa-23
Message-ID: <20230328152532.GT18050@denix.org>
References: <20230327170809.2115712-1-theodore_roth@trimble.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230327170809.2115712-1-theodore_roth@trimble.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 28 Mar 2023 15:26:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16248

Thanks for the patch!

Has version 23 been tested with the PowerVR patches for HW acceleration?


On Mon, Mar 27, 2023 at 11:08:09AM -0600, Theodore A. Roth wrote:
> From: "Theodore A. Roth" <troth@openavr.org>
> 
> The mesa recipes in oe-core have been updated to mesa-23 causing the
> following build error:
> 
>     $ bitbake core-image-minimal
>     Loading cache: 100% |                                               | ETA:  --:--:--
>     Loaded 0 entries from dependency cache.
>     Parsing recipes: 100% |#############################################| Time: 0:00:20
>     Parsing of 2816 .bb files complete (0 cached, 2816 parsed). 4472 targets, 484 skipped, 0 masked, 0 errors.
>     ERROR: No recipes in default available for:
>       /build/../oe/meta-ti/meta-ti-bsp/recipes-graphics/mesa/mesa-gl_22.%.bbappend
>       /build/../oe/meta-ti/meta-ti-bsp/recipes-graphics/mesa/mesa_22.%.bbappend
> 
>     Summary: There was 1 ERROR message, returning a non-zero exit code.
> 
> Signed-off-by: Theodore A. Roth <troth@openavr.org>
> Signed-off-by: Theodore A. Roth <theodore_roth@trimble.com>
> ---
>  .../mesa/{mesa-gl_22.%.bbappend => mesa-gl_23.%.bbappend}         | 0
>  .../mesa/{mesa_22.%.bbappend => mesa_23.%.bbappend}               | 0
>  2 files changed, 0 insertions(+), 0 deletions(-)
>  rename meta-ti-bsp/recipes-graphics/mesa/{mesa-gl_22.%.bbappend => mesa-gl_23.%.bbappend} (100%)
>  rename meta-ti-bsp/recipes-graphics/mesa/{mesa_22.%.bbappend => mesa_23.%.bbappend} (100%)
> 
> diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-gl_22.%.bbappend b/meta-ti-bsp/recipes-graphics/mesa/mesa-gl_23.%.bbappend
> similarity index 100%
> rename from meta-ti-bsp/recipes-graphics/mesa/mesa-gl_22.%.bbappend
> rename to meta-ti-bsp/recipes-graphics/mesa/mesa-gl_23.%.bbappend
> diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa_22.%.bbappend b/meta-ti-bsp/recipes-graphics/mesa/mesa_23.%.bbappend
> similarity index 100%
> rename from meta-ti-bsp/recipes-graphics/mesa/mesa_22.%.bbappend
> rename to meta-ti-bsp/recipes-graphics/mesa/mesa_23.%.bbappend
> -- 
> 2.34.1

