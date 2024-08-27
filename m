Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 202E8C54731
	for <webhook@archiver.kernel.org>; Tue, 27 Aug 2024 17:30:18 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.2723.1724779808853984269
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 27 Aug 2024 10:30:09 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id CD0E840C1C;
	Tue, 27 Aug 2024 17:30:07 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k21Bgq9RQ6RN; Tue, 27 Aug 2024 17:30:07 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id AB0A140CC4;
	Tue, 27 Aug 2024 17:30:05 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id D0359164064; Tue, 27 Aug 2024 13:30:04 -0400 (EDT)
Date: Tue, 27 Aug 2024 13:30:04 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Max Krummenacher <max.oss.09@gmail.com>
Cc: meta-ti@lists.yoctoproject.org,
	Max Krummenacher <max.krummenacher@toradex.com>
Subject: Re: [meta-ti][PATCH] mesa-pvr: set pv explicitely
Message-ID: <20240827173004.GB17572@denix.org>
References: <20240827065723.1108167-1-max.oss.09@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240827065723.1108167-1-max.oss.09@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 27 Aug 2024 17:30:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17952

On Tue, Aug 27, 2024 at 08:57:23AM +0200, Max Krummenacher wrote:
> From: Max Krummenacher <max.krummenacher@toradex.com>
> 
> openembedded-core commit f5cfb3e23603 ("mesa: set PV from the .inc
> file and not via filenames") now sets PV in the mesa.inc file
> explicitely to whatever version oe-core is using.
> Override that setting to the actual version here to prevent the
> following parse error and whatever else would go wrong afterwards.

I had the same fix I was testing last night, but you beat me to it
submitting it this morning.


> | ERROR: .../mesa-pvr_23.2.1.bb: Unable to get checksum for mesa-pvr SRC_URI entry 0001-meson-Disable-cmake-dependency-detector-for-llvm.patch: file could not be found
> | The following paths were searched:
> | .../meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.0.7/bsp-ti-6_1/0001-meson-Disable-cmake-dependency-detector-for-llvm.patch
> | ...
> 
> Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>

Tested-by: Denys Dmytriyenko <denys@konsulko.com>


> ---
> CC: Randolph Sapp <rs@ti.com>
>  meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_22.3.5.bb | 1 +
>  meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_23.2.1.bb | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_22.3.5.bb b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_22.3.5.bb
> index 5abd07934d94..09ae0510ce53 100644
> --- a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_22.3.5.bb
> +++ b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_22.3.5.bb
> @@ -29,6 +29,7 @@ PACKAGECONFIG:append = " \
>  "
>  
>  SRCREV = "1be98ba80452ebe38546a7fca26b5a70f2629083"
> +PV = "22.3.5"
>  
>  PVR_DISPLAY_CONTROLLER_ALIAS ??= "tidss"
>  PACKAGECONFIG[pvr] = "-Dgallium-pvr-alias=${PVR_DISPLAY_CONTROLLER_ALIAS},"
> diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_23.2.1.bb b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_23.2.1.bb
> index a137f4521e08..21134bc774cf 100644
> --- a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_23.2.1.bb
> +++ b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_23.2.1.bb
> @@ -26,6 +26,7 @@ PACKAGECONFIG:append = " \
>  "
>  
>  SRCREV = "b12290126ba6a154f0e8b0a8c8b2b0d64f98e427"
> +PV = "23.2.1"
>  
>  PVR_DISPLAY_CONTROLLER_ALIAS ??= "tidss"
>  PACKAGECONFIG[pvr] = "-Dgallium-pvr-alias=${PVR_DISPLAY_CONTROLLER_ALIAS},"
> -- 
> 2.42.0

