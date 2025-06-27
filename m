Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F239FC77B7F
	for <webhook@archiver.kernel.org>; Fri, 27 Jun 2025 21:03:11 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.1422.1751058185656798673
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 27 Jun 2025 14:03:06 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id F19E140CBF;
	Fri, 27 Jun 2025 21:03:04 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s2G_S3GAMlMB; Fri, 27 Jun 2025 21:03:04 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B7BBD40C37;
	Fri, 27 Jun 2025 21:03:01 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 64D3416ADD5; Fri, 27 Jun 2025 17:03:01 -0400 (EDT)
Date: Fri, 27 Jun 2025 17:03:01 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: afd@ti.com
Cc: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][scarthgap/master][PATCH] meta-ti-bsp: k3r5: Use new
 tune file for Cortex-R5F
Message-ID: <20250627210257.GN18383@denix.org>
References: <20250627202700.582822-1-afd@ti.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="NzB8fVQJ5HfG6fxh"
Content-Disposition: inline
In-Reply-To: <20250627202700.582822-1-afd@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 27 Jun 2025 21:03:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18725


--NzB8fVQJ5HfG6fxh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 27, 2025 at 03:27:00PM -0500, Andrew Davis via lists.yoctoproject.org wrote:
> There is now a tune available specifically for Cortex-R5F cores, use that
> here. Not sure how much difference this makes as we only build one package
> for this (U-Boot R5 SPL) but should be no harm either.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
>  meta-ti-bsp/conf/machine/include/k3r5.inc | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/meta-ti-bsp/conf/machine/include/k3r5.inc b/meta-ti-bsp/conf/machine/include/k3r5.inc
> index fcd54254..ebd8b0aa 100644
> --- a/meta-ti-bsp/conf/machine/include/k3r5.inc
> +++ b/meta-ti-bsp/conf/machine/include/k3r5.inc
> @@ -3,9 +3,9 @@
>  require conf/machine/include/ti-soc.inc
>  SOC_FAMILY:append = ":k3r5"
>  
> -# The closest of existing tunes for Cortex-R5F
> -DEFAULTTUNE = "armv7athf"
> -require conf/machine/include/arm/armv7a/tune-cortexa8.inc
> +# Tune for Cortex-R5F
> +DEFAULTTUNE = "cortexr5hf"
> +require conf/machine/include/arm/armv7r/tune-cortexr5.inc

Last time I tried this, there were some adverse effects, though I don't 
remember specific details - could have been something Thumb-related, size or 
speed.

I still have a patch in one of my old local trees, but I never submited 
it due to the above uncertainty. Ah, I see, back in Kirstone days, 2 years 
ago - see attached...

I would recommend thorough testing with this change. But it might have been 
toolchain-related and is no longer an issue...


>  # R5 runs early bootloader and loads SYSFW
>  # https://git.ti.com/cgit/ti-u-boot/ti-u-boot/tree/doc/board/ti/j721e_evm.rst
> -- 
> 2.39.2

--NzB8fVQJ5HfG6fxh
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="0001-machine-k3r5-use-new-dedicated-Cortex-R5-tunes.patch"

From 452ef88ddf550c9836ddcaa97f81a6ffea81a888 Mon Sep 17 00:00:00 2001
From: Denys Dmytriyenko <denys@konsulko.com>
Date: Tue, 4 Apr 2023 19:45:51 +0000
Subject: [PATCH] machine: k3r5: use new dedicated Cortex-R5 tunes

Back in Dunfell we had to use Cortex-A8 tunes, as the closest match.
Since then OE-Core got lots of dedicated tunes and we can now use
the correct Cortex-R5 one for K3 R5F cores.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/conf/machine/include/k3r5.inc | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/include/k3r5.inc b/meta-ti-bsp/conf/machine/include/k3r5.inc
index 377a2b2f..f1d4e09a 100644
--- a/meta-ti-bsp/conf/machine/include/k3r5.inc
+++ b/meta-ti-bsp/conf/machine/include/k3r5.inc
@@ -3,9 +3,8 @@
 require conf/machine/include/ti-soc.inc
 SOC_FAMILY:append = ":k3r5"
 
-# The closest of existing tunes for Cortex-R5F
-DEFAULTTUNE = "armv7athf"
-require conf/machine/include/arm/armv7a/tune-cortexa8.inc
+DEFAULTTUNE = "armv7r"
+require conf/machine/include/arm/armv7r/tune-cortexr5.inc
 
 # R5 runs early bootloader and loads SYSFW
 # https://git.ti.com/cgit/ti-u-boot/ti-u-boot/tree/doc/board/ti/j721e_evm.rst
-- 
2.25.1


--NzB8fVQJ5HfG6fxh--

