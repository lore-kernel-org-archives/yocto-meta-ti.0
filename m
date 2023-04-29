Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 341FEC77B60
	for <webhook@archiver.kernel.org>; Sat, 29 Apr 2023 15:22:26 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.48812.1682781740153805799
 for <meta-ti@lists.yoctoproject.org>;
 Sat, 29 Apr 2023 08:22:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id D83AF40C86;
	Sat, 29 Apr 2023 15:22:18 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RH3Movvkb1hZ; Sat, 29 Apr 2023 15:22:18 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A352B400CF;
	Sat, 29 Apr 2023 15:22:15 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 416AD16387C; Sat, 29 Apr 2023 11:21:34 -0400 (EDT)
Date: Sat, 29 Apr 2023 11:21:34 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][kirkstone][PATCH] ti-ipc: Stop looking for
 rpmsg_rpc.h in the kernel
Message-ID: <20230429152134.GU9226@denix.org>
References: <20230428213257.13088-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230428213257.13088-1-reatmon@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sat, 29 Apr 2023 15:22:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16461

On Fri, Apr 28, 2023 at 04:32:57PM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
> Stop looking for the rpmsg_rpc.h in the kernel.  While we are doing the
> LTS migration for kirkstone, this file is not going to be in the kernel
> for a bit.  This patch works in conjunction with a recipe change that
> downloads the header and adds a -I to the CFLAGS to pick it up.  This
> will be removed once the 6.1 kernel has been updated.
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>  ...ooking-for-rpmsg_rpc.h-in-the-kernel.patch | 35 +++++++++++++++++++
>  meta-ti-bsp/recipes-ti/ipc/ti-ipc_git.bb      |  6 ++++
>  2 files changed, 41 insertions(+)
>  create mode 100644 meta-ti-bsp/recipes-ti/ipc/ti-ipc/0001-MmRpc-Stop-looking-for-rpmsg_rpc.h-in-the-kernel.patch
> 
> diff --git a/meta-ti-bsp/recipes-ti/ipc/ti-ipc/0001-MmRpc-Stop-looking-for-rpmsg_rpc.h-in-the-kernel.patch b/meta-ti-bsp/recipes-ti/ipc/ti-ipc/0001-MmRpc-Stop-looking-for-rpmsg_rpc.h-in-the-kernel.patch
> new file mode 100644
> index 00000000..ef12af88
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-ti/ipc/ti-ipc/0001-MmRpc-Stop-looking-for-rpmsg_rpc.h-in-the-kernel.patch
> @@ -0,0 +1,35 @@
> +From 66ca0e732c2e287814d4fc5082b818554ee42398 Mon Sep 17 00:00:00 2001
> +From: Ryan Eatmon <reatmon@ti.com>
> +Date: Fri, 28 Apr 2023 14:30:59 -0500
> +Subject: [PATCH] MmRpc: Stop looking for rpmsg_rpc.h in the kernel
> +
> +Stop looking for the rpmsg_rpc.h in the kernel.  While we are doing the
> +LTS migration for kirkstone, this file is not going to be in the kernel
> +for a bit.  This patch works in conjunction with a recipe change that
> +downloads the header and adds a -I to the CFLAGS to pick it up.  This
> +will be removed once the 6.1 kernel has been updated.
> +
> +Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> +
> +Upstream-Status: Inappropriate [other]
> +
> +---
> + packages/ti/ipc/mm/MmRpc.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/packages/ti/ipc/mm/MmRpc.c b/packages/ti/ipc/mm/MmRpc.c
> +index 2df7420..10f496b 100644
> +--- a/packages/ti/ipc/mm/MmRpc.c
> ++++ b/packages/ti/ipc/mm/MmRpc.c
> +@@ -64,7 +64,7 @@
> + #define linux_include(kd,m) <kd/include/uapi/linux/m.h>
> + #endif
> + 
> +-#include linux_include(KERNEL_INSTALL_DIR,rpmsg_rpc)
> ++#include "linux/rpmsg_rpc.h"
> + 
> + #ifdef _linux_
> + #define linux _linux
> +-- 
> +2.17.1
> +
> diff --git a/meta-ti-bsp/recipes-ti/ipc/ti-ipc_git.bb b/meta-ti-bsp/recipes-ti/ipc/ti-ipc_git.bb
> index 01b857c2..1782f02a 100644
> --- a/meta-ti-bsp/recipes-ti/ipc/ti-ipc_git.bb
> +++ b/meta-ti-bsp/recipes-ti/ipc/ti-ipc_git.bb
> @@ -8,12 +8,18 @@ PR = "${INC_PR}.2"
>  
>  DEPENDS += "virtual/kernel"
>  
> +SRC_URI:append = "https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/plain/include/uapi/linux/rpmsg_rpc.h?h=ti-linux-5.10.y;name=rpmsg_rpc;subdir=linux;downloadfilename=rpmsg_rpc.h"

Whitespace or use += here like below.


> +SRC_URI[rpmsg_rpc.sha256sum] = "cd237f40a37520a1f2df19fbfeefd00c0a5ad68efeaba9ba0fba60ca16ea09be"
> +
>  SRC_URI += "file://tiipclad-daemon.sh \
>              file://omap_remoteproc.conf \
>              file://tiipclad-daemon.service \
>              file://0001-Add-kernel-build-dir.patch \
> +            file://0001-MmRpc-Stop-looking-for-rpmsg_rpc.h-in-the-kernel.patch \
>             "
>  
> +CFLAGS += "-I${WORKDIR}"
> +
>  DAEMON = "UNKNOWN"
>  DAEMON:dra7xx = "lad_dra7xx"
>  DAEMON:omapl138 = "lad_omapl138"
> -- 
> 2.17.1

