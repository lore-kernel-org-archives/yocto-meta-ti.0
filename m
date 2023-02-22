Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B82FC636D6
	for <webhook@archiver.kernel.org>; Wed, 22 Feb 2023 19:41:38 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.2940.1677094896005815685
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 22 Feb 2023 11:41:36 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6F04440C2E;
	Wed, 22 Feb 2023 19:41:35 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rNq6dv6Hy61a; Wed, 22 Feb 2023 19:41:35 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 4FD8E40AC9;
	Wed, 22 Feb 2023 19:41:33 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 89C9C163764; Wed, 22 Feb 2023 14:41:08 -0500 (EST)
Date: Wed, 22 Feb 2023 14:41:08 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: afd@ti.com
Cc: Ryan Eatmon <reatmon@ti.com>, meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master/kirkstone][PATCH v2 08/15] ti-k3-secdev:
 Remove inclusion of ti-paths.inc
Message-ID: <20230222194108.GZ22689@denix.org>
References: <20230215193355.9676-1-afd@ti.com>
 <20230215193355.9676-9-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230215193355.9676-9-afd@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 22 Feb 2023 19:41:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15914

On Wed, Feb 15, 2023 at 01:33:48PM -0600, Andrew Davis via lists.yoctoproject.org wrote:
> Since this directory path will not change, let's avoid use
> of ti-paths.inc which is set to be removed.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>

Tested-by: Denys Dmytriyenko <denys@konsulko.com>


> ---
>  meta-ti-bsp/recipes-ti/secdev/ti-k3-secdev_git.bb | 5 ++---
>  meta-ti-extras/recipes-ti/includes/ti-paths.inc   | 2 --
>  2 files changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/meta-ti-bsp/recipes-ti/secdev/ti-k3-secdev_git.bb b/meta-ti-bsp/recipes-ti/secdev/ti-k3-secdev_git.bb
> index 6a28add7..b4c26f68 100644
> --- a/meta-ti-bsp/recipes-ti/secdev/ti-k3-secdev_git.bb
> +++ b/meta-ti-bsp/recipes-ti/secdev/ti-k3-secdev_git.bb
> @@ -4,9 +4,8 @@ SECTION = "devel"
>  LICENSE = "BSD-3-Clause"
>  LIC_FILES_CHKSUM = "file://manifest/k3-secdev-0.2-manifest.html;md5=f632a78870cc64550078d7b3cbac0892"
>  
> -# set a default value for TI_K3_SECDEV_INSTALL_DIR_RECIPE
> -export TI_K3_SECDEV_INSTALL_DIR_RECIPE = "${datadir}/ti/ti-k3-secdev"
> -include recipes-ti/includes/ti-paths.inc
> +# set a default install location
> +TI_K3_SECDEV_INSTALL_DIR_RECIPE = "${datadir}/ti/ti-k3-secdev"
>  
>  # Native host tool only
>  COMPATIBLE_MACHINE = "null"
> diff --git a/meta-ti-extras/recipes-ti/includes/ti-paths.inc b/meta-ti-extras/recipes-ti/includes/ti-paths.inc
> index 63c00e8c..b443d2f0 100644
> --- a/meta-ti-extras/recipes-ti/includes/ti-paths.inc
> +++ b/meta-ti-extras/recipes-ti/includes/ti-paths.inc
> @@ -51,7 +51,6 @@ export OMP_INSTALL_DIR_RECIPE        = "${installdir}/ti-omp-tree"
>  export MPM_INSTALL_DIR_RECIPE        = "${installdir}/ti-mpm-tree"
>  export TI_CGT6X_7_INSTALL_DIR_RECIPE   = "${installdir}/cgt6x-7"
>  export TI_CGT7X_INSTALL_DIR_RECIPE        = "${installdir}/cgt-c7x"
> -export TI_K3_SECDEV_INSTALL_DIR_RECIPE = "${installdir}/ti-k3-secdev"
>  
>  
>  # This is where the tools will end up in sysroot
> @@ -101,7 +100,6 @@ export TI_CGT6X_7_INSTALL_DIR   = "${STAGING_DIR_NATIVE}${TI_CGT6X_7_INSTALL_DIR
>  export GCC_LINARO_BAREMETAL_TOOLCHAIN         =  "${STAGING_DIR_NATIVE}${GCC_LINARO_BAREMETAL_TOOLCHAIN_RECIPE}"
>  export GCC_LINARO_BAREMETAL_AARCH64_TOOLCHAIN =  "${STAGING_DIR_NATIVE}${GCC_LINARO_BAREMETAL_AARCH64_TOOLCHAIN_RECIPE}"
>  export TI_CGT7X_INSTALL_DIR        = "${STAGING_DIR_NATIVE}${TI_CGT7X_INSTALL_DIR_RECIPE}"
> -export TI_K3_SECDEV_INSTALL_DIR = "${STAGING_DIR_NATIVE}${TI_K3_SECDEV_INSTALL_DIR_RECIPE}"
>  
>  
>  DSPSUFFIX:omapl138 = "x674"
> -- 
> 2.39.1

