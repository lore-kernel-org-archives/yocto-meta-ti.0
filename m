Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.2039.1628032280695262402
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 03 Aug 2021 16:11:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8977A40C8E
	for <meta-ti@lists.yoctoproject.org>; Tue,  3 Aug 2021 23:11:19 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u2xedA1F8gcq for <meta-ti@lists.yoctoproject.org>;
	Tue,  3 Aug 2021 23:11:19 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 3C8A640C1C
	for <meta-ti@lists.yoctoproject.org>; Tue,  3 Aug 2021 23:11:19 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 8EE4517464E; Tue,  3 Aug 2021 19:11:18 -0400 (EDT)
Date: Tue, 3 Aug 2021 19:11:18 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] [master][PATCH] meta-ti: convert to new override syntax in honister
Message-ID: <20210803231118.GU1528@denix.org>
References: <1697DF32B6863A3F.22949@lists.yoctoproject.org>
MIME-Version: 1.0
In-Reply-To: <1697DF32B6863A3F.22949@lists.yoctoproject.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Please ignore this one - v2 is coming.

On Tue, Aug 03, 2021 at 02:26:32PM -0400, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@konsulko.com>
> 
> Upcoming "honister" release changes the override syntax to improve usability,
> speed and memory footprint. Update recipes with the new syntax and set layer
> compatibility to honister.
> 
> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> ---
>  classes/ti-pdk-fetch.bbclass                       |   2 +-
>  classes/ti-pdk.bbclass                             |  18 +--
>  conf/layer.conf                                    |   2 +-
>  conf/machine/am3517-evm.conf                       |   2 +-
>  conf/machine/am37x-evm.conf                        |   2 +-
>  conf/machine/am65xx-evm-k3r5-sr2.conf              |   2 +-
>  conf/machine/am65xx-hs-evm-k3r5-sr2.conf           |   2 +-
>  conf/machine/beagleboard.conf                      |   2 +-
>  conf/machine/beaglebone.conf                       |   2 +-
>  conf/machine/include/am64xx.inc                    |   2 +-
>  conf/machine/include/am65xx.inc                    |   2 +-
>  conf/machine/include/c66x.inc                      |   2 +-
>  conf/machine/include/davinci.inc                   |   2 +-
>  conf/machine/include/dra7xx.inc                    |   2 +-
>  conf/machine/include/j7.inc                        |   2 +-
>  conf/machine/include/k2e.inc                       |   2 +-
>  conf/machine/include/k2g.inc                       |   2 +-
>  conf/machine/include/k2hk.inc                      |   2 +-
>  conf/machine/include/k2l.inc                       |   2 +-
>  conf/machine/include/k3.inc                        |   2 +-
>  conf/machine/include/k3r5.inc                      |   6 +-
>  conf/machine/include/keystone.inc                  |   2 +-
>  conf/machine/include/omap-a15.inc                  |   2 +-
>  conf/machine/include/omap3.inc                     |   2 +-
>  conf/machine/include/omap4.inc                     |   2 +-
>  conf/machine/include/omapl1.inc                    |   2 +-
>  conf/machine/include/omapl137.inc                  |   2 +-
>  conf/machine/include/omapl138.inc                  |   2 +-
>  conf/machine/include/ti33x.inc                     |   2 +-
>  conf/machine/include/ti43x.inc                     |   2 +-
>  conf/machine/omap3evm.conf                         |   2 +-
>  conf/multiconfig/k3r5-sr2.conf                     |   2 +-
>  conf/multiconfig/k3r5.conf                         |   2 +-
>  recipes-bsp/abefw/abefw_1.0.14.bb                  |   2 +-
>  recipes-bsp/aif2-lld/aif2-lld-rtos_git.bb          |   2 +-
>  recipes-bsp/aif2-lld/aif2-lld-test_git.bb          |   2 +-
>  recipes-bsp/aif2-lld/aif2-lld_git.bb               |   2 +-
>  recipes-bsp/alsa-state/alsa-state.bbappend         |   2 +-
>  recipes-bsp/audk2g-addon/audk2g-addon-rtos_git.bb  |   2 +-
>  recipes-bsp/bcp-lld/bcp-lld-rtos_git.bb            |   2 +-
>  recipes-bsp/board-rtos/board-rtos_git.bb           |  20 ++--
>  recipes-bsp/boot-monitor/boot-monitor_git.bb       |   2 +-
>  recipes-bsp/bt-fw/bt-fw_git.bb                     |   2 +-
>  recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb |   2 +-
>  recipes-bsp/cal-lld/cal-lld-rtos_git.bb            |   6 +-
>  recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb        |   2 +-
>  recipes-bsp/cmb-addon/cmb-addon-rtos_git.bb        |   2 +-
>  recipes-bsp/cmem/cmem-mod_git.bb                   |   4 +-
>  recipes-bsp/cmem/cmem_git.bb                       |   4 +-
>  .../common-csl-ip/common-csl-ip-rtos_git.bb        |  10 +-
>  recipes-bsp/common-csl-ip/common-csl-ip_git.bb     |   2 +-
>  .../common-csl-ip/csl-rti-dwwdtest-fw_git.bb       |  16 +--
>  recipes-bsp/cppi-lld/cppi-lld-rtos_git.bb          |   4 +-
>  recipes-bsp/cppi-lld/cppi-lld-test_git.bb          |   6 +-
>  recipes-bsp/cppi-lld/cppi-lld_git.bb               |   8 +-
>  recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb     |   6 +-
>  recipes-bsp/cuia/cuia_1.0.0.13.bb                  |   2 +-
>  recipes-bsp/dfe-lld/dfe-lld-test_git.bb            |   2 +-
>  recipes-bsp/dfe-lld/dfe-lld_git.bb                 |   2 +-
>  recipes-bsp/dspdce-fw/dspdce-fw_git.bb             |   6 +-
>  recipes-bsp/dsptop/debugss-module-drv_git.bb       |   4 +-
>  recipes-bsp/dsptop/dsptop_git.bb                   |   4 +-
>  recipes-bsp/dsptop/libulm_git.bb                   |   4 +-
>  recipes-bsp/dsptop/temperature-module-drv_git.bb   |   4 +-
>  recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb        |  10 +-
>  recipes-bsp/edma3-lld/edma3-lld_git.bb             |   6 +-
>  recipes-bsp/emac-lld/emac-lld-rtos_git.bb          |  12 +-
>  recipes-bsp/fatfs-rtos/fatfs-rtos_git.bb           |   2 +-
>  .../faultmanagement/faultmanagement-rtos_git.bb    |   4 +-
>  recipes-bsp/fftc-lld/fftc-lld-rtos_git.bb          |   2 +-
>  recipes-bsp/formfactor/formfactor_0.0.bbappend     |   2 +-
>  recipes-bsp/fvid2/fvid2-rtos_git.bb                |   6 +-
>  .../gc320-drivers/ti-gc320-driver_5.0.11.p7.bb     |   2 +-
>  recipes-bsp/goodix-fw/goodix-fw_git.bb             |   2 +-
>  recipes-bsp/gpio-lld/gpio-lld-rtos_git.bb          |   8 +-
>  recipes-bsp/gpmc-lld/gpmc-lld-rtos_git.bb          |   6 +-
>  recipes-bsp/hplib/hplib-mod_git.bb                 |   2 +-
>  recipes-bsp/hplib/hplib-test_git.bb                |   2 +-
>  recipes-bsp/hplib/hplib_git.bb                     |   4 +-
>  recipes-bsp/hyplnk-lld/hyplnk-lld-rtos_git.bb      |   2 +-
>  recipes-bsp/hyplnk-lld/hyplnk-lld-test_git.bb      |   6 +-
>  recipes-bsp/hyplnk-lld/hyplnk-lld_git.bb           |   6 +-
>  recipes-bsp/i2c-lld/i2c-lld-rtos_git.bb            |  14 +--
>  recipes-bsp/ibl-boot/ibl-boot-rtos_git.bb          |   6 +-
>  .../icss-emac-lld/icss-emac-lld-rtos_git.bb        |   8 +-
>  .../icss-emac-lld/icss-emac-lld-test_git.bb        |   6 +-
>  recipes-bsp/icss-emac-lld/icss-emac-lld_git.bb     |   2 +-
>  recipes-bsp/iolink-lld/iolink-lld-rtos_git.bb      |   6 +-
>  recipes-bsp/ipc-lld/ipc-lld-examples-rtos_git.bb   |  24 ++--
>  recipes-bsp/ipc-lld/ipc-lld-fw_git.bb              |  12 +-
>  recipes-bsp/ipc-lld/ipc-lld-rtos_git.bb            |   6 +-
>  recipes-bsp/ipc-lld/ipc-lld.inc                    |   2 +-
>  recipes-bsp/ipumm-fw/ipumm-fw_git.bb               |   6 +-
>  recipes-bsp/iqn2-lld/iqn2-lld-test_git.bb          |   2 +-
>  recipes-bsp/iqn2-lld/iqn2-lld_git.bb               |   2 +-
>  recipes-bsp/mad-utils/mad-utils-rtos_git.bb        |   6 +-
>  recipes-bsp/mcasp-lld/mcasp-lld-rtos_git.bb        |  12 +-
>  recipes-bsp/mcbsp-lld/mcbsp-lld-rtos_git.bb        |   4 +-
>  recipes-bsp/mmap-lld/mmap-lld-test_git.bb          |   8 +-
>  recipes-bsp/mmap-lld/mmap-lld_git.bb               |   4 +-
>  recipes-bsp/mmcsd-lld/mmcsd-lld-rtos_git.bb        |  12 +-
>  recipes-bsp/netcp-pa-fw/netcp-pa-fw_git.bb         |   2 +-
>  recipes-bsp/netcp-sa-fw/netcp-sa-fw_git.bb         |   2 +-
>  recipes-bsp/nwal-lld/nwal-lld-rtos_git.bb          |   2 +-
>  recipes-bsp/nwal-lld/nwal-lld-test_git.bb          |   2 +-
>  recipes-bsp/nwal-lld/nwal-lld_git.bb               |   2 +-
>  recipes-bsp/osal/osal-rtos_git.bb                  |   6 +-
>  recipes-bsp/osal/osal-test_git.bb                  |   2 +-
>  recipes-bsp/osal/osal_git.bb                       |   2 +-
>  recipes-bsp/pa-lld/pa-lld-rtos_git.bb              |   4 +-
>  recipes-bsp/pa-lld/pa-lld-test_git.bb              |   6 +-
>  recipes-bsp/pa-lld/pa-lld_git.bb                   |   4 +-
>  recipes-bsp/pcie-lld/pcie-lld-rtos_git.bb          |   2 +-
>  recipes-bsp/pktlib/pktlib-rtos_git.bb              |   4 +-
>  recipes-bsp/pktlib/pktlib_git.bb                   |   2 +-
>  recipes-bsp/pm-lld/pm-lld-rtos_git.bb              |  16 +--
>  .../ti-img-rogue-driver_1.13.5776728.bb            |   2 +-
>  .../powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb  |   4 +-
>  recipes-bsp/pru/pru-icss_git.bb                    |  38 +++----
>  recipes-bsp/pru/pru-pwm-fw_git.bb                  |   4 +-
>  recipes-bsp/pru/pru-swuart-fw_git.bb               |   6 +-
>  recipes-bsp/pru/ti-pru-sw-edma-driver_1.00.00.bb   |   6 +-
>  recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb   |   4 +-
>  recipes-bsp/prueth-fw/prueth-fw-am65x_git.bb       |   4 +-
>  recipes-bsp/prueth-fw/prueth-fw_5.6.15.bb          |   4 +-
>  recipes-bsp/pruhsr-fw/pruhsr-fw_2.17.25.bb         |   4 +-
>  recipes-bsp/pruprp-fw/pruprp-fw_2.17.25.bb         |   4 +-
>  recipes-bsp/pruss-lld/pruss-lld-apps_git.bb        |   6 +-
>  recipes-bsp/pruss-lld/pruss-lld-rtos_git.bb        |  10 +-
>  recipes-bsp/pruss-lld/pruss-lld-test_git.bb        |   2 +-
>  recipes-bsp/pruss-lld/pruss-lld_git.bb             |   2 +-
>  recipes-bsp/prusw-fw/prusw-fw_3.2.9.bb             |   4 +-
>  recipes-bsp/qmss-lld/qmss-lld-rtos_git.bb          |   4 +-
>  recipes-bsp/qmss-lld/qmss-lld-test_git.bb          |   6 +-
>  recipes-bsp/qmss-lld/qmss-lld_git.bb               |   8 +-
>  recipes-bsp/qmss-pdsp-fw/qmss-pdsp-fw_git.bb       |   2 +-
>  recipes-bsp/rm-lld/rm-lld-rtos_git.bb              |   2 +-
>  recipes-bsp/rm-lld/rm-lld_git.bb                   |   8 +-
>  recipes-bsp/sa-lld/sa-lld-rtos_git.bb              |   6 +-
>  recipes-bsp/sa-lld/sa-lld-test_git.bb              |   4 +-
>  recipes-bsp/sa-lld/sa-lld_git.bb                   |   2 +-
>  recipes-bsp/sciclient/sciclient-rtos_git.bb        |  18 +--
>  recipes-bsp/serdes-diag/serdes-diag-rtos_git.bb    |   2 +-
>  recipes-bsp/serdes-fw/serdes-fw_git.bb             |   2 +-
>  recipes-bsp/spi-lld/spi-lld-rtos_git.bb            |  12 +-
>  recipes-bsp/srio-lld/srio-lld-rtos_git.bb          |   4 +-
>  recipes-bsp/srio-lld/srio-lld.inc                  |   2 +-
>  recipes-bsp/starterware/starterware-rtos_git.bb    |   4 +-
>  recipes-bsp/starterware/starterware_git.bb         |   2 +-
>  recipes-bsp/tcp3d-lld/tcp3d-lld-rtos_git.bb        |   4 +-
>  .../ti-ocf-crypto-module_1.0.bb                    |   6 +-
>  recipes-bsp/ti-sci-fw/ti-sci-fw-source_git.bb      |   4 +-
>  recipes-bsp/ti-sci-fw/ti-sci-fw_0.1.1.50.bb        |   2 +-
>  recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb             |  14 +--
>  .../traceframework/traceframework-rtos_git.bb      |   2 +-
>  recipes-bsp/traceframework/traceframework_git.bb   |   4 +-
>  recipes-bsp/transport-rtos/bmet-eth-rtos_git.bb    |   2 +-
>  recipes-bsp/transport-rtos/nimu-icss-rtos_git.bb   |  10 +-
>  recipes-bsp/transport-rtos/nimu-rtos_git.bb        |  28 ++---
>  recipes-bsp/transport-rtos/timesync-rtos_git.bb    |   4 +-
>  .../trusted-firmware-a_%.bbappend                  |   4 +-
>  recipes-bsp/u-boot/u-boot-ti.inc                   |  26 ++---
>  recipes-bsp/uart-lld/uart-lld-rtos_git.bb          |  14 +--
>  recipes-bsp/udma-lld/udma-lld-rtos_git.bb          |   6 +-
>  .../uio-module-drv/uio-module-drv-test_git.bb      |  12 +-
>  recipes-bsp/uio-module-drv/uio-module-drv_git.bb   |   6 +-
>  recipes-bsp/usb-lld/usb-lld-rtos_git.bb            |   8 +-
>  recipes-bsp/vis-fw/vis_01.50.07.15.bb              |   8 +-
>  recipes-bsp/vpdma-fw/vpdma-fw_03-2012.bb           |   2 +-
>  recipes-bsp/vps-lld/vps-lld-rtos_git.bb            |   6 +-
>  recipes-bsp/wl18xx-fw/wl18xx-fw_8.9.0.0.86.bb      |   2 +-
>  recipes-bsp/x-load/x-load.inc                      |   2 +-
>  recipes-bsp/x-load/x-load_1.46-psp.bb              |   4 +-
>  recipes-bsp/x-load/x-load_git.bb                   |   2 +-
>  .../wl18xx-calibrator/wl18xx-calibrator_8.7.3.bb   |   2 +-
>  .../wl18xx-target-scripts_8.7.3.bb                 |   2 +-
>  recipes-connectivity/wlconf/wlconf_8.7.3.bb        |   4 +-
>  .../init-ifupdown/init-ifupdown_1.0.bbappend       |   2 +-
>  recipes-core/udev/eudev_%.bbappend                 |   8 +-
>  recipes-devtools/gdbc6x/gdbc6x_git.bb              |   4 +-
>  recipes-devtools/gdbc6x/gdbserver-c6x_git.bb       |   4 +-
>  .../gdbc6x/gdbserverproxy-module-drv_git.bb        |   4 +-
>  recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb |   4 +-
>  .../libgles/ti-img-rogue-umlibs_1.13.5776728.bb    |  38 +++----
>  .../libgles/ti-sgx-ddk-um_1.17.4948957.bb          |  36 +++---
>  recipes-kernel/kselftests/kselftests_4.10.bb       | 122 ++++++++++-----------
>  recipes-kernel/linux/bundle-devicetree.inc         |   2 +-
>  recipes-kernel/linux/kernel-rdepends.inc           |  40 +++----
>  recipes-kernel/linux/linux-ti-mainline_git.bb      |  12 +-
>  recipes-kernel/linux/linux-ti-staging-rt_5.10.bb   |   2 +-
>  recipes-kernel/linux/linux-ti-staging-rt_5.4.bb    |   2 +-
>  .../linux/linux-ti-staging-systest_5.10.bb         |   2 +-
>  .../linux/linux-ti-staging-systest_5.4.bb          |   2 +-
>  recipes-kernel/linux/linux-ti-staging_5.10.bb      |   8 +-
>  recipes-kernel/linux/linux-ti-staging_5.4.bb       |   8 +-
>  recipes-kernel/linux/ti-uio.inc                    |  32 +++---
>  recipes-security/optee/optee-os_%.bbappend         |  22 ++--
>  recipes-ti/beagleboard/beaglebone-capes.bb         |   2 +-
>  .../beagleboard/beaglebone-getting-started.bb      |   4 +-
>  recipes-ti/beagleboard/gadget-init.bb              |  10 +-
>  recipes-ti/bios/ti-biosutils_1.02.02.bb            |   2 +-
>  recipes-ti/bios/ti-sysbios.inc                     |   6 +-
>  .../codec-engine/ti-codec-engine_3.24.00.08.bb     |   4 +-
>  recipes-ti/ctoolslib/libaet_git.bb                 |   4 +-
>  .../devtools/gcc-arm-baremetal_7-2018-q2-update.bb |   6 +-
>  .../gcc-linaro-baremetal-aarch64-native.bb         |   8 +-
>  recipes-ti/devtools/gcc-linaro-baremetal-native.bb |   8 +-
>  recipes-ti/devtools/ti-cg-xml_2.61.00.bb           |   4 +-
>  recipes-ti/devtools/ti-cgt-arm_18.12.5.bb          |   8 +-
>  recipes-ti/devtools/ti-cgt-pru_2.3.2.bb            |  16 +--
>  recipes-ti/devtools/ti-cgt470.inc                  |   2 +-
>  recipes-ti/devtools/ti-cgt6x-7_7.4.16.bb           |   6 +-
>  recipes-ti/devtools/ti-cgt6x_8.3.2.bb              |  22 ++--
>  recipes-ti/devtools/ti-cgt7x_1.2.0.bb              |   8 +-
>  recipes-ti/devtools/ti-xdctools-common.inc         |   8 +-
>  recipes-ti/dmai/ti-dmai.inc                        |  38 +++----
>  recipes-ti/dmai/ti-dmai_svn.bb                     |   6 +-
>  recipes-ti/dsplib/dsplib.inc                       |   8 +-
>  .../ti-framework-components.inc                    |   6 +-
>  recipes-ti/imglib/imglib-c66x.inc                  |   8 +-
>  recipes-ti/includes/ti-staging.inc                 |   4 +-
>  recipes-ti/includes/ti-unpack.inc                  |   4 +-
>  recipes-ti/ipc/ipc-transport-common-rtos_git.bb    |   2 +-
>  recipes-ti/ipc/ipc-transport-qmss-rtos_git.bb      |   4 +-
>  recipes-ti/ipc/ipc-transport-qmss.inc              |   2 +-
>  recipes-ti/ipc/ipc-transport-srio-rtos_git.bb      |   4 +-
>  recipes-ti/ipc/ipc-transport-srio.inc              |   2 +-
>  recipes-ti/ipc/ti-ipc-examples-linux_git.bb        |   6 +-
>  recipes-ti/ipc/ti-ipc-examples.inc                 |   4 +-
>  recipes-ti/ipc/ti-ipc-examples_git.bb              |   6 +-
>  recipes-ti/ipc/ti-ipc-rtos.inc                     |   8 +-
>  recipes-ti/ipc/ti-ipc-rtos_git.bb                  |  22 ++--
>  recipes-ti/ipc/ti-ipc_git.bb                       |  10 +-
>  recipes-ti/linuxutils/ti-linuxutils.inc            |  14 +--
>  recipes-ti/linuxutils/ti-linuxutils_2.26.01.02.bb  |   2 +-
>  recipes-ti/mathlib/mathlib.inc                     |   8 +-
>  recipes-ti/mpm-transport/mpm-transport_git.bb      |  12 +-
>  recipes-ti/multiprocmgr/multiprocmgr-rtos_git.bb   |  12 +-
>  recipes-ti/multiprocmgr/multiprocmgr-test_git.bb   |  10 +-
>  recipes-ti/multiprocmgr/multiprocmgr_git.bb        |   4 +-
>  recipes-ti/ndk/ti-ndk.inc                          |   6 +-
>  recipes-ti/ns/ti-ns.inc                            |   6 +-
>  recipes-ti/openmp-rtos/openmp-rtos_git.bb          |  12 +-
>  recipes-ti/osal/ti-osal.inc                        |   6 +-
>  recipes-ti/swtools/swtools_git.bb                  |   8 +-
>  recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb   |   4 +-
>  recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb         |  18 +--
>  recipes-ti/udma/udma_git.bb                        |   4 +-
>  recipes-ti/uio-test-pruss/uio-test-pruss_git.bb    |   8 +-
>  recipes-ti/vlib/vlib-c66x.inc                      |   6 +-
>  recipes-ti/xdais/ti-xdais.inc                      |   6 +-
>  recipes-ti/xdais/ti-xdais_6.26.01.03.bb            |   2 +-
>  252 files changed, 832 insertions(+), 832 deletions(-)
> 
> diff --git a/classes/ti-pdk-fetch.bbclass b/classes/ti-pdk-fetch.bbclass
> index cacd71a..e4c55e3 100644
> --- a/classes/ti-pdk-fetch.bbclass
> +++ b/classes/ti-pdk-fetch.bbclass
> @@ -18,7 +18,7 @@ TI_PDK_SOURCE = "${TI_PDK_SOURCE_WORKDIR}/git"
>  S = "${@'${WORKDIR}/git/${TI_PDK_COMP_PATH}'.rstrip('/')}"
>  
>  # Hard-link only required sources from PDK
> -python do_unpack_append() {
> +python do_unpack:append() {
>      if len(d.getVar('TI_PDK_COMP') or '') > 0:
>          import shutil
>  
> diff --git a/classes/ti-pdk.bbclass b/classes/ti-pdk.bbclass
> index 6831421..21dd3ad 100644
> --- a/classes/ti-pdk.bbclass
> +++ b/classes/ti-pdk.bbclass
> @@ -5,14 +5,14 @@ inherit perlnative
>  
>  DEPENDS = "ti-xdctools-native ti-cg-xml-native ti-sysbios common-csl-ip-rtos libxml-simple-perl-native gcc-arm-baremetal-native ti-cgt6x-native ti-cgt-pru-native ti-pdk-build-rtos doxygen-native"
>  
> -DEPENDS_append_omap-a15 = " ti-cgt-arm-native"
> -DEPENDS_remove_ti33x = "ti-cgt6x-native"
> -DEPENDS_remove_ti43x = "ti-cgt6x-native"
> -DEPENDS_append_omapl1 = " ti-cgt-arm-native"
> -DEPENDS_remove_am65xx = "gcc-arm-baremetal-native ti-cgt6x-native"
> -DEPENDS_append_am65xx = " ti-cgt-arm-native gcc-linaro-baremetal-aarch64-native"
> -DEPENDS_remove_j7 = "gcc-arm-baremetal-native"
> -DEPENDS_append_j7 = " ti-cgt-arm-native gcc-linaro-baremetal-aarch64-native ti-cgt7x-native"
> +DEPENDS:append_omap-a15 = " ti-cgt-arm-native"
> +DEPENDS:remove_ti33x = "ti-cgt6x-native"
> +DEPENDS:remove_ti43x = "ti-cgt6x-native"
> +DEPENDS:append_omapl1 = " ti-cgt-arm-native"
> +DEPENDS:remove_am65xx = "gcc-arm-baremetal-native ti-cgt6x-native"
> +DEPENDS:append_am65xx = " ti-cgt-arm-native gcc-linaro-baremetal-aarch64-native"
> +DEPENDS:remove_j7 = "gcc-arm-baremetal-native"
> +DEPENDS:append_j7 = " ti-cgt-arm-native gcc-linaro-baremetal-aarch64-native ti-cgt7x-native"
>  
>  S = "${WORKDIR}/git"
>  B = "${WORKDIR}/build"
> @@ -141,4 +141,4 @@ do_install () {
>      fi
>  }
>  
> -FILES_${PN} += "${PDK_INSTALL_DIR_RECIPE}/packages"
> +FILES:${PN} += "${PDK_INSTALL_DIR_RECIPE}/packages"
> diff --git a/conf/layer.conf b/conf/layer.conf
> index 3bed9fc..9280d11 100644
> --- a/conf/layer.conf
> +++ b/conf/layer.conf
> @@ -8,7 +8,7 @@ BBFILE_COLLECTIONS += "meta-ti"
>  BBFILE_PATTERN_meta-ti := "^${LAYERDIR}/"
>  BBFILE_PRIORITY_meta-ti = "6"
>  
> -LAYERSERIES_COMPAT_meta-ti = "dunfell gatesgarth hardknott"
> +LAYERSERIES_COMPAT_meta-ti = "honister"
>  
>  LICENSE_PATH += "${LAYERDIR}/licenses"
>  
> diff --git a/conf/machine/am3517-evm.conf b/conf/machine/am3517-evm.conf
> index c20e2f6..f194c64 100644
> --- a/conf/machine/am3517-evm.conf
> +++ b/conf/machine/am3517-evm.conf
> @@ -8,7 +8,7 @@ MACHINE_GUI_CLASS = "smallscreen"
>  MACHINE_FEATURES += "touchscreen ethernet"
>  
>  IMAGE_FSTYPES += "ubi tar.xz"
> -EXTRA_IMAGECMD_jffs2 = "-lnp -e 0x20000 -s 2048"
> +EXTRA_IMAGECMD:jffs2 = "-lnp -e 0x20000 -s 2048"
>  
>  SERIAL_CONSOLES = "115200;ttyS2"
>  USE_VT = "2"
> diff --git a/conf/machine/am37x-evm.conf b/conf/machine/am37x-evm.conf
> index a512c8d..9750fe6 100644
> --- a/conf/machine/am37x-evm.conf
> +++ b/conf/machine/am37x-evm.conf
> @@ -8,7 +8,7 @@ MACHINE_GUI_CLASS = "smallscreen"
>  MACHINE_FEATURES += "touchscreen ethernet"
>  
>  IMAGE_FSTYPES += "ubi tar.xz"
> -EXTRA_IMAGECMD_jffs2 = "-lnp -e 0x20000 -s 2048"
> +EXTRA_IMAGECMD:jffs2 = "-lnp -e 0x20000 -s 2048"
>  
>  KERNEL_DEVICETREE = "omap3-evm-37xx.dtb"
>  
> diff --git a/conf/machine/am65xx-evm-k3r5-sr2.conf b/conf/machine/am65xx-evm-k3r5-sr2.conf
> index c0b3cd5..e74dd3a 100644
> --- a/conf/machine/am65xx-evm-k3r5-sr2.conf
> +++ b/conf/machine/am65xx-evm-k3r5-sr2.conf
> @@ -5,7 +5,7 @@
>  # Booting SR2 requires different SYSFW, the rest is handled at runtime
>  
>  require conf/machine/am65xx-evm-k3r5.conf
> -SOC_FAMILY_append = ":k3r5-sr2"
> +SOC_FAMILY:append = ":k3r5-sr2"
>  
>  SYSFW_SOC = "am65x_sr2"
>  SYSFW_SYMLINK = "sysfw.itb"
> diff --git a/conf/machine/am65xx-hs-evm-k3r5-sr2.conf b/conf/machine/am65xx-hs-evm-k3r5-sr2.conf
> index ef1b6fb..ff1645e 100644
> --- a/conf/machine/am65xx-hs-evm-k3r5-sr2.conf
> +++ b/conf/machine/am65xx-hs-evm-k3r5-sr2.conf
> @@ -5,7 +5,7 @@
>  # Booting SR2 requires different SYSFW, the rest is handled at runtime
>  
>  require conf/machine/am65xx-hs-evm-k3r5.conf
> -SOC_FAMILY_append = ":k3r5-sr2"
> +SOC_FAMILY:append = ":k3r5-sr2"
>  
>  SYSFW_SOC = "am65x_sr2"
>  SYSFW_SYMLINK = "sysfw.itb"
> diff --git a/conf/machine/beagleboard.conf b/conf/machine/beagleboard.conf
> index ee51fd6..0677779 100644
> --- a/conf/machine/beagleboard.conf
> +++ b/conf/machine/beagleboard.conf
> @@ -8,7 +8,7 @@ require conf/machine/include/omap3.inc
>  MACHINE_GUI_CLASS = "bigscreen"
>  
>  IMAGE_FSTYPES += "tar.xz ubi"
> -EXTRA_IMAGECMD_jffs2 = "-lnp"
> +EXTRA_IMAGECMD:jffs2 = "-lnp"
>  
>  KERNEL_DEVICETREE = "omap3-beagle.dtb omap3-beagle-xm.dtb omap3-beagle-xm-ab.dtb"
>  
> diff --git a/conf/machine/beaglebone.conf b/conf/machine/beaglebone.conf
> index 896a9d7..dcb14cc 100644
> --- a/conf/machine/beaglebone.conf
> +++ b/conf/machine/beaglebone.conf
> @@ -13,7 +13,7 @@ MACHINE_GUI_CLASS = "bigscreen"
>  
>  SERIAL_CONSOLES = "115200;ttyS0"
>  
> -IMAGE_INSTALL_append = " kernel-devicetree kernel-image-zimage"
> +IMAGE_INSTALL:append = " kernel-devicetree kernel-image-zimage"
>  
>  # Refine the list of device targets for ti-pdk class recipes
>  TI_PDK_LIMIT_BOARDS = "bbbAM335x"
> diff --git a/conf/machine/include/am64xx.inc b/conf/machine/include/am64xx.inc
> index 95fdc79..18e3757 100644
> --- a/conf/machine/include/am64xx.inc
> +++ b/conf/machine/include/am64xx.inc
> @@ -1,5 +1,5 @@
>  require conf/machine/include/k3.inc
> -SOC_FAMILY_append = ":am64xx"
> +SOC_FAMILY:append = ":am64xx"
>  
>  MACHINE_FEATURES += "screen touchscreen"
>  
> diff --git a/conf/machine/include/am65xx.inc b/conf/machine/include/am65xx.inc
> index 8516ca4..2838c58 100644
> --- a/conf/machine/include/am65xx.inc
> +++ b/conf/machine/include/am65xx.inc
> @@ -1,5 +1,5 @@
>  require conf/machine/include/k3.inc
> -SOC_FAMILY_append = ":am65xx"
> +SOC_FAMILY:append = ":am65xx"
>  
>  MACHINE_FEATURES += "screen touchscreen gpu"
>  
> diff --git a/conf/machine/include/c66x.inc b/conf/machine/include/c66x.inc
> index e35f2ed..33a657f 100644
> --- a/conf/machine/include/c66x.inc
> +++ b/conf/machine/include/c66x.inc
> @@ -1,5 +1,5 @@
>  require conf/machine/include/keystone.inc
> -SOC_FAMILY_append = ":c66x"
> +SOC_FAMILY:append = ":c66x"
>  
>  # HACK: The c66x family is composed of devices with only DSP cores, and no ARM
>  #       cores. The Linux kernel is not supported on these machines.
> diff --git a/conf/machine/include/davinci.inc b/conf/machine/include/davinci.inc
> index 62ca688..d268174 100644
> --- a/conf/machine/include/davinci.inc
> +++ b/conf/machine/include/davinci.inc
> @@ -17,6 +17,6 @@ UBOOT_LOADADDRESS = "0x80008000"
>  EXTRA_IMAGEDEPENDS += "u-boot"
>  
>  SERIAL_CONSOLES ?= "115200;ttyS0"
> -EXTRA_IMAGECMD_jffs2 = "--pad --little-endian --eraseblock=0x20000 -n"
> +EXTRA_IMAGECMD:jffs2 = "--pad --little-endian --eraseblock=0x20000 -n"
>  
>  MACHINE_FEATURES = "kernel26 serial ethernet usbhost usbgadget mmc alsa"
> diff --git a/conf/machine/include/dra7xx.inc b/conf/machine/include/dra7xx.inc
> index 857e1b3..a02421d 100644
> --- a/conf/machine/include/dra7xx.inc
> +++ b/conf/machine/include/dra7xx.inc
> @@ -1,4 +1,4 @@
>  require conf/machine/include/omap-a15.inc
> -SOC_FAMILY_append = ":dra7xx"
> +SOC_FAMILY:append = ":dra7xx"
>  
>  MACHINE_FEATURES += "pci"
> diff --git a/conf/machine/include/j7.inc b/conf/machine/include/j7.inc
> index d3eda1a..cf5f6a9 100644
> --- a/conf/machine/include/j7.inc
> +++ b/conf/machine/include/j7.inc
> @@ -1,5 +1,5 @@
>  require conf/machine/include/k3.inc
> -SOC_FAMILY_append = ":j7"
> +SOC_FAMILY:append = ":j7"
>  
>  OPTEEMACHINE = "k3-j721e"
>  OPTEEOUTPUTMACHINE = "k3"
> diff --git a/conf/machine/include/k2e.inc b/conf/machine/include/k2e.inc
> index 6797fb2..a6d58bb 100644
> --- a/conf/machine/include/k2e.inc
> +++ b/conf/machine/include/k2e.inc
> @@ -1,5 +1,5 @@
>  require conf/machine/include/keystone.inc
> -SOC_FAMILY_append = ":k2e"
> +SOC_FAMILY:append = ":k2e"
>  
>  # Set the list of device targets for ti-pdk class recipes
>  TI_PDK_LIMIT_SOCS = "k2e"
> diff --git a/conf/machine/include/k2g.inc b/conf/machine/include/k2g.inc
> index 7bcc412..be40d9e 100644
> --- a/conf/machine/include/k2g.inc
> +++ b/conf/machine/include/k2g.inc
> @@ -1,5 +1,5 @@
>  require conf/machine/include/keystone.inc
> -SOC_FAMILY_append = ":k2g"
> +SOC_FAMILY:append = ":k2g"
>  
>  # Set the list of device targets for ti-pdk class recipes
>  TI_PDK_LIMIT_SOCS = "k2g"
> diff --git a/conf/machine/include/k2hk.inc b/conf/machine/include/k2hk.inc
> index 2d2dd6a..456fda7 100644
> --- a/conf/machine/include/k2hk.inc
> +++ b/conf/machine/include/k2hk.inc
> @@ -1,5 +1,5 @@
>  require conf/machine/include/keystone.inc
> -SOC_FAMILY_append = ":k2hk"
> +SOC_FAMILY:append = ":k2hk"
>  
>  # Set the list of device targets for ti-pdk class recipes
>  TI_PDK_LIMIT_SOCS = "k2h k2k"
> diff --git a/conf/machine/include/k2l.inc b/conf/machine/include/k2l.inc
> index 997bcbe..b6a4bc7 100644
> --- a/conf/machine/include/k2l.inc
> +++ b/conf/machine/include/k2l.inc
> @@ -1,5 +1,5 @@
>  require conf/machine/include/keystone.inc
> -SOC_FAMILY_append = ":k2l"
> +SOC_FAMILY:append = ":k2l"
>  
>  # Set the list of device targets for ti-pdk class recipes
>  TI_PDK_LIMIT_SOCS = "k2l"
> diff --git a/conf/machine/include/k3.inc b/conf/machine/include/k3.inc
> index e097069..20ab7a9 100644
> --- a/conf/machine/include/k3.inc
> +++ b/conf/machine/include/k3.inc
> @@ -1,7 +1,7 @@
>  # TI K3 Aarch64 profile for Cortex-A53/A72 cores
>  
>  require conf/machine/include/ti-soc.inc
> -SOC_FAMILY_append = ":k3"
> +SOC_FAMILY:append = ":k3"
>  
>  require conf/machine/include/arm/arch-arm64.inc
>  
> diff --git a/conf/machine/include/k3r5.inc b/conf/machine/include/k3r5.inc
> index a32acca..93f08c0 100644
> --- a/conf/machine/include/k3r5.inc
> +++ b/conf/machine/include/k3r5.inc
> @@ -1,7 +1,7 @@
>  # TI K3 Armv7 profile for Cortex-R5F cores
>  
>  require conf/machine/include/ti-soc.inc
> -SOC_FAMILY_append = ":k3r5"
> +SOC_FAMILY:append = ":k3r5"
>  
>  # The closest of existing tunes for Cortex-R5F
>  DEFAULTTUNE = "armv7athf"
> @@ -20,5 +20,5 @@ UBOOT_BINARY = "tiboot3.${UBOOT_SUFFIX}"
>  UBOOT_IMAGE = "tiboot3-${MAINMACHINE}-${PV}-${PR}.${UBOOT_SUFFIX}"
>  UBOOT_SYMLINK = "tiboot3-${MAINMACHINE}.${UBOOT_SUFFIX}"
>  
> -PACKAGECONFIG_pn-u-boot-ti-staging = ""
> -PACKAGECONFIG_pn-u-boot-ti-mainline = ""
> +PACKAGECONFIG:pn-u-boot-ti-staging = ""
> +PACKAGECONFIG:pn-u-boot-ti-mainline = ""
> diff --git a/conf/machine/include/keystone.inc b/conf/machine/include/keystone.inc
> index e7ea975..83dca19 100644
> --- a/conf/machine/include/keystone.inc
> +++ b/conf/machine/include/keystone.inc
> @@ -1,5 +1,5 @@
>  require conf/machine/include/ti-soc.inc
> -SOC_FAMILY_append = ":keystone"
> +SOC_FAMILY:append = ":keystone"
>  
>  DEFAULTTUNE ?= "armv7athf-neon"
>  require conf/machine/include/tune-cortexa15.inc
> diff --git a/conf/machine/include/omap-a15.inc b/conf/machine/include/omap-a15.inc
> index e491d2b..553835c 100644
> --- a/conf/machine/include/omap-a15.inc
> +++ b/conf/machine/include/omap-a15.inc
> @@ -1,5 +1,5 @@
>  require conf/machine/include/ti-soc.inc
> -SOC_FAMILY_append = ":omap-a15"
> +SOC_FAMILY:append = ":omap-a15"
>  
>  DEFAULTTUNE ?= "armv7athf-neon"
>  require conf/machine/include/tune-cortexa15.inc
> diff --git a/conf/machine/include/omap3.inc b/conf/machine/include/omap3.inc
> index 5696c82..ab069b0 100644
> --- a/conf/machine/include/omap3.inc
> +++ b/conf/machine/include/omap3.inc
> @@ -1,5 +1,5 @@
>  require conf/machine/include/ti-soc.inc
> -SOC_FAMILY_append = ":omap3"
> +SOC_FAMILY:append = ":omap3"
>  
>  DEFAULTTUNE ?= "armv7athf-neon"
>  require conf/machine/include/tune-cortexa8.inc
> diff --git a/conf/machine/include/omap4.inc b/conf/machine/include/omap4.inc
> index cbca267..b6f4374 100644
> --- a/conf/machine/include/omap4.inc
> +++ b/conf/machine/include/omap4.inc
> @@ -1,5 +1,5 @@
>  require conf/machine/include/ti-soc.inc
> -SOC_FAMILY_append = ":omap4"
> +SOC_FAMILY:append = ":omap4"
>  
>  DEFAULTTUNE ?= "armv7athf-neon"
>  require conf/machine/include/tune-cortexa9.inc
> diff --git a/conf/machine/include/omapl1.inc b/conf/machine/include/omapl1.inc
> index 9942c94..d0262c3 100644
> --- a/conf/machine/include/omapl1.inc
> +++ b/conf/machine/include/omapl1.inc
> @@ -1,2 +1,2 @@
>  require conf/machine/include/ti-soc.inc
> -SOC_FAMILY_append = ":omapl1"
> +SOC_FAMILY:append = ":omapl1"
> diff --git a/conf/machine/include/omapl137.inc b/conf/machine/include/omapl137.inc
> index 5d8a6dd..6dd4941 100644
> --- a/conf/machine/include/omapl137.inc
> +++ b/conf/machine/include/omapl137.inc
> @@ -1,5 +1,5 @@
>  require conf/machine/include/omapl1.inc
> -SOC_FAMILY_append = ":omapl137"
> +SOC_FAMILY:append = ":omapl137"
>  
>  # Set the list of device targets for ti-pdk class recipes
>  TI_PDK_LIMIT_SOCS = "omapl137"
> diff --git a/conf/machine/include/omapl138.inc b/conf/machine/include/omapl138.inc
> index 999cbc3..f73517d 100644
> --- a/conf/machine/include/omapl138.inc
> +++ b/conf/machine/include/omapl138.inc
> @@ -1,5 +1,5 @@
>  require conf/machine/include/omapl1.inc
> -SOC_FAMILY_append = ":omapl138"
> +SOC_FAMILY:append = ":omapl138"
>  
>  # Set the list of device targets for ti-pdk class recipes
>  TI_PDK_LIMIT_SOCS = "omapl138"
> diff --git a/conf/machine/include/ti33x.inc b/conf/machine/include/ti33x.inc
> index 6dfda75..3da2aba 100644
> --- a/conf/machine/include/ti33x.inc
> +++ b/conf/machine/include/ti33x.inc
> @@ -1,5 +1,5 @@
>  require conf/machine/include/ti-soc.inc
> -SOC_FAMILY_append = ":ti33x"
> +SOC_FAMILY:append = ":ti33x"
>  
>  DEFAULTTUNE ?= "armv7athf-neon"
>  require conf/machine/include/tune-cortexa8.inc
> diff --git a/conf/machine/include/ti43x.inc b/conf/machine/include/ti43x.inc
> index b1a27f9..eaed181 100644
> --- a/conf/machine/include/ti43x.inc
> +++ b/conf/machine/include/ti43x.inc
> @@ -1,5 +1,5 @@
>  require conf/machine/include/ti-soc.inc
> -SOC_FAMILY_append = ":ti43x"
> +SOC_FAMILY:append = ":ti43x"
>  
>  DEFAULTTUNE ?= "armv7athf-neon"
>  require conf/machine/include/tune-cortexa9.inc
> diff --git a/conf/machine/omap3evm.conf b/conf/machine/omap3evm.conf
> index 01808b6..dc56d57 100644
> --- a/conf/machine/omap3evm.conf
> +++ b/conf/machine/omap3evm.conf
> @@ -8,7 +8,7 @@ MACHINE_GUI_CLASS = "smallscreen"
>  MACHINE_FEATURES += "touchscreen ethernet"
>  
>  IMAGE_FSTYPES += "jffs2 tar.xz"
> -EXTRA_IMAGECMD_jffs2 = "-lnp -e 0x20000 -s 2048"
> +EXTRA_IMAGECMD:jffs2 = "-lnp -e 0x20000 -s 2048"
>  
>  SERIAL_CONSOLES = "115200;ttyS0"
>  USE_VT = "0"
> diff --git a/conf/multiconfig/k3r5-sr2.conf b/conf/multiconfig/k3r5-sr2.conf
> index 1708214..e933b9c 100644
> --- a/conf/multiconfig/k3r5-sr2.conf
> +++ b/conf/multiconfig/k3r5-sr2.conf
> @@ -1,3 +1,3 @@
>  require k3r5.conf
>  
> -MACHINE_append = "-sr2"
> +MACHINE:append = "-sr2"
> diff --git a/conf/multiconfig/k3r5.conf b/conf/multiconfig/k3r5.conf
> index 8c8f0c3..deb0721 100644
> --- a/conf/multiconfig/k3r5.conf
> +++ b/conf/multiconfig/k3r5.conf
> @@ -2,4 +2,4 @@ MAINMACHINE := "${MACHINE}"
>  
>  DEPLOY_DIR_IMAGE = "${DEPLOY_DIR}/images/${MAINMACHINE}"
>  
> -MACHINE_append = "-k3r5"
> +MACHINE:append = "-k3r5"
> diff --git a/recipes-bsp/abefw/abefw_1.0.14.bb b/recipes-bsp/abefw/abefw_1.0.14.bb
> index 302bdcd..a6cc624 100644
> --- a/recipes-bsp/abefw/abefw_1.0.14.bb
> +++ b/recipes-bsp/abefw/abefw_1.0.14.bb
> @@ -20,4 +20,4 @@ do_install() {
>          cp ${S}/firmware/omap4_abe_new ${D}/lib/firmware/
>  }
>  
> -FILES_${PN} += "/lib/firmware/omap4_abe_new"
> +FILES:${PN} += "/lib/firmware/omap4_abe_new"
> diff --git a/recipes-bsp/aif2-lld/aif2-lld-rtos_git.bb b/recipes-bsp/aif2-lld/aif2-lld-rtos_git.bb
> index 962965b..048a243 100644
> --- a/recipes-bsp/aif2-lld/aif2-lld-rtos_git.bb
> +++ b/recipes-bsp/aif2-lld/aif2-lld-rtos_git.bb
> @@ -6,7 +6,7 @@ require recipes-bsp/aif2-lld/aif2-lld.inc
>  
>  PR = "${INC_PR}.0"
>  
> -DEPENDS_append = " qmss-lld-rtos \
> +DEPENDS:append = " qmss-lld-rtos \
>                     cppi-lld-rtos \
>  "
>  
> diff --git a/recipes-bsp/aif2-lld/aif2-lld-test_git.bb b/recipes-bsp/aif2-lld/aif2-lld-test_git.bb
> index 9180b95..d432862 100644
> --- a/recipes-bsp/aif2-lld/aif2-lld-test_git.bb
> +++ b/recipes-bsp/aif2-lld/aif2-lld-test_git.bb
> @@ -6,7 +6,7 @@ include aif2-lld.inc
>  
>  PR = "${INC_PR}.0"
>  
> -EXTRA_OEMAKE = "-f makefile_armv7 PDK_INSTALL_PATH=${STAGING_INCDIR} AIF2_SRC_DIR=${WORKDIR}/git"
> +EXTRA_OEMAKE = "-f makefile:armv7 PDK_INSTALL_PATH=${STAGING_INCDIR} AIF2_SRC_DIR=${WORKDIR}/git"
>  
>  do_compile () {
>      oe_runmake clean DEVICE=k2hk
> diff --git a/recipes-bsp/aif2-lld/aif2-lld_git.bb b/recipes-bsp/aif2-lld/aif2-lld_git.bb
> index 4a640f1..d9283a3 100644
> --- a/recipes-bsp/aif2-lld/aif2-lld_git.bb
> +++ b/recipes-bsp/aif2-lld/aif2-lld_git.bb
> @@ -6,7 +6,7 @@ include aif2-lld.inc
>  
>  PR = "${INC_PR}.0"
>  
> -EXTRA_OEMAKE = "-f makefile_armv7 PDK_INSTALL_PATH=${STAGING_INCDIR}"
> +EXTRA_OEMAKE = "-f makefile:armv7 PDK_INSTALL_PATH=${STAGING_INCDIR}"
>  
>  do_compile () {
>      oe_runmake lib DEVICE=k2hk
> diff --git a/recipes-bsp/alsa-state/alsa-state.bbappend b/recipes-bsp/alsa-state/alsa-state.bbappend
> index 72d991c..4fc41d0 100644
> --- a/recipes-bsp/alsa-state/alsa-state.bbappend
> +++ b/recipes-bsp/alsa-state/alsa-state.bbappend
> @@ -1 +1 @@
> -FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
> +FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
> diff --git a/recipes-bsp/audk2g-addon/audk2g-addon-rtos_git.bb b/recipes-bsp/audk2g-addon/audk2g-addon-rtos_git.bb
> index 0cb9ff1..e40fb43 100644
> --- a/recipes-bsp/audk2g-addon/audk2g-addon-rtos_git.bb
> +++ b/recipes-bsp/audk2g-addon/audk2g-addon-rtos_git.bb
> @@ -25,7 +25,7 @@ PR = "r0"
>  
>  S = "${WORKDIR}/git/ti/addon/audk2g"
>  
> -DEPENDS_append = " ti-sysbios \
> +DEPENDS:append = " ti-sysbios \
>              gpio-lld-rtos \
>              i2c-lld-rtos \
>              board-rtos \
> diff --git a/recipes-bsp/bcp-lld/bcp-lld-rtos_git.bb b/recipes-bsp/bcp-lld/bcp-lld-rtos_git.bb
> index 62cee07..d808267 100644
> --- a/recipes-bsp/bcp-lld/bcp-lld-rtos_git.bb
> +++ b/recipes-bsp/bcp-lld/bcp-lld-rtos_git.bb
> @@ -15,7 +15,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
>  PR = "r0"
>  
>  
> -DEPENDS_append = " qmss-lld-rtos \
> +DEPENDS:append = " qmss-lld-rtos \
>                     cppi-lld-rtos \
>  "
>  
> diff --git a/recipes-bsp/board-rtos/board-rtos_git.bb b/recipes-bsp/board-rtos/board-rtos_git.bb
> index a6547d3..485b065 100644
> --- a/recipes-bsp/board-rtos/board-rtos_git.bb
> +++ b/recipes-bsp/board-rtos/board-rtos_git.bb
> @@ -16,24 +16,24 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
>  PR = "r0"
>  
> -DEPENDS_append = " i2c-lld-rtos \
> +DEPENDS:append = " i2c-lld-rtos \
>                     spi-lld-rtos \
>                     uart-lld-rtos \
>                     osal-rtos \
>  "
>  
> -DEPENDS_append_omap-a15 = " ti-ndk \
> +DEPENDS:append_omap-a15 = " ti-ndk \
>                              mmcsd-lld-rtos \
>                              pm-lld-rtos \
>  "
>  
> -DEPENDS_append_am57xx-evm = " gpio-lld-rtos \
> +DEPENDS:append_am57xx-evm = " gpio-lld-rtos \
>                                icss-emac-lld-rtos \
>                                pruss-lld-rtos \
>  "
>  
>  
> -DEPENDS_append_ti33x = " gpio-lld-rtos \
> +DEPENDS:append_ti33x = " gpio-lld-rtos \
>                           gpmc-lld-rtos \
>                           icss-emac-lld-rtos \
>                           mmcsd-lld-rtos \
> @@ -42,7 +42,7 @@ DEPENDS_append_ti33x = " gpio-lld-rtos \
>                           ti-ndk \
>  "
>  
> -DEPENDS_append_ti43x = " gpio-lld-rtos \
> +DEPENDS:append_ti43x = " gpio-lld-rtos \
>                           gpmc-lld-rtos \
>                           icss-emac-lld-rtos \
>                           mmcsd-lld-rtos \
> @@ -51,13 +51,13 @@ DEPENDS_append_ti43x = " gpio-lld-rtos \
>                           ti-ndk \
>  "
>  
> -DEPENDS_append_dra7xx = " pm-lld-rtos \
> +DEPENDS:append_dra7xx = " pm-lld-rtos \
>                            mmcsd-lld-rtos \
>  "
>  
> -DEPENDS_append_am65xx = " sciclient-rtos \
> +DEPENDS:append_am65xx = " sciclient-rtos \
>  "
> -DEPENDS_append_j7 = " udma-lld-rtos \
> +DEPENDS:append_j7 = " udma-lld-rtos \
>                            sciclient-rtos \
>                            mmcsd-lld-rtos \
>  "
> @@ -71,6 +71,6 @@ INHIBIT_PACKAGE_STRIP = "1"
>  export PDK_BOARD_ROOT_PATH ="${WORKDIR}/build"
>  export DEST_ROOT="${S}"
>  
> -XDCPATH_append = ";${PDK_INSTALL_DIR}/packages/ti/csl;${NDK_INSTALL_DIR}/packages"
> +XDCPATH:append = ";${PDK_INSTALL_DIR}/packages/ti/csl;${NDK_INSTALL_DIR}/packages"
>  
> -INSANE_SKIP_${PN} = "arch"
> +INSANE_SKIP:${PN} = "arch"
> diff --git a/recipes-bsp/boot-monitor/boot-monitor_git.bb b/recipes-bsp/boot-monitor/boot-monitor_git.bb
> index 9c436d1..dee180f 100644
> --- a/recipes-bsp/boot-monitor/boot-monitor_git.bb
> +++ b/recipes-bsp/boot-monitor/boot-monitor_git.bb
> @@ -23,7 +23,7 @@ FLOATABI = "${@bb.utils.contains("TUNE_FEATURES", "vfp", bb.utils.contains("TUNE
>  
>  EXTRA_OEMAKE = "CROSS_COMPILE=${TARGET_PREFIX} CC="${TARGET_PREFIX}gcc ${TOOLCHAIN_OPTIONS} ${FLOATABI}" LD="${TARGET_PREFIX}gcc ${TOOLCHAIN_OPTIONS} ${FLOATABI}""
>  
> -FILES_${PN} = "/boot"
> +FILES:${PN} = "/boot"
>  
>  inherit deploy
>  
> diff --git a/recipes-bsp/bt-fw/bt-fw_git.bb b/recipes-bsp/bt-fw/bt-fw_git.bb
> index f3d740b..ea42c16 100644
> --- a/recipes-bsp/bt-fw/bt-fw_git.bb
> +++ b/recipes-bsp/bt-fw/bt-fw_git.bb
> @@ -21,4 +21,4 @@ do_install() {
>      oe_runmake "DEST_DIR=${D}" "BASE_LIB_DIR=${base_libdir}" install
>  }
>  
> -FILES_${PN} += "${base_libdir}/firmware/ti-connectivity/*"
> +FILES:${PN} += "${base_libdir}/firmware/ti-connectivity/*"
> diff --git a/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb b/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb
> index 6d857f7..ccaa3e6 100644
> --- a/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb
> +++ b/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb
> @@ -25,4 +25,4 @@ do_install() {
>  	install -m 0644 ${S}/cadence/${TARGET} ${D}${base_libdir}/firmware/cadence/${TARGET}
>  }
>  
> -FILES_${PN} = "${base_libdir}/firmware"
> +FILES:${PN} = "${base_libdir}/firmware"
> diff --git a/recipes-bsp/cal-lld/cal-lld-rtos_git.bb b/recipes-bsp/cal-lld/cal-lld-rtos_git.bb
> index f3c780f..aef2189 100644
> --- a/recipes-bsp/cal-lld/cal-lld-rtos_git.bb
> +++ b/recipes-bsp/cal-lld/cal-lld-rtos_git.bb
> @@ -15,7 +15,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
>  PR = "r0"
>  
> -DEPENDS_append = " osal-rtos \
> +DEPENDS:append = " osal-rtos \
>                     fvid2-rtos \
>  "
>  
> @@ -71,6 +71,6 @@ do_install() {
>      find -name "*.tar" -exec tar xf {} --no-same-owner -C ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/drv/cal \;
>  }
>  
> -FILES_${PN} += "${PDK_INSTALL_DIR_RECIPE}/packages"
> +FILES:${PN} += "${PDK_INSTALL_DIR_RECIPE}/packages"
>  
> -INSANE_SKIP_${PN} = "arch ldflags"
> +INSANE_SKIP:${PN} = "arch ldflags"
> diff --git a/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb b/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb
> index bbbc3ec..bd5c369 100644
> --- a/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb
> +++ b/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb
> @@ -23,7 +23,7 @@ do_install() {
>  	install -m 0644 bin/*-scale-data.bin ${D}${base_libdir}/firmware/
>  }
>  
> -FILES_${PN} += "${base_libdir}/firmware"
> +FILES:${PN} += "${base_libdir}/firmware"
>  
>  COMPATIBLE_MACHINE = "(ti-soc)"
>  TOOLCHAIN = "gcc"
> diff --git a/recipes-bsp/cmb-addon/cmb-addon-rtos_git.bb b/recipes-bsp/cmb-addon/cmb-addon-rtos_git.bb
> index 38f9a43..8ca4416 100644
> --- a/recipes-bsp/cmb-addon/cmb-addon-rtos_git.bb
> +++ b/recipes-bsp/cmb-addon/cmb-addon-rtos_git.bb
> @@ -27,7 +27,7 @@ SRC_URI = "${CMB_ADDON_GIT_URI};destsuffix=${CMB_ADDON_GIT_DESTSUFFIX};protocol=
>  
>  S = "${WORKDIR}/git/ti/addon/cmb"
>  
> -DEPENDS_append = " ti-sysbios \
> +DEPENDS:append = " ti-sysbios \
>              gpio-lld-rtos \
>              i2c-lld-rtos \
>              mcasp-lld-rtos \
> diff --git a/recipes-bsp/cmem/cmem-mod_git.bb b/recipes-bsp/cmem/cmem-mod_git.bb
> index 1031e85..f796559 100644
> --- a/recipes-bsp/cmem/cmem-mod_git.bb
> +++ b/recipes-bsp/cmem/cmem-mod_git.bb
> @@ -3,7 +3,7 @@ DESCRIPTION = "Kernel module for contiguous memory allocation from userspace"
>  include cmem.inc
>  
>  # This package builds a kernel module, use kernel PR as base and append a local
> -MACHINE_KERNEL_PR_append = "a"
> +MACHINE_KERNEL_PR:append = "a"
>  PR = "${MACHINE_KERNEL_PR}"
>  
>  inherit module
> @@ -13,6 +13,6 @@ MAKE_TARGETS = "module"
>  
>  KERNEL_MODULE_AUTOLOAD += "cmemk"
>  
> -do_install_prepend() {
> +do_install:prepend() {
>      cp ${B}/src/cmem/module/Module.symvers ${B}/ || true
>  }
> diff --git a/recipes-bsp/cmem/cmem_git.bb b/recipes-bsp/cmem/cmem_git.bb
> index bab9238..f69c22f 100644
> --- a/recipes-bsp/cmem/cmem_git.bb
> +++ b/recipes-bsp/cmem/cmem_git.bb
> @@ -2,12 +2,12 @@ DESCRIPTION = "The cmem component supports contiguous memory allocation from use
>  
>  include cmem.inc
>  
> -RDEPENDS_${PN} = "cmem-mod"
> +RDEPENDS:${PN} = "cmem-mod"
>  
>  PR = "r0"
>  
>  PACKAGES =+ "${PN}-test"
>  
> -FILES_${PN}-test = "${bindir}/*"
> +FILES:${PN}-test = "${bindir}/*"
>  
>  inherit autotools
> diff --git a/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb b/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb
> index 6479d9f..0059177 100644
> --- a/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb
> +++ b/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb
> @@ -2,12 +2,12 @@ require common-csl-ip.inc
>  PR = "${INC_PR}.6"
>  
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
> -COMPATIBLE_MACHINE_append = "|c66x|k3"
> +COMPATIBLE_MACHINE:append = "|c66x|k3"
>  
>  inherit ti-pdk
>  
> -DEPENDS_remove = "${PN}"
> -DEPENDS_remove = "ti-sysbios"
> +DEPENDS:remove = "${PN}"
> +DEPENDS:remove = "ti-sysbios"
>  
>  # Build with make instead of XDC
>  TI_PDK_XDCMAKE = "0"
> @@ -19,5 +19,5 @@ export DEST_ROOT="${S}"
>  PDK_COMP_LINK_TEXT = "CSL-Chip Support Library"
>  
>  # Workaround: dra7xx build requires am57xx CSL libraries for opencl-monitor
> -TI_PDK_LIMIT_SOCS_append_dra7xx = " am571x am572x am574x"
> -TI_PDK_LIMIT_BOARDS_append_dra7xx = " evmAM571x evmAM572x idkAM574x"
> +TI_PDK_LIMIT_SOCS:append_dra7xx = " am571x am572x am574x"
> +TI_PDK_LIMIT_BOARDS:append_dra7xx = " evmAM571x evmAM572x idkAM574x"
> diff --git a/recipes-bsp/common-csl-ip/common-csl-ip_git.bb b/recipes-bsp/common-csl-ip/common-csl-ip_git.bb
> index 9ea87d3..6fffc7e 100644
> --- a/recipes-bsp/common-csl-ip/common-csl-ip_git.bb
> +++ b/recipes-bsp/common-csl-ip/common-csl-ip_git.bb
> @@ -2,7 +2,7 @@ require common-csl-ip.inc
>  
>  PR = "${INC_PR}.0"
>  
> -ALLOW_EMPTY_${PN} = "1"
> +ALLOW_EMPTY:${PN} = "1"
>  
>  CLEANBROKEN = "1"
>  
> diff --git a/recipes-bsp/common-csl-ip/csl-rti-dwwdtest-fw_git.bb b/recipes-bsp/common-csl-ip/csl-rti-dwwdtest-fw_git.bb
> index 55e583b..a793659 100644
> --- a/recipes-bsp/common-csl-ip/csl-rti-dwwdtest-fw_git.bb
> +++ b/recipes-bsp/common-csl-ip/csl-rti-dwwdtest-fw_git.bb
> @@ -47,15 +47,15 @@ do_install() {
>  # Create separate package for each firmware so we can utilize
>  # update-alternatives.
>  PACKAGES =+ "${PN}-evm ${PN}-idk"
> -RDEPENDS_${PN} = "${PN}-evm ${PN}-idk"
> -ALLOW_EMPTY_${PN} = "1"
> +RDEPENDS:${PN} = "${PN}-evm ${PN}-idk"
> +ALLOW_EMPTY:${PN} = "1"
>  
> -FILES_${PN}-evm = "${base_libdir}/firmware/rti_dwwdtest/am65xx_evm"
> -FILES_${PN}-idk = "${base_libdir}/firmware/rti_dwwdtest/am65xx_idk"
> +FILES:${PN}-evm = "${base_libdir}/firmware/rti_dwwdtest/am65xx_evm"
> +FILES:${PN}-idk = "${base_libdir}/firmware/rti_dwwdtest/am65xx_idk"
>  
>  # We are packaging R5 firmware
> -INSANE_SKIP_${PN}-evm = "arch"
> -INSANE_SKIP_${PN}-idk = "arch"
> +INSANE_SKIP:${PN}-evm = "arch"
> +INSANE_SKIP:${PN}-idk = "arch"
>  
>  # Configure update-alternatives as there may be other firmwares provided in an
>  # image.
> @@ -63,8 +63,8 @@ inherit update-alternatives
>  
>  # It might be nice to dynamically declare the following based on
>  # TI_PDK_LIMIT_BOARDS, but that is probably overkill.
> -ALTERNATIVE_${PN}-evm = "am65x-mcu-r5f0_0-fw"
> -ALTERNATIVE_${PN}-idk = "am65x-mcu-r5f0_0-fw"
> +ALTERNATIVE:${PN}-evm = "am65x-mcu-r5f0_0-fw"
> +ALTERNATIVE:${PN}-idk = "am65x-mcu-r5f0_0-fw"
>  
>  ALTERNATIVE_LINK_NAME[am65x-mcu-r5f0_0-fw] = "${base_libdir}/firmware/am65x-mcu-r5f0_0-fw"
>  
> diff --git a/recipes-bsp/cppi-lld/cppi-lld-rtos_git.bb b/recipes-bsp/cppi-lld/cppi-lld-rtos_git.bb
> index 1cdaf3a..49a9940 100644
> --- a/recipes-bsp/cppi-lld/cppi-lld-rtos_git.bb
> +++ b/recipes-bsp/cppi-lld/cppi-lld-rtos_git.bb
> @@ -3,8 +3,8 @@ require cppi-lld.inc
>  
>  PR = "${INC_PR}.1"
>  
> -COMPATIBLE_MACHINE_append = "|c66x"
> +COMPATIBLE_MACHINE:append = "|c66x"
>  
> -DEPENDS_append = " rm-lld-rtos \
> +DEPENDS:append = " rm-lld-rtos \
>                     qmss-lld-rtos \
>  "
> diff --git a/recipes-bsp/cppi-lld/cppi-lld-test_git.bb b/recipes-bsp/cppi-lld/cppi-lld-test_git.bb
> index 0c630b4..dd94f92 100644
> --- a/recipes-bsp/cppi-lld/cppi-lld-test_git.bb
> +++ b/recipes-bsp/cppi-lld/cppi-lld-test_git.bb
> @@ -13,10 +13,10 @@ do_compile () {
>  #   Now build the lld in the updated directory
>  	for device in ${DEVICELIST}
>  	do
> -		make -f makefile_armv7 clean PDK_INSTALL_PATH=${STAGING_INCDIR} DEVICE="$device" CPPI_SRC_DIR=${S}
> +		make -f makefile:armv7 clean PDK_INSTALL_PATH=${STAGING_INCDIR} DEVICE="$device" CPPI_SRC_DIR=${S}
>  		for choice in ${CHOICELIST}
>  		do
> -			make -f makefile_armv7 tests examples PDK_INSTALL_PATH=${STAGING_INCDIR} DEVICE="$device" CPPI_SRC_DIR=${S} USEDYNAMIC_LIB="$choice"
> +			make -f makefile:armv7 tests examples PDK_INSTALL_PATH=${STAGING_INCDIR} DEVICE="$device" CPPI_SRC_DIR=${S} USEDYNAMIC_LIB="$choice"
>  		done
>  	done
>  }
> @@ -24,6 +24,6 @@ do_compile () {
>  do_install () {
>  	for device in ${DEVICELIST}
>  do
> -	make -f makefile_armv7 installbin PDK_INSTALL_PATH=${STAGING_INCDIR} DEVICE="$device" CPPI_SRC_DIR=${S} INSTALL_BIN_BASE_DIR=${D}${bindir}
> +	make -f makefile:armv7 installbin PDK_INSTALL_PATH=${STAGING_INCDIR} DEVICE="$device" CPPI_SRC_DIR=${S} INSTALL_BIN_BASE_DIR=${D}${bindir}
>  	done
>  }
> diff --git a/recipes-bsp/cppi-lld/cppi-lld_git.bb b/recipes-bsp/cppi-lld/cppi-lld_git.bb
> index 3cdcd22..4480714 100644
> --- a/recipes-bsp/cppi-lld/cppi-lld_git.bb
> +++ b/recipes-bsp/cppi-lld/cppi-lld_git.bb
> @@ -8,15 +8,15 @@ PR = "${INC_PR}.1"
>  
>  do_compile () {
>  #   Now build the lld in the updated directory
> -	make -f makefile_armv7 clean PDK_INSTALL_PATH=${STAGING_INCDIR}
> +	make -f makefile:armv7 clean PDK_INSTALL_PATH=${STAGING_INCDIR}
>  	for device in ${DEVICELIST}
>  	do
> -		make -f makefile_armv7 lib PDK_INSTALL_PATH=${STAGING_INCDIR}  DEVICE="${device}"
> +		make -f makefile:armv7 lib PDK_INSTALL_PATH=${STAGING_INCDIR}  DEVICE="${device}"
>  	done
>  }
>  
>  do_install () {
> -    make -f makefile_armv7 install PDK_INSTALL_PATH=${STAGING_INCDIR} INSTALL_INC_BASE_DIR=${D}/${includedir} INSTALL_LIB_BASE_DIR=${D}${libdir}
> +    make -f makefile:armv7 install PDK_INSTALL_PATH=${STAGING_INCDIR} INSTALL_INC_BASE_DIR=${D}/${includedir} INSTALL_LIB_BASE_DIR=${D}${libdir}
>      chown -R root:root ${D}
>  
>  #   Set the generic device library symbolic link to default k2h
> @@ -35,4 +35,4 @@ INHIBIT_PACKAGE_STRIP_FILES_k2hk = "${PKGD}${libdir}/libcppi_k2h.a ${PKGD}${libd
>  INHIBIT_PACKAGE_STRIP_FILES_k2e = "${PKGD}${libdir}/libcppi_k2e.a"
>  INHIBIT_PACKAGE_STRIP_FILES_k2l = "${PKGD}${libdir}/libcppi_k2l.a"
>  INHIBIT_PACKAGE_STRIP_FILES_k2g = "${PKGD}${libdir}/libcppi_k2h.a"
> -INHIBIT_PACKAGE_STRIP_FILES_append = " ${PKGD}${libdir}/libcppi.a"
> +INHIBIT_PACKAGE_STRIP_FILES:append = " ${PKGD}${libdir}/libcppi.a"
> diff --git a/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb b/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb
> index 8cb62b2..ed36951 100755
> --- a/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb
> +++ b/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb
> @@ -21,7 +21,7 @@ CPSW9G_FW_DIR = "${S}/ethfw"
>  CPSW9G_FW_FILENAME = "app_remoteswitchcfg_server_pdk_mem_map_strip.xer5f"
>  
>  # make sure that lib/firmware, and all its contents are part of the package
> -FILES_${PN} += "${base_libdir}/firmware"
> +FILES:${PN} += "${base_libdir}/firmware"
>  
>  do_install() {
>    install -d ${D}${base_libdir}/firmware
> @@ -30,14 +30,14 @@ do_install() {
>  }
>  
>  TARGET_MAIN_R5FSS0_0 = "j7-main-r5f0_0-fw"
> -ALTERNATIVE_${PN} = "j7-main-r5f0_0-fw"
> +ALTERNATIVE:${PN} = "j7-main-r5f0_0-fw"
>  ALTERNATIVE_LINK_NAME[j7-main-r5f0_0-fw] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS0_0}"
>  ALTERNATIVE_TARGET[j7-main-r5f0_0-fw] = "${base_libdir}/firmware/${CPSW9G_FW_FILENAME}"
>  ALTERNATIVE_PRIORITY = "17"
>  
>  INHIBIT_PACKAGE_STRIP = "1"
>  INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
> -INSANE_SKIP_${PN} += "arch"
> +INSANE_SKIP:${PN} += "arch"
>  
>  do_compile[noexec] = "1"
>  do_configure[noexec] = "1"
> diff --git a/recipes-bsp/cuia/cuia_1.0.0.13.bb b/recipes-bsp/cuia/cuia_1.0.0.13.bb
> index 3efacb1..2ec35c6 100644
> --- a/recipes-bsp/cuia/cuia_1.0.0.13.bb
> +++ b/recipes-bsp/cuia/cuia_1.0.0.13.bb
> @@ -27,4 +27,4 @@ do_install() {
>  COMPATIBLE_HOST ?= "null"
>  COMPATIBLE_HOST_ti-soc = "(.*)"
>  
> -INSANE_SKIP_${PN} += "textrel installed-vs-shipped"
> +INSANE_SKIP:${PN} += "textrel installed-vs-shipped"
> diff --git a/recipes-bsp/dfe-lld/dfe-lld-test_git.bb b/recipes-bsp/dfe-lld/dfe-lld-test_git.bb
> index 34b90c7..941f1c6 100644
> --- a/recipes-bsp/dfe-lld/dfe-lld-test_git.bb
> +++ b/recipes-bsp/dfe-lld/dfe-lld-test_git.bb
> @@ -6,7 +6,7 @@ include dfe-lld.inc
>  
>  PR = "${INC_PR}.0"
>  
> -EXTRA_OEMAKE = "-f makefile_armv7 PDK_INSTALL_PATH=${STAGING_INCDIR} DFE_SRC_DIR=${S}"
> +EXTRA_OEMAKE = "-f makefile:armv7 PDK_INSTALL_PATH=${STAGING_INCDIR} DFE_SRC_DIR=${S}"
>  
>  do_compile () {
>  #   Now build the lld in the updated directory
> diff --git a/recipes-bsp/dfe-lld/dfe-lld_git.bb b/recipes-bsp/dfe-lld/dfe-lld_git.bb
> index 622da6f..c12b0b3 100644
> --- a/recipes-bsp/dfe-lld/dfe-lld_git.bb
> +++ b/recipes-bsp/dfe-lld/dfe-lld_git.bb
> @@ -6,7 +6,7 @@ include dfe-lld.inc
>  
>  PR = "${INC_PR}.0"
>  
> -EXTRA_OEMAKE = "-f makefile_armv7 PDK_INSTALL_PATH=${STAGING_INCDIR}"
> +EXTRA_OEMAKE = "-f makefile:armv7 PDK_INSTALL_PATH=${STAGING_INCDIR}"
>  
>  do_compile () {
>  	oe_runmake lib DEVICE=k2l
> diff --git a/recipes-bsp/dspdce-fw/dspdce-fw_git.bb b/recipes-bsp/dspdce-fw/dspdce-fw_git.bb
> index 6ddbe68..4e86309 100644
> --- a/recipes-bsp/dspdce-fw/dspdce-fw_git.bb
> +++ b/recipes-bsp/dspdce-fw/dspdce-fw_git.bb
> @@ -55,11 +55,11 @@ do_install() {
>      install -m 0644 ${S}/dra7xx-c66x-dsp.xe66 ${D}${base_libdir}/firmware/${TARGET}.${BPN}
>  }
>  
> -ALTERNATIVE_${PN} = "dra7-dsp1-fw.xe66"
> +ALTERNATIVE:${PN} = "dra7-dsp1-fw.xe66"
>  ALTERNATIVE_LINK_NAME[dra7-dsp1-fw.xe66] = "${base_libdir}/firmware/${TARGET}"
>  ALTERNATIVE_TARGET[dra7-dsp1-fw.xe66] = "${base_libdir}/firmware/${TARGET}.${BPN}"
>  ALTERNATIVE_PRIORITY = "10"
>  
> -INSANE_SKIP_${PN} = "arch"
> +INSANE_SKIP:${PN} = "arch"
>  
> -FILES_${PN} += "${base_libdir}/firmware/*"
> +FILES:${PN} += "${base_libdir}/firmware/*"
> diff --git a/recipes-bsp/dsptop/debugss-module-drv_git.bb b/recipes-bsp/dsptop/debugss-module-drv_git.bb
> index 8f4bbf1..4da565b 100644
> --- a/recipes-bsp/dsptop/debugss-module-drv_git.bb
> +++ b/recipes-bsp/dsptop/debugss-module-drv_git.bb
> @@ -3,9 +3,9 @@ LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM = "file://COPYING.txt;md5=9d4316fe434ba450dca4da25348ca5a3"
>  
>  # This package builds a kernel module, use kernel PR as base and append a local
> -MACHINE_KERNEL_PR_append = "d"
> +MACHINE_KERNEL_PR:append = "d"
>  PR = "${MACHINE_KERNEL_PR}"
> -PV_append = "+git${SRCPV}"
> +PV:append = "+git${SRCPV}"
>  
>  S = "${WORKDIR}/git/debugss_module/debugss-mod"
>  
> diff --git a/recipes-bsp/dsptop/dsptop_git.bb b/recipes-bsp/dsptop/dsptop_git.bb
> index c4a9bf3..e879dcd 100644
> --- a/recipes-bsp/dsptop/dsptop_git.bb
> +++ b/recipes-bsp/dsptop/dsptop_git.bb
> @@ -21,8 +21,8 @@ do_install() {
>  COMPATIBLE_MACHINE = "dra7xx|keystone"
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
> -RDEPENDS_${PN} = "debugss-module-drv bash"
> -RDEPENDS_${PN}_append_keystone = " temperature-module-drv"
> +RDEPENDS:${PN} = "debugss-module-drv bash"
> +RDEPENDS:${PN}:append_keystone = " temperature-module-drv"
>  
>  include dsptop.inc
>  
> diff --git a/recipes-bsp/dsptop/libulm_git.bb b/recipes-bsp/dsptop/libulm_git.bb
> index 47248ff..ea2cdb6 100644
> --- a/recipes-bsp/dsptop/libulm_git.bb
> +++ b/recipes-bsp/dsptop/libulm_git.bb
> @@ -35,12 +35,12 @@ do_install() {
>  COMPATIBLE_MACHINE = "dra7xx|keystone"
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
> -FILES_${PN}-dev += "\
> +FILES:${PN}-dev += "\
>      ${datadir}/ti/ulm \
>  "
>  
>  include dsptop.inc
>  
> -ALLOW_EMPTY_${PN} = "1"
> +ALLOW_EMPTY:${PN} = "1"
>  
>  PARALLEL_MAKE= ""
> diff --git a/recipes-bsp/dsptop/temperature-module-drv_git.bb b/recipes-bsp/dsptop/temperature-module-drv_git.bb
> index 0bd54c5..1f49ddf 100644
> --- a/recipes-bsp/dsptop/temperature-module-drv_git.bb
> +++ b/recipes-bsp/dsptop/temperature-module-drv_git.bb
> @@ -3,9 +3,9 @@ LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM = "file://COPYING.txt;md5=9d4316fe434ba450dca4da25348ca5a3"
>  
>  # This package builds a kernel module, use kernel PR as base and append a local
> -MACHINE_KERNEL_PR_append = "a"
> +MACHINE_KERNEL_PR:append = "a"
>  PR = "${MACHINE_KERNEL_PR}"
> -PV_append = "+git${SRCPV}"
> +PV:append = "+git${SRCPV}"
>  
>  S = "${WORKDIR}/git/temperature_module/temperature-mod"
>  
> diff --git a/recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb b/recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb
> index 4812afe..25d977f 100644
> --- a/recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb
> +++ b/recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb
> @@ -50,7 +50,7 @@ TARGETLIST_keystone = " \
>          a15 \
>  "
>  
> -PLATFORMLIST_append_dra7xx-evm = " \
> +PLATFORMLIST:append_dra7xx-evm = " \
>          tda3xx-evm \
>  "
>  
> @@ -76,7 +76,7 @@ TARGETLIST_omapl1 = " \
>          674 \
>  "
>  
> -EXTRA_OEMAKE_remove = "TARGET=66"
> +EXTRA_OEMAKE:remove = "TARGET=66"
>  FORMAT="ELF"
>  
>  S = "${WORKDIR}/git"
> @@ -139,7 +139,7 @@ do_install () {
>      cp ${CP_ARGS} ${S}/* ${D}${EDMA3_LLD_INSTALL_DIR_RECIPE}
>  }
>  
> -INSANE_SKIP_${PN}-dev = "arch ldflags file-rdeps"
> +INSANE_SKIP:${PN}-dev = "arch ldflags file-rdeps"
>  
> -ALLOW_EMPTY_${PN} = "1"
> -FILES_${PN}-dev += "${EDMA3_LLD_INSTALL_DIR_RECIPE}"
> +ALLOW_EMPTY:${PN} = "1"
> +FILES:${PN}-dev += "${EDMA3_LLD_INSTALL_DIR_RECIPE}"
> diff --git a/recipes-bsp/edma3-lld/edma3-lld_git.bb b/recipes-bsp/edma3-lld/edma3-lld_git.bb
> index 886f060..f42d896 100644
> --- a/recipes-bsp/edma3-lld/edma3-lld_git.bb
> +++ b/recipes-bsp/edma3-lld/edma3-lld_git.bb
> @@ -16,7 +16,7 @@ PLATFORMLIST = "tci6636k2h-evm \
>  
>  PACKAGES =+ "${PN}-test"
>  
> -FILES_${PN}-test = "${bindir}/*"
> +FILES:${PN}-test = "${bindir}/*"
>  
>  S = "${WORKDIR}/git"
>  
> @@ -74,5 +74,5 @@ do_install () {
>  		${D}/${bindir}/edma3_drv_c66ak2e_a15_sample_a15host_release.xa15fg
>  }
>  
> -INSANE_SKIP_${PN} += "ldflags"
> -INSANE_SKIP_${PN}-test += "ldflags"
> +INSANE_SKIP:${PN} += "ldflags"
> +INSANE_SKIP:${PN}-test += "ldflags"
> diff --git a/recipes-bsp/emac-lld/emac-lld-rtos_git.bb b/recipes-bsp/emac-lld/emac-lld-rtos_git.bb
> index bbf56b4..8f5a7fb 100644
> --- a/recipes-bsp/emac-lld/emac-lld-rtos_git.bb
> +++ b/recipes-bsp/emac-lld/emac-lld-rtos_git.bb
> @@ -12,13 +12,13 @@ LIC_FILES_CHKSUM = "file://emacver.h;beginline=1;endline=47;md5=f66bb3695972ca2a
>  COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|k2g|omapl1|c665x-evm|k3"
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
> -DEPENDS_append = " board-rtos osal-rtos"
> -DEPENDS_append_ti33x = " starterware-rtos"
> -DEPENDS_append_ti43x = " starterware-rtos"
> -DEPENDS_append_k2g  = " cppi-lld-rtos qmss-lld-rtos"
> +DEPENDS:append = " board-rtos osal-rtos"
> +DEPENDS:append_ti33x = " starterware-rtos"
> +DEPENDS:append_ti43x = " starterware-rtos"
> +DEPENDS:append_k2g  = " cppi-lld-rtos qmss-lld-rtos"
>  
> -DEPENDS_remove_k3 = "board-rtos "
> -DEPENDS_append_k3 = " udma-lld-rtos trace-rtos"
> +DEPENDS:remove_k3 = "board-rtos "
> +DEPENDS:append_k3 = " udma-lld-rtos trace-rtos"
>  
>  # Build with make instead of XDC
>  TI_PDK_XDCMAKE = "0"
> diff --git a/recipes-bsp/fatfs-rtos/fatfs-rtos_git.bb b/recipes-bsp/fatfs-rtos/fatfs-rtos_git.bb
> index 20d8ba8..5255e58 100644
> --- a/recipes-bsp/fatfs-rtos/fatfs-rtos_git.bb
> +++ b/recipes-bsp/fatfs-rtos/fatfs-rtos_git.bb
> @@ -14,7 +14,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
>  PR = "r0"
>  
> -DEPENDS_append = " mmcsd-lld-rtos \
> +DEPENDS:append = " mmcsd-lld-rtos \
>                     osal-rtos \
>  "
>  
> diff --git a/recipes-bsp/faultmanagement/faultmanagement-rtos_git.bb b/recipes-bsp/faultmanagement/faultmanagement-rtos_git.bb
> index bf8aba6..1050645 100644
> --- a/recipes-bsp/faultmanagement/faultmanagement-rtos_git.bb
> +++ b/recipes-bsp/faultmanagement/faultmanagement-rtos_git.bb
> @@ -25,12 +25,12 @@ PR = "r0"
>  
>  S = "${WORKDIR}/${FAULT_MANAGEMENT_GIT_DESTSUFFIX}"
>  
> -DEPENDS_append_keystone = " qmss-lld-rtos \
> +DEPENDS:append_keystone = " qmss-lld-rtos \
>                              cppi-lld-rtos \
>                              pa-lld-rtos \
>  "
>  
> -DEPENDS_append_k2hk = " aif2-lld-rtos \
> +DEPENDS:append_k2hk = " aif2-lld-rtos \
>  "
>  # HTML doc link params
>  PDK_COMP_LINK_TEXT = "Fault Management"
> diff --git a/recipes-bsp/fftc-lld/fftc-lld-rtos_git.bb b/recipes-bsp/fftc-lld/fftc-lld-rtos_git.bb
> index c8668c9..7e5db22 100644
> --- a/recipes-bsp/fftc-lld/fftc-lld-rtos_git.bb
> +++ b/recipes-bsp/fftc-lld/fftc-lld-rtos_git.bb
> @@ -14,7 +14,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
>  PR = "r0"
>  
> -DEPENDS_append= " qmss-lld-rtos \
> +DEPENDS:append= " qmss-lld-rtos \
>                    cppi-lld-rtos \
>  "
>  
> diff --git a/recipes-bsp/formfactor/formfactor_0.0.bbappend b/recipes-bsp/formfactor/formfactor_0.0.bbappend
> index 72d991c..4fc41d0 100644
> --- a/recipes-bsp/formfactor/formfactor_0.0.bbappend
> +++ b/recipes-bsp/formfactor/formfactor_0.0.bbappend
> @@ -1 +1 @@
> -FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
> +FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
> diff --git a/recipes-bsp/fvid2/fvid2-rtos_git.bb b/recipes-bsp/fvid2/fvid2-rtos_git.bb
> index 6219f0b..f542e7d 100644
> --- a/recipes-bsp/fvid2/fvid2-rtos_git.bb
> +++ b/recipes-bsp/fvid2/fvid2-rtos_git.bb
> @@ -14,7 +14,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
>  PR = "r0"
>  
> -DEPENDS_append = " osal-rtos \
> +DEPENDS:append = " osal-rtos \
>  "
>  
>  # Build with make instead of XDC
> @@ -62,6 +62,6 @@ do_install() {
>      find -name "*.tar" -exec tar xf {} --no-same-owner -C ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/drv/fvid2 \;
>  }
>  
> -FILES_${PN} += "${PDK_INSTALL_DIR_RECIPE}/packages"
> +FILES:${PN} += "${PDK_INSTALL_DIR_RECIPE}/packages"
>  
> -INSANE_SKIP_${PN} = "arch ldflags"
> +INSANE_SKIP:${PN} = "arch ldflags"
> diff --git a/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb b/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
> index d36bcd5..a7124ae 100644
> --- a/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
> +++ b/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
> @@ -7,7 +7,7 @@ inherit module features_check
>  
>  REQUIRED_MACHINE_FEATURES = "gc320"
>  
> -MACHINE_KERNEL_PR_append = "i"
> +MACHINE_KERNEL_PR:append = "i"
>  PR = "${MACHINE_KERNEL_PR}"
>  
>  # Need to branch out with ${PV} var
> diff --git a/recipes-bsp/goodix-fw/goodix-fw_git.bb b/recipes-bsp/goodix-fw/goodix-fw_git.bb
> index 0a9f3ff..5131f8d 100644
> --- a/recipes-bsp/goodix-fw/goodix-fw_git.bb
> +++ b/recipes-bsp/goodix-fw/goodix-fw_git.bb
> @@ -26,4 +26,4 @@ do_install() {
>  	install -m 0644 ${S}/ti-evm/${ORIGIN} ${D}${base_libdir}/firmware/${TARGET}
>  }
>  
> -FILES_${PN} = "${base_libdir}/firmware"
> +FILES:${PN} = "${base_libdir}/firmware"
> diff --git a/recipes-bsp/gpio-lld/gpio-lld-rtos_git.bb b/recipes-bsp/gpio-lld/gpio-lld-rtos_git.bb
> index bfdb16c..5f4ed6f 100644
> --- a/recipes-bsp/gpio-lld/gpio-lld-rtos_git.bb
> +++ b/recipes-bsp/gpio-lld/gpio-lld-rtos_git.bb
> @@ -15,13 +15,13 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
>  PR = "r0"
>  
>  
> -DEPENDS_append = " osal-rtos \
> +DEPENDS:append = " osal-rtos \
>  "
> -DEPENDS_append_ti33x = " starterware-rtos \
> +DEPENDS:append_ti33x = " starterware-rtos \
>  "
> -DEPENDS_append_ti43x = " starterware-rtos \
> +DEPENDS:append_ti43x = " starterware-rtos \
>  "
> -DEPENDS_append_k3 = " sciclient-rtos \
> +DEPENDS:append_k3 = " sciclient-rtos \
>  "
>  
>  # Build with make instead of XDC
> diff --git a/recipes-bsp/gpmc-lld/gpmc-lld-rtos_git.bb b/recipes-bsp/gpmc-lld/gpmc-lld-rtos_git.bb
> index 6054d6b..af66990 100644
> --- a/recipes-bsp/gpmc-lld/gpmc-lld-rtos_git.bb
> +++ b/recipes-bsp/gpmc-lld/gpmc-lld-rtos_git.bb
> @@ -15,11 +15,11 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
>  PR = "r0"
>  
> -DEPENDS_append = " osal-rtos \
> +DEPENDS:append = " osal-rtos \
>  "
> -DEPENDS_append_ti33x = " starterware-rtos \
> +DEPENDS:append_ti33x = " starterware-rtos \
>  "
> -DEPENDS_append_ti43x = " starterware-rtos \
> +DEPENDS:append_ti43x = " starterware-rtos \
>  "
>  
>  # Build with make instead of XDC
> diff --git a/recipes-bsp/hplib/hplib-mod_git.bb b/recipes-bsp/hplib/hplib-mod_git.bb
> index c7217d7..c992b12 100644
> --- a/recipes-bsp/hplib/hplib-mod_git.bb
> +++ b/recipes-bsp/hplib/hplib-mod_git.bb
> @@ -7,7 +7,7 @@ DEPENDS = "hplib"
>  include hplib.inc
>  
>  # This package builds a kernel module, use kernel PR as base and append a local
> -MACHINE_KERNEL_PR_append = "b"
> +MACHINE_KERNEL_PR:append = "b"
>  PR = "${MACHINE_KERNEL_PR}"
>  
>  S ="${WORKDIR}/git/ti/runtime/hplib/module"
> diff --git a/recipes-bsp/hplib/hplib-test_git.bb b/recipes-bsp/hplib/hplib-test_git.bb
> index 4ba79db..62294ef 100644
> --- a/recipes-bsp/hplib/hplib-test_git.bb
> +++ b/recipes-bsp/hplib/hplib-test_git.bb
> @@ -12,7 +12,7 @@ CHOICELIST = "yes no"
>  
>  S = "${WORKDIR}/git/ti/runtime/hplib"
>  
> -EXTRA_OEMAKE += '-f makefile_armv7 PDK_INSTALL_PATH=${STAGING_INCDIR}'
> +EXTRA_OEMAKE += '-f makefile:armv7 PDK_INSTALL_PATH=${STAGING_INCDIR}'
>  
>  do_compile () {
>  	for device in ${DEVICELIST}
> diff --git a/recipes-bsp/hplib/hplib_git.bb b/recipes-bsp/hplib/hplib_git.bb
> index 1423de5..63eb0b1 100644
> --- a/recipes-bsp/hplib/hplib_git.bb
> +++ b/recipes-bsp/hplib/hplib_git.bb
> @@ -3,7 +3,7 @@ LICENSE = "BSD-3-Clause"
>  LIC_FILES_CHKSUM = "file://${WORKDIR}/git/ti/runtime/hplib/src/COPYING.txt;md5=b7982a377c680ad71ca2fbb735982462"
>  
>  DEPENDS = "common-csl-ip rm-lld qmss-lld sa-lld pktlib"
> -RDEPENDS_${PN} = "hplib-mod"
> +RDEPENDS:${PN} = "hplib-mod"
>  
>  include hplib.inc
>  
> @@ -13,7 +13,7 @@ CHOICELIST = "yes no"
>  
>  S = "${WORKDIR}/git/ti/runtime/hplib"
>  
> -EXTRA_OEMAKE += "-f makefile_armv7 PDK_INSTALL_PATH=${STAGING_INCDIR}"
> +EXTRA_OEMAKE += "-f makefile:armv7 PDK_INSTALL_PATH=${STAGING_INCDIR}"
>  
>  do_compile () {
>  	for device in ${DEVICELIST}
> diff --git a/recipes-bsp/hyplnk-lld/hyplnk-lld-rtos_git.bb b/recipes-bsp/hyplnk-lld/hyplnk-lld-rtos_git.bb
> index 3be848b..e86c1d4 100644
> --- a/recipes-bsp/hyplnk-lld/hyplnk-lld-rtos_git.bb
> +++ b/recipes-bsp/hyplnk-lld/hyplnk-lld-rtos_git.bb
> @@ -6,7 +6,7 @@ require recipes-bsp/hyplnk-lld/hyplnk-lld.inc
>  
>  PR = "${INC_PR}.0"
>  
> -COMPATIBLE_MACHINE_append = "|c66x"
> +COMPATIBLE_MACHINE:append = "|c66x"
>  
>  # HTML doc link params
>  PDK_COMP_LINK_TEXT = "HYPLNK LLD"
> diff --git a/recipes-bsp/hyplnk-lld/hyplnk-lld-test_git.bb b/recipes-bsp/hyplnk-lld/hyplnk-lld-test_git.bb
> index 31b69c2..acf4402 100644
> --- a/recipes-bsp/hyplnk-lld/hyplnk-lld-test_git.bb
> +++ b/recipes-bsp/hyplnk-lld/hyplnk-lld-test_git.bb
> @@ -5,11 +5,11 @@ PR = "${INC_PR}.0"
>  DEPENDS = "common-csl-ip hyplnk-lld"
>  
>  do_compile () {
> -	make -f makefile_armv7 clean PDK_INSTALL_PATH="${STAGING_INCDIR}" \
> +	make -f makefile:armv7 clean PDK_INSTALL_PATH="${STAGING_INCDIR}" \
>  		HYPLNK_SRC_DIR="${S}"
>  	for device in ${DEVICELIST}
>  	do
> -		make -f makefile_armv7 tests examples \
> +		make -f makefile:armv7 tests examples \
>  			PDK_INSTALL_PATH="${STAGING_INCDIR}" \
>  			DEVICE="$device" HYPLNK_SRC_DIR="${S}"
>  	done
> @@ -18,7 +18,7 @@ do_compile () {
>  do_install () {
>      for device in ${DEVICELIST}
>  	do
> -		make -f makefile_armv7 installbin \
> +		make -f makefile:armv7 installbin \
>  			PDK_INSTALL_PATH="${STAGING_INCDIR}" DEVICE="$device" \
>  			HYPLNK_SRC_DIR="${S}" \
>  			INSTALL_BIN_BASE_DIR="${D}/${bindir}"
> diff --git a/recipes-bsp/hyplnk-lld/hyplnk-lld_git.bb b/recipes-bsp/hyplnk-lld/hyplnk-lld_git.bb
> index 7848df1..a7051ec 100644
> --- a/recipes-bsp/hyplnk-lld/hyplnk-lld_git.bb
> +++ b/recipes-bsp/hyplnk-lld/hyplnk-lld_git.bb
> @@ -5,17 +5,17 @@ PR = "${INC_PR}.1"
>  DEPENDS = "common-csl-ip"
>  
>  do_compile () {
> -	make -f makefile_armv7 clean PDK_INSTALL_PATH="${STAGING_INCDIR}" \
> +	make -f makefile:armv7 clean PDK_INSTALL_PATH="${STAGING_INCDIR}" \
>  		HYPLNK_SRC_DIR="${S}"
>  	for device in ${DEVICELIST}
>  	do
> -		make -f makefile_armv7 lib PDK_INSTALL_PATH="${STAGING_INCDIR}"\
> +		make -f makefile:armv7 lib PDK_INSTALL_PATH="${STAGING_INCDIR}"\
>  			DEVICE="$device" HYPLNK_SRC_DIR="${S}"
>  	done
>  }
>  
>  do_install () {
> -	make -f makefile_armv7 install PDK_INSTALL_PATH="${STAGING_INCDIR}" \
> +	make -f makefile:armv7 install PDK_INSTALL_PATH="${STAGING_INCDIR}" \
>  		INSTALL_INC_BASE_DIR="${D}/${includedir}" \
>  		INSTALL_LIB_BASE_DIR="${D}${libdir}" HYPLNK_SRC_DIR="${S}"
>  	chown -R root:root ${D}
> diff --git a/recipes-bsp/i2c-lld/i2c-lld-rtos_git.bb b/recipes-bsp/i2c-lld/i2c-lld-rtos_git.bb
> index 5a3c1d6..ce7ed1a 100644
> --- a/recipes-bsp/i2c-lld/i2c-lld-rtos_git.bb
> +++ b/recipes-bsp/i2c-lld/i2c-lld-rtos_git.bb
> @@ -15,21 +15,21 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
>  PR = "r0"
>  
> -DEPENDS_append = " osal-rtos \
> +DEPENDS:append = " osal-rtos \
>  "
> -DEPENDS_append_ti33x = " starterware-rtos \
> +DEPENDS:append_ti33x = " starterware-rtos \
>                           pruss-lld-rtos \
>  "
> -DEPENDS_append_ti43x = " starterware-rtos \
> +DEPENDS:append_ti43x = " starterware-rtos \
>                           pruss-lld-rtos \
>  "
> -DEPENDS_append_am57xx-evm = " pruss-lld-rtos \
> +DEPENDS:append_am57xx-evm = " pruss-lld-rtos \
>  "
>  
> -DEPENDS_append_k2g = " pruss-lld-rtos \
> +DEPENDS:append_k2g = " pruss-lld-rtos \
>  "
>  
> -DEPENDS_append_j7 = " sciclient-rtos \
> +DEPENDS:append_j7 = " sciclient-rtos \
>  "
>  
>  # Build with make instead of XDC
> @@ -39,7 +39,7 @@ TI_PDK_XDCMAKE = "0"
>  export PDK_I2C_ROOT_PATH ="${WORKDIR}/build"
>  export DEST_ROOT="${S}"
>  
> -INSANE_SKIP_${PN} = "arch"
> +INSANE_SKIP:${PN} = "arch"
>  
>  # HTML doc link params
>  PDK_COMP_LINK_TEXT = "I2C LLD"
> diff --git a/recipes-bsp/ibl-boot/ibl-boot-rtos_git.bb b/recipes-bsp/ibl-boot/ibl-boot-rtos_git.bb
> index 59b75b3..1e07227 100644
> --- a/recipes-bsp/ibl-boot/ibl-boot-rtos_git.bb
> +++ b/recipes-bsp/ibl-boot/ibl-boot-rtos_git.bb
> @@ -33,7 +33,7 @@ PR = "r2"
>  
>  S = "${WORKDIR}/git"
>  
> -PATH_prepend = "${TI_CGT6X_7_INSTALL_DIR}/bin:"
> +PATH:prepend = "${TI_CGT6X_7_INSTALL_DIR}/bin:"
>  
>  IBLTARGETS = ""
>  IBLTARGETS_c665x-evm = "evm_c6657_i2c"
> @@ -66,10 +66,10 @@ do_install() {
>      cp -rP --preserve=mode,links,timestamps --no-preserve=ownership * ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/boot/ibl
>  }
>  
> -FILES_${PN} += "${PDK_INSTALL_DIR_RECIPE}/packages"
> +FILES:${PN} += "${PDK_INSTALL_DIR_RECIPE}/packages"
>  
>  INHIBIT_PACKAGE_STRIP = "1"
>  INHIBIT_SYSROOT_STRIP = "1"
>  INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
>  
> -INSANE_SKIP_${PN} = "arch file-rdeps"
> +INSANE_SKIP:${PN} = "arch file-rdeps"
> diff --git a/recipes-bsp/icss-emac-lld/icss-emac-lld-rtos_git.bb b/recipes-bsp/icss-emac-lld/icss-emac-lld-rtos_git.bb
> index 882ce99..0c0fc6b 100644
> --- a/recipes-bsp/icss-emac-lld/icss-emac-lld-rtos_git.bb
> +++ b/recipes-bsp/icss-emac-lld/icss-emac-lld-rtos_git.bb
> @@ -5,12 +5,12 @@ require icss-emac-lld.inc
>  
>  PR = "${INC_PR}.0"
>  
> -DEPENDS_append = " osal-rtos \
> +DEPENDS:append = " osal-rtos \
>                     pruss-lld-rtos \
>  "
> -DEPENDS_append_ti33x = " starterware-rtos \
> +DEPENDS:append_ti33x = " starterware-rtos \
>  "
> -DEPENDS_append_ti43x = " starterware-rtos \
> +DEPENDS:append_ti43x = " starterware-rtos \
>  "
>  
>  # Build with make instead of XDC
> @@ -22,4 +22,4 @@ export DEST_ROOT="${S}"
>  # HTML doc link params
>  PDK_COMP_LINK_TEXT = "ICSS-EMAC LLD"
>  
> -INSANE_SKIP_${PN} = "arch"
> +INSANE_SKIP:${PN} = "arch"
> diff --git a/recipes-bsp/icss-emac-lld/icss-emac-lld-test_git.bb b/recipes-bsp/icss-emac-lld/icss-emac-lld-test_git.bb
> index 5093d7c..badef25 100644
> --- a/recipes-bsp/icss-emac-lld/icss-emac-lld-test_git.bb
> +++ b/recipes-bsp/icss-emac-lld/icss-emac-lld-test_git.bb
> @@ -2,14 +2,14 @@ DESCRIPTION = "TI ICSS-EMAC low level driver tests"
>  
>  DEPENDS="common-csl-ip pruss-lld icss-emac-lld osal ti-pdk-build-rtos icss-emac-lld-rtos"
>  
> -DEPENDS_append_ti33x = " starterware"
> -DEPENDS_append_ti43x = " starterware"
> +DEPENDS:append_ti33x = " starterware"
> +DEPENDS:append_ti43x = " starterware"
>  
>  include icss-emac-lld.inc
>  
>  PR = "${INC_PR}.0"
>  
> -EXTRA_OEMAKE += "-f makefile_armv7 PDK_INSTALL_PATH=${STAGING_INCDIR} PDK_PKG_PATH=${STAGING_DATADIR}/ti/ti-pdk-tree/packages ICSS_EMAC_SRC_DIR=${S}"
> +EXTRA_OEMAKE += "-f makefile:armv7 PDK_INSTALL_PATH=${STAGING_INCDIR} PDK_PKG_PATH=${STAGING_DATADIR}/ti/ti-pdk-tree/packages ICSS_EMAC_SRC_DIR=${S}"
>  
>  DEVICE_LIST ?= "${TI_PDK_LIMIT_SOCS}"
>  
> diff --git a/recipes-bsp/icss-emac-lld/icss-emac-lld_git.bb b/recipes-bsp/icss-emac-lld/icss-emac-lld_git.bb
> index 4c305db..1e5b1f2 100644
> --- a/recipes-bsp/icss-emac-lld/icss-emac-lld_git.bb
> +++ b/recipes-bsp/icss-emac-lld/icss-emac-lld_git.bb
> @@ -11,7 +11,7 @@ TARGET_NAME_ti33x = "SOC_AM335x"
>  TARGET_NAME_ti43x = "SOC_AM437x"
>  TARGET_NAME_k2g = "SOC_K2G"
>  
> -EXTRA_OEMAKE += "-f makefile_armv7 PDK_INSTALL_PATH=${STAGING_INCDIR} TARGET=${TARGET_NAME}"
> +EXTRA_OEMAKE += "-f makefile:armv7 PDK_INSTALL_PATH=${STAGING_INCDIR} TARGET=${TARGET_NAME}"
>  
>  do_compile () {
>  #   Build the lib
> diff --git a/recipes-bsp/iolink-lld/iolink-lld-rtos_git.bb b/recipes-bsp/iolink-lld/iolink-lld-rtos_git.bb
> index c0c27b6..d50c19f 100644
> --- a/recipes-bsp/iolink-lld/iolink-lld-rtos_git.bb
> +++ b/recipes-bsp/iolink-lld/iolink-lld-rtos_git.bb
> @@ -14,9 +14,9 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
>  PR = "r2"
>  
> -DEPENDS_append = " osal-rtos \
> +DEPENDS:append = " osal-rtos \
>  "
> -DEPENDS_append_ti43x = " starterware-rtos \
> +DEPENDS:append_ti43x = " starterware-rtos \
>                           pruss-lld-rtos \
>  "
>  
> @@ -27,7 +27,7 @@ TI_PDK_XDCMAKE = "0"
>  export PDK_IOLINK_ROOT_PATH ="${WORKDIR}/build"
>  export DEST_ROOT="${S}"
>  
> -INSANE_SKIP_${PN} = "arch"
> +INSANE_SKIP:${PN} = "arch"
>  
>  # HTML doc link params
>  PDK_COMP_LINK_TEXT = "IOLINK LLD"
> diff --git a/recipes-bsp/ipc-lld/ipc-lld-examples-rtos_git.bb b/recipes-bsp/ipc-lld/ipc-lld-examples-rtos_git.bb
> index 79e5bdb..c905fe4 100644
> --- a/recipes-bsp/ipc-lld/ipc-lld-examples-rtos_git.bb
> +++ b/recipes-bsp/ipc-lld/ipc-lld-examples-rtos_git.bb
> @@ -62,7 +62,7 @@ do_install() {
>      done
>  }
>  
> -do_install_append_j7() {
> +do_install:append_j7() {
>      #copy ipc_echo_testb binaries for J721
>      install -m 0644 ${REMOTE_FWB_BIN_DIR}/$board/ipc_echo_testb_mcu1_0_release.xer5f ${D}${DST_BIN_PATH}
>      install -m 0644 ${REMOTE_FWB_BIN_DIR}/$board/ipc_echo_testb_mcu1_1_release.xer5f ${D}${DST_BIN_PATH}
> @@ -79,16 +79,16 @@ do_install_append_j7() {
>      install -m 0644 ${REMOTE_FWB_BIN_DIR}/$board/ipc_echo_testb_mcu3_1_release_strip.xer5f ${D}${DST_BIN_PATH}
>  }
>  
> -do_install_append_am65xx() {
> +do_install:append_am65xx() {
>      cp ${CP_ARGS} ${REMOTE_FW_DIR}/ex04_linux_baremetal_2core_echo_test/bin -d ${D}/ex04_linux_baremetal_2core_echo_test
>  }
>  
>  # Set up names for the firmwares
> -ALTERNATIVE_${PN}_am65xx = "\
> +ALTERNATIVE:${PN}_am65xx = "\
>                      am65x-mcu-r5f0_0-fw \
>                      am65x-mcu-r5f0_1-fw \
>                      "
> -ALTERNATIVE_${PN}_j7 = "\
> +ALTERNATIVE:${PN}_j7 = "\
>                      j7-mcu-r5f0_0-fw \
>                      j7-mcu-r5f0_1-fw \
>                      j7-main-r5f0_0-fw \
> @@ -149,14 +149,14 @@ ALTERNATIVE_PRIORITY = "10"
>  PACKAGES =+ "${PN}-rtos"
>  
>  # make sure that lib/firmware, and all its contents are part of the package
> -FILES_${PN} += "${base_libdir}/firmware"
> +FILES:${PN} += "${base_libdir}/firmware"
>  
> -FILES_${PN}-rtos += "ex02_bios_multicore_echo_test"
> -FILES_${PN}-rtos += "ex01_bios_2core_echo_test"
> -FILES_${PN}-rtos += "ex03_linux_bios_2core_echo_test"
> -FILES_${PN}-rtos += "ex04_linux_baremetal_2core_echo_test"
> +FILES:${PN}-rtos += "ex02_bios_multicore_echo_test"
> +FILES:${PN}-rtos += "ex01_bios_2core_echo_test"
> +FILES:${PN}-rtos += "ex03_linux_bios_2core_echo_test"
> +FILES:${PN}-rtos += "ex04_linux_baremetal_2core_echo_test"
>  
> -INSANE_SKIP_${PN} = "arch ldflags file-rdeps"
> -INSANE_SKIP_${PN}-rtos = "arch ldflags file-rdeps"
> +INSANE_SKIP:${PN} = "arch ldflags file-rdeps"
> +INSANE_SKIP:${PN}-rtos = "arch ldflags file-rdeps"
>  
> -INSANE_SKIP_${PN}-dbg = "arch"
> +INSANE_SKIP:${PN}-dbg = "arch"
> diff --git a/recipes-bsp/ipc-lld/ipc-lld-fw_git.bb b/recipes-bsp/ipc-lld/ipc-lld-fw_git.bb
> index 1be2836..dd76de5 100644
> --- a/recipes-bsp/ipc-lld/ipc-lld-fw_git.bb
> +++ b/recipes-bsp/ipc-lld/ipc-lld-fw_git.bb
> @@ -26,21 +26,21 @@ PLATFORM_am65xx = "am65xx"
>  PLATFORM_j7 = "j7-evm"
>  
>  # make sure that lib/firmware, and all its contents are part of the package
> -FILES_${PN} += "${base_libdir}/firmware"
> +FILES:${PN} += "${base_libdir}/firmware"
>  
>  # install all R5 & DSP ipc echo test binaries in lib/firmware/pdk-ipc, with softlinks up a level
>  do_install() {
>      install -d ${D}${base_libdir}/firmware/pdk-ipc
>  }
>  
> -do_install_append_am65xx() {
> +do_install:append_am65xx() {
>      install -m 0644 ${AM65X_R5_FW_DIR}/ipc_echo_test_mcu1_0_release.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
>      install -m 0644 ${AM65X_R5_FW_DIR}/ipc_echo_test_mcu1_0_release.strip.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
>      install -m 0644 ${AM65X_R5_FW_DIR}/ipc_echo_test_mcu1_1_release.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
>      install -m 0644 ${AM65X_R5_FW_DIR}/ipc_echo_test_mcu1_1_release.strip.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
>  }
>  
> -do_install_append_j7() {
> +do_install:append_j7() {
>      install -m 0644 ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_mcu1_0_release.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
>      install -m 0644 ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_mcu1_0_release.strip.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
>      install -m 0644 ${J721E_R5_DSP_FW_DIR}/ipc_echo_testb_mcu1_0_release.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
> @@ -74,11 +74,11 @@ do_install_append_j7() {
>  }
>  
>  # Set up names for the firmwares
> -ALTERNATIVE_${PN}_am65xx = "\
> +ALTERNATIVE:${PN}_am65xx = "\
>                      am65x-mcu-r5f0_0-fw \
>                      am65x-mcu-r5f0_1-fw \
>                      "
> -ALTERNATIVE_${PN}_j7 = "\
> +ALTERNATIVE:${PN}_j7 = "\
>                      j7-mcu-r5f0_0-fw \
>                      j7-mcu-r5f0_1-fw \
>                      j7-main-r5f0_0-fw \
> @@ -189,7 +189,7 @@ INHIBIT_SYSROOT_STRIP = "1"
>  # This is used to prevent the build system to split the debug info in a separate file
>  INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
>  # As it likely to be a different arch from the Yocto build, disable checking by adding "arch" to INSANE_SKIP
> -INSANE_SKIP_${PN} += "arch"
> +INSANE_SKIP:${PN} += "arch"
>  
>  # we don't want to configure and build the source code
>  do_compile[noexec] = "1"
> diff --git a/recipes-bsp/ipc-lld/ipc-lld-rtos_git.bb b/recipes-bsp/ipc-lld/ipc-lld-rtos_git.bb
> index e005ea7..34f1f03 100644
> --- a/recipes-bsp/ipc-lld/ipc-lld-rtos_git.bb
> +++ b/recipes-bsp/ipc-lld/ipc-lld-rtos_git.bb
> @@ -38,8 +38,8 @@ do_install() {
>      find -name "*.tar" -exec tar xf {} --no-same-owner -C ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/drv/ipc \;
>  }
>  
> -FILES_${PN} += "${PDK_INSTALL_DIR_RECIPE}/packages"
> +FILES:${PN} += "${PDK_INSTALL_DIR_RECIPE}/packages"
>  
> -INSANE_SKIP_${PN} = "arch ldflags file-rdeps"
> +INSANE_SKIP:${PN} = "arch ldflags file-rdeps"
>  
> -INSANE_SKIP_${PN}-dbg = "arch"
> +INSANE_SKIP:${PN}-dbg = "arch"
> diff --git a/recipes-bsp/ipc-lld/ipc-lld.inc b/recipes-bsp/ipc-lld/ipc-lld.inc
> index 2aea055..57cdaee 100644
> --- a/recipes-bsp/ipc-lld/ipc-lld.inc
> +++ b/recipes-bsp/ipc-lld/ipc-lld.inc
> @@ -26,4 +26,4 @@ PDK_COMP_LINK_TEXT = "IPCLLD"
>  
>  EXTRA_OEMAKE = "PDK_INSTALL_PATH=${PDK_INSTALL_PATH} "
>  
> -TI_PDK_LIMIT_CORES_append_am65xx-evm = " mcu1_1 "
> +TI_PDK_LIMIT_CORES:append_am65xx-evm = " mcu1_1 "
> diff --git a/recipes-bsp/ipumm-fw/ipumm-fw_git.bb b/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
> index 380c274..14d2825 100644
> --- a/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
> +++ b/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
> @@ -9,7 +9,7 @@ inherit features_check
>  
>  REQUIRED_MACHINE_FEATURES = "mmip"
>  
> -RDEPENDS_${PN} = "libdce"
> +RDEPENDS:${PN} = "libdce"
>  
>  SRC_URI = "git://git.ti.com/ivimm/ipumm.git;protocol=git"
>  
> @@ -59,9 +59,9 @@ do_install() {
>      install -m 0644 ${S}/${TARGET_MAP} ${D}${base_libdir}/firmware/${TARGET}.map
>  }
>  
> -ALTERNATIVE_${PN} = "dra7-ipu2-fw.xem4"
> +ALTERNATIVE:${PN} = "dra7-ipu2-fw.xem4"
>  ALTERNATIVE_LINK_NAME[dra7-ipu2-fw.xem4] = "${base_libdir}/firmware/${TARGET}"
>  ALTERNATIVE_TARGET[dra7-ipu2-fw.xem4] = "${base_libdir}/firmware/${TARGET}.${BPN}"
>  ALTERNATIVE_PRIORITY = "20"
>  
> -FILES_${PN} += "${base_libdir}/firmware/*"
> +FILES:${PN} += "${base_libdir}/firmware/*"
> diff --git a/recipes-bsp/iqn2-lld/iqn2-lld-test_git.bb b/recipes-bsp/iqn2-lld/iqn2-lld-test_git.bb
> index f276c4b..3a6da22 100644
> --- a/recipes-bsp/iqn2-lld/iqn2-lld-test_git.bb
> +++ b/recipes-bsp/iqn2-lld/iqn2-lld-test_git.bb
> @@ -6,7 +6,7 @@ include iqn2-lld.inc
>  
>  PR = "${INC_PR}.0"
>  
> -EXTRA_OEMAKE = "-f makefile_armv7 PDK_INSTALL_PATH=${STAGING_INCDIR} IQN2_SRC_DIR=${WORKDIR}/git"
> +EXTRA_OEMAKE = "-f makefile:armv7 PDK_INSTALL_PATH=${STAGING_INCDIR} IQN2_SRC_DIR=${WORKDIR}/git"
>  
>  do_compile () {
>  	oe_runmake clean DEVICE=k2l
> diff --git a/recipes-bsp/iqn2-lld/iqn2-lld_git.bb b/recipes-bsp/iqn2-lld/iqn2-lld_git.bb
> index a0c2ef8..a342f6c 100644
> --- a/recipes-bsp/iqn2-lld/iqn2-lld_git.bb
> +++ b/recipes-bsp/iqn2-lld/iqn2-lld_git.bb
> @@ -6,7 +6,7 @@ include iqn2-lld.inc
>  
>  PR = "${INC_PR}.0"
>  
> -EXTRA_OEMAKE = "-f makefile_armv7 PDK_INSTALL_PATH=${STAGING_INCDIR}"
> +EXTRA_OEMAKE = "-f makefile:armv7 PDK_INSTALL_PATH=${STAGING_INCDIR}"
>  
>  do_configure () {
>  	sed -i -e 's/march=armv7-a/march=armv7ve/' build/armv7/libiqn2_aearmv7.mk
> diff --git a/recipes-bsp/mad-utils/mad-utils-rtos_git.bb b/recipes-bsp/mad-utils/mad-utils-rtos_git.bb
> index 0144aad..6eed978 100644
> --- a/recipes-bsp/mad-utils/mad-utils-rtos_git.bb
> +++ b/recipes-bsp/mad-utils/mad-utils-rtos_git.bb
> @@ -23,7 +23,7 @@ PR = "r0"
>  S = "${WORKDIR}/git"
>  
>  export C6X_BASE_DIR="${TI_CGT6X_7_INSTALL_DIR}"
> -PATH_prepend = "${TI_CGT6X_7_INSTALL_DIR}/bin:"
> +PATH:prepend = "${TI_CGT6X_7_INSTALL_DIR}/bin:"
>  
>  DEVICE = ""
>  DEVICE_c665x-evm = "C6657"
> @@ -52,6 +52,6 @@ do_install() {
>      cp -rP --preserve=mode,links,timestamps --no-preserve=ownership * ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/boot/mad-utils
>  }
>  
> -FILES_${PN} += "${PDK_INSTALL_DIR_RECIPE}/packages/ti/boot/mad-utils"
> +FILES:${PN} += "${PDK_INSTALL_DIR_RECIPE}/packages/ti/boot/mad-utils"
>  
> -INSANE_SKIP_${PN} += "arch staticdev ldflags file-rdeps"
> +INSANE_SKIP:${PN} += "arch staticdev ldflags file-rdeps"
> diff --git a/recipes-bsp/mcasp-lld/mcasp-lld-rtos_git.bb b/recipes-bsp/mcasp-lld/mcasp-lld-rtos_git.bb
> index 5775d84..76eb07b 100644
> --- a/recipes-bsp/mcasp-lld/mcasp-lld-rtos_git.bb
> +++ b/recipes-bsp/mcasp-lld/mcasp-lld-rtos_git.bb
> @@ -16,16 +16,16 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
>  PR = "r0"
>  
>  
> -DEPENDS_append = " edma3-lld-rtos \
> +DEPENDS:append = " edma3-lld-rtos \
>                     osal-rtos \
>  "
> -DEPENDS_append_ti43x = " starterware-rtos \
> +DEPENDS:append_ti43x = " starterware-rtos \
>  "
> -DEPENDS_append_ti33x = " starterware-rtos \
> +DEPENDS:append_ti33x = " starterware-rtos \
>  "
>  
> -DEPENDS_remove_k3 = "edma3-lld-rtos "
> -DEPENDS_append_k3 = " udma-lld-rtos \
> +DEPENDS:remove_k3 = "edma3-lld-rtos "
> +DEPENDS:append_k3 = " udma-lld-rtos \
>  "
>  
>  # Build with make instead of XDC
> @@ -35,7 +35,7 @@ export PDK_MCASP_ROOT_PATH ="${WORKDIR}/build"
>  export DEST_ROOT="${S}"
>  
>  export EDMA3LLD_BIOS6_INSTALLDIR = "${EDMA3_LLD_INSTALL_DIR}"
> -XDCPATH_append = ";${EDMA3_LLD_INSTALL_DIR}/packages"
> +XDCPATH:append = ";${EDMA3_LLD_INSTALL_DIR}/packages"
>  
>  # HTML doc link params
>  PDK_COMP_LINK_TEXT = "MCASP LLD"
> diff --git a/recipes-bsp/mcbsp-lld/mcbsp-lld-rtos_git.bb b/recipes-bsp/mcbsp-lld/mcbsp-lld-rtos_git.bb
> index 96ac5d7..f1eeccd 100644
> --- a/recipes-bsp/mcbsp-lld/mcbsp-lld-rtos_git.bb
> +++ b/recipes-bsp/mcbsp-lld/mcbsp-lld-rtos_git.bb
> @@ -15,11 +15,11 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
>  PR = "r0"
>  
>  
> -DEPENDS_append = " edma3-lld-rtos \
> +DEPENDS:append = " edma3-lld-rtos \
>  "
>  
>  export EDMA3LLD_BIOS6_INSTALLDIR = "${EDMA3_LLD_INSTALL_DIR}"
> -XDCPATH_append = ";${EDMA3_LLD_INSTALL_DIR}/packages"
> +XDCPATH:append = ";${EDMA3_LLD_INSTALL_DIR}/packages"
>  
>  TI_PDK_XDCMAKE = "0"
>  
> diff --git a/recipes-bsp/mmap-lld/mmap-lld-test_git.bb b/recipes-bsp/mmap-lld/mmap-lld-test_git.bb
> index 8a09524..4dd8289 100644
> --- a/recipes-bsp/mmap-lld/mmap-lld-test_git.bb
> +++ b/recipes-bsp/mmap-lld/mmap-lld-test_git.bb
> @@ -6,7 +6,7 @@ PR = "${INC_PR}.0"
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
>  DEPENDS="common-csl-ip mmap-lld"
> -RDEPENDS_${PN}="uio-module-drv"
> +RDEPENDS:${PN}="uio-module-drv"
>  
>  DEVICELIST_k2hk = "k2h k2k"
>  DEVICELIST_k2e = "k2e"
> @@ -20,12 +20,12 @@ CHOICELIST = " yes \
>  do_compile () {
>  	for device in ${DEVICELIST}
>  	do
> -		make -f makefile_armv7 clean \
> +		make -f makefile:armv7 clean \
>  			PDK_INSTALL_PATH="${STAGING_INCDIR}" \
>  			DEVICE="$device" MPAX_SRC_DIR="${S}"
>  		for choice in ${CHOICELIST}
>  		do
> -			make -f makefile_armv7 tests examples \
> +			make -f makefile:armv7 tests examples \
>  				PDK_INSTALL_PATH=${STAGING_INCDIR} \
>  				DEVICE="$device" MPAX_SRC_DIR="${S}" \
>  				USEDYNAMIC_LIB="$choice"
> @@ -36,7 +36,7 @@ do_compile () {
>  do_install () {
>  	for device in ${DEVICELIST}
>  	do
> -		make -f makefile_armv7 installbin \
> +		make -f makefile:armv7 installbin \
>  		PDK_INSTALL_PATH=${STAGING_INCDIR} \
>  		DEVICE="$device" MPAX_SRC_DIR="${S}" \
>  		INSTALL_BIN_BASE_DIR="${D}/${bindir}"
> diff --git a/recipes-bsp/mmap-lld/mmap-lld_git.bb b/recipes-bsp/mmap-lld/mmap-lld_git.bb
> index cfc5d4c..29ef704 100644
> --- a/recipes-bsp/mmap-lld/mmap-lld_git.bb
> +++ b/recipes-bsp/mmap-lld/mmap-lld_git.bb
> @@ -6,10 +6,10 @@ PR = "${INC_PR}.0"
>  DEPENDS="common-csl-ip"
>  
>  do_compile () {
> -	make -f makefile_armv7 clean lib PDK_INSTALL_PATH=${STAGING_INCDIR}
> +	make -f makefile:armv7 clean lib PDK_INSTALL_PATH=${STAGING_INCDIR}
>  }
>  
>  do_install () {
> -	make -f makefile_armv7 install PDK_INSTALL_PATH=${STAGING_INCDIR} INSTALL_INC_BASE_DIR=${D}/${includedir} INSTALL_LIB_BASE_DIR=${D}${libdir}
> +	make -f makefile:armv7 install PDK_INSTALL_PATH=${STAGING_INCDIR} INSTALL_INC_BASE_DIR=${D}/${includedir} INSTALL_LIB_BASE_DIR=${D}${libdir}
>  	chown -R root:root ${D}
>  }
> diff --git a/recipes-bsp/mmcsd-lld/mmcsd-lld-rtos_git.bb b/recipes-bsp/mmcsd-lld/mmcsd-lld-rtos_git.bb
> index 8c027cd..5a79d9d 100644
> --- a/recipes-bsp/mmcsd-lld/mmcsd-lld-rtos_git.bb
> +++ b/recipes-bsp/mmcsd-lld/mmcsd-lld-rtos_git.bb
> @@ -16,16 +16,16 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
>  PR = "r0"
>  
>  
> -DEPENDS_append = " edma3-lld-rtos \
> +DEPENDS:append = " edma3-lld-rtos \
>                     osal-rtos \
>  "
> -DEPENDS_append_ti33x = " starterware-rtos \
> +DEPENDS:append_ti33x = " starterware-rtos \
>  "
> -DEPENDS_append_ti43x = " starterware-rtos \
> +DEPENDS:append_ti43x = " starterware-rtos \
>  "
> -DEPENDS_remove_k3 = "edma3-lld-rtos "
> +DEPENDS:remove_k3 = "edma3-lld-rtos "
>  
> -DEPENDS_append_k3 = " sciclient-rtos \
> +DEPENDS:append_k3 = " sciclient-rtos \
>  "
>  
>  # Build with make instead of XDC
> @@ -35,7 +35,7 @@ export PDK_MMCSD_ROOT_PATH ="${WORKDIR}/build"
>  export DEST_ROOT="${S}"
>  
>  export EDMA3LLD_BIOS6_INSTALLDIR = "${EDMA3_LLD_INSTALL_DIR}"
> -XDCPATH_append = ";${EDMA3_LLD_INSTALL_DIR}/packages"
> +XDCPATH:append = ";${EDMA3_LLD_INSTALL_DIR}/packages"
>  
>  # HTML doc link params
>  PDK_COMP_LINK_TEXT = "MMCSD LLD"
> diff --git a/recipes-bsp/netcp-pa-fw/netcp-pa-fw_git.bb b/recipes-bsp/netcp-pa-fw/netcp-pa-fw_git.bb
> index fe7fa2b..9e0f4b2 100644
> --- a/recipes-bsp/netcp-pa-fw/netcp-pa-fw_git.bb
> +++ b/recipes-bsp/netcp-pa-fw/netcp-pa-fw_git.bb
> @@ -53,4 +53,4 @@ do_install() {
>  	done
>  }
>  
> -FILES_${PN} = "${base_libdir}/firmware"
> +FILES:${PN} = "${base_libdir}/firmware"
> diff --git a/recipes-bsp/netcp-sa-fw/netcp-sa-fw_git.bb b/recipes-bsp/netcp-sa-fw/netcp-sa-fw_git.bb
> index 56373a7..9d1ffe3 100644
> --- a/recipes-bsp/netcp-sa-fw/netcp-sa-fw_git.bb
> +++ b/recipes-bsp/netcp-sa-fw/netcp-sa-fw_git.bb
> @@ -26,4 +26,4 @@ do_install() {
>  	install -m 0644 ${S}/ti-keystone/${TARGET} ${D}${base_libdir}/firmware/${TARGET}
>  }
>  
> -FILES_${PN} = "${base_libdir}/firmware"
> +FILES:${PN} = "${base_libdir}/firmware"
> diff --git a/recipes-bsp/nwal-lld/nwal-lld-rtos_git.bb b/recipes-bsp/nwal-lld/nwal-lld-rtos_git.bb
> index b5c4bf1..3153f08 100644
> --- a/recipes-bsp/nwal-lld/nwal-lld-rtos_git.bb
> +++ b/recipes-bsp/nwal-lld/nwal-lld-rtos_git.bb
> @@ -6,7 +6,7 @@ require recipes-bsp/nwal-lld/nwal-lld.inc
>  
>  PR = "${INC_PR}.0"
>  
> -DEPENDS_append = " cppi-lld-rtos \
> +DEPENDS:append = " cppi-lld-rtos \
>                     pa-lld-rtos \
>                     pktlib-rtos \
>                     qmss-lld-rtos \
> diff --git a/recipes-bsp/nwal-lld/nwal-lld-test_git.bb b/recipes-bsp/nwal-lld/nwal-lld-test_git.bb
> index 79528a0..1c7870d 100644
> --- a/recipes-bsp/nwal-lld/nwal-lld-test_git.bb
> +++ b/recipes-bsp/nwal-lld/nwal-lld-test_git.bb
> @@ -6,7 +6,7 @@ include nwal-lld.inc
>  
>  PR = "${INC_PR}.0"
>  
> -EXTRA_OEMAKE += "-f makefile_armv7 PDK_INSTALL_PATH=${STAGING_INCDIR}"
> +EXTRA_OEMAKE += "-f makefile:armv7 PDK_INSTALL_PATH=${STAGING_INCDIR}"
>  
>  do_compile () {
>  	for device in ${DEVICELIST}
> diff --git a/recipes-bsp/nwal-lld/nwal-lld_git.bb b/recipes-bsp/nwal-lld/nwal-lld_git.bb
> index a9690ca..c898ab4 100644
> --- a/recipes-bsp/nwal-lld/nwal-lld_git.bb
> +++ b/recipes-bsp/nwal-lld/nwal-lld_git.bb
> @@ -6,7 +6,7 @@ include nwal-lld.inc
>  
>  PR = "${INC_PR}.0"
>  
> -EXTRA_OEMAKE += "-f makefile_armv7 PDK_INSTALL_PATH=${STAGING_INCDIR}"
> +EXTRA_OEMAKE += "-f makefile:armv7 PDK_INSTALL_PATH=${STAGING_INCDIR}"
>  
>  do_compile () {
>  	for device in ${DEVICELIST}
> diff --git a/recipes-bsp/osal/osal-rtos_git.bb b/recipes-bsp/osal/osal-rtos_git.bb
> index a718f7c..2ca3e8e 100644
> --- a/recipes-bsp/osal/osal-rtos_git.bb
> +++ b/recipes-bsp/osal/osal-rtos_git.bb
> @@ -3,10 +3,10 @@ require recipes-bsp/osal/osal.inc
>  
>  PR = "${INC_PR}.0"
>  
> -COMPATIBLE_MACHINE_append = "|c66x|k3"
> +COMPATIBLE_MACHINE:append = "|c66x|k3"
>  
> -DEPENDS_append_ti33x = " starterware-rtos"
> -DEPENDS_append_ti43x = " starterware-rtos"
> +DEPENDS:append_ti33x = " starterware-rtos"
> +DEPENDS:append_ti43x = " starterware-rtos"
>  
>  # Build with make instead of XDC
>  TI_PDK_XDCMAKE = "0"
> diff --git a/recipes-bsp/osal/osal-test_git.bb b/recipes-bsp/osal/osal-test_git.bb
> index 354aa79..9dfa244 100644
> --- a/recipes-bsp/osal/osal-test_git.bb
> +++ b/recipes-bsp/osal/osal-test_git.bb
> @@ -6,7 +6,7 @@ include osal.inc
>  
>  PR = "${INC_PR}.1"
>  
> -EXTRA_OEMAKE = "-f makefile_armv7 PDK_INSTALL_PATH=${STAGING_INCDIR} OSAL_SRC_DIR=${S}"
> +EXTRA_OEMAKE = "-f makefile:armv7 PDK_INSTALL_PATH=${STAGING_INCDIR} OSAL_SRC_DIR=${S}"
>  
>  do_compile () {
>  #   Build the tests
> diff --git a/recipes-bsp/osal/osal_git.bb b/recipes-bsp/osal/osal_git.bb
> index 4f881d2..e6c0300 100644
> --- a/recipes-bsp/osal/osal_git.bb
> +++ b/recipes-bsp/osal/osal_git.bb
> @@ -6,7 +6,7 @@ include osal.inc
>  
>  PR = "${INC_PR}.1"
>  
> -EXTRA_OEMAKE = "-f makefile_armv7 PDK_INSTALL_PATH=${STAGING_INCDIR}"
> +EXTRA_OEMAKE = "-f makefile:armv7 PDK_INSTALL_PATH=${STAGING_INCDIR}"
>  
>  do_compile () {
>  #   Build the lib
> diff --git a/recipes-bsp/pa-lld/pa-lld-rtos_git.bb b/recipes-bsp/pa-lld/pa-lld-rtos_git.bb
> index e415f36..046ec80 100644
> --- a/recipes-bsp/pa-lld/pa-lld-rtos_git.bb
> +++ b/recipes-bsp/pa-lld/pa-lld-rtos_git.bb
> @@ -3,10 +3,10 @@ SUMMARY = "TI RTOS low level driver for Packet Accelerator (PA)"
>  inherit ti-pdk
>  
>  require recipes-bsp/pa-lld/pa-lld.inc
> -COMPATIBLE_MACHINE_append = "|c667x-evm"
> +COMPATIBLE_MACHINE:append = "|c667x-evm"
>  PR = "${INC_PR}.0"
>  
> -DEPENDS_append = " rm-lld-rtos"
> +DEPENDS:append = " rm-lld-rtos"
>  
>  # HTML doc link params
>  PDK_COMP_LINK_TEXT = "PA LLD"
> diff --git a/recipes-bsp/pa-lld/pa-lld-test_git.bb b/recipes-bsp/pa-lld/pa-lld-test_git.bb
> index 760f188..595df14 100644
> --- a/recipes-bsp/pa-lld/pa-lld-test_git.bb
> +++ b/recipes-bsp/pa-lld/pa-lld-test_git.bb
> @@ -14,10 +14,10 @@ do_compile () {
>  # Now build the lld unit test examples
>  	for device in ${DEVICELIST}
>  	do
> -	make -f makefile_armv7 clean PDK_INSTALL_PATH=${STAGING_INCDIR} DEVICE="$device" PA_SRC_DIR=${S}
> +	make -f makefile:armv7 clean PDK_INSTALL_PATH=${STAGING_INCDIR} DEVICE="$device" PA_SRC_DIR=${S}
>  		for choice in ${CHOICELIST}
>  		do
> -			make -f makefile_armv7 tests examples PDK_INSTALL_PATH=${STAGING_INCDIR} DEVICE="$device" PA_SRC_DIR=${S} USEDYNAMIC_LIB="$choice"
> +			make -f makefile:armv7 tests examples PDK_INSTALL_PATH=${STAGING_INCDIR} DEVICE="$device" PA_SRC_DIR=${S} USEDYNAMIC_LIB="$choice"
>  		done
>  	done
>  }
> @@ -25,6 +25,6 @@ do_compile () {
>  do_install () {
>  	for device in ${DEVICELIST}
>  	do
> -		make -f makefile_armv7 installbin PDK_INSTALL_PATH=${STAGING_INCDIR} DEVICE="$device" PA_SRC_DIR=${S} INSTALL_BIN_BASE_DIR=${D}${bindir}
> +		make -f makefile:armv7 installbin PDK_INSTALL_PATH=${STAGING_INCDIR} DEVICE="$device" PA_SRC_DIR=${S} INSTALL_BIN_BASE_DIR=${D}${bindir}
>  	done
>  }
> diff --git a/recipes-bsp/pa-lld/pa-lld_git.bb b/recipes-bsp/pa-lld/pa-lld_git.bb
> index bbe7aa3..84cdbd8 100644
> --- a/recipes-bsp/pa-lld/pa-lld_git.bb
> +++ b/recipes-bsp/pa-lld/pa-lld_git.bb
> @@ -10,12 +10,12 @@ do_compile () {
>  #   Now build the lld in the updated directory
>      for device in ${DEVICELIST}
>      do
> -        make -f makefile_armv7 lib PDK_INSTALL_PATH=${STAGING_INCDIR} DEVICE="$device"
> +        make -f makefile:armv7 lib PDK_INSTALL_PATH=${STAGING_INCDIR} DEVICE="$device"
>      done
>  }
>  
>  do_install () {
> -    make -f makefile_armv7 install PDK_INSTALL_PATH=${STAGING_INCDIR} INSTALL_INC_BASE_DIR=${D}${includedir} INSTALL_LIB_BASE_DIR=${D}${libdir}
> +    make -f makefile:armv7 install PDK_INSTALL_PATH=${STAGING_INCDIR} INSTALL_INC_BASE_DIR=${D}${includedir} INSTALL_LIB_BASE_DIR=${D}${libdir}
>      chown -R root:root ${D}
>  
>  #   Set the generic device library symbolic link
> diff --git a/recipes-bsp/pcie-lld/pcie-lld-rtos_git.bb b/recipes-bsp/pcie-lld/pcie-lld-rtos_git.bb
> index ccd9a44..83d70db 100644
> --- a/recipes-bsp/pcie-lld/pcie-lld-rtos_git.bb
> +++ b/recipes-bsp/pcie-lld/pcie-lld-rtos_git.bb
> @@ -14,7 +14,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
>  PR = "r1"
>  
> -DEPENDS_append_k3 = " udma-lld-rtos \
> +DEPENDS:append_k3 = " udma-lld-rtos \
>  "
>  
>  
> diff --git a/recipes-bsp/pktlib/pktlib-rtos_git.bb b/recipes-bsp/pktlib/pktlib-rtos_git.bb
> index 8d5747f..1688d39 100644
> --- a/recipes-bsp/pktlib/pktlib-rtos_git.bb
> +++ b/recipes-bsp/pktlib/pktlib-rtos_git.bb
> @@ -3,8 +3,8 @@ require pktlib.inc
>  
>  PR = "${INC_PR}.1"
>  
> -DEPENDS_append = " rm-lld-rtos \
> +DEPENDS:append = " rm-lld-rtos \
>                     qmss-lld-rtos \
>                     cppi-lld-rtos \
>  "
> -COMPATIBLE_MACHINE_append = "|c66x"
> +COMPATIBLE_MACHINE:append = "|c66x"
> diff --git a/recipes-bsp/pktlib/pktlib_git.bb b/recipes-bsp/pktlib/pktlib_git.bb
> index b15b61b..c355064 100644
> --- a/recipes-bsp/pktlib/pktlib_git.bb
> +++ b/recipes-bsp/pktlib/pktlib_git.bb
> @@ -7,7 +7,7 @@ include pktlib.inc
>  
>  PR = "${INC_PR}.1"
>  
> -EXTRA_OEMAKE += "-f makefile_armv7 PDK_INSTALL_PATH=${STAGING_INCDIR} INSTALL_INC_BASE_DIR=${D}${includedir} INSTALL_LIB_BASE_DIR=${D}${libdir}"
> +EXTRA_OEMAKE += "-f makefile:armv7 PDK_INSTALL_PATH=${STAGING_INCDIR} INSTALL_INC_BASE_DIR=${D}${includedir} INSTALL_LIB_BASE_DIR=${D}${libdir}"
>  
>  do_compile () {
>  	oe_runmake lib
> diff --git a/recipes-bsp/pm-lld/pm-lld-rtos_git.bb b/recipes-bsp/pm-lld/pm-lld-rtos_git.bb
> index 25fcb65..d8b391a 100644
> --- a/recipes-bsp/pm-lld/pm-lld-rtos_git.bb
> +++ b/recipes-bsp/pm-lld/pm-lld-rtos_git.bb
> @@ -37,15 +37,15 @@ PR = "r0"
>  
>  S = "${WORKDIR}/${PM_LLD_GIT_DESTSUFFIX}"
>  
> -DEPENDS_append = " ti-sysbios \
> +DEPENDS:append = " ti-sysbios \
>              osal-rtos \
>  "
> -DEPENDS_append_ti33x = " starterware-rtos \
> +DEPENDS:append_ti33x = " starterware-rtos \
>  "
> -DEPENDS_append_ti43x = " starterware-rtos \
> +DEPENDS:append_ti43x = " starterware-rtos \
>  "
>  
> -DEPENDS_append_k3 = " sciclient-rtos \
> +DEPENDS:append_k3 = " sciclient-rtos \
>  "
>  
>  export PDK_PM_ROOT_PATH = "${WORKDIR}/build"
> @@ -54,7 +54,7 @@ export DEST_ROOT="${S}"
>  # Build with make instead of XDC
>  TI_PDK_XDCMAKE = "0"
>  
> -do_compile_append() {
> +do_compile:append() {
>      # Delete archive created by XDC release command since it does not contain all content
>      find -name "*.tar" -exec rm -f {} \;
>  
> @@ -65,7 +65,7 @@ do_compile_append() {
>  
>  
>  # Workaround: dra7xx build requires am57xx pm libraries for opencl-monitor
> -TI_PDK_LIMIT_SOCS_append_dra7xx = " am571x am572x am574x"
> -TI_PDK_LIMIT_BOARDS_append_dra7xx = " evmAM571x evmAM572x idkAM574x"
> +TI_PDK_LIMIT_SOCS:append_dra7xx = " am571x am572x am574x"
> +TI_PDK_LIMIT_BOARDS:append_dra7xx = " evmAM571x evmAM572x idkAM574x"
>  
> -INSANE_SKIP_${PN} = "arch staticdev"
> +INSANE_SKIP:${PN} = "arch staticdev"
> diff --git a/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.13.5776728.bb b/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.13.5776728.bb
> index e6edebd..c3524e9 100644
> --- a/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.13.5776728.bb
> +++ b/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.13.5776728.bb
> @@ -7,7 +7,7 @@ inherit module features_check
>  
>  REQUIRED_MACHINE_FEATURES = "gpu"
>  
> -MACHINE_KERNEL_PR_append = "b"
> +MACHINE_KERNEL_PR:append = "b"
>  PR = "${MACHINE_KERNEL_PR}"
>  
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
> diff --git a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
> index a5160fd..a00fce2 100644
> --- a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
> +++ b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
> @@ -9,7 +9,7 @@ REQUIRED_MACHINE_FEATURES = "gpu"
>  
>  COMPATIBLE_MACHINE = "pandaboard|beagleboard|ti33x|ti43x|omap-a15|k3"
>  
> -MACHINE_KERNEL_PR_append = "x"
> +MACHINE_KERNEL_PR:append = "x"
>  PR = "${MACHINE_KERNEL_PR}"
>  
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
> @@ -37,7 +37,7 @@ TARGET_PRODUCT_pandaboard = "ti443x"
>  
>  EXTRA_OEMAKE += 'KERNELDIR="${STAGING_KERNEL_DIR}" TARGET_PRODUCT=${TARGET_PRODUCT} WINDOW_SYSTEM=nulldrmws'
>  
> -do_compile_prepend() {
> +do_compile:prepend() {
>      cd ${S}/eurasia_km/eurasiacon/build/linux2/omap_linux
>  }
>  
> diff --git a/recipes-bsp/pru/pru-icss_git.bb b/recipes-bsp/pru/pru-icss_git.bb
> index c74a15d..8b3912d 100644
> --- a/recipes-bsp/pru/pru-icss_git.bb
> +++ b/recipes-bsp/pru/pru-icss_git.bb
> @@ -18,12 +18,12 @@ require recipes-ti/includes/ti-paths.inc
>  COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|k2g|k3"
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
> -PACKAGES_prepend = " \
> +PACKAGES:prepend = " \
>      ${PN}-halt \
>      ${PN}-rpmsg-echo \
>  "
>  
> -RDEPENDS_${PN}_append = " \
> +RDEPENDS:${PN}:append = " \
>      ${PN}-halt \
>      ${PN}-rpmsg-echo \
>  "
> @@ -60,10 +60,10 @@ do_install() {
>      install -m 0644 ${S}/lib/rpmsg_lib.lib ${D}${libdir}
>  }
>  
> -FILES_${PN}-staticdev = "${libdir}"
> -FILES_${PN}-dev = "${includedir}"
> +FILES:${PN}-staticdev = "${libdir}"
> +FILES:${PN}-dev = "${includedir}"
>  
> -do_install_append_ti33x() {
> +do_install:append_ti33x() {
>      install -m 644 ${S}/examples/${PLATFORM}/PRU_Halt/gen/PRU_Halt.out \
>                     ${D}${base_libdir}/firmware/pru
>      for i in 0 1
> @@ -73,7 +73,7 @@ do_install_append_ti33x() {
>      done
>  }
>  
> -do_install_append_ti43x() {
> +do_install:append_ti43x() {
>      install -m 644 ${S}/examples/${PLATFORM}/PRU_Halt/gen/PRU_Halt.out \
>                     ${D}${base_libdir}/firmware/pru
>      for i in 0 1
> @@ -86,7 +86,7 @@ do_install_append_ti43x() {
>      done
>  }
>  
> -do_install_append_omap-a15() {
> +do_install:append_omap-a15() {
>      install -m 644 ${S}/examples/${PLATFORM}/PRU_Halt/gen/PRU_Halt.out \
>                     ${D}${base_libdir}/firmware/pru
>      for i in 1 2
> @@ -99,7 +99,7 @@ do_install_append_omap-a15() {
>      done
>  }
>  
> -do_install_append_k2g() {
> +do_install:append_k2g() {
>      install -m 644 ${S}/examples/${PLATFORM}/PRU_Halt/gen/PRU_Halt.out \
>                     ${D}${base_libdir}/firmware/pru
>      for i in 0 1
> @@ -112,7 +112,7 @@ do_install_append_k2g() {
>      done
>  }
>  
> -do_install_append_am65xx() {
> +do_install:append_am65xx() {
>      for i in 0 1 
>      do
>          install -m 644 ${S}/examples/${PLATFORM}/PRU_Halt/gen/PRU${i}/PRU_Halt_${i}.out \
> @@ -135,7 +135,7 @@ do_install_append_am65xx() {
>      done
>  }
>  
> -do_install_append_j7() {
> +do_install:append_j7() {
>      for i in 0 1
>      do
>          install -m 644 ${S}/examples/${PLATFORM}/PRU_Halt/gen/PRU${i}/PRU_Halt_${i}.out \
> @@ -159,8 +159,8 @@ do_install_append_j7() {
>  }
>  
>  
> -FILES_${PN}-halt = "${base_libdir}/firmware/pru/PRU_Halt* ${base_libdir}/firmware/pru/RTU_Halt* ${base_libdir}/firmware/pru/TX_PRU_Halt*"
> -FILES_${PN}-rpmsg-echo = "${base_libdir}/firmware/pru/PRU_RPMsg_Echo_Interrupt* ${base_libdir}/firmware/pru/RTU_RPMsg_Echo_Interrupt*"
> +FILES:${PN}-halt = "${base_libdir}/firmware/pru/PRU_Halt* ${base_libdir}/firmware/pru/RTU_Halt* ${base_libdir}/firmware/pru/TX_PRU_Halt*"
> +FILES:${PN}-rpmsg-echo = "${base_libdir}/firmware/pru/PRU_RPMsg_Echo_Interrupt* ${base_libdir}/firmware/pru/RTU_RPMsg_Echo_Interrupt*"
>  
>  # Set up names for the firmwares
>  PRU_ICSS_ALTERNATIVES_ti33x    = "am335x-pru0-fw am335x-pru1-fw"
> @@ -222,11 +222,11 @@ ALTERNATIVE_LINK_NAME[j7-txpru1_0-fw] = "${base_libdir}/firmware/j7-txpru1_0-fw"
>  ALTERNATIVE_LINK_NAME[j7-txpru1_1-fw] = "${base_libdir}/firmware/j7-txpru1_1-fw"
>  
>  # Create the pru-icss-halt firmware alternatives
> -ALTERNATIVE_pru-icss-halt = "${PRU_ICSS_ALTERNATIVES}"
> +ALTERNATIVE:pru-icss-halt = "${PRU_ICSS_ALTERNATIVES}"
>  
>  # Only Halt firmware images are supported for the Tx_PRU cores
> -ALTERNATIVE_pru-icss-halt_append_am65xx = " am65x-txpru0_0-fw am65x-txpru0_1-fw am65x-txpru1_0-fw am65x-txpru1_1-fw am65x-txpru2_0-fw am65x-txpru2_1-fw"
> -ALTERNATIVE_pru-icss-halt_append_j7 = " j7-txpru0_0-fw j7-txpru0_1-fw j7-txpru1_0-fw j7-txpru1_1-fw"
> +ALTERNATIVE:pru-icss-halt:append_am65xx = " am65x-txpru0_0-fw am65x-txpru0_1-fw am65x-txpru1_0-fw am65x-txpru1_1-fw am65x-txpru2_0-fw am65x-txpru2_1-fw"
> +ALTERNATIVE:pru-icss-halt:append_j7 = " j7-txpru0_0-fw j7-txpru0_1-fw j7-txpru1_0-fw j7-txpru1_1-fw"
>  
>  ALTERNATIVE_TARGET_pru-icss-halt[am335x-pru0-fw] = "${base_libdir}/firmware/pru/PRU_Halt.out"
>  ALTERNATIVE_TARGET_pru-icss-halt[am335x-pru1-fw] = "${base_libdir}/firmware/pru/PRU_Halt.out"
> @@ -282,7 +282,7 @@ ALTERNATIVE_TARGET_pru-icss-halt[j7-txpru1_1-fw] = "${base_libdir}/firmware/pru/
>  ALTERNATIVE_PRIORITY_pru-icss-halt = "50"
>  
>  # Create the pru-icss-rpmsg-echo firmware alternatives
> -ALTERNATIVE_pru-icss-rpmsg-echo = "${PRU_ICSS_ALTERNATIVES}"
> +ALTERNATIVE:pru-icss-rpmsg-echo = "${PRU_ICSS_ALTERNATIVES}"
>  
>  ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am335x-pru0-fw] = "${base_libdir}/firmware/pru/PRU_RPMsg_Echo_Interrupt0.out"
>  ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am335x-pru1-fw] = "${base_libdir}/firmware/pru/PRU_RPMsg_Echo_Interrupt1.out"
> @@ -326,8 +326,8 @@ ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[j7-rtu1_1-fw] = "${base_libdir}/firmware/
>  
>  ALTERNATIVE_PRIORITY_pru-icss-rpmsg-echo = "100"
>  
> -ALLOW_EMPTY_${PN} = "1"
> +ALLOW_EMPTY:${PN} = "1"
>  
>  # This installs PRU firmware, so skip "arch" QA check
> -INSANE_SKIP_${PN}-halt = "arch"
> -INSANE_SKIP_${PN}-rpmsg-echo = "arch"
> +INSANE_SKIP:${PN}-halt = "arch"
> +INSANE_SKIP:${PN}-rpmsg-echo = "arch"
> diff --git a/recipes-bsp/pru/pru-pwm-fw_git.bb b/recipes-bsp/pru/pru-pwm-fw_git.bb
> index a8c7103..14c8139 100644
> --- a/recipes-bsp/pru/pru-pwm-fw_git.bb
> +++ b/recipes-bsp/pru/pru-pwm-fw_git.bb
> @@ -34,6 +34,6 @@ do_install() {
>  	install -m 0644 ${S}/gen/pwm.out ${D}/lib/firmware/ti-pruss/am65x-pru0-pwm-fw.elf
>  }
>  
> -FILES_${PN} = "/lib/firmware"
> +FILES:${PN} = "/lib/firmware"
>  
> -INSANE_SKIP_${PN} = "arch"
> +INSANE_SKIP:${PN} = "arch"
> diff --git a/recipes-bsp/pru/pru-swuart-fw_git.bb b/recipes-bsp/pru/pru-swuart-fw_git.bb
> index 1cb51f3..f0d9e80 100644
> --- a/recipes-bsp/pru/pru-swuart-fw_git.bb
> +++ b/recipes-bsp/pru/pru-swuart-fw_git.bb
> @@ -15,7 +15,7 @@ TI_PDK_COMP = "ti.drv.uart"
>  
>  PE = "1"
>  
> -SRC_URI_append = " \
> +SRC_URI:append = " \
>  	file://0001-icss_uart-add-Makefile-for-building-firmware.patch \
>  	file://0001-icss_uart-remove-dependency-on-PDK-CSL.patch \
>  "
> @@ -35,6 +35,6 @@ do_install() {
>  	install -m 0644 ${S}/firmware/icss_uart/src/gen/src.out ${D}/lib/firmware/ti-pruss/pru_swuart-fw.elf
>  }
>  
> -FILES_${PN} = "/lib/firmware"
> +FILES:${PN} = "/lib/firmware"
>  
> -INSANE_SKIP_${PN} = "arch"
> +INSANE_SKIP:${PN} = "arch"
> diff --git a/recipes-bsp/pru/ti-pru-sw-edma-driver_1.00.00.bb b/recipes-bsp/pru/ti-pru-sw-edma-driver_1.00.00.bb
> index a837b35..98ab387 100644
> --- a/recipes-bsp/pru/ti-pru-sw-edma-driver_1.00.00.bb
> +++ b/recipes-bsp/pru/ti-pru-sw-edma-driver_1.00.00.bb
> @@ -7,9 +7,9 @@ COMPATIBLE_MACHINE = "omapl138"
>  
>  INHIBIT_PACKAGE_STRIP = "1"
>  
> -MACHINE_KERNEL_PR_append = "b"
> +MACHINE_KERNEL_PR:append = "b"
>  PR = "${MACHINE_KERNEL_PR}"
> -PV_append = "+svn${SRCPV}"
> +PV:append = "+svn${SRCPV}"
>  
>  SRC_URI = "svn://gforge.ti.com/svn/pru_sw/;module=trunk;protocol=https;user=anonymous;pswd=''"
>  
> @@ -21,7 +21,7 @@ inherit module
>  
>  EXTRA_OEMAKE += "KERNEL_DIR='${STAGING_KERNEL_DIR}'"
>  
> -do_compile_prepend () {
> +do_compile:prepend () {
>          export CCTOOL_PREFIX="${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX}"
>  }
>  
> diff --git a/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb b/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb
> index 67e8cd0..6074674 100644
> --- a/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb
> +++ b/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb
> @@ -34,6 +34,6 @@ do_install() {
>  	done
>  }
>  
> -FILES_${PN} = "${base_libdir}/firmware"
> +FILES:${PN} = "${base_libdir}/firmware"
>  
> -INSANE_SKIP_${PN} = "arch"
> +INSANE_SKIP:${PN} = "arch"
> diff --git a/recipes-bsp/prueth-fw/prueth-fw-am65x_git.bb b/recipes-bsp/prueth-fw/prueth-fw-am65x_git.bb
> index d447df3..f688fb7 100644
> --- a/recipes-bsp/prueth-fw/prueth-fw-am65x_git.bb
> +++ b/recipes-bsp/prueth-fw/prueth-fw-am65x_git.bb
> @@ -32,6 +32,6 @@ do_install() {
>  	done
>  }
>  
> -FILES_${PN} = "${base_libdir}/firmware"
> +FILES:${PN} = "${base_libdir}/firmware"
>  
> -INSANE_SKIP_${PN} = "arch"
> +INSANE_SKIP:${PN} = "arch"
> diff --git a/recipes-bsp/prueth-fw/prueth-fw_5.6.15.bb b/recipes-bsp/prueth-fw/prueth-fw_5.6.15.bb
> index c392673..99da31b 100644
> --- a/recipes-bsp/prueth-fw/prueth-fw_5.6.15.bb
> +++ b/recipes-bsp/prueth-fw/prueth-fw_5.6.15.bb
> @@ -32,6 +32,6 @@ do_install() {
>  }
>  
>  
> -FILES_${PN} = "${base_libdir}/firmware"
> +FILES:${PN} = "${base_libdir}/firmware"
>  
> -INSANE_SKIP_${PN} = "arch"
> +INSANE_SKIP:${PN} = "arch"
> diff --git a/recipes-bsp/pruhsr-fw/pruhsr-fw_2.17.25.bb b/recipes-bsp/pruhsr-fw/pruhsr-fw_2.17.25.bb
> index 2616373..24f1bd4 100644
> --- a/recipes-bsp/pruhsr-fw/pruhsr-fw_2.17.25.bb
> +++ b/recipes-bsp/pruhsr-fw/pruhsr-fw_2.17.25.bb
> @@ -32,6 +32,6 @@ do_install() {
>  	done
>  }
>  
> -FILES_${PN} = "${base_libdir}/firmware"
> +FILES:${PN} = "${base_libdir}/firmware"
>  
> -INSANE_SKIP_${PN} = "arch"
> +INSANE_SKIP:${PN} = "arch"
> diff --git a/recipes-bsp/pruprp-fw/pruprp-fw_2.17.25.bb b/recipes-bsp/pruprp-fw/pruprp-fw_2.17.25.bb
> index e71bc00..e9ba0c2 100644
> --- a/recipes-bsp/pruprp-fw/pruprp-fw_2.17.25.bb
> +++ b/recipes-bsp/pruprp-fw/pruprp-fw_2.17.25.bb
> @@ -33,6 +33,6 @@ do_install() {
>  	done
>  }
>  
> -FILES_${PN} = "${base_libdir}/firmware"
> +FILES:${PN} = "${base_libdir}/firmware"
>  
> -INSANE_SKIP_${PN} = "arch"
> +INSANE_SKIP:${PN} = "arch"
> diff --git a/recipes-bsp/pruss-lld/pruss-lld-apps_git.bb b/recipes-bsp/pruss-lld/pruss-lld-apps_git.bb
> index 48eab40..0eb8364 100644
> --- a/recipes-bsp/pruss-lld/pruss-lld-apps_git.bb
> +++ b/recipes-bsp/pruss-lld/pruss-lld-apps_git.bb
> @@ -2,14 +2,14 @@ DESCRIPTION = "TI PRUSS low level driver example applications"
>  
>  DEPENDS="common-csl-ip pruss-lld osal ti-pdk-build-rtos pruss-lld-rtos"
>  
> -DEPENDS_append_ti33x = " starterware"
> -DEPENDS_append_ti43x = " starterware"
> +DEPENDS:append_ti33x = " starterware"
> +DEPENDS:append_ti43x = " starterware"
>  
>  include pruss-lld.inc
>  
>  PR = "${INC_PR}.0"
>  
> -EXTRA_OEMAKE += "-f makefile_armv7 PDK_INSTALL_PATH=${STAGING_INCDIR} PDK_PKG_PATH=${STAGING_DATADIR}/ti/ti-pdk-tree/packages PRUSS_SRC_DIR=${S}"
> +EXTRA_OEMAKE += "-f makefile:armv7 PDK_INSTALL_PATH=${STAGING_INCDIR} PDK_PKG_PATH=${STAGING_DATADIR}/ti/ti-pdk-tree/packages PRUSS_SRC_DIR=${S}"
>  
>  
>  DEVICE_LIST ?= "${TI_PDK_LIMIT_SOCS}"
> diff --git a/recipes-bsp/pruss-lld/pruss-lld-rtos_git.bb b/recipes-bsp/pruss-lld/pruss-lld-rtos_git.bb
> index 9ab09b6..ef7c08b 100644
> --- a/recipes-bsp/pruss-lld/pruss-lld-rtos_git.bb
> +++ b/recipes-bsp/pruss-lld/pruss-lld-rtos_git.bb
> @@ -3,12 +3,12 @@ SUMMARY = "TI RTOS low level driver library for PRUSS"
>  inherit ti-pdk
>  require recipes-bsp/pruss-lld/pruss-lld.inc
>  
> -COMPATIBLE_MACHINE_append = "|k3"
> +COMPATIBLE_MACHINE:append = "|k3"
>  PR = "${INC_PR}.0"
>  
> -DEPENDS_append = " osal-rtos"
> -DEPENDS_append_ti33x = " starterware-rtos"
> -DEPENDS_append_ti43x = " starterware-rtos"
> +DEPENDS:append = " osal-rtos"
> +DEPENDS:append_ti33x = " starterware-rtos"
> +DEPENDS:append_ti43x = " starterware-rtos"
>  
>  # Build with make instead of XDC
>  TI_PDK_XDCMAKE = "0"
> @@ -19,4 +19,4 @@ export DEST_ROOT="${WORKDIR}/build"
>  # HTML doc link params
>  PDK_COMP_LINK_TEXT = "PRUSS LLD"
>  
> -INSANE_SKIP_${PN} = "arch"
> +INSANE_SKIP:${PN} = "arch"
> diff --git a/recipes-bsp/pruss-lld/pruss-lld-test_git.bb b/recipes-bsp/pruss-lld/pruss-lld-test_git.bb
> index 8007f65..29cc32a 100644
> --- a/recipes-bsp/pruss-lld/pruss-lld-test_git.bb
> +++ b/recipes-bsp/pruss-lld/pruss-lld-test_git.bb
> @@ -6,7 +6,7 @@ include pruss-lld.inc
>  
>  PR = "${INC_PR}.2"
>  
> -EXTRA_OEMAKE += "-f makefile_armv7 PDK_INSTALL_PATH=${STAGING_INCDIR} PRUSS_SRC_DIR=${S}"
> +EXTRA_OEMAKE += "-f makefile:armv7 PDK_INSTALL_PATH=${STAGING_INCDIR} PRUSS_SRC_DIR=${S}"
>  
>  DEVICE_LIST ?= "${TI_PDK_LIMIT_SOCS}"
>  
> diff --git a/recipes-bsp/pruss-lld/pruss-lld_git.bb b/recipes-bsp/pruss-lld/pruss-lld_git.bb
> index f1e93cd..2ab599d 100644
> --- a/recipes-bsp/pruss-lld/pruss-lld_git.bb
> +++ b/recipes-bsp/pruss-lld/pruss-lld_git.bb
> @@ -6,7 +6,7 @@ include pruss-lld.inc
>  
>  PR = "${INC_PR}.2"
>  
> -EXTRA_OEMAKE += "-f makefile_armv7 PDK_INSTALL_PATH=${STAGING_INCDIR}"
> +EXTRA_OEMAKE += "-f makefile:armv7 PDK_INSTALL_PATH=${STAGING_INCDIR}"
>  
>  do_compile () {
>  #   Build the lib
> diff --git a/recipes-bsp/prusw-fw/prusw-fw_3.2.9.bb b/recipes-bsp/prusw-fw/prusw-fw_3.2.9.bb
> index 3f5ef7e..43109b6 100644
> --- a/recipes-bsp/prusw-fw/prusw-fw_3.2.9.bb
> +++ b/recipes-bsp/prusw-fw/prusw-fw_3.2.9.bb
> @@ -32,6 +32,6 @@ do_install() {
>  }
>  
>  
> -FILES_${PN} = "${base_libdir}/firmware"
> +FILES:${PN} = "${base_libdir}/firmware"
>  
> -INSANE_SKIP_${PN} = "arch"
> +INSANE_SKIP:${PN} = "arch"
> diff --git a/recipes-bsp/qmss-lld/qmss-lld-rtos_git.bb b/recipes-bsp/qmss-lld/qmss-lld-rtos_git.bb
> index 7f77142..d854e0b 100644
> --- a/recipes-bsp/qmss-lld/qmss-lld-rtos_git.bb
> +++ b/recipes-bsp/qmss-lld/qmss-lld-rtos_git.bb
> @@ -4,6 +4,6 @@ require qmss-lld.inc
>  
>  PR = "${INC_PR}.1"
>  
> -COMPATIBLE_MACHINE_append = "|c66x"
> +COMPATIBLE_MACHINE:append = "|c66x"
>  
> -DEPENDS_append = " rm-lld-rtos"
> +DEPENDS:append = " rm-lld-rtos"
> diff --git a/recipes-bsp/qmss-lld/qmss-lld-test_git.bb b/recipes-bsp/qmss-lld/qmss-lld-test_git.bb
> index 53f6dcf..6eddbdd 100644
> --- a/recipes-bsp/qmss-lld/qmss-lld-test_git.bb
> +++ b/recipes-bsp/qmss-lld/qmss-lld-test_git.bb
> @@ -14,10 +14,10 @@ do_compile () {
>  #   Now build the lld in the updated directory
>  	for device in ${DEVICELIST}
>  	do
> -		make -f makefile_armv7 clean PDK_INSTALL_PATH=${STAGING_INCDIR} DEVICE="$device" QMSS_SRC_DIR=${S}
> +		make -f makefile:armv7 clean PDK_INSTALL_PATH=${STAGING_INCDIR} DEVICE="$device" QMSS_SRC_DIR=${S}
>  		for choice in ${CHOICELIST}
>  		do
> -			make -f makefile_armv7 tests examples PDK_INSTALL_PATH=${STAGING_INCDIR} DEVICE="$device" QMSS_SRC_DIR=${S} USEDYNAMIC_LIB="$choice"
> +			make -f makefile:armv7 tests examples PDK_INSTALL_PATH=${STAGING_INCDIR} DEVICE="$device" QMSS_SRC_DIR=${S} USEDYNAMIC_LIB="$choice"
>  		done
>  	done
>  }
> @@ -25,6 +25,6 @@ do_compile () {
>  do_install () {
>  	for device in ${DEVICELIST}
>  	do
> -		make -f makefile_armv7 installbin PDK_INSTALL_PATH=${STAGING_INCDIR} DEVICE="$device" QMSS_SRC_DIR=${S} INSTALL_BIN_BASE_DIR=${D}${bindir}
> +		make -f makefile:armv7 installbin PDK_INSTALL_PATH=${STAGING_INCDIR} DEVICE="$device" QMSS_SRC_DIR=${S} INSTALL_BIN_BASE_DIR=${D}${bindir}
>  	done
>  }
> diff --git a/recipes-bsp/qmss-lld/qmss-lld_git.bb b/recipes-bsp/qmss-lld/qmss-lld_git.bb
> index 04f82d9..4a40aed 100644
> --- a/recipes-bsp/qmss-lld/qmss-lld_git.bb
> +++ b/recipes-bsp/qmss-lld/qmss-lld_git.bb
> @@ -8,15 +8,15 @@ PR = "${INC_PR}.1"
>  
>  do_compile () {
>  #   Now build the lld
> -    make -f makefile_armv7 clean PDK_INSTALL_PATH=${STAGING_INCDIR}
> +    make -f makefile:armv7 clean PDK_INSTALL_PATH=${STAGING_INCDIR}
>  	for device in ${DEVICELIST}
>  	do
> -		make -f makefile_armv7 lib PDK_INSTALL_PATH=${STAGING_INCDIR}  DEVICE="${device}"
> +		make -f makefile:armv7 lib PDK_INSTALL_PATH=${STAGING_INCDIR}  DEVICE="${device}"
>  	done
>  }
>  
>  do_install () {
> -    make -f makefile_armv7 install PDK_INSTALL_PATH=${STAGING_INCDIR} INSTALL_INC_BASE_DIR=${D}${includedir} INSTALL_LIB_BASE_DIR=${D}${libdir}
> +    make -f makefile:armv7 install PDK_INSTALL_PATH=${STAGING_INCDIR} INSTALL_INC_BASE_DIR=${D}${includedir} INSTALL_LIB_BASE_DIR=${D}${libdir}
>      chown -R root:root ${D}
>  
>      # Set the generic device library symbolic link to default k2h
> @@ -35,4 +35,4 @@ INHIBIT_PACKAGE_STRIP_FILES_k2hk = "${PKGD}${libdir}/libqmss_k2h.a ${PKGD}${libd
>  INHIBIT_PACKAGE_STRIP_FILES_k2e = "${PKGD}${libdir}/libqmss_k2e.a"
>  INHIBIT_PACKAGE_STRIP_FILES_k2l = "${PKGD}${libdir}/libqmss_k2l.a"
>  INHIBIT_PACKAGE_STRIP_FILES_k2g = "${PKGD}${libdir}/libqmss_k2h.a"
> -INHIBIT_PACKAGE_STRIP_FILES_append = " ${PKGD}${libdir}/libqmss.a"
> +INHIBIT_PACKAGE_STRIP_FILES:append = " ${PKGD}${libdir}/libqmss.a"
> diff --git a/recipes-bsp/qmss-pdsp-fw/qmss-pdsp-fw_git.bb b/recipes-bsp/qmss-pdsp-fw/qmss-pdsp-fw_git.bb
> index cd20782..ac03048 100644
> --- a/recipes-bsp/qmss-pdsp-fw/qmss-pdsp-fw_git.bb
> +++ b/recipes-bsp/qmss-pdsp-fw/qmss-pdsp-fw_git.bb
> @@ -26,4 +26,4 @@ do_install() {
>  	install -m 0644 ${S}/ti-keystone/${ORIGIN} ${D}${base_libdir}/firmware/${TARGET}
>  }
>  
> -FILES_${PN} = "${base_libdir}/firmware"
> +FILES:${PN} = "${base_libdir}/firmware"
> diff --git a/recipes-bsp/rm-lld/rm-lld-rtos_git.bb b/recipes-bsp/rm-lld/rm-lld-rtos_git.bb
> index 2f49892..2a279a0 100644
> --- a/recipes-bsp/rm-lld/rm-lld-rtos_git.bb
> +++ b/recipes-bsp/rm-lld/rm-lld-rtos_git.bb
> @@ -1,6 +1,6 @@
>  inherit ti-pdk
>  
> -COMPATIBLE_MACHINE_append = "|c66x"
> +COMPATIBLE_MACHINE:append = "|c66x"
>  
>  require rm-lld.inc
>  
> diff --git a/recipes-bsp/rm-lld/rm-lld_git.bb b/recipes-bsp/rm-lld/rm-lld_git.bb
> index e2701d0..3aa87f9 100644
> --- a/recipes-bsp/rm-lld/rm-lld_git.bb
> +++ b/recipes-bsp/rm-lld/rm-lld_git.bb
> @@ -6,7 +6,7 @@ DEPENDS = "ti-ipc libdaemon"
>  
>  PACKAGES =+ "${PN}-test"
>  
> -FILES_${PN}-test = "${bindir}/rmDspClientTest.out \
> +FILES:${PN}-test = "${bindir}/rmDspClientTest.out \
>                      ${bindir}/rmLinuxClientTest.out \
>                      ${bindir}/rmLinuxMtClientTest.out \
>                      ${bindir}/ti/drv/rm/test/dts_files/*.dtb"
> @@ -15,10 +15,10 @@ CHOICELIST = "yes no"
>  
>  do_compile () {
>  #   Now build the lld
> -    make -f makefile_armv7 clean lib PDK_INSTALL_PATH=${STAGING_INCDIR} RM_SRC_DIR=${S}
> +    make -f makefile:armv7 clean lib PDK_INSTALL_PATH=${STAGING_INCDIR} RM_SRC_DIR=${S}
>      for choice in ${CHOICELIST}
>      do
> -      make -f makefile_armv7 tests IPC_DEVKIT_INSTALL_PATH=${STAGING_INCDIR} PDK_INSTALL_PATH=${BASEDIR} USEDYNAMIC_LIB="$choice"
> +      make -f makefile:armv7 tests IPC_DEVKIT_INSTALL_PATH=${STAGING_INCDIR} PDK_INSTALL_PATH=${BASEDIR} USEDYNAMIC_LIB="$choice"
>      done
>  }
>  
> @@ -26,7 +26,7 @@ do_install () {
>      install -d ${D}${includedir}/ti/drv/rm
>      install -d ${D}${libdir}
>      install -d ${D}${bindir}
> -    make -f makefile_armv7 install installbin installbin_test INSTALL_INC_BASE_DIR=${D}${includedir} INSTALL_LIB_BASE_DIR=${D}${libdir} INSTALL_BIN_BASE_DIR=${D}${bindir}
> +    make -f makefile:armv7 install installbin installbin_test INSTALL_INC_BASE_DIR=${D}${includedir} INSTALL_LIB_BASE_DIR=${D}${libdir} INSTALL_BIN_BASE_DIR=${D}${bindir}
>      chown -R root:root ${D}
>  }
>  
> diff --git a/recipes-bsp/sa-lld/sa-lld-rtos_git.bb b/recipes-bsp/sa-lld/sa-lld-rtos_git.bb
> index 5bcdc2e..a3f68dc 100644
> --- a/recipes-bsp/sa-lld/sa-lld-rtos_git.bb
> +++ b/recipes-bsp/sa-lld/sa-lld-rtos_git.bb
> @@ -6,18 +6,18 @@ require recipes-bsp/sa-lld/sa-lld.inc
>  
>  PR = "${INC_PR}.0"
>  
> -COMPATIBLE_MACHINE_append = "|c667x-evm|k3"
> +COMPATIBLE_MACHINE:append = "|c667x-evm|k3"
>  
>  # Build with make instead of XDC
>  TI_PDK_XDCMAKE_k3 = "0"
>  
>  # SA promote/demote library depends on osal
> -DEPENDS_append = " osal-rtos \
> +DEPENDS:append = " osal-rtos \
>  "
>  export PDK_SA_ROOT_PATH ="${WORKDIR}/build"
>  export DEST_ROOT="${S}"
>  
> -INSANE_SKIP_${PN} = "arch"
> +INSANE_SKIP:${PN} = "arch"
>  
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
> diff --git a/recipes-bsp/sa-lld/sa-lld-test_git.bb b/recipes-bsp/sa-lld/sa-lld-test_git.bb
> index b9050b6..847c7bb 100644
> --- a/recipes-bsp/sa-lld/sa-lld-test_git.bb
> +++ b/recipes-bsp/sa-lld/sa-lld-test_git.bb
> @@ -17,7 +17,7 @@ CHOICELIST = "no yes"
>  CFLAGS += "-fcommon"
>  
>  PARALLEL_MAKE = ""
> -EXTRA_OEMAKE = "-f makefile_armv7 PDK_INSTALL_PATH=${STAGING_INCDIR} SA_SRC_DIR=${S}"
> +EXTRA_OEMAKE = "-f makefile:armv7 PDK_INSTALL_PATH=${STAGING_INCDIR} SA_SRC_DIR=${S}"
>  
>  do_compile () {
>  #   Now build the lld in the updated directory
> @@ -43,4 +43,4 @@ do_install () {
>  	done
>  }
>  
> -INSANE_SKIP_${PN} = "ldflags"
> +INSANE_SKIP:${PN} = "ldflags"
> diff --git a/recipes-bsp/sa-lld/sa-lld_git.bb b/recipes-bsp/sa-lld/sa-lld_git.bb
> index a45fe1f..29b99cd 100644
> --- a/recipes-bsp/sa-lld/sa-lld_git.bb
> +++ b/recipes-bsp/sa-lld/sa-lld_git.bb
> @@ -7,7 +7,7 @@ include sa-lld.inc
>  PR = "${INC_PR}.1"
>  
>  PARALLEL_MAKE = ""
> -EXTRA_OEMAKE = "-f makefile_armv7 PDK_INSTALL_PATH=${STAGING_INCDIR}"
> +EXTRA_OEMAKE = "-f makefile:armv7 PDK_INSTALL_PATH=${STAGING_INCDIR}"
>  
>  do_compile () {
>  #   Now build the lld in the updated directory
> diff --git a/recipes-bsp/sciclient/sciclient-rtos_git.bb b/recipes-bsp/sciclient/sciclient-rtos_git.bb
> index deaf0b1..4511099 100644
> --- a/recipes-bsp/sciclient/sciclient-rtos_git.bb
> +++ b/recipes-bsp/sciclient/sciclient-rtos_git.bb
> @@ -14,7 +14,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
>  PR = "r1"
>  
> -DEPENDS_append = " osal-rtos common-csl-ip-rtos openssl-native"
> +DEPENDS:append = " osal-rtos common-csl-ip-rtos openssl-native"
>  
>  # Build with make instead of XDC
>  TI_PDK_XDCMAKE = "0"
> @@ -31,7 +31,7 @@ BUILD_HS_j7-hs-evm = "yes"
>  export BUILD_HS
>  
>  # Sciclient for am65x supports mcu1_1 in addition to the default cores in TI_PDK_LIMIT_CORES
> -TI_PDK_LIMIT_CORES_append_am65xx = " mcu1_1"
> +TI_PDK_LIMIT_CORES:append_am65xx = " mcu1_1"
>  
>  # HTML doc link params
>  PDK_COMP_LINK_TEXT = "SCICLIENT"
> @@ -66,7 +66,7 @@ do_compile() {
>  }
>  
>  
> -do_compile_prepend_am65xx-hs-evm() {
> +do_compile:prepend_am65xx-hs-evm() {
>  
>      cd ${SCICLIENT_ROOTPATH}
>  
> @@ -79,7 +79,7 @@ do_compile_prepend_am65xx-hs-evm() {
>      cd -
>  }
>  
> -do_compile_prepend_am65xx-evm() {
> +do_compile:prepend_am65xx-evm() {
>  
>      cd ${SCICLIENT_ROOTPATH}/tools
>  
> @@ -92,7 +92,7 @@ do_compile_prepend_am65xx-evm() {
>  }
>  
>  
> -do_compile_prepend_j7-evm() {
> +do_compile:prepend_j7-evm() {
>  
>      cd ${SCICLIENT_ROOTPATH}/tools
>      # Create the .bin file for GP
> @@ -100,7 +100,7 @@ do_compile_prepend_j7-evm() {
>      cd -
>  }
>  
> -do_compile_prepend_j7-hs-evm() {
> +do_compile:prepend_j7-hs-evm() {
>  
>      cd ${SCICLIENT_ROOTPATH}/tools
>      # Create the .bin file for HS
> @@ -114,11 +114,11 @@ do_install() {
>      find -name "*.tar" -exec tar xf {} --no-same-owner -C ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/drv/sciclient \;
>  }
>  
> -FILES_${PN} += "${PDK_INSTALL_DIR_RECIPE}/packages"
> +FILES:${PN} += "${PDK_INSTALL_DIR_RECIPE}/packages"
>  
> -INSANE_SKIP_${PN} = "arch ldflags file-rdeps"
> +INSANE_SKIP:${PN} = "arch ldflags file-rdeps"
>  
> -INSANE_SKIP_${PN}-dbg = "arch"
> +INSANE_SKIP:${PN}-dbg = "arch"
>  
>  INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
>  INHIBIT_PACKAGE_STRIP = "1"
> diff --git a/recipes-bsp/serdes-diag/serdes-diag-rtos_git.bb b/recipes-bsp/serdes-diag/serdes-diag-rtos_git.bb
> index 442c4cb..f9f448e 100644
> --- a/recipes-bsp/serdes-diag/serdes-diag-rtos_git.bb
> +++ b/recipes-bsp/serdes-diag/serdes-diag-rtos_git.bb
> @@ -32,4 +32,4 @@ TI_PDK_XDCMAKE_k3 = "0"
>  # HTML doc link params
>  PDK_COMP_LINK_TEXT = "SERDES Diagnostics"
>  
> -INSANE_SKIP_${PN} = "arch"
> +INSANE_SKIP:${PN} = "arch"
> diff --git a/recipes-bsp/serdes-fw/serdes-fw_git.bb b/recipes-bsp/serdes-fw/serdes-fw_git.bb
> index 6627178..7d42494 100644
> --- a/recipes-bsp/serdes-fw/serdes-fw_git.bb
> +++ b/recipes-bsp/serdes-fw/serdes-fw_git.bb
> @@ -26,4 +26,4 @@ do_install() {
>  	done
>  }
>  
> -FILES_${PN} = "${base_libdir}/firmware"
> +FILES:${PN} = "${base_libdir}/firmware"
> diff --git a/recipes-bsp/spi-lld/spi-lld-rtos_git.bb b/recipes-bsp/spi-lld/spi-lld-rtos_git.bb
> index 7d53d15..18ec929 100644
> --- a/recipes-bsp/spi-lld/spi-lld-rtos_git.bb
> +++ b/recipes-bsp/spi-lld/spi-lld-rtos_git.bb
> @@ -14,14 +14,14 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
>  PR = "r0"
>  
> -DEPENDS_append = " osal-rtos \
> +DEPENDS:append = " osal-rtos \
>                     edma3-lld-rtos \
>  "
> -DEPENDS_append_ti33x = " starterware-rtos pruss-lld-rtos gpio-lld-rtos"
> -DEPENDS_append_ti43x = " starterware-rtos pruss-lld-rtos gpio-lld-rtos"
> +DEPENDS:append_ti33x = " starterware-rtos pruss-lld-rtos gpio-lld-rtos"
> +DEPENDS:append_ti43x = " starterware-rtos pruss-lld-rtos gpio-lld-rtos"
>  
> -DEPENDS_remove_k3 = "edma3-lld-rtos "
> -DEPENDS_append_k3 = " udma-lld-rtos"
> +DEPENDS:remove_k3 = "edma3-lld-rtos "
> +DEPENDS:append_k3 = " udma-lld-rtos"
>  
>  
>  # Build with make instead of XDC
> @@ -31,7 +31,7 @@ export PDK_SPI_ROOT_PATH ="${WORKDIR}/build"
>  export DEST_ROOT="${S}"
>  
>  export EDMA3LLD_BIOS6_INSTALLDIR = "${EDMA3_LLD_INSTALL_DIR}"
> -XDCPATH_append = ";${EDMA3_LLD_INSTALL_DIR}/packages"
> +XDCPATH:append = ";${EDMA3_LLD_INSTALL_DIR}/packages"
>  
>  # HTML doc link params
>  PDK_COMP_LINK_TEXT = "SPI LLD"
> diff --git a/recipes-bsp/srio-lld/srio-lld-rtos_git.bb b/recipes-bsp/srio-lld/srio-lld-rtos_git.bb
> index 7708a18..9c53575 100644
> --- a/recipes-bsp/srio-lld/srio-lld-rtos_git.bb
> +++ b/recipes-bsp/srio-lld/srio-lld-rtos_git.bb
> @@ -6,10 +6,10 @@ require recipes-bsp/srio-lld/srio-lld.inc
>  
>  PR = "${INC_PR}.0"
>  
> -DEPENDS_append = " cppi-lld-rtos \
> +DEPENDS:append = " cppi-lld-rtos \
>                     qmss-lld-rtos \
>  "
> -COMPATIBLE_MACHINE_append = "|c66x"
> +COMPATIBLE_MACHINE:append = "|c66x"
>  
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
> diff --git a/recipes-bsp/srio-lld/srio-lld.inc b/recipes-bsp/srio-lld/srio-lld.inc
> index efe379f..d2d08b6 100644
> --- a/recipes-bsp/srio-lld/srio-lld.inc
> +++ b/recipes-bsp/srio-lld/srio-lld.inc
> @@ -15,4 +15,4 @@ DEVICELIST = "k2h k2k"
>  
>  BASEDIR = "${WORKDIR}/git"
>  
> -EXTRA_OEMAKE = "-f makefile_armv7 PDK_INSTALL_PATH=${STAGING_INCDIR}"
> +EXTRA_OEMAKE = "-f makefile:armv7 PDK_INSTALL_PATH=${STAGING_INCDIR}"
> diff --git a/recipes-bsp/starterware/starterware-rtos_git.bb b/recipes-bsp/starterware/starterware-rtos_git.bb
> index bcac8d4..0d22b4d 100644
> --- a/recipes-bsp/starterware/starterware-rtos_git.bb
> +++ b/recipes-bsp/starterware/starterware-rtos_git.bb
> @@ -24,10 +24,10 @@ do_install() {
>      find -name "*.tar" -exec tar xf {} --no-same-owner -C ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/starterware \;
>  }
>  
> -FILES_${PN} += "${PDK_INSTALL_DIR_RECIPE}/packages"
> +FILES:${PN} += "${PDK_INSTALL_DIR_RECIPE}/packages"
>  
>  INHIBIT_PACKAGE_STRIP = "1"
>  INHIBIT_SYSROOT_STRIP = "1"
>  INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
> -INSANE_SKIP_${PN} = "arch staticdev file-rdeps"
> +INSANE_SKIP:${PN} = "arch staticdev file-rdeps"
>  
> diff --git a/recipes-bsp/starterware/starterware_git.bb b/recipes-bsp/starterware/starterware_git.bb
> index 3adfac3..a560e7b 100644
> --- a/recipes-bsp/starterware/starterware_git.bb
> +++ b/recipes-bsp/starterware/starterware_git.bb
> @@ -2,7 +2,7 @@ require starterware.inc
>  
>  PR = "${INC_PR}.0"
>  
> -ALLOW_EMPTY_${PN} = "1"
> +ALLOW_EMPTY:${PN} = "1"
>  
>  CLEANBROKEN = "1"
>  
> diff --git a/recipes-bsp/tcp3d-lld/tcp3d-lld-rtos_git.bb b/recipes-bsp/tcp3d-lld/tcp3d-lld-rtos_git.bb
> index 0f7c52b..db4421e 100644
> --- a/recipes-bsp/tcp3d-lld/tcp3d-lld-rtos_git.bb
> +++ b/recipes-bsp/tcp3d-lld/tcp3d-lld-rtos_git.bb
> @@ -14,10 +14,10 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
>  PR = "r0"
>  
> -DEPENDS_append = " edma3-lld-rtos"
> +DEPENDS:append = " edma3-lld-rtos"
>  
>  export EDMA3LLD_BIOS6_INSTALLDIR = "${EDMA3_LLD_INSTALL_DIR}"
> -XDCPATH_append = ";${EDMA3_LLD_INSTALL_DIR}/packages"
> +XDCPATH:append = ";${EDMA3_LLD_INSTALL_DIR}/packages"
>  
>  # HTML doc link params
>  PDK_COMP_LINK_TEXT = "TCP3D LLD"
> diff --git a/recipes-bsp/ti-ocf-crypto-module/ti-ocf-crypto-module_1.0.bb b/recipes-bsp/ti-ocf-crypto-module/ti-ocf-crypto-module_1.0.bb
> index 43eed7d..946f2ce 100644
> --- a/recipes-bsp/ti-ocf-crypto-module/ti-ocf-crypto-module_1.0.bb
> +++ b/recipes-bsp/ti-ocf-crypto-module/ti-ocf-crypto-module_1.0.bb
> @@ -19,13 +19,13 @@ S = "${WORKDIR}/trunk"
>  
>  inherit module
>  
> -MACHINE_KERNEL_PR_append = "b"
> +MACHINE_KERNEL_PR:append = "b"
>  PR = "${MACHINE_KERNEL_PR}"
> -PV_append = "+svn${SRCPV}"
> +PV:append = "+svn${SRCPV}"
>  
>  EXTRA_OEMAKE += "KERNEL_DIR=${STAGING_KERNEL_DIR}"
>  
> -do_compile_prepend () {
> +do_compile:prepend () {
>      sed -i "s/arm-none-linux-gnueabi-/${TARGET_PREFIX}/g" ${S}/Makefile
>  }
>  
> diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw-source_git.bb b/recipes-bsp/ti-sci-fw/ti-sci-fw-source_git.bb
> index 063e72d..c8f830f 100644
> --- a/recipes-bsp/ti-sci-fw/ti-sci-fw-source_git.bb
> +++ b/recipes-bsp/ti-sci-fw/ti-sci-fw-source_git.bb
> @@ -20,7 +20,7 @@ do_compile[noexec] = "1"
>  
>  SRCIPK_SRC_DIR = "${WORKDIR}/imggen"
>  SRCIPK_INSTALL_DIR = "board-support/k3-image-gen-${PV}"
> -FILES_${PN} = "${SRCIPK_INSTALL_DIR}"
> +FILES:${PN} = "${SRCIPK_INSTALL_DIR}"
>  
>  do_install() {
>      # Copy sources for packaging
> @@ -42,4 +42,4 @@ do_install() {
>  }
>  
>  # Do not perform any QA checks on source package
> -INSANE_SKIP_${PN} += "${ALL_QA}"
> +INSANE_SKIP:${PN} += "${ALL_QA}"
> diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_0.1.1.50.bb b/recipes-bsp/ti-sci-fw/ti-sci-fw_0.1.1.50.bb
> index 9e68fdf..32ea3b4 100644
> --- a/recipes-bsp/ti-sci-fw/ti-sci-fw_0.1.1.50.bb
> +++ b/recipes-bsp/ti-sci-fw/ti-sci-fw_0.1.1.50.bb
> @@ -25,7 +25,7 @@ do_install() {
>  	install -m 0644 ${S}/ti-keystone/${TARGET} ${D}/boot/${TARGET}
>  }
>  
> -FILES_${PN} = "/boot"
> +FILES:${PN} = "/boot"
>  
>  inherit deploy
>  
> diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> index 87fdec6..57118ad 100644
> --- a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> +++ b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> @@ -1,15 +1,15 @@
>  require recipes-bsp/ti-sci-fw/ti-sci-fw.inc
>  
>  DEPENDS = "openssl-native u-boot-mkimage-native dtc-native"
> -DEPENDS_append_j7200-evm-k3r5 = " virtual/bootloader"
> -DEPENDS_append_am64xx-evm-k3r5 = " virtual/bootloader"
> +DEPENDS:append_j7200-evm-k3r5 = " virtual/bootloader"
> +DEPENDS:append_am64xx-evm-k3r5 = " virtual/bootloader"
>  
>  CLEANBROKEN = "1"
>  PR = "r1"
>  
>  # Loaded by R5F core
>  COMPATIBLE_MACHINE = "k3r5"
> -COMPATIBLE_MACHINE_aarch64 = "null"
> +COMPATIBLE_MACHINE:aarch64 = "null"
>  
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
> @@ -49,10 +49,10 @@ EXTRA_OEMAKE = "\
>  EXTRA_OEMAKE_HS = " \
>      HS=1 SYSFW_HS_PATH="${S}/ti-sysfw/${SYSFW_BASE}-enc.bin" SYSFW_HS_INNER_CERT_PATH="${S}/ti-sysfw/${SYSFW_BASE}-cert.bin" \
>  "
> -EXTRA_OEMAKE_append = "${@['',' ${EXTRA_OEMAKE_HS}']['${SYSFW_SUFFIX}' == 'hs']}"
> +EXTRA_OEMAKE:append = "${@['',' ${EXTRA_OEMAKE_HS}']['${SYSFW_SUFFIX}' == 'hs']}"
>  
> -EXTRA_OEMAKE_append_j7200-evm-k3r5 = " SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
> -EXTRA_OEMAKE_append_am64xx-evm-k3r5 = " SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
> +EXTRA_OEMAKE:append_j7200-evm-k3r5 = " SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
> +EXTRA_OEMAKE:append_am64xx-evm-k3r5 = " SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
>  
>  do_compile() {
>  	cd ${WORKDIR}/imggen/
> @@ -68,7 +68,7 @@ do_install() {
>  	fi
>  }
>  
> -FILES_${PN} = "/boot"
> +FILES:${PN} = "/boot"
>  
>  inherit deploy
>  
> diff --git a/recipes-bsp/traceframework/traceframework-rtos_git.bb b/recipes-bsp/traceframework/traceframework-rtos_git.bb
> index 369b04b..55e4118 100644
> --- a/recipes-bsp/traceframework/traceframework-rtos_git.bb
> +++ b/recipes-bsp/traceframework/traceframework-rtos_git.bb
> @@ -4,7 +4,7 @@ require traceframework.inc
>  
>  PR = "${INC_PR}.2"
>  
> -XDCPATH_append = ";${UIA_INSTALL_DIR}/packages"
> +XDCPATH:append = ";${UIA_INSTALL_DIR}/packages"
>  
>  # HTML doc link params
>  PDK_COMP_LINK_TEXT = "Trace Framework"
> diff --git a/recipes-bsp/traceframework/traceframework_git.bb b/recipes-bsp/traceframework/traceframework_git.bb
> index 26eb81a..5a2873e 100644
> --- a/recipes-bsp/traceframework/traceframework_git.bb
> +++ b/recipes-bsp/traceframework/traceframework_git.bb
> @@ -8,7 +8,7 @@ PR = "${INC_PR}.0"
>  
>  BASEDIR = "${WORKDIR}/git"
>  
> -EXTRA_OEMAKE += "-f makefile_armv7 PDK_INSTALL_PATH=${STAGING_INCDIR} \
> +EXTRA_OEMAKE += "-f makefile:armv7 PDK_INSTALL_PATH=${STAGING_INCDIR} \
>                   CUIA_INSTALL_DIR=${STAGING_INCDIR} CUIA_LIB_DIR=${STAGING_LIBDIR}"
>  
>  do_compile () {
> @@ -34,7 +34,7 @@ do_install() {
>  
>  PACKAGES =+ "${PN}-test"
>  
> -FILES_${PN}-test = "${bindir}/tfw*.out \
> +FILES:${PN}-test = "${bindir}/tfw*.out \
>                      ${bindir}/*.txt"
>  
>  INHIBIT_PACKAGE_STRIP_FILES = "${PKGD}${libdir}/libtraceframework.a"
> diff --git a/recipes-bsp/transport-rtos/bmet-eth-rtos_git.bb b/recipes-bsp/transport-rtos/bmet-eth-rtos_git.bb
> index f14161f..aa21b65 100644
> --- a/recipes-bsp/transport-rtos/bmet-eth-rtos_git.bb
> +++ b/recipes-bsp/transport-rtos/bmet-eth-rtos_git.bb
> @@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://bmet_transport.h;beginline=12;endline=40;md5=6d209c69
>  
>  COMPATIBLE_MACHINE = "k2hk|k2e|k2l"
>  
> -DEPENDS_append = " qmss-lld-rtos \
> +DEPENDS:append = " qmss-lld-rtos \
>                     cppi-lld-rtos \
>  "
>  
> diff --git a/recipes-bsp/transport-rtos/nimu-icss-rtos_git.bb b/recipes-bsp/transport-rtos/nimu-icss-rtos_git.bb
> index 7400adf..e4f9905 100644
> --- a/recipes-bsp/transport-rtos/nimu-icss-rtos_git.bb
> +++ b/recipes-bsp/transport-rtos/nimu-icss-rtos_git.bb
> @@ -9,13 +9,13 @@ LIC_FILES_CHKSUM = "file://nimu_icssEth.h;beginline=1;endline=35;md5=3ea633a510b
>  
>  COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|k2g|c66x|omapl1|k3"
>  
> -DEPENDS_append = " ti-ndk \
> +DEPENDS:append = " ti-ndk \
>                     pruss-lld-rtos \
>                     icss-emac-lld-rtos \
>  "
> -DEPENDS_append_c665x-evm = " emac-lld-rtos"
> -DEPENDS_append_c667x-evm = " pa-lld-rtos"
> -DEPENDS_append_omapl1 = " emac-lld-rtos"
> +DEPENDS:append_c665x-evm = " emac-lld-rtos"
> +DEPENDS:append_c667x-evm = " pa-lld-rtos"
> +DEPENDS:append_omapl1 = " emac-lld-rtos"
>  
>  TI_PDK_COMP = "ti.transport.ndk.nimu_icss"
>  
> @@ -26,4 +26,4 @@ export PDK_NIMU_ICSS_ROOT_PATH ="${WORKDIR}/build"
>  export DEST_ROOT="${S}"
>  
>  export NDK_INSTALL_PATH = "${NDK_INSTALL_DIR}"
> -XDCPATH_append = ";${NDK_INSTALL_DIR}/packages"
> +XDCPATH:append = ";${NDK_INSTALL_DIR}/packages"
> diff --git a/recipes-bsp/transport-rtos/nimu-rtos_git.bb b/recipes-bsp/transport-rtos/nimu-rtos_git.bb
> index 4389b1e..75c9758 100644
> --- a/recipes-bsp/transport-rtos/nimu-rtos_git.bb
> +++ b/recipes-bsp/transport-rtos/nimu-rtos_git.bb
> @@ -11,19 +11,19 @@ COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|keystone|c66x|omapl1|k3"
>  
>  TI_PDK_COMP = "ti.transport.ndk.nimu"
>  
> -DEPENDS_append = " ti-ndk osal-rtos"
> -DEPENDS_append_ti33x = " starterware-rtos emac-lld-rtos"
> -DEPENDS_append_ti43x = " starterware-rtos emac-lld-rtos"
> -DEPENDS_append_omap-a15 = " emac-lld-rtos"
> -DEPENDS_append_keystone = " qmss-lld-rtos cppi-lld-rtos"
> -DEPENDS_append_k2hk = " pa-lld-rtos"
> -DEPENDS_append_k2e = " pa-lld-rtos"
> -DEPENDS_append_k2l = " pa-lld-rtos"
> -DEPENDS_append_k2g = " emac-lld-rtos"
> -DEPENDS_append_c665x-evm = " emac-lld-rtos"
> -DEPENDS_append_c667x-evm = " pa-lld-rtos cppi-lld-rtos"
> -DEPENDS_append_omapl1 = " emac-lld-rtos"
> -DEPENDS_append_k3 = " emac-lld-rtos pruss-lld-rtos"
> +DEPENDS:append = " ti-ndk osal-rtos"
> +DEPENDS:append_ti33x = " starterware-rtos emac-lld-rtos"
> +DEPENDS:append_ti43x = " starterware-rtos emac-lld-rtos"
> +DEPENDS:append_omap-a15 = " emac-lld-rtos"
> +DEPENDS:append_keystone = " qmss-lld-rtos cppi-lld-rtos"
> +DEPENDS:append_k2hk = " pa-lld-rtos"
> +DEPENDS:append_k2e = " pa-lld-rtos"
> +DEPENDS:append_k2l = " pa-lld-rtos"
> +DEPENDS:append_k2g = " emac-lld-rtos"
> +DEPENDS:append_c665x-evm = " emac-lld-rtos"
> +DEPENDS:append_c667x-evm = " pa-lld-rtos cppi-lld-rtos"
> +DEPENDS:append_omapl1 = " emac-lld-rtos"
> +DEPENDS:append_k3 = " emac-lld-rtos pruss-lld-rtos"
>  
>  # Build with make instead of XDC
>  TI_PDK_XDCMAKE = "0"
> @@ -32,4 +32,4 @@ export PDK_NIMU_ROOT_PATH ="${WORKDIR}/build"
>  export DEST_ROOT="${S}"
>  
>  export NDK_INSTALL_PATH = "${NDK_INSTALL_DIR}"
> -XDCPATH_append = ";${NDK_INSTALL_DIR}/packages"
> +XDCPATH:append = ";${NDK_INSTALL_DIR}/packages"
> diff --git a/recipes-bsp/transport-rtos/timesync-rtos_git.bb b/recipes-bsp/transport-rtos/timesync-rtos_git.bb
> index 556c128..3913ecf 100644
> --- a/recipes-bsp/transport-rtos/timesync-rtos_git.bb
> +++ b/recipes-bsp/transport-rtos/timesync-rtos_git.bb
> @@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://timeSync_ver.h;beginline=23;endline=45;md5=4bd873035e
>  
>  COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|k2g"
>  
> -DEPENDS_append = " ti-ndk \
> +DEPENDS:append = " ti-ndk \
>                     osal-rtos \
>                     pruss-lld-rtos \
>                     icss-emac-lld-rtos \
> @@ -28,4 +28,4 @@ export DEST_ROOT="${S}"
>  export NDK_INSTALL_PATH = "${NDK_INSTALL_DIR}"
>  export EDMA3LLD_BIOS6_INSTALLDIR = "${EDMA3_LLD_INSTALL_DIR}"
>  
> -XDCPATH_append = ";${NDK_INSTALL_DIR}/packages"
> +XDCPATH:append = ";${NDK_INSTALL_DIR}/packages"
> diff --git a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
> index f075cac..d02562c 100644
> --- a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
> +++ b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
> @@ -8,7 +8,7 @@ TFA_BUILD_TARGET_k3 = "all"
>  TFA_INSTALL_TARGET_k3 = "bl31"
>  TFA_SPD_k3 = "opteed"
>  
> -do_compile_append_am65xx-hs-evm() {
> +do_compile:append_am65xx-hs-evm() {
>  	export TI_SECURE_DEV_PKG=${TI_SECURE_DEV_PKG}
>  	( cd ${BUILD_DIR}; \
>  		mv bl31.bin bl31.bin.unsigned; \
> @@ -16,7 +16,7 @@ do_compile_append_am65xx-hs-evm() {
>  	)
>  }
>  
> -do_compile_append_j7-hs-evm() {
> +do_compile:append_j7-hs-evm() {
>  	export TI_SECURE_DEV_PKG=${TI_SECURE_DEV_PKG}
>  	( cd ${BUILD_DIR}; \
>  		mv bl31.bin bl31.bin.unsigned; \
> diff --git a/recipes-bsp/u-boot/u-boot-ti.inc b/recipes-bsp/u-boot/u-boot-ti.inc
> index dc8d6b0..8c8575d 100644
> --- a/recipes-bsp/u-boot/u-boot-ti.inc
> +++ b/recipes-bsp/u-boot/u-boot-ti.inc
> @@ -16,7 +16,7 @@ SPL_BINARY ?= "MLO"
>  require ${COREBASE}/meta/recipes-bsp/u-boot/u-boot-common.inc
>  require ${COREBASE}/meta/recipes-bsp/u-boot/u-boot.inc
>  
> -FILESEXTRAPATHS_prepend := "${THISDIR}/u-boot:"
> +FILESEXTRAPATHS:prepend := "${THISDIR}/u-boot:"
>  
>  SUMMARY = "u-boot bootloader for TI devices"
>  
> @@ -28,7 +28,7 @@ UBOOT_GIT_URI = "git://git.ti.com/ti-u-boot/ti-u-boot.git"
>  UBOOT_GIT_PROTOCOL = "git"
>  SRC_URI = "${UBOOT_GIT_URI};protocol=${UBOOT_GIT_PROTOCOL};branch=${BRANCH}"
>  
> -PV_append = "+git${SRCPV}"
> +PV:append = "+git${SRCPV}"
>  
>  # u-boot needs devtree compiler to parse dts files
>  DEPENDS += "dtc-native bc-native lzop-native flex-native bison-native"
> @@ -39,17 +39,17 @@ PACKAGECONFIG[atf] = "ATF=${STAGING_DIR_HOST}/firmware/bl31.bin,,trusted-firmwar
>  PACKAGECONFIG[optee] = "TEE=${STAGING_DIR_HOST}${nonarch_base_libdir}/firmware/bl32.bin,,optee-os"
>  PACKAGECONFIG[dm] = "DM=${STAGING_DIR_HOST}${nonarch_base_libdir}/firmware/pdk-ipc/${DM_FIRMWARE},,ti-rtos-firmware"
>  
> -PACKAGECONFIG_append_aarch64 = " atf optee"
> -PACKAGECONFIG_append_j7 = " dm"
> +PACKAGECONFIG:append:aarch64 = " atf optee"
> +PACKAGECONFIG:append_j7 = " dm"
>  
>  COMPATIBLE_MACHINE = "(ti-soc)"
>  
>  EXTRA_OEMAKE += "${PACKAGECONFIG_CONFARGS}"
>  
>  PROVIDES += "u-boot"
> -PKG_${PN} = "u-boot"
> -PKG_${PN}-dev = "u-boot-dev"
> -PKG_${PN}-dbg = "u-boot-dbg"
> +PKG:${PN} = "u-boot"
> +PKG:${PN}-dev = "u-boot-dev"
> +PKG:${PN}-dbg = "u-boot-dbg"
>  
>  S = "${WORKDIR}/git"
>  
> @@ -115,7 +115,7 @@ UBOOT_HS_2ND_BINARY = "u-boot-spl_HS_2ND"
>  UBOOT_HS_2ND_IMAGE = "u-boot-spl_HS_2ND-${MACHINE}-${PV}-${PR}"
>  UBOOT_HS_2ND_SYMLINK = "u-boot-spl_HS_2ND-${MACHINE}"
>  
> -do_install_append () {
> +do_install:append () {
>  	if [ -n "${UBOOT_CONFIG}" ]
>  	then
>  		for config in ${UBOOT_MACHINE}; do
> @@ -178,7 +178,7 @@ do_install_append () {
>  	fi
>  }
>  
> -do_deploy_append () {
> +do_deploy:append () {
>  	if [ -n "${UBOOT_CONFIG}" ]
>  	then
>  		for config in ${UBOOT_MACHINE}; do
> @@ -275,7 +275,7 @@ do_deploy_append () {
>  	rm ${DEPLOYDIR}/${PN}-initial-env-${MACHINE}-${PV}-${PR} || true
>  }
>  
> -do_install_append_keystone () {
> +do_install:append_keystone () {
>  	if [ -n "${UBOOT_CONFIG}" ]
>  	then
>  		for config in ${UBOOT_MACHINE}; do
> @@ -324,7 +324,7 @@ do_install_append_keystone () {
>  	fi
>  }
>  
> -do_deploy_append_keystone () {
> +do_deploy:append_keystone () {
>  	if [ -n "${UBOOT_CONFIG}" ]
>  	then
>  		for config in ${UBOOT_MACHINE}; do
> @@ -391,12 +391,12 @@ do_deploy_append_keystone () {
>  # j7200 uses combined image for tiboot3.bin that includes u-boot-spl.bin and sysfw
>  # along with board PM/RM configs generated by k3-image-gen and comes from ti-sci-fw
>  # hence move the legacy u-boot's tiboot3.bin and u-boot-spl.bin out of the way
> -do_deploy_append_j7200-evm-k3r5 () {
> +do_deploy:append_j7200-evm-k3r5 () {
>  	mv ${DEPLOYDIR}/tiboot3.bin ${DEPLOYDIR}/tiboot3-r5spl.bin || true
>  	mv ${DEPLOYDIR}/u-boot-spl.bin ${DEPLOYDIR}/u-boot-spl-r5spl.bin || true
>  }
>  
> -do_deploy_append_am64xx-evm-k3r5 () {
> +do_deploy:append_am64xx-evm-k3r5 () {
>  	mv ${DEPLOYDIR}/tiboot3.bin ${DEPLOYDIR}/tiboot3-r5spl.bin || true
>  	mv ${DEPLOYDIR}/u-boot-spl.bin ${DEPLOYDIR}/u-boot-spl-r5spl.bin || true
>  }
> diff --git a/recipes-bsp/uart-lld/uart-lld-rtos_git.bb b/recipes-bsp/uart-lld/uart-lld-rtos_git.bb
> index f293fdd..b81eecb 100644
> --- a/recipes-bsp/uart-lld/uart-lld-rtos_git.bb
> +++ b/recipes-bsp/uart-lld/uart-lld-rtos_git.bb
> @@ -15,16 +15,16 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
>  PR = "r0"
>  
> -DEPENDS_append = " edma3-lld-rtos \
> +DEPENDS:append = " edma3-lld-rtos \
>                     osal-rtos \
>  "
> -DEPENDS_append_ti33x = " starterware-rtos \
> +DEPENDS:append_ti33x = " starterware-rtos \
>                           pruss-lld-rtos \
>  "
> -DEPENDS_append_ti43x = " starterware-rtos"
> +DEPENDS:append_ti43x = " starterware-rtos"
>  
> -DEPENDS_remove_k3 = "edma3-lld-rtos "
> -DEPENDS_append_k3 = " udma-lld-rtos "
> +DEPENDS:remove_k3 = "edma3-lld-rtos "
> +DEPENDS:append_k3 = " udma-lld-rtos "
>  
>  # Build with make instead of XDC
>  TI_PDK_XDCMAKE = "0"
> @@ -33,9 +33,9 @@ export PDK_UART_ROOT_PATH ="${WORKDIR}/build"
>  export DEST_ROOT="${S}"
>  
>  export EDMA3LLD_BIOS6_INSTALLDIR = "${EDMA3_LLD_INSTALL_DIR}"
> -XDCPATH_append = ";${EDMA3_LLD_INSTALL_DIR}/packages"
> +XDCPATH:append = ";${EDMA3_LLD_INSTALL_DIR}/packages"
>  
>  # HTML doc link params
>  PDK_COMP_LINK_TEXT = "UART LLD"
>  
> -INSANE_SKIP_${PN} = "arch"
> +INSANE_SKIP:${PN} = "arch"
> diff --git a/recipes-bsp/udma-lld/udma-lld-rtos_git.bb b/recipes-bsp/udma-lld/udma-lld-rtos_git.bb
> index a82eb36..a65876b 100644
> --- a/recipes-bsp/udma-lld/udma-lld-rtos_git.bb
> +++ b/recipes-bsp/udma-lld/udma-lld-rtos_git.bb
> @@ -15,7 +15,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
>  PR = "r1"
>  
> -DEPENDS_append = " osal-rtos \
> +DEPENDS:append = " osal-rtos \
>                     sciclient-rtos \
>  "
>  
> @@ -60,6 +60,6 @@ do_install() {
>      find -name "*.tar" -exec tar xf {} --no-same-owner -C ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/drv/udma \;
>  }
>  
> -FILES_${PN} += "${PDK_INSTALL_DIR_RECIPE}/packages"
> +FILES:${PN} += "${PDK_INSTALL_DIR_RECIPE}/packages"
>  
> -INSANE_SKIP_${PN} = "arch ldflags"
> +INSANE_SKIP:${PN} = "arch ldflags"
> diff --git a/recipes-bsp/uio-module-drv/uio-module-drv-test_git.bb b/recipes-bsp/uio-module-drv/uio-module-drv-test_git.bb
> index 3a4fb1b..3c94f69 100644
> --- a/recipes-bsp/uio-module-drv/uio-module-drv-test_git.bb
> +++ b/recipes-bsp/uio-module-drv/uio-module-drv-test_git.bb
> @@ -12,7 +12,7 @@ DEVICE_NAME_ti33x = "am33xx"
>  DEVICE_NAME_ti43x = "am43xx"
>  DEVICE_NAME_keystone = "keystone"
>  DEVICE_NAME_k2g = "k2g"
> -RDEPENDS_${PN} = "uio-module-drv"
> +RDEPENDS:${PN} = "uio-module-drv"
>  
>  do_compile() {
>  	oe_runmake -C ${S} test "DEVICE=${DEVICE_NAME}"
> @@ -24,22 +24,22 @@ do_install() {
>  	install -c -m 755 ${S}/test/uio_int_test ${D}${bindir}/.
>  }
>  
> -do_install_append_keystone () {
> +do_install:append_keystone () {
>  	install -c -m 755 ${S}/test/uio_cic2_int_multithread_test ${D}${bindir}/.
>  }
>  
> -do_install_append_k2g () {
> +do_install:append_k2g () {
>          install -c -m 755 ${S}/test/prussdrv_test/test/pruss_uio_test ${D}${bindir}/.
>  }
>  
> -do_install_append_omap-a15 () {
> +do_install:append_omap-a15 () {
>  	install -c -m 755 ${S}/test/prussdrv_test/test/pruss_uio_test ${D}${bindir}/.
>  }
>  
> -do_install_append_ti33x () {
> +do_install:append_ti33x () {
>          install -c -m 755 ${S}/test/prussdrv_test/test/pruss_uio_test ${D}${bindir}/.
>  }
>  
> -do_install_append_ti43x () {
> +do_install:append_ti43x () {
>          install -c -m 755 ${S}/test/prussdrv_test/test/pruss_uio_test ${D}${bindir}/.
>  }
> diff --git a/recipes-bsp/uio-module-drv/uio-module-drv_git.bb b/recipes-bsp/uio-module-drv/uio-module-drv_git.bb
> index cb61305..2bb1f0b 100644
> --- a/recipes-bsp/uio-module-drv/uio-module-drv_git.bb
> +++ b/recipes-bsp/uio-module-drv/uio-module-drv_git.bb
> @@ -2,19 +2,19 @@ DESCRIPTION = "User space IO (UIO) driver for on-chip modules"
>  
>  include uio-module-drv.inc
>  
> -FILESEXTRAPATHS_prepend:= "${THISDIR}/${PN}:"
> +FILESEXTRAPATHS:prepend:= "${THISDIR}/${PN}:"
>  
>  SRC_URI += "file://0001-uio-module-drv-Replace-ioremap_nocache-with-ioremap.patch"
>  
>  # This package builds a kernel module, use kernel PR as base and append a local
> -MACHINE_KERNEL_PR_append = "d"
> +MACHINE_KERNEL_PR:append = "d"
>  PR = "${MACHINE_KERNEL_PR}"
>  
>  module_auto_load_uio-module-drv = "uio-module-drv"
>  
>  inherit module
>  
> -do_install_append () {
> +do_install:append () {
>      install -d ${D}${includedir}
>      cp *.h ${D}${includedir}
>  }
> diff --git a/recipes-bsp/usb-lld/usb-lld-rtos_git.bb b/recipes-bsp/usb-lld/usb-lld-rtos_git.bb
> index 7aa0d1b..69f9138 100644
> --- a/recipes-bsp/usb-lld/usb-lld-rtos_git.bb
> +++ b/recipes-bsp/usb-lld/usb-lld-rtos_git.bb
> @@ -14,10 +14,10 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
>  PR = "r0"
>  
> -DEPENDS_append = " osal-rtos"
> -DEPENDS_append_ti33x = " starterware-rtos"
> -DEPENDS_append_ti43x = " starterware-rtos"
> -DEPENDS_append_k3 = " sciclient-rtos"
> +DEPENDS:append = " osal-rtos"
> +DEPENDS:append_ti33x = " starterware-rtos"
> +DEPENDS:append_ti43x = " starterware-rtos"
> +DEPENDS:append_k3 = " sciclient-rtos"
>  
>  # Build with make instead of XDC
>  TI_PDK_XDCMAKE = "0"
> diff --git a/recipes-bsp/vis-fw/vis_01.50.07.15.bb b/recipes-bsp/vis-fw/vis_01.50.07.15.bb
> index 3cd5648..498be36 100644
> --- a/recipes-bsp/vis-fw/vis_01.50.07.15.bb
> +++ b/recipes-bsp/vis-fw/vis_01.50.07.15.bb
> @@ -25,12 +25,12 @@ do_install() {
>  }
>  
>  PACKAGES += "${PN}-fw"
> -RDEPENDS_${PN} += "${PN}-fw"
> +RDEPENDS:${PN} += "${PN}-fw"
>  
> -FILES_${PN}-fw += "${base_libdir}/firmware/${DSPAPP}"
> +FILES:${PN}-fw += "${base_libdir}/firmware/${DSPAPP}"
>  
> -INSANE_SKIP_${PN} = "ldflags"
> -INSANE_SKIP_${PN}-fw = "arch"
> +INSANE_SKIP:${PN} = "ldflags"
> +INSANE_SKIP:${PN}-fw = "arch"
>  INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
>  INHIBIT_PACKAGE_STRIP = "1"
>  INHIBIT_SYSROOT_STRIP = "1"
> diff --git a/recipes-bsp/vpdma-fw/vpdma-fw_03-2012.bb b/recipes-bsp/vpdma-fw/vpdma-fw_03-2012.bb
> index 4707f17..c7b2a7b 100644
> --- a/recipes-bsp/vpdma-fw/vpdma-fw_03-2012.bb
> +++ b/recipes-bsp/vpdma-fw/vpdma-fw_03-2012.bb
> @@ -20,6 +20,6 @@ do_install() {
>      cp ${S}/${TARGET} ${D}${base_libdir}/firmware/${TARGET}
>  }
>  
> -FILES_${PN} += "${base_libdir}/firmware/${TARGET}"
> +FILES:${PN} += "${base_libdir}/firmware/${TARGET}"
>  
>  PR = "r1"
> diff --git a/recipes-bsp/vps-lld/vps-lld-rtos_git.bb b/recipes-bsp/vps-lld/vps-lld-rtos_git.bb
> index e2834a6..7e0695a 100644
> --- a/recipes-bsp/vps-lld/vps-lld-rtos_git.bb
> +++ b/recipes-bsp/vps-lld/vps-lld-rtos_git.bb
> @@ -26,7 +26,7 @@ PR = "r0"
>  S = "${WORKDIR}/${VPS_LLD_GIT_DESTSUFFIX}"
>  
>  # Add to DEPENDS set in ti-pdk.bbclass
> -DEPENDS_append = " \
> +DEPENDS:append = " \
>              ti-sysbios \
>              osal-rtos \
>              edma3-lld-rtos \
> @@ -44,7 +44,7 @@ TI_PDK_XDCMAKE = "0"
>  # The makefile will push these on the XDCPATH
>  export EDMA3LLD_BIOS6_INSTALLDIR = "${EDMA3_LLD_INSTALL_DIR}"
>  
> -do_compile_append() {
> +do_compile:append() {
>      # Delete archive created by XDC release command since it does not contain all content
>      find -name "*.tar" -exec rm -f {} \;
>  
> @@ -53,4 +53,4 @@ do_compile_append() {
>      tar -cf pm_lld.tar --exclude='*.tar' ./*
>  }
>  
> -INSANE_SKIP_${PN} = "arch ldflags"
> +INSANE_SKIP:${PN} = "arch ldflags"
> diff --git a/recipes-bsp/wl18xx-fw/wl18xx-fw_8.9.0.0.86.bb b/recipes-bsp/wl18xx-fw/wl18xx-fw_8.9.0.0.86.bb
> index 50b6c29..48b500a 100644
> --- a/recipes-bsp/wl18xx-fw/wl18xx-fw_8.9.0.0.86.bb
> +++ b/recipes-bsp/wl18xx-fw/wl18xx-fw_8.9.0.0.86.bb
> @@ -22,4 +22,4 @@ do_install() {
>      oe_runmake 'DEST_DIR=${D}' install
>  }
>  
> -FILES_${PN} = "/lib/firmware/ti-connectivity/*"
> +FILES:${PN} = "/lib/firmware/ti-connectivity/*"
> diff --git a/recipes-bsp/x-load/x-load.inc b/recipes-bsp/x-load/x-load.inc
> index 7a9638b..bb700e4 100644
> --- a/recipes-bsp/x-load/x-load.inc
> +++ b/recipes-bsp/x-load/x-load.inc
> @@ -34,7 +34,7 @@ do_install () {
>  	ln -sf ${MLO_IMAGE} ${D}/boot/${MLO_SYMLINK_NOMACHINE} 
>  }
>  
> -FILES_${PN} = "/boot"
> +FILES:${PN} = "/boot"
>  
>  inherit deploy
>  
> diff --git a/recipes-bsp/x-load/x-load_1.46-psp.bb b/recipes-bsp/x-load/x-load_1.46-psp.bb
> index 108e408..cc9ad3f 100644
> --- a/recipes-bsp/x-load/x-load_1.46-psp.bb
> +++ b/recipes-bsp/x-load/x-load_1.46-psp.bb
> @@ -11,7 +11,7 @@ PR ="r0"
>  PE = "1"
>  
>  # TI PSP v1.46_OMAPPSP_03.00.01.06 (Tag is one commit different)
> -SRCREV_pn-${PN} = "fc6d5be15c703d21aef0ae0b8c02177721f0445f"
> +SRCREV:pn-${PN} = "fc6d5be15c703d21aef0ae0b8c02177721f0445f"
>  SRC_URI = "git://arago-project.org/git/projects/x-load-omap3.git;protocol=git"
>  
>  S = "${WORKDIR}/git"
> @@ -33,6 +33,6 @@ do_install () {
>  	ln -sf ${MLO_IMAGE} ${D}/boot/${MLO_SYMLINK_NOMACHINE}
>  }
>  
> -FILES_${PN} = "/boot"
> +FILES:${PN} = "/boot"
>  
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
> diff --git a/recipes-bsp/x-load/x-load_git.bb b/recipes-bsp/x-load/x-load_git.bb
> index 1ce1b0f..ee35beb 100644
> --- a/recipes-bsp/x-load/x-load_git.bb
> +++ b/recipes-bsp/x-load/x-load_git.bb
> @@ -6,7 +6,7 @@ PV = "1.5.1"
>  PR ="r3"
>  PE = "1"
>  
> -SRCREV_pn-${PN} = "c4289f1bee035dea41536c5ba5e1bc36c7d493c4"
> +SRCREV:pn-${PN} = "c4289f1bee035dea41536c5ba5e1bc36c7d493c4"
>  SRC_URI = "git://gitorious.org/x-loader/x-loader.git;branch=master;protocol=git \
>  "
>  
> diff --git a/recipes-connectivity/wl18xx-calibrator/wl18xx-calibrator_8.7.3.bb b/recipes-connectivity/wl18xx-calibrator/wl18xx-calibrator_8.7.3.bb
> index f9a4448..2888b95 100644
> --- a/recipes-connectivity/wl18xx-calibrator/wl18xx-calibrator_8.7.3.bb
> +++ b/recipes-connectivity/wl18xx-calibrator/wl18xx-calibrator_8.7.3.bb
> @@ -3,7 +3,7 @@ LICENSE = "BSD"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=4725015cb0be7be389cf06deeae3683d"
>  
>  DEPENDS = "libnl"
> -RDEPENDS_${PN} = "wl18xx-fw"
> +RDEPENDS:${PN} = "wl18xx-fw"
>  
>  #Tag: R8.7_SP3 (8.7.3)
>  SRCREV = "5048b59a444ac59ba7171d6e122d5a84581aebf2"
> diff --git a/recipes-connectivity/wl18xx-target-scripts/wl18xx-target-scripts_8.7.3.bb b/recipes-connectivity/wl18xx-target-scripts/wl18xx-target-scripts_8.7.3.bb
> index 6c4b2b4..2a44fa8 100644
> --- a/recipes-connectivity/wl18xx-target-scripts/wl18xx-target-scripts_8.7.3.bb
> +++ b/recipes-connectivity/wl18xx-target-scripts/wl18xx-target-scripts_8.7.3.bb
> @@ -13,7 +13,7 @@ PR = "r1"
>  
>  S = "${WORKDIR}/git"
>  
> -FILES_${PN} += "${datadir}/wl18xx/"
> +FILES:${PN} += "${datadir}/wl18xx/"
>  
>  do_install() {
>  	install -d ${D}${datadir}/wl18xx/
> diff --git a/recipes-connectivity/wlconf/wlconf_8.7.3.bb b/recipes-connectivity/wlconf/wlconf_8.7.3.bb
> index 19f28b7..475bac2 100644
> --- a/recipes-connectivity/wlconf/wlconf_8.7.3.bb
> +++ b/recipes-connectivity/wlconf/wlconf_8.7.3.bb
> @@ -30,10 +30,10 @@ do_install() {
>  			${D}${sbindir}/wlconf/official_inis/
>  }
>  
> -FILES_${PN} += " \
> +FILES:${PN} += " \
>  	${sbindir}/wlconf \
>  	${sbindir}/wlconf/official_inis \
>  	/lib/firmware/ti-connectivity/wl18xx-conf.bin \
>  "
>  
> -FILES_${PN}-dbg += "${sbindir}/wlconf/.debug"
> +FILES:${PN}-dbg += "${sbindir}/wlconf/.debug"
> diff --git a/recipes-core/init-ifupdown/init-ifupdown_1.0.bbappend b/recipes-core/init-ifupdown/init-ifupdown_1.0.bbappend
> index 5622303..461ffeb 100644
> --- a/recipes-core/init-ifupdown/init-ifupdown_1.0.bbappend
> +++ b/recipes-core/init-ifupdown/init-ifupdown_1.0.bbappend
> @@ -1 +1 @@
> -FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-${PV}:"
> +FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}-${PV}:"
> diff --git a/recipes-core/udev/eudev_%.bbappend b/recipes-core/udev/eudev_%.bbappend
> index 7c04fd2..15f95ef 100644
> --- a/recipes-core/udev/eudev_%.bbappend
> +++ b/recipes-core/udev/eudev_%.bbappend
> @@ -1,13 +1,13 @@
> -FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
> +FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
>  
> -SRC_URI_append_ti-soc = " \
> +SRC_URI:append_ti-soc = " \
>      file://omap-tty.rules \
>      file://firmware.rules \
>  "
>  
> -PR_append_ti-soc = ".3"
> +PR:append_ti-soc = ".3"
>  
> -do_install_append_ti-soc() {
> +do_install:append_ti-soc() {
>      install -m 0644 ${WORKDIR}/omap-tty.rules ${D}${sysconfdir}/udev/rules.d/
>      install -m 0644 ${WORKDIR}/firmware.rules ${D}${sysconfdir}/udev/rules.d/
>  }
> diff --git a/recipes-devtools/gdbc6x/gdbc6x_git.bb b/recipes-devtools/gdbc6x/gdbc6x_git.bb
> index aa519a9..08f8197 100644
> --- a/recipes-devtools/gdbc6x/gdbc6x_git.bb
> +++ b/recipes-devtools/gdbc6x/gdbc6x_git.bb
> @@ -9,7 +9,7 @@ COMPATIBLE_MACHINE = "dra7xx|keystone"
>  
>  PR = "${INC_PR}.1"
>  
> -SRC_URI_append = " \
> +SRC_URI:append = " \
>      file://init \
>      file://0001-libbfd.h-suppress-GCC9-Wstringop-truncation.patch;striplevel=2 \
>  "
> @@ -39,7 +39,7 @@ do_install () {
>      install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/gdbserverproxy
>  }
>  
> -RDEPENDS_${PN} = "gdbserverproxy-module-drv bash"
> +RDEPENDS:${PN} = "gdbserverproxy-module-drv bash"
>  
>  include gdbc6x.inc
>  
> diff --git a/recipes-devtools/gdbc6x/gdbserver-c6x_git.bb b/recipes-devtools/gdbc6x/gdbserver-c6x_git.bb
> index 79b584b..4dbce01 100644
> --- a/recipes-devtools/gdbc6x/gdbserver-c6x_git.bb
> +++ b/recipes-devtools/gdbc6x/gdbserver-c6x_git.bb
> @@ -37,7 +37,7 @@ do_install() {
>  COMPATIBLE_MACHINE = "dra7xx|keystone"
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
> -FILES_${PN}-dev += "\
> +FILES:${PN}-dev += "\
>      ${datadir}/ti/gdbc6x \
>  "
>  
> @@ -45,6 +45,6 @@ include gdbc6x.inc
>  
>  require recipes-ti/includes/ti-paths.inc
>  
> -ALLOW_EMPTY_${PN} = "1"
> +ALLOW_EMPTY:${PN} = "1"
>  
>  PARALLEL_MAKE = ""
> diff --git a/recipes-devtools/gdbc6x/gdbserverproxy-module-drv_git.bb b/recipes-devtools/gdbc6x/gdbserverproxy-module-drv_git.bb
> index 77a29ec..bd3e33f 100644
> --- a/recipes-devtools/gdbc6x/gdbserverproxy-module-drv_git.bb
> +++ b/recipes-devtools/gdbc6x/gdbserverproxy-module-drv_git.bb
> @@ -3,9 +3,9 @@ LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM = "file://COPYING.txt;md5=75859989545e37968a99b631ef42722e"
>  
>  # This package builds a kernel module, use kernel PR as base and append a local
> -MACHINE_KERNEL_PR_append = "b"
> +MACHINE_KERNEL_PR:append = "b"
>  PR = "${MACHINE_KERNEL_PR}"
> -PV_append = "+git${SRCPV}"
> +PV:append = "+git${SRCPV}"
>  
>  S = "${WORKDIR}/git/kernel_module/gdbproxy-mod"
>  
> diff --git a/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb b/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb
> index 5575868..ab72c10 100644
> --- a/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb
> +++ b/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb
> @@ -16,7 +16,7 @@ BRANCH = "ti-${PV}"
>  SRC_URI = "git://git.ti.com/graphics/ti-gc320-libs.git;protocol=git;branch=${BRANCH}"
>  SRCREV = "c0afab259de59909cfe74c01f3f7fbaa147f94b5"
>  
> -RRECOMMENDS_${PN} = "ti-gc320-driver"
> +RRECOMMENDS:${PN} = "ti-gc320-driver"
>  
>  # There's only hardfp version available
>  python __anonymous() {
> @@ -43,4 +43,4 @@ do_install() {
>      chown -R root:root ${D}
>  }
>  
> -INSANE_SKIP_${PN} += "ldflags"
> +INSANE_SKIP:${PN} += "ldflags"
> diff --git a/recipes-graphics/libgles/ti-img-rogue-umlibs_1.13.5776728.bb b/recipes-graphics/libgles/ti-img-rogue-umlibs_1.13.5776728.bb
> index 5194015..1ff4b65 100644
> --- a/recipes-graphics/libgles/ti-img-rogue-umlibs_1.13.5776728.bb
> +++ b/recipes-graphics/libgles/ti-img-rogue-umlibs_1.13.5776728.bb
> @@ -30,22 +30,22 @@ inherit update-rc.d
>  PROVIDES += "virtual/egl virtual/libgles1 virtual/libgles2 virtual/libgbm"
>  
>  DEPENDS += "libdrm wayland expat"
> -RDEPENDS_${PN} += "bash"
> -RDEPENDS_${PN} += "wayland expat"
> +RDEPENDS:${PN} += "bash"
> +RDEPENDS:${PN} += "wayland expat"
>  
> -RPROVIDES_${PN} = "libegl libgles1 libgles2 libgbm"
> -RPROVIDES_${PN}-dev = "libegl-dev libgles1-dev libgles2-dev libgbm-dev"
> -RPROVIDES_${PN}-dbg = "libegl-dbg libgles1-dbg libgles2-dbg"
> +RPROVIDES:${PN} = "libegl libgles1 libgles2 libgbm"
> +RPROVIDES:${PN}-dev = "libegl-dev libgles1-dev libgles2-dev libgbm-dev"
> +RPROVIDES:${PN}-dbg = "libegl-dbg libgles1-dbg libgles2-dbg"
>  
> -RREPLACES_${PN} = "libegl libgles1 liblges2 libgbm"
> -RREPLACES_${PN}-dev = "libegl-dev libgles1-dev libgles2-dev libgbm-dev"
> -RREPLACES_${PN}-dbg = "libegl-dbg libgles1-dbg libgles2-dbg"
> +RREPLACES:${PN} = "libegl libgles1 liblges2 libgbm"
> +RREPLACES:${PN}-dev = "libegl-dev libgles1-dev libgles2-dev libgbm-dev"
> +RREPLACES:${PN}-dbg = "libegl-dbg libgles1-dbg libgles2-dbg"
>  
> -RCONFLICTS_${PN} = "libegl libgles1 libgles2 libgbm"
> -RCONFLICTS_${PN}-dev = "libegl-dev libgles1-dev libgles2-dev libgbm-dev"
> -RCONFLICTS_${PN}-dbg = "libegl-dbg libgles1-dbg libgles2-dbg"
> +RCONFLICTS:${PN} = "libegl libgles1 libgles2 libgbm"
> +RCONFLICTS:${PN}-dev = "libegl-dev libgles1-dev libgles2-dev libgbm-dev"
> +RCONFLICTS:${PN}-dbg = "libegl-dbg libgles1-dbg libgles2-dbg"
>  
> -RRECOMMENDS_${PN} += "ti-img-rogue-driver"
> +RRECOMMENDS:${PN} += "ti-img-rogue-driver"
>  
>  S = "${WORKDIR}/git"
>  
> @@ -54,16 +54,16 @@ do_install () {
>      chown -R root:root ${D}
>  }
>  
> -FILES_${PN} += " ${base_libdir}/firmware/"
> -FILES_${PN} += " ${datadir}/"
> +FILES:${PN} += " ${base_libdir}/firmware/"
> +FILES:${PN} += " ${datadir}/"
>  
>  PACKAGES =+ "${PN}-plugins"
> -FILES_${PN}-plugins = "${libdir}/libGLESv2.so ${libdir}/libGLESv1_CM.so ${libdir}/libEGL.so ${libdir}/dri/pvr_dri.so"
> -RDEPENDS_${PN} += "${PN}-plugins"
> +FILES:${PN}-plugins = "${libdir}/libGLESv2.so ${libdir}/libGLESv1_CM.so ${libdir}/libEGL.so ${libdir}/dri/pvr_dri.so"
> +RDEPENDS:${PN} += "${PN}-plugins"
>  
> -ALLOW_EMPTY_${PN}-plugins = "1"
> +ALLOW_EMPTY:${PN}-plugins = "1"
>  
> -INSANE_SKIP_${PN} += "ldflags arch already-stripped"
> -INSANE_SKIP_${PN}-plugins = "dev-so"
> +INSANE_SKIP:${PN} += "ldflags arch already-stripped"
> +INSANE_SKIP:${PN}-plugins = "dev-so"
>  
>  CLEANBROKEN = "1"
> diff --git a/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb b/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
> index 627d128..4cbdd07 100644
> --- a/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
> +++ b/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
> @@ -32,24 +32,24 @@ inherit update-rc.d
>  PROVIDES += "virtual/egl virtual/libgles1 virtual/libgles2 virtual/libgbm"
>  
>  DEPENDS += "libdrm udev wayland wayland-protocols libffi expat"
> -RDEPENDS_${PN} += "libdrm libdrm-omap udev wayland wayland-protocols libffi expat"
> +RDEPENDS:${PN} += "libdrm libdrm-omap udev wayland wayland-protocols libffi expat"
>  
> -RPROVIDES_${PN} = "libegl libgles1 libgles2 libgbm"
> -RPROVIDES_${PN}-dev = "libegl-dev libgles1-dev libgles2-dev libgbm-dev"
> -RPROVIDES_${PN}-dbg = "libegl-dbg libgles1-dbg libgles2-dbg libgbm-dbg"
> +RPROVIDES:${PN} = "libegl libgles1 libgles2 libgbm"
> +RPROVIDES:${PN}-dev = "libegl-dev libgles1-dev libgles2-dev libgbm-dev"
> +RPROVIDES:${PN}-dbg = "libegl-dbg libgles1-dbg libgles2-dbg libgbm-dbg"
>  
> -RREPLACES_${PN} = "libegl libgles1 libgles2 libgbm"
> -RREPLACES_${PN}-dev = "libegl-dev libgles1-dev libgles2-dev libgbm-dev"
> -RREPLACES_${PN}-dbg = "libegl-dbg libgles1-dbg libgles2-dbg libgbm-dbg"
> +RREPLACES:${PN} = "libegl libgles1 libgles2 libgbm"
> +RREPLACES:${PN}-dev = "libegl-dev libgles1-dev libgles2-dev libgbm-dev"
> +RREPLACES:${PN}-dbg = "libegl-dbg libgles1-dbg libgles2-dbg libgbm-dbg"
>  
> -RCONFLICTS_${PN} = "libegl libgles1 libgles2 libgbm"
> -RCONFLICTS_${PN}-dev = "libegl-dev libgles1-dev libgles2-dev libgbm-dev"
> -RCONFLICTS_${PN}-dbg = "libegl-dbg libgles1-dbg libgles2-dbg libgbm-dbg"
> +RCONFLICTS:${PN} = "libegl libgles1 libgles2 libgbm"
> +RCONFLICTS:${PN}-dev = "libegl-dev libgles1-dev libgles2-dev libgbm-dev"
> +RCONFLICTS:${PN}-dbg = "libegl-dbg libgles1-dbg libgles2-dbg libgbm-dbg"
>  
>  # The actual SONAME is libGLESv2.so.2, so need to explicitly specify RPROVIDES for .so.1 here
> -RPROVIDES_${PN} += "libGLESv2.so.1"
> +RPROVIDES:${PN} += "libGLESv2.so.1"
>  
> -RRECOMMENDS_${PN} += "ti-sgx-ddk-km"
> +RRECOMMENDS:${PN} += "ti-sgx-ddk-km"
>  
>  S = "${WORKDIR}/git"
>  
> @@ -60,12 +60,12 @@ do_install () {
>      chown -R root:root ${D}
>  }
>  
> -FILES_${PN} =  "${bindir}/*"
> -FILES_${PN} += " ${libdir}/*"
> -FILES_${PN} +=  "${includedir}/*"
> -FILES_${PN} +=  "${sysconfdir}/*"
> +FILES:${PN} =  "${bindir}/*"
> +FILES:${PN} += " ${libdir}/*"
> +FILES:${PN} +=  "${includedir}/*"
> +FILES:${PN} +=  "${sysconfdir}/*"
>  
> -INSANE_SKIP_${PN} += "dev-so ldflags useless-rpaths"
> -INSANE_SKIP_${PN} += "already-stripped dev-deps"
> +INSANE_SKIP:${PN} += "dev-so ldflags useless-rpaths"
> +INSANE_SKIP:${PN} += "already-stripped dev-deps"
>  
>  CLEANBROKEN = "1"
> diff --git a/recipes-kernel/kselftests/kselftests_4.10.bb b/recipes-kernel/kselftests/kselftests_4.10.bb
> index f478e56..5cd72f9 100644
> --- a/recipes-kernel/kselftests/kselftests_4.10.bb
> +++ b/recipes-kernel/kselftests/kselftests_4.10.bb
> @@ -80,42 +80,42 @@ PACKAGE_BEFORE_PN = " \
>  	${PN}-zram \
>  "
>  
> -FILES_${PN}-bpf = "${bindir}/kselftests/bpf"
> -FILES_${PN}-breakpoints = "${bindir}/kselftests/breakpoints"
> -FILES_${PN}-capabilities = "${bindir}/kselftests/capabilities"
> -FILES_${PN}-cpu-hotplug = "${bindir}/kselftests/cpu-hotplug"
> -FILES_${PN}-efivarfs = "${bindir}/kselftests/efivarfs"
> -FILES_${PN}-exec = "${bindir}/kselftests/exec"
> -FILES_${PN}-firmware = "${bindir}/kselftests/firmware"
> -FILES_${PN}-ftrace = "${bindir}/kselftests/ftrace"
> -FILES_${PN}-futex = "${bindir}/kselftests/futex"
> -FILES_${PN}-gpio = "${bindir}/kselftests/gpio"
> -FILES_${PN}-ipc = "${bindir}/kselftests/ipc"
> -FILES_${PN}-kcmp = "${bindir}/kselftests/kcmp"
> -FILES_${PN}-lib = "${bindir}/kselftests/lib"
> -FILES_${PN}-membarrier = "${bindir}/kselftests/membarrier"
> -FILES_${PN}-memfd = "${bindir}/kselftests/memfd"
> -FILES_${PN}-memory-hotplug = "${bindir}/kselftests/memory-hotplug"
> -FILES_${PN}-mount = "${bindir}/kselftests/mount"
> -FILES_${PN}-mqueue = "${bindir}/kselftests/mqueue"
> -FILES_${PN}-net = "${bindir}/kselftests/net"
> -FILES_${PN}-nsfs = "${bindir}/kselftests/nsfs"
> -FILES_${PN}-powerpc = "${bindir}/kselftests/powerpc"
> -FILES_${PN}-pstore = "${bindir}/kselftests/pstore"
> -FILES_${PN}-ptp = "${bindir}/kselftests/ptp"
> -FILES_${PN}-ptrace = "${bindir}/kselftests/ptrace"
> -FILES_${PN}-seccomp = "${bindir}/kselftests/seccomp"
> -FILES_${PN}-sigaltstack = "${bindir}/kselftests/sigaltstack"
> -FILES_${PN}-size = "${bindir}/kselftests/size"
> -FILES_${PN}-static-keys = "${bindir}/kselftests/static_keys"
> -FILES_${PN}-sync = "${bindir}/kselftests/sync"
> -FILES_${PN}-sysctl = "${bindir}/kselftests/sysctl"
> -FILES_${PN}-timers = "${bindir}/kselftests/timers"
> -FILES_${PN}-user = "${bindir}/kselftests/user"
> -FILES_${PN}-vm = "${bindir}/kselftests/vm"
> -FILES_${PN}-x86 = "${bindir}/kselftests/x86"
> -FILES_${PN}-zram = "${bindir}/kselftests/zram"
> -FILES_${PN}-dbg += "${bindir}/kselftests/*/.debug"
> +FILES:${PN}-bpf = "${bindir}/kselftests/bpf"
> +FILES:${PN}-breakpoints = "${bindir}/kselftests/breakpoints"
> +FILES:${PN}-capabilities = "${bindir}/kselftests/capabilities"
> +FILES:${PN}-cpu-hotplug = "${bindir}/kselftests/cpu-hotplug"
> +FILES:${PN}-efivarfs = "${bindir}/kselftests/efivarfs"
> +FILES:${PN}-exec = "${bindir}/kselftests/exec"
> +FILES:${PN}-firmware = "${bindir}/kselftests/firmware"
> +FILES:${PN}-ftrace = "${bindir}/kselftests/ftrace"
> +FILES:${PN}-futex = "${bindir}/kselftests/futex"
> +FILES:${PN}-gpio = "${bindir}/kselftests/gpio"
> +FILES:${PN}-ipc = "${bindir}/kselftests/ipc"
> +FILES:${PN}-kcmp = "${bindir}/kselftests/kcmp"
> +FILES:${PN}-lib = "${bindir}/kselftests/lib"
> +FILES:${PN}-membarrier = "${bindir}/kselftests/membarrier"
> +FILES:${PN}-memfd = "${bindir}/kselftests/memfd"
> +FILES:${PN}-memory-hotplug = "${bindir}/kselftests/memory-hotplug"
> +FILES:${PN}-mount = "${bindir}/kselftests/mount"
> +FILES:${PN}-mqueue = "${bindir}/kselftests/mqueue"
> +FILES:${PN}-net = "${bindir}/kselftests/net"
> +FILES:${PN}-nsfs = "${bindir}/kselftests/nsfs"
> +FILES:${PN}-powerpc = "${bindir}/kselftests/powerpc"
> +FILES:${PN}-pstore = "${bindir}/kselftests/pstore"
> +FILES:${PN}-ptp = "${bindir}/kselftests/ptp"
> +FILES:${PN}-ptrace = "${bindir}/kselftests/ptrace"
> +FILES:${PN}-seccomp = "${bindir}/kselftests/seccomp"
> +FILES:${PN}-sigaltstack = "${bindir}/kselftests/sigaltstack"
> +FILES:${PN}-size = "${bindir}/kselftests/size"
> +FILES:${PN}-static-keys = "${bindir}/kselftests/static_keys"
> +FILES:${PN}-sync = "${bindir}/kselftests/sync"
> +FILES:${PN}-sysctl = "${bindir}/kselftests/sysctl"
> +FILES:${PN}-timers = "${bindir}/kselftests/timers"
> +FILES:${PN}-user = "${bindir}/kselftests/user"
> +FILES:${PN}-vm = "${bindir}/kselftests/vm"
> +FILES:${PN}-x86 = "${bindir}/kselftests/x86"
> +FILES:${PN}-zram = "${bindir}/kselftests/zram"
> +FILES:${PN}-dbg += "${bindir}/kselftests/*/.debug"
>  
>  # FIXME bpf target is failing to build and need to be fixed:
>  # In file included from test_verifier.c:23:0:
> @@ -123,24 +123,24 @@ FILES_${PN}-dbg += "${bindir}/kselftests/*/.debug"
>  #   struct pt_regs regs;
>  #                  ^~~~
>  # make[1]: *** [test_verifier] Error 1
> -ALLOW_EMPTY_${PN}-bpf = "1"
> +ALLOW_EMPTY:${PN}-bpf = "1"
>  
>  # gcc 7.x fails to build seccomp
> -ALLOW_EMPTY_${PN}-seccomp = "1"
> +ALLOW_EMPTY:${PN}-seccomp = "1"
>  
>  # FIXME net target builds most of the binaries, but reuseport_bpf_numa depends on libnuma,
>  # which is not availbale on ARM, failing entire test case
> -ALLOW_EMPTY_${PN}-net = "1"
> -
> -RDEPENDS_${PN}-cpu-hotplug += "bash"
> -RDEPENDS_${PN}-efivarfs += "bash"
> -RDEPENDS_${PN}-futex += "bash ncurses"
> -RDEPENDS_${PN}-gpio += "bash"
> -RDEPENDS_${PN}-memory-hotplug += "bash"
> -RDEPENDS_${PN}-net += "bash"
> -RDEPENDS_${PN}-vm += "bash sudo"
> -RDEPENDS_${PN}-zram += "bash bc"
> -RDEPENDS_${PN} += "bash \
> +ALLOW_EMPTY:${PN}-net = "1"
> +
> +RDEPENDS:${PN}-cpu-hotplug += "bash"
> +RDEPENDS:${PN}-efivarfs += "bash"
> +RDEPENDS:${PN}-futex += "bash ncurses"
> +RDEPENDS:${PN}-gpio += "bash"
> +RDEPENDS:${PN}-memory-hotplug += "bash"
> +RDEPENDS:${PN}-net += "bash"
> +RDEPENDS:${PN}-vm += "bash sudo"
> +RDEPENDS:${PN}-zram += "bash bc"
> +RDEPENDS:${PN} += "bash \
>  	${PN}-bpf \
>  	${PN}-capabilities \
>  	${PN}-cpu-hotplug \
> @@ -174,17 +174,17 @@ RDEPENDS_${PN} += "bash \
>  	${PN}-zram \
>  "
>  
> -RDEPENDS_${PN}_append_aarch64 = " ${PN}-breakpoints ${PN}-ipc"
> -RDEPENDS_${PN}_append_x86 = " ${PN}-breakpoints ${PN}-ipc ${PN}-x86"
> -RDEPENDS_${PN}_append_x86-64 = " ${PN}-breakpoints ${PN}-ipc ${PN}-x86"
> -RDEPENDS_${PN}_append_powerpc = " ${PN}-powerpc"
> -RDEPENDS_${PN}_append_powerpc64 = " ${PN}-powerpc"
> +RDEPENDS:${PN}:append:aarch64 = " ${PN}-breakpoints ${PN}-ipc"
> +RDEPENDS:${PN}:append:x86 = " ${PN}-breakpoints ${PN}-ipc ${PN}-x86"
> +RDEPENDS:${PN}:append:x86-64 = " ${PN}-breakpoints ${PN}-ipc ${PN}-x86"
> +RDEPENDS:${PN}:append:powerpc = " ${PN}-powerpc"
> +RDEPENDS:${PN}:append:powerpc64 = " ${PN}-powerpc"
>  
> -INSANE_SKIP_${PN} = "already-stripped"
> -INSANE_SKIP_${PN}-exec = "ldflags"
> -INSANE_SKIP_${PN}-ipc = "ldflags"
> -INSANE_SKIP_${PN}-mount = "ldflags"
> -INSANE_SKIP_${PN}-vm = "ldflags"
> +INSANE_SKIP:${PN} = "already-stripped"
> +INSANE_SKIP:${PN}-exec = "ldflags"
> +INSANE_SKIP:${PN}-ipc = "ldflags"
> +INSANE_SKIP:${PN}-mount = "ldflags"
> +INSANE_SKIP:${PN}-vm = "ldflags"
>  
> -COMPATIBLE_MACHINE_riscv64 = "(null)"
> -COMPATIBLE_MACHINE_riscv32 = "(null)"
> +COMPATIBLE_MACHINE:riscv64 = "(null)"
> +COMPATIBLE_MACHINE:riscv32 = "(null)"
> diff --git a/recipes-kernel/linux/bundle-devicetree.inc b/recipes-kernel/linux/bundle-devicetree.inc
> index 4d45037..d259e58 100644
> --- a/recipes-kernel/linux/bundle-devicetree.inc
> +++ b/recipes-kernel/linux/bundle-devicetree.inc
> @@ -2,7 +2,7 @@
>  # zImage. The factory u-boot on lego-ev3 EEPROM only supports uImage, so we
>  # append the DTB to the final uImage here.
>  
> -do_deploy_append() {
> +do_deploy:append() {
>      if [ "${KERNEL_DEVICETREE_BUNDLE}" = "1" ]; then
>          install -d ${DEPLOYDIR}
>          for dtbf in ${KERNEL_DEVICETREE}; do
> diff --git a/recipes-kernel/linux/kernel-rdepends.inc b/recipes-kernel/linux/kernel-rdepends.inc
> index 743b352..193afe4 100644
> --- a/recipes-kernel/linux/kernel-rdepends.inc
> +++ b/recipes-kernel/linux/kernel-rdepends.inc
> @@ -1,41 +1,41 @@
>  # Pull in the devicetree files into the rootfs
> -RDEPENDS_${KERNEL_PACKAGE_NAME}-base += "kernel-devicetree"
> +RDEPENDS:${KERNEL_PACKAGE_NAME}-base += "kernel-devicetree"
>  
>  # Add run-time dependency for PM firmware to the rootfs
> -RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_ti33x = " amx3-cm3"
> -RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_ti43x = " amx3-cm3"
> +RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append_ti33x = " amx3-cm3"
> +RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append_ti43x = " amx3-cm3"
>  
>  # Add run-time dependency for VPE VPDMA firmware to the rootfs
> -RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_dra7xx = " vpdma-fw"
> +RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append_dra7xx = " vpdma-fw"
>  
>  # Add run-time dependency for Goodix firmware to the rootfs
> -RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_dra7xx = " goodix-fw"
> +RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append_dra7xx = " goodix-fw"
>  
>  # Install boot-monitor skern file into /boot dir of rootfs
> -RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_keystone = " boot-monitor"
> +RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append_keystone = " boot-monitor"
>  
>  # Install ti-sci-fw into /boot dir of rootfs
> -RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_k2g = " ti-sci-fw"
> +RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append_k2g = " ti-sci-fw"
>  
>  # Add run-time dependency for SerDes firmware to the rootfs
> -RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_keystone = " serdes-fw"
> +RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append_keystone = " serdes-fw"
>  
>  # Add run-time dependency for QMSS PDSP firmware to the rootfs
> -RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_keystone = " qmss-pdsp-fw"
> +RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append_keystone = " qmss-pdsp-fw"
>  
>  # Add run-time dependency for NETCP PA firmware to the rootfs
> -RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_k2hk = " netcp-pa-fw"
> -RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_k2e = " netcp-pa-fw"
> -RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_k2l = " netcp-pa-fw"
> +RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append_k2hk = " netcp-pa-fw"
> +RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append_k2e = " netcp-pa-fw"
> +RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append_k2l = " netcp-pa-fw"
>  
>  # Add run-time dependency for PRU Ethernet firmware to the rootfs
> -RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_am57xx-evm = " prueth-fw prusw-fw pruhsr-fw pruprp-fw"
> -RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_am57xx-hs-evm = " prueth-fw prusw-fw pruhsr-fw pruprp-fw"
> -RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_ti43x = " prueth-fw pruhsr-fw pruprp-fw"
> -RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_ti33x = " prueth-fw pruhsr-fw pruprp-fw"
> -RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_am65xx = " prueth-fw-am65x"
> -RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_am65xx-evm = " prueth-fw-am65x-sr2"
> -RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_am64xx-evm = " prueth-fw-am65x-sr2"
> +RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append_am57xx-evm = " prueth-fw prusw-fw pruhsr-fw pruprp-fw"
> +RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append_am57xx-hs-evm = " prueth-fw prusw-fw pruhsr-fw pruprp-fw"
> +RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append_ti43x = " prueth-fw pruhsr-fw pruprp-fw"
> +RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append_ti33x = " prueth-fw pruhsr-fw pruprp-fw"
> +RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append_am65xx = " prueth-fw-am65x"
> +RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append_am65xx-evm = " prueth-fw-am65x-sr2"
> +RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append_am64xx-evm = " prueth-fw-am65x-sr2"
>  
>  # Add run-time dependency for Cadence MHDP firmware to the rootfs
> -RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_j7 = " cadence-mhdp-fw"
> +RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append_j7 = " cadence-mhdp-fw"
> diff --git a/recipes-kernel/linux/linux-ti-mainline_git.bb b/recipes-kernel/linux/linux-ti-mainline_git.bb
> index 5d043da..9489ed6 100644
> --- a/recipes-kernel/linux/linux-ti-mainline_git.bb
> +++ b/recipes-kernel/linux/linux-ti-mainline_git.bb
> @@ -25,7 +25,7 @@ SRCREV = "62fb9874f5da54fdb243003b386128037319b219"
>  PV = "5.13+git${SRCPV}"
>  
>  # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
> -MACHINE_KERNEL_PR_append = "b"
> +MACHINE_KERNEL_PR:append = "b"
>  PR = "${MACHINE_KERNEL_PR}"
>  
>  KERNEL_GIT_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git"
> @@ -41,12 +41,12 @@ SRCREV_FORMAT = "linux"
>  
>  KERNEL_DEVICETREE = ""
>  
> -kernel_do_compile_append() {
> +kernel_do_compile:append() {
>  	oe_runmake dtbs CC="${KERNEL_CC} $cc_extra " LD="${KERNEL_LD}" ${KERNEL_EXTRA_ARGS}
>  	oe_runmake -C ${WORKDIR}/ti-upstream-tools LINUX=${S} DTC=${B}/scripts/dtc/dtc O=${B} CC="${KERNEL_CC} $cc_extra " LD="${KERNEL_LD}" ${KERNEL_EXTRA_ARGS}
>  }
>  
> -do_install_append() {
> +do_install:append() {
>  	for dtbf in `find arch/${ARCH}/boot/dts/ \( -name '*.dtb' -or -name '*.dtbo' \)`; do
>  		dtb="$dtbf"
>  		dtb_ext=${dtb##*.}
> @@ -56,7 +56,7 @@ do_install_append() {
>  	done
>  }
>  
> -do_deploy_append() {
> +do_deploy:append() {
>  	for dtbf in `find arch/${ARCH}/boot/dts/ \( -name '*.dtb' -or -name '*.dtbo' \) -printf '%P\n'`; do
>  		dtb="$dtbf"
>  		dtb_ext=${dtb##*.}
> @@ -67,9 +67,9 @@ do_deploy_append() {
>  	done
>  }
>  
> -do_shared_workdir_prepend() {
> +do_shared_workdir:prepend() {
>  	cd ${B}
>  	echo >> Module.symvers
>  }
>  
> -FILES_${KERNEL_PACKAGE_NAME}-devicetree += "/${KERNEL_IMAGEDEST}/*.itb"
> +FILES:${KERNEL_PACKAGE_NAME}-devicetree += "/${KERNEL_IMAGEDEST}/*.itb"
> diff --git a/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb b/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
> index f039d6c..256cea2 100644
> --- a/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
> +++ b/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
> @@ -2,7 +2,7 @@ require linux-ti-staging_5.10.bb
>  
>  # Look in the generic major.minor directory for files
>  # This will have priority over generic non-rt path
> -FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-5.10:"
> +FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}-5.10:"
>  
>  BRANCH = "ti-rt-linux-5.10.y"
>  
> diff --git a/recipes-kernel/linux/linux-ti-staging-rt_5.4.bb b/recipes-kernel/linux/linux-ti-staging-rt_5.4.bb
> index 5542422..8a0c0ea 100644
> --- a/recipes-kernel/linux/linux-ti-staging-rt_5.4.bb
> +++ b/recipes-kernel/linux/linux-ti-staging-rt_5.4.bb
> @@ -2,7 +2,7 @@ require linux-ti-staging_5.4.bb
>  
>  # Look in the generic major.minor directory for files
>  # This will have priority over generic non-rt path
> -FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-5.4:"
> +FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}-5.4:"
>  
>  BRANCH = "ti-rt-linux-5.4.y"
>  
> diff --git a/recipes-kernel/linux/linux-ti-staging-systest_5.10.bb b/recipes-kernel/linux/linux-ti-staging-systest_5.10.bb
> index f091798..e57d82e 100644
> --- a/recipes-kernel/linux/linux-ti-staging-systest_5.10.bb
> +++ b/recipes-kernel/linux/linux-ti-staging-systest_5.10.bb
> @@ -2,4 +2,4 @@ require linux-ti-staging_5.10.bb
>  
>  # Look in the generic major.minor directory for files
>  # This will have priority over generic non-rt path
> -FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-5.10:"
> +FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}-5.10:"
> diff --git a/recipes-kernel/linux/linux-ti-staging-systest_5.4.bb b/recipes-kernel/linux/linux-ti-staging-systest_5.4.bb
> index a240457..7a9a148 100644
> --- a/recipes-kernel/linux/linux-ti-staging-systest_5.4.bb
> +++ b/recipes-kernel/linux/linux-ti-staging-systest_5.4.bb
> @@ -2,4 +2,4 @@ require linux-ti-staging_5.4.bb
>  
>  # Look in the generic major.minor directory for files
>  # This will have priority over generic non-rt path
> -FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-5.4:"
> +FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}-5.4:"
> diff --git a/recipes-kernel/linux/linux-ti-staging_5.10.bb b/recipes-kernel/linux/linux-ti-staging_5.10.bb
> index e06f7b6..36b0d00 100644
> --- a/recipes-kernel/linux/linux-ti-staging_5.10.bb
> +++ b/recipes-kernel/linux/linux-ti-staging_5.10.bb
> @@ -14,7 +14,7 @@ require recipes-kernel/linux/kernel-rdepends.inc
>  require recipes-kernel/linux/ti-kernel.inc
>  
>  # Look in the generic major.minor directory for files
> -FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-5.10:"
> +FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}-5.10:"
>  
>  KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT} \
>  		      ${EXTRA_DTC_ARGS}"
> @@ -27,7 +27,7 @@ SRCREV = "4c2eade9f722838b0e457650368cba1c6c7483c2"
>  PV = "5.10.41+git${SRCPV}"
>  
>  # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
> -MACHINE_KERNEL_PR_append = "b"
> +MACHINE_KERNEL_PR:append = "b"
>  PR = "${MACHINE_KERNEL_PR}"
>  
>  KERNEL_GIT_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git"
> @@ -35,11 +35,11 @@ KERNEL_GIT_PROTOCOL = "git"
>  SRC_URI += "${KERNEL_GIT_URI};protocol=${KERNEL_GIT_PROTOCOL};branch=${BRANCH} \
>              file://defconfig"
>  
> -FILES_${KERNEL_PACKAGE_NAME}-devicetree += "/${KERNEL_IMAGEDEST}/*.itb"
> +FILES:${KERNEL_PACKAGE_NAME}-devicetree += "/${KERNEL_IMAGEDEST}/*.itb"
>  
>  # Special configuration for remoteproc/rpmsg IPC modules
>  module_conf_rpmsg_client_sample = "blacklist rpmsg_client_sample"
>  module_conf_ti_k3_r5_remoteproc = "softdep ti_k3_r5_remoteproc pre: virtio_rpmsg_bus"
>  module_conf_ti_k3_dsp_remoteproc = "softdep ti_k3_dsp_remoteproc pre: virtio_rpmsg_bus"
>  KERNEL_MODULE_PROBECONF += "rpmsg_client_sample ti_k3_r5_remoteproc ti_k3_dsp_remoteproc"
> -KERNEL_MODULE_AUTOLOAD_append_j7 = " rpmsg_kdrv_switch"
> +KERNEL_MODULE_AUTOLOAD:append_j7 = " rpmsg_kdrv_switch"
> diff --git a/recipes-kernel/linux/linux-ti-staging_5.4.bb b/recipes-kernel/linux/linux-ti-staging_5.4.bb
> index a86223a..b08a767 100644
> --- a/recipes-kernel/linux/linux-ti-staging_5.4.bb
> +++ b/recipes-kernel/linux/linux-ti-staging_5.4.bb
> @@ -13,7 +13,7 @@ require recipes-kernel/linux/bundle-devicetree.inc
>  require recipes-kernel/linux/kernel-rdepends.inc
>  
>  # Look in the generic major.minor directory for files
> -FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-5.4:"
> +FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}-5.4:"
>  
>  KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT}"
>  
> @@ -25,7 +25,7 @@ SRCREV = "023faefa70274929bff92dc41167b007f7523792"
>  PV = "5.4.106+git${SRCPV}"
>  
>  # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
> -MACHINE_KERNEL_PR_append = "a"
> +MACHINE_KERNEL_PR:append = "a"
>  PR = "${MACHINE_KERNEL_PR}"
>  
>  KERNEL_GIT_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git"
> @@ -33,11 +33,11 @@ KERNEL_GIT_PROTOCOL = "git"
>  SRC_URI += "${KERNEL_GIT_URI};protocol=${KERNEL_GIT_PROTOCOL};branch=${BRANCH} \
>              file://defconfig"
>  
> -FILES_${KERNEL_PACKAGE_NAME}-devicetree += "/${KERNEL_IMAGEDEST}/*.itb"
> +FILES:${KERNEL_PACKAGE_NAME}-devicetree += "/${KERNEL_IMAGEDEST}/*.itb"
>  
>  # Special configuration for remoteproc/rpmsg IPC modules
>  module_conf_rpmsg_client_sample = "blacklist rpmsg_client_sample"
>  module_conf_ti_k3_r5_remoteproc = "softdep ti_k3_r5_remoteproc pre: virtio_rpmsg_bus"
>  module_conf_ti_k3_dsp_remoteproc = "softdep ti_k3_dsp_remoteproc pre: virtio_rpmsg_bus"
>  KERNEL_MODULE_PROBECONF += "rpmsg_client_sample ti_k3_r5_remoteproc ti_k3_dsp_remoteproc"
> -KERNEL_MODULE_AUTOLOAD_append_j7 = " rpmsg_kdrv_switch"
> +KERNEL_MODULE_AUTOLOAD:append_j7 = " rpmsg_kdrv_switch"
> diff --git a/recipes-kernel/linux/ti-uio.inc b/recipes-kernel/linux/ti-uio.inc
> index 80dad7d..6fc74d1 100644
> --- a/recipes-kernel/linux/ti-uio.inc
> +++ b/recipes-kernel/linux/ti-uio.inc
> @@ -1,19 +1,19 @@
> -SRC_URI_append_keystone = " file://keystone-uio.dtsi"
> -SRC_URI_append_k2hk = " file://k2hk-uio.dtsi"
> -SRC_URI_append_k2l = " file://k2l-uio.dtsi"
> -SRC_URI_append_k2e = " file://k2e-uio.dtsi"
> -SRC_URI_append_k2g = " file://keystone-k2g-pru-uio.dtsi"
> -SRC_URI_append_dra7xx = " file://am57xx-pru-uio.dtsi \
> +SRC_URI:append_keystone = " file://keystone-uio.dtsi"
> +SRC_URI:append_k2hk = " file://k2hk-uio.dtsi"
> +SRC_URI:append_k2l = " file://k2l-uio.dtsi"
> +SRC_URI:append_k2e = " file://k2e-uio.dtsi"
> +SRC_URI:append_k2g = " file://keystone-k2g-pru-uio.dtsi"
> +SRC_URI:append_dra7xx = " file://am57xx-pru-uio.dtsi \
>                            file://am571x-pru-uio.dtsi \
>  "
> -SRC_URI_append_ti33x = " file://am335x-pru-uio.dtsi"
> -SRC_URI_append_ti43x = " file://am437x-pru-uio.dtsi"
> +SRC_URI:append_ti33x = " file://am335x-pru-uio.dtsi"
> +SRC_URI:append_ti43x = " file://am437x-pru-uio.dtsi"
>  
>  DTSI_LIST = ""
> -DTSI_LIST_append_keystone = " keystone-uio.dtsi"
> -DTSI_LIST_append_k2hk = " k2hk-uio.dtsi"
> -DTSI_LIST_append_k2l = " k2l-uio.dtsi"
> -DTSI_LIST_append_k2e = " k2e-uio.dtsi"
> +DTSI_LIST:append_keystone = " keystone-uio.dtsi"
> +DTSI_LIST:append_k2hk = " k2hk-uio.dtsi"
> +DTSI_LIST:append_k2l = " k2l-uio.dtsi"
> +DTSI_LIST:append_k2e = " k2e-uio.dtsi"
>  
>  do_setup_uio() {
>      if [ "${ENABLE_TI_UIO_DEVICES}" == "1" ]
> @@ -30,7 +30,7 @@ do_setup_uio() {
>      fi
>  }
>  
> -do_setup_uio_append_dra7xx() {
> +do_setup_uio:append_dra7xx() {
>  
>      if [ "${ENABLE_TI_UIO_DEVICES}" == "1" ]
>      then
> @@ -53,7 +53,7 @@ do_setup_uio_append_dra7xx() {
>      fi
>  }
>  
> -do_setup_uio_append_ti33x() {
> +do_setup_uio:append_ti33x() {
>  
>      if [ "${ENABLE_TI_UIO_DEVICES}" == "1" ]
>      then
> @@ -65,7 +65,7 @@ do_setup_uio_append_ti33x() {
>      fi
>  }
>  
> -do_setup_uio_append_ti43x() {
> +do_setup_uio:append_ti43x() {
>  
>      if [ "${ENABLE_TI_UIO_DEVICES}" == "1" ]
>      then
> @@ -77,7 +77,7 @@ do_setup_uio_append_ti43x() {
>      fi
>  }
>  
> -do_setup_uio_append_k2g() {
> +do_setup_uio:append_k2g() {
>  
>      if [ "${ENABLE_TI_UIO_DEVICES}" == "1" ]
>      then
> diff --git a/recipes-security/optee/optee-os_%.bbappend b/recipes-security/optee/optee-os_%.bbappend
> index d7e81c5..881dc84 100644
> --- a/recipes-security/optee/optee-os_%.bbappend
> +++ b/recipes-security/optee/optee-os_%.bbappend
> @@ -1,8 +1,8 @@
> -do_compile_prepend_ti-soc() {
> +do_compile:prepend_ti-soc() {
>      export TI_SECURE_DEV_PKG=${TI_SECURE_DEV_PKG}
>  }
>  
> -do_compile_append_k3() {
> +do_compile:append_k3() {
>      ( cd ${B}/core/; \
>          cp tee-pager_v2.bin ${B}/bl32.bin; \
>          cp tee.elf ${B}/bl32.elf; \
> @@ -37,23 +37,23 @@ optee_sign_k3hs() {
>      )
>  }
>  
> -do_compile_append_ti43x() {
> +do_compile:append_ti43x() {
>      optee_sign_legacyhs
>  }
>  
> -do_compile_append_dra7xx() {
> +do_compile:append_dra7xx() {
>      optee_sign_legacyhs
>  }
>  
> -do_compile_append_am65xx-hs-evm() {
> +do_compile:append_am65xx-hs-evm() {
>      optee_sign_k3hs
>  }
>  
> -do_compile_append_j7-hs-evm() {
> +do_compile:append_j7-hs-evm() {
>      optee_sign_k3hs
>  }
>  
> -do_install_append_ti-soc() {
> +do_install:append_ti-soc() {
>      install -m 644 ${B}/*.optee ${D}${nonarch_base_libdir}/firmware/ || true
>      install -m 644 ${B}/bl32.bin ${D}${nonarch_base_libdir}/firmware/ || true
>      install -m 644 ${B}/bl32.elf ${D}${nonarch_base_libdir}/firmware/ || true
> @@ -66,18 +66,18 @@ optee_deploy_legacyhs() {
>      done
>  }
>  
> -do_deploy_append_ti43x() {
> +do_deploy:append_ti43x() {
>      optee_deploy_legacyhs
>  }
>  
> -do_deploy_append_dra7xx() {
> +do_deploy:append_dra7xx() {
>      optee_deploy_legacyhs
>  }
>  
> -do_deploy_append_k3() {
> +do_deploy:append_k3() {
>      ln -sf optee/bl32.bin ${DEPLOYDIR}/
>      ln -sf optee/bl32.elf ${DEPLOYDIR}/
>  }
>  
>  # This is needed for bl32.elf
> -INSANE_SKIP_${PN}_append_k3 = " textrel"
> +INSANE_SKIP:${PN}:append_k3 = " textrel"
> diff --git a/recipes-ti/beagleboard/beaglebone-capes.bb b/recipes-ti/beagleboard/beaglebone-capes.bb
> index 569a3e5..ceefe0d 100644
> --- a/recipes-ti/beagleboard/beaglebone-capes.bb
> +++ b/recipes-ti/beagleboard/beaglebone-capes.bb
> @@ -23,4 +23,4 @@ do_install() {
>  	install -m 0755 ${WORKDIR}/cape*.sh ${D}${bindir}
>  }
>  
> -FILES_${PN} += "${base_libdir}/systemd/system"
> +FILES:${PN} += "${base_libdir}/systemd/system"
> diff --git a/recipes-ti/beagleboard/beaglebone-getting-started.bb b/recipes-ti/beagleboard/beaglebone-getting-started.bb
> index adde30b..303b9bd 100644
> --- a/recipes-ti/beagleboard/beaglebone-getting-started.bb
> +++ b/recipes-ti/beagleboard/beaglebone-getting-started.bb
> @@ -17,5 +17,5 @@ do_install() {
>  	cp -R --no-dereference --preserve=mode,links ${S}/* ${D}${datadir}/${PN}
>  }
>  
> -FILES_${PN} += "${datadir}/${PN}"
> -INSANE_SKIP_${PN} = "file-rdeps"
> +FILES:${PN} += "${datadir}/${PN}"
> +INSANE_SKIP:${PN} = "file-rdeps"
> diff --git a/recipes-ti/beagleboard/gadget-init.bb b/recipes-ti/beagleboard/gadget-init.bb
> index b546efb..3ab00ec 100644
> --- a/recipes-ti/beagleboard/gadget-init.bb
> +++ b/recipes-ti/beagleboard/gadget-init.bb
> @@ -39,22 +39,22 @@ do_install() {
>  
>  PACKAGES =+ "${PN}-storage ${PN}-network ${PN}-udhcpd"
>  
> -ALLOW_EMPTY_${PN} = "1"
> +ALLOW_EMPTY:${PN} = "1"
>  
> -FILES_${PN}-storage = "${base_libdir}/systemd/system/storage-gadget-init.service \
> +FILES:${PN}-storage = "${base_libdir}/systemd/system/storage-gadget-init.service \
>                         ${base_libdir}/systemd/system/basic.target.wants/storage-gadget-init.service \
>                         ${bindir}/g-storage-reinsert.sh \
>                         ${bindir}/update-image-info-on-mmcblk0p1.sh \
>                         ${sysconfdir}/udev/rules.d/bone-gmass-eject.rules"
>  
> -FILES_${PN}-network = "${base_libdir}/systemd/system/network-gadget-init.service \
> +FILES:${PN}-network = "${base_libdir}/systemd/system/network-gadget-init.service \
>                         ${base_libdir}/systemd/system/basic.target.wants/network-gadget-init.service \
>                         ${bindir}/g-ether-load.sh \
>                         ${bindir}/g-ether-start-service.sh \
>                         ${sysconfdir}/udev/rules.d/udhcpd.rules"
>  
> -FILES_${PN}-udhcpd = "${base_libdir}/systemd/system/udhcpd.service \
> +FILES:${PN}-udhcpd = "${base_libdir}/systemd/system/udhcpd.service \
>                        ${base_libdir}/systemd/system/basic.target.wants/udhcpd.service \
>                        ${sysconfdir}/udhcpd.conf"
>  
> -RRECOMMENDS_${PN} = "${PN}-storage ${PN}-network ${PN}-udhcpd"
> +RRECOMMENDS:${PN} = "${PN}-storage ${PN}-network ${PN}-udhcpd"
> diff --git a/recipes-ti/bios/ti-biosutils_1.02.02.bb b/recipes-ti/bios/ti-biosutils_1.02.02.bb
> index 01c070d..eb674f6 100644
> --- a/recipes-ti/bios/ti-biosutils_1.02.02.bb
> +++ b/recipes-ti/bios/ti-biosutils_1.02.02.bb
> @@ -6,7 +6,7 @@ PVsuffix = "_02"
>  SRC_URI[biosutilstarball.md5sum] = "0654e9e72b0a6fc7a6575829c0cd90c9"
>  SRC_URI[biosutilstarball.sha256sum] = "df486500bdc8dbe3800fc7efe4241e6fa5b1827ba7c0dc17a71b41d42ef921e1"
>  
> -INSANE_SKIP_${PN} = "installed-vs-shipped"
> +INSANE_SKIP:${PN} = "installed-vs-shipped"
>  
>  COMPATIBLE_HOST ?= "null"
>  COMPATIBLE_HOST_ti-soc = "(.*)"
> diff --git a/recipes-ti/bios/ti-sysbios.inc b/recipes-ti/bios/ti-sysbios.inc
> index 087f2ed..0009dfc 100644
> --- a/recipes-ti/bios/ti-sysbios.inc
> +++ b/recipes-ti/bios/ti-sysbios.inc
> @@ -19,10 +19,10 @@ do_install() {
>      cp ${CP_ARGS} ${S}/* ${D}${SYSBIOS_INSTALL_DIR_RECIPE}
>  }
>  
> -ALLOW_EMPTY_${PN} = "1"
> -FILES_${PN}-dev += "${SYSBIOS_INSTALL_DIR_RECIPE}"
> +ALLOW_EMPTY:${PN} = "1"
> +FILES:${PN}-dev += "${SYSBIOS_INSTALL_DIR_RECIPE}"
>  
>  INHIBIT_PACKAGE_STRIP = "1"
>  INHIBIT_SYSROOT_STRIP = "1"
>  INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
> -INSANE_SKIP_${PN}-dev = "arch ldflags staticdev file-rdeps"
> +INSANE_SKIP:${PN}-dev = "arch ldflags staticdev file-rdeps"
> diff --git a/recipes-ti/codec-engine/ti-codec-engine_3.24.00.08.bb b/recipes-ti/codec-engine/ti-codec-engine_3.24.00.08.bb
> index aa53841..5851b89 100644
> --- a/recipes-ti/codec-engine/ti-codec-engine_3.24.00.08.bb
> +++ b/recipes-ti/codec-engine/ti-codec-engine_3.24.00.08.bb
> @@ -25,5 +25,5 @@ do_install() {
>          cp ${CP_ARGS} ${S}/* ${D}${CE_INSTALL_DIR_RECIPE}
>  }
>  
> -ALLOW_EMPTY_${PN} = "1"
> -FILES_${PN}-dev += "${CE_INSTALL_DIR_RECIPE}"
> +ALLOW_EMPTY:${PN} = "1"
> +FILES:${PN}-dev += "${CE_INSTALL_DIR_RECIPE}"
> diff --git a/recipes-ti/ctoolslib/libaet_git.bb b/recipes-ti/ctoolslib/libaet_git.bb
> index 626ba92..7f31569 100644
> --- a/recipes-ti/ctoolslib/libaet_git.bb
> +++ b/recipes-ti/ctoolslib/libaet_git.bb
> @@ -32,8 +32,8 @@ do_install() {
>  COMPATIBLE_MACHINE = "dra7xx|keystone"
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
> -FILES_${PN}-dev += "\
> +FILES:${PN}-dev += "\
>      ${datadir}/ti/ctoolslib/aet \
>  "
>  
> -ALLOW_EMPTY_${PN} = "1"
> +ALLOW_EMPTY:${PN} = "1"
> diff --git a/recipes-ti/devtools/gcc-arm-baremetal_7-2018-q2-update.bb b/recipes-ti/devtools/gcc-arm-baremetal_7-2018-q2-update.bb
> index f474c87..e0feb02 100644
> --- a/recipes-ti/devtools/gcc-arm-baremetal_7-2018-q2-update.bb
> +++ b/recipes-ti/devtools/gcc-arm-baremetal_7-2018-q2-update.bb
> @@ -14,16 +14,16 @@ S = "${WORKDIR}/gcc-arm-none-eabi-7-2018-q2-update"
>  
>  # only x86_64 is supported
>  COMPATIBLE_HOST = "x86_64.*-linux"
> -COMPATIBLE_HOST_class-target = "null"
> +COMPATIBLE_HOST:class-target = "null"
>  
>  do_install() {
>      install -d ${D}${GCC_ARM_NONE_TOOLCHAIN_RECIPE}
>      cp -r ${S}/. ${D}${GCC_ARM_NONE_TOOLCHAIN_RECIPE}
>  }
>  
> -FILES_${PN} = "${GCC_ARM_NONE_TOOLCHAIN_RECIPE}/*"
> +FILES:${PN} = "${GCC_ARM_NONE_TOOLCHAIN_RECIPE}/*"
>  
> -INSANE_SKIP_${PN} = "already-stripped libdir staticdev build-deps file-rdeps"
> +INSANE_SKIP:${PN} = "already-stripped libdir staticdev build-deps file-rdeps"
>  INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
>  
>  BBCLASSEXTEND = "native nativesdk"
> diff --git a/recipes-ti/devtools/gcc-linaro-baremetal-aarch64-native.bb b/recipes-ti/devtools/gcc-linaro-baremetal-aarch64-native.bb
> index 97344f9..f1596a8 100644
> --- a/recipes-ti/devtools/gcc-linaro-baremetal-aarch64-native.bb
> +++ b/recipes-ti/devtools/gcc-linaro-baremetal-aarch64-native.bb
> @@ -1,6 +1,6 @@
>  include recipes-ti/devtools/gcc-linaro.inc
>  
> -PACKAGE_DIR = "gcc-linaro-${PV}-${GCC_ARM_YEAR}-x86_64_aarch64-elf"
> +PACKAGE_DIR = "gcc-linaro-${PV}-${GCC_ARM_YEAR}-x86_64:aarch64-elf"
>  S = "${WORKDIR}/${PACKAGE_DIR}"
>  
>  LIC_CHKSUM = "bc7fad4bba98e7a4cd5ab3042506493c"
> @@ -8,7 +8,7 @@ LIC_CHKSUM = "bc7fad4bba98e7a4cd5ab3042506493c"
>  inherit native
>  require recipes-ti/includes/ti-paths.inc
>  
> -SRC_URI = "https://releases.linaro.org/components/toolchain/binaries/7.2-${GCC_ARM_YEAR}/aarch64-elf/gcc-linaro-${PV}-${GCC_ARM_YEAR}-x86_64_aarch64-elf.tar.xz;name=gcc-linaro-aarch64"
> +SRC_URI = "https://releases.linaro.org/components/toolchain/binaries/7.2-${GCC_ARM_YEAR}/aarch64-elf/gcc-linaro-${PV}-${GCC_ARM_YEAR}-x86_64:aarch64-elf.tar.xz;name=gcc-linaro-aarch64"
>  
>  SRC_URI[gcc-linaro-aarch64.md5sum] = "4972f8943820bdd2f577f498de78964b"
>  SRC_URI[gcc-linaro-aarch64.sha256sum] = "30fb7d876bcb982c502057c593d9c1f11b35d5158a26d986718e2b998388c4c8"
> @@ -18,6 +18,6 @@ do_install() {
>      cp -r ${S}/. ${D}${GCC_LINARO_BAREMETAL_AARCH64_TOOLCHAIN_RECIPE}
>  }
>  
> -FILES_${PN} = "${GCC_LINARO_BAREMETAL_AARCH64_TOOLCHAIN_RECIPE}/*"
> +FILES:${PN} = "${GCC_LINARO_BAREMETAL_AARCH64_TOOLCHAIN_RECIPE}/*"
>  
> -INSANE_SKIP_${PN} = "already-stripped"
> +INSANE_SKIP:${PN} = "already-stripped"
> diff --git a/recipes-ti/devtools/gcc-linaro-baremetal-native.bb b/recipes-ti/devtools/gcc-linaro-baremetal-native.bb
> index 0268ae3..d0683fe 100644
> --- a/recipes-ti/devtools/gcc-linaro-baremetal-native.bb
> +++ b/recipes-ti/devtools/gcc-linaro-baremetal-native.bb
> @@ -1,6 +1,6 @@
>  include recipes-ti/devtools/gcc-linaro.inc
>  
> -PACKAGE_DIR = "gcc-linaro-${PV}-${GCC_ARM_YEAR}-x86_64_arm-eabi"
> +PACKAGE_DIR = "gcc-linaro-${PV}-${GCC_ARM_YEAR}-x86_64:arm-eabi"
>  S = "${WORKDIR}/${PACKAGE_DIR}"
>  
>  LIC_CHKSUM = "bc7fad4bba98e7a4cd5ab3042506493c"
> @@ -8,7 +8,7 @@ LIC_CHKSUM = "bc7fad4bba98e7a4cd5ab3042506493c"
>  inherit native
>  require recipes-ti/includes/ti-paths.inc
>  
> -SRC_URI = "https://releases.linaro.org/components/toolchain/binaries/7.2-${GCC_ARM_YEAR}/arm-eabi/gcc-linaro-${PV}-${GCC_ARM_YEAR}-x86_64_arm-eabi.tar.xz;name=gcc-linaro"
> +SRC_URI = "https://releases.linaro.org/components/toolchain/binaries/7.2-${GCC_ARM_YEAR}/arm-eabi/gcc-linaro-${PV}-${GCC_ARM_YEAR}-x86_64:arm-eabi.tar.xz;name=gcc-linaro"
>  
>  SRC_URI[gcc-linaro.md5sum] = "9a4a39cfc78c84375b1160aa93587aed"
>  SRC_URI[gcc-linaro.sha256sum] = "45fc4f90af2e2e9c3197a275f6005ef5639f7a1889fa3eb24c3125ccd70fcd3d"
> @@ -18,6 +18,6 @@ do_install() {
>      cp -r ${S}/. ${D}${GCC_LINARO_BAREMETAL_TOOLCHAIN_RECIPE}
>  }
>  
> -FILES_${PN} = "${GCC_LINARO_BAREMETAL_TOOLCHAIN_RECIPE}/*"
> +FILES:${PN} = "${GCC_LINARO_BAREMETAL_TOOLCHAIN_RECIPE}/*"
>  
> -INSANE_SKIP_${PN} = "already-stripped"
> +INSANE_SKIP:${PN} = "already-stripped"
> diff --git a/recipes-ti/devtools/ti-cg-xml_2.61.00.bb b/recipes-ti/devtools/ti-cg-xml_2.61.00.bb
> index e618af5..8e36be6 100644
> --- a/recipes-ti/devtools/ti-cg-xml_2.61.00.bb
> +++ b/recipes-ti/devtools/ti-cg-xml_2.61.00.bb
> @@ -29,9 +29,9 @@ do_install() {
>      cp ${CP_ARGS} ${S}/* ${D}${CG_XML_INSTALL_DIR_RECIPE}
>  }
>  
> -FILES_${PN} += "${CG_XML_INSTALL_DIR_RECIPE}"
> +FILES:${PN} += "${CG_XML_INSTALL_DIR_RECIPE}"
>  
> -INSANE_SKIP_${PN} = "arch ldflags file-rdeps"
> +INSANE_SKIP:${PN} = "arch ldflags file-rdeps"
>  
>  INHIBIT_PACKAGE_STRIP = "1"
>  INHIBIT_SYSROOT_STRIP = "1"
> diff --git a/recipes-ti/devtools/ti-cgt-arm_18.12.5.bb b/recipes-ti/devtools/ti-cgt-arm_18.12.5.bb
> index 81384d5..60b216f 100644
> --- a/recipes-ti/devtools/ti-cgt-arm_18.12.5.bb
> +++ b/recipes-ti/devtools/ti-cgt-arm_18.12.5.bb
> @@ -21,7 +21,7 @@ TI_BIN_UNPK_CMDS = ""
>  
>  # only x86_64 is supported
>  COMPATIBLE_HOST = "x86_64.*-linux"
> -COMPATIBLE_HOST_class-target = "null"
> +COMPATIBLE_HOST:class-target = "null"
>  
>  do_install() {
>      install -d ${D}${M4_TOOLCHAIN_INSTALL_DIR_RECIPE}
> @@ -31,14 +31,14 @@ do_install() {
>  SRC_URI[cgt_arm_installer.md5sum] = "e9e668332cf86c965b4da9d1d488426b"
>  SRC_URI[cgt_arm_installer.sha256sum] = "da976143128c619a278cb4214a4295c409d100f9e65ad2f4d0d1039db7cf98f4"
>  
> -BINFILE_NAME = "cgt_arm_installer"
> +BINFILE_NAME = "cgt:arm_installer"
>  
> -FILES_${PN} += "${M4_TOOLCHAIN_INSTALL_DIR_RECIPE}"
> +FILES:${PN} += "${M4_TOOLCHAIN_INSTALL_DIR_RECIPE}"
>  
>  INHIBIT_PACKAGE_STRIP = "1"
>  INHIBIT_SYSROOT_STRIP = "1"
>  INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
>  
> -INSANE_SKIP_${PN} += "arch staticdev file-rdeps"
> +INSANE_SKIP:${PN} += "arch staticdev file-rdeps"
>  
>  BBCLASSEXTEND = "native nativesdk"
> diff --git a/recipes-ti/devtools/ti-cgt-pru_2.3.2.bb b/recipes-ti/devtools/ti-cgt-pru_2.3.2.bb
> index ed10e27..d14c196 100644
> --- a/recipes-ti/devtools/ti-cgt-pru_2.3.2.bb
> +++ b/recipes-ti/devtools/ti-cgt-pru_2.3.2.bb
> @@ -3,18 +3,18 @@ HOMEPAGE = "https://www-a.ti.com/downloads/sds_support/TICodegenerationTools/dow
>  LICENSE = "(TI-TSPA & Thai-Open-Source-Software-Center) & BSD-3-Clause & BSL-1.0 & Hewlett-Packard & AFL-3.0 & MIT & BSD-2-Clause & PD"
>  
>  LIC_FILES_CHKSUM = "file://ti-cgt-pru_${PV}/PRU_Code_Generation_Tools_2.3.x_manifest.html;md5=e22f9d8240f7cca0c0aa5242d9ffa5bc"
> -LIC_FILES_CHKSUM_class-target = "file://usr/share/doc/ti/cgt-pru/PRU_Code_Generation_Tools_2.3.x_manifest.html;md5=e22f9d8240f7cca0c0aa5242d9ffa5bc"
> +LIC_FILES_CHKSUM:class-target = "file://usr/share/doc/ti/cgt-pru/PRU_Code_Generation_Tools_2.3.x_manifest.html;md5=e22f9d8240f7cca0c0aa5242d9ffa5bc"
>  
>  require recipes-ti/includes/ti-paths.inc
>  require recipes-ti/includes/ti-unpack.inc
>  
> -BINFILE = "ti_cgt_pru_${PV}_linux_installer_x86.bin"
> +BINFILE = "ti_cgt_pru_${PV}_linux_installer:x86.bin"
>  BINFILE_NAME = "cgt-pru-x86"
>  TI_BIN_UNPK_ARGS = "--prefix ${S}"
>  TI_BIN_UNPK_CMDS = ""
>  
> -BINFILE_class-target = "ti_cgt_pru_${PV}_armlinuxa8hf_busybox_installer.sh"
> -BINFILE_NAME_class-target = "cgt-pru-arm"
> +BINFILE:class-target = "ti_cgt_pru_${PV}:armlinuxa8hf_busybox_installer.sh"
> +BINFILE_NAME:class-target = "cgt-pru-arm"
>  
>  SRC_URI = "http://software-dl.ti.com/codegen/esd/cgt_public_sw/PRU/${PV}/${BINFILE};name=${BINFILE_NAME}"
>  
> @@ -30,13 +30,13 @@ do_install() {
>            ${D}${TI_CGT_PRU_INSTALL_DIR_RECIPE}/
>  }
>  
> -do_install_class-target() {
> +do_install:class-target() {
>      ${WORKDIR}/${BINFILE} --prefix ${D}
>  }
>  
> -FILES_${PN} += "${datadir}/ti/*"
> +FILES:${PN} += "${datadir}/ti/*"
>  
> -FILES_${PN}-dbg = "${TI_CGT_PRU_INSTALL_DIR_RECIPE}/bin/.debug \
> +FILES:${PN}-dbg = "${TI_CGT_PRU_INSTALL_DIR_RECIPE}/bin/.debug \
>                     ${TI_CGT_PRU_INSTALL_DIR_RECIPE}/lib/.debug \
>  "
>  
> @@ -44,6 +44,6 @@ INHIBIT_PACKAGE_STRIP = "1"
>  INHIBIT_SYSROOT_STRIP = "1"
>  INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
>  
> -INSANE_SKIP_${PN} += "arch staticdev already-stripped file-rdeps"
> +INSANE_SKIP:${PN} += "arch staticdev already-stripped file-rdeps"
>  
>  BBCLASSEXTEND = "native nativesdk"
> diff --git a/recipes-ti/devtools/ti-cgt470.inc b/recipes-ti/devtools/ti-cgt470.inc
> index f0992aa..c8f9127 100644
> --- a/recipes-ti/devtools/ti-cgt470.inc
> +++ b/recipes-ti/devtools/ti-cgt470.inc
> @@ -13,7 +13,7 @@ S = "${WORKDIR}/cgt470_${PV}"
>  
>  SRC_URI = "http://install.source.dir.local/ti_cgt_tms470_${PVwithdots}_setup_linux_x86.bin;name=cgt470bin"
>  
> -BINFILE="ti_cgt_tms470_${PVwithdots}_setup_linux_x86.bin"
> +BINFILE="ti_cgt_tms470_${PVwithdots}_setup_linux:x86.bin"
>  TI_BIN_UNPK_CMDS="Y:qY:workdir: : "
>  TI_BIN_UNPK_WDEXT="/cgt470_${PV}"
>  
> diff --git a/recipes-ti/devtools/ti-cgt6x-7_7.4.16.bb b/recipes-ti/devtools/ti-cgt6x-7_7.4.16.bb
> index a67a2d8..a7de8e3 100644
> --- a/recipes-ti/devtools/ti-cgt6x-7_7.4.16.bb
> +++ b/recipes-ti/devtools/ti-cgt6x-7_7.4.16.bb
> @@ -28,16 +28,16 @@ SRC_URI[cgt6x_7.4.16_x86_installer.sha256sum] = "baa0d1ef20397383f99f45068a6d160
>  
>  # only x86_64 is supported
>  COMPATIBLE_HOST = "x86_64.*-linux"
> -COMPATIBLE_HOST_class-target = "null"
> +COMPATIBLE_HOST:class-target = "null"
>  
>  do_install() {
>      install -d ${D}/${TI_CGT6X_7_INSTALL_DIR_RECIPE}
>      cp -rP --preserve=mode,links,timestamps --no-preserve=ownership ${WORKDIR}/c6000_7.4.16/. ${D}/${TI_CGT6X_7_INSTALL_DIR_RECIPE}
>  }
>  
> -FILES_${PN} += "${TI_CGT6X_7_INSTALL_DIR_RECIPE}"
> +FILES:${PN} += "${TI_CGT6X_7_INSTALL_DIR_RECIPE}"
>  
> -INSANE_SKIP_${PN} += "arch staticdev textrel"
> +INSANE_SKIP:${PN} += "arch staticdev textrel"
>  
>  INHIBIT_PACKAGE_STRIP = "1"
>  INHIBIT_SYSROOT_STRIP = "1"
> diff --git a/recipes-ti/devtools/ti-cgt6x_8.3.2.bb b/recipes-ti/devtools/ti-cgt6x_8.3.2.bb
> index 38f5597..00221d8 100644
> --- a/recipes-ti/devtools/ti-cgt6x_8.3.2.bb
> +++ b/recipes-ti/devtools/ti-cgt6x_8.3.2.bb
> @@ -3,13 +3,13 @@ HOMEPAGE = "https://www-a.ti.com/downloads/sds_support/TICodegenerationTools/dow
>  LICENSE = "(TI-TSPA & Thai-Open-Source-Software-Center) & BSD-3-Clause & BSL-1.0 & Patrick-Powell & AFL-3.0 & MIT & BSD-2-Clause & PD"
>  
>  LIC_FILES_CHKSUM = "file://ti-cgt-c6000_${PV}/C6000CodeGenerationTools_8.3.x_manifest.html;md5=d06c6f9acebf78df4108a8535396e9f1"
> -LIC_FILES_CHKSUM_class-target = "file://usr/share/doc/ti/cgt-c6x/C6000CodeGenerationTools_8.3.x_manifest.html;md5=d06c6f9acebf78df4108a8535396e9f1"
> +LIC_FILES_CHKSUM:class-target = "file://usr/share/doc/ti/cgt-c6x/C6000CodeGenerationTools_8.3.x_manifest.html;md5=d06c6f9acebf78df4108a8535396e9f1"
>  
>  PE = "1"
>  
>  require recipes-ti/includes/ti-unpack.inc
>  
> -COMPATIBLE_HOST_class-target = "arm.*-linux"
> +COMPATIBLE_HOST:class-target = "arm.*-linux"
>  
>  # For now we only have hardfp version for target class
>  python __anonymous() {
> @@ -26,13 +26,13 @@ python __anonymous() {
>              raise bb.parse.SkipPackage("%s-%s ONLY supports hardfp mode for now" % (pkgn, pkgv))
>  }
>  
> -BINFILE = "ti_cgt_c6000_${PV}_linux_installer_x86.bin"
> -BINFILE_NAME = "cgt6x_x86_installer"
> +BINFILE = "ti_cgt_c6000_${PV}_linux_installer:x86.bin"
> +BINFILE_NAME = "cgt6x:x86_installer"
>  TI_BIN_UNPK_ARGS = "--prefix ${S}"
>  TI_BIN_UNPK_CMDS = ""
>  
> -BINFILE_class-target = "ti_cgt_c6000_${PV}_armlinuxa8hf_busybox_installer.sh"
> -BINFILE_NAME_class-target = "cgt6x_arm_installer"
> +BINFILE:class-target = "ti_cgt_c6000_${PV}:armlinuxa8hf_busybox_installer.sh"
> +BINFILE_NAME:class-target = "cgt6x:arm_installer"
>  
>  SRC_URI = "http://software-dl.ti.com/codegen/esd/cgt_public_sw/C6000/${PV}/${BINFILE};name=${BINFILE_NAME}"
>  
> @@ -91,17 +91,17 @@ do_install() {
>  
>  }
>  
> -do_install_class-target() {
> +do_install:class-target() {
>      ${WORKDIR}/${BINFILE} --prefix ${D}
>  }
>  
> -FILES_${PN} += "${datadir}/ti/*"
> +FILES:${PN} += "${datadir}/ti/*"
>  
> -FILES_${PN}-dbg += "${datadir}/ti/cgt-c6x/bin/.debug"
> +FILES:${PN}-dbg += "${datadir}/ti/cgt-c6x/bin/.debug"
>  
> -INSANE_SKIP_${PN} += "staticdev"
> +INSANE_SKIP:${PN} += "staticdev"
>  INHIBIT_PACKAGE_STRIP_FILES = "${PKGD}${datadir}/ti/cgt-c6x/lib/libc.a"
>  
>  BBCLASSEXTEND = "native nativesdk"
>  
> -COMPATIBLE_MACHINE_class-target = "(ti-soc)"
> +COMPATIBLE_MACHINE:class-target = "(ti-soc)"
> diff --git a/recipes-ti/devtools/ti-cgt7x_1.2.0.bb b/recipes-ti/devtools/ti-cgt7x_1.2.0.bb
> index cbdac1e..35b58d4 100644
> --- a/recipes-ti/devtools/ti-cgt7x_1.2.0.bb
> +++ b/recipes-ti/devtools/ti-cgt7x_1.2.0.bb
> @@ -15,12 +15,12 @@ require recipes-ti/includes/ti-paths.inc
>  
>  # only x86_64 is supported
>  COMPATIBLE_HOST = "x86_64.*-linux"
> -COMPATIBLE_HOST_class-target = "null"
> +COMPATIBLE_HOST:class-target = "null"
>  
>  PE = "1"
>  
>  BINFILE = "ti_cgt_c7000_${PV}.STS_linux_installer_x86.bin"
> -BINFILE_NAME = "cgt7x_x86_installer"
> +BINFILE_NAME = "cgt7x:x86_installer"
>  
>  SRC_URI = "http://software-dl.ti.com/codegen/esd/cgt_public_sw/C7000/${PV}.STS/${BINFILE};name=${BINFILE_NAME}"
>  
> @@ -38,9 +38,9 @@ do_install() {
>  }
>  
>  
> -FILES_${PN} += "${TI_CGT7X_INSTALL_DIR_RECIPE}"
> +FILES:${PN} += "${TI_CGT7X_INSTALL_DIR_RECIPE}"
>  
> -INSANE_SKIP_${PN} += "arch staticdev textrel"
> +INSANE_SKIP:${PN} += "arch staticdev textrel"
>  
>  INHIBIT_PACKAGE_STRIP = "1"
>  INHIBIT_SYSROOT_STRIP = "1"
> diff --git a/recipes-ti/devtools/ti-xdctools-common.inc b/recipes-ti/devtools/ti-xdctools-common.inc
> index c21e479..e88331b 100644
> --- a/recipes-ti/devtools/ti-xdctools-common.inc
> +++ b/recipes-ti/devtools/ti-xdctools-common.inc
> @@ -13,14 +13,14 @@ do_install() {
>      cp ${CP_ARGS}  ${S}/* ${D}${XDC_INSTALL_DIR_RECIPE}
>  }
>  
> -FILES_${PN}-dev = "${XDC_INSTALL_DIR_RECIPE}"
> +FILES:${PN}-dev = "${XDC_INSTALL_DIR_RECIPE}"
>  
>  BBCLASSEXTEND = "native nativesdk"
>  
>  INHIBIT_PACKAGE_STRIP = "1"
>  INHIBIT_SYSROOT_STRIP = "1"
>  INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
> -INSANE_SKIP_${PN}-dev = "libdir dev-elf arch file-rdeps"
> +INSANE_SKIP:${PN}-dev = "libdir dev-elf arch file-rdeps"
>  
>  # Prevent internal libs from getting picked up
>  PRIVATE_LIBS = " \
> @@ -66,5 +66,5 @@ libawt_xawt.so \
>  
>  COMPATIBLE_HOST ?= "null"
>  COMPATIBLE_HOST_ti-soc = "(.*)"
> -COMPATIBLE_HOST_class-native = "(.*)"
> -COMPATIBLE_HOST_class-nativesdk = "(.*)"
> +COMPATIBLE_HOST:class-native = "(.*)"
> +COMPATIBLE_HOST:class-nativesdk = "(.*)"
> diff --git a/recipes-ti/dmai/ti-dmai.inc b/recipes-ti/dmai/ti-dmai.inc
> index 5062118..0a69049 100644
> --- a/recipes-ti/dmai/ti-dmai.inc
> +++ b/recipes-ti/dmai/ti-dmai.inc
> @@ -31,13 +31,13 @@ SRC_URI = "svn://gforge.ti.com/svn/dmai/;module=${DMAIBRANCH};protocol=https;use
>  
>  DEPENDS = "virtual/kernel alsa-lib ti-framework-components ti-codec-engine ti-xdctools-native"
>  
> -DEPENDS_append_dm6446 	= " ti-codecs-dm6446   ti-dspbios ti-cgt6x ti-linuxutils"
> -DEPENDS_append_dm6467 	= " ti-codecs-dm6467   ti-dspbios ti-cgt6x ti-linuxutils"
> -DEPENDS_append_omap3    = " ti-codecs-omap3530 ti-dspbios ti-cgt6x ti-linuxutils"
> -DEPENDS_append_dm355  	= " ti-codecs-dm355"
> -DEPENDS_append_dm365    = " ti-codecs-dm365"
> -DEPENDS_append_omapl137 = " ti-codecs-omapl137 ti-dspbios ti-cgt6x ti-linuxutils"
> -DEPENDS_append_omapl138 = " ti-codecs-omapl138 ti-dspbios ti-cgt6x ti-linuxutils"
> +DEPENDS:append_dm6446 	= " ti-codecs-dm6446   ti-dspbios ti-cgt6x ti-linuxutils"
> +DEPENDS:append_dm6467 	= " ti-codecs-dm6467   ti-dspbios ti-cgt6x ti-linuxutils"
> +DEPENDS:append_omap3    = " ti-codecs-omap3530 ti-dspbios ti-cgt6x ti-linuxutils"
> +DEPENDS:append_dm355  	= " ti-codecs-dm355"
> +DEPENDS:append_dm365    = " ti-codecs-dm365"
> +DEPENDS:append_omapl137 = " ti-codecs-omapl137 ti-dspbios ti-cgt6x ti-linuxutils"
> +DEPENDS:append_omapl138 = " ti-codecs-omapl138 ti-dspbios ti-cgt6x ti-linuxutils"
>  
>  # Define DMAI build time variables
>  DMAIPLATFORM_dm6446    = "dm6446_al"
> @@ -145,18 +145,18 @@ do_install () {
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
>  PACKAGES += "ti-dmai-apps"
> -FILES_ti-dmai-apps = "${installdir}/ti-dmai-apps/*"
> -INSANE_SKIP_ti-dmai-apps = "1"
> -
> -RDEPENDS_ti-dmai-apps_dm6446    += "ti-codecs-dm6446-server   ti-cmem-module ti-dsplink-module"
> -RDEPENDS_ti-dmai-apps_dm6467    += "ti-codecs-dm6467          ti-cmem-module ti-dsplink-module"
> -RDEPENDS_ti-dmai-apps_omap3     += "ti-codecs-omap3530-server ti-cmem-module ti-dsplink-module ti-lpm-module ti-sdma-module"
> -RDEPENDS_ti-dmai-apps_dm355     += "ti-codecs-dm355           ti-cmem-module ti-dm355mm-module"
> -RDEPENDS_ti-dmai-apps_dm365     += "ti-codecs-dm365           ti-cmem-module ti-dm365mm-module ti-edma-module ti-irq-module"
> -RDEPENDS_ti-dmai-apps_omapl137  += "ti-codecs-omapl137-server ti-cmem-module ti-dsplink-module"
> -RDEPENDS_ti-dmai-apps_omapl138  += "ti-codecs-omapl138-server ti-cmem-module ti-dsplink-module"
> -
> -pkg_postinst_ti-dmai-apps () {
> +FILES:ti-dmai-apps = "${installdir}/ti-dmai-apps/*"
> +INSANE_SKIP:ti-dmai-apps = "1"
> +
> +RDEPENDS:ti-dmai-apps_dm6446    += "ti-codecs-dm6446-server   ti-cmem-module ti-dsplink-module"
> +RDEPENDS:ti-dmai-apps_dm6467    += "ti-codecs-dm6467          ti-cmem-module ti-dsplink-module"
> +RDEPENDS:ti-dmai-apps_omap3     += "ti-codecs-omap3530-server ti-cmem-module ti-dsplink-module ti-lpm-module ti-sdma-module"
> +RDEPENDS:ti-dmai-apps_dm355     += "ti-codecs-dm355           ti-cmem-module ti-dm355mm-module"
> +RDEPENDS:ti-dmai-apps_dm365     += "ti-codecs-dm365           ti-cmem-module ti-dm365mm-module ti-edma-module ti-irq-module"
> +RDEPENDS:ti-dmai-apps_omapl137  += "ti-codecs-omapl137-server ti-cmem-module ti-dsplink-module"
> +RDEPENDS:ti-dmai-apps_omapl138  += "ti-codecs-omapl138-server ti-cmem-module ti-dsplink-module"
> +
> +pkg_postinst:ti-dmai-apps () {
>  	ln -sf ${installdir}/ti-codecs-server/*.${DSPSUFFIX} ${installdir}/ti-dmai-apps/
>  }
>  
> diff --git a/recipes-ti/dmai/ti-dmai_svn.bb b/recipes-ti/dmai/ti-dmai_svn.bb
> index 3cc54b9..a9bd9f8 100644
> --- a/recipes-ti/dmai/ti-dmai_svn.bb
> +++ b/recipes-ti/dmai/ti-dmai_svn.bb
> @@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://dmai_${PV}_License.html;md5=3302f728a5a42f97cabc26a54
>  
>  # This package has high dependence on kernel, use kernel PR as base and append a local version
>  PR = "${MACHINE_KERNEL_PR}"
> -PR_append = "p"
> +PR:append = "p"
>  
>  DMAIBRANCH_dm6446     = "trunk"
>  DMAIBRANCH_dm6467     = "branches/GITPSP_INT_101009"
> @@ -32,12 +32,12 @@ SRCREV_omapl137       = "482"
>  SRCREV_omapl138       = "570"
>  SRCREV               ?= "UNDEFINED_SRCREV"
>  
> -SRC_URI_append = " file://omap3530-r642-remove-include-videodev.diff;striplevel=3 \
> +SRC_URI:append = " file://omap3530-r642-remove-include-videodev.diff;striplevel=3 \
>                     file://r642-fix-config-bld.diff;striplevel=3 \
>                     file://remove-unneeded-includes.patch \
>                   "
>  
> -INSANE_SKIP_${PN} = "installed-vs-shipped"
> +INSANE_SKIP:${PN} = "installed-vs-shipped"
>  
>  COMPATIBLE_HOST ?= "null"
>  COMPATIBLE_HOST_ti-soc = "(.*)"
> diff --git a/recipes-ti/dsplib/dsplib.inc b/recipes-ti/dsplib/dsplib.inc
> index 111d83c..a248905 100644
> --- a/recipes-ti/dsplib/dsplib.inc
> +++ b/recipes-ti/dsplib/dsplib.inc
> @@ -35,7 +35,7 @@ export SWTOOLS_PATH = "${SWTOOLS_INSTALL_DIR}/ti/mas/swtools"
>  export XDCBUILDCFG="${SWTOOLS_PATH}/config.bld"
>  export INCDIR="${MATHLIB_INSTALL_DIR}/"
>  
> -PATH_append = ":${XDC_INSTALL_DIR}"
> +PATH:append = ":${XDC_INSTALL_DIR}"
>  
>  XDCPATH.="${XDCCGROOT}/include;${XDC_INSTALL_DIR}/packages;${SYSBIOS_INSTALL_DIR}/packages;"
>  XDCPATH.="${SWTOOLS_INSTALL_DIR};${MATHLIB_INSTALL_DIR};${DSPLIB_WORK_DIR};"
> @@ -70,9 +70,9 @@ do_deploy() {
>  	rm -r ./${DSPLIB_PACKAGE_NAME}
>  }
>  
> -ALLOW_EMPTY_${PN} = "1"
> -FILES_${PN}-dev += "${DSPLIB_INSTALL_DIR_RECIPE}"
> +ALLOW_EMPTY:${PN} = "1"
> +FILES:${PN}-dev += "${DSPLIB_INSTALL_DIR_RECIPE}"
>  
> -INSANE_SKIP_${PN}-dev = "arch"
> +INSANE_SKIP:${PN}-dev = "arch"
>  COMPATIBLE_HOST ?= "null"
>  COMPATIBLE_HOST_ti-soc = "(.*)"
> diff --git a/recipes-ti/framework-components/ti-framework-components.inc b/recipes-ti/framework-components/ti-framework-components.inc
> index ca15232..e8b7c41 100644
> --- a/recipes-ti/framework-components/ti-framework-components.inc
> +++ b/recipes-ti/framework-components/ti-framework-components.inc
> @@ -15,7 +15,7 @@ do_install() {
>      cp ${CP_ARGS} ${S}/* ${D}${FC_INSTALL_DIR_RECIPE}
>  }
>  
> -INSANE_SKIP_${PN} = "ldflags"
> +INSANE_SKIP:${PN} = "ldflags"
>  
> -ALLOW_EMPTY_${PN} = "1"
> -FILES_${PN}-dev += "${FC_INSTALL_DIR_RECIPE}"
> +ALLOW_EMPTY:${PN} = "1"
> +FILES:${PN}-dev += "${FC_INSTALL_DIR_RECIPE}"
> diff --git a/recipes-ti/imglib/imglib-c66x.inc b/recipes-ti/imglib/imglib-c66x.inc
> index 164bf41..82fea28 100644
> --- a/recipes-ti/imglib/imglib-c66x.inc
> +++ b/recipes-ti/imglib/imglib-c66x.inc
> @@ -23,12 +23,12 @@ do_install() {
>      cp ${CP_ARGS} ${S}/* ${D}${IMGLIB_C66_INSTALL_DIR_RECIPE}
>  }
>  
> -ALLOW_EMPTY_${PN} = "1"
> -FILES_${PN}-dev += "${IMGLIB_C66_INSTALL_DIR_RECIPE}"
> +ALLOW_EMPTY:${PN} = "1"
> +FILES:${PN}-dev += "${IMGLIB_C66_INSTALL_DIR_RECIPE}"
>  
>  INHIBIT_PACKAGE_STRIP = "1"
>  INHIBIT_SYSROOT_STRIP = "1"
>  INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
>  
> -RDEPENDS_${PN}-dev += "perl"
> -INSANE_SKIP_${PN}-dev = "arch"
> +RDEPENDS:${PN}-dev += "perl"
> +INSANE_SKIP:${PN}-dev = "arch"
> diff --git a/recipes-ti/includes/ti-staging.inc b/recipes-ti/includes/ti-staging.inc
> index b588805..f18d017 100644
> --- a/recipes-ti/includes/ti-staging.inc
> +++ b/recipes-ti/includes/ti-staging.inc
> @@ -1,6 +1,6 @@
>  INHIBIT_PACKAGE_STRIP = "1"
>  
> -ALLOW_EMPTY_${PN} = "1"
> -ALLOW_EMPTY_${PN}-dev = "1"
> +ALLOW_EMPTY:${PN} = "1"
> +ALLOW_EMPTY:${PN}-dev = "1"
>  
>  
> diff --git a/recipes-ti/includes/ti-unpack.inc b/recipes-ti/includes/ti-unpack.inc
> index 828f3d5..63b8cd7 100644
> --- a/recipes-ti/includes/ti-unpack.inc
> +++ b/recipes-ti/includes/ti-unpack.inc
> @@ -79,5 +79,5 @@ python ti_bin_do_unpack() {
>  
>  COMPATIBLE_HOST ?= "null"
>  COMPATIBLE_HOST_ti-soc = "(.*)"
> -COMPATIBLE_HOST_class-native = "(.*)"
> -COMPATIBLE_HOST_class-nativesdk = "(.*)"
> +COMPATIBLE_HOST:class-native = "(.*)"
> +COMPATIBLE_HOST:class-nativesdk = "(.*)"
> diff --git a/recipes-ti/ipc/ipc-transport-common-rtos_git.bb b/recipes-ti/ipc/ipc-transport-common-rtos_git.bb
> index 6fec0f0..ade7802 100644
> --- a/recipes-ti/ipc/ipc-transport-common-rtos_git.bb
> +++ b/recipes-ti/ipc/ipc-transport-common-rtos_git.bb
> @@ -20,4 +20,4 @@ do_install () {
>      cp -r ${S} ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/transport/ipc/c66
>  }
>  
> -FILES_${PN} += "${PDK_INSTALL_DIR_RECIPE}/packages/ti/transport/ipc/c66/example/*"
> +FILES:${PN} += "${PDK_INSTALL_DIR_RECIPE}/packages/ti/transport/ipc/c66/example/*"
> diff --git a/recipes-ti/ipc/ipc-transport-qmss-rtos_git.bb b/recipes-ti/ipc/ipc-transport-qmss-rtos_git.bb
> index 6655ab7..2dffc11 100644
> --- a/recipes-ti/ipc/ipc-transport-qmss-rtos_git.bb
> +++ b/recipes-ti/ipc/ipc-transport-qmss-rtos_git.bb
> @@ -9,7 +9,7 @@ COMPATIBLE_MACHINE = "k2hk|k2l|k2e"
>  
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
> -DEPENDS_append = " qmss-lld-rtos \
> +DEPENDS:append = " qmss-lld-rtos \
>                     cppi-lld-rtos \
>                     ti-ipc-rtos \
>                     ipc-transport-common-rtos \
> @@ -20,4 +20,4 @@ IPC_TRANSPORT_QMSS_DESTSUFFIX = "git/c66/qmss"
>  S = "${WORKDIR}/${IPC_TRANSPORT_QMSS_DESTSUFFIX}"
>  
>  export IPC_INSTALL_PATH = "${IPC_INSTALL_DIR}"
> -XDCPATH_append = ";${IPC_INSTALL_DIR}/packages"
> +XDCPATH:append = ";${IPC_INSTALL_DIR}/packages"
> diff --git a/recipes-ti/ipc/ipc-transport-qmss.inc b/recipes-ti/ipc/ipc-transport-qmss.inc
> index f029656..0470526 100644
> --- a/recipes-ti/ipc/ipc-transport-qmss.inc
> +++ b/recipes-ti/ipc/ipc-transport-qmss.inc
> @@ -3,7 +3,7 @@ LICENSE = "BSD-3-Clause"
>  
>  require ipc-transport.inc
>  
> -INC_PR_append = ".1"
> +INC_PR:append = ".1"
>  
>  LIC_FILES_CHKSUM = "file://COPYING.txt;md5=27bb0deb260c60120a8d7b91da7c3b02"
>  
> diff --git a/recipes-ti/ipc/ipc-transport-srio-rtos_git.bb b/recipes-ti/ipc/ipc-transport-srio-rtos_git.bb
> index 3f96598..5272091 100644
> --- a/recipes-ti/ipc/ipc-transport-srio-rtos_git.bb
> +++ b/recipes-ti/ipc/ipc-transport-srio-rtos_git.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://TransportSrio.xdc;beginline=1;endline=35;md5=4d466471
>  
>  COMPATIBLE_MACHINE = "k2hk"
>  
> -DEPENDS_append = " qmss-lld-rtos \
> +DEPENDS:append = " qmss-lld-rtos \
>                     cppi-lld-rtos \
>                     srio-lld-rtos \
>                     ti-ipc-rtos \
> @@ -19,4 +19,4 @@ IPC_TRANSPORT_SRIO_DESTSUFFIX = "git/c66/srio"
>  S = "${WORKDIR}/${IPC_TRANSPORT_SRIO_DESTSUFFIX}"
>  
>  export IPC_INSTALL_PATH = "${IPC_INSTALL_DIR}"
> -XDCPATH_append = ";${IPC_INSTALL_DIR}/packages"
> +XDCPATH:append = ";${IPC_INSTALL_DIR}/packages"
> diff --git a/recipes-ti/ipc/ipc-transport-srio.inc b/recipes-ti/ipc/ipc-transport-srio.inc
> index 6c47738..8942570 100644
> --- a/recipes-ti/ipc/ipc-transport-srio.inc
> +++ b/recipes-ti/ipc/ipc-transport-srio.inc
> @@ -3,7 +3,7 @@ LICENSE = "BSD-3-Clause"
>  
>  require ipc-transport.inc
>  
> -INC_PR_append = ".1"
> +INC_PR:append = ".1"
>  
>  LIC_FILES_CHKSUM = "file://COPYING.txt;md5=27bb0deb260c60120a8d7b91da7c3b02"
>  
> diff --git a/recipes-ti/ipc/ti-ipc-examples-linux_git.bb b/recipes-ti/ipc/ti-ipc-examples-linux_git.bb
> index ab47955..8170659 100644
> --- a/recipes-ti/ipc/ti-ipc-examples-linux_git.bb
> +++ b/recipes-ti/ipc/ti-ipc-examples-linux_git.bb
> @@ -5,7 +5,7 @@ SRC_URI += "file://0001-examples-ClusterMgr-sys_errlist-has-been-deprecated-.pat
>  
>  DEPENDS = "ti-ipc ti-xdctools-native ti-sysbios ti-ipc-rtos zip-native"
>  
> -do_compile_append() {
> +do_compile:append() {
>  
>    if [  "${PLATFORM}" != "UNKNOWN" ]; then
>      oe_runmake extract HOSTOS="linux" IPC_INSTALL_DIR="${IPC_INSTALL_DIR}"
> @@ -27,7 +27,7 @@ do_compile_append() {
>    fi
>  }
>  
> -do_install_append() {
> +do_install:append() {
>    cd ${S_ipc-examples}/src
>  
>    if [  "${PLATFORM}" != "UNKNOWN" ]; then
> @@ -46,4 +46,4 @@ do_install_append() {
>    fi
>  }
>  
> -FILES_${PN} += "${bindir}/*"
> +FILES:${PN} += "${bindir}/*"
> diff --git a/recipes-ti/ipc/ti-ipc-examples.inc b/recipes-ti/ipc/ti-ipc-examples.inc
> index 022b13f..66cd5d3 100644
> --- a/recipes-ti/ipc/ti-ipc-examples.inc
> +++ b/recipes-ti/ipc/ti-ipc-examples.inc
> @@ -5,9 +5,9 @@ require ti-ipc-rtos.inc
>  LICENSE = "BSD"
>  LIC_FILES_CHKSUM = "file://${S_ipc-examples}/src/makefile;beginline=1;endline=30;md5=a52324bd5033bb49ea07bade1244ac9a"
>  
> -INSANE_SKIP_${PN} += "arch"
> +INSANE_SKIP:${PN} += "arch"
>  
> -ALLOW_EMPTY_${PN} = "1"
> +ALLOW_EMPTY:${PN} = "1"
>  
>  IPC_INSTALL_DIR = "${STAGING_DIR_TARGET}/usr/share/ti/ti-ipc-tree"
>  
> diff --git a/recipes-ti/ipc/ti-ipc-examples_git.bb b/recipes-ti/ipc/ti-ipc-examples_git.bb
> index c46e5c8..bcc8674 100644
> --- a/recipes-ti/ipc/ti-ipc-examples_git.bb
> +++ b/recipes-ti/ipc/ti-ipc-examples_git.bb
> @@ -3,7 +3,7 @@ require ti-ipc-examples.inc
>  
>  DEPENDS = "ti-ipc ti-xdctools-native ti-sysbios ti-ipc-rtos zip-native"
>  
> -do_compile_append() {
> +do_compile:append() {
>  
>    if [  "${PLATFORM}" != "UNKNOWN" ]; then
>      oe_runmake extract HOSTOS="bios" IPC_INSTALL_DIR="${IPC_INSTALL_DIR}"
> @@ -21,7 +21,7 @@ do_compile_append() {
>    fi
>  }
>  
> -do_install_append() {
> +do_install:append() {
>    if [  "${PLATFORM}" != "UNKNOWN" ]; then
>      # Install directory for bios examples
>      install -d ${D}/ipc_${IPC_VERSION}/examples/bios
> @@ -41,4 +41,4 @@ do_install_append() {
>    fi
>  }
>  
> -FILES_${PN} += "ipc_*"
> +FILES:${PN} += "ipc_*"
> diff --git a/recipes-ti/ipc/ti-ipc-rtos.inc b/recipes-ti/ipc/ti-ipc-rtos.inc
> index b6b7892..e64f9dc 100644
> --- a/recipes-ti/ipc/ti-ipc-rtos.inc
> +++ b/recipes-ti/ipc/ti-ipc-rtos.inc
> @@ -41,16 +41,16 @@ RELEASE_SUFFIX = ""
>  
>  PR = "${INC_PR}.r0"
>  
> -DEPENDS_append_keystone = " ti-cgt6x-native \
> +DEPENDS:append_keystone = " ti-cgt6x-native \
>                              gcc-arm-baremetal-native \
>  "
> -DEPENDS_append_omap-a15 = " ti-cgt6x-native \
> +DEPENDS:append_omap-a15 = " ti-cgt6x-native \
>                              ti-cgt-arm-native \
>                              gcc-arm-baremetal-native \
>  "
> -DEPENDS_append_omapl138 = " ti-cgt6x-native \
> +DEPENDS:append_omapl138 = " ti-cgt6x-native \
>  "
> -DEPENDS_append_c66x = " ti-cgt6x-native \
> +DEPENDS:append_c66x = " ti-cgt6x-native \
>  "
>  
>  IPC_TARGETS = ""
> diff --git a/recipes-ti/ipc/ti-ipc-rtos_git.bb b/recipes-ti/ipc/ti-ipc-rtos_git.bb
> index b292d67..080d8c2 100644
> --- a/recipes-ti/ipc/ti-ipc-rtos_git.bb
> +++ b/recipes-ti/ipc/ti-ipc-rtos_git.bb
> @@ -5,13 +5,13 @@ require ti-ipc-rtos.inc
>  DEPENDS = "ti-xdctools-native ti-sysbios doxygen-native zip-native"
>  
>  PACKAGES =+ "${PN}-fw"
> -FILES_${PN}-fw = "${base_libdir}/firmware/*"
> -FILES_${PN}-dev += "${IPC_INSTALL_DIR_RECIPE}"
> +FILES:${PN}-fw = "${base_libdir}/firmware/*"
> +FILES:${PN}-dev += "${IPC_INSTALL_DIR_RECIPE}"
>  
> -INSANE_SKIP_${PN}-fw += "arch"
> -INSANE_SKIP_${PN}-dev += "arch"
> +INSANE_SKIP:${PN}-fw += "arch"
> +INSANE_SKIP:${PN}-dev += "arch"
>  
> -ALLOW_EMPTY_${PN} = "1"
> +ALLOW_EMPTY:${PN} = "1"
>  
>  IPC_PACKAGE_DIR = "${S}/ipc-package"
>  
> @@ -85,7 +85,7 @@ KFPLAT_k2g = "TCI66AK2G02"
>  
>  ALTERNATIVE_PRIORITY = "5"
>  
> -pkg_postinst_${PN}-fw_keystone () {
> +pkg_postinst:${PN}-fw_keystone () {
>    i=0
>    while [ $i -lt ${KFDSPNUM} ]; do
>      update-alternatives --install /lib/firmware/keystone-dsp$i-fw keystone-dsp$i-fw ipc/ti_platforms_evm${KFPLAT}_core0/messageq_single.xe66 ${ALTERNATIVE_PRIORITY}
> @@ -93,7 +93,7 @@ pkg_postinst_${PN}-fw_keystone () {
>    done
>  }
>  
> -pkg_postrm_${PN}-fw_keystone () {
> +pkg_postrm:${PN}-fw_keystone () {
>    i=0
>    while [ $i -lt ${KFDSPNUM} ]; do
>      update-alternatives --remove keystone-dsp$i-fw ipc/ti_platforms_evm${KFPLAT}_core0/messageq_single.xe66
> @@ -101,24 +101,24 @@ pkg_postrm_${PN}-fw_keystone () {
>    done
>  }
>  
> -pkg_postinst_${PN}-fw_omap-a15 () {
> +pkg_postinst:${PN}-fw_omap-a15 () {
>    update-alternatives --install /lib/firmware/dra7-dsp1-fw.xe66 dra7-dsp1-fw.xe66 ipc/ti_platforms_evmDRA7XX_dsp1/test_omx_dsp1_vayu.xe66 ${ALTERNATIVE_PRIORITY}
>    update-alternatives --install /lib/firmware/dra7-dsp2-fw.xe66 dra7-dsp2-fw.xe66 ipc/ti_platforms_evmDRA7XX_dsp2/test_omx_dsp2_vayu.xe66 ${ALTERNATIVE_PRIORITY}
>    update-alternatives --install /lib/firmware/dra7-ipu1-fw.xem4 dra7-ipu1-fw.xem4 ipc/ti_platforms_evmDRA7XX_ipu1/test_omx_ipu1_vayu.xem4 ${ALTERNATIVE_PRIORITY}
>    update-alternatives --install /lib/firmware/dra7-ipu2-fw.xem4 dra7-ipu2-fw.xem4 ipc/ti_platforms_evmDRA7XX_ipu2/test_omx_ipu2_vayu.xem4 ${ALTERNATIVE_PRIORITY}
>  }
>  
> -pkg_postrm_${PN}-fw_omap-a15 () {
> +pkg_postrm:${PN}-fw_omap-a15 () {
>    update-alternatives --remove dra7-dsp1-fw.xe66 ipc/ti_platforms_evmDRA7XX_dsp1/test_omx_dsp1_vayu.xe66
>    update-alternatives --remove dra7-dsp2-fw.xe66 ipc/ti_platforms_evmDRA7XX_dsp2/test_omx_dsp2_vayu.xe66
>    update-alternatives --remove dra7-ipu1-fw.xem4 ipc/ti_platforms_evmDRA7XX_ipu1/test_omx_ipu1_vayu.xem4
>    update-alternatives --remove dra7-ipu2-fw.xem4 ipc/ti_platforms_evmDRA7XX_ipu2/test_omx_ipu2_vayu.xem4
>  }
>  
> -pkg_postinst_${PN}-fw_omapl138 () {
> +pkg_postinst:${PN}-fw_omapl138 () {
>    update-alternatives --install /lib/firmware/rproc-dsp-fw rproc-dsp-fw ipc/ti_platforms_evmOMAPL138_DSP/messageq_single.xe674 ${ALTERNATIVE_PRIORITY}
>  }
>  
> -pkg_postrm_${PN}-fw_omapl138 () {
> +pkg_postrm:${PN}-fw_omapl138 () {
>    update-alternatives --remove rproc-dsp-fw ipc/ti_platforms_evmOMAPL138_DSP/messageq_single.xe674
>  }
> diff --git a/recipes-ti/ipc/ti-ipc_git.bb b/recipes-ti/ipc/ti-ipc_git.bb
> index 425ca4e..8f543c9 100644
> --- a/recipes-ti/ipc/ti-ipc_git.bb
> +++ b/recipes-ti/ipc/ti-ipc_git.bb
> @@ -28,7 +28,7 @@ inherit autotools-brokensep pkgconfig update-rc.d systemd
>  INITSCRIPT_NAME = "tiipclad-daemon.sh"
>  INITSCRIPT_PARAMS = "defaults 10"
>  
> -SYSTEMD_SERVICE_${PN} = "tiipclad-daemon.service"
> +SYSTEMD_SERVICE:${PN} = "tiipclad-daemon.service"
>  
>  EXTRA_OECONF += "PLATFORM=${PLATFORM} KERNEL_INSTALL_DIR=${STAGING_KERNEL_DIR} KERNEL_BUILD_DIR=${STAGING_KERNEL_BUILDDIR}"
>  
> @@ -39,7 +39,7 @@ do_configure() {
>      oe_runconf
>  }
>  
> -do_install_append() {
> +do_install:append() {
>      install -d ${D}${sysconfdir}/init.d/
>  
>      # Modify the startup scripts to point to the right
> @@ -53,15 +53,15 @@ do_install_append() {
>      install -c -m 755 ${WORKDIR}/tiipclad-daemon.sh ${D}${sysconfdir}/init.d/${INITSCRIPT_NAME}
>  }
>  
> -do_install_append_dra7xx() {
> +do_install:append_dra7xx() {
>      install -d ${D}${sysconfdir}/modprobe.d/
>      install -c -m 644 ${WORKDIR}/omap_remoteproc.conf ${D}${sysconfdir}/modprobe.d/
>  }
>  
>  PACKAGES =+ "${PN}-test"
> -RDEPENDS_${PN}-test += "${PN}"
> +RDEPENDS:${PN}-test += "${PN}"
>  
> -FILES_${PN}-test = " \
> +FILES:${PN}-test = " \
>      ${bindir}/NameServerApp \
>      ${bindir}/MessageQApp \
>      ${bindir}/MessageQMulti \
> diff --git a/recipes-ti/linuxutils/ti-linuxutils.inc b/recipes-ti/linuxutils/ti-linuxutils.inc
> index c8f9320..c461418 100644
> --- a/recipes-ti/linuxutils/ti-linuxutils.inc
> +++ b/recipes-ti/linuxutils/ti-linuxutils.inc
> @@ -15,7 +15,7 @@ require recipes-ti/includes/ti-staging.inc
>  PR = "${MACHINE_KERNEL_PR}"
>  
>  #This is a kernel module, don't set PR directly
> -MACHINE_KERNEL_PR_append = "f"
> +MACHINE_KERNEL_PR:append = "f"
>  
>  inherit module
>  
> @@ -82,12 +82,12 @@ PACKAGES =+ " ti-cmem-module \
>                ti-irq-module \
>                ti-linuxutils-app"
>  
> -FILES_ti-cmem-module = "/lib/modules/${KERNEL_VERSION}/kernel/drivers/dsp/cmem*.ko"
> -FILES_ti-sdma-module = "/lib/modules/${KERNEL_VERSION}/kernel/drivers/dsp/sdma*.ko"
> -FILES_ti-edma-module = "/lib/modules/${KERNEL_VERSION}/kernel/drivers/dsp/edma*.ko"
> -FILES_ti-irq-module = "/lib/modules/${KERNEL_VERSION}/kernel/drivers/dsp/irq*.ko"
> +FILES:ti-cmem-module = "/lib/modules/${KERNEL_VERSION}/kernel/drivers/dsp/cmem*.ko"
> +FILES:ti-sdma-module = "/lib/modules/${KERNEL_VERSION}/kernel/drivers/dsp/sdma*.ko"
> +FILES:ti-edma-module = "/lib/modules/${KERNEL_VERSION}/kernel/drivers/dsp/edma*.ko"
> +FILES:ti-irq-module = "/lib/modules/${KERNEL_VERSION}/kernel/drivers/dsp/irq*.ko"
>  
> -FILES_ti-linuxutils-app = "${installdir}/ti-linuxutils-app/*/*"
> +FILES:ti-linuxutils-app = "${installdir}/ti-linuxutils-app/*/*"
>  
> -INSANE_SKIP_ti-linuxutils-app = "True"
> +INSANE_SKIP:ti-linuxutils-app = "True"
>  INHIBIT_PACKAGE_STRIP = "1"
> diff --git a/recipes-ti/linuxutils/ti-linuxutils_2.26.01.02.bb b/recipes-ti/linuxutils/ti-linuxutils_2.26.01.02.bb
> index 113e6a6..2b7e1f9 100644
> --- a/recipes-ti/linuxutils/ti-linuxutils_2.26.01.02.bb
> +++ b/recipes-ti/linuxutils/ti-linuxutils_2.26.01.02.bb
> @@ -11,7 +11,7 @@ PV = "2_26_01_02"
>  SRC_URI[md5sum] = "70b4918bc35c1bcfef34d6ba3fbce0c8"
>  SRC_URI[sha256sum] = "51266dd928f8d629cd417c869789a6c0d596612120f165619119cbaadfd66ee2"
>  
> -INSANE_SKIP_${PN} = "installed-vs-shipped"
> +INSANE_SKIP:${PN} = "installed-vs-shipped"
>  
>  COMPATIBLE_HOST ?= "null"
>  COMPATIBLE_HOST_ti-soc = "(.*)"
> diff --git a/recipes-ti/mathlib/mathlib.inc b/recipes-ti/mathlib/mathlib.inc
> index cfc5409..e83584b 100644
> --- a/recipes-ti/mathlib/mathlib.inc
> +++ b/recipes-ti/mathlib/mathlib.inc
> @@ -34,7 +34,7 @@ export C66CODEGENTOOL ="${CGTOOLS_INSTALL_DIR}"
>  export SWTOOLS_PATH = "${SWTOOLS_INSTALL_DIR}/ti/mas/swtools"
>  export XDCBUILDCFG="${SWTOOLS_PATH}/config.bld"
>  
> -PATH_append = ":${XDC_INSTALL_DIR}"
> +PATH:append = ":${XDC_INSTALL_DIR}"
>  
>  XDCPATH.="${XDCCGROOT}/include;${XDC_INSTALL_DIR}/packages;${SYSBIOS_INSTALL_DIR}/packages;"
>  XDCPATH.="${SWTOOLS_INSTALL_DIR};${MATHLIB_WORK_DIR};"
> @@ -69,9 +69,9 @@ do_deploy() {
>  	rm -r ./${MATHLIB_PACKAGE_NAME}
>  }
>  
> -ALLOW_EMPTY_${PN} = "1"
> -FILES_${PN}-dev += "${MATHLIB_INSTALL_DIR_RECIPE}"
> +ALLOW_EMPTY:${PN} = "1"
> +FILES:${PN}-dev += "${MATHLIB_INSTALL_DIR_RECIPE}"
>  
> -INSANE_SKIP_${PN}-dev = "arch"
> +INSANE_SKIP:${PN}-dev = "arch"
>  COMPATIBLE_HOST ?= "null"
>  COMPATIBLE_HOST_ti-soc = "(.*)"
> diff --git a/recipes-ti/mpm-transport/mpm-transport_git.bb b/recipes-ti/mpm-transport/mpm-transport_git.bb
> index 9bbbb73..6843689 100644
> --- a/recipes-ti/mpm-transport/mpm-transport_git.bb
> +++ b/recipes-ti/mpm-transport/mpm-transport_git.bb
> @@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=122b7757f366f3f6fe11988715258fc9"
>  COMPATIBLE_MACHINE = "keystone"
>  
>  DEPENDS = "common-csl-ip edma3-lld mmap-lld cmem rm-lld qmss-lld cppi-lld uio-module-drv"
> -DEPENDS_append_k2hk = " hyplnk-lld srio-lld"
> -DEPENDS_append_k2e = " hyplnk-lld"
> +DEPENDS:append_k2hk = " hyplnk-lld srio-lld"
> +DEPENDS:append_k2e = " hyplnk-lld"
>  
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
> @@ -21,14 +21,14 @@ PR = "r0"
>  
>  CC += "-fcommon"
>  EXTRA_OEMAKE = "PDK_INSTALL_PATH=${STAGING_INCDIR}"
> -EXTRA_OEMAKE_append_k2hk += "HYPLNK_TRANSPORT=true SRIO_TRANSPORT=true"
> -EXTRA_OEMAKE_append_k2e += "HYPLNK_TRANSPORT=true"
> -INSANE_SKIP_${PN} += "ldflags"
> +EXTRA_OEMAKE:append_k2hk += "HYPLNK_TRANSPORT=true SRIO_TRANSPORT=true"
> +EXTRA_OEMAKE:append_k2e += "HYPLNK_TRANSPORT=true"
> +INSANE_SKIP:${PN} += "ldflags"
>  
>  S = "${WORKDIR}/git"
>  
>  PACKAGES =+ "${PN}-test"
> -FILES_${PN}-test = "${bindir}/mpm_transport_test.out \
> +FILES:${PN}-test = "${bindir}/mpm_transport_test.out \
>  					${bindir}/mpm_transport_hyplnk_loopback.out \
>  					${bindir}/mpm_transport_hyplnk_remote.out \
>  					${bindir}/mpm_transport_hyplnk_loopback_dma.out \
> diff --git a/recipes-ti/multiprocmgr/multiprocmgr-rtos_git.bb b/recipes-ti/multiprocmgr/multiprocmgr-rtos_git.bb
> index 7a6e0f6..41efe38 100644
> --- a/recipes-ti/multiprocmgr/multiprocmgr-rtos_git.bb
> +++ b/recipes-ti/multiprocmgr/multiprocmgr-rtos_git.bb
> @@ -9,7 +9,7 @@ DEPENDS = "ti-cgt6x-native"
>  PR = "${INC_PR}.2"
>  
>  PACKAGES =+ "${PN}-test"
> -FILES_${PN}-test = "${datadir}/ti/examples/mpm/test/filetestdemo/c66x/demo_loopback/build/bin/*.out \
> +FILES:${PN}-test = "${datadir}/ti/examples/mpm/test/filetestdemo/c66x/demo_loopback/build/bin/*.out \
>                      ${datadir}/ti/examples/mpm/test/sync_test/c66x/bin/*.out"
>  
>  EXTRA_OEMAKE = "LOCAL_SYSROOT="${STAGING_DIR_TARGET}" \
> @@ -35,10 +35,10 @@ do_install() {
>          ${D}${datadir}/ti/examples/mpm/test/sync_test/c66x/bin/
>  }
>  
> -FILES_${PN}-dev += "${MPM_INSTALL_DIR_RECIPE}"
> -INSANE_SKIP_${PN}-dev = "arch"
> -INSANE_SKIP_${PN}-test = "arch"
> +FILES:${PN}-dev += "${MPM_INSTALL_DIR_RECIPE}"
> +INSANE_SKIP:${PN}-dev = "arch"
> +INSANE_SKIP:${PN}-test = "arch"
>  
> -RDEPENDS_${PN}-dev = "bash"
> +RDEPENDS:${PN}-dev = "bash"
>  
> -ALLOW_EMPTY_${PN} = "1"
> +ALLOW_EMPTY:${PN} = "1"
> diff --git a/recipes-ti/multiprocmgr/multiprocmgr-test_git.bb b/recipes-ti/multiprocmgr/multiprocmgr-test_git.bb
> index 8bcb110..3d1b3ae 100644
> --- a/recipes-ti/multiprocmgr/multiprocmgr-test_git.bb
> +++ b/recipes-ti/multiprocmgr/multiprocmgr-test_git.bb
> @@ -5,14 +5,14 @@ include multiprocmgr.inc
>  PR = "${INC_PR}.2"
>  
>  DEPENDS = "multiprocmgr cmem"
> -RDEPENDS_${PN} = "multiprocmgr mpm-transport cmem"
> -RDEPENDS_${PN} += "multiprocmgr-rtos-test bash"
> +RDEPENDS:${PN} = "multiprocmgr mpm-transport cmem"
> +RDEPENDS:${PN} += "multiprocmgr-rtos-test bash"
>  
> -FILES_${PN} += "\
> +FILES:${PN} += "\
>      ${datadir}/ti/examples/mpm \
>  "
>  
> -FILES_${PN}-dbg += "\
> +FILES:${PN}-dbg += "\
>      ${datadir}/ti/examples/mpm/*/.debug \
>  "
>  
> @@ -28,4 +28,4 @@ do_install() {
>  	cp -r ${S}/test ${D}${datadir}/ti/examples/mpm
>  }
>  
> -INSANE_SKIP_${PN} = "ldflags staticdev"
> +INSANE_SKIP:${PN} = "ldflags staticdev"
> diff --git a/recipes-ti/multiprocmgr/multiprocmgr_git.bb b/recipes-ti/multiprocmgr/multiprocmgr_git.bb
> index 0751260..1bd2488 100644
> --- a/recipes-ti/multiprocmgr/multiprocmgr_git.bb
> +++ b/recipes-ti/multiprocmgr/multiprocmgr_git.bb
> @@ -16,7 +16,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
>  INITSCRIPT_NAME = "mpmsrv-daemon.sh"
>  INITSCRIPT_PARAMS = "defaults 10"
>  
> -SYSTEMD_SERVICE_${PN} = "mpmsrv-daemon.service"
> +SYSTEMD_SERVICE:${PN} = "mpmsrv-daemon.service"
>  
>  inherit update-rc.d systemd
>  
> @@ -41,4 +41,4 @@ do_install() {
>  	chown -R root:root ${D}${libdir}/
>  }
>  
> -INSANE_SKIP_${PN} = "ldflags"
> +INSANE_SKIP:${PN} = "ldflags"
> diff --git a/recipes-ti/ndk/ti-ndk.inc b/recipes-ti/ndk/ti-ndk.inc
> index 9afde31..89c1adf 100644
> --- a/recipes-ti/ndk/ti-ndk.inc
> +++ b/recipes-ti/ndk/ti-ndk.inc
> @@ -14,7 +14,7 @@ do_install() {
>      cp ${CP_ARGS} ${S}/* ${D}${NDK_INSTALL_DIR_RECIPE}
>  }
>  
> -ALLOW_EMPTY_${PN} = "1"
> -FILES_${PN}-dev += "${NDK_INSTALL_DIR_RECIPE}"
> +ALLOW_EMPTY:${PN} = "1"
> +FILES:${PN}-dev += "${NDK_INSTALL_DIR_RECIPE}"
>  
> -INSANE_SKIP_${PN}-dev = "arch ldflags staticdev file-rdeps"
> +INSANE_SKIP:${PN}-dev = "arch ldflags staticdev file-rdeps"
> diff --git a/recipes-ti/ns/ti-ns.inc b/recipes-ti/ns/ti-ns.inc
> index 2a50c56..a6b37c6 100644
> --- a/recipes-ti/ns/ti-ns.inc
> +++ b/recipes-ti/ns/ti-ns.inc
> @@ -15,7 +15,7 @@ do_install() {
>      cp ${CP_ARGS} ${S}/* ${D}${NS_INSTALL_DIR_RECIPE}
>  }
>  
> -ALLOW_EMPTY_${PN} = "1"
> -FILES_${PN}-dev += "${NS_INSTALL_DIR_RECIPE}"
> +ALLOW_EMPTY:${PN} = "1"
> +FILES:${PN}-dev += "${NS_INSTALL_DIR_RECIPE}"
>  
> -INSANE_SKIP_${PN}-dev = "arch ldflags staticdev file-rdeps"
> +INSANE_SKIP:${PN}-dev = "arch ldflags staticdev file-rdeps"
> diff --git a/recipes-ti/openmp-rtos/openmp-rtos_git.bb b/recipes-ti/openmp-rtos/openmp-rtos_git.bb
> index 0c93f35..32faa98 100644
> --- a/recipes-ti/openmp-rtos/openmp-rtos_git.bb
> +++ b/recipes-ti/openmp-rtos/openmp-rtos_git.bb
> @@ -24,9 +24,9 @@ SRCREV = "c090eb664d9815a36ead0e14f31e102590680fb8"
>  LIC_FILES_CHKSUM = "file://docs/license/omp_manifest_template.html;md5=61a6972303c0447b7c056195d7ebafee"
>  
>  DEPENDS = "common-csl-ip-rtos doxygen-native libulm ti-xdctools-native ti-ipc-rtos ti-sysbios ti-cgt6x-native zip-native"
> -DEPENDS_append_k2hk = " qmss-lld-rtos cppi-lld-rtos"
> -DEPENDS_append_k2e = " qmss-lld-rtos cppi-lld-rtos"
> -DEPENDS_append_k2l = " qmss-lld-rtos cppi-lld-rtos"
> +DEPENDS:append_k2hk = " qmss-lld-rtos cppi-lld-rtos"
> +DEPENDS:append_k2e = " qmss-lld-rtos cppi-lld-rtos"
> +DEPENDS:append_k2l = " qmss-lld-rtos cppi-lld-rtos"
>  
>  COMPATIBLE_MACHINE = "keystone|omap-a15"
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
> @@ -64,10 +64,10 @@ do_install() {
>      cp -r ${S}/exports/openmp_dsp_${RELEASE_TARGET}_*/. -d  ${D}${OMP_INSTALL_DIR_RECIPE}
>  }
>  
> -ALLOW_EMPTY_${PN} = "1"
> +ALLOW_EMPTY:${PN} = "1"
>  
> -FILES_${PN}-dev += " \
> +FILES:${PN}-dev += " \
>      ${OMP_INSTALL_DIR_RECIPE}/ \
>  "
>  
> -INSANE_SKIP_${PN}-dev = "arch"
> +INSANE_SKIP:${PN}-dev = "arch"
> diff --git a/recipes-ti/osal/ti-osal.inc b/recipes-ti/osal/ti-osal.inc
> index 0a966d4..11f99e6 100644
> --- a/recipes-ti/osal/ti-osal.inc
> +++ b/recipes-ti/osal/ti-osal.inc
> @@ -15,10 +15,10 @@ do_install() {
>      cp -pPrf ${S}/* ${D}${OSAL_INSTALL_DIR_RECIPE}
>  }
>  
> -INSANE_SKIP_${PN}-dev = "staticdev"
> +INSANE_SKIP:${PN}-dev = "staticdev"
>  
> -ALLOW_EMPTY_${PN} = "1"
> -FILES_${PN}-dev += "${OSAL_INSTALL_DIR_RECIPE}"
> +ALLOW_EMPTY:${PN} = "1"
> +FILES:${PN}-dev += "${OSAL_INSTALL_DIR_RECIPE}"
>  
>  COMPATIBLE_HOST ?= "null"
>  COMPATIBLE_HOST_ti-soc = "(.*)"
> diff --git a/recipes-ti/swtools/swtools_git.bb b/recipes-ti/swtools/swtools_git.bb
> index 497c0e0..b6d645f 100644
> --- a/recipes-ti/swtools/swtools_git.bb
> +++ b/recipes-ti/swtools/swtools_git.bb
> @@ -27,7 +27,7 @@ export C64PCODEGENTOOL = "${CGTOOLS_INSTALL_DIR}"
>  export C674CODEGENTOOL = "${CGTOOLS_INSTALL_DIR}"
>  export C66CODEGENTOOL  = "${CGTOOLS_INSTALL_DIR}"
>  
> -PATH_append = ":${XDC_INSTALL_DIR}"
> +PATH:append = ":${XDC_INSTALL_DIR}"
>  
>  XDCPATH .= "${XDCCGROOT}/include;${XDC_INSTALL_DIR}/packages;${SYSBIOS_INSTALL_DIR}/packages;"
>  
> @@ -44,9 +44,9 @@ do_install() {
>  	cp ${CP_ARGS} ${S}/* ${D}${SWTOOLS_INSTALL_DIR_RECIPE}
>  }
>  
> -FILES_${PN}-dev += "${SWTOOLS_INSTALL_DIR_RECIPE}"
> +FILES:${PN}-dev += "${SWTOOLS_INSTALL_DIR_RECIPE}"
>  
> -INSANE_SKIP_${PN}-dev = "arch staticdev"
> -ALLOW_EMPTY_${PN} = "1"
> +INSANE_SKIP:${PN}-dev = "arch staticdev"
> +ALLOW_EMPTY:${PN} = "1"
>  COMPATIBLE_HOST ?= "null"
>  COMPATIBLE_HOST_ti-soc = "(.*)"
> diff --git a/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb b/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb
> index 9664881..6b491dc 100644
> --- a/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb
> +++ b/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb
> @@ -28,5 +28,5 @@ do_install() {
>      oe_runmake
>  }
>  
> -FILES_${PN} += "${PDK_INSTALL_DIR_RECIPE}/packages/*"
> -INSANE_SKIP_${PN} += " file-rdeps"
> +FILES:${PN} += "${PDK_INSTALL_DIR_RECIPE}/packages/*"
> +INSANE_SKIP:${PN} += " file-rdeps"
> diff --git a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> index 198426e..e1fca26 100644
> --- a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> +++ b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> @@ -29,7 +29,7 @@ PR = "${INC_PR}.0"
>  # Secure Build 
>  DEPENDS += "openssl-native"
>  
> -FILES_${PN} += "${base_libdir}"
> +FILES:${PN} += "${base_libdir}"
>  
>  TI_SECURE_DEV_PKG ?= ""
>  
> @@ -46,7 +46,7 @@ LEGACY_DM_FW_DIR  = "${D}${base_libdir}/firmware/pdk-ipc/"
>  DM_FIRMWARE = "ipc_echo_testb_mcu1_0_release_strip.xer5f"
>  
>  # J7 HS support
> -do_install_prepend_j7-hs-evm() {
> +do_install:prepend_j7-hs-evm() {
>  	export TI_SECURE_DEV_PKG=${TI_SECURE_DEV_PKG}
>  	( cd ${RTOS_DM_FW_DIR}; \
>  		mv ${DM_FIRMWARE} ${DM_FIRMWARE}.unsigned; \
> @@ -55,7 +55,7 @@ do_install_prepend_j7-hs-evm() {
>  }
>  
>  # Update the am64xx ipc binaries to be consistent with other platforms
> -do_install_prepend_am64xx() {
> +do_install:prepend_am64xx() {
>          ( cd ${RTOS_IPC_FW_DIR}; \
>                  mv am64-main-r5f0_0-fw ipc_echo_baremetal_test_mcu1_0_release_strip.xer5f; \
>                  mv am64-main-r5f0_1-fw ipc_echo_baremetal_test_mcu1_1_release_strip.xer5f; \
> @@ -113,19 +113,19 @@ do_install_am64xx() {
>  }
>  
>  # Set up names for the firmwares
> -ALTERNATIVE_${PN}_am65xx = "\
> +ALTERNATIVE:${PN}_am65xx = "\
>                      am65x-mcu-r5f0_0-fw \
>                      am65x-mcu-r5f0_1-fw \
>                      "
>  
> -ALTERNATIVE_${PN}_am64xx = "\
> +ALTERNATIVE:${PN}_am64xx = "\
>                      am64-main-r5f0_0-fw \
>                      am64-main-r5f0_1-fw \
>                      am64-main-r5f1_0-fw \
>                      am64-main-r5f1_1-fw \
>                      "
>  
> -ALTERNATIVE_${PN}_j7 = "\
> +ALTERNATIVE:${PN}_j7 = "\
>                      j7-mcu-r5f0_0-fw \
>                      j7-mcu-r5f0_1-fw \
>                      j7-main-r5f0_0-fw \
> @@ -137,7 +137,7 @@ ALTERNATIVE_${PN}_j7 = "\
>                      j7-c71_0-fw\
>                      "
>  
> -ALTERNATIVE_${PN}_j7200-evm = "\
> +ALTERNATIVE:${PN}_j7200-evm = "\
>                      j7200-mcu-r5f0_0-fw \
>                      j7200-mcu-r5f0_1-fw \
>                      j7200-main-r5f0_0-fw \
> @@ -220,7 +220,7 @@ ALTERNATIVE_TARGET[j7200-main-r5f0_1-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_
>  ALTERNATIVE_PRIORITY = "10"
>  
>  # make sure that lib/firmware, and all its contents are part of the package
> -FILES_${PN} += "${base_libdir}/firmware"
> +FILES:${PN} += "${base_libdir}/firmware"
>  
>  # This is used to prevent the build system to_strip the executables
>  INHIBIT_PACKAGE_STRIP = "1"
> @@ -228,7 +228,7 @@ INHIBIT_SYSROOT_STRIP = "1"
>  # This is used to prevent the build system to split the debug info in a separate file
>  INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
>  # As it likely to be a different arch from the Yocto build, disable checking by adding "arch" to INSANE_SKIP
> -INSANE_SKIP_${PN} += "arch"
> +INSANE_SKIP:${PN} += "arch"
>  
>  # we don't want to configure and build the source code
>  do_compile[noexec] = "1"
> diff --git a/recipes-ti/udma/udma_git.bb b/recipes-ti/udma/udma_git.bb
> index c905fa5..b6100a3 100644
> --- a/recipes-ti/udma/udma_git.bb
> +++ b/recipes-ti/udma/udma_git.bb
> @@ -14,7 +14,7 @@ PV = "01.00.00.00"
>  
>  PACKAGES =+ "${PN}-test"
>  
> -FILES_${PN}-test = "${bindir}/udma_test"
> +FILES:${PN}-test = "${bindir}/udma_test"
>  
>  do_install() {
>  	install -d ${D}${bindir}/
> @@ -29,4 +29,4 @@ do_install() {
>  	install -c -m 755 ${S}/include/* ${D}${includedir}/
>  }
>  
> -INSANE_SKIP_${PN} += "textrel"
> +INSANE_SKIP:${PN} += "textrel"
> diff --git a/recipes-ti/uio-test-pruss/uio-test-pruss_git.bb b/recipes-ti/uio-test-pruss/uio-test-pruss_git.bb
> index cbae1b1..fdcf766 100644
> --- a/recipes-ti/uio-test-pruss/uio-test-pruss_git.bb
> +++ b/recipes-ti/uio-test-pruss/uio-test-pruss_git.bb
> @@ -26,10 +26,10 @@ COMPATIBLE_MACHINE = "omap-a15|ti33x|ti43x|k2g"
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
>  DEVICE_NAME = ""
> -DEVICE_NAME_append_am57xx-evm = "am57xx"
> -DEVICE_NAME_append_ti33x = "am33xx"
> -DEVICE_NAME_append_ti43x = "am43xx"
> -DEVICE_NAME_append_k2g = "k2g"
> +DEVICE_NAME:append_am57xx-evm = "am57xx"
> +DEVICE_NAME:append_ti33x = "am33xx"
> +DEVICE_NAME:append_ti43x = "am43xx"
> +DEVICE_NAME:append_k2g = "k2g"
>  
>  EXTRA_OEMAKE = "CGT_PRU=${TI_CGT_PRU_INSTALL_DIR} DEVICE=${DEVICE_NAME}"
>  
> diff --git a/recipes-ti/vlib/vlib-c66x.inc b/recipes-ti/vlib/vlib-c66x.inc
> index a539e4d..9ab9c50 100644
> --- a/recipes-ti/vlib/vlib-c66x.inc
> +++ b/recipes-ti/vlib/vlib-c66x.inc
> @@ -23,10 +23,10 @@ do_install() {
>      cp ${CP_ARGS} ${S}/* ${D}${VLIB_C66_INSTALL_DIR_RECIPE}
>  }
>  
> -ALLOW_EMPTY_${PN} = "1"
> -FILES_${PN}-dev += "${VLIB_C66_INSTALL_DIR_RECIPE}"
> +ALLOW_EMPTY:${PN} = "1"
> +FILES:${PN}-dev += "${VLIB_C66_INSTALL_DIR_RECIPE}"
>  
>  INHIBIT_PACKAGE_STRIP = "1"
>  INHIBIT_SYSROOT_STRIP = "1"
>  INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
> -INSANE_SKIP_${PN}-dev = "installed-vs-shipped arch"
> +INSANE_SKIP:${PN}-dev = "installed-vs-shipped arch"
> diff --git a/recipes-ti/xdais/ti-xdais.inc b/recipes-ti/xdais/ti-xdais.inc
> index 24268b3..daa93dd 100644
> --- a/recipes-ti/xdais/ti-xdais.inc
> +++ b/recipes-ti/xdais/ti-xdais.inc
> @@ -19,7 +19,7 @@ do_install() {
>  INHIBIT_PACKAGE_STRIP = "1"
>  INHIBIT_SYSROOT_STRIP = "1"
>  INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
> -INSANE_SKIP_${PN}-dev = "arch"
> +INSANE_SKIP:${PN}-dev = "arch"
>  
> -ALLOW_EMPTY_${PN} = "1"
> -FILES_${PN}-dev += "${XDAIS_INSTALL_DIR_RECIPE}"
> +ALLOW_EMPTY:${PN} = "1"
> +FILES:${PN}-dev += "${XDAIS_INSTALL_DIR_RECIPE}"
> diff --git a/recipes-ti/xdais/ti-xdais_6.26.01.03.bb b/recipes-ti/xdais/ti-xdais_6.26.01.03.bb
> index 3d35863..9fc4cee 100644
> --- a/recipes-ti/xdais/ti-xdais_6.26.01.03.bb
> +++ b/recipes-ti/xdais/ti-xdais_6.26.01.03.bb
> @@ -8,4 +8,4 @@ LIC_FILES_CHKSUM = "file://xdais_6_26_01_03_manifest.html;md5=a5a675d49db2f658bb
>  SRC_URI[xdaistarball.md5sum] = "9b2bea3408254e737ec0d819a031adf6"
>  SRC_URI[xdaistarball.sha256sum] = "d7bcbd8bcfe6fdfc5f402e4b125ced6c806dc30bc5296e98d5d43b0b5a237a0d"
>  
> -INSANE_SKIP_${PN} = "installed-vs-shipped"
> +INSANE_SKIP:${PN} = "installed-vs-shipped"
> -- 
> 2.7.4
> 

> 
> 
> 


-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964

