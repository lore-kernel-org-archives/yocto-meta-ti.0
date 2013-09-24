Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 825B3E0153B
	for <meta-ti@yoctoproject.org>; Tue, 24 Sep 2013 07:21:39 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r8OELc0h028877
	for <meta-ti@yoctoproject.org>; Tue, 24 Sep 2013 09:21:38 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8OELcnl024435
	for <meta-ti@yoctoproject.org>; Tue, 24 Sep 2013 09:21:38 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 24 Sep 2013 09:21:38 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8OELcB4008877;
	Tue, 24 Sep 2013 09:21:38 -0500
Date: Tue, 24 Sep 2013 10:21:38 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Franklin S. Cooper Jr" <fcooper@ti.com>
Message-ID: <20130924142137.GM4390@edge>
References: <1380034621-4413-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
In-Reply-To: <1380034621-4413-1-git-send-email-fcooper@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] linux: Inherit new machine_kernel_pr class
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Tue, 24 Sep 2013 14:21:41 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Right, I've been meaning to add this too, so I agree with the change.
The only question is - why only those kernels and not others? Are all the 
others covered by linux.inc?

-- 
Denys


On Tue, Sep 24, 2013 at 09:57:01AM -0500, Franklin S. Cooper Jr wrote:
> * MACHINE_KERNEL_PR was originally defined in the kernel class located in
>   meta-oe which overrode the version of the class in oe-core.
> * Some time ago kernel.bbclass was removed from meta-oe and a separate class
>   machine_kernel_pr was created to add support for MACHINE_KERNEL_PR.
> * Since this variable is used significantly in both meta-ti and meta-arago make
>   sure all the kernel recipes directly or indirectly inherit this new class.
> 
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  recipes-kernel/linux/linux-am335x-psp_3.2.bb |    2 +-
>  recipes-kernel/linux/linux-ti-glsdk_3.8.bb   |    2 +-
>  recipes-kernel/linux/linux-ti-staging_3.8.bb |    2 +-
>  recipes-kernel/linux/linux-ti-staging_git.bb |    2 +-
>  recipes-kernel/linux/linux.inc               |    2 +-
>  5 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/recipes-kernel/linux/linux-am335x-psp_3.2.bb b/recipes-kernel/linux/linux-am335x-psp_3.2.bb
> index eaf788f..cf1b2dd 100644
> --- a/recipes-kernel/linux/linux-am335x-psp_3.2.bb
> +++ b/recipes-kernel/linux/linux-am335x-psp_3.2.bb
> @@ -6,7 +6,7 @@ COMPATIBLE_MACHINE = "ti33x"
>  
>  DEFAULT_PREFERENCE = "-1"
>  
> -inherit kernel
> +inherit kernel machine_kernel_pr
>  require setup-defconfig.inc
>  
>  # Stage the power management firmware before building the kernel
> diff --git a/recipes-kernel/linux/linux-ti-glsdk_3.8.bb b/recipes-kernel/linux/linux-ti-glsdk_3.8.bb
> index 5fd17f8..d7aebea 100644
> --- a/recipes-kernel/linux/linux-ti-glsdk_3.8.bb
> +++ b/recipes-kernel/linux/linux-ti-glsdk_3.8.bb
> @@ -4,7 +4,7 @@ LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
>  KERNEL_IMAGETYPE = "uImage"
>  
> -inherit kernel
> +inherit kernel machine_kernel_pr
>  
>  require recipes-kernel/linux/linux-dtb.inc
>  require recipes-kernel/linux/setup-defconfig.inc
> diff --git a/recipes-kernel/linux/linux-ti-staging_3.8.bb b/recipes-kernel/linux/linux-ti-staging_3.8.bb
> index fd7b671..f832b54 100644
> --- a/recipes-kernel/linux/linux-ti-staging_3.8.bb
> +++ b/recipes-kernel/linux/linux-ti-staging_3.8.bb
> @@ -4,7 +4,7 @@ LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
>  KERNEL_IMAGETYPE = "uImage"
>  
> -inherit kernel
> +inherit kernel machine_kernel_pr
>  
>  require recipes-kernel/linux/linux-dtb.inc
>  require recipes-kernel/linux/setup-defconfig.inc
> diff --git a/recipes-kernel/linux/linux-ti-staging_git.bb b/recipes-kernel/linux/linux-ti-staging_git.bb
> index 694a164..50253ea 100644
> --- a/recipes-kernel/linux/linux-ti-staging_git.bb
> +++ b/recipes-kernel/linux/linux-ti-staging_git.bb
> @@ -4,7 +4,7 @@ LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
>  KERNEL_IMAGETYPE = "uImage"
>  
> -inherit kernel
> +inherit kernel machine_kernel_pr
>  
>  require recipes-kernel/linux/linux-dtb.inc
>  require recipes-kernel/linux/setup-defconfig.inc
> diff --git a/recipes-kernel/linux/linux.inc b/recipes-kernel/linux/linux.inc
> index ac51dae..e0d414c 100644
> --- a/recipes-kernel/linux/linux.inc
> +++ b/recipes-kernel/linux/linux.inc
> @@ -4,7 +4,7 @@ LICENSE = "GPLv2"
>  
>  LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
>  
> -inherit kernel siteinfo
> +inherit kernel siteinfo machine_kernel_pr
>  
>  # Enable OABI compat for people stuck with obsolete userspace
>  ARM_KEEP_OABI ?= "1"
> -- 
> 1.7.0.4
> 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

