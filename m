Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6FE5C87FD3
	for <webhook@archiver.kernel.org>; Wed,  6 Aug 2025 18:22:44 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.32595.1754504557547404420
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 06 Aug 2025 11:22:38 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id A361040C3E;
	Wed,  6 Aug 2025 18:22:36 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JEu6nuQgMhCf; Wed,  6 Aug 2025 18:22:36 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 531EB40C06;
	Wed,  6 Aug 2025 18:22:30 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 7158816E028; Wed,  6 Aug 2025 14:22:29 -0400 (EDT)
Date: Wed, 6 Aug 2025 14:22:29 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: b-padhi@ti.com
Cc: reatmon@ti.com, denys@konsulko.com, a-limaye@ti.com, afd@ti.com,
	u-kumar1@ti.com, meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] [master/scarthgap][PATCH v2] licenses: Add
 INSIDE-Secure LICENSE
Message-ID: <20250806182229.GV24899@denix.org>
References: <20250806055014.2606773-1-b-padhi@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250806055014.2606773-1-b-padhi@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 06 Aug 2025 18:22:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18903

On Wed, Aug 06, 2025 at 11:20:14AM +0530, Beleswar Padhi via lists.yoctoproject.org wrote:
> Add the INSIDE-Secure LICENSE and update the PKA recipe to use this
> license.

Looks good, thanks.


> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>

Reviewed-by: Denys Dmytriyenko <denys@konsulko.com>


> ---
> v2: Changelog:
> 1. Added only INSIDE-Secure license.
> 
> Link to v1:
> https://lore.kernel.org/all/20250801044441.1059527-1-b-padhi@ti.com/
> 
>  meta-ti-bsp/licenses/INSIDE-Secure            | 19 +++++++++++++++++++
>  .../recipes-bsp/ti-pka-fw/ti-pka-fw_git.bb    |  2 +-
>  2 files changed, 20 insertions(+), 1 deletion(-)
>  create mode 100644 meta-ti-bsp/licenses/INSIDE-Secure
> 
> diff --git a/meta-ti-bsp/licenses/INSIDE-Secure b/meta-ti-bsp/licenses/INSIDE-Secure
> new file mode 100644
> index 00000000..3eb3a465
> --- /dev/null
> +++ b/meta-ti-bsp/licenses/INSIDE-Secure
> @@ -0,0 +1,19 @@
> +//---------------------------------------------------------------------
> +//Inside Secure Copyright Notice for PKA Firmware
> +//---------------------------------------------------------------------
> +
> +/* */
> +/* Copyright (c) 2004-2015 INSIDE Secure B.V. All Rights Reserved */
> +/* */
> +/* This confidential and proprietary software may be used only as authorized */
> +/* by a licensing agreement from INSIDE Secure. */
> +/* */
> +/* The entire notice above must be reproduced on all authorized copies that */
> +/* may only be made to the extent permitted by a licensing agreement from */
> +/* INSIDE Secure. */
> +/* */
> +/* For more information or support, please go to our online support system at */
> +/* https://essoemsupport.insidesecure.com. */
> +/* In case you do not have an account for this system, please send an e-mail */
> +/* to ESSEmbeddedHW-Support.com. */
> +/*----------------------------------------------------------------------------*/
> diff --git a/meta-ti-bsp/recipes-bsp/ti-pka-fw/ti-pka-fw_git.bb b/meta-ti-bsp/recipes-bsp/ti-pka-fw/ti-pka-fw_git.bb
> index 49ae0251..c3d2bce4 100644
> --- a/meta-ti-bsp/recipes-bsp/ti-pka-fw/ti-pka-fw_git.bb
> +++ b/meta-ti-bsp/recipes-bsp/ti-pka-fw/ti-pka-fw_git.bb
> @@ -1,6 +1,6 @@
>  SUMMARY = "PKA prebuilt binary firmware image"
>  
> -LICENSE = "TI-TFL & INSIDE Secure"
> +LICENSE = "TI-TFL & INSIDE-Secure"
>  LIC_FILES_CHKSUM = "file://LICENCE.pka_fw;md5=dc20391b287874f0dce069cf87917206"
>  
>  COMPATIBLE_MACHINE = "k3"
> -- 
> 2.34.1

