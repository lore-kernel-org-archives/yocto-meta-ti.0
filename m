Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B365C0219B
	for <webhook@archiver.kernel.org>; Tue, 11 Feb 2025 20:27:58 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.3946.1739305672236580501
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 11 Feb 2025 12:27:52 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8885240CC3;
	Tue, 11 Feb 2025 20:27:51 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ewtMZIWrAcmB; Tue, 11 Feb 2025 20:27:51 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 3DB9940C6C;
	Tue, 11 Feb 2025 20:27:45 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 7AD5E16423C; Tue, 11 Feb 2025 15:27:44 -0500 (EST)
Date: Tue, 11 Feb 2025 15:27:44 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: a-dutta@ti.com
Cc: reatmon@ti.com, denys@konsulko.com, u-kumar1@ti.com,
	meta-ti@lists.yoctoproject.org, c-shilwant@ti.com, a-limaye@ti.com
Subject: Re: [meta-ti][scarthgap][PATCH] conf: machine: j722s: Change
 overlay in KERNEL_DEVICETREE_PREFIX
Message-ID: <20250211202744.GT21608@denix.org>
References: <20250211055530.16704-1-a-dutta@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250211055530.16704-1-a-dutta@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 11 Feb 2025 20:27:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18299

Is it really scarthgap-specific?


On Tue, Feb 11, 2025 at 11:25:30AM +0530, Anurag Dutta via lists.yoctoproject.org wrote:
> Currently, the overlay mentioned in KERNEL_DEVICETREE_PREFIX in case
> of j722s is "k3-j7200-evm-mcspi-loopback" which is incorrect. Change
> the overlay to "k3-am625-sk-mcspi-loopback.dtso" in order to carry
> out SPI loopback tests successfully.
> 
> Fixes: 13b691a9bc2d ("conf: machine: j722s: Add overlay to
> KERNEL_DEVICETREE_PREFIX")
> 
> Signed-off-by: Anurag Dutta <a-dutta@ti.com>
> ---
> 
> Test link: https://gist.github.com/anuragdutta731/f93908b31d524ff0c52c3fd314449948
> 
>  meta-ti-bsp/conf/machine/j722s-evm.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-ti-bsp/conf/machine/j722s-evm.conf b/meta-ti-bsp/conf/machine/j722s-evm.conf
> index 8f42866c..52a6cfbd 100644
> --- a/meta-ti-bsp/conf/machine/j722s-evm.conf
> +++ b/meta-ti-bsp/conf/machine/j722s-evm.conf
> @@ -7,7 +7,7 @@ require conf/machine/include/j722s.inc
>  KERNEL_DEVICETREE_PREFIX = " \
>      ti/k3-j722s \
>      ti/k3-fpdlink \
> -    ti/k3-j7200-evm-mcspi-loopback \
> +    ti/k3-am625-sk-mcspi-loopback \
>      ti/k3-v3link \
>  "
>  
> -- 
> 2.34.1

