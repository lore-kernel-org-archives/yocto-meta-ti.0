Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 05C0BE00B7A; Thu, 12 May 2016 13:24:41 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5C1FDE00B5F
	for <meta-ti@yoctoproject.org>; Thu, 12 May 2016 13:24:38 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u4CKOclP013472
	for <meta-ti@yoctoproject.org>; Thu, 12 May 2016 15:24:38 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u4CKOckj021718
	for <meta-ti@yoctoproject.org>; Thu, 12 May 2016 15:24:38 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 12 May 2016 15:24:37 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u4CKObF1020435;
	Thu, 12 May 2016 15:24:37 -0500
Date: Thu, 12 May 2016 16:24:22 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Sam Nelson <sam.nelson@ti.com>
Message-ID: <20160512202422.GX16188@edge>
References: <1463083843-10754-1-git-send-email-sam.nelson@ti.com>
MIME-Version: 1.0
In-Reply-To: <1463083843-10754-1-git-send-email-sam.nelson@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] uio-module-drv: Update to 2.0.0.0 GA version
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
X-List-Received-Date: Thu, 12 May 2016 20:24:41 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, May 12, 2016 at 04:10:43PM -0400, Sam Nelson wrote:
> Reformatted recipes to have one common PV between module and test
> recipes

I don't see you adding common PV anywhere...


> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> ---
>  recipes-bsp/uio-module-drv/uio-module-drv-test_git.bb | 3 ++-
>  recipes-bsp/uio-module-drv/uio-module-drv.inc         | 4 ++--
>  recipes-bsp/uio-module-drv/uio-module-drv_git.bb      | 3 +--
>  3 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/recipes-bsp/uio-module-drv/uio-module-drv-test_git.bb b/recipes-bsp/uio-module-drv/uio-module-drv-test_git.bb
> index 1080a91..3134a03 100644
> --- a/recipes-bsp/uio-module-drv/uio-module-drv-test_git.bb
> +++ b/recipes-bsp/uio-module-drv/uio-module-drv-test_git.bb
> @@ -1,7 +1,8 @@
>  DESCRIPTION = "Test code for user space IO (UIO) driver"
>  
>  include uio-module-drv.inc
> -PV = "1.0.2.3"
> +
> +PR = "r1"
>  
>  COMPATIBLE_MACHINE = "keystone"
>  RDEPENDS_${PN} = "uio-module-drv"
> diff --git a/recipes-bsp/uio-module-drv/uio-module-drv.inc b/recipes-bsp/uio-module-drv/uio-module-drv.inc
> index ed34a8a..8002504 100644
> --- a/recipes-bsp/uio-module-drv/uio-module-drv.inc
> +++ b/recipes-bsp/uio-module-drv/uio-module-drv.inc
> @@ -1,8 +1,8 @@
>  LICENSE = "BSD"
>  LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2b7c96eb2aed7b0f6f922214dbde9016"
>  
> -BRANCH = "linux4.1"
> -# This corresponds to version 02.00.00.00_eng
> +BRANCH = "master"
> +# This corresponds to version 02.00.00.00
>  SRCREV = "6a7eda36e390658593a5b8d87b0f00beb3997240"
>  
>  SRC_URI = "git://git.ti.com/keystone-linux/uio-module-drv.git;protocol=git;branch=${BRANCH}"
> diff --git a/recipes-bsp/uio-module-drv/uio-module-drv_git.bb b/recipes-bsp/uio-module-drv/uio-module-drv_git.bb
> index 401fdbe..15a7691 100644
> --- a/recipes-bsp/uio-module-drv/uio-module-drv_git.bb
> +++ b/recipes-bsp/uio-module-drv/uio-module-drv_git.bb
> @@ -1,10 +1,9 @@
>  DESCRIPTION="User space IO (UIO) driver for on-chip modules"
>  
>  include uio-module-drv.inc
> -PV = "2.0.0.0+git${SRCPV}"
>  
>  # This package builds a kernel module, use kernel PR as base and append a local
> -MACHINE_KERNEL_PR_append = "c"
> +MACHINE_KERNEL_PR_append = "d"
>  PR = "${MACHINE_KERNEL_PR}"
>  
>  module_auto_load_uio-module-drv = "uio-module-drv"
> -- 
> 1.9.1
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

