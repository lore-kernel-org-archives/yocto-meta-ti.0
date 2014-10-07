Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E3EA9E007C1; Tue,  7 Oct 2014 11:49:05 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.152 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AD005E0076C
	for <meta-ti@yoctoproject.org>; Tue,  7 Oct 2014 11:49:02 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s97In2E6028875
	for <meta-ti@yoctoproject.org>; Tue, 7 Oct 2014 13:49:02 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s97In21H019738
	for <meta-ti@yoctoproject.org>; Tue, 7 Oct 2014 13:49:02 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 7 Oct 2014 13:49:01 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s97In11i012866;
	Tue, 7 Oct 2014 13:49:01 -0500
Date: Tue, 7 Oct 2014 14:49:01 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Sam Nelson <sam.nelson@ti.com>
Message-ID: <20141007184901.GB1731@edge>
References: <1412707498-10920-1-git-send-email-sam.nelson@ti.com>
MIME-Version: 1.0
In-Reply-To: <1412707498-10920-1-git-send-email-sam.nelson@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] uio-module-drv: Add new recipe for user space io driver
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
X-List-Received-Date: Tue, 07 Oct 2014 18:49:06 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Oct 07, 2014 at 02:44:58PM -0400, Sam Nelson wrote:
> - Provides User space IO driver for on-chip modules
> 
> Signed-off-by: Sam Nelson <sam.nelson@ti.com>

Looks very good, thanks!

I take it this is rather generic and not keystone specific, as you don't set 
COMPATIBLE_MACHINE, right?


> ---
>  recipes-bsp/uio-module-drv/uio-module-drv_git.bb |   22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>  create mode 100644 recipes-bsp/uio-module-drv/uio-module-drv_git.bb
> 
> diff --git a/recipes-bsp/uio-module-drv/uio-module-drv_git.bb b/recipes-bsp/uio-module-drv/uio-module-drv_git.bb
> new file mode 100644
> index 0000000..c80dfc8
> --- /dev/null
> +++ b/recipes-bsp/uio-module-drv/uio-module-drv_git.bb
> @@ -0,0 +1,22 @@
> +DESCRIPTION="User space IO (UIO) driver for on-chip modules"
> +
> +LICENSE = "BSD"
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2b7c96eb2aed7b0f6f922214dbde9016"
> +
> +BRANCH ?= "master"
> +# This corresponds to version 01.00.01.00A
> +SRCREV = "3bce5bfec7a7865e278410e3c4484f878b9038b6"
> +PV = "1.0.1"
> +
> +SRC_URI = "git://git.ti.com/keystone-linux/uio-module-drv.git;protocol=git;branch=${BRANCH}"
> +
> +# This package builds a kernel module, use kernel PR as base and append a local
> +MACHINE_KERNEL_PR_append = "a+gitr${SRCPV}"
> +PR = "${MACHINE_KERNEL_PR}"
> +
> +S = "${WORKDIR}/git"
> +
> +module_auto_load_uio-module-drv = "uio-module-drv"
> +
> +inherit module
> +
> -- 
> 1.7.9.5
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

