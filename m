Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E752EE00A44; Thu, 22 May 2014 13:23:47 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=5.0 tests=RCVD_IN_DNSWL_HI,RDNS_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.152 listed in list.dnswl.org]
	*  1.3 RDNS_NONE Delivered to internal network by a host with no rDNS
Received: from comal.ext.ti.com (unknown [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8B850E00975
	for <meta-ti@yoctoproject.org>; Thu, 22 May 2014 13:23:43 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s4MKNhH5008544
	for <meta-ti@yoctoproject.org>; Thu, 22 May 2014 15:23:43 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s4MKNheJ023890
	for <meta-ti@yoctoproject.org>; Thu, 22 May 2014 15:23:43 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 22 May 2014 15:23:42 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s4MKNfq3029567;
	Thu, 22 May 2014 15:23:42 -0500
Date: Thu, 22 May 2014 16:23:41 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Chase Maupin <Chase.Maupin@ti.com>
Message-ID: <20140522202340.GQ21819@edge>
References: <1400789313-13523-1-git-send-email-Chase.Maupin@ti.com>
	<1400789313-13523-2-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
In-Reply-To: <1400789313-13523-2-git-send-email-Chase.Maupin@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCHv3 4/4] linux-ti-staging: Add version 3.15 of TI integration kernel
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
X-List-Received-Date: Thu, 22 May 2014 20:23:48 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, May 22, 2014 at 03:08:33PM -0500, Chase Maupin wrote:
> * Add version 3.15 of the TI integration kernel.  Major changes
>   from previous version are:
>     * Config fragments now come primarily from the integration
>       tree.  Removed baseport and connectivity fragments for now
>       and the others can be removed as they are added to the
>       integration tree.
>     * Added a non-smp.cfg config to disable SMP for single core
>       devices instead of using a patch to the defconfig file as
>       we did in the past.
> 
> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> 
> ---
> * Updated in version 2
>     * Change the default config fragements location
> 
> * Updated in version 3
>     * Use absolute paths in the config fragment names
> ---
>  .../defconfig                                      |    0
>  .../ipc.cfg                                        |    0
>  .../linux/linux-ti-staging-3.15/non-smp.cfg        |    5 +++++
>  .../systest.cfg                                    |    0
>  ...ti-staging_3.12.bb => linux-ti-staging_3.15.bb} |   21 +++++++++-----------
>  5 files changed, 14 insertions(+), 12 deletions(-)
>  copy recipes-kernel/linux/{linux-mainline => linux-ti-staging-3.15}/defconfig (100%)
>  copy recipes-kernel/linux/{linux-ti-staging-3.12 => linux-ti-staging-3.15}/ipc.cfg (100%)
>  create mode 100644 recipes-kernel/linux/linux-ti-staging-3.15/non-smp.cfg
>  copy recipes-kernel/linux/{linux-ti-staging-3.12 => linux-ti-staging-3.15}/systest.cfg (100%)
>  copy recipes-kernel/linux/{linux-ti-staging_3.12.bb => linux-ti-staging_3.15.bb} (73%)
> 
> diff --git a/recipes-kernel/linux/linux-mainline/defconfig b/recipes-kernel/linux/linux-ti-staging-3.15/defconfig
> similarity index 100%
> copy from recipes-kernel/linux/linux-mainline/defconfig
> copy to recipes-kernel/linux/linux-ti-staging-3.15/defconfig
> diff --git a/recipes-kernel/linux/linux-ti-staging-3.12/ipc.cfg b/recipes-kernel/linux/linux-ti-staging-3.15/ipc.cfg
> similarity index 100%
> copy from recipes-kernel/linux/linux-ti-staging-3.12/ipc.cfg
> copy to recipes-kernel/linux/linux-ti-staging-3.15/ipc.cfg
> diff --git a/recipes-kernel/linux/linux-ti-staging-3.15/non-smp.cfg b/recipes-kernel/linux/linux-ti-staging-3.15/non-smp.cfg
> new file mode 100644
> index 0000000..d61a413
> --- /dev/null
> +++ b/recipes-kernel/linux/linux-ti-staging-3.15/non-smp.cfg
> @@ -0,0 +1,5 @@
> +##################################################
> +# Non-SMP config options
> +##################################################
> +CONFIG_SMP=n
> +CONFIG_NR_CPUS=n
> diff --git a/recipes-kernel/linux/linux-ti-staging-3.12/systest.cfg b/recipes-kernel/linux/linux-ti-staging-3.15/systest.cfg
> similarity index 100%
> copy from recipes-kernel/linux/linux-ti-staging-3.12/systest.cfg
> copy to recipes-kernel/linux/linux-ti-staging-3.15/systest.cfg
> diff --git a/recipes-kernel/linux/linux-ti-staging_3.12.bb b/recipes-kernel/linux/linux-ti-staging_3.15.bb
> similarity index 73%
> copy from recipes-kernel/linux/linux-ti-staging_3.12.bb
> copy to recipes-kernel/linux/linux-ti-staging_3.15.bb
> index 5c4d669..fee67ce 100644
> --- a/recipes-kernel/linux/linux-ti-staging_3.12.bb
> +++ b/recipes-kernel/linux/linux-ti-staging_3.15.bb
> @@ -9,7 +9,7 @@ require recipes-kernel/linux/linux-dtb.inc
>  require recipes-kernel/linux/setup-defconfig.inc
>  
>  # Look in the generic major.minor directory for files
> -FILESEXTRAPATHS_append := "${THISDIR}/${PN}-3.12:"
> +FILESEXTRAPATHS_append := "${THISDIR}/${PN}-3.15:"
>  
>  # Pull in the devicetree files into the rootfs
>  RDEPENDS_kernel-base += "kernel-devicetree"
> @@ -37,26 +37,23 @@ COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15"
>  
>  S = "${WORKDIR}/git"
>  
> -BRANCH = "ti-linux-3.12.y"
> +BRANCH = "ti-linux-3.15.y"
>  
>  SRCREV = "f0d4672333685697320f4907d5b4d3919121c299"
> -PV = "3.12.17"
> +PV = "3.14+3.15-rc6"
>  
>  # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
> -MACHINE_KERNEL_PR_append = "b+gitr${SRCPV}"
> +MACHINE_KERNEL_PR_append = "c+gitr${SRCPV}"
>  PR = "${MACHINE_KERNEL_PR}"
>  
> -KERNEL_CONFIG_FRAGMENTS = "${WORKDIR}/baseport.cfg ${WORKDIR}/connectivity.cfg \
> -                           ${WORKDIR}/ipc.cfg"
> +KERNEL_CONFIG_DIR = "ti_config_fragments"

So, where this directory is meant to be? The last patch assumed it was in 
arch/arm/configs... Or did I miss v2 of the patch?


> +KERNEL_CONFIG_FRAGMENTS = "${WORKDIR}/ipc.cfg"
> +KERNEL_CONFIG_FRAGMENTS_append_ti33x = "${WORKDIR}/non-smp.cfg"
> +KERNEL_CONFIG_FRAGMENTS_append_ti43x = "${WORKDIR}/non-smp.cfg"
>  
>  SRC_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git;protocol=git;branch=${BRANCH} \
>             file://defconfig \
> -           file://baseport.cfg \
> -           file://connectivity.cfg \
>             file://ipc.cfg \
>             file://systest.cfg \
> +           file://non-smp.cfg \
>            "
> -
> -# Disable SMP in defconfig on single-core platforms to reduce overhead
> -SRC_URI_append_ti33x = "file://0001-Not-for-merge-ARM-config-omap-Disable-SMP-for-AM335x.patch"
> -SRC_URI_append_ti43x = "file://0001-Not-for-merge-ARM-config-omap-Disable-SMP-for-AM335x.patch"
> -- 
> 1.7.9.5
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

