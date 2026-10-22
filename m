Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4238.1792689349290459075
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 22 Oct 2026 10:15:50 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 024BB40CCC;
	Thu, 22 Oct 2026 17:15:48 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 24ZvH8e32RNb; Thu, 22 Oct 2026 17:15:47 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id ADEEE40CB6;
	Thu, 22 Oct 2026 17:15:44 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id BB8ED17EF05; Thu, 22 Oct 2026 13:15:43 -0400 (EDT)
Date: Thu, 22 Oct 2026 13:15:43 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: r-sharma3@ti.com
Cc: meta-ti@lists.yoctoproject.org, reatmon@ti.com, denys@konsulko.com
Subject: Re: [meta-ti] [master/wrynose][PATCH v2 1/2] am62pxx-evm: Add OLDI
 config fragment for Microtips MF101HIE panel
Message-ID: <20261022171543.GY4190@denix.org>
References: <20261022085156.1753733-1-r-sharma3@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261022085156.1753733-1-r-sharma3@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-ti@lists.yoctoproject.org>; Thu, 22 Oct 2026 17:15:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20485

On Thu, Oct 22, 2026 at 02:21:55PM +0530, Rahul Sharma via lists.yoctoproject.org wrote:
> Add U-Boot configuration fragment for OLDI display support with
> Microtips MF101HIE panel on AM62P5 EVM.
> 
> The fragment am62p5_j722s_evm_oldi-microtips-mf101hie-panel.config
> enables OpenLDI/LVDS Display Interface support for the panel.
> 
> Signed-off-by: Rahul Sharma <r-sharma3@ti.com>
> ---
>  meta-ti-bsp/conf/machine/am62pxx-evm.conf | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/meta-ti-bsp/conf/machine/am62pxx-evm.conf b/meta-ti-bsp/conf/machine/am62pxx-evm.conf
> index cbae21c4..d78d8a3a 100644
> --- a/meta-ti-bsp/conf/machine/am62pxx-evm.conf
> +++ b/meta-ti-bsp/conf/machine/am62pxx-evm.conf
> @@ -48,3 +48,6 @@ IMAGE_BOOT_FILES += "${ECDSA_BOOT_FILES}"
>  # For AM62P tisdk-display-cluster image, splash screen is handled by SBL.
>  # Hence, disable the A53 based splash screen using the am62x_evm_prune_splashscreen.config fragment present in ti-u-boot tree
>  UBOOT_FRAGMENTS = "${@oe.utils.conditional('DISPLAY_CLUSTER_ENABLE', '1', 'am62x_evm_prune_splashscreen.config', '', d)}"
> +
> +# OLDI config fragment for Microtips MF101HIE panel display support
> +UBOOT_FRAGMENTS:bsp-ti-6_18 += "am62p5_j722s_evm_oldi-microtips-mf101hie-panel.config"

This does not do what you expect it to do and will override the previous value 
of UBOOT_FRAGMENTS set above.

The recommendation is to not mix operators like += with overrides. E.g.:
https://git.yoctoproject.org/meta-ti/tree/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc#n28

-- 
Denys
