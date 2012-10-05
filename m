Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D7C98E00293
	for <meta-ti@yoctoproject.org>; Fri,  5 Oct 2012 13:24:14 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id q95KO9Ix016996;
	Fri, 5 Oct 2012 15:24:09 -0500
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q95KO9Df023773;
	Fri, 5 Oct 2012 15:24:09 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE74.ent.ti.com
	(157.170.170.8) with Microsoft SMTP Server id 14.1.323.3;
	Fri, 5 Oct 2012 15:24:08 -0500
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id q95KO9RW011050;
	Fri, 5 Oct 2012 15:24:09 -0500
Date: Fri, 5 Oct 2012 16:24:09 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
Message-ID: <20121005202408.GA32317@edge>
References: <1349413648-14346-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
In-Reply-To: <1349413648-14346-1-git-send-email-fcooper@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH v2] u-boot_2011.09-psp04.06.00.08: Add PSP v04.06.00.08 of u-boot
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
X-List-Received-Date: Fri, 05 Oct 2012 20:24:15 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Oct 05, 2012 at 12:07:28AM -0500, Franklin S. Cooper Jr wrote:
> * Add the PSP release version 04.06.00.08 of u-boot.

Ok, this looks fine and with D_P=-1 shouldn't affect other platforms. If 
nobody objects, I'd like to push it in soon.

-- 
Denys


> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
> Version 2 changes:
> Update COMPATIBLE_MACHINE to use generic omap3 instead of being board specific.
> 
>  .../u-boot/u-boot_2011.09-psp04.06.00.08.bb        |   29 ++++++++++++++++++++
>  1 files changed, 29 insertions(+), 0 deletions(-)
>  create mode 100644 recipes-bsp/u-boot/u-boot_2011.09-psp04.06.00.08.bb
> 
> diff --git a/recipes-bsp/u-boot/u-boot_2011.09-psp04.06.00.08.bb b/recipes-bsp/u-boot/u-boot_2011.09-psp04.06.00.08.bb
> new file mode 100644
> index 0000000..1bd4b9e
> --- /dev/null
> +++ b/recipes-bsp/u-boot/u-boot_2011.09-psp04.06.00.08.bb
> @@ -0,0 +1,29 @@
> +# Use the version of u-boot.inc in oe-core not the meta-ti version
> +require ${COREBASE}/meta/recipes-bsp/u-boot/u-boot.inc
> +
> +DESCRIPTION = "u-boot bootloader for ARM MPU devices"
> +LICENSE = "GPLv2+"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb"
> +
> +COMPATIBLE_MACHINE = "ti33x|omap3"
> +
> +DEFAULT_PREFERENCE = "-1"
> +
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +
> +PR = "r0+gitr${SRCPV}"
> +
> +SRC_URI = "git://arago-project.org/git/projects/u-boot-am33x.git;protocol=git;branch=${BRANCH}"
> +
> +BRANCH = "AM335XPSP_04.06.00.08"
> +
> +# Lock to the commit corresponding to TAG:
> +# v2011.09_AM335xPSP_04.06.00.08
> +SRCREV = "1e4626f0d5f3bb04ec974e76a5d9029875269d31"
> +
> +S = "${WORKDIR}/git"
> +
> +UBOOT_SUFFIX = "img"
> +
> +# Set the name of the SPL that will built so that it is also packaged with u-boot.
> +SPL_BINARY = "MLO"
> -- 
> 1.7.0.4
> 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

