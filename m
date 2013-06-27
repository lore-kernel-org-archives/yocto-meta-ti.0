Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6AE84E00722
	for <meta-ti@yoctoproject.org>; Thu, 27 Jun 2013 09:05:18 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r5RG5HRF029417
	for <meta-ti@yoctoproject.org>; Thu, 27 Jun 2013 11:05:17 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r5RG5HxB010311
	for <meta-ti@yoctoproject.org>; Thu, 27 Jun 2013 11:05:17 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 27 Jun 2013 11:05:17 -0500
Received: from localhost (gtudedge.gt.design.ti.com [158.218.102.158])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id r5RG5H21020416;
	Thu, 27 Jun 2013 11:05:17 -0500
Date: Thu, 27 Jun 2013 12:05:17 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Siddharth Heroor <heroor@ti.com>
Message-ID: <20130627160516.GB30195@edge>
References: <20130627155932.GA6908@ti.com>
MIME-Version: 1.0
In-Reply-To: <20130627155932.GA6908@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCHv3] recipes-kernel: Add GLSDK specific kernel tree for omap-a15
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
X-List-Received-Date: Thu, 27 Jun 2013 16:05:20 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

You forgot v2 portion now, sorry... :)

On Thu, Jun 27, 2013 at 09:29:32PM +0530, Siddharth Heroor wrote:
> * Machine compatible with only omap-a15 devices.
> * The TI Staging tree will not be used to maintain K3.8. Instead,
>   this new tree is set up as a production tree. Pending features
>   for 3.8 will be implemented on this tree.
>   - Backported features from linux mainline
>   - Backported bug-fixes from linux mainline and linux-stable.
>   - Features implemented by the GLSDK team which maybe product
>     specific.
>   This is the tree on which GLSDK kernel releases will be made.
> * This recipe is based off the Core SDK 2013.04.02 released kernel
>   recipe - recipes-kernel/linux/linux-ti-staging_3.8.bb

BTW, if you don't want the patch changes to show up in the git history, you 
can separate them with a '---' line that is after SOB/CC lines below.


> v2:
>     Regenerate the patch using --find-copies-harder -M
> 
> v3:
> 
> * Set DEFAULT_PREFERENCE = -1. This will be overridden in the
>   glsdk branding in meta-arago.
> * Set MACHINE_KERNEL_PR_append to 'a+'. The basis for this
>   recipe is linux-ti-staging_3.8.bb, but since a new recipe is
>   created, we reset.
> * Remove comment on Core SDK version to avoid confusion.
> 
> Signed-off-by: Siddharth Heroor <heroor@ti.com>
> cc: Mrinmayee Hingolikar <mrinmayee@ti.com>
> ---
>  .../{linux-ti-staging => linux-ti-glsdk}/defconfig |    0
>  recipes-kernel/linux/linux-ti-glsdk_3.8.bb         |   31 ++++++++++++++++++++
>  2 files changed, 31 insertions(+), 0 deletions(-)
>  copy recipes-kernel/linux/{linux-ti-staging => linux-ti-glsdk}/defconfig (100%)
>  create mode 100644 recipes-kernel/linux/linux-ti-glsdk_3.8.bb
> 
> diff --git a/recipes-kernel/linux/linux-ti-staging/defconfig b/recipes-kernel/linux/linux-ti-glsdk/defconfig
> similarity index 100%
> copy from recipes-kernel/linux/linux-ti-staging/defconfig
> copy to recipes-kernel/linux/linux-ti-glsdk/defconfig
> diff --git a/recipes-kernel/linux/linux-ti-glsdk_3.8.bb b/recipes-kernel/linux/linux-ti-glsdk_3.8.bb
> new file mode 100644
> index 0000000..2746188
> --- /dev/null
> +++ b/recipes-kernel/linux/linux-ti-glsdk_3.8.bb
> @@ -0,0 +1,31 @@
> +SECTION = "kernel"
> +DESCRIPTION = "Linux kernel for TI devices supported by the GLSDK product"
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
> +KERNEL_IMAGETYPE = "uImage"
> +
> +inherit kernel
> +
> +require recipes-kernel/linux/linux-dtb.inc
> +require recipes-kernel/linux/setup-defconfig.inc
> +
> +KERNEL_DEVICETREE_omap5-evm = "arch/arm/boot/dts/omap5-sevm.dts arch/arm/boot/dts/omap5-uevm.dts"
> +KERNEL_DEVICETREE_dra7xx-evm = "arch/arm/boot/dts/dra7-evm.dts"
> +
> +COMPATIBLE_MACHINE = "omap-a15"
> +
> +DEFAULT_PREFERENCE = "-1"
> +
> +S = "${WORKDIR}/git"
> +
> +BRANCH = "master"
> +
> +SRCREV = "4e8193eb3b7465d7f67cd8c7e6c2ed99dad1a483"
> +PV = "3.8.13"
> +
> +# Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
> +MACHINE_KERNEL_PR_append = "a+gitr${SRCPV}"
> +
> +SRC_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-3-8-y-kernel.git;protocol=git;branch=${BRANCH} \
> +           file://defconfig \
> +          "
> -- 
> 1.7.0.4
> 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

