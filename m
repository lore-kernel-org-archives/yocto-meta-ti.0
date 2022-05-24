Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAE45C433EF
	for <webhook@archiver.kernel.org>; Tue, 24 May 2022 18:57:58 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.13577.1653418675500853342
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 24 May 2022 11:57:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8FEA140CBF;
	Tue, 24 May 2022 18:57:54 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aGkguw2U3YWw; Tue, 24 May 2022 18:57:54 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 5531840CBD;
	Tue, 24 May 2022 18:57:51 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 24822174951; Tue, 24 May 2022 14:57:51 -0400 (EDT)
Date: Tue, 24 May 2022 14:57:51 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Nishanth Menon <nm@ti.com>
Cc: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [dunfell PATCH] all: Stop using git://git.ti.com
Message-ID: <20220524185751.GP9834@denix.org>
References: <20220524181527.8031-1-nm@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220524181527.8031-1-nm@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 24 May 2022 18:57:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14755

NAK, this is incorrect.

Was there any testing done?


On Tue, May 24, 2022 at 01:15:27PM -0500, Nishanth Menon wrote:
> Stop using un-encrypted git:// protocol to access TI repositories.
> 
> This is inline with the same arguments as made by github in [1]
> 
> This patch was generated via the following script:
> git grep "git://git.ti.com" .|cut -d ':' -f1|sort -u|xargs sed -i -e "s/git:\/\/git.ti.com/https:\/\/git.ti.com\/git/g"
> 
> [1] https://github.blog/2021-09-01-improving-git-protocol-security-github/
> 
> Signed-off-by: Nishanth Menon <nm@ti.com>
> ---
> 
> This applies to:
> dunfell                e99d9aa3fc41 ti-linux-fw: Bump to 08.03.00.005 release
> 
>  classes/ti-pdk-fetch.bbclass                                  | 2 +-
>  recipes-bsp/abefw/abefw_1.0.14.bb                             | 2 +-
>  recipes-bsp/audk2g-addon/audk2g-addon-rtos_git.bb             | 2 +-
>  recipes-bsp/boot-monitor/boot-monitor_git.bb                  | 2 +-
>  recipes-bsp/bt-fw/bt-fw_git.bb                                | 2 +-
>  recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb                   | 2 +-
>  recipes-bsp/cmb-addon/cmb-addon-rtos_git.bb                   | 2 +-
>  recipes-bsp/cmem/cmem.inc                                     | 2 +-
>  recipes-bsp/common-csl-ip/common-csl-ip.inc                   | 2 +-
>  recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb                | 2 +-
>  recipes-bsp/dspdce-fw/dspdce-fw_git.bb                        | 2 +-
>  recipes-bsp/dsptop/dsptop.inc                                 | 2 +-
>  recipes-bsp/edma3-lld/edma3-lld.inc                           | 2 +-
>  recipes-bsp/faultmanagement/faultmanagement-rtos_git.bb       | 2 +-
>  recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb        | 2 +-
>  recipes-bsp/hplib/hplib.inc                                   | 2 +-
>  recipes-bsp/ibl-boot/ibl-boot-rtos_git.bb                     | 2 +-
>  recipes-bsp/ipc-lld/ipc-lld-fw_git.bb                         | 2 +-
>  recipes-bsp/ipumm-fw/ipumm-fw_git.bb                          | 2 +-
>  recipes-bsp/mad-utils/mad-utils-rtos_git.bb                   | 2 +-
>  recipes-bsp/mmap-lld/mmap-lld.inc                             | 2 +-
>  recipes-bsp/pktlib/pktlib.inc                                 | 2 +-
>  recipes-bsp/pm-lld/pm-lld-rtos_git.bb                         | 2 +-
>  .../powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb       | 2 +-
>  recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb     | 2 +-
>  recipes-bsp/pru/pru-icss_git.bb                               | 2 +-
>  recipes-bsp/sa-lld/sa-lld.inc                                 | 2 +-
>  recipes-bsp/serdes-diag/serdes-diag-rtos_git.bb               | 2 +-
>  recipes-bsp/srss-tc/srss-tc_git.bb                            | 2 +-
>  recipes-bsp/starterware/starterware.inc                       | 2 +-
>  recipes-bsp/ti-img-encode-decode/viddec-test-app_1.0.0.bb     | 2 +-
>  recipes-bsp/ti-img-encode-decode/videnc-test-app_1.0.0.bb     | 2 +-
>  recipes-bsp/ti-linux-fw/ti-linux-fw.inc                       | 4 ++--
>  recipes-bsp/ti-sci-fw/ti-sci-fw_0.1.1.50.bb                   | 2 +-
>  recipes-bsp/traceframework/traceframework.inc                 | 2 +-
>  recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend  | 2 +-
>  recipes-bsp/u-boot/u-boot-ti.inc                              | 2 +-
>  recipes-bsp/uio-module-drv/uio-module-drv.inc                 | 2 +-
>  recipes-bsp/vpe-tests/vpe-tests_git.bb                        | 2 +-
>  recipes-bsp/vps-lld/vps-lld-rtos_git.bb                       | 2 +-
>  recipes-bsp/wdtimer/wdtimer-rtos_git.bb                       | 2 +-
>  recipes-bsp/wl18xx-fw/wl18xx-fw_8.9.0.0.86.bb                 | 2 +-
>  recipes-connectivity/uim/uim-sysfs_8.5.bb                     | 2 +-
>  .../wl18xx-calibrator/wl18xx-calibrator_8.7.3.bb              | 2 +-
>  .../wl18xx-target-scripts/wl18xx-target-scripts_8.7.3.bb      | 2 +-
>  recipes-connectivity/wlconf/wlconf_8.7.3.bb                   | 2 +-
>  recipes-devtools/gdbc6x/gdbc6x.inc                            | 2 +-
>  recipes-devtools/k3conf/k3conf_git.bb                         | 2 +-
>  recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb            | 2 +-
>  recipes-graphics/libgles/ti-img-rogue-umlibs_1.15.6133109.bb  | 2 +-
>  recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb        | 2 +-
>  recipes-kernel/linux/linux-ti-mainline_git.bb                 | 2 +-
>  recipes-kernel/linux/linux-ti-staging_5.10.bb                 | 2 +-
>  recipes-kernel/linux/linux-ti-staging_5.4.bb                  | 2 +-
>  recipes-ti/ctoolslib/libaet_git.bb                            | 2 +-
>  recipes-ti/dsplib/dsplib.inc                                  | 2 +-
>  recipes-ti/ipc/ipc-transport.inc                              | 2 +-
>  recipes-ti/ipc/ti-ipc-rtos.inc                                | 4 ++--
>  recipes-ti/ipc/ti-ipc.inc                                     | 2 +-
>  recipes-ti/ipc/ti-rpmsg-char.inc                              | 2 +-
>  recipes-ti/mathlib/mathlib.inc                                | 2 +-
>  recipes-ti/mpm-transport/mpm-transport_git.bb                 | 2 +-
>  recipes-ti/multiprocmgr/multiprocmgr.inc                      | 2 +-
>  recipes-ti/openmp-rtos/openmp-rtos_git.bb                     | 4 ++--
>  recipes-ti/swtools/swtools_git.bb                             | 2 +-
>  recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb                    | 2 +-
>  recipes-ti/udma/udma_git.bb                                   | 2 +-
>  recipes-ti/uio-test-pruss/uio-test-pruss_git.bb               | 2 +-
>  68 files changed, 71 insertions(+), 71 deletions(-)
> 
> diff --git a/classes/ti-pdk-fetch.bbclass b/classes/ti-pdk-fetch.bbclass
> index cacd71a4488a..57a975a6dd08 100644
> --- a/classes/ti-pdk-fetch.bbclass
> +++ b/classes/ti-pdk-fetch.bbclass
> @@ -1,4 +1,4 @@
> -TI_PDK_GIT_URI ?= "git://git.ti.com/processor-sdk/pdk.git"
> +TI_PDK_GIT_URI ?= "https://git.ti.com/git/processor-sdk/pdk.git"
>  TI_PDK_GIT_BRANCH ?= "master"
>  TI_PDK_GIT_PROTOCOL ?= "git"
>  TI_PDK_SRCREV ?= "a1ace885998e9adbcbbd0abf8b9ded6ba9ec54ff"
> diff --git a/recipes-bsp/abefw/abefw_1.0.14.bb b/recipes-bsp/abefw/abefw_1.0.14.bb
> index 302bdcdeb7c7..847d922fae80 100644
> --- a/recipes-bsp/abefw/abefw_1.0.14.bb
> +++ b/recipes-bsp/abefw/abefw_1.0.14.bb
> @@ -7,7 +7,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
>  COMPATIBLE_MACHINE = "pandaboard|omap5-evm"
>  
> -SRC_URI = "git://git.ti.com/glsdk/abefw-omap4plus.git;protocol=git"
> +SRC_URI = "https://git.ti.com/git/glsdk/abefw-omap4plus.git;protocol=git"
>  
>  S = "${WORKDIR}/git"
>  
> diff --git a/recipes-bsp/audk2g-addon/audk2g-addon-rtos_git.bb b/recipes-bsp/audk2g-addon/audk2g-addon-rtos_git.bb
> index 0cb9ff1717b2..47da53e94ec5 100644
> --- a/recipes-bsp/audk2g-addon/audk2g-addon-rtos_git.bb
> +++ b/recipes-bsp/audk2g-addon/audk2g-addon-rtos_git.bb
> @@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://audk2gaddonver.h;beginline=8;endline=47;md5=7a3996aaf
>  COMPATIBLE_MACHINE = "k2g"
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
> -AUDK2G_ADDON_GIT_URI = "git://git.ti.com/processor-sdk/audk2g-addon.git"
> +AUDK2G_ADDON_GIT_URI = "https://git.ti.com/git/processor-sdk/audk2g-addon.git"
>  AUDK2G_ADDON_GIT_PROTOCOL = "git"
>  AUDK2G_ADDON_GIT_BRANCH = "master"
>  AUDK2G_ADDON_GIT_DESTSUFFIX = "git/ti/addon/audk2g"
> diff --git a/recipes-bsp/boot-monitor/boot-monitor_git.bb b/recipes-bsp/boot-monitor/boot-monitor_git.bb
> index 9c436d1c1669..93dc2a45ddb7 100644
> --- a/recipes-bsp/boot-monitor/boot-monitor_git.bb
> +++ b/recipes-bsp/boot-monitor/boot-monitor_git.bb
> @@ -7,7 +7,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
>  DEPENDS = "u-boot-mkimage-native"
>  
> -SRC_URI = "git://git.ti.com/processor-firmware/ks2-boot-monitor.git;protocol=git;branch=${BRANCH}"
> +SRC_URI = "https://git.ti.com/git/processor-firmware/ks2-boot-monitor.git;protocol=git;branch=${BRANCH}"
>  
>  PV = "4.0+git${SRCPV}"
>  
> diff --git a/recipes-bsp/bt-fw/bt-fw_git.bb b/recipes-bsp/bt-fw/bt-fw_git.bb
> index f3d740b19bb3..b0a7e420ae60 100644
> --- a/recipes-bsp/bt-fw/bt-fw_git.bb
> +++ b/recipes-bsp/bt-fw/bt-fw_git.bb
> @@ -8,7 +8,7 @@ CLEANBROKEN = "1"
>  
>  SRCREV = "0ee619b598d023fffc77679f099bc2a4815510e4"
>  BRANCH = "master"
> -SRC_URI = "git://git.ti.com/ti-bt/service-packs.git;branch=${BRANCH}"
> +SRC_URI = "https://git.ti.com/git/ti-bt/service-packs.git;branch=${BRANCH}"
>  
>  S = "${WORKDIR}/git"
>  
> diff --git a/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb b/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb
> index bbbc3ec1214f..720ae56fc2ca 100644
> --- a/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb
> +++ b/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb
> @@ -9,7 +9,7 @@ PR = "r0"
>  SRCREV = "fb484c5e54f2e31cf0a338d2927a06a2870bcc2c"
>  BRANCH ?= "ti-v4.1.y"
>  
> -SRC_URI = "git://git.ti.com/processor-firmware/ti-amx3-cm3-pm-firmware.git;protocol=git;branch=${BRANCH}"
> +SRC_URI = "https://git.ti.com/git/processor-firmware/ti-amx3-cm3-pm-firmware.git;protocol=git;branch=${BRANCH}"
>  
>  S = "${WORKDIR}/git"
>  
> diff --git a/recipes-bsp/cmb-addon/cmb-addon-rtos_git.bb b/recipes-bsp/cmb-addon/cmb-addon-rtos_git.bb
> index 38f9a43ef403..c037f3380d2c 100644
> --- a/recipes-bsp/cmb-addon/cmb-addon-rtos_git.bb
> +++ b/recipes-bsp/cmb-addon/cmb-addon-rtos_git.bb
> @@ -9,7 +9,7 @@ COMPATIBLE_MACHINE = "k2g|omapl137-evm"
>  
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
> -CMB_ADDON_GIT_URI = "git://git.ti.com/processor-sdk/circmicarray-addon.git"
> +CMB_ADDON_GIT_URI = "https://git.ti.com/git/processor-sdk/circmicarray-addon.git"
>  CMB_ADDON_GIT_PROTOCOL = "git"
>  CMB_ADDON_GIT_BRANCH = "master"
>  CMB_ADDON_GIT_DESTSUFFIX = "git/ti/addon"
> diff --git a/recipes-bsp/cmem/cmem.inc b/recipes-bsp/cmem/cmem.inc
> index f568fa81d1e6..7d67c331ed74 100644
> --- a/recipes-bsp/cmem/cmem.inc
> +++ b/recipes-bsp/cmem/cmem.inc
> @@ -9,7 +9,7 @@ SRCREV = "86269258a48e0a9008dd9d5ebfae9da7ce843393"
>  
>  PV = "4.20.00.01+git${SRCPV}"
>  
> -SRC_URI = "git://git.ti.com/ipc/ludev.git;protocol=git;branch=${BRANCH}"
> +SRC_URI = "https://git.ti.com/git/ipc/ludev.git;protocol=git;branch=${BRANCH}"
>  
>  S = "${WORKDIR}/git"
>  COMPATIBLE_HOST ?= "null"
> diff --git a/recipes-bsp/common-csl-ip/common-csl-ip.inc b/recipes-bsp/common-csl-ip/common-csl-ip.inc
> index 23586fd70b87..16ba7e8978fa 100644
> --- a/recipes-bsp/common-csl-ip/common-csl-ip.inc
> +++ b/recipes-bsp/common-csl-ip/common-csl-ip.inc
> @@ -8,7 +8,7 @@ PV = "03.03.00.17B"
>  INC_PR = "r0"
>  PE = "2"
>  
> -CSL_GIT_URI = "git://git.ti.com/keystone-rtos/common-csl-ip.git"
> +CSL_GIT_URI = "https://git.ti.com/git/keystone-rtos/common-csl-ip.git"
>  CSL_GIT_PROTOCOL ="git"
>  CSL_GIT_BRANCH = "release"
>  CSL_GIT_DESTSUFFIX = "git"
> diff --git a/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb b/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb
> index 8cb62b2ace15..451f0824b5f5 100755
> --- a/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb
> +++ b/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb
> @@ -13,7 +13,7 @@ PROTOCOL = "git"
>  BRANCH = "master"
>  SRCREV = "91f1628507bf7f8716f0bc7cafe88ad7f14c94f5"
>  
> -SRC_URI = "git://git.ti.com/glsdk/ti-eth-fw.git;protocol=${PROTOCOL};branch=${BRANCH}"
> +SRC_URI = "https://git.ti.com/git/glsdk/ti-eth-fw.git;protocol=${PROTOCOL};branch=${BRANCH}"
>  
>  S = "${WORKDIR}/git"
>  
> diff --git a/recipes-bsp/dspdce-fw/dspdce-fw_git.bb b/recipes-bsp/dspdce-fw/dspdce-fw_git.bb
> index 6ddbe6831846..af801515d639 100644
> --- a/recipes-bsp/dspdce-fw/dspdce-fw_git.bb
> +++ b/recipes-bsp/dspdce-fw/dspdce-fw_git.bb
> @@ -8,7 +8,7 @@ inherit features_check
>  
>  REQUIRED_MACHINE_FEATURES = "dsp"
>  
> -SRC_URI = "git://git.ti.com/glsdk/dspdce.git;protocol=git"
> +SRC_URI = "https://git.ti.com/git/glsdk/dspdce.git;protocol=git"
>  
>  SRCREV = "de6e599f067b25c46cc0c8f74a22cc3b8aafbae8"
>  
> diff --git a/recipes-bsp/dsptop/dsptop.inc b/recipes-bsp/dsptop/dsptop.inc
> index 31f775e27bc3..e24e904618fb 100644
> --- a/recipes-bsp/dsptop/dsptop.inc
> +++ b/recipes-bsp/dsptop/dsptop.inc
> @@ -3,6 +3,6 @@ SRCREV = "816485e68430bbec643eac9498bfa5303eb2c2e1"
>  PV = "1.4.0"
>  INC_PR = "r2"
>  
> -SRC_URI = "git://git.ti.com/sdo-emu/dsptop.git;protocol=git;branch=${BRANCH}"
> +SRC_URI = "https://git.ti.com/git/sdo-emu/dsptop.git;protocol=git;branch=${BRANCH}"
>  
>  BRANCH = "master"
> diff --git a/recipes-bsp/edma3-lld/edma3-lld.inc b/recipes-bsp/edma3-lld/edma3-lld.inc
> index 34d3170f967d..4ae2aa45105a 100644
> --- a/recipes-bsp/edma3-lld/edma3-lld.inc
> +++ b/recipes-bsp/edma3-lld/edma3-lld.inc
> @@ -2,7 +2,7 @@ DESCRIPTION = "TI EDMA3 low level driver and test code"
>  LICENSE = "BSD-3-Clause"
>  LIC_FILES_CHKSUM = "file://COPYING.txt;md5=5bdceac872dffdec915b819654ee23ea"
>  
> -EDMA3_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/edma3_lld.git"
> +EDMA3_LLD_GIT_URI = "https://git.ti.com/git/keystone-rtos/edma3_lld.git"
>  EDMA3_LLD_GIT_PROTOCOL = "git"
>  EDMA3_LLD_GIT_BRANCH = "master"
>  
> diff --git a/recipes-bsp/faultmanagement/faultmanagement-rtos_git.bb b/recipes-bsp/faultmanagement/faultmanagement-rtos_git.bb
> index bf8aba6a5e56..34ac37caafcf 100644
> --- a/recipes-bsp/faultmanagement/faultmanagement-rtos_git.bb
> +++ b/recipes-bsp/faultmanagement/faultmanagement-rtos_git.bb
> @@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://fault_mgmt.h;beginline=1;endline=41;md5=4be5df2b9c314
>  COMPATIBLE_MACHINE = "k2hk|k2e|k2l"
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
> -FAULT_MANAGEMENT_GIT_URI = "git://git.ti.com/keystone-rtos/fault_mgmt.git"
> +FAULT_MANAGEMENT_GIT_URI = "https://git.ti.com/git/keystone-rtos/fault_mgmt.git"
>  FAULT_MANAGEMENT_GIT_PROTOCOL = "git"
>  FAULT_MANAGEMENT_GIT_BRANCH = "master"
>  FAULT_MANAGEMENT_GIT_DESTSUFFIX = "git/ti/instrumentation/fault_mgmt"
> diff --git a/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb b/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
> index d36bcd56b5f0..f104872a013b 100644
> --- a/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
> +++ b/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
> @@ -15,7 +15,7 @@ BRANCH = "ti-${PV}-k5.10"
>  
>  SRCREV = "e2a10f31e255a65ec30a6e10b890e77d7e9cb107"
>  
> -SRC_URI = "git://git.ti.com/graphics/ti-gc320-driver.git;protocol=git;branch=${BRANCH}"
> +SRC_URI = "https://git.ti.com/git/graphics/ti-gc320-driver.git;protocol=git;branch=${BRANCH}"
>  
>  S = "${WORKDIR}/git/src"
>  
> diff --git a/recipes-bsp/hplib/hplib.inc b/recipes-bsp/hplib/hplib.inc
> index dda47344a1ad..558b1e3e384e 100644
> --- a/recipes-bsp/hplib/hplib.inc
> +++ b/recipes-bsp/hplib/hplib.inc
> @@ -5,7 +5,7 @@ DEVICELIST_k2hk = "k2h k2k"
>  DEVICELIST_k2l  = "k2l"
>  DEVICELIST_k2e  = "k2e"
>  
> -HPLIB_GIT_URI = "git://git.ti.com/keystone-rtos/hplib.git"
> +HPLIB_GIT_URI = "https://git.ti.com/git/keystone-rtos/hplib.git"
>  HPLIB_GIT_PROTOCOL = "git"
>  HPLIB_GIT_BRANCH = "master"
>  
> diff --git a/recipes-bsp/ibl-boot/ibl-boot-rtos_git.bb b/recipes-bsp/ibl-boot/ibl-boot-rtos_git.bb
> index 59b75b3a5ba9..de8dd9963c77 100644
> --- a/recipes-bsp/ibl-boot/ibl-boot-rtos_git.bb
> +++ b/recipes-bsp/ibl-boot/ibl-boot-rtos_git.bb
> @@ -19,7 +19,7 @@ COMPATIBLE_MACHINE = "c66x"
>  
>  CLEANBROKEN = "1"
>  
> -IBL_BOOT_GIT_URI = "git://git.ti.com/keystone-rtos/ibl.git"
> +IBL_BOOT_GIT_URI = "https://git.ti.com/git/keystone-rtos/ibl.git"
>  IBL_BOOT_GIT_PROTOCOL = "git"
>  IBL_BOOT_GIT_BRANCH = "master"
>  IBL_BOOT_SRCREV = "ed3f0989d8cdc813b7ca1ed899c4d84b63de3a75"
> diff --git a/recipes-bsp/ipc-lld/ipc-lld-fw_git.bb b/recipes-bsp/ipc-lld/ipc-lld-fw_git.bb
> index 93a8a3a1a37c..93b2da3015fc 100644
> --- a/recipes-bsp/ipc-lld/ipc-lld-fw_git.bb
> +++ b/recipes-bsp/ipc-lld/ipc-lld-fw_git.bb
> @@ -15,7 +15,7 @@ PROTOCOL = "git"
>  BRANCH = "master"
>  SRCREV = "c9f7cfe61b67998a053fe145344ce0c9b5bb22aa"
>  
> -SRC_URI = "git://git.ti.com/keystone-rtos/ipc-lld.git;protocol=${PROTOCOL};branch=${BRANCH}"
> +SRC_URI = "https://git.ti.com/git/keystone-rtos/ipc-lld.git;protocol=${PROTOCOL};branch=${BRANCH}"
>  
>  S = "${WORKDIR}/git"
>  
> diff --git a/recipes-bsp/ipumm-fw/ipumm-fw_git.bb b/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
> index 380c274ac016..4f8d91864e61 100644
> --- a/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
> +++ b/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
> @@ -11,7 +11,7 @@ REQUIRED_MACHINE_FEATURES = "mmip"
>  
>  RDEPENDS_${PN} = "libdce"
>  
> -SRC_URI = "git://git.ti.com/ivimm/ipumm.git;protocol=git"
> +SRC_URI = "https://git.ti.com/git/ivimm/ipumm.git;protocol=git"
>  
>  SRCREV = "df4c50aecc9aad7ab3eb1ca9ebacfe473fcad7c5"
>  
> diff --git a/recipes-bsp/mad-utils/mad-utils-rtos_git.bb b/recipes-bsp/mad-utils/mad-utils-rtos_git.bb
> index 0144aad2836a..c2a0cf306287 100644
> --- a/recipes-bsp/mad-utils/mad-utils-rtos_git.bb
> +++ b/recipes-bsp/mad-utils/mad-utils-rtos_git.bb
> @@ -16,7 +16,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
>  COMPATIBLE_MACHINE = "c66x"
>  
>  BRANCH = "master"
> -SRC_URI = "git://git.ti.com/keystone-rtos/mad-utils.git;protocol=git;branch=${BRANCH}"
> +SRC_URI = "https://git.ti.com/git/keystone-rtos/mad-utils.git;protocol=git;branch=${BRANCH}"
>  SRCREV = "2458510f76eddfa837c2b83448965e233156944b"
>  PR = "r0"
>  
> diff --git a/recipes-bsp/mmap-lld/mmap-lld.inc b/recipes-bsp/mmap-lld/mmap-lld.inc
> index 7e11a4c5acf0..3cb0f98d79f4 100644
> --- a/recipes-bsp/mmap-lld/mmap-lld.inc
> +++ b/recipes-bsp/mmap-lld/mmap-lld.inc
> @@ -4,7 +4,7 @@ COMPATIBLE_MACHINE = "keystone"
>  
>  LIC_FILES_CHKSUM = "file://COPYING.txt;md5=b3315b8190036fe1c6a8263d02e15606"
>  
> -MMAP_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/mmap-lld.git"
> +MMAP_LLD_GIT_URI = "https://git.ti.com/git/keystone-rtos/mmap-lld.git"
>  MMAP_LLD_GIT_PROTOCOL = "git"
>  MMAP_LLD_GIT_BRANCH = "master"
>  MMAP_LLD_GIT_DESTSUFFIX = "git/ti/runtime/mmap"
> diff --git a/recipes-bsp/pktlib/pktlib.inc b/recipes-bsp/pktlib/pktlib.inc
> index af3f8bb190b2..6fb328c2984a 100644
> --- a/recipes-bsp/pktlib/pktlib.inc
> +++ b/recipes-bsp/pktlib/pktlib.inc
> @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://docs/Doxyfile;md5=91d01dc3788e1f405f000b2089191a0a"
>  COMPATIBLE_MACHINE = "keystone"
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
> -PKTLIB_GIT_URI = "git://git.ti.com/keystone-rtos/pktlib.git"
> +PKTLIB_GIT_URI = "https://git.ti.com/git/keystone-rtos/pktlib.git"
>  PKTLIB_GIT_PROTOCOL = "git"
>  PKTLIB_GIT_BRANCH = "master"
>  PKTLIB_GIT_DESTSUFFIX = "git/ti/runtime/pktlib"
> diff --git a/recipes-bsp/pm-lld/pm-lld-rtos_git.bb b/recipes-bsp/pm-lld/pm-lld-rtos_git.bb
> index 25fcb65edf41..d99c4a6143ce 100644
> --- a/recipes-bsp/pm-lld/pm-lld-rtos_git.bb
> +++ b/recipes-bsp/pm-lld/pm-lld-rtos_git.bb
> @@ -9,7 +9,7 @@ COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|k2g|k3"
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
>  
> -PM_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/pm-lld.git"
> +PM_LLD_GIT_URI = "https://git.ti.com/git/keystone-rtos/pm-lld.git"
>  PM_LLD_GIT_PROTOCOL = "git"
>  
>  PM_LLD_GIT_BRANCH = "master"
> diff --git a/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb b/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb
> index 718c78458a8b..76368b0b7511 100644
> --- a/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb
> +++ b/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb
> @@ -20,7 +20,7 @@ PROVIDES = "virtual/gpudriver"
>  BRANCH = "linuxws/dunfell/k5.10/${PV}_unified_fw_pagesize"
>  
>  SRC_URI = " \
> -    git://git.ti.com/graphics/ti-img-rogue-driver.git;branch=${BRANCH} \
> +    https://git.ti.com/git/graphics/ti-img-rogue-driver.git;branch=${BRANCH} \
>      file://0001-compiler-support-OpenEmbedded-nodistro-internal-aarc.patch \
>  "
>  
> diff --git a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
> index a1b0765c74d4..a29b68fd6538 100644
> --- a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
> +++ b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
> @@ -20,7 +20,7 @@ PROVIDES = "virtual/gpudriver"
>  
>  BRANCH = "ti-img-sgx/${PV}/k5.10"
>  
> -SRC_URI = "git://git.ti.com/graphics/omap5-sgx-ddk-linux.git;protocol=git;branch=${BRANCH}"
> +SRC_URI = "https://git.ti.com/git/graphics/omap5-sgx-ddk-linux.git;protocol=git;branch=${BRANCH}"
>  
>  S = "${WORKDIR}/git"
>  
> diff --git a/recipes-bsp/pru/pru-icss_git.bb b/recipes-bsp/pru/pru-icss_git.bb
> index 1ceba0573af0..aaaf0d6c88e0 100644
> --- a/recipes-bsp/pru/pru-icss_git.bb
> +++ b/recipes-bsp/pru/pru-icss_git.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://PRU-Package-v6.1-Manifest.html;md5=1e37797ebe9254922f
>  inherit update-alternatives
>  
>  BRANCH = "master"
> -SRC_URI = "git://git.ti.com/pru-software-support-package/pru-software-support-package.git;protocol=git;branch=${BRANCH}"
> +SRC_URI = "https://git.ti.com/git/pru-software-support-package/pru-software-support-package.git;protocol=git;branch=${BRANCH}"
>  SRCREV = "ae1decf0b494b2904e6157e1379691ffc468f0cf"
>  
>  PV = "6.1.0"
> diff --git a/recipes-bsp/sa-lld/sa-lld.inc b/recipes-bsp/sa-lld/sa-lld.inc
> index d4993cb9fd7d..8f5c8a5ac6bc 100644
> --- a/recipes-bsp/sa-lld/sa-lld.inc
> +++ b/recipes-bsp/sa-lld/sa-lld.inc
> @@ -3,7 +3,7 @@ COMPATIBLE_MACHINE = "k2hk|k2e|k2l"
>  
>  LIC_FILES_CHKSUM = "file://${WORKDIR}/git/ti/drv/sa/COPYING.txt;md5=cd04fb087063a2a82c4ce61983836871"
>  
> -SA_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/sa-lld.git"
> +SA_LLD_GIT_URI = "https://git.ti.com/git/keystone-rtos/sa-lld.git"
>  SA_LLD_GIT_PROTOCOL = "git"
>  SA_LLD_GIT_BRANCH = "master"
>  SA_LLD_GIT_DESTSUFFIX = "git/ti/drv/sa"
> diff --git a/recipes-bsp/serdes-diag/serdes-diag-rtos_git.bb b/recipes-bsp/serdes-diag/serdes-diag-rtos_git.bb
> index 442c4cb1793e..f52599d8cc5e 100644
> --- a/recipes-bsp/serdes-diag/serdes-diag-rtos_git.bb
> +++ b/recipes-bsp/serdes-diag/serdes-diag-rtos_git.bb
> @@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://serdes_diag.h;beginline=1;endline=42;;md5=68e7ce6fdc0
>  COMPATIBLE_MACHINE = "keystone|c66x|k3"
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
> -SERDES_DIAG_GIT_URI = "git://git.ti.com/keystone-rtos/serdes_diag.git"
> +SERDES_DIAG_GIT_URI = "https://git.ti.com/git/keystone-rtos/serdes_diag.git"
>  SERDES_DIAG_GIT_PROTOCOL = "git"
>  SERDES_DIAG_GIT_BRANCH = "master"
>  SERDES_DIAG_GIT_DESTSUFFIX = "git/ti/diag/serdes_diag"
> diff --git a/recipes-bsp/srss-tc/srss-tc_git.bb b/recipes-bsp/srss-tc/srss-tc_git.bb
> index 483bde00f822..0dbf56e3e450 100644
> --- a/recipes-bsp/srss-tc/srss-tc_git.bb
> +++ b/recipes-bsp/srss-tc/srss-tc_git.bb
> @@ -10,7 +10,7 @@ BRANCH = "master"
>  # This commit corresponds to tag DEV.SRSS-TC-01.00.00.01A
>  SRCREV = "107cd1433ef5785e5647ef086a4cc77566506604"
>  
> -SRC_URI = "git://git.ti.com/keystone-linux/srss-tc.git;protocol=git;branch=${BRANCH}"
> +SRC_URI = "https://git.ti.com/git/keystone-linux/srss-tc.git;protocol=git;branch=${BRANCH}"
>  
>  S = "${WORKDIR}/git"
>  
> diff --git a/recipes-bsp/starterware/starterware.inc b/recipes-bsp/starterware/starterware.inc
> index 82b012ad03de..9722c2a41dd1 100644
> --- a/recipes-bsp/starterware/starterware.inc
> +++ b/recipes-bsp/starterware/starterware.inc
> @@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://Makefile;beginline=1;endline=35;md5=286cbb5dce3e34829
>  COMPATIBLE_MACHINE = "ti33x|ti43x"
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
> -STARTERWARE_GIT_URI = "git://git.ti.com/keystone-rtos/starterware.git"
> +STARTERWARE_GIT_URI = "https://git.ti.com/git/keystone-rtos/starterware.git"
>  STARTERWARE_GIT_PROTOCOL = "git"
>  STARTERWARE_GIT_BRANCH = "master"
>  
> diff --git a/recipes-bsp/ti-img-encode-decode/viddec-test-app_1.0.0.bb b/recipes-bsp/ti-img-encode-decode/viddec-test-app_1.0.0.bb
> index 48a1753777ee..68232d2fae2c 100644
> --- a/recipes-bsp/ti-img-encode-decode/viddec-test-app_1.0.0.bb
> +++ b/recipes-bsp/ti-img-encode-decode/viddec-test-app_1.0.0.bb
> @@ -13,6 +13,6 @@ EXTRA_OEMAKE = "CC="${CC}""
>  TARGET_CC_ARCH += "${LDFLAGS}"
>  
>  BRANCH = "master"
> -SRC_URI = "git://git.ti.com/jacinto7_multimedia/viddec-test-app.git;protocol=git;branch=${BRANCH}"
> +SRC_URI = "https://git.ti.com/git/jacinto7_multimedia/viddec-test-app.git;protocol=git;branch=${BRANCH}"
>  
>  S = "${WORKDIR}/git"
> diff --git a/recipes-bsp/ti-img-encode-decode/videnc-test-app_1.0.0.bb b/recipes-bsp/ti-img-encode-decode/videnc-test-app_1.0.0.bb
> index 3bb5d745ec4a..2b531f559c79 100644
> --- a/recipes-bsp/ti-img-encode-decode/videnc-test-app_1.0.0.bb
> +++ b/recipes-bsp/ti-img-encode-decode/videnc-test-app_1.0.0.bb
> @@ -13,6 +13,6 @@ EXTRA_OEMAKE = "CC="${CC}""
>  TARGET_CC_ARCH += "${LDFLAGS}"
>  
>  BRANCH = "master"
> -SRC_URI = "git://git.ti.com/jacinto7_multimedia/videnc-test-app.git;protocol=git;branch=${BRANCH}"
> +SRC_URI = "https://git.ti.com/git/jacinto7_multimedia/videnc-test-app.git;protocol=git;branch=${BRANCH}"
>  
>  S = "${WORKDIR}/git"
> diff --git a/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
> index 52766ac0771b..74a7dcd84578 100644
> --- a/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
> +++ b/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
> @@ -30,8 +30,8 @@ SRCREV_imggen = "${K3_IMAGE_GEN_SRCREV}"
>  SRCREV_FORMAT = "imggen"
>  
>  SRC_URI = " \
> -	git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=git;branch=${BRANCH} \
> -	git://git.ti.com/k3-image-gen/k3-image-gen.git;protocol=git;branch=master;destsuffix=imggen;name=imggen \
> +	https://git.ti.com/git/processor-firmware/ti-linux-firmware.git;protocol=git;branch=${BRANCH} \
> +	https://git.ti.com/git/k3-image-gen/k3-image-gen.git;protocol=git;branch=master;destsuffix=imggen;name=imggen \
>  "
>  
>  S = "${WORKDIR}/git"
> diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_0.1.1.50.bb b/recipes-bsp/ti-sci-fw/ti-sci-fw_0.1.1.50.bb
> index 9e68fdff8a17..cabad71e74c3 100644
> --- a/recipes-bsp/ti-sci-fw/ti-sci-fw_0.1.1.50.bb
> +++ b/recipes-bsp/ti-sci-fw/ti-sci-fw_0.1.1.50.bb
> @@ -15,7 +15,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
>  SRCREV = "ab507546f0f3f217f4c782a20845856e14b38224"
>  BRANCH ?= "ti-linux-firmware"
>  
> -SRC_URI = "git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=git;branch=${BRANCH}"
> +SRC_URI = "https://git.ti.com/git/processor-firmware/ti-linux-firmware.git;protocol=git;branch=${BRANCH}"
>  
>  S = "${WORKDIR}/git"
>  TARGET = "ti-sci-firmware-k2g.bin"
> diff --git a/recipes-bsp/traceframework/traceframework.inc b/recipes-bsp/traceframework/traceframework.inc
> index 33b87d9ca1f3..be01da6a5f9e 100644
> --- a/recipes-bsp/traceframework/traceframework.inc
> +++ b/recipes-bsp/traceframework/traceframework.inc
> @@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING.txt;md5=e8f6789acdcda76d02ed9203fc2e603d"
>  COMPATIBLE_MACHINE = "tci6614-evm|keystone"
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
> -TRACEFRAMEWORK_GIT_URI = "git://git.ti.com/keystone-rtos/traceframework.git"
> +TRACEFRAMEWORK_GIT_URI = "https://git.ti.com/git/keystone-rtos/traceframework.git"
>  TRACEFRAMEWORK_GIT_PROTOCOL = "git"
>  TRACEFRAMEWORK_GIT_BRANCH = "master"
>  TRACEFRAMEWORK_GIT_DESTSUFFIX = "git/ti/instrumentation/traceframework"
> diff --git a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
> index 68bfa899578b..23cdf2749422 100644
> --- a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
> +++ b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
> @@ -1,7 +1,7 @@
>  PV_k3 = "2.6"
>  LIC_FILES_CHKSUM_k3 = "file://license.rst;md5=1dd070c98a281d18d9eefd938729b031"
>  BRANCH_k3 = "ti-atf"
> -SRC_URI_k3 = "git://git.ti.com/atf/arm-trusted-firmware.git;branch=${BRANCH};name=tfa"
> +SRC_URI_k3 = "https://git.ti.com/git/atf/arm-trusted-firmware.git;branch=${BRANCH};name=tfa"
>  SRCREV_tfa_k3 = "6541aa24f834daa80da701e0054dfe3a16cda0ce"
>  COMPATIBLE_MACHINE_k3 = "k3"
>  TFA_BUILD_TARGET_k3 = "all"
> diff --git a/recipes-bsp/u-boot/u-boot-ti.inc b/recipes-bsp/u-boot/u-boot-ti.inc
> index 903c61f09004..bb54631815da 100644
> --- a/recipes-bsp/u-boot/u-boot-ti.inc
> +++ b/recipes-bsp/u-boot/u-boot-ti.inc
> @@ -16,7 +16,7 @@ LICENSE = "GPLv2+"
>  LIC_FILES_CHKSUM = "file://Licenses/README;md5=30503fd321432fc713238f582193b78e"
>  
>  BRANCH ?= "master"
> -UBOOT_GIT_URI = "git://git.ti.com/ti-u-boot/ti-u-boot.git"
> +UBOOT_GIT_URI = "https://git.ti.com/git/ti-u-boot/ti-u-boot.git"
>  UBOOT_GIT_PROTOCOL = "git"
>  SRC_URI = "${UBOOT_GIT_URI};protocol=${UBOOT_GIT_PROTOCOL};branch=${BRANCH}"
>  
> diff --git a/recipes-bsp/uio-module-drv/uio-module-drv.inc b/recipes-bsp/uio-module-drv/uio-module-drv.inc
> index daae836f8d45..e91a611259b1 100644
> --- a/recipes-bsp/uio-module-drv/uio-module-drv.inc
> +++ b/recipes-bsp/uio-module-drv/uio-module-drv.inc
> @@ -7,7 +7,7 @@ UIO_MODULE_DRV_SRCREV = "78c535afe8f8cc0b715500a63eab0bc3606c0579"
>  
>  PV = "2.3.1.0+git${SRCPV}"
>  
> -UIO_MODULE_DRV_GIT_URI = "git://git.ti.com/keystone-linux/uio-module-drv.git"
> +UIO_MODULE_DRV_GIT_URI = "https://git.ti.com/git/keystone-linux/uio-module-drv.git"
>  UIO_MODULE_DRV_GIT_PROTOCOL = "git"
>  SRC_URI = "${UIO_MODULE_DRV_GIT_URI};protocol=${UIO_MODULE_DRV_GIT_PROTOCOL};branch=${BRANCH}"
>  
> diff --git a/recipes-bsp/vpe-tests/vpe-tests_git.bb b/recipes-bsp/vpe-tests/vpe-tests_git.bb
> index 92c425b1f155..3ed5b026541f 100644
> --- a/recipes-bsp/vpe-tests/vpe-tests_git.bb
> +++ b/recipes-bsp/vpe-tests/vpe-tests_git.bb
> @@ -14,7 +14,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
>  SRCREV = "e3d8db1aa935775f9d196ad7428e0cd9864a36ca"
>  BRANCH ?= "master"
>  
> -SRC_URI = "git://git.ti.com/vpe_tests/vpe_tests.git;protocol=git;branch=${BRANCH}"
> +SRC_URI = "https://git.ti.com/git/vpe_tests/vpe_tests.git;protocol=git;branch=${BRANCH}"
>  
>  S = "${WORKDIR}/git"
>  
> diff --git a/recipes-bsp/vps-lld/vps-lld-rtos_git.bb b/recipes-bsp/vps-lld/vps-lld-rtos_git.bb
> index e2834a63c671..76cd2b848c92 100644
> --- a/recipes-bsp/vps-lld/vps-lld-rtos_git.bb
> +++ b/recipes-bsp/vps-lld/vps-lld-rtos_git.bb
> @@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING.txt;beginline=1;endline=32;md5=4303d306ea53eb
>  COMPATIBLE_MACHINE = "omap-a15"
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
> -VPS_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/vps.git"
> +VPS_LLD_GIT_URI = "https://git.ti.com/git/keystone-rtos/vps.git"
>  VPS_LLD_GIT_PROTOCOL = "git"
>  VPS_LLD_GIT_BRANCH = "master"
>  VPS_LLD_GIT_DESTSUFFIX = "git/ti/drv/vps"
> diff --git a/recipes-bsp/wdtimer/wdtimer-rtos_git.bb b/recipes-bsp/wdtimer/wdtimer-rtos_git.bb
> index 59ebf31f9023..8785032cbbe6 100644
> --- a/recipes-bsp/wdtimer/wdtimer-rtos_git.bb
> +++ b/recipes-bsp/wdtimer/wdtimer-rtos_git.bb
> @@ -8,7 +8,7 @@ inherit ti-pdk
>  COMPATIBLE_MACHINE = "k2hk|k2e|k2l"
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
> -WATCHDOG_TIMER_GIT_URI = "git://git.ti.com/keystone-rtos/wdtimer.git"
> +WATCHDOG_TIMER_GIT_URI = "https://git.ti.com/git/keystone-rtos/wdtimer.git"
>  WATCHDOG_TIMER_GIT_PROTOCOL = "git"
>  WATCHDOG_TIMER_GIT_BRANCH = "master"
>  WATCHDOG_TIMER_GIT_DESTSUFFIX = "git/ti/instrumentation/wdtimer"
> diff --git a/recipes-bsp/wl18xx-fw/wl18xx-fw_8.9.0.0.86.bb b/recipes-bsp/wl18xx-fw/wl18xx-fw_8.9.0.0.86.bb
> index 50b6c2976725..e433dd0f667b 100644
> --- a/recipes-bsp/wl18xx-fw/wl18xx-fw_8.9.0.0.86.bb
> +++ b/recipes-bsp/wl18xx-fw/wl18xx-fw_8.9.0.0.86.bb
> @@ -3,7 +3,7 @@ LICENSE = "TI-TSPA"
>  LIC_FILES_CHKSUM = "file://LICENCE;md5=4977a0fe767ee17765ae63c435a32a9e"
>  
>  SRC_URI = " \
> -	git://git.ti.com/wilink8-wlan/wl18xx_fw.git;protocol=git;branch=${BRANCH} \
> +	https://git.ti.com/git/wilink8-wlan/wl18xx_fw.git;protocol=git;branch=${BRANCH} \
>  	file://0001-Add-Makefile-to-install-firmware-files.patch \
>  "
>  
> diff --git a/recipes-connectivity/uim/uim-sysfs_8.5.bb b/recipes-connectivity/uim/uim-sysfs_8.5.bb
> index 72e2166ffc83..f855d0799419 100644
> --- a/recipes-connectivity/uim/uim-sysfs_8.5.bb
> +++ b/recipes-connectivity/uim/uim-sysfs_8.5.bb
> @@ -8,7 +8,7 @@ INITSCRIPT_PARAMS = "defaults 03"
>  inherit update-rc.d
>  
>  SRCREV = "a75f45be2d5c74fc1dd913d08afc30f09a230aa9"
> -SRC_URI = "git://git.ti.com/ti-bt/uim.git"
> +SRC_URI = "https://git.ti.com/git/ti-bt/uim.git"
>  
>  S = "${WORKDIR}/git"
>  
> diff --git a/recipes-connectivity/wl18xx-calibrator/wl18xx-calibrator_8.7.3.bb b/recipes-connectivity/wl18xx-calibrator/wl18xx-calibrator_8.7.3.bb
> index 8a759ed8884b..71bed7294f5b 100644
> --- a/recipes-connectivity/wl18xx-calibrator/wl18xx-calibrator_8.7.3.bb
> +++ b/recipes-connectivity/wl18xx-calibrator/wl18xx-calibrator_8.7.3.bb
> @@ -7,7 +7,7 @@ RDEPENDS_${PN} = "wl18xx-fw"
>  
>  #Tag: R8.7_SP3 (8.7.3)
>  SRCREV = "5048b59a444ac59ba7171d6e122d5a84581aebf2"
> -SRC_URI = "git://git.ti.com/wilink8-wlan/18xx-ti-utils.git"
> +SRC_URI = "https://git.ti.com/git/wilink8-wlan/18xx-ti-utils.git"
>  
>  S = "${WORKDIR}/git"
>  
> diff --git a/recipes-connectivity/wl18xx-target-scripts/wl18xx-target-scripts_8.7.3.bb b/recipes-connectivity/wl18xx-target-scripts/wl18xx-target-scripts_8.7.3.bb
> index 6c4b2b43897f..64434cf20879 100644
> --- a/recipes-connectivity/wl18xx-target-scripts/wl18xx-target-scripts_8.7.3.bb
> +++ b/recipes-connectivity/wl18xx-target-scripts/wl18xx-target-scripts_8.7.3.bb
> @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://README;beginline=1;endline=21;md5=b8d6a0865f50159bf5c
>  # Tag: R8.7_SP3 (8.7.3)
>  SRCREV = "a07b6e711d2a70608101d3d6cdc5749c4d8a96d5"
>  BRANCH = "sitara-scripts"
> -SRC_URI = "git://git.ti.com/wilink8-wlan/wl18xx-target-scripts.git;protocol=git;branch=${BRANCH} \
> +SRC_URI = "https://git.ti.com/git/wilink8-wlan/wl18xx-target-scripts.git;protocol=git;branch=${BRANCH} \
>  file://0001-print_stat.sh-replace-system-bin-sh-with-bin-sh.patch \
>  "
>  
> diff --git a/recipes-connectivity/wlconf/wlconf_8.7.3.bb b/recipes-connectivity/wlconf/wlconf_8.7.3.bb
> index 19f28b757538..1fbf1d96c2d2 100644
> --- a/recipes-connectivity/wlconf/wlconf_8.7.3.bb
> +++ b/recipes-connectivity/wlconf/wlconf_8.7.3.bb
> @@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://README;beginline=1;endline=21;md5=adc05a1903d3f107f85
>  
>  # Tag: R8.7_SP3 (8.7.3)
>  SRCREV = "5048b59a444ac59ba7171d6e122d5a84581aebf2"
> -SRC_URI = "git://git.ti.com/wilink8-wlan/18xx-ti-utils.git"
> +SRC_URI = "https://git.ti.com/git/wilink8-wlan/18xx-ti-utils.git"
>  
>  S = "${WORKDIR}/git/wlconf"
>  
> diff --git a/recipes-devtools/gdbc6x/gdbc6x.inc b/recipes-devtools/gdbc6x/gdbc6x.inc
> index eeb18fb15dd3..f9608903c372 100644
> --- a/recipes-devtools/gdbc6x/gdbc6x.inc
> +++ b/recipes-devtools/gdbc6x/gdbc6x.inc
> @@ -4,6 +4,6 @@ SRCREV = "dd0c82fb5763a6b32dc6d68e561efb66ab8283d7"
>  PV = "1.1.0"
>  INC_PR = "r7"
>  
> -SRC_URI = "git://git.ti.com/sdo-emu/gdbc6x.git;protocol=git;branch=${BRANCH}"
> +SRC_URI = "https://git.ti.com/git/sdo-emu/gdbc6x.git;protocol=git;branch=${BRANCH}"
>  
>  BRANCH = "master"
> diff --git a/recipes-devtools/k3conf/k3conf_git.bb b/recipes-devtools/k3conf/k3conf_git.bb
> index 3f542da4aa96..59a069103a71 100644
> --- a/recipes-devtools/k3conf/k3conf_git.bb
> +++ b/recipes-devtools/k3conf/k3conf_git.bb
> @@ -10,7 +10,7 @@ COMPATIBLE_MACHINE = "k3"
>  BRANCH ?= "master"
>  SRCREV = "966a5695b73bc53039ca60d196b77de0640088d4"
>  
> -SRC_URI = "git://git.ti.com/k3conf/k3conf.git;protocol=git;branch=${BRANCH}"
> +SRC_URI = "https://git.ti.com/git/k3conf/k3conf.git;protocol=git;branch=${BRANCH}"
>  
>  S = "${WORKDIR}/git"
>  
> diff --git a/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb b/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb
> index 5575868230a1..690a98587288 100644
> --- a/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb
> +++ b/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb
> @@ -13,7 +13,7 @@ CLEANBROKEN = "1"
>  
>  BRANCH = "ti-${PV}"
>  
> -SRC_URI = "git://git.ti.com/graphics/ti-gc320-libs.git;protocol=git;branch=${BRANCH}"
> +SRC_URI = "https://git.ti.com/git/graphics/ti-gc320-libs.git;protocol=git;branch=${BRANCH}"
>  SRCREV = "c0afab259de59909cfe74c01f3f7fbaa147f94b5"
>  
>  RRECOMMENDS_${PN} = "ti-gc320-driver"
> diff --git a/recipes-graphics/libgles/ti-img-rogue-umlibs_1.15.6133109.bb b/recipes-graphics/libgles/ti-img-rogue-umlibs_1.15.6133109.bb
> index 1bfb2b93708f..344128485c30 100644
> --- a/recipes-graphics/libgles/ti-img-rogue-umlibs_1.15.6133109.bb
> +++ b/recipes-graphics/libgles/ti-img-rogue-umlibs_1.15.6133109.bb
> @@ -14,7 +14,7 @@ PR = "r2"
>  
>  BRANCH = "linuxws/dunfell/k5.10/${PV}_unified_fw_pagesize"
>  
> -SRC_URI = "git://git.ti.com/graphics/ti-img-rogue-umlibs.git;branch=${BRANCH}"
> +SRC_URI = "https://git.ti.com/git/graphics/ti-img-rogue-umlibs.git;branch=${BRANCH}"
>  SRCREV = "fba0c770b712640ab3761dbe8369d43f89f616ed"
>  
>  TARGET_PRODUCT_j7-evm = "j721e_linux"
> diff --git a/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb b/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
> index 319f226f361e..931981fe504c 100644
> --- a/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
> +++ b/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
> @@ -14,7 +14,7 @@ PR = "r37"
>  
>  BRANCH = "ti-img-sgx/dunfell/${PV}"
>  
> -SRC_URI = "git://git.ti.com/graphics/omap5-sgx-ddk-um-linux.git;protocol=git;branch=${BRANCH}"
> +SRC_URI = "https://git.ti.com/git/graphics/omap5-sgx-ddk-um-linux.git;protocol=git;branch=${BRANCH}"
>  SRCREV = "742cf38aba13e1ba1a910cf1f036a1a212c263b6"
>  
>  TARGET_PRODUCT_omap-a15 = "jacinto6evm"
> diff --git a/recipes-kernel/linux/linux-ti-mainline_git.bb b/recipes-kernel/linux/linux-ti-mainline_git.bb
> index 4a5034fd048c..bed0006fdb61 100644
> --- a/recipes-kernel/linux/linux-ti-mainline_git.bb
> +++ b/recipes-kernel/linux/linux-ti-mainline_git.bb
> @@ -32,7 +32,7 @@ KERNEL_GIT_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.g
>  KERNEL_GIT_PROTOCOL = "git"
>  SRC_URI += " \
>      ${KERNEL_GIT_URI};protocol=${KERNEL_GIT_PROTOCOL};branch=${BRANCH};name=linux \
> -    git://git.ti.com/ti-linux-kernel/ti-upstream-tools.git;branch=${TOOLS_BRANCH};protocol=${KERNEL_GIT_PROTOCOL};name=ti-upstream-tools;destsuffix=ti-upstream-tools \
> +    https://git.ti.com/git/ti-linux-kernel/ti-upstream-tools.git;branch=${TOOLS_BRANCH};protocol=${KERNEL_GIT_PROTOCOL};name=ti-upstream-tools;destsuffix=ti-upstream-tools \
>      file://defconfig \
>  "
>  
> diff --git a/recipes-kernel/linux/linux-ti-staging_5.10.bb b/recipes-kernel/linux/linux-ti-staging_5.10.bb
> index ef0b77d57eae..656ffb53d795 100644
> --- a/recipes-kernel/linux/linux-ti-staging_5.10.bb
> +++ b/recipes-kernel/linux/linux-ti-staging_5.10.bb
> @@ -32,7 +32,7 @@ PV = "5.10.109+git${SRCPV}"
>  MACHINE_KERNEL_PR_append = "b"
>  PR = "${MACHINE_KERNEL_PR}"
>  
> -KERNEL_GIT_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git"
> +KERNEL_GIT_URI = "https://git.ti.com/git/ti-linux-kernel/ti-linux-kernel.git"
>  KERNEL_GIT_PROTOCOL = "git"
>  SRC_URI += "${KERNEL_GIT_URI};protocol=${KERNEL_GIT_PROTOCOL};branch=${BRANCH} \
>              file://defconfig"
> diff --git a/recipes-kernel/linux/linux-ti-staging_5.4.bb b/recipes-kernel/linux/linux-ti-staging_5.4.bb
> index a86223affb5a..d68855228d5b 100644
> --- a/recipes-kernel/linux/linux-ti-staging_5.4.bb
> +++ b/recipes-kernel/linux/linux-ti-staging_5.4.bb
> @@ -28,7 +28,7 @@ PV = "5.4.106+git${SRCPV}"
>  MACHINE_KERNEL_PR_append = "a"
>  PR = "${MACHINE_KERNEL_PR}"
>  
> -KERNEL_GIT_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git"
> +KERNEL_GIT_URI = "https://git.ti.com/git/ti-linux-kernel/ti-linux-kernel.git"
>  KERNEL_GIT_PROTOCOL = "git"
>  SRC_URI += "${KERNEL_GIT_URI};protocol=${KERNEL_GIT_PROTOCOL};branch=${BRANCH} \
>              file://defconfig"
> diff --git a/recipes-ti/ctoolslib/libaet_git.bb b/recipes-ti/ctoolslib/libaet_git.bb
> index 626ba9260029..89f925b3c960 100644
> --- a/recipes-ti/ctoolslib/libaet_git.bb
> +++ b/recipes-ti/ctoolslib/libaet_git.bb
> @@ -7,7 +7,7 @@ PV = "4.19.0.0"
>  
>  LIC_FILES_CHKSUM = "file://../ctoolslib_manifest.html;md5=b7dd369a2e07ef9a71795ee5a9bd01bd"
>  
> -SRC_URI = "git://git.ti.com/sdo-emu/ctoolslib.git;protocol=git;branch=opencl_aetlib_build"
> +SRC_URI = "https://git.ti.com/git/sdo-emu/ctoolslib.git;protocol=git;branch=opencl_aetlib_build"
>  SRCREV = "de7954abab0f0caa8a2c7b53095c30226d901a31"
>  
>  DEPENDS = "ti-cgt6x-native"
> diff --git a/recipes-ti/dsplib/dsplib.inc b/recipes-ti/dsplib/dsplib.inc
> index 111d83cb7539..179f1f6fbe8a 100644
> --- a/recipes-ti/dsplib/dsplib.inc
> +++ b/recipes-ti/dsplib/dsplib.inc
> @@ -18,7 +18,7 @@ S = "${WORKDIR}/git"
>  
>  DSPLIB_GIT_BRANCH = "master"
>  DSPLIB_GIT_PROTOCOL = "git"
> -DSPLIB_GIT_URI = "git://git.ti.com/ep-processor-libraries/dsplib.git"
> +DSPLIB_GIT_URI = "https://git.ti.com/git/ep-processor-libraries/dsplib.git"
>  DSPLIB_SRCREV = "0390b171042c602e07669fd28a371cc319b90161"
>  
>  SRC_URI = "${DSPLIB_GIT_URI};protocol=${DSPLIB_GIT_PROTOCOL};branch=${DSPLIB_GIT_BRANCH}"
> diff --git a/recipes-ti/ipc/ipc-transport.inc b/recipes-ti/ipc/ipc-transport.inc
> index 0c1edef155ad..12d3b9892cb6 100644
> --- a/recipes-ti/ipc/ipc-transport.inc
> +++ b/recipes-ti/ipc/ipc-transport.inc
> @@ -1,6 +1,6 @@
>  LICENSE = "BSD-3-Clause"
>  
> -IPC_TRANSPORT_GIT_URI = "git://git.ti.com/keystone-linux/ipc-transport.git"
> +IPC_TRANSPORT_GIT_URI = "https://git.ti.com/git/keystone-linux/ipc-transport.git"
>  IPC_TRANSPORT_GIT_PROTOCOL = "git"
>  IPC_TRANSPORT_GIT_BRANCH = "master"
>  
> diff --git a/recipes-ti/ipc/ti-ipc-rtos.inc b/recipes-ti/ipc/ti-ipc-rtos.inc
> index b6b7892f0879..7222aa09d75b 100644
> --- a/recipes-ti/ipc/ti-ipc-rtos.inc
> +++ b/recipes-ti/ipc/ti-ipc-rtos.inc
> @@ -1,6 +1,6 @@
>  require recipes-ti/includes/ti-paths.inc
>  
> -TI_IPC_EXAMPLES_GIT_URI = "git://git.ti.com/ipc/ipc-examples.git"
> +TI_IPC_EXAMPLES_GIT_URI = "https://git.ti.com/git/ipc/ipc-examples.git"
>  TI_IPC_EXAMPLES_DEST_SUFFIX = "git/ipc-examples"
>  TI_IPC_EXAMPLES_GIT_PROTOCOL = "git"
>  TI_IPC_EXAMPLES_GIT_BRANCH = "master"
> @@ -12,7 +12,7 @@ protocol=${TI_IPC_EXAMPLES_GIT_PROTOCOL};\
>  branch=${TI_IPC_EXAMPLES_GIT_BRANCH};\
>  name=${TI_IPC_EXAMPLES_NAME}"
>  
> -TI_IPC_METADATA_GIT_URI = "git://git.ti.com/ipc/ipc-metadata.git"
> +TI_IPC_METADATA_GIT_URI = "https://git.ti.com/git/ipc/ipc-metadata.git"
>  TI_IPC_METADATA_DEST_SUFFIX = "git/ipc-metadata"
>  TI_IPC_METADATA_GIT_PROTOCOL = "git"
>  TI_IPC_METADATA_GIT_BRANCH = "master"
> diff --git a/recipes-ti/ipc/ti-ipc.inc b/recipes-ti/ipc/ti-ipc.inc
> index 3b0115ebfb33..f18029153151 100644
> --- a/recipes-ti/ipc/ti-ipc.inc
> +++ b/recipes-ti/ipc/ti-ipc.inc
> @@ -4,7 +4,7 @@ HOMEPAGE="http://processors.wiki.ti.com/index.php/Category:IPC"
>  LICENSE = "BSD"
>  LIC_FILES_CHKSUM = "file://${S}/ipc-linux.mak;beginline=1;endline=30;md5=7b327f9b710fd7c95e545b91cec79255"
>  
> -TI_IPC_GIT_URI = "git://git.ti.com/ipc/ipcdev.git"
> +TI_IPC_GIT_URI = "https://git.ti.com/git/ipc/ipcdev.git"
>  TI_IPC_GIT_PROTOCOL = "git"
>  TI_IPC_GIT_BRANCH = "master"
>  
> diff --git a/recipes-ti/ipc/ti-rpmsg-char.inc b/recipes-ti/ipc/ti-rpmsg-char.inc
> index b499647a9107..cdf4692ba6cd 100644
> --- a/recipes-ti/ipc/ti-rpmsg-char.inc
> +++ b/recipes-ti/ipc/ti-rpmsg-char.inc
> @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://${S}/src/rpmsg_char.c;beginline=1;endline=31;md5=7198
>  
>  PROTOCOL = "git"
>  BRANCH = "master"
> -SRC_URI = "git://git.ti.com/rpmsg/ti-rpmsg-char.git;protocol=${PROTOCOL};branch=${BRANCH};"
> +SRC_URI = "https://git.ti.com/git/rpmsg/ti-rpmsg-char.git;protocol=${PROTOCOL};branch=${BRANCH};"
>  
>  # Initial 0.4.1 release
>  SRCREV = "355d2b0bcde5eb5c895a270d1835102d2bc39fbd"
> diff --git a/recipes-ti/mathlib/mathlib.inc b/recipes-ti/mathlib/mathlib.inc
> index cfc5409f6b72..05da469bb20e 100644
> --- a/recipes-ti/mathlib/mathlib.inc
> +++ b/recipes-ti/mathlib/mathlib.inc
> @@ -18,7 +18,7 @@ S = "${WORKDIR}/git"
>  
>  MATHLIB_GIT_BRANCH = "master"
>  MATHLIB_GIT_PROTOCOL = "git"
> -MATHLIB_GIT_URI = "git://git.ti.com/ep-processor-libraries/mathlib.git"
> +MATHLIB_GIT_URI = "https://git.ti.com/git/ep-processor-libraries/mathlib.git"
>  MATHLIB_SRCREV = "eadcc9547faf69789661b004bb0b5ef53bb69951"
>  
>  SRC_URI = "${MATHLIB_GIT_URI};protocol=${MATHLIB_GIT_PROTOCOL};branch=${MATHLIB_GIT_BRANCH}"
> diff --git a/recipes-ti/mpm-transport/mpm-transport_git.bb b/recipes-ti/mpm-transport/mpm-transport_git.bb
> index 3c28f28cf73c..1ff33c604303 100644
> --- a/recipes-ti/mpm-transport/mpm-transport_git.bb
> +++ b/recipes-ti/mpm-transport/mpm-transport_git.bb
> @@ -10,7 +10,7 @@ DEPENDS_append_k2e = " hyplnk-lld"
>  
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
> -SRC_URI = "git://git.ti.com/keystone-linux/mpm-transport.git;protocol=git;branch=${BRANCH}"
> +SRC_URI = "https://git.ti.com/git/keystone-linux/mpm-transport.git;protocol=git;branch=${BRANCH}"
>  
>  BRANCH = "master"
>  # This commit corresponds to tag DEV.MPM-TRANSPORT-02.00.04.00
> diff --git a/recipes-ti/multiprocmgr/multiprocmgr.inc b/recipes-ti/multiprocmgr/multiprocmgr.inc
> index 64fb6f6fbdd2..e2eaa0bf0522 100644
> --- a/recipes-ti/multiprocmgr/multiprocmgr.inc
> +++ b/recipes-ti/multiprocmgr/multiprocmgr.inc
> @@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=fce208c498eb9669223724dc9c1d8fe4"
>  SECTION = "console"
>  COMPATIBLE_MACHINE = "keystone"
>  
> -MULTIPROCMGR_GIT_URI = "git://git.ti.com/keystone-linux/multi-proc-manager.git"
> +MULTIPROCMGR_GIT_URI = "https://git.ti.com/git/keystone-linux/multi-proc-manager.git"
>  MULTIPROCMGR_GIT_PROTOCOL = "git"
>  MULTIPROCMGR_GIT_BRANCH = "master"
>  
> diff --git a/recipes-ti/openmp-rtos/openmp-rtos_git.bb b/recipes-ti/openmp-rtos/openmp-rtos_git.bb
> index 0c93f3540e8e..ad3cfba8025a 100644
> --- a/recipes-ti/openmp-rtos/openmp-rtos_git.bb
> +++ b/recipes-ti/openmp-rtos/openmp-rtos_git.bb
> @@ -1,5 +1,5 @@
>  DESCRIPTION = "TI OpenMP RTOS"
> -HOMEPAGE = "git://git.ti.com/openmp/ti-openmp-dsp-runtime.git"
> +HOMEPAGE = "https://git.ti.com/git/openmp/ti-openmp-dsp-runtime.git"
>  LICENSE = "BSD"
>  
>  require recipes-ti/includes/ti-paths.inc
> @@ -12,7 +12,7 @@ REQUIRED_DISTRO_FEATURES = "openmp"
>  PV = "2_06_03_00"
>  PR = "r0"
>  
> -OPENMP_RTOS_GIT_URI = "git://git.ti.com/openmp/ti-openmp-dsp-runtime.git"
> +OPENMP_RTOS_GIT_URI = "https://git.ti.com/git/openmp/ti-openmp-dsp-runtime.git"
>  OPENMP_RTOS_GIT_PROTOCOL = "git"
>  OPENMP_RTOS_GIT_BRANCH = "master"
>  
> diff --git a/recipes-ti/swtools/swtools_git.bb b/recipes-ti/swtools/swtools_git.bb
> index 497c0e0d367c..0bf367cb1b41 100644
> --- a/recipes-ti/swtools/swtools_git.bb
> +++ b/recipes-ti/swtools/swtools_git.bb
> @@ -16,7 +16,7 @@ S = "${WORKDIR}/git"
>  
>  SWTOOLS_GIT_BRANCH = "master"
>  SWTOOLS_GIT_PROTOCOL = "git"
> -SWTOOLS_GIT_URI = "git://git.ti.com/ep-processor-libraries/swtools.git"
> +SWTOOLS_GIT_URI = "https://git.ti.com/git/ep-processor-libraries/swtools.git"
>  SWTOOLS_SRCREV = "7d1c85e686b1466cd2d535fc9cac5baf1aae24a4"
>  
>  SRC_URI = "${SWTOOLS_GIT_URI};protocol=${SWTOOLS_GIT_PROTOCOL};branch=${SWTOOLS_GIT_BRANCH}"
> diff --git a/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb b/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb
> index e435676fb93b..6f7f1488aef5 100644
> --- a/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb
> +++ b/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb
> @@ -16,7 +16,7 @@ PLAT_SFX_am65xx = "/am65xx"
>  PLAT_SFX_am64xx = "/am64x"
>  
>  # Use weak assignment to set defaults to TI_RTOS_METADATA_* variables
> -TI_RTOS_METADATA_URI ?= "git://git.ti.com/processor-sdk/coresdk_rtos_releases.git"
> +TI_RTOS_METADATA_URI ?= "https://git.ti.com/git/processor-sdk/coresdk_rtos_releases.git"
>  TI_RTOS_METADATA_PROTOCOL ?= "git"
>  TI_RTOS_METADATA_SRCREV ?= "2ecbf45af64bc47806623cc5bf7ab493489acaf9"
>  TI_RTOS_METADATA_BRANCH ?= "master"
> diff --git a/recipes-ti/udma/udma_git.bb b/recipes-ti/udma/udma_git.bb
> index c905fa58c505..2a32fa49be8e 100644
> --- a/recipes-ti/udma/udma_git.bb
> +++ b/recipes-ti/udma/udma_git.bb
> @@ -5,7 +5,7 @@ COMPATIBLE_MACHINE = "keystone"
>  LIC_FILES_CHKSUM = "file://include/udma.h;startline=1;endline=39;md5=ba3c7f91f970afe073b759ced61d0f27"
>  
>  BRANCH = "master"
> -SRC_URI = "git://git.ti.com/keystone-linux/udma.git;protocol=git;branch=${BRANCH}"
> +SRC_URI = "https://git.ti.com/git/keystone-linux/udma.git;protocol=git;branch=${BRANCH}"
>  S = "${WORKDIR}/git"
>  # Commit corresponds to UDMA.01.00.00.00
>  SRCREV = "53d09fb0bc98c41c5eb43623097e363c497d6fd8"
> diff --git a/recipes-ti/uio-test-pruss/uio-test-pruss_git.bb b/recipes-ti/uio-test-pruss/uio-test-pruss_git.bb
> index cbae1b11c75f..f73788c18c35 100644
> --- a/recipes-ti/uio-test-pruss/uio-test-pruss_git.bb
> +++ b/recipes-ti/uio-test-pruss/uio-test-pruss_git.bb
> @@ -10,7 +10,7 @@ DEPENDS = "ti-cgt-pru-native"
>  BRANCH = "master"
>  LIC_FILES_CHKSUM = "file://Makefile;startline=1;endline=31;md5=0ee4f2c42eb6b04e37859bb55a18b144"
>  
> -UIO_TEST_PRUSS_GIT_URI = "git://git.ti.com/processor-sdk/uio-test-pruss.git"
> +UIO_TEST_PRUSS_GIT_URI = "https://git.ti.com/git/processor-sdk/uio-test-pruss.git"
>  UIO_TEST_PRUSS_GIT_PROTOCOL = "git"
>  SRC_URI = "${UIO_TEST_PRUSS_GIT_URI};protocol=${UIO_TEST_PRUSS_GIT_PROTOCOL};branch=${BRANCH}"
>  
> -- 
> 2.31.1
> 

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964

