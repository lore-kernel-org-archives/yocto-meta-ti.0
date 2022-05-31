Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 689A1C433F5
	for <webhook@archiver.kernel.org>; Tue, 31 May 2022 19:33:10 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web09.2221.1654025586864825086
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 31 May 2022 12:33:07 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id D051D40C5F;
	Tue, 31 May 2022 19:33:05 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KLrPB_le9cMQ; Tue, 31 May 2022 19:33:05 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B01B640C4E;
	Tue, 31 May 2022 19:33:03 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 04B4917495A; Tue, 31 May 2022 15:33:03 -0400 (EDT)
Date: Tue, 31 May 2022 15:33:02 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: meta-ti@lists.yoctoproject.org,
	Jose Quaresma <jose.quaresma@foundries.io>
Subject: Re: [meta-ti] [PATCH] multiconfig: use diferent TMPDIR for each
 machine
Message-ID: <20220531193302.GC9834@denix.org>
References: <20220530143810.4064720-1-jose.quaresma@foundries.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220530143810.4064720-1-jose.quaresma@foundries.io>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 31 May 2022 19:33:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14768

On Mon, May 30, 2022 at 03:38:10PM +0100, Jose Quaresma wrote:
> Bitbake manual [1] recomends to use one TMPDIR for each machine:
> 
>  "Minimally, each configuration file must define the machine and the
>  temporary directory BitBake uses for the build.
>  Suggested practice dictates that you do not overlap the temporary
>  directories used during the builds."

What specific issue are you trying to fix with this?

I'm not aware of any immediate issues (because here multiconfig is used for 
completely separate machines and those are well isolated inside the temp dir), 
but I see few problems this will cause down the road, so I'm against this 
change.


> [1] https://docs.yoctoproject.org/bitbake/bitbake-user-manual/bitbake-user-manual-intro.html#executing-a-multiple-configuration-build
> 
> Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> ---
>  meta-ti-bsp/conf/multiconfig/k3r5.conf | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/meta-ti-bsp/conf/multiconfig/k3r5.conf b/meta-ti-bsp/conf/multiconfig/k3r5.conf
> index deb07210..0ba163ae 100644
> --- a/meta-ti-bsp/conf/multiconfig/k3r5.conf
> +++ b/meta-ti-bsp/conf/multiconfig/k3r5.conf
> @@ -3,3 +3,5 @@ MAINMACHINE := "${MACHINE}"
>  DEPLOY_DIR_IMAGE = "${DEPLOY_DIR}/images/${MAINMACHINE}"
>  
>  MACHINE:append = "-k3r5"
> +
> +TMPDIR = "${TOPDIR}/tmp-${MACHINE}"
> -- 
> 2.36.1

