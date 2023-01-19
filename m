Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1320BC004D4
	for <webhook@archiver.kernel.org>; Thu, 19 Jan 2023 22:15:14 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.59546.1674166505673794195
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 19 Jan 2023 14:15:05 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 7BD0B40C56;
	Thu, 19 Jan 2023 22:15:04 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id phtmOf-TN9DE; Thu, 19 Jan 2023 22:15:04 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 620DC40C2B;
	Thu, 19 Jan 2023 22:15:03 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 04E6A163701; Thu, 19 Jan 2023 17:14:43 -0500 (EST)
Date: Thu, 19 Jan 2023 17:14:42 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Cc: meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] [master/kirkstone][PATCH v2 1/2] treewide: replace
 leftover git://git.ti.com
Message-ID: <20230119221442.GL22689@denix.org>
References: <20230119102952.8161-1-matthias.schiffer@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230119102952.8161-1-matthias.schiffer@ew.tq-group.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 19 Jan 2023 22:15:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15599

On Thu, Jan 19, 2023 at 11:29:51AM +0100, Matthias Schiffer wrote:
> These URIs have been updated in dunfell, but two instances were
> forgotten in kirkstone/master.
> 
> Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
> ---
> 
> v2: no changes

It is customary to pick up any previous Acked-by, Reviewed-by and Tested-by 
tags when re-submitting otherwise unchanged patch...

https://patchwork.yoctoproject.org/project/ti/patch/20221216130139.20841-1-matthias.schiffer@ew.tq-group.com/


>  .../recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb      | 2 +-
>  meta-ti-extras/recipes-bsp/pru/pru-icss_git.bb                  | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb b/meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
> index d0edf1fe..bd88d14d 100644
> --- a/meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
> +++ b/meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
> @@ -14,7 +14,7 @@ PR = "r37"
>  
>  BRANCH = "ti-img-sgx/dunfell/${PV}"
>  
> -SRC_URI = "git://git.ti.com/graphics/omap5-sgx-ddk-um-linux.git;protocol=git;branch=${BRANCH}"
> +SRC_URI = "git://git.ti.com/git/graphics/omap5-sgx-ddk-um-linux.git;protocol=https;branch=${BRANCH}"
>  SRCREV = "742cf38aba13e1ba1a910cf1f036a1a212c263b6"
>  
>  TARGET_PRODUCT:omap-a15 = "jacinto6evm"
> diff --git a/meta-ti-extras/recipes-bsp/pru/pru-icss_git.bb b/meta-ti-extras/recipes-bsp/pru/pru-icss_git.bb
> index cb2f8cc2..8a2cfdc6 100644
> --- a/meta-ti-extras/recipes-bsp/pru/pru-icss_git.bb
> +++ b/meta-ti-extras/recipes-bsp/pru/pru-icss_git.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://PRU-Package-v6.1-Manifest.html;md5=1e37797ebe9254922f
>  inherit update-alternatives
>  
>  BRANCH = "master"
> -SRC_URI = "git://git.ti.com/pru-software-support-package/pru-software-support-package.git;protocol=git;branch=${BRANCH}"
> +SRC_URI = "git://git.ti.com/git/pru-software-support-package/pru-software-support-package.git;protocol=https;branch=${BRANCH}"
>  SRCREV = "ae1decf0b494b2904e6157e1379691ffc468f0cf"
>  
>  PV = "6.1.0"
> -- 
> 2.34.1

