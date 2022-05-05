Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A91B1C433EF
	for <webhook@archiver.kernel.org>; Thu,  5 May 2022 22:50:51 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.2992.1651791046097777005
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 05 May 2022 15:50:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 23BB140BE9;
	Thu,  5 May 2022 22:50:45 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rzeuHJ-y1zqH; Thu,  5 May 2022 22:50:45 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id F415040A3D;
	Thu,  5 May 2022 22:50:41 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 1F48B174920; Thu,  5 May 2022 18:50:41 -0400 (EDT)
Date: Thu, 5 May 2022 18:50:41 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][dunfell][PATCH v3 2/2] conf/machine: am62xx: Update
 build flag for low power mode
Message-ID: <20220505225041.GO9834@denix.org>
References: <20220505013006.27140-1-reatmon@ti.com>
 <20220505013006.27140-3-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220505013006.27140-3-reatmon@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 05 May 2022 22:50:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14712

On Wed, May 04, 2022 at 08:30:06PM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
> From: Nishanth Menon <nm@ti.com>
> 
> Update build flag for arm-trusted-firmware to include low power mode
> support
> 
> K3_PM_SYSTEM_SUSPEND is added in arm-trusted-firmware now which enables
> low power mode support for am62xx.
> 
> Signed-off-by: Nishanth Menon <nm@ti.com>
> Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>  conf/machine/include/am62xx.inc                              | 2 ++
>  recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend | 1 +
>  2 files changed, 3 insertions(+)
> 
> diff --git a/conf/machine/include/am62xx.inc b/conf/machine/include/am62xx.inc
> index e8823dd2..ff857b97 100644
> --- a/conf/machine/include/am62xx.inc
> +++ b/conf/machine/include/am62xx.inc
> @@ -6,6 +6,8 @@ MACHINE_FEATURES += "screen touchscreen"
>  SERIAL_CONSOLES = "115200;ttyS2"
>  SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
>  
> +TFA_K3_SYSTEM_SUSPEND = "1"

Might want to keep this TFA_ variable together with the other TFA_BOARD being 
set futher down in the file, to avoid scattering them all over...

Otherwise looks good to me.


> +
>  # AM62 supports multi-certificate images, use the same
>  IMAGE_BOOT_FILES = "${IMAGE_BOOT_FILES_MULTI_CERT}"
>  
> diff --git a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
> index 80b1d664..68bfa899 100644
> --- a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
> +++ b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
> @@ -9,6 +9,7 @@ TFA_INSTALL_TARGET_k3 = "bl31"
>  TFA_SPD_k3 = "opteed"
>  
>  EXTRA_OEMAKE_append_k3 = "${@ 'K3_USART=' + d.getVar('TFA_K3_USART') if d.getVar('TFA_K3_USART') else ''}"
> +EXTRA_OEMAKE_append_k3 = "${@ 'K3_PM_SYSTEM_SUSPEND=' + d.getVar('TFA_K3_SYSTEM_SUSPEND') if d.getVar('TFA_K3_SYSTEM_SUSPEND') else ''}"
>  
>  do_compile_append_am65xx-hs-evm() {
>  	export TI_SECURE_DEV_PKG=${TI_SECURE_DEV_PKG}
> -- 
> 2.17.1

