Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6AA1CE01645
	for <meta-ti@yoctoproject.org>; Thu, 26 Sep 2013 08:38:37 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173021.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MTQ00I43OS10LL1@vms173021.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Thu, 26 Sep 2013 10:38:36 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id AEFFA20091; Thu,
	26 Sep 2013 11:38:25 -0400 (EDT)
Date: Thu, 26 Sep 2013 11:38:25 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: meta-ti@yoctoproject.org
Message-id: <20130926153825.GD14100@denix.org>
References: <20130925225155.7476A529E7@arago-project.org>
MIME-version: 1.0
In-reply-to: <20130925225155.7476A529E7@arago-project.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: Franklin S. Cooper Jr : linux: Inherit new machine_kernel_pr class
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
X-List-Received-Date: Thu, 26 Sep 2013 15:38:38 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

All,

Just a heads-up - I'll be reverting this commit, since it inadvertently 
creates another unwanted dependency on meta-openembedded layer, which we'd 
like to avoid. Sorry for the inconvenience.

-- 
Denys


On Wed, Sep 25, 2013 at 10:51:55PM +0000, Arago Project git wrote:
> Module: meta-ti
> Branch: master
> Commit: 1450f1938007bede786160c501c8fd268b661c5e
> URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=1450f1938007bede786160c501c8fd268b661c5e
> 
> Author: Franklin S. Cooper Jr <fcooper@ti.com>
> Date:   Tue Sep 24 09:57:01 2013 -0500
> 
> linux: Inherit new machine_kernel_pr class
> 
> * MACHINE_KERNEL_PR was originally defined in the kernel class located in
>   meta-oe which overrode the version of the class in oe-core.
> * Some time ago kernel.bbclass was removed from meta-oe and a separate class
>   machine_kernel_pr was created to add support for MACHINE_KERNEL_PR.
> * Since this variable is used significantly in both meta-ti and meta-arago make
>   sure all the kernel recipes directly or indirectly inherit this new class.
> 
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> 
> ---
> 
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
> index 833fb48..8e6d198 100644
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
> index 778ea7f..b75e650 100644
> --- a/recipes-kernel/linux/linux-ti-staging_git.bb
> +++ b/recipes-kernel/linux/linux-ti-staging_git.bb
> @@ -3,7 +3,7 @@ DESCRIPTION = "Linux kernel for TI devices"
>  LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
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
> 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
> 

