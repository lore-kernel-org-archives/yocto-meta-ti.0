Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CFC2C433EF
	for <webhook@archiver.kernel.org>; Fri, 29 Apr 2022 20:01:01 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.14873.1651262451206420030
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 29 Apr 2022 13:00:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E74E440C46;
	Fri, 29 Apr 2022 20:00:49 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SmQYYMBAml9s; Fri, 29 Apr 2022 20:00:49 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B5DEF40A77;
	Fri, 29 Apr 2022 20:00:46 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id E6832174913; Fri, 29 Apr 2022 16:00:45 -0400 (EDT)
Date: Fri, 29 Apr 2022 16:00:45 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: afd@ti.com
Cc: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master][PATCH] Rename machine from omap-a15 to am57xx
Message-ID: <20220429200045.GR9834@denix.org>
References: <20220428143410.17002-1-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220428143410.17002-1-afd@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 29 Apr 2022 20:01:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14636

Andrew,

In the subject - omap-a15 is not a machine, but an SoC family, at least from 
OE perspective.


On Thu, Apr 28, 2022 at 09:34:10AM -0500, Andrew Davis via lists.yoctoproject.org wrote:
> The "omap-a15" is a bit of a legacy holdover and is confusing.
> This causes issues with mixed usage of 'dra7xx' and 'omap-a15'.
> For example all EVM using this SoC family include dra7x.inc
> so both are always defined, then we use 'omap-a15' in several
> places where we really mean 'am57xx'. 'dra7xx' can't be filtered
> for as needed like in the case of PRU.
> 
> AM57x is arguably the real superset device. Lets use that name
> then start filtering correctly out the DRA7x to only be used
> when we actually mean DRA7x.

There were machines in omap-a15 family that were not in dra7xx family, but 
those got deprecated from meta-ti by now. E.g. OMAP5 uEVM, which is still 
supported in the kernel:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm/boot/dts/omap5-uevm.dts

Since original AM57xx and DRA7xx use pretty much the same SoC (but EVMs are 
different), there never was a need for separate SoC families for them.

So, omap-a15 was a superset of dra7xx. The only remaining difference between 
them that's left, is omap-a15 doesn't have "pci" enabled. So, if you are 
renaming it into am57xx, that means that all derived AM57xx machines won't 
have it enabled either...


> This patch makes no functional change.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
>  .../conf/machine/include/{omap-a15.inc => am57xx.inc}     | 2 +-
>  meta-ti-bsp/conf/machine/include/dra7xx.inc               | 2 +-
>  .../powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb         | 4 ++--
>  .../recipes-bsp/uio-module-drv/uio-module-drv-test_git.bb | 6 +++---
>  .../recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb    | 2 +-
>  .../libgles/ti-sgx-ddk-um_1.17.4948957.bb                 | 4 ++--
>  meta-ti-extras/recipes-bsp/pru/pru-icss_git.bb            | 8 ++++----
>  meta-ti-extras/recipes-ti/imglib/imglib-c66x.inc          | 2 +-
>  meta-ti-extras/recipes-ti/ipc/ti-ipc-rtos.inc             | 8 ++++----
>  meta-ti-extras/recipes-ti/ipc/ti-ipc-rtos_git.bb          | 4 ++--
>  meta-ti-extras/recipes-ti/openmp-rtos/openmp-rtos_git.bb  | 6 +++---
>  .../recipes-ti/uio-test-pruss/uio-test-pruss_git.bb       | 4 ++--
>  meta-ti-extras/recipes-ti/vlib/vlib-c66x.inc              | 2 +-
>  13 files changed, 27 insertions(+), 27 deletions(-)
>  rename meta-ti-bsp/conf/machine/include/{omap-a15.inc => am57xx.inc} (98%)
> 
> diff --git a/meta-ti-bsp/conf/machine/include/omap-a15.inc b/meta-ti-bsp/conf/machine/include/am57xx.inc
> similarity index 98%
> rename from meta-ti-bsp/conf/machine/include/omap-a15.inc
> rename to meta-ti-bsp/conf/machine/include/am57xx.inc
> index 9a2e0044..5e2b398f 100644
> --- a/meta-ti-bsp/conf/machine/include/omap-a15.inc
> +++ b/meta-ti-bsp/conf/machine/include/am57xx.inc
> @@ -1,5 +1,5 @@
>  require conf/machine/include/ti-soc.inc
> -SOC_FAMILY:append = ":omap-a15"
> +SOC_FAMILY:append = ":am57xx"
>  
>  DEFAULTTUNE ?= "armv7athf-neon"
>  require conf/machine/include/arm/armv7a/tune-cortexa15.inc
> diff --git a/meta-ti-bsp/conf/machine/include/dra7xx.inc b/meta-ti-bsp/conf/machine/include/dra7xx.inc
> index a02421d9..29d2d6a1 100644
> --- a/meta-ti-bsp/conf/machine/include/dra7xx.inc
> +++ b/meta-ti-bsp/conf/machine/include/dra7xx.inc
> @@ -1,4 +1,4 @@
> -require conf/machine/include/omap-a15.inc
> +require conf/machine/include/am57xx.inc
>  SOC_FAMILY:append = ":dra7xx"
>  
>  MACHINE_FEATURES += "pci"
> diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
> index 2ec2ffef..e2543ca9 100644
> --- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
> +++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
> @@ -7,7 +7,7 @@ inherit module features_check
>  
>  REQUIRED_MACHINE_FEATURES = "gpu"
>  
> -COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|k3"
> +COMPATIBLE_MACHINE = "ti33x|ti43x|am57xx|k3"
>  
>  MACHINE_KERNEL_PR:append = "x"
>  PR = "${MACHINE_KERNEL_PR}"
> @@ -26,7 +26,7 @@ S = "${WORKDIR}/git"
>  
>  SRCREV = "eda7780bfd5277e16913c9bc0b0e6892b4e79063"
>  
> -TARGET_PRODUCT:omap-a15 = "jacinto6evm"
> +TARGET_PRODUCT:am57xx = "jacinto6evm"
>  TARGET_PRODUCT:ti33x = "ti335x"
>  TARGET_PRODUCT:ti43x = "ti437x"
>  TARGET_PRODUCT:k3 = "ti654x"
> diff --git a/meta-ti-bsp/recipes-bsp/uio-module-drv/uio-module-drv-test_git.bb b/meta-ti-bsp/recipes-bsp/uio-module-drv/uio-module-drv-test_git.bb
> index dc17a1e9..23f09893 100644
> --- a/meta-ti-bsp/recipes-bsp/uio-module-drv/uio-module-drv-test_git.bb
> +++ b/meta-ti-bsp/recipes-bsp/uio-module-drv/uio-module-drv-test_git.bb
> @@ -4,10 +4,10 @@ include uio-module-drv.inc
>  
>  PR = "r1"
>  
> -COMPATIBLE_MACHINE = "omap-a15|ti33x|ti43x"
> +COMPATIBLE_MACHINE = "am57xx|ti33x|ti43x"
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
> -DEVICE_NAME:omap-a15 = "am57xx"
> +DEVICE_NAME:am57xx = "am57xx"
>  DEVICE_NAME:ti33x = "am33xx"
>  DEVICE_NAME:ti43x = "am43xx"
>  RDEPENDS:${PN} = "uio-module-drv"
> @@ -22,7 +22,7 @@ do_install() {
>  	install -c -m 755 ${S}/test/uio_int_test ${D}${bindir}/.
>  }
>  
> -do_install:append:omap-a15 () {
> +do_install:append:am57xx () {
>  	install -c -m 755 ${S}/test/prussdrv_test/test/pruss_uio_test ${D}${bindir}/.
>  }
>  
> diff --git a/meta-ti-bsp/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb b/meta-ti-bsp/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb
> index ab72c109..9b483109 100644
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
> diff --git a/meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb b/meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
> index f4c71d25..eb8b478c 100644
> --- a/meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
> +++ b/meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
> @@ -8,7 +8,7 @@ inherit features_check
>  REQUIRED_MACHINE_FEATURES = "gpu"
>  
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
> -COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|am65xx"
> +COMPATIBLE_MACHINE = "ti33x|ti43x|am57xx|am65xx"
>  
>  PR = "r37"
>  
> @@ -17,7 +17,7 @@ BRANCH = "ti-img-sgx/dunfell/${PV}"
>  SRC_URI = "git://git.ti.com/graphics/omap5-sgx-ddk-um-linux.git;protocol=git;branch=${BRANCH}"
>  SRCREV = "742cf38aba13e1ba1a910cf1f036a1a212c263b6"
>  
> -TARGET_PRODUCT:omap-a15 = "jacinto6evm"
> +TARGET_PRODUCT:am57xx = "jacinto6evm"
>  TARGET_PRODUCT:ti33x = "ti335x"
>  TARGET_PRODUCT:ti43x = "ti437x"
>  TARGET_PRODUCT:am65xx = "ti654x"
> diff --git a/meta-ti-extras/recipes-bsp/pru/pru-icss_git.bb b/meta-ti-extras/recipes-bsp/pru/pru-icss_git.bb
> index 130fd3d5..4966b4c9 100644
> --- a/meta-ti-extras/recipes-bsp/pru/pru-icss_git.bb
> +++ b/meta-ti-extras/recipes-bsp/pru/pru-icss_git.bb
> @@ -15,7 +15,7 @@ PR = "r0"
>  
>  require recipes-ti/includes/ti-paths.inc
>  
> -COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|k3"
> +COMPATIBLE_MACHINE = "ti33x|ti43x|am57xx|k3"
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
>  PACKAGES:prepend = " \
> @@ -39,7 +39,7 @@ SUBDIRS = "examples pru_cape/pru_fw lib/src labs"
>  
>  PLATFORM:ti33x = "am335x"
>  PLATFORM:ti43x = "am437x"
> -PLATFORM:omap-a15 = "am572x"
> +PLATFORM:am57xx = "am572x"
>  PLATFORM:am64xx = "am64x"
>  PLATFORM:am65xx = "am65x"
>  PLATFORM:j7 = "j721e"
> @@ -86,7 +86,7 @@ do_install:append:ti43x() {
>      done
>  }
>  
> -do_install:append:omap-a15() {
> +do_install:append:am57xx() {
>      install -m 644 ${S}/examples/${PLATFORM}/PRU_Halt/gen/PRU_Halt.out \
>                     ${D}${nonarch_base_libdir}/firmware/pru
>      for i in 1 2
> @@ -174,7 +174,7 @@ FILES:${PN}-rpmsg-echo = "${nonarch_base_libdir}/firmware/pru/PRU_RPMsg_Echo_Int
>  # Set up names for the firmwares
>  PRU_ICSS_ALTERNATIVES:ti33x    = "am335x-pru0-fw am335x-pru1-fw"
>  PRU_ICSS_ALTERNATIVES:ti43x    = "am437x-pru0_0-fw am437x-pru0_1-fw am437x-pru1_0-fw am437x-pru1_1-fw"
> -PRU_ICSS_ALTERNATIVES:omap-a15 = "am57xx-pru1_0-fw am57xx-pru1_1-fw am57xx-pru2_0-fw am57xx-pru2_1-fw"
> +PRU_ICSS_ALTERNATIVES:am57xx   = "am57xx-pru1_0-fw am57xx-pru1_1-fw am57xx-pru2_0-fw am57xx-pru2_1-fw"
>  PRU_ICSS_ALTERNATIVES:am64xx   = "am64x-pru0_0-fw am64x-pru0_1-fw am64x-pru1_0-fw am64x-pru1_1-fw am64x-rtu0_0-fw am64x-rtu0_1-fw am64x-rtu1_0-fw am64x-rtu1_1-fw"
>  PRU_ICSS_ALTERNATIVES:am65xx   = "am65x-pru0_0-fw am65x-pru0_1-fw am65x-pru1_0-fw am65x-pru1_1-fw am65x-pru2_0-fw am65x-pru2_1-fw am65x-rtu0_0-fw am65x-rtu0_1-fw am65x-rtu1_0-fw am65x-rtu1_1-fw am65x-rtu2_0-fw am65x-rtu2_1-fw"
>  PRU_ICSS_ALTERNATIVES:j7       = "j7-pru0_0-fw j7-pru0_1-fw j7-pru1_0-fw j7-pru1_1-fw j7-rtu0_0-fw j7-rtu0_1-fw j7-rtu1_0-fw j7-rtu1_1-fw"
> diff --git a/meta-ti-extras/recipes-ti/imglib/imglib-c66x.inc b/meta-ti-extras/recipes-ti/imglib/imglib-c66x.inc
> index ab5cbdb6..2a89b19d 100644
> --- a/meta-ti-extras/recipes-ti/imglib/imglib-c66x.inc
> +++ b/meta-ti-extras/recipes-ti/imglib/imglib-c66x.inc
> @@ -7,7 +7,7 @@ require ../includes/ti-paths.inc
>  require ../includes/ti-staging.inc
>  require ../includes/ti-unpack.inc
>  
> -COMPATIBLE_MACHINE = "omap-a15"
> +COMPATIBLE_MACHINE = "am57xx"
>  
>  SRC_URI = "http://software-dl.ti.com/sdoemb/sdoemb_public_sw/imglib/${PV}/exports/${BINFILE};name=imglib"
>  
> diff --git a/meta-ti-extras/recipes-ti/ipc/ti-ipc-rtos.inc b/meta-ti-extras/recipes-ti/ipc/ti-ipc-rtos.inc
> index 56667ad1..ef7317c9 100644
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
> index 999993ea..9442dbc8 100644
> --- a/meta-ti-extras/recipes-ti/ipc/ti-ipc-rtos_git.bb
> +++ b/meta-ti-extras/recipes-ti/ipc/ti-ipc-rtos_git.bb
> @@ -78,14 +78,14 @@ KFPLAT = ""
>  
>  ALTERNATIVE_PRIORITY = "5"
>  
> -pkg_postinst:${PN}-fw:omap-a15 () {
> +pkg_postinst:${PN}-fw:am57xx () {
>    update-alternatives --install /lib/firmware/dra7-dsp1-fw.xe66 dra7-dsp1-fw.xe66 ipc/ti_platforms_evmDRA7XX_dsp1/test_omx_dsp1_vayu.xe66 ${ALTERNATIVE_PRIORITY}
>    update-alternatives --install /lib/firmware/dra7-dsp2-fw.xe66 dra7-dsp2-fw.xe66 ipc/ti_platforms_evmDRA7XX_dsp2/test_omx_dsp2_vayu.xe66 ${ALTERNATIVE_PRIORITY}
>    update-alternatives --install /lib/firmware/dra7-ipu1-fw.xem4 dra7-ipu1-fw.xem4 ipc/ti_platforms_evmDRA7XX_ipu1/test_omx_ipu1_vayu.xem4 ${ALTERNATIVE_PRIORITY}
>    update-alternatives --install /lib/firmware/dra7-ipu2-fw.xem4 dra7-ipu2-fw.xem4 ipc/ti_platforms_evmDRA7XX_ipu2/test_omx_ipu2_vayu.xem4 ${ALTERNATIVE_PRIORITY}
>  }
>  
> -pkg_postrm:${PN}-fw:omap-a15 () {
> +pkg_postrm:${PN}-fw:am57xx () {
>    update-alternatives --remove dra7-dsp1-fw.xe66 ipc/ti_platforms_evmDRA7XX_dsp1/test_omx_dsp1_vayu.xe66
>    update-alternatives --remove dra7-dsp2-fw.xe66 ipc/ti_platforms_evmDRA7XX_dsp2/test_omx_dsp2_vayu.xe66
>    update-alternatives --remove dra7-ipu1-fw.xem4 ipc/ti_platforms_evmDRA7XX_ipu1/test_omx_ipu1_vayu.xem4
> diff --git a/meta-ti-extras/recipes-ti/openmp-rtos/openmp-rtos_git.bb b/meta-ti-extras/recipes-ti/openmp-rtos/openmp-rtos_git.bb
> index 7c4a3409..4e53b3ff 100644
> --- a/meta-ti-extras/recipes-ti/openmp-rtos/openmp-rtos_git.bb
> +++ b/meta-ti-extras/recipes-ti/openmp-rtos/openmp-rtos_git.bb
> @@ -25,7 +25,7 @@ LIC_FILES_CHKSUM = "file://docs/license/omp_manifest_template.html;md5=61a697230
>  
>  DEPENDS = "common-csl-ip-rtos doxygen-native libulm ti-xdctools-native ti-ipc-rtos ti-sysbios ti-cgt6x-native zip-native"
>  
> -COMPATIBLE_MACHINE = "omap-a15"
> +COMPATIBLE_MACHINE = "am57xx"
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
>  S = "${WORKDIR}/git"
> @@ -39,10 +39,10 @@ export XDCCGROOT = "${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x"
>  
>  export BUILD_AM572 = "0"
>  
> -BUILD_AM572:omap-a15 = "1"
> +BUILD_AM572:am57xx = "1"
>  
>  RELEASE_TARGET = ""
> -RELEASE_TARGET:omap-a15 = "am57xx"
> +RELEASE_TARGET:am57xx = "am57xx"
>  
>  do_compile() {
>      make -f utils/product/Makefile .zipfile
> diff --git a/meta-ti-extras/recipes-ti/uio-test-pruss/uio-test-pruss_git.bb b/meta-ti-extras/recipes-ti/uio-test-pruss/uio-test-pruss_git.bb
> index 59576daa..68f97d41 100644
> --- a/meta-ti-extras/recipes-ti/uio-test-pruss/uio-test-pruss_git.bb
> +++ b/meta-ti-extras/recipes-ti/uio-test-pruss/uio-test-pruss_git.bb
> @@ -21,12 +21,12 @@ SRCREV = "${UIO_TEST_PRUSS_SRCREV}"
>  
>  PR = "r0"
>  
> -COMPATIBLE_MACHINE = "omap-a15|ti33x|ti43x"
> +COMPATIBLE_MACHINE = "am57xx|ti33x|ti43x"
>  
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
>  DEVICE_NAME = ""
> -DEVICE_NAME:append:am57xx-evm = "am57xx"
> +DEVICE_NAME:append:am57xx = "am57xx"
>  DEVICE_NAME:append:ti33x = "am33xx"
>  DEVICE_NAME:append:ti43x = "am43xx"
>  
> diff --git a/meta-ti-extras/recipes-ti/vlib/vlib-c66x.inc b/meta-ti-extras/recipes-ti/vlib/vlib-c66x.inc
> index 6b5e186c..63b8c5df 100644
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
> 2.17.1

