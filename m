Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93AE2C83038
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 16:13:21 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.1227.1751386397718286101
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 01 Jul 2025 09:13:18 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 191C440C2C;
	Tue,  1 Jul 2025 16:13:17 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9FKv8eFNYraf; Tue,  1 Jul 2025 16:13:17 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id D262640B13;
	Tue,  1 Jul 2025 16:13:13 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 8C79B16B0EA; Tue,  1 Jul 2025 12:13:13 -0400 (EDT)
Date: Tue, 1 Jul 2025 12:13:13 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master/scarthgap][PATCH] trusted-firmware-a: Move
 back to tfa upstream except for am62lxx
Message-ID: <20250701161313.GT18383@denix.org>
References: <20250701155042.5529-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250701155042.5529-1-reatmon@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 01 Jul 2025 16:13:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18749

On Tue, Jul 01, 2025 at 10:50:42AM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
> This moves all of the platforms back to the main TFA repository, but
> still points to the TI fork for the am62lxx platform while we continue
> to work on upstreaming the needed patches.

When I stumbled upon this change being tested in master-wip last wekk, I 
noticed it was failing due to LIC_FILES_CHKSUM - I see you fixed it here.

Still, as previously discussed, should there be a brief comment explaining 
why the hash is different?


> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>  .../trusted-firmware-a-ti.inc                   | 17 ++++++++++++-----
>  1 file changed, 12 insertions(+), 5 deletions(-)
> 
> diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
> index c17ac9de..ec52d09c 100644
> --- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
> +++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
> @@ -1,12 +1,19 @@
>  # NOTE: This .inc file with customizations only gets included for K3 platforms
>  
> -PV = "2.12+git"
> -SRCREV_tfa = "2ab59f45ad0a5d95b5cb339c0f64686954377050"
> -SRC_URI_TRUSTED_FIRMWARE_A = "git://github.com/TexasInstruments/arm-trusted-firmware.git;protocol=https"
> -SRCBRANCH = "ti-master"
> +PV = "2.13+git"
> +
> +LIC_FILES_CHKSUM = "file://docs/license.rst;md5=6ed7bace7b0bc63021c6eba7b524039e"
> +SRCREV_tfa = "d90bb650fe4cb3784f62214ab5829f4051c38d0a"
> +SRC_URI_TRUSTED_FIRMWARE_A = "git://git.trustedfirmware.org/TF-A/trusted-firmware-a.git;protocol=https"
> +SRCBRANCH = "master"
> +
> +LIC_FILES_CHKSUM:am62lxx = "file://docs/license.rst;md5=1118e32884721c0be33267bd7ae11130"
> +SRCREV_tfa:am62lxx = "2ab59f45ad0a5d95b5cb339c0f64686954377050"
> +SRC_URI_TRUSTED_FIRMWARE_A:am62lxx = "git://github.com/TexasInstruments/arm-trusted-firmware.git;protocol=https"
> +SRCBRANCH:am62lxx = "ti-master"
> +
>  SRC_URI = "${SRC_URI_TRUSTED_FIRMWARE_A};name=tfa;branch=${SRCBRANCH}"
>  
> -LIC_FILES_CHKSUM = "file://docs/license.rst;md5=1118e32884721c0be33267bd7ae11130"
>  COMPATIBLE_MACHINE = "k3"
>  
>  TFA_BUILD_TARGET = "all"
> -- 
> 2.17.1

