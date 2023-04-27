Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEA03C77B73
	for <webhook@archiver.kernel.org>; Thu, 27 Apr 2023 19:31:33 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.1266.1682623885447423516
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 27 Apr 2023 12:31:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 48B2D40C76;
	Thu, 27 Apr 2023 19:31:24 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R8HQzjfOSZsQ; Thu, 27 Apr 2023 19:31:24 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 1709F40031;
	Thu, 27 Apr 2023 19:31:20 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 1B82A163842; Thu, 27 Apr 2023 15:30:39 -0400 (EDT)
Date: Thu, 27 Apr 2023 15:30:39 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: rs@ti.com
Cc: afd@ti.com, reatmon@ti.com, detheridge@ti.com,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][kirkstone][PATCH 3/4] cairo: resolve opengl version
Message-ID: <20230427193039.GM9226@denix.org>
References: <20230426215538.3502212-1-rs@ti.com>
 <20230426215538.3502212-4-rs@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230426215538.3502212-4-rs@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 27 Apr 2023 19:31:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16442

On Wed, Apr 26, 2023 at 04:55:37PM -0500, rs@ti.com wrote:
> From: Randolph Sapp <rs@ti.com>
> 
> Cairo can either be built for use with OpenGL or OpenGLES. By default it
> assumes it can use OpenGL if X11 is provided as a distro feature. This
> assumption is not true anymore.
> 
> Vulkan libraries need some X libs at runtime now, so we need to manually
> override the PACKAGECONFIG for cairo to use OpenGLES.
> 
> Signed-off-by: Randolph Sapp <rs@ti.com>
> ---
>  meta-ti-bsp/recipes-graphics/cairo/cairo_%.bbappend | 5 +++++
>  1 file changed, 5 insertions(+)
>  create mode 100644 meta-ti-bsp/recipes-graphics/cairo/cairo_%.bbappend
> 
> diff --git a/meta-ti-bsp/recipes-graphics/cairo/cairo_%.bbappend b/meta-ti-bsp/recipes-graphics/cairo/cairo_%.bbappend
> new file mode 100644
> index 00000000..b41f1a01
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-graphics/cairo/cairo_%.bbappend
> @@ -0,0 +1,5 @@
> +# This is required since cairo expects the opengl distro feature to refer to
> +# the desktop version of OpenGL. Imagination drivers only provide OpenGLES.
> +
> +PACKAGECONFIG:remove = "opengl"
> +PACKAGECONFIG:append = " glesv2"

NAK, this will fail Yocto Project compatibility checks, rendering meta-ti 
non-compliant!

No bbappends against upstream components should change the defaults 
unconditionally.

Usually, PACKAGECONFIG changes are Distro-specific:
https://git.yoctoproject.org/meta-arago/tree/meta-arago-distro/conf/distro/arago.conf#n117

If you absoluitely have to do it in a BSP layer, there are other ways 
to "guard" the change with layer-specific machine overrides, or other 
conditions.

-- 
Denys

