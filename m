Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82CEAC67861
	for <webhook@archiver.kernel.org>; Mon,  8 Apr 2024 18:09:23 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.115079.1712599761983857927
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 08 Apr 2024 11:09:22 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 3496040C8A;
	Mon,  8 Apr 2024 18:09:21 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YDetdRpbj8x9; Mon,  8 Apr 2024 18:09:21 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 44BE240C81;
	Mon,  8 Apr 2024 18:09:13 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 549D8163EFC; Mon,  8 Apr 2024 14:09:12 -0400 (EDT)
Date: Mon, 8 Apr 2024 14:09:12 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Chirag Shilwant <c-shilwant@ti.com>
Cc: Praneeth Bajjuri <praneeth@ti.com>, Ryan Eatmon <reatmon@ti.com>,
	meta-ti@lists.yoctoproject.org,
	Sai Sree Kartheek Adivi <s-adivi@ti.com>,
	Paresh Bhagat <p-bhagat@ti.com>, Gyan Gupta <g-gupta@ti.com>
Subject: Re: [meta-ti][scarthgap][PATCH] conf: am335x-evm: Bump up
 max_leb_cnt
Message-ID: <20240408180912.GA28791@denix.org>
References: <20240408161301.835852-1-c-shilwant@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240408161301.835852-1-c-shilwant@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 08 Apr 2024 18:09:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17562

Are there still any UBI-based tests running on am335x platform?


On Mon, Apr 08, 2024 at 09:43:01PM +0530, Chirag Shilwant wrote:
> New features added require another increase to max_leb_cnt.
> 
> Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
> ---
>  meta-ti-bsp/conf/machine/am335x-evm.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-ti-bsp/conf/machine/am335x-evm.conf b/meta-ti-bsp/conf/machine/am335x-evm.conf
> index 97a4b8b0..5b7739ce 100644
> --- a/meta-ti-bsp/conf/machine/am335x-evm.conf
> +++ b/meta-ti-bsp/conf/machine/am335x-evm.conf
> @@ -22,7 +22,7 @@ SERIAL_CONSOLES = "115200;ttyS0 115200;ttyS3"
>  # UBI: logical eraseblock size:    126976 bytes
>  # from ubiattach stdout:
>  # UBI device number 0, total 1988 LEBs
> -MKUBIFS_ARGS ?= "-F -m 2048 -e 126976 -c 12000"
> +MKUBIFS_ARGS ?= "-F -m 2048 -e 126976 -c 13000"
>  
>  # do ubiattach /dev/ubi_ctrl -m 7 -O 2048
>  # from dmesg:
> -- 
> 2.34.1

