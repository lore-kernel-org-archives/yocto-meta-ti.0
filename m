Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 658AEC54E58
	for <webhook@archiver.kernel.org>; Tue, 12 Mar 2024 21:50:26 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.1355.1710280217630024178
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 12 Mar 2024 14:50:18 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 38D8F40C83;
	Tue, 12 Mar 2024 21:50:16 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NuYpMg_TggEN; Tue, 12 Mar 2024 21:50:16 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 5F08F40A0B;
	Tue, 12 Mar 2024 21:50:10 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 76F05163ED7; Tue, 12 Mar 2024 17:50:09 -0400 (EDT)
Date: Tue, 12 Mar 2024 17:50:09 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: u-kumar1@ti.com
Cc: meta-ti@lists.yoctoproject.org, sbellary@baylibre.com,
	sinthu.raja@mistralsolutions.com, reatmon@ti.com
Subject: Re: [meta-ti][kirkstone][PATCH v2] conf: machine: am57xx: export
 ov10635 camera device tree overlay
Message-ID: <20240312215009.GL6072@denix.org>
References: <20240312171132.1330699-1-u-kumar1@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240312171132.1330699-1-u-kumar1@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 12 Mar 2024 21:50:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17520

On Tue, Mar 12, 2024 at 10:41:32PM +0530, Udit Kumar via lists.yoctoproject.org wrote:
> 
> Signed-off-by: Udit Kumar <u-kumar1@ti.com>
> ---
> Changelog:
> Changes in v2:
> 1) Updated subject of patch
> 2) moved overlay to KERNEL_DEVICETREE_PREFIX
> link to v1:
> https://lore.kernel.org/all/20240311111359.1556157-1-u-kumar1@ti.com/
> 
>  meta-ti-bsp/conf/machine/am57xx-evm.conf | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta-ti-bsp/conf/machine/am57xx-evm.conf b/meta-ti-bsp/conf/machine/am57xx-evm.conf
> index 43a6a833..8bcf20ea 100644
> --- a/meta-ti-bsp/conf/machine/am57xx-evm.conf
> +++ b/meta-ti-bsp/conf/machine/am57xx-evm.conf
> @@ -10,6 +10,7 @@ SERIAL_CONSOLES = "115200;ttyS2"
>  
>  KERNEL_DEVICETREE_PREFIX = " \
>      am57 \


> +    ov10635 \
>      ti/ov10635 \

What is the difference between these 2 entries? Which one is correct?

-- 
Denys

