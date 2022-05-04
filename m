Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC20BC433F5
	for <webhook@archiver.kernel.org>; Wed,  4 May 2022 19:18:48 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.1706.1651691918873202266
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 04 May 2022 12:18:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id CEDC940C24;
	Wed,  4 May 2022 19:18:37 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MV5N464H1NSm; Wed,  4 May 2022 19:18:37 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B307440B13;
	Wed,  4 May 2022 19:18:36 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id E653417491D; Wed,  4 May 2022 15:18:35 -0400 (EDT)
Date: Wed, 4 May 2022 15:18:35 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Khem Raj <raj.khem@gmail.com>
Cc: meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] [PATCH v2] ffa-debugfs-mod: Do not build for TI SOCs
Message-ID: <20220504191835.GE9834@denix.org>
References: <20220503160949.1685272-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220503160949.1685272-1-raj.khem@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 04 May 2022 19:18:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14690

On Tue, May 03, 2022 at 09:09:49AM -0700, Khem Raj wrote:
> The module can not be compiled without patching kernel 5.10
> This helps meta-ti to live in multi-BSP envs

Besides couple minor typos in the comment, looks good to me.


> Signed-off-by: Khem Raj <raj.khem@gmail.com>

Reviewed-by: Denys Dmytriyenko <denys@konsulko.com>


> ---
>  .../linux/ffa-debugfs/ffa-debugfs-mod_%.bbappend             | 5 +++++
>  1 file changed, 5 insertions(+)
>  create mode 100644 meta-ti-bsp/recipes-kernel/linux/ffa-debugfs/ffa-debugfs-mod_%.bbappend
> 
> diff --git a/meta-ti-bsp/recipes-kernel/linux/ffa-debugfs/ffa-debugfs-mod_%.bbappend b/meta-ti-bsp/recipes-kernel/linux/ffa-debugfs/ffa-debugfs-mod_%.bbappend
> new file mode 100644
> index 00000000..67fcf6ec
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-kernel/linux/ffa-debugfs/ffa-debugfs-mod_%.bbappend
> @@ -0,0 +1,5 @@
> +# Added my meta-arm, this needs ceetain backports in 5.10
> +# Disable until kernel upgrades to newer than 5.10 where it
> +# is already upstreamed
> +# Revisit when kernel is upgraded to 5.15 or newer e.g.
> +COMPATIBLE_HOST:ti-soc = "null"
> -- 
> 2.36.0
> 

