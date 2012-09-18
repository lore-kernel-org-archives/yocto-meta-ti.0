Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D8405E002AB
	for <meta-ti@yoctoproject.org>; Mon, 17 Sep 2012 17:47:18 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id q8I0lI2l027044
	for <meta-ti@yoctoproject.org>; Mon, 17 Sep 2012 19:47:18 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q8I0lI5S004854
	for <meta-ti@yoctoproject.org>; Mon, 17 Sep 2012 19:47:18 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.1.323.3;
	Mon, 17 Sep 2012 19:47:18 -0500
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id q8I0lHok006730;
	Mon, 17 Sep 2012 19:47:18 -0500
Date: Mon, 17 Sep 2012 20:47:17 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-ID: <20120918004717.GD1708@edge>
References: <1346701925-7793-1-git-send-email-fcooper27jr@gmail.com>
	<8F29D6B095ED194EA1980491A5E029710C2D62B7@DFLE09.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C2D62B7@DFLE09.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH] omap3-sgx-modules: Upgrade to latest version 4.06.00.02
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
X-List-Received-Date: Tue, 18 Sep 2012 00:47:19 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Sep 17, 2012 at 11:38:32PM +0000, Cooper Jr., Franklin wrote:
> ping

Let's wait for Roger to enlighten us about the state of X11/DRI in the new 
Graphics SDK for libgles, to be matched with sgx-modules recipe...

On the other hand, setting it with D_P=-1 should let the previous proven 
version take precedence. Any objections from anyone?

-- 
Denys


> -----Original Message-----
> From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-bounces@yoctoproject.org] On Behalf Of Franklin S. Cooper Jr
> Sent: Monday, September 03, 2012 2:52 PM
> To: meta-ti@yoctoproject.org
> Cc: Franklin S. Cooper Jr
> Subject: [meta-ti] [PATCH] omap3-sgx-modules: Upgrade to latest version 4.06.00.02
> 
> * Add the latest version of omap3-sgx-modules.
> * Set DEFAULT_PREFERENCE to -1 to match libgles-omap3_4.06.00.02
> 
> Signed-off-by: Franklin S. Cooper Jr <fcooper27jr@gmail.com>
> ---
>  .../omap3-sgx-modules_4.06.00.02.bb                |   50 ++++++++++++++++++++
>  1 files changed, 50 insertions(+), 0 deletions(-)  create mode 100644 recipes-bsp/powervr-drivers/omap3-sgx-modules_4.06.00.02.bb
> 
> diff --git a/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.06.00.02.bb b/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.06.00.02.bb
> new file mode 100644
> index 0000000..c31e9f1
> --- /dev/null
> +++ b/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.06.00.02.bb
> @@ -0,0 +1,50 @@
> +DESCRIPTION = "Kernel drivers for the PowerVR SGX chipset found in the omap3 SoCs"
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=ea5743acf520dd81ca172e69f818a3d4"
> +
> +TI_BIN_UNPK_CMDS="Y: qY:workdir:Y"
> +require ../../recipes-ti/includes/ti-eula-unpack.inc
> +
> +SGXPV = "4_06_00_02"
> +IMGPV = "1.7.867897"
> +BINFILE := "Graphics_SDK_setuplinux_${SGXPV}.bin"
> +
> +inherit module
> +
> +MACHINE_KERNEL_PR_append = "a"
> +PR = "${MACHINE_KERNEL_PR}"
> +
> +# Not making this the default version to match a similar setting # in 
> +the matching libgles-omap3_4.06.00.02 recipe.
> +DEFAULT_PREFERENCE = "-1"
> +
> +SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/${SGXPV}/exports/${BINFILE}"
> +SRC_URI[md5sum] = "62f0c378e38f8d14e9f184c3836aea21"
> +SRC_URI[sha256sum] = "71c8e154484304b3ce32d565557720a96c7ba762e72d7f1e93deeef9f3274402"
> +TI_BIN_UNPK_WDEXT="/Graphics_SDK_${SGXPV}"
> +S = "${WORKDIR}${TI_BIN_UNPK_WDEXT}/GFX_Linux_KM"
> +
> +PVRBUILD = "release"
> +export KERNELDIR = "${STAGING_KERNEL_DIR}"
> +
> +INHIBIT_PACKAGE_STRIP = "1"
> +
> +TI_PLATFORM_omap3 = "omap3630"
> +TI_PLATFORM_ti814x = "ti81xx"
> +TI_PLATFORM_ti816x = "ti81xx"
> +TI_PLATFORM_ti33x = "ti335x"
> +
> +MODULESLOCATION_omap3 = "dc_omapfb3_linux"
> +MODULESLOCATION_ti814x = "dc_ti81xx_linux"
> +MODULESLOCATION_ti816x = "dc_ti81xx_linux"
> +MODULESLOCATION_ti33x = "dc_ti335x_linux"
> +
> +MAKE_TARGETS = " BUILD=${PVRBUILD} TI_PLATFORM=${TI_PLATFORM}"
> +
> +do_install() {
> +    mkdir -p ${D}/lib/modules/${KERNEL_VERSION}/kernel/drivers/gpu/pvr
> +    cp  ${S}/pvrsrvkm.ko \
> +        ${S}/services4/3rdparty/${MODULESLOCATION}/omaplfb.ko  \
> +        ${S}/services4/3rdparty/bufferclass_ti/bufferclass_ti.ko \
> +        ${D}/lib/modules/${KERNEL_VERSION}/kernel/drivers/gpu/pvr
> +}
> --
> 1.7.0.4
> 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

