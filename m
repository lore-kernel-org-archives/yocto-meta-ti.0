Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7720C433EF
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 20:02:28 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.172.1647979347772147779
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 22 Mar 2022 13:02:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 1AD2440C3E;
	Tue, 22 Mar 2022 20:02:27 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YMNKx-37cJ8A; Tue, 22 Mar 2022 20:02:27 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id ED57A40B13;
	Tue, 22 Mar 2022 20:02:22 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id B926D174837; Tue, 22 Mar 2022 16:02:22 -0400 (EDT)
Date: Tue, 22 Mar 2022 16:02:22 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Yogesh Siraswar <yogeshs@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][dunfell][PATCH v2 3/7] recipes: Pick up correct
 image and build DM to boot images
Message-ID: <20220322200222.GP23554@denix.org>
References: <20220322181558.20684-1-reatmon@ti.com>
 <20220322181558.20684-4-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220322181558.20684-4-reatmon@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 22 Mar 2022 20:02:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14538

On Tue, Mar 22, 2022 at 01:15:54PM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
> From: Nishanth Menon <nm@ti.com>
> 
> Make sure we have bootable wic images.

First of all, can this be squashed with the previous patch?


> Signed-off-by: Nishanth Menon <nm@ti.com>
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>  recipes-bsp/u-boot/u-boot-ti.inc           | 1 +
>  recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/recipes-bsp/u-boot/u-boot-ti.inc b/recipes-bsp/u-boot/u-boot-ti.inc
> index 6098f989..231b7647 100644
> --- a/recipes-bsp/u-boot/u-boot-ti.inc
> +++ b/recipes-bsp/u-boot/u-boot-ti.inc
> @@ -41,6 +41,7 @@ PACKAGECONFIG[dm] = "DM=${STAGING_DIR_HOST}${nonarch_base_libdir}/firmware/pdk-i
>  
>  PACKAGECONFIG_append_aarch64 = " atf optee"
>  PACKAGECONFIG_append_j7 = " dm"
> +PACKAGECONFIG_append_am62xx = " dm"
>  
>  COMPATIBLE_MACHINE = "(ti-soc)"
>  
> diff --git a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> index 431c13da..4cd08a36 100644
> --- a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> +++ b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> @@ -19,7 +19,7 @@ PLAT_SFX_j7200-hs-evm = "j7200"
>  PLAT_SFX_j721s2-evm = "j721s2"
>  PLAT_SFX_am65xx = "am65xx"
>  PLAT_SFX_am64xx = "am64xx"
> -PLAT_SFX_am62xx-evm = "am62xx"
> +PLAT_SFX_am62xx-evm = "am62x"

am62xx SOC_FAMILY in the override?


>  FILESEXTRAPATHS_prepend := "${METATIBASE}/recipes-bsp/ti-sci-fw/files/:"
>  require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
> -- 
> 2.17.1
> 

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964

