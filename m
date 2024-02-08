Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CD3DC48260
	for <webhook@archiver.kernel.org>; Thu,  8 Feb 2024 18:12:07 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.1268.1707415916483391739
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 08 Feb 2024 10:11:57 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 2506240C86;
	Thu,  8 Feb 2024 18:11:53 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jvIXLbJQSTpT; Thu,  8 Feb 2024 18:11:53 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 5313540ACD;
	Thu,  8 Feb 2024 18:11:49 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 6FEDC163E1B; Thu,  8 Feb 2024 13:11:48 -0500 (EST)
Date: Thu, 8 Feb 2024 13:11:48 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master][PATCH] gdbc6x: Fix kernel module to work on
 6.6+
Message-ID: <20240208181148.GH15614@denix.org>
References: <20240208175525.31373-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240208175525.31373-1-reatmon@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 08 Feb 2024 18:12:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17455

On Thu, Feb 08, 2024 at 11:55:25AM -0600, Ryan Eatmon via lists.yoctoproject.org wrote:
> The "upstream" is not maintained, but this is an easy patch to get this
> working again.  Still need to watch this for big breakages and rethink
> supporting this recipe at that time.
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>  .../0002-Support-Linux-kernels-v6.6.patch     | 31 +++++++++++++++++++
>  .../gdbc6x/gdbserverproxy-module-drv_git.bb   |  5 ++-
>  2 files changed, 35 insertions(+), 1 deletion(-)
>  create mode 100644 meta-ti-extras/recipes-devtools/gdbc6x/gdbserverproxy-module-drv/0002-Support-Linux-kernels-v6.6.patch
> 
> diff --git a/meta-ti-extras/recipes-devtools/gdbc6x/gdbserverproxy-module-drv/0002-Support-Linux-kernels-v6.6.patch b/meta-ti-extras/recipes-devtools/gdbc6x/gdbserverproxy-module-drv/0002-Support-Linux-kernels-v6.6.patch
> new file mode 100644
> index 00000000..dab4e26b
> --- /dev/null
> +++ b/meta-ti-extras/recipes-devtools/gdbc6x/gdbserverproxy-module-drv/0002-Support-Linux-kernels-v6.6.patch
> @@ -0,0 +1,31 @@
> +From: Ryan Eatmon <reatmon@ti.com>
> +Date: Wed, 08 Feb 2024 10:43:00 -0500
> +Subject: [PATCH] Support Linux kernels v6.6+
> +
> +gdb_write arg changed from int to unsigned int
> +
> +Upstream-Status: Pending

FWIW, there's also Inactive-Upstream status, if needed:
https://docs.yoctoproject.org/contributor-guide/recipe-style-guide.html#patch-upstream-status


> +Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> +---
> + kernel_module/gdbproxy-mod/gdbserverproxy.c | 6 +++++-
> + 1 file changed, 5 insertions(+), 1 deletion(-)
> +
> +diff --git a/kernel_module/gdbproxy-mod/gdbserverproxy.c b/kernel_module/gdbproxy-mod/gdbserverproxy.c
> +index 418b6db..4b1c676 100644
> +--- a/kernel_module/gdbproxy-mod/gdbserverproxy.c
> ++++ b/kernel_module/gdbproxy-mod/gdbserverproxy.c
> +@@ -496,8 +496,13 @@ static void gdb_close(struct tty_struct *tty, struct file *filp)
> +  * 
> +  *
> +  */
> ++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6,6,0))
> ++static int gdb_write(struct tty_struct *tty,
> ++        const unsigned char *buf, unsigned int count)
> ++#else
> + static int gdb_write(struct tty_struct *tty,
> +         const unsigned char *buf, int count)
> ++#endif
> + {
> +      struct dsp_session *dsp = tty->driver_data;
> +      int ret = 0;
> diff --git a/meta-ti-extras/recipes-devtools/gdbc6x/gdbserverproxy-module-drv_git.bb b/meta-ti-extras/recipes-devtools/gdbc6x/gdbserverproxy-module-drv_git.bb
> index 60492f81..b68c4463 100644
> --- a/meta-ti-extras/recipes-devtools/gdbc6x/gdbserverproxy-module-drv_git.bb
> +++ b/meta-ti-extras/recipes-devtools/gdbc6x/gdbserverproxy-module-drv_git.bb
> @@ -7,7 +7,10 @@ MACHINE_KERNEL_PR:append = "b"
>  PR = "${MACHINE_KERNEL_PR}"
>  PV:append = "+git${SRCPV}"
>  
> -SRC_URI:append = " file://0001-Support-Linux-kernels-v5.15.patch;patchdir=../.."
> +SRC_URI:append = "\
> +    file://0001-Support-Linux-kernels-v5.15.patch;patchdir=../.. \
> +    file://0002-Support-Linux-kernels-v6.6.patch;patchdir=../.. \
> +"
>  
>  S = "${WORKDIR}/git/kernel_module/gdbproxy-mod"
>  
> -- 
> 2.17.1

