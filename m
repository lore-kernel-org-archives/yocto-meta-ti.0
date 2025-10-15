Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2E4BCCD194
	for <webhook@archiver.kernel.org>; Wed, 15 Oct 2025 16:50:34 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.23012.1760547030564881816
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 15 Oct 2025 09:50:31 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8888A40C8F;
	Wed, 15 Oct 2025 16:50:29 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FyIiru15a8wk; Wed, 15 Oct 2025 16:50:29 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 607A240A0B;
	Wed, 15 Oct 2025 16:50:27 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id BD0CC167E9D; Wed, 15 Oct 2025 12:50:26 -0400 (EDT)
Date: Wed, 15 Oct 2025 12:50:26 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: j-sahu@ti.com
Cc: meta-ti@lists.yoctoproject.org, Ryan Eatmon <reatmon@ti.com>
Subject: Re: [meta-ti][scarthgap/master][PATCH] conf: am335x-evm and
 am437x-evm: Bump up max_leb_cnt
Message-ID: <20251015165026.GT3125@denix.org>
References: <20251015163336.3955455-1-j-sahu@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251015163336.3955455-1-j-sahu@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 15 Oct 2025 16:50:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19136

On Wed, Oct 15, 2025 at 10:03:36PM +0530, Jeevan via lists.yoctoproject.org wrote:
> New features added require another increase to max_leb_cnt

Quick question - is UBI still being used and/or tested on these platforms?

If this is no longer part of regular testing, maybe it's time to disable UBI 
by default?


> Signed-off-by: Telukula Jeevan Kumar Sahu <j-sahu@ti.com>
> ---
>  meta-ti-bsp/conf/machine/am335x-evm.conf | 2 +-
>  meta-ti-bsp/conf/machine/am437x-evm.conf | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-ti-bsp/conf/machine/am335x-evm.conf b/meta-ti-bsp/conf/machine/am335x-evm.conf
> index 029e761b..cc5d87d7 100644
> --- a/meta-ti-bsp/conf/machine/am335x-evm.conf
> +++ b/meta-ti-bsp/conf/machine/am335x-evm.conf
> @@ -22,7 +22,7 @@ SERIAL_CONSOLES = "115200;ttyS0 115200;ttyS3"
>  # UBI: logical eraseblock size:    126976 bytes
>  # from ubiattach stdout:
>  # UBI device number 0, total 1988 LEBs
> -MKUBIFS_ARGS ?= "-F -m 2048 -e 126976 -c 16000"
> +MKUBIFS_ARGS ?= "-F -m 2048 -e 126976 -c 18000"
>  
>  # do ubiattach /dev/ubi_ctrl -m 7 -O 2048
>  # from dmesg:
> diff --git a/meta-ti-bsp/conf/machine/am437x-evm.conf b/meta-ti-bsp/conf/machine/am437x-evm.conf
> index 248add70..bbe956f2 100644
> --- a/meta-ti-bsp/conf/machine/am437x-evm.conf
> +++ b/meta-ti-bsp/conf/machine/am437x-evm.conf
> @@ -21,7 +21,7 @@ SERIAL_CONSOLES = "115200;ttyS0"
>  # UBI: logical eraseblock size:    253952 bytes
>  # from ubiattach stdout:
>  # UBI device number 0, total 994 LEBs
> -MKUBIFS_ARGS = "-F -m 4096 -e 253952 -c 8000"
> +MKUBIFS_ARGS = "-F -m 4096 -e 253952 -c 10000"
>  
>  # do ubiattach /dev/ubi_ctrl -m 11 -O 4096
>  # from dmesg:
> -- 
> 2.34.1

