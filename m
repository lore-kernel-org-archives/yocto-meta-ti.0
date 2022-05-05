Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D705C433F5
	for <webhook@archiver.kernel.org>; Thu,  5 May 2022 00:36:41 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.5257.1651710994562344688
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 04 May 2022 17:36:35 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id A680440C06;
	Thu,  5 May 2022 00:36:33 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yfCmfpI1Nj6N; Thu,  5 May 2022 00:36:33 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 76C4C40B05;
	Thu,  5 May 2022 00:36:28 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id BF73D17491E; Wed,  4 May 2022 20:36:27 -0400 (EDT)
Date: Wed, 4 May 2022 20:36:27 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Praneeth Bajjuri <praneeth@ti.com>
Cc: Ryan Eatmon <reatmon@ti.com>, Nishanth Menon <nm@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	Dave Gerlach <d-gerlach@ti.com>, meta-ti@lists.yoctoproject.org
Subject: Re: [dunfell PATCH v2 2/2] conf/machine: am62xx: Update build flag
 for low power mode
Message-ID: <20220505003627.GM9834@denix.org>
References: <20220504234930.6508-1-praneeth@ti.com>
 <20220504234930.6508-3-praneeth@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220504234930.6508-3-praneeth@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 05 May 2022 00:36:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14701

On Wed, May 04, 2022 at 06:49:30PM -0500, Praneeth Bajjuri wrote:
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
> +
>  # AM62 supports multi-certificate images, use the same
>  IMAGE_BOOT_FILES = "${IMAGE_BOOT_FILES_MULTI_CERT}"
>  
> diff --git a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
> index 80b1d664..5264fa97 100644
> --- a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
> +++ b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
> @@ -9,6 +9,7 @@ TFA_INSTALL_TARGET_k3 = "bl31"
>  TFA_SPD_k3 = "opteed"
>  
>  EXTRA_OEMAKE_append_k3 = "${@ 'K3_USART=' + d.getVar('TFA_K3_USART') if d.getVar('TFA_K3_USART') else ''}"
> +EXTRA_OEMAKE_append_k3 += "${@ 'K3_PM_SYSTEM_SUSPEND=' + d.getVar('TFA_K3_SYSTEM_SUSPEND') if d.getVar('TFA_K3_SYSTEM_SUSPEND') else ''}"

NAK

Either append or +=, not both!


>  do_compile_append_am65xx-hs-evm() {
>  	export TI_SECURE_DEV_PKG=${TI_SECURE_DEV_PKG}
> -- 
> 2.17.1
> 

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964

