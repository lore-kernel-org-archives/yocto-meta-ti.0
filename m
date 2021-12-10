Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.2428.1639105903342530160
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 09 Dec 2021 19:11:43 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 7E12E40C50;
	Fri, 10 Dec 2021 03:11:41 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Zvpj_HWT8A2J; Fri, 10 Dec 2021 03:11:41 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 5AE6940A03;
	Fri, 10 Dec 2021 03:11:39 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 2444A174710; Thu,  9 Dec 2021 22:11:39 -0500 (EST)
Date: Thu, 9 Dec 2021 22:11:39 -0500
From: "Denys Dmytriyenko" <denis@denix.org>
To: yogeshs@ti.com
Cc: Praneeth Bajjuri <praneeth@ti.com>, meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][dunfell][PATCH] linux-ti-staging: block sa2ul for am64x hs and j7200 hs device
Message-ID: <20211210031139.GF18191@denix.org>
References: <20211210025624.42987-1-yogeshs@ti.com>
MIME-Version: 1.0
In-Reply-To: <20211210025624.42987-1-yogeshs@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Dec 10, 2021 at 02:56:24AM +0000, Yogesh Siraswar via lists.yoctoproject.org wrote:
> SA2UL GP driver will not work for HS. Need SA2UL HS driver.
> Till it is implemented blacklist sa2ul for am64xx hs and j7200 hs
> 
> Change Suggested by: Denys Dmytriyenko <denis@denix.org>

BTW, there's a standard Suggested-by: tag...


> Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>

Reviewed-by: Denys Dmytriyenko <denys@konsulko.com>


> ---
>  recipes-kernel/linux/linux-ti-staging_5.10.bb | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/recipes-kernel/linux/linux-ti-staging_5.10.bb b/recipes-kernel/linux/linux-ti-staging_5.10.bb
> index 9fd9506e..3f3d50af 100644
> --- a/recipes-kernel/linux/linux-ti-staging_5.10.bb
> +++ b/recipes-kernel/linux/linux-ti-staging_5.10.bb
> @@ -27,7 +27,7 @@ SRCREV = "dcc6bedb2c2bdb509709e4ae08303206e95ce6c2"
>  PV = "5.10.65+git${SRCPV}"
>  
>  # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
> -MACHINE_KERNEL_PR_append = "a"
> +MACHINE_KERNEL_PR_append = "b"
>  PR = "${MACHINE_KERNEL_PR}"
>  
>  KERNEL_GIT_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git"
> @@ -43,3 +43,9 @@ module_conf_ti_k3_r5_remoteproc = "softdep ti_k3_r5_remoteproc pre: virtio_rpmsg
>  module_conf_ti_k3_dsp_remoteproc = "softdep ti_k3_dsp_remoteproc pre: virtio_rpmsg_bus"
>  KERNEL_MODULE_PROBECONF += "rpmsg_client_sample ti_k3_r5_remoteproc ti_k3_dsp_remoteproc"
>  KERNEL_MODULE_AUTOLOAD_append_j7 = " rpmsg_kdrv_switch"
> +
> +# Disable SA2UL for AM64x HS and J7200 HS
> +module_conf_sa2ul_am64xx-hs-evm = "blacklist sa2ul"
> +KERNEL_MODULE_PROBECONF_append_am64xx-hs-evm = " sa2ul"
> +module_conf_sa2ul_j7200-hs-evm = "blacklist sa2ul"
> +KERNEL_MODULE_PROBECONF_append_j7200-hs-evm = " sa2ul"
> -- 
> 2.17.1
> 
