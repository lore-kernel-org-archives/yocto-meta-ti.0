Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.28340.1628539136931530084
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 09 Aug 2021 12:58:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id D56C740C3E;
	Mon,  9 Aug 2021 19:58:55 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 30nJEPjPuw-0; Mon,  9 Aug 2021 19:58:55 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 9E6D940952;
	Mon,  9 Aug 2021 19:58:54 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 5E865174656; Mon,  9 Aug 2021 15:58:54 -0400 (EDT)
Date: Mon, 9 Aug 2021 15:58:54 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Khem Raj <raj.khem@gmail.com>
Cc: meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] [PATCH 1/2] layer: Convert to using new override syntax
Message-ID: <20210809195854.GH1528@denix.org>
References: <20210809193931.1080811-1-raj.khem@gmail.com>
 <20210809195304.GG1528@denix.org>
 <CAMKF1srnyeRGuJkUSrNXXKACPkaRk+8cJLHiqT0jjehs4GLUwg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1srnyeRGuJkUSrNXXKACPkaRk+8cJLHiqT0jjehs4GLUwg@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Try using this for now:
https://lists.yoctoproject.org/g/meta-ti/topic/84651122


On Mon, Aug 09, 2021 at 12:55:26PM -0700, Khem Raj wrote:
> Yes I am :) and I now remember that I had to consider machine overrides so
> ignore this for now
> 
> 
> On Mon, Aug 9, 2021 at 12:53 PM Denys Dmytriyenko <denis@denix.org> wrote:
> 
> > Khem,
> >
> > Aren't you supposed to be on vacation this week? :)
> >
> > NAK for this patch, as I see too many mistakes - some overrides for SOC
> > families are missed and some non-overrides, like "makefile_armv7" are
> > incorrectly converted. And you are about a week late, anyway... :)
> >
> > --
> > Denys
> >
> >
> > On Mon, Aug 09, 2021 at 12:39:30PM -0700, Khem Raj wrote:
> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > ---
> > >  classes/ti-pdk-fetch.bbclass                  |   2 +-
> > >  classes/ti-pdk.bbclass                        |  18 +--
> > >  conf/machine/am3517-evm.conf                  |   2 +-
> > >  conf/machine/am37x-evm.conf                   |   2 +-
> > >  conf/machine/am65xx-evm-k3r5-sr2.conf         |   2 +-
> > >  conf/machine/am65xx-hs-evm-k3r5-sr2.conf      |   2 +-
> > >  conf/machine/beagleboard.conf                 |   2 +-
> > >  conf/machine/beaglebone.conf                  |   2 +-
> > >  conf/machine/include/am64xx.inc               |   2 +-
> > >  conf/machine/include/am65xx.inc               |   2 +-
> > >  conf/machine/include/c66x.inc                 |   2 +-
> > >  conf/machine/include/davinci.inc              |   2 +-
> > >  conf/machine/include/dra7xx.inc               |   2 +-
> > >  conf/machine/include/j7.inc                   |   2 +-
> > >  conf/machine/include/k2e.inc                  |   2 +-
> > >  conf/machine/include/k2g.inc                  |   2 +-
> > >  conf/machine/include/k2hk.inc                 |   2 +-
> > >  conf/machine/include/k2l.inc                  |   2 +-
> > >  conf/machine/include/k3.inc                   |   2 +-
> > >  conf/machine/include/k3r5.inc                 |   6 +-
> > >  conf/machine/include/keystone.inc             |   2 +-
> > >  conf/machine/include/omap-a15.inc             |   2 +-
> > >  conf/machine/include/omap3.inc                |   2 +-
> > >  conf/machine/include/omap4.inc                |   2 +-
> > >  conf/machine/include/omapl1.inc               |   2 +-
> > >  conf/machine/include/omapl137.inc             |   2 +-
> > >  conf/machine/include/omapl138.inc             |   2 +-
> > >  conf/machine/include/ti33x.inc                |   2 +-
> > >  conf/machine/include/ti43x.inc                |   2 +-
> > >  conf/machine/omap3evm.conf                    |   2 +-
> > >  conf/multiconfig/k3r5-sr2.conf                |   2 +-
> > >  conf/multiconfig/k3r5.conf                    |   2 +-
> > >  recipes-bsp/abefw/abefw_1.0.14.bb             |   2 +-
> > >  recipes-bsp/aif2-lld/aif2-lld-rtos_git.bb     |   2 +-
> > >  recipes-bsp/aif2-lld/aif2-lld-test_git.bb     |   2 +-
> > >  recipes-bsp/aif2-lld/aif2-lld_git.bb          |   2 +-
> > >  recipes-bsp/alsa-state/alsa-state.bbappend    |   2 +-
> > >  .../audk2g-addon/audk2g-addon-rtos_git.bb     |   2 +-
> > >  recipes-bsp/bcp-lld/bcp-lld-rtos_git.bb       |   2 +-
> > >  recipes-bsp/board-rtos/board-rtos_git.bb      |  20 +--
> > >  recipes-bsp/boot-monitor/boot-monitor_git.bb  |   2 +-
> > >  recipes-bsp/bt-fw/bt-fw_git.bb                |   2 +-
> > >  .../cadence-mhdp-fw/cadence-mhdp-fw_git.bb    |   2 +-
> > >  recipes-bsp/cal-lld/cal-lld-rtos_git.bb       |   6 +-
> > >  recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb   |   2 +-
> > >  recipes-bsp/cmb-addon/cmb-addon-rtos_git.bb   |   2 +-
> > >  recipes-bsp/cmem/cmem-mod_git.bb              |   4 +-
> > >  recipes-bsp/cmem/cmem_git.bb                  |   4 +-
> > >  .../common-csl-ip/common-csl-ip-rtos_git.bb   |  10 +-
> > >  .../common-csl-ip/common-csl-ip_git.bb        |   2 +-
> > >  .../common-csl-ip/csl-rti-dwwdtest-fw_git.bb  |  16 +--
> > >  recipes-bsp/cppi-lld/cppi-lld-rtos_git.bb     |   4 +-
> > >  recipes-bsp/cppi-lld/cppi-lld-test_git.bb     |   6 +-
> > >  recipes-bsp/cppi-lld/cppi-lld_git.bb          |   8 +-
> > >  .../cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb        |   6 +-
> > >  recipes-bsp/cuia/cuia_1.0.0.13.bb             |   2 +-
> > >  recipes-bsp/dfe-lld/dfe-lld-test_git.bb       |   2 +-
> > >  recipes-bsp/dfe-lld/dfe-lld_git.bb            |   2 +-
> > >  recipes-bsp/dspdce-fw/dspdce-fw_git.bb        |   6 +-
> > >  recipes-bsp/dsptop/debugss-module-drv_git.bb  |   4 +-
> > >  recipes-bsp/dsptop/dsptop_git.bb              |   4 +-
> > >  recipes-bsp/dsptop/libulm_git.bb              |   4 +-
> > >  .../dsptop/temperature-module-drv_git.bb      |   4 +-
> > >  recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb   |  10 +-
> > >  recipes-bsp/edma3-lld/edma3-lld_git.bb        |   6 +-
> > >  recipes-bsp/emac-lld/emac-lld-rtos_git.bb     |  12 +-
> > >  recipes-bsp/fatfs-rtos/fatfs-rtos_git.bb      |   2 +-
> > >  .../faultmanagement-rtos_git.bb               |   4 +-
> > >  recipes-bsp/fftc-lld/fftc-lld-rtos_git.bb     |   2 +-
> > >  .../formfactor/formfactor_0.0.bbappend        |   2 +-
> > >  recipes-bsp/fvid2/fvid2-rtos_git.bb           |   6 +-
> > >  .../ti-gc320-driver_5.0.11.p7.bb              |   2 +-
> > >  recipes-bsp/goodix-fw/goodix-fw_git.bb        |   2 +-
> > >  recipes-bsp/gpio-lld/gpio-lld-rtos_git.bb     |   8 +-
> > >  recipes-bsp/gpmc-lld/gpmc-lld-rtos_git.bb     |   6 +-
> > >  recipes-bsp/hplib/hplib-mod_git.bb            |   2 +-
> > >  recipes-bsp/hplib/hplib-test_git.bb           |   2 +-
> > >  recipes-bsp/hplib/hplib_git.bb                |   4 +-
> > >  recipes-bsp/hyplnk-lld/hyplnk-lld-rtos_git.bb |   2 +-
> > >  recipes-bsp/hyplnk-lld/hyplnk-lld-test_git.bb |   6 +-
> > >  recipes-bsp/hyplnk-lld/hyplnk-lld_git.bb      |   6 +-
> > >  recipes-bsp/i2c-lld/i2c-lld-rtos_git.bb       |  14 +-
> > >  recipes-bsp/ibl-boot/ibl-boot-rtos_git.bb     |   6 +-
> > >  .../icss-emac-lld/icss-emac-lld-rtos_git.bb   |   8 +-
> > >  .../icss-emac-lld/icss-emac-lld-test_git.bb   |   6 +-
> > >  .../icss-emac-lld/icss-emac-lld_git.bb        |   2 +-
> > >  recipes-bsp/iolink-lld/iolink-lld-rtos_git.bb |   6 +-
> > >  .../ipc-lld/ipc-lld-examples-rtos_git.bb      |  24 ++--
> > >  recipes-bsp/ipc-lld/ipc-lld-fw_git.bb         |  12 +-
> > >  recipes-bsp/ipc-lld/ipc-lld-rtos_git.bb       |   6 +-
> > >  recipes-bsp/ipc-lld/ipc-lld.inc               |   2 +-
> > >  recipes-bsp/ipumm-fw/ipumm-fw_git.bb          |   6 +-
> > >  recipes-bsp/iqn2-lld/iqn2-lld-test_git.bb     |   2 +-
> > >  recipes-bsp/iqn2-lld/iqn2-lld_git.bb          |   2 +-
> > >  recipes-bsp/mad-utils/mad-utils-rtos_git.bb   |   6 +-
> > >  recipes-bsp/mcasp-lld/mcasp-lld-rtos_git.bb   |  12 +-
> > >  recipes-bsp/mcbsp-lld/mcbsp-lld-rtos_git.bb   |   4 +-
> > >  recipes-bsp/mmap-lld/mmap-lld-test_git.bb     |   8 +-
> > >  recipes-bsp/mmap-lld/mmap-lld_git.bb          |   4 +-
> > >  recipes-bsp/mmcsd-lld/mmcsd-lld-rtos_git.bb   |  12 +-
> > >  recipes-bsp/netcp-pa-fw/netcp-pa-fw_git.bb    |   2 +-
> > >  recipes-bsp/netcp-sa-fw/netcp-sa-fw_git.bb    |   2 +-
> > >  recipes-bsp/nwal-lld/nwal-lld-rtos_git.bb     |   2 +-
> > >  recipes-bsp/nwal-lld/nwal-lld-test_git.bb     |   2 +-
> > >  recipes-bsp/nwal-lld/nwal-lld_git.bb          |   2 +-
> > >  recipes-bsp/osal/osal-rtos_git.bb             |   6 +-
> > >  recipes-bsp/osal/osal-test_git.bb             |   2 +-
> > >  recipes-bsp/osal/osal_git.bb                  |   2 +-
> > >  recipes-bsp/pa-lld/pa-lld-rtos_git.bb         |   4 +-
> > >  recipes-bsp/pa-lld/pa-lld-test_git.bb         |   6 +-
> > >  recipes-bsp/pa-lld/pa-lld_git.bb              |   4 +-
> > >  recipes-bsp/pcie-lld/pcie-lld-rtos_git.bb     |   2 +-
> > >  recipes-bsp/pktlib/pktlib-rtos_git.bb         |   4 +-
> > >  recipes-bsp/pktlib/pktlib_git.bb              |   2 +-
> > >  recipes-bsp/pm-lld/pm-lld-rtos_git.bb         |  16 +--
> > >  .../ti-img-rogue-driver_1.13.5776728.bb       |   2 +-
> > >  .../ti-sgx-ddk-km_1.17.4948957.bb             |   4 +-
> > >  recipes-bsp/pru/pru-icss_git.bb               |  38 +++---
> > >  recipes-bsp/pru/pru-pwm-fw_git.bb             |   4 +-
> > >  recipes-bsp/pru/pru-swuart-fw_git.bb          |   6 +-
> > >  .../pru/ti-pru-sw-edma-driver_1.00.00.bb      |   6 +-
> > >  .../prueth-fw/prueth-fw-am65x-sr2_git.bb      |   4 +-
> > >  recipes-bsp/prueth-fw/prueth-fw-am65x_git.bb  |   4 +-
> > >  recipes-bsp/prueth-fw/prueth-fw_5.6.15.bb     |   4 +-
> > >  recipes-bsp/pruhsr-fw/pruhsr-fw_2.17.25.bb    |   4 +-
> > >  recipes-bsp/pruprp-fw/pruprp-fw_2.17.25.bb    |   4 +-
> > >  recipes-bsp/pruss-lld/pruss-lld-apps_git.bb   |   6 +-
> > >  recipes-bsp/pruss-lld/pruss-lld-rtos_git.bb   |  10 +-
> > >  recipes-bsp/pruss-lld/pruss-lld-test_git.bb   |   2 +-
> > >  recipes-bsp/pruss-lld/pruss-lld_git.bb        |   2 +-
> > >  recipes-bsp/prusw-fw/prusw-fw_3.2.9.bb        |   4 +-
> > >  recipes-bsp/qmss-lld/qmss-lld-rtos_git.bb     |   4 +-
> > >  recipes-bsp/qmss-lld/qmss-lld-test_git.bb     |   6 +-
> > >  recipes-bsp/qmss-lld/qmss-lld_git.bb          |   8 +-
> > >  recipes-bsp/qmss-pdsp-fw/qmss-pdsp-fw_git.bb  |   2 +-
> > >  recipes-bsp/rm-lld/rm-lld-rtos_git.bb         |   2 +-
> > >  recipes-bsp/rm-lld/rm-lld_git.bb              |   8 +-
> > >  recipes-bsp/sa-lld/sa-lld-rtos_git.bb         |   6 +-
> > >  recipes-bsp/sa-lld/sa-lld-test_git.bb         |   4 +-
> > >  recipes-bsp/sa-lld/sa-lld_git.bb              |   2 +-
> > >  recipes-bsp/sciclient/sciclient-rtos_git.bb   |  18 +--
> > >  .../serdes-diag/serdes-diag-rtos_git.bb       |   2 +-
> > >  recipes-bsp/serdes-fw/serdes-fw_git.bb        |   2 +-
> > >  recipes-bsp/spi-lld/spi-lld-rtos_git.bb       |  12 +-
> > >  recipes-bsp/srio-lld/srio-lld-rtos_git.bb     |   4 +-
> > >  recipes-bsp/srio-lld/srio-lld.inc             |   2 +-
> > >  .../starterware/starterware-rtos_git.bb       |   4 +-
> > >  recipes-bsp/starterware/starterware_git.bb    |   2 +-
> > >  recipes-bsp/tcp3d-lld/tcp3d-lld-rtos_git.bb   |   4 +-
> > >  .../ti-ocf-crypto-module_1.0.bb               |   6 +-
> > >  recipes-bsp/ti-sci-fw/ti-sci-fw-source_git.bb |   4 +-
> > >  recipes-bsp/ti-sci-fw/ti-sci-fw_0.1.1.50.bb   |   2 +-
> > >  recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb        |  14 +-
> > >  .../traceframework/traceframework-rtos_git.bb |   2 +-
> > >  .../traceframework/traceframework_git.bb      |   4 +-
> > >  .../transport-rtos/bmet-eth-rtos_git.bb       |   2 +-
> > >  .../transport-rtos/nimu-icss-rtos_git.bb      |  10 +-
> > >  recipes-bsp/transport-rtos/nimu-rtos_git.bb   |  28 ++--
> > >  .../transport-rtos/timesync-rtos_git.bb       |   4 +-
> > >  .../trusted-firmware-a_%.bbappend             |   4 +-
> > >  recipes-bsp/u-boot/u-boot-ti.inc              |  26 ++--
> > >  recipes-bsp/uart-lld/uart-lld-rtos_git.bb     |  14 +-
> > >  recipes-bsp/udma-lld/udma-lld-rtos_git.bb     |   6 +-
> > >  .../uio-module-drv/uio-module-drv-test_git.bb |  12 +-
> > >  .../uio-module-drv/uio-module-drv_git.bb      |   6 +-
> > >  recipes-bsp/usb-lld/usb-lld-rtos_git.bb       |   8 +-
> > >  recipes-bsp/vis-fw/vis_01.50.07.15.bb         |   8 +-
> > >  recipes-bsp/vpdma-fw/vpdma-fw_03-2012.bb      |   2 +-
> > >  recipes-bsp/vps-lld/vps-lld-rtos_git.bb       |   6 +-
> > >  recipes-bsp/wl18xx-fw/wl18xx-fw_8.9.0.0.86.bb |   2 +-
> > >  recipes-bsp/x-load/x-load.inc                 |   2 +-
> > >  recipes-bsp/x-load/x-load_1.46-psp.bb         |   4 +-
> > >  recipes-bsp/x-load/x-load_git.bb              |   4 +-
> > >  .../wl18xx-calibrator_8.7.3.bb                |   2 +-
> > >  .../wl18xx-target-scripts_8.7.3.bb            |   2 +-
> > >  recipes-connectivity/wlconf/wlconf_8.7.3.bb   |   4 +-
> > >  .../init-ifupdown/init-ifupdown_1.0.bbappend  |   2 +-
> > >  recipes-core/udev/eudev_%.bbappend            |   8 +-
> > >  recipes-devtools/gdbc6x/gdbc6x_git.bb         |   4 +-
> > >  recipes-devtools/gdbc6x/gdbserver-c6x_git.bb  |   4 +-
> > >  .../gdbc6x/gdbserverproxy-module-drv_git.bb   |   4 +-
> > >  .../libgal/ti-gc320-libs_5.0.11.p7.bb         |   4 +-
> > >  .../ti-img-rogue-umlibs_1.13.5776728.bb       |  38 +++---
> > >  .../libgles/ti-sgx-ddk-um_1.17.4948957.bb     |  36 +++---
> > >  recipes-kernel/kselftests/kselftests_4.10.bb  | 122 +++++++++---------
> > >  recipes-kernel/linux/bundle-devicetree.inc    |   2 +-
> > >  recipes-kernel/linux/kernel-rdepends.inc      |  40 +++---
> > >  recipes-kernel/linux/linux-ti-mainline_git.bb |  12 +-
> > >  .../linux/linux-ti-staging-rt_5.10.bb         |   2 +-
> > >  .../linux/linux-ti-staging-rt_5.4.bb          |   2 +-
> > >  .../linux/linux-ti-staging-systest_5.10.bb    |   2 +-
> > >  .../linux/linux-ti-staging-systest_5.4.bb     |   2 +-
> > >  recipes-kernel/linux/linux-ti-staging_5.10.bb |   8 +-
> > >  recipes-kernel/linux/linux-ti-staging_5.4.bb  |   8 +-
> > >  recipes-kernel/linux/ti-uio.inc               |  32 ++---
> > >  recipes-security/optee/optee-os_%.bbappend    |  22 ++--
> > >  recipes-ti/beagleboard/beaglebone-capes.bb    |   2 +-
> > >  .../beagleboard/beaglebone-getting-started.bb |   4 +-
> > >  recipes-ti/beagleboard/gadget-init.bb         |  10 +-
> > >  recipes-ti/bios/ti-biosutils_1.02.02.bb       |   2 +-
> > >  recipes-ti/bios/ti-sysbios.inc                |   6 +-
> > >  .../ti-codec-engine_3.24.00.08.bb             |   4 +-
> > >  recipes-ti/ctoolslib/libaet_git.bb            |   4 +-
> > >  .../gcc-arm-baremetal_7-2018-q2-update.bb     |   6 +-
> > >  .../gcc-linaro-baremetal-aarch64-native.bb    |   8 +-
> > >  .../devtools/gcc-linaro-baremetal-native.bb   |   8 +-
> > >  recipes-ti/devtools/ti-cg-xml_2.61.00.bb      |   4 +-
> > >  recipes-ti/devtools/ti-cgt-arm_18.12.5.bb     |   8 +-
> > >  recipes-ti/devtools/ti-cgt-pru_2.3.2.bb       |  16 +--
> > >  recipes-ti/devtools/ti-cgt470.inc             |   2 +-
> > >  recipes-ti/devtools/ti-cgt6x-7_7.4.16.bb      |   6 +-
> > >  recipes-ti/devtools/ti-cgt6x_8.3.2.bb         |  22 ++--
> > >  recipes-ti/devtools/ti-cgt7x_1.2.0.bb         |   8 +-
> > >  recipes-ti/devtools/ti-xdctools-common.inc    |   8 +-
> > >  recipes-ti/dmai/ti-dmai.inc                   |  38 +++---
> > >  recipes-ti/dmai/ti-dmai_svn.bb                |   6 +-
> > >  recipes-ti/dsplib/dsplib.inc                  |   8 +-
> > >  .../ti-framework-components.inc               |   6 +-
> > >  recipes-ti/imglib/imglib-c66x.inc             |   8 +-
> > >  recipes-ti/includes/ti-staging.inc            |   4 +-
> > >  recipes-ti/includes/ti-unpack.inc             |   4 +-
> > >  .../ipc/ipc-transport-common-rtos_git.bb      |   2 +-
> > >  recipes-ti/ipc/ipc-transport-qmss-rtos_git.bb |   4 +-
> > >  recipes-ti/ipc/ipc-transport-qmss.inc         |   2 +-
> > >  recipes-ti/ipc/ipc-transport-srio-rtos_git.bb |   4 +-
> > >  recipes-ti/ipc/ipc-transport-srio.inc         |   2 +-
> > >  recipes-ti/ipc/ti-ipc-examples-linux_git.bb   |   6 +-
> > >  recipes-ti/ipc/ti-ipc-examples.inc            |   4 +-
> > >  recipes-ti/ipc/ti-ipc-examples_git.bb         |   6 +-
> > >  recipes-ti/ipc/ti-ipc-rtos.inc                |   8 +-
> > >  recipes-ti/ipc/ti-ipc-rtos_git.bb             |  22 ++--
> > >  recipes-ti/ipc/ti-ipc_git.bb                  |  10 +-
> > >  recipes-ti/linuxutils/ti-linuxutils.inc       |  14 +-
> > >  .../linuxutils/ti-linuxutils_2.26.01.02.bb    |   2 +-
> > >  recipes-ti/mathlib/mathlib.inc                |   8 +-
> > >  recipes-ti/mpm-transport/mpm-transport_git.bb |  12 +-
> > >  .../multiprocmgr/multiprocmgr-rtos_git.bb     |  12 +-
> > >  .../multiprocmgr/multiprocmgr-test_git.bb     |  10 +-
> > >  recipes-ti/multiprocmgr/multiprocmgr_git.bb   |   4 +-
> > >  recipes-ti/ndk/ti-ndk.inc                     |   6 +-
> > >  recipes-ti/ns/ti-ns.inc                       |   6 +-
> > >  recipes-ti/openmp-rtos/openmp-rtos_git.bb     |  12 +-
> > >  recipes-ti/osal/ti-osal.inc                   |   6 +-
> > >  recipes-ti/swtools/swtools_git.bb             |   8 +-
> > >  .../ti-pdk-build/ti-pdk-build-rtos_git.bb     |   4 +-
> > >  recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb    |  20 +--
> > >  recipes-ti/udma/udma_git.bb                   |   4 +-
> > >  .../uio-test-pruss/uio-test-pruss_git.bb      |   8 +-
> > >  recipes-ti/vlib/vlib-c66x.inc                 |   6 +-
> > >  recipes-ti/xdais/ti-xdais.inc                 |   6 +-
> > >  recipes-ti/xdais/ti-xdais_6.26.01.03.bb       |   2 +-
> > >  251 files changed, 833 insertions(+), 833 deletions(-)
> > >
> > > diff --git a/classes/ti-pdk-fetch.bbclass b/classes/ti-pdk-fetch.bbclass
> > > index cacd71a4..e4c55e33 100644
> > > --- a/classes/ti-pdk-fetch.bbclass
> > > +++ b/classes/ti-pdk-fetch.bbclass
> > > @@ -18,7 +18,7 @@ TI_PDK_SOURCE = "${TI_PDK_SOURCE_WORKDIR}/git"
> > >  S = "${@'${WORKDIR}/git/${TI_PDK_COMP_PATH}'.rstrip('/')}"
> > >
> > >  # Hard-link only required sources from PDK
> > > -python do_unpack_append() {
> > > +python do_unpack:append() {
> > >      if len(d.getVar('TI_PDK_COMP') or '') > 0:
> > >          import shutil
> > >
> > > diff --git a/classes/ti-pdk.bbclass b/classes/ti-pdk.bbclass
> > > index 68314215..21dd3ade 100644
> > > --- a/classes/ti-pdk.bbclass
> > > +++ b/classes/ti-pdk.bbclass
> > > @@ -5,14 +5,14 @@ inherit perlnative
> > >
> > >  DEPENDS = "ti-xdctools-native ti-cg-xml-native ti-sysbios
> > common-csl-ip-rtos libxml-simple-perl-native gcc-arm-baremetal-native
> > ti-cgt6x-native ti-cgt-pru-native ti-pdk-build-rtos doxygen-native"
> > >
> > > -DEPENDS_append_omap-a15 = " ti-cgt-arm-native"
> > > -DEPENDS_remove_ti33x = "ti-cgt6x-native"
> > > -DEPENDS_remove_ti43x = "ti-cgt6x-native"
> > > -DEPENDS_append_omapl1 = " ti-cgt-arm-native"
> > > -DEPENDS_remove_am65xx = "gcc-arm-baremetal-native ti-cgt6x-native"
> > > -DEPENDS_append_am65xx = " ti-cgt-arm-native
> > gcc-linaro-baremetal-aarch64-native"
> > > -DEPENDS_remove_j7 = "gcc-arm-baremetal-native"
> > > -DEPENDS_append_j7 = " ti-cgt-arm-native
> > gcc-linaro-baremetal-aarch64-native ti-cgt7x-native"
> > > +DEPENDS:append_omap-a15 = " ti-cgt-arm-native"
> > > +DEPENDS:remove_ti33x = "ti-cgt6x-native"
> > > +DEPENDS:remove_ti43x = "ti-cgt6x-native"
> > > +DEPENDS:append_omapl1 = " ti-cgt-arm-native"
> > > +DEPENDS:remove_am65xx = "gcc-arm-baremetal-native ti-cgt6x-native"
> > > +DEPENDS:append_am65xx = " ti-cgt-arm-native
> > gcc-linaro-baremetal-aarch64-native"
> > > +DEPENDS:remove_j7 = "gcc-arm-baremetal-native"
> > > +DEPENDS:append_j7 = " ti-cgt-arm-native
> > gcc-linaro-baremetal-aarch64-native ti-cgt7x-native"
> > >
> > >  S = "${WORKDIR}/git"
> > >  B = "${WORKDIR}/build"
> > > @@ -141,4 +141,4 @@ do_install () {
> > >      fi
> > >  }
> > >
> > > -FILES_${PN} += "${PDK_INSTALL_DIR_RECIPE}/packages"
> > > +FILES:${PN} += "${PDK_INSTALL_DIR_RECIPE}/packages"
> > > diff --git a/conf/machine/am3517-evm.conf b/conf/machine/am3517-evm.conf
> > > index c20e2f6a..f194c648 100644
> > > --- a/conf/machine/am3517-evm.conf
> > > +++ b/conf/machine/am3517-evm.conf
> > > @@ -8,7 +8,7 @@ MACHINE_GUI_CLASS = "smallscreen"
> > >  MACHINE_FEATURES += "touchscreen ethernet"
> > >
> > >  IMAGE_FSTYPES += "ubi tar.xz"
> > > -EXTRA_IMAGECMD_jffs2 = "-lnp -e 0x20000 -s 2048"
> > > +EXTRA_IMAGECMD:jffs2 = "-lnp -e 0x20000 -s 2048"
> > >
> > >  SERIAL_CONSOLES = "115200;ttyS2"
> > >  USE_VT = "2"
> > > diff --git a/conf/machine/am37x-evm.conf b/conf/machine/am37x-evm.conf
> > > index a512c8d0..9750fe64 100644
> > > --- a/conf/machine/am37x-evm.conf
> > > +++ b/conf/machine/am37x-evm.conf
> > > @@ -8,7 +8,7 @@ MACHINE_GUI_CLASS = "smallscreen"
> > >  MACHINE_FEATURES += "touchscreen ethernet"
> > >
> > >  IMAGE_FSTYPES += "ubi tar.xz"
> > > -EXTRA_IMAGECMD_jffs2 = "-lnp -e 0x20000 -s 2048"
> > > +EXTRA_IMAGECMD:jffs2 = "-lnp -e 0x20000 -s 2048"
> > >
> > >  KERNEL_DEVICETREE = "omap3-evm-37xx.dtb"
> > >
> > > diff --git a/conf/machine/am65xx-evm-k3r5-sr2.conf
> > b/conf/machine/am65xx-evm-k3r5-sr2.conf
> > > index c0b3cd51..e74dd3ab 100644
> > > --- a/conf/machine/am65xx-evm-k3r5-sr2.conf
> > > +++ b/conf/machine/am65xx-evm-k3r5-sr2.conf
> > > @@ -5,7 +5,7 @@
> > >  # Booting SR2 requires different SYSFW, the rest is handled at runtime
> > >
> > >  require conf/machine/am65xx-evm-k3r5.conf
> > > -SOC_FAMILY_append = ":k3r5-sr2"
> > > +SOC_FAMILY:append = ":k3r5-sr2"
> > >
> > >  SYSFW_SOC = "am65x_sr2"
> > >  SYSFW_SYMLINK = "sysfw.itb"
> > > diff --git a/conf/machine/am65xx-hs-evm-k3r5-sr2.conf
> > b/conf/machine/am65xx-hs-evm-k3r5-sr2.conf
> > > index ef1b6fbe..ff1645e4 100644
> > > --- a/conf/machine/am65xx-hs-evm-k3r5-sr2.conf
> > > +++ b/conf/machine/am65xx-hs-evm-k3r5-sr2.conf
> > > @@ -5,7 +5,7 @@
> > >  # Booting SR2 requires different SYSFW, the rest is handled at runtime
> > >
> > >  require conf/machine/am65xx-hs-evm-k3r5.conf
> > > -SOC_FAMILY_append = ":k3r5-sr2"
> > > +SOC_FAMILY:append = ":k3r5-sr2"
> > >
> > >  SYSFW_SOC = "am65x_sr2"
> > >  SYSFW_SYMLINK = "sysfw.itb"
> > > diff --git a/conf/machine/beagleboard.conf
> > b/conf/machine/beagleboard.conf
> > > index ee51fd66..06777795 100644
> > > --- a/conf/machine/beagleboard.conf
> > > +++ b/conf/machine/beagleboard.conf
> > > @@ -8,7 +8,7 @@ require conf/machine/include/omap3.inc
> > >  MACHINE_GUI_CLASS = "bigscreen"
> > >
> > >  IMAGE_FSTYPES += "tar.xz ubi"
> > > -EXTRA_IMAGECMD_jffs2 = "-lnp"
> > > +EXTRA_IMAGECMD:jffs2 = "-lnp"
> > >
> > >  KERNEL_DEVICETREE = "omap3-beagle.dtb omap3-beagle-xm.dtb
> > omap3-beagle-xm-ab.dtb"
> > >
> > > diff --git a/conf/machine/beaglebone.conf b/conf/machine/beaglebone.conf
> > > index 896a9d73..dcb14cc9 100644
> > > --- a/conf/machine/beaglebone.conf
> > > +++ b/conf/machine/beaglebone.conf
> > > @@ -13,7 +13,7 @@ MACHINE_GUI_CLASS = "bigscreen"
> > >
> > >  SERIAL_CONSOLES = "115200;ttyS0"
> > >
> > > -IMAGE_INSTALL_append = " kernel-devicetree kernel-image-zimage"
> > > +IMAGE_INSTALL:append = " kernel-devicetree kernel-image-zimage"
> > >
> > >  # Refine the list of device targets for ti-pdk class recipes
> > >  TI_PDK_LIMIT_BOARDS = "bbbAM335x"
> > > diff --git a/conf/machine/include/am64xx.inc
> > b/conf/machine/include/am64xx.inc
> > > index 95fdc79d..18e3757a 100644
> > > --- a/conf/machine/include/am64xx.inc
> > > +++ b/conf/machine/include/am64xx.inc
> > > @@ -1,5 +1,5 @@
> > >  require conf/machine/include/k3.inc
> > > -SOC_FAMILY_append = ":am64xx"
> > > +SOC_FAMILY:append = ":am64xx"
> > >
> > >  MACHINE_FEATURES += "screen touchscreen"
> > >
> > > diff --git a/conf/machine/include/am65xx.inc
> > b/conf/machine/include/am65xx.inc
> > > index 8516ca4c..2838c58f 100644
> > > --- a/conf/machine/include/am65xx.inc
> > > +++ b/conf/machine/include/am65xx.inc
> > > @@ -1,5 +1,5 @@
> > >  require conf/machine/include/k3.inc
> > > -SOC_FAMILY_append = ":am65xx"
> > > +SOC_FAMILY:append = ":am65xx"
> > >
> > >  MACHINE_FEATURES += "screen touchscreen gpu"
> > >
> > > diff --git a/conf/machine/include/c66x.inc
> > b/conf/machine/include/c66x.inc
> > > index e35f2eda..33a657f1 100644
> > > --- a/conf/machine/include/c66x.inc
> > > +++ b/conf/machine/include/c66x.inc
> > > @@ -1,5 +1,5 @@
> > >  require conf/machine/include/keystone.inc
> > > -SOC_FAMILY_append = ":c66x"
> > > +SOC_FAMILY:append = ":c66x"
> > >
> > >  # HACK: The c66x family is composed of devices with only DSP cores, and
> > no ARM
> > >  #       cores. The Linux kernel is not supported on these machines.
> > > diff --git a/conf/machine/include/davinci.inc
> > b/conf/machine/include/davinci.inc
> > > index 62ca6887..d2681740 100644
> > > --- a/conf/machine/include/davinci.inc
> > > +++ b/conf/machine/include/davinci.inc
> > > @@ -17,6 +17,6 @@ UBOOT_LOADADDRESS = "0x80008000"
> > >  EXTRA_IMAGEDEPENDS += "u-boot"
> > >
> > >  SERIAL_CONSOLES ?= "115200;ttyS0"
> > > -EXTRA_IMAGECMD_jffs2 = "--pad --little-endian --eraseblock=0x20000 -n"
> > > +EXTRA_IMAGECMD:jffs2 = "--pad --little-endian --eraseblock=0x20000 -n"
> > >
> > >  MACHINE_FEATURES = "kernel26 serial ethernet usbhost usbgadget mmc alsa"
> > > diff --git a/conf/machine/include/dra7xx.inc
> > b/conf/machine/include/dra7xx.inc
> > > index 857e1b35..a02421d9 100644
> > > --- a/conf/machine/include/dra7xx.inc
> > > +++ b/conf/machine/include/dra7xx.inc
> > > @@ -1,4 +1,4 @@
> > >  require conf/machine/include/omap-a15.inc
> > > -SOC_FAMILY_append = ":dra7xx"
> > > +SOC_FAMILY:append = ":dra7xx"
> > >
> > >  MACHINE_FEATURES += "pci"
> > > diff --git a/conf/machine/include/j7.inc b/conf/machine/include/j7.inc
> > > index d3eda1a8..cf5f6a94 100644
> > > --- a/conf/machine/include/j7.inc
> > > +++ b/conf/machine/include/j7.inc
> > > @@ -1,5 +1,5 @@
> > >  require conf/machine/include/k3.inc
> > > -SOC_FAMILY_append = ":j7"
> > > +SOC_FAMILY:append = ":j7"
> > >
> > >  OPTEEMACHINE = "k3-j721e"
> > >  OPTEEOUTPUTMACHINE = "k3"
> > > diff --git a/conf/machine/include/k2e.inc b/conf/machine/include/k2e.inc
> > > index 6797fb29..a6d58bb3 100644
> > > --- a/conf/machine/include/k2e.inc
> > > +++ b/conf/machine/include/k2e.inc
> > > @@ -1,5 +1,5 @@
> > >  require conf/machine/include/keystone.inc
> > > -SOC_FAMILY_append = ":k2e"
> > > +SOC_FAMILY:append = ":k2e"
> > >
> > >  # Set the list of device targets for ti-pdk class recipes
> > >  TI_PDK_LIMIT_SOCS = "k2e"
> > > diff --git a/conf/machine/include/k2g.inc b/conf/machine/include/k2g.inc
> > > index 7bcc412b..be40d9e7 100644
> > > --- a/conf/machine/include/k2g.inc
> > > +++ b/conf/machine/include/k2g.inc
> > > @@ -1,5 +1,5 @@
> > >  require conf/machine/include/keystone.inc
> > > -SOC_FAMILY_append = ":k2g"
> > > +SOC_FAMILY:append = ":k2g"
> > >
> > >  # Set the list of device targets for ti-pdk class recipes
> > >  TI_PDK_LIMIT_SOCS = "k2g"
> > > diff --git a/conf/machine/include/k2hk.inc
> > b/conf/machine/include/k2hk.inc
> > > index 2d2dd6a0..456fda75 100644
> > > --- a/conf/machine/include/k2hk.inc
> > > +++ b/conf/machine/include/k2hk.inc
> > > @@ -1,5 +1,5 @@
> > >  require conf/machine/include/keystone.inc
> > > -SOC_FAMILY_append = ":k2hk"
> > > +SOC_FAMILY:append = ":k2hk"
> > >
> > >  # Set the list of device targets for ti-pdk class recipes
> > >  TI_PDK_LIMIT_SOCS = "k2h k2k"
> > > diff --git a/conf/machine/include/k2l.inc b/conf/machine/include/k2l.inc
> > > index 997bcbe2..b6a4bc7d 100644
> > > --- a/conf/machine/include/k2l.inc
> > > +++ b/conf/machine/include/k2l.inc
> > > @@ -1,5 +1,5 @@
> > >  require conf/machine/include/keystone.inc
> > > -SOC_FAMILY_append = ":k2l"
> > > +SOC_FAMILY:append = ":k2l"
> > >
> > >  # Set the list of device targets for ti-pdk class recipes
> > >  TI_PDK_LIMIT_SOCS = "k2l"
> > > diff --git a/conf/machine/include/k3.inc b/conf/machine/include/k3.inc
> > > index e0970698..20ab7a9e 100644
> > > --- a/conf/machine/include/k3.inc
> > > +++ b/conf/machine/include/k3.inc
> > > @@ -1,7 +1,7 @@
> > >  # TI K3 Aarch64 profile for Cortex-A53/A72 cores
> > >
> > >  require conf/machine/include/ti-soc.inc
> > > -SOC_FAMILY_append = ":k3"
> > > +SOC_FAMILY:append = ":k3"
> > >
> > >  require conf/machine/include/arm/arch-arm64.inc
> > >
> > > diff --git a/conf/machine/include/k3r5.inc
> > b/conf/machine/include/k3r5.inc
> > > index a32accae..93f08c04 100644
> > > --- a/conf/machine/include/k3r5.inc
> > > +++ b/conf/machine/include/k3r5.inc
> > > @@ -1,7 +1,7 @@
> > >  # TI K3 Armv7 profile for Cortex-R5F cores
> > >
> > >  require conf/machine/include/ti-soc.inc
> > > -SOC_FAMILY_append = ":k3r5"
> > > +SOC_FAMILY:append = ":k3r5"
> > >
> > >  # The closest of existing tunes for Cortex-R5F
> > >  DEFAULTTUNE = "armv7athf"
> > > @@ -20,5 +20,5 @@ UBOOT_BINARY = "tiboot3.${UBOOT_SUFFIX}"
> > >  UBOOT_IMAGE = "tiboot3-${MAINMACHINE}-${PV}-${PR}.${UBOOT_SUFFIX}"
> > >  UBOOT_SYMLINK = "tiboot3-${MAINMACHINE}.${UBOOT_SUFFIX}"
> > >
> > > -PACKAGECONFIG_pn-u-boot-ti-staging = ""
> > > -PACKAGECONFIG_pn-u-boot-ti-mainline = ""
> > > +PACKAGECONFIG:pn-u-boot-ti-staging = ""
> > > +PACKAGECONFIG:pn-u-boot-ti-mainline = ""
> > > diff --git a/conf/machine/include/keystone.inc
> > b/conf/machine/include/keystone.inc
> > > index e7ea9758..83dca19d 100644
> > > --- a/conf/machine/include/keystone.inc
> > > +++ b/conf/machine/include/keystone.inc
> > > @@ -1,5 +1,5 @@
> > >  require conf/machine/include/ti-soc.inc
> > > -SOC_FAMILY_append = ":keystone"
> > > +SOC_FAMILY:append = ":keystone"
> > >
> > >  DEFAULTTUNE ?= "armv7athf-neon"
> > >  require conf/machine/include/tune-cortexa15.inc
> > > diff --git a/conf/machine/include/omap-a15.inc
> > b/conf/machine/include/omap-a15.inc
> > > index e491d2b5..553835c8 100644
> > > --- a/conf/machine/include/omap-a15.inc
> > > +++ b/conf/machine/include/omap-a15.inc
> > > @@ -1,5 +1,5 @@
> > >  require conf/machine/include/ti-soc.inc
> > > -SOC_FAMILY_append = ":omap-a15"
> > > +SOC_FAMILY:append = ":omap-a15"
> > >
> > >  DEFAULTTUNE ?= "armv7athf-neon"
> > >  require conf/machine/include/tune-cortexa15.inc
> > > diff --git a/conf/machine/include/omap3.inc
> > b/conf/machine/include/omap3.inc
> > > index 5696c82d..ab069b00 100644
> > > --- a/conf/machine/include/omap3.inc
> > > +++ b/conf/machine/include/omap3.inc
> > > @@ -1,5 +1,5 @@
> > >  require conf/machine/include/ti-soc.inc
> > > -SOC_FAMILY_append = ":omap3"
> > > +SOC_FAMILY:append = ":omap3"
> > >
> > >  DEFAULTTUNE ?= "armv7athf-neon"
> > >  require conf/machine/include/tune-cortexa8.inc
> > > diff --git a/conf/machine/include/omap4.inc
> > b/conf/machine/include/omap4.inc
> > > index cbca267c..b6f43744 100644
> > > --- a/conf/machine/include/omap4.inc
> > > +++ b/conf/machine/include/omap4.inc
> > > @@ -1,5 +1,5 @@
> > >  require conf/machine/include/ti-soc.inc
> > > -SOC_FAMILY_append = ":omap4"
> > > +SOC_FAMILY:append = ":omap4"
> > >
> > >  DEFAULTTUNE ?= "armv7athf-neon"
> > >  require conf/machine/include/tune-cortexa9.inc
> > > diff --git a/conf/machine/include/omapl1.inc
> > b/conf/machine/include/omapl1.inc
> > > index 9942c944..d0262c3f 100644
> > > --- a/conf/machine/include/omapl1.inc
> > > +++ b/conf/machine/include/omapl1.inc
> > > @@ -1,2 +1,2 @@
> > >  require conf/machine/include/ti-soc.inc
> > > -SOC_FAMILY_append = ":omapl1"
> > > +SOC_FAMILY:append = ":omapl1"
> > > diff --git a/conf/machine/include/omapl137.inc
> > b/conf/machine/include/omapl137.inc
> > > index 5d8a6dd8..6dd49418 100644
> > > --- a/conf/machine/include/omapl137.inc
> > > +++ b/conf/machine/include/omapl137.inc
> > > @@ -1,5 +1,5 @@
> > >  require conf/machine/include/omapl1.inc
> > > -SOC_FAMILY_append = ":omapl137"
> > > +SOC_FAMILY:append = ":omapl137"
> > >
> > >  # Set the list of device targets for ti-pdk class recipes
> > >  TI_PDK_LIMIT_SOCS = "omapl137"
> > > diff --git a/conf/machine/include/omapl138.inc
> > b/conf/machine/include/omapl138.inc
> > > index 999cbc3a..f73517d0 100644
> > > --- a/conf/machine/include/omapl138.inc
> > > +++ b/conf/machine/include/omapl138.inc
> > > @@ -1,5 +1,5 @@
> > >  require conf/machine/include/omapl1.inc
> > > -SOC_FAMILY_append = ":omapl138"
> > > +SOC_FAMILY:append = ":omapl138"
> > >
> > >  # Set the list of device targets for ti-pdk class recipes
> > >  TI_PDK_LIMIT_SOCS = "omapl138"
> > > diff --git a/conf/machine/include/ti33x.inc
> > b/conf/machine/include/ti33x.inc
> > > index 6dfda754..3da2aba5 100644
> > > --- a/conf/machine/include/ti33x.inc
> > > +++ b/conf/machine/include/ti33x.inc
> > > @@ -1,5 +1,5 @@
> > >  require conf/machine/include/ti-soc.inc
> > > -SOC_FAMILY_append = ":ti33x"
> > > +SOC_FAMILY:append = ":ti33x"
> > >
> > >  DEFAULTTUNE ?= "armv7athf-neon"
> > >  require conf/machine/include/tune-cortexa8.inc
> > > diff --git a/conf/machine/include/ti43x.inc
> > b/conf/machine/include/ti43x.inc
> > > index b1a27f93..eaed1812 100644
> > > --- a/conf/machine/include/ti43x.inc
> > > +++ b/conf/machine/include/ti43x.inc
> > > @@ -1,5 +1,5 @@
> > >  require conf/machine/include/ti-soc.inc
> > > -SOC_FAMILY_append = ":ti43x"
> > > +SOC_FAMILY:append = ":ti43x"
> > >
> > >  DEFAULTTUNE ?= "armv7athf-neon"
> > >  require conf/machine/include/tune-cortexa9.inc
> > > diff --git a/conf/machine/omap3evm.conf b/conf/machine/omap3evm.conf
> > > index 01808b68..dc56d57a 100644
> > > --- a/conf/machine/omap3evm.conf
> > > +++ b/conf/machine/omap3evm.conf
> > > @@ -8,7 +8,7 @@ MACHINE_GUI_CLASS = "smallscreen"
> > >  MACHINE_FEATURES += "touchscreen ethernet"
> > >
> > >  IMAGE_FSTYPES += "jffs2 tar.xz"
> > > -EXTRA_IMAGECMD_jffs2 = "-lnp -e 0x20000 -s 2048"
> > > +EXTRA_IMAGECMD:jffs2 = "-lnp -e 0x20000 -s 2048"
> > >
> > >  SERIAL_CONSOLES = "115200;ttyS0"
> > >  USE_VT = "0"
> > > diff --git a/conf/multiconfig/k3r5-sr2.conf
> > b/conf/multiconfig/k3r5-sr2.conf
> > > index 17082141..e933b9cc 100644
> > > --- a/conf/multiconfig/k3r5-sr2.conf
> > > +++ b/conf/multiconfig/k3r5-sr2.conf
> > > @@ -1,3 +1,3 @@
> > >  require k3r5.conf
> > >
> > > -MACHINE_append = "-sr2"
> > > +MACHINE:append = "-sr2"
> > > diff --git a/conf/multiconfig/k3r5.conf b/conf/multiconfig/k3r5.conf
> > > index 8c8f0c3f..deb07210 100644
> > > --- a/conf/multiconfig/k3r5.conf
> > > +++ b/conf/multiconfig/k3r5.conf
> > > @@ -2,4 +2,4 @@ MAINMACHINE := "${MACHINE}"
> > >
> > >  DEPLOY_DIR_IMAGE = "${DEPLOY_DIR}/images/${MAINMACHINE}"
> > >
> > > -MACHINE_append = "-k3r5"
> > > +MACHINE:append = "-k3r5"
> > > diff --git a/recipes-bsp/abefw/abefw_1.0.14.bb b/recipes-bsp/abefw/
> > abefw_1.0.14.bb
> > > index 302bdcde..a6cc624a 100644
> > > --- a/recipes-bsp/abefw/abefw_1.0.14.bb
> > > +++ b/recipes-bsp/abefw/abefw_1.0.14.bb
> > > @@ -20,4 +20,4 @@ do_install() {
> > >          cp ${S}/firmware/omap4_abe_new ${D}/lib/firmware/
> > >  }
> > >
> > > -FILES_${PN} += "/lib/firmware/omap4_abe_new"
> > > +FILES:${PN} += "/lib/firmware/omap4_abe_new"
> > > diff --git a/recipes-bsp/aif2-lld/aif2-lld-rtos_git.bb
> > b/recipes-bsp/aif2-lld/aif2-lld-rtos_git.bb
> > > index 962965b0..048a2430 100644
> > > --- a/recipes-bsp/aif2-lld/aif2-lld-rtos_git.bb
> > > +++ b/recipes-bsp/aif2-lld/aif2-lld-rtos_git.bb
> > > @@ -6,7 +6,7 @@ require recipes-bsp/aif2-lld/aif2-lld.inc
> > >
> > >  PR = "${INC_PR}.0"
> > >
> > > -DEPENDS_append = " qmss-lld-rtos \
> > > +DEPENDS:append = " qmss-lld-rtos \
> > >                     cppi-lld-rtos \
> > >  "
> > >
> > > diff --git a/recipes-bsp/aif2-lld/aif2-lld-test_git.bb
> > b/recipes-bsp/aif2-lld/aif2-lld-test_git.bb
> > > index 9180b953..d4328621 100644
> > > --- a/recipes-bsp/aif2-lld/aif2-lld-test_git.bb
> > > +++ b/recipes-bsp/aif2-lld/aif2-lld-test_git.bb
> > > @@ -6,7 +6,7 @@ include aif2-lld.inc
> > >
> > >  PR = "${INC_PR}.0"
> > >
> > > -EXTRA_OEMAKE = "-f makefile_armv7 PDK_INSTALL_PATH=${STAGING_INCDIR}
> > AIF2_SRC_DIR=${WORKDIR}/git"
> > > +EXTRA_OEMAKE = "-f makefile:armv7 PDK_INSTALL_PATH=${STAGING_INCDIR}
> > AIF2_SRC_DIR=${WORKDIR}/git"
> > >
> > >  do_compile () {
> > >      oe_runmake clean DEVICE=k2hk
> > > diff --git a/recipes-bsp/aif2-lld/aif2-lld_git.bb
> > b/recipes-bsp/aif2-lld/aif2-lld_git.bb
> > > index 4a640f1b..d9283a3a 100644
> > > --- a/recipes-bsp/aif2-lld/aif2-lld_git.bb
> > > +++ b/recipes-bsp/aif2-lld/aif2-lld_git.bb
> > > @@ -6,7 +6,7 @@ include aif2-lld.inc
> > >
> > >  PR = "${INC_PR}.0"
> > >
> > > -EXTRA_OEMAKE = "-f makefile_armv7 PDK_INSTALL_PATH=${STAGING_INCDIR}"
> > > +EXTRA_OEMAKE = "-f makefile:armv7 PDK_INSTALL_PATH=${STAGING_INCDIR}"
> > >
> > >  do_compile () {
> > >      oe_runmake lib DEVICE=k2hk
> > > diff --git a/recipes-bsp/alsa-state/alsa-state.bbappend
> > b/recipes-bsp/alsa-state/alsa-state.bbappend
> > > index 72d991c7..4fc41d05 100644
> > > --- a/recipes-bsp/alsa-state/alsa-state.bbappend
> > > +++ b/recipes-bsp/alsa-state/alsa-state.bbappend
> > > @@ -1 +1 @@
> > > -FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
> > > +FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
> > > diff --git a/recipes-bsp/audk2g-addon/audk2g-addon-rtos_git.bb
> > b/recipes-bsp/audk2g-addon/audk2g-addon-rtos_git.bb
> > > index 0cb9ff17..e40fb43c 100644
> > > --- a/recipes-bsp/audk2g-addon/audk2g-addon-rtos_git.bb
> > > +++ b/recipes-bsp/audk2g-addon/audk2g-addon-rtos_git.bb
> > > @@ -25,7 +25,7 @@ PR = "r0"
> > >
> > >  S = "${WORKDIR}/git/ti/addon/audk2g"
> > >
> > > -DEPENDS_append = " ti-sysbios \
> > > +DEPENDS:append = " ti-sysbios \
> > >              gpio-lld-rtos \
> > >              i2c-lld-rtos \
> > >              board-rtos \
> > > diff --git a/recipes-bsp/bcp-lld/bcp-lld-rtos_git.bb
> > b/recipes-bsp/bcp-lld/bcp-lld-rtos_git.bb
> > > index 62cee07b..d808267b 100644
> > > --- a/recipes-bsp/bcp-lld/bcp-lld-rtos_git.bb
> > > +++ b/recipes-bsp/bcp-lld/bcp-lld-rtos_git.bb
> > > @@ -15,7 +15,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
> > >  PR = "r0"
> > >
> > >
> > > -DEPENDS_append = " qmss-lld-rtos \
> > > +DEPENDS:append = " qmss-lld-rtos \
> > >                     cppi-lld-rtos \
> > >  "
> > >
> > > diff --git a/recipes-bsp/board-rtos/board-rtos_git.bb
> > b/recipes-bsp/board-rtos/board-rtos_git.bb
> > > index a6547d38..485b0656 100644
> > > --- a/recipes-bsp/board-rtos/board-rtos_git.bb
> > > +++ b/recipes-bsp/board-rtos/board-rtos_git.bb
> > > @@ -16,24 +16,24 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
> > >
> > >  PR = "r0"
> > >
> > > -DEPENDS_append = " i2c-lld-rtos \
> > > +DEPENDS:append = " i2c-lld-rtos \
> > >                     spi-lld-rtos \
> > >                     uart-lld-rtos \
> > >                     osal-rtos \
> > >  "
> > >
> > > -DEPENDS_append_omap-a15 = " ti-ndk \
> > > +DEPENDS:append_omap-a15 = " ti-ndk \
> > >                              mmcsd-lld-rtos \
> > >                              pm-lld-rtos \
> > >  "
> > >
> > > -DEPENDS_append_am57xx-evm = " gpio-lld-rtos \
> > > +DEPENDS:append_am57xx-evm = " gpio-lld-rtos \
> > >                                icss-emac-lld-rtos \
> > >                                pruss-lld-rtos \
> > >  "
> > >
> > >
> > > -DEPENDS_append_ti33x = " gpio-lld-rtos \
> > > +DEPENDS:append_ti33x = " gpio-lld-rtos \
> > >                           gpmc-lld-rtos \
> > >                           icss-emac-lld-rtos \
> > >                           mmcsd-lld-rtos \
> > > @@ -42,7 +42,7 @@ DEPENDS_append_ti33x = " gpio-lld-rtos \
> > >                           ti-ndk \
> > >  "
> > >
> > > -DEPENDS_append_ti43x = " gpio-lld-rtos \
> > > +DEPENDS:append_ti43x = " gpio-lld-rtos \
> > >                           gpmc-lld-rtos \
> > >                           icss-emac-lld-rtos \
> > >                           mmcsd-lld-rtos \
> > > @@ -51,13 +51,13 @@ DEPENDS_append_ti43x = " gpio-lld-rtos \
> > >                           ti-ndk \
> > >  "
> > >
> > > -DEPENDS_append_dra7xx = " pm-lld-rtos \
> > > +DEPENDS:append_dra7xx = " pm-lld-rtos \
> > >                            mmcsd-lld-rtos \
> > >  "
> > >
> > > -DEPENDS_append_am65xx = " sciclient-rtos \
> > > +DEPENDS:append_am65xx = " sciclient-rtos \
> > >  "
> > > -DEPENDS_append_j7 = " udma-lld-rtos \
> > > +DEPENDS:append_j7 = " udma-lld-rtos \
> > >                            sciclient-rtos \
> > >                            mmcsd-lld-rtos \
> > >  "
> > > @@ -71,6 +71,6 @@ INHIBIT_PACKAGE_STRIP = "1"
> > >  export PDK_BOARD_ROOT_PATH ="${WORKDIR}/build"
> > >  export DEST_ROOT="${S}"
> > >
> > > -XDCPATH_append =
> > ";${PDK_INSTALL_DIR}/packages/ti/csl;${NDK_INSTALL_DIR}/packages"
> > > +XDCPATH:append =
> > ";${PDK_INSTALL_DIR}/packages/ti/csl;${NDK_INSTALL_DIR}/packages"
> > >
> > > -INSANE_SKIP_${PN} = "arch"
> > > +INSANE_SKIP:${PN} = "arch"
> > > diff --git a/recipes-bsp/boot-monitor/boot-monitor_git.bb
> > b/recipes-bsp/boot-monitor/boot-monitor_git.bb
> > > index 9c436d1c..dee180ff 100644
> > > --- a/recipes-bsp/boot-monitor/boot-monitor_git.bb
> > > +++ b/recipes-bsp/boot-monitor/boot-monitor_git.bb
> > > @@ -23,7 +23,7 @@ FLOATABI = "${@bb.utils.contains("TUNE_FEATURES",
> > "vfp", bb.utils.contains("TUNE
> > >
> > >  EXTRA_OEMAKE = "CROSS_COMPILE=${TARGET_PREFIX} CC="${TARGET_PREFIX}gcc
> > ${TOOLCHAIN_OPTIONS} ${FLOATABI}" LD="${TARGET_PREFIX}gcc
> > ${TOOLCHAIN_OPTIONS} ${FLOATABI}""
> > >
> > > -FILES_${PN} = "/boot"
> > > +FILES:${PN} = "/boot"
> > >
> > >  inherit deploy
> > >
> > > diff --git a/recipes-bsp/bt-fw/bt-fw_git.bb b/recipes-bsp/bt-fw/
> > bt-fw_git.bb
> > > index f3d740b1..ea42c168 100644
> > > --- a/recipes-bsp/bt-fw/bt-fw_git.bb
> > > +++ b/recipes-bsp/bt-fw/bt-fw_git.bb
> > > @@ -21,4 +21,4 @@ do_install() {
> > >      oe_runmake "DEST_DIR=${D}" "BASE_LIB_DIR=${base_libdir}" install
> > >  }
> > >
> > > -FILES_${PN} += "${base_libdir}/firmware/ti-connectivity/*"
> > > +FILES:${PN} += "${base_libdir}/firmware/ti-connectivity/*"
> > > diff --git a/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb
> > b/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb
> > > index 6d857f7f..ccaa3e6d 100644
> > > --- a/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb
> > > +++ b/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb
> > > @@ -25,4 +25,4 @@ do_install() {
> > >       install -m 0644 ${S}/cadence/${TARGET}
> > ${D}${base_libdir}/firmware/cadence/${TARGET}
> > >  }
> > >
> > > -FILES_${PN} = "${base_libdir}/firmware"
> > > +FILES:${PN} = "${base_libdir}/firmware"
> > > diff --git a/recipes-bsp/cal-lld/cal-lld-rtos_git.bb
> > b/recipes-bsp/cal-lld/cal-lld-rtos_git.bb
> > > index f3c780f6..aef21899 100644
> > > --- a/recipes-bsp/cal-lld/cal-lld-rtos_git.bb
> > > +++ b/recipes-bsp/

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964

