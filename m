Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67E80C636D6
	for <webhook@archiver.kernel.org>; Wed, 22 Feb 2023 19:45:28 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.2985.1677095121472303331
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 22 Feb 2023 11:45:21 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id DE8C340C2E;
	Wed, 22 Feb 2023 19:45:20 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rBLCNqLdieLI; Wed, 22 Feb 2023 19:45:20 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id BA1AD40AC9;
	Wed, 22 Feb 2023 19:45:18 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 055A6163764; Wed, 22 Feb 2023 14:44:54 -0500 (EST)
Date: Wed, 22 Feb 2023 14:44:53 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: afd@ti.com
Cc: Ryan Eatmon <reatmon@ti.com>, meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master/kirkstone][PATCH v2 15/15] ti-rtos-firmware:
 Deploy secure firmware unconditionally
Message-ID: <20230222194453.GG22689@denix.org>
References: <20230215193355.9676-1-afd@ti.com>
 <20230215193355.9676-16-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230215193355.9676-16-afd@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 22 Feb 2023 19:45:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15921

On Wed, Feb 15, 2023 at 01:33:55PM -0600, Andrew Davis via lists.yoctoproject.org wrote:
> Having signed firmware is needed for the HS platforms, but does not
> cause any issues for non-HS. To keep things simple, let's deploy
> both sets unconditionally. This prevents mistakes when adding HS
> support and further reduces the image delta between the two types.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>

Tested-by: Denys Dmytriyenko <denys@konsulko.com>


> ---
>  .../ti-rtos-bin/ti-rtos-firmware.bb           | 38 ++-----------------
>  1 file changed, 4 insertions(+), 34 deletions(-)
> 
> diff --git a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> index 5de7c7b3..ddfa07be 100644
> --- a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> +++ b/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> @@ -183,7 +183,7 @@ ALTERNATIVE:${PN}:am62xx = "\
>                      am62-main-r5f0_0-fw \
>                      "
>  
> -ALTERNATIVE:${PN}:j721e-hs-evm = "\
> +ALTERNATIVE:${PN}:j721e = "\
>                      j7-mcu-r5f0_0-fw \
>                      j7-mcu-r5f0_1-fw \
>                      j7-main-r5f0_0-fw \
> @@ -202,26 +202,7 @@ ALTERNATIVE:${PN}:j721e-hs-evm = "\
>                      j7-c71_0-fw-sec \
>                      "
>  
> -ALTERNATIVE:${PN}:j721e-evm = "\
> -                    j7-mcu-r5f0_0-fw \
> -                    j7-mcu-r5f0_1-fw \
> -                    j7-main-r5f0_0-fw \
> -                    j7-main-r5f0_1-fw \
> -                    j7-main-r5f1_0-fw \
> -                    j7-main-r5f1_1-fw \
> -                    j7-c66_0-fw \
> -                    j7-c66_1-fw \
> -                    j7-c71_0-fw\
> -                    "
> -
> -ALTERNATIVE:${PN}:j7200-evm = "\
> -                    j7200-mcu-r5f0_0-fw \
> -                    j7200-mcu-r5f0_1-fw \
> -                    j7200-main-r5f0_0-fw \
> -                    j7200-main-r5f0_1-fw \
> -                    "
> -
> -ALTERNATIVE:${PN}:j7200-hs-evm = "\
> +ALTERNATIVE:${PN}:j7200 = "\
>                      j7200-mcu-r5f0_0-fw \
>                      j7200-mcu-r5f0_1-fw \
>                      j7200-main-r5f0_0-fw \
> @@ -230,18 +211,7 @@ ALTERNATIVE:${PN}:j7200-hs-evm = "\
>                      j7200-main-r5f0_1-fw-sec \
>                      "
>  
> -ALTERNATIVE_${PN}:j721s2-evm = "\
> -                    j721s2-mcu-r5f0_0-fw \
> -                    j721s2-mcu-r5f0_1-fw \
> -                    j721s2-main-r5f0_0-fw \
> -                    j721s2-main-r5f0_1-fw \
> -                    j721s2-main-r5f1_0-fw \
> -                    j721s2-main-r5f1_1-fw \
> -                    j721s2-c71_0-fw \
> -                    j721s2-c71_1-fw \
> -                    "
> -
> -ALTERNATIVE:${PN}:j721s2-hs-evm = "\
> +ALTERNATIVE:${PN}:j721s2 = "\
>                      j721s2-mcu-r5f0_0-fw \
>                      j721s2-mcu-r5f0_1-fw \
>                      j721s2-main-r5f0_0-fw \
> @@ -258,7 +228,7 @@ ALTERNATIVE:${PN}:j721s2-hs-evm = "\
>                      j721s2-c71_1-fw-sec \
>                      "
>  
> -ALTERNATIVE:${PN}:j784s4-evm = "\
> +ALTERNATIVE:${PN}:j784s4 = "\
>                      j784s4-mcu-r5f0_0-fw \
>                      j784s4-mcu-r5f0_1-fw \
>                      j784s4-main-r5f0_0-fw \
> -- 
> 2.39.1

