Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7609.1792612221035258000
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 21 Oct 2026 12:50:22 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id D837040CD4;
	Wed, 21 Oct 2026 19:50:19 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2i7kOp7jiY6J; Wed, 21 Oct 2026 19:50:19 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 9173340CCC;
	Wed, 21 Oct 2026 19:50:16 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 78A0017EF06; Wed, 21 Oct 2026 15:50:15 -0400 (EDT)
Date: Wed, 21 Oct 2026 15:50:15 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: r-sharma3@ti.com
Cc: meta-ti@lists.yoctoproject.org, reatmon@ti.com, denys@konsulko.com
Subject: Re: [meta-ti] [PATCH 2/2] am62lxx-evm: Add DSI config fragments
 for display support
Message-ID: <20261021195015.GX4190@denix.org>
References: <20261021145213.853962-1-r-sharma3@ti.com>
 <20261021145213.853962-2-r-sharma3@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261021145213.853962-2-r-sharma3@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-ti@lists.yoctoproject.org>; Wed, 21 Oct 2026 19:50:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20477

On Wed, Oct 21, 2026 at 08:22:13PM +0530, Rahul Sharma via lists.yoctoproject.org wrote:
> Add U-Boot configuration fragments for DSI display support with
> Raspberry Pi panel on AM62L EVM.
> 
> The fragments enable:
> - am62x_a53_splashscreen.config: Splash screen on Cortex-A53
> - k3_a53_dsi.config: DSI support for K3 Cortex-A53
> - am62lx_evm_dsi_rpi_panel.config: DSI Raspberry Pi panel support
> 
> Signed-off-by: Rahul Sharma <r-sharma3@ti.com>
> ---
>  meta-ti-bsp/conf/machine/am62lxx-evm.conf | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/meta-ti-bsp/conf/machine/am62lxx-evm.conf b/meta-ti-bsp/conf/machine/am62lxx-evm.conf
> index 7a422617..e3d3bdd9 100644
> --- a/meta-ti-bsp/conf/machine/am62lxx-evm.conf
> +++ b/meta-ti-bsp/conf/machine/am62lxx-evm.conf
> @@ -26,3 +26,6 @@ UBOOT_DTB_LOADADDRESS = "0x84f00000"
>  UBOOT_DTBO_LOADADDRESS = "0x84f80000"
>  
>  TFA_BOARD = "am62lx-evm"
> +
> +# DSI config fragments for display support
> +UBOOT_FRAGMENTS = "am62x_a53_splashscreen.config k3_a53_dsi.config am62lx_evm_dsi_rpi_panel.config"

Do these config fragments exist in every U-Boot version we support?
https://git.yoctoproject.org/meta-ti/tree/meta-ti-bsp/recipes-bsp/u-boot

Same question for the other patch.

-- 
Denys
