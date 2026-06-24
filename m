Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED1A2CDB479
	for <webhook@archiver.kernel.org>; Wed, 24 Jun 2026 20:37:46 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17012.1782333462345352852
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 24 Jun 2026 13:37:43 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 0E7E140CB2;
	Wed, 24 Jun 2026 20:37:41 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H1Ss31CJdKvE; Wed, 24 Jun 2026 20:37:40 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B3F5F40C8F;
	Wed, 24 Jun 2026 20:37:37 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 6934717E278; Wed, 24 Jun 2026 16:37:37 -0400 (EDT)
Date: Wed, 24 Jun 2026 16:37:37 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: afd@ti.com
Cc: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master/wrynose][PATCH v2] ti-linux-fw: Remove
 default SUMMARY line
Message-ID: <20260624203737.GD10186@denix.org>
References: <20260624203026.1155961-1-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260624203026.1155961-1-afd@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 24 Jun 2026 20:37:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20082

On Wed, Jun 24, 2026 at 03:30:26PM -0500, Andrew Davis via lists.yoctoproject.org wrote:
> All firmware that includes this helper should set their own SUMMARY line.
> Currently all do (other than ti-adc-fw which we fix here), but they often
> include this file after setting their own SUMMARY, so this common one
> overwrites the correct one. Remove this default SUMMARY.

How about flipping it the other way around?

In the common .inc file we set:

SUMMARY = "Prebuild binary firmware"

And in specific firmware recioes we clarify:

SUMMARY .= " for TI ADC PCM6240 configuration"

That way it won't matter if the inclusion happens before or after setting the 
specific SUMMARY and it won't be completely empty (albeit generic) if someone 
forgets setting SUMMARY in the recipe.


> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
> 
> Changes for v2:
>  - Update ti-adc-fw so it has a SUMMARY
> 
>  meta-ti-bsp/recipes-bsp/ti-adc-fw/ti-adc-fw.bb      | 2 +-
>  meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc | 2 --
>  2 files changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/meta-ti-bsp/recipes-bsp/ti-adc-fw/ti-adc-fw.bb b/meta-ti-bsp/recipes-bsp/ti-adc-fw/ti-adc-fw.bb
> index ad025483..0b70d69d 100644
> --- a/meta-ti-bsp/recipes-bsp/ti-adc-fw/ti-adc-fw.bb
> +++ b/meta-ti-bsp/recipes-bsp/ti-adc-fw/ti-adc-fw.bb
> @@ -1,4 +1,4 @@
> -DESCRIPTION = "TI ADC PCM6240 config prebuild binary firmware"
> +SUMMARY = "TI ADC PCM6240 config prebuild binary firmware"
>  
>  require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
>  
> diff --git a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
> index 126c46df..d343a6aa 100644
> --- a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
> +++ b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
> @@ -1,5 +1,3 @@
> -SUMMARY = "Common include for TI Linux firmware"
> -
>  LICENSE = "TI-TFL"
>  LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=b5aebf0668bdf95621259288c4a46d76"
>  
> -- 
> 2.39.2

