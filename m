Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9DD32E00802
	for <meta-ti@yoctoproject.org>; Wed, 18 Dec 2013 14:09:19 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id rBIM9Ibm018496
	for <meta-ti@yoctoproject.org>; Wed, 18 Dec 2013 16:09:18 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id rBIM9IJQ014998
	for <meta-ti@yoctoproject.org>; Wed, 18 Dec 2013 16:09:18 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 18 Dec 2013 16:09:18 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id rBIM9IAe028864;
	Wed, 18 Dec 2013 16:09:18 -0600
Date: Wed, 18 Dec 2013 17:09:17 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Sam Nelson <sam.nelson@ti.com>
Message-ID: <20131218220917.GW24180@edge>
References: <1387401901-20406-1-git-send-email-sam.nelson@ti.com>
MIME-Version: 1.0
In-Reply-To: <1387401901-20406-1-git-send-email-sam.nelson@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH v4] cmem: Adding New recipe for cmem
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
X-List-Received-Date: Wed, 18 Dec 2013 22:09:19 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Sam,

Your last email to the list from few days ealier also worked, I just didn't 
have time to reply.

As of the patch itself, it is based on a previous commit with cmem, which 
never made it to meta-ti, so please make sure all the dependencies are met.

-- 
Denys


On Wed, Dec 18, 2013 at 04:25:01PM -0500, Sam Nelson wrote:
> - Cmem module is used for user space contiguous memory alloation
> 
> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> ---
>  recipes-bsp/cmem/cmem-mod_git.bb |    4 ++--
>  recipes-bsp/cmem/cmem.inc        |    4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/recipes-bsp/cmem/cmem-mod_git.bb b/recipes-bsp/cmem/cmem-mod_git.bb
> index a072f77..bbd81d4 100644
> --- a/recipes-bsp/cmem/cmem-mod_git.bb
> +++ b/recipes-bsp/cmem/cmem-mod_git.bb
> @@ -13,13 +13,13 @@ inherit module
>  do_compile () {
>      unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
>      cd ${S}
> -    make -f lu.mak module_clean
> +    make -f lu.mak modules_clean
>      make -f lu.mak module KERNEL_INSTALL_DIR=${STAGING_KERNEL_DIR} TOOLCHAIN_PREFIX=${CROSS_COMPILE}
>  }
>  
>  do_install () {
>      unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
>      cd ${S}
> -    make -f lu.mak module_install KERNEL_INSTALL_DIR="${STAGING_KERNEL_DIR}" EXEC_DIR="${D}/lib/modules/${KERNEL_VERSION}/extra" INSTALL_MOD_PATH="${D}"
> +    make -f lu.mak modules_install KERNEL_INSTALL_DIR="${STAGING_KERNEL_DIR}" EXEC_DIR="${D}/lib/modules/${KERNEL_VERSION}/extra" INSTALL_MOD_PATH="${D}"
>  }
>  
> diff --git a/recipes-bsp/cmem/cmem.inc b/recipes-bsp/cmem/cmem.inc
> index 094b2dc..b1f441a 100644
> --- a/recipes-bsp/cmem/cmem.inc
> +++ b/recipes-bsp/cmem/cmem.inc
> @@ -4,7 +4,7 @@ LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM = "file://include/ti/cmem.h;beginline=1;endline=30;md5=b86138d4028fb8310b3b983024edc620"
>  
>  BRANCH ?= "master"
> -# This corresponds to version 4.00.00.06
> -SRCREV = "c2cf2406702bcb889c10d0e6e7d298ba7b84ae7d"
> +# This corresponds to version 4.00.01.08
> +SRCREV = "0b68dfe9f155a1978cdb2178e052dc0d6f1e705b"
>  
>  SRC_URI = "git://git.ti.com/ipc/ludev.git;protocol=git;branch=${BRANCH}"
> -- 
> 1.7.9.5
> 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

