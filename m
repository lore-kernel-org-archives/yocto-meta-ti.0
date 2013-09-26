Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EF860E015D3
	for <meta-ti@yoctoproject.org>; Thu, 26 Sep 2013 06:50:42 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r8QDofa7007344
	for <meta-ti@yoctoproject.org>; Thu, 26 Sep 2013 08:50:41 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8QDoeei003542;
	Thu, 26 Sep 2013 08:50:40 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 26 Sep 2013 08:50:40 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8QDoeKV028279;
	Thu, 26 Sep 2013 08:50:40 -0500
Date: Thu, 26 Sep 2013 09:50:39 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Deepak M <x0171695@ti.com>
Message-ID: <20130926135039.GH14528@edge>
References: <1380112791-22545-1-git-send-email-x0171695@ti.com>
	<1380112791-22545-4-git-send-email-x0171695@ti.com>
MIME-Version: 1.0
In-Reply-To: <1380112791-22545-4-git-send-email-x0171695@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: maulik@ti.com, meta-ti@yoctoproject.org, epos_dev@list.ti.com,
	nageswari@ti.com
Subject: Re: [meta-ti patch v3 3/3] am43xx: Added the kernel recipe
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
X-List-Received-Date: Thu, 26 Sep 2013 13:50:44 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Sep 25, 2013 at 06:09:50PM +0530, Deepak M wrote:
> Signed-off-by: Deepak M <x0171695@ti.com>
> ---
> v3:
> 1. Changed the kernel recipe name to linux-am43xx
> 2. Using the external source link
> 
>  recipes-kernel/linux/linux-am43xx/defconfig |  1 +
>  recipes-kernel/linux/linux-am43xx_3.12.bb   | 31 +++++++++++++++++++++++++++++
>  2 files changed, 32 insertions(+)
>  create mode 100644 recipes-kernel/linux/linux-am43xx/defconfig
>  create mode 100644 recipes-kernel/linux/linux-am43xx_3.12.bb

Again, 3.12 is not yet released, you can't call your recipe with 3.12.


> diff --git a/recipes-kernel/linux/linux-am43xx/defconfig b/recipes-kernel/linux/linux-am43xx/defconfig
> new file mode 100644
> index 0000000..926b35a
> --- /dev/null
> +++ b/recipes-kernel/linux/linux-am43xx/defconfig
> @@ -0,0 +1 @@
> +use-kernel-config=omap2plus_defconfig
> diff --git a/recipes-kernel/linux/linux-am43xx_3.12.bb b/recipes-kernel/linux/linux-am43xx_3.12.bb
> new file mode 100644
> index 0000000..a4b0700
> --- /dev/null
> +++ b/recipes-kernel/linux/linux-am43xx_3.12.bb
> @@ -0,0 +1,31 @@
> +SECTION = "kernel"
> +DESCRIPTION = "Linux kernel for TI33x devices from PSP"
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
> +COMPATIBLE_MACHINE = "am437x-epos-evm"
> +
> +DEFAULT_PREFERENCE = "-1"
> +
> +inherit kernel
> +require recipes-kernel/linux/linux-dtb.inc
> +require setup-defconfig.inc
> +
> +KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT}"
> +
> +KERNEL_IMAGETYPE = "uImage"
> +KERNEL_DEVICETREE = "am43x-epos-evm.dtb"
> +
> +KERNEL_DTB = "arch/arm/boot/dts/am43x-epos-evm.dtb"
> +
> +
> +# The main PR is now using MACHINE_KERNEL_PR,
> +PR = "r1+gitr${SRCPV}"
> +
> +BRANCH   = "linux-3.12.y"
> +
> +SRC_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git;BRANCH=${BRANCH};protocol=ssh \
> +           file://defconfig \
> +"
> +
> +SRCREV = "272b98c6455f00884f0350f775c5342358ebb73f"
> +S = "${WORKDIR}/git"
> -- 
> 1.8.1
> 

