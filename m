Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F105C02198
	for <webhook@archiver.kernel.org>; Wed,  5 Feb 2025 17:17:09 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.17962.1738775824412017124
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 05 Feb 2025 09:17:04 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id C0F6A40B66;
	Wed,  5 Feb 2025 17:17:03 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tFc5jfdWMW66; Wed,  5 Feb 2025 17:17:03 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 99211407E5;
	Wed,  5 Feb 2025 17:17:01 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 575E4164210; Wed,  5 Feb 2025 12:17:01 -0500 (EST)
Date: Wed, 5 Feb 2025 12:17:01 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Chirag Shilwant <c-shilwant@ti.com>
Cc: meta-ti@lists.yoctoproject.org, Ryan Eatmon <reatmon@ti.com>
Subject: Re: [meta-ti][master/scarthgap][PATCH v2 3/5] trusted-firmware-a:
 Switch TFA to TI fork
Message-ID: <20250205171701.GL21608@denix.org>
References: <20250205111211.1847450-1-c-shilwant@ti.com>
 <20250205111211.1847450-4-c-shilwant@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250205111211.1847450-4-c-shilwant@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 05 Feb 2025 17:17:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18279

On Wed, Feb 05, 2025 at 04:42:09PM +0530, Chirag Shilwant wrote:
> - While TFA patches for K3-based AM62L platform are under
> review upstream, temporarily switch to TI's GitHub fork
> for all K3 platforms to prevent disruptions and ensure timely bringup
> 
> - Also update the LIC_FILES_CHKSUM since the license file changed between
> upstream TFA v2.12 [1] & the SRCREV in this commit [2][3]
> 
> [1]: https://github.com/ARM-software/arm-trusted-firmware/blob/v2.12/docs/license.rst
> 
> [2]: https://github.com/ARM-software/arm-trusted-firmware/blob/master/docs/license.rst
> 
> [3]: https://github.com/TexasInstruments/arm-trusted-firmware/blob/ti-master/docs/license.rst

Sorry for the late reply, but master (styhead+) now requires License-Update: 
tag for such cases:

https://docs.yoctoproject.org/dev/contributor-guide/recipe-style-guide.html#license-updates


> Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
> ---
>  .../trusted-firmware-a/trusted-firmware-a-ti.inc            | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
> index df3cea23..c628eb15 100644
> --- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
> +++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
> @@ -1,7 +1,7 @@
>  PV:k3 = "2.12+git"
> -SRCREV_tfa:k3 = "4ec2948fe3f65dba2f19e691e702f7de2949179c"
> -LIC_FILES_CHKSUM:k3 = "file://docs/license.rst;md5=83b7626b8c7a37263c6a58af8d19bee1"
> -SRC_URI:k3 = "git://git.trustedfirmware.org/TF-A/trusted-firmware-a.git;protocol=https;name=tfa;branch=master"
> +SRCREV_tfa:k3 = "5227171c079d0c7d22a6d37b5cec079c8c5bb4b1"
> +LIC_FILES_CHKSUM:k3 = "file://docs/license.rst;md5=1118e32884721c0be33267bd7ae11130"
> +SRC_URI:k3 = "git://github.com/TexasInstruments/arm-trusted-firmware.git;protocol=https;name=tfa;branch=ti-master"
>  COMPATIBLE_MACHINE:k3 = "k3"
>  TFA_BUILD_TARGET:k3 = "all"
>  TFA_INSTALL_TARGET:k3 = "bl31"
> -- 
> 2.34.1

