Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 53FA4E0086E
	for <meta-ti@yoctoproject.org>; Thu, 20 Feb 2014 09:30:32 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s1KHUVe0027473
	for <meta-ti@yoctoproject.org>; Thu, 20 Feb 2014 11:30:31 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s1KHUV3T007455
	for <meta-ti@yoctoproject.org>; Thu, 20 Feb 2014 11:30:31 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 20 Feb 2014 11:30:30 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s1KHUUNo003104;
	Thu, 20 Feb 2014 11:30:30 -0600
Date: Thu, 20 Feb 2014 12:30:29 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Franklin S. Cooper Jr" <fcooper@ti.com>
Message-ID: <20140220173027.GA16134@edge>
References: <1392741750-18725-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
In-Reply-To: <1392741750-18725-1-git-send-email-fcooper@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] Graphics SDK: Add version 05.01.01.01
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
X-List-Received-Date: Thu, 20 Feb 2014 17:30:33 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Franklin,

The patch is fine. But I'm thinking about how to best handle it pushing to 
specific branches...

I could push it to master and dora right away. But I'd assume you'd want it in 
dylan as well. Unfortunately, it's not going into our dylan-based release, so 
I'd like to wait until I tag the branch, which should hopefully happen 
tomorrow or on Monday. Does it work for you?

-- 
Denys


On Tue, Feb 18, 2014 at 10:42:30AM -0600, Franklin S. Cooper Jr wrote:
> * Add latest version of the Graphics SDK that includes bug fixes.
> * Fixed Suspend and Resume issue on AM43x.
> 
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  ...01.00.01.bb => omap3-sgx-modules_5.01.01.01.bb} |    6 +++---
>  .../rc.pvr                                         |    0
>  .../rc_dri.pvr                                     |    0
>  ...3_5.01.00.01.bb => libgles-omap3_5.01.01.01.bb} |    8 ++++----
>  4 files changed, 7 insertions(+), 7 deletions(-)
>  copy recipes-bsp/powervr-drivers/{omap3-sgx-modules_5.01.00.01.bb => omap3-sgx-modules_5.01.01.01.bb} (92%)
>  copy recipes-graphics/libgles/{libgles-omap3-5.00.00.01 => libgles-omap3-5.01.01.01}/rc.pvr (100%)
>  copy recipes-graphics/libgles/{libgles-omap3-5.00.00.01 => libgles-omap3-5.01.01.01}/rc_dri.pvr (100%)
>  copy recipes-graphics/libgles/{libgles-omap3_5.01.00.01.bb => libgles-omap3_5.01.01.01.bb} (87%)
> 
> diff --git a/recipes-bsp/powervr-drivers/omap3-sgx-modules_5.01.00.01.bb b/recipes-bsp/powervr-drivers/omap3-sgx-modules_5.01.01.01.bb
> similarity index 92%
> copy from recipes-bsp/powervr-drivers/omap3-sgx-modules_5.01.00.01.bb
> copy to recipes-bsp/powervr-drivers/omap3-sgx-modules_5.01.01.01.bb
> index 162e4d5..40bf8c0 100644
> --- a/recipes-bsp/powervr-drivers/omap3-sgx-modules_5.01.00.01.bb
> +++ b/recipes-bsp/powervr-drivers/omap3-sgx-modules_5.01.01.01.bb
> @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://GPL-COPYING;md5=60422928ba677faaa13d6ab5f5baaa1e"
>  TI_BIN_UNPK_CMDS="Y: qY:workdir:Y"
>  require ../../recipes-ti/includes/ti-eula-unpack.inc
>  
> -SGXPV = "5_01_00_01"
> +SGXPV = "5_01_01_01"
>  IMGPV = "1.10.2359475"
>  
>  inherit module
> @@ -14,8 +14,8 @@ MACHINE_KERNEL_PR_append = "a"
>  PR = "${MACHINE_KERNEL_PR}"
>  
>  BINFILE_HARDFP = "Graphics_SDK_setuplinux_hardfp_${SGXPV}.bin"
> -MD5SUM_HARDFP = "0ee7d59808330d442a51c0990c2cb30e"
> -SHA256SUM_HARDFP = "769daae439677a7a85bbbced14cee4f85b19823e0b99560078d0a864c525c128"
> +MD5SUM_HARDFP = "94acdbd20152c905939c2448d5e80a72"
> +SHA256SUM_HARDFP = "7f647bf45a5ce8ba9aaa28c4afe85fced4275f9a4567a1886d4460b76c9051ae"
>  
>  # For now we only have hardfp version
>  python __anonymous() {
> diff --git a/recipes-graphics/libgles/libgles-omap3-5.00.00.01/rc.pvr b/recipes-graphics/libgles/libgles-omap3-5.01.01.01/rc.pvr
> similarity index 100%
> copy from recipes-graphics/libgles/libgles-omap3-5.00.00.01/rc.pvr
> copy to recipes-graphics/libgles/libgles-omap3-5.01.01.01/rc.pvr
> diff --git a/recipes-graphics/libgles/libgles-omap3-5.00.00.01/rc_dri.pvr b/recipes-graphics/libgles/libgles-omap3-5.01.01.01/rc_dri.pvr
> similarity index 100%
> copy from recipes-graphics/libgles/libgles-omap3-5.00.00.01/rc_dri.pvr
> copy to recipes-graphics/libgles/libgles-omap3-5.01.01.01/rc_dri.pvr
> diff --git a/recipes-graphics/libgles/libgles-omap3_5.01.00.01.bb b/recipes-graphics/libgles/libgles-omap3_5.01.01.01.bb
> similarity index 87%
> copy from recipes-graphics/libgles/libgles-omap3_5.01.00.01.bb
> copy to recipes-graphics/libgles/libgles-omap3_5.01.01.01.bb
> index a3b34fe..2d11317 100644
> --- a/recipes-graphics/libgles/libgles-omap3_5.01.00.01.bb
> +++ b/recipes-graphics/libgles/libgles-omap3_5.01.01.01.bb
> @@ -2,7 +2,7 @@ require libgles-omap3-no-x.inc
>  
>  LICENSE = "TSPA"
>  
> -PR = "${INC_PR}.1"
> +PR = "${INC_PR}.0"
>  
>  BINLOCATION_omap3 = "${S}/gfx_rel_es3.x"
>  BINLOCATION_ti816x = "${S}/gfx_rel_es6.x"
> @@ -13,14 +13,14 @@ BINLOCATION_ti43x = "${S}/gfx_rel_es9.x"
>  PLATFORM = "LinuxARMV7"
>  PVR_INIT = "pvrsrvctl"
>  
> -SGXPV = "5_01_00_01"
> +SGXPV = "5_01_01_01"
>  IMGPV = "1.10.2359475"
>  
>  TI_BIN_UNPK_WDEXT := "/Graphics_SDK_${SGXPV}"
>  
>  BINFILE_HARDFP = "Graphics_SDK_setuplinux_hardfp_${SGXPV}.bin"
> -MD5SUM_HARDFP = "0ee7d59808330d442a51c0990c2cb30e"
> -SHA256SUM_HARDFP = "769daae439677a7a85bbbced14cee4f85b19823e0b99560078d0a864c525c128"
> +MD5SUM_HARDFP = "94acdbd20152c905939c2448d5e80a72"
> +SHA256SUM_HARDFP = "7f647bf45a5ce8ba9aaa28c4afe85fced4275f9a4567a1886d4460b76c9051ae"
>  
>  # For now we only have hardfp version
>  python __anonymous() {
> -- 
> 1.7.0.4
> 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

