Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CCCED3B9B6
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 23:54:08 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2120.1765324447661714191
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 09 Dec 2025 15:54:07 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 1B2CE40C50;
	Tue,  9 Dec 2025 23:54:07 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XBbhdG604ata; Tue,  9 Dec 2025 23:54:07 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id DC0EA406B5;
	Tue,  9 Dec 2025 23:54:04 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 9DEFB175F1B; Tue,  9 Dec 2025 18:54:04 -0500 (EST)
Date: Tue, 9 Dec 2025 18:54:04 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: afd@ti.com
Cc: Ryan Eatmon <reatmon@ti.com>, meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master][PATCH 2/2] meta-ti/all: Merge omap-a15.inc
 into am57xx.inc
Message-ID: <20251209235404.GQ11121@denix.org>
References: <20251203203211.1113327-1-afd@ti.com>
 <20251203203211.1113327-2-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251203203211.1113327-2-afd@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 09 Dec 2025 23:54:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19345

On Wed, Dec 03, 2025 at 02:32:11PM -0600, Andrew Davis via lists.yoctoproject.org wrote:
> As am57xx.inc is now the only user of omap-a15.inc, merge the content of
> omap-a15.inc into am57xx.inc and remove omap-a15.inc. As we no longer have
> this common include, also remove "omap-a15" and use "am57xx" in its place.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>

Reviewed-by: Denys Dmytriyenko <denys@konsulko.com>


> ---
>  meta-ti-bsp/conf/machine/include/am57xx.inc   | 50 +++++++++++++++++--
>  meta-ti-bsp/conf/machine/include/omap-a15.inc | 50 -------------------
>  .../ti-sgx-ddk-km_1.17.4948957.bb             |  4 +-
>  .../libgal/ti-gc320-libs_5.0.11.p7.bb         |  2 +-
>  .../ti-sgx-ddk-um_1.17.4948957.bb             |  4 +-
>  .../dsptop/debugss-module-drv_git.bb          |  2 +-
>  .../recipes-bsp/dsptop/dsptop_git.bb          |  2 +-
>  .../recipes-bsp/dsptop/libulm_git.bb          |  2 +-
>  .../recipes-bsp/pru/pru-icss_git.bb           |  8 +--
>  .../recipes-devtools/gdbc6x/gdbc6x_git.bb     |  2 +-
>  .../gdbc6x/gdbserver-c6x_git.bb               |  2 +-
>  .../gdbc6x/gdbserverproxy-module-drv_git.bb   |  2 +-
>  .../recipes-ti/imglib/imglib-c66x.inc         |  2 +-
>  meta-ti-extras/recipes-ti/ipc/ti-ipc-rtos.inc |  8 +--
>  .../recipes-ti/ipc/ti-ipc-rtos_git.bb         | 10 ++--
>  meta-ti-extras/recipes-ti/vlib/vlib-c66x.inc  |  2 +-
>  16 files changed, 73 insertions(+), 79 deletions(-)
>  delete mode 100644 meta-ti-bsp/conf/machine/include/omap-a15.inc
> 
> diff --git a/meta-ti-bsp/conf/machine/include/am57xx.inc b/meta-ti-bsp/conf/machine/include/am57xx.inc
> index c7c8029f..6acc0cb0 100644
> --- a/meta-ti-bsp/conf/machine/include/am57xx.inc
> +++ b/meta-ti-bsp/conf/machine/include/am57xx.inc
> @@ -1,6 +1,50 @@
> -require conf/machine/include/omap-a15.inc
> +require conf/machine/include/ti-soc.inc
>  SOC_FAMILY:append = ":am57xx"
>  
> -MACHINE_FEATURES += "pci"
> +DEFAULTTUNE ?= "armv7athf-neon"
> +require conf/machine/include/arm/armv7a/tune-cortexa15.inc
>  
> -MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "prueth-fw prusw-fw pruhsr-fw pruprp-fw"
> +require conf/machine/include/ti-bsp.inc
> +
> +# Graphics providers and variables
> +require conf/machine/include/mesa-pvr.inc
> +PREFERRED_PROVIDER_virtual/gpudriver ?= "${BSP_SGX_DRIVER_PROVIDER}"
> +
> +KERNEL_IMAGETYPE = "zImage"
> +KERNEL_IMAGETYPES = "zImage uImage"
> +KERNEL_CLASSES += "kernel-uimage"
> +
> +UBOOT_ARCH = "arm"
> +UBOOT_ENTRYPOINT = "0x80008000"
> +UBOOT_LOADADDRESS = "0x80008000"
> +
> +# Generate an extlinux.conf file
> +UBOOT_EXTLINUX = "1"
> +UBOOT_EXTLINUX_ROOT = "root=PARTUUID=${uuid}"
> +UBOOT_EXTLINUX_BOOT_FILES = " \
> +    extlinux.conf;extlinux/extlinux.conf \
> +    ${KERNEL_IMAGETYPE} \
> +    ${DEVICETREE_FILES} \
> +"
> +
> +SPL_BINARY = "MLO"
> +UBOOT_SUFFIX = "img"
> +
> +EXTRA_IMAGEDEPENDS += "virtual/bootloader"
> +
> +MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "kernel-image-zimage"
> +
> +MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "vpdma-fw goodix-fw prueth-fw prusw-fw pruhsr-fw pruprp-fw"
> +
> +# Use the expected value of the ubifs filesystem's volume name in the kernel
> +# and u-boot.
> +UBI_VOLNAME = "rootfs"
> +
> +# List common SoC features, may need to add touchscreen for specific machines
> +MACHINE_FEATURES = "apm usbgadget usbhost vfat ext2 screen alsa mmip dsp gc320 pci"
> +
> +IMAGE_FSTYPES += "tar.xz wic.xz wic.bmap"
> +WKS_FILE ?= "sdimage-2part.wks"
> +IMAGE_BOOT_FILES ?= "${SPL_BINARY} u-boot.${UBOOT_SUFFIX} ${UBOOT_EXTLINUX_BOOT_FILES} ipc/dra7-ipu1-fw.xem4;dra7-ipu1-fw.xem4"
> +do_image_wic[depends] += "virtual/bootloader:do_deploy"
> +do_image_wic[depends] += "ti-rtos-messageq-test-fw:do_deploy"
> diff --git a/meta-ti-bsp/conf/machine/include/omap-a15.inc b/meta-ti-bsp/conf/machine/include/omap-a15.inc
> deleted file mode 100644
> index 8e029431..00000000
> --- a/meta-ti-bsp/conf/machine/include/omap-a15.inc
> +++ /dev/null
> @@ -1,50 +0,0 @@
> -require conf/machine/include/ti-soc.inc
> -SOC_FAMILY:append = ":omap-a15"
> -
> -DEFAULTTUNE ?= "armv7athf-neon"
> -require conf/machine/include/arm/armv7a/tune-cortexa15.inc
> -
> -require conf/machine/include/ti-bsp.inc
> -
> -# Graphics providers and variables
> -require conf/machine/include/mesa-pvr.inc
> -PREFERRED_PROVIDER_virtual/gpudriver ?= "${BSP_SGX_DRIVER_PROVIDER}"
> -
> -KERNEL_IMAGETYPE = "zImage"
> -KERNEL_IMAGETYPES = "zImage uImage"
> -KERNEL_CLASSES += "kernel-uimage"
> -
> -UBOOT_ARCH = "arm"
> -UBOOT_ENTRYPOINT = "0x80008000"
> -UBOOT_LOADADDRESS = "0x80008000"
> -
> -# Generate an extlinux.conf file
> -UBOOT_EXTLINUX = "1"
> -UBOOT_EXTLINUX_ROOT = "root=PARTUUID=${uuid}"
> -UBOOT_EXTLINUX_BOOT_FILES = " \
> -    extlinux.conf;extlinux/extlinux.conf \
> -    ${KERNEL_IMAGETYPE} \
> -    ${DEVICETREE_FILES} \
> -"
> -
> -SPL_BINARY = "MLO"
> -UBOOT_SUFFIX = "img"
> -
> -EXTRA_IMAGEDEPENDS += "virtual/bootloader"
> -
> -MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "kernel-image-zimage"
> -
> -MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "vpdma-fw goodix-fw"
> -
> -# Use the expected value of the ubifs filesystem's volume name in the kernel
> -# and u-boot.
> -UBI_VOLNAME = "rootfs"
> -
> -# List common SoC features, may need to add touchscreen for specific machines
> -MACHINE_FEATURES = "apm usbgadget usbhost vfat ext2 screen alsa mmip dsp gc320"
> -
> -IMAGE_FSTYPES += "tar.xz wic.xz wic.bmap"
> -WKS_FILE ?= "sdimage-2part.wks"
> -IMAGE_BOOT_FILES ?= "${SPL_BINARY} u-boot.${UBOOT_SUFFIX} ${UBOOT_EXTLINUX_BOOT_FILES} ipc/dra7-ipu1-fw.xem4;dra7-ipu1-fw.xem4"
> -do_image_wic[depends] += "virtual/bootloader:do_deploy"
> -do_image_wic[depends] += "ti-rtos-messageq-test-fw:do_deploy"
> diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
> index f5cea270..343f09de 100644
> --- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
> +++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
> @@ -7,7 +7,7 @@ inherit module
>  
>  PROVIDES = "virtual/gpudriver"
>  
> -COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|am65xx"
> +COMPATIBLE_MACHINE = "ti33x|ti43x|am57xx|am65xx"
>  
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
> @@ -19,9 +19,9 @@ SRC_URI = "git://git.ti.com/git/graphics/omap5-sgx-ddk-linux.git;protocol=https;
>  
>  SRCREV = "9ae0fa4998b1c624408945e062bf8fb0ea7efb9d"
>  
> -TARGET_PRODUCT:omap-a15 = "ti572x_linux"
>  TARGET_PRODUCT:ti33x = "ti335x_linux"
>  TARGET_PRODUCT:ti43x = "ti437x_linux"
> +TARGET_PRODUCT:am57xx = "ti572x_linux"
>  TARGET_PRODUCT:am65xx = "ti654x_linux"
>  PVR_BUILD = "release"
>  PVR_WS = "lws-generic"
> diff --git a/meta-ti-bsp/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb b/meta-ti-bsp/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb
> index bd7cf015..86aa71b8 100644
> --- a/meta-ti-bsp/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb
> +++ b/meta-ti-bsp/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb
> @@ -7,7 +7,7 @@ inherit features_check
>  
>  REQUIRED_MACHINE_FEATURES = "gc320"
>  
> -COMPATIBLE_MACHINE = "omap-a15"
> +COMPATIBLE_MACHINE = "am57xx"
>  
>  CLEANBROKEN = "1"
>  
> diff --git a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-sgx-ddk-um_1.17.4948957.bb b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-sgx-ddk-um_1.17.4948957.bb
> index af27981f..c4cc5f10 100644
> --- a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-sgx-ddk-um_1.17.4948957.bb
> +++ b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-sgx-ddk-um_1.17.4948957.bb
> @@ -4,7 +4,7 @@ LICENSE = "TI-TSPA"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=7232b98c1c58f99e3baa03de5207e76f"
>  
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
> -COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|am65xx"
> +COMPATIBLE_MACHINE = "ti33x|ti43x|am57xx|am65xx"
>  
>  PR = "r38"
>  
> @@ -37,7 +37,7 @@ inherit ${@pick_init(d)}
>  
>  TARGET_PRODUCT:ti33x = "ti335x_linux"
>  TARGET_PRODUCT:ti43x = "ti437x_linux"
> -TARGET_PRODUCT:omap-a15 = "ti572x_linux"
> +TARGET_PRODUCT:am57xx = "ti572x_linux"
>  TARGET_PRODUCT:am65xx = "ti654x_linux"
>  
>  RDEPENDS:${PN} += "libdrm ti-sgx-ddk-km"
> diff --git a/meta-ti-extras/recipes-bsp/dsptop/debugss-module-drv_git.bb b/meta-ti-extras/recipes-bsp/dsptop/debugss-module-drv_git.bb
> index fdb16ec4..e80591b2 100644
> --- a/meta-ti-extras/recipes-bsp/dsptop/debugss-module-drv_git.bb
> +++ b/meta-ti-extras/recipes-bsp/dsptop/debugss-module-drv_git.bb
> @@ -8,7 +8,7 @@ S:append = "/debugss_module/debugss-mod"
>  
>  inherit module
>  
> -COMPATIBLE_MACHINE = "omap-a15"
> +COMPATIBLE_MACHINE = "am57xx"
>  
>  EXTRA_OEMAKE = "PLATFORM=DRA7xx_PLATFORM KVERSION=${KERNEL_VERSION} KERNEL_SRC=${STAGING_KERNEL_DIR}"
>  
> diff --git a/meta-ti-extras/recipes-bsp/dsptop/dsptop_git.bb b/meta-ti-extras/recipes-bsp/dsptop/dsptop_git.bb
> index c1080468..c5242d5e 100644
> --- a/meta-ti-extras/recipes-bsp/dsptop/dsptop_git.bb
> +++ b/meta-ti-extras/recipes-bsp/dsptop/dsptop_git.bb
> @@ -8,7 +8,7 @@ PR = "${INC_PR}.2"
>  
>  S:append = "/dsptop"
>  
> -COMPATIBLE_MACHINE = "omap-a15"
> +COMPATIBLE_MACHINE = "am57xx"
>  
>  EXTRA_OEMAKE = "release DEVICE=DRA7xx CROSS_COMPILE=${TARGET_PREFIX} CC="${CC}""
>  
> diff --git a/meta-ti-extras/recipes-bsp/dsptop/libulm_git.bb b/meta-ti-extras/recipes-bsp/dsptop/libulm_git.bb
> index 1bcaa0ea..638973c4 100644
> --- a/meta-ti-extras/recipes-bsp/dsptop/libulm_git.bb
> +++ b/meta-ti-extras/recipes-bsp/dsptop/libulm_git.bb
> @@ -11,7 +11,7 @@ PR = "${INC_PR}.0"
>  
>  S:append = "/dsptop/ulm"
>  
> -COMPATIBLE_MACHINE = "omap-a15"
> +COMPATIBLE_MACHINE = "am57xx"
>  
>  EXTRA_OEMAKE = "release DEVICE=DRA7xx CROSS_COMPILE=${TARGET_PREFIX}"
>  
> diff --git a/meta-ti-extras/recipes-bsp/pru/pru-icss_git.bb b/meta-ti-extras/recipes-bsp/pru/pru-icss_git.bb
> index 84d00eed..b7066583 100644
> --- a/meta-ti-extras/recipes-bsp/pru/pru-icss_git.bb
> +++ b/meta-ti-extras/recipes-bsp/pru/pru-icss_git.bb
> @@ -14,7 +14,7 @@ PV = "6.5.0"
>  
>  require recipes-ti/includes/ti-paths.inc
>  
> -COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|am62xx|am64xx|am65xx|j721e"
> +COMPATIBLE_MACHINE = "ti33x|ti43x|am57xx|am62xx|am64xx|am65xx|j721e"
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
>  PACKAGES:prepend = " \
> @@ -36,7 +36,7 @@ SUBDIRS = "examples pru_cape/pru_fw lib/src labs"
>  
>  PLATFORM:ti33x = "am335x"
>  PLATFORM:ti43x = "am437x"
> -PLATFORM:omap-a15 = "am572x"
> +PLATFORM:am57xx = "am572x"
>  PLATFORM:am62xx = "am62x"
>  PLATFORM:am64xx = "am64x"
>  PLATFORM:am65xx = "am65x"
> @@ -84,7 +84,7 @@ do_install:append:ti43x() {
>      done
>  }
>  
> -do_install:append:omap-a15() {
> +do_install:append:am57xx() {
>      install -m 644 ${S}/examples/${PLATFORM}/PRU_Halt/gen/PRU_Halt.out \
>                     ${D}${nonarch_base_libdir}/firmware/pru
>      for i in 1 2
> @@ -182,7 +182,7 @@ FILES:${PN}-rpmsg-echo = "${nonarch_base_libdir}/firmware/pru/PRU_RPMsg_Echo_Int
>  # Set up names for the firmwares
>  PRU_ICSS_ALTERNATIVES:ti33x    = "am335x-pru0-fw am335x-pru1-fw"
>  PRU_ICSS_ALTERNATIVES:ti43x    = "am437x-pru0_0-fw am437x-pru0_1-fw am437x-pru1_0-fw am437x-pru1_1-fw"
> -PRU_ICSS_ALTERNATIVES:omap-a15 = "am57xx-pru1_0-fw am57xx-pru1_1-fw am57xx-pru2_0-fw am57xx-pru2_1-fw"
> +PRU_ICSS_ALTERNATIVES:am57xx   = "am57xx-pru1_0-fw am57xx-pru1_1-fw am57xx-pru2_0-fw am57xx-pru2_1-fw"
>  PRU_ICSS_ALTERNATIVES:am62xx   = "am62x-pru0-fw am62x-pru1-fw"
>  PRU_ICSS_ALTERNATIVES:am64xx   = "am64x-pru0_0-fw am64x-pru0_1-fw am64x-pru1_0-fw am64x-pru1_1-fw am64x-rtu0_0-fw am64x-rtu0_1-fw am64x-rtu1_0-fw am64x-rtu1_1-fw"
>  PRU_ICSS_ALTERNATIVES:am65xx   = "am65x-pru0_0-fw am65x-pru0_1-fw am65x-pru1_0-fw am65x-pru1_1-fw am65x-pru2_0-fw am65x-pru2_1-fw am65x-rtu0_0-fw am65x-rtu0_1-fw am65x-rtu1_0-fw am65x-rtu1_1-fw am65x-rtu2_0-fw am65x-rtu2_1-fw"
> diff --git a/meta-ti-extras/recipes-devtools/gdbc6x/gdbc6x_git.bb b/meta-ti-extras/recipes-devtools/gdbc6x/gdbc6x_git.bb
> index 3e6dfbff..521d06fe 100644
> --- a/meta-ti-extras/recipes-devtools/gdbc6x/gdbc6x_git.bb
> +++ b/meta-ti-extras/recipes-devtools/gdbc6x/gdbc6x_git.bb
> @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://debian/copyright;md5=bf0fe2872eb3dfeebb2cbe38206fe81f
>  
>  DEPENDS = "ncurses bison-native texinfo flex-native gettext"
>  
> -COMPATIBLE_MACHINE = "omap-a15"
> +COMPATIBLE_MACHINE = "am57xx"
>  
>  PR = "${INC_PR}.1"
>  
> diff --git a/meta-ti-extras/recipes-devtools/gdbc6x/gdbserver-c6x_git.bb b/meta-ti-extras/recipes-devtools/gdbc6x/gdbserver-c6x_git.bb
> index a2d8da75..bcb9624f 100644
> --- a/meta-ti-extras/recipes-devtools/gdbc6x/gdbserver-c6x_git.bb
> +++ b/meta-ti-extras/recipes-devtools/gdbc6x/gdbserver-c6x_git.bb
> @@ -8,7 +8,7 @@ PR = "${INC_PR}.0"
>  
>  S:append = "/gdbserver-c6x/src"
>  
> -COMPATIBLE_MACHINE = "omap-a15"
> +COMPATIBLE_MACHINE = "am57xx"
>  
>  EXTRA_OEMAKE = "PLATFORM=DRA7xx_PLATFORM"
>  
> diff --git a/meta-ti-extras/recipes-devtools/gdbc6x/gdbserverproxy-module-drv_git.bb b/meta-ti-extras/recipes-devtools/gdbc6x/gdbserverproxy-module-drv_git.bb
> index 1e4fd6c5..799ba019 100644
> --- a/meta-ti-extras/recipes-devtools/gdbc6x/gdbserverproxy-module-drv_git.bb
> +++ b/meta-ti-extras/recipes-devtools/gdbc6x/gdbserverproxy-module-drv_git.bb
> @@ -13,7 +13,7 @@ S:append = "/kernel_module/gdbproxy-mod"
>  
>  inherit module
>  
> -COMPATIBLE_MACHINE = "omap-a15"
> +COMPATIBLE_MACHINE = "am57xx"
>  
>  EXTRA_OEMAKE = "PLATFORM=DRA7xx_PLATFORM KVERSION=${KERNEL_VERSION} KERNEL_SRC=${STAGING_KERNEL_DIR}"
>  
> diff --git a/meta-ti-extras/recipes-ti/imglib/imglib-c66x.inc b/meta-ti-extras/recipes-ti/imglib/imglib-c66x.inc
> index 8fa2ceca..3c5efeb1 100644
> --- a/meta-ti-extras/recipes-ti/imglib/imglib-c66x.inc
> +++ b/meta-ti-extras/recipes-ti/imglib/imglib-c66x.inc
> @@ -8,7 +8,7 @@ require ../includes/ti-paths.inc
>  require ../includes/ti-staging.inc
>  require ../includes/ti-unpack.inc
>  
> -COMPATIBLE_MACHINE = "omap-a15"
> +COMPATIBLE_MACHINE = "am57xx"
>  
>  SRC_URI = "http://software-dl.ti.com/sdoemb/sdoemb_public_sw/imglib/${PV}/exports/${BINFILE};name=imglib"
>  
> diff --git a/meta-ti-extras/recipes-ti/ipc/ti-ipc-rtos.inc b/meta-ti-extras/recipes-ti/ipc/ti-ipc-rtos.inc
> index 2f93db72..0b2ef9f5 100644
> --- a/meta-ti-extras/recipes-ti/ipc/ti-ipc-rtos.inc
> +++ b/meta-ti-extras/recipes-ti/ipc/ti-ipc-rtos.inc
> @@ -41,16 +41,16 @@ RELEASE_SUFFIX = ""
>  
>  PR = "${INC_PR}.r0"
>  
> -DEPENDS:append:omap-a15 = " ti-cgt6x-native \
> -                            ti-cgt-arm-native \
> -                            gcc-arm-baremetal-native \
> +DEPENDS:append:am57xx = " ti-cgt6x-native \
> +                          ti-cgt-arm-native \
> +                          gcc-arm-baremetal-native \
>  "
>  DEPENDS:append:omapl138 = " ti-cgt6x-native \
>  "
>  
>  IPC_TARGETS = ""
>  
> -IPC_TARGETS:omap-a15 = "\
> +IPC_TARGETS:am57xx = "\
>      gnu.targets.arm.A15F="${GCC_ARM_NONE_TOOLCHAIN}" \
>      ti.targets.elf.C66="${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x" \
>      ti.targets.elf.C66_big_endian="${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x" \
> diff --git a/meta-ti-extras/recipes-ti/ipc/ti-ipc-rtos_git.bb b/meta-ti-extras/recipes-ti/ipc/ti-ipc-rtos_git.bb
> index d2ac6276..2162a1ac 100644
> --- a/meta-ti-extras/recipes-ti/ipc/ti-ipc-rtos_git.bb
> +++ b/meta-ti-extras/recipes-ti/ipc/ti-ipc-rtos_git.bb
> @@ -81,11 +81,11 @@ KFPLAT = ""
>  ALTERNATIVE_PRIORITY = "5"
>  
>  ALTERNATIVE:${PN}-fw:omapl138 = "rproc-dsp-fw"
> -ALTERNATIVE:${PN}-fw:omap-a15 = "dra7-dsp1-fw.xe66 \
> -                                 dra7-dsp2-fw.xe66 \
> -                                 dra7-ipu1-fw.xem4 \
> -                                 dra7-ipu2-fw.xem4 \
> -                                "
> +ALTERNATIVE:${PN}-fw:am57xx = "dra7-dsp1-fw.xe66 \
> +                               dra7-dsp2-fw.xe66 \
> +                               dra7-ipu1-fw.xem4 \
> +                               dra7-ipu2-fw.xem4 \
> +                              "
>  
>  ALTERNATIVE_LINK_NAME[rproc-dsp-fw] = "${nonarch_base_libdir}/firmware/rproc-dsp-fw"
>  ALTERNATIVE_LINK_NAME[dra7-dsp1-fw.xe66] = "${nonarch_base_libdir}/firmware/dra7-dsp1-fw.xe66"
> diff --git a/meta-ti-extras/recipes-ti/vlib/vlib-c66x.inc b/meta-ti-extras/recipes-ti/vlib/vlib-c66x.inc
> index 94c5d33b..c7c14f91 100644
> --- a/meta-ti-extras/recipes-ti/vlib/vlib-c66x.inc
> +++ b/meta-ti-extras/recipes-ti/vlib/vlib-c66x.inc
> @@ -7,7 +7,7 @@ require ../includes/ti-paths.inc
>  require ../includes/ti-staging.inc
>  require ../includes/ti-eula-unpack.inc
>  
> -COMPATIBLE_MACHINE = "omap-a15"
> +COMPATIBLE_MACHINE = "am57xx"
>  
>  SRC_URI = "http://software-dl.ti.com/libs/vlib/${PV}//exports/vlib_c66x_obj_${PV}_Linux.bin;name=vlibbin"
>  
> -- 
> 2.39.2

