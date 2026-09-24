Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8699C98321
	for <webhook@archiver.kernel.org>; Thu, 24 Sep 2026 17:08:28 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3363.1790269697560664594
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 24 Sep 2026 10:08:18 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 62AB840C82;
	Thu, 24 Sep 2026 17:08:16 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7f2LIHnTszS5; Thu, 24 Sep 2026 17:08:16 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 28DE640BA7;
	Thu, 24 Sep 2026 17:08:14 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 4E55C17E96B; Thu, 24 Sep 2026 13:08:13 -0400 (EDT)
Date: Thu, 24 Sep 2026 13:08:13 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: s-sadik@ti.com
Cc: meta-ti@lists.yoctoproject.org, Ryan eatmon <reatmon@ti.com>
Subject: Re: [meta-ti] [PATCH v2][wrynose] conf: am335x-evm : Bump up
 max_leb_cnt
Message-ID: <20260924170813.GE4190@denix.org>
References: <20260924102001.820922-1-s-sadik@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924102001.820922-1-s-sadik@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 24 Sep 2026 17:08:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20417

On Thu, Sep 24, 2026 at 03:50:01PM +0530, Sadik via lists.yoctoproject.org wrote:
> New features added require another increase to max_leb_cnt
> 
> Signed-off-by: Mahammed Sadik Shaik <s-sadik@ti.com>
> ---
> v1 <-> v2
>   update missing branch specifier

Not for master?


> ---
>  meta-ti-bsp/conf/machine/am335x-evm.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-ti-bsp/conf/machine/am335x-evm.conf b/meta-ti-bsp/conf/machine/am335x-evm.conf
> index cc5d87d7..0dd4e7ce 100644
> --- a/meta-ti-bsp/conf/machine/am335x-evm.conf
> +++ b/meta-ti-bsp/conf/machine/am335x-evm.conf
> @@ -22,7 +22,7 @@ SERIAL_CONSOLES = "115200;ttyS0 115200;ttyS3"
>  # UBI: logical eraseblock size:    126976 bytes
>  # from ubiattach stdout:
>  # UBI device number 0, total 1988 LEBs
> -MKUBIFS_ARGS ?= "-F -m 2048 -e 126976 -c 18000"
> +MKUBIFS_ARGS ?= "-F -m 2048 -e 126976 -c 24000"
>  
>  # do ubiattach /dev/ubi_ctrl -m 7 -O 2048
>  # from dmesg:
> -- 
> 2.34.1

