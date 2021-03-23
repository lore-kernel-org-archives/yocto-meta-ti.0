Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.363.1616536234942490927
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 23 Mar 2021 14:50:35 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id F09C540BFF;
	Tue, 23 Mar 2021 21:50:33 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pqeZeNExDN39; Tue, 23 Mar 2021 21:50:33 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id CFC6D400CF;
	Tue, 23 Mar 2021 21:50:31 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 87605174558; Tue, 23 Mar 2021 17:50:31 -0400 (EDT)
Date: Tue, 23 Mar 2021 17:50:31 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Nishanth Menon <nm@ti.com>
Cc: praneeth@ti.com, meta-ti@lists.yoctoproject.org
Subject: Re: [dunfell/master] [PATCH] linux-ti-mainline: Add gmp-native as a kernel dependency
Message-ID: <20210323215031.GO18041@denix.org>
References: <20210323205745.21086-1-nm@ti.com>
MIME-Version: 1.0
In-Reply-To: <20210323205745.21086-1-nm@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 23, 2021 at 03:57:45PM -0500, Nishanth Menon wrote:
> From: Dan Murphy <dmurphy@ti.com>
> 
> Add GNU Multiple Precision Arithmetic Library as a dependency for
> mainline linux builds. These are necesary for kernel to handle gcc
> plugins for builtins.h

This is in-line with oe-core as added since 5.8 in:
d3590f16d9c1b56813114113b74f7b6f01e6b0ba kernel-yocto/5.8: add gmp-native dependency


> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> Signed-off-by: Nishanth Menon <nm@ti.com>

Reviewed-by: Denys Dmytriyenko <denys@konsulko.com>


> ---
>  recipes-kernel/linux/linux-ti-mainline_git.bb | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/recipes-kernel/linux/linux-ti-mainline_git.bb b/recipes-kernel/linux/linux-ti-mainline_git.bb
> index ed7607046186..41e852ba0e88 100644
> --- a/recipes-kernel/linux/linux-ti-mainline_git.bb
> +++ b/recipes-kernel/linux/linux-ti-mainline_git.bb
> @@ -9,6 +9,8 @@ DEFCONFIG_BUILDER = "${WORKDIR}/ti-upstream-tools/config/defconfig_builder.sh"
>  require recipes-kernel/linux/setup-defconfig.inc
>  require recipes-kernel/linux/kernel-rdepends.inc
>  
> +DEPENDS += "gmp-native"
> +
>  KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT}"
>  
>  S = "${WORKDIR}/git"
> -- 
> 2.31.0
