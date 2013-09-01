Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9BE8BE0049C
	for <meta-ti@yoctoproject.org>; Sat, 31 Aug 2013 20:15:30 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r813FTuH007755
	for <meta-ti@yoctoproject.org>; Sat, 31 Aug 2013 22:15:29 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r813FTHk008752
	for <meta-ti@yoctoproject.org>; Sat, 31 Aug 2013 22:15:29 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Sat, 31 Aug 2013 22:15:29 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id r813FSaT005033	for
	<meta-ti@yoctoproject.org>; Sat, 31 Aug 2013 22:15:28 -0500
Date: Sat, 31 Aug 2013 23:15:28 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-ti@yoctoproject.org>
Message-ID: <20130901031528.GA18322@edge>
References: <1378005180-30928-1-git-send-email-denis@denix.org>
	<1378005180-30928-5-git-send-email-denis@denix.org>
MIME-Version: 1.0
In-Reply-To: <1378005180-30928-5-git-send-email-denis@denix.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH 5/5] libgles-omap3, omap3-sgx-modules: remove old 4.03.00.02 version
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
X-List-Received-Date: Sun, 01 Sep 2013 03:15:30 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

BTW, consider this an RFC for removing the next 4.05.00.03 version as well - I 
know some people are still using it, so please speak up.

-- 
Denys


On Sat, Aug 31, 2013 at 11:13:00PM -0400, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@ti.com>
> 
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  .../omap3-sgx-modules_1.6.16.3977.bb               | 45 ----------------------
>  .../libgles/libgles-omap3_4.03.00.02.bb            | 30 ---------------
>  2 files changed, 75 deletions(-)
>  delete mode 100644 recipes-bsp/powervr-drivers/omap3-sgx-modules_1.6.16.3977.bb
>  delete mode 100644 recipes-graphics/libgles/libgles-omap3_4.03.00.02.bb
> 
> diff --git a/recipes-bsp/powervr-drivers/omap3-sgx-modules_1.6.16.3977.bb b/recipes-bsp/powervr-drivers/omap3-sgx-modules_1.6.16.3977.bb
> deleted file mode 100644
> index 4f9be7b..0000000
> --- a/recipes-bsp/powervr-drivers/omap3-sgx-modules_1.6.16.3977.bb
> +++ /dev/null
> @@ -1,45 +0,0 @@
> -DESCRIPTION = "Kernel drivers for the PowerVR SGX chipset found in the omap3 SoCs"
> -LICENSE = "GPLv2"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=21228a42e27d1d104b31a83f7c9da935"
> -
> -TI_BIN_UNPK_CMDS="Y: qY:workdir:Y"
> -require ../../recipes-ti/includes/ti-eula-unpack.inc
> -
> -SGXPV = "4_03_00_02"
> -IMGPV = "1.6.16.3977"
> -BINFILE := "Graphics_SDK_setuplinux_${SGXPV}.bin"
> -
> -inherit module
> -
> -MACHINE_KERNEL_PR_append = "b"
> -PR = "${MACHINE_KERNEL_PR}"
> -
> -SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/${SGXPV}/exports/${BINFILE} \
> -           file://Compile-fixes-for-38-kernel.patch \
> -           file://kernel-30.patch \
> -          "
> -SRC_URI[md5sum] = "ff8c1f2b8e4cb42f4ced6a613b081ada"
> -SRC_URI[sha256sum] = "cdb0bd3964e107733d632aa8224e0537b05c1ffac34befc036423458c8d75255"
> -TI_BIN_UNPK_WDEXT="/Graphics_SDK_${SGXPV}"
> -S = "${WORKDIR}${TI_BIN_UNPK_WDEXT}/GFX_Linux_KM"
> -
> -PVRBUILD = "release"
> -export KERNELDIR = "${STAGING_KERNEL_DIR}"
> -
> -INHIBIT_PACKAGE_STRIP = "1"
> -
> -TI_PLATFORM_omap3 = "omap3630"
> -TI_PLATFORM_ti816x = "ti81xx"
> -
> -MODULESLOCATION_omap3 = "dc_omap3430_linux"
> -MODULESLOCATION_ti816x = "dc_ti81xx_linux"
> -
> -MAKE_TARGETS = " BUILD=${PVRBUILD} TI_PLATFORM=${TI_PLATFORM}"
> -
> -do_install() {
> -	mkdir -p ${D}/lib/modules/${KERNEL_VERSION}/kernel/drivers/gpu/pvr
> -	cp ${S}/pvrsrvkm.ko \
> -	   ${S}/services4/3rdparty/${MODULESLOCATION}/omaplfb.ko  \
> -	   ${S}/services4/3rdparty/bufferclass_ti/bufferclass_ti.ko \
> -	   ${D}/lib/modules/${KERNEL_VERSION}/kernel/drivers/gpu/pvr
> -}
> diff --git a/recipes-graphics/libgles/libgles-omap3_4.03.00.02.bb b/recipes-graphics/libgles/libgles-omap3_4.03.00.02.bb
> deleted file mode 100644
> index e98fe02..0000000
> --- a/recipes-graphics/libgles/libgles-omap3_4.03.00.02.bb
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -BINLOCATION_omap3  = "${S}/gfx_rel_es3.x"
> -BINLOCATION_ti816x = "${S}/gfx_rel_es6.x"
> -
> -ES2LOCATION = "${S}/gfx_rel_es2.x"
> -ES3LOCATION = "${S}/gfx_rel_es3.x"
> -ES5LOCATION = "${S}/gfx_rel_es5.x"
> -ES6LOCATION = "${S}/gfx_rel_es6.x"
> -
> -require libgles-omap3.inc
> -
> -# download required binary distribution from:
> -# http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/latest/index_FDS.html
> -# see libgles-omap3.inc for detailed installation instructions
> -
> -SGXPV = "4_03_00_02"
> -IMGPV = "1.6.16.3977"
> -BINFILE := "Graphics_SDK_setuplinux_${SGXPV}.bin"
> -TI_BIN_UNPK_WDEXT := "/Graphics_SDK_${SGXPV}"
> -
> -SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/${SGXPV}/exports/${BINFILE} \
> -                   file://cputype \
> -                   file://rc.pvr \
> -                   file://sample.desktop \
> -                   file://99-bufferclass.rules  \
> -"
> -
> -SRC_URI[md5sum] = "ff8c1f2b8e4cb42f4ced6a613b081ada"
> -SRC_URI[sha256sum] = "cdb0bd3964e107733d632aa8224e0537b05c1ffac34befc036423458c8d75255"
> -
> -S = "${WORKDIR}/Graphics_SDK_${SGXPV}"
> -- 
> 1.8.3.2
> 

