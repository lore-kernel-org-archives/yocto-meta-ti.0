Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85632D46606
	for <webhook@archiver.kernel.org>; Thu, 15 Jan 2026 17:40:57 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.404.1768498849950624835
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 15 Jan 2026 09:40:50 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 30D8D40CB6;
	Thu, 15 Jan 2026 17:40:49 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KVSa-2WVnsUp; Thu, 15 Jan 2026 17:40:49 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E0184406B9;
	Thu, 15 Jan 2026 17:40:45 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 0661D1778C0; Thu, 15 Jan 2026 12:40:45 -0500 (EST)
Date: Thu, 15 Jan 2026 12:40:44 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master][PATCH] linux-ti-staging-6.18: Add config
 fragment for j721e
Message-ID: <20260115174044.GS11121@denix.org>
References: <20260115160413.2999023-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115160413.2999023-1-reatmon@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 15 Jan 2026 17:40:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19420

On Thu, Jan 15, 2026 at 10:04:13AM -0600, Ryan Eatmon via lists.yoctoproject.org wrote:
> The ti-vxe-vxd-driver (out of tree module) requires the VIDEOBUF2_DMA_SG
> module to be built.  But the in layer defconfig is pruning several
> options from the default defconfig that prevents us from easily turning
> it back on.  This KERNEL_CONFIG_FRAGMENTS entry will turn on all of the
> needed options to re-enable the VIDEOBUF2_DMA_SG setting.
> 
> This might be a temporary fix as there is effort to move the
> ti-vxe-vxd-driver back into the kernel tree which will clean up the
> Kconfig mess that requires this fragment.
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>  .../linux/linux-ti-staging-6.18/j721e_vb2_dma_sg.cfg           | 2 ++
>  meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb      | 3 +++
>  2 files changed, 5 insertions(+)
>  create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.18/j721e_vb2_dma_sg.cfg
> 
> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.18/j721e_vb2_dma_sg.cfg b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.18/j721e_vb2_dma_sg.cfg
> new file mode 100644
> index 00000000..d7249909
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.18/j721e_vb2_dma_sg.cfg
> @@ -0,0 +1,2 @@
> +CONFIG_VIDEOBUF2_DMA_SG=m
> +CONFIG_ARCH_ROCKCHIP=y
> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
> index 169d8395..51a4f63f 100644
> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
> @@ -36,4 +36,7 @@ module_conf_ti_k3_r5_remoteproc = "softdep ti_k3_r5_remoteproc pre: virtio_rpmsg
>  module_conf_ti_k3_dsp_remoteproc = "softdep ti_k3_dsp_remoteproc pre: virtio_rpmsg_bus"
>  KERNEL_MODULE_PROBECONF += "rpmsg_client_sample ti_k3_r5_remoteproc ti_k3_dsp_remoteproc"
>  
> +SRC_URI:append:j721e = " file://j721e_vb2_dma_sg.cfg"
> +KERNEL_CONFIG_FRAGMENTS:j721e += "${UNPACKDIR}/j721e_vb2_dma_sg.cfg"

Instead of mixing machine override and +=. it should also be :append:j721e 
here


>  DEFAULT_PREFERENCE = "-1"
> -- 
> 2.43.0

