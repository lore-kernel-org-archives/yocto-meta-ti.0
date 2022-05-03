Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCC4DC433F5
	for <webhook@archiver.kernel.org>; Tue,  3 May 2022 20:16:21 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.456.1651608978304754793
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 03 May 2022 13:16:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id D9E1A40BE9;
	Tue,  3 May 2022 20:16:16 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wnqzb1gQzqlu; Tue,  3 May 2022 20:16:16 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id AA99440A3D;
	Tue,  3 May 2022 20:16:11 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id DD53F174917; Tue,  3 May 2022 16:16:10 -0400 (EDT)
Date: Tue, 3 May 2022 16:16:10 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Praneeth Bajjuri <praneeth@ti.com>
Cc: Ryan Eatmon <reatmon@ti.com>, Nishanth Menon <nm@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	Dave Gerlach <d-gerlach@ti.com>, meta-ti@lists.yoctoproject.org
Subject: Re: [dunfell PATCH] conf/machine: am62xx: Update build flag for
 low power mode
Message-ID: <20220503201610.GA9834@denix.org>
References: <20220503192509.24537-1-praneeth@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220503192509.24537-1-praneeth@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 03 May 2022 20:16:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14689

On Tue, May 03, 2022 at 02:25:09PM -0500, Praneeth Bajjuri wrote:
> Update build flag for arm-trusted-firmware to include low power mode
> support
> 
> K3_PM_SYSTEM_SUSPEND is added in arm-trusted-firmware now which enables
> low power mode support for am62xx.
> 
> Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
> ---
>  conf/machine/include/am62xx.inc | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/conf/machine/include/am62xx.inc b/conf/machine/include/am62xx.inc
> index e8823dd2..59cb7053 100644
> --- a/conf/machine/include/am62xx.inc
> +++ b/conf/machine/include/am62xx.inc
> @@ -13,5 +13,6 @@ do_image_wic[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
>  do_image_tar[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
>  
>  TFA_BOARD = "lite"
> +K3_PM_SYSTEM_SUSPEND = "1"

How is this getting passed to ATF?


>  OPTEEMACHINE = "k3-am65x"
>  OPTEEOUTPUTMACHINE = "k3"
> -- 
> 2.17.1
> 

