Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3DFDC4332F
	for <webhook@archiver.kernel.org>; Tue,  5 Apr 2022 17:24:48 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.2049.1649130800844805389
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 04 Apr 2022 20:53:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 5749740C2E;
	Tue,  5 Apr 2022 03:53:19 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QUUtWfXcI3W0; Tue,  5 Apr 2022 03:53:19 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 3EC5140429;
	Tue,  5 Apr 2022 03:53:18 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 75B0D1748C9; Mon,  4 Apr 2022 23:53:17 -0400 (EDT)
Date: Mon, 4 Apr 2022 23:53:17 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Khem Raj <raj.khem@gmail.com>
Cc: meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] [PATCH] uim-sysfs: Specify branch and protocol for
 git fetcher
Message-ID: <20220405035317.GG23554@denix.org>
References: <20220404010922.2841052-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220404010922.2841052-1-raj.khem@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 05 Apr 2022 17:24:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14589

On Sun, Apr 03, 2022 at 06:09:22PM -0700, Khem Raj wrote:
> bitbake git fetcher warns about protocol and fall back branches
> therefore be explicit about these parameters in source uri
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

Reviewed-by: Denys Dmytriyenko <denys@konsulko.com>
 

> ---
>  meta-ti-extras/recipes-connectivity/uim/uim-sysfs_8.5.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-ti-extras/recipes-connectivity/uim/uim-sysfs_8.5.bb b/meta-ti-extras/recipes-connectivity/uim/uim-sysfs_8.5.bb
> index 8d4f9182..e5912e81 100644
> --- a/meta-ti-extras/recipes-connectivity/uim/uim-sysfs_8.5.bb
> +++ b/meta-ti-extras/recipes-connectivity/uim/uim-sysfs_8.5.bb
> @@ -8,7 +8,7 @@ INITSCRIPT_PARAMS = "defaults 03"
>  inherit update-rc.d
>  
>  SRCREV = "a75f45be2d5c74fc1dd913d08afc30f09a230aa9"
> -SRC_URI = "git://git.ti.com/ti-bt/uim.git"
> +SRC_URI = "git://git.ti.com/ti-bt/uim.git;branch=master;protocol=https"
>  
>  S = "${WORKDIR}/git"
>  
> -- 
> 2.35.1

