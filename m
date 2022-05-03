Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7506EC433EF
	for <webhook@archiver.kernel.org>; Tue,  3 May 2022 16:00:25 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.945.1651593624593733092
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 03 May 2022 09:00:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 35AB340BE9;
	Tue,  3 May 2022 16:00:23 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JUXIzKjiprFQ; Tue,  3 May 2022 16:00:23 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 1934440A3D;
	Tue,  3 May 2022 16:00:22 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 9A013174917; Tue,  3 May 2022 12:00:21 -0400 (EDT)
Date: Tue, 3 May 2022 12:00:21 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Khem Raj <raj.khem@gmail.com>
Cc: meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] [PATCH] ffa-debugfs-mod: Do not build for TI SOCs
Message-ID: <20220503160021.GY9834@denix.org>
References: <20220503150927.262759-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220503150927.262759-1-raj.khem@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 03 May 2022 16:00:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14683

On Tue, May 03, 2022 at 08:09:27AM -0700, Khem Raj wrote:
> The module can not be compiled without patching kernel 5.10
> This helps meta-ti to live in multi-BSP envs
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../linux/ffa-debugfs/ffa-debugfs-mod_%.bbappend           | 7 +++++++
>  1 file changed, 7 insertions(+)
>  create mode 100644 meta-ti-bsp/recipes-kernel/linux/ffa-debugfs/ffa-debugfs-mod_%.bbappend
> 
> diff --git a/meta-ti-bsp/recipes-kernel/linux/ffa-debugfs/ffa-debugfs-mod_%.bbappend b/meta-ti-bsp/recipes-kernel/linux/ffa-debugfs/ffa-debugfs-mod_%.bbappend
> new file mode 100644
> index 00000000..78b509c1
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-kernel/linux/ffa-debugfs/ffa-debugfs-mod_%.bbappend
> @@ -0,0 +1,7 @@
> +FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

This doesn't seem to be needed ^


> +# Added my meta-arm, this needs ceetain backports in 5.10
> +# Disable until kernel upgrades to newer than 5.10 where it
> +# is already upstreamed
> +# Revisit when kernel is upgraded to 5.15 or newer e.g.
> +COMPATIBLE_HOST:ti-soc = "null"
> -- 
> 2.36.0
> 

