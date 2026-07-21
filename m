Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F933C4452B
	for <webhook@archiver.kernel.org>; Tue, 21 Jul 2026 18:59:20 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31048.1784660357396302032
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 21 Jul 2026 11:59:18 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 61B7B40CB1;
	Tue, 21 Jul 2026 18:59:16 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k-G0uDTvnZHK; Tue, 21 Jul 2026 18:59:16 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id EEA0340BD6;
	Tue, 21 Jul 2026 18:59:12 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 2753C1769F1; Tue, 21 Jul 2026 14:59:12 -0400 (EDT)
Date: Tue, 21 Jul 2026 14:59:12 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master][PATCH] recipes: Convert to SPDX license
 strings
Message-ID: <20260721185912.GP10186@denix.org>
References: <20260721185343.3006427-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721185343.3006427-1-reatmon@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 21 Jul 2026 18:59:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20180

Heh, have almost the same changes testing here, but my build hasn't finished 
yet.

Also, there are couple of manual changes and removal of very old recipes with 
obviously incorrect licenses - the series I just submitted earlier...


On Tue, Jul 21, 2026 at 01:53:43PM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
> Converts all LICENSE strings to SPDX licenses expressions
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>  meta-ti-bsp/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb  | 2 +-
>  meta-ti-bsp/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb         | 2 +-
>  meta-ti-bsp/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb      | 2 +-
>  .../recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb      | 2 +-
>  .../powervr-drivers/ti-img-rogue-driver_25.3.6908880.bb         | 2 +-
>  .../powervr-drivers/ti-img-rogue-driver_26.1.6967606.bb         | 2 +-
>  .../recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb   | 2 +-
>  meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb                    | 2 +-
>  meta-ti-bsp/recipes-bsp/ti-eth-fw/ti-eth-fw.bb                  | 2 +-
>  meta-ti-bsp/recipes-bsp/ti-img-encode-decode/vxd-dec-fw_git.bb  | 2 +-
>  meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc             | 2 +-
>  meta-ti-bsp/recipes-bsp/ti-pka-fw/ti-pka-fw_git.bb              | 2 +-
>  meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-rtos-echo-test-fw.bb      | 2 +-
>  .../recipes-bsp/ti-rtos-fw/ti-rtos-messageq-test-fw_git.bb      | 2 +-
>  meta-ti-bsp/recipes-bsp/vis-fw/vis_01.50.07.15.bb               | 2 +-
>  meta-ti-bsp/recipes-bsp/vpdma-fw/vpdma-fw_03-2012.bb            | 2 +-
>  meta-ti-bsp/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb  | 2 +-
>  .../powervr-umlibs/ti-img-rogue-umlibs_25.3.6908880.bb          | 2 +-
>  .../powervr-umlibs/ti-img-rogue-umlibs_26.1.6967606.bb          | 2 +-
>  .../powervr-umlibs/ti-sgx-ddk-um_1.17.4948957.bb                | 2 +-
>  meta-ti-bsp/recipes-ti/ti-librpmsg-dma/ti-librpmsg-dma_1.0.bb   | 2 +-
>  meta-ti-extras/recipes-bsp/bt-fw/bt-fw_git.bb                   | 2 +-
>  meta-ti-extras/recipes-bsp/cc33xx-fw/cc33xx-fw_git.bb           | 2 +-
>  meta-ti-extras/recipes-bsp/ipumm-fw/ipumm-fw_git.bb             | 2 +-
>  meta-ti-extras/recipes-bsp/pru/pru-icss_git.bb                  | 2 +-
>  meta-ti-extras/recipes-bsp/wl18xx-fw/wl18xx-fw_8.9.0.0.86.bb    | 2 +-
>  .../recipes-ti/beagleboard/beaglebone-getting-started.bb        | 2 +-
>  .../recipes-ti/devtools/gcc-arm-baremetal_7-2018-q2-update.bb   | 2 +-
>  meta-ti-extras/recipes-ti/devtools/ti-cgt-arm_18.12.5.bb        | 2 +-
>  meta-ti-extras/recipes-ti/devtools/ti-cgt-pru_2.3.3.bb          | 2 +-
>  meta-ti-extras/recipes-ti/devtools/ti-cgt470.inc                | 2 +-
>  meta-ti-extras/recipes-ti/devtools/ti-cgt6x-7_7.4.16.bb         | 2 +-
>  meta-ti-extras/recipes-ti/devtools/ti-cgt6x_8.3.2.bb            | 2 +-
>  meta-ti-extras/recipes-ti/devtools/ti-cgt7x_1.2.0.bb            | 2 +-
>  meta-ti-extras/recipes-ti/devtools/ti-xdctools_3.55.02.22.bb    | 2 +-
>  meta-ti-extras/recipes-ti/jailhouse/ti-jailhouse.inc            | 2 +-
>  meta-ti-extras/recipes-ti/vlib/vlib-c66x.inc                    | 2 +-
>  .../{Stream_Benchmark_License => Stream-Benchmark-License}      | 0
>  meta-ti-test/recipes-benchmark/stream/stream_5.10.bb            | 2 +-
>  meta-ti-test/recipes-connectivity/openntpd/openntpd_6.8p1.bb    | 2 +-
>  meta-ti-test/recipes-devtools/ltp-ddt/ltp_20260130.inc          | 2 +-
>  meta-ti-test/recipes-devtools/omapconf/omapconf_git.bb          | 2 +-
>  .../recipes-kernel/hwspinlocktest/hwspinlocktest_0.1.bb         | 2 +-
>  meta-ti-test/recipes-support/xdp-tools/xdp-tools-ti_1.6.1.bb    | 2 +-
>  44 files changed, 43 insertions(+), 43 deletions(-)
>  rename meta-ti-test/licenses/{Stream_Benchmark_License => Stream-Benchmark-License} (100%)
> 
> diff --git a/meta-ti-bsp/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb b/meta-ti-bsp/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb
> index b25e04d2..023eb914 100644
> --- a/meta-ti-bsp/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb
> +++ b/meta-ti-bsp/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb
> @@ -2,7 +2,7 @@ SUMMARY = "Cadence MHDP DP bridge firmware"
>  
>  require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
>  
> -LICENSE = "BSD-3-Clause | Apache-2.0"
> +LICENSE = "Apache-2.0 OR BSD-3-Clause"
>  LIC_FILES_CHKSUM = "file://LICENSES/LICENCE.cadence;md5=009f46816f6956cfb75ede13d3e1cee0"
>  
>  PV = "${CADENCE_MHDP_FW_VERSION}"
> diff --git a/meta-ti-bsp/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb b/meta-ti-bsp/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb
> index db080c62..ce0ab176 100644
> --- a/meta-ti-bsp/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb
> +++ b/meta-ti-bsp/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb
> @@ -1,6 +1,6 @@
>  SUMMARY = "Cortex-M3 binary blob for suspend-resume"
>  
> -LICENSE = "TI-TSPA"
> +LICENSE = "LicenseRef-TI-TSPA"
>  LIC_FILES_CHKSUM = "file://License.txt;md5=7bdc54a749ab7a7dea999d25d99a41b8"
>  
>  PV = "1.9.2"
> diff --git a/meta-ti-bsp/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb b/meta-ti-bsp/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb
> index 4e379c5d..272b850b 100755
> --- a/meta-ti-bsp/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb
> +++ b/meta-ti-bsp/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb
> @@ -1,6 +1,6 @@
>  SUMMARY = "R5 PSDK CPSW9G Ethernet Switch Firmware"
>  
> -LICENSE = "TI-TFL"
> +LICENSE = "LicenseRef-TI-TFL"
>  LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=04ad0a015d4bb63c2b9e7b112debf3db"
>  
>  PV = "6.2+git"
> diff --git a/meta-ti-bsp/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb b/meta-ti-bsp/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
> index 336f4ce4..ab0df0a5 100644
> --- a/meta-ti-bsp/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
> +++ b/meta-ti-bsp/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
> @@ -1,6 +1,6 @@
>  SUMMARY = "Kernel drivers for the Vivante GC320 chipset found in TI SoCs"
>  HOMEPAGE = "https://git.ti.com/graphics/ti-gc320-driver"
> -LICENSE = "MIT | GPL-2.0-only"
> +LICENSE = "GPL-2.0-only OR MIT"
>  LIC_FILES_CHKSUM = "file://../LICENSE;md5=78d9818a51b9a8e9bb89dea418bac297"
>  
>  inherit module features_check
> diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_25.3.6908880.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_25.3.6908880.bb
> index 190417ca..a095fcf9 100644
> --- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_25.3.6908880.bb
> +++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_25.3.6908880.bb
> @@ -1,6 +1,6 @@
>  SUMMARY =  "Kernel drivers for the PowerVR Rogue GPU found in the TI SoCs"
>  HOMEPAGE = "http://git.ti.com/graphics/ti-img-rogue-driver"
> -LICENSE = "MIT | GPL-2.0-only"
> +LICENSE = "GPL-2.0-only OR MIT"
>  LIC_FILES_CHKSUM = "file://README;beginline=14;endline=19;md5=0403c7dea01a2b8232261e805325fac2"
>  
>  inherit module
> diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_26.1.6967606.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_26.1.6967606.bb
> index 876c3e50..3731cec6 100644
> --- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_26.1.6967606.bb
> +++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_26.1.6967606.bb
> @@ -1,6 +1,6 @@
>  SUMMARY =  "Kernel drivers for the PowerVR Rogue GPU found in the TI SoCs"
>  HOMEPAGE = "http://git.ti.com/graphics/ti-img-rogue-driver"
> -LICENSE = "MIT | GPL-2.0-only"
> +LICENSE = "GPL-2.0-only OR MIT"
>  LIC_FILES_CHKSUM = "file://README;beginline=14;endline=19;md5=0403c7dea01a2b8232261e805325fac2"
>  
>  inherit module
> diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
> index 343f09de..e858d608 100644
> --- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
> +++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
> @@ -1,6 +1,6 @@
>  SUMMARY =  "Kernel drivers for the PowerVR SGX chipset found in the TI SoCs"
>  HOMEPAGE = "https://git.ti.com/graphics/omap5-sgx-ddk-linux"
> -LICENSE = "MIT | GPL-2.0-only"
> +LICENSE = "GPL-2.0-only OR MIT"
>  LIC_FILES_CHKSUM = "file://GPL-COPYING;md5=60422928ba677faaa13d6ab5f5baaa1e"
>  
>  inherit module
> diff --git a/meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb b/meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb
> index 2d9ad499..92671833 100644
> --- a/meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb
> +++ b/meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb
> @@ -1,6 +1,6 @@
>  SUMMARY = "TI DM prebuilt binary firmware images"
>  
> -LICENSE = "TI-TFL"
> +LICENSE = "LicenseRef-TI-TFL"
>  LIC_FILES_CHKSUM = "file://${THISDIR}/../../licenses/TI-TFL;md5=a1b59cb7ba626b9dbbcbf00f3fbc438a"
>  
>  COMPATIBLE_MACHINE = "k3"
> diff --git a/meta-ti-bsp/recipes-bsp/ti-eth-fw/ti-eth-fw.bb b/meta-ti-bsp/recipes-bsp/ti-eth-fw/ti-eth-fw.bb
> index 04e43609..a985188c 100644
> --- a/meta-ti-bsp/recipes-bsp/ti-eth-fw/ti-eth-fw.bb
> +++ b/meta-ti-bsp/recipes-bsp/ti-eth-fw/ti-eth-fw.bb
> @@ -1,6 +1,6 @@
>  SUMMARY = "TI Ethernet prebuilt binary firmware images"
>  
> -LICENSE = "TI-TFL"
> +LICENSE = "LicenseRef-TI-TFL"
>  LIC_FILES_CHKSUM = "file://${THISDIR}/../../licenses/TI-TFL;md5=a1b59cb7ba626b9dbbcbf00f3fbc438a"
>  
>  COMPATIBLE_MACHINE = "j721e|j7200|j784s4"
> diff --git a/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/vxd-dec-fw_git.bb b/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/vxd-dec-fw_git.bb
> index 74729c16..ebd3d868 100644
> --- a/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/vxd-dec-fw_git.bb
> +++ b/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/vxd-dec-fw_git.bb
> @@ -1,5 +1,5 @@
>  SUMMARY = "Video Decoding Firmware"
> -LICENSE = "TI-IMG"
> +LICENSE = "LicenseRef-TI-IMG"
>  LIC_FILES_CHKSUM = "file://LICENSE.ti-img;md5=84ca7278930db001870686ad997d6bb1"
>  
>  require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
> diff --git a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
> index 982a3512..cfb8ac0d 100644
> --- a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
> +++ b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
> @@ -1,6 +1,6 @@
>  SUMMARY = "Common include for TI Linux firmware"
>  
> -LICENSE = "TI-TFL"
> +LICENSE = "LicenseRef-TI-TFL"
>  LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=b5aebf0668bdf95621259288c4a46d76"
>  
>  PV = "2022.01"
> diff --git a/meta-ti-bsp/recipes-bsp/ti-pka-fw/ti-pka-fw_git.bb b/meta-ti-bsp/recipes-bsp/ti-pka-fw/ti-pka-fw_git.bb
> index c3d2bce4..5b022edd 100644
> --- a/meta-ti-bsp/recipes-bsp/ti-pka-fw/ti-pka-fw_git.bb
> +++ b/meta-ti-bsp/recipes-bsp/ti-pka-fw/ti-pka-fw_git.bb
> @@ -1,6 +1,6 @@
>  SUMMARY = "PKA prebuilt binary firmware image"
>  
> -LICENSE = "TI-TFL & INSIDE-Secure"
> +LICENSE = "LicenseRef-INSIDE-Secure AND LicenseRef-TI-TFL"
>  LIC_FILES_CHKSUM = "file://LICENCE.pka_fw;md5=dc20391b287874f0dce069cf87917206"
>  
>  COMPATIBLE_MACHINE = "k3"
> diff --git a/meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-rtos-echo-test-fw.bb b/meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-rtos-echo-test-fw.bb
> index 20c6b531..d5353e82 100644
> --- a/meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-rtos-echo-test-fw.bb
> +++ b/meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-rtos-echo-test-fw.bb
> @@ -1,6 +1,6 @@
>  SUMMARY = "TI Echo Test prebuilt binary firmware images"
>  
> -LICENSE = "TI-TFL"
> +LICENSE = "LicenseRef-TI-TFL"
>  LIC_FILES_CHKSUM = "file://${THISDIR}/../../licenses/TI-TFL;md5=a1b59cb7ba626b9dbbcbf00f3fbc438a"
>  
>  COMPATIBLE_MACHINE = "k3"
> diff --git a/meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-rtos-messageq-test-fw_git.bb b/meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-rtos-messageq-test-fw_git.bb
> index 980fe5cc..26a2f665 100644
> --- a/meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-rtos-messageq-test-fw_git.bb
> +++ b/meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-rtos-messageq-test-fw_git.bb
> @@ -1,6 +1,6 @@
>  SUMMARY = "TI MessageQ prebuilt binary firmware images"
>  
> -LICENSE = "TI-TFL"
> +LICENSE = "LicenseRef-TI-TFL"
>  LIC_FILES_CHKSUM = "file://${THISDIR}/../../licenses/TI-TFL;md5=a1b59cb7ba626b9dbbcbf00f3fbc438a"
>  
>  COMPATIBLE_MACHINE = "am57xx"
> diff --git a/meta-ti-bsp/recipes-bsp/vis-fw/vis_01.50.07.15.bb b/meta-ti-bsp/recipes-bsp/vis-fw/vis_01.50.07.15.bb
> index 1b1cff6b..b088f589 100644
> --- a/meta-ti-bsp/recipes-bsp/vis-fw/vis_01.50.07.15.bb
> +++ b/meta-ti-bsp/recipes-bsp/vis-fw/vis_01.50.07.15.bb
> @@ -1,5 +1,5 @@
>  SUMMARY = "Radio Application Firmware"
> -LICENSE = "TI-TSPA"
> +LICENSE = "LicenseRef-TI-TSPA"
>  LIC_FILES_CHKSUM = "file://${S}/J6_VIS_DEMO_LINUX_BINARY_01.50.07.15-Manifest.html;md5=a59aa54b9470f555cf086b91dca0afa3"
>  
>  COMPATIBLE_MACHINE = "am57xx"
> diff --git a/meta-ti-bsp/recipes-bsp/vpdma-fw/vpdma-fw_03-2012.bb b/meta-ti-bsp/recipes-bsp/vpdma-fw/vpdma-fw_03-2012.bb
> index 4c2ea375..6958c603 100644
> --- a/meta-ti-bsp/recipes-bsp/vpdma-fw/vpdma-fw_03-2012.bb
> +++ b/meta-ti-bsp/recipes-bsp/vpdma-fw/vpdma-fw_03-2012.bb
> @@ -1,6 +1,6 @@
>  SUMMARY = "VPDMA firmware for Video Input Port and Video Processing Engine"
>  
> -LICENSE = "TI-TSPA"
> +LICENSE = "LicenseRef-TI-TSPA"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=fd463c9500441ed91d07a0331baa635c"
>  
>  COMPATIBLE_MACHINE = "am57xx"
> diff --git a/meta-ti-bsp/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb b/meta-ti-bsp/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb
> index 86aa71b8..563f72eb 100644
> --- a/meta-ti-bsp/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb
> +++ b/meta-ti-bsp/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb
> @@ -1,6 +1,6 @@
>  SUMMARY = "Userspace libraries for GC320 chipset on TI SoCs"
>  HOMEPAGE = "https://git.ti.com/graphics/ti-gc320-libs"
> -LICENSE = "TI-TSPA"
> +LICENSE = "LicenseRef-TI-TSPA"
>  LIC_FILES_CHKSUM = "file://Manifest.html;md5=a9121e8936ace09820d23f7626daaca5"
>  
>  inherit features_check
> diff --git a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_25.3.6908880.bb b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_25.3.6908880.bb
> index fad29691..f5f01633 100644
> --- a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_25.3.6908880.bb
> +++ b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_25.3.6908880.bb
> @@ -1,6 +1,6 @@
>  SUMMARY = "Userspace libraries for PowerVR Rogue GPU on TI SoCs"
>  HOMEPAGE = "http://git.ti.com/graphics/ti-img-rogue-umlibs"
> -LICENSE = "TI-TFL"
> +LICENSE = "LicenseRef-TI-TFL"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=7232b98c1c58f99e3baa03de5207e76f"
>  
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
> diff --git a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_26.1.6967606.bb b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_26.1.6967606.bb
> index 29c5154f..a3c3c08a 100644
> --- a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_26.1.6967606.bb
> +++ b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_26.1.6967606.bb
> @@ -1,6 +1,6 @@
>  SUMMARY = "Userspace libraries for PowerVR Rogue GPU on TI SoCs"
>  HOMEPAGE = "http://git.ti.com/graphics/ti-img-rogue-umlibs"
> -LICENSE = "TI-TFL"
> +LICENSE = "LicenseRef-TI-TFL"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=7232b98c1c58f99e3baa03de5207e76f"
>  
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
> diff --git a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-sgx-ddk-um_1.17.4948957.bb b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-sgx-ddk-um_1.17.4948957.bb
> index c4cc5f10..44c2a2c5 100644
> --- a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-sgx-ddk-um_1.17.4948957.bb
> +++ b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-sgx-ddk-um_1.17.4948957.bb
> @@ -1,6 +1,6 @@
>  SUMMARY = "Userspace libraries for PowerVR SGX chipset on TI SoCs"
>  HOMEPAGE = "https://git.ti.com/graphics/omap5-sgx-ddk-um-linux"
> -LICENSE = "TI-TSPA"
> +LICENSE = "LicenseRef-TI-TSPA"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=7232b98c1c58f99e3baa03de5207e76f"
>  
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
> diff --git a/meta-ti-bsp/recipes-ti/ti-librpmsg-dma/ti-librpmsg-dma_1.0.bb b/meta-ti-bsp/recipes-ti/ti-librpmsg-dma/ti-librpmsg-dma_1.0.bb
> index 13599d99..70733c96 100644
> --- a/meta-ti-bsp/recipes-ti/ti-librpmsg-dma/ti-librpmsg-dma_1.0.bb
> +++ b/meta-ti-bsp/recipes-ti/ti-librpmsg-dma/ti-librpmsg-dma_1.0.bb
> @@ -1,5 +1,5 @@
>  SUMMARY = "RPMsg DMA shared library"
> -LICENSE = "TI-TFL"
> +LICENSE = "LicenseRef-TI-TFL"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=91dc4ee6d125d0aaba4e5bd2fcc50ed3"
>  
>  SRC_URI = "git://github.com/TexasInstruments/rpmsg-dma.git;protocol=https;branch=main"
> diff --git a/meta-ti-extras/recipes-bsp/bt-fw/bt-fw_git.bb b/meta-ti-extras/recipes-bsp/bt-fw/bt-fw_git.bb
> index 0d856362..ba767916 100644
> --- a/meta-ti-extras/recipes-bsp/bt-fw/bt-fw_git.bb
> +++ b/meta-ti-extras/recipes-bsp/bt-fw/bt-fw_git.bb
> @@ -1,5 +1,5 @@
>  SUMMARY = "Firmware files for Bluetooth"
> -LICENSE = "TI-TSPA"
> +LICENSE = "LicenseRef-TI-TSPA"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=f39eac9f4573be5b012e8313831e72a9"
>  
>  PV = "8.7.1+git"
> diff --git a/meta-ti-extras/recipes-bsp/cc33xx-fw/cc33xx-fw_git.bb b/meta-ti-extras/recipes-bsp/cc33xx-fw/cc33xx-fw_git.bb
> index a4dfc4da..915ee64b 100644
> --- a/meta-ti-extras/recipes-bsp/cc33xx-fw/cc33xx-fw_git.bb
> +++ b/meta-ti-extras/recipes-bsp/cc33xx-fw/cc33xx-fw_git.bb
> @@ -1,5 +1,5 @@
>  SUMMARY = "Firmware files for use with TI cc33xx"
> -LICENSE = "TI-TSPA"
> +LICENSE = "LicenseRef-TI-TSPA"
>  LIC_FILES_CHKSUM = "file://LICENCE;md5=df68504cbd0a4da1643ebcfd5783dbc9"
>  
>  SRCREV = "0b4f850d6c0fd8e0fe0ae1d3e80ac6733aced29b"
> diff --git a/meta-ti-extras/recipes-bsp/ipumm-fw/ipumm-fw_git.bb b/meta-ti-extras/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
> index fbc6d956..cc27df41 100644
> --- a/meta-ti-extras/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
> +++ b/meta-ti-extras/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
> @@ -1,6 +1,6 @@
>  SUMMARY = "Firmware for IPU to support Accelerated MM decode and encode"
>  
> -LICENSE = "TI-TSPA"
> +LICENSE = "LicenseRef-TI-TSPA"
>  LIC_FILES_CHKSUM = "file://LICENCE.ti-tspa;md5=a1b59cb7ba626b9dbbcbf00f3fbc438a"
>  
>  COMPATIBLE_MACHINE = "am57xx"
> diff --git a/meta-ti-extras/recipes-bsp/pru/pru-icss_git.bb b/meta-ti-extras/recipes-bsp/pru/pru-icss_git.bb
> index b7066583..30ff2bcc 100644
> --- a/meta-ti-extras/recipes-bsp/pru/pru-icss_git.bb
> +++ b/meta-ti-extras/recipes-bsp/pru/pru-icss_git.bb
> @@ -1,6 +1,6 @@
>  SUMMARY = "Programmable Real-time Unit Software Package"
>  HOMEPAGE = "http://processors.wiki.ti.com/index.php/PRU-ICSS"
> -LICENSE = "BSD-3-Clause & PD"
> +LICENSE = "BSD-3-Clause AND LicenseRef-PD"
>  
>  LIC_FILES_CHKSUM = "file://PRU-Package-v6.1-Manifest.html;md5=1e37797ebe9254922f4278bb6047211c"
>  
> diff --git a/meta-ti-extras/recipes-bsp/wl18xx-fw/wl18xx-fw_8.9.0.0.86.bb b/meta-ti-extras/recipes-bsp/wl18xx-fw/wl18xx-fw_8.9.0.0.86.bb
> index 3e61db88..b49ed736 100644
> --- a/meta-ti-extras/recipes-bsp/wl18xx-fw/wl18xx-fw_8.9.0.0.86.bb
> +++ b/meta-ti-extras/recipes-bsp/wl18xx-fw/wl18xx-fw_8.9.0.0.86.bb
> @@ -1,5 +1,5 @@
>  SUMMARY = "Firmware files for use with TI wl18xx"
> -LICENSE = "TI-TSPA"
> +LICENSE = "LicenseRef-TI-TSPA"
>  LIC_FILES_CHKSUM = "file://LICENCE;md5=4977a0fe767ee17765ae63c435a32a9e"
>  
>  SRC_URI = "git://git.ti.com/git/wilink8-wlan/wl18xx_fw.git;protocol=https;branch=${BRANCH}"
> diff --git a/meta-ti-extras/recipes-ti/beagleboard/beaglebone-getting-started.bb b/meta-ti-extras/recipes-ti/beagleboard/beaglebone-getting-started.bb
> index 8ad75f26..41eea044 100644
> --- a/meta-ti-extras/recipes-ti/beagleboard/beaglebone-getting-started.bb
> +++ b/meta-ti-extras/recipes-ti/beagleboard/beaglebone-getting-started.bb
> @@ -4,7 +4,7 @@ PR = "r22"
>  
>  inherit allarch
>  
> -LICENSE = "CC-BY-SA-3.0 & GPL-3.0-or-later & MIT & PD"
> +LICENSE = "CC-BY-SA-3.0 AND GPL-3.0-or-later AND MIT AND LicenseRef-PD"
>  LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=f6f02761e31334c48f7021fb94c89aaa"
>  
>  SRCREV = "05bedba192646152b7bc80b0accaea75aef864e5"
> diff --git a/meta-ti-extras/recipes-ti/devtools/gcc-arm-baremetal_7-2018-q2-update.bb b/meta-ti-extras/recipes-ti/devtools/gcc-arm-baremetal_7-2018-q2-update.bb
> index df34a39e..2e9c0938 100644
> --- a/meta-ti-extras/recipes-ti/devtools/gcc-arm-baremetal_7-2018-q2-update.bb
> +++ b/meta-ti-extras/recipes-ti/devtools/gcc-arm-baremetal_7-2018-q2-update.bb
> @@ -1,5 +1,5 @@
>  SUMMARY = "Baremetal GCC for ARM"
> -LICENSE = "GPL-3.0-with-GCC-exception & GPL-3.0-only"
> +LICENSE = "GPL-3.0-only AND GPL-3.0-with-GCC-exception"
>  
>  LIC_FILES_CHKSUM = "file://share/doc/gcc-arm-none-eabi/license.txt;md5=f77466c63f5787f4bd669c402aabe061"
>  
> diff --git a/meta-ti-extras/recipes-ti/devtools/ti-cgt-arm_18.12.5.bb b/meta-ti-extras/recipes-ti/devtools/ti-cgt-arm_18.12.5.bb
> index 031d889f..07d7b6dc 100644
> --- a/meta-ti-extras/recipes-ti/devtools/ti-cgt-arm_18.12.5.bb
> +++ b/meta-ti-extras/recipes-ti/devtools/ti-cgt-arm_18.12.5.bb
> @@ -1,6 +1,6 @@
>  SUMMARY = "TI ARM Code Generation Tools"
>  HOMEPAGE = "https://www-a.ti.com/downloads/sds_support/TICodegenerationTools/download.htm"
> -LICENSE = "(TI-TSPA & Thai-Open-Source-Software-Center) & BSD-3-Clause & BSL-1.0 & Patrick-Powell & AFL-3.0 & MIT & BSD-2-Clause & PD & BSD-4-Clause"
> +LICENSE = "AFL-3.0 AND BSD-2-Clause AND BSD-3-Clause AND BSD-4-Clause AND BSL-1.0 AND MIT AND LicenseRef-PD AND LicenseRef-Patrick-Powell AND LicenseRef-TI-TSPA AND LicenseRef-Thai-Open-Source-Software-Center"
>  
>  LIC_FILES_CHKSUM = "file://ti-cgt-arm_${PV}.LTS/README.txt;md5=79631eb21b2e5b7190cd3ff1dfd41108"
>  
> diff --git a/meta-ti-extras/recipes-ti/devtools/ti-cgt-pru_2.3.3.bb b/meta-ti-extras/recipes-ti/devtools/ti-cgt-pru_2.3.3.bb
> index 7ef20b7a..b83064c6 100644
> --- a/meta-ti-extras/recipes-ti/devtools/ti-cgt-pru_2.3.3.bb
> +++ b/meta-ti-extras/recipes-ti/devtools/ti-cgt-pru_2.3.3.bb
> @@ -1,6 +1,6 @@
>  SUMMARY = "TI PRU Code Generation Tools"
>  HOMEPAGE = "https://www-a.ti.com/downloads/sds_support/TICodegenerationTools/download.htm"
> -LICENSE = "(TI-TSPA & Thai-Open-Source-Software-Center) & BSD-3-Clause & BSL-1.0 & Hewlett-Packard & AFL-3.0 & MIT & BSD-2-Clause & PD"
> +LICENSE = "AFL-3.0 AND BSD-2-Clause AND BSD-3-Clause AND BSL-1.0 AND MIT AND LicenseRef-Hewlett-Packard AND LicenseRef-PD AND LicenseRef-TI-TSPA AND LicenseRef-Thai-Open-Source-Software-Center"
>  
>  LIC_FILES_CHKSUM = "file://${UNPACKDIR}/ti-cgt-pru_${PV}/PRU_Code_Generation_Tools_2.3.x_manifest.html;md5=e22f9d8240f7cca0c0aa5242d9ffa5bc"
>  LIC_FILES_CHKSUM:class-target = "file://usr/share/doc/ti/cgt-pru/PRU_Code_Generation_Tools_2.3.x_manifest.html;md5=e22f9d8240f7cca0c0aa5242d9ffa5bc"
> diff --git a/meta-ti-extras/recipes-ti/devtools/ti-cgt470.inc b/meta-ti-extras/recipes-ti/devtools/ti-cgt470.inc
> index f32bc0d3..cba6d14a 100644
> --- a/meta-ti-extras/recipes-ti/devtools/ti-cgt470.inc
> +++ b/meta-ti-extras/recipes-ti/devtools/ti-cgt470.inc
> @@ -1,7 +1,7 @@
>  SUMMARY = "TI ARM Code Generation Tools"
>  HOMEPAGE = "https://www-a.ti.com/downloads/sds_support/CodeGenerationTools.htm"
>  SECTION = "devel"
> -LICENSE = "TI"
> +LICENSE = "LicenseRef-TI-TSPA"
>  
>  LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=62f46f1125a152a2e213b414db7ac600"
>  
> diff --git a/meta-ti-extras/recipes-ti/devtools/ti-cgt6x-7_7.4.16.bb b/meta-ti-extras/recipes-ti/devtools/ti-cgt6x-7_7.4.16.bb
> index adf21563..16f5a36d 100644
> --- a/meta-ti-extras/recipes-ti/devtools/ti-cgt6x-7_7.4.16.bb
> +++ b/meta-ti-extras/recipes-ti/devtools/ti-cgt6x-7_7.4.16.bb
> @@ -7,7 +7,7 @@ compiler, linker, assembler, etc. This also includes C runtime \
>  libraries and standard header files needed to produce a working DSP application."
>  
>  HOMEPAGE = "https://www-a.ti.com/downloads/sds_support/TICodegenerationTools/download.htm"
> -LICENSE = "TI-TSPA"
> +LICENSE = "LicenseRef-TI-TSPA"
>  
>  LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b6311962635a4f15630e36ec2d875eca"
>  
> diff --git a/meta-ti-extras/recipes-ti/devtools/ti-cgt6x_8.3.2.bb b/meta-ti-extras/recipes-ti/devtools/ti-cgt6x_8.3.2.bb
> index 25e0f596..24157360 100644
> --- a/meta-ti-extras/recipes-ti/devtools/ti-cgt6x_8.3.2.bb
> +++ b/meta-ti-extras/recipes-ti/devtools/ti-cgt6x_8.3.2.bb
> @@ -1,6 +1,6 @@
>  SUMMARY = "TI DSP Code Generation Tools"
>  HOMEPAGE = "https://www-a.ti.com/downloads/sds_support/TICodegenerationTools/download.htm"
> -LICENSE = "(TI-TSPA & Thai-Open-Source-Software-Center) & BSD-3-Clause & BSL-1.0 & Patrick-Powell & AFL-3.0 & MIT & BSD-2-Clause & PD"
> +LICENSE = "AFL-3.0 AND BSD-2-Clause AND BSD-3-Clause AND BSL-1.0 AND MIT AND LicenseRef-PD AND LicenseRef-Patrick-Powell AND LicenseRef-TI-TSPA AND LicenseRef-Thai-Open-Source-Software-Center"
>  
>  LIC_FILES_CHKSUM = "file://ti-cgt-c6000_${PV}/C6000CodeGenerationTools_8.3.x_manifest.html;md5=d06c6f9acebf78df4108a8535396e9f1"
>  LIC_FILES_CHKSUM:class-target = "file://usr/share/doc/ti/cgt-c6x/C6000CodeGenerationTools_8.3.x_manifest.html;md5=d06c6f9acebf78df4108a8535396e9f1"
> diff --git a/meta-ti-extras/recipes-ti/devtools/ti-cgt7x_1.2.0.bb b/meta-ti-extras/recipes-ti/devtools/ti-cgt7x_1.2.0.bb
> index 04b16032..30116b02 100644
> --- a/meta-ti-extras/recipes-ti/devtools/ti-cgt7x_1.2.0.bb
> +++ b/meta-ti-extras/recipes-ti/devtools/ti-cgt7x_1.2.0.bb
> @@ -6,7 +6,7 @@ applications for the C7000 DSP family. This includes tools such as: \
>  compiler, linker, assembler, etc. This also includes C runtime \
>  libraries and standard header files needed to produce a working DSP application."
>  HOMEPAGE = "https://www-a.ti.com/downloads/sds_support/TICodegenerationTools/download.htm"
> -LICENSE = "(TI-TSPA & Thai-Open-Source-Software-Center) & BSD-3-Clause & BSL-1.0 & Patrick-Powell & AFL-3.0 & MIT & BSD-2-Clause & PD"
> +LICENSE = "AFL-3.0 AND BSD-2-Clause AND BSD-3-Clause AND BSL-1.0 AND MIT AND LicenseRef-PD AND LicenseRef-Patrick-Powell AND LicenseRef-TI-TSPA AND LicenseRef-Thai-Open-Source-Software-Center"
>  
>  LIC_FILES_CHKSUM = "file://ti-cgt-c7000_${PV}.STS/C7000_Code_Generation_Tools_1.x_manifest.html;md5=f1156d241d104c281bc64a6ec8eadc64"
>  
> diff --git a/meta-ti-extras/recipes-ti/devtools/ti-xdctools_3.55.02.22.bb b/meta-ti-extras/recipes-ti/devtools/ti-xdctools_3.55.02.22.bb
> index 969518e2..7d297d65 100644
> --- a/meta-ti-extras/recipes-ti/devtools/ti-xdctools_3.55.02.22.bb
> +++ b/meta-ti-extras/recipes-ti/devtools/ti-xdctools_3.55.02.22.bb
> @@ -2,7 +2,7 @@ SUMMARY = "TI XDCtools (RTSC - Real Time Software Components"
>  DESCRIPTION = "TI XDCtools (RTSC - Real Time Software Components - http://rtsc.eclipse.org)"
>  HOMEPAGE = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/rtsc"
>  SECTION = "devel"
> -LICENSE = "BSD-3-Clause & GPL-2.0-only"
> +LICENSE = "BSD-3-Clause AND GPL-2.0-only"
>  
>  require recipes-ti/includes/ti-paths.inc
>  require recipes-ti/includes/ti-staging.inc
> diff --git a/meta-ti-extras/recipes-ti/jailhouse/ti-jailhouse.inc b/meta-ti-extras/recipes-ti/jailhouse/ti-jailhouse.inc
> index bad264d8..23a10e35 100644
> --- a/meta-ti-extras/recipes-ti/jailhouse/ti-jailhouse.inc
> +++ b/meta-ti-extras/recipes-ti/jailhouse/ti-jailhouse.inc
> @@ -5,7 +5,7 @@ platform in a way that none of these domains, called 'cells' here, can interfere
>  HOMEPAGE = "https://github.com/siemens/jailhouse"
>  SECTION = "jailhouse"
>  
> -LICENSE = "GPL-2.0-only & BSD-2-Clause"
> +LICENSE = "BSD-2-Clause AND GPL-2.0-only"
>  
>  LIC_FILES_CHKSUM = " \
>      file://COPYING;md5=9fa7f895f96bde2d47fd5b7d95b6ba4d \
> diff --git a/meta-ti-extras/recipes-ti/vlib/vlib-c66x.inc b/meta-ti-extras/recipes-ti/vlib/vlib-c66x.inc
> index c7c14f91..aa0ad8bb 100644
> --- a/meta-ti-extras/recipes-ti/vlib/vlib-c66x.inc
> +++ b/meta-ti-extras/recipes-ti/vlib/vlib-c66x.inc
> @@ -1,7 +1,7 @@
>  SUMMARY = "TI Vision Library (VLIB) for C66x"
>  HOMEPAGE = "http://software-dl.ti.com/libs/vlib/latest/index_FDS.html"
>  SECTION = "devel"
> -LICENSE = "TI-TSPA & BSD-3-Clause"
> +LICENSE = "BSD-3-Clause AND LicenseRef-TI-TSPA"
>  
>  require ../includes/ti-paths.inc
>  require ../includes/ti-staging.inc
> diff --git a/meta-ti-test/licenses/Stream_Benchmark_License b/meta-ti-test/licenses/Stream-Benchmark-License
> similarity index 100%
> rename from meta-ti-test/licenses/Stream_Benchmark_License
> rename to meta-ti-test/licenses/Stream-Benchmark-License
> diff --git a/meta-ti-test/recipes-benchmark/stream/stream_5.10.bb b/meta-ti-test/recipes-benchmark/stream/stream_5.10.bb
> index 484be34d..3084c040 100644
> --- a/meta-ti-test/recipes-benchmark/stream/stream_5.10.bb
> +++ b/meta-ti-test/recipes-benchmark/stream/stream_5.10.bb
> @@ -1,6 +1,6 @@
>  SUMMARY = "Stream Benchmark"
>  HOMEPAGE = "http://www.cs.virginia.edu/stream/"
> -LICENSE = "Stream_Benchmark_License"
> +LICENSE = "LicenseRef-Stream-Benchmark-License"
>  LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=bca8cbe07976fe64c8946378d08314b0"
>  SECTION = "system"
>  
> diff --git a/meta-ti-test/recipes-connectivity/openntpd/openntpd_6.8p1.bb b/meta-ti-test/recipes-connectivity/openntpd/openntpd_6.8p1.bb
> index 6a3c64d1..ec604a94 100644
> --- a/meta-ti-test/recipes-connectivity/openntpd/openntpd_6.8p1.bb
> +++ b/meta-ti-test/recipes-connectivity/openntpd/openntpd_6.8p1.bb
> @@ -2,7 +2,7 @@ SUMMARY = "OpenNTPD is an implementation of the Network Time Protocol."
>  DESCRIPTION = "OpenNTPD is a FREE, easy to use implementation of the Network Time Protocol."
>  HOMEPAGE = "http://www.openntpd.org/"
>  SECTION = "console/network"
> -LICENSE = "BSD-3-Clause & ISC"
> +LICENSE = "BSD-3-Clause AND ISC"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=fe922aad2b6ad1c359cf2adfdaaab1b6"
>  
>  PR = "r0"
> diff --git a/meta-ti-test/recipes-devtools/ltp-ddt/ltp_20260130.inc b/meta-ti-test/recipes-devtools/ltp-ddt/ltp_20260130.inc
> index 4183b5d4..5d71837c 100644
> --- a/meta-ti-test/recipes-devtools/ltp-ddt/ltp_20260130.inc
> +++ b/meta-ti-test/recipes-devtools/ltp-ddt/ltp_20260130.inc
> @@ -2,7 +2,7 @@ SUMMARY = "Linux Test Project"
>  DESCRIPTION = "The Linux Test Project is a joint project with SGI, IBM, OSDL, and Bull with a goal to deliver test suites to the open source community that validate the reliability, robustness, and stability of Linux. The Linux Test Project is a collection of tools for testing the Linux kernel and related features."
>  HOMEPAGE = "https://linux-test-project.github.io/"
>  SECTION = "console/utils"
> -LICENSE = "GPL-2.0-only & GPL-2.0-or-later & LGPL-2.0-or-later & LGPL-2.1-or-later & BSD-2-Clause"
> +LICENSE = "BSD-2-Clause AND GPL-2.0-only AND GPL-2.0-or-later AND LGPL-2.0-or-later AND LGPL-2.1-or-later"
>  LIC_FILES_CHKSUM = "\
>      file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
>      file://testcases/open_posix_testsuite/COPYING;md5=48b1c5ec633e3e30ec2cf884ae699947 \
> diff --git a/meta-ti-test/recipes-devtools/omapconf/omapconf_git.bb b/meta-ti-test/recipes-devtools/omapconf/omapconf_git.bb
> index 84226dd8..5ea2ac77 100644
> --- a/meta-ti-test/recipes-devtools/omapconf/omapconf_git.bb
> +++ b/meta-ti-test/recipes-devtools/omapconf/omapconf_git.bb
> @@ -1,7 +1,7 @@
>  SUMMARY = "Diagnostic tool for TI OMAP processors"
>  HOMEPAGE = "https://github.com/omapconf/omapconf"
>  
> -LICENSE = "GPL-2.0-only | BSD-3-Clause"
> +LICENSE = "BSD-3-Clause OR GPL-2.0-only"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=205c83c4e2242a765acb923fc766e914"
>  
>  PV = "1.75+git"
> diff --git a/meta-ti-test/recipes-kernel/hwspinlocktest/hwspinlocktest_0.1.bb b/meta-ti-test/recipes-kernel/hwspinlocktest/hwspinlocktest_0.1.bb
> index cc566b37..54b454f3 100644
> --- a/meta-ti-test/recipes-kernel/hwspinlocktest/hwspinlocktest_0.1.bb
> +++ b/meta-ti-test/recipes-kernel/hwspinlocktest/hwspinlocktest_0.1.bb
> @@ -1,6 +1,6 @@
>  SUMMARY = "Build hwspinlock test as an external Linux kernel module"
>  DESCRIPTION = "${SUMMARY}"
> -LICENSE = "GPL-2.0-only | BSD-3-Clause"
> +LICENSE = "BSD-3-Clause OR GPL-2.0-only"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=bfa02c83df161e37647ee23a2c7eacd4"
>  
>  inherit module
> diff --git a/meta-ti-test/recipes-support/xdp-tools/xdp-tools-ti_1.6.1.bb b/meta-ti-test/recipes-support/xdp-tools/xdp-tools-ti_1.6.1.bb
> index e25ae146..a3ffc52f 100644
> --- a/meta-ti-test/recipes-support/xdp-tools/xdp-tools-ti_1.6.1.bb
> +++ b/meta-ti-test/recipes-support/xdp-tools/xdp-tools-ti_1.6.1.bb
> @@ -1,6 +1,6 @@
>  SUMMARY = "Utilities and example programs for use with XDP"
>  HOMEPAGE = "https://github.com/xdp-project/xdp-tools"
> -LICENSE = "GPL-2.0-or-later & LGPL-2.1-or-later & BSD-2-Clause"
> +LICENSE = "BSD-2-Clause AND GPL-2.0-or-later AND LGPL-2.1-or-later"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=9ee53f8d06bbdb4c11b1557ecc4f8cd5 \
>                      file://LICENSES/GPL-2.0;md5=994331978b428511800bfbd17eea3001 \
>                      file://LICENSES/LGPL-2.1;md5=b370887980db5dd40659b50909238dbd \
> -- 
> 2.43.0

