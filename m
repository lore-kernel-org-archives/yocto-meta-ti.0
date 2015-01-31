Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 76B63E00873; Fri, 30 Jan 2015 18:55:47 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at http://www.dnswl.org/,
	high *      trust
	*      [198.47.26.152 listed in list.dnswl.org]
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F19F3E00546
	for <meta-ti@yoctoproject.org>; Fri, 30 Jan 2015 18:55:37 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t0V2tacQ028622
	for <meta-ti@yoctoproject.org>; Fri, 30 Jan 2015 20:55:36 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t0V2tZrJ023025
	for <meta-ti@yoctoproject.org>; Fri, 30 Jan 2015 20:55:35 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 30 Jan 2015 20:55:35 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t0V2tZ7p030119;
	Fri, 30 Jan 2015 20:55:35 -0600
Date: Fri, 30 Jan 2015 21:55:35 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Franklin S. Cooper Jr" <fcooper@ti.com>
Message-ID: <20150131025534.GC2883@edge>
References: <1422657902-16482-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
In-Reply-To: <1422657902-16482-1-git-send-email-fcooper@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] Graphics SDK: Add 05.01.01.02
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
X-List-Received-Date: Sat, 31 Jan 2015 02:55:47 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Jan 30, 2015 at 04:45:02PM -0600, Franklin S. Cooper Jr wrote:
> From: "Franklin S. Cooper Jr" <fcooper@ti.com>
> 
> * This graphics sdk is a minor update to the 05.01.01.01 version but includes
>   updates to support the 3.14 kernel.
> 
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  ...01.01.01.bb => omap3-sgx-modules_5.01.01.02.bb} |   12 ++++--------
>  .../rc.pvr                                         |    0
>  .../rc_dri.pvr                                     |    0
>  ...3_5.01.01.01.bb => libgles-omap3_5.01.01.02.bb} |    6 +++---
>  4 files changed, 7 insertions(+), 11 deletions(-)
>  copy recipes-bsp/powervr-drivers/{omap3-sgx-modules_5.01.01.01.bb => omap3-sgx-modules_5.01.01.02.bb} (77%)
>  copy recipes-graphics/libgles/{libgles-omap3-5.01.01.01 => libgles-omap3-5.01.01.02}/rc.pvr (100%)
>  copy recipes-graphics/libgles/{libgles-omap3-5.01.01.01 => libgles-omap3-5.01.01.02}/rc_dri.pvr (100%)
>  copy recipes-graphics/libgles/{libgles-omap3_5.01.01.01.bb => libgles-omap3_5.01.01.02.bb} (89%)
> 
> diff --git a/recipes-bsp/powervr-drivers/omap3-sgx-modules_5.01.01.01.bb b/recipes-bsp/powervr-drivers/omap3-sgx-modules_5.01.01.02.bb
> similarity index 77%
> copy from recipes-bsp/powervr-drivers/omap3-sgx-modules_5.01.01.01.bb
> copy to recipes-bsp/powervr-drivers/omap3-sgx-modules_5.01.01.02.bb
> index a1d95bf..6a07d4f 100644
> --- a/recipes-bsp/powervr-drivers/omap3-sgx-modules_5.01.01.01.bb
> +++ b/recipes-bsp/powervr-drivers/omap3-sgx-modules_5.01.01.02.bb
> @@ -5,17 +5,17 @@ LIC_FILES_CHKSUM = "file://GPL-COPYING;md5=60422928ba677faaa13d6ab5f5baaa1e"
>  TI_BIN_UNPK_CMDS="Y: qY:workdir:Y"
>  require ../../recipes-ti/includes/ti-eula-unpack.inc
>  
> -SGXPV = "5_01_01_01"
> +SGXPV = "5_01_01_02"
>  IMGPV = "1.10.2359475"
>  
>  inherit module
>  
> -MACHINE_KERNEL_PR_append = "c"
> +MACHINE_KERNEL_PR_append = "a"
>  PR = "${MACHINE_KERNEL_PR}"
>  
>  BINFILE_HARDFP = "Graphics_SDK_setuplinux_hardfp_${SGXPV}.bin"
> -MD5SUM_HARDFP = "94acdbd20152c905939c2448d5e80a72"
> -SHA256SUM_HARDFP = "7f647bf45a5ce8ba9aaa28c4afe85fced4275f9a4567a1886d4460b76c9051ae"
> +MD5SUM_HARDFP = "94bcb31ea7eb50df1dfa4037055b638e"
> +SHA256SUM_HARDFP = "54641222cdb49b03f996cbd6412de227198d9e084f5647d706bbf4217e8cdb07"
>  
>  # For now we only have hardfp version
>  python __anonymous() {
> @@ -33,10 +33,6 @@ BINFILE := "${BINFILE_HARDFP}"
>  
>  SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/gfxsdk/${SGXPV}/exports/${BINFILE}"
>  
> -SRC_URI += "file://0001-PoC-GFX-SDK-Make-5_01_01_01-work-against-3.14-LTS.patch;striplevel=2 \
> -            file://0002-SGX-linux-use-platform-data-to-provide-reset-info.patch;striplevel=2 \
> -            file://0003-SGX-displayclass-am335x-am437x-fix-mutex-deadlock-wa.patch;striplevel=2 \
> -            file://0004-SGX-linux-make-it-building-against-ti-linux-3.14.y.patch;striplevel=2"

All 4 patches were integrated into 5.1.1.2?


>  SRC_URI[md5sum] := "${MD5SUM_HARDFP}"
>  SRC_URI[sha256sum] := "${SHA256SUM_HARDFP}"
> diff --git a/recipes-graphics/libgles/libgles-omap3-5.01.01.01/rc.pvr b/recipes-graphics/libgles/libgles-omap3-5.01.01.02/rc.pvr
> similarity index 100%
> copy from recipes-graphics/libgles/libgles-omap3-5.01.01.01/rc.pvr
> copy to recipes-graphics/libgles/libgles-omap3-5.01.01.02/rc.pvr
> diff --git a/recipes-graphics/libgles/libgles-omap3-5.01.01.01/rc_dri.pvr b/recipes-graphics/libgles/libgles-omap3-5.01.01.02/rc_dri.pvr
> similarity index 100%
> copy from recipes-graphics/libgles/libgles-omap3-5.01.01.01/rc_dri.pvr
> copy to recipes-graphics/libgles/libgles-omap3-5.01.01.02/rc_dri.pvr
> diff --git a/recipes-graphics/libgles/libgles-omap3_5.01.01.01.bb b/recipes-graphics/libgles/libgles-omap3_5.01.01.02.bb
> similarity index 89%
> copy from recipes-graphics/libgles/libgles-omap3_5.01.01.01.bb
> copy to recipes-graphics/libgles/libgles-omap3_5.01.01.02.bb
> index 0b1b8ca..61a3395 100644
> --- a/recipes-graphics/libgles/libgles-omap3_5.01.01.01.bb
> +++ b/recipes-graphics/libgles/libgles-omap3_5.01.01.02.bb
> @@ -13,14 +13,14 @@ BINLOCATION_ti43x = "${S}/gfx_rel_es9.x"
>  PLATFORM = "LinuxARMV7"
>  PVR_INIT = "pvrsrvctl"
>  
> -SGXPV = "5_01_01_01"
> +SGXPV = "5_01_01_02"
>  IMGPV = "1.10.2359475"
>  
>  TI_BIN_UNPK_WDEXT := "/Graphics_SDK_${SGXPV}"
>  
>  BINFILE_HARDFP = "Graphics_SDK_setuplinux_hardfp_${SGXPV}.bin"
> -MD5SUM_HARDFP = "94acdbd20152c905939c2448d5e80a72"
> -SHA256SUM_HARDFP = "7f647bf45a5ce8ba9aaa28c4afe85fced4275f9a4567a1886d4460b76c9051ae"
> +MD5SUM_HARDFP = "94bcb31ea7eb50df1dfa4037055b638e"
> +SHA256SUM_HARDFP = "54641222cdb49b03f996cbd6412de227198d9e084f5647d706bbf4217e8cdb07"
>  
>  # For now we only have hardfp version
>  python __anonymous() {
> -- 
> 1.7.9.5
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

