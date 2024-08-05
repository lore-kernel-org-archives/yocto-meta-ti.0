Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 969B8C3DA7F
	for <webhook@archiver.kernel.org>; Mon,  5 Aug 2024 03:12:03 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.60.1722827517931797506
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 04 Aug 2024 20:11:58 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id F0A3C40CAF;
	Mon,  5 Aug 2024 03:11:55 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kOv_QcDNdrze; Mon,  5 Aug 2024 03:11:55 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C2A4340C21;
	Mon,  5 Aug 2024 03:11:53 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id BF394164052; Sun,  4 Aug 2024 23:11:52 -0400 (EDT)
Date: Sun, 4 Aug 2024 23:11:52 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Praneeth Bajjuri <praneeth@ti.com>, meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master/scarthgap][PATCH] conf: machine:
 omapl138-lcdk: Update KERNEL_DEVICETREE
Message-ID: <20240805031152.GV17572@denix.org>
References: <20240804221509.3434-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240804221509.3434-1-reatmon@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 05 Aug 2024 03:12:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17922

On Sun, Aug 04, 2024 at 05:15:09PM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
> Update the entry for KERNEL_DEVICETREE to match what is in the 6.10
> kernel.

Will this change work with 6.6 (or even 6.1)?


> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>  meta-ti-bsp/conf/machine/omapl138-lcdk.conf | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-ti-bsp/conf/machine/omapl138-lcdk.conf b/meta-ti-bsp/conf/machine/omapl138-lcdk.conf
> index fdbaffae..458caaff 100644
> --- a/meta-ti-bsp/conf/machine/omapl138-lcdk.conf
> +++ b/meta-ti-bsp/conf/machine/omapl138-lcdk.conf
> @@ -21,6 +21,6 @@ KERNEL_DEVICETREE_PREFIX = " \
>  "
>  
>  KERNEL_DEVICETREE = " \
> -    da850-evm.dtb \
> -    da850-lcdk.dtb \
> +    ti/davinci/da850-evm.dtb \
> +    ti/davinci/da850-lcdk.dtb \
>  "
> -- 
> 2.17.1

