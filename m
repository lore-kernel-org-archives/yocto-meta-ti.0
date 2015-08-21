Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id AE88BE00B34; Fri, 21 Aug 2015 09:24:29 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 43EA0E00B2F
	for <meta-ti@yoctoproject.org>; Fri, 21 Aug 2015 09:24:25 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t7LGOOmb027243
	for <meta-ti@yoctoproject.org>; Fri, 21 Aug 2015 11:24:25 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t7LGOOV6015293
	for <meta-ti@yoctoproject.org>; Fri, 21 Aug 2015 11:24:24 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 21 Aug 2015 11:24:24 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t7LGOOBP002349;
	Fri, 21 Aug 2015 11:24:24 -0500
Date: Fri, 21 Aug 2015 12:24:08 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20150821162408.GQ6542@edge>
References: <1440164465-22287-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
In-Reply-To: <1440164465-22287-1-git-send-email-j-stiffler@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [master/fido/daisy][PATCH] cmem: Bump SRCREV to fix build with GCC 4.9 and Linux 4.1
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
X-List-Received-Date: Fri, 21 Aug 2015 16:24:29 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Aug 21, 2015 at 09:41:05AM -0400, Jacob Stiffler wrote:
> * Changes retain compatibility with older tolchain and kernl.

Unless you really really need this in daisy for some other fixes, it doesn't 
make much sense to push it there just for gcc-4.9 and linux-4.1 changes, which 
are not supported in daisy...


> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  recipes-bsp/cmem/cmem-mod_git.bb | 2 +-
>  recipes-bsp/cmem/cmem.inc        | 8 ++++----
>  recipes-bsp/cmem/cmem_git.bb     | 2 +-
>  3 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/recipes-bsp/cmem/cmem-mod_git.bb b/recipes-bsp/cmem/cmem-mod_git.bb
> index b36eb09..6b2303c 100644
> --- a/recipes-bsp/cmem/cmem-mod_git.bb
> +++ b/recipes-bsp/cmem/cmem-mod_git.bb
> @@ -3,7 +3,7 @@ DESCRIPTION = "Kernel module for contiguous memory allocation from userspace"
>  include cmem.inc
>  
>  # This package builds a kernel module, use kernel PR as base and append a local
> -MACHINE_KERNEL_PR_append = "b"
> +MACHINE_KERNEL_PR_append = "a"
>  PR = "${MACHINE_KERNEL_PR}"
>  
>  inherit module
> diff --git a/recipes-bsp/cmem/cmem.inc b/recipes-bsp/cmem/cmem.inc
> index 23e5f2e..0d3e918 100644
> --- a/recipes-bsp/cmem/cmem.inc
> +++ b/recipes-bsp/cmem/cmem.inc
> @@ -3,11 +3,11 @@ HOMEPAGE = "http://processors.wiki.ti.com/index.php/Category:CMEM"
>  LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM = "file://include/ti/cmem.h;beginline=1;endline=30;md5=9b745e2765a6ba8a636c91aed4b02ac1"
>  
> -BRANCH ?= "master"
> -# This corresponds to version 4.10.01.02
> -SRCREV = "a51d9770021fd16c97fc59b320286a3fa43278bc"
> +BRANCH ?= "lu-next"
> +# This corresponds to version 4.10.02.03
> +SRCREV = "d47ac635699da6bee6daff31b87b0123e13af4ac"
>  
> -PV = "4.10.01.02+git${SRCPV}"
> +PV = "4.10.02.03+git${SRCPV}"
>  
>  SRC_URI = "git://git.ti.com/ipc/ludev.git;protocol=git;branch=${BRANCH}"
>  
> diff --git a/recipes-bsp/cmem/cmem_git.bb b/recipes-bsp/cmem/cmem_git.bb
> index b30029d..bab9238 100644
> --- a/recipes-bsp/cmem/cmem_git.bb
> +++ b/recipes-bsp/cmem/cmem_git.bb
> @@ -4,7 +4,7 @@ include cmem.inc
>  
>  RDEPENDS_${PN} = "cmem-mod"
>  
> -PR = "r1"
> +PR = "r0"
>  
>  PACKAGES =+ "${PN}-test"
>  
> -- 
> 1.9.1
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

