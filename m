Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1526C54E94
	for <webhook@archiver.kernel.org>; Wed, 25 Jan 2023 23:18:59 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.61611.1674688731578607746
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 25 Jan 2023 15:18:51 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 2160340BD6;
	Wed, 25 Jan 2023 23:18:50 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ExXc3CqW7dQp; Wed, 25 Jan 2023 23:18:50 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id DDA2B409B0;
	Wed, 25 Jan 2023 23:18:44 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id C2711163708; Wed, 25 Jan 2023 18:18:24 -0500 (EST)
Date: Wed, 25 Jan 2023 18:18:24 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: sinthu.raja@mistralsolutions.com
Cc: reatmon@ti.com, denys@ti.com, detheridge@ti.com,
	meta-ti@lists.yoctoproject.org, Sinthu Raja <sinthu.raja@ti.com>
Subject: Re: [meta-ti][master/dunfell][PATCH] conf: machine: j721s2: Fix
 DTB overlay extension for OV5640
Message-ID: <20230125231824.GA22689@denix.org>
References: <20230125080136.8308-1-sinthu.raja@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230125080136.8308-1-sinthu.raja@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 25 Jan 2023 23:18:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15657

The only minor issue is that this only applies to dunfell and won't apply to 
master due to the layer restructure. Otherwise looks fine to me.


On Wed, Jan 25, 2023 at 01:31:36PM +0530, Sinthu Raja M via lists.yoctoproject.org wrote:
> From: Sinthu Raja <sinthu.raja@ti.com>
> 
> The extension for the OV5640 overlay is incorrect. Therefore, update the
> correct extension to build the overlay as .dtbo
> 
> Fixes: f67e9805 ("conf: machine: j721s2: Add AM68 SK specific dtb and dtbo to KERNEL_DEVICETREE")
> Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
> ---
>  conf/machine/j721s2-evm.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/conf/machine/j721s2-evm.conf b/conf/machine/j721s2-evm.conf
> index 8d3f8db8..488a1140 100644
> --- a/conf/machine/j721s2-evm.conf
> +++ b/conf/machine/j721s2-evm.conf
> @@ -14,7 +14,7 @@ OPTEE_K3_USART = "0x8"
>  
>  KERNEL_DEVICETREE = " \
>      ti/k3-am68-sk-base-board.dtb \
> -    ti/k3-am68-sk-bb-csi2-ov5640.dtb \
> +    ti/k3-am68-sk-bb-csi2-ov5640.dtbo \
>      ti/k3-am68-sk-bb-rpi-cam-imx219.dtbo \
>      ti/k3-am68-sk-som-ddr_mem_carveout.dtbo \
>      ti/k3-j721s2-common-proc-board.dtb \
> -- 
> 2.36.1

