Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 27DCEE0152F
	for <meta-ti@yoctoproject.org>; Mon, 23 Sep 2013 20:26:55 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r8O3QtJ1024152
	for <meta-ti@yoctoproject.org>; Mon, 23 Sep 2013 22:26:55 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8O3QsYG030310
	for <meta-ti@yoctoproject.org>; Mon, 23 Sep 2013 22:26:55 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 23 Sep 2013 22:26:54 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8O3QsuI025826	for
	<meta-ti@yoctoproject.org>; Mon, 23 Sep 2013 22:26:54 -0500
Date: Mon, 23 Sep 2013 23:26:54 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-ti@yoctoproject.org>
Message-ID: <20130924032654.GH4390@edge>
References: <1379989631-8098-1-git-send-email-denis@denix.org>
	<1379989631-8098-3-git-send-email-denis@denix.org>
MIME-Version: 1.0
In-Reply-To: <1379989631-8098-3-git-send-email-denis@denix.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH 3/4] linux-ti-staging: make 3.12-rc the default for supported platforms, drop omap5-sevm.dtb
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
X-List-Received-Date: Tue, 24 Sep 2013 03:26:56 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

BTW, the Graphics SDK does not build against this kernel version:

| NOTE: make -j 12 -e MAKEFLAGS= KERNEL_PATH=/OE/RAM/dylan/arago-tmp-external-linaro-toolchain/sysroots/am335x-evm/usr/src/kernel KERNEL_SRC=/OE/RAM/dylan/arago-tmp-external-linaro-toolchain/sysroots/am335x-evm/usr/src/kernel KERNEL_VERSION=3.12.0-rc1-g351da8b CC=arm-linux-gnueabihf-gcc  -mno-thumb-interwork -marm LD=arm-linux-gnueabihf-ld   AR=arm-linux-gnueabihf-ar  BUILD=release TI_PLATFORM=ti335x SUPPORT_XORG=0 PM_RUNTIME=1
| make -C /OE/RAM/dylan/arago-tmp-external-linaro-toolchain/sysroots/am335x-evm/usr/src/kernel M=`pwd`
| make[1]: Entering directory `/OE/RAM/dylan/arago-tmp-external-linaro-toolchain/sysroots/am335x-evm/usr/src/kernel'
|   LD      /OE/RAM/dylan/arago-tmp-external-linaro-toolchain/work/am335x_evm-oe-linux-gnueabi/omap3-sgx-modules/4.09.00.01-r19c/Graphics_SDK_4_09_00_01/GFX_Linux_KM/services4/3rdparty/bufferclass_ti/built-in.o
|   CC [M]  /OE/RAM/dylan/arago-tmp-external-linaro-toolchain/work/am335x_evm-oe-linux-gnueabi/omap3-sgx-modules/4.09.00.01-r19c/Graphics_SDK_4_09_00_01/GFX_Linux_KM/services4/3rdparty/bufferclass_ti/bc_cat.o
|   LD [M]  /OE/RAM/dylan/arago-tmp-external-linaro-toolchain/work/am335x_evm-oe-linux-gnueabi/omap3-sgx-modules/4.09.00.01-r19c/Graphics_SDK_4_09_00_01/GFX_Linux_KM/services4/3rdparty/bufferclass_ti/bufferclass_ti.o
|   LD      /OE/RAM/dylan/arago-tmp-external-linaro-toolchain/work/am335x_evm-oe-linux-gnueabi/omap3-sgx-modules/4.09.00.01-r19c/Graphics_SDK_4_09_00_01/GFX_Linux_KM/services4/3rdparty/dc_ti335x_linux/built-in.o
|   CC [M]  /OE/RAM/dylan/arago-tmp-external-linaro-toolchain/work/am335x_evm-oe-linux-gnueabi/omap3-sgx-modules/4.09.00.01-r19c/Graphics_SDK_4_09_00_01/GFX_Linux_KM/services4/3rdparty/dc_ti335x_linux/omaplfb_displayclass.o
|   CC [M]  /OE/RAM/dylan/arago-tmp-external-linaro-toolchain/work/am335x_evm-oe-linux-gnueabi/omap3-sgx-modules/4.09.00.01-r19c/Graphics_SDK_4_09_00_01/GFX_Linux_KM/services4/3rdparty/dc_ti335x_linux/omaplfb_linux.o
|   LD [M]  /OE/RAM/dylan/arago-tmp-external-linaro-toolchain/work/am335x_evm-oe-linux-gnueabi/omap3-sgx-modules/4.09.00.01-r19c/Graphics_SDK_4_09_00_01/GFX_Linux_KM/services4/3rdparty/dc_ti335x_linux/omaplfb.o
|   LD      /OE/RAM/dylan/arago-tmp-external-linaro-toolchain/work/am335x_evm-oe-linux-gnueabi/omap3-sgx-modules/4.09.00.01-r19c/Graphics_SDK_4_09_00_01/GFX_Linux_KM/built-in.o
|   CC [M]  /OE/RAM/dylan/arago-tmp-external-linaro-toolchain/work/am335x_evm-oe-linux-gnueabi/omap3-sgx-modules/4.09.00.01-r19c/Graphics_SDK_4_09_00_01/GFX_Linux_KM/services4/srvkm/common/queue.o
| In file included from /OE/RAM/dylan/arago-tmp-external-linaro-toolchain/work/am335x_evm-oe-linux-gnueabi/omap3-sgx-modules/4.09.00.01-r19c/Graphics_SDK_4_09_00_01/GFX_Linux_KM/services4/srvkm/common/queue.c:75:0:
| /OE/RAM/dylan/arago-tmp-external-linaro-toolchain/work/am335x_evm-oe-linux-gnueabi/omap3-sgx-modules/4.09.00.01-r19c/Graphics_SDK_4_09_00_01/GFX_Linux_KM/services4/srvkm/env/linux/proc.h:84:48: error: unknown type name 'read_proc_t'
| /OE/RAM/dylan/arago-tmp-external-linaro-toolchain/work/am335x_evm-oe-linux-gnueabi/omap3-sgx-modules/4.09.00.01-r19c/Graphics_SDK_4_09_00_01/GFX_Linux_KM/services4/srvkm/env/linux/proc.h:84:70: error: unknown type name 'write_proc_t'
| /OE/RAM/dylan/arago-tmp-external-linaro-toolchain/work/am335x_evm-oe-linux-gnueabi/omap3-sgx-modules/4.09.00.01-r19c/Graphics_SDK_4_09_00_01/GFX_Linux_KM/services4/srvkm/env/linux/proc.h:86:58: error: unknown type name 'read_proc_t'
| /OE/RAM/dylan/arago-tmp-external-linaro-toolchain/work/am335x_evm-oe-linux-gnueabi/omap3-sgx-modules/4.09.00.01-r19c/Graphics_SDK_4_09_00_01/GFX_Linux_KM/services4/srvkm/env/linux/proc.h:86:80: error: unknown type name 'write_proc_t'
| /OE/RAM/dylan/arago-tmp-external-linaro-toolchain/work/am335x_evm-oe-linux-gnueabi/omap3-sgx-modules/4.09.00.01-r19c/Graphics_SDK_4_09_00_01/GFX_Linux_KM/services4/srvkm/env/linux/proc.h:110:9: error: unknown type name 'write_proc_t'
| /OE/RAM/dylan/arago-tmp-external-linaro-toolchain/work/am335x_evm-oe-linux-gnueabi/omap3-sgx-modules/4.09.00.01-r19c/Graphics_SDK_4_09_00_01/GFX_Linux_KM/services4/srvkm/env/linux/proc.h:120:9: error: unknown type name 'write_proc_t'
| make[2]: *** [/OE/RAM/dylan/arago-tmp-external-linaro-toolchain/work/am335x_evm-oe-linux-gnueabi/omap3-sgx-modules/4.09.00.01-r19c/Graphics_SDK_4_09_00_01/GFX_Linux_KM/services4/srvkm/common/queue.o] Error 1
| make[1]: *** [_module_/OE/RAM/dylan/arago-tmp-external-linaro-toolchain/work/am335x_evm-oe-linux-gnueabi/omap3-sgx-modules/4.09.00.01-r19c/Graphics_SDK_4_09_00_01/GFX_Linux_KM] Error 2
| make[1]: Leaving directory `/OE/RAM/dylan/arago-tmp-external-linaro-toolchain/sysroots/am335x-evm/usr/src/kernel'
| make: *** [all] Error 2
| ERROR: oe_runmake failed
| ERROR: Function failed: do_compile (see /OE/RAM/dylan/arago-tmp-external-linaro-toolchain/work/am335x_evm-oe-linux-gnueabi/omap3-sgx-modules/4.09.00.01-r19c/temp/log.do_compile.1004 for further information)

-- 
Denys


On Mon, Sep 23, 2013 at 10:27:10PM -0400, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@ti.com>
> 
> * DTB for OMAP5 sEVM was removed upstream, drop it from the recipe
> * Don't mask the default preference to be picked up normally by supported machines
> 
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  recipes-kernel/linux/linux-ti-staging_git.bb | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/recipes-kernel/linux/linux-ti-staging_git.bb b/recipes-kernel/linux/linux-ti-staging_git.bb
> index d3d11d2..e903215 100644
> --- a/recipes-kernel/linux/linux-ti-staging_git.bb
> +++ b/recipes-kernel/linux/linux-ti-staging_git.bb
> @@ -17,15 +17,13 @@ RDEPENDS_kernel-base_ti33x += "am33x-cm3 am33x-cm3-initscript"
>  KERNEL_DEVICETREE_ti33x = "am335x-evm.dtb am335x-evmsk.dtb am335x-bone.dtb"
>  KERNEL_DEVICETREE_am437x-evm = "am43x-epos-evm.dtb"
>  KERNEL_DEVICETREE_beaglebone = "am335x-bone.dtb"
> -KERNEL_DEVICETREE_omap5-evm = "omap5-sevm.dtb omap5-uevm.dtb"
> +KERNEL_DEVICETREE_omap5-evm = "omap5-uevm.dtb"
>  KERNEL_DEVICETREE_dra7xx-evm = "dra7-evm.dtb"
>  
>  KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT}"
>  
>  COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15"
>  
> -DEFAULT_PREFERENCE = "-1"
> -
>  S = "${WORKDIR}/git"
>  
>  BRANCH = "ti-linux-3.12.y"
> -- 
> 1.8.3.2
> 

