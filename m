Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web09.28184.1628538860873249061
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 09 Aug 2021 12:54:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=q/sA9rf+;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: praneeth@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 179JsII9037541;
	Mon, 9 Aug 2021 14:54:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1628538858;
	bh=RHiUa9ikJsY6DJkA0sI6scPppZmp5TtrSlN9utVJ/Rk=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=q/sA9rf+eMe161O/cAtrvXqAMrdXp500ImH7CQe6wGpc354Mtq4CUa8VejaalMIYI
	 73LelBFif5JtyBwtsTARcstj0f8hY9UeLOWgV6PVbYDt9v4qhdJUa7BZtuZQNJl2gu
	 8ExFaKd0g1N9LSCm0zpSgS0hhQoOZZfSD3uIgQNo=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 179JsIVX098309
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 9 Aug 2021 14:54:18 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Mon, 9 Aug
 2021 14:54:17 -0500
Received: from DLEE110.ent.ti.com ([fe80::546b:3e96:e947:ccce]) by
 DLEE110.ent.ti.com ([fe80::546b:3e96:e947:ccce%20]) with mapi id
 15.01.2176.012; Mon, 9 Aug 2021 14:54:18 -0500
From: "praneeth" <praneeth@ti.com>
To: Khem Raj <raj.khem@gmail.com>
CC: "meta-ti@lists.yoctoproject.org" <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti] [PATCH 1/2] layer: Convert to using new override syntax
Thread-Topic: [meta-ti] [PATCH 1/2] layer: Convert to using new override
 syntax
Thread-Index: AQHXjVZeUGkhPpVOCk6OdsxFrUzR6KtrlgC3
Date: Mon, 9 Aug 2021 19:54:18 +0000
Message-ID: <c99e3f08-bc63-4b59-b41a-ae51df7b1647@email.android.com>
References: <20210809193931.1080811-1-raj.khem@gmail.com>
In-Reply-To: <20210809193931.1080811-1-raj.khem@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_c99e3f08bc634b59b41aae51df7b1647emailandroidcom_"

--_000_c99e3f08bc634b59b41aae51df7b1647emailandroidcom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Khem,
Assuming this series is only for master.

On Aug 9, 2021 2:40 PM, Khem Raj <raj.khem@gmail.com> wrote:
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 classes/ti-pdk-fetch.bbclass                  |   2 +-
 classes/ti-pdk.bbclass                        |  18 +--
 conf/machine/am3517-evm.conf                  |   2 +-
 conf/machine/am37x-evm.conf                   |   2 +-
 conf/machine/am65xx-evm-k3r5-sr2.conf         |   2 +-
 conf/machine/am65xx-hs-evm-k3r5-sr2.conf      |   2 +-
 conf/machine/beagleboard.conf                 |   2 +-
 conf/machine/beaglebone.conf                  |   2 +-
 conf/machine/include/am64xx.inc               |   2 +-
 conf/machine/include/am65xx.inc               |   2 +-
 conf/machine/include/c66x.inc                 |   2 +-
 conf/machine/include/davinci.inc              |   2 +-
 conf/machine/include/dra7xx.inc               |   2 +-
 conf/machine/include/j7.inc                   |   2 +-
 conf/machine/include/k2e.inc                  |   2 +-
 conf/machine/include/k2g.inc                  |   2 +-
 conf/machine/include/k2hk.inc                 |   2 +-
 conf/machine/include/k2l.inc                  |   2 +-
 conf/machine/include/k3.inc                   |   2 +-
 conf/machine/include/k3r5.inc                 |   6 +-
 conf/machine/include/keystone.inc             |   2 +-
 conf/machine/include/omap-a15.inc             |   2 +-
 conf/machine/include/omap3.inc                |   2 +-
 conf/machine/include/omap4.inc                |   2 +-
 conf/machine/include/omapl1.inc               |   2 +-
 conf/machine/include/omapl137.inc             |   2 +-
 conf/machine/include/omapl138.inc             |   2 +-
 conf/machine/include/ti33x.inc                |   2 +-
 conf/machine/include/ti43x.inc                |   2 +-
 conf/machine/omap3evm.conf                    |   2 +-
 conf/multiconfig/k3r5-sr2.conf                |   2 +-
 conf/multiconfig/k3r5.conf                    |   2 +-
 recipes-bsp/abefw/abefw_1.0.14.bb             |   2 +-
 recipes-bsp/aif2-lld/aif2-lld-rtos_git.bb     |   2 +-
 recipes-bsp/aif2-lld/aif2-lld-test_git.bb     |   2 +-
 recipes-bsp/aif2-lld/aif2-lld_git.bb          |   2 +-
 recipes-bsp/alsa-state/alsa-state.bbappend    |   2 +-
 .../audk2g-addon/audk2g-addon-rtos_git.bb     |   2 +-
 recipes-bsp/bcp-lld/bcp-lld-rtos_git.bb       |   2 +-
 recipes-bsp/board-rtos/board-rtos_git.bb      |  20 +--
 recipes-bsp/boot-monitor/boot-monitor_git.bb  |   2 +-
 recipes-bsp/bt-fw/bt-fw_git.bb                |   2 +-
 .../cadence-mhdp-fw/cadence-mhdp-fw_git.bb    |   2 +-
 recipes-bsp/cal-lld/cal-lld-rtos_git.bb       |   6 +-
 recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb   |   2 +-
 recipes-bsp/cmb-addon/cmb-addon-rtos_git.bb   |   2 +-
 recipes-bsp/cmem/cmem-mod_git.bb              |   4 +-
 recipes-bsp/cmem/cmem_git.bb                  |   4 +-
 .../common-csl-ip/common-csl-ip-rtos_git.bb   |  10 +-
 .../common-csl-ip/common-csl-ip_git.bb        |   2 +-
 .../common-csl-ip/csl-rti-dwwdtest-fw_git.bb  |  16 +--
 recipes-bsp/cppi-lld/cppi-lld-rtos_git.bb     |   4 +-
 recipes-bsp/cppi-lld/cppi-lld-test_git.bb     |   6 +-
 recipes-bsp/cppi-lld/cppi-lld_git.bb          |   8 +-
 .../cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb        |   6 +-
 recipes-bsp/cuia/cuia_1.0.0.13.bb             |   2 +-
 recipes-bsp/dfe-lld/dfe-lld-test_git.bb       |   2 +-
 recipes-bsp/dfe-lld/dfe-lld_git.bb            |   2 +-
 recipes-bsp/dspdce-fw/dspdce-fw_git.bb        |   6 +-
 recipes-bsp/dsptop/debugss-module-drv_git.bb  |   4 +-
 recipes-bsp/dsptop/dsptop_git.bb              |   4 +-
 recipes-bsp/dsptop/libulm_git.bb              |   4 +-
 .../dsptop/temperature-module-drv_git.bb      |   4 +-
 recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb   |  10 +-
 recipes-bsp/edma3-lld/edma3-lld_git.bb        |   6 +-
 recipes-bsp/emac-lld/emac-lld-rtos_git.bb     |  12 +-
 recipes-bsp/fatfs-rtos/fatfs-rtos_git.bb      |   2 +-
 .../faultmanagement-rtos_git.bb               |   4 +-
 recipes-bsp/fftc-lld/fftc-lld-rtos_git.bb     |   2 +-
 .../formfactor/formfactor_0.0.bbappend        |   2 +-
 recipes-bsp/fvid2/fvid2-rtos_git.bb           |   6 +-
 .../ti-gc320-driver_5.0.11.p7.bb              |   2 +-
 recipes-bsp/goodix-fw/goodix-fw_git.bb        |   2 +-
 recipes-bsp/gpio-lld/gpio-lld-rtos_git.bb     |   8 +-
 recipes-bsp/gpmc-lld/gpmc-lld-rtos_git.bb     |   6 +-
 recipes-bsp/hplib/hplib-mod_git.bb            |   2 +-
 recipes-bsp/hplib/hplib-test_git.bb           |   2 +-
 recipes-bsp/hplib/hplib_git.bb                |   4 +-
 recipes-bsp/hyplnk-lld/hyplnk-lld-rtos_git.bb |   2 +-
 recipes-bsp/hyplnk-lld/hyplnk-lld-test_git.bb |   6 +-
 recipes-bsp/hyplnk-lld/hyplnk-lld_git.bb      |   6 +-
 recipes-bsp/i2c-lld/i2c-lld-rtos_git.bb       |  14 +-
 recipes-bsp/ibl-boot/ibl-boot-rtos_git.bb     |   6 +-
 .../icss-emac-lld/icss-emac-lld-rtos_git.bb   |   8 +-
 .../icss-emac-lld/icss-emac-lld-test_git.bb   |   6 +-
 .../icss-emac-lld/icss-emac-lld_git.bb        |   2 +-
 recipes-bsp/iolink-lld/iolink-lld-rtos_git.bb |   6 +-
 .../ipc-lld/ipc-lld-examples-rtos_git.bb      |  24 ++--
 recipes-bsp/ipc-lld/ipc-lld-fw_git.bb         |  12 +-
 recipes-bsp/ipc-lld/ipc-lld-rtos_git.bb       |   6 +-
 recipes-bsp/ipc-lld/ipc-lld.inc               |   2 +-
 recipes-bsp/ipumm-fw/ipumm-fw_git.bb          |   6 +-
 recipes-bsp/iqn2-lld/iqn2-lld-test_git.bb     |   2 +-
 recipes-bsp/iqn2-lld/iqn2-lld_git.bb          |   2 +-
 recipes-bsp/mad-utils/mad-utils-rtos_git.bb   |   6 +-
 recipes-bsp/mcasp-lld/mcasp-lld-rtos_git.bb   |  12 +-
 recipes-bsp/mcbsp-lld/mcbsp-lld-rtos_git.bb   |   4 +-
 recipes-bsp/mmap-lld/mmap-lld-test_git.bb     |   8 +-
 recipes-bsp/mmap-lld/mmap-lld_git.bb          |   4 +-
 recipes-bsp/mmcsd-lld/mmcsd-lld-rtos_git.bb   |  12 +-
 recipes-bsp/netcp-pa-fw/netcp-pa-fw_git.bb    |   2 +-
 recipes-bsp/netcp-sa-fw/netcp-sa-fw_git.bb    |   2 +-
 recipes-bsp/nwal-lld/nwal-lld-rtos_git.bb     |   2 +-
 recipes-bsp/nwal-lld/nwal-lld-test_git.bb     |   2 +-
 recipes-bsp/nwal-lld/nwal-lld_git.bb          |   2 +-
 recipes-bsp/osal/osal-rtos_git.bb             |   6 +-
 recipes-bsp/osal/osal-test_git.bb             |   2 +-
 recipes-bsp/osal/osal_git.bb                  |   2 +-
 recipes-bsp/pa-lld/pa-lld-rtos_git.bb         |   4 +-
 recipes-bsp/pa-lld/pa-lld-test_git.bb         |   6 +-
 recipes-bsp/pa-lld/pa-lld_git.bb              |   4 +-
 recipes-bsp/pcie-lld/pcie-lld-rtos_git.bb     |   2 +-
 recipes-bsp/pktlib/pktlib-rtos_git.bb         |   4 +-
 recipes-bsp/pktlib/pktlib_git.bb              |   2 +-
 recipes-bsp/pm-lld/pm-lld-rtos_git.bb         |  16 +--
 .../ti-img-rogue-driver_1.13.5776728.bb       |   2 +-
 .../ti-sgx-ddk-km_1.17.4948957.bb             |   4 +-
 recipes-bsp/pru/pru-icss_git.bb               |  38 +++---
 recipes-bsp/pru/pru-pwm-fw_git.bb             |   4 +-
 recipes-bsp/pru/pru-swuart-fw_git.bb          |   6 +-
 .../pru/ti-pru-sw-edma-driver_1.00.00.bb      |   6 +-
 .../prueth-fw/prueth-fw-am65x-sr2_git.bb      |   4 +-
 recipes-bsp/prueth-fw/prueth-fw-am65x_git.bb  |   4 +-
 recipes-bsp/prueth-fw/prueth-fw_5.6.15.bb     |   4 +-
 recipes-bsp/pruhsr-fw/pruhsr-fw_2.17.25.bb    |   4 +-
 recipes-bsp/pruprp-fw/pruprp-fw_2.17.25.bb    |   4 +-
 recipes-bsp/pruss-lld/pruss-lld-apps_git.bb   |   6 +-
 recipes-bsp/pruss-lld/pruss-lld-rtos_git.bb   |  10 +-
 recipes-bsp/pruss-lld/pruss-lld-test_git.bb   |   2 +-
 recipes-bsp/pruss-lld/pruss-lld_git.bb        |   2 +-
 recipes-bsp/prusw-fw/prusw-fw_3.2.9.bb        |   4 +-
 recipes-bsp/qmss-lld/qmss-lld-rtos_git.bb     |   4 +-
 recipes-bsp/qmss-lld/qmss-lld-test_git.bb     |   6 +-
 recipes-bsp/qmss-lld/qmss-lld_git.bb          |   8 +-
 recipes-bsp/qmss-pdsp-fw/qmss-pdsp-fw_git.bb  |   2 +-
 recipes-bsp/rm-lld/rm-lld-rtos_git.bb         |   2 +-
 recipes-bsp/rm-lld/rm-lld_git.bb              |   8 +-
 recipes-bsp/sa-lld/sa-lld-rtos_git.bb         |   6 +-
 recipes-bsp/sa-lld/sa-lld-test_git.bb         |   4 +-
 recipes-bsp/sa-lld/sa-lld_git.bb              |   2 +-
 recipes-bsp/sciclient/sciclient-rtos_git.bb   |  18 +--
 .../serdes-diag/serdes-diag-rtos_git.bb       |   2 +-
 recipes-bsp/serdes-fw/serdes-fw_git.bb        |   2 +-
 recipes-bsp/spi-lld/spi-lld-rtos_git.bb       |  12 +-
 recipes-bsp/srio-lld/srio-lld-rtos_git.bb     |   4 +-
 recipes-bsp/srio-lld/srio-lld.inc             |   2 +-
 .../starterware/starterware-rtos_git.bb       |   4 +-
 recipes-bsp/starterware/starterware_git.bb    |   2 +-
 recipes-bsp/tcp3d-lld/tcp3d-lld-rtos_git.bb   |   4 +-
 .../ti-ocf-crypto-module_1.0.bb               |   6 +-
 recipes-bsp/ti-sci-fw/ti-sci-fw-source_git.bb |   4 +-
 recipes-bsp/ti-sci-fw/ti-sci-fw_0.1.1.50.bb   |   2 +-
 recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb        |  14 +-
 .../traceframework/traceframework-rtos_git.bb |   2 +-
 .../traceframework/traceframework_git.bb      |   4 +-
 .../transport-rtos/bmet-eth-rtos_git.bb       |   2 +-
 .../transport-rtos/nimu-icss-rtos_git.bb      |  10 +-
 recipes-bsp/transport-rtos/nimu-rtos_git.bb   |  28 ++--
 .../transport-rtos/timesync-rtos_git.bb       |   4 +-
 .../trusted-firmware-a_%.bbappend             |   4 +-
 recipes-bsp/u-boot/u-boot-ti.inc              |  26 ++--
 recipes-bsp/uart-lld/uart-lld-rtos_git.bb     |  14 +-
 recipes-bsp/udma-lld/udma-lld-rtos_git.bb     |   6 +-
 .../uio-module-drv/uio-module-drv-test_git.bb |  12 +-
 .../uio-module-drv/uio-module-drv_git.bb      |   6 +-
 recipes-bsp/usb-lld/usb-lld-rtos_git.bb       |   8 +-
 recipes-bsp/vis-fw/vis_01.50.07.15.bb         |   8 +-
 recipes-bsp/vpdma-fw/vpdma-fw_03-2012.bb      |   2 +-
 recipes-bsp/vps-lld/vps-lld-rtos_git.bb       |   6 +-
 recipes-bsp/wl18xx-fw/wl18xx-fw_8.9.0.0.86.bb |   2 +-
 recipes-bsp/x-load/x-load.inc                 |   2 +-
 recipes-bsp/x-load/x-load_1.46-psp.bb         |   4 +-
 recipes-bsp/x-load/x-load_git.bb              |   4 +-
 .../wl18xx-calibrator_8.7.3.bb                |   2 +-
 .../wl18xx-target-scripts_8.7.3.bb            |   2 +-
 recipes-connectivity/wlconf/wlconf_8.7.3.bb   |   4 +-
 .../init-ifupdown/init-ifupdown_1.0.bbappend  |   2 +-
 recipes-core/udev/eudev_%.bbappend            |   8 +-
 recipes-devtools/gdbc6x/gdbc6x_git.bb         |   4 +-
 recipes-devtools/gdbc6x/gdbserver-c6x_git.bb  |   4 +-
 .../gdbc6x/gdbserverproxy-module-drv_git.bb   |   4 +-
 .../libgal/ti-gc320-libs_5.0.11.p7.bb         |   4 +-
 .../ti-img-rogue-umlibs_1.13.5776728.bb       |  38 +++---
 .../libgles/ti-sgx-ddk-um_1.17.4948957.bb     |  36 +++---
 recipes-kernel/kselftests/kselftests_4.10.bb  | 122 +++++++++---------
 recipes-kernel/linux/bundle-devicetree.inc    |   2 +-
 recipes-kernel/linux/kernel-rdepends.inc      |  40 +++---
 recipes-kernel/linux/linux-ti-mainline_git.bb |  12 +-
 .../linux/linux-ti-staging-rt_5.10.bb         |   2 +-
 .../linux/linux-ti-staging-rt_5.4.bb          |   2 +-
 .../linux/linux-ti-staging-systest_5.10.bb    |   2 +-
 .../linux/linux-ti-staging-systest_5.4.bb     |   2 +-
 recipes-kernel/linux/linux-ti-staging_5.10.bb |   8 +-
 recipes-kernel/linux/linux-ti-staging_5.4.bb  |   8 +-
 recipes-kernel/linux/ti-uio.inc               |  32 ++---
 recipes-security/optee/optee-os_%.bbappend    |  22 ++--
 recipes-ti/beagleboard/beaglebone-capes.bb    |   2 +-
 .../beagleboard/beaglebone-getting-started.bb |   4 +-
 recipes-ti/beagleboard/gadget-init.bb         |  10 +-
 recipes-ti/bios/ti-biosutils_1.02.02.bb       |   2 +-
 recipes-ti/bios/ti-sysbios.inc                |   6 +-
 .../ti-codec-engine_3.24.00.08.bb             |   4 +-
 recipes-ti/ctoolslib/libaet_git.bb            |   4 +-
 .../gcc-arm-baremetal_7-2018-q2-update.bb     |   6 +-
 .../gcc-linaro-baremetal-aarch64-native.bb    |   8 +-
 .../devtools/gcc-linaro-baremetal-native.bb   |   8 +-
 recipes-ti/devtools/ti-cg-xml_2.61.00.bb      |   4 +-
 recipes-ti/devtools/ti-cgt-arm_18.12.5.bb     |   8 +-
 recipes-ti/devtools/ti-cgt-pru_2.3.2.bb       |  16 +--
 recipes-ti/devtools/ti-cgt470.inc             |   2 +-
 recipes-ti/devtools/ti-cgt6x-7_7.4.16.bb      |   6 +-
 recipes-ti/devtools/ti-cgt6x_8.3.2.bb         |  22 ++--
 recipes-ti/devtools/ti-cgt7x_1.2.0.bb         |   8 +-
 recipes-ti/devtools/ti-xdctools-common.inc    |   8 +-
 recipes-ti/dmai/ti-dmai.inc                   |  38 +++---
 recipes-ti/dmai/ti-dmai_svn.bb                |   6 +-
 recipes-ti/dsplib/dsplib.inc                  |   8 +-
 .../ti-framework-components.inc               |   6 +-
 recipes-ti/imglib/imglib-c66x.inc             |   8 +-
 recipes-ti/includes/ti-staging.inc            |   4 +-
 recipes-ti/includes/ti-unpack.inc             |   4 +-
 .../ipc/ipc-transport-common-rtos_git.bb      |   2 +-
 recipes-ti/ipc/ipc-transport-qmss-rtos_git.bb |   4 +-
 recipes-ti/ipc/ipc-transport-qmss.inc         |   2 +-
 recipes-ti/ipc/ipc-transport-srio-rtos_git.bb |   4 +-
 recipes-ti/ipc/ipc-transport-srio.inc         |   2 +-
 recipes-ti/ipc/ti-ipc-examples-linux_git.bb   |   6 +-
 recipes-ti/ipc/ti-ipc-examples.inc            |   4 +-
 recipes-ti/ipc/ti-ipc-examples_git.bb         |   6 +-
 recipes-ti/ipc/ti-ipc-rtos.inc                |   8 +-
 recipes-ti/ipc/ti-ipc-rtos_git.bb             |  22 ++--
 recipes-ti/ipc/ti-ipc_git.bb                  |  10 +-
 recipes-ti/linuxutils/ti-linuxutils.inc       |  14 +-
 .../linuxutils/ti-linuxutils_2.26.01.02.bb    |   2 +-
 recipes-ti/mathlib/mathlib.inc                |   8 +-
 recipes-ti/mpm-transport/mpm-transport_git.bb |  12 +-
 .../multiprocmgr/multiprocmgr-rtos_git.bb     |  12 +-
 .../multiprocmgr/multiprocmgr-test_git.bb     |  10 +-
 recipes-ti/multiprocmgr/multiprocmgr_git.bb   |   4 +-
 recipes-ti/ndk/ti-ndk.inc                     |   6 +-
 recipes-ti/ns/ti-ns.inc                       |   6 +-
 recipes-ti/openmp-rtos/openmp-rtos_git.bb     |  12 +-
 recipes-ti/osal/ti-osal.inc                   |   6 +-
 recipes-ti/swtools/swtools_git.bb             |   8 +-
 .../ti-pdk-build/ti-pdk-build-rtos_git.bb     |   4 +-
 recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb    |  20 +--
 recipes-ti/udma/udma_git.bb                   |   4 +-
 .../uio-test-pruss/uio-test-pruss_git.bb      |   8 +-
 recipes-ti/vlib/vlib-c66x.inc                 |   6 +-
 recipes-ti/xdais/ti-xdais.inc                 |   6 +-
 recipes-ti/xdais/ti-xdais_6.26.01.03.bb       |   2 +-
 251 files changed, 833 insertions(+), 833 deletions(-)

diff --git a/classes/ti-pdk-fetch.bbclass b/classes/ti-pdk-fetch.bbclass
index cacd71a4..e4c55e33 100644
--- a/classes/ti-pdk-fetch.bbclass
+++ b/classes/ti-pdk-fetch.bbclass
@@ -18,7 +18,7 @@ TI_PDK_SOURCE =3D "${TI_PDK_SOURCE_WORKDIR}/git"
 S =3D "${@'${WORKDIR}/git/${TI_PDK_COMP_PATH}'.rstrip('/')}"

 # Hard-link only required sources from PDK
-python do_unpack_append() {
+python do_unpack:append() {
     if len(d.getVar('TI_PDK_COMP') or '') > 0:
         import shutil

diff --git a/classes/ti-pdk.bbclass b/classes/ti-pdk.bbclass
index 68314215..21dd3ade 100644
--- a/classes/ti-pdk.bbclass
+++ b/classes/ti-pdk.bbclass
@@ -5,14 +5,14 @@ inherit perlnative

 DEPENDS =3D "ti-xdctools-native ti-cg-xml-native ti-sysbios common-csl-ip-=
rtos libxml-simple-perl-native gcc-arm-baremetal-native ti-cgt6x-native ti-=
cgt-pru-native ti-pdk-build-rtos doxygen-native"

-DEPENDS_append_omap-a15 =3D " ti-cgt-arm-native"
-DEPENDS_remove_ti33x =3D "ti-cgt6x-native"
-DEPENDS_remove_ti43x =3D "ti-cgt6x-native"
-DEPENDS_append_omapl1 =3D " ti-cgt-arm-native"
-DEPENDS_remove_am65xx =3D "gcc-arm-baremetal-native ti-cgt6x-native"
-DEPENDS_append_am65xx =3D " ti-cgt-arm-native gcc-linaro-baremetal-aarch64=
-native"
-DEPENDS_remove_j7 =3D "gcc-arm-baremetal-native"
-DEPENDS_append_j7 =3D " ti-cgt-arm-native gcc-linaro-baremetal-aarch64-nat=
ive ti-cgt7x-native"
+DEPENDS:append_omap-a15 =3D " ti-cgt-arm-native"
+DEPENDS:remove_ti33x =3D "ti-cgt6x-native"
+DEPENDS:remove_ti43x =3D "ti-cgt6x-native"
+DEPENDS:append_omapl1 =3D " ti-cgt-arm-native"
+DEPENDS:remove_am65xx =3D "gcc-arm-baremetal-native ti-cgt6x-native"
+DEPENDS:append_am65xx =3D " ti-cgt-arm-native gcc-linaro-baremetal-aarch64=
-native"
+DEPENDS:remove_j7 =3D "gcc-arm-baremetal-native"
+DEPENDS:append_j7 =3D " ti-cgt-arm-native gcc-linaro-baremetal-aarch64-nat=
ive ti-cgt7x-native"

 S =3D "${WORKDIR}/git"
 B =3D "${WORKDIR}/build"
@@ -141,4 +141,4 @@ do_install () {
     fi
 }

-FILES_${PN} +=3D "${PDK_INSTALL_DIR_RECIPE}/packages"
+FILES:${PN} +=3D "${PDK_INSTALL_DIR_RECIPE}/packages"
diff --git a/conf/machine/am3517-evm.conf b/conf/machine/am3517-evm.conf
index c20e2f6a..f194c648 100644
--- a/conf/machine/am3517-evm.conf
+++ b/conf/machine/am3517-evm.conf
@@ -8,7 +8,7 @@ MACHINE_GUI_CLASS =3D "smallscreen"
 MACHINE_FEATURES +=3D "touchscreen ethernet"

 IMAGE_FSTYPES +=3D "ubi tar.xz"
-EXTRA_IMAGECMD_jffs2 =3D "-lnp -e 0x20000 -s 2048"
+EXTRA_IMAGECMD:jffs2 =3D "-lnp -e 0x20000 -s 2048"

 SERIAL_CONSOLES =3D "115200;ttyS2"
 USE_VT =3D "2"
diff --git a/conf/machine/am37x-evm.conf b/conf/machine/am37x-evm.conf
index a512c8d0..9750fe64 100644
--- a/conf/machine/am37x-evm.conf
+++ b/conf/machine/am37x-evm.conf
@@ -8,7 +8,7 @@ MACHINE_GUI_CLASS =3D "smallscreen"
 MACHINE_FEATURES +=3D "touchscreen ethernet"

 IMAGE_FSTYPES +=3D "ubi tar.xz"
-EXTRA_IMAGECMD_jffs2 =3D "-lnp -e 0x20000 -s 2048"
+EXTRA_IMAGECMD:jffs2 =3D "-lnp -e 0x20000 -s 2048"

 KERNEL_DEVICETREE =3D "omap3-evm-37xx.dtb"

diff --git a/conf/machine/am65xx-evm-k3r5-sr2.conf b/conf/machine/am65xx-ev=
m-k3r5-sr2.conf
index c0b3cd51..e74dd3ab 100644
--- a/conf/machine/am65xx-evm-k3r5-sr2.conf
+++ b/conf/machine/am65xx-evm-k3r5-sr2.conf
@@ -5,7 +5,7 @@
 # Booting SR2 requires different SYSFW, the rest is handled at runtime

 require conf/machine/am65xx-evm-k3r5.conf
-SOC_FAMILY_append =3D ":k3r5-sr2"
+SOC_FAMILY:append =3D ":k3r5-sr2"

 SYSFW_SOC =3D "am65x_sr2"
 SYSFW_SYMLINK =3D "sysfw.itb"
diff --git a/conf/machine/am65xx-hs-evm-k3r5-sr2.conf b/conf/machine/am65xx=
-hs-evm-k3r5-sr2.conf
index ef1b6fbe..ff1645e4 100644
--- a/conf/machine/am65xx-hs-evm-k3r5-sr2.conf
+++ b/conf/machine/am65xx-hs-evm-k3r5-sr2.conf
@@ -5,7 +5,7 @@
 # Booting SR2 requires different SYSFW, the rest is handled at runtime

 require conf/machine/am65xx-hs-evm-k3r5.conf
-SOC_FAMILY_append =3D ":k3r5-sr2"
+SOC_FAMILY:append =3D ":k3r5-sr2"

 SYSFW_SOC =3D "am65x_sr2"
 SYSFW_SYMLINK =3D "sysfw.itb"
diff --git a/conf/machine/beagleboard.conf b/conf/machine/beagleboard.conf
index ee51fd66..06777795 100644
--- a/conf/machine/beagleboard.conf
+++ b/conf/machine/beagleboard.conf
@@ -8,7 +8,7 @@ require conf/machine/include/omap3.inc
 MACHINE_GUI_CLASS =3D "bigscreen"

 IMAGE_FSTYPES +=3D "tar.xz ubi"
-EXTRA_IMAGECMD_jffs2 =3D "-lnp"
+EXTRA_IMAGECMD:jffs2 =3D "-lnp"

 KERNEL_DEVICETREE =3D "omap3-beagle.dtb omap3-beagle-xm.dtb omap3-beagle-x=
m-ab.dtb"

diff --git a/conf/machine/beaglebone.conf b/conf/machine/beaglebone.conf
index 896a9d73..dcb14cc9 100644
--- a/conf/machine/beaglebone.conf
+++ b/conf/machine/beaglebone.conf
@@ -13,7 +13,7 @@ MACHINE_GUI_CLASS =3D "bigscreen"

 SERIAL_CONSOLES =3D "115200;ttyS0"

-IMAGE_INSTALL_append =3D " kernel-devicetree kernel-image-zimage"
+IMAGE_INSTALL:append =3D " kernel-devicetree kernel-image-zimage"

 # Refine the list of device targets for ti-pdk class recipes
 TI_PDK_LIMIT_BOARDS =3D "bbbAM335x"
diff --git a/conf/machine/include/am64xx.inc b/conf/machine/include/am64xx.=
inc
index 95fdc79d..18e3757a 100644
--- a/conf/machine/include/am64xx.inc
+++ b/conf/machine/include/am64xx.inc
@@ -1,5 +1,5 @@
 require conf/machine/include/k3.inc
-SOC_FAMILY_append =3D ":am64xx"
+SOC_FAMILY:append =3D ":am64xx"

 MACHINE_FEATURES +=3D "screen touchscreen"

diff --git a/conf/machine/include/am65xx.inc b/conf/machine/include/am65xx.=
inc
index 8516ca4c..2838c58f 100644
--- a/conf/machine/include/am65xx.inc
+++ b/conf/machine/include/am65xx.inc
@@ -1,5 +1,5 @@
 require conf/machine/include/k3.inc
-SOC_FAMILY_append =3D ":am65xx"
+SOC_FAMILY:append =3D ":am65xx"

 MACHINE_FEATURES +=3D "screen touchscreen gpu"

diff --git a/conf/machine/include/c66x.inc b/conf/machine/include/c66x.inc
index e35f2eda..33a657f1 100644
--- a/conf/machine/include/c66x.inc
+++ b/conf/machine/include/c66x.inc
@@ -1,5 +1,5 @@
 require conf/machine/include/keystone.inc
-SOC_FAMILY_append =3D ":c66x"
+SOC_FAMILY:append =3D ":c66x"

 # HACK: The c66x family is composed of devices with only DSP cores, and no=
 ARM
 #       cores. The Linux kernel is not supported on these machines.
diff --git a/conf/machine/include/davinci.inc b/conf/machine/include/davinc=
i.inc
index 62ca6887..d2681740 100644
--- a/conf/machine/include/davinci.inc
+++ b/conf/machine/include/davinci.inc
@@ -17,6 +17,6 @@ UBOOT_LOADADDRESS =3D "0x80008000"
 EXTRA_IMAGEDEPENDS +=3D "u-boot"

 SERIAL_CONSOLES ?=3D "115200;ttyS0"
-EXTRA_IMAGECMD_jffs2 =3D "--pad --little-endian --eraseblock=3D0x20000 -n"
+EXTRA_IMAGECMD:jffs2 =3D "--pad --little-endian --eraseblock=3D0x20000 -n"

 MACHINE_FEATURES =3D "kernel26 serial ethernet usbhost usbgadget mmc alsa"
diff --git a/conf/machine/include/dra7xx.inc b/conf/machine/include/dra7xx.=
inc
index 857e1b35..a02421d9 100644
--- a/conf/machine/include/dra7xx.inc
+++ b/conf/machine/include/dra7xx.inc
@@ -1,4 +1,4 @@
 require conf/machine/include/omap-a15.inc
-SOC_FAMILY_append =3D ":dra7xx"
+SOC_FAMILY:append =3D ":dra7xx"

 MACHINE_FEATURES +=3D "pci"
diff --git a/conf/machine/include/j7.inc b/conf/machine/include/j7.inc
index d3eda1a8..cf5f6a94 100644
--- a/conf/machine/include/j7.inc
+++ b/conf/machine/include/j7.inc
@@ -1,5 +1,5 @@
 require conf/machine/include/k3.inc
-SOC_FAMILY_append =3D ":j7"
+SOC_FAMILY:append =3D ":j7"

 OPTEEMACHINE =3D "k3-j721e"
 OPTEEOUTPUTMACHINE =3D "k3"
diff --git a/conf/machine/include/k2e.inc b/conf/machine/include/k2e.inc
index 6797fb29..a6d58bb3 100644
--- a/conf/machine/include/k2e.inc
+++ b/conf/machine/include/k2e.inc
@@ -1,5 +1,5 @@
 require conf/machine/include/keystone.inc
-SOC_FAMILY_append =3D ":k2e"
+SOC_FAMILY:append =3D ":k2e"

 # Set the list of device targets for ti-pdk class recipes
 TI_PDK_LIMIT_SOCS =3D "k2e"
diff --git a/conf/machine/include/k2g.inc b/conf/machine/include/k2g.inc
index 7bcc412b..be40d9e7 100644
--- a/conf/machine/include/k2g.inc
+++ b/conf/machine/include/k2g.inc
@@ -1,5 +1,5 @@
 require conf/machine/include/keystone.inc
-SOC_FAMILY_append =3D ":k2g"
+SOC_FAMILY:append =3D ":k2g"

 # Set the list of device targets for ti-pdk class recipes
 TI_PDK_LIMIT_SOCS =3D "k2g"
diff --git a/conf/machine/include/k2hk.inc b/conf/machine/include/k2hk.inc
index 2d2dd6a0..456fda75 100644
--- a/conf/machine/include/k2hk.inc
+++ b/conf/machine/include/k2hk.inc
@@ -1,5 +1,5 @@
 require conf/machine/include/keystone.inc
-SOC_FAMILY_append =3D ":k2hk"
+SOC_FAMILY:append =3D ":k2hk"

 # Set the list of device targets for ti-pdk class recipes
 TI_PDK_LIMIT_SOCS =3D "k2h k2k"
diff --git a/conf/machine/include/k2l.inc b/conf/machine/include/k2l.inc
index 997bcbe2..b6a4bc7d 100644
--- a/conf/machine/include/k2l.inc
+++ b/conf/machine/include/k2l.inc
@@ -1,5 +1,5 @@
 require conf/machine/include/keystone.inc
-SOC_FAMILY_append =3D ":k2l"
+SOC_FAMILY:append =3D ":k2l"

 # Set the list of device targets for ti-pdk class recipes
 TI_PDK_LIMIT_SOCS =3D "k2l"
diff --git a/conf/machine/include/k3.inc b/conf/machine/include/k3.inc
index e0970698..20ab7a9e 100644
--- a/conf/machine/include/k3.inc
+++ b/conf/machine/include/k3.inc
@@ -1,7 +1,7 @@
 # TI K3 Aarch64 profile for Cortex-A53/A72 cores

 require conf/machine/include/ti-soc.inc
-SOC_FAMILY_append =3D ":k3"
+SOC_FAMILY:append =3D ":k3"

 require conf/machine/include/arm/arch-arm64.inc

diff --git a/conf/machine/include/k3r5.inc b/conf/machine/include/k3r5.inc
index a32accae..93f08c04 100644
--- a/conf/machine/include/k3r5.inc
+++ b/conf/machine/include/k3r5.inc
@@ -1,7 +1,7 @@
 # TI K3 Armv7 profile for Cortex-R5F cores

 require conf/machine/include/ti-soc.inc
-SOC_FAMILY_append =3D ":k3r5"
+SOC_FAMILY:append =3D ":k3r5"

 # The closest of existing tunes for Cortex-R5F
 DEFAULTTUNE =3D "armv7athf"
@@ -20,5 +20,5 @@ UBOOT_BINARY =3D "tiboot3.${UBOOT_SUFFIX}"
 UBOOT_IMAGE =3D "tiboot3-${MAINMACHINE}-${PV}-${PR}.${UBOOT_SUFFIX}"
 UBOOT_SYMLINK =3D "tiboot3-${MAINMACHINE}.${UBOOT_SUFFIX}"

-PACKAGECONFIG_pn-u-boot-ti-staging =3D ""
-PACKAGECONFIG_pn-u-boot-ti-mainline =3D ""
+PACKAGECONFIG:pn-u-boot-ti-staging =3D ""
+PACKAGECONFIG:pn-u-boot-ti-mainline =3D ""
diff --git a/conf/machine/include/keystone.inc b/conf/machine/include/keyst=
one.inc
index e7ea9758..83dca19d 100644
--- a/conf/machine/include/keystone.inc
+++ b/conf/machine/include/keystone.inc
@@ -1,5 +1,5 @@
 require conf/machine/include/ti-soc.inc
-SOC_FAMILY_append =3D ":keystone"
+SOC_FAMILY:append =3D ":keystone"

 DEFAULTTUNE ?=3D "armv7athf-neon"
 require conf/machine/include/tune-cortexa15.inc
diff --git a/conf/machine/include/omap-a15.inc b/conf/machine/include/omap-=
a15.inc
index e491d2b5..553835c8 100644
--- a/conf/machine/include/omap-a15.inc
+++ b/conf/machine/include/omap-a15.inc
@@ -1,5 +1,5 @@
 require conf/machine/include/ti-soc.inc
-SOC_FAMILY_append =3D ":omap-a15"
+SOC_FAMILY:append =3D ":omap-a15"

 DEFAULTTUNE ?=3D "armv7athf-neon"
 require conf/machine/include/tune-cortexa15.inc
diff --git a/conf/machine/include/omap3.inc b/conf/machine/include/omap3.in=
c
index 5696c82d..ab069b00 100644
--- a/conf/machine/include/omap3.inc
+++ b/conf/machine/include/omap3.inc
@@ -1,5 +1,5 @@
 require conf/machine/include/ti-soc.inc
-SOC_FAMILY_append =3D ":omap3"
+SOC_FAMILY:append =3D ":omap3"

 DEFAULTTUNE ?=3D "armv7athf-neon"
 require conf/machine/include/tune-cortexa8.inc
diff --git a/conf/machine/include/omap4.inc b/conf/machine/include/omap4.in=
c
index cbca267c..b6f43744 100644
--- a/conf/machine/include/omap4.inc
+++ b/conf/machine/include/omap4.inc
@@ -1,5 +1,5 @@
 require conf/machine/include/ti-soc.inc
-SOC_FAMILY_append =3D ":omap4"
+SOC_FAMILY:append =3D ":omap4"

 DEFAULTTUNE ?=3D "armv7athf-neon"
 require conf/machine/include/tune-cortexa9.inc
diff --git a/conf/machine/include/omapl1.inc b/conf/machine/include/omapl1.=
inc
index 9942c944..d0262c3f 100644
--- a/conf/machine/include/omapl1.inc
+++ b/conf/machine/include/omapl1.inc
@@ -1,2 +1,2 @@
 require conf/machine/include/ti-soc.inc
-SOC_FAMILY_append =3D ":omapl1"
+SOC_FAMILY:append =3D ":omapl1"
diff --git a/conf/machine/include/omapl137.inc b/conf/machine/include/omapl=
137.inc
index 5d8a6dd8..6dd49418 100644
--- a/conf/machine/include/omapl137.inc
+++ b/conf/machine/include/omapl137.inc
@@ -1,5 +1,5 @@
 require conf/machine/include/omapl1.inc
-SOC_FAMILY_append =3D ":omapl137"
+SOC_FAMILY:append =3D ":omapl137"

 # Set the list of device targets for ti-pdk class recipes
 TI_PDK_LIMIT_SOCS =3D "omapl137"
diff --git a/conf/machine/include/omapl138.inc b/conf/machine/include/omapl=
138.inc
index 999cbc3a..f73517d0 100644
--- a/conf/machine/include/omapl138.inc
+++ b/conf/machine/include/omapl138.inc
@@ -1,5 +1,5 @@
 require conf/machine/include/omapl1.inc
-SOC_FAMILY_append =3D ":omapl138"
+SOC_FAMILY:append =3D ":omapl138"

 # Set the list of device targets for ti-pdk class recipes
 TI_PDK_LIMIT_SOCS =3D "omapl138"
diff --git a/conf/machine/include/ti33x.inc b/conf/machine/include/ti33x.in=
c
index 6dfda754..3da2aba5 100644
--- a/conf/machine/include/ti33x.inc
+++ b/conf/machine/include/ti33x.inc
@@ -1,5 +1,5 @@
 require conf/machine/include/ti-soc.inc
-SOC_FAMILY_append =3D ":ti33x"
+SOC_FAMILY:append =3D ":ti33x"

 DEFAULTTUNE ?=3D "armv7athf-neon"
 require conf/machine/include/tune-cortexa8.inc
diff --git a/conf/machine/include/ti43x.inc b/conf/machine/include/ti43x.in=
c
index b1a27f93..eaed1812 100644
--- a/conf/machine/include/ti43x.inc
+++ b/conf/machine/include/ti43x.inc
@@ -1,5 +1,5 @@
 require conf/machine/include/ti-soc.inc
-SOC_FAMILY_append =3D ":ti43x"
+SOC_FAMILY:append =3D ":ti43x"

 DEFAULTTUNE ?=3D "armv7athf-neon"
 require conf/machine/include/tune-cortexa9.inc
diff --git a/conf/machine/omap3evm.conf b/conf/machine/omap3evm.conf
index 01808b68..dc56d57a 100644
--- a/conf/machine/omap3evm.conf
+++ b/conf/machine/omap3evm.conf
@@ -8,7 +8,7 @@ MACHINE_GUI_CLASS =3D "smallscreen"
 MACHINE_FEATURES +=3D "touchscreen ethernet"

 IMAGE_FSTYPES +=3D "jffs2 tar.xz"
-EXTRA_IMAGECMD_jffs2 =3D "-lnp -e 0x20000 -s 2048"
+EXTRA_IMAGECMD:jffs2 =3D "-lnp -e 0x20000 -s 2048"

 SERIAL_CONSOLES =3D "115200;ttyS0"
 USE_VT =3D "0"
diff --git a/conf/multiconfig/k3r5-sr2.conf b/conf/multiconfig/k3r5-sr2.con=
f
index 17082141..e933b9cc 100644
--- a/conf/multiconfig/k3r5-sr2.conf
+++ b/conf/multiconfig/k3r5-sr2.conf
@@ -1,3 +1,3 @@
 require k3r5.conf

-MACHINE_append =3D "-sr2"
+MACHINE:append =3D "-sr2"
diff --git a/conf/multiconfig/k3r5.conf b/conf/multiconfig/k3r5.conf
index 8c8f0c3f..deb07210 100644
--- a/conf/multiconfig/k3r5.conf
+++ b/conf/multiconfig/k3r5.conf
@@ -2,4 +2,4 @@ MAINMACHINE :=3D "${MACHINE}"

 DEPLOY_DIR_IMAGE =3D "${DEPLOY_DIR}/images/${MAINMACHINE}"

-MACHINE_append =3D "-k3r5"
+MACHINE:append =3D "-k3r5"
diff --git a/recipes-bsp/abefw/abefw_1.0.14.bb b/recipes-bsp/abefw/abefw_1.=
0.14.bb
index 302bdcde..a6cc624a 100644
--- a/recipes-bsp/abefw/abefw_1.0.14.bb
+++ b/recipes-bsp/abefw/abefw_1.0.14.bb
@@ -20,4 +20,4 @@ do_install() {
         cp ${S}/firmware/omap4_abe_new ${D}/lib/firmware/
 }

-FILES_${PN} +=3D "/lib/firmware/omap4_abe_new"
+FILES:${PN} +=3D "/lib/firmware/omap4_abe_new"
diff --git a/recipes-bsp/aif2-lld/aif2-lld-rtos_git.bb b/recipes-bsp/aif2-l=
ld/aif2-lld-rtos_git.bb
index 962965b0..048a2430 100644
--- a/recipes-bsp/aif2-lld/aif2-lld-rtos_git.bb
+++ b/recipes-bsp/aif2-lld/aif2-lld-rtos_git.bb
@@ -6,7 +6,7 @@ require recipes-bsp/aif2-lld/aif2-lld.inc

 PR =3D "${INC_PR}.0"

-DEPENDS_append =3D " qmss-lld-rtos \
+DEPENDS:append =3D " qmss-lld-rtos \
                    cppi-lld-rtos \
 "

diff --git a/recipes-bsp/aif2-lld/aif2-lld-test_git.bb b/recipes-bsp/aif2-l=
ld/aif2-lld-test_git.bb
index 9180b953..d4328621 100644
--- a/recipes-bsp/aif2-lld/aif2-lld-test_git.bb
+++ b/recipes-bsp/aif2-lld/aif2-lld-test_git.bb
@@ -6,7 +6,7 @@ include aif2-lld.inc

 PR =3D "${INC_PR}.0"

-EXTRA_OEMAKE =3D "-f makefile_armv7 PDK_INSTALL_PATH=3D${STAGING_INCDIR} A=
IF2_SRC_DIR=3D${WORKDIR}/git"
+EXTRA_OEMAKE =3D "-f makefile:armv7 PDK_INSTALL_PATH=3D${STAGING_INCDIR} A=
IF2_SRC_DIR=3D${WORKDIR}/git"

 do_compile () {
     oe_runmake clean DEVICE=3Dk2hk
diff --git a/recipes-bsp/aif2-lld/aif2-lld_git.bb b/recipes-bsp/aif2-lld/ai=
f2-lld_git.bb
index 4a640f1b..d9283a3a 100644
--- a/recipes-bsp/aif2-lld/aif2-lld_git.bb
+++ b/recipes-bsp/aif2-lld/aif2-lld_git.bb
@@ -6,7 +6,7 @@ include aif2-lld.inc

 PR =3D "${INC_PR}.0"

-EXTRA_OEMAKE =3D "-f makefile_armv7 PDK_INSTALL_PATH=3D${STAGING_INCDIR}"
+EXTRA_OEMAKE =3D "-f makefile:armv7 PDK_INSTALL_PATH=3D${STAGING_INCDIR}"

 do_compile () {
     oe_runmake lib DEVICE=3Dk2hk
diff --git a/recipes-bsp/alsa-state/alsa-state.bbappend b/recipes-bsp/alsa-=
state/alsa-state.bbappend
index 72d991c7..4fc41d05 100644
--- a/recipes-bsp/alsa-state/alsa-state.bbappend
+++ b/recipes-bsp/alsa-state/alsa-state.bbappend
@@ -1 +1 @@
-FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}:"
diff --git a/recipes-bsp/audk2g-addon/audk2g-addon-rtos_git.bb b/recipes-bs=
p/audk2g-addon/audk2g-addon-rtos_git.bb
index 0cb9ff17..e40fb43c 100644
--- a/recipes-bsp/audk2g-addon/audk2g-addon-rtos_git.bb
+++ b/recipes-bsp/audk2g-addon/audk2g-addon-rtos_git.bb
@@ -25,7 +25,7 @@ PR =3D "r0"

 S =3D "${WORKDIR}/git/ti/addon/audk2g"

-DEPENDS_append =3D " ti-sysbios \
+DEPENDS:append =3D " ti-sysbios \
             gpio-lld-rtos \
             i2c-lld-rtos \
             board-rtos \
diff --git a/recipes-bsp/bcp-lld/bcp-lld-rtos_git.bb b/recipes-bsp/bcp-lld/=
bcp-lld-rtos_git.bb
index 62cee07b..d808267b 100644
--- a/recipes-bsp/bcp-lld/bcp-lld-rtos_git.bb
+++ b/recipes-bsp/bcp-lld/bcp-lld-rtos_git.bb
@@ -15,7 +15,7 @@ PACKAGE_ARCH =3D "${MACHINE_ARCH}"
 PR =3D "r0"


-DEPENDS_append =3D " qmss-lld-rtos \
+DEPENDS:append =3D " qmss-lld-rtos \
                    cppi-lld-rtos \
 "

diff --git a/recipes-bsp/board-rtos/board-rtos_git.bb b/recipes-bsp/board-r=
tos/board-rtos_git.bb
index a6547d38..485b0656 100644
--- a/recipes-bsp/board-rtos/board-rtos_git.bb
+++ b/recipes-bsp/board-rtos/board-rtos_git.bb
@@ -16,24 +16,24 @@ PACKAGE_ARCH =3D "${MACHINE_ARCH}"

 PR =3D "r0"

-DEPENDS_append =3D " i2c-lld-rtos \
+DEPENDS:append =3D " i2c-lld-rtos \
                    spi-lld-rtos \
                    uart-lld-rtos \
                    osal-rtos \
 "

-DEPENDS_append_omap-a15 =3D " ti-ndk \
+DEPENDS:append_omap-a15 =3D " ti-ndk \
                             mmcsd-lld-rtos \
                             pm-lld-rtos \
 "

-DEPENDS_append_am57xx-evm =3D " gpio-lld-rtos \
+DEPENDS:append_am57xx-evm =3D " gpio-lld-rtos \
                               icss-emac-lld-rtos \
                               pruss-lld-rtos \
 "


-DEPENDS_append_ti33x =3D " gpio-lld-rtos \
+DEPENDS:append_ti33x =3D " gpio-lld-rtos \
                          gpmc-lld-rtos \
                          icss-emac-lld-rtos \
                          mmcsd-lld-rtos \
@@ -42,7 +42,7 @@ DEPENDS_append_ti33x =3D " gpio-lld-rtos \
                          ti-ndk \
 "

-DEPENDS_append_ti43x =3D " gpio-lld-rtos \
+DEPENDS:append_ti43x =3D " gpio-lld-rtos \
                          gpmc-lld-rtos \
                          icss-emac-lld-rtos \
                          mmcsd-lld-rtos \
@@ -51,13 +51,13 @@ DEPENDS_append_ti43x =3D " gpio-lld-rtos \
                          ti-ndk \
 "

-DEPENDS_append_dra7xx =3D " pm-lld-rtos \
+DEPENDS:append_dra7xx =3D " pm-lld-rtos \
                           mmcsd-lld-rtos \
 "

-DEPENDS_append_am65xx =3D " sciclient-rtos \
+DEPENDS:append_am65xx =3D " sciclient-rtos \
 "
-DEPENDS_append_j7 =3D " udma-lld-rtos \
+DEPENDS:append_j7 =3D " udma-lld-rtos \
                           sciclient-rtos \
                           mmcsd-lld-rtos \
 "
@@ -71,6 +71,6 @@ INHIBIT_PACKAGE_STRIP =3D "1"
 export PDK_BOARD_ROOT_PATH =3D"${WORKDIR}/build"
 export DEST_ROOT=3D"${S}"

-XDCPATH_append =3D ";${PDK_INSTALL_DIR}/packages/ti/csl;${NDK_INSTALL_DIR}=
/packages"
+XDCPATH:append =3D ";${PDK_INSTALL_DIR}/packages/ti/csl;${NDK_INSTALL_DIR}=
/packages"

-INSANE_SKIP_${PN} =3D "arch"
+INSANE_SKIP:${PN} =3D "arch"
diff --git a/recipes-bsp/boot-monitor/boot-monitor_git.bb b/recipes-bsp/boo=
t-monitor/boot-monitor_git.bb
index 9c436d1c..dee180ff 100644
--- a/recipes-bsp/boot-monitor/boot-monitor_git.bb
+++ b/recipes-bsp/boot-monitor/boot-monitor_git.bb
@@ -23,7 +23,7 @@ FLOATABI =3D "${@bb.utils.contains("TUNE_FEATURES", "vfp"=
, bb.utils.contains("TUNE

 EXTRA_OEMAKE =3D "CROSS_COMPILE=3D${TARGET_PREFIX} CC=3D"${TARGET_PREFIX}g=
cc ${TOOLCHAIN_OPTIONS} ${FLOATABI}" LD=3D"${TARGET_PREFIX}gcc ${TOOLCHAIN_=
OPTIONS} ${FLOATABI}""

-FILES_${PN} =3D "/boot"
+FILES:${PN} =3D "/boot"

 inherit deploy

diff --git a/recipes-bsp/bt-fw/bt-fw_git.bb b/recipes-bsp/bt-fw/bt-fw_git.b=
b
index f3d740b1..ea42c168 100644
--- a/recipes-bsp/bt-fw/bt-fw_git.bb
+++ b/recipes-bsp/bt-fw/bt-fw_git.bb
@@ -21,4 +21,4 @@ do_install() {
     oe_runmake "DEST_DIR=3D${D}" "BASE_LIB_DIR=3D${base_libdir}" install
 }

-FILES_${PN} +=3D "${base_libdir}/firmware/ti-connectivity/*"
+FILES:${PN} +=3D "${base_libdir}/firmware/ti-connectivity/*"
diff --git a/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb b/recipes-b=
sp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb
index 6d857f7f..ccaa3e6d 100644
--- a/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb
+++ b/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb
@@ -25,4 +25,4 @@ do_install() {
         install -m 0644 ${S}/cadence/${TARGET} ${D}${base_libdir}/firmware=
/cadence/${TARGET}
 }

-FILES_${PN} =3D "${base_libdir}/firmware"
+FILES:${PN} =3D "${base_libdir}/firmware"
diff --git a/recipes-bsp/cal-lld/cal-lld-rtos_git.bb b/recipes-bsp/cal-lld/=
cal-lld-rtos_git.bb
index f3c780f6..aef21899 100644
--- a/recipes-bsp/cal-lld/cal-lld-rtos_git.bb
+++ b/recipes-bsp/cal-lld/cal-lld-rtos_git.bb
@@ -15,7 +15,7 @@ PACKAGE_ARCH =3D "${MACHINE_ARCH}"

 PR =3D "r0"

-DEPENDS_append =3D " osal-rtos \
+DEPENDS:append =3D " osal-rtos \
                    fvid2-rtos \
 "

@@ -71,6 +71,6 @@ do_install() {
     find -name "*.tar" -exec tar xf {} --no-same-owner -C ${D}${PDK_INSTAL=
L_DIR_RECIPE}/packages/ti/drv/cal \;
 }

-FILES_${PN} +=3D "${PDK_INSTALL_DIR_RECIPE}/packages"
+FILES:${PN} +=3D "${PDK_INSTALL_DIR_RECIPE}/packages"

-INSANE_SKIP_${PN} =3D "arch ldflags"
+INSANE_SKIP:${PN} =3D "arch ldflags"
diff --git a/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb b/recipes-bsp/cm3-=
pm-firmware/amx3-cm3_git.bb
index bbbc3ec1..bd5c3693 100644
--- a/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb
+++ b/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb
@@ -23,7 +23,7 @@ do_install() {
         install -m 0644 bin/*-scale-data.bin ${D}${base_libdir}/firmware/
 }

-FILES_${PN} +=3D "${base_libdir}/firmware"
+FILES:${PN} +=3D "${base_libdir}/firmware"

 COMPATIBLE_MACHINE =3D "(ti-soc)"
 TOOLCHAIN =3D "gcc"
diff --git a/recipes-bsp/cmb-addon/cmb-addon-rtos_git.bb b/recipes-bsp/cmb-=
addon/cmb-addon-rtos_git.bb
index 38f9a43e..8ca44164 100644
--- a/recipes-bsp/cmb-addon/cmb-addon-rtos_git.bb
+++ b/recipes-bsp/cmb-addon/cmb-addon-rtos_git.bb
@@ -27,7 +27,7 @@ SRC_URI =3D "${CMB_ADDON_GIT_URI};destsuffix=3D${CMB_ADDO=
N_GIT_DESTSUFFIX};protocol=3D

 S =3D "${WORKDIR}/git/ti/addon/cmb"

-DEPENDS_append =3D " ti-sysbios \
+DEPENDS:append =3D " ti-sysbios \
             gpio-lld-rtos \
             i2c-lld-rtos \
             mcasp-lld-rtos \
diff --git a/recipes-bsp/cmem/cmem-mod_git.bb b/recipes-bsp/cmem/cmem-mod_g=
it.bb
index 1031e859..f7965593 100644
--- a/recipes-bsp/cmem/cmem-mod_git.bb
+++ b/recipes-bsp/cmem/cmem-mod_git.bb
@@ -3,7 +3,7 @@ DESCRIPTION =3D "Kernel module for contiguous memory alloca=
tion from userspace"
 include cmem.inc

 # This package builds a kernel module, use kernel PR as base and append a =
local
-MACHINE_KERNEL_PR_append =3D "a"
+MACHINE_KERNEL_PR:append =3D "a"
 PR =3D "${MACHINE_KERNEL_PR}"

 inherit module
@@ -13,6 +13,6 @@ MAKE_TARGETS =3D "module"

 KERNEL_MODULE_AUTOLOAD +=3D "cmemk"

-do_install_prepend() {
+do_install:prepend() {
     cp ${B}/src/cmem/module/Module.symvers ${B}/ || true
 }
diff --git a/recipes-bsp/cmem/cmem_git.bb b/recipes-bsp/cmem/cmem_git.bb
index bab9238f..f69c22fb 100644
--- a/recipes-bsp/cmem/cmem_git.bb
+++ b/recipes-bsp/cmem/cmem_git.bb
@@ -2,12 +2,12 @@ DESCRIPTION =3D "The cmem component supports contiguous m=
emory allocation from use

 include cmem.inc

-RDEPENDS_${PN} =3D "cmem-mod"
+RDEPENDS:${PN} =3D "cmem-mod"

 PR =3D "r0"

 PACKAGES =3D+ "${PN}-test"

-FILES_${PN}-test =3D "${bindir}/*"
+FILES:${PN}-test =3D "${bindir}/*"

 inherit autotools
diff --git a/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb b/recipes-=
bsp/common-csl-ip/common-csl-ip-rtos_git.bb
index 6479d9f0..00591777 100644
--- a/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb
+++ b/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb
@@ -2,12 +2,12 @@ require common-csl-ip.inc
 PR =3D "${INC_PR}.6"

 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-COMPATIBLE_MACHINE_append =3D "|c66x|k3"
+COMPATIBLE_MACHINE:append =3D "|c66x|k3"

 inherit ti-pdk

-DEPENDS_remove =3D "${PN}"
-DEPENDS_remove =3D "ti-sysbios"
+DEPENDS:remove =3D "${PN}"
+DEPENDS:remove =3D "ti-sysbios"

 # Build with make instead of XDC
 TI_PDK_XDCMAKE =3D "0"
@@ -19,5 +19,5 @@ export DEST_ROOT=3D"${S}"
 PDK_COMP_LINK_TEXT =3D "CSL-Chip Support Library"

 # Workaround: dra7xx build requires am57xx CSL libraries for opencl-monito=
r
-TI_PDK_LIMIT_SOCS_append_dra7xx =3D " am571x am572x am574x"
-TI_PDK_LIMIT_BOARDS_append_dra7xx =3D " evmAM571x evmAM572x idkAM574x"
+TI_PDK_LIMIT_SOCS:append_dra7xx =3D " am571x am572x am574x"
+TI_PDK_LIMIT_BOARDS:append_dra7xx =3D " evmAM571x evmAM572x idkAM574x"
diff --git a/recipes-bsp/common-csl-ip/common-csl-ip_git.bb b/recipes-bsp/c=
ommon-csl-ip/common-csl-ip_git.bb
index 9ea87d36..6fffc7ee 100644
--- a/recipes-bsp/common-csl-ip/common-csl-ip_git.bb
+++ b/recipes-bsp/common-csl-ip/common-csl-ip_git.bb
@@ -2,7 +2,7 @@ require common-csl-ip.inc

 PR =3D "${INC_PR}.0"

-ALLOW_EMPTY_${PN} =3D "1"
+ALLOW_EMPTY:${PN} =3D "1"

 CLEANBROKEN =3D "1"

diff --git a/recipes-bsp/common-csl-ip/csl-rti-dwwdtest-fw_git.bb b/recipes=
-bsp/common-csl-ip/csl-rti-dwwdtest-fw_git.bb
index 55e583b4..a7936594 100644
--- a/recipes-bsp/common-csl-ip/csl-rti-dwwdtest-fw_git.bb
+++ b/recipes-bsp/common-csl-ip/csl-rti-dwwdtest-fw_git.bb
@@ -47,15 +47,15 @@ do_install() {
 # Create separate package for each firmware so we can utilize
 # update-alternatives.
 PACKAGES =3D+ "${PN}-evm ${PN}-idk"
-RDEPENDS_${PN} =3D "${PN}-evm ${PN}-idk"
-ALLOW_EMPTY_${PN} =3D "1"
+RDEPENDS:${PN} =3D "${PN}-evm ${PN}-idk"
+ALLOW_EMPTY:${PN} =3D "1"

-FILES_${PN}-evm =3D "${base_libdir}/firmware/rti_dwwdtest/am65xx_evm"
-FILES_${PN}-idk =3D "${base_libdir}/firmware/rti_dwwdtest/am65xx_idk"
+FILES:${PN}-evm =3D "${base_libdir}/firmware/rti_dwwdtest/am65xx_evm"
+FILES:${PN}-idk =3D "${base_libdir}/firmware/rti_dwwdtest/am65xx_idk"

 # We are packaging R5 firmware
-INSANE_SKIP_${PN}-evm =3D "arch"
-INSANE_SKIP_${PN}-idk =3D "arch"
+INSANE_SKIP:${PN}-evm =3D "arch"
+INSANE_SKIP:${PN}-idk =3D "arch"

 # Configure update-alternatives as there may be other firmwares provided i=
n an
 # image.
@@ -63,8 +63,8 @@ inherit update-alternatives

 # It might be nice to dynamically declare the following based on
 # TI_PDK_LIMIT_BOARDS, but that is probably overkill.
-ALTERNATIVE_${PN}-evm =3D "am65x-mcu-r5f0_0-fw"
-ALTERNATIVE_${PN}-idk =3D "am65x-mcu-r5f0_0-fw"
+ALTERNATIVE:${PN}-evm =3D "am65x-mcu-r5f0_0-fw"
+ALTERNATIVE:${PN}-idk =3D "am65x-mcu-r5f0_0-fw"

 ALTERNATIVE_LINK_NAME[am65x-mcu-r5f0_0-fw] =3D "${base_libdir}/firmware/am=
65x-mcu-r5f0_0-fw"

diff --git a/recipes-bsp/cppi-lld/cppi-lld-rtos_git.bb b/recipes-bsp/cppi-l=
ld/cppi-lld-rtos_git.bb
index 1cdaf3a4..49a99406 100644
--- a/recipes-bsp/cppi-lld/cppi-lld-rtos_git.bb
+++ b/recipes-bsp/cppi-lld/cppi-lld-rtos_git.bb
@@ -3,8 +3,8 @@ require cppi-lld.inc

 PR =3D "${INC_PR}.1"

-COMPATIBLE_MACHINE_append =3D "|c66x"
+COMPATIBLE_MACHINE:append =3D "|c66x"

-DEPENDS_append =3D " rm-lld-rtos \
+DEPENDS:append =3D " rm-lld-rtos \
                    qmss-lld-rtos \
 "
diff --git a/recipes-bsp/cppi-lld/cppi-lld-test_git.bb b/recipes-bsp/cppi-l=
ld/cppi-lld-test_git.bb
index 0c630b4e..dd94f92d 100644
--- a/recipes-bsp/cppi-lld/cppi-lld-test_git.bb
+++ b/recipes-bsp/cppi-lld/cppi-lld-test_git.bb
@@ -13,10 +13,10 @@ do_compile () {
 #   Now build the lld in the updated directory
         for device in ${DEVICELIST}
         do
-               make -f makefile_armv7 clean PDK_INSTALL_PATH=3D${STAGING_I=
NCDIR} DEVICE=3D"$device" CPPI_SRC_DIR=3D${S}
+               make -f makefile:armv7 clean PDK_INSTALL_PATH=3D${STAGING_I=
NCDIR} DEVICE=3D"$device" CPPI_SRC_DIR=3D${S}
                 for choice in ${CHOICELIST}
                 do
-                       make -f makefile_armv7 tests examples PDK_INSTALL_P=
ATH=3D${STAGING_INCDIR} DEVICE=3D"$device" CPPI_SRC_DIR=3D${S} USEDYNAMIC_L=
IB=3D"$choice"
+                       make -f makefile:armv7 tests examples PDK_INSTALL_P=
ATH=3D${STAGING_INCDIR} DEVICE=3D"$device" CPPI_SRC_DIR=3D${S} USEDYNAMIC_L=
IB=3D"$choice"
                 done
         done
 }
@@ -24,6 +24,6 @@ do_compile () {
 do_install () {
         for device in ${DEVICELIST}
 do
-       make -f makefile_armv7 installbin PDK_INSTALL_PATH=3D${STAGING_INCD=
IR} DEVICE=3D"$device" CPPI_SRC_DIR=3D${S} INSTALL_BIN_BASE_DIR=3D${D}${bin=
dir}
+       make -f makefile:armv7 installbin PDK_INSTALL_PATH=3D${STAGING_INCD=
IR} DEVICE=3D"$device" CPPI_SRC_DIR=3D${S} INSTALL_BIN_BASE_DIR=3D${D}${bin=
dir}
         done
 }
diff --git a/recipes-bsp/cppi-lld/cppi-lld_git.bb b/recipes-bsp/cppi-lld/cp=
pi-lld_git.bb
index 3cdcd22d..4480714a 100644
--- a/recipes-bsp/cppi-lld/cppi-lld_git.bb
+++ b/recipes-bsp/cppi-lld/cppi-lld_git.bb
@@ -8,15 +8,15 @@ PR =3D "${INC_PR}.1"

 do_compile () {
 #   Now build the lld in the updated directory
-       make -f makefile_armv7 clean PDK_INSTALL_PATH=3D${STAGING_INCDIR}
+       make -f makefile:armv7 clean PDK_INSTALL_PATH=3D${STAGING_INCDIR}
         for device in ${DEVICELIST}
         do
-               make -f makefile_armv7 lib PDK_INSTALL_PATH=3D${STAGING_INC=
DIR}  DEVICE=3D"${device}"
+               make -f makefile:armv7 lib PDK_INSTALL_PATH=3D${STAGING_INC=
DIR}  DEVICE=3D"${device}"
         done
 }

 do_install () {
-    make -f makefile_armv7 install PDK_INSTALL_PATH=3D${STAGING_INCDIR} IN=
STALL_INC_BASE_DIR=3D${D}/${includedir} INSTALL_LIB_BASE_DIR=3D${D}${libdir=
}
+    make -f makefile:armv7 install PDK_INSTALL_PATH=3D${STAGING_INCDIR} IN=
STALL_INC_BASE_DIR=3D${D}/${includedir} INSTALL_LIB_BASE_DIR=3D${D}${libdir=
}
     chown -R root:root ${D}

 #   Set the generic device library symbolic link to default k2h
@@ -35,4 +35,4 @@ INHIBIT_PACKAGE_STRIP_FILES_k2hk =3D "${PKGD}${libdir}/li=
bcppi_k2h.a ${PKGD}${libd
 INHIBIT_PACKAGE_STRIP_FILES_k2e =3D "${PKGD}${libdir}/libcppi_k2e.a"
 INHIBIT_PACKAGE_STRIP_FILES_k2l =3D "${PKGD}${libdir}/libcppi_k2l.a"
 INHIBIT_PACKAGE_STRIP_FILES_k2g =3D "${PKGD}${libdir}/libcppi_k2h.a"
-INHIBIT_PACKAGE_STRIP_FILES_append =3D " ${PKGD}${libdir}/libcppi.a"
+INHIBIT_PACKAGE_STRIP_FILES:append =3D " ${PKGD}${libdir}/libcppi.a"
diff --git a/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb b/recipes-bsp/c=
psw9g-eth-fw/cpsw9g-eth-fw_git.bb
index 8cb62b2a..ed36951f 100755
--- a/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb
+++ b/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb
@@ -21,7 +21,7 @@ CPSW9G_FW_DIR =3D "${S}/ethfw"
 CPSW9G_FW_FILENAME =3D "app_remoteswitchcfg_server_pdk_mem_map_strip.xer5f=
"

 # make sure that lib/firmware, and all its contents are part of the packag=
e
-FILES_${PN} +=3D "${base_libdir}/firmware"
+FILES:${PN} +=3D "${base_libdir}/firmware"

 do_install() {
   install -d ${D}${base_libdir}/firmware
@@ -30,14 +30,14 @@ do_install() {
 }

 TARGET_MAIN_R5FSS0_0 =3D "j7-main-r5f0_0-fw"
-ALTERNATIVE_${PN} =3D "j7-main-r5f0_0-fw"
+ALTERNATIVE:${PN} =3D "j7-main-r5f0_0-fw"
 ALTERNATIVE_LINK_NAME[j7-main-r5f0_0-fw] =3D "${base_libdir}/firmware/${TA=
RGET_MAIN_R5FSS0_0}"
 ALTERNATIVE_TARGET[j7-main-r5f0_0-fw] =3D "${base_libdir}/firmware/${CPSW9=
G_FW_FILENAME}"
 ALTERNATIVE_PRIORITY =3D "17"

 INHIBIT_PACKAGE_STRIP =3D "1"
 INHIBIT_PACKAGE_DEBUG_SPLIT =3D "1"
-INSANE_SKIP_${PN} +=3D "arch"
+INSANE_SKIP:${PN} +=3D "arch"

 do_compile[noexec] =3D "1"
 do_configure[noexec] =3D "1"
diff --git a/recipes-bsp/cuia/cuia_1.0.0.13.bb b/recipes-bsp/cuia/cuia_1.0.=
0.13.bb
index 3efacb19..2ec35c6e 100644
--- a/recipes-bsp/cuia/cuia_1.0.0.13.bb
+++ b/recipes-bsp/cuia/cuia_1.0.0.13.bb
@@ -27,4 +27,4 @@ do_install() {
 COMPATIBLE_HOST ?=3D "null"
 COMPATIBLE_HOST_ti-soc =3D "(.*)"

-INSANE_SKIP_${PN} +=3D "textrel installed-vs-shipped"
+INSANE_SKIP:${PN} +=3D "textrel installed-vs-shipped"
diff --git a/recipes-bsp/dfe-lld/dfe-lld-test_git.bb b/recipes-bsp/dfe-lld/=
dfe-lld-test_git.bb
index 34b90c7d..941f1c6a 100644
--- a/recipes-bsp/dfe-lld/dfe-lld-test_git.bb
+++ b/recipes-bsp/dfe-lld/dfe-lld-test_git.bb
@@ -6,7 +6,7 @@ include dfe-lld.inc

 PR =3D "${INC_PR}.0"

-EXTRA_OEMAKE =3D "-f makefile_armv7 PDK_INSTALL_PATH=3D${STAGING_INCDIR} D=
FE_SRC_DIR=3D${S}"
+EXTRA_OEMAKE =3D "-f makefile:armv7 PDK_INSTALL_PATH=3D${STAGING_INCDIR} D=
FE_SRC_DIR=3D${S}"

 do_compile () {
 #   Now build the lld in the updated directory
diff --git a/recipes-bsp/dfe-lld/dfe-lld_git.bb b/recipes-bsp/dfe-lld/dfe-l=
ld_git.bb
index 622da6fc..c12b0b31 100644
--- a/recipes-bsp/dfe-lld/dfe-lld_git.bb
+++ b/recipes-bsp/dfe-lld/dfe-lld_git.bb
@@ -6,7 +6,7 @@ include dfe-lld.inc

 PR =3D "${INC_PR}.0"

-EXTRA_OEMAKE =3D "-f makefile_armv7 PDK_INSTALL_PATH=3D${STAGING_INCDIR}"
+EXTRA_OEMAKE =3D "-f makefile:armv7 PDK_INSTALL_PATH=3D${STAGING_INCDIR}"

 do_compile () {
         oe_runmake lib DEVICE=3Dk2l
diff --git a/recipes-bsp/dspdce-fw/dspdce-fw_git.bb b/recipes-bsp/dspdce-fw=
/dspdce-fw_git.bb
index 6ddbe683..4e863099 100644
--- a/recipes-bsp/dspdce-fw/dspdce-fw_git.bb
+++ b/recipes-bsp/dspdce-fw/dspdce-fw_git.bb
@@ -55,11 +55,11 @@ do_install() {
     install -m 0644 ${S}/dra7xx-c66x-dsp.xe66 ${D}${base_libdir}/firmware/=
${TARGET}.${BPN}
 }

-ALTERNATIVE_${PN} =3D "dra7-dsp1-fw.xe66"
+ALTERNATIVE:${PN} =3D "dra7-dsp1-fw.xe66"
 ALTERNATIVE_LINK_NAME[dra7-dsp1-fw.xe66] =3D "${base_libdir}/firmware/${TA=
RGET}"
 ALTERNATIVE_TARGET[dra7-dsp1-fw.xe66] =3D "${base_libdir}/firmware/${TARGE=
T}.${BPN}"
 ALTERNATIVE_PRIORITY =3D "10"

-INSANE_SKIP_${PN} =3D "arch"
+INSANE_SKIP:${PN} =3D "arch"

-FILES_${PN} +=3D "${base_libdir}/firmware/*"
+FILES:${PN} +=3D "${base_libdir}/firmware/*"
diff --git a/recipes-bsp/dsptop/debugss-module-drv_git.bb b/recipes-bsp/dsp=
top/debugss-module-drv_git.bb
index 8f4bbf15..4da565be 100644
--- a/recipes-bsp/dsptop/debugss-module-drv_git.bb
+++ b/recipes-bsp/dsptop/debugss-module-drv_git.bb
@@ -3,9 +3,9 @@ LICENSE =3D "GPLv2"
 LIC_FILES_CHKSUM =3D "file://COPYING.txt;md5=3D9d4316fe434ba450dca4da25348=
ca5a3"

 # This package builds a kernel module, use kernel PR as base and append a =
local
-MACHINE_KERNEL_PR_append =3D "d"
+MACHINE_KERNEL_PR:append =3D "d"
 PR =3D "${MACHINE_KERNEL_PR}"
-PV_append =3D "+git${SRCPV}"
+PV:append =3D "+git${SRCPV}"

 S =3D "${WORKDIR}/git/debugss_module/debugss-mod"

diff --git a/recipes-bsp/dsptop/dsptop_git.bb b/recipes-bsp/dsptop/dsptop_g=
it.bb
index c4a9bf30..e879dcd5 100644
--- a/recipes-bsp/dsptop/dsptop_git.bb
+++ b/recipes-bsp/dsptop/dsptop_git.bb
@@ -21,8 +21,8 @@ do_install() {
 COMPATIBLE_MACHINE =3D "dra7xx|keystone"
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"

-RDEPENDS_${PN} =3D "debugss-module-drv bash"
-RDEPENDS_${PN}_append_keystone =3D " temperature-module-drv"
+RDEPENDS:${PN} =3D "debugss-module-drv bash"
+RDEPENDS:${PN}:append_keystone =3D " temperature-module-drv"

 include dsptop.inc

diff --git a/recipes-bsp/dsptop/libulm_git.bb b/recipes-bsp/dsptop/libulm_g=
it.bb
index 47248ff1..ea2cdb6b 100644
--- a/recipes-bsp/dsptop/libulm_git.bb
+++ b/recipes-bsp/dsptop/libulm_git.bb
@@ -35,12 +35,12 @@ do_install() {
 COMPATIBLE_MACHINE =3D "dra7xx|keystone"
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"

-FILES_${PN}-dev +=3D "\
+FILES:${PN}-dev +=3D "\
     ${datadir}/ti/ulm \
 "

 include dsptop.inc

-ALLOW_EMPTY_${PN} =3D "1"
+ALLOW_EMPTY:${PN} =3D "1"

 PARALLEL_MAKE=3D ""
diff --git a/recipes-bsp/dsptop/temperature-module-drv_git.bb b/recipes-bsp=
/dsptop/temperature-module-drv_git.bb
index 0bd54c5e..1f49ddf8 100644
--- a/recipes-bsp/dsptop/temperature-module-drv_git.bb
+++ b/recipes-bsp/dsptop/temperature-module-drv_git.bb
@@ -3,9 +3,9 @@ LICENSE =3D "GPLv2"
 LIC_FILES_CHKSUM =3D "file://COPYING.txt;md5=3D9d4316fe434ba450dca4da25348=
ca5a3"

 # This package builds a kernel module, use kernel PR as base and append a =
local
-MACHINE_KERNEL_PR_append =3D "a"
+MACHINE_KERNEL_PR:append =3D "a"
 PR =3D "${MACHINE_KERNEL_PR}"
-PV_append =3D "+git${SRCPV}"
+PV:append =3D "+git${SRCPV}"

 S =3D "${WORKDIR}/git/temperature_module/temperature-mod"

diff --git a/recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb b/recipes-bsp/edma=
3-lld/edma3-lld-rtos_git.bb
index 4812afee..25d977f5 100644
--- a/recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb
+++ b/recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb
@@ -50,7 +50,7 @@ TARGETLIST_keystone =3D " \
         a15 \
 "

-PLATFORMLIST_append_dra7xx-evm =3D " \
+PLATFORMLIST:append_dra7xx-evm =3D " \
         tda3xx-evm \
 "

@@ -76,7 +76,7 @@ TARGETLIST_omapl1 =3D " \
         674 \
 "

-EXTRA_OEMAKE_remove =3D "TARGET=3D66"
+EXTRA_OEMAKE:remove =3D "TARGET=3D66"
 FORMAT=3D"ELF"

 S =3D "${WORKDIR}/git"
@@ -139,7 +139,7 @@ do_install () {
     cp ${CP_ARGS} ${S}/* ${D}${EDMA3_LLD_INSTALL_DIR_RECIPE}
 }

-INSANE_SKIP_${PN}-dev =3D "arch ldflags file-rdeps"
+INSANE_SKIP:${PN}-dev =3D "arch ldflags file-rdeps"

-ALLOW_EMPTY_${PN} =3D "1"
-FILES_${PN}-dev +=3D "${EDMA3_LLD_INSTALL_DIR_RECIPE}"
+ALLOW_EMPTY:${PN} =3D "1"
+FILES:${PN}-dev +=3D "${EDMA3_LLD_INSTALL_DIR_RECIPE}"
diff --git a/recipes-bsp/edma3-lld/edma3-lld_git.bb b/recipes-bsp/edma3-lld=
/edma3-lld_git.bb
index 886f0606..f42d8965 100644
--- a/recipes-bsp/edma3-lld/edma3-lld_git.bb
+++ b/recipes-bsp/edma3-lld/edma3-lld_git.bb
@@ -16,7 +16,7 @@ PLATFORMLIST =3D "tci6636k2h-evm \

 PACKAGES =3D+ "${PN}-test"

-FILES_${PN}-test =3D "${bindir}/*"
+FILES:${PN}-test =3D "${bindir}/*"

 S =3D "${WORKDIR}/git"

@@ -74,5 +74,5 @@ do_install () {
                 ${D}/${bindir}/edma3_drv_c66ak2e_a15_sample_a15host_releas=
e.xa15fg
 }

-INSANE_SKIP_${PN} +=3D "ldflags"
-INSANE_SKIP_${PN}-test +=3D "ldflags"
+INSANE_SKIP:${PN} +=3D "ldflags"
+INSANE_SKIP:${PN}-test +=3D "ldflags"
diff --git a/recipes-bsp/emac-lld/emac-lld-rtos_git.bb b/recipes-bsp/emac-l=
ld/emac-lld-rtos_git.bb
index bbf56b49..8f5a7fbb 100644
--- a/recipes-bsp/emac-lld/emac-lld-rtos_git.bb
+++ b/recipes-bsp/emac-lld/emac-lld-rtos_git.bb
@@ -12,13 +12,13 @@ LIC_FILES_CHKSUM =3D "file://emacver.h;beginline=3D1;en=
dline=3D47;md5=3Df66bb3695972ca2a
 COMPATIBLE_MACHINE =3D "ti33x|ti43x|omap-a15|k2g|omapl1|c665x-evm|k3"
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"

-DEPENDS_append =3D " board-rtos osal-rtos"
-DEPENDS_append_ti33x =3D " starterware-rtos"
-DEPENDS_append_ti43x =3D " starterware-rtos"
-DEPENDS_append_k2g  =3D " cppi-lld-rtos qmss-lld-rtos"
+DEPENDS:append =3D " board-rtos osal-rtos"
+DEPENDS:append_ti33x =3D " starterware-rtos"
+DEPENDS:append_ti43x =3D " starterware-rtos"
+DEPENDS:append_k2g  =3D " cppi-lld-rtos qmss-lld-rtos"

-DEPENDS_remove_k3 =3D "board-rtos "
-DEPENDS_append_k3 =3D " udma-lld-rtos trace-rtos"
+DEPENDS:remove_k3 =3D "board-rtos "
+DEPENDS:append_k3 =3D " udma-lld-rtos trace-rtos"

 # Build with make instead of XDC
 TI_PDK_XDCMAKE =3D "0"
diff --git a/recipes-bsp/fatfs-rtos/fatfs-rtos_git.bb b/recipes-bsp/fatfs-r=
tos/fatfs-rtos_git.bb
index 20d8ba8c..5255e582 100644
--- a/recipes-bsp/fatfs-rtos/fatfs-rtos_git.bb
+++ b/recipes-bsp/fatfs-rtos/fatfs-rtos_git.bb
@@ -14,7 +14,7 @@ PACKAGE_ARCH =3D "${MACHINE_ARCH}"

 PR =3D "r0"

-DEPENDS_append =3D " mmcsd-lld-rtos \
+DEPENDS:append =3D " mmcsd-lld-rtos \
                    osal-rtos \
 "

diff --git a/recipes-bsp/faultmanagement/faultmanagement-rtos_git.bb b/reci=
pes-bsp/faultmanagement/faultmanagement-rtos_git.bb
index bf8aba6a..1050645c 100644
--- a/recipes-bsp/faultmanagement/faultmanagement-rtos_git.bb
+++ b/recipes-bsp/faultmanagement/faultmanagement-rtos_git.bb
@@ -25,12 +25,12 @@ PR =3D "r0"

 S =3D "${WORKDIR}/${FAULT_MANAGEMENT_GIT_DESTSUFFIX}"

-DEPENDS_append_keystone =3D " qmss-lld-rtos \
+DEPENDS:append_keystone =3D " qmss-lld-rtos \
                             cppi-lld-rtos \
                             pa-lld-rtos \
 "

-DEPENDS_append_k2hk =3D " aif2-lld-rtos \
+DEPENDS:append_k2hk =3D " aif2-lld-rtos \
 "
 # HTML doc link params
 PDK_COMP_LINK_TEXT =3D "Fault Management"
diff --git a/recipes-bsp/fftc-lld/fftc-lld-rtos_git.bb b/recipes-bsp/fftc-l=
ld/fftc-lld-rtos_git.bb
index c8668c99..7e5db229 100644
--- a/recipes-bsp/fftc-lld/fftc-lld-rtos_git.bb
+++ b/recipes-bsp/fftc-lld/fftc-lld-rtos_git.bb
@@ -14,7 +14,7 @@ PACKAGE_ARCH =3D "${MACHINE_ARCH}"

 PR =3D "r0"

-DEPENDS_append=3D " qmss-lld-rtos \
+DEPENDS:append=3D " qmss-lld-rtos \
                   cppi-lld-rtos \
 "

diff --git a/recipes-bsp/formfactor/formfactor_0.0.bbappend b/recipes-bsp/f=
ormfactor/formfactor_0.0.bbappend
index 72d991c7..4fc41d05 100644
--- a/recipes-bsp/formfactor/formfactor_0.0.bbappend
+++ b/recipes-bsp/formfactor/formfactor_0.0.bbappend
@@ -1 +1 @@
-FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}:"
diff --git a/recipes-bsp/fvid2/fvid2-rtos_git.bb b/recipes-bsp/fvid2/fvid2-=
rtos_git.bb
index 6219f0b3..f542e7df 100644
--- a/recipes-bsp/fvid2/fvid2-rtos_git.bb
+++ b/recipes-bsp/fvid2/fvid2-rtos_git.bb
@@ -14,7 +14,7 @@ PACKAGE_ARCH =3D "${MACHINE_ARCH}"

 PR =3D "r0"

-DEPENDS_append =3D " osal-rtos \
+DEPENDS:append =3D " osal-rtos \
 "

 # Build with make instead of XDC
@@ -62,6 +62,6 @@ do_install() {
     find -name "*.tar" -exec tar xf {} --no-same-owner -C ${D}${PDK_INSTAL=
L_DIR_RECIPE}/packages/ti/drv/fvid2 \;
 }

-FILES_${PN} +=3D "${PDK_INSTALL_DIR_RECIPE}/packages"
+FILES:${PN} +=3D "${PDK_INSTALL_DIR_RECIPE}/packages"

-INSANE_SKIP_${PN} =3D "arch ldflags"
+INSANE_SKIP:${PN} =3D "arch ldflags"
diff --git a/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb b/recip=
es-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
index d36bcd56..a7124ae7 100644
--- a/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
+++ b/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
@@ -7,7 +7,7 @@ inherit module features_check

 REQUIRED_MACHINE_FEATURES =3D "gc320"

-MACHINE_KERNEL_PR_append =3D "i"
+MACHINE_KERNEL_PR:append =3D "i"
 PR =3D "${MACHINE_KERNEL_PR}"

 # Need to branch out with ${PV} var
diff --git a/recipes-bsp/goodix-fw/goodix-fw_git.bb b/recipes-bsp/goodix-fw=
/goodix-fw_git.bb
index 0a9f3ff9..5131f8d9 100644
--- a/recipes-bsp/goodix-fw/goodix-fw_git.bb
+++ b/recipes-bsp/goodix-fw/goodix-fw_git.bb
@@ -26,4 +26,4 @@ do_install() {
         install -m 0644 ${S}/ti-evm/${ORIGIN} ${D}${base_libdir}/firmware/=
${TARGET}
 }

-FILES_${PN} =3D "${base_libdir}/firmware"
+FILES:${PN} =3D "${base_libdir}/firmware"
diff --git a/recipes-bsp/gpio-lld/gpio-lld-rtos_git.bb b/recipes-bsp/gpio-l=
ld/gpio-lld-rtos_git.bb
index bfdb16ce..5f4ed6f4 100644
--- a/recipes-bsp/gpio-lld/gpio-lld-rtos_git.bb
+++ b/recipes-bsp/gpio-lld/gpio-lld-rtos_git.bb
@@ -15,13 +15,13 @@ PACKAGE_ARCH =3D "${MACHINE_ARCH}"
 PR =3D "r0"


-DEPENDS_append =3D " osal-rtos \
+DEPENDS:append =3D " osal-rtos \
 "
-DEPENDS_append_ti33x =3D " starterware-rtos \
+DEPENDS:append_ti33x =3D " starterware-rtos \
 "
-DEPENDS_append_ti43x =3D " starterware-rtos \
+DEPENDS:append_ti43x =3D " starterware-rtos \
 "
-DEPENDS_append_k3 =3D " sciclient-rtos \
+DEPENDS:append_k3 =3D " sciclient-rtos \
 "

 # Build with make instead of XDC
diff --git a/recipes-bsp/gpmc-lld/gpmc-lld-rtos_git.bb b/recipes-bsp/gpmc-l=
ld/gpmc-lld-rtos_git.bb
index 6054d6b7..af669900 100644
--- a/recipes-bsp/gpmc-lld/gpmc-lld-rtos_git.bb
+++ b/recipes-bsp/gpmc-lld/gpmc-lld-rtos_git.bb
@@ -15,11 +15,11 @@ PACKAGE_ARCH =3D "${MACHINE_ARCH}"

 PR =3D "r0"

-DEPENDS_append =3D " osal-rtos \
+DEPENDS:append =3D " osal-rtos \
 "
-DEPENDS_append_ti33x =3D " starterware-rtos \
+DEPENDS:append_ti33x =3D " starterware-rtos \
 "
-DEPENDS_append_ti43x =3D " starterware-rtos \
+DEPENDS:append_ti43x =3D " starterware-rtos \
 "

 # Build with make instead of XDC
diff --git a/recipes-bsp/hplib/hplib-mod_git.bb b/recipes-bsp/hplib/hplib-m=
od_git.bb
index c7217d73..c992b12f 100644
--- a/recipes-bsp/hplib/hplib-mod_git.bb
+++ b/recipes-bsp/hplib/hplib-mod_git.bb
@@ -7,7 +7,7 @@ DEPENDS =3D "hplib"
 include hplib.inc

 # This package builds a kernel module, use kernel PR as base and append a =
local
-MACHINE_KERNEL_PR_append =3D "b"
+MACHINE_KERNEL_PR:append =3D "b"
 PR =3D "${MACHINE_KERNEL_PR}"

 S =3D"${WORKDIR}/git/ti/runtime/hplib/module"
diff --git a/recipes-bsp/hplib/hplib-test_git.bb b/recipes-bsp/hplib/hplib-=
test_git.bb
index 4ba79dbd..62294ef0 100644
--- a/recipes-bsp/hplib/hplib-test_git.bb
+++ b/recipes-bsp/hplib/hplib-test_git.bb
@@ -12,7 +12,7 @@ CHOICELIST =3D "yes no"

 S =3D "${WORKDIR}/git/ti/runtime/hplib"

-EXTRA_OEMAKE +=3D '-f makefile_armv7 PDK_INSTALL_PATH=3D${STAGING_INCDIR}'
+EXTRA_OEMAKE +=3D '-f makefile:armv7 PDK_INSTALL_PATH=3D${STAGING_INCDIR}'

 do_compile () {
         for device in ${DEVICELIST}
diff --git a/recipes-bsp/hplib/hplib_git.bb b/recipes-bsp/hplib/hplib_git.b=
b
index 1423de5b..63eb0b1c 100644
--- a/recipes-bsp/hplib/hplib_git.bb
+++ b/recipes-bsp/hplib/hplib_git.bb
@@ -3,7 +3,7 @@ LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://${WORKDIR}/git/ti/runtime/hplib/src/COPYING.t=
xt;md5=3Db7982a377c680ad71ca2fbb735982462"

 DEPENDS =3D "common-csl-ip rm-lld qmss-lld sa-lld pktlib"
-RDEPENDS_${PN} =3D "hplib-mod"
+RDEPENDS:${PN} =3D "hplib-mod"

 include hplib.inc

@@ -13,7 +13,7 @@ CHOICELIST =3D "yes no"

 S =3D "${WORKDIR}/git/ti/runtime/hplib"

-EXTRA_OEMAKE +=3D "-f makefile_armv7 PDK_INSTALL_PATH=3D${STAGING_INCDIR}"
+EXTRA_OEMAKE +=3D "-f makefile:armv7 PDK_INSTALL_PATH=3D${STAGING_INCDIR}"

 do_compile () {
         for device in ${DEVICELIST}
diff --git a/recipes-bsp/hyplnk-lld/hyplnk-lld-rtos_git.bb b/recipes-bsp/hy=
plnk-lld/hyplnk-lld-rtos_git.bb
index 3be848b3..e86c1d4d 100644
--- a/recipes-bsp/hyplnk-lld/hyplnk-lld-rtos_git.bb
+++ b/recipes-bsp/hyplnk-lld/hyplnk-lld-rtos_git.bb
@@ -6,7 +6,7 @@ require recipes-bsp/hyplnk-lld/hyplnk-lld.inc

 PR =3D "${INC_PR}.0"

-COMPATIBLE_MACHINE_append =3D "|c66x"
+COMPATIBLE_MACHINE:append =3D "|c66x"

 # HTML doc link params
 PDK_COMP_LINK_TEXT =3D "HYPLNK LLD"
diff --git a/recipes-bsp/hyplnk-lld/hyplnk-lld-test_git.bb b/recipes-bsp/hy=
plnk-lld/hyplnk-lld-test_git.bb
index 31b69c26..acf44023 100644
--- a/recipes-bsp/hyplnk-lld/hyplnk-lld-test_git.bb
+++ b/recipes-bsp/hyplnk-lld/hyplnk-lld-test_git.bb
@@ -5,11 +5,11 @@ PR =3D "${INC_PR}.0"
 DEPENDS =3D "common-csl-ip hyplnk-lld"

 do_compile () {
-       make -f makefile_armv7 clean PDK_INSTALL_PATH=3D"${STAGING_INCDIR}"=
 \
+       make -f makefile:armv7 clean PDK_INSTALL_PATH=3D"${STAGING_INCDIR}"=
 \
                 HYPLNK_SRC_DIR=3D"${S}"
         for device in ${DEVICELIST}
         do
-               make -f makefile_armv7 tests examples \
+               make -f makefile:armv7 tests examples \
                         PDK_INSTALL_PATH=3D"${STAGING_INCDIR}" \
                         DEVICE=3D"$device" HYPLNK_SRC_DIR=3D"${S}"
         done
@@ -18,7 +18,7 @@ do_compile () {
 do_install () {
     for device in ${DEVICELIST}
         do
-               make -f makefile_armv7 installbin \
+               make -f makefile:armv7 installbin \
                         PDK_INSTALL_PATH=3D"${STAGING_INCDIR}" DEVICE=3D"$=
device" \
                         HYPLNK_SRC_DIR=3D"${S}" \
                         INSTALL_BIN_BASE_DIR=3D"${D}/${bindir}"
diff --git a/recipes-bsp/hyplnk-lld/hyplnk-lld_git.bb b/recipes-bsp/hyplnk-=
lld/hyplnk-lld_git.bb
index 7848df1d..a7051ec8 100644
--- a/recipes-bsp/hyplnk-lld/hyplnk-lld_git.bb
+++ b/recipes-bsp/hyplnk-lld/hyplnk-lld_git.bb
@@ -5,17 +5,17 @@ PR =3D "${INC_PR}.1"
 DEPENDS =3D "common-csl-ip"

 do_compile () {
-       make -f makefile_armv7 clean PDK_INSTALL_PATH=3D"${STAGING_INCDIR}"=
 \
+       make -f makefile:armv7 clean PDK_INSTALL_PATH=3D"${STAGING_INCDIR}"=
 \
                 HYPLNK_SRC_DIR=3D"${S}"
         for device in ${DEVICELIST}
         do
-               make -f makefile_armv7 lib PDK_INSTALL_PATH=3D"${STAGING_IN=
CDIR}"\
+               make -f makefile:armv7 lib PDK_INSTALL_PATH=3D"${STAGING_IN=
CDIR}"\
                         DEVICE=3D"$device" HYPLNK_SRC_DIR=3D"${S}"
         done
 }

 do_install () {
-       make -f makefile_armv7 install PDK_INSTALL_PATH=3D"${STAGING_INCDIR=
}" \
+       make -f makefile:armv7 install PDK_INSTALL_PATH=3D"${STAGING_INCDIR=
}" \
                 INSTALL_INC_BASE_DIR=3D"${D}/${includedir}" \
                 INSTALL_LIB_BASE_DIR=3D"${D}${libdir}" HYPLNK_SRC_DIR=3D"$=
{S}"
         chown -R root:root ${D}
diff --git a/recipes-bsp/i2c-lld/i2c-lld-rtos_git.bb b/recipes-bsp/i2c-lld/=
i2c-lld-rtos_git.bb
index 5a3c1d64..ce7ed1a5 100644
--- a/recipes-bsp/i2c-lld/i2c-lld-rtos_git.bb
+++ b/recipes-bsp/i2c-lld/i2c-lld-rtos_git.bb
@@ -15,21 +15,21 @@ PACKAGE_ARCH =3D "${MACHINE_ARCH}"

 PR =3D "r0"

-DEPENDS_append =3D " osal-rtos \
+DEPENDS:append =3D " osal-rtos \
 "
-DEPENDS_append_ti33x =3D " starterware-rtos \
+DEPENDS:append_ti33x =3D " starterware-rtos \
                          pruss-lld-rtos \
 "
-DEPENDS_append_ti43x =3D " starterware-rtos \
+DEPENDS:append_ti43x =3D " starterware-rtos \
                          pruss-lld-rtos \
 "
-DEPENDS_append_am57xx-evm =3D " pruss-lld-rtos \
+DEPENDS:append_am57xx-evm =3D " pruss-lld-rtos \
 "

-DEPENDS_append_k2g =3D " pruss-lld-rtos \
+DEPENDS:append_k2g =3D " pruss-lld-rtos \
 "

-DEPENDS_append_j7 =3D " sciclient-rtos \
+DEPENDS:append_j7 =3D " sciclient-rtos \
 "

 # Build with make instead of XDC
@@ -39,7 +39,7 @@ TI_PDK_XDCMAKE =3D "0"
 export PDK_I2C_ROOT_PATH =3D"${WORKDIR}/build"
 export DEST_ROOT=3D"${S}"

-INSANE_SKIP_${PN} =3D "arch"
+INSANE_SKIP:${PN} =3D "arch"

 # HTML doc link params
 PDK_COMP_LINK_TEXT =3D "I2C LLD"
diff --git a/recipes-bsp/ibl-boot/ibl-boot-rtos_git.bb b/recipes-bsp/ibl-bo=
ot/ibl-boot-rtos_git.bb
index 59b75b3a..1e072272 100644
--- a/recipes-bsp/ibl-boot/ibl-boot-rtos_git.bb
+++ b/recipes-bsp/ibl-boot/ibl-boot-rtos_git.bb
@@ -33,7 +33,7 @@ PR =3D "r2"

 S =3D "${WORKDIR}/git"

-PATH_prepend =3D "${TI_CGT6X_7_INSTALL_DIR}/bin:"
+PATH:prepend =3D "${TI_CGT6X_7_INSTALL_DIR}/bin:"

 IBLTARGETS =3D ""
 IBLTARGETS_c665x-evm =3D "evm_c6657_i2c"
@@ -66,10 +66,10 @@ do_install() {
     cp -rP --preserve=3Dmode,links,timestamps --no-preserve=3Downership * =
${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/boot/ibl
 }

-FILES_${PN} +=3D "${PDK_INSTALL_DIR_RECIPE}/packages"
+FILES:${PN} +=3D "${PDK_INSTALL_DIR_RECIPE}/packages"

 INHIBIT_PACKAGE_STRIP =3D "1"
 INHIBIT_SYSROOT_STRIP =3D "1"
 INHIBIT_PACKAGE_DEBUG_SPLIT =3D "1"

-INSANE_SKIP_${PN} =3D "arch file-rdeps"
+INSANE_SKIP:${PN} =3D "arch file-rdeps"
diff --git a/recipes-bsp/icss-emac-lld/icss-emac-lld-rtos_git.bb b/recipes-=
bsp/icss-emac-lld/icss-emac-lld-rtos_git.bb
index 882ce997..0c0fc6b8 100644
--- a/recipes-bsp/icss-emac-lld/icss-emac-lld-rtos_git.bb
+++ b/recipes-bsp/icss-emac-lld/icss-emac-lld-rtos_git.bb
@@ -5,12 +5,12 @@ require icss-emac-lld.inc

 PR =3D "${INC_PR}.0"

-DEPENDS_append =3D " osal-rtos \
+DEPENDS:append =3D " osal-rtos \
                    pruss-lld-rtos \
 "
-DEPENDS_append_ti33x =3D " starterware-rtos \
+DEPENDS:append_ti33x =3D " starterware-rtos \
 "
-DEPENDS_append_ti43x =3D " starterware-rtos \
+DEPENDS:append_ti43x =3D " starterware-rtos \
 "

 # Build with make instead of XDC
@@ -22,4 +22,4 @@ export DEST_ROOT=3D"${S}"
 # HTML doc link params
 PDK_COMP_LINK_TEXT =3D "ICSS-EMAC LLD"

-INSANE_SKIP_${PN} =3D "arch"
+INSANE_SKIP:${PN} =3D "arch"
diff --git a/recipes-bsp/icss-emac-lld/icss-emac-lld-test_git.bb b/recipes-=
bsp/icss-emac-lld/icss-emac-lld-test_git.bb
index 5093d7ce..badef253 100644
--- a/recipes-bsp/icss-emac-lld/icss-emac-lld-test_git.bb
+++ b/recipes-bsp/icss-emac-lld/icss-emac-lld-test_git.bb
@@ -2,14 +2,14 @@ DESCRIPTION =3D "TI ICSS-EMAC low level driver tests"

 DEPENDS=3D"common-csl-ip pruss-lld icss-emac-lld osal ti-pdk-build-rtos ic=
ss-emac-lld-rtos"

-DEPENDS_append_ti33x =3D " starterware"
-DEPENDS_append_ti43x =3D " starterware"
+DEPENDS:append_ti33x =3D " starterware"
+DEPENDS:append_ti43x =3D " starterware"

 include icss-emac-lld.inc

 PR =3D "${INC_PR}.0"

-EXTRA_OEMAKE +=3D "-f makefile_armv7 PDK_INSTALL_PATH=3D${STAGING_INCDIR} =
PDK_PKG_PATH=3D${STAGING_DATADIR}/ti/ti-pdk-tree/packages ICSS_EMAC_SRC_DIR=
=3D${S}"
+EXTRA_OEMAKE +=3D "-f makefile:armv7 PDK_INSTALL_PATH=3D${STAGING_INCDIR} =
PDK_PKG_PATH=3D${STAGING_DATADIR}/ti/ti-pdk-tree/packages ICSS_EMAC_SRC_DIR=
=3D${S}"

 DEVICE_LIST ?=3D "${TI_PDK_LIMIT_SOCS}"

diff --git a/recipes-bsp/icss-emac-lld/icss-emac-lld_git.bb b/recipes-bsp/i=
css-emac-lld/icss-emac-lld_git.bb
index 4c305db6..1e5b1f2a 100644
--- a/recipes-bsp/icss-emac-lld/icss-emac-lld_git.bb
+++ b/recipes-bsp/icss-emac-lld/icss-emac-lld_git.bb
@@ -11,7 +11,7 @@ TARGET_NAME_ti33x =3D "SOC_AM335x"
 TARGET_NAME_ti43x =3D "SOC_AM437x"
 TARGET_NAME_k2g =3D "SOC_K2G"

-EXTRA_OEMAKE +=3D "-f makefile_armv7 PDK_INSTALL_PATH=3D${STAGING_INCDIR} =
TARGET=3D${TARGET_NAME}"
+EXTRA_OEMAKE +=3D "-f makefile:armv7 PDK_INSTALL_PATH=3D${STAGING_INCDIR} =
TARGET=3D${TARGET_NAME}"

 do_compile () {
 #   Build the lib
diff --git a/recipes-bsp/iolink-lld/iolink-lld-rtos_git.bb b/recipes-bsp/io=
link-lld/iolink-lld-rtos_git.bb
index c0c27b60..d50c19f3 100644
--- a/recipes-bsp/iolink-lld/iolink-lld-rtos_git.bb
+++ b/recipes-bsp/iolink-lld/iolink-lld-rtos_git.bb
@@ -14,9 +14,9 @@ PACKAGE_ARCH =3D "${MACHINE_ARCH}"

 PR =3D "r2"

-DEPENDS_append =3D " osal-rtos \
+DEPENDS:append =3D " osal-rtos \
 "
-DEPENDS_append_ti43x =3D " starterware-rtos \
+DEPENDS:append_ti43x =3D " starterware-rtos \
                          pruss-lld-rtos \
 "

@@ -27,7 +27,7 @@ TI_PDK_XDCMAKE =3D "0"
 export PDK_IOLINK_ROOT_PATH =3D"${WORKDIR}/build"
 export DEST_ROOT=3D"${S}"

-INSANE_SKIP_${PN} =3D "arch"
+INSANE_SKIP:${PN} =3D "arch"

 # HTML doc link params
 PDK_COMP_LINK_TEXT =3D "IOLINK LLD"
diff --git a/recipes-bsp/ipc-lld/ipc-lld-examples-rtos_git.bb b/recipes-bsp=
/ipc-lld/ipc-lld-examples-rtos_git.bb
index 79e5bdb9..c905fe4b 100644
--- a/recipes-bsp/ipc-lld/ipc-lld-examples-rtos_git.bb
+++ b/recipes-bsp/ipc-lld/ipc-lld-examples-rtos_git.bb
@@ -62,7 +62,7 @@ do_install() {
     done
 }

-do_install_append_j7() {
+do_install:append_j7() {
     #copy ipc_echo_testb binaries for J721
     install -m 0644 ${REMOTE_FWB_BIN_DIR}/$board/ipc_echo_testb_mcu1_0_rel=
ease.xer5f ${D}${DST_BIN_PATH}
     install -m 0644 ${REMOTE_FWB_BIN_DIR}/$board/ipc_echo_testb_mcu1_1_rel=
ease.xer5f ${D}${DST_BIN_PATH}
@@ -79,16 +79,16 @@ do_install_append_j7() {
     install -m 0644 ${REMOTE_FWB_BIN_DIR}/$board/ipc_echo_testb_mcu3_1_rel=
ease_strip.xer5f ${D}${DST_BIN_PATH}
 }

-do_install_append_am65xx() {
+do_install:append_am65xx() {
     cp ${CP_ARGS} ${REMOTE_FW_DIR}/ex04_linux_baremetal_2core_echo_test/bi=
n -d ${D}/ex04_linux_baremetal_2core_echo_test
 }

 # Set up names for the firmwares
-ALTERNATIVE_${PN}_am65xx =3D "\
+ALTERNATIVE:${PN}_am65xx =3D "\
                     am65x-mcu-r5f0_0-fw \
                     am65x-mcu-r5f0_1-fw \
                     "
-ALTERNATIVE_${PN}_j7 =3D "\
+ALTERNATIVE:${PN}_j7 =3D "\
                     j7-mcu-r5f0_0-fw \
                     j7-mcu-r5f0_1-fw \
                     j7-main-r5f0_0-fw \
@@ -149,14 +149,14 @@ ALTERNATIVE_PRIORITY =3D "10"
 PACKAGES =3D+ "${PN}-rtos"

 # make sure that lib/firmware, and all its contents are part of the packag=
e
-FILES_${PN} +=3D "${base_libdir}/firmware"
+FILES:${PN} +=3D "${base_libdir}/firmware"

-FILES_${PN}-rtos +=3D "ex02_bios_multicore_echo_test"
-FILES_${PN}-rtos +=3D "ex01_bios_2core_echo_test"
-FILES_${PN}-rtos +=3D "ex03_linux_bios_2core_echo_test"
-FILES_${PN}-rtos +=3D "ex04_linux_baremetal_2core_echo_test"
+FILES:${PN}-rtos +=3D "ex02_bios_multicore_echo_test"
+FILES:${PN}-rtos +=3D "ex01_bios_2core_echo_test"
+FILES:${PN}-rtos +=3D "ex03_linux_bios_2core_echo_test"
+FILES:${PN}-rtos +=3D "ex04_linux_baremetal_2core_echo_test"

-INSANE_SKIP_${PN} =3D "arch ldflags file-rdeps"
-INSANE_SKIP_${PN}-rtos =3D "arch ldflags file-rdeps"
+INSANE_SKIP:${PN} =3D "arch ldflags file-rdeps"
+INSANE_SKIP:${PN}-rtos =3D "arch ldflags file-rdeps"

-INSANE_SKIP_${PN}-dbg =3D "arch"
+INSANE_SKIP:${PN}-dbg =3D "arch"
diff --git a/recipes-bsp/ipc-lld/ipc-lld-fw_git.bb b/recipes-bsp/ipc-lld/ip=
c-lld-fw_git.bb
index 1be28365..dd76de54 100644
--- a/recipes-bsp/ipc-lld/ipc-lld-fw_git.bb
+++ b/recipes-bsp/ipc-lld/ipc-lld-fw_git.bb
@@ -26,21 +26,21 @@ PLATFORM_am65xx =3D "am65xx"
 PLATFORM_j7 =3D "j7-evm"

 # make sure that lib/firmware, and all its contents are part of the packag=
e
-FILES_${PN} +=3D "${base_libdir}/firmware"
+FILES:${PN} +=3D "${base_libdir}/firmware"

 # install all R5 & DSP ipc echo test binaries in lib/firmware/pdk-ipc, wit=
h softlinks up a level
 do_install() {
     install -d ${D}${base_libdir}/firmware/pdk-ipc
 }

-do_install_append_am65xx() {
+do_install:append_am65xx() {
     install -m 0644 ${AM65X_R5_FW_DIR}/ipc_echo_test_mcu1_0_release.xer5f =
${D}${base_libdir}/firmware/pdk-ipc/
     install -m 0644 ${AM65X_R5_FW_DIR}/ipc_echo_test_mcu1_0_release.strip.=
xer5f ${D}${base_libdir}/firmware/pdk-ipc/
     install -m 0644 ${AM65X_R5_FW_DIR}/ipc_echo_test_mcu1_1_release.xer5f =
${D}${base_libdir}/firmware/pdk-ipc/
     install -m 0644 ${AM65X_R5_FW_DIR}/ipc_echo_test_mcu1_1_release.strip.=
xer5f ${D}${base_libdir}/firmware/pdk-ipc/
 }

-do_install_append_j7() {
+do_install:append_j7() {
     install -m 0644 ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_mcu1_0_release.xe=
r5f ${D}${base_libdir}/firmware/pdk-ipc/
     install -m 0644 ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_mcu1_0_release.st=
rip.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
     install -m 0644 ${J721E_R5_DSP_FW_DIR}/ipc_echo_testb_mcu1_0_release.x=
er5f ${D}${base_libdir}/firmware/pdk-ipc/
@@ -74,11 +74,11 @@ do_install_append_j7() {
 }

 # Set up names for the firmwares
-ALTERNATIVE_${PN}_am65xx =3D "\
+ALTERNATIVE:${PN}_am65xx =3D "\
                     am65x-mcu-r5f0_0-fw \
                     am65x-mcu-r5f0_1-fw \
                     "
-ALTERNATIVE_${PN}_j7 =3D "\
+ALTERNATIVE:${PN}_j7 =3D "\
                     j7-mcu-r5f0_0-fw \
                     j7-mcu-r5f0_1-fw \
                     j7-main-r5f0_0-fw \
@@ -189,7 +189,7 @@ INHIBIT_SYSROOT_STRIP =3D "1"
 # This is used to prevent the build system to split the debug info in a se=
parate file
 INHIBIT_PACKAGE_DEBUG_SPLIT =3D "1"
 # As it likely to be a different arch from the Yocto build, disable checki=
ng by adding "arch" to INSANE_SKIP
-INSANE_SKIP_${PN} +=3D "arch"
+INSANE_SKIP:${PN} +=3D "arch"

 # we don't want to configure and build the source code
 do_compile[noexec] =3D "1"
diff --git a/recipes-bsp/ipc-lld/ipc-lld-rtos_git.bb b/recipes-bsp/ipc-lld/=
ipc-lld-rtos_git.bb
index e005ea70..34f1f035 100644
--- a/recipes-bsp/ipc-lld/ipc-lld-rtos_git.bb
+++ b/recipes-bsp/ipc-lld/ipc-lld-rtos_git.bb
@@ -38,8 +38,8 @@ do_install() {
     find -name "*.tar" -exec tar xf {} --no-same-owner -C ${D}${PDK_INSTAL=
L_DIR_RECIPE}/packages/ti/drv/ipc \;
 }

-FILES_${PN} +=3D "${PDK_INSTALL_DIR_RECIPE}/packages"
+FILES:${PN} +=3D "${PDK_INSTALL_DIR_RECIPE}/packages"

-INSANE_SKIP_${PN} =3D "arch ldflags file-rdeps"
+INSANE_SKIP:${PN} =3D "arch ldflags file-rdeps"

-INSANE_SKIP_${PN}-dbg =3D "arch"
+INSANE_SKIP:${PN}-dbg =3D "arch"
diff --git a/recipes-bsp/ipc-lld/ipc-lld.inc b/recipes-bsp/ipc-lld/ipc-lld.=
inc
index 2aea055f..57cdaee9 100644
--- a/recipes-bsp/ipc-lld/ipc-lld.inc
+++ b/recipes-bsp/ipc-lld/ipc-lld.inc
@@ -26,4 +26,4 @@ PDK_COMP_LINK_TEXT =3D "IPCLLD"

 EXTRA_OEMAKE =3D "PDK_INSTALL_PATH=3D${PDK_INSTALL_PATH} "

-TI_PDK_LIMIT_CORES_append_am65xx-evm =3D " mcu1_1 "
+TI_PDK_LIMIT_CORES:append_am65xx-evm =3D " mcu1_1 "
diff --git a/recipes-bsp/ipumm-fw/ipumm-fw_git.bb b/recipes-bsp/ipumm-fw/ip=
umm-fw_git.bb
index 380c274a..14d28258 100644
--- a/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
+++ b/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
@@ -9,7 +9,7 @@ inherit features_check

 REQUIRED_MACHINE_FEATURES =3D "mmip"

-RDEPENDS_${PN} =3D "libdce"
+RDEPENDS:${PN} =3D "libdce"

 SRC_URI =3D "git://git.ti.com/ivimm/ipumm.git;protocol=3Dgit"

@@ -59,9 +59,9 @@ do_install() {
     install -m 0644 ${S}/${TARGET_MAP} ${D}${base_libdir}/firmware/${TARGE=
T}.map
 }

-ALTERNATIVE_${PN} =3D "dra7-ipu2-fw.xem4"
+ALTERNATIVE:${PN} =3D "dra7-ipu2-fw.xem4"
 ALTERNATIVE_LINK_NAME[dra7-ipu2-fw.xem4] =3D "${base_libdir}/firmware/${TA=
RGET}"
 ALTERNATIVE_TARGET[dra7-ipu2-fw.xem4] =3D "${base_libdir}/firmware/${TARGE=
T}.${BPN}"
 ALTERNATIVE_PRIORITY =3D "20"

-FILES_${PN} +=3D "${base_libdir}/firmware/*"
+FILES:${PN} +=3D "${base_libdir}/firmware/*"
diff --git a/recipes-bsp/iqn2-lld/iqn2-lld-test_git.bb b/recipes-bsp/iqn2-l=
ld/iqn2-lld-test_git.bb
index f276c4b3..3a6da221 100644
--- a/recipes-bsp/iqn2-lld/iqn2-lld-test_git.bb
+++ b/recipes-bsp/iqn2-lld/iqn2-lld-test_git.bb
@@ -6,7 +6,7 @@ include iqn2-lld.inc

 PR =3D "${INC_PR}.0"

-EXTRA_OEMAKE =3D "-f makefile_armv7 PDK_INSTALL_PATH=3D${STAGING_INCDIR} I=
QN2_SRC_DIR=3D${WORKDIR}/git"
+EXTRA_OEMAKE =3D "-f makefile:armv7 PDK_INSTALL_PATH=3D${STAGING_INCDIR} I=
QN2_SRC_DIR=3D${WORKDIR}/git"

 do_compile () {
         oe_runmake clean DEVICE=3Dk2l
diff --git a/recipes-bsp/iqn2-lld/iqn2-lld_git.bb b/recipes-bsp/iqn2-lld/iq=
n2-lld_git.bb
index a0c2ef87..a342f6c2 100644
--- a/recipes-bsp/iqn2-lld/iqn2-lld_git.bb
+++ b/recipes-bsp/iqn2-lld/iqn2-lld_git.bb
@@ -6,7 +6,7 @@ include iqn2-lld.inc

 PR =3D "${INC_PR}.0"

-EXTRA_OEMAKE =3D "-f makefile_armv7 PDK_INSTALL_PATH=3D${STAGING_INCDIR}"
+EXTRA_OEMAKE =3D "-f makefile:armv7 PDK_INSTALL_PATH=3D${STAGING_INCDIR}"

 do_configure () {
         sed -i -e 's/march=3Darmv7-a/march=3Darmv7ve/' build/armv7/libiqn2=
_aearmv7.mk
diff --git a/recipes-bsp/mad-utils/mad-utils-rtos_git.bb b/recipes-bsp/mad-=
utils/mad-utils-rtos_git.bb
index 0144aad2..6eed9786 100644
--- a/recipes-bsp/mad-utils/mad-utils-rtos_git.bb
+++ b/recipes-bsp/mad-utils/mad-utils-rtos_git.bb
@@ -23,7 +23,7 @@ PR =3D "r0"
 S =3D "${WORKDIR}/git"

 export C6X_BASE_DIR=3D"${TI_CGT6X_7_INSTALL_DIR}"
-PATH_prepend =3D "${TI_CGT6X_7_INSTALL_DIR}/bin:"
+PATH:prepend =3D "${TI_CGT6X_7_INSTALL_DIR}/bin:"

 DEVICE =3D ""
 DEVICE_c665x-evm =3D "C6657"
@@ -52,6 +52,6 @@ do_install() {
     cp -rP --preserve=3Dmode,links,timestamps --no-preserve=3Downership * =
${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/boot/mad-utils
 }

-FILES_${PN} +=3D "${PDK_INSTALL_DIR_RECIPE}/packages/ti/boot/mad-utils"
+FILES:${PN} +=3D "${PDK_INSTALL_DIR_RECIPE}/packages/ti/boot/mad-utils"

-INSANE_SKIP_${PN} +=3D "arch staticdev ldflags file-rdeps"
+INSANE_SKIP:${PN} +=3D "arch staticdev ldflags file-rdeps"
diff --git a/recipes-bsp/mcasp-lld/mcasp-lld-rtos_git.bb b/recipes-bsp/mcas=
p-lld/mcasp-lld-rtos_git.bb
index 5775d84b..76eb07b9 100644
--- a/recipes-bsp/mcasp-lld/mcasp-lld-rtos_git.bb
+++ b/recipes-bsp/mcasp-lld/mcasp-lld-rtos_git.bb
@@ -16,16 +16,16 @@ PACKAGE_ARCH =3D "${MACHINE_ARCH}"
 PR =3D "r0"


-DEPENDS_append =3D " edma3-lld-rtos \
+DEPENDS:append =3D " edma3-lld-rtos \
                    osal-rtos \
 "
-DEPENDS_append_ti43x =3D " starterware-rtos \
+DEPENDS:append_ti43x =3D " starterware-rtos \
 "
-DEPENDS_append_ti33x =3D " starterware-rtos \
+DEPENDS:append_ti33x =3D " starterware-rtos \
 "

-DEPENDS_remove_k3 =3D "edma3-lld-rtos "
-DEPENDS_append_k3 =3D " udma-lld-rtos \
+DEPENDS:remove_k3 =3D "edma3-lld-rtos "
+DEPENDS:append_k3 =3D " udma-lld-rtos \
 "

 # Build with make instead of XDC
@@ -35,7 +35,7 @@ export PDK_MCASP_ROOT_PATH =3D"${WORKDIR}/build"
 export DEST_ROOT=3D"${S}"

 export EDMA3LLD_BIOS6_INSTALLDIR =3D "${EDMA3_LLD_INSTALL_DIR}"
-XDCPATH_append =3D ";${EDMA3_LLD_INSTALL_DIR}/packages"
+XDCPATH:append =3D ";${EDMA3_LLD_INSTALL_DIR}/packages"

 # HTML doc link params
 PDK_COMP_LINK_TEXT =3D "MCASP LLD"
diff --git a/recipes-bsp/mcbsp-lld/mcbsp-lld-rtos_git.bb b/recipes-bsp/mcbs=
p-lld/mcbsp-lld-rtos_git.bb
index 96ac5d75..f1eeccdd 100644
--- a/recipes-bsp/mcbsp-lld/mcbsp-lld-rtos_git.bb
+++ b/recipes-bsp/mcbsp-lld/mcbsp-lld-rtos_git.bb
@@ -15,11 +15,11 @@ PACKAGE_ARCH =3D "${MACHINE_ARCH}"
 PR =3D "r0"


-DEPENDS_append =3D " edma3-lld-rtos \
+DEPENDS:append =3D " edma3-lld-rtos \
 "

 export EDMA3LLD_BIOS6_INSTALLDIR =3D "${EDMA3_LLD_INSTALL_DIR}"
-XDCPATH_append =3D ";${EDMA3_LLD_INSTALL_DIR}/packages"
+XDCPATH:append =3D ";${EDMA3_LLD_INSTALL_DIR}/packages"

 TI_PDK_XDCMAKE =3D "0"

diff --git a/recipes-bsp/mmap-lld/mmap-lld-test_git.bb b/recipes-bsp/mmap-l=
ld/mmap-lld-test_git.bb
index 8a09524e..4dd8289a 100644
--- a/recipes-bsp/mmap-lld/mmap-lld-test_git.bb
+++ b/recipes-bsp/mmap-lld/mmap-lld-test_git.bb
@@ -6,7 +6,7 @@ PR =3D "${INC_PR}.0"
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"

 DEPENDS=3D"common-csl-ip mmap-lld"
-RDEPENDS_${PN}=3D"uio-module-drv"
+RDEPENDS:${PN}=3D"uio-module-drv"

 DEVICELIST_k2hk =3D "k2h k2k"
 DEVICELIST_k2e =3D "k2e"
@@ -20,12 +20,12 @@ CHOICELIST =3D " yes \
 do_compile () {
         for device in ${DEVICELIST}
         do
-               make -f makefile_armv7 clean \
+               make -f makefile:armv7 clean \
                         PDK_INSTALL_PATH=3D"${STAGING_INCDIR}" \
                         DEVICE=3D"$device" MPAX_SRC_DIR=3D"${S}"
                 for choice in ${CHOICELIST}
                 do
-                       make -f makefile_armv7 tests examples \
+                       make -f makefile:armv7 tests examples \
                                 PDK_INSTALL_PATH=3D${STAGING_INCDIR} \
                                 DEVICE=3D"$device" MPAX_SRC_DIR=3D"${S}" \
                                 USEDYNAMIC_LIB=3D"$choice"
@@ -36,7 +36,7 @@ do_compile () {
 do_install () {
         for device in ${DEVICELIST}
         do
-               make -f makefile_armv7 installbin \
+               make -f makefile:armv7 installbin \
                 PDK_INSTALL_PATH=3D${STAGING_INCDIR} \
                 DEVICE=3D"$device" MPAX_SRC_DIR=3D"${S}" \
                 INSTALL_BIN_BASE_DIR=3D"${D}/${bindir}"
diff --git a/recipes-bsp/mmap-lld/mmap-lld_git.bb b/recipes-bsp/mmap-lld/mm=
ap-lld_git.bb
index cfc5d4c9..29ef7042 100644
--- a/recipes-bsp/mmap-lld/mmap-lld_git.bb
+++ b/recipes-bsp/mmap-lld/mmap-lld_git.bb
@@ -6,10 +6,10 @@ PR =3D "${INC_PR}.0"
 DEPENDS=3D"common-csl-ip"

 do_compile () {
-       make -f makefile_armv7 clean lib PDK_INSTALL_PATH=3D${STAGING_INCDI=
R}
+       make -f makefile:armv7 clean lib PDK_INSTALL_PATH=3D${STAGING_INCDI=
R}
 }

 do_install () {
-       make -f makefile_armv7 install PDK_INSTALL_PATH=3D${STAGING_INCDIR}=
 INSTALL_INC_BASE_DIR=3D${D}/${includedir} INSTALL_LIB_BASE_DIR=3D${D}${lib=
dir}
+       make -f makefile:armv7 install PDK_INSTALL_PATH=3D${STAGING_INCDIR}=
 INSTALL_INC_BASE_DIR=3D${D}/${includedir} INSTALL_LIB_BASE_DIR=3D${D}${lib=
dir}
         chown -R root:root ${D}
 }
diff --git a/recipes-bsp/mmcsd-lld/mmcsd-lld-rtos_git.bb b/recipes-bsp/mmcs=
d-lld/mmcsd-lld-rtos_git.bb
index 8c027cdd..5a79d9da 100644
--- a/recipes-bsp/mmcsd-lld/mmcsd-lld-rtos_git.bb
+++ b/recipes-bsp/mmcsd-lld/mmcsd-lld-rtos_git.bb
@@ -16,16 +16,16 @@ PACKAGE_ARCH =3D "${MACHINE_ARCH}"
 PR =3D "r0"


-DEPENDS_append =3D " edma3-lld-rtos \
+DEPENDS:append =3D " edma3-lld-rtos \
                    osal-rtos \
 "
-DEPENDS_append_ti33x =3D " starterware-rtos \
+DEPENDS:append_ti33x =3D " starterware-rtos \
 "
-DEPENDS_append_ti43x =3D " starterware-rtos \
+DEPENDS:append_ti43x =3D " starterware-rtos \
 "
-DEPENDS_remove_k3 =3D "edma3-lld-rtos "
+DEPENDS:remove_k3 =3D "edma3-lld-rtos "

-DEPENDS_append_k3 =3D " sciclient-rtos \
+DEPENDS:append_k3 =3D " sciclient-rtos \
 "

 # Build with make instead of XDC
@@ -35,7 +35,7 @@ export PDK_MMCSD_ROOT_PATH =3D"${WORKDIR}/build"
 export DEST_ROOT=3D"${S}"

 export EDMA3LLD_BIOS6_INSTALLDIR =3D "${EDMA3_LLD_INSTALL_DIR}"
-XDCPATH_append =3D ";${EDMA3_LLD_INSTALL_DIR}/packages"
+XDCPATH:append =3D ";${EDMA3_LLD_INSTALL_DIR}/packages"

 # HTML doc link params
 PDK_COMP_LINK_TEXT =3D "MMCSD LLD"
diff --git a/recipes-bsp/netcp-pa-fw/netcp-pa-fw_git.bb b/recipes-bsp/netcp=
-pa-fw/netcp-pa-fw_git.bb
index fe7fa2b2..9e0f4b24 100644
--- a/recipes-bsp/netcp-pa-fw/netcp-pa-fw_git.bb
+++ b/recipes-bsp/netcp-pa-fw/netcp-pa-fw_git.bb
@@ -53,4 +53,4 @@ do_install() {
         done
 }

-FILES_${PN} =3D "${base_libdir}/firmware"
+FILES:${PN} =3D "${base_libdir}/firmware"
diff --git a/recipes-bsp/netcp-sa-fw/netcp-sa-fw_git.bb b/recipes-bsp/netcp=
-sa-fw/netcp-sa-fw_git.bb
index 56373a73..9d1ffe34 100644
--- a/recipes-bsp/netcp-sa-fw/netcp-sa-fw_git.bb
+++ b/recipes-bsp/netcp-sa-fw/netcp-sa-fw_git.bb
@@ -26,4 +26,4 @@ do_install() {
         install -m 0644 ${S}/ti-keystone/${TARGET} ${D}${base_libdir}/firm=
ware/${TARGET}
 }

-FILES_${PN} =3D "${base_libdir}/firmware"
+FILES:${PN} =3D "${base_libdir}/firmware"
diff --git a/recipes-bsp/nwal-lld/nwal-lld-rtos_git.bb b/recipes-bsp/nwal-l=
ld/nwal-lld-rtos_git.bb
index b5c4bf13..3153f08a 100644
--- a/recipes-bsp/nwal-lld/nwal-lld-rtos_git.bb
+++ b/recipes-bsp/nwal-lld/nwal-lld-rtos_git.bb
@@ -6,7 +6,7 @@ require recipes-bsp/nwal-lld/nwal-lld.inc

 PR =3D "${INC_PR}.0"

-DEPENDS_append =3D " cppi-lld-rtos \
+DEPENDS:append =3D " cppi-lld-rtos \
                    pa-lld-rtos \
                    pktlib-rtos \
                    qmss-lld-rtos \
diff --git a/recipes-bsp/nwal-lld/nwal-lld-test_git.bb b/recipes-bsp/nwal-l=
ld/nwal-lld-test_git.bb
index 79528a0a..1c7870d6 100644
--- a/recipes-bsp/nwal-lld/nwal-lld-test_git.bb
+++ b/recipes-bsp/nwal-lld/nwal-lld-test_git.bb
@@ -6,7 +6,7 @@ include nwal-lld.inc

 PR =3D "${INC_PR}.0"

-EXTRA_OEMAKE +=3D "-f makefile_armv7 PDK_INSTALL_PATH=3D${STAGING_INCDIR}"
+EXTRA_OEMAKE +=3D "-f makefile:armv7 PDK_INSTALL_PATH=3D${STAGING_INCDIR}"

 do_compile () {
         for device in ${DEVICELIST}
diff --git a/recipes-bsp/nwal-lld/nwal-lld_git.bb b/recipes-bsp/nwal-lld/nw=
al-lld_git.bb
index a9690cab..c898ab4b 100644
--- a/recipes-bsp/nwal-lld/nwal-lld_git.bb
+++ b/recipes-bsp/nwal-lld/nwal-lld_git.bb
@@ -6,7 +6,7 @@ include nwal-lld.inc

 PR =3D "${INC_PR}.0"

-EXTRA_OEMAKE +=3D "-f makefile_armv7 PDK_INSTALL_PATH=3D${STAGING_INCDIR}"
+EXTRA_OEMAKE +=3D "-f makefile:armv7 PDK_INSTALL_PATH=3D${STAGING_INCDIR}"

 do_compile () {
         for device in ${DEVICELIST}
diff --git a/recipes-bsp/osal/osal-rtos_git.bb b/recipes-bsp/osal/osal-rtos=
_git.bb
index a718f7ca..2ca3e8ee 100644
--- a/recipes-bsp/osal/osal-rtos_git.bb
+++ b/recipes-bsp/osal/osal-rtos_git.bb
@@ -3,10 +3,10 @@ require recipes-bsp/osal/osal.inc

 PR =3D "${INC_PR}.0"

-COMPATIBLE_MACHINE_append =3D "|c66x|k3"
+COMPATIBLE_MACHINE:append =3D "|c66x|k3"

-DEPENDS_append_ti33x =3D " starterware-rtos"
-DEPENDS_append_ti43x =3D " starterware-rtos"
+DEPENDS:append_ti33x =3D " starterware-rtos"
+DEPENDS:append_ti43x =3D " starterware-rtos"

 # Build with make instead of XDC
 TI_PDK_XDCMAKE =3D "0"
diff --git a/recipes-bsp/osal/osal-test_git.bb b/recipes-bsp/osal/osal-test=
_git.bb
index 354aa797..9dfa2447 100644
--- a/recipes-bsp/osal/osal-test_git.bb
+++ b/recipes-bsp/osal/osal-test_git.bb
@@ -6,7 +6,7 @@ include osal.inc

 PR =3D "${INC_PR}.1"

-EXTRA_OEMAKE =3D "-f makefile_armv7 PDK_INSTALL_PATH=3D${STAGING_INCDIR} O=
SAL_SRC_DIR=3D${S}"
+EXTRA_OEMAKE =3D "-f makefile:armv7 PDK_INSTALL_PATH=3D${STAGING_INCDIR} O=
SAL_SRC_DIR=3D${S}"

 do_compile () {
 #   Build the tests
diff --git a/recipes-bsp/osal/osal_git.bb b/recipes-bsp/osal/osal_git.bb
index 4f881d2e..e6c0300f 100644
--- a/recipes-bsp/osal/osal_git.bb
+++ b/recipes-bsp/osal/osal_git.bb
@@ -6,7 +6,7 @@ include osal.inc

 PR =3D "${INC_PR}.1"

-EXTRA_OEMAKE =3D "-f makefile_armv7 PDK_INSTALL_PATH=3D${STAGING_INCDIR}"
+EXTRA_OEMAKE =3D "-f makefile:armv7 PDK_INSTALL_PATH=3D${STAGING_INCDIR}"

 do_compile () {
 #   Build the lib
diff --git a/recipes-bsp/pa-lld/pa-lld-rtos_git.bb b/recipes-bsp/pa-lld/pa-=
lld-rtos_git.bb
index e415f36c..046ec80e 100644
--- a/recipes-bsp/pa-lld/pa-lld-rtos_git.bb
+++ b/recipes-bsp/pa-lld/pa-lld-rtos_git.bb
@@ -3,10 +3,10 @@ SUMMARY =3D "TI RTOS low level driver for Packet Accelera=
tor (PA)"
 inherit ti-pdk

 require recipes-bsp/pa-lld/pa-lld.inc
-COMPATIBLE_MACHINE_append =3D "|c667x-evm"
+COMPATIBLE_MACHINE:append =3D "|c667x-evm"
 PR =3D "${INC_PR}.0"

-DEPENDS_append =3D " rm-lld-rtos"
+DEPENDS:append =3D " rm-lld-rtos"

 # HTML doc link params
 PDK_COMP_LINK_TEXT =3D "PA LLD"
diff --git a/recipes-bsp/pa-lld/pa-lld-test_git.bb b/recipes-bsp/pa-lld/pa-=
lld-test_git.bb
index 760f1882..595df142 100644
--- a/recipes-bsp/pa-lld/pa-lld-test_git.bb
+++ b/recipes-bsp/pa-lld/pa-lld-test_git.bb
@@ -14,10 +14,10 @@ do_compile () {
 # Now build the lld unit test examples
         for device in ${DEVICELIST}
         do
-       make -f makefile_armv7 clean PDK_INSTALL_PATH=3D${STAGING_INCDIR} D=
EVICE=3D"$device" PA_SRC_DIR=3D${S}
+       make -f makefile:armv7 clean PDK_INSTALL_PATH=3D${STAGING_INCDIR} D=
EVICE=3D"$device" PA_SRC_DIR=3D${S}
                 for choice in ${CHOICELIST}
                 do
-                       make -f makefile_armv7 tests examples PDK_INSTALL_P=
ATH=3D${STAGING_INCDIR} DEVICE=3D"$device" PA_SRC_DIR=3D${S} USEDYNAMIC_LIB=
=3D"$choice"
+                       make -f makefile:armv7 tests examples PDK_INSTALL_P=
ATH=3D${STAGING_INCDIR} DEVICE=3D"$device" PA_SRC_DIR=3D${S} USEDYNAMIC_LIB=
=3D"$choice"
                 done
         done
 }
@@ -25,6 +25,6 @@ do_compile () {
 do_install () {
         for device in ${DEVICELIST}
         do
-               make -f makefile_armv7 installbin PDK_INSTALL_PATH=3D${STAG=
ING_INCDIR} DEVICE=3D"$device" PA_SRC_DIR=3D${S} INSTALL_BIN_BASE_DIR=3D${D=
}${bindir}
+               make -f makefile:armv7 installbin PDK_INSTALL_PATH=3D${STAG=
ING_INCDIR} DEVICE=3D"$device" PA_SRC_DIR=3D${S} INSTALL_BIN_BASE_DIR=3D${D=
}${bindir}
         done
 }
diff --git a/recipes-bsp/pa-lld/pa-lld_git.bb b/recipes-bsp/pa-lld/pa-lld_g=
it.bb
index bbe7aa31..84cdbd82 100644
--- a/recipes-bsp/pa-lld/pa-lld_git.bb
+++ b/recipes-bsp/pa-lld/pa-lld_git.bb
@@ -10,12 +10,12 @@ do_compile () {
 #   Now build the lld in the updated directory
     for device in ${DEVICELIST}
     do
-        make -f makefile_armv7 lib PDK_INSTALL_PATH=3D${STAGING_INCDIR} DE=
VICE=3D"$device"
+        make -f makefile:armv7 lib PDK_INSTALL_PATH=3D${STAGING_INCDIR} DE=
VICE=3D"$device"
     done
 }

 do_install () {
-    make -f makefile_armv7 install PDK_INSTALL_PATH=3D${STAGING_INCDIR} IN=
STALL_INC_BASE_DIR=3D${D}${includedir} INSTALL_LIB_BASE_DIR=3D${D}${libdir}
+    make -f makefile:armv7 install PDK_INSTALL_PATH=3D${STAGING_INCDIR} IN=
STALL_INC_BASE_DIR=3D${D}${includedir} INSTALL_LIB_BASE_DIR=3D${D}${libdir}
     chown -R root:root ${D}

 #   Set the generic device library symbolic link
diff --git a/recipes-bsp/pcie-lld/pcie-lld-rtos_git.bb b/recipes-bsp/pcie-l=
ld/pcie-lld-rtos_git.bb
index ccd9a44b..83d70dba 100644
--- a/recipes-bsp/pcie-lld/pcie-lld-rtos_git.bb
+++ b/recipes-bsp/pcie-lld/pcie-lld-rtos_git.bb
@@ -14,7 +14,7 @@ PACKAGE_ARCH =3D "${MACHINE_ARCH}"

 PR =3D "r1"

-DEPENDS_append_k3 =3D " udma-lld-rtos \
+DEPENDS:append_k3 =3D " udma-lld-rtos \
 "


diff --git a/recipes-bsp/pktlib/pktlib-rtos_git.bb b/recipes-bsp/pktlib/pkt=
lib-rtos_git.bb
index 8d5747f4..1688d392 100644
--- a/recipes-bsp/pktlib/pktlib-rtos_git.bb
+++ b/recipes-bsp/pktlib/pktlib-rtos_git.bb
@@ -3,8 +3,8 @@ require pktlib.inc

 PR =3D "${INC_PR}.1"

-DEPENDS_append =3D " rm-lld-rtos \
+DEPENDS:append =3D " rm-lld-rtos \
                    qmss-lld-rtos \
                    cppi-lld-rtos \
 "
-COMPATIBLE_MACHINE_append =3D "|c66x"
+COMPATIBLE_MACHINE:append =3D "|c66x"
diff --git a/recipes-bsp/pktlib/pktlib_git.bb b/recipes-bsp/pktlib/pktlib_g=
it.bb
index b15b61b2..c355064e 100644
--- a/recipes-bsp/pktlib/pktlib_git.bb
+++ b/recipes-bsp/pktlib/pktlib_git.bb
@@ -7,7 +7,7 @@ include pktlib.inc

 PR =3D "${INC_PR}.1"

-EXTRA_OEMAKE +=3D "-f makefile_armv7 PDK_INSTALL_PATH=3D${STAGING_INCDIR} =
INSTALL_INC_BASE_DIR=3D${D}${includedir} INSTALL_LIB_BASE_DIR=3D${D}${libdi=
r}"
+EXTRA_OEMAKE +=3D "-f makefile:armv7 PDK_INSTALL_PATH=3D${STAGING_INCDIR} =
INSTALL_INC_BASE_DIR=3D${D}${includedir} INSTALL_LIB_BASE_DIR=3D${D}${libdi=
r}"

 do_compile () {
         oe_runmake lib
diff --git a/recipes-bsp/pm-lld/pm-lld-rtos_git.bb b/recipes-bsp/pm-lld/pm-=
lld-rtos_git.bb
index 25fcb65e..d8b391a0 100644
--- a/recipes-bsp/pm-lld/pm-lld-rtos_git.bb
+++ b/recipes-bsp/pm-lld/pm-lld-rtos_git.bb
@@ -37,15 +37,15 @@ PR =3D "r0"

 S =3D "${WORKDIR}/${PM_LLD_GIT_DESTSUFFIX}"

-DEPENDS_append =3D " ti-sysbios \
+DEPENDS:append =3D " ti-sysbios \
             osal-rtos \
 "
-DEPENDS_append_ti33x =3D " starterware-rtos \
+DEPENDS:append_ti33x =3D " starterware-rtos \
 "
-DEPENDS_append_ti43x =3D " starterware-rtos \
+DEPENDS:append_ti43x =3D " starterware-rtos \
 "

-DEPENDS_append_k3 =3D " sciclient-rtos \
+DEPENDS:append_k3 =3D " sciclient-rtos \
 "

 export PDK_PM_ROOT_PATH =3D "${WORKDIR}/build"
@@ -54,7 +54,7 @@ export DEST_ROOT=3D"${S}"
 # Build with make instead of XDC
 TI_PDK_XDCMAKE =3D "0"

-do_compile_append() {
+do_compile:append() {
     # Delete archive created by XDC release command since it does not cont=
ain all content
     find -name "*.tar" -exec rm -f {} \;

@@ -65,7 +65,7 @@ do_compile_append() {


 # Workaround: dra7xx build requires am57xx pm libraries for opencl-monitor
-TI_PDK_LIMIT_SOCS_append_dra7xx =3D " am571x am572x am574x"
-TI_PDK_LIMIT_BOARDS_append_dra7xx =3D " evmAM571x evmAM572x idkAM574x"
+TI_PDK_LIMIT_SOCS:append_dra7xx =3D " am571x am572x am574x"
+TI_PDK_LIMIT_BOARDS:append_dra7xx =3D " evmAM571x evmAM572x idkAM574x"

-INSANE_SKIP_${PN} =3D "arch staticdev"
+INSANE_SKIP:${PN} =3D "arch staticdev"
diff --git a/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.13.5776728.b=
b b/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.13.5776728.bb
index e6edebdd..c3524e99 100644
--- a/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.13.5776728.bb
+++ b/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.13.5776728.bb
@@ -7,7 +7,7 @@ inherit module features_check

 REQUIRED_MACHINE_FEATURES =3D "gpu"

-MACHINE_KERNEL_PR_append =3D "b"
+MACHINE_KERNEL_PR:append =3D "b"
 PR =3D "${MACHINE_KERNEL_PR}"

 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
diff --git a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb b/re=
cipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
index a5160fdc..a00fce22 100644
--- a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
+++ b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
@@ -9,7 +9,7 @@ REQUIRED_MACHINE_FEATURES =3D "gpu"

 COMPATIBLE_MACHINE =3D "pandaboard|beagleboard|ti33x|ti43x|omap-a15|k3"

-MACHINE_KERNEL_PR_append =3D "x"
+MACHINE_KERNEL_PR:append =3D "x"
 PR =3D "${MACHINE_KERNEL_PR}"

 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
@@ -37,7 +37,7 @@ TARGET_PRODUCT_pandaboard =3D "ti443x"

 EXTRA_OEMAKE +=3D 'KERNELDIR=3D"${STAGING_KERNEL_DIR}" TARGET_PRODUCT=3D${=
TARGET_PRODUCT} WINDOW_SYSTEM=3Dnulldrmws'

-do_compile_prepend() {
+do_compile:prepend() {
     cd ${S}/eurasia_km/eurasiacon/build/linux2/omap_linux
 }

diff --git a/recipes-bsp/pru/pru-icss_git.bb b/recipes-bsp/pru/pru-icss_git=
.bb
index c74a15dc..8b3912d9 100644
--- a/recipes-bsp/pru/pru-icss_git.bb
+++ b/recipes-bsp/pru/pru-icss_git.bb
@@ -18,12 +18,12 @@ require recipes-ti/includes/ti-paths.inc
 COMPATIBLE_MACHINE =3D "ti33x|ti43x|omap-a15|k2g|k3"
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"

-PACKAGES_prepend =3D " \
+PACKAGES:prepend =3D " \
     ${PN}-halt \
     ${PN}-rpmsg-echo \
 "

-RDEPENDS_${PN}_append =3D " \
+RDEPENDS:${PN}:append =3D " \
     ${PN}-halt \
     ${PN}-rpmsg-echo \
 "
@@ -60,10 +60,10 @@ do_install() {
     install -m 0644 ${S}/lib/rpmsg_lib.lib ${D}${libdir}
 }

-FILES_${PN}-staticdev =3D "${libdir}"
-FILES_${PN}-dev =3D "${includedir}"
+FILES:${PN}-staticdev =3D "${libdir}"
+FILES:${PN}-dev =3D "${includedir}"

-do_install_append_ti33x() {
+do_install:append_ti33x() {
     install -m 644 ${S}/examples/${PLATFORM}/PRU_Halt/gen/PRU_Halt.out \
                    ${D}${base_libdir}/firmware/pru
     for i in 0 1
@@ -73,7 +73,7 @@ do_install_append_ti33x() {
     done
 }

-do_install_append_ti43x() {
+do_install:append_ti43x() {
     install -m 644 ${S}/examples/${PLATFORM}/PRU_Halt/gen/PRU_Halt.out \
                    ${D}${base_libdir}/firmware/pru
     for i in 0 1
@@ -86,7 +86,7 @@ do_install_append_ti43x() {
     done
 }

-do_install_append_omap-a15() {
+do_install:append_omap-a15() {
     install -m 644 ${S}/examples/${PLATFORM}/PRU_Halt/gen/PRU_Halt.out \
                    ${D}${base_libdir}/firmware/pru
     for i in 1 2
@@ -99,7 +99,7 @@ do_install_append_omap-a15() {
     done
 }

-do_install_append_k2g() {
+do_install:append_k2g() {
     install -m 644 ${S}/examples/${PLATFORM}/PRU_Halt/gen/PRU_Halt.out \
                    ${D}${base_libdir}/firmware/pru
     for i in 0 1
@@ -112,7 +112,7 @@ do_install_append_k2g() {
     done
 }

-do_install_append_am65xx() {
+do_install:append_am65xx() {
     for i in 0 1
     do
         install -m 644 ${S}/examples/${PLATFORM}/PRU_Halt/gen/PRU${i}/PRU_=
Halt_${i}.out \
@@ -135,7 +135,7 @@ do_install_append_am65xx() {
     done
 }

-do_install_append_j7() {
+do_install:append_j7() {
     for i in 0 1
     do
         install -m 644 ${S}/examples/${PLATFORM}/PRU_Halt/gen/PRU${i}/PRU_=
Halt_${i}.out \
@@ -159,8 +159,8 @@ do_install_append_j7() {
 }


-FILES_${PN}-halt =3D "${base_libdir}/firmware/pru/PRU_Halt* ${base_libdir}=
/firmware/pru/RTU_Halt* ${base_libdir}/firmware/pru/TX_PRU_Halt*"
-FILES_${PN}-rpmsg-echo =3D "${base_libdir}/firmware/pru/PRU_RPMsg_Echo_Int=
errupt* ${base_libdir}/firmware/pru/RTU_RPMsg_Echo_Interrupt*"
+FILES:${PN}-halt =3D "${base_libdir}/firmware/pru/PRU_Halt* ${base_libdir}=
/firmware/pru/RTU_Halt* ${base_libdir}/firmware/pru/TX_PRU_Halt*"
+FILES:${PN}-rpmsg-echo =3D "${base_libdir}/firmware/pru/PRU_RPMsg_Echo_Int=
errupt* ${base_libdir}/firmware/pru/RTU_RPMsg_Echo_Interrupt*"

 # Set up names for the firmwares
 PRU_ICSS_ALTERNATIVES_ti33x    =3D "am335x-pru0-fw am335x-pru1-fw"
@@ -222,11 +222,11 @@ ALTERNATIVE_LINK_NAME[j7-txpru1_0-fw] =3D "${base_lib=
dir}/firmware/j7-txpru1_0-fw"
 ALTERNATIVE_LINK_NAME[j7-txpru1_1-fw] =3D "${base_libdir}/firmware/j7-txpr=
u1_1-fw"

 # Create the pru-icss-halt firmware alternatives
-ALTERNATIVE_pru-icss-halt =3D "${PRU_ICSS_ALTERNATIVES}"
+ALTERNATIVE:pru-icss-halt =3D "${PRU_ICSS_ALTERNATIVES}"

 # Only Halt firmware images are supported for the Tx_PRU cores
-ALTERNATIVE_pru-icss-halt_append_am65xx =3D " am65x-txpru0_0-fw am65x-txpr=
u0_1-fw am65x-txpru1_0-fw am65x-txpru1_1-fw am65x-txpru2_0-fw am65x-txpru2_=
1-fw"
-ALTERNATIVE_pru-icss-halt_append_j7 =3D " j7-txpru0_0-fw j7-txpru0_1-fw j7=
-txpru1_0-fw j7-txpru1_1-fw"
+ALTERNATIVE:pru-icss-halt:append_am65xx =3D " am65x-txpru0_0-fw am65x-txpr=
u0_1-fw am65x-txpru1_0-fw am65x-txpru1_1-fw am65x-txpru2_0-fw am65x-txpru2_=
1-fw"
+ALTERNATIVE:pru-icss-halt:append_j7 =3D " j7-txpru0_0-fw j7-txpru0_1-fw j7=
-txpru1_0-fw j7-txpru1_1-fw"

 ALTERNATIVE_TARGET_pru-icss-halt[am335x-pru0-fw] =3D "${base_libdir}/firmw=
are/pru/PRU_Halt.out"
 ALTERNATIVE_TARGET_pru-icss-halt[am335x-pru1-fw] =3D "${base_libdir}/firmw=
are/pru/PRU_Halt.out"
@@ -282,7 +282,7 @@ ALTERNATIVE_TARGET_pru-icss-halt[j7-txpru1_1-fw] =3D "$=
{base_libdir}/firmware/pru/
 ALTERNATIVE_PRIORITY_pru-icss-halt =3D "50"

 # Create the pru-icss-rpmsg-echo firmware alternatives
-ALTERNATIVE_pru-icss-rpmsg-echo =3D "${PRU_ICSS_ALTERNATIVES}"
+ALTERNATIVE:pru-icss-rpmsg-echo =3D "${PRU_ICSS_ALTERNATIVES}"

 ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am335x-pru0-fw] =3D "${base_libdir}=
/firmware/pru/PRU_RPMsg_Echo_Interrupt0.out"
 ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am335x-pru1-fw] =3D "${base_libdir}=
/firmware/pru/PRU_RPMsg_Echo_Interrupt1.out"
@@ -326,8 +326,8 @@ ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[j7-rtu1_1-fw] =
=3D "${base_libdir}/firmware/

 ALTERNATIVE_PRIORITY_pru-icss-rpmsg-echo =3D "100"

-ALLOW_EMPTY_${PN} =3D "1"
+ALLOW_EMPTY:${PN} =3D "1"

 # This installs PRU firmware, so skip "arch" QA check
-INSANE_SKIP_${PN}-halt =3D "arch"
-INSANE_SKIP_${PN}-rpmsg-echo =3D "arch"
+INSANE_SKIP:${PN}-halt =3D "arch"
+INSANE_SKIP:${PN}-rpmsg-echo =3D "arch"
diff --git a/recipes-bsp/pru/pru-pwm-fw_git.bb b/recipes-bsp/pru/pru-pwm-fw=
_git.bb
index a8c71034..14c81390 100644
--- a/recipes-bsp/pru/pru-pwm-fw_git.bb
+++ b/recipes-bsp/pru/pru-pwm-fw_git.bb
@@ -34,6 +34,6 @@ do_install() {
         install -m 0644 ${S}/gen/pwm.out ${D}/lib/firmware/ti-pruss/am65x-=
pru0-pwm-fw.elf
 }

-FILES_${PN} =3D "/lib/firmware"
+FILES:${PN} =3D "/lib/firmware"

-INSANE_SKIP_${PN} =3D "arch"
+INSANE_SKIP:${PN} =3D "arch"
diff --git a/recipes-bsp/pru/pru-swuart-fw_git.bb b/recipes-bsp/pru/pru-swu=
art-fw_git.bb
index 1cb51f38..f0d9e80d 100644
--- a/recipes-bsp/pru/pru-swuart-fw_git.bb
+++ b/recipes-bsp/pru/pru-swuart-fw_git.bb
@@ -15,7 +15,7 @@ TI_PDK_COMP =3D "ti.drv.uart"

 PE =3D "1"

-SRC_URI_append =3D " \
+SRC_URI:append =3D " \
         file://0001-icss_uart-add-Makefile-for-building-firmware.patch \
         file://0001-icss_uart-remove-dependency-on-PDK-CSL.patch \
 "
@@ -35,6 +35,6 @@ do_install() {
         install -m 0644 ${S}/firmware/icss_uart/src/gen/src.out ${D}/lib/f=
irmware/ti-pruss/pru_swuart-fw.elf
 }

-FILES_${PN} =3D "/lib/firmware"
+FILES:${PN} =3D "/lib/firmware"

-INSANE_SKIP_${PN} =3D "arch"
+INSANE_SKIP:${PN} =3D "arch"
diff --git a/recipes-bsp/pru/ti-pru-sw-edma-driver_1.00.00.bb b/recipes-bsp=
/pru/ti-pru-sw-edma-driver_1.00.00.bb
index a837b356..98ab387c 100644
--- a/recipes-bsp/pru/ti-pru-sw-edma-driver_1.00.00.bb
+++ b/recipes-bsp/pru/ti-pru-sw-edma-driver_1.00.00.bb
@@ -7,9 +7,9 @@ COMPATIBLE_MACHINE =3D "omapl138"

 INHIBIT_PACKAGE_STRIP =3D "1"

-MACHINE_KERNEL_PR_append =3D "b"
+MACHINE_KERNEL_PR:append =3D "b"
 PR =3D "${MACHINE_KERNEL_PR}"
-PV_append =3D "+svn${SRCPV}"
+PV:append =3D "+svn${SRCPV}"

 SRC_URI =3D "svn://gforge.ti.com/svn/pru_sw/;module=3Dtrunk;protocol=3Dhtt=
ps;user=3Danonymous;pswd=3D''"

@@ -21,7 +21,7 @@ inherit module

 EXTRA_OEMAKE +=3D "KERNEL_DIR=3D'${STAGING_KERNEL_DIR}'"

-do_compile_prepend () {
+do_compile:prepend () {
         export CCTOOL_PREFIX=3D"${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX}"
 }

diff --git a/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb b/recipes-bsp=
/prueth-fw/prueth-fw-am65x-sr2_git.bb
index 67e8cd07..60746741 100644
--- a/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb
+++ b/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb
@@ -34,6 +34,6 @@ do_install() {
         done
 }

-FILES_${PN} =3D "${base_libdir}/firmware"
+FILES:${PN} =3D "${base_libdir}/firmware"

-INSANE_SKIP_${PN} =3D "arch"
+INSANE_SKIP:${PN} =3D "arch"
diff --git a/recipes-bsp/prueth-fw/prueth-fw-am65x_git.bb b/recipes-bsp/pru=
eth-fw/prueth-fw-am65x_git.bb
index d447df33..f688fb76 100644
--- a/recipes-bsp/prueth-fw/prueth-fw-am65x_git.bb
+++ b/recipes-bsp/prueth-fw/prueth-fw-am65x_git.bb
@@ -32,6 +32,6 @@ do_install() {
         done
 }

-FILES_${PN} =3D "${base_libdir}/firmware"
+FILES:${PN} =3D "${base_libdir}/firmware"

-INSANE_SKIP_${PN} =3D "arch"
+INSANE_SKIP:${PN} =3D "arch"
diff --git a/recipes-bsp/prueth-fw/prueth-fw_5.6.15.bb b/recipes-bsp/prueth=
-fw/prueth-fw_5.6.15.bb
index c392673e..99da31b2 100644
--- a/recipes-bsp/prueth-fw/prueth-fw_5.6.15.bb
+++ b/recipes-bsp/prueth-fw/prueth-fw_5.6.15.bb
@@ -32,6 +32,6 @@ do_install() {
 }


-FILES_${PN} =3D "${base_libdir}/firmware"
+FILES:${PN} =3D "${base_libdir}/firmware"

-INSANE_SKIP_${PN} =3D "arch"
+INSANE_SKIP:${PN} =3D "arch"
diff --git a/recipes-bsp/pruhsr-fw/pruhsr-fw_2.17.25.bb b/recipes-bsp/pruhs=
r-fw/pruhsr-fw_2.17.25.bb
index 2616373e..24f1bd42 100644
--- a/recipes-bsp/pruhsr-fw/pruhsr-fw_2.17.25.bb
+++ b/recipes-bsp/pruhsr-fw/pruhsr-fw_2.17.25.bb
@@ -32,6 +32,6 @@ do_install() {
         done
 }

-FILES_${PN} =3D "${base_libdir}/firmware"
+FILES:${PN} =3D "${base_libdir}/firmware"

-INSANE_SKIP_${PN} =3D "arch"
+INSANE_SKIP:${PN} =3D "arch"
diff --git a/recipes-bsp/pruprp-fw/pruprp-fw_2.17.25.bb b/recipes-bsp/prupr=
p-fw/pruprp-fw_2.17.25.bb
index e71bc00a..e9ba0c22 100644
--- a/recipes-bsp/pruprp-fw/pruprp-fw_2.17.25.bb
+++ b/recipes-bsp/pruprp-fw/pruprp-fw_2.17.25.bb
@@ -33,6 +33,6 @@ do_install() {
         done
 }

-FILES_${PN} =3D "${base_libdir}/firmware"
+FILES:${PN} =3D "${base_libdir}/firmware"

-INSANE_SKIP_${PN} =3D "arch"
+INSANE_SKIP:${PN} =3D "arch"
diff --git a/recipes-bsp/pruss-lld/pruss-lld-apps_git.bb b/recipes-bsp/prus=
s-lld/pruss-lld-apps_git.bb
index 48eab404..0eb83647 100644
--- a/recipes-bsp/pruss-lld/pruss-lld-apps_git.bb
+++ b/recipes-bsp/pruss-lld/pruss-lld-apps_git.bb
@@ -2,14 +2,14 @@ DESCRIPTION =3D "TI PRUSS low level driver example applic=
ations"

 DEPENDS=3D"common-csl-ip pruss-lld osal ti-pdk-build-rtos pruss-lld-rtos"

-DEPENDS_append_ti33x =3D " starterware"
-DEPENDS_append_ti43x =3D " starterware"
+DEPENDS:append_ti33x =3D " starterware"
+DEPENDS:append_ti43x =3D " starterware"

 include pruss-lld.inc

 PR =3D "${INC_PR}.0"

-EXTRA_OEMAKE +=3D "-f makefile_armv7 PDK_INSTALL_PATH=3D${STAGING_INCDIR} =
PDK_PKG_PATH=3D${STAGING_DATADIR}/ti/ti-pdk-tree/packages PRUSS_SRC_DIR=3D$=
{S}"
+EXTRA_OEMAKE +=3D "-f makefile:armv7 PDK_INSTALL_PATH=3D${STAGING_INCDIR} =
PDK_PKG_PATH=3D${STAGING_DATADIR}/ti/ti-pdk-tree/packages PRUSS_SRC_DIR=3D$=
{S}"


 DEVICE_LIST ?=3D "${TI_PDK_LIMIT_SOCS}"
diff --git a/recipes-bsp/pruss-lld/pruss-lld-rtos_git.bb b/recipes-bsp/prus=
s-lld/pruss-lld-rtos_git.bb
index 9ab09b64..ef7c08bc 100644
--- a/recipes-bsp/pruss-lld/pruss-lld-rtos_git.bb
+++ b/recipes-bsp/pruss-lld/pruss-lld-rtos_git.bb
@@ -3,12 +3,12 @@ SUMMARY =3D "TI RTOS low level driver library for PRUSS"
 inherit ti-pdk
 require recipes-bsp/pruss-lld/pruss-lld.inc

-COMPATIBLE_MACHINE_append =3D "|k3"
+COMPATIBLE_MACHINE:append =3D "|k3"
 PR =3D "${INC_PR}.0"

-DEPENDS_append =3D " osal-rtos"
-DEPENDS_append_ti33x =3D " starterware-rtos"
-DEPENDS_append_ti43x =3D " starterware-rtos"
+DEPENDS:append =3D " osal-rtos"
+DEPENDS:append_ti33x =3D " starterware-rtos"
+DEPENDS:append_ti43x =3D " starterware-rtos"

 # Build with make instead of XDC
 TI_PDK_XDCMAKE =3D "0"
@@ -19,4 +19,4 @@ export DEST_ROOT=3D"${WORKDIR}/build"
 # HTML doc link params
 PDK_COMP_LINK_TEXT =3D "PRUSS LLD"

-INSANE_SKIP_${PN} =3D "arch"
+INSANE_SKIP:${PN} =3D "arch"
diff --git a/recipes-bsp/pruss-lld/pruss-lld-test_git.bb b/recipes-bsp/prus=
s-lld/pruss-lld-test_git.bb
index 8007f652..29cc32af 100644
--- a/recipes-bsp/pruss-lld/pruss-lld-test_git.bb
+++ b/recipes-bsp/pruss-lld/pruss-lld-test_git.bb
@@ -6,7 +6,7 @@ include pruss-lld.inc

 PR =3D "${INC_PR}.2"

-EXTRA_OEMAKE +=3D "-f makefile_armv7 PDK_INSTALL_PATH=3D${STAGING_INCDIR} =
PRUSS_SRC_DIR=3D${S}"
+EXTRA_OEMAKE +=3D "-f makefile:armv7 PDK_INSTALL_PATH=3D${STAGING_INCDIR} =
PRUSS_SRC_DIR=3D${S}"

 DEVICE_LIST ?=3D "${TI_PDK_LIMIT_SOCS}"

diff --git a/recipes-bsp/pruss-lld/pruss-lld_git.bb b/recipes-bsp/pruss-lld=
/pruss-lld_git.bb
index f1e93cd7..2ab599d5 100644
--- a/recipes-bsp/pruss-lld/pruss-lld_git.bb
+++ b/recipes-bsp/pruss-lld/pruss-lld_git.bb
@@ -6,7 +6,7 @@ include pruss-lld.inc

 PR =3D "${INC_PR}.2"

-EXTRA_OEMAKE +=3D "-f makefile_armv7 PDK_INSTALL_PATH=3D${STAGING_INCDIR}"
+EXTRA_OEMAKE +=3D "-f makefile:armv7 PDK_INSTALL_PATH=3D${STAGING_INCDIR}"

 do_compile () {
 #   Build the lib
diff --git a/recipes-bsp/prusw-fw/prusw-fw_3.2.9.bb b/recipes-bsp/prusw-fw/=
prusw-fw_3.2.9.bb
index 3f5ef7e7..43109b6b 100644
--- a/recipes-bsp/prusw-fw/prusw-fw_3.2.9.bb
+++ b/recipes-bsp/prusw-fw/prusw-fw_3.2.9.bb
@@ -32,6 +32,6 @@ do_install() {
 }


-FILES_${PN} =3D "${base_libdir}/firmware"
+FILES:${PN} =3D "${base_libdir}/firmware"

-INSANE_SKIP_${PN} =3D "arch"
+INSANE_SKIP:${PN} =3D "arch"
diff --git a/recipes-bsp/qmss-lld/qmss-lld-rtos_git.bb b/recipes-bsp/qmss-l=
ld/qmss-lld-rtos_git.bb
index 7f771429..d854e0bc 100644
--- a/recipes-bsp/qmss-lld/qmss-lld-rtos_git.bb
+++ b/recipes-bsp/qmss-lld/qmss-lld-rtos_git.bb
@@ -4,6 +4,6 @@ require qmss-lld.inc

 PR =3D "${INC_PR}.1"

-COMPATIBLE_MACHINE_append =3D "|c66x"
+COMPATIBLE_MACHINE:append =3D "|c66x"

-DEPENDS_append =3D " rm-lld-rtos"
+DEPENDS:append =3D " rm-lld-rtos"
diff --git a/recipes-bsp/qmss-lld/qmss-lld-test_git.bb b/recipes-bsp/qmss-l=
ld/qmss-lld-test_git.bb
index 53f6dcff..6eddbdd3 100644
--- a/recipes-bsp/qmss-lld/qmss-lld-test_git.bb
+++ b/recipes-bsp/qmss-lld/qmss-lld-test_git.bb
@@ -14,10 +14,10 @@ do_compile () {
 #   Now build the lld in the updated directory
         for device in ${DEVICELIST}
         do
-               make -f makefile_armv7 clean PDK_INSTALL_PATH=3D${STAGING_I=
NCDIR} DEVICE=3D"$device" QMSS_SRC_DIR=3D${S}
+               make -f makefile:armv7 clean PDK_INSTALL_PATH=3D${STAGING_I=
NCDIR} DEVICE=3D"$device" QMSS_SRC_DIR=3D${S}
                 for choice in ${CHOICELIST}
                 do
-                       make -f makefile_armv7 tests examples PDK_INSTALL_P=
ATH=3D${STAGING_INCDIR} DEVICE=3D"$device" QMSS_SRC_DIR=3D${S} USEDYNAMIC_L=
IB=3D"$choice"
+                       make -f makefile:armv7 tests examples PDK_INSTALL_P=
ATH=3D${STAGING_INCDIR} DEVICE=3D"$device" QMSS_SRC_DIR=3D${S} USEDYNAMIC_L=
IB=3D"$choice"
                 done
         done
 }
@@ -25,6 +25,6 @@ do_compile () {
 do_install () {
         for device in ${DEVICELIST}
         do
-               make -f makefile_armv7 installbin PDK_INSTALL_PATH=3D${STAG=
ING_INCDIR} DEVICE=3D"$device" QMSS_SRC_DIR=3D${S} INSTALL_BIN_BASE_DIR=3D$=
{D}${bindir}
+               make -f makefile:armv7 installbin PDK_INSTALL_PATH=3D${STAG=
ING_INCDIR} DEVICE=3D"$device" QMSS_SRC_DIR=3D${S} INSTALL_BIN_BASE_DIR=3D$=
{D}${bindir}
         done
 }
diff --git a/recipes-bsp/qmss-lld/qmss-lld_git.bb b/recipes-bsp/qmss-lld/qm=
ss-lld_git.bb
index 04f82d98..4a40aed5 100644
--- a/recipes-bsp/qmss-lld/qmss-lld_git.bb
+++ b/recipes-bsp/qmss-lld/qmss-lld_git.bb
@@ -8,15 +8,15 @@ PR =3D "${INC_PR}.1"

 do_compile () {
 #   Now build the lld
-    make -f makefile_armv7 clean PDK_INSTALL_PATH=3D${STAGING_INCDIR}
+    make -f makefile:armv7 clean PDK_INSTALL_PATH=3D${STAGING_INCDIR}
         for device in ${DEVICELIST}
         do
-               make -f makefile_armv7 lib PDK_INSTALL_PATH=3D${STAGING_INC=
DIR}  DEVICE=3D"${device}"
+               make -f makefile:armv7 lib PDK_INSTALL_PATH=3D${STAGING_INC=
DIR}  DEVICE=3D"${device}"
         done
 }

 do_install () {
-    make -f makefile_armv7 install PDK_INSTALL_PATH=3D${STAGING_INCDIR} IN=
STALL_INC_BASE_DIR=3D${D}${includedir} INSTALL_LIB_BASE_DIR=3D${D}${libdir}
+    make -f makefile:armv7 install PDK_INSTALL_PATH=3D${STAGING_INCDIR} IN=
STALL_INC_BASE_DIR=3D${D}${includedir} INSTALL_LIB_BASE_DIR=3D${D}${libdir}
     chown -R root:root ${D}

     # Set the generic device library symbolic link to default k2h
@@ -35,4 +35,4 @@ INHIBIT_PACKAGE_STRIP_FILES_k2hk =3D "${PKGD}${libdir}/li=
bqmss_k2h.a ${PKGD}${libd
 INHIBIT_PACKAGE_STRIP_FILES_k2e =3D "${PKGD}${libdir}/libqmss_k2e.a"
 INHIBIT_PACKAGE_STRIP_FILES_k2l =3D "${PKGD}${libdir}/libqmss_k2l.a"
 INHIBIT_PACKAGE_STRIP_FILES_k2g =3D "${PKGD}${libdir}/libqmss_k2h.a"
-INHIBIT_PACKAGE_STRIP_FILES_append =3D " ${PKGD}${libdir}/libqmss.a"
+INHIBIT_PACKAGE_STRIP_FILES:append =3D " ${PKGD}${libdir}/libqmss.a"
diff --git a/recipes-bsp/qmss-pdsp-fw/qmss-pdsp-fw_git.bb b/recipes-bsp/qms=
s-pdsp-fw/qmss-pdsp-fw_git.bb
index cd207826..ac030486 100644
--- a/recipes-bsp/qmss-pdsp-fw/qmss-pdsp-fw_git.bb
+++ b/recipes-bsp/qmss-pdsp-fw/qmss-pdsp-fw_git.bb
@@ -26,4 +26,4 @@ do_install() {
         install -m 0644 ${S}/ti-keystone/${ORIGIN} ${D}${base_libdir}/firm=
ware/${TARGET}
 }

-FILES_${PN} =3D "${base_libdir}/firmware"
+FILES:${PN} =3D "${base_libdir}/firmware"
diff --git a/recipes-bsp/rm-lld/rm-lld-rtos_git.bb b/recipes-bsp/rm-lld/rm-=
lld-rtos_git.bb
index 2f49892c..2a279a0a 100644
--- a/recipes-bsp/rm-lld/rm-lld-rtos_git.bb
+++ b/recipes-bsp/rm-lld/rm-lld-rtos_git.bb
@@ -1,6 +1,6 @@
 inherit ti-pdk

-COMPATIBLE_MACHINE_append =3D "|c66x"
+COMPATIBLE_MACHINE:append =3D "|c66x"

 require rm-lld.inc

diff --git a/recipes-bsp/rm-lld/rm-lld_git.bb b/recipes-bsp/rm-lld/rm-lld_g=
it.bb
index e2701d04..3aa87f92 100644
--- a/recipes-bsp/rm-lld/rm-lld_git.bb
+++ b/recipes-bsp/rm-lld/rm-lld_git.bb
@@ -6,7 +6,7 @@ DEPENDS =3D "ti-ipc libdaemon"

 PACKAGES =3D+ "${PN}-test"

-FILES_${PN}-test =3D "${bindir}/rmDspClientTest.out \
+FILES:${PN}-test =3D "${bindir}/rmDspClientTest.out \
                     ${bindir}/rmLinuxClientTest.out \
                     ${bindir}/rmLinuxMtClientTest.out \
                     ${bindir}/ti/drv/rm/test/dts_files/*.dtb"
@@ -15,10 +15,10 @@ CHOICELIST =3D "yes no"

 do_compile () {
 #   Now build the lld
-    make -f makefile_armv7 clean lib PDK_INSTALL_PATH=3D${STAGING_INCDIR} =
RM_SRC_DIR=3D${S}
+    make -f makefile:armv7 clean lib PDK_INSTALL_PATH=3D${STAGING_INCDIR} =
RM_SRC_DIR=3D${S}
     for choice in ${CHOICELIST}
     do
-      make -f makefile_armv7 tests IPC_DEVKIT_INSTALL_PATH=3D${STAGING_INC=
DIR} PDK_INSTALL_PATH=3D${BASEDIR} USEDYNAMIC_LIB=3D"$choice"
+      make -f makefile:armv7 tests IPC_DEVKIT_INSTALL_PATH=3D${STAGING_INC=
DIR} PDK_INSTALL_PATH=3D${BASEDIR} USEDYNAMIC_LIB=3D"$choice"
     done
 }

@@ -26,7 +26,7 @@ do_install () {
     install -d ${D}${includedir}/ti/drv/rm
     install -d ${D}${libdir}
     install -d ${D}${bindir}
-    make -f makefile_armv7 install installbin installbin_test INSTALL_INC_=
BASE_DIR=3D${D}${includedir} INSTALL_LIB_BASE_DIR=3D${D}${libdir} INSTALL_B=
IN_BASE_DIR=3D${D}${bindir}
+    make -f makefile:armv7 install installbin installbin_test INSTALL_INC_=
BASE_DIR=3D${D}${includedir} INSTALL_LIB_BASE_DIR=3D${D}${libdir} INSTALL_B=
IN_BASE_DIR=3D${D}${bindir}
     chown -R root:root ${D}
 }

diff --git a/recipes-bsp/sa-lld/sa-lld-rtos_git.bb b/recipes-bsp/sa-lld/sa-=
lld-rtos_git.bb
index 5bcdc2e8..a3f68dca 100644
--- a/recipes-bsp/sa-lld/sa-lld-rtos_git.bb
+++ b/recipes-bsp/sa-lld/sa-lld-rtos_git.bb
@@ -6,18 +6,18 @@ require recipes-bsp/sa-lld/sa-lld.inc

 PR =3D "${INC_PR}.0"

-COMPATIBLE_MACHINE_append =3D "|c667x-evm|k3"
+COMPATIBLE_MACHINE:append =3D "|c667x-evm|k3"

 # Build with make instead of XDC
 TI_PDK_XDCMAKE_k3 =3D "0"

 # SA promote/demote library depends on osal
-DEPENDS_append =3D " osal-rtos \
+DEPENDS:append =3D " osal-rtos \
 "
 export PDK_SA_ROOT_PATH =3D"${WORKDIR}/build"
 export DEST_ROOT=3D"${S}"

-INSANE_SKIP_${PN} =3D "arch"
+INSANE_SKIP:${PN} =3D "arch"

 PACKAGE_ARCH =3D "${MACHINE_ARCH}"

diff --git a/recipes-bsp/sa-lld/sa-lld-test_git.bb b/recipes-bsp/sa-lld/sa-=
lld-test_git.bb
index b9050b6a..847c7bb8 100644
--- a/recipes-bsp/sa-lld/sa-lld-test_git.bb
+++ b/recipes-bsp/sa-lld/sa-lld-test_git.bb
@@ -17,7 +17,7 @@ CHOICELIST =3D "no yes"
 CFLAGS +=3D "-fcommon"

 PARALLEL_MAKE =3D ""
-EXTRA_OEMAKE =3D "-f makefile_armv7 PDK_INSTALL_PATH=3D${STAGING_INCDIR} S=
A_SRC_DIR=3D${S}"
+EXTRA_OEMAKE =3D "-f makefile:armv7 PDK_INSTALL_PATH=3D${STAGING_INCDIR} S=
A_SRC_DIR=3D${S}"

 do_compile () {
 #   Now build the lld in the updated directory
@@ -43,4 +43,4 @@ do_install () {
         done
 }

-INSANE_SKIP_${PN} =3D "ldflags"
+INSANE_SKIP:${PN} =3D "ldflags"
diff --git a/recipes-bsp/sa-lld/sa-lld_git.bb b/recipes-bsp/sa-lld/sa-lld_g=
it.bb
index a45fe1f7..29b99cd0 100644
--- a/recipes-bsp/sa-lld/sa-lld_git.bb
+++ b/recipes-bsp/sa-lld/sa-lld_git.bb
@@ -7,7 +7,7 @@ include sa-lld.inc
 PR =3D "${INC_PR}.1"

 PARALLEL_MAKE =3D ""
-EXTRA_OEMAKE =3D "-f makefile_armv7 PDK_INSTALL_PATH=3D${STAGING_INCDIR}"
+EXTRA_OEMAKE =3D "-f makefile:armv7 PDK_INSTALL_PATH=3D${STAGING_INCDIR}"

 do_compile () {
 #   Now build the lld in the updated directory
diff --git a/recipes-bsp/sciclient/sciclient-rtos_git.bb b/recipes-bsp/scic=
lient/sciclient-rtos_git.bb
index deaf0b12..45110999 100644
--- a/recipes-bsp/sciclient/sciclient-rtos_git.bb
+++ b/recipes-bsp/sciclient/sciclient-rtos_git.bb
@@ -14,7 +14,7 @@ PACKAGE_ARCH =3D "${MACHINE_ARCH}"

 PR =3D "r1"

-DEPENDS_append =3D " osal-rtos common-csl-ip-rtos openssl-native"
+DEPENDS:append =3D " osal-rtos common-csl-ip-rtos openssl-native"

 # Build with make instead of XDC
 TI_PDK_XDCMAKE =3D "0"
@@ -31,7 +31,7 @@ BUILD_HS_j7-hs-evm =3D "yes"
 export BUILD_HS

 # Sciclient for am65x supports mcu1_1 in addition to the default cores in =
TI_PDK_LIMIT_CORES
-TI_PDK_LIMIT_CORES_append_am65xx =3D " mcu1_1"
+TI_PDK_LIMIT_CORES:append_am65xx =3D " mcu1_1"

 # HTML doc link params
 PDK_COMP_LINK_TEXT =3D "SCICLIENT"
@@ -66,7 +66,7 @@ do_compile() {
 }


-do_compile_prepend_am65xx-hs-evm() {
+do_compile:prepend_am65xx-hs-evm() {

     cd ${SCICLIENT_ROOTPATH}

@@ -79,7 +79,7 @@ do_compile_prepend_am65xx-hs-evm() {
     cd -
 }

-do_compile_prepend_am65xx-evm() {
+do_compile:prepend_am65xx-evm() {

     cd ${SCICLIENT_ROOTPATH}/tools

@@ -92,7 +92,7 @@ do_compile_prepend_am65xx-evm() {
 }


-do_compile_prepend_j7-evm() {
+do_compile:prepend_j7-evm() {

     cd ${SCICLIENT_ROOTPATH}/tools
     # Create the .bin file for GP
@@ -100,7 +100,7 @@ do_compile_prepend_j7-evm() {
     cd -
 }

-do_compile_prepend_j7-hs-evm() {
+do_compile:prepend_j7-hs-evm() {

     cd ${SCICLIENT_ROOTPATH}/tools
     # Create the .bin file for HS
@@ -114,11 +114,11 @@ do_install() {
     find -name "*.tar" -exec tar xf {} --no-same-owner -C ${D}${PDK_INSTAL=
L_DIR_RECIPE}/packages/ti/drv/sciclient \;
 }

-FILES_${PN} +=3D "${PDK_INSTALL_DIR_RECIPE}/packages"
+FILES:${PN} +=3D "${PDK_INSTALL_DIR_RECIPE}/packages"

-INSANE_SKIP_${PN} =3D "arch ldflags file-rdeps"
+INSANE_SKIP:${PN} =3D "arch ldflags file-rdeps"

-INSANE_SKIP_${PN}-dbg =3D "arch"
+INSANE_SKIP:${PN}-dbg =3D "arch"

 INHIBIT_PACKAGE_DEBUG_SPLIT =3D "1"
 INHIBIT_PACKAGE_STRIP =3D "1"
diff --git a/recipes-bsp/serdes-diag/serdes-diag-rtos_git.bb b/recipes-bsp/=
serdes-diag/serdes-diag-rtos_git.bb
index 442c4cb1..f9f448e7 100644
--- a/recipes-bsp/serdes-diag/serdes-diag-rtos_git.bb
+++ b/recipes-bsp/serdes-diag/serdes-diag-rtos_git.bb
@@ -32,4 +32,4 @@ TI_PDK_XDCMAKE_k3 =3D "0"
 # HTML doc link params
 PDK_COMP_LINK_TEXT =3D "SERDES Diagnostics"

-INSANE_SKIP_${PN} =3D "arch"
+INSANE_SKIP:${PN} =3D "arch"
diff --git a/recipes-bsp/serdes-fw/serdes-fw_git.bb b/recipes-bsp/serdes-fw=
/serdes-fw_git.bb
index 66271788..7d424941 100644
--- a/recipes-bsp/serdes-fw/serdes-fw_git.bb
+++ b/recipes-bsp/serdes-fw/serdes-fw_git.bb
@@ -26,4 +26,4 @@ do_install() {
         done
 }

-FILES_${PN} =3D "${base_libdir}/firmware"
+FILES:${PN} =3D "${base_libdir}/firmware"
diff --git a/recipes-bsp/spi-lld/spi-lld-rtos_git.bb b/recipes-bsp/spi-lld/=
spi-lld-rtos_git.bb
index 7d53d15c..18ec9290 100644
--- a/recipes-bsp/spi-lld/spi-lld-rtos_git.bb
+++ b/recipes-bsp/spi-lld/spi-lld-rtos_git.bb
@@ -14,14 +14,14 @@ PACKAGE_ARCH =3D "${MACHINE_ARCH}"

 PR =3D "r0"

-DEPENDS_append =3D " osal-rtos \
+DEPENDS:append =3D " osal-rtos \
                    edma3-lld-rtos \
 "
-DEPENDS_append_ti33x =3D " starterware-rtos pruss-lld-rtos gpio-lld-rtos"
-DEPENDS_append_ti43x =3D " starterware-rtos pruss-lld-rtos gpio-lld-rtos"
+DEPENDS:append_ti33x =3D " starterware-rtos pruss-lld-rtos gpio-lld-rtos"
+DEPENDS:append_ti43x =3D " starterware-rtos pruss-lld-rtos gpio-lld-rtos"

-DEPENDS_remove_k3 =3D "edma3-lld-rtos "
-DEPENDS_append_k3 =3D " udma-lld-rtos"
+DEPENDS:remove_k3 =3D "edma3-lld-rtos "
+DEPENDS:append_k3 =3D " udma-lld-rtos"


 # Build with make instead of XDC
@@ -31,7 +31,7 @@ export PDK_SPI_ROOT_PATH =3D"${WORKDIR}/build"
 export DEST_ROOT=3D"${S}"

 export EDMA3LLD_BIOS6_INSTALLDIR =3D "${EDMA3_LLD_INSTALL_DIR}"
-XDCPATH_append =3D ";${EDMA3_LLD_INSTALL_DIR}/packages"
+XDCPATH:append =3D ";${EDMA3_LLD_INSTALL_DIR}/packages"

 # HTML doc link params
 PDK_COMP_LINK_TEXT =3D "SPI LLD"
diff --git a/recipes-bsp/srio-lld/srio-lld-rtos_git.bb b/recipes-bsp/srio-l=
ld/srio-lld-rtos_git.bb
index 7708a18e..9c535759 100644
--- a/recipes-bsp/srio-lld/srio-lld-rtos_git.bb
+++ b/recipes-bsp/srio-lld/srio-lld-rtos_git.bb
@@ -6,10 +6,10 @@ require recipes-bsp/srio-lld/srio-lld.inc

 PR =3D "${INC_PR}.0"

-DEPENDS_append =3D " cppi-lld-rtos \
+DEPENDS:append =3D " cppi-lld-rtos \
                    qmss-lld-rtos \
 "
-COMPATIBLE_MACHINE_append =3D "|c66x"
+COMPATIBLE_MACHINE:append =3D "|c66x"

 PACKAGE_ARCH =3D "${MACHINE_ARCH}"

diff --git a/recipes-bsp/srio-lld/srio-lld.inc b/recipes-bsp/srio-lld/srio-=
lld.inc
index efe379ff..d2d08b6b 100644
--- a/recipes-bsp/srio-lld/srio-lld.inc
+++ b/recipes-bsp/srio-lld/srio-lld.inc
@@ -15,4 +15,4 @@ DEVICELIST =3D "k2h k2k"

 BASEDIR =3D "${WORKDIR}/git"

-EXTRA_OEMAKE =3D "-f makefile_armv7 PDK_INSTALL_PATH=3D${STAGING_INCDIR}"
+EXTRA_OEMAKE =3D "-f makefile:armv7 PDK_INSTALL_PATH=3D${STAGING_INCDIR}"
diff --git a/recipes-bsp/starterware/starterware-rtos_git.bb b/recipes-bsp/=
starterware/starterware-rtos_git.bb
index bcac8d42..0d22b4db 100644
--- a/recipes-bsp/starterware/starterware-rtos_git.bb
+++ b/recipes-bsp/starterware/starterware-rtos_git.bb
@@ -24,10 +24,10 @@ do_install() {
     find -name "*.tar" -exec tar xf {} --no-same-owner -C ${D}${PDK_INSTAL=
L_DIR_RECIPE}/packages/ti/starterware \;
 }

-FILES_${PN} +=3D "${PDK_INSTALL_DIR_RECIPE}/packages"
+FILES:${PN} +=3D "${PDK_INSTALL_DIR_RECIPE}/packages"

 INHIBIT_PACKAGE_STRIP =3D "1"
 INHIBIT_SYSROOT_STRIP =3D "1"
 INHIBIT_PACKAGE_DEBUG_SPLIT =3D "1"
-INSANE_SKIP_${PN} =3D "arch staticdev file-rdeps"
+INSANE_SKIP:${PN} =3D "arch staticdev file-rdeps"

diff --git a/recipes-bsp/starterware/starterware_git.bb b/recipes-bsp/start=
erware/starterware_git.bb
index 3adfac36..a560e7bd 100644
--- a/recipes-bsp/starterware/starterware_git.bb
+++ b/recipes-bsp/starterware/starterware_git.bb
@@ -2,7 +2,7 @@ require starterware.inc

 PR =3D "${INC_PR}.0"

-ALLOW_EMPTY_${PN} =3D "1"
+ALLOW_EMPTY:${PN} =3D "1"

 CLEANBROKEN =3D "1"

diff --git a/recipes-bsp/tcp3d-lld/tcp3d-lld-rtos_git.bb b/recipes-bsp/tcp3=
d-lld/tcp3d-lld-rtos_git.bb
index 0f7c52bb..db4421ee 100644
--- a/recipes-bsp/tcp3d-lld/tcp3d-lld-rtos_git.bb
+++ b/recipes-bsp/tcp3d-lld/tcp3d-lld-rtos_git.bb
@@ -14,10 +14,10 @@ PACKAGE_ARCH =3D "${MACHINE_ARCH}"

 PR =3D "r0"

-DEPENDS_append =3D " edma3-lld-rtos"
+DEPENDS:append =3D " edma3-lld-rtos"

 export EDMA3LLD_BIOS6_INSTALLDIR =3D "${EDMA3_LLD_INSTALL_DIR}"
-XDCPATH_append =3D ";${EDMA3_LLD_INSTALL_DIR}/packages"
+XDCPATH:append =3D ";${EDMA3_LLD_INSTALL_DIR}/packages"

 # HTML doc link params
 PDK_COMP_LINK_TEXT =3D "TCP3D LLD"
diff --git a/recipes-bsp/ti-ocf-crypto-module/ti-ocf-crypto-module_1.0.bb b=
/recipes-bsp/ti-ocf-crypto-module/ti-ocf-crypto-module_1.0.bb
index 43eed7d1..946f2ceb 100644
--- a/recipes-bsp/ti-ocf-crypto-module/ti-ocf-crypto-module_1.0.bb
+++ b/recipes-bsp/ti-ocf-crypto-module/ti-ocf-crypto-module_1.0.bb
@@ -19,13 +19,13 @@ S =3D "${WORKDIR}/trunk"

 inherit module

-MACHINE_KERNEL_PR_append =3D "b"
+MACHINE_KERNEL_PR:append =3D "b"
 PR =3D "${MACHINE_KERNEL_PR}"
-PV_append =3D "+svn${SRCPV}"
+PV:append =3D "+svn${SRCPV}"

 EXTRA_OEMAKE +=3D "KERNEL_DIR=3D${STAGING_KERNEL_DIR}"

-do_compile_prepend () {
+do_compile:prepend () {
     sed -i "s/arm-none-linux-gnueabi-/${TARGET_PREFIX}/g" ${S}/Makefile
 }

diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw-source_git.bb b/recipes-bsp/ti=
-sci-fw/ti-sci-fw-source_git.bb
index 063e72d7..c8f830f7 100644
--- a/recipes-bsp/ti-sci-fw/ti-sci-fw-source_git.bb
+++ b/recipes-bsp/ti-sci-fw/ti-sci-fw-source_git.bb
@@ -20,7 +20,7 @@ do_compile[noexec] =3D "1"

 SRCIPK_SRC_DIR =3D "${WORKDIR}/imggen"
 SRCIPK_INSTALL_DIR =3D "board-support/k3-image-gen-${PV}"
-FILES_${PN} =3D "${SRCIPK_INSTALL_DIR}"
+FILES:${PN} =3D "${SRCIPK_INSTALL_DIR}"

 do_install() {
     # Copy sources for packaging
@@ -42,4 +42,4 @@ do_install() {
 }

 # Do not perform any QA checks on source package
-INSANE_SKIP_${PN} +=3D "${ALL_QA}"
+INSANE_SKIP:${PN} +=3D "${ALL_QA}"
diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_0.1.1.50.bb b/recipes-bsp/ti-s=
ci-fw/ti-sci-fw_0.1.1.50.bb
index 9e68fdff..32ea3b4d 100644
--- a/recipes-bsp/ti-sci-fw/ti-sci-fw_0.1.1.50.bb
+++ b/recipes-bsp/ti-sci-fw/ti-sci-fw_0.1.1.50.bb
@@ -25,7 +25,7 @@ do_install() {
         install -m 0644 ${S}/ti-keystone/${TARGET} ${D}/boot/${TARGET}
 }

-FILES_${PN} =3D "/boot"
+FILES:${PN} =3D "/boot"

 inherit deploy

diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/recipes-bsp/ti-sci-fw=
/ti-sci-fw_git.bb
index 87fdec68..57118ad6 100644
--- a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
+++ b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
@@ -1,15 +1,15 @@
 require recipes-bsp/ti-sci-fw/ti-sci-fw.inc

 DEPENDS =3D "openssl-native u-boot-mkimage-native dtc-native"
-DEPENDS_append_j7200-evm-k3r5 =3D " virtual/bootloader"
-DEPENDS_append_am64xx-evm-k3r5 =3D " virtual/bootloader"
+DEPENDS:append_j7200-evm-k3r5 =3D " virtual/bootloader"
+DEPENDS:append_am64xx-evm-k3r5 =3D " virtual/bootloader"

 CLEANBROKEN =3D "1"
 PR =3D "r1"

 # Loaded by R5F core
 COMPATIBLE_MACHINE =3D "k3r5"
-COMPATIBLE_MACHINE_aarch64 =3D "null"
+COMPATIBLE_MACHINE:aarch64 =3D "null"

 PACKAGE_ARCH =3D "${MACHINE_ARCH}"

@@ -49,10 +49,10 @@ EXTRA_OEMAKE =3D "\
 EXTRA_OEMAKE_HS =3D " \
     HS=3D1 SYSFW_HS_PATH=3D"${S}/ti-sysfw/${SYSFW_BASE}-enc.bin" SYSFW_HS_=
INNER_CERT_PATH=3D"${S}/ti-sysfw/${SYSFW_BASE}-cert.bin" \
 "
-EXTRA_OEMAKE_append =3D "${@['',' ${EXTRA_OEMAKE_HS}']['${SYSFW_SUFFIX}' =
=3D=3D 'hs']}"
+EXTRA_OEMAKE:append =3D "${@['',' ${EXTRA_OEMAKE_HS}']['${SYSFW_SUFFIX}' =
=3D=3D 'hs']}"

-EXTRA_OEMAKE_append_j7200-evm-k3r5 =3D " SBL=3D"${STAGING_DIR_HOST}/boot/u=
-boot-spl.bin""
-EXTRA_OEMAKE_append_am64xx-evm-k3r5 =3D " SBL=3D"${STAGING_DIR_HOST}/boot/=
u-boot-spl.bin""
+EXTRA_OEMAKE:append_j7200-evm-k3r5 =3D " SBL=3D"${STAGING_DIR_HOST}/boot/u=
-boot-spl.bin""
+EXTRA_OEMAKE:append_am64xx-evm-k3r5 =3D " SBL=3D"${STAGING_DIR_HOST}/boot/=
u-boot-spl.bin""

 do_compile() {
         cd ${WORKDIR}/imggen/
@@ -68,7 +68,7 @@ do_install() {
         fi
 }

-FILES_${PN} =3D "/boot"
+FILES:${PN} =3D "/boot"

 inherit deploy

diff --git a/recipes-bsp/traceframework/traceframework-rtos_git.bb b/recipe=
s-bsp/traceframework/traceframework-rtos_git.bb
index 369b04b4..55e41188 100644
--- a/recipes-bsp/traceframework/traceframework-rtos_git.bb
+++ b/recipes-bsp/traceframework/traceframework-rtos_git.bb
@@ -4,7 +4,7 @@ require traceframework.inc

 PR =3D "${INC_PR}.2"

-XDCPATH_append =3D ";${UIA_INSTALL_DIR}/packages"
+XDCPATH:append =3D ";${UIA_INSTALL_DIR}/packages"

 # HTML doc link params
 PDK_COMP_LINK_TEXT =3D "Trace Framework"
diff --git a/recipes-bsp/traceframework/traceframework_git.bb b/recipes-bsp=
/traceframework/traceframework_git.bb
index 26eb81a0..5a2873e0 100644
--- a/recipes-bsp/traceframework/traceframework_git.bb
+++ b/recipes-bsp/traceframework/traceframework_git.bb
@@ -8,7 +8,7 @@ PR =3D "${INC_PR}.0"

 BASEDIR =3D "${WORKDIR}/git"

-EXTRA_OEMAKE +=3D "-f makefile_armv7 PDK_INSTALL_PATH=3D${STAGING_INCDIR} =
\
+EXTRA_OEMAKE +=3D "-f makefile:armv7 PDK_INSTALL_PATH=3D${STAGING_INCDIR} =
\
                  CUIA_INSTALL_DIR=3D${STAGING_INCDIR} CUIA_LIB_DIR=3D${STA=
GING_LIBDIR}"

 do_compile () {
@@ -34,7 +34,7 @@ do_install() {

 PACKAGES =3D+ "${PN}-test"

-FILES_${PN}-test =3D "${bindir}/tfw*.out \
+FILES:${PN}-test =3D "${bindir}/tfw*.out \
                     ${bindir}/*.txt"

 INHIBIT_PACKAGE_STRIP_FILES =3D "${PKGD}${libdir}/libtraceframework.a"
diff --git a/recipes-bsp/transport-rtos/bmet-eth-rtos_git.bb b/recipes-bsp/=
transport-rtos/bmet-eth-rtos_git.bb
index f14161ff..aa21b652 100644
--- a/recipes-bsp/transport-rtos/bmet-eth-rtos_git.bb
+++ b/recipes-bsp/transport-rtos/bmet-eth-rtos_git.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM =3D "file://bmet_transport.h;beginline=3D1=
2;endline=3D40;md5=3D6d209c69

 COMPATIBLE_MACHINE =3D "k2hk|k2e|k2l"

-DEPENDS_append =3D " qmss-lld-rtos \
+DEPENDS:append =3D " qmss-lld-rtos \
                    cppi-lld-rtos \
 "

diff --git a/recipes-bsp/transport-rtos/nimu-icss-rtos_git.bb b/recipes-bsp=
/transport-rtos/nimu-icss-rtos_git.bb
index 7400adf8..e4f9905e 100644
--- a/recipes-bsp/transport-rtos/nimu-icss-rtos_git.bb
+++ b/recipes-bsp/transport-rtos/nimu-icss-rtos_git.bb
@@ -9,13 +9,13 @@ LIC_FILES_CHKSUM =3D "file://nimu_icssEth.h;beginline=3D1=
;endline=3D35;md5=3D3ea633a510b

 COMPATIBLE_MACHINE =3D "ti33x|ti43x|omap-a15|k2g|c66x|omapl1|k3"

-DEPENDS_append =3D " ti-ndk \
+DEPENDS:append =3D " ti-ndk \
                    pruss-lld-rtos \
                    icss-emac-lld-rtos \
 "
-DEPENDS_append_c665x-evm =3D " emac-lld-rtos"
-DEPENDS_append_c667x-evm =3D " pa-lld-rtos"
-DEPENDS_append_omapl1 =3D " emac-lld-rtos"
+DEPENDS:append_c665x-evm =3D " emac-lld-rtos"
+DEPENDS:append_c667x-evm =3D " pa-lld-rtos"
+DEPENDS:append_omapl1 =3D " emac-lld-rtos"

 TI_PDK_COMP =3D "ti.transport.ndk.nimu_icss"

@@ -26,4 +26,4 @@ export PDK_NIMU_ICSS_ROOT_PATH =3D"${WORKDIR}/build"
 export DEST_ROOT=3D"${S}"

 export NDK_INSTALL_PATH =3D "${NDK_INSTALL_DIR}"
-XDCPATH_append =3D ";${NDK_INSTALL_DIR}/packages"
+XDCPATH:append =3D ";${NDK_INSTALL_DIR}/packages"
diff --git a/recipes-bsp/transport-rtos/nimu-rtos_git.bb b/recipes-bsp/tran=
sport-rtos/nimu-rtos_git.bb
index 4389b1e8..75c97589 100644
--- a/recipes-bsp/transport-rtos/nimu-rtos_git.bb
+++ b/recipes-bsp/transport-rtos/nimu-rtos_git.bb
@@ -11,19 +11,19 @@ COMPATIBLE_MACHINE =3D "ti33x|ti43x|omap-a15|keystone|c=
66x|omapl1|k3"

 TI_PDK_COMP =3D "ti.transport.ndk.nimu"

-DEPENDS_append =3D " ti-ndk osal-rtos"
-DEPENDS_append_ti33x =3D " starterware-rtos emac-lld-rtos"
-DEPENDS_append_ti43x =3D " starterware-rtos emac-lld-rtos"
-DEPENDS_append_omap-a15 =3D " emac-lld-rtos"
-DEPENDS_append_keystone =3D " qmss-lld-rtos cppi-lld-rtos"
-DEPENDS_append_k2hk =3D " pa-lld-rtos"
-DEPENDS_append_k2e =3D " pa-lld-rtos"
-DEPENDS_append_k2l =3D " pa-lld-rtos"
-DEPENDS_append_k2g =3D " emac-lld-rtos"
-DEPENDS_append_c665x-evm =3D " emac-lld-rtos"
-DEPENDS_append_c667x-evm =3D " pa-lld-rtos cppi-lld-rtos"
-DEPENDS_append_omapl1 =3D " emac-lld-rtos"
-DEPENDS_append_k3 =3D " emac-lld-rtos pruss-lld-rtos"
+DEPENDS:append =3D " ti-ndk osal-rtos"
+DEPENDS:append_ti33x =3D " starterware-rtos emac-lld-rtos"
+DEPENDS:append_ti43x =3D " starterware-rtos emac-lld-rtos"
+DEPENDS:append_omap-a15 =3D " emac-lld-rtos"
+DEPENDS:append_keystone =3D " qmss-lld-rtos cppi-lld-rtos"
+DEPENDS:append_k2hk =3D " pa-lld-rtos"
+DEPENDS:append_k2e =3D " pa-lld-rtos"
+DEPENDS:append_k2l =3D " pa-lld-rtos"
+DEPENDS:append_k2g =3D " emac-lld-rtos"
+DEPENDS:append_c665x-evm =3D " emac-lld-rtos"
+DEPENDS:append_c667x-evm =3D " pa-lld-rtos cppi-lld-rtos"
+DEPENDS:append_omapl1 =3D " emac-lld-rtos"
+DEPENDS:append_k3 =3D " emac-lld-rtos pruss-lld-rtos"

 # Build with make instead of XDC
 TI_PDK_XDCMAKE =3D "0"
@@ -32,4 +32,4 @@ export PDK_NIMU_ROOT_PATH =3D"${WORKDIR}/build"
 export DEST_ROOT=3D"${S}"

 export NDK_INSTALL_PATH =3D "${NDK_INSTALL_DIR}"
-XDCPATH_append =3D ";${NDK_INSTALL_DIR}/packages"
+XDCPATH:append =3D ";${NDK_INSTALL_DIR}/packages"
diff --git a/recipes-bsp/transport-rtos/timesync-rtos_git.bb b/recipes-bsp/=
transport-rtos/timesync-rtos_git.bb
index 556c1288..3913ecf4 100644
--- a/recipes-bsp/transport-rtos/timesync-rtos_git.bb
+++ b/recipes-bsp/transport-rtos/timesync-rtos_git.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM =3D "file://timeSync_ver.h;beginline=3D23;=
endline=3D45;md5=3D4bd873035e

 COMPATIBLE_MACHINE =3D "ti33x|ti43x|omap-a15|k2g"

-DEPENDS_append =3D " ti-ndk \
+DEPENDS:append =3D " ti-ndk \
                    osal-rtos \
                    pruss-lld-rtos \
                    icss-emac-lld-rtos \
@@ -28,4 +28,4 @@ export DEST_ROOT=3D"${S}"
 export NDK_INSTALL_PATH =3D "${NDK_INSTALL_DIR}"
 export EDMA3LLD_BIOS6_INSTALLDIR =3D "${EDMA3_LLD_INSTALL_DIR}"

-XDCPATH_append =3D ";${NDK_INSTALL_DIR}/packages"
+XDCPATH:append =3D ";${NDK_INSTALL_DIR}/packages"
diff --git a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend b=
/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
index f075cac0..d02562c2 100644
--- a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
+++ b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
@@ -8,7 +8,7 @@ TFA_BUILD_TARGET_k3 =3D "all"
 TFA_INSTALL_TARGET_k3 =3D "bl31"
 TFA_SPD_k3 =3D "opteed"

-do_compile_append_am65xx-hs-evm() {
+do_compile:append_am65xx-hs-evm() {
         export TI_SECURE_DEV_PKG=3D${TI_SECURE_DEV_PKG}
         ( cd ${BUILD_DIR}; \
                 mv bl31.bin bl31.bin.unsigned; \
@@ -16,7 +16,7 @@ do_compile_append_am65xx-hs-evm() {
         )
 }

-do_compile_append_j7-hs-evm() {
+do_compile:append_j7-hs-evm() {
         export TI_SECURE_DEV_PKG=3D${TI_SECURE_DEV_PKG}
         ( cd ${BUILD_DIR}; \
                 mv bl31.bin bl31.bin.unsigned; \
diff --git a/recipes-bsp/u-boot/u-boot-ti.inc b/recipes-bsp/u-boot/u-boot-t=
i.inc
index dc8d6b06..8c8575dc 100644
--- a/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/recipes-bsp/u-boot/u-boot-ti.inc
@@ -16,7 +16,7 @@ SPL_BINARY ?=3D "MLO"
 require ${COREBASE}/meta/recipes-bsp/u-boot/u-boot-common.inc
 require ${COREBASE}/meta/recipes-bsp/u-boot/u-boot.inc

-FILESEXTRAPATHS_prepend :=3D "${THISDIR}/u-boot:"
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/u-boot:"

 SUMMARY =3D "u-boot bootloader for TI devices"

@@ -28,7 +28,7 @@ UBOOT_GIT_URI =3D "git://git.ti.com/ti-u-boot/ti-u-boot.g=
it"
 UBOOT_GIT_PROTOCOL =3D "git"
 SRC_URI =3D "${UBOOT_GIT_URI};protocol=3D${UBOOT_GIT_PROTOCOL};branch=3D${=
BRANCH}"

-PV_append =3D "+git${SRCPV}"
+PV:append =3D "+git${SRCPV}"

 # u-boot needs devtree compiler to parse dts files
 DEPENDS +=3D "dtc-native bc-native lzop-native flex-native bison-native"
@@ -39,17 +39,17 @@ PACKAGECONFIG[atf] =3D "ATF=3D${STAGING_DIR_HOST}/firmw=
are/bl31.bin,,trusted-firmwar
 PACKAGECONFIG[optee] =3D "TEE=3D${STAGING_DIR_HOST}${nonarch_base_libdir}/=
firmware/bl32.bin,,optee-os"
 PACKAGECONFIG[dm] =3D "DM=3D${STAGING_DIR_HOST}${nonarch_base_libdir}/firm=
ware/pdk-ipc/${DM_FIRMWARE},,ti-rtos-firmware"

-PACKAGECONFIG_append_aarch64 =3D " atf optee"
-PACKAGECONFIG_append_j7 =3D " dm"
+PACKAGECONFIG:append:aarch64 =3D " atf optee"
+PACKAGECONFIG:append_j7 =3D " dm"

 COMPATIBLE_MACHINE =3D "(ti-soc)"

 EXTRA_OEMAKE +=3D "${PACKAGECONFIG_CONFARGS}"

 PROVIDES +=3D "u-boot"
-PKG_${PN} =3D "u-boot"
-PKG_${PN}-dev =3D "u-boot-dev"
-PKG_${PN}-dbg =3D "u-boot-dbg"
+PKG:${PN} =3D "u-boot"
+PKG:${PN}-dev =3D "u-boot-dev"
+PKG:${PN}-dbg =3D "u-boot-dbg"

 S =3D "${WORKDIR}/git"

@@ -115,7 +115,7 @@ UBOOT_HS_2ND_BINARY =3D "u-boot-spl_HS_2ND"
 UBOOT_HS_2ND_IMAGE =3D "u-boot-spl_HS_2ND-${MACHINE}-${PV}-${PR}"
 UBOOT_HS_2ND_SYMLINK =3D "u-boot-spl_HS_2ND-${MACHINE}"

-do_install_append () {
+do_install:append () {
         if [ -n "${UBOOT_CONFIG}" ]
         then
                 for config in ${UBOOT_MACHINE}; do
@@ -178,7 +178,7 @@ do_install_append () {
         fi
 }

-do_deploy_append () {
+do_deploy:append () {
         if [ -n "${UBOOT_CONFIG}" ]
         then
                 for config in ${UBOOT_MACHINE}; do
@@ -275,7 +275,7 @@ do_deploy_append () {
         rm ${DEPLOYDIR}/${PN}-initial-env-${MACHINE}-${PV}-${PR} || true
 }

-do_install_append_keystone () {
+do_install:append_keystone () {
         if [ -n "${UBOOT_CONFIG}" ]
         then
                 for config in ${UBOOT_MACHINE}; do
@@ -324,7 +324,7 @@ do_install_append_keystone () {
         fi
 }

-do_deploy_append_keystone () {
+do_deploy:append_keystone () {
         if [ -n "${UBOOT_CONFIG}" ]
         then
                 for config in ${UBOOT_MACHINE}; do
@@ -391,12 +391,12 @@ do_deploy_append_keystone () {
 # j7200 uses combined image for tiboot3.bin that includes u-boot-spl.bin a=
nd sysfw
 # along with board PM/RM configs generated by k3-image-gen and comes from =
ti-sci-fw
 # hence move the legacy u-boot's tiboot3.bin and u-boot-spl.bin out of the=
 way
-do_deploy_append_j7200-evm-k3r5 () {
+do_deploy:append_j7200-evm-k3r5 () {
         mv ${DEPLOYDIR}/tiboot3.bin ${DEPLOYDIR}/tiboot3-r5spl.bin || true
         mv ${DEPLOYDIR}/u-boot-spl.bin ${DEPLOYDIR}/u-boot-spl-r5spl.bin |=
| true
 }

-do_deploy_append_am64xx-evm-k3r5 () {
+do_deploy:append_am64xx-evm-k3r5 () {
         mv ${DEPLOYDIR}/tiboot3.bin ${DEPLOYDIR}/tiboot3-r5spl.bin || true
         mv ${DEPLOYDIR}/u-boot-spl.bin ${DEPLOYDIR}/u-boot-spl-r5spl.bin |=
| true
 }
diff --git a/recipes-bsp/uart-lld/uart-lld-rtos_git.bb b/recipes-bsp/uart-l=
ld/uart-lld-rtos_git.bb
index f293fdda..b81eecb0 100644
--- a/recipes-bsp/uart-lld/uart-lld-rtos_git.bb
+++ b/recipes-bsp/uart-lld/uart-lld-rtos_git.bb
@@ -15,16 +15,16 @@ PACKAGE_ARCH =3D "${MACHINE_ARCH}"

 PR =3D "r0"

-DEPENDS_append =3D " edma3-lld-rtos \
+DEPENDS:append =3D " edma3-lld-rtos \
                    osal-rtos \
 "
-DEPENDS_append_ti33x =3D " starterware-rtos \
+DEPENDS:append_ti33x =3D " starterware-rtos \
                          pruss-lld-rtos \
 "
-DEPENDS_append_ti43x =3D " starterware-rtos"
+DEPENDS:append_ti43x =3D " starterware-rtos"

-DEPENDS_remove_k3 =3D "edma3-lld-rtos "
-DEPENDS_append_k3 =3D " udma-lld-rtos "
+DEPENDS:remove_k3 =3D "edma3-lld-rtos "
+DEPENDS:append_k3 =3D " udma-lld-rtos "

 # Build with make instead of XDC
 TI_PDK_XDCMAKE =3D "0"
@@ -33,9 +33,9 @@ export PDK_UART_ROOT_PATH =3D"${WORKDIR}/build"
 export DEST_ROOT=3D"${S}"

 export EDMA3LLD_BIOS6_INSTALLDIR =3D "${EDMA3_LLD_INSTALL_DIR}"
-XDCPATH_append =3D ";${EDMA3_LLD_INSTALL_DIR}/packages"
+XDCPATH:append =3D ";${EDMA3_LLD_INSTALL_DIR}/packages"

 # HTML doc link params
 PDK_COMP_LINK_TEXT =3D "UART LLD"

-INSANE_SKIP_${PN} =3D "arch"
+INSANE_SKIP:${PN} =3D "arch"
diff --git a/recipes-bsp/udma-lld/udma-lld-rtos_git.bb b/recipes-bsp/udma-l=
ld/udma-lld-rtos_git.bb
index a82eb362..a65876b6 100644
--- a/recipes-bsp/udma-lld/udma-lld-rtos_git.bb
+++ b/recipes-bsp/udma-lld/udma-lld-rtos_git.bb
@@ -15,7 +15,7 @@ PACKAGE_ARCH =3D "${MACHINE_ARCH}"

 PR =3D "r1"

-DEPENDS_append =3D " osal-rtos \
+DEPENDS:append =3D " osal-rtos \
                    sciclient-rtos \
 "

@@ -60,6 +60,6 @@ do_install() {
     find -name "*.tar" -exec tar xf {} --no-same-owner -C ${D}${PDK_INSTAL=
L_DIR_RECIPE}/packages/ti/drv/udma \;
 }

-FILES_${PN} +=3D "${PDK_INSTALL_DIR_RECIPE}/packages"
+FILES:${PN} +=3D "${PDK_INSTALL_DIR_RECIPE}/packages"

-INSANE_SKIP_${PN} =3D "arch ldflags"
+INSANE_SKIP:${PN} =3D "arch ldflags"
diff --git a/recipes-bsp/uio-module-drv/uio-module-drv-test_git.bb b/recipe=
s-bsp/uio-module-drv/uio-module-drv-test_git.bb
index 3a4fb1bf..3c94f691 100644
--- a/recipes-bsp/uio-module-drv/uio-module-drv-test_git.bb
+++ b/recipes-bsp/uio-module-drv/uio-module-drv-test_git.bb
@@ -12,7 +12,7 @@ DEVICE_NAME_ti33x =3D "am33xx"
 DEVICE_NAME_ti43x =3D "am43xx"
 DEVICE_NAME_keystone =3D "keystone"
 DEVICE_NAME_k2g =3D "k2g"
-RDEPENDS_${PN} =3D "uio-module-drv"
+RDEPENDS:${PN} =3D "uio-module-drv"

 do_compile() {
         oe_runmake -C ${S} test "DEVICE=3D${DEVICE_NAME}"
@@ -24,22 +24,22 @@ do_install() {
         install -c -m 755 ${S}/test/uio_int_test ${D}${bindir}/.
 }

-do_install_append_keystone () {
+do_install:append_keystone () {
         install -c -m 755 ${S}/test/uio_cic2_int_multithread_test ${D}${bi=
ndir}/.
 }

-do_install_append_k2g () {
+do_install:append_k2g () {
         install -c -m 755 ${S}/test/prussdrv_test/test/pruss_uio_test ${D}=
${bindir}/.
 }

-do_install_append_omap-a15 () {
+do_install:append_omap-a15 () {
         install -c -m 755 ${S}/test/prussdrv_test/test/pruss_uio_test ${D}=
${bindir}/.
 }

-do_install_append_ti33x () {
+do_install:append_ti33x () {
         install -c -m 755 ${S}/test/prussdrv_test/test/pruss_uio_test ${D}=
${bindir}/.
 }

-do_install_append_ti43x () {
+do_install:append_ti43x () {
         install -c -m 755 ${S}/test/prussdrv_test/test/pruss_uio_test ${D}=
${bindir}/.
 }
diff --git a/recipes-bsp/uio-module-drv/uio-module-drv_git.bb b/recipes-bsp=
/uio-module-drv/uio-module-drv_git.bb
index cb61305f..2bb1f0b3 100644
--- a/recipes-bsp/uio-module-drv/uio-module-drv_git.bb
+++ b/recipes-bsp/uio-module-drv/uio-module-drv_git.bb
@@ -2,19 +2,19 @@ DESCRIPTION =3D "User space IO (UIO) driver for on-chip m=
odules"

 include uio-module-drv.inc

-FILESEXTRAPATHS_prepend:=3D "${THISDIR}/${PN}:"
+FILESEXTRAPATHS:prepend:=3D "${THISDIR}/${PN}:"

 SRC_URI +=3D "file://0001-uio-module-drv-Replace-ioremap_nocache-with-iore=
map.patch"

 # This package builds a kernel module, use kernel PR as base and append a =
local
-MACHINE_KERNEL_PR_append =3D "d"
+MACHINE_KERNEL_PR:append =3D "d"
 PR =3D "${MACHINE_KERNEL_PR}"

 module_auto_load_uio-module-drv =3D "uio-module-drv"

 inherit module

-do_install_append () {
+do_install:append () {
     install -d ${D}${includedir}
     cp *.h ${D}${includedir}
 }
diff --git a/recipes-bsp/usb-lld/usb-lld-rtos_git.bb b/recipes-bsp/usb-lld/=
usb-lld-rtos_git.bb
index 7aa0d1b9..69f91385 100644
--- a/recipes-bsp/usb-lld/usb-lld-rtos_git.bb
+++ b/recipes-bsp/usb-lld/usb-lld-rtos_git.bb
@@ -14,10 +14,10 @@ PACKAGE_ARCH =3D "${MACHINE_ARCH}"

 PR =3D "r0"

-DEPENDS_append =3D " osal-rtos"
-DEPENDS_append_ti33x =3D " starterware-rtos"
-DEPENDS_append_ti43x =3D " starterware-rtos"
-DEPENDS_append_k3 =3D " sciclient-rtos"
+DEPENDS:append =3D " osal-rtos"
+DEPENDS:append_ti33x =3D " starterware-rtos"
+DEPENDS:append_ti43x =3D " starterware-rtos"
+DEPENDS:append_k3 =3D " sciclient-rtos"

 # Build with make instead of XDC
 TI_PDK_XDCMAKE =3D "0"
diff --git a/recipes-bsp/vis-fw/vis_01.50.07.15.bb b/recipes-bsp/vis-fw/vis=
_01.50.07.15.bb
index 3cd56489..498be36b 100644
--- a/recipes-bsp/vis-fw/vis_01.50.07.15.bb
+++ b/recipes-bsp/vis-fw/vis_01.50.07.15.bb
@@ -25,12 +25,12 @@ do_install() {
 }

 PACKAGES +=3D "${PN}-fw"
-RDEPENDS_${PN} +=3D "${PN}-fw"
+RDEPENDS:${PN} +=3D "${PN}-fw"

-FILES_${PN}-fw +=3D "${base_libdir}/firmware/${DSPAPP}"
+FILES:${PN}-fw +=3D "${base_libdir}/firmware/${DSPAPP}"

-INSANE_SKIP_${PN} =3D "ldflags"
-INSANE_SKIP_${PN}-fw =3D "arch"
+INSANE_SKIP:${PN} =3D "ldflags"
+INSANE_SKIP:${PN}-fw =3D "arch"
 INHIBIT_PACKAGE_DEBUG_SPLIT =3D "1"
 INHIBIT_PACKAGE_STRIP =3D "1"
 INHIBIT_SYSROOT_STRIP =3D "1"
diff --git a/recipes-bsp/vpdma-fw/vpdma-fw_03-2012.bb b/recipes-bsp/vpdma-f=
w/vpdma-fw_03-2012.bb
index 4707f179..c7b2a7bb 100644
--- a/recipes-bsp/vpdma-fw/vpdma-fw_03-2012.bb
+++ b/recipes-bsp/vpdma-fw/vpdma-fw_03-2012.bb
@@ -20,6 +20,6 @@ do_install() {
     cp ${S}/${TARGET} ${D}${base_libdir}/firmware/${TARGET}
 }

-FILES_${PN} +=3D "${base_libdir}/firmware/${TARGET}"
+FILES:${PN} +=3D "${base_libdir}/firmware/${TARGET}"

 PR =3D "r1"
diff --git a/recipes-bsp/vps-lld/vps-lld-rtos_git.bb b/recipes-bsp/vps-lld/=
vps-lld-rtos_git.bb
index e2834a63..7e0695ab 100644
--- a/recipes-bsp/vps-lld/vps-lld-rtos_git.bb
+++ b/recipes-bsp/vps-lld/vps-lld-rtos_git.bb
@@ -26,7 +26,7 @@ PR =3D "r0"
 S =3D "${WORKDIR}/${VPS_LLD_GIT_DESTSUFFIX}"

 # Add to DEPENDS set in ti-pdk.bbclass
-DEPENDS_append =3D " \
+DEPENDS:append =3D " \
             ti-sysbios \
             osal-rtos \
             edma3-lld-rtos \
@@ -44,7 +44,7 @@ TI_PDK_XDCMAKE =3D "0"
 # The makefile will push these on the XDCPATH
 export EDMA3LLD_BIOS6_INSTALLDIR =3D "${EDMA3_LLD_INSTALL_DIR}"

-do_compile_append() {
+do_compile:append() {
     # Delete archive created by XDC release command since it does not cont=
ain all content
     find -name "*.tar" -exec rm -f {} \;

@@ -53,4 +53,4 @@ do_compile_append() {
     tar -cf pm_lld.tar --exclude=3D'*.tar' ./*
 }

-INSANE_SKIP_${PN} =3D "arch ldflags"
+INSANE_SKIP:${PN} =3D "arch ldflags"
diff --git a/recipes-bsp/wl18xx-fw/wl18xx-fw_8.9.0.0.86.bb b/recipes-bsp/wl=
18xx-fw/wl18xx-fw_8.9.0.0.86.bb
index 50b6c297..48b500a8 100644
--- a/recipes-bsp/wl18xx-fw/wl18xx-fw_8.9.0.0.86.bb
+++ b/recipes-bsp/wl18xx-fw/wl18xx-fw_8.9.0.0.86.bb
@@ -22,4 +22,4 @@ do_install() {
     oe_runmake 'DEST_DIR=3D${D}' install
 }

-FILES_${PN} =3D "/lib/firmware/ti-connectivity/*"
+FILES:${PN} =3D "/lib/firmware/ti-connectivity/*"
diff --git a/recipes-bsp/x-load/x-load.inc b/recipes-bsp/x-load/x-load.inc
index 7a9638b0..bb700e46 100644
--- a/recipes-bsp/x-load/x-load.inc
+++ b/recipes-bsp/x-load/x-load.inc
@@ -34,7 +34,7 @@ do_install () {
         ln -sf ${MLO_IMAGE} ${D}/boot/${MLO_SYMLINK_NOMACHINE}
 }

-FILES_${PN} =3D "/boot"
+FILES:${PN} =3D "/boot"

 inherit deploy

diff --git a/recipes-bsp/x-load/x-load_1.46-psp.bb b/recipes-bsp/x-load/x-l=
oad_1.46-psp.bb
index 108e408d..cc9ad3f7 100644
--- a/recipes-bsp/x-load/x-load_1.46-psp.bb
+++ b/recipes-bsp/x-load/x-load_1.46-psp.bb
@@ -11,7 +11,7 @@ PR =3D"r0"
 PE =3D "1"

 # TI PSP v1.46_OMAPPSP_03.00.01.06 (Tag is one commit different)
-SRCREV_pn-${PN} =3D "fc6d5be15c703d21aef0ae0b8c02177721f0445f"
+SRCREV:pn-${PN} =3D "fc6d5be15c703d21aef0ae0b8c02177721f0445f"
 SRC_URI =3D "git://arago-project.org/git/projects/x-load-omap3.git;protoco=
l=3Dgit"

 S =3D "${WORKDIR}/git"
@@ -33,6 +33,6 @@ do_install () {
         ln -sf ${MLO_IMAGE} ${D}/boot/${MLO_SYMLINK_NOMACHINE}
 }

-FILES_${PN} =3D "/boot"
+FILES:${PN} =3D "/boot"

 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
diff --git a/recipes-bsp/x-load/x-load_git.bb b/recipes-bsp/x-load/x-load_g=
it.bb
index 1ce1b0f0..46ccc8dd 100644
--- a/recipes-bsp/x-load/x-load_git.bb
+++ b/recipes-bsp/x-load/x-load_git.bb
@@ -1,12 +1,12 @@
 require x-load.inc

-#FILESPATHPKG_prepend =3D "x-load-git:x-load-git/${MACHINE}"
+#FILESPATHPKG:prepend =3D "x-load-git:x-load-git/${MACHINE}"

 PV =3D "1.5.1"
 PR =3D"r3"
 PE =3D "1"

-SRCREV_pn-${PN} =3D "c4289f1bee035dea41536c5ba5e1bc36c7d493c4"
+SRCREV:pn-${PN} =3D "c4289f1bee035dea41536c5ba5e1bc36c7d493c4"
 SRC_URI =3D "git://gitorious.org/x-loader/x-loader.git;branch=3Dmaster;pro=
tocol=3Dgit \
 "

diff --git a/recipes-connectivity/wl18xx-calibrator/wl18xx-calibrator_8.7.3=
.bb b/recipes-connectivity/wl18xx-calibrator/wl18xx-calibrator_8.7.3.bb
index f9a4448f..2888b95a 100644
--- a/recipes-connectivity/wl18xx-calibrator/wl18xx-calibrator_8.7.3.bb
+++ b/recipes-connectivity/wl18xx-calibrator/wl18xx-calibrator_8.7.3.bb
@@ -3,7 +3,7 @@ LICENSE =3D "BSD"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4725015cb0be7be389cf06deeae3683=
d"

 DEPENDS =3D "libnl"
-RDEPENDS_${PN} =3D "wl18xx-fw"
+RDEPENDS:${PN} =3D "wl18xx-fw"

 #Tag: R8.7_SP3 (8.7.3)
 SRCREV =3D "5048b59a444ac59ba7171d6e122d5a84581aebf2"
diff --git a/recipes-connectivity/wl18xx-target-scripts/wl18xx-target-scrip=
ts_8.7.3.bb b/recipes-connectivity/wl18xx-target-scripts/wl18xx-target-scri=
pts_8.7.3.bb
index 6c4b2b43..2a44fa84 100644
--- a/recipes-connectivity/wl18xx-target-scripts/wl18xx-target-scripts_8.7.=
3.bb
+++ b/recipes-connectivity/wl18xx-target-scripts/wl18xx-target-scripts_8.7.=
3.bb
@@ -13,7 +13,7 @@ PR =3D "r1"

 S =3D "${WORKDIR}/git"

-FILES_${PN} +=3D "${datadir}/wl18xx/"
+FILES:${PN} +=3D "${datadir}/wl18xx/"

 do_install() {
         install -d ${D}${datadir}/wl18xx/
diff --git a/recipes-connectivity/wlconf/wlconf_8.7.3.bb b/recipes-connecti=
vity/wlconf/wlconf_8.7.3.bb
index 19f28b75..475bac28 100644
--- a/recipes-connectivity/wlconf/wlconf_8.7.3.bb
+++ b/recipes-connectivity/wlconf/wlconf_8.7.3.bb
@@ -30,10 +30,10 @@ do_install() {
                         ${D}${sbindir}/wlconf/official_inis/
 }

-FILES_${PN} +=3D " \
+FILES:${PN} +=3D " \
         ${sbindir}/wlconf \
         ${sbindir}/wlconf/official_inis \
         /lib/firmware/ti-connectivity/wl18xx-conf.bin \
 "

-FILES_${PN}-dbg +=3D "${sbindir}/wlconf/.debug"
+FILES:${PN}-dbg +=3D "${sbindir}/wlconf/.debug"
diff --git a/recipes-core/init-ifupdown/init-ifupdown_1.0.bbappend b/recipe=
s-core/init-ifupdown/init-ifupdown_1.0.bbappend
index 56223033..461ffebe 100644
--- a/recipes-core/init-ifupdown/init-ifupdown_1.0.bbappend
+++ b/recipes-core/init-ifupdown/init-ifupdown_1.0.bbappend
@@ -1 +1 @@
-FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}-${PV}:"
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}-${PV}:"
diff --git a/recipes-core/udev/eudev_%.bbappend b/recipes-core/udev/eudev_%=
.bbappend
index 7c04fd23..15f95ef8 100644
--- a/recipes-core/udev/eudev_%.bbappend
+++ b/recipes-core/udev/eudev_%.bbappend
@@ -1,13 +1,13 @@
-FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}:"

-SRC_URI_append_ti-soc =3D " \
+SRC_URI:append_ti-soc =3D " \
     file://omap-tty.rules \
     file://firmware.rules \
 "

-PR_append_ti-soc =3D ".3"
+PR:append_ti-soc =3D ".3"

-do_install_append_ti-soc() {
+do_install:append_ti-soc() {
     install -m 0644 ${WORKDIR}/omap-tty.rules ${D}${sysconfdir}/udev/rules=
.d/
     install -m 0644 ${WORKDIR}/firmware.rules ${D}${sysconfdir}/udev/rules=
.d/
 }
diff --git a/recipes-devtools/gdbc6x/gdbc6x_git.bb b/recipes-devtools/gdbc6=
x/gdbc6x_git.bb
index aa519a91..08f81970 100644
--- a/recipes-devtools/gdbc6x/gdbc6x_git.bb
+++ b/recipes-devtools/gdbc6x/gdbc6x_git.bb
@@ -9,7 +9,7 @@ COMPATIBLE_MACHINE =3D "dra7xx|keystone"

 PR =3D "${INC_PR}.1"

-SRC_URI_append =3D " \
+SRC_URI:append =3D " \
     file://init \
     file://0001-libbfd.h-suppress-GCC9-Wstringop-truncation.patch;striplev=
el=3D2 \
 "
@@ -39,7 +39,7 @@ do_install () {
     install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/gdbserverprox=
y
 }

-RDEPENDS_${PN} =3D "gdbserverproxy-module-drv bash"
+RDEPENDS:${PN} =3D "gdbserverproxy-module-drv bash"

 include gdbc6x.inc

diff --git a/recipes-devtools/gdbc6x/gdbserver-c6x_git.bb b/recipes-devtool=
s/gdbc6x/gdbserver-c6x_git.bb
index 79b584be..4dbce012 100644
--- a/recipes-devtools/gdbc6x/gdbserver-c6x_git.bb
+++ b/recipes-devtools/gdbc6x/gdbserver-c6x_git.bb
@@ -37,7 +37,7 @@ do_install() {
 COMPATIBLE_MACHINE =3D "dra7xx|keystone"
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"

-FILES_${PN}-dev +=3D "\
+FILES:${PN}-dev +=3D "\
     ${datadir}/ti/gdbc6x \
 "

@@ -45,6 +45,6 @@ include gdbc6x.inc

 require recipes-ti/includes/ti-paths.inc

-ALLOW_EMPTY_${PN} =3D "1"
+ALLOW_EMPTY:${PN} =3D "1"

 PARALLEL_MAKE =3D ""
diff --git a/recipes-devtools/gdbc6x/gdbserverproxy-module-drv_git.bb b/rec=
ipes-devtools/gdbc6x/gdbserverproxy-module-drv_git.bb
index 77a29ec8..bd3e33fd 100644
--- a/recipes-devtools/gdbc6x/gdbserverproxy-module-drv_git.bb
+++ b/recipes-devtools/gdbc6x/gdbserverproxy-module-drv_git.bb
@@ -3,9 +3,9 @@ LICENSE =3D "GPLv2"
 LIC_FILES_CHKSUM =3D "file://COPYING.txt;md5=3D75859989545e37968a99b631ef4=
2722e"

 # This package builds a kernel module, use kernel PR as base and append a =
local
-MACHINE_KERNEL_PR_append =3D "b"
+MACHINE_KERNEL_PR:append =3D "b"
 PR =3D "${MACHINE_KERNEL_PR}"
-PV_append =3D "+git${SRCPV}"
+PV:append =3D "+git${SRCPV}"

 S =3D "${WORKDIR}/git/kernel_module/gdbproxy-mod"

diff --git a/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb b/recipes-g=
raphics/libgal/ti-gc320-libs_5.0.11.p7.bb
index 55758682..ab72c109 100644
--- a/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb
+++ b/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb
@@ -16,7 +16,7 @@ BRANCH =3D "ti-${PV}"
 SRC_URI =3D "git://git.ti.com/graphics/ti-gc320-libs.git;protocol=3Dgit;br=
anch=3D${BRANCH}"
 SRCREV =3D "c0afab259de59909cfe74c01f3f7fbaa147f94b5"

-RRECOMMENDS_${PN} =3D "ti-gc320-driver"
+RRECOMMENDS:${PN} =3D "ti-gc320-driver"

 # There's only hardfp version available
 python __anonymous() {
@@ -43,4 +43,4 @@ do_install() {
     chown -R root:root ${D}
 }

-INSANE_SKIP_${PN} +=3D "ldflags"
+INSANE_SKIP:${PN} +=3D "ldflags"
diff --git a/recipes-graphics/libgles/ti-img-rogue-umlibs_1.13.5776728.bb b=
/recipes-graphics/libgles/ti-img-rogue-umlibs_1.13.5776728.bb
index 5194015e..1ff4b65a 100644
--- a/recipes-graphics/libgles/ti-img-rogue-umlibs_1.13.5776728.bb
+++ b/recipes-graphics/libgles/ti-img-rogue-umlibs_1.13.5776728.bb
@@ -30,22 +30,22 @@ inherit update-rc.d
 PROVIDES +=3D "virtual/egl virtual/libgles1 virtual/libgles2 virtual/libgb=
m"

 DEPENDS +=3D "libdrm wayland expat"
-RDEPENDS_${PN} +=3D "bash"
-RDEPENDS_${PN} +=3D "wayland expat"
+RDEPENDS:${PN} +=3D "bash"
+RDEPENDS:${PN} +=3D "wayland expat"

-RPROVIDES_${PN} =3D "libegl libgles1 libgles2 libgbm"
-RPROVIDES_${PN}-dev =3D "libegl-dev libgles1-dev libgles2-dev libgbm-dev"
-RPROVIDES_${PN}-dbg =3D "libegl-dbg libgles1-dbg libgles2-dbg"
+RPROVIDES:${PN} =3D "libegl libgles1 libgles2 libgbm"
+RPROVIDES:${PN}-dev =3D "libegl-dev libgles1-dev libgles2-dev libgbm-dev"
+RPROVIDES:${PN}-dbg =3D "libegl-dbg libgles1-dbg libgles2-dbg"

-RREPLACES_${PN} =3D "libegl libgles1 liblges2 libgbm"
-RREPLACES_${PN}-dev =3D "libegl-dev libgles1-dev libgles2-dev libgbm-dev"
-RREPLACES_${PN}-dbg =3D "libegl-dbg libgles1-dbg libgles2-dbg"
+RREPLACES:${PN} =3D "libegl libgles1 liblges2 libgbm"
+RREPLACES:${PN}-dev =3D "libegl-dev libgles1-dev libgles2-dev libgbm-dev"
+RREPLACES:${PN}-dbg =3D "libegl-dbg libgles1-dbg libgles2-dbg"

-RCONFLICTS_${PN} =3D "libegl libgles1 libgles2 libgbm"
-RCONFLICTS_${PN}-dev =3D "libegl-dev libgles1-dev libgles2-dev libgbm-dev"
-RCONFLICTS_${PN}-dbg =3D "libegl-dbg libgles1-dbg libgles2-dbg"
+RCONFLICTS:${PN} =3D "libegl libgles1 libgles2 libgbm"
+RCONFLICTS:${PN}-dev =3D "libegl-dev libgles1-dev libgles2-dev libgbm-dev"
+RCONFLICTS:${PN}-dbg =3D "libegl-dbg libgles1-dbg libgles2-dbg"

-RRECOMMENDS_${PN} +=3D "ti-img-rogue-driver"
+RRECOMMENDS:${PN} +=3D "ti-img-rogue-driver"

 S =3D "${WORKDIR}/git"

@@ -54,16 +54,16 @@ do_install () {
     chown -R root:root ${D}
 }

-FILES_${PN} +=3D " ${base_libdir}/firmware/"
-FILES_${PN} +=3D " ${datadir}/"
+FILES:${PN} +=3D " ${base_libdir}/firmware/"
+FILES:${PN} +=3D " ${datadir}/"

 PACKAGES =3D+ "${PN}-plugins"
-FILES_${PN}-plugins =3D "${libdir}/libGLESv2.so ${libdir}/libGLESv1_CM.so =
${libdir}/libEGL.so ${libdir}/dri/pvr_dri.so"
-RDEPENDS_${PN} +=3D "${PN}-plugins"
+FILES:${PN}-plugins =3D "${libdir}/libGLESv2.so ${libdir}/libGLESv1_CM.so =
${libdir}/libEGL.so ${libdir}/dri/pvr_dri.so"
+RDEPENDS:${PN} +=3D "${PN}-plugins"

-ALLOW_EMPTY_${PN}-plugins =3D "1"
+ALLOW_EMPTY:${PN}-plugins =3D "1"

-INSANE_SKIP_${PN} +=3D "ldflags arch already-stripped"
-INSANE_SKIP_${PN}-plugins =3D "dev-so"
+INSANE_SKIP:${PN} +=3D "ldflags arch already-stripped"
+INSANE_SKIP:${PN}-plugins =3D "dev-so"

 CLEANBROKEN =3D "1"
diff --git a/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb b/recip=
es-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
index 627d128f..4cbdd07a 100644
--- a/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
+++ b/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
@@ -32,24 +32,24 @@ inherit update-rc.d
 PROVIDES +=3D "virtual/egl virtual/libgles1 virtual/libgles2 virtual/libgb=
m"

 DEPENDS +=3D "libdrm udev wayland wayland-protocols libffi expat"
-RDEPENDS_${PN} +=3D "libdrm libdrm-omap udev wayland wayland-protocols lib=
ffi expat"
+RDEPENDS:${PN} +=3D "libdrm libdrm-omap udev wayland wayland-protocols lib=
ffi expat"

-RPROVIDES_${PN} =3D "libegl libgles1 libgles2 libgbm"
-RPROVIDES_${PN}-dev =3D "libegl-dev libgles1-dev libgles2-dev libgbm-dev"
-RPROVIDES_${PN}-dbg =3D "libegl-dbg libgles1-dbg libgles2-dbg libgbm-dbg"
+RPROVIDES:${PN} =3D "libegl libgles1 libgles2 libgbm"
+RPROVIDES:${PN}-dev =3D "libegl-dev libgles1-dev libgles2-dev libgbm-dev"
+RPROVIDES:${PN}-dbg =3D "libegl-dbg libgles1-dbg libgles2-dbg libgbm-dbg"

-RREPLACES_${PN} =3D "libegl libgles1 libgles2 libgbm"
-RREPLACES_${PN}-dev =3D "libegl-dev libgles1-dev libgles2-dev libgbm-dev"
-RREPLACES_${PN}-dbg =3D "libegl-dbg libgles1-dbg libgles2-dbg libgbm-dbg"
+RREPLACES:${PN} =3D "libegl libgles1 libgles2 libgbm"
+RREPLACES:${PN}-dev =3D "libegl-dev libgles1-dev libgles2-dev libgbm-dev"
+RREPLACES:${PN}-dbg =3D "libegl-dbg libgles1-dbg libgles2-dbg libgbm-dbg"

-RCONFLICTS_${PN} =3D "libegl libgles1 libgles2 libgbm"
-RCONFLICTS_${PN}-dev =3D "libegl-dev libgles1-dev libgles2-dev libgbm-dev"
-RCONFLICTS_${PN}-dbg =3D "libegl-dbg libgles1-dbg libgles2-dbg libgbm-dbg"
+RCONFLICTS:${PN} =3D "libegl libgles1 libgles2 libgbm"
+RCONFLICTS:${PN}-dev =3D "libegl-dev libgles1-dev libgles2-dev libgbm-dev"
+RCONFLICTS:${PN}-dbg =3D "libegl-dbg libgles1-dbg libgles2-dbg libgbm-dbg"

 # The actual SONAME is libGLESv2.so.2, so need to explicitly specify RPROV=
IDES for .so.1 here
-RPROVIDES_${PN} +=3D "libGLESv2.so.1"
+RPROVIDES:${PN} +=3D "libGLESv2.so.1"

-RRECOMMENDS_${PN} +=3D "ti-sgx-ddk-km"
+RRECOMMENDS:${PN} +=3D "ti-sgx-ddk-km"

 S =3D "${WORKDIR}/git"

@@ -60,12 +60,12 @@ do_install () {
     chown -R root:root ${D}
 }

-FILES_${PN} =3D  "${bindir}/*"
-FILES_${PN} +=3D " ${libdir}/*"
-FILES_${PN} +=3D  "${includedir}/*"
-FILES_${PN} +=3D  "${sysconfdir}/*"
+FILES:${PN} =3D  "${bindir}/*"
+FILES:${PN} +=3D " ${libdir}/*"
+FILES:${PN} +=3D  "${includedir}/*"
+FILES:${PN} +=3D  "${sysconfdir}/*"

-INSANE_SKIP_${PN} +=3D "dev-so ldflags useless-rpaths"
-INSANE_SKIP_${PN} +=3D "already-stripped dev-deps"
+INSANE_SKIP:${PN} +=3D "dev-so ldflags useless-rpaths"
+INSANE_SKIP:${PN} +=3D "already-stripped dev-deps"

 CLEANBROKEN =3D "1"
diff --git a/recipes-kernel/kselftests/kselftests_4.10.bb b/recipes-kernel/=
kselftests/kselftests_4.10.bb
index f478e56d..5cd72f96 100644
--- a/recipes-kernel/kselftests/kselftests_4.10.bb
+++ b/recipes-kernel/kselftests/kselftests_4.10.bb
@@ -80,42 +80,42 @@ PACKAGE_BEFORE_PN =3D " \
         ${PN}-zram \
 "

-FILES_${PN}-bpf =3D "${bindir}/kselftests/bpf"
-FILES_${PN}-breakpoints =3D "${bindir}/kselftests/breakpoints"
-FILES_${PN}-capabilities =3D "${bindir}/kselftests/capabilities"
-FILES_${PN}-cpu-hotplug =3D "${bindir}/kselftests/cpu-hotplug"
-FILES_${PN}-efivarfs =3D "${bindir}/kselftests/efivarfs"
-FILES_${PN}-exec =3D "${bindir}/kselftests/exec"
-FILES_${PN}-firmware =3D "${bindir}/kselftests/firmware"
-FILES_${PN}-ftrace =3D "${bindir}/kselftests/ftrace"
-FILES_${PN}-futex =3D "${bindir}/kselftests/futex"
-FILES_${PN}-gpio =3D "${bindir}/kselftests/gpio"
-FILES_${PN}-ipc =3D "${bindir}/kselftests/ipc"
-FILES_${PN}-kcmp =3D "${bindir}/kselftests/kcmp"
-FILES_${PN}-lib =3D "${bindir}/kselftests/lib"
-FILES_${PN}-membarrier =3D "${bindir}/kselftests/membarrier"
-FILES_${PN}-memfd =3D "${bindir}/kselftests/memfd"
-FILES_${PN}-memory-hotplug =3D "${bindir}/kselftests/memory-hotplug"
-FILES_${PN}-mount =3D "${bindir}/kselftests/mount"
-FILES_${PN}-mqueue =3D "${bindir}/kselftests/mqueue"
-FILES_${PN}-net =3D "${bindir}/kselftests/net"
-FILES_${PN}-nsfs =3D "${bindir}/kselftests/nsfs"
-FILES_${PN}-powerpc =3D "${bindir}/kselftests/powerpc"
-FILES_${PN}-pstore =3D "${bindir}/kselftests/pstore"
-FILES_${PN}-ptp =3D "${bindir}/kselftests/ptp"
-FILES_${PN}-ptrace =3D "${bindir}/kselftests/ptrace"
-FILES_${PN}-seccomp =3D "${bindir}/kselftests/seccomp"
-FILES_${PN}-sigaltstack =3D "${bindir}/kselftests/sigaltstack"
-FILES_${PN}-size =3D "${bindir}/kselftests/size"
-FILES_${PN}-static-keys =3D "${bindir}/kselftests/static_keys"
-FILES_${PN}-sync =3D "${bindir}/kselftests/sync"
-FILES_${PN}-sysctl =3D "${bindir}/kselftests/sysctl"
-FILES_${PN}-timers =3D "${bindir}/kselftests/timers"
-FILES_${PN}-user =3D "${bindir}/kselftests/user"
-FILES_${PN}-vm =3D "${bindir}/kselftests/vm"
-FILES_${PN}-x86 =3D "${bindir}/kselftests/x86"
-FILES_${PN}-zram =3D "${bindir}/kselftests/zram"
-FILES_${PN}-dbg +=3D "${bindir}/kselftests/*/.debug"
+FILES:${PN}-bpf =3D "${bindir}/kselftests/bpf"
+FILES:${PN}-breakpoints =3D "${bindir}/kselftests/breakpoints"
+FILES:${PN}-capabilities =3D "${bindir}/kselftests/capabilities"
+FILES:${PN}-cpu-hotplug =3D "${bindir}/kselftests/cpu-hotplug"
+FILES:${PN}-efivarfs =3D "${bindir}/kselftests/efivarfs"
+FILES:${PN}-exec =3D "${bindir}/kselftests/exec"
+FILES:${PN}-firmware =3D "${bindir}/kselftests/firmware"
+FILES:${PN}-ftrace =3D "${bindir}/kselftests/ftrace"
+FILES:${PN}-futex =3D "${bindir}/kselftests/futex"
+FILES:${PN}-gpio =3D "${bindir}/kselftests/gpio"
+FILES:${PN}-ipc =3D "${bindir}/kselftests/ipc"
+FILES:${PN}-kcmp =3D "${bindir}/kselftests/kcmp"
+FILES:${PN}-lib =3D "${bindir}/kselftests/lib"
+FILES:${PN}-membarrier =3D "${bindir}/kselftests/membarrier"
+FILES:${PN}-memfd =3D "${bindir}/kselftests/memfd"
+FILES:${PN}-memory-hotplug =3D "${bindir}/kselftests/memory-hotplug"
+FILES:${PN}-mount =3D "${bindir}/kselftests/mount"
+FILES:${PN}-mqueue =3D "${bindir}/kselftests/mqueue"
+FILES:${PN}-net =3D "${bindir}/kselftests/net"
+FILES:${PN}-nsfs =3D "${bindir}/kselftests/nsfs"
+FILES:${PN}-powerpc =3D "${bindir}/kselftests/powerpc"
+FILES:${PN}-pstore =3D "${bindir}/kselftests/pstore"
+FILES:${PN}-ptp =3D "${bindir}/kselftests/ptp"
+FILES:${PN}-ptrace =3D "${bindir}/kselftests/ptrace"
+FILES:${PN}-seccomp =3D "${bindir}/kselftests/seccomp"
+FILES:${PN}-sigaltstack =3D "${bindir}/kselftests/sigaltstack"
+FILES:${PN}-size =3D "${bindir}/kselftests/size"
+FILES:${PN}-static-keys =3D "${bindir}/kselftests/static_keys"
+FILES:${PN}-sync =3D "${bindir}/kselftests/sync"
+FILES:${PN}-sysctl =3D "${bindir}/kselftests/sysctl"
+FILES:${PN}-timers =3D "${bindir}/kselftests/timers"
+FILES:${PN}-user =3D "${bindir}/kselftests/user"
+FILES:${PN}-vm =3D "${bindir}/kselftests/vm"
+FILES:${PN}-x86 =3D "${bindir}/kselftests/x86"
+FILES:${PN}-zram =3D "${bindir}/kselftests/zram"
+FILES:${PN}-dbg +=3D "${bindir}/kselftests/*/.debug"

 # FIXME bpf target is failing to build and need to be fixed:
 # In file included from test_verifier.c:23:0:
@@ -123,24 +123,24 @@ FILES_${PN}-dbg +=3D "${bindir}/kselftests/*/.debug"
 #   struct pt_regs regs;
 #                  ^~~~
 # make[1]: *** [test_verifier] Error 1
-ALLOW_EMPTY_${PN}-bpf =3D "1"
+ALLOW_EMPTY:${PN}-bpf =3D "1"

 # gcc 7.x fails to build seccomp
-ALLOW_EMPTY_${PN}-seccomp =3D "1"
+ALLOW_EMPTY:${PN}-seccomp =3D "1"

 # FIXME net target builds most of the binaries, but reuseport_bpf_numa dep=
ends on libnuma,
 # which is not availbale on ARM, failing entire test case
-ALLOW_EMPTY_${PN}-net =3D "1"
-
-RDEPENDS_${PN}-cpu-hotplug +=3D "bash"
-RDEPENDS_${PN}-efivarfs +=3D "bash"
-RDEPENDS_${PN}-futex +=3D "bash ncurses"
-RDEPENDS_${PN}-gpio +=3D "bash"
-RDEPENDS_${PN}-memory-hotplug +=3D "bash"
-RDEPENDS_${PN}-net +=3D "bash"
-RDEPENDS_${PN}-vm +=3D "bash sudo"
-RDEPENDS_${PN}-zram +=3D "bash bc"
-RDEPENDS_${PN} +=3D "bash \
+ALLOW_EMPTY:${PN}-net =3D "1"
+
+RDEPENDS:${PN}-cpu-hotplug +=3D "bash"
+RDEPENDS:${PN}-efivarfs +=3D "bash"
+RDEPENDS:${PN}-futex +=3D "bash ncurses"
+RDEPENDS:${PN}-gpio +=3D "bash"
+RDEPENDS:${PN}-memory-hotplug +=3D "bash"
+RDEPENDS:${PN}-net +=3D "bash"
+RDEPENDS:${PN}-vm +=3D "bash sudo"
+RDEPENDS:${PN}-zram +=3D "bash bc"
+RDEPENDS:${PN} +=3D "bash \
         ${PN}-bpf \
         ${PN}-capabilities \
         ${PN}-cpu-hotplug \
@@ -174,17 +174,17 @@ RDEPENDS_${PN} +=3D "bash \
         ${PN}-zram \
 "

-RDEPENDS_${PN}_append_aarch64 =3D " ${PN}-breakpoints ${PN}-ipc"
-RDEPENDS_${PN}_append_x86 =3D " ${PN}-breakpoints ${PN}-ipc ${PN}-x86"
-RDEPENDS_${PN}_append_x86-64 =3D " ${PN}-breakpoints ${PN}-ipc ${PN}-x86"
-RDEPENDS_${PN}_append_powerpc =3D " ${PN}-powerpc"
-RDEPENDS_${PN}_append_powerpc64 =3D " ${PN}-powerpc"
+RDEPENDS:${PN}:append:aarch64 =3D " ${PN}-breakpoints ${PN}-ipc"
+RDEPENDS:${PN}:append:x86 =3D " ${PN}-breakpoints ${PN}-ipc ${PN}-x86"
+RDEPENDS:${PN}:append:x86-64 =3D " ${PN}-breakpoints ${PN}-ipc ${PN}-x86"
+RDEPENDS:${PN}:append:powerpc =3D " ${PN}-powerpc"
+RDEPENDS:${PN}:append:powerpc64 =3D " ${PN}-powerpc"

-INSANE_SKIP_${PN} =3D "already-stripped"
-INSANE_SKIP_${PN}-exec =3D "ldflags"
-INSANE_SKIP_${PN}-ipc =3D "ldflags"
-INSANE_SKIP_${PN}-mount =3D "ldflags"
-INSANE_SKIP_${PN}-vm =3D "ldflags"
+INSANE_SKIP:${PN} =3D "already-stripped"
+INSANE_SKIP:${PN}-exec =3D "ldflags"
+INSANE_SKIP:${PN}-ipc =3D "ldflags"
+INSANE_SKIP:${PN}-mount =3D "ldflags"
+INSANE_SKIP:${PN}-vm =3D "ldflags"

-COMPATIBLE_MACHINE_riscv64 =3D "(null)"
-COMPATIBLE_MACHINE_riscv32 =3D "(null)"
+COMPATIBLE_MACHINE:riscv64 =3D "(null)"
+COMPATIBLE_MACHINE:riscv32 =3D "(null)"
diff --git a/recipes-kernel/linux/bundle-devicetree.inc b/recipes-kernel/li=
nux/bundle-devicetree.inc
index 4d450374..d259e58c 100644
--- a/recipes-kernel/linux/bundle-devicetree.inc
+++ b/recipes-kernel/linux/bundle-devicetree.inc
@@ -2,7 +2,7 @@
 # zImage. The factory u-boot on lego-ev3 EEPROM only supports uImage, so w=
e
 # append the DTB to the final uImage here.

-do_deploy_append() {
+do_deploy:append() {
     if [ "${KERNEL_DEVICETREE_BUNDLE}" =3D "1" ]; then
         install -d ${DEPLOYDIR}
         for dtbf in ${KERNEL_DEVICETREE}; do
diff --git a/recipes-kernel/linux/kernel-rdepends.inc b/recipes-kernel/linu=
x/kernel-rdepends.inc
index 743b352c..193afe48 100644
--- a/recipes-kernel/linux/kernel-rdepends.inc
+++ b/recipes-kernel/linux/kernel-rdepends.inc
@@ -1,41 +1,41 @@
 # Pull in the devicetree files into the rootfs
-RDEPENDS_${KERNEL_PACKAGE_NAME}-base +=3D "kernel-devicetree"
+RDEPENDS:${KERNEL_PACKAGE_NAME}-base +=3D "kernel-devicetree"

 # Add run-time dependency for PM firmware to the rootfs
-RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_ti33x =3D " amx3-cm3"
-RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_ti43x =3D " amx3-cm3"
+RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append_ti33x =3D " amx3-cm3"
+RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append_ti43x =3D " amx3-cm3"

 # Add run-time dependency for VPE VPDMA firmware to the rootfs
-RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_dra7xx =3D " vpdma-fw"
+RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append_dra7xx =3D " vpdma-fw"

 # Add run-time dependency for Goodix firmware to the rootfs
-RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_dra7xx =3D " goodix-fw"
+RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append_dra7xx =3D " goodix-fw"

 # Install boot-monitor skern file into /boot dir of rootfs
-RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_keystone =3D " boot-monitor"
+RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append_keystone =3D " boot-monitor"

 # Install ti-sci-fw into /boot dir of rootfs
-RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_k2g =3D " ti-sci-fw"
+RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append_k2g =3D " ti-sci-fw"

 # Add run-time dependency for SerDes firmware to the rootfs
-RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_keystone =3D " serdes-fw"
+RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append_keystone =3D " serdes-fw"

 # Add run-time dependency for QMSS PDSP firmware to the rootfs
-RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_keystone =3D " qmss-pdsp-fw"
+RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append_keystone =3D " qmss-pdsp-fw"

 # Add run-time dependency for NETCP PA firmware to the rootfs
-RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_k2hk =3D " netcp-pa-fw"
-RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_k2e =3D " netcp-pa-fw"
-RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_k2l =3D " netcp-pa-fw"
+RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append_k2hk =3D " netcp-pa-fw"
+RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append_k2e =3D " netcp-pa-fw"
+RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append_k2l =3D " netcp-pa-fw"

 # Add run-time dependency for PRU Ethernet firmware to the rootfs
-RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_am57xx-evm =3D " prueth-fw pru=
sw-fw pruhsr-fw pruprp-fw"
-RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_am57xx-hs-evm =3D " prueth-fw =
prusw-fw pruhsr-fw pruprp-fw"
-RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_ti43x =3D " prueth-fw pruhsr-f=
w pruprp-fw"
-RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_ti33x =3D " prueth-fw pruhsr-f=
w pruprp-fw"
-RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_am65xx =3D " prueth-fw-am65x"
-RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_am65xx-evm =3D " prueth-fw-am6=
5x-sr2"
-RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_am64xx-evm =3D " prueth-fw-am6=
5x-sr2"
+RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append_am57xx-evm =3D " prueth-fw pru=
sw-fw pruhsr-fw pruprp-fw"
+RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append_am57xx-hs-evm =3D " prueth-fw =
prusw-fw pruhsr-fw pruprp-fw"
+RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append_ti43x =3D " prueth-fw pruhsr-f=
w pruprp-fw"
+RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append_ti33x =3D " prueth-fw pruhsr-f=
w pruprp-fw"
+RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append_am65xx =3D " prueth-fw-am65x"
+RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append_am65xx-evm =3D " prueth-fw-am6=
5x-sr2"
+RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append_am64xx-evm =3D " prueth-fw-am6=
5x-sr2"

 # Add run-time dependency for Cadence MHDP firmware to the rootfs
-RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_j7 =3D " cadence-mhdp-fw"
+RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append_j7 =3D " cadence-mhdp-fw"
diff --git a/recipes-kernel/linux/linux-ti-mainline_git.bb b/recipes-kernel=
/linux/linux-ti-mainline_git.bb
index 5d043da7..9489ed6a 100644
--- a/recipes-kernel/linux/linux-ti-mainline_git.bb
+++ b/recipes-kernel/linux/linux-ti-mainline_git.bb
@@ -25,7 +25,7 @@ SRCREV =3D "62fb9874f5da54fdb243003b386128037319b219"
 PV =3D "5.13+git${SRCPV}"

 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuil=
d
-MACHINE_KERNEL_PR_append =3D "b"
+MACHINE_KERNEL_PR:append =3D "b"
 PR =3D "${MACHINE_KERNEL_PR}"

 KERNEL_GIT_URI =3D "git://git.kernel.org/pub/scm/linux/kernel/git/torvalds=
/linux.git"
@@ -41,12 +41,12 @@ SRCREV_FORMAT =3D "linux"

 KERNEL_DEVICETREE =3D ""

-kernel_do_compile_append() {
+kernel_do_compile:append() {
         oe_runmake dtbs CC=3D"${KERNEL_CC} $cc_extra " LD=3D"${KERNEL_LD}"=
 ${KERNEL_EXTRA_ARGS}
         oe_runmake -C ${WORKDIR}/ti-upstream-tools LINUX=3D${S} DTC=3D${B}=
/scripts/dtc/dtc O=3D${B} CC=3D"${KERNEL_CC} $cc_extra " LD=3D"${KERNEL_LD}=
" ${KERNEL_EXTRA_ARGS}
 }

-do_install_append() {
+do_install:append() {
         for dtbf in `find arch/${ARCH}/boot/dts/ \( -name '*.dtb' -or -nam=
e '*.dtbo' \)`; do
                 dtb=3D"$dtbf"
                 dtb_ext=3D${dtb##*.}
@@ -56,7 +56,7 @@ do_install_append() {
         done
 }

-do_deploy_append() {
+do_deploy:append() {
         for dtbf in `find arch/${ARCH}/boot/dts/ \( -name '*.dtb' -or -nam=
e '*.dtbo' \) -printf '%P\n'`; do
                 dtb=3D"$dtbf"
                 dtb_ext=3D${dtb##*.}
@@ -67,9 +67,9 @@ do_deploy_append() {
         done
 }

-do_shared_workdir_prepend() {
+do_shared_workdir:prepend() {
         cd ${B}
         echo >> Module.symvers
 }

-FILES_${KERNEL_PACKAGE_NAME}-devicetree +=3D "/${KERNEL_IMAGEDEST}/*.itb"
+FILES:${KERNEL_PACKAGE_NAME}-devicetree +=3D "/${KERNEL_IMAGEDEST}/*.itb"
diff --git a/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb b/recipes-ker=
nel/linux/linux-ti-staging-rt_5.10.bb
index f039d6c2..256cea2e 100644
--- a/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
+++ b/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
@@ -2,7 +2,7 @@ require linux-ti-staging_5.10.bb

 # Look in the generic major.minor directory for files
 # This will have priority over generic non-rt path
-FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}-5.10:"
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}-5.10:"

 BRANCH =3D "ti-rt-linux-5.10.y"

diff --git a/recipes-kernel/linux/linux-ti-staging-rt_5.4.bb b/recipes-kern=
el/linux/linux-ti-staging-rt_5.4.bb
index 5542422e..8a0c0eaf 100644
--- a/recipes-kernel/linux/linux-ti-staging-rt_5.4.bb
+++ b/recipes-kernel/linux/linux-ti-staging-rt_5.4.bb
@@ -2,7 +2,7 @@ require linux-ti-staging_5.4.bb

 # Look in the generic major.minor directory for files
 # This will have priority over generic non-rt path
-FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}-5.4:"
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}-5.4:"

 BRANCH =3D "ti-rt-linux-5.4.y"

diff --git a/recipes-kernel/linux/linux-ti-staging-systest_5.10.bb b/recipe=
s-kernel/linux/linux-ti-staging-systest_5.10.bb
index f0917985..e57d82eb 100644
--- a/recipes-kernel/linux/linux-ti-staging-systest_5.10.bb
+++ b/recipes-kernel/linux/linux-ti-staging-systest_5.10.bb
@@ -2,4 +2,4 @@ require linux-ti-staging_5.10.bb

 # Look in the generic major.minor directory for files
 # This will have priority over generic non-rt path
-FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}-5.10:"
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}-5.10:"
diff --git a/recipes-kernel/linux/linux-ti-staging-systest_5.4.bb b/recipes=
-kernel/linux/linux-ti-staging-systest_5.4.bb
index a2404574..7a9a148b 100644
--- a/recipes-kernel/linux/linux-ti-staging-systest_5.4.bb
+++ b/recipes-kernel/linux/linux-ti-staging-systest_5.4.bb
@@ -2,4 +2,4 @@ require linux-ti-staging_5.4.bb

 # Look in the generic major.minor directory for files
 # This will have priority over generic non-rt path
-FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}-5.4:"
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}-5.4:"
diff --git a/recipes-kernel/linux/linux-ti-staging_5.10.bb b/recipes-kernel=
/linux/linux-ti-staging_5.10.bb
index e06f7b64..36b0d005 100644
--- a/recipes-kernel/linux/linux-ti-staging_5.10.bb
+++ b/recipes-kernel/linux/linux-ti-staging_5.10.bb
@@ -14,7 +14,7 @@ require recipes-kernel/linux/kernel-rdepends.inc
 require recipes-kernel/linux/ti-kernel.inc

 # Look in the generic major.minor directory for files
-FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}-5.10:"
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}-5.10:"

 KERNEL_EXTRA_ARGS +=3D "LOADADDR=3D${UBOOT_ENTRYPOINT} \
                       ${EXTRA_DTC_ARGS}"
@@ -27,7 +27,7 @@ SRCREV =3D "4c2eade9f722838b0e457650368cba1c6c7483c2"
 PV =3D "5.10.41+git${SRCPV}"

 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuil=
d
-MACHINE_KERNEL_PR_append =3D "b"
+MACHINE_KERNEL_PR:append =3D "b"
 PR =3D "${MACHINE_KERNEL_PR}"

 KERNEL_GIT_URI =3D "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git"
@@ -35,11 +35,11 @@ KERNEL_GIT_PROTOCOL =3D "git"
 SRC_URI +=3D "${KERNEL_GIT_URI};protocol=3D${KERNEL_GIT_PROTOCOL};branch=
=3D${BRANCH} \
             file://defconfig"

-FILES_${KERNEL_PACKAGE_NAME}-devicetree +=3D "/${KERNEL_IMAGEDEST}/*.itb"
+FILES:${KERNEL_PACKAGE_NAME}-devicetree +=3D "/${KERNEL_IMAGEDEST}/*.itb"

 # Special configuration for remoteproc/rpmsg IPC modules
 module_conf_rpmsg_client_sample =3D "blacklist rpmsg_client_sample"
 module_conf_ti_k3_r5_remoteproc =3D "softdep ti_k3_r5_remoteproc pre: virt=
io_rpmsg_bus"
 module_conf_ti_k3_dsp_remoteproc =3D "softdep ti_k3_dsp_remoteproc pre: vi=
rtio_rpmsg_bus"
 KERNEL_MODULE_PROBECONF +=3D "rpmsg_client_sample ti_k3_r5_remoteproc ti_k=
3_dsp_remoteproc"
-KERNEL_MODULE_AUTOLOAD_append_j7 =3D " rpmsg_kdrv_switch"
+KERNEL_MODULE_AUTOLOAD:append_j7 =3D " rpmsg_kdrv_switch"
diff --git a/recipes-kernel/linux/linux-ti-staging_5.4.bb b/recipes-kernel/=
linux/linux-ti-staging_5.4.bb
index a86223af..b08a7672 100644
--- a/recipes-kernel/linux/linux-ti-staging_5.4.bb
+++ b/recipes-kernel/linux/linux-ti-staging_5.4.bb
@@ -13,7 +13,7 @@ require recipes-kernel/linux/bundle-devicetree.inc
 require recipes-kernel/linux/kernel-rdepends.inc

 # Look in the generic major.minor directory for files
-FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}-5.4:"
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}-5.4:"

 KERNEL_EXTRA_ARGS +=3D "LOADADDR=3D${UBOOT_ENTRYPOINT}"

@@ -25,7 +25,7 @@ SRCREV =3D "023faefa70274929bff92dc41167b007f7523792"
 PV =3D "5.4.106+git${SRCPV}"

 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuil=
d
-MACHINE_KERNEL_PR_append =3D "a"
+MACHINE_KERNEL_PR:append =3D "a"
 PR =3D "${MACHINE_KERNEL_PR}"

 KERNEL_GIT_URI =3D "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git"
@@ -33,11 +33,11 @@ KERNEL_GIT_PROTOCOL =3D "git"
 SRC_URI +=3D "${KERNEL_GIT_URI};protocol=3D${KERNEL_GIT_PROTOCOL};branch=
=3D${BRANCH} \
             file://defconfig"

-FILES_${KERNEL_PACKAGE_NAME}-devicetree +=3D "/${KERNEL_IMAGEDEST}/*.itb"
+FILES:${KERNEL_PACKAGE_NAME}-devicetree +=3D "/${KERNEL_IMAGEDEST}/*.itb"

 # Special configuration for remoteproc/rpmsg IPC modules
 module_conf_rpmsg_client_sample =3D "blacklist rpmsg_client_sample"
 module_conf_ti_k3_r5_remoteproc =3D "softdep ti_k3_r5_remoteproc pre: virt=
io_rpmsg_bus"
 module_conf_ti_k3_dsp_remoteproc =3D "softdep ti_k3_dsp_remoteproc pre: vi=
rtio_rpmsg_bus"
 KERNEL_MODULE_PROBECONF +=3D "rpmsg_client_sample ti_k3_r5_remoteproc ti_k=
3_dsp_remoteproc"
-KERNEL_MODULE_AUTOLOAD_append_j7 =3D " rpmsg_kdrv_switch"
+KERNEL_MODULE_AUTOLOAD:append_j7 =3D " rpmsg_kdrv_switch"
diff --git a/recipes-kernel/linux/ti-uio.inc b/recipes-kernel/linux/ti-uio.=
inc
index 80dad7dc..6fc74d1a 100644
--- a/recipes-kernel/linux/ti-uio.inc
+++ b/recipes-kernel/linux/ti-uio.inc
@@ -1,19 +1,19 @@
-SRC_URI_append_keystone =3D " file://keystone-uio.dtsi"
-SRC_URI_append_k2hk =3D " file://k2hk-uio.dtsi"
-SRC_URI_append_k2l =3D " file://k2l-uio.dtsi"
-SRC_URI_append_k2e =3D " file://k2e-uio.dtsi"
-SRC_URI_append_k2g =3D " file://keystone-k2g-pru-uio.dtsi"
-SRC_URI_append_dra7xx =3D " file://am57xx-pru-uio.dtsi \
+SRC_URI:append_keystone =3D " file://keystone-uio.dtsi"
+SRC_URI:append_k2hk =3D " file://k2hk-uio.dtsi"
+SRC_URI:append_k2l =3D " file://k2l-uio.dtsi"
+SRC_URI:append_k2e =3D " file://k2e-uio.dtsi"
+SRC_URI:append_k2g =3D " file://keystone-k2g-pru-uio.dtsi"
+SRC_URI:append_dra7xx =3D " file://am57xx-pru-uio.dtsi \
                           file://am571x-pru-uio.dtsi \
 "
-SRC_URI_append_ti33x =3D " file://am335x-pru-uio.dtsi"
-SRC_URI_append_ti43x =3D " file://am437x-pru-uio.dtsi"
+SRC_URI:append_ti33x =3D " file://am335x-pru-uio.dtsi"
+SRC_URI:append_ti43x =3D " file://am437x-pru-uio.dtsi"

 DTSI_LIST =3D ""
-DTSI_LIST_append_keystone =3D " keystone-uio.dtsi"
-DTSI_LIST_append_k2hk =3D " k2hk-uio.dtsi"
-DTSI_LIST_append_k2l =3D " k2l-uio.dtsi"
-DTSI_LIST_append_k2e =3D " k2e-uio.dtsi"
+DTSI_LIST:append_keystone =3D " keystone-uio.dtsi"
+DTSI_LIST:append_k2hk =3D " k2hk-uio.dtsi"
+DTSI_LIST:append_k2l =3D " k2l-uio.dtsi"
+DTSI_LIST:append_k2e =3D " k2e-uio.dtsi"

 do_setup_uio() {
     if [ "${ENABLE_TI_UIO_DEVICES}" =3D=3D "1" ]
@@ -30,7 +30,7 @@ do_setup_uio() {
     fi
 }

-do_setup_uio_append_dra7xx() {
+do_setup_uio:append_dra7xx() {

     if [ "${ENABLE_TI_UIO_DEVICES}" =3D=3D "1" ]
     then
@@ -53,7 +53,7 @@ do_setup_uio_append_dra7xx() {
     fi
 }

-do_setup_uio_append_ti33x() {
+do_setup_uio:append_ti33x() {

     if [ "${ENABLE_TI_UIO_DEVICES}" =3D=3D "1" ]
     then
@@ -65,7 +65,7 @@ do_setup_uio_append_ti33x() {
     fi
 }

-do_setup_uio_append_ti43x() {
+do_setup_uio:append_ti43x() {

     if [ "${ENABLE_TI_UIO_DEVICES}" =3D=3D "1" ]
     then
@@ -77,7 +77,7 @@ do_setup_uio_append_ti43x() {
     fi
 }

-do_setup_uio_append_k2g() {
+do_setup_uio:append_k2g() {

     if [ "${ENABLE_TI_UIO_DEVICES}" =3D=3D "1" ]
     then
diff --git a/recipes-security/optee/optee-os_%.bbappend b/recipes-security/=
optee/optee-os_%.bbappend
index d7e81c5a..881dc84f 100644
--- a/recipes-security/optee/optee-os_%.bbappend
+++ b/recipes-security/optee/optee-os_%.bbappend
@@ -1,8 +1,8 @@
-do_compile_prepend_ti-soc() {
+do_compile:prepend_ti-soc() {
     export TI_SECURE_DEV_PKG=3D${TI_SECURE_DEV_PKG}
 }

-do_compile_append_k3() {
+do_compile:append_k3() {
     ( cd ${B}/core/; \
         cp tee-pager_v2.bin ${B}/bl32.bin; \
         cp tee.elf ${B}/bl32.elf; \
@@ -37,23 +37,23 @@ optee_sign_k3hs() {
     )
 }

-do_compile_append_ti43x() {
+do_compile:append_ti43x() {
     optee_sign_legacyhs
 }

-do_compile_append_dra7xx() {
+do_compile:append_dra7xx() {
     optee_sign_legacyhs
 }

-do_compile_append_am65xx-hs-evm() {
+do_compile:append_am65xx-hs-evm() {
     optee_sign_k3hs
 }

-do_compile_append_j7-hs-evm() {
+do_compile:append_j7-hs-evm() {
     optee_sign_k3hs
 }

-do_install_append_ti-soc() {
+do_install:append_ti-soc() {
     install -m 644 ${B}/*.optee ${D}${nonarch_base_libdir}/firmware/ || tr=
ue
     install -m 644 ${B}/bl32.bin ${D}${nonarch_base_libdir}/firmware/ || t=
rue
     install -m 644 ${B}/bl32.elf ${D}${nonarch_base_libdir}/firmware/ || t=
rue
@@ -66,18 +66,18 @@ optee_deploy_legacyhs() {
     done
 }

-do_deploy_append_ti43x() {
+do_deploy:append_ti43x() {
     optee_deploy_legacyhs
 }

-do_deploy_append_dra7xx() {
+do_deploy:append_dra7xx() {
     optee_deploy_legacyhs
 }

-do_deploy_append_k3() {
+do_deploy:append_k3() {
     ln -sf optee/bl32.bin ${DEPLOYDIR}/
     ln -sf optee/bl32.elf ${DEPLOYDIR}/
 }

 # This is needed for bl32.elf
-INSANE_SKIP_${PN}_append_k3 =3D " textrel"
+INSANE_SKIP:${PN}:append_k3 =3D " textrel"
diff --git a/recipes-ti/beagleboard/beaglebone-capes.bb b/recipes-ti/beagle=
board/beaglebone-capes.bb
index 569a3e5a..ceefe0d6 100644
--- a/recipes-ti/beagleboard/beaglebone-capes.bb
+++ b/recipes-ti/beagleboard/beaglebone-capes.bb
@@ -23,4 +23,4 @@ do_install() {
         install -m 0755 ${WORKDIR}/cape*.sh ${D}${bindir}
 }

-FILES_${PN} +=3D "${base_libdir}/systemd/system"
+FILES:${PN} +=3D "${base_libdir}/systemd/system"
diff --git a/recipes-ti/beagleboard/beaglebone-getting-started.bb b/recipes=
-ti/beagleboard/beaglebone-getting-started.bb
index adde30b4..303b9bd7 100644
--- a/recipes-ti/beagleboard/beaglebone-getting-started.bb
+++ b/recipes-ti/beagleboard/beaglebone-getting-started.bb
@@ -17,5 +17,5 @@ do_install() {
         cp -R --no-dereference --preserve=3Dmode,links ${S}/* ${D}${datadi=
r}/${PN}
 }

-FILES_${PN} +=3D "${datadir}/${PN}"
-INSANE_SKIP_${PN} =3D "file-rdeps"
+FILES:${PN} +=3D "${datadir}/${PN}"
+INSANE_SKIP:${PN} =3D "file-rdeps"
diff --git a/recipes-ti/beagleboard/gadget-init.bb b/recipes-ti/beagleboard=
/gadget-init.bb
index b546efbb..3ab00ec3 100644
--- a/recipes-ti/beagleboard/gadget-init.bb
+++ b/recipes-ti/beagleboard/gadget-init.bb
@@ -39,22 +39,22 @@ do_install() {

 PACKAGES =3D+ "${PN}-storage ${PN}-network ${PN}-udhcpd"

-ALLOW_EMPTY_${PN} =3D "1"
+ALLOW_EMPTY:${PN} =3D "1"

-FILES_${PN}-storage =3D "${base_libdir}/systemd/system/storage-gadget-init=
.service \
+FILES:${PN}-storage =3D "${base_libdir}/systemd/system/storage-gadget-init=
.service \
                        ${base_libdir}/systemd/system/basic.target.wants/st=
orage-gadget-init.service \
                        ${bindir}/g-storage-reinsert.sh \
                        ${bindir}/update-image-info-on-mmcblk0p1.sh \
                        ${sysconfdir}/udev/rules.d/bone-gmass-eject.rules"

-FILES_${PN}-network =3D "${base_libdir}/systemd/system/network-gadget-init=
.service \
+FILES:${PN}-network =3D "${base_libdir}/systemd/system/network-gadget-init=
.service \
                        ${base_libdir}/systemd/system/basic.target.wants/ne=
twork-gadget-init.service \
                        ${bindir}/g-ether-load.sh \
                        ${bindir}/g-ether-start-service.sh \
                        ${sysconfdir}/udev/rules.d/udhcpd.rules"

-FILES_${PN}-udhcpd =3D "${base_libdir}/systemd/system/udhcpd.service \
+FILES:${PN}-udhcpd =3D "${base_libdir}/systemd/system/udhcpd.service \
                       ${base_libdir}/systemd/system/basic.target.wants/udh=
cpd.service \
                       ${sysconfdir}/udhcpd.conf"

-RRECOMMENDS_${PN} =3D "${PN}-storage ${PN}-network ${PN}-udhcpd"
+RRECOMMENDS:${PN} =3D "${PN}-storage ${PN}-network ${PN}-udhcpd"
diff --git a/recipes-ti/bios/ti-biosutils_1.02.02.bb b/recipes-ti/bios/ti-b=
iosutils_1.02.02.bb
index 01c070d7..eb674f6b 100644
--- a/recipes-ti/bios/ti-biosutils_1.02.02.bb
+++ b/recipes-ti/bios/ti-biosutils_1.02.02.bb
@@ -6,7 +6,7 @@ PVsuffix =3D "_02"
 SRC_URI[biosutilstarball.md5sum] =3D "0654e9e72b0a6fc7a6575829c0cd90c9"
 SRC_URI[biosutilstarball.sha256sum] =3D "df486500bdc8dbe3800fc7efe4241e6fa=
5b1827ba7c0dc17a71b41d42ef921e1"

-INSANE_SKIP_${PN} =3D "installed-vs-shipped"
+INSANE_SKIP:${PN} =3D "installed-vs-shipped"

 COMPATIBLE_HOST ?=3D "null"
 COMPATIBLE_HOST_ti-soc =3D "(.*)"
diff --git a/recipes-ti/bios/ti-sysbios.inc b/recipes-ti/bios/ti-sysbios.in=
c
index 087f2edd..0009dfcc 100644
--- a/recipes-ti/bios/ti-sysbios.inc
+++ b/recipes-ti/bios/ti-sysbios.inc
@@ -19,10 +19,10 @@ do_install() {
     cp ${CP_ARGS} ${S}/* ${D}${SYSBIOS_INSTALL_DIR_RECIPE}
 }

-ALLOW_EMPTY_${PN} =3D "1"
-FILES_${PN}-dev +=3D "${SYSBIOS_INSTALL_DIR_RECIPE}"
+ALLOW_EMPTY:${PN} =3D "1"
+FILES:${PN}-dev +=3D "${SYSBIOS_INSTALL_DIR_RECIPE}"

 INHIBIT_PACKAGE_STRIP =3D "1"
 INHIBIT_SYSROOT_STRIP =3D "1"
 INHIBIT_PACKAGE_DEBUG_SPLIT =3D "1"
-INSANE_SKIP_${PN}-dev =3D "arch ldflags staticdev file-rdeps"
+INSANE_SKIP:${PN}-dev =3D "arch ldflags staticdev file-rdeps"
diff --git a/recipes-ti/codec-engine/ti-codec-engine_3.24.00.08.bb b/recipe=
s-ti/codec-engine/ti-codec-engine_3.24.00.08.bb
index aa538412..5851b899 100644
--- a/recipes-ti/codec-engine/ti-codec-engine_3.24.00.08.bb
+++ b/recipes-ti/codec-engine/ti-codec-engine_3.24.00.08.bb
@@ -25,5 +25,5 @@ do_install() {
         cp ${CP_ARGS} ${S}/* ${D}${CE_INSTALL_DIR_RECIPE}
 }

-ALLOW_EMPTY_${PN} =3D "1"
-FILES_${PN}-dev +=3D "${CE_INSTALL_DIR_RECIPE}"
+ALLOW_EMPTY:${PN} =3D "1"
+FILES:${PN}-dev +=3D "${CE_INSTALL_DIR_RECIPE}"
diff --git a/recipes-ti/ctoolslib/libaet_git.bb b/recipes-ti/ctoolslib/liba=
et_git.bb
index 626ba926..7f31569e 100644
--- a/recipes-ti/ctoolslib/libaet_git.bb
+++ b/recipes-ti/ctoolslib/libaet_git.bb
@@ -32,8 +32,8 @@ do_install() {
 COMPATIBLE_MACHINE =3D "dra7xx|keystone"
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"

-FILES_${PN}-dev +=3D "\
+FILES:${PN}-dev +=3D "\
     ${datadir}/ti/ctoolslib/aet \
 "

-ALLOW_EMPTY_${PN} =3D "1"
+ALLOW_EMPTY:${PN} =3D "1"
diff --git a/recipes-ti/devtools/gcc-arm-baremetal_7-2018-q2-update.bb b/re=
cipes-ti/devtools/gcc-arm-baremetal_7-2018-q2-update.bb
index f474c87f..e0feb02c 100644
--- a/recipes-ti/devtools/gcc-arm-baremetal_7-2018-q2-update.bb
+++ b/recipes-ti/devtools/gcc-arm-baremetal_7-2018-q2-update.bb
@@ -14,16 +14,16 @@ S =3D "${WORKDIR}/gcc-arm-none-eabi-7-2018-q2-update"

 # only x86_64 is supported
 COMPATIBLE_HOST =3D "x86_64.*-linux"
-COMPATIBLE_HOST_class-target =3D "null"
+COMPATIBLE_HOST:class-target =3D "null"

 do_install() {
     install -d ${D}${GCC_ARM_NONE_TOOLCHAIN_RECIPE}
     cp -r ${S}/. ${D}${GCC_ARM_NONE_TOOLCHAIN_RECIPE}
 }

-FILES_${PN} =3D "${GCC_ARM_NONE_TOOLCHAIN_RECIPE}/*"
+FILES:${PN} =3D "${GCC_ARM_NONE_TOOLCHAIN_RECIPE}/*"

-INSANE_SKIP_${PN} =3D "already-stripped libdir staticdev build-deps file-r=
deps"
+INSANE_SKIP:${PN} =3D "already-stripped libdir staticdev build-deps file-r=
deps"
 INHIBIT_PACKAGE_DEBUG_SPLIT =3D "1"

 BBCLASSEXTEND =3D "native nativesdk"
diff --git a/recipes-ti/devtools/gcc-linaro-baremetal-aarch64-native.bb b/r=
ecipes-ti/devtools/gcc-linaro-baremetal-aarch64-native.bb
index 97344f90..f1596a8b 100644
--- a/recipes-ti/devtools/gcc-linaro-baremetal-aarch64-native.bb
+++ b/recipes-ti/devtools/gcc-linaro-baremetal-aarch64-native.bb
@@ -1,6 +1,6 @@
 include recipes-ti/devtools/gcc-linaro.inc

-PACKAGE_DIR =3D "gcc-linaro-${PV}-${GCC_ARM_YEAR}-x86_64_aarch64-elf"
+PACKAGE_DIR =3D "gcc-linaro-${PV}-${GCC_ARM_YEAR}-x86_64:aarch64-elf"
 S =3D "${WORKDIR}/${PACKAGE_DIR}"

 LIC_CHKSUM =3D "bc7fad4bba98e7a4cd5ab3042506493c"
@@ -8,7 +8,7 @@ LIC_CHKSUM =3D "bc7fad4bba98e7a4cd5ab3042506493c"
 inherit native
 require recipes-ti/includes/ti-paths.inc

-SRC_URI =3D "https://releases.linaro.org/components/toolchain/binaries/7.2=
-${GCC_ARM_YEAR}/aarch64-elf/gcc-linaro-${PV}-${GCC_ARM_YEAR}-x86_64_aarch6=
4-elf.tar.xz;name=3Dgcc-linaro-aarch64"
+SRC_URI =3D "https://releases.linaro.org/components/toolchain/binaries/7.2=
-${GCC_ARM_YEAR}/aarch64-elf/gcc-linaro-${PV}-${GCC_ARM_YEAR}-x86_64:aarch6=
4-elf.tar.xz;name=3Dgcc-linaro-aarch64"

 SRC_URI[gcc-linaro-aarch64.md5sum] =3D "4972f8943820bdd2f577f498de78964b"
 SRC_URI[gcc-linaro-aarch64.sha256sum] =3D "30fb7d876bcb982c502057c593d9c1f=
11b35d5158a26d986718e2b998388c4c8"
@@ -18,6 +18,6 @@ do_install() {
     cp -r ${S}/. ${D}${GCC_LINARO_BAREMETAL_AARCH64_TOOLCHAIN_RECIPE}
 }

-FILES_${PN} =3D "${GCC_LINARO_BAREMETAL_AARCH64_TOOLCHAIN_RECIPE}/*"
+FILES:${PN} =3D "${GCC_LINARO_BAREMETAL_AARCH64_TOOLCHAIN_RECIPE}/*"

-INSANE_SKIP_${PN} =3D "already-stripped"
+INSANE_SKIP:${PN} =3D "already-stripped"
diff --git a/recipes-ti/devtools/gcc-linaro-baremetal-native.bb b/recipes-t=
i/devtools/gcc-linaro-baremetal-native.bb
index 0268ae3d..d0683fe1 100644
--- a/recipes-ti/devtools/gcc-linaro-baremetal-native.bb
+++ b/recipes-ti/devtools/gcc-linaro-baremetal-native.bb
@@ -1,6 +1,6 @@
 include recipes-ti/devtools/gcc-linaro.inc

-PACKAGE_DIR =3D "gcc-linaro-${PV}-${GCC_ARM_YEAR}-x86_64_arm-eabi"
+PACKAGE_DIR =3D "gcc-linaro-${PV}-${GCC_ARM_YEAR}-x86_64:arm-eabi"
 S =3D "${WORKDIR}/${PACKAGE_DIR}"

 LIC_CHKSUM =3D "bc7fad4bba98e7a4cd5ab3042506493c"
@@ -8,7 +8,7 @@ LIC_CHKSUM =3D "bc7fad4bba98e7a4cd5ab3042506493c"
 inherit native
 require recipes-ti/includes/ti-paths.inc

-SRC_URI =3D "https://releases.linaro.org/components/toolchain/binaries/7.2=
-${GCC_ARM_YEAR}/arm-eabi/gcc-linaro-${PV}-${GCC_ARM_YEAR}-x86_64_arm-eabi.=
tar.xz;name=3Dgcc-linaro"
+SRC_URI =3D "https://releases.linaro.org/components/toolchain/binaries/7.2=
-${GCC_ARM_YEAR}/arm-eabi/gcc-linaro-${PV}-${GCC_ARM_YEAR}-x86_64:arm-eabi.=
tar.xz;name=3Dgcc-linaro"

 SRC_URI[gcc-linaro.md5sum] =3D "9a4a39cfc78c84375b1160aa93587aed"
 SRC_URI[gcc-linaro.sha256sum] =3D "45fc4f90af2e2e9c3197a275f6005ef5639f7a1=
889fa3eb24c3125ccd70fcd3d"
@@ -18,6 +18,6 @@ do_install() {
     cp -r ${S}/. ${D}${GCC_LINARO_BAREMETAL_TOOLCHAIN_RECIPE}
 }

-FILES_${PN} =3D "${GCC_LINARO_BAREMETAL_TOOLCHAIN_RECIPE}/*"
+FILES:${PN} =3D "${GCC_LINARO_BAREMETAL_TOOLCHAIN_RECIPE}/*"

-INSANE_SKIP_${PN} =3D "already-stripped"
+INSANE_SKIP:${PN} =3D "already-stripped"
diff --git a/recipes-ti/devtools/ti-cg-xml_2.61.00.bb b/recipes-ti/devtools=
/ti-cg-xml_2.61.00.bb
index e618af5a..8e36be6d 100644
--- a/recipes-ti/devtools/ti-cg-xml_2.61.00.bb
+++ b/recipes-ti/devtools/ti-cg-xml_2.61.00.bb
@@ -29,9 +29,9 @@ do_install() {
     cp ${CP_ARGS} ${S}/* ${D}${CG_XML_INSTALL_DIR_RECIPE}
 }

-FILES_${PN} +=3D "${CG_XML_INSTALL_DIR_RECIPE}"
+FILES:${PN} +=3D "${CG_XML_INSTALL_DIR_RECIPE}"

-INSANE_SKIP_${PN} =3D "arch ldflags file-rdeps"
+INSANE_SKIP:${PN} =3D "arch ldflags file-rdeps"

 INHIBIT_PACKAGE_STRIP =3D "1"
 INHIBIT_SYSROOT_STRIP =3D "1"
diff --git a/recipes-ti/devtools/ti-cgt-arm_18.12.5.bb b/recipes-ti/devtool=
s/ti-cgt-arm_18.12.5.bb
index 81384d50..60b216f9 100644
--- a/recipes-ti/devtools/ti-cgt-arm_18.12.5.bb
+++ b/recipes-ti/devtools/ti-cgt-arm_18.12.5.bb
@@ -21,7 +21,7 @@ TI_BIN_UNPK_CMDS =3D ""

 # only x86_64 is supported
 COMPATIBLE_HOST =3D "x86_64.*-linux"
-COMPATIBLE_HOST_class-target =3D "null"
+COMPATIBLE_HOST:class-target =3D "null"

 do_install() {
     install -d ${D}${M4_TOOLCHAIN_INSTALL_DIR_RECIPE}
@@ -31,14 +31,14 @@ do_install() {
 SRC_URI[cgt_arm_installer.md5sum] =3D "e9e668332cf86c965b4da9d1d488426b"
 SRC_URI[cgt_arm_installer.sha256sum] =3D "da976143128c619a278cb4214a4295c4=
09d100f9e65ad2f4d0d1039db7cf98f4"

-BINFILE_NAME =3D "cgt_arm_installer"
+BINFILE_NAME =3D "cgt:arm_installer"

-FILES_${PN} +=3D "${M4_TOOLCHAIN_INSTALL_DIR_RECIPE}"
+FILES:${PN} +=3D "${M4_TOOLCHAIN_INSTALL_DIR_RECIPE}"

 INHIBIT_PACKAGE_STRIP =3D "1"
 INHIBIT_SYSROOT_STRIP =3D "1"
 INHIBIT_PACKAGE_DEBUG_SPLIT =3D "1"

-INSANE_SKIP_${PN} +=3D "arch staticdev file-rdeps"
+INSANE_SKIP:${PN} +=3D "arch staticdev file-rdeps"

 BBCLASSEXTEND =3D "native nativesdk"
diff --git a/recipes-ti/devtools/ti-cgt-pru_2.3.2.bb b/recipes-ti/devtools/=
ti-cgt-pru_2.3.2.bb
index ed10e272..d14c1962 100644
--- a/recipes-ti/devtools/ti-cgt-pru_2.3.2.bb
+++ b/recipes-ti/devtools/ti-cgt-pru_2.3.2.bb
@@ -3,18 +3,18 @@ HOMEPAGE =3D "https://www-a.ti.com/downloads/sds_support/=
TICodegenerationTools/dow
 LICENSE =3D "(TI-TSPA & Thai-Open-Source-Software-Center) & BSD-3-Clause &=
 BSL-1.0 & Hewlett-Packard & AFL-3.0 & MIT & BSD-2-Clause & PD"

 LIC_FILES_CHKSUM =3D "file://ti-cgt-pru_${PV}/PRU_Code_Generation_Tools_2.=
3.x_manifest.html;md5=3De22f9d8240f7cca0c0aa5242d9ffa5bc"
-LIC_FILES_CHKSUM_class-target =3D "file://usr/share/doc/ti/cgt-pru/PRU_Cod=
e_Generation_Tools_2.3.x_manifest.html;md5=3De22f9d8240f7cca0c0aa5242d9ffa5=
bc"
+LIC_FILES_CHKSUM:class-target =3D "file://usr/share/doc/ti/cgt-pru/PRU_Cod=
e_Generation_Tools_2.3.x_manifest.html;md5=3De22f9d8240f7cca0c0aa5242d9ffa5=
bc"

 require recipes-ti/includes/ti-paths.inc
 require recipes-ti/includes/ti-unpack.inc

-BINFILE =3D "ti_cgt_pru_${PV}_linux_installer_x86.bin"
+BINFILE =3D "ti_cgt_pru_${PV}_linux_installer:x86.bin"
 BINFILE_NAME =3D "cgt-pru-x86"
 TI_BIN_UNPK_ARGS =3D "--prefix ${S}"
 TI_BIN_UNPK_CMDS =3D ""

-BINFILE_class-target =3D "ti_cgt_pru_${PV}_armlinuxa8hf_busybox_installer.=
sh"
-BINFILE_NAME_class-target =3D "cgt-pru-arm"
+BINFILE:class-target =3D "ti_cgt_pru_${PV}:armlinuxa8hf_busybox_installer.=
sh"
+BINFILE_NAME:class-target =3D "cgt-pru-arm"

 SRC_URI =3D "http://software-dl.ti.com/codegen/esd/cgt_public_sw/PRU/${PV}=
/${BINFILE};name=3D${BINFILE_NAME}"

@@ -30,13 +30,13 @@ do_install() {
           ${D}${TI_CGT_PRU_INSTALL_DIR_RECIPE}/
 }

-do_install_class-target() {
+do_install:class-target() {
     ${WORKDIR}/${BINFILE} --prefix ${D}
 }

-FILES_${PN} +=3D "${datadir}/ti/*"
+FILES:${PN} +=3D "${datadir}/ti/*"

-FILES_${PN}-dbg =3D "${TI_CGT_PRU_INSTALL_DIR_RECIPE}/bin/.debug \
+FILES:${PN}-dbg =3D "${TI_CGT_PRU_INSTALL_DIR_RECIPE}/bin/.debug \
                    ${TI_CGT_PRU_INSTALL_DIR_RECIPE}/lib/.debug \
 "

@@ -44,6 +44,6 @@ INHIBIT_PACKAGE_STRIP =3D "1"
 INHIBIT_SYSROOT_STRIP =3D "1"
 INHIBIT_PACKAGE_DEBUG_SPLIT =3D "1"

-INSANE_SKIP_${PN} +=3D "arch staticdev already-stripped file-rdeps"
+INSANE_SKIP:${PN} +=3D "arch staticdev already-stripped file-rdeps"

 BBCLASSEXTEND =3D "native nativesdk"
diff --git a/recipes-ti/devtools/ti-cgt470.inc b/recipes-ti/devtools/ti-cgt=
470.inc
index f0992aa7..c8f91271 100644
--- a/recipes-ti/devtools/ti-cgt470.inc
+++ b/recipes-ti/devtools/ti-cgt470.inc
@@ -13,7 +13,7 @@ S =3D "${WORKDIR}/cgt470_${PV}"

 SRC_URI =3D "http://install.source.dir.local/ti_cgt_tms470_${PVwithdots}_s=
etup_linux_x86.bin;name=3Dcgt470bin"

-BINFILE=3D"ti_cgt_tms470_${PVwithdots}_setup_linux_x86.bin"
+BINFILE=3D"ti_cgt_tms470_${PVwithdots}_setup_linux:x86.bin"
 TI_BIN_UNPK_CMDS=3D"Y:qY:workdir: : "
 TI_BIN_UNPK_WDEXT=3D"/cgt470_${PV}"

diff --git a/recipes-ti/devtools/ti-cgt6x-7_7.4.16.bb b/recipes-ti/devtools=
/ti-cgt6x-7_7.4.16.bb
index a67a2d8a..a7de8e38 100644
--- a/recipes-ti/devtools/ti-cgt6x-7_7.4.16.bb
+++ b/recipes-ti/devtools/ti-cgt6x-7_7.4.16.bb
@@ -28,16 +28,16 @@ SRC_URI[cgt6x_7.4.16_x86_installer.sha256sum] =3D "baa0=
d1ef20397383f99f45068a6d160

 # only x86_64 is supported
 COMPATIBLE_HOST =3D "x86_64.*-linux"
-COMPATIBLE_HOST_class-target =3D "null"
+COMPATIBLE_HOST:class-target =3D "null"

 do_install() {
     install -d ${D}/${TI_CGT6X_7_INSTALL_DIR_RECIPE}
     cp -rP --preserve=3Dmode,links,timestamps --no-preserve=3Downership ${=
WORKDIR}/c6000_7.4.16/. ${D}/${TI_CGT6X_7_INSTALL_DIR_RECIPE}
 }

-FILES_${PN} +=3D "${TI_CGT6X_7_INSTALL_DIR_RECIPE}"
+FILES:${PN} +=3D "${TI_CGT6X_7_INSTALL_DIR_RECIPE}"

-INSANE_SKIP_${PN} +=3D "arch staticdev textrel"
+INSANE_SKIP:${PN} +=3D "arch staticdev textrel"

 INHIBIT_PACKAGE_STRIP =3D "1"
 INHIBIT_SYSROOT_STRIP =3D "1"
diff --git a/recipes-ti/devtools/ti-cgt6x_8.3.2.bb b/recipes-ti/devtools/ti=
-cgt6x_8.3.2.bb
index 38f5597d..00221d84 100644
--- a/recipes-ti/devtools/ti-cgt6x_8.3.2.bb
+++ b/recipes-ti/devtools/ti-cgt6x_8.3.2.bb
@@ -3,13 +3,13 @@ HOMEPAGE =3D "https://www-a.ti.com/downloads/sds_support/=
TICodegenerationTools/dow
 LICENSE =3D "(TI-TSPA & Thai-Open-Source-Software-Center) & BSD-3-Clause &=
 BSL-1.0 & Patrick-Powell & AFL-3.0 & MIT & BSD-2-Clause & PD"

 LIC_FILES_CHKSUM =3D "file://ti-cgt-c6000_${PV}/C6000CodeGenerationTools_8=
.3.x_manifest.html;md5=3Dd06c6f9acebf78df4108a8535396e9f1"
-LIC_FILES_CHKSUM_class-target =3D "file://usr/share/doc/ti/cgt-c6x/C6000Co=
deGenerationTools_8.3.x_manifest.html;md5=3Dd06c6f9acebf78df4108a8535396e9f=
1"
+LIC_FILES_CHKSUM:class-target =3D "file://usr/share/doc/ti/cgt-c6x/C6000Co=
deGenerationTools_8.3.x_manifest.html;md5=3Dd06c6f9acebf78df4108a8535396e9f=
1"

 PE =3D "1"

 require recipes-ti/includes/ti-unpack.inc

-COMPATIBLE_HOST_class-target =3D "arm.*-linux"
+COMPATIBLE_HOST:class-target =3D "arm.*-linux"

 # For now we only have hardfp version for target class
 python __anonymous() {
@@ -26,13 +26,13 @@ python __anonymous() {
             raise bb.parse.SkipPackage("%s-%s ONLY supports hardfp mode fo=
r now" % (pkgn, pkgv))
 }

-BINFILE =3D "ti_cgt_c6000_${PV}_linux_installer_x86.bin"
-BINFILE_NAME =3D "cgt6x_x86_installer"
+BINFILE =3D "ti_cgt_c6000_${PV}_linux_installer:x86.bin"
+BINFILE_NAME =3D "cgt6x:x86_installer"
 TI_BIN_UNPK_ARGS =3D "--prefix ${S}"
 TI_BIN_UNPK_CMDS =3D ""

-BINFILE_class-target =3D "ti_cgt_c6000_${PV}_armlinuxa8hf_busybox_installe=
r.sh"
-BINFILE_NAME_class-target =3D "cgt6x_arm_installer"
+BINFILE:class-target =3D "ti_cgt_c6000_${PV}:armlinuxa8hf_busybox_installe=
r.sh"
+BINFILE_NAME:class-target =3D "cgt6x:arm_installer"

 SRC_URI =3D "http://software-dl.ti.com/codegen/esd/cgt_public_sw/C6000/${P=
V}/${BINFILE};name=3D${BINFILE_NAME}"

@@ -91,17 +91,17 @@ do_install() {

 }

-do_install_class-target() {
+do_install:class-target() {
     ${WORKDIR}/${BINFILE} --prefix ${D}
 }

-FILES_${PN} +=3D "${datadir}/ti/*"
+FILES:${PN} +=3D "${datadir}/ti/*"

-FILES_${PN}-dbg +=3D "${datadir}/ti/cgt-c6x/bin/.debug"
+FILES:${PN}-dbg +=3D "${datadir}/ti/cgt-c6x/bin/.debug"

-INSANE_SKIP_${PN} +=3D "staticdev"
+INSANE_SKIP:${PN} +=3D "staticdev"
 INHIBIT_PACKAGE_STRIP_FILES =3D "${PKGD}${datadir}/ti/cgt-c6x/lib/libc.a"

 BBCLASSEXTEND =3D "native nativesdk"

-COMPATIBLE_MACHINE_class-target =3D "(ti-soc)"
+COMPATIBLE_MACHINE:class-target =3D "(ti-soc)"
diff --git a/recipes-ti/devtools/ti-cgt7x_1.2.0.bb b/recipes-ti/devtools/ti=
-cgt7x_1.2.0.bb
index cbdac1ef..35b58d4c 100644
--- a/recipes-ti/devtools/ti-cgt7x_1.2.0.bb
+++ b/recipes-ti/devtools/ti-cgt7x_1.2.0.bb
@@ -15,12 +15,12 @@ require recipes-ti/includes/ti-paths.inc

 # only x86_64 is supported
 COMPATIBLE_HOST =3D "x86_64.*-linux"
-COMPATIBLE_HOST_class-target =3D "null"
+COMPATIBLE_HOST:class-target =3D "null"

 PE =3D "1"

 BINFILE =3D "ti_cgt_c7000_${PV}.STS_linux_installer_x86.bin"
-BINFILE_NAME =3D "cgt7x_x86_installer"
+BINFILE_NAME =3D "cgt7x:x86_installer"

 SRC_URI =3D "http://software-dl.ti.com/codegen/esd/cgt_public_sw/C7000/${P=
V}.STS/${BINFILE};name=3D${BINFILE_NAME}"

@@ -38,9 +38,9 @@ do_install() {
 }


-FILES_${PN} +=3D "${TI_CGT7X_INSTALL_DIR_RECIPE}"
+FILES:${PN} +=3D "${TI_CGT7X_INSTALL_DIR_RECIPE}"

-INSANE_SKIP_${PN} +=3D "arch staticdev textrel"
+INSANE_SKIP:${PN} +=3D "arch staticdev textrel"

 INHIBIT_PACKAGE_STRIP =3D "1"
 INHIBIT_SYSROOT_STRIP =3D "1"
diff --git a/recipes-ti/devtools/ti-xdctools-common.inc b/recipes-ti/devtoo=
ls/ti-xdctools-common.inc
index c21e4794..e88331bd 100644
--- a/recipes-ti/devtools/ti-xdctools-common.inc
+++ b/recipes-ti/devtools/ti-xdctools-common.inc
@@ -13,14 +13,14 @@ do_install() {
     cp ${CP_ARGS}  ${S}/* ${D}${XDC_INSTALL_DIR_RECIPE}
 }

-FILES_${PN}-dev =3D "${XDC_INSTALL_DIR_RECIPE}"
+FILES:${PN}-dev =3D "${XDC_INSTALL_DIR_RECIPE}"

 BBCLASSEXTEND =3D "native nativesdk"

 INHIBIT_PACKAGE_STRIP =3D "1"
 INHIBIT_SYSROOT_STRIP =3D "1"
 INHIBIT_PACKAGE_DEBUG_SPLIT =3D "1"
-INSANE_SKIP_${PN}-dev =3D "libdir dev-elf arch file-rdeps"
+INSANE_SKIP:${PN}-dev =3D "libdir dev-elf arch file-rdeps"

 # Prevent internal libs from getting picked up
 PRIVATE_LIBS =3D " \
@@ -66,5 +66,5 @@ libawt_xawt.so \

 COMPATIBLE_HOST ?=3D "null"
 COMPATIBLE_HOST_ti-soc =3D "(.*)"
-COMPATIBLE_HOST_class-native =3D "(.*)"
-COMPATIBLE_HOST_class-nativesdk =3D "(.*)"
+COMPATIBLE_HOST:class-native =3D "(.*)"
+COMPATIBLE_HOST:class-nativesdk =3D "(.*)"
diff --git a/recipes-ti/dmai/ti-dmai.inc b/recipes-ti/dmai/ti-dmai.inc
index 50621184..0a690496 100644
--- a/recipes-ti/dmai/ti-dmai.inc
+++ b/recipes-ti/dmai/ti-dmai.inc
@@ -31,13 +31,13 @@ SRC_URI =3D "svn://gforge.ti.com/svn/dmai/;module=3D${D=
MAIBRANCH};protocol=3Dhttps;use

 DEPENDS =3D "virtual/kernel alsa-lib ti-framework-components ti-codec-engi=
ne ti-xdctools-native"

-DEPENDS_append_dm6446   =3D " ti-codecs-dm6446   ti-dspbios ti-cgt6x ti-li=
nuxutils"
-DEPENDS_append_dm6467   =3D " ti-codecs-dm6467   ti-dspbios ti-cgt6x ti-li=
nuxutils"
-DEPENDS_append_omap3    =3D " ti-codecs-omap3530 ti-dspbios ti-cgt6x ti-li=
nuxutils"
-DEPENDS_append_dm355    =3D " ti-codecs-dm355"
-DEPENDS_append_dm365    =3D " ti-codecs-dm365"
-DEPENDS_append_omapl137 =3D " ti-codecs-omapl137 ti-dspbios ti-cgt6x ti-li=
nuxutils"
-DEPENDS_append_omapl138 =3D " ti-codecs-omapl138 ti-dspbios ti-cgt6x ti-li=
nuxutils"
+DEPENDS:append_dm6446   =3D " ti-codecs-dm6446   ti-dspbios ti-cgt6x ti-li=
nuxutils"
+DEPENDS:append_dm6467   =3D " ti-codecs-dm6467   ti-dspbios ti-cgt6x ti-li=
nuxutils"
+DEPENDS:append_omap3    =3D " ti-codecs-omap3530 ti-dspbios ti-cgt6x ti-li=
nuxutils"
+DEPENDS:append_dm355    =3D " ti-codecs-dm355"
+DEPENDS:append_dm365    =3D " ti-codecs-dm365"
+DEPENDS:append_omapl137 =3D " ti-codecs-omapl137 ti-dspbios ti-cgt6x ti-li=
nuxutils"
+DEPENDS:append_omapl138 =3D " ti-codecs-omapl138 ti-dspbios ti-cgt6x ti-li=
nuxutils"

 # Define DMAI build time variables
 DMAIPLATFORM_dm6446    =3D "dm6446_al"
@@ -145,18 +145,18 @@ do_install () {
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"

 PACKAGES +=3D "ti-dmai-apps"
-FILES_ti-dmai-apps =3D "${installdir}/ti-dmai-apps/*"
-INSANE_SKIP_ti-dmai-apps =3D "1"
-
-RDEPENDS_ti-dmai-apps_dm6446    +=3D "ti-codecs-dm6446-server   ti-cmem-mo=
dule ti-dsplink-module"
-RDEPENDS_ti-dmai-apps_dm6467    +=3D "ti-codecs-dm6467          ti-cmem-mo=
dule ti-dsplink-module"
-RDEPENDS_ti-dmai-apps_omap3     +=3D "ti-codecs-omap3530-server ti-cmem-mo=
dule ti-dsplink-module ti-lpm-module ti-sdma-module"
-RDEPENDS_ti-dmai-apps_dm355     +=3D "ti-codecs-dm355           ti-cmem-mo=
dule ti-dm355mm-module"
-RDEPENDS_ti-dmai-apps_dm365     +=3D "ti-codecs-dm365           ti-cmem-mo=
dule ti-dm365mm-module ti-edma-module ti-irq-module"
-RDEPENDS_ti-dmai-apps_omapl137  +=3D "ti-codecs-omapl137-server ti-cmem-mo=
dule ti-dsplink-module"
-RDEPENDS_ti-dmai-apps_omapl138  +=3D "ti-codecs-omapl138-server ti-cmem-mo=
dule ti-dsplink-module"
-
-pkg_postinst_ti-dmai-apps () {
+FILES:ti-dmai-apps =3D "${installdir}/ti-dmai-apps/*"
+INSANE_SKIP:ti-dmai-apps =3D "1"
+
+RDEPENDS:ti-dmai-apps_dm6446    +=3D "ti-codecs-dm6446-server   ti-cmem-mo=
dule ti-dsplink-module"
+RDEPENDS:ti-dmai-apps_dm6467    +=3D "ti-codecs-dm6467          ti-cmem-mo=
dule ti-dsplink-module"
+RDEPENDS:ti-dmai-apps_omap3     +=3D "ti-codecs-omap3530-server ti-cmem-mo=
dule ti-dsplink-module ti-lpm-module ti-sdma-module"
+RDEPENDS:ti-dmai-apps_dm355     +=3D "ti-codecs-dm355           ti-cmem-mo=
dule ti-dm355mm-module"
+RDEPENDS:ti-dmai-apps_dm365     +=3D "ti-codecs-dm365           ti-cmem-mo=
dule ti-dm365mm-module ti-edma-module ti-irq-module"
+RDEPENDS:ti-dmai-apps_omapl137  +=3D "ti-codecs-omapl137-server ti-cmem-mo=
dule ti-dsplink-module"
+RDEPENDS:ti-dmai-apps_omapl138  +=3D "ti-codecs-omapl138-server ti-cmem-mo=
dule ti-dsplink-module"
+
+pkg_postinst:ti-dmai-apps () {
         ln -sf ${installdir}/ti-codecs-server/*.${DSPSUFFIX} ${installdir}=
/ti-dmai-apps/
 }

diff --git a/recipes-ti/dmai/ti-dmai_svn.bb b/recipes-ti/dmai/ti-dmai_svn.b=
b
index 3cc54b91..a9bd9f82 100644
--- a/recipes-ti/dmai/ti-dmai_svn.bb
+++ b/recipes-ti/dmai/ti-dmai_svn.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM =3D "file://dmai_${PV}_License.html;md5=
=3D3302f728a5a42f97cabc26a54

 # This package has high dependence on kernel, use kernel PR as base and ap=
pend a local version
 PR =3D "${MACHINE_KERNEL_PR}"
-PR_append =3D "p"
+PR:append =3D "p"

 DMAIBRANCH_dm6446     =3D "trunk"
 DMAIBRANCH_dm6467     =3D "branches/GITPSP_INT_101009"
@@ -32,12 +32,12 @@ SRCREV_omapl137       =3D "482"
 SRCREV_omapl138       =3D "570"
 SRCREV               ?=3D "UNDEFINED_SRCREV"

-SRC_URI_append =3D " file://omap3530-r642-remove-include-videodev.diff;str=
iplevel=3D3 \
+SRC_URI:append =3D " file://omap3530-r642-remove-include-videodev.diff;str=
iplevel=3D3 \
                    file://r642-fix-config-bld.diff;striplevel=3D3 \
                    file://remove-unneeded-includes.patch \
                  "

-INSANE_SKIP_${PN} =3D "installed-vs-shipped"
+INSANE_SKIP:${PN} =3D "installed-vs-shipped"

 COMPATIBLE_HOST ?=3D "null"
 COMPATIBLE_HOST_ti-soc =3D "(.*)"
diff --git a/recipes-ti/dsplib/dsplib.inc b/recipes-ti/dsplib/dsplib.inc
index 111d83cb..a248905d 100644
--- a/recipes-ti/dsplib/dsplib.inc
+++ b/recipes-ti/dsplib/dsplib.inc
@@ -35,7 +35,7 @@ export SWTOOLS_PATH =3D "${SWTOOLS_INSTALL_DIR}/ti/mas/sw=
tools"
 export XDCBUILDCFG=3D"${SWTOOLS_PATH}/config.bld"
 export INCDIR=3D"${MATHLIB_INSTALL_DIR}/"

-PATH_append =3D ":${XDC_INSTALL_DIR}"
+PATH:append =3D ":${XDC_INSTALL_DIR}"

 XDCPATH.=3D"${XDCCGROOT}/include;${XDC_INSTALL_DIR}/packages;${SYSBIOS_INS=
TALL_DIR}/packages;"
 XDCPATH.=3D"${SWTOOLS_INSTALL_DIR};${MATHLIB_INSTALL_DIR};${DSPLIB_WORK_DI=
R};"
@@ -70,9 +70,9 @@ do_deploy() {
         rm -r ./${DSPLIB_PACKAGE_NAME}
 }

-ALLOW_EMPTY_${PN} =3D "1"
-FILES_${PN}-dev +=3D "${DSPLIB_INSTALL_DIR_RECIPE}"
+ALLOW_EMPTY:${PN} =3D "1"
+FILES:${PN}-dev +=3D "${DSPLIB_INSTALL_DIR_RECIPE}"

-INSANE_SKIP_${PN}-dev =3D "arch"
+INSANE_SKIP:${PN}-dev =3D "arch"
 COMPATIBLE_HOST ?=3D "null"
 COMPATIBLE_HOST_ti-soc =3D "(.*)"
diff --git a/recipes-ti/framework-components/ti-framework-components.inc b/=
recipes-ti/framework-components/ti-framework-components.inc
index ca152328..e8b7c414 100644
--- a/recipes-ti/framework-components/ti-framework-components.inc
+++ b/recipes-ti/framework-components/ti-framework-components.inc
@@ -15,7 +15,7 @@ do_install() {
     cp ${CP_ARGS} ${S}/* ${D}${FC_INSTALL_DIR_RECIPE}
 }

-INSANE_SKIP_${PN} =3D "ldflags"
+INSANE_SKIP:${PN} =3D "ldflags"

-ALLOW_EMPTY_${PN} =3D "1"
-FILES_${PN}-dev +=3D "${FC_INSTALL_DIR_RECIPE}"
+ALLOW_EMPTY:${PN} =3D "1"
+FILES:${PN}-dev +=3D "${FC_INSTALL_DIR_RECIPE}"
diff --git a/recipes-ti/imglib/imglib-c66x.inc b/recipes-ti/imglib/imglib-c=
66x.inc
index 164bf41d..82fea284 100644
--- a/recipes-ti/imglib/imglib-c66x.inc
+++ b/recipes-ti/imglib/imglib-c66x.inc
@@ -23,12 +23,12 @@ do_install() {
     cp ${CP_ARGS} ${S}/* ${D}${IMGLIB_C66_INSTALL_DIR_RECIPE}
 }

-ALLOW_EMPTY_${PN} =3D "1"
-FILES_${PN}-dev +=3D "${IMGLIB_C66_INSTALL_DIR_RECIPE}"
+ALLOW_EMPTY:${PN} =3D "1"
+FILES:${PN}-dev +=3D "${IMGLIB_C66_INSTALL_DIR_RECIPE}"

 INHIBIT_PACKAGE_STRIP =3D "1"
 INHIBIT_SYSROOT_STRIP =3D "1"
 INHIBIT_PACKAGE_DEBUG_SPLIT =3D "1"

-RDEPENDS_${PN}-dev +=3D "perl"
-INSANE_SKIP_${PN}-dev =3D "arch"
+RDEPENDS:${PN}-dev +=3D "perl"
+INSANE_SKIP:${PN}-dev =3D "arch"
diff --git a/recipes-ti/includes/ti-staging.inc b/recipes-ti/includes/ti-st=
aging.inc
index b5888055..f18d017c 100644
--- a/recipes-ti/includes/ti-staging.inc
+++ b/recipes-ti/includes/ti-staging.inc
@@ -1,6 +1,6 @@
 INHIBIT_PACKAGE_STRIP =3D "1"

-ALLOW_EMPTY_${PN} =3D "1"
-ALLOW_EMPTY_${PN}-dev =3D "1"
+ALLOW_EMPTY:${PN} =3D "1"
+ALLOW_EMPTY:${PN}-dev =3D "1"


diff --git a/recipes-ti/includes/ti-unpack.inc b/recipes-ti/includes/ti-unp=
ack.inc
index 828f3d5a..63b8cd75 100644
--- a/recipes-ti/includes/ti-unpack.inc
+++ b/recipes-ti/includes/ti-unpack.inc
@@ -79,5 +79,5 @@ python ti_bin_do_unpack() {

 COMPATIBLE_HOST ?=3D "null"
 COMPATIBLE_HOST_ti-soc =3D "(.*)"
-COMPATIBLE_HOST_class-native =3D "(.*)"
-COMPATIBLE_HOST_class-nativesdk =3D "(.*)"
+COMPATIBLE_HOST:class-native =3D "(.*)"
+COMPATIBLE_HOST:class-nativesdk =3D "(.*)"
diff --git a/recipes-ti/ipc/ipc-transport-common-rtos_git.bb b/recipes-ti/i=
pc/ipc-transport-common-rtos_git.bb
index 6fec0f0d..ade78022 100644
--- a/recipes-ti/ipc/ipc-transport-common-rtos_git.bb
+++ b/recipes-ti/ipc/ipc-transport-common-rtos_git.bb
@@ -20,4 +20,4 @@ do_install () {
     cp -r ${S} ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/transport/ipc/c66
 }

-FILES_${PN} +=3D "${PDK_INSTALL_DIR_RECIPE}/packages/ti/transport/ipc/c66/=
example/*"
+FILES:${PN} +=3D "${PDK_INSTALL_DIR_RECIPE}/packages/ti/transport/ipc/c66/=
example/*"
diff --git a/recipes-ti/ipc/ipc-transport-qmss-rtos_git.bb b/recipes-ti/ipc=
/ipc-transport-qmss-rtos_git.bb
index 6655ab7e..2dffc11e 100644
--- a/recipes-ti/ipc/ipc-transport-qmss-rtos_git.bb
+++ b/recipes-ti/ipc/ipc-transport-qmss-rtos_git.bb
@@ -9,7 +9,7 @@ COMPATIBLE_MACHINE =3D "k2hk|k2l|k2e"

 PACKAGE_ARCH =3D "${MACHINE_ARCH}"

-DEPENDS_append =3D " qmss-lld-rtos \
+DEPENDS:append =3D " qmss-lld-rtos \
                    cppi-lld-rtos \
                    ti-ipc-rtos \
                    ipc-transport-common-rtos \
@@ -20,4 +20,4 @@ IPC_TRANSPORT_QMSS_DESTSUFFIX =3D "git/c66/qmss"
 S =3D "${WORKDIR}/${IPC_TRANSPORT_QMSS_DESTSUFFIX}"

 export IPC_INSTALL_PATH =3D "${IPC_INSTALL_DIR}"
-XDCPATH_append =3D ";${IPC_INSTALL_DIR}/packages"
+XDCPATH:append =3D ";${IPC_INSTALL_DIR}/packages"
diff --git a/recipes-ti/ipc/ipc-transport-qmss.inc b/recipes-ti/ipc/ipc-tra=
nsport-qmss.inc
index f029656e..04705269 100644
--- a/recipes-ti/ipc/ipc-transport-qmss.inc
+++ b/recipes-ti/ipc/ipc-transport-qmss.inc
@@ -3,7 +3,7 @@ LICENSE =3D "BSD-3-Clause"

 require ipc-transport.inc

-INC_PR_append =3D ".1"
+INC_PR:append =3D ".1"

 LIC_FILES_CHKSUM =3D "file://COPYING.txt;md5=3D27bb0deb260c60120a8d7b91da7=
c3b02"

diff --git a/recipes-ti/ipc/ipc-transport-srio-rtos_git.bb b/recipes-ti/ipc=
/ipc-transport-srio-rtos_git.bb
index 3f96598f..52720916 100644
--- a/recipes-ti/ipc/ipc-transport-srio-rtos_git.bb
+++ b/recipes-ti/ipc/ipc-transport-srio-rtos_git.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D "file://TransportSrio.xdc;beginline=3D=
1;endline=3D35;md5=3D4d466471

 COMPATIBLE_MACHINE =3D "k2hk"

-DEPENDS_append =3D " qmss-lld-rtos \
+DEPENDS:append =3D " qmss-lld-rtos \
                    cppi-lld-rtos \
                    srio-lld-rtos \
                    ti-ipc-rtos \
@@ -19,4 +19,4 @@ IPC_TRANSPORT_SRIO_DESTSUFFIX =3D "git/c66/srio"
 S =3D "${WORKDIR}/${IPC_TRANSPORT_SRIO_DESTSUFFIX}"

 export IPC_INSTALL_PATH =3D "${IPC_INSTALL_DIR}"
-XDCPATH_append =3D ";${IPC_INSTALL_DIR}/packages"
+XDCPATH:append =3D ";${IPC_INSTALL_DIR}/packages"
diff --git a/recipes-ti/ipc/ipc-transport-srio.inc b/recipes-ti/ipc/ipc-tra=
nsport-srio.inc
index 6c477388..89425703 100644
--- a/recipes-ti/ipc/ipc-transport-srio.inc
+++ b/recipes-ti/ipc/ipc-transport-srio.inc
@@ -3,7 +3,7 @@ LICENSE =3D "BSD-3-Clause"

 require ipc-transport.inc

-INC_PR_append =3D ".1"
+INC_PR:append =3D ".1"

 LIC_FILES_CHKSUM =3D "file://COPYING.txt;md5=3D27bb0deb260c60120a8d7b91da7=
c3b02"

diff --git a/recipes-ti/ipc/ti-ipc-examples-linux_git.bb b/recipes-ti/ipc/t=
i-ipc-examples-linux_git.bb
index ab479556..81706592 100644
--- a/recipes-ti/ipc/ti-ipc-examples-linux_git.bb
+++ b/recipes-ti/ipc/ti-ipc-examples-linux_git.bb
@@ -5,7 +5,7 @@ SRC_URI +=3D "file://0001-examples-ClusterMgr-sys_errlist-h=
as-been-deprecated-.pat

 DEPENDS =3D "ti-ipc ti-xdctools-native ti-sysbios ti-ipc-rtos zip-native"

-do_compile_append() {
+do_compile:append() {

   if [  "${PLATFORM}" !=3D "UNKNOWN" ]; then
     oe_runmake extract HOSTOS=3D"linux" IPC_INSTALL_DIR=3D"${IPC_INSTALL_D=
IR}"
@@ -27,7 +27,7 @@ do_compile_append() {
   fi
 }

-do_install_append() {
+do_install:append() {
   cd ${S_ipc-examples}/src

   if [  "${PLATFORM}" !=3D "UNKNOWN" ]; then
@@ -46,4 +46,4 @@ do_install_append() {
   fi
 }

-FILES_${PN} +=3D "${bindir}/*"
+FILES:${PN} +=3D "${bindir}/*"
diff --git a/recipes-ti/ipc/ti-ipc-examples.inc b/recipes-ti/ipc/ti-ipc-exa=
mples.inc
index 022b13f0..66cd5d32 100644
--- a/recipes-ti/ipc/ti-ipc-examples.inc
+++ b/recipes-ti/ipc/ti-ipc-examples.inc
@@ -5,9 +5,9 @@ require ti-ipc-rtos.inc
 LICENSE =3D "BSD"
 LIC_FILES_CHKSUM =3D "file://${S_ipc-examples}/src/makefile;beginline=3D1;=
endline=3D30;md5=3Da52324bd5033bb49ea07bade1244ac9a"

-INSANE_SKIP_${PN} +=3D "arch"
+INSANE_SKIP:${PN} +=3D "arch"

-ALLOW_EMPTY_${PN} =3D "1"
+ALLOW_EMPTY:${PN} =3D "1"

 IPC_INSTALL_DIR =3D "${STAGING_DIR_TARGET}/usr/share/ti/ti-ipc-tree"

diff --git a/recipes-ti/ipc/ti-ipc-examples_git.bb b/recipes-ti/ipc/ti-ipc-=
examples_git.bb
index c46e5c81..bcc8674e 100644
--- a/recipes-ti/ipc/ti-ipc-examples_git.bb
+++ b/recipes-ti/ipc/ti-ipc-examples_git.bb
@@ -3,7 +3,7 @@ require ti-ipc-examples.inc

 DEPENDS =3D "ti-ipc ti-xdctools-native ti-sysbios ti-ipc-rtos zip-native"

-do_compile_append() {
+do_compile:append() {

   if [  "${PLATFORM}" !=3D "UNKNOWN" ]; then
     oe_runmake extract HOSTOS=3D"bios" IPC_INSTALL_DIR=3D"${IPC_INSTALL_DI=
R}"
@@ -21,7 +21,7 @@ do_compile_append() {
   fi
 }

-do_install_append() {
+do_install:append() {
   if [  "${PLATFORM}" !=3D "UNKNOWN" ]; then
     # Install directory for bios examples
     install -d ${D}/ipc_${IPC_VERSION}/examples/bios
@@ -41,4 +41,4 @@ do_install_append() {
   fi
 }

-FILES_${PN} +=3D "ipc_*"
+FILES:${PN} +=3D "ipc_*"
diff --git a/recipes-ti/ipc/ti-ipc-rtos.inc b/recipes-ti/ipc/ti-ipc-rtos.in=
c
index b6b7892f..e64f9dcf 100644
--- a/recipes-ti/ipc/ti-ipc-rtos.inc
+++ b/recipes-ti/ipc/ti-ipc-rtos.inc
@@ -41,16 +41,16 @@ RELEASE_SUFFIX =3D ""

 PR =3D "${INC_PR}.r0"

-DEPENDS_append_keystone =3D " ti-cgt6x-native \
+DEPENDS:append_keystone =3D " ti-cgt6x-native \
                             gcc-arm-baremetal-native \
 "
-DEPENDS_append_omap-a15 =3D " ti-cgt6x-native \
+DEPENDS:append_omap-a15 =3D " ti-cgt6x-native \
                             ti-cgt-arm-native \
                             gcc-arm-baremetal-native \
 "
-DEPENDS_append_omapl138 =3D " ti-cgt6x-native \
+DEPENDS:append_omapl138 =3D " ti-cgt6x-native \
 "
-DEPENDS_append_c66x =3D " ti-cgt6x-native \
+DEPENDS:append_c66x =3D " ti-cgt6x-native \
 "

 IPC_TARGETS =3D ""
diff --git a/recipes-ti/ipc/ti-ipc-rtos_git.bb b/recipes-ti/ipc/ti-ipc-rtos=
_git.bb
index b292d677..080d8c24 100644
--- a/recipes-ti/ipc/ti-ipc-rtos_git.bb
+++ b/recipes-ti/ipc/ti-ipc-rtos_git.bb
@@ -5,13 +5,13 @@ require ti-ipc-rtos.inc
 DEPENDS =3D "ti-xdctools-native ti-sysbios doxygen-native zip-native"

 PACKAGES =3D+ "${PN}-fw"
-FILES_${PN}-fw =3D "${base_libdir}/firmware/*"
-FILES_${PN}-dev +=3D "${IPC_INSTALL_DIR_RECIPE}"
+FILES:${PN}-fw =3D "${base_libdir}/firmware/*"
+FILES:${PN}-dev +=3D "${IPC_INSTALL_DIR_RECIPE}"

-INSANE_SKIP_${PN}-fw +=3D "arch"
-INSANE_SKIP_${PN}-dev +=3D "arch"
+INSANE_SKIP:${PN}-fw +=3D "arch"
+INSANE_SKIP:${PN}-dev +=3D "arch"

-ALLOW_EMPTY_${PN} =3D "1"
+ALLOW_EMPTY:${PN} =3D "1"

 IPC_PACKAGE_DIR =3D "${S}/ipc-package"

@@ -85,7 +85,7 @@ KFPLAT_k2g =3D "TCI66AK2G02"

 ALTERNATIVE_PRIORITY =3D "5"

-pkg_postinst_${PN}-fw_keystone () {
+pkg_postinst:${PN}-fw_keystone () {
   i=3D0
   while [ $i -lt ${KFDSPNUM} ]; do
     update-alternatives --install /lib/firmware/keystone-dsp$i-fw keystone=
-dsp$i-fw ipc/ti_platforms_evm${KFPLAT}_core0/messageq_single.xe66 ${ALTERN=
ATIVE_PRIORITY}
@@ -93,7 +93,7 @@ pkg_postinst_${PN}-fw_keystone () {
   done
 }

-pkg_postrm_${PN}-fw_keystone () {
+pkg_postrm:${PN}-fw_keystone () {
   i=3D0
   while [ $i -lt ${KFDSPNUM} ]; do
     update-alternatives --remove keystone-dsp$i-fw ipc/ti_platforms_evm${K=
FPLAT}_core0/messageq_single.xe66
@@ -101,24 +101,24 @@ pkg_postrm_${PN}-fw_keystone () {
   done
 }

-pkg_postinst_${PN}-fw_omap-a15 () {
+pkg_postinst:${PN}-fw_omap-a15 () {
   update-alternatives --install /lib/firmware/dra7-dsp1-fw.xe66 dra7-dsp1-=
fw.xe66 ipc/ti_platforms_evmDRA7XX_dsp1/test_omx_dsp1_vayu.xe66 ${ALTERNATI=
VE_PRIORITY}
   update-alternatives --install /lib/firmware/dra7-dsp2-fw.xe66 dra7-dsp2-=
fw.xe66 ipc/ti_platforms_evmDRA7XX_dsp2/test_omx_dsp2_vayu.xe66 ${ALTERNATI=
VE_PRIORITY}
   update-alternatives --install /lib/firmware/dra7-ipu1-fw.xem4 dra7-ipu1-=
fw.xem4 ipc/ti_platforms_evmDRA7XX_ipu1/test_omx_ipu1_vayu.xem4 ${ALTERNATI=
VE_PRIORITY}
   update-alternatives --install /lib/firmware/dra7-ipu2-fw.xem4 dra7-ipu2-=
fw.xem4 ipc/ti_platforms_evmDRA7XX_ipu2/test_omx_ipu2_vayu.xem4 ${ALTERNATI=
VE_PRIORITY}
 }

-pkg_postrm_${PN}-fw_omap-a15 () {
+pkg_postrm:${PN}-fw_omap-a15 () {
   update-alternatives --remove dra7-dsp1-fw.xe66 ipc/ti_platforms_evmDRA7X=
X_dsp1/test_omx_dsp1_vayu.xe66
   update-alternatives --remove dra7-dsp2-fw.xe66 ipc/ti_platforms_evmDRA7X=
X_dsp2/test_omx_dsp2_vayu.xe66
   update-alternatives --remove dra7-ipu1-fw.xem4 ipc/ti_platforms_evmDRA7X=
X_ipu1/test_omx_ipu1_vayu.xem4
   update-alternatives --remove dra7-ipu2-fw.xem4 ipc/ti_platforms_evmDRA7X=
X_ipu2/test_omx_ipu2_vayu.xem4
 }

-pkg_postinst_${PN}-fw_omapl138 () {
+pkg_postinst:${PN}-fw_omapl138 () {
   update-alternatives --install /lib/firmware/rproc-dsp-fw rproc-dsp-fw ip=
c/ti_platforms_evmOMAPL138_DSP/messageq_single.xe674 ${ALTERNATIVE_PRIORITY=
}
 }

-pkg_postrm_${PN}-fw_omapl138 () {
+pkg_postrm:${PN}-fw_omapl138 () {
   update-alternatives --remove rproc-dsp-fw ipc/ti_platforms_evmOMAPL138_D=
SP/messageq_single.xe674
 }
diff --git a/recipes-ti/ipc/ti-ipc_git.bb b/recipes-ti/ipc/ti-ipc_git.bb
index 425ca4e1..8f543c91 100644
--- a/recipes-ti/ipc/ti-ipc_git.bb
+++ b/recipes-ti/ipc/ti-ipc_git.bb
@@ -28,7 +28,7 @@ inherit autotools-brokensep pkgconfig update-rc.d systemd
 INITSCRIPT_NAME =3D "tiipclad-daemon.sh"
 INITSCRIPT_PARAMS =3D "defaults 10"

-SYSTEMD_SERVICE_${PN} =3D "tiipclad-daemon.service"
+SYSTEMD_SERVICE:${PN} =3D "tiipclad-daemon.service"

 EXTRA_OECONF +=3D "PLATFORM=3D${PLATFORM} KERNEL_INSTALL_DIR=3D${STAGING_K=
ERNEL_DIR} KERNEL_BUILD_DIR=3D${STAGING_KERNEL_BUILDDIR}"

@@ -39,7 +39,7 @@ do_configure() {
     oe_runconf
 }

-do_install_append() {
+do_install:append() {
     install -d ${D}${sysconfdir}/init.d/

     # Modify the startup scripts to point to the right
@@ -53,15 +53,15 @@ do_install_append() {
     install -c -m 755 ${WORKDIR}/tiipclad-daemon.sh ${D}${sysconfdir}/init=
.d/${INITSCRIPT_NAME}
 }

-do_install_append_dra7xx() {
+do_install:append_dra7xx() {
     install -d ${D}${sysconfdir}/modprobe.d/
     install -c -m 644 ${WORKDIR}/omap_remoteproc.conf ${D}${sysconfdir}/mo=
dprobe.d/
 }

 PACKAGES =3D+ "${PN}-test"
-RDEPENDS_${PN}-test +=3D "${PN}"
+RDEPENDS:${PN}-test +=3D "${PN}"

-FILES_${PN}-test =3D " \
+FILES:${PN}-test =3D " \
     ${bindir}/NameServerApp \
     ${bindir}/MessageQApp \
     ${bindir}/MessageQMulti \
diff --git a/recipes-ti/linuxutils/ti-linuxutils.inc b/recipes-ti/linuxutil=
s/ti-linuxutils.inc
index c8f93209..c461418f 100644
--- a/recipes-ti/linuxutils/ti-linuxutils.inc
+++ b/recipes-ti/linuxutils/ti-linuxutils.inc
@@ -15,7 +15,7 @@ require recipes-ti/includes/ti-staging.inc
 PR =3D "${MACHINE_KERNEL_PR}"

 #This is a kernel module, don't set PR directly
-MACHINE_KERNEL_PR_append =3D "f"
+MACHINE_KERNEL_PR:append =3D "f"

 inherit module

@@ -82,12 +82,12 @@ PACKAGES =3D+ " ti-cmem-module \
               ti-irq-module \
               ti-linuxutils-app"

-FILES_ti-cmem-module =3D "/lib/modules/${KERNEL_VERSION}/kernel/drivers/ds=
p/cmem*.ko"
-FILES_ti-sdma-module =3D "/lib/modules/${KERNEL_VERSION}/kernel/drivers/ds=
p/sdma*.ko"
-FILES_ti-edma-module =3D "/lib/modules/${KERNEL_VERSION}/kernel/drivers/ds=
p/edma*.ko"
-FILES_ti-irq-module =3D "/lib/modules/${KERNEL_VERSION}/kernel/drivers/dsp=
/irq*.ko"
+FILES:ti-cmem-module =3D "/lib/modules/${KERNEL_VERSION}/kernel/drivers/ds=
p/cmem*.ko"
+FILES:ti-sdma-module =3D "/lib/modules/${KERNEL_VERSION}/kernel/drivers/ds=
p/sdma*.ko"
+FILES:ti-edma-module =3D "/lib/modules/${KERNEL_VERSION}/kernel/drivers/ds=
p/edma*.ko"
+FILES:ti-irq-module =3D "/lib/modules/${KERNEL_VERSION}/kernel/drivers/dsp=
/irq*.ko"

-FILES_ti-linuxutils-app =3D "${installdir}/ti-linuxutils-app/*/*"
+FILES:ti-linuxutils-app =3D "${installdir}/ti-linuxutils-app/*/*"

-INSANE_SKIP_ti-linuxutils-app =3D "True"
+INSANE_SKIP:ti-linuxutils-app =3D "True"
 INHIBIT_PACKAGE_STRIP =3D "1"
diff --git a/recipes-ti/linuxutils/ti-linuxutils_2.26.01.02.bb b/recipes-ti=
/linuxutils/ti-linuxutils_2.26.01.02.bb
index 113e6a69..2b7e1f9a 100644
--- a/recipes-ti/linuxutils/ti-linuxutils_2.26.01.02.bb
+++ b/recipes-ti/linuxutils/ti-linuxutils_2.26.01.02.bb
@@ -11,7 +11,7 @@ PV =3D "2_26_01_02"
 SRC_URI[md5sum] =3D "70b4918bc35c1bcfef34d6ba3fbce0c8"
 SRC_URI[sha256sum] =3D "51266dd928f8d629cd417c869789a6c0d596612120f1656191=
19cbaadfd66ee2"

-INSANE_SKIP_${PN} =3D "installed-vs-shipped"
+INSANE_SKIP:${PN} =3D "installed-vs-shipped"

 COMPATIBLE_HOST ?=3D "null"
 COMPATIBLE_HOST_ti-soc =3D "(.*)"
diff --git a/recipes-ti/mathlib/mathlib.inc b/recipes-ti/mathlib/mathlib.in=
c
index cfc5409f..e83584bf 100644
--- a/recipes-ti/mathlib/mathlib.inc
+++ b/recipes-ti/mathlib/mathlib.inc
@@ -34,7 +34,7 @@ export C66CODEGENTOOL =3D"${CGTOOLS_INSTALL_DIR}"
 export SWTOOLS_PATH =3D "${SWTOOLS_INSTALL_DIR}/ti/mas/swtools"
 export XDCBUILDCFG=3D"${SWTOOLS_PATH}/config.bld"

-PATH_append =3D ":${XDC_INSTALL_DIR}"
+PATH:append =3D ":${XDC_INSTALL_DIR}"

 XDCPATH.=3D"${XDCCGROOT}/include;${XDC_INSTALL_DIR}/packages;${SYSBIOS_INS=
TALL_DIR}/packages;"
 XDCPATH.=3D"${SWTOOLS_INSTALL_DIR};${MATHLIB_WORK_DIR};"
@@ -69,9 +69,9 @@ do_deploy() {
         rm -r ./${MATHLIB_PACKAGE_NAME}
 }

-ALLOW_EMPTY_${PN} =3D "1"
-FILES_${PN}-dev +=3D "${MATHLIB_INSTALL_DIR_RECIPE}"
+ALLOW_EMPTY:${PN} =3D "1"
+FILES:${PN}-dev +=3D "${MATHLIB_INSTALL_DIR_RECIPE}"

-INSANE_SKIP_${PN}-dev =3D "arch"
+INSANE_SKIP:${PN}-dev =3D "arch"
 COMPATIBLE_HOST ?=3D "null"
 COMPATIBLE_HOST_ti-soc =3D "(.*)"
diff --git a/recipes-ti/mpm-transport/mpm-transport_git.bb b/recipes-ti/mpm=
-transport/mpm-transport_git.bb
index 9bbbb733..6843689c 100644
--- a/recipes-ti/mpm-transport/mpm-transport_git.bb
+++ b/recipes-ti/mpm-transport/mpm-transport_git.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D122b7757f366=
f3f6fe11988715258fc9"
 COMPATIBLE_MACHINE =3D "keystone"

 DEPENDS =3D "common-csl-ip edma3-lld mmap-lld cmem rm-lld qmss-lld cppi-ll=
d uio-module-drv"
-DEPENDS_append_k2hk =3D " hyplnk-lld srio-lld"
-DEPENDS_append_k2e =3D " hyplnk-lld"
+DEPENDS:append_k2hk =3D " hyplnk-lld srio-lld"
+DEPENDS:append_k2e =3D " hyplnk-lld"

 PACKAGE_ARCH =3D "${MACHINE_ARCH}"

@@ -21,14 +21,14 @@ PR =3D "r0"

 CC +=3D "-fcommon"
 EXTRA_OEMAKE =3D "PDK_INSTALL_PATH=3D${STAGING_INCDIR}"
-EXTRA_OEMAKE_append_k2hk +=3D "HYPLNK_TRANSPORT=3Dtrue SRIO_TRANSPORT=3Dtr=
ue"
-EXTRA_OEMAKE_append_k2e +=3D "HYPLNK_TRANSPORT=3Dtrue"
-INSANE_SKIP_${PN} +=3D "ldflags"
+EXTRA_OEMAKE:append_k2hk +=3D "HYPLNK_TRANSPORT=3Dtrue SRIO_TRANSPORT=3Dtr=
ue"
+EXTRA_OEMAKE:append_k2e +=3D "HYPLNK_TRANSPORT=3Dtrue"
+INSANE_SKIP:${PN} +=3D "ldflags"

 S =3D "${WORKDIR}/git"

 PACKAGES =3D+ "${PN}-test"
-FILES_${PN}-test =3D "${bindir}/mpm_transport_test.out \
+FILES:${PN}-test =3D "${bindir}/mpm_transport_test.out \
                                         ${bindir}/mpm_transport_hyplnk_loo=
pback.out \
                                         ${bindir}/mpm_transport_hyplnk_rem=
ote.out \
                                         ${bindir}/mpm_transport_hyplnk_loo=
pback_dma.out \
diff --git a/recipes-ti/multiprocmgr/multiprocmgr-rtos_git.bb b/recipes-ti/=
multiprocmgr/multiprocmgr-rtos_git.bb
index 7a6e0f63..41efe38b 100644
--- a/recipes-ti/multiprocmgr/multiprocmgr-rtos_git.bb
+++ b/recipes-ti/multiprocmgr/multiprocmgr-rtos_git.bb
@@ -9,7 +9,7 @@ DEPENDS =3D "ti-cgt6x-native"
 PR =3D "${INC_PR}.2"

 PACKAGES =3D+ "${PN}-test"
-FILES_${PN}-test =3D "${datadir}/ti/examples/mpm/test/filetestdemo/c66x/de=
mo_loopback/build/bin/*.out \
+FILES:${PN}-test =3D "${datadir}/ti/examples/mpm/test/filetestdemo/c66x/de=
mo_loopback/build/bin/*.out \
                     ${datadir}/ti/examples/mpm/test/sync_test/c66x/bin/*.o=
ut"

 EXTRA_OEMAKE =3D "LOCAL_SYSROOT=3D"${STAGING_DIR_TARGET}" \
@@ -35,10 +35,10 @@ do_install() {
         ${D}${datadir}/ti/examples/mpm/test/sync_test/c66x/bin/
 }

-FILES_${PN}-dev +=3D "${MPM_INSTALL_DIR_RECIPE}"
-INSANE_SKIP_${PN}-dev =3D "arch"
-INSANE_SKIP_${PN}-test =3D "arch"
+FILES:${PN}-dev +=3D "${MPM_INSTALL_DIR_RECIPE}"
+INSANE_SKIP:${PN}-dev =3D "arch"
+INSANE_SKIP:${PN}-test =3D "arch"

-RDEPENDS_${PN}-dev =3D "bash"
+RDEPENDS:${PN}-dev =3D "bash"

-ALLOW_EMPTY_${PN} =3D "1"
+ALLOW_EMPTY:${PN} =3D "1"
diff --git a/recipes-ti/multiprocmgr/multiprocmgr-test_git.bb b/recipes-ti/=
multiprocmgr/multiprocmgr-test_git.bb
index 8bcb1105..3d1b3aee 100644
--- a/recipes-ti/multiprocmgr/multiprocmgr-test_git.bb
+++ b/recipes-ti/multiprocmgr/multiprocmgr-test_git.bb
@@ -5,14 +5,14 @@ include multiprocmgr.inc
 PR =3D "${INC_PR}.2"

 DEPENDS =3D "multiprocmgr cmem"
-RDEPENDS_${PN} =3D "multiprocmgr mpm-transport cmem"
-RDEPENDS_${PN} +=3D "multiprocmgr-rtos-test bash"
+RDEPENDS:${PN} =3D "multiprocmgr mpm-transport cmem"
+RDEPENDS:${PN} +=3D "multiprocmgr-rtos-test bash"

-FILES_${PN} +=3D "\
+FILES:${PN} +=3D "\
     ${datadir}/ti/examples/mpm \
 "

-FILES_${PN}-dbg +=3D "\
+FILES:${PN}-dbg +=3D "\
     ${datadir}/ti/examples/mpm/*/.debug \
 "

@@ -28,4 +28,4 @@ do_install() {
         cp -r ${S}/test ${D}${datadir}/ti/examples/mpm
 }

-INSANE_SKIP_${PN} =3D "ldflags staticdev"
+INSANE_SKIP:${PN} =3D "ldflags staticdev"
diff --git a/recipes-ti/multiprocmgr/multiprocmgr_git.bb b/recipes-ti/multi=
procmgr/multiprocmgr_git.bb
index 07512603..1bd24885 100644
--- a/recipes-ti/multiprocmgr/multiprocmgr_git.bb
+++ b/recipes-ti/multiprocmgr/multiprocmgr_git.bb
@@ -16,7 +16,7 @@ PACKAGE_ARCH =3D "${MACHINE_ARCH}"
 INITSCRIPT_NAME =3D "mpmsrv-daemon.sh"
 INITSCRIPT_PARAMS =3D "defaults 10"

-SYSTEMD_SERVICE_${PN} =3D "mpmsrv-daemon.service"
+SYSTEMD_SERVICE:${PN} =3D "mpmsrv-daemon.service"

 inherit update-rc.d systemd

@@ -41,4 +41,4 @@ do_install() {
         chown -R root:root ${D}${libdir}/
 }

-INSANE_SKIP_${PN} =3D "ldflags"
+INSANE_SKIP:${PN} =3D "ldflags"
diff --git a/recipes-ti/ndk/ti-ndk.inc b/recipes-ti/ndk/ti-ndk.inc
index 9afde316..89c1adf8 100644
--- a/recipes-ti/ndk/ti-ndk.inc
+++ b/recipes-ti/ndk/ti-ndk.inc
@@ -14,7 +14,7 @@ do_install() {
     cp ${CP_ARGS} ${S}/* ${D}${NDK_INSTALL_DIR_RECIPE}
 }

-ALLOW_EMPTY_${PN} =3D "1"
-FILES_${PN}-dev +=3D "${NDK_INSTALL_DIR_RECIPE}"
+ALLOW_EMPTY:${PN} =3D "1"
+FILES:${PN}-dev +=3D "${NDK_INSTALL_DIR_RECIPE}"

-INSANE_SKIP_${PN}-dev =3D "arch ldflags staticdev file-rdeps"
+INSANE_SKIP:${PN}-dev =3D "arch ldflags staticdev file-rdeps"
diff --git a/recipes-ti/ns/ti-ns.inc b/recipes-ti/ns/ti-ns.inc
index 2a50c56c..a6b37c6b 100644
--- a/recipes-ti/ns/ti-ns.inc
+++ b/recipes-ti/ns/ti-ns.inc
@@ -15,7 +15,7 @@ do_install() {
     cp ${CP_ARGS} ${S}/* ${D}${NS_INSTALL_DIR_RECIPE}
 }

-ALLOW_EMPTY_${PN} =3D "1"
-FILES_${PN}-dev +=3D "${NS_INSTALL_DIR_RECIPE}"
+ALLOW_EMPTY:${PN} =3D "1"
+FILES:${PN}-dev +=3D "${NS_INSTALL_DIR_RECIPE}"

-INSANE_SKIP_${PN}-dev =3D "arch ldflags staticdev file-rdeps"
+INSANE_SKIP:${PN}-dev =3D "arch ldflags staticdev file-rdeps"
diff --git a/recipes-ti/openmp-rtos/openmp-rtos_git.bb b/recipes-ti/openmp-=
rtos/openmp-rtos_git.bb
index 0c93f354..32faa984 100644
--- a/recipes-ti/openmp-rtos/openmp-rtos_git.bb
+++ b/recipes-ti/openmp-rtos/openmp-rtos_git.bb
@@ -24,9 +24,9 @@ SRCREV =3D "c090eb664d9815a36ead0e14f31e102590680fb8"
 LIC_FILES_CHKSUM =3D "file://docs/license/omp_manifest_template.html;md5=
=3D61a6972303c0447b7c056195d7ebafee"

 DEPENDS =3D "common-csl-ip-rtos doxygen-native libulm ti-xdctools-native t=
i-ipc-rtos ti-sysbios ti-cgt6x-native zip-native"
-DEPENDS_append_k2hk =3D " qmss-lld-rtos cppi-lld-rtos"
-DEPENDS_append_k2e =3D " qmss-lld-rtos cppi-lld-rtos"
-DEPENDS_append_k2l =3D " qmss-lld-rtos cppi-lld-rtos"
+DEPENDS:append_k2hk =3D " qmss-lld-rtos cppi-lld-rtos"
+DEPENDS:append_k2e =3D " qmss-lld-rtos cppi-lld-rtos"
+DEPENDS:append_k2l =3D " qmss-lld-rtos cppi-lld-rtos"

 COMPATIBLE_MACHINE =3D "keystone|omap-a15"
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
@@ -64,10 +64,10 @@ do_install() {
     cp -r ${S}/exports/openmp_dsp_${RELEASE_TARGET}_*/. -d  ${D}${OMP_INST=
ALL_DIR_RECIPE}
 }

-ALLOW_EMPTY_${PN} =3D "1"
+ALLOW_EMPTY:${PN} =3D "1"

-FILES_${PN}-dev +=3D " \
+FILES:${PN}-dev +=3D " \
     ${OMP_INSTALL_DIR_RECIPE}/ \
 "

-INSANE_SKIP_${PN}-dev =3D "arch"
+INSANE_SKIP:${PN}-dev =3D "arch"
diff --git a/recipes-ti/osal/ti-osal.inc b/recipes-ti/osal/ti-osal.inc
index 0a966d40..11f99e63 100644
--- a/recipes-ti/osal/ti-osal.inc
+++ b/recipes-ti/osal/ti-osal.inc
@@ -15,10 +15,10 @@ do_install() {
     cp -pPrf ${S}/* ${D}${OSAL_INSTALL_DIR_RECIPE}
 }

-INSANE_SKIP_${PN}-dev =3D "staticdev"
+INSANE_SKIP:${PN}-dev =3D "staticdev"

-ALLOW_EMPTY_${PN} =3D "1"
-FILES_${PN}-dev +=3D "${OSAL_INSTALL_DIR_RECIPE}"
+ALLOW_EMPTY:${PN} =3D "1"
+FILES:${PN}-dev +=3D "${OSAL_INSTALL_DIR_RECIPE}"

 COMPATIBLE_HOST ?=3D "null"
 COMPATIBLE_HOST_ti-soc =3D "(.*)"
diff --git a/recipes-ti/swtools/swtools_git.bb b/recipes-ti/swtools/swtools=
_git.bb
index 497c0e0d..b6d645f3 100644
--- a/recipes-ti/swtools/swtools_git.bb
+++ b/recipes-ti/swtools/swtools_git.bb
@@ -27,7 +27,7 @@ export C64PCODEGENTOOL =3D "${CGTOOLS_INSTALL_DIR}"
 export C674CODEGENTOOL =3D "${CGTOOLS_INSTALL_DIR}"
 export C66CODEGENTOOL  =3D "${CGTOOLS_INSTALL_DIR}"

-PATH_append =3D ":${XDC_INSTALL_DIR}"
+PATH:append =3D ":${XDC_INSTALL_DIR}"

 XDCPATH .=3D "${XDCCGROOT}/include;${XDC_INSTALL_DIR}/packages;${SYSBIOS_I=
NSTALL_DIR}/packages;"

@@ -44,9 +44,9 @@ do_install() {
         cp ${CP_ARGS} ${S}/* ${D}${SWTOOLS_INSTALL_DIR_RECIPE}
 }

-FILES_${PN}-dev +=3D "${SWTOOLS_INSTALL_DIR_RECIPE}"
+FILES:${PN}-dev +=3D "${SWTOOLS_INSTALL_DIR_RECIPE}"

-INSANE_SKIP_${PN}-dev =3D "arch staticdev"
-ALLOW_EMPTY_${PN} =3D "1"
+INSANE_SKIP:${PN}-dev =3D "arch staticdev"
+ALLOW_EMPTY:${PN} =3D "1"
 COMPATIBLE_HOST ?=3D "null"
 COMPATIBLE_HOST_ti-soc =3D "(.*)"
diff --git a/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb b/recipes-ti/=
ti-pdk-build/ti-pdk-build-rtos_git.bb
index 96648815..6b491dcc 100644
--- a/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb
+++ b/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb
@@ -28,5 +28,5 @@ do_install() {
     oe_runmake
 }

-FILES_${PN} +=3D "${PDK_INSTALL_DIR_RECIPE}/packages/*"
-INSANE_SKIP_${PN} +=3D " file-rdeps"
+FILES:${PN} +=3D "${PDK_INSTALL_DIR_RECIPE}/packages/*"
+INSANE_SKIP:${PN} +=3D " file-rdeps"
diff --git a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/recipes-ti/ti-rto=
s-bin/ti-rtos-firmware.bb
index 43de1ec2..1e9aab78 100644
--- a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
+++ b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
@@ -18,7 +18,7 @@ PLAT_SFX_j7200-evm =3D "j7200"
 PLAT_SFX_am65xx =3D "am65xx"
 PLAT_SFX_am64xx =3D "am64xx"

-FILESEXTRAPATHS_prepend :=3D "${METATIBASE}/recipes-bsp/ti-sci-fw/files/:"
+FILESEXTRAPATHS:prepend :=3D "${METATIBASE}/recipes-bsp/ti-sci-fw/files/:"
 require recipes-bsp/ti-sci-fw/ti-sci-fw.inc

 CORESDK_RTOS_VERSION ?=3D "08.00.00.26"
@@ -30,7 +30,7 @@ PR =3D "${INC_PR}.0"
 # Secure Build
 DEPENDS +=3D "openssl-native"

-FILES_${PN} +=3D "${base_libdir}"
+FILES:${PN} +=3D "${base_libdir}"

 TI_SECURE_DEV_PKG ?=3D ""

@@ -47,7 +47,7 @@ LEGACY_DM_FW_DIR  =3D "${D}${base_libdir}/firmware/pdk-ip=
c/"
 DM_FIRMWARE =3D "ipc_echo_testb_mcu1_0_release_strip.xer5f"

 # J7 HS support
-do_install_prepend_j7-hs-evm() {
+do_install:prepend_j7-hs-evm() {
         export TI_SECURE_DEV_PKG=3D${TI_SECURE_DEV_PKG}
         ( cd ${RTOS_DM_FW_DIR}; \
                 mv ${DM_FIRMWARE} ${DM_FIRMWARE}.unsigned; \
@@ -56,7 +56,7 @@ do_install_prepend_j7-hs-evm() {
 }

 # Update the am64xx ipc binaries to be consistent with other platforms
-do_install_prepend_am64xx() {
+do_install:prepend_am64xx() {
         ( cd ${RTOS_IPC_FW_DIR}; \
                 mv am64-main-r5f0_0-fw ipc_echo_baremetal_test_mcu1_0_rele=
ase_strip.xer5f; \
                 mv am64-main-r5f0_1-fw ipc_echo_baremetal_test_mcu1_1_rele=
ase_strip.xer5f; \
@@ -114,19 +114,19 @@ do_install_am64xx() {
 }

 # Set up names for the firmwares
-ALTERNATIVE_${PN}_am65xx =3D "\
+ALTERNATIVE:${PN}_am65xx =3D "\
                     am65x-mcu-r5f0_0-fw \
                     am65x-mcu-r5f0_1-fw \
                     "

-ALTERNATIVE_${PN}_am64xx =3D "\
+ALTERNATIVE:${PN}_am64xx =3D "\
                     am64-main-r5f0_0-fw \
                     am64-main-r5f0_1-fw \
                     am64-main-r5f1_0-fw \
                     am64-main-r5f1_1-fw \
                     "

-ALTERNATIVE_${PN}_j7 =3D "\
+ALTERNATIVE:${PN}_j7 =3D "\
                     j7-mcu-r5f0_0-fw \
                     j7-mcu-r5f0_1-fw \
                     j7-main-r5f0_0-fw \
@@ -138,7 +138,7 @@ ALTERNATIVE_${PN}_j7 =3D "\
                     j7-c71_0-fw\
                     "

-ALTERNATIVE_${PN}_j7200-evm =3D "\
+ALTERNATIVE:${PN}_j7200-evm =3D "\
                     j7200-mcu-r5f0_0-fw \
                     j7200-mcu-r5f0_1-fw \
                     j7200-main-r5f0_0-fw \
@@ -221,7 +221,7 @@ ALTERNATIVE_TARGET[j7200-main-r5f0_1-fw] =3D "${base_li=
bdir}/firmware/pdk-ipc/ipc_
 ALTERNATIVE_PRIORITY =3D "10"

 # make sure that lib/firmware, and all its contents are part of the packag=
e
-FILES_${PN} +=3D "${base_libdir}/firmware"
+FILES:${PN} +=3D "${base_libdir}/firmware"

 # This is used to prevent the build system to_strip the executables
 INHIBIT_PACKAGE_STRIP =3D "1"
@@ -229,7 +229,7 @@ INHIBIT_SYSROOT_STRIP =3D "1"
 # This is used to prevent the build system to split the debug info in a se=
parate file
 INHIBIT_PACKAGE_DEBUG_SPLIT =3D "1"
 # As it likely to be a different arch from the Yocto build, disable checki=
ng by adding "arch" to INSANE_SKIP
-INSANE_SKIP_${PN} +=3D "arch"
+INSANE_SKIP:${PN} +=3D "arch"

 # we don't want to configure and build the source code
 do_compile[noexec] =3D "1"
diff --git a/recipes-ti/udma/udma_git.bb b/recipes-ti/udma/udma_git.bb
index c905fa58..b6100a37 100644
--- a/recipes-ti/udma/udma_git.bb
+++ b/recipes-ti/udma/udma_git.bb
@@ -14,7 +14,7 @@ PV =3D "01.00.00.00"

 PACKAGES =3D+ "${PN}-test"

-FILES_${PN}-test =3D "${bindir}/udma_test"
+FILES:${PN}-test =3D "${bindir}/udma_test"

 do_install() {
         install -d ${D}${bindir}/
@@ -29,4 +29,4 @@ do_install() {
         install -c -m 755 ${S}/include/* ${D}${includedir}/
 }

-INSANE_SKIP_${PN} +=3D "textrel"
+INSANE_SKIP:${PN} +=3D "textrel"
diff --git a/recipes-ti/uio-test-pruss/uio-test-pruss_git.bb b/recipes-ti/u=
io-test-pruss/uio-test-pruss_git.bb
index cbae1b11..fdcf766e 100644
--- a/recipes-ti/uio-test-pruss/uio-test-pruss_git.bb
+++ b/recipes-ti/uio-test-pruss/uio-test-pruss_git.bb
@@ -26,10 +26,10 @@ COMPATIBLE_MACHINE =3D "omap-a15|ti33x|ti43x|k2g"
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"

 DEVICE_NAME =3D ""
-DEVICE_NAME_append_am57xx-evm =3D "am57xx"
-DEVICE_NAME_append_ti33x =3D "am33xx"
-DEVICE_NAME_append_ti43x =3D "am43xx"
-DEVICE_NAME_append_k2g =3D "k2g"
+DEVICE_NAME:append_am57xx-evm =3D "am57xx"
+DEVICE_NAME:append_ti33x =3D "am33xx"
+DEVICE_NAME:append_ti43x =3D "am43xx"
+DEVICE_NAME:append_k2g =3D "k2g"

 EXTRA_OEMAKE =3D "CGT_PRU=3D${TI_CGT_PRU_INSTALL_DIR} DEVICE=3D${DEVICE_NA=
ME}"

diff --git a/recipes-ti/vlib/vlib-c66x.inc b/recipes-ti/vlib/vlib-c66x.inc
index a539e4d7..9ab9c506 100644
--- a/recipes-ti/vlib/vlib-c66x.inc
+++ b/recipes-ti/vlib/vlib-c66x.inc
@@ -23,10 +23,10 @@ do_install() {
     cp ${CP_ARGS} ${S}/* ${D}${VLIB_C66_INSTALL_DIR_RECIPE}
 }

-ALLOW_EMPTY_${PN} =3D "1"
-FILES_${PN}-dev +=3D "${VLIB_C66_INSTALL_DIR_RECIPE}"
+ALLOW_EMPTY:${PN} =3D "1"
+FILES:${PN}-dev +=3D "${VLIB_C66_INSTALL_DIR_RECIPE}"

 INHIBIT_PACKAGE_STRIP =3D "1"
 INHIBIT_SYSROOT_STRIP =3D "1"
 INHIBIT_PACKAGE_DEBUG_SPLIT =3D "1"
-INSANE_SKIP_${PN}-dev =3D "installed-vs-shipped arch"
+INSANE_SKIP:${PN}-dev =3D "installed-vs-shipped arch"
diff --git a/recipes-ti/xdais/ti-xdais.inc b/recipes-ti/xdais/ti-xdais.inc
index 24268b3a..daa93ddf 100644
--- a/recipes-ti/xdais/ti-xdais.inc
+++ b/recipes-ti/xdais/ti-xdais.inc
@@ -19,7 +19,7 @@ do_install() {
 INHIBIT_PACKAGE_STRIP =3D "1"
 INHIBIT_SYSROOT_STRIP =3D "1"
 INHIBIT_PACKAGE_DEBUG_SPLIT =3D "1"
-INSANE_SKIP_${PN}-dev =3D "arch"
+INSANE_SKIP:${PN}-dev =3D "arch"

-ALLOW_EMPTY_${PN} =3D "1"
-FILES_${PN}-dev +=3D "${XDAIS_INSTALL_DIR_RECIPE}"
+ALLOW_EMPTY:${PN} =3D "1"
+FILES:${PN}-dev +=3D "${XDAIS_INSTALL_DIR_RECIPE}"
diff --git a/recipes-ti/xdais/ti-xdais_6.26.01.03.bb b/recipes-ti/xdais/ti-=
xdais_6.26.01.03.bb
index 3d358632..9fc4cee1 100644
--- a/recipes-ti/xdais/ti-xdais_6.26.01.03.bb
+++ b/recipes-ti/xdais/ti-xdais_6.26.01.03.bb
@@ -8,4 +8,4 @@ LIC_FILES_CHKSUM =3D "file://xdais_6_26_01_03_manifest.html=
;md5=3Da5a675d49db2f658bb
 SRC_URI[xdaistarball.md5sum] =3D "9b2bea3408254e737ec0d819a031adf6"
 SRC_URI[xdaistarball.sha256sum] =3D "d7bcbd8bcfe6fdfc5f402e4b125ced6c806dc=
30bc5296e98d5d43b0b5a237a0d"

-INSANE_SKIP_${PN} =3D "installed-vs-shipped"
+INSANE_SKIP:${PN} =3D "installed-vs-shipped"
--
2.32.0


--_000_c99e3f08bc634b59b41aae51df7b1647emailandroidcom_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from text --><style><!-- .EmailQuote { margin-left: 1pt; pad=
ding-left: 4pt; border-left: #800000 2px solid; } --></style>
</head>
<body>
<div>
<div dir=3D"auto">Khem,&nbsp;
<div dir=3D"auto">Assuming this series is only for master.&nbsp;</div>
</div>
<div class=3D"x_gmail_extra"><br>
<div class=3D"x_gmail_quote">On Aug 9, 2021 2:40 PM, Khem Raj &lt;raj.khem@=
gmail.com&gt; wrote:<br type=3D"attribution">
</div>
</div>
</div>
<font size=3D"2"><span style=3D"font-size:10pt;">
<div class=3D"PlainText">Signed-off-by: Khem Raj &lt;raj.khem@gmail.com&gt;=
<br>
---<br>
&nbsp;classes/ti-pdk-fetch.bbclass&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;=
 2 &#43;-<br>
&nbsp;classes/ti-pdk.bbclass&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; |&nbsp; 18 &#43;--<br>
&nbsp;conf/machine/am3517-evm.conf&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;=
 2 &#43;-<br>
&nbsp;conf/machine/am37x-evm.conf&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&=
nbsp; 2 &#43;-<br>
&nbsp;conf/machine/am65xx-evm-k3r5-sr2.conf&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; |&nbsp;&nbsp; 2 &#43;-<br>
&nbsp;conf/machine/am65xx-hs-evm-k3r5-sr2.conf&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; |&nbsp;&nbsp; 2 &#43;-<br>
&nbsp;conf/machine/beagleboard.conf&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 2 &#=
43;-<br>
&nbsp;conf/machine/beaglebone.conf&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;=
 2 &#43;-<br>
&nbsp;conf/machine/include/am64xx.inc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 2 &#43;-<br>
&nbsp;conf/machine/include/am65xx.inc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 2 &#43;-<br>
&nbsp;conf/machine/include/c66x.inc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 2 &#=
43;-<br>
&nbsp;conf/machine/include/davinci.inc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 2 &#43;-<br>
&nbsp;conf/machine/include/dra7xx.inc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 2 &#43;-<br>
&nbsp;conf/machine/include/j7.inc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&=
nbsp; 2 &#43;-<br>
&nbsp;conf/machine/include/k2e.inc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;=
 2 &#43;-<br>
&nbsp;conf/machine/include/k2g.inc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;=
 2 &#43;-<br>
&nbsp;conf/machine/include/k2hk.inc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 2 &#=
43;-<br>
&nbsp;conf/machine/include/k2l.inc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;=
 2 &#43;-<br>
&nbsp;conf/machine/include/k3.inc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&=
nbsp; 2 &#43;-<br>
&nbsp;conf/machine/include/k3r5.inc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 6 &#=
43;-<br>
&nbsp;conf/machine/include/keystone.inc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 2 &#43;-<br>
&nbsp;conf/machine/include/omap-a15.inc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 2 &#43;-<br>
&nbsp;conf/machine/include/omap3.inc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 2 &#43;-<=
br>
&nbsp;conf/machine/include/omap4.inc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 2 &#43;-<=
br>
&nbsp;conf/machine/include/omapl1.inc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 2 &#43;-<br>
&nbsp;conf/machine/include/omapl137.inc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 2 &#43;-<br>
&nbsp;conf/machine/include/omapl138.inc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 2 &#43;-<br>
&nbsp;conf/machine/include/ti33x.inc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 2 &#43;-<=
br>
&nbsp;conf/machine/include/ti43x.inc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 2 &#43;-<=
br>
&nbsp;conf/machine/omap3evm.conf&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&n=
bsp;&nbsp; 2 &#43;-<br>
&nbsp;conf/multiconfig/k3r5-sr2.conf&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 2 &#43;-<=
br>
&nbsp;conf/multiconfig/k3r5.conf&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&n=
bsp;&nbsp; 2 &#43;-<br>
&nbsp;recipes-bsp/abefw/abefw_1.0.14.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 2 &#43;-<br>
&nbsp;recipes-bsp/aif2-lld/aif2-lld-rtos_git.bb&nbsp;&nbsp;&nbsp;&nbsp; |&n=
bsp;&nbsp; 2 &#43;-<br>
&nbsp;recipes-bsp/aif2-lld/aif2-lld-test_git.bb&nbsp;&nbsp;&nbsp;&nbsp; |&n=
bsp;&nbsp; 2 &#43;-<br>
&nbsp;recipes-bsp/aif2-lld/aif2-lld_git.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 2 &#43;-<br>
&nbsp;recipes-bsp/alsa-state/alsa-state.bbappend&nbsp;&nbsp;&nbsp; |&nbsp;&=
nbsp; 2 &#43;-<br>
&nbsp;.../audk2g-addon/audk2g-addon-rtos_git.bb&nbsp;&nbsp;&nbsp;&nbsp; |&n=
bsp;&nbsp; 2 &#43;-<br>
&nbsp;recipes-bsp/bcp-lld/bcp-lld-rtos_git.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; |&nbsp;&nbsp; 2 &#43;-<br>
&nbsp;recipes-bsp/board-rtos/board-rtos_git.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; |&nbsp; 20 &#43;--<br>
&nbsp;recipes-bsp/boot-monitor/boot-monitor_git.bb&nbsp; |&nbsp;&nbsp; 2 &#=
43;-<br>
&nbsp;recipes-bsp/bt-fw/bt-fw_git.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 2 &#43;-<=
br>
&nbsp;.../cadence-mhdp-fw/cadence-mhdp-fw_git.bb&nbsp;&nbsp;&nbsp; |&nbsp;&=
nbsp; 2 &#43;-<br>
&nbsp;recipes-bsp/cal-lld/cal-lld-rtos_git.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; |&nbsp;&nbsp; 6 &#43;-<br>
&nbsp;recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb&nbsp;&nbsp; |&nbsp;&nbsp;=
 2 &#43;-<br>
&nbsp;recipes-bsp/cmb-addon/cmb-addon-rtos_git.bb&nbsp;&nbsp; |&nbsp;&nbsp;=
 2 &#43;-<br>
&nbsp;recipes-bsp/cmem/cmem-mod_git.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 4 &#43;-<br>
&nbsp;recipes-bsp/cmem/cmem_git.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;=
 4 &#43;-<br>
&nbsp;.../common-csl-ip/common-csl-ip-rtos_git.bb&nbsp;&nbsp; |&nbsp; 10 &#=
43;-<br>
&nbsp;.../common-csl-ip/common-csl-ip_git.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; |&nbsp;&nbsp; 2 &#43;-<br>
&nbsp;.../common-csl-ip/csl-rti-dwwdtest-fw_git.bb&nbsp; |&nbsp; 16 &#43;--=
<br>
&nbsp;recipes-bsp/cppi-lld/cppi-lld-rtos_git.bb&nbsp;&nbsp;&nbsp;&nbsp; |&n=
bsp;&nbsp; 4 &#43;-<br>
&nbsp;recipes-bsp/cppi-lld/cppi-lld-test_git.bb&nbsp;&nbsp;&nbsp;&nbsp; |&n=
bsp;&nbsp; 6 &#43;-<br>
&nbsp;recipes-bsp/cppi-lld/cppi-lld_git.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 8 &#43;-<br>
&nbsp;.../cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; |&nbsp;&nbsp; 6 &#43;-<br>
&nbsp;recipes-bsp/cuia/cuia_1.0.0.13.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 2 &#43;-<br>
&nbsp;recipes-bsp/dfe-lld/dfe-lld-test_git.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; |&nbsp;&nbsp; 2 &#43;-<br>
&nbsp;recipes-bsp/dfe-lld/dfe-lld_git.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 2 &#43;-<br>
&nbsp;recipes-bsp/dspdce-fw/dspdce-fw_git.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; |&nbsp;&nbsp; 6 &#43;-<br>
&nbsp;recipes-bsp/dsptop/debugss-module-drv_git.bb&nbsp; |&nbsp;&nbsp; 4 &#=
43;-<br>
&nbsp;recipes-bsp/dsptop/dsptop_git.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 4 &#43;-<br>
&nbsp;recipes-bsp/dsptop/libulm_git.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 4 &#43;-<br>
&nbsp;.../dsptop/temperature-module-drv_git.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; |&nbsp;&nbsp; 4 &#43;-<br>
&nbsp;recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb&nbsp;&nbsp; |&nbsp; 10 &#=
43;-<br>
&nbsp;recipes-bsp/edma3-lld/edma3-lld_git.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; |&nbsp;&nbsp; 6 &#43;-<br>
&nbsp;recipes-bsp/emac-lld/emac-lld-rtos_git.bb&nbsp;&nbsp;&nbsp;&nbsp; |&n=
bsp; 12 &#43;-<br>
&nbsp;recipes-bsp/fatfs-rtos/fatfs-rtos_git.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; |&nbsp;&nbsp; 2 &#43;-<br>
&nbsp;.../faultmanagement-rtos_git.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 4 &#43;-<br>
&nbsp;recipes-bsp/fftc-lld/fftc-lld-rtos_git.bb&nbsp;&nbsp;&nbsp;&nbsp; |&n=
bsp;&nbsp; 2 &#43;-<br>
&nbsp;.../formfactor/formfactor_0.0.bbappend&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; |&nbsp;&nbsp; 2 &#43;-<br>
&nbsp;recipes-bsp/fvid2/fvid2-rtos_git.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 6 &#43;-<br>
&nbsp;.../ti-gc320-driver_5.0.11.p7.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 2 &#43;-<br>
&nbsp;recipes-bsp/goodix-fw/goodix-fw_git.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; |&nbsp;&nbsp; 2 &#43;-<br>
&nbsp;recipes-bsp/gpio-lld/gpio-lld-rtos_git.bb&nbsp;&nbsp;&nbsp;&nbsp; |&n=
bsp;&nbsp; 8 &#43;-<br>
&nbsp;recipes-bsp/gpmc-lld/gpmc-lld-rtos_git.bb&nbsp;&nbsp;&nbsp;&nbsp; |&n=
bsp;&nbsp; 6 &#43;-<br>
&nbsp;recipes-bsp/hplib/hplib-mod_git.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 2 &#43;-<br>
&nbsp;recipes-bsp/hplib/hplib-test_git.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 2 &#43;-<br>
&nbsp;recipes-bsp/hplib/hplib_git.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 4 &#43;-<=
br>
&nbsp;recipes-bsp/hyplnk-lld/hyplnk-lld-rtos_git.bb |&nbsp;&nbsp; 2 &#43;-<=
br>
&nbsp;recipes-bsp/hyplnk-lld/hyplnk-lld-test_git.bb |&nbsp;&nbsp; 6 &#43;-<=
br>
&nbsp;recipes-bsp/hyplnk-lld/hyplnk-lld_git.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; |&nbsp;&nbsp; 6 &#43;-<br>
&nbsp;recipes-bsp/i2c-lld/i2c-lld-rtos_git.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; |&nbsp; 14 &#43;-<br>
&nbsp;recipes-bsp/ibl-boot/ibl-boot-rtos_git.bb&nbsp;&nbsp;&nbsp;&nbsp; |&n=
bsp;&nbsp; 6 &#43;-<br>
&nbsp;.../icss-emac-lld/icss-emac-lld-rtos_git.bb&nbsp;&nbsp; |&nbsp;&nbsp;=
 8 &#43;-<br>
&nbsp;.../icss-emac-lld/icss-emac-lld-test_git.bb&nbsp;&nbsp; |&nbsp;&nbsp;=
 6 &#43;-<br>
&nbsp;.../icss-emac-lld/icss-emac-lld_git.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; |&nbsp;&nbsp; 2 &#43;-<br>
&nbsp;recipes-bsp/iolink-lld/iolink-lld-rtos_git.bb |&nbsp;&nbsp; 6 &#43;-<=
br>
&nbsp;.../ipc-lld/ipc-lld-examples-rtos_git.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; |&nbsp; 24 &#43;&#43;--<br>
&nbsp;recipes-bsp/ipc-lld/ipc-lld-fw_git.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; |&nbsp; 12 &#43;-<br>
&nbsp;recipes-bsp/ipc-lld/ipc-lld-rtos_git.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; |&nbsp;&nbsp; 6 &#43;-<br>
&nbsp;recipes-bsp/ipc-lld/ipc-lld.inc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 2 &#43;-<br>
&nbsp;recipes-bsp/ipumm-fw/ipumm-fw_git.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 6 &#43;-<br>
&nbsp;recipes-bsp/iqn2-lld/iqn2-lld-test_git.bb&nbsp;&nbsp;&nbsp;&nbsp; |&n=
bsp;&nbsp; 2 &#43;-<br>
&nbsp;recipes-bsp/iqn2-lld/iqn2-lld_git.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 2 &#43;-<br>
&nbsp;recipes-bsp/mad-utils/mad-utils-rtos_git.bb&nbsp;&nbsp; |&nbsp;&nbsp;=
 6 &#43;-<br>
&nbsp;recipes-bsp/mcasp-lld/mcasp-lld-rtos_git.bb&nbsp;&nbsp; |&nbsp; 12 &#=
43;-<br>
&nbsp;recipes-bsp/mcbsp-lld/mcbsp-lld-rtos_git.bb&nbsp;&nbsp; |&nbsp;&nbsp;=
 4 &#43;-<br>
&nbsp;recipes-bsp/mmap-lld/mmap-lld-test_git.bb&nbsp;&nbsp;&nbsp;&nbsp; |&n=
bsp;&nbsp; 8 &#43;-<br>
&nbsp;recipes-bsp/mmap-lld/mmap-lld_git.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 4 &#43;-<br>
&nbsp;recipes-bsp/mmcsd-lld/mmcsd-lld-rtos_git.bb&nbsp;&nbsp; |&nbsp; 12 &#=
43;-<br>
&nbsp;recipes-bsp/netcp-pa-fw/netcp-pa-fw_git.bb&nbsp;&nbsp;&nbsp; |&nbsp;&=
nbsp; 2 &#43;-<br>
&nbsp;recipes-bsp/netcp-sa-fw/netcp-sa-fw_git.bb&nbsp;&nbsp;&nbsp; |&nbsp;&=
nbsp; 2 &#43;-<br>
&nbsp;recipes-bsp/nwal-lld/nwal-lld-rtos_git.bb&nbsp;&nbsp;&nbsp;&nbsp; |&n=
bsp;&nbsp; 2 &#43;-<br>
&nbsp;recipes-bsp/nwal-lld/nwal-lld-test_git.bb&nbsp;&nbsp;&nbsp;&nbsp; |&n=
bsp;&nbsp; 2 &#43;-<br>
&nbsp;recipes-bsp/nwal-lld/nwal-lld_git.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 2 &#43;-<br>
&nbsp;recipes-bsp/osal/osal-rtos_git.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 6 &#43;-<br>
&nbsp;recipes-bsp/osal/osal-test_git.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 2 &#43;-<br>
&nbsp;recipes-bsp/osal/osal_git.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;=
 2 &#43;-<br>
&nbsp;recipes-bsp/pa-lld/pa-lld-rtos_git.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; |&nbsp;&nbsp; 4 &#43;-<br>
&nbsp;recipes-bsp/pa-lld/pa-lld-test_git.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; |&nbsp;&nbsp; 6 &#43;-<br>
&nbsp;recipes-bsp/pa-lld/pa-lld_git.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 4 &#43;-<br>
&nbsp;recipes-bsp/pcie-lld/pcie-lld-rtos_git.bb&nbsp;&nbsp;&nbsp;&nbsp; |&n=
bsp;&nbsp; 2 &#43;-<br>
&nbsp;recipes-bsp/pktlib/pktlib-rtos_git.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; |&nbsp;&nbsp; 4 &#43;-<br>
&nbsp;recipes-bsp/pktlib/pktlib_git.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 2 &#43;-<br>
&nbsp;recipes-bsp/pm-lld/pm-lld-rtos_git.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; |&nbsp; 16 &#43;--<br>
&nbsp;.../ti-img-rogue-driver_1.13.5776728.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; |&nbsp;&nbsp; 2 &#43;-<br>
&nbsp;.../ti-sgx-ddk-km_1.17.4948957.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 4 &#43;-<br>
&nbsp;recipes-bsp/pru/pru-icss_git.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 38 &#43;&#43;&#43;--=
-<br>
&nbsp;recipes-bsp/pru/pru-pwm-fw_git.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 4 &#43;-<br>
&nbsp;recipes-bsp/pru/pru-swuart-fw_git.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 6 &#43;-<br>
&nbsp;.../pru/ti-pru-sw-edma-driver_1.00.00.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; |&nbsp;&nbsp; 6 &#43;-<br>
&nbsp;.../prueth-fw/prueth-fw-am65x-sr2_git.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; |&nbsp;&nbsp; 4 &#43;-<br>
&nbsp;recipes-bsp/prueth-fw/prueth-fw-am65x_git.bb&nbsp; |&nbsp;&nbsp; 4 &#=
43;-<br>
&nbsp;recipes-bsp/prueth-fw/prueth-fw_5.6.15.bb&nbsp;&nbsp;&nbsp;&nbsp; |&n=
bsp;&nbsp; 4 &#43;-<br>
&nbsp;recipes-bsp/pruhsr-fw/pruhsr-fw_2.17.25.bb&nbsp;&nbsp;&nbsp; |&nbsp;&=
nbsp; 4 &#43;-<br>
&nbsp;recipes-bsp/pruprp-fw/pruprp-fw_2.17.25.bb&nbsp;&nbsp;&nbsp; |&nbsp;&=
nbsp; 4 &#43;-<br>
&nbsp;recipes-bsp/pruss-lld/pruss-lld-apps_git.bb&nbsp;&nbsp; |&nbsp;&nbsp;=
 6 &#43;-<br>
&nbsp;recipes-bsp/pruss-lld/pruss-lld-rtos_git.bb&nbsp;&nbsp; |&nbsp; 10 &#=
43;-<br>
&nbsp;recipes-bsp/pruss-lld/pruss-lld-test_git.bb&nbsp;&nbsp; |&nbsp;&nbsp;=
 2 &#43;-<br>
&nbsp;recipes-bsp/pruss-lld/pruss-lld_git.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; |&nbsp;&nbsp; 2 &#43;-<br>
&nbsp;recipes-bsp/prusw-fw/prusw-fw_3.2.9.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; |&nbsp;&nbsp; 4 &#43;-<br>
&nbsp;recipes-bsp/qmss-lld/qmss-lld-rtos_git.bb&nbsp;&nbsp;&nbsp;&nbsp; |&n=
bsp;&nbsp; 4 &#43;-<br>
&nbsp;recipes-bsp/qmss-lld/qmss-lld-test_git.bb&nbsp;&nbsp;&nbsp;&nbsp; |&n=
bsp;&nbsp; 6 &#43;-<br>
&nbsp;recipes-bsp/qmss-lld/qmss-lld_git.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 8 &#43;-<br>
&nbsp;recipes-bsp/qmss-pdsp-fw/qmss-pdsp-fw_git.bb&nbsp; |&nbsp;&nbsp; 2 &#=
43;-<br>
&nbsp;recipes-bsp/rm-lld/rm-lld-rtos_git.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; |&nbsp;&nbsp; 2 &#43;-<br>
&nbsp;recipes-bsp/rm-lld/rm-lld_git.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 8 &#43;-<br>
&nbsp;recipes-bsp/sa-lld/sa-lld-rtos_git.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; |&nbsp;&nbsp; 6 &#43;-<br>
&nbsp;recipes-bsp/sa-lld/sa-lld-test_git.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; |&nbsp;&nbsp; 4 &#43;-<br>
&nbsp;recipes-bsp/sa-lld/sa-lld_git.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 2 &#43;-<br>
&nbsp;recipes-bsp/sciclient/sciclient-rtos_git.bb&nbsp;&nbsp; |&nbsp; 18 &#=
43;--<br>
&nbsp;.../serdes-diag/serdes-diag-rtos_git.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; |&nbsp;&nbsp; 2 &#43;-<br>
&nbsp;recipes-bsp/serdes-fw/serdes-fw_git.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; |&nbsp;&nbsp; 2 &#43;-<br>
&nbsp;recipes-bsp/spi-lld/spi-lld-rtos_git.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; |&nbsp; 12 &#43;-<br>
&nbsp;recipes-bsp/srio-lld/srio-lld-rtos_git.bb&nbsp;&nbsp;&nbsp;&nbsp; |&n=
bsp;&nbsp; 4 &#43;-<br>
&nbsp;recipes-bsp/srio-lld/srio-lld.inc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 2 &#43;-<br>
&nbsp;.../starterware/starterware-rtos_git.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; |&nbsp;&nbsp; 4 &#43;-<br>
&nbsp;recipes-bsp/starterware/starterware_git.bb&nbsp;&nbsp;&nbsp; |&nbsp;&=
nbsp; 2 &#43;-<br>
&nbsp;recipes-bsp/tcp3d-lld/tcp3d-lld-rtos_git.bb&nbsp;&nbsp; |&nbsp;&nbsp;=
 4 &#43;-<br>
&nbsp;.../ti-ocf-crypto-module_1.0.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 6 &#43;-<br>
&nbsp;recipes-bsp/ti-sci-fw/ti-sci-fw-source_git.bb |&nbsp;&nbsp; 4 &#43;-<=
br>
&nbsp;recipes-bsp/ti-sci-fw/ti-sci-fw_0.1.1.50.bb&nbsp;&nbsp; |&nbsp;&nbsp;=
 2 &#43;-<br>
&nbsp;recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; |&nbsp; 14 &#43;-<br>
&nbsp;.../traceframework/traceframework-rtos_git.bb |&nbsp;&nbsp; 2 &#43;-<=
br>
&nbsp;.../traceframework/traceframework_git.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; |&nbsp;&nbsp; 4 &#43;-<br>
&nbsp;.../transport-rtos/bmet-eth-rtos_git.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; |&nbsp;&nbsp; 2 &#43;-<br>
&nbsp;.../transport-rtos/nimu-icss-rtos_git.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; |&nbsp; 10 &#43;-<br>
&nbsp;recipes-bsp/transport-rtos/nimu-rtos_git.bb&nbsp;&nbsp; |&nbsp; 28 &#=
43;&#43;--<br>
&nbsp;.../transport-rtos/timesync-rtos_git.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; |&nbsp;&nbsp; 4 &#43;-<br>
&nbsp;.../trusted-firmware-a_%.bbappend&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 4 &#43;-<br>
&nbsp;recipes-bsp/u-boot/u-boot-ti.inc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 26 &#43;&#43;--<br>
&nbsp;recipes-bsp/uart-lld/uart-lld-rtos_git.bb&nbsp;&nbsp;&nbsp;&nbsp; |&n=
bsp; 14 &#43;-<br>
&nbsp;recipes-bsp/udma-lld/udma-lld-rtos_git.bb&nbsp;&nbsp;&nbsp;&nbsp; |&n=
bsp;&nbsp; 6 &#43;-<br>
&nbsp;.../uio-module-drv/uio-module-drv-test_git.bb |&nbsp; 12 &#43;-<br>
&nbsp;.../uio-module-drv/uio-module-drv_git.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; |&nbsp;&nbsp; 6 &#43;-<br>
&nbsp;recipes-bsp/usb-lld/usb-lld-rtos_git.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; |&nbsp;&nbsp; 8 &#43;-<br>
&nbsp;recipes-bsp/vis-fw/vis_01.50.07.15.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; |&nbsp;&nbsp; 8 &#43;-<br>
&nbsp;recipes-bsp/vpdma-fw/vpdma-fw_03-2012.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; |&nbsp;&nbsp; 2 &#43;-<br>
&nbsp;recipes-bsp/vps-lld/vps-lld-rtos_git.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; |&nbsp;&nbsp; 6 &#43;-<br>
&nbsp;recipes-bsp/wl18xx-fw/wl18xx-fw_8.9.0.0.86.bb |&nbsp;&nbsp; 2 &#43;-<=
br>
&nbsp;recipes-bsp/x-load/x-load.inc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 2 &#=
43;-<br>
&nbsp;recipes-bsp/x-load/x-load_1.46-psp.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; |&nbsp;&nbsp; 4 &#43;-<br>
&nbsp;recipes-bsp/x-load/x-load_git.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 4 &#43;-<br>
&nbsp;.../wl18xx-calibrator_8.7.3.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 2 &#43;-<=
br>
&nbsp;.../wl18xx-target-scripts_8.7.3.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 2 &#43;-<br>
&nbsp;recipes-connectivity/wlconf/wlconf_8.7.3.bb&nbsp;&nbsp; |&nbsp;&nbsp;=
 4 &#43;-<br>
&nbsp;.../init-ifupdown/init-ifupdown_1.0.bbappend&nbsp; |&nbsp;&nbsp; 2 &#=
43;-<br>
&nbsp;recipes-core/udev/eudev_%.bbappend&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 8 &#43;-<br>
&nbsp;recipes-devtools/gdbc6x/gdbc6x_git.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; |&nbsp;&nbsp; 4 &#43;-<br>
&nbsp;recipes-devtools/gdbc6x/gdbserver-c6x_git.bb&nbsp; |&nbsp;&nbsp; 4 &#=
43;-<br>
&nbsp;.../gdbc6x/gdbserverproxy-module-drv_git.bb&nbsp;&nbsp; |&nbsp;&nbsp;=
 4 &#43;-<br>
&nbsp;.../libgal/ti-gc320-libs_5.0.11.p7.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; |&nbsp;&nbsp; 4 &#43;-<br>
&nbsp;.../ti-img-rogue-umlibs_1.13.5776728.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; |&nbsp; 38 &#43;&#43;&#43;---<br>
&nbsp;.../libgles/ti-sgx-ddk-um_1.17.4948957.bb&nbsp;&nbsp;&nbsp;&nbsp; |&n=
bsp; 36 &#43;&#43;&#43;---<br>
&nbsp;recipes-kernel/kselftests/kselftests_4.10.bb&nbsp; | 122 &#43;&#43;&#=
43;&#43;&#43;&#43;&#43;&#43;&#43;---------<br>
&nbsp;recipes-kernel/linux/bundle-devicetree.inc&nbsp;&nbsp;&nbsp; |&nbsp;&=
nbsp; 2 &#43;-<br>
&nbsp;recipes-kernel/linux/kernel-rdepends.inc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; |&nbsp; 40 &#43;&#43;&#43;---<br>
&nbsp;recipes-kernel/linux/linux-ti-mainline_git.bb |&nbsp; 12 &#43;-<br>
&nbsp;.../linux/linux-ti-staging-rt_5.10.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; |&nbsp;&nbsp; 2 &#43;-<br>
&nbsp;.../linux/linux-ti-staging-rt_5.4.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 2 &#43;-<br>
&nbsp;.../linux/linux-ti-staging-systest_5.10.bb&nbsp;&nbsp;&nbsp; |&nbsp;&=
nbsp; 2 &#43;-<br>
&nbsp;.../linux/linux-ti-staging-systest_5.4.bb&nbsp;&nbsp;&nbsp;&nbsp; |&n=
bsp;&nbsp; 2 &#43;-<br>
&nbsp;recipes-kernel/linux/linux-ti-staging_5.10.bb |&nbsp;&nbsp; 8 &#43;-<=
br>
&nbsp;recipes-kernel/linux/linux-ti-staging_5.4.bb&nbsp; |&nbsp;&nbsp; 8 &#=
43;-<br>
&nbsp;recipes-kernel/linux/ti-uio.inc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 32 &#43;&#43;---<br>
&nbsp;recipes-security/optee/optee-os_%.bbappend&nbsp;&nbsp;&nbsp; |&nbsp; =
22 &#43;&#43;--<br>
&nbsp;recipes-ti/beagleboard/beaglebone-capes.bb&nbsp;&nbsp;&nbsp; |&nbsp;&=
nbsp; 2 &#43;-<br>
&nbsp;.../beagleboard/beaglebone-getting-started.bb |&nbsp;&nbsp; 4 &#43;-<=
br>
&nbsp;recipes-ti/beagleboard/gadget-init.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; |&nbsp; 10 &#43;-<br>
&nbsp;recipes-ti/bios/ti-biosutils_1.02.02.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; |&nbsp;&nbsp; 2 &#43;-<br>
&nbsp;recipes-ti/bios/ti-sysbios.inc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 6 &#43;-<=
br>
&nbsp;.../ti-codec-engine_3.24.00.08.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 4 &#43;-<br>
&nbsp;recipes-ti/ctoolslib/libaet_git.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 4 &#43;-<br>
&nbsp;.../gcc-arm-baremetal_7-2018-q2-update.bb&nbsp;&nbsp;&nbsp;&nbsp; |&n=
bsp;&nbsp; 6 &#43;-<br>
&nbsp;.../gcc-linaro-baremetal-aarch64-native.bb&nbsp;&nbsp;&nbsp; |&nbsp;&=
nbsp; 8 &#43;-<br>
&nbsp;.../devtools/gcc-linaro-baremetal-native.bb&nbsp;&nbsp; |&nbsp;&nbsp;=
 8 &#43;-<br>
&nbsp;recipes-ti/devtools/ti-cg-xml_2.61.00.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; |&nbsp;&nbsp; 4 &#43;-<br>
&nbsp;recipes-ti/devtools/ti-cgt-arm_18.12.5.bb&nbsp;&nbsp;&nbsp;&nbsp; |&n=
bsp;&nbsp; 8 &#43;-<br>
&nbsp;recipes-ti/devtools/ti-cgt-pru_2.3.2.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; |&nbsp; 16 &#43;--<br>
&nbsp;recipes-ti/devtools/ti-cgt470.inc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 2 &#43;-<br>
&nbsp;recipes-ti/devtools/ti-cgt6x-7_7.4.16.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; |&nbsp;&nbsp; 6 &#43;-<br>
&nbsp;recipes-ti/devtools/ti-cgt6x_8.3.2.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; |&nbsp; 22 &#43;&#43;--<br>
&nbsp;recipes-ti/devtools/ti-cgt7x_1.2.0.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; |&nbsp;&nbsp; 8 &#43;-<br>
&nbsp;recipes-ti/devtools/ti-xdctools-common.inc&nbsp;&nbsp;&nbsp; |&nbsp;&=
nbsp; 8 &#43;-<br>
&nbsp;recipes-ti/dmai/ti-dmai.inc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; =
38 &#43;&#43;&#43;---<br>
&nbsp;recipes-ti/dmai/ti-dmai_svn.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 6 &#43;-<=
br>
&nbsp;recipes-ti/dsplib/dsplib.inc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;=
 8 &#43;-<br>
&nbsp;.../ti-framework-components.inc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 6 &#43;-<br>
&nbsp;recipes-ti/imglib/imglib-c66x.inc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 8 &#43;-<br>
&nbsp;recipes-ti/includes/ti-staging.inc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 4 &#43;-<br>
&nbsp;recipes-ti/includes/ti-unpack.inc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 4 &#43;-<br>
&nbsp;.../ipc/ipc-transport-common-rtos_git.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; |&nbsp;&nbsp; 2 &#43;-<br>
&nbsp;recipes-ti/ipc/ipc-transport-qmss-rtos_git.bb |&nbsp;&nbsp; 4 &#43;-<=
br>
&nbsp;recipes-ti/ipc/ipc-transport-qmss.inc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; |&nbsp;&nbsp; 2 &#43;-<br>
&nbsp;recipes-ti/ipc/ipc-transport-srio-rtos_git.bb |&nbsp;&nbsp; 4 &#43;-<=
br>
&nbsp;recipes-ti/ipc/ipc-transport-srio.inc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; |&nbsp;&nbsp; 2 &#43;-<br>
&nbsp;recipes-ti/ipc/ti-ipc-examples-linux_git.bb&nbsp;&nbsp; |&nbsp;&nbsp;=
 6 &#43;-<br>
&nbsp;recipes-ti/ipc/ti-ipc-examples.inc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 4 &#43;-<br>
&nbsp;recipes-ti/ipc/ti-ipc-examples_git.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; |&nbsp;&nbsp; 6 &#43;-<br>
&nbsp;recipes-ti/ipc/ti-ipc-rtos.inc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 8 &#43;-<=
br>
&nbsp;recipes-ti/ipc/ti-ipc-rtos_git.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 22 &#43;&#43;--<br>
&nbsp;recipes-ti/ipc/ti-ipc_git.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 10 &#=
43;-<br>
&nbsp;recipes-ti/linuxutils/ti-linuxutils.inc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; |&nbsp; 14 &#43;-<br>
&nbsp;.../linuxutils/ti-linuxutils_2.26.01.02.bb&nbsp;&nbsp;&nbsp; |&nbsp;&=
nbsp; 2 &#43;-<br>
&nbsp;recipes-ti/mathlib/mathlib.inc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 8 &#43;-<=
br>
&nbsp;recipes-ti/mpm-transport/mpm-transport_git.bb |&nbsp; 12 &#43;-<br>
&nbsp;.../multiprocmgr/multiprocmgr-rtos_git.bb&nbsp;&nbsp;&nbsp;&nbsp; |&n=
bsp; 12 &#43;-<br>
&nbsp;.../multiprocmgr/multiprocmgr-test_git.bb&nbsp;&nbsp;&nbsp;&nbsp; |&n=
bsp; 10 &#43;-<br>
&nbsp;recipes-ti/multiprocmgr/multiprocmgr_git.bb&nbsp;&nbsp; |&nbsp;&nbsp;=
 4 &#43;-<br>
&nbsp;recipes-ti/ndk/ti-ndk.inc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; |&nbsp;&nbsp; 6 &#43;-<br>
&nbsp;recipes-ti/ns/ti-ns.inc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; |&nbsp;&nbsp; 6 &#43;-<br>
&nbsp;recipes-ti/openmp-rtos/openmp-rtos_git.bb&nbsp;&nbsp;&nbsp;&nbsp; |&n=
bsp; 12 &#43;-<br>
&nbsp;recipes-ti/osal/ti-osal.inc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&=
nbsp; 6 &#43;-<br>
&nbsp;recipes-ti/swtools/swtools_git.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 8 &#43;-<br>
&nbsp;.../ti-pdk-build/ti-pdk-build-rtos_git.bb&nbsp;&nbsp;&nbsp;&nbsp; |&n=
bsp;&nbsp; 4 &#43;-<br>
&nbsp;recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb&nbsp;&nbsp;&nbsp; |&nbsp; =
20 &#43;--<br>
&nbsp;recipes-ti/udma/udma_git.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&=
nbsp; 4 &#43;-<br>
&nbsp;.../uio-test-pruss/uio-test-pruss_git.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; |&nbsp;&nbsp; 8 &#43;-<br>
&nbsp;recipes-ti/vlib/vlib-c66x.inc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 6 &#=
43;-<br>
&nbsp;recipes-ti/xdais/ti-xdais.inc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 6 &#=
43;-<br>
&nbsp;recipes-ti/xdais/ti-xdais_6.26.01.03.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; |&nbsp;&nbsp; 2 &#43;-<br>
&nbsp;251 files changed, 833 insertions(&#43;), 833 deletions(-)<br>
<br>
diff --git a/classes/ti-pdk-fetch.bbclass b/classes/ti-pdk-fetch.bbclass<br=
>
index cacd71a4..e4c55e33 100644<br>
--- a/classes/ti-pdk-fetch.bbclass<br>
&#43;&#43;&#43; b/classes/ti-pdk-fetch.bbclass<br>
@@ -18,7 &#43;18,7 @@ TI_PDK_SOURCE =3D &quot;${TI_PDK_SOURCE_WORKDIR}/git&=
quot;<br>
&nbsp;S =3D &quot;${@'${WORKDIR}/git/${TI_PDK_COMP_PATH}'.rstrip('/')}&quot=
;<br>
&nbsp;<br>
&nbsp;# Hard-link only required sources from PDK<br>
-python do_unpack_append() {<br>
&#43;python do_unpack:append() {<br>
&nbsp;&nbsp;&nbsp;&nbsp; if len(d.getVar('TI_PDK_COMP') or '') &gt; 0:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; import shutil<br>
&nbsp;<br>
diff --git a/classes/ti-pdk.bbclass b/classes/ti-pdk.bbclass<br>
index 68314215..21dd3ade 100644<br>
--- a/classes/ti-pdk.bbclass<br>
&#43;&#43;&#43; b/classes/ti-pdk.bbclass<br>
@@ -5,14 &#43;5,14 @@ inherit perlnative<br>
&nbsp;<br>
&nbsp;DEPENDS =3D &quot;ti-xdctools-native ti-cg-xml-native ti-sysbios comm=
on-csl-ip-rtos libxml-simple-perl-native gcc-arm-baremetal-native ti-cgt6x-=
native ti-cgt-pru-native ti-pdk-build-rtos doxygen-native&quot;<br>
&nbsp;<br>
-DEPENDS_append_omap-a15 =3D &quot; ti-cgt-arm-native&quot;<br>
-DEPENDS_remove_ti33x =3D &quot;ti-cgt6x-native&quot;<br>
-DEPENDS_remove_ti43x =3D &quot;ti-cgt6x-native&quot;<br>
-DEPENDS_append_omapl1 =3D &quot; ti-cgt-arm-native&quot;<br>
-DEPENDS_remove_am65xx =3D &quot;gcc-arm-baremetal-native ti-cgt6x-native&q=
uot;<br>
-DEPENDS_append_am65xx =3D &quot; ti-cgt-arm-native gcc-linaro-baremetal-aa=
rch64-native&quot;<br>
-DEPENDS_remove_j7 =3D &quot;gcc-arm-baremetal-native&quot;<br>
-DEPENDS_append_j7 =3D &quot; ti-cgt-arm-native gcc-linaro-baremetal-aarch6=
4-native ti-cgt7x-native&quot;<br>
&#43;DEPENDS:append_omap-a15 =3D &quot; ti-cgt-arm-native&quot;<br>
&#43;DEPENDS:remove_ti33x =3D &quot;ti-cgt6x-native&quot;<br>
&#43;DEPENDS:remove_ti43x =3D &quot;ti-cgt6x-native&quot;<br>
&#43;DEPENDS:append_omapl1 =3D &quot; ti-cgt-arm-native&quot;<br>
&#43;DEPENDS:remove_am65xx =3D &quot;gcc-arm-baremetal-native ti-cgt6x-nati=
ve&quot;<br>
&#43;DEPENDS:append_am65xx =3D &quot; ti-cgt-arm-native gcc-linaro-baremeta=
l-aarch64-native&quot;<br>
&#43;DEPENDS:remove_j7 =3D &quot;gcc-arm-baremetal-native&quot;<br>
&#43;DEPENDS:append_j7 =3D &quot; ti-cgt-arm-native gcc-linaro-baremetal-aa=
rch64-native ti-cgt7x-native&quot;<br>
&nbsp;<br>
&nbsp;S =3D &quot;${WORKDIR}/git&quot;<br>
&nbsp;B =3D &quot;${WORKDIR}/build&quot;<br>
@@ -141,4 &#43;141,4 @@ do_install () {<br>
&nbsp;&nbsp;&nbsp;&nbsp; fi<br>
&nbsp;}<br>
&nbsp;<br>
-FILES_${PN} &#43;=3D &quot;${PDK_INSTALL_DIR_RECIPE}/packages&quot;<br>
&#43;FILES:${PN} &#43;=3D &quot;${PDK_INSTALL_DIR_RECIPE}/packages&quot;<br=
>
diff --git a/conf/machine/am3517-evm.conf b/conf/machine/am3517-evm.conf<br=
>
index c20e2f6a..f194c648 100644<br>
--- a/conf/machine/am3517-evm.conf<br>
&#43;&#43;&#43; b/conf/machine/am3517-evm.conf<br>
@@ -8,7 &#43;8,7 @@ MACHINE_GUI_CLASS =3D &quot;smallscreen&quot;<br>
&nbsp;MACHINE_FEATURES &#43;=3D &quot;touchscreen ethernet&quot;<br>
&nbsp;<br>
&nbsp;IMAGE_FSTYPES &#43;=3D &quot;ubi tar.xz&quot;<br>
-EXTRA_IMAGECMD_jffs2 =3D &quot;-lnp -e 0x20000 -s 2048&quot;<br>
&#43;EXTRA_IMAGECMD:jffs2 =3D &quot;-lnp -e 0x20000 -s 2048&quot;<br>
&nbsp;<br>
&nbsp;SERIAL_CONSOLES =3D &quot;115200;ttyS2&quot;<br>
&nbsp;USE_VT =3D &quot;2&quot;<br>
diff --git a/conf/machine/am37x-evm.conf b/conf/machine/am37x-evm.conf<br>
index a512c8d0..9750fe64 100644<br>
--- a/conf/machine/am37x-evm.conf<br>
&#43;&#43;&#43; b/conf/machine/am37x-evm.conf<br>
@@ -8,7 &#43;8,7 @@ MACHINE_GUI_CLASS =3D &quot;smallscreen&quot;<br>
&nbsp;MACHINE_FEATURES &#43;=3D &quot;touchscreen ethernet&quot;<br>
&nbsp;<br>
&nbsp;IMAGE_FSTYPES &#43;=3D &quot;ubi tar.xz&quot;<br>
-EXTRA_IMAGECMD_jffs2 =3D &quot;-lnp -e 0x20000 -s 2048&quot;<br>
&#43;EXTRA_IMAGECMD:jffs2 =3D &quot;-lnp -e 0x20000 -s 2048&quot;<br>
&nbsp;<br>
&nbsp;KERNEL_DEVICETREE =3D &quot;omap3-evm-37xx.dtb&quot;<br>
&nbsp;<br>
diff --git a/conf/machine/am65xx-evm-k3r5-sr2.conf b/conf/machine/am65xx-ev=
m-k3r5-sr2.conf<br>
index c0b3cd51..e74dd3ab 100644<br>
--- a/conf/machine/am65xx-evm-k3r5-sr2.conf<br>
&#43;&#43;&#43; b/conf/machine/am65xx-evm-k3r5-sr2.conf<br>
@@ -5,7 &#43;5,7 @@<br>
&nbsp;# Booting SR2 requires different SYSFW, the rest is handled at runtim=
e<br>
&nbsp;<br>
&nbsp;require conf/machine/am65xx-evm-k3r5.conf<br>
-SOC_FAMILY_append =3D &quot;:k3r5-sr2&quot;<br>
&#43;SOC_FAMILY:append =3D &quot;:k3r5-sr2&quot;<br>
&nbsp;<br>
&nbsp;SYSFW_SOC =3D &quot;am65x_sr2&quot;<br>
&nbsp;SYSFW_SYMLINK =3D &quot;sysfw.itb&quot;<br>
diff --git a/conf/machine/am65xx-hs-evm-k3r5-sr2.conf b/conf/machine/am65xx=
-hs-evm-k3r5-sr2.conf<br>
index ef1b6fbe..ff1645e4 100644<br>
--- a/conf/machine/am65xx-hs-evm-k3r5-sr2.conf<br>
&#43;&#43;&#43; b/conf/machine/am65xx-hs-evm-k3r5-sr2.conf<br>
@@ -5,7 &#43;5,7 @@<br>
&nbsp;# Booting SR2 requires different SYSFW, the rest is handled at runtim=
e<br>
&nbsp;<br>
&nbsp;require conf/machine/am65xx-hs-evm-k3r5.conf<br>
-SOC_FAMILY_append =3D &quot;:k3r5-sr2&quot;<br>
&#43;SOC_FAMILY:append =3D &quot;:k3r5-sr2&quot;<br>
&nbsp;<br>
&nbsp;SYSFW_SOC =3D &quot;am65x_sr2&quot;<br>
&nbsp;SYSFW_SYMLINK =3D &quot;sysfw.itb&quot;<br>
diff --git a/conf/machine/beagleboard.conf b/conf/machine/beagleboard.conf<=
br>
index ee51fd66..06777795 100644<br>
--- a/conf/machine/beagleboard.conf<br>
&#43;&#43;&#43; b/conf/machine/beagleboard.conf<br>
@@ -8,7 &#43;8,7 @@ require conf/machine/include/omap3.inc<br>
&nbsp;MACHINE_GUI_CLASS =3D &quot;bigscreen&quot;<br>
&nbsp;<br>
&nbsp;IMAGE_FSTYPES &#43;=3D &quot;tar.xz ubi&quot;<br>
-EXTRA_IMAGECMD_jffs2 =3D &quot;-lnp&quot;<br>
&#43;EXTRA_IMAGECMD:jffs2 =3D &quot;-lnp&quot;<br>
&nbsp;<br>
&nbsp;KERNEL_DEVICETREE =3D &quot;omap3-beagle.dtb omap3-beagle-xm.dtb omap=
3-beagle-xm-ab.dtb&quot;<br>
&nbsp;<br>
diff --git a/conf/machine/beaglebone.conf b/conf/machine/beaglebone.conf<br=
>
index 896a9d73..dcb14cc9 100644<br>
--- a/conf/machine/beaglebone.conf<br>
&#43;&#43;&#43; b/conf/machine/beaglebone.conf<br>
@@ -13,7 &#43;13,7 @@ MACHINE_GUI_CLASS =3D &quot;bigscreen&quot;<br>
&nbsp;<br>
&nbsp;SERIAL_CONSOLES =3D &quot;115200;ttyS0&quot;<br>
&nbsp;<br>
-IMAGE_INSTALL_append =3D &quot; kernel-devicetree kernel-image-zimage&quot=
;<br>
&#43;IMAGE_INSTALL:append =3D &quot; kernel-devicetree kernel-image-zimage&=
quot;<br>
&nbsp;<br>
&nbsp;# Refine the list of device targets for ti-pdk class recipes<br>
&nbsp;TI_PDK_LIMIT_BOARDS =3D &quot;bbbAM335x&quot;<br>
diff --git a/conf/machine/include/am64xx.inc b/conf/machine/include/am64xx.=
inc<br>
index 95fdc79d..18e3757a 100644<br>
--- a/conf/machine/include/am64xx.inc<br>
&#43;&#43;&#43; b/conf/machine/include/am64xx.inc<br>
@@ -1,5 &#43;1,5 @@<br>
&nbsp;require conf/machine/include/k3.inc<br>
-SOC_FAMILY_append =3D &quot;:am64xx&quot;<br>
&#43;SOC_FAMILY:append =3D &quot;:am64xx&quot;<br>
&nbsp;<br>
&nbsp;MACHINE_FEATURES &#43;=3D &quot;screen touchscreen&quot;<br>
&nbsp;<br>
diff --git a/conf/machine/include/am65xx.inc b/conf/machine/include/am65xx.=
inc<br>
index 8516ca4c..2838c58f 100644<br>
--- a/conf/machine/include/am65xx.inc<br>
&#43;&#43;&#43; b/conf/machine/include/am65xx.inc<br>
@@ -1,5 &#43;1,5 @@<br>
&nbsp;require conf/machine/include/k3.inc<br>
-SOC_FAMILY_append =3D &quot;:am65xx&quot;<br>
&#43;SOC_FAMILY:append =3D &quot;:am65xx&quot;<br>
&nbsp;<br>
&nbsp;MACHINE_FEATURES &#43;=3D &quot;screen touchscreen gpu&quot;<br>
&nbsp;<br>
diff --git a/conf/machine/include/c66x.inc b/conf/machine/include/c66x.inc<=
br>
index e35f2eda..33a657f1 100644<br>
--- a/conf/machine/include/c66x.inc<br>
&#43;&#43;&#43; b/conf/machine/include/c66x.inc<br>
@@ -1,5 &#43;1,5 @@<br>
&nbsp;require conf/machine/include/keystone.inc<br>
-SOC_FAMILY_append =3D &quot;:c66x&quot;<br>
&#43;SOC_FAMILY:append =3D &quot;:c66x&quot;<br>
&nbsp;<br>
&nbsp;# HACK: The c66x family is composed of devices with only DSP cores, a=
nd no ARM<br>
&nbsp;#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cores. The Linux kernel is not =
supported on these machines.<br>
diff --git a/conf/machine/include/davinci.inc b/conf/machine/include/davinc=
i.inc<br>
index 62ca6887..d2681740 100644<br>
--- a/conf/machine/include/davinci.inc<br>
&#43;&#43;&#43; b/conf/machine/include/davinci.inc<br>
@@ -17,6 &#43;17,6 @@ UBOOT_LOADADDRESS =3D &quot;0x80008000&quot;<br>
&nbsp;EXTRA_IMAGEDEPENDS &#43;=3D &quot;u-boot&quot;<br>
&nbsp;<br>
&nbsp;SERIAL_CONSOLES ?=3D &quot;115200;ttyS0&quot;<br>
-EXTRA_IMAGECMD_jffs2 =3D &quot;--pad --little-endian --eraseblock=3D0x2000=
0 -n&quot;<br>
&#43;EXTRA_IMAGECMD:jffs2 =3D &quot;--pad --little-endian --eraseblock=3D0x=
20000 -n&quot;<br>
&nbsp;<br>
&nbsp;MACHINE_FEATURES =3D &quot;kernel26 serial ethernet usbhost usbgadget=
 mmc alsa&quot;<br>
diff --git a/conf/machine/include/dra7xx.inc b/conf/machine/include/dra7xx.=
inc<br>
index 857e1b35..a02421d9 100644<br>
--- a/conf/machine/include/dra7xx.inc<br>
&#43;&#43;&#43; b/conf/machine/include/dra7xx.inc<br>
@@ -1,4 &#43;1,4 @@<br>
&nbsp;require conf/machine/include/omap-a15.inc<br>
-SOC_FAMILY_append =3D &quot;:dra7xx&quot;<br>
&#43;SOC_FAMILY:append =3D &quot;:dra7xx&quot;<br>
&nbsp;<br>
&nbsp;MACHINE_FEATURES &#43;=3D &quot;pci&quot;<br>
diff --git a/conf/machine/include/j7.inc b/conf/machine/include/j7.inc<br>
index d3eda1a8..cf5f6a94 100644<br>
--- a/conf/machine/include/j7.inc<br>
&#43;&#43;&#43; b/conf/machine/include/j7.inc<br>
@@ -1,5 &#43;1,5 @@<br>
&nbsp;require conf/machine/include/k3.inc<br>
-SOC_FAMILY_append =3D &quot;:j7&quot;<br>
&#43;SOC_FAMILY:append =3D &quot;:j7&quot;<br>
&nbsp;<br>
&nbsp;OPTEEMACHINE =3D &quot;k3-j721e&quot;<br>
&nbsp;OPTEEOUTPUTMACHINE =3D &quot;k3&quot;<br>
diff --git a/conf/machine/include/k2e.inc b/conf/machine/include/k2e.inc<br=
>
index 6797fb29..a6d58bb3 100644<br>
--- a/conf/machine/include/k2e.inc<br>
&#43;&#43;&#43; b/conf/machine/include/k2e.inc<br>
@@ -1,5 &#43;1,5 @@<br>
&nbsp;require conf/machine/include/keystone.inc<br>
-SOC_FAMILY_append =3D &quot;:k2e&quot;<br>
&#43;SOC_FAMILY:append =3D &quot;:k2e&quot;<br>
&nbsp;<br>
&nbsp;# Set the list of device targets for ti-pdk class recipes<br>
&nbsp;TI_PDK_LIMIT_SOCS =3D &quot;k2e&quot;<br>
diff --git a/conf/machine/include/k2g.inc b/conf/machine/include/k2g.inc<br=
>
index 7bcc412b..be40d9e7 100644<br>
--- a/conf/machine/include/k2g.inc<br>
&#43;&#43;&#43; b/conf/machine/include/k2g.inc<br>
@@ -1,5 &#43;1,5 @@<br>
&nbsp;require conf/machine/include/keystone.inc<br>
-SOC_FAMILY_append =3D &quot;:k2g&quot;<br>
&#43;SOC_FAMILY:append =3D &quot;:k2g&quot;<br>
&nbsp;<br>
&nbsp;# Set the list of device targets for ti-pdk class recipes<br>
&nbsp;TI_PDK_LIMIT_SOCS =3D &quot;k2g&quot;<br>
diff --git a/conf/machine/include/k2hk.inc b/conf/machine/include/k2hk.inc<=
br>
index 2d2dd6a0..456fda75 100644<br>
--- a/conf/machine/include/k2hk.inc<br>
&#43;&#43;&#43; b/conf/machine/include/k2hk.inc<br>
@@ -1,5 &#43;1,5 @@<br>
&nbsp;require conf/machine/include/keystone.inc<br>
-SOC_FAMILY_append =3D &quot;:k2hk&quot;<br>
&#43;SOC_FAMILY:append =3D &quot;:k2hk&quot;<br>
&nbsp;<br>
&nbsp;# Set the list of device targets for ti-pdk class recipes<br>
&nbsp;TI_PDK_LIMIT_SOCS =3D &quot;k2h k2k&quot;<br>
diff --git a/conf/machine/include/k2l.inc b/conf/machine/include/k2l.inc<br=
>
index 997bcbe2..b6a4bc7d 100644<br>
--- a/conf/machine/include/k2l.inc<br>
&#43;&#43;&#43; b/conf/machine/include/k2l.inc<br>
@@ -1,5 &#43;1,5 @@<br>
&nbsp;require conf/machine/include/keystone.inc<br>
-SOC_FAMILY_append =3D &quot;:k2l&quot;<br>
&#43;SOC_FAMILY:append =3D &quot;:k2l&quot;<br>
&nbsp;<br>
&nbsp;# Set the list of device targets for ti-pdk class recipes<br>
&nbsp;TI_PDK_LIMIT_SOCS =3D &quot;k2l&quot;<br>
diff --git a/conf/machine/include/k3.inc b/conf/machine/include/k3.inc<br>
index e0970698..20ab7a9e 100644<br>
--- a/conf/machine/include/k3.inc<br>
&#43;&#43;&#43; b/conf/machine/include/k3.inc<br>
@@ -1,7 &#43;1,7 @@<br>
&nbsp;# TI K3 Aarch64 profile for Cortex-A53/A72 cores<br>
&nbsp;<br>
&nbsp;require conf/machine/include/ti-soc.inc<br>
-SOC_FAMILY_append =3D &quot;:k3&quot;<br>
&#43;SOC_FAMILY:append =3D &quot;:k3&quot;<br>
&nbsp;<br>
&nbsp;require conf/machine/include/arm/arch-arm64.inc<br>
&nbsp;<br>
diff --git a/conf/machine/include/k3r5.inc b/conf/machine/include/k3r5.inc<=
br>
index a32accae..93f08c04 100644<br>
--- a/conf/machine/include/k3r5.inc<br>
&#43;&#43;&#43; b/conf/machine/include/k3r5.inc<br>
@@ -1,7 &#43;1,7 @@<br>
&nbsp;# TI K3 Armv7 profile for Cortex-R5F cores<br>
&nbsp;<br>
&nbsp;require conf/machine/include/ti-soc.inc<br>
-SOC_FAMILY_append =3D &quot;:k3r5&quot;<br>
&#43;SOC_FAMILY:append =3D &quot;:k3r5&quot;<br>
&nbsp;<br>
&nbsp;# The closest of existing tunes for Cortex-R5F<br>
&nbsp;DEFAULTTUNE =3D &quot;armv7athf&quot;<br>
@@ -20,5 &#43;20,5 @@ UBOOT_BINARY =3D &quot;tiboot3.${UBOOT_SUFFIX}&quot;<=
br>
&nbsp;UBOOT_IMAGE =3D &quot;tiboot3-${MAINMACHINE}-${PV}-${PR}.${UBOOT_SUFF=
IX}&quot;<br>
&nbsp;UBOOT_SYMLINK =3D &quot;tiboot3-${MAINMACHINE}.${UBOOT_SUFFIX}&quot;<=
br>
&nbsp;<br>
-PACKAGECONFIG_pn-u-boot-ti-staging =3D &quot;&quot;<br>
-PACKAGECONFIG_pn-u-boot-ti-mainline =3D &quot;&quot;<br>
&#43;PACKAGECONFIG:pn-u-boot-ti-staging =3D &quot;&quot;<br>
&#43;PACKAGECONFIG:pn-u-boot-ti-mainline =3D &quot;&quot;<br>
diff --git a/conf/machine/include/keystone.inc b/conf/machine/include/keyst=
one.inc<br>
index e7ea9758..83dca19d 100644<br>
--- a/conf/machine/include/keystone.inc<br>
&#43;&#43;&#43; b/conf/machine/include/keystone.inc<br>
@@ -1,5 &#43;1,5 @@<br>
&nbsp;require conf/machine/include/ti-soc.inc<br>
-SOC_FAMILY_append =3D &quot;:keystone&quot;<br>
&#43;SOC_FAMILY:append =3D &quot;:keystone&quot;<br>
&nbsp;<br>
&nbsp;DEFAULTTUNE ?=3D &quot;armv7athf-neon&quot;<br>
&nbsp;require conf/machine/include/tune-cortexa15.inc<br>
diff --git a/conf/machine/include/omap-a15.inc b/conf/machine/include/omap-=
a15.inc<br>
index e491d2b5..553835c8 100644<br>
--- a/conf/machine/include/omap-a15.inc<br>
&#43;&#43;&#43; b/conf/machine/include/omap-a15.inc<br>
@@ -1,5 &#43;1,5 @@<br>
&nbsp;require conf/machine/include/ti-soc.inc<br>
-SOC_FAMILY_append =3D &quot;:omap-a15&quot;<br>
&#43;SOC_FAMILY:append =3D &quot;:omap-a15&quot;<br>
&nbsp;<br>
&nbsp;DEFAULTTUNE ?=3D &quot;armv7athf-neon&quot;<br>
&nbsp;require conf/machine/include/tune-cortexa15.inc<br>
diff --git a/conf/machine/include/omap3.inc b/conf/machine/include/omap3.in=
c<br>
index 5696c82d..ab069b00 100644<br>
--- a/conf/machine/include/omap3.inc<br>
&#43;&#43;&#43; b/conf/machine/include/omap3.inc<br>
@@ -1,5 &#43;1,5 @@<br>
&nbsp;require conf/machine/include/ti-soc.inc<br>
-SOC_FAMILY_append =3D &quot;:omap3&quot;<br>
&#43;SOC_FAMILY:append =3D &quot;:omap3&quot;<br>
&nbsp;<br>
&nbsp;DEFAULTTUNE ?=3D &quot;armv7athf-neon&quot;<br>
&nbsp;require conf/machine/include/tune-cortexa8.inc<br>
diff --git a/conf/machine/include/omap4.inc b/conf/machine/include/omap4.in=
c<br>
index cbca267c..b6f43744 100644<br>
--- a/conf/machine/include/omap4.inc<br>
&#43;&#43;&#43; b/conf/machine/include/omap4.inc<br>
@@ -1,5 &#43;1,5 @@<br>
&nbsp;require conf/machine/include/ti-soc.inc<br>
-SOC_FAMILY_append =3D &quot;:omap4&quot;<br>
&#43;SOC_FAMILY:append =3D &quot;:omap4&quot;<br>
&nbsp;<br>
&nbsp;DEFAULTTUNE ?=3D &quot;armv7athf-neon&quot;<br>
&nbsp;require conf/machine/include/tune-cortexa9.inc<br>
diff --git a/conf/machine/include/omapl1.inc b/conf/machine/include/omapl1.=
inc<br>
index 9942c944..d0262c3f 100644<br>
--- a/conf/machine/include/omapl1.inc<br>
&#43;&#43;&#43; b/conf/machine/include/omapl1.inc<br>
@@ -1,2 &#43;1,2 @@<br>
&nbsp;require conf/machine/include/ti-soc.inc<br>
-SOC_FAMILY_append =3D &quot;:omapl1&quot;<br>
&#43;SOC_FAMILY:append =3D &quot;:omapl1&quot;<br>
diff --git a/conf/machine/include/omapl137.inc b/conf/machine/include/omapl=
137.inc<br>
index 5d8a6dd8..6dd49418 100644<br>
--- a/conf/machine/include/omapl137.inc<br>
&#43;&#43;&#43; b/conf/machine/include/omapl137.inc<br>
@@ -1,5 &#43;1,5 @@<br>
&nbsp;require conf/machine/include/omapl1.inc<br>
-SOC_FAMILY_append =3D &quot;:omapl137&quot;<br>
&#43;SOC_FAMILY:append =3D &quot;:omapl137&quot;<br>
&nbsp;<br>
&nbsp;# Set the list of device targets for ti-pdk class recipes<br>
&nbsp;TI_PDK_LIMIT_SOCS =3D &quot;omapl137&quot;<br>
diff --git a/conf/machine/include/omapl138.inc b/conf/machine/include/omapl=
138.inc<br>
index 999cbc3a..f73517d0 100644<br>
--- a/conf/machine/include/omapl138.inc<br>
&#43;&#43;&#43; b/conf/machine/include/omapl138.inc<br>
@@ -1,5 &#43;1,5 @@<br>
&nbsp;require conf/machine/include/omapl1.inc<br>
-SOC_FAMILY_append =3D &quot;:omapl138&quot;<br>
&#43;SOC_FAMILY:append =3D &quot;:omapl138&quot;<br>
&nbsp;<br>
&nbsp;# Set the list of device targets for ti-pdk class recipes<br>
&nbsp;TI_PDK_LIMIT_SOCS =3D &quot;omapl138&quot;<br>
diff --git a/conf/machine/include/ti33x.inc b/conf/machine/include/ti33x.in=
c<br>
index 6dfda754..3da2aba5 100644<br>
--- a/conf/machine/include/ti33x.inc<br>
&#43;&#43;&#43; b/conf/machine/include/ti33x.inc<br>
@@ -1,5 &#43;1,5 @@<br>
&nbsp;require conf/machine/include/ti-soc.inc<br>
-SOC_FAMILY_append =3D &quot;:ti33x&quot;<br>
&#43;SOC_FAMILY:append =3D &quot;:ti33x&quot;<br>
&nbsp;<br>
&nbsp;DEFAULTTUNE ?=3D &quot;armv7athf-neon&quot;<br>
&nbsp;require conf/machine/include/tune-cortexa8.inc<br>
diff --git a/conf/machine/include/ti43x.inc b/conf/machine/include/ti43x.in=
c<br>
index b1a27f93..eaed1812 100644<br>
--- a/conf/machine/include/ti43x.inc<br>
&#43;&#43;&#43; b/conf/machine/include/ti43x.inc<br>
@@ -1,5 &#43;1,5 @@<br>
&nbsp;require conf/machine/include/ti-soc.inc<br>
-SOC_FAMILY_append =3D &quot;:ti43x&quot;<br>
&#43;SOC_FAMILY:append =3D &quot;:ti43x&quot;<br>
&nbsp;<br>
&nbsp;DEFAULTTUNE ?=3D &quot;armv7athf-neon&quot;<br>
&nbsp;require conf/machine/include/tune-cortexa9.inc<br>
diff --git a/conf/machine/omap3evm.conf b/conf/machine/omap3evm.conf<br>
index 01808b68..dc56d57a 100644<br>
--- a/conf/machine/omap3evm.conf<br>
&#43;&#43;&#43; b/conf/machine/omap3evm.conf<br>
@@ -8,7 &#43;8,7 @@ MACHINE_GUI_CLASS =3D &quot;smallscreen&quot;<br>
&nbsp;MACHINE_FEATURES &#43;=3D &quot;touchscreen ethernet&quot;<br>
&nbsp;<br>
&nbsp;IMAGE_FSTYPES &#43;=3D &quot;jffs2 tar.xz&quot;<br>
-EXTRA_IMAGECMD_jffs2 =3D &quot;-lnp -e 0x20000 -s 2048&quot;<br>
&#43;EXTRA_IMAGECMD:jffs2 =3D &quot;-lnp -e 0x20000 -s 2048&quot;<br>
&nbsp;<br>
&nbsp;SERIAL_CONSOLES =3D &quot;115200;ttyS0&quot;<br>
&nbsp;USE_VT =3D &quot;0&quot;<br>
diff --git a/conf/multiconfig/k3r5-sr2.conf b/conf/multiconfig/k3r5-sr2.con=
f<br>
index 17082141..e933b9cc 100644<br>
--- a/conf/multiconfig/k3r5-sr2.conf<br>
&#43;&#43;&#43; b/conf/multiconfig/k3r5-sr2.conf<br>
@@ -1,3 &#43;1,3 @@<br>
&nbsp;require k3r5.conf<br>
&nbsp;<br>
-MACHINE_append =3D &quot;-sr2&quot;<br>
&#43;MACHINE:append =3D &quot;-sr2&quot;<br>
diff --git a/conf/multiconfig/k3r5.conf b/conf/multiconfig/k3r5.conf<br>
index 8c8f0c3f..deb07210 100644<br>
--- a/conf/multiconfig/k3r5.conf<br>
&#43;&#43;&#43; b/conf/multiconfig/k3r5.conf<br>
@@ -2,4 &#43;2,4 @@ MAINMACHINE :=3D &quot;${MACHINE}&quot;<br>
&nbsp;<br>
&nbsp;DEPLOY_DIR_IMAGE =3D &quot;${DEPLOY_DIR}/images/${MAINMACHINE}&quot;<=
br>
&nbsp;<br>
-MACHINE_append =3D &quot;-k3r5&quot;<br>
&#43;MACHINE:append =3D &quot;-k3r5&quot;<br>
diff --git a/recipes-bsp/abefw/abefw_1.0.14.bb b/recipes-bsp/abefw/abefw_1.=
0.14.bb<br>
index 302bdcde..a6cc624a 100644<br>
--- a/recipes-bsp/abefw/abefw_1.0.14.bb<br>
&#43;&#43;&#43; b/recipes-bsp/abefw/abefw_1.0.14.bb<br>
@@ -20,4 &#43;20,4 @@ do_install() {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cp ${S}/firmware/omap4_abe=
_new ${D}/lib/firmware/<br>
&nbsp;}<br>
&nbsp;<br>
-FILES_${PN} &#43;=3D &quot;/lib/firmware/omap4_abe_new&quot;<br>
&#43;FILES:${PN} &#43;=3D &quot;/lib/firmware/omap4_abe_new&quot;<br>
diff --git a/recipes-bsp/aif2-lld/aif2-lld-rtos_git.bb b/recipes-bsp/aif2-l=
ld/aif2-lld-rtos_git.bb<br>
index 962965b0..048a2430 100644<br>
--- a/recipes-bsp/aif2-lld/aif2-lld-rtos_git.bb<br>
&#43;&#43;&#43; b/recipes-bsp/aif2-lld/aif2-lld-rtos_git.bb<br>
@@ -6,7 &#43;6,7 @@ require recipes-bsp/aif2-lld/aif2-lld.inc<br>
&nbsp;<br>
&nbsp;PR =3D &quot;${INC_PR}.0&quot;<br>
&nbsp;<br>
-DEPENDS_append =3D &quot; qmss-lld-rtos \<br>
&#43;DEPENDS:append =3D &quot; qmss-lld-rtos \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cppi-lld-rtos \<br>
&nbsp;&quot;<br>
&nbsp;<br>
diff --git a/recipes-bsp/aif2-lld/aif2-lld-test_git.bb b/recipes-bsp/aif2-l=
ld/aif2-lld-test_git.bb<br>
index 9180b953..d4328621 100644<br>
--- a/recipes-bsp/aif2-lld/aif2-lld-test_git.bb<br>
&#43;&#43;&#43; b/recipes-bsp/aif2-lld/aif2-lld-test_git.bb<br>
@@ -6,7 &#43;6,7 @@ include aif2-lld.inc<br>
&nbsp;<br>
&nbsp;PR =3D &quot;${INC_PR}.0&quot;<br>
&nbsp;<br>
-EXTRA_OEMAKE =3D &quot;-f makefile_armv7 PDK_INSTALL_PATH=3D${STAGING_INCD=
IR} AIF2_SRC_DIR=3D${WORKDIR}/git&quot;<br>
&#43;EXTRA_OEMAKE =3D &quot;-f makefile:armv7 PDK_INSTALL_PATH=3D${STAGING_=
INCDIR} AIF2_SRC_DIR=3D${WORKDIR}/git&quot;<br>
&nbsp;<br>
&nbsp;do_compile () {<br>
&nbsp;&nbsp;&nbsp;&nbsp; oe_runmake clean DEVICE=3Dk2hk<br>
diff --git a/recipes-bsp/aif2-lld/aif2-lld_git.bb b/recipes-bsp/aif2-lld/ai=
f2-lld_git.bb<br>
index 4a640f1b..d9283a3a 100644<br>
--- a/recipes-bsp/aif2-lld/aif2-lld_git.bb<br>
&#43;&#43;&#43; b/recipes-bsp/aif2-lld/aif2-lld_git.bb<br>
@@ -6,7 &#43;6,7 @@ include aif2-lld.inc<br>
&nbsp;<br>
&nbsp;PR =3D &quot;${INC_PR}.0&quot;<br>
&nbsp;<br>
-EXTRA_OEMAKE =3D &quot;-f makefile_armv7 PDK_INSTALL_PATH=3D${STAGING_INCD=
IR}&quot;<br>
&#43;EXTRA_OEMAKE =3D &quot;-f makefile:armv7 PDK_INSTALL_PATH=3D${STAGING_=
INCDIR}&quot;<br>
&nbsp;<br>
&nbsp;do_compile () {<br>
&nbsp;&nbsp;&nbsp;&nbsp; oe_runmake lib DEVICE=3Dk2hk<br>
diff --git a/recipes-bsp/alsa-state/alsa-state.bbappend b/recipes-bsp/alsa-=
state/alsa-state.bbappend<br>
index 72d991c7..4fc41d05 100644<br>
--- a/recipes-bsp/alsa-state/alsa-state.bbappend<br>
&#43;&#43;&#43; b/recipes-bsp/alsa-state/alsa-state.bbappend<br>
@@ -1 &#43;1 @@<br>
-FILESEXTRAPATHS_prepend :=3D &quot;${THISDIR}/${PN}:&quot;<br>
&#43;FILESEXTRAPATHS:prepend :=3D &quot;${THISDIR}/${PN}:&quot;<br>
diff --git a/recipes-bsp/audk2g-addon/audk2g-addon-rtos_git.bb b/recipes-bs=
p/audk2g-addon/audk2g-addon-rtos_git.bb<br>
index 0cb9ff17..e40fb43c 100644<br>
--- a/recipes-bsp/audk2g-addon/audk2g-addon-rtos_git.bb<br>
&#43;&#43;&#43; b/recipes-bsp/audk2g-addon/audk2g-addon-rtos_git.bb<br>
@@ -25,7 &#43;25,7 @@ PR =3D &quot;r0&quot;<br>
&nbsp;<br>
&nbsp;S =3D &quot;${WORKDIR}/git/ti/addon/audk2g&quot;<br>
&nbsp;<br>
-DEPENDS_append =3D &quot; ti-sysbios \<br>
&#43;DEPENDS:append =3D &quot; ti-sysbios \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; gp=
io-lld-rtos \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; i2=
c-lld-rtos \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bo=
ard-rtos \<br>
diff --git a/recipes-bsp/bcp-lld/bcp-lld-rtos_git.bb b/recipes-bsp/bcp-lld/=
bcp-lld-rtos_git.bb<br>
index 62cee07b..d808267b 100644<br>
--- a/recipes-bsp/bcp-lld/bcp-lld-rtos_git.bb<br>
&#43;&#43;&#43; b/recipes-bsp/bcp-lld/bcp-lld-rtos_git.bb<br>
@@ -15,7 &#43;15,7 @@ PACKAGE_ARCH =3D &quot;${MACHINE_ARCH}&quot;<br>
&nbsp;PR =3D &quot;r0&quot;<br>
&nbsp;<br>
&nbsp;<br>
-DEPENDS_append =3D &quot; qmss-lld-rtos \<br>
&#43;DEPENDS:append =3D &quot; qmss-lld-rtos \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cppi-lld-rtos \<br>
&nbsp;&quot;<br>
&nbsp;<br>
diff --git a/recipes-bsp/board-rtos/board-rtos_git.bb b/recipes-bsp/board-r=
tos/board-rtos_git.bb<br>
index a6547d38..485b0656 100644<br>
--- a/recipes-bsp/board-rtos/board-rtos_git.bb<br>
&#43;&#43;&#43; b/recipes-bsp/board-rtos/board-rtos_git.bb<br>
@@ -16,24 &#43;16,24 @@ PACKAGE_ARCH =3D &quot;${MACHINE_ARCH}&quot;<br>
&nbsp;<br>
&nbsp;PR =3D &quot;r0&quot;<br>
&nbsp;<br>
-DEPENDS_append =3D &quot; i2c-lld-rtos \<br>
&#43;DEPENDS:append =3D &quot; i2c-lld-rtos \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; spi-lld-rtos \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uart-lld-rtos \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; osal-rtos \<br>
&nbsp;&quot;<br>
&nbsp;<br>
-DEPENDS_append_omap-a15 =3D &quot; ti-ndk \<br>
&#43;DEPENDS:append_omap-a15 =3D &quot; ti-ndk \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; mmcsd-lld-rtos \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; pm-lld-rtos \<br>
&nbsp;&quot;<br>
&nbsp;<br>
-DEPENDS_append_am57xx-evm =3D &quot; gpio-lld-rtos \<br>
&#43;DEPENDS:append_am57xx-evm =3D &quot; gpio-lld-rtos \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; icss-emac-lld-rtos \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pruss-lld-rtos \<br>
&nbsp;&quot;<br>
&nbsp;<br>
&nbsp;<br>
-DEPENDS_append_ti33x =3D &quot; gpio-lld-rtos \<br>
&#43;DEPENDS:append_ti33x =3D &quot; gpio-lld-rtos \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 gpmc-lld-rtos \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 icss-emac-lld-rtos \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 mmcsd-lld-rtos \<br>
@@ -42,7 &#43;42,7 @@ DEPENDS_append_ti33x =3D &quot; gpio-lld-rtos \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 ti-ndk \<br>
&nbsp;&quot;<br>
&nbsp;<br>
-DEPENDS_append_ti43x =3D &quot; gpio-lld-rtos \<br>
&#43;DEPENDS:append_ti43x =3D &quot; gpio-lld-rtos \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 gpmc-lld-rtos \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 icss-emac-lld-rtos \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 mmcsd-lld-rtos \<br>
@@ -51,13 &#43;51,13 @@ DEPENDS_append_ti43x =3D &quot; gpio-lld-rtos \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 ti-ndk \<br>
&nbsp;&quot;<br>
&nbsp;<br>
-DEPENDS_append_dra7xx =3D &quot; pm-lld-rtos \<br>
&#43;DEPENDS:append_dra7xx =3D &quot; pm-lld-rtos \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; mmcsd-lld-rtos \<br>
&nbsp;&quot;<br>
&nbsp;<br>
-DEPENDS_append_am65xx =3D &quot; sciclient-rtos \<br>
&#43;DEPENDS:append_am65xx =3D &quot; sciclient-rtos \<br>
&nbsp;&quot;<br>
-DEPENDS_append_j7 =3D &quot; udma-lld-rtos \<br>
&#43;DEPENDS:append_j7 =3D &quot; udma-lld-rtos \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; sciclient-rtos \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; mmcsd-lld-rtos \<br>
&nbsp;&quot;<br>
@@ -71,6 &#43;71,6 @@ INHIBIT_PACKAGE_STRIP =3D &quot;1&quot;<br>
&nbsp;export PDK_BOARD_ROOT_PATH =3D&quot;${WORKDIR}/build&quot;<br>
&nbsp;export DEST_ROOT=3D&quot;${S}&quot;<br>
&nbsp;<br>
-XDCPATH_append =3D &quot;;${PDK_INSTALL_DIR}/packages/ti/csl;${NDK_INSTALL=
_DIR}/packages&quot;<br>
&#43;XDCPATH:append =3D &quot;;${PDK_INSTALL_DIR}/packages/ti/csl;${NDK_INS=
TALL_DIR}/packages&quot;<br>
&nbsp;<br>
-INSANE_SKIP_${PN} =3D &quot;arch&quot;<br>
&#43;INSANE_SKIP:${PN} =3D &quot;arch&quot;<br>
diff --git a/recipes-bsp/boot-monitor/boot-monitor_git.bb b/recipes-bsp/boo=
t-monitor/boot-monitor_git.bb<br>
index 9c436d1c..dee180ff 100644<br>
--- a/recipes-bsp/boot-monitor/boot-monitor_git.bb<br>
&#43;&#43;&#43; b/recipes-bsp/boot-monitor/boot-monitor_git.bb<br>
@@ -23,7 &#43;23,7 @@ FLOATABI =3D &quot;${@bb.utils.contains(&quot;TUNE_FE=
ATURES&quot;, &quot;vfp&quot;, bb.utils.contains(&quot;TUNE<br>
&nbsp;<br>
&nbsp;EXTRA_OEMAKE =3D &quot;CROSS_COMPILE=3D${TARGET_PREFIX} CC=3D&quot;${=
TARGET_PREFIX}gcc ${TOOLCHAIN_OPTIONS} ${FLOATABI}&quot; LD=3D&quot;${TARGE=
T_PREFIX}gcc ${TOOLCHAIN_OPTIONS} ${FLOATABI}&quot;&quot;<br>
&nbsp;<br>
-FILES_${PN} =3D &quot;/boot&quot;<br>
&#43;FILES:${PN} =3D &quot;/boot&quot;<br>
&nbsp;<br>
&nbsp;inherit deploy<br>
&nbsp;<br>
diff --git a/recipes-bsp/bt-fw/bt-fw_git.bb b/recipes-bsp/bt-fw/bt-fw_git.b=
b<br>
index f3d740b1..ea42c168 100644<br>
--- a/recipes-bsp/bt-fw/bt-fw_git.bb<br>
&#43;&#43;&#43; b/recipes-bsp/bt-fw/bt-fw_git.bb<br>
@@ -21,4 &#43;21,4 @@ do_install() {<br>
&nbsp;&nbsp;&nbsp;&nbsp; oe_runmake &quot;DEST_DIR=3D${D}&quot; &quot;BASE_=
LIB_DIR=3D${base_libdir}&quot; install<br>
&nbsp;}<br>
&nbsp;<br>
-FILES_${PN} &#43;=3D &quot;${base_libdir}/firmware/ti-connectivity/*&quot;=
<br>
&#43;FILES:${PN} &#43;=3D &quot;${base_libdir}/firmware/ti-connectivity/*&q=
uot;<br>
diff --git a/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb b/recipes-b=
sp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb<br>
index 6d857f7f..ccaa3e6d 100644<br>
--- a/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb<br>
&#43;&#43;&#43; b/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb<br>
@@ -25,4 &#43;25,4 @@ do_install() {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; install -m 0644 ${S}/caden=
ce/${TARGET} ${D}${base_libdir}/firmware/cadence/${TARGET}<br>
&nbsp;}<br>
&nbsp;<br>
-FILES_${PN} =3D &quot;${base_libdir}/firmware&quot;<br>
&#43;FILES:${PN} =3D &quot;${base_libdir}/firmware&quot;<br>
diff --git a/recipes-bsp/cal-lld/cal-lld-rtos_git.bb b/recipes-bsp/cal-lld/=
cal-lld-rtos_git.bb<br>
index f3c780f6..aef21899 100644<br>
--- a/recipes-bsp/cal-lld/cal-lld-rtos_git.bb<br>
&#43;&#43;&#43; b/recipes-bsp/cal-lld/cal-lld-rtos_git.bb<br>
@@ -15,7 &#43;15,7 @@ PACKAGE_ARCH =3D &quot;${MACHINE_ARCH}&quot;<br>
&nbsp;<br>
&nbsp;PR =3D &quot;r0&quot;<br>
&nbsp;<br>
-DEPENDS_append =3D &quot; osal-rtos \<br>
&#43;DEPENDS:append =3D &quot; osal-rtos \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fvid2-rtos \<br>
&nbsp;&quot;<br>
&nbsp;<br>
@@ -71,6 &#43;71,6 @@ do_install() {<br>
&nbsp;&nbsp;&nbsp;&nbsp; find -name &quot;*.tar&quot; -exec tar xf {} --no-=
same-owner -C ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/drv/cal \;<br>
&nbsp;}<br>
&nbsp;<br>
-FILES_${PN} &#43;=3D &quot;${PDK_INSTALL_DIR_RECIPE}/packages&quot;<br>
&#43;FILES:${PN} &#43;=3D &quot;${PDK_INSTALL_DIR_RECIPE}/packages&quot;<br=
>
&nbsp;<br>
-INSANE_SKIP_${PN} =3D &quot;arch ldflags&quot;<br>
&#43;INSANE_SKIP:${PN} =3D &quot;arch ldflags&quot;<br>
diff --git a/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb b/recipes-bsp/cm3-=
pm-firmware/amx3-cm3_git.bb<br>
index bbbc3ec1..bd5c3693 100644<br>
--- a/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb<br>
&#43;&#43;&#43; b/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb<br>
@@ -23,7 &#43;23,7 @@ do_install() {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; install -m 0644 bin/*-scal=
e-data.bin ${D}${base_libdir}/firmware/<br>
&nbsp;}<br>
&nbsp;<br>
-FILES_${PN} &#43;=3D &quot;${base_libdir}/firmware&quot;<br>
&#43;FILES:${PN} &#43;=3D &quot;${base_libdir}/firmware&quot;<br>
&nbsp;<br>
&nbsp;COMPATIBLE_MACHINE =3D &quot;(ti-soc)&quot;<br>
&nbsp;TOOLCHAIN =3D &quot;gcc&quot;<br>
diff --git a/recipes-bsp/cmb-addon/cmb-addon-rtos_git.bb b/recipes-bsp/cmb-=
addon/cmb-addon-rtos_git.bb<br>
index 38f9a43e..8ca44164 100644<br>
--- a/recipes-bsp/cmb-addon/cmb-addon-rtos_git.bb<br>
&#43;&#43;&#43; b/recipes-bsp/cmb-addon/cmb-addon-rtos_git.bb<br>
@@ -27,7 &#43;27,7 @@ SRC_URI =3D &quot;${CMB_ADDON_GIT_URI};destsuffix=3D$=
{CMB_ADDON_GIT_DESTSUFFIX};protocol=3D<br>
&nbsp;<br>
&nbsp;S =3D &quot;${WORKDIR}/git/ti/addon/cmb&quot;<br>
&nbsp;<br>
-DEPENDS_append =3D &quot; ti-sysbios \<br>
&#43;DEPENDS:append =3D &quot; ti-sysbios \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; gp=
io-lld-rtos \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; i2=
c-lld-rtos \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mc=
asp-lld-rtos \<br>
diff --git a/recipes-bsp/cmem/cmem-mod_git.bb b/recipes-bsp/cmem/cmem-mod_g=
it.bb<br>
index 1031e859..f7965593 100644<br>
--- a/recipes-bsp/cmem/cmem-mod_git.bb<br>
&#43;&#43;&#43; b/recipes-bsp/cmem/cmem-mod_git.bb<br>
@@ -3,7 &#43;3,7 @@ DESCRIPTION =3D &quot;Kernel module for contiguous memo=
ry allocation from userspace&quot;<br>
&nbsp;include cmem.inc<br>
&nbsp;<br>
&nbsp;# This package builds a kernel module, use kernel PR as base and appe=
nd a local<br>
-MACHINE_KERNEL_PR_append =3D &quot;a&quot;<br>
&#43;MACHINE_KERNEL_PR:append =3D &quot;a&quot;<br>
&nbsp;PR =3D &quot;${MACHINE_KERNEL_PR}&quot;<br>
&nbsp;<br>
&nbsp;inherit module<br>
@@ -13,6 &#43;13,6 @@ MAKE_TARGETS =3D &quot;module&quot;<br>
&nbsp;<br>
&nbsp;KERNEL_MODULE_AUTOLOAD &#43;=3D &quot;cmemk&quot;<br>
&nbsp;<br>
-do_install_prepend() {<br>
&#43;do_install:prepend() {<br>
&nbsp;&nbsp;&nbsp;&nbsp; cp ${B}/src/cmem/module/Module.symvers ${B}/ || tr=
ue<br>
&nbsp;}<br>
diff --git a/recipes-bsp/cmem/cmem_git.bb b/recipes-bsp/cmem/cmem_git.bb<br=
>
index bab9238f..f69c22fb 100644<br>
--- a/recipes-bsp/cmem/cmem_git.bb<br>
&#43;&#43;&#43; b/recipes-bsp/cmem/cmem_git.bb<br>
@@ -2,12 &#43;2,12 @@ DESCRIPTION =3D &quot;The cmem component supports con=
tiguous memory allocation from use<br>
&nbsp;<br>
&nbsp;include cmem.inc<br>
&nbsp;<br>
-RDEPENDS_${PN} =3D &quot;cmem-mod&quot;<br>
&#43;RDEPENDS:${PN} =3D &quot;cmem-mod&quot;<br>
&nbsp;<br>
&nbsp;PR =3D &quot;r0&quot;<br>
&nbsp;<br>
&nbsp;PACKAGES =3D&#43; &quot;${PN}-test&quot;<br>
&nbsp;<br>
-FILES_${PN}-test =3D &quot;${bindir}/*&quot;<br>
&#43;FILES:${PN}-test =3D &quot;${bindir}/*&quot;<br>
&nbsp;<br>
&nbsp;inherit autotools<br>
diff --git a/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb b/recipes-=
bsp/common-csl-ip/common-csl-ip-rtos_git.bb<br>
index 6479d9f0..00591777 100644<br>
--- a/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb<br>
&#43;&#43;&#43; b/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb<br>
@@ -2,12 &#43;2,12 @@ require common-csl-ip.inc<br>
&nbsp;PR =3D &quot;${INC_PR}.6&quot;<br>
&nbsp;<br>
&nbsp;PACKAGE_ARCH =3D &quot;${MACHINE_ARCH}&quot;<br>
-COMPATIBLE_MACHINE_append =3D &quot;|c66x|k3&quot;<br>
&#43;COMPATIBLE_MACHINE:append =3D &quot;|c66x|k3&quot;<br>
&nbsp;<br>
&nbsp;inherit ti-pdk<br>
&nbsp;<br>
-DEPENDS_remove =3D &quot;${PN}&quot;<br>
-DEPENDS_remove =3D &quot;ti-sysbios&quot;<br>
&#43;DEPENDS:remove =3D &quot;${PN}&quot;<br>
&#43;DEPENDS:remove =3D &quot;ti-sysbios&quot;<br>
&nbsp;<br>
&nbsp;# Build with make instead of XDC<br>
&nbsp;TI_PDK_XDCMAKE =3D &quot;0&quot;<br>
@@ -19,5 &#43;19,5 @@ export DEST_ROOT=3D&quot;${S}&quot;<br>
&nbsp;PDK_COMP_LINK_TEXT =3D &quot;CSL-Chip Support Library&quot;<br>
&nbsp;<br>
&nbsp;# Workaround: dra7xx build requires am57xx CSL libraries for opencl-m=
onitor<br>
-TI_PDK_LIMIT_SOCS_append_dra7xx =3D &quot; am571x am572x am574x&quot;<br>
-TI_PDK_LIMIT_BOARDS_append_dra7xx =3D &quot; evmAM571x evmAM572x idkAM574x=
&quot;<br>
&#43;TI_PDK_LIMIT_SOCS:append_dra7xx =3D &quot; am571x am572x am574x&quot;<=
br>
&#43;TI_PDK_LIMIT_BOARDS:append_dra7xx =3D &quot; evmAM571x evmAM572x idkAM=
574x&quot;<br>
diff --git a/recipes-bsp/common-csl-ip/common-csl-ip_git.bb b/recipes-bsp/c=
ommon-csl-ip/common-csl-ip_git.bb<br>
index 9ea87d36..6fffc7ee 100644<br>
--- a/recipes-bsp/common-csl-ip/common-csl-ip_git.bb<br>
&#43;&#43;&#43; b/recipes-bsp/common-csl-ip/common-csl-ip_git.bb<br>
@@ -2,7 &#43;2,7 @@ require common-csl-ip.inc<br>
&nbsp;<br>
&nbsp;PR =3D &quot;${INC_PR}.0&quot;<br>
&nbsp;<br>
-ALLOW_EMPTY_${PN} =3D &quot;1&quot;<br>
&#43;ALLOW_EMPTY:${PN} =3D &quot;1&quot;<br>
&nbsp;<br>
&nbsp;CLEANBROKEN =3D &quot;1&quot;<br>
&nbsp;<br>
diff --git a/recipes-bsp/common-csl-ip/csl-rti-dwwdtest-fw_git.bb b/recipes=
-bsp/common-csl-ip/csl-rti-dwwdtest-fw_git.bb<br>
index 55e583b4..a7936594 100644<br>
--- a/recipes-bsp/common-csl-ip/csl-rti-dwwdtest-fw_git.bb<br>
&#43;&#43;&#43; b/recipes-bsp/common-csl-ip/csl-rti-dwwdtest-fw_git.bb<br>
@@ -47,15 &#43;47,15 @@ do_install() {<br>
&nbsp;# Create separate package for each firmware so we can utilize<br>
&nbsp;# update-alternatives.<br>
&nbsp;PACKAGES =3D&#43; &quot;${PN}-evm ${PN}-idk&quot;<br>
-RDEPENDS_${PN} =3D &quot;${PN}-evm ${PN}-idk&quot;<br>
-ALLOW_EMPTY_${PN} =3D &quot;1&quot;<br>
&#43;RDEPENDS:${PN} =3D &quot;${PN}-evm ${PN}-idk&quot;<br>
&#43;ALLOW_EMPTY:${PN} =3D &quot;1&quot;<br>
&nbsp;<br>
-FILES_${PN}-evm =3D &quot;${base_libdir}/firmware/rti_dwwdtest/am65xx_evm&=
quot;<br>
-FILES_${PN}-idk =3D &quot;${base_libdir}/firmware/rti_dwwdtest/am65xx_idk&=
quot;<br>
&#43;FILES:${PN}-evm =3D &quot;${base_libdir}/firmware/rti_dwwdtest/am65xx_=
evm&quot;<br>
&#43;FILES:${PN}-idk =3D &quot;${base_libdir}/firmware/rti_dwwdtest/am65xx_=
idk&quot;<br>
&nbsp;<br>
&nbsp;# We are packaging R5 firmware<br>
-INSANE_SKIP_${PN}-evm =3D &quot;arch&quot;<br>
-INSANE_SKIP_${PN}-idk =3D &quot;arch&quot;<br>
&#43;INSANE_SKIP:${PN}-evm =3D &quot;arch&quot;<br>
&#43;INSANE_SKIP:${PN}-idk =3D &quot;arch&quot;<br>
&nbsp;<br>
&nbsp;# Configure update-alternatives as there may be other firmwares provi=
ded in an<br>
&nbsp;# image.<br>
@@ -63,8 &#43;63,8 @@ inherit update-alternatives<br>
&nbsp;<br>
&nbsp;# It might be nice to dynamically declare the following based on<br>
&nbsp;# TI_PDK_LIMIT_BOARDS, but that is probably overkill.<br>
-ALTERNATIVE_${PN}-evm =3D &quot;am65x-mcu-r5f0_0-fw&quot;<br>
-ALTERNATIVE_${PN}-idk =3D &quot;am65x-mcu-r5f0_0-fw&quot;<br>
&#43;ALTERNATIVE:${PN}-evm =3D &quot;am65x-mcu-r5f0_0-fw&quot;<br>
&#43;ALTERNATIVE:${PN}-idk =3D &quot;am65x-mcu-r5f0_0-fw&quot;<br>
&nbsp;<br>
&nbsp;ALTERNATIVE_LINK_NAME[am65x-mcu-r5f0_0-fw] =3D &quot;${base_libdir}/f=
irmware/am65x-mcu-r5f0_0-fw&quot;<br>
&nbsp;<br>
diff --git a/recipes-bsp/cppi-lld/cppi-lld-rtos_git.bb b/recipes-bsp/cppi-l=
ld/cppi-lld-rtos_git.bb<br>
index 1cdaf3a4..49a99406 100644<br>
--- a/recipes-bsp/cppi-lld/cppi-lld-rtos_git.bb<br>
&#43;&#43;&#43; b/recipes-bsp/cppi-lld/cppi-lld-rtos_git.bb<br>
@@ -3,8 &#43;3,8 @@ require cppi-lld.inc<br>
&nbsp;<br>
&nbsp;PR =3D &quot;${INC_PR}.1&quot;<br>
&nbsp;<br>
-COMPATIBLE_MACHINE_append =3D &quot;|c66x&quot;<br>
&#43;COMPATIBLE_MACHINE:append =3D &quot;|c66x&quot;<br>
&nbsp;<br>
-DEPENDS_append =3D &quot; rm-lld-rtos \<br>
&#43;DEPENDS:append =3D &quot; rm-lld-rtos \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; qmss-lld-rtos \<br>
&nbsp;&quot;<br>
diff --git a/recipes-bsp/cppi-lld/cppi-lld-test_git.bb b/recipes-bsp/cppi-l=
ld/cppi-lld-test_git.bb<br>
index 0c630b4e..dd94f92d 100644<br>
--- a/recipes-bsp/cppi-lld/cppi-lld-test_git.bb<br>
&#43;&#43;&#43; b/recipes-bsp/cppi-lld/cppi-lld-test_git.bb<br>
@@ -13,10 &#43;13,10 @@ do_compile () {<br>
&nbsp;#&nbsp;&nbsp; Now build the lld in the updated directory<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for device in ${DEVICELIST=
}<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; do<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; make -f makefile_armv7 clean PDK_INSTALL_PATH=3D${STAGING_INCDIR=
} DEVICE=3D&quot;$device&quot; CPPI_SRC_DIR=3D${S}<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; make -f makefile:armv7 clean PDK_INSTALL_PATH=3D${STAGING_IN=
CDIR} DEVICE=3D&quot;$device&quot; CPPI_SRC_DIR=3D${S}<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; for choice in ${CHOICELIST}<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; do<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; make -f makefile=
_armv7 tests examples PDK_INSTALL_PATH=3D${STAGING_INCDIR} DEVICE=3D&quot;$=
device&quot; CPPI_SRC_DIR=3D${S} USEDYNAMIC_LIB=3D&quot;$choice&quot;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; make -f make=
file:armv7 tests examples PDK_INSTALL_PATH=3D${STAGING_INCDIR} DEVICE=3D&qu=
ot;$device&quot; CPPI_SRC_DIR=3D${S} USEDYNAMIC_LIB=3D&quot;$choice&quot;<b=
r>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; done<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; done<br>
&nbsp;}<br>
@@ -24,6 &#43;24,6 @@ do_compile () {<br>
&nbsp;do_install () {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for device in ${DEVICELIST=
}<br>
&nbsp;do<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; make -f makefile_armv7 installbin PDK=
_INSTALL_PATH=3D${STAGING_INCDIR} DEVICE=3D&quot;$device&quot; CPPI_SRC_DIR=
=3D${S} INSTALL_BIN_BASE_DIR=3D${D}${bindir}<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; make -f makefile:armv7 installbin=
 PDK_INSTALL_PATH=3D${STAGING_INCDIR} DEVICE=3D&quot;$device&quot; CPPI_SRC=
_DIR=3D${S} INSTALL_BIN_BASE_DIR=3D${D}${bindir}<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; done<br>
&nbsp;}<br>
diff --git a/recipes-bsp/cppi-lld/cppi-lld_git.bb b/recipes-bsp/cppi-lld/cp=
pi-lld_git.bb<br>
index 3cdcd22d..4480714a 100644<br>
--- a/recipes-bsp/cppi-lld/cppi-lld_git.bb<br>
&#43;&#43;&#43; b/recipes-bsp/cppi-lld/cppi-lld_git.bb<br>
@@ -8,15 &#43;8,15 @@ PR =3D &quot;${INC_PR}.1&quot;<br>
&nbsp;<br>
&nbsp;do_compile () {<br>
&nbsp;#&nbsp;&nbsp; Now build the lld in the updated directory<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; make -f makefile_armv7 clean PDK_INST=
ALL_PATH=3D${STAGING_INCDIR}<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; make -f makefile:armv7 clean PDK_=
INSTALL_PATH=3D${STAGING_INCDIR}<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for device in ${DEVICELIST=
}<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; do<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; make -f makefile_armv7 lib PDK_INSTALL_PATH=3D${STAGING_INCDIR}&=
nbsp; DEVICE=3D&quot;${device}&quot;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; make -f makefile:armv7 lib PDK_INSTALL_PATH=3D${STAGING_INCD=
IR}&nbsp; DEVICE=3D&quot;${device}&quot;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; done<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;do_install () {<br>
-&nbsp;&nbsp;&nbsp; make -f makefile_armv7 install PDK_INSTALL_PATH=3D${STA=
GING_INCDIR} INSTALL_INC_BASE_DIR=3D${D}/${includedir} INSTALL_LIB_BASE_DIR=
=3D${D}${libdir}<br>
&#43;&nbsp;&nbsp;&nbsp; make -f makefile:armv7 install PDK_INSTALL_PATH=3D$=
{STAGING_INCDIR} INSTALL_INC_BASE_DIR=3D${D}/${includedir} INSTALL_LIB_BASE=
_DIR=3D${D}${libdir}<br>
&nbsp;&nbsp;&nbsp;&nbsp; chown -R root:root ${D}<br>
&nbsp;<br>
&nbsp;#&nbsp;&nbsp; Set the generic device library symbolic link to default=
 k2h<br>
@@ -35,4 &#43;35,4 @@ INHIBIT_PACKAGE_STRIP_FILES_k2hk =3D &quot;${PKGD}${l=
ibdir}/libcppi_k2h.a ${PKGD}${libd<br>
&nbsp;INHIBIT_PACKAGE_STRIP_FILES_k2e =3D &quot;${PKGD}${libdir}/libcppi_k2=
e.a&quot;<br>
&nbsp;INHIBIT_PACKAGE_STRIP_FILES_k2l =3D &quot;${PKGD}${libdir}/libcppi_k2=
l.a&quot;<br>
&nbsp;INHIBIT_PACKAGE_STRIP_FILES_k2g =3D &quot;${PKGD}${libdir}/libcppi_k2=
h.a&quot;<br>
-INHIBIT_PACKAGE_STRIP_FILES_append =3D &quot; ${PKGD}${libdir}/libcppi.a&q=
uot;<br>
&#43;INHIBIT_PACKAGE_STRIP_FILES:append =3D &quot; ${PKGD}${libdir}/libcppi=
.a&quot;<br>
diff --git a/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb b/recipes-bsp/c=
psw9g-eth-fw/cpsw9g-eth-fw_git.bb<br>
index 8cb62b2a..ed36951f 100755<br>
--- a/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb<br>
&#43;&#43;&#43; b/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb<br>
@@ -21,7 &#43;21,7 @@ CPSW9G_FW_DIR =3D &quot;${S}/ethfw&quot;<br>
&nbsp;CPSW9G_FW_FILENAME =3D &quot;app_remoteswitchcfg_server_pdk_mem_map_s=
trip.xer5f&quot;<br>
&nbsp;<br>
&nbsp;# make sure that lib/firmware, and all its contents are part of the p=
ackage<br>
-FILES_${PN} &#43;=3D &quot;${base_libdir}/firmware&quot;<br>
&#43;FILES:${PN} &#43;=3D &quot;${base_libdir}/firmware&quot;<br>
&nbsp;<br>
&nbsp;do_install() {<br>
&nbsp;&nbsp; install -d ${D}${base_libdir}/firmware<br>
@@ -30,14 &#43;30,14 @@ do_install() {<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;TARGET_MAIN_R5FSS0_0 =3D &quot;j7-main-r5f0_0-fw&quot;<br>
-ALTERNATIVE_${PN} =3D &quot;j7-main-r5f0_0-fw&quot;<br>
&#43;ALTERNATIVE:${PN} =3D &quot;j7-main-r5f0_0-fw&quot;<br>
&nbsp;ALTERNATIVE_LINK_NAME[j7-main-r5f0_0-fw] =3D &quot;${base_libdir}/fir=
mware/${TARGET_MAIN_R5FSS0_0}&quot;<br>
&nbsp;ALTERNATIVE_TARGET[j7-main-r5f0_0-fw] =3D &quot;${base_libdir}/firmwa=
re/${CPSW9G_FW_FILENAME}&quot;<br>
&nbsp;ALTERNATIVE_PRIORITY =3D &quot;17&quot;<br>
&nbsp;<br>
&nbsp;INHIBIT_PACKAGE_STRIP =3D &quot;1&quot;<br>
&nbsp;INHIBIT_PACKAGE_DEBUG_SPLIT =3D &quot;1&quot;<br>
-INSANE_SKIP_${PN} &#43;=3D &quot;arch&quot;<br>
&#43;INSANE_SKIP:${PN} &#43;=3D &quot;arch&quot;<br>
&nbsp;<br>
&nbsp;do_compile[noexec] =3D &quot;1&quot;<br>
&nbsp;do_configure[noexec] =3D &quot;1&quot;<br>
diff --git a/recipes-bsp/cuia/cuia_1.0.0.13.bb b/recipes-bsp/cuia/cuia_1.0.=
0.13.bb<br>
index 3efacb19..2ec35c6e 100644<br>
--- a/recipes-bsp/cuia/cuia_1.0.0.13.bb<br>
&#43;&#43;&#43; b/recipes-bsp/cuia/cuia_1.0.0.13.bb<br>
@@ -27,4 &#43;27,4 @@ do_install() {<br>
&nbsp;COMPATIBLE_HOST ?=3D &quot;null&quot;<br>
&nbsp;COMPATIBLE_HOST_ti-soc =3D &quot;(.*)&quot;<br>
&nbsp;<br>
-INSANE_SKIP_${PN} &#43;=3D &quot;textrel installed-vs-shipped&quot;<br>
&#43;INSANE_SKIP:${PN} &#43;=3D &quot;textrel installed-vs-shipped&quot;<br=
>
diff --git a/recipes-bsp/dfe-lld/dfe-lld-test_git.bb b/recipes-bsp/dfe-lld/=
dfe-lld-test_git.bb<br>
index 34b90c7d..941f1c6a 100644<br>
--- a/recipes-bsp/dfe-lld/dfe-lld-test_git.bb<br>
&#43;&#43;&#43; b/recipes-bsp/dfe-lld/dfe-lld-test_git.bb<br>
@@ -6,7 &#43;6,7 @@ include dfe-lld.inc<br>
&nbsp;<br>
&nbsp;PR =3D &quot;${INC_PR}.0&quot;<br>
&nbsp;<br>
-EXTRA_OEMAKE =3D &quot;-f makefile_armv7 PDK_INSTALL_PATH=3D${STAGING_INCD=
IR} DFE_SRC_DIR=3D${S}&quot;<br>
&#43;EXTRA_OEMAKE =3D &quot;-f makefile:armv7 PDK_INSTALL_PATH=3D${STAGING_=
INCDIR} DFE_SRC_DIR=3D${S}&quot;<br>
&nbsp;<br>
&nbsp;do_compile () {<br>
&nbsp;#&nbsp;&nbsp; Now build the lld in the updated directory<br>
diff --git a/recipes-bsp/dfe-lld/dfe-lld_git.bb b/recipes-bsp/dfe-lld/dfe-l=
ld_git.bb<br>
index 622da6fc..c12b0b31 100644<br>
--- a/recipes-bsp/dfe-lld/dfe-lld_git.bb<br>
&#43;&#43;&#43; b/recipes-bsp/dfe-lld/dfe-lld_git.bb<br>
@@ -6,7 &#43;6,7 @@ include dfe-lld.inc<br>
&nbsp;<br>
&nbsp;PR =3D &quot;${INC_PR}.0&quot;<br>
&nbsp;<br>
-EXTRA_OEMAKE =3D &quot;-f makefile_armv7 PDK_INSTALL_PATH=3D${STAGING_INCD=
IR}&quot;<br>
&#43;EXTRA_OEMAKE =3D &quot;-f makefile:armv7 PDK_INSTALL_PATH=3D${STAGING_=
INCDIR}&quot;<br>
&nbsp;<br>
&nbsp;do_compile () {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; oe_runmake lib DEVICE=3Dk2=
l<br>
diff --git a/recipes-bsp/dspdce-fw/dspdce-fw_git.bb b/recipes-bsp/dspdce-fw=
/dspdce-fw_git.bb<br>
index 6ddbe683..4e863099 100644<br>
--- a/recipes-bsp/dspdce-fw/dspdce-fw_git.bb<br>
&#43;&#43;&#43; b/recipes-bsp/dspdce-fw/dspdce-fw_git.bb<br>
@@ -55,11 &#43;55,11 @@ do_install() {<br>
&nbsp;&nbsp;&nbsp;&nbsp; install -m 0644 ${S}/dra7xx-c66x-dsp.xe66 ${D}${ba=
se_libdir}/firmware/${TARGET}.${BPN}<br>
&nbsp;}<br>
&nbsp;<br>
-ALTERNATIVE_${PN} =3D &quot;dra7-dsp1-fw.xe66&quot;<br>
&#43;ALTERNATIVE:${PN} =3D &quot;dra7-dsp1-fw.xe66&quot;<br>
&nbsp;ALTERNATIVE_LINK_NAME[dra7-dsp1-fw.xe66] =3D &quot;${base_libdir}/fir=
mware/${TARGET}&quot;<br>
&nbsp;ALTERNATIVE_TARGET[dra7-dsp1-fw.xe66] =3D &quot;${base_libdir}/firmwa=
re/${TARGET}.${BPN}&quot;<br>
&nbsp;ALTERNATIVE_PRIORITY =3D &quot;10&quot;<br>
&nbsp;<br>
-INSANE_SKIP_${PN} =3D &quot;arch&quot;<br>
&#43;INSANE_SKIP:${PN} =3D &quot;arch&quot;<br>
&nbsp;<br>
-FILES_${PN} &#43;=3D &quot;${base_libdir}/firmware/*&quot;<br>
&#43;FILES:${PN} &#43;=3D &quot;${base_libdir}/firmware/*&quot;<br>
diff --git a/recipes-bsp/dsptop/debugss-module-drv_git.bb b/recipes-bsp/dsp=
top/debugss-module-drv_git.bb<br>
index 8f4bbf15..4da565be 100644<br>
--- a/recipes-bsp/dsptop/debugss-module-drv_git.bb<br>
&#43;&#43;&#43; b/recipes-bsp/dsptop/debugss-module-drv_git.bb<br>
@@ -3,9 &#43;3,9 @@ LICENSE =3D &quot;GPLv2&quot;<br>
&nbsp;LIC_FILES_CHKSUM =3D &quot;<a href=3D"file://COPYING.txt;md5=3D9d4316=
fe434ba450dca4da25348ca5a3">file://COPYING.txt;md5=3D9d4316fe434ba450dca4da=
25348ca5a3</a>&quot;<br>
&nbsp;<br>
&nbsp;# This package builds a kernel module, use kernel PR as base and appe=
nd a local<br>
-MACHINE_KERNEL_PR_append =3D &quot;d&quot;<br>
&#43;MACHINE_KERNEL_PR:append =3D &quot;d&quot;<br>
&nbsp;PR =3D &quot;${MACHINE_KERNEL_PR}&quot;<br>
-PV_append =3D &quot;&#43;git${SRCPV}&quot;<br>
&#43;PV:append =3D &quot;&#43;git${SRCPV}&quot;<br>
&nbsp;<br>
&nbsp;S =3D &quot;${WORKDIR}/git/debugss_module/debugss-mod&quot;<br>
&nbsp;<br>
diff --git a/recipes-bsp/dsptop/dsptop_git.bb b/recipes-bsp/dsptop/dsptop_g=
it.bb<br>
index c4a9bf30..e879dcd5 100644<br>
--- a/recipes-bsp/dsptop/dsptop_git.bb<br>
&#43;&#43;&#43; b/recipes-bsp/dsptop/dsptop_git.bb<br>
@@ -21,8 &#43;21,8 @@ do_install() {<br>
&nbsp;COMPATIBLE_MACHINE =3D &quot;dra7xx|keystone&quot;<br>
&nbsp;PACKAGE_ARCH =3D &quot;${MACHINE_ARCH}&quot;<br>
&nbsp;<br>
-RDEPENDS_${PN} =3D &quot;debugss-module-drv bash&quot;<br>
-RDEPENDS_${PN}_append_keystone =3D &quot; temperature-module-drv&quot;<br>
&#43;RDEPENDS:${PN} =3D &quot;debugss-module-drv bash&quot;<br>
&#43;RDEPENDS:${PN}:append_keystone =3D &quot; temperature-module-drv&quot;=
<br>
&nbsp;<br>
&nbsp;include dsptop.inc<br>
&nbsp;<br>
diff --git a/recipes-bsp/dsptop/libulm_git.bb b/recipes-bsp/dsptop/libulm_g=
it.bb<br>
index 47248ff1..ea2cdb6b 100644<br>
--- a/recipes-bsp/dsptop/libulm_git.bb<br>
&#43;&#43;&#43; b/recipes-bsp/dsptop/libulm_git.bb<br>
@@ -35,12 &#43;35,12 @@ do_install() {<br>
&nbsp;COMPATIBLE_MACHINE =3D &quot;dra7xx|keystone&quot;<br>
&nbsp;PACKAGE_ARCH =3D &quot;${MACHINE_ARCH}&quot;<br>
&nbsp;<br>
-FILES_${PN}-dev &#43;=3D &quot;\<br>
&#43;FILES:${PN}-dev &#43;=3D &quot;\<br>
&nbsp;&nbsp;&nbsp;&nbsp; ${datadir}/ti/ulm \<br>
&nbsp;&quot;<br>
&nbsp;<br>
&nbsp;include dsptop.inc<br>
&nbsp;<br>
-ALLOW_EMPTY_${PN} =3D &quot;1&quot;<br>
&#43;ALLOW_EMPTY:${PN} =3D &quot;1&quot;<br>
&nbsp;<br>
&nbsp;PARALLEL_MAKE=3D &quot;&quot;<br>
diff --git a/recipes-bsp/dsptop/temperature-module-drv_git.bb b/recipes-bsp=
/dsptop/temperature-module-drv_git.bb<br>
index 0bd54c5e..1f49ddf8 100644<br>
--- a/recipes-bsp/dsptop/temperature-module-drv_git.bb<br>
&#43;&#43;&#43; b/recipes-bsp/dsptop/temperature-module-drv_git.bb<br>
@@ -3,9 &#43;3,9 @@ LICENSE =3D &quot;GPLv2&quot;<br>
&nbsp;LIC_FILES_CHKSUM =3D &quot;<a href=3D"file://COPYING.txt;md5=3D9d4316=
fe434ba450dca4da25348ca5a3">file://COPYING.txt;md5=3D9d4316fe434ba450dca4da=
25348ca5a3</a>&quot;<br>
&nbsp;<br>
&nbsp;# This package builds a kernel module, use kernel PR as base and appe=
nd a local<br>
-MACHINE_KERNEL_PR_append =3D &quot;a&quot;<br>
&#43;MACHINE_KERNEL_PR:append =3D &quot;a&quot;<br>
&nbsp;PR =3D &quot;${MACHINE_KERNEL_PR}&quot;<br>
-PV_append =3D &quot;&#43;git${SRCPV}&quot;<br>
&#43;PV:append =3D &quot;&#43;git${SRCPV}&quot;<br>
&nbsp;<br>
&nbsp;S =3D &quot;${WORKDIR}/git/temperature_module/temperature-mod&quot;<b=
r>
&nbsp;<br>
diff --git a/recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb b/recipes-bsp/edma=
3-lld/edma3-lld-rtos_git.bb<br>
index 4812afee..25d977f5 100644<br>
--- a/recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb<br>
&#43;&#43;&#43; b/recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb<br>
@@ -50,7 &#43;50,7 @@ TARGETLIST_keystone =3D &quot; \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; a15 \<br>
&nbsp;&quot;<br>
&nbsp;<br>
-PLATFORMLIST_append_dra7xx-evm =3D &quot; \<br>
&#43;PLATFORMLIST:append_dra7xx-evm =3D &quot; \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tda3xx-evm \<br>
&nbsp;&quot;<br>
&nbsp;<br>
@@ -76,7 &#43;76,7 @@ TARGETLIST_omapl1 =3D &quot; \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 674 \<br>
&nbsp;&quot;<br>
&nbsp;<br>
-EXTRA_OEMAKE_remove =3D &quot;TARGET=3D66&quot;<br>
&#43;EXTRA_OEMAKE:remove =3D &quot;TARGET=3D66&quot;<br>
&nbsp;FORMAT=3D&quot;ELF&quot;<br>
&nbsp;<br>
&nbsp;S =3D &quot;${WORKDIR}/git&quot;<br>
@@ -139,7 &#43;139,7 @@ do_install () {<br>
&nbsp;&nbsp;&nbsp;&nbsp; cp ${CP_ARGS} ${S}/* ${D}${EDMA3_LLD_INSTALL_DIR_R=
ECIPE}<br>
&nbsp;}<br>
&nbsp;<br>
-INSANE_SKIP_${PN}-dev =3D &quot;arch ldflags file-rdeps&quot;<br>
&#43;INSANE_SKIP:${PN}-dev =3D &quot;arch ldflags file-rdeps&quot;<br>
&nbsp;<br>
-ALLOW_EMPTY_${PN} =3D &quot;1&quot;<br>
-FILES_${PN}-dev &#43;=3D &quot;${EDMA3_LLD_INSTALL_DIR_RECIPE}&quot;<br>
&#43;ALLOW_EMPTY:${PN} =3D &quot;1&quot;<br>
&#43;FILES:${PN}-dev &#43;=3D &quot;${EDMA3_LLD_INSTALL_DIR_RECIPE}&quot;<b=
r>
diff --git a/recipes-bsp/edma3-lld/edma3-lld_git.bb b/recipes-bsp/edma3-lld=
/edma3-lld_git.bb<br>
index 886f0606..f42d8965 100644<br>
--- a/recipes-bsp/edma3-lld/edma3-lld_git.bb<br>
&#43;&#43;&#43; b/recipes-bsp/edma3-lld/edma3-lld_git.bb<br>
@@ -16,7 &#43;16,7 @@ PLATFORMLIST =3D &quot;tci6636k2h-evm \<br>
&nbsp;<br>
&nbsp;PACKAGES =3D&#43; &quot;${PN}-test&quot;<br>
&nbsp;<br>
-FILES_${PN}-test =3D &quot;${bindir}/*&quot;<br>
&#43;FILES:${PN}-test =3D &quot;${bindir}/*&quot;<br>
&nbsp;<br>
&nbsp;S =3D &quot;${WORKDIR}/git&quot;<br>
&nbsp;<br>
@@ -74,5 &#43;74,5 @@ do_install () {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; ${D}/${bindir}/edma3_drv_c66ak2e_a15_sample_a15host_r=
elease.xa15fg<br>
&nbsp;}<br>
&nbsp;<br>
-INSANE_SKIP_${PN} &#43;=3D &quot;ldflags&quot;<br>
-INSANE_SKIP_${PN}-test &#43;=3D &quot;ldflags&quot;<br>
&#43;INSANE_SKIP:${PN} &#43;=3D &quot;ldflags&quot;<br>
&#43;INSANE_SKIP:${PN}-test &#43;=3D &quot;ldflags&quot;<br>
diff --git a/recipes-bsp/emac-lld/emac-lld-rtos_git.bb b/recipes-bsp/emac-l=
ld/emac-lld-rtos_git.bb<br>
index bbf56b49..8f5a7fbb 100644<br>
--- a/recipes-bsp/emac-lld/emac-lld-rtos_git.bb<br>
&#43;&#43;&#43; b/recipes-bsp/emac-lld/emac-lld-rtos_git.bb<br>
@@ -12,13 &#43;12,13 @@ LIC_FILES_CHKSUM =3D &quot;<a href=3D""></a>file://=
emacver.h;beginline=3D1;endline=3D47;md5=3Df66bb3695972ca2a<br>
&nbsp;COMPATIBLE_MACHINE =3D &quot;ti33x|ti43x|omap-a15|k2g|omapl1|c665x-ev=
m|k3&quot;<br>
&nbsp;PACKAGE_ARCH =3D &quot;${MACHINE_ARCH}&quot;<br>
&nbsp;<br>
-DEPENDS_append =3D &quot; board-rtos osal-rtos&quot;<br>
-DEPENDS_append_ti33x =3D &quot; starterware-rtos&quot;<br>
-DEPENDS_append_ti43x =3D &quot; starterware-rtos&quot;<br>
-DEPENDS_append_k2g&nbsp; =3D &quot; cppi-lld-rtos qmss-lld-rtos&quot;<br>
&#43;DEPENDS:append =3D &quot; board-rtos osal-rtos&quot;<br>
&#43;DEPENDS:append_ti33x =3D &quot; starterware-rtos&quot;<br>
&#43;DEPENDS:append_ti43x =3D &quot; starterware-rtos&quot;<br>
&#43;DEPENDS:append_k2g&nbsp; =3D &quot; cppi-lld-rtos qmss-lld-rtos&quot;<=
br>
&nbsp;<br>
-DEPENDS_remove_k3 =3D &quot;board-rtos &quot;<br>
-DEPENDS_append_k3 =3D &quot; udma-lld-rtos trace-rtos&quot;<br>
&#43;DEPENDS:remove_k3 =3D &quot;board-rtos &quot;<br>
&#43;DEPENDS:append_k3 =3D &quot; udma-lld-rtos trace-rtos&quot;<br>
&nbsp;<br>
&nbsp;# Build with make instead of XDC<br>
&nbsp;TI_PDK_XDCMAKE =3D &quot;0&quot;<br>
diff --git a/recipes-bsp/fatfs-rtos/fatfs-rtos_git.bb b/recipes-bsp/fatfs-r=
tos/fatfs-rtos_git.bb<br>
index 20d8ba8c..5255e582 100644<br>
--- a/recipes-bsp/fatfs-rtos/fatfs-rtos_git.bb<br>
&#43;&#43;&#43; b/recipes-bsp/fatfs-rtos/fatfs-rtos_git.bb<br>
@@ -14,7 &#43;14,7 @@ PACKAGE_ARCH =3D &quot;${MACHINE_ARCH}&quot;<br>
&nbsp;<br>
&nbsp;PR =3D &quot;r0&quot;<br>
&nbsp;<br>
-DEPENDS_append =3D &quot; mmcsd-lld-rtos \<br>
&#43;DEPENDS:append =3D &quot; mmcsd-lld-rtos \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; osal-rtos \<br>
&nbsp;&quot;<br>
&nbsp;<br>
diff --git a/recipes-bsp/faultmanagement/faultmanagement-rtos_git.bb b/reci=
pes-bsp/faultmanagement/faultmanagement-rtos_git.bb<br>
index bf8aba6a..1050645c 100644<br>
--- a/recipes-bsp/faultmanagement/faultmanagement-rtos_git.bb<br>
&#43;&#43;&#43; b/recipes-bsp/faultmanagement/faultmanagement-rtos_git.bb<b=
r>
@@ -25,12 &#43;25,12 @@ PR =3D &quot;r0&quot;<br>
&nbsp;<br>
&nbsp;S =3D &quot;${WORKDIR}/${FAULT_MANAGEMENT_GIT_DESTSUFFIX}&quot;<br>
&nbsp;<br>
-DEPENDS_append_keystone =3D &quot; qmss-lld-rtos \<br>
&#43;DEPENDS:append_keystone =3D &quot; qmss-lld-rtos \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; cppi-lld-rtos \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; pa-lld-rtos \<br>
&nbsp;&quot;<br>
&nbsp;<br>
-DEPENDS_append_k2hk =3D &quot; aif2-lld-rtos \<br>
&#43;DEPENDS:append_k2hk =3D &quot; aif2-lld-rtos \<br>
&nbsp;&quot;<br>
&nbsp;# HTML doc link params<br>
&nbsp;PDK_COMP_LINK_TEXT =3D &quot;Fault Management&quot;<br>
diff --git a/recipes-bsp/fftc-lld/fftc-lld-rtos_git.bb b/recipes-bsp/fftc-l=
ld/fftc-lld-rtos_git.bb<br>
index c8668c99..7e5db229 100644<br>
--- a/recipes-bsp/fftc-lld/fftc-lld-rtos_git.bb<br>
&#43;&#43;&#43; b/recipes-bsp/fftc-lld/fftc-lld-rtos_git.bb<br>
@@ -14,7 &#43;14,7 @@ PACKAGE_ARCH =3D &quot;${MACHINE_ARCH}&quot;<br>
&nbsp;<br>
&nbsp;PR =3D &quot;r0&quot;<br>
&nbsp;<br>
-DEPENDS_append=3D &quot; qmss-lld-rtos \<br>
&#43;DEPENDS:append=3D &quot; qmss-lld-rtos \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cppi-lld-rtos \<br>
&nbsp;&quot;<br>
&nbsp;<br>
diff --git a/recipes-bsp/formfactor/formfactor_0.0.bbappend b/recipes-bsp/f=
ormfactor/formfactor_0.0.bbappend<br>
index 72d991c7..4fc41d05 100644<br>
--- a/recipes-bsp/formfactor/formfactor_0.0.bbappend<br>
&#43;&#43;&#43; b/recipes-bsp/formfactor/formfactor_0.0.bbappend<br>
@@ -1 &#43;1 @@<br>
-FILESEXTRAPATHS_prepend :=3D &quot;${THISDIR}/${PN}:&quot;<br>
&#43;FILESEXTRAPATHS:prepend :=3D &quot;${THISDIR}/${PN}:&quot;<br>
diff --git a/recipes-bsp/fvid2/fvid2-rtos_git.bb b/recipes-bsp/fvid2/fvid2-=
rtos_git.bb<br>
index 6219f0b3..f542e7df 100644<br>
--- a/recipes-bsp/fvid2/fvid2-rtos_git.bb<br>
&#43;&#43;&#43; b/recipes-bsp/fvid2/fvid2-rtos_git.bb<br>
@@ -14,7 &#43;14,7 @@ PACKAGE_ARCH =3D &quot;${MACHINE_ARCH}&quot;<br>
&nbsp;<br>
&nbsp;PR =3D &quot;r0&quot;<br>
&nbsp;<br>
-DEPENDS_append =3D &quot; osal-rtos \<br>
&#43;DEPENDS:append =3D &quot; osal-rtos \<br>
&nbsp;&quot;<br>
&nbsp;<br>
&nbsp;# Build with make instead of XDC<br>
@@ -62,6 &#43;62,6 @@ do_install() {<br>
&nbsp;&nbsp;&nbsp;&nbsp; find -name &quot;*.tar&quot; -exec tar xf {} --no-=
same-owner -C ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/drv/fvid2 \;<br>
&nbsp;}<br>
&nbsp;<br>
-FILES_${PN} &#43;=3D &quot;${PDK_INSTALL_DIR_RECIPE}/packages&quot;<br>
&#43;FILES:${PN} &#43;=3D &quot;${PDK_INSTALL_DIR_RECIPE}/packages&quot;<br=
>
&nbsp;<br>
-INSANE_SKIP_${PN} =3D &quot;arch ldflags&quot;<br>
&#43;INSANE_SKIP:${PN} =3D &quot;arch ldflags&quot;<br>
diff --git a/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb b/recip=
es-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb<br>
index d36bcd56..a7124ae7 100644<br>
--- a/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb<br>
&#43;&#43;&#43; b/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb<br=
>
@@ -7,7 &#43;7,7 @@ inherit module features_check<br>
&nbsp;<br>
&nbsp;REQUIRED_MACHINE_FEATURES =3D &quot;gc320&quot;<br>
&nbsp;<br>
-MACHINE_KERNEL_PR_append =3D &quot;i&quot;<br>
&#43;MACHINE_KERNEL_PR:append =3D &quot;i&quot;<br>
&nbsp;PR =3D &quot;${MACHINE_KERNEL_PR}&quot;<br>
&nbsp;<br>
&nbsp;# Need to branch out with ${PV} var<br>
diff --git a/recipes-bsp/goodix-fw/goodix-fw_git.bb b/recipes-bsp/goodix-fw=
/goodix-fw_git.bb<br>
index 0a9f3ff9..5131f8d9 100644<br>
--- a/recipes-bsp/goodix-fw/goodix-fw_git.bb<br>
&#43;&#43;&#43; b/recipes-bsp/goodix-fw/goodix-fw_git.bb<br>
@@ -26,4 &#43;26,4 @@ do_install() {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; install -m 0644 ${S}/ti-ev=
m/${ORIGIN} ${D}${base_libdir}/firmware/${TARGET}<br>
&nbsp;}<br>
&nbsp;<br>
-FILES_${PN} =3D &quot;${base_libdir}/firmware&quot;<br>
&#43;FILES:${PN} =3D &quot;${base_libdir}/firmware&quot;<br>
diff --git a/recipes-bsp/gpio-lld/gpio-lld-rtos_git.bb b/recipes-bsp/gpio-l=
ld/gpio-lld-rtos_git.bb<br>
index bfdb16ce..5f4ed6f4 100644<br>
--- a/recipes-bsp/gpio-lld/gpio-lld-rtos_git.bb<br>
&#43;&#43;&#43; b/recipes-bsp/gpio-lld/gpio-lld-rtos_git.bb<br>
@@ -15,13 &#43;15,13 @@ PACKAGE_ARCH =3D &quot;${MACHINE_ARCH}&quot;<br>
&nbsp;PR =3D &quot;r0&quot;<br>
&nbsp;<br>
&nbsp;<br>
-DEPENDS_append =3D &quot; osal-rtos \<br>
&#43;DEPENDS:append =3D &quot; osal-rtos \<br>
&nbsp;&quot;<br>
-DEPENDS_append_ti33x =3D &quot; starterware-rtos \<br>
&#43;DEPENDS:append_ti33x =3D &quot; starterware-rtos \<br>
&nbsp;&quot;<br>
-DEPENDS_append_ti43x =3D &quot; starterware-rtos \<br>
&#43;DEPENDS:append_ti43x =3D &quot; starterware-rtos \<br>
&nbsp;&quot;<br>
-DEPENDS_append_k3 =3D &quot; sciclient-rtos \<br>
&#43;DEPENDS:append_k3 =3D &quot; sciclient-rtos \<br>
&nbsp;&quot;<br>
&nbsp;<br>
&nbsp;# Build with make instead of XDC<br>
diff --git a/recipes-bsp/gpmc-lld/gpmc-lld-rtos_git.bb b/recipes-bsp/gpmc-l=
ld/gpmc-lld-rtos_git.bb<br>
index 6054d6b7..af669900 100644<br>
--- a/recipes-bsp/gpmc-lld/gpmc-lld-rtos_git.bb<br>
&#43;&#43;&#43; b/recipes-bsp/gpmc-lld/gpmc-lld-rtos_git.bb<br>
@@ -15,11 &#43;15,11 @@ PACKAGE_ARCH =3D &quot;${MACHINE_ARCH}&quot;<br>
&nbsp;<br>
&nbsp;PR =3D &quot;r0&quot;<br>
&nbsp;<br>
-DEPENDS_append =3D &quot; osal-rtos \<br>
&#43;DEPENDS:append =3D &quot; osal-rtos \<br>
&nbsp;&quot;<br>
-DEPENDS_append_ti33x =3D &quot; starterware-rtos \<br>
&#43;DEPENDS:append_ti33x =3D &quot; starterware-rtos \<br>
&nbsp;&quot;<br>
-DEPENDS_append_ti43x =3D &quot; starterware-rtos \<br>
&#43;DEPENDS:append_ti43x =3D &quot; starterware-rtos \<br>
&nbsp;&quot;<br>
&nbsp;<br>
&nbsp;# Build with make instead of XDC<br>
diff --git a/recipes-bsp/hplib/hplib-mod_git.bb b/recipes-bsp/hplib/hplib-m=
od_git.bb<br>
index c7217d73..c992b12f 100644<br>
--- a/recipes-bsp/hplib/hplib-mod_git.bb<br>
&#43;&#43;&#43; b/recipes-bsp/hplib/hplib-mod_git.bb<br>
@@ -7,7 &#43;7,7 @@ DEPENDS =3D &quot;hplib&quot;<br>
&nbsp;include hplib.inc<br>
&nbsp;<br>
&nbsp;# This package builds a kernel module, use kernel PR as base and appe=
nd a local<br>
-MACHINE_KERNEL_PR_append =3D &quot;b&quot;<br>
&#43;MACHINE_KERNEL_PR:append =3D &quot;b&quot;<br>
&nbsp;PR =3D &quot;${MACHINE_KERNEL_PR}&quot;<br>
&nbsp;<br>
&nbsp;S =3D&quot;${WORKDIR}/git/ti/runtime/hplib/module&quot;<br>
diff --git a/recipes-bsp/hplib/hplib-test_git.bb b/recipes-bsp/hplib/hplib-=
test_git.bb<br>
index 4ba79dbd..62294ef0 100644<br>
--- a/recipes-bsp/hplib/hplib-test_git.bb<br>
&#43;&#43;&#43; b/recipes-bsp/hplib/hplib-test_git.bb<br>
@@ -12,7 &#43;12,7 @@ CHOICELIST =3D &quot;yes no&quot;<br>
&nbsp;<br>
&nbsp;S =3D &quot;${WORKDIR}/git/ti/runtime/hplib&quot;<br>
&nbsp;<br>
-EXTRA_OEMAKE &#43;=3D '-f makefile_armv7 PDK_INSTALL_PATH=3D${STAGING_INCD=
IR}'<br>
&#43;EXTRA_OEMAKE &#43;=3D '-f makefile:armv7 PDK_INSTALL_PATH=3D${STAGING_=
INCDIR}'<br>
&nbsp;<br>
&nbsp;do_compile () {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for device in ${DEVICELIST=
}<br>
diff --git a/recipes-bsp/hplib/hplib_git.bb b/recipes-bsp/hplib/hplib_git.b=
b<br>
index 1423de5b..63eb0b1c 100644<br>
--- a/recipes-bsp/hplib/hplib_git.bb<br>
&#43;&#43;&#43; b/recipes-bsp/hplib/hplib_git.bb<br>
@@ -3,7 &#43;3,7 @@ LICENSE =3D &quot;BSD-3-Clause&quot;<br>
&nbsp;LIC_FILES_CHKSUM =3D &quot;<a href=3D"file://${WORKDIR}/git/ti/runtim=
e/hplib/src/COPYING.txt;md5=3Db7982a377c680ad71ca2fbb735982462">file://${WO=
RKDIR}/git/ti/runtime/hplib/src/COPYING.txt;md5=3Db7982a377c680ad71ca2fbb73=
5982462</a>&quot;<br>
&nbsp;<br>
&nbsp;DEPENDS =3D &quot;common-csl-ip rm-lld qmss-lld sa-lld pktlib&quot;<b=
r>
-RDEPENDS_${PN} =3D &quot;hplib-mod&quot;<br>
&#43;RDEPENDS:${PN} =3D &quot;hplib-mod&quot;<br>
&nbsp;<br>
&nbsp;include hplib.inc<br>
&nbsp;<br>
@@ -13,7 &#43;13,7 @@ CHOICELIST =3D &quot;yes no&quot;<br>
&nbsp;<br>
&nbsp;S =3D &quot;${WORKDIR}/git/ti/runtime/hplib&quot;<br>
&nbsp;<br>
-EXTRA_OEMAKE &#43;=3D &quot;-f makefile_armv7 PDK_INSTALL_PATH=3D${STAGING=
_INCDIR}&quot;<br>
&#43;EXTRA_OEMAKE &#43;=3D &quot;-f makefile:armv7 PDK_INSTALL_PATH=3D${STA=
GING_INCDIR}&quot;<br>
&nbsp;<br>
&nbsp;do_compile () {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for device in ${DEVICELIST=
}<br>
diff --git a/recipes-bsp/hyplnk-lld/hyplnk-lld-rtos_git.bb b/recipes-bsp/hy=
plnk-lld/hyplnk-lld-rtos_git.bb<br>
index 3be848b3..e86c1d4d 100644<br>
--- a/recipes-bsp/hyplnk-lld/hyplnk-lld-rtos_git.bb<br>
&#43;&#43;&#43; b/recipes-bsp/hyplnk-lld/hyplnk-lld-rtos_git.bb<br>
@@ -6,7 &#43;6,7 @@ require recipes-bsp/hyplnk-lld/hyplnk-lld.inc<br>
&nbsp;<br>
&nbsp;PR =3D &quot;${INC_PR}.0&quot;<br>
&nbsp;<br>
-COMPATIBLE_MACHINE_append =3D &quot;|c66x&quot;<br>
&#43;COMPATIBLE_MACHINE:append =3D &quot;|c66x&quot;<br>
&nbsp;<br>
&nbsp;# HTML doc link params<br>
&nbsp;PDK_COMP_LINK_TEXT =3D &quot;HYPLNK LLD&quot;<br>
diff --git a/recipes-bsp/hyplnk-lld/hyplnk-lld-test_git.bb b/recipes-bsp/hy=
plnk-lld/hyplnk-lld-test_git.bb<br>
index 31b69c26..acf44023 100644<br>
--- a/recipes-bsp/hyplnk-lld/hyplnk-lld-test_git.bb<br>
&#43;&#43;&#43; b/recipes-bsp/hyplnk-lld/hyplnk-lld-test_git.bb<br>
@@ -5,11 &#43;5,11 @@ PR =3D &quot;${INC_PR}.0&quot;<br>
&nbsp;DEPENDS =3D &quot;common-csl-ip hyplnk-lld&quot;<br>
&nbsp;<br>
&nbsp;do_compile () {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; make -f makefile_armv7 clean PDK_INST=
ALL_PATH=3D&quot;${STAGING_INCDIR}&quot; \<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; make -f makefile:armv7 clean PDK_=
INSTALL_PATH=3D&quot;${STAGING_INCDIR}&quot; \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; HYPLNK_SRC_DIR=3D&quot;${S}&quot;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for device in ${DEVICELIST=
}<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; do<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; make -f makefile_armv7 tests examples \<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; make -f makefile:armv7 tests examples \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PDK_I=
NSTALL_PATH=3D&quot;${STAGING_INCDIR}&quot; \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DEVIC=
E=3D&quot;$device&quot; HYPLNK_SRC_DIR=3D&quot;${S}&quot;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; done<br>
@@ -18,7 &#43;18,7 @@ do_compile () {<br>
&nbsp;do_install () {<br>
&nbsp;&nbsp;&nbsp;&nbsp; for device in ${DEVICELIST}<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; do<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; make -f makefile_armv7 installbin \<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; make -f makefile:armv7 installbin \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PDK_I=
NSTALL_PATH=3D&quot;${STAGING_INCDIR}&quot; DEVICE=3D&quot;$device&quot; \<=
br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; HYPLN=
K_SRC_DIR=3D&quot;${S}&quot; \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; INSTA=
LL_BIN_BASE_DIR=3D&quot;${D}/${bindir}&quot;<br>
diff --git a/recipes-bsp/hyplnk-lld/hyplnk-lld_git.bb b/recipes-bsp/hyplnk-=
lld/hyplnk-lld_git.bb<br>
index 7848df1d..a7051ec8 100644<br>
--- a/recipes-bsp/hyplnk-lld/hyplnk-lld_git.bb<br>
&#43;&#43;&#43; b/recipes-bsp/hyplnk-lld/hyplnk-lld_git.bb<br>
@@ -5,17 &#43;5,17 @@ PR =3D &quot;${INC_PR}.1&quot;<br>
&nbsp;DEPENDS =3D &quot;common-csl-ip&quot;<br>
&nbsp;<br>
&nbsp;do_compile () {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; make -f makefile_armv7 clean PDK_INST=
ALL_PATH=3D&quot;${STAGING_INCDIR}&quot; \<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; make -f makefile:armv7 clean PDK_=
INSTALL_PATH=3D&quot;${STAGING_INCDIR}&quot; \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; HYPLNK_SRC_DIR=3D&quot;${S}&quot;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for device in ${DEVICELIST=
}<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; do<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; make -f makefile_armv7 lib PDK_INSTALL_PATH=3D&quot;${STAGING_IN=
CDIR}&quot;\<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; make -f makefile:armv7 lib PDK_INSTALL_PATH=3D&quot;${STAGIN=
G_INCDIR}&quot;\<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DEVIC=
E=3D&quot;$device&quot; HYPLNK_SRC_DIR=3D&quot;${S}&quot;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; done<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;do_install () {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; make -f makefile_armv7 install PDK_IN=
STALL_PATH=3D&quot;${STAGING_INCDIR}&quot; \<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; make -f makefile:armv7 install PD=
K_INSTALL_PATH=3D&quot;${STAGING_INCDIR}&quot; \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; INSTALL_INC_BASE_DIR=3D&quot;${D}/${includedir}&quot;=
 \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; INSTALL_LIB_BASE_DIR=3D&quot;${D}${libdir}&quot; HYPL=
NK_SRC_DIR=3D&quot;${S}&quot;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; chown -R root:root ${D}<br=
>
diff --git a/recipes-bsp/i2c-lld/i2c-lld-rtos_git.bb b/recipes-bsp/i2c-lld/=
i2c-lld-rtos_git.bb<br>
index 5a3c1d64..ce7ed1a5 100644<br>
--- a/recipes-bsp/i2c-lld/i2c-lld-rtos_git.bb<br>
&#43;&#43;&#43; b/recipes-bsp/i2c-lld/i2c-lld-rtos_git.bb<br>
@@ -15,21 &#43;15,21 @@ PACKAGE_ARCH =3D &quot;${MACHINE_ARCH}&quot;<br>
&nbsp;<br>
&nbsp;PR =3D &quot;r0&quot;<br>
&nbsp;<br>
-DEPENDS_append =3D &quot; osal-rtos \<br>
&#43;DEPENDS:append =3D &quot; osal-rtos \<br>
&nbsp;&quot;<br>
-DEPENDS_append_ti33x =3D &quot; starterware-rtos \<br>
&#43;DEPENDS:append_ti33x =3D &quot; starterware-rtos \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 pruss-lld-rtos \<br>
&nbsp;&quot;<br>
-DEPENDS_append_ti43x =3D &quot; starterware-rtos \<br>
&#43;DEPENDS:append_ti43x =3D &quot; starterware-rtos \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 pruss-lld-rtos \<br>
&nbsp;&quot;<br>
-DEPENDS_append_am57xx-evm =3D &quot; pruss-lld-rtos \<br>
&#43;DEPENDS:append_am57xx-evm =3D &quot; pruss-lld-rtos \<br>
&nbsp;&quot;<br>
&nbsp;<br>
-DEPENDS_append_k2g =3D &quot; pruss-lld-rtos \<br>
&#43;DEPENDS:append_k2g =3D &quot; pruss-lld-rtos \<br>
&nbsp;&quot;<br>
&nbsp;<br>
-DEPENDS_append_j7 =3D &quot; sciclient-rtos \<br>
&#43;DEPENDS:append_j7 =3D &quot; sciclient-rtos \<br>
&nbsp;&quot;<br>
&nbsp;<br>
&nbsp;# Build with make instead of XDC<br>
@@ -39,7 &#43;39,7 @@ TI_PDK_XDCMAKE =3D &quot;0&quot;<br>
&nbsp;export PDK_I2C_ROOT_PATH =3D&quot;${WORKDIR}/build&quot;<br>
&nbsp;export DEST_ROOT=3D&quot;${S}&quot;<br>
&nbsp;<br>
-INSANE_SKIP_${PN} =3D &quot;arch&quot;<br>
&#43;INSANE_SKIP:${PN} =3D &quot;arch&quot;<br>
&nbsp;<br>
&nbsp;# HTML doc link params<br>
&nbsp;PDK_COMP_LINK_TEXT =3D &quot;I2C LLD&quot;<br>
diff --git a/recipes-bsp/ibl-boot/ibl-boot-rtos_git.bb b/recipes-bsp/ibl-bo=
ot/ibl-boot-rtos_git.bb<br>
index 59b75b3a..1e072272 100644<br>
--- a/recipes-bsp/ibl-boot/ibl-boot-rtos_git.bb<br>
&#43;&#43;&#43; b/recipes-bsp/ibl-boot/ibl-boot-rtos_git.bb<br>
@@ -33,7 &#43;33,7 @@ PR =3D &quot;r2&quot;<br>
&nbsp;<br>
&nbsp;S =3D &quot;${WORKDIR}/git&quot;<br>
&nbsp;<br>
-PATH_prepend =3D &quot;${TI_CGT6X_7_INSTALL_DIR}/bin:&quot;<br>
&#43;PATH:prepend =3D &quot;${TI_CGT6X_7_INSTALL_DIR}/bin:&quot;<br>
&nbsp;<br>
&nbsp;IBLTARGETS =3D &quot;&quot;<br>
&nbsp;IBLTARGETS_c665x-evm =3D &quot;evm_c6657_i2c&quot;<br>
@@ -66,10 &#43;66,10 @@ do_install() {<br>
&nbsp;&nbsp;&nbsp;&nbsp; cp -rP --preserve=3Dmode,links,timestamps --no-pre=
serve=3Downership * ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/boot/ibl<br>
&nbsp;}<br>
&nbsp;<br>
-FILES_${PN} &#43;=3D &quot;${PDK_INSTALL_DIR_RECIPE}/packages&quot;<br>
&#43;FILES:${PN} &#43;=3D &quot;${PDK_INSTALL_DIR_RECIPE}/packages&quot;<br=
>
&nbsp;<br>
&nbsp;INHIBIT_PACKAGE_STRIP =3D &quot;1&quot;<br>
&nbsp;INHIBIT_SYSROOT_STRIP =3D &quot;1&quot;<br>
&nbsp;INHIBIT_PACKAGE_DEBUG_SPLIT =3D &quot;1&quot;<br>
&nbsp;<br>
-INSANE_SKIP_${PN} =3D &quot;arch file-rdeps&quot;<br>
&#43;INSANE_SKIP:${PN} =3D &quot;arch file-rdeps&quot;<br>
diff --git a/recipes-bsp/icss-emac-lld/icss-emac-lld-rtos_git.bb b/recipes-=
bsp/icss-emac-lld/icss-emac-lld-rtos_git.bb<br>
index 882ce997..0c0fc6b8 100644<br>
--- a/recipes-bsp/icss-emac-lld/icss-emac-lld-rtos_git.bb<br>
&#43;&#43;&#43; b/recipes-bsp/icss-emac-lld/icss-emac-lld-rtos_git.bb<br>
@@ -5,12 &#43;5,12 @@ require icss-emac-lld.inc<br>
&nbsp;<br>
&nbsp;PR =3D &quot;${INC_PR}.0&quot;<br>
&nbsp;<br>
-DEPENDS_append =3D &quot; osal-rtos \<br>
&#43;DEPENDS:append =3D &quot; osal-rtos \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pruss-lld-rtos \<br>
&nbsp;&quot;<br>
-DEPENDS_append_ti33x =3D &quot; starterware-rtos \<br>
&#43;DEPENDS:append_ti33x =3D &quot; starterware-rtos \<br>
&nbsp;&quot;<br>
-DEPENDS_append_ti43x =3D &quot; starterware-rtos \<br>
&#43;DEPENDS:append_ti43x =3D &quot; starterware-rtos \<br>
&nbsp;&quot;<br>
&nbsp;<br>
&nbsp;# Build with make instead of XDC<br>
@@ -22,4 &#43;22,4 @@ export DEST_ROOT=3D&quot;${S}&quot;<br>
&nbsp;# HTML doc link params<br>
&nbsp;PDK_COMP_LINK_TEXT =3D &quot;ICSS-EMAC LLD&quot;<br>
&nbsp;<br>
-INSANE_SKIP_${PN} =3D &quot;arch&quot;<br>
&#43;INSANE_SKIP:${PN} =3D &quot;arch&quot;<br>
diff --git a/recipes-bsp/icss-emac-lld/icss-emac-lld-test_git.bb b/recipes-=
bsp/icss-emac-lld/icss-emac-lld-test_git.bb<br>
index 5093d7ce..badef253 100644<br>
--- a/recipes-bsp/icss-emac-lld/icss-emac-lld-test_git.bb<br>
&#43;&#43;&#43; b/recipes-bsp/icss-emac-lld/icss-emac-lld-test_git.bb<br>
@@ -2,14 &#43;2,14 @@ DESCRIPTION =3D &quot;TI ICSS-EMAC low level driver t=
ests&quot;<br>
&nbsp;<br>
&nbsp;DEPENDS=3D&quot;common-csl-ip pruss-lld icss-emac-lld osal ti-pdk-bui=
ld-rtos icss-emac-lld-rtos&quot;<br>
&nbsp;<br>
-DEPENDS_append_ti33x =3D &quot; starterware&quot;<br>
-DEPENDS_append_ti43x =3D &quot; starterware&quot;<br>
&#43;DEPENDS:append_ti33x =3D &quot; starterware&quot;<br>
&#43;DEPENDS:append_ti43x =3D &quot; starterware&quot;<br>
&nbsp;<br>
&nbsp;include icss-emac-lld.inc<br>
&nbsp;<br>
&nbsp;PR =3D &quot;${INC_PR}.0&quot;<br>
&nbsp;<br>
-EXTRA_OEMAKE &#43;=3D &quot;-f makefile_armv7 PDK_INSTALL_PATH=3D${STAGING=
_INCDIR} PDK_PKG_PATH=3D${STAGING_DATADIR}/ti/ti-pdk-tree/packages ICSS_EMA=
C_SRC_DIR=3D${S}&quot;<br>
&#43;EXTRA_OEMAKE &#43;=3D &quot;-f makefile:armv7 PDK_INSTALL_PATH=3D${STA=
GING_INCDIR} PDK_PKG_PATH=3D${STAGING_DATADIR}/ti/ti-pdk-tree/packages ICSS=
_EMAC_SRC_DIR=3D${S}&quot;<br>
&nbsp;<br>
&nbsp;DEVICE_LIST ?=3D &quot;${TI_PDK_LIMIT_SOCS}&quot;<br>
&nbsp;<br>
diff --git a/recipes-bsp/icss-emac-lld/icss-emac-lld_git.bb b/recipes-bsp/i=
css-emac-lld/icss-emac-lld_git.bb<br>
index 4c305db6..1e5b1f2a 100644<br>
--- a/recipes-bsp/icss-emac-lld/icss-emac-lld_git.bb<br>
&#43;&#43;&#43; b/recipes-bsp/icss-emac-lld/icss-emac-lld_git.bb<br>
@@ -11,7 &#43;11,7 @@ TARGET_NAME_ti33x =3D &quot;SOC_AM335x&quot;<br>
&nbsp;TARGET_NAME_ti43x =3D &quot;SOC_AM437x&quot;<br>
&nbsp;TARGET_NAME_k2g =3D &quot;SOC_K2G&quot;<br>
&nbsp;<br>
-EXTRA_OEMAKE &#43;=3D &quot;-f makefile_armv7 PDK_INSTALL_PATH=3D${STAGING=
_INCDIR} TARGET=3D${TARGET_NAME}&quot;<br>
&#43;EXTRA_OEMAKE &#43;=3D &quot;-f makefile:armv7 PDK_INSTALL_PATH=3D${STA=
GING_INCDIR} TARGET=3D${TARGET_NAME}&quot;<br>
&nbsp;<br>
&nbsp;do_compile () {<br>
&nbsp;#&nbsp;&nbsp; Build the lib<br>
diff --git a/recipes-bsp/iolink-lld/iolink-lld-rtos_git.bb b/recipes-bsp/io=
link-lld/iolink-lld-rtos_git.bb<br>
index c0c27b60..d50c19f3 100644<br>
--- a/recipes-bsp/iolink-lld/iolink-lld-rtos_git.bb<br>
&#43;&#43;&#43; b/recipes-bsp/iolink-lld/iolink-lld-rtos_git.bb<br>
@@ -14,9 &#43;14,9 @@ PACKAGE_ARCH =3D &quot;${MACHINE_ARCH}&quot;<br>
&nbsp;<br>
&nbsp;PR =3D &quot;r2&quot;<br>
&nbsp;<br>
-DEPENDS_append =3D &quot; osal-rtos \<br>
&#43;DEPENDS:append =3D &quot; osal-rtos \<br>
&nbsp;&quot;<br>
-DEPENDS_append_ti43x =3D &quot; starterware-rtos \<br>
&#43;DEPENDS:append_ti43x =3D &quot; starterware-rtos \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 pruss-lld-rtos \<br>
&nbsp;&quot;<br>
&nbsp;<br>
@@ -27,7 &#43;27,7 @@ TI_PDK_XDCMAKE =3D &quot;0&quot;<br>
&nbsp;export PDK_IOLINK_ROOT_PATH =3D&quot;${WORKDIR}/build&quot;<br>
&nbsp;export DEST_ROOT=3D&quot;${S}&quot;<br>
&nbsp;<br>
-INSANE_SKIP_${PN} =3D &quot;arch&quot;<br>
&#43;INSANE_SKIP:${PN} =3D &quot;arch&quot;<br>
&nbsp;<br>
&nbsp;# HTML doc link params<br>
&nbsp;PDK_COMP_LINK_TEXT =3D &quot;IOLINK LLD&quot;<br>
diff --git a/recipes-bsp/ipc-lld/ipc-lld-examples-rtos_git.bb b/recipes-bsp=
/ipc-lld/ipc-lld-examples-rtos_git.bb<br>
index 79e5bdb9..c905fe4b 100644<br>
--- a/recipes-bsp/ipc-lld/ipc-lld-examples-rtos_git.bb<br>
&#43;&#43;&#43; b/recipes-bsp/ipc-lld/ipc-lld-examples-rtos_git.bb<br>
@@ -62,7 &#43;62,7 @@ do_install() {<br>
&nbsp;&nbsp;&nbsp;&nbsp; done<br>
&nbsp;}<br>
&nbsp;<br>
-do_install_append_j7() {<br>
&#43;do_install:append_j7() {<br>
&nbsp;&nbsp;&nbsp;&nbsp; #copy ipc_echo_testb binaries for J721<br>
&nbsp;&nbsp;&nbsp;&nbsp; install -m 0644 ${REMOTE_FWB_BIN_DIR}/$board/ipc_e=
cho_testb_mcu1_0_release.xer5f ${D}${DST_BIN_PATH}<br>
&nbsp;&nbsp;&nbsp;&nbsp; install -m 0644 ${REMOTE_FWB_BIN_DIR}/$board/ipc_e=
cho_testb_mcu1_1_release.xer5f ${D}${DST_BIN_PATH}<br>
@@ -79,16 &#43;79,16 @@ do_install_append_j7() {<br>
&nbsp;&nbsp;&nbsp;&nbsp; install -m 0644 ${REMOTE_FWB_BIN_DIR}/$board/ipc_e=
cho_testb_mcu3_1_release_strip.xer5f ${D}${DST_BIN_PATH}<br>
&nbsp;}<br>
&nbsp;<br>
-do_install_append_am65xx() {<br>
&#43;do_install:append_am65xx() {<br>
&nbsp;&nbsp;&nbsp;&nbsp; cp ${CP_ARGS} ${REMOTE_FW_DIR}/ex04_linux_baremeta=
l_2core_echo_test/bin -d ${D}/ex04_linux_baremetal_2core_echo_test<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;# Set up names for the firmwares<br>
-ALTERNATIVE_${PN}_am65xx =3D &quot;\<br>
&#43;ALTERNATIVE:${PN}_am65xx =3D &quot;\<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; am65x-mcu-r5f0_0-fw \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; am65x-mcu-r5f0_1-fw \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;<br>
-ALTERNATIVE_${PN}_j7 =3D &quot;\<br>
&#43;ALTERNATIVE:${PN}_j7 =3D &quot;\<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; j7-mcu-r5f0_0-fw \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; j7-mcu-r5f0_1-fw \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; j7-main-r5f0_0-fw \<br>
@@ -149,14 &#43;149,14 @@ ALTERNATIVE_PRIORITY =3D &quot;10&quot;<br>
&nbsp;PACKAGES =3D&#43; &quot;${PN}-rtos&quot;<br>
&nbsp;<br>
&nbsp;# make sure that lib/firmware, and all its contents are part of the p=
ackage<br>
-FILES_${PN} &#43;=3D &quot;${base_libdir}/firmware&quot;<br>
&#43;FILES:${PN} &#43;=3D &quot;${base_libdir}/firmware&quot;<br>
&nbsp;<br>
-FILES_${PN}-rtos &#43;=3D &quot;ex02_bios_multicore_echo_test&quot;<br>
-FILES_${PN}-rtos &#43;=3D &quot;ex01_bios_2core_echo_test&quot;<br>
-FILES_${PN}-rtos &#43;=3D &quot;ex03_linux_bios_2core_echo_test&quot;<br>
-FILES_${PN}-rtos &#43;=3D &quot;ex04_linux_baremetal_2core_echo_test&quot;=
<br>
&#43;FILES:${PN}-rtos &#43;=3D &quot;ex02_bios_multicore_echo_test&quot;<br=
>
&#43;FILES:${PN}-rtos &#43;=3D &quot;ex01_bios_2core_echo_test&quot;<br>
&#43;FILES:${PN}-rtos &#43;=3D &quot;ex03_linux_bios_2core_echo_test&quot;<=
br>
&#43;FILES:${PN}-rtos &#43;=3D &quot;ex04_linux_baremetal_2core_echo_test&q=
uot;<br>
&nbsp;<br>
-INSANE_SKIP_${PN} =3D &quot;arch ldflags file-rdeps&quot;<br>
-INSANE_SKIP_${PN}-rtos =3D &quot;arch ldflags file-rdeps&quot;<br>
&#43;INSANE_SKIP:${PN} =3D &quot;arch ldflags file-rdeps&quot;<br>
&#43;INSANE_SKIP:${PN}-rtos =3D &quot;arch ldflags file-rdeps&quot;<br>
&nbsp;<br>
-INSANE_SKIP_${PN}-dbg =3D &quot;arch&quot;<br>
&#43;INSANE_SKIP:${PN}-dbg =3D &quot;arch&quot;<br>
diff --git a/recipes-bsp/ipc-lld/ipc-lld-fw_git.bb b/recipes-bsp/ipc-lld/ip=
c-lld-fw_git.bb<br>
index 1be28365..dd76de54 100644<br>
--- a/recipes-bsp/ipc-lld/ipc-lld-fw_git.bb<br>
&#43;&#43;&#43; b/recipes-bsp/ipc-lld/ipc-lld-fw_git.bb<br>
@@ -26,21 &#43;26,21 @@ PLATFORM_am65xx =3D &quot;am65xx&quot;<br>
&nbsp;PLATFORM_j7 =3D &quot;j7-evm&quot;<br>
&nbsp;<br>
&nbsp;# make sure that lib/firmware, and all its contents are part of the p=
ackage<br>
-FILES_${PN} &#43;=3D &quot;${base_libdir}/firmware&quot;<br>
&#43;FILES:${PN} &#43;=3D &quot;${base_libdir}/firmware&quot;<br>
&nbsp;<br>
&nbsp;# install all R5 &amp; DSP ipc echo test binaries in lib/firmware/pdk=
-ipc, with softlinks up a level<br>
&nbsp;do_install() {<br>
&nbsp;&nbsp;&nbsp;&nbsp; install -d ${D}${base_libdir}/firmware/pdk-ipc<br>
&nbsp;}<br>
&nbsp;<br>
-do_install_append_am65xx() {<br>
&#43;do_install:append_am65xx() {<br>
&nbsp;&nbsp;&nbsp;&nbsp; install -m 0644 ${AM65X_R5_FW_DIR}/ipc_echo_test_m=
cu1_0_release.xer5f ${D}${base_libdir}/firmware/pdk-ipc/<br>
&nbsp;&nbsp;&nbsp;&nbsp; install -m 0644 ${AM65X_R5_FW_DIR}/ipc_echo_test_m=
cu1_0_release.strip.xer5f ${D}${base_libdir}/firmware/pdk-ipc/<br>
&nbsp;&nbsp;&nbsp;&nbsp; install -m 0644 ${AM65X_R5_FW_DIR}/ipc_echo_test_m=
cu1_1_release.xer5f ${D}${base_libdir}/firmware/pdk-ipc/<br>
&nbsp;&nbsp;&nbsp;&nbsp; install -m 0644 ${AM65X_R5_FW_DIR}/ipc_echo_test_m=
cu1_1_release.strip.xer5f ${D}${base_libdir}/firmware/pdk-ipc/<br>
&nbsp;}<br>
&nbsp;<br>
-do_install_append_j7() {<br>
&#43;do_install:append_j7() {<br>
&nbsp;&nbsp;&nbsp;&nbsp; install -m 0644 ${J721E_R5_DSP_FW_DIR}/ipc_echo_te=
st_mcu1_0_release.xer5f ${D}${base_libdir}/firmware/pdk-ipc/<br>
&nbsp;&nbsp;&nbsp;&nbsp; install -m 0644 ${J721E_R5_DSP_FW_DIR}/ipc_echo_te=
st_mcu1_0_release.strip.xer5f ${D}${base_libdir}/firmware/pdk-ipc/<br>
&nbsp;&nbsp;&nbsp;&nbsp; install -m 0644 ${J721E_R5_DSP_FW_DIR}/ipc_echo_te=
stb_mcu1_0_release.xer5f ${D}${base_libdir}/firmware/pdk-ipc/<br>
@@ -74,11 &#43;74,11 @@ do_install_append_j7() {<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;# Set up names for the firmwares<br>
-ALTERNATIVE_${PN}_am65xx =3D &quot;\<br>
&#43;ALTERNATIVE:${PN}_am65xx =3D &quot;\<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; am65x-mcu-r5f0_0-fw \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; am65x-mcu-r5f0_1-fw \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;<br>
-ALTERNATIVE_${PN}_j7 =3D &quot;\<br>
&#43;ALTERNATIVE:${PN}_j7 =3D &quot;\<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; j7-mcu-r5f0_0-fw \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; j7-mcu-r5f0_1-fw \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; j7-main-r5f0_0-fw \<br>
@@ -189,7 &#43;189,7 @@ INHIBIT_SYSROOT_STRIP =3D &quot;1&quot;<br>
&nbsp;# This is used to prevent the build system to split the debug info in=
 a separate file<br>
&nbsp;INHIBIT_PACKAGE_DEBUG_SPLIT =3D &quot;1&quot;<br>
&nbsp;# As it likely to be a different arch from the Yocto build, disable c=
hecking by adding &quot;arch&quot; to INSANE_SKIP<br>
-INSANE_SKIP_${PN} &#43;=3D &quot;arch&quot;<br>
&#43;INSANE_SKIP:${PN} &#43;=3D &quot;arch&quot;<br>
&nbsp;<br>
&nbsp;# we don't want to configure and build the source code<br>
&nbsp;do_compile[noexec] =3D &quot;1&quot;<br>
diff --git a/recipes-bsp/ipc-lld/ipc-lld-rtos_git.bb b/recipes-bsp/ipc-lld/=
ipc-lld-rtos_git.bb<br>
index e005ea70..34f1f035 100644<br>
--- a/recipes-bsp/ipc-lld/ipc-lld-rtos_git.bb<br>
&#43;&#43;&#43; b/recipes-bsp/ipc-lld/ipc-lld-rtos_git.bb<br>
@@ -38,8 &#43;38,8 @@ do_install() {<br>
&nbsp;&nbsp;&nbsp;&nbsp; find -name &quot;*.tar&quot; -exec tar xf {} --no-=
same-owner -C ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/drv/ipc \;<br>
&nbsp;}<br>
&nbsp;<br>
-FILES_${PN} &#43;=3D &quot;${PDK_INSTALL_DIR_RECIPE}/packages&quot;<br>
&#43;FILES:${PN} &#43;=3D &quot;${PDK_INSTALL_DIR_RECIPE}/packages&quot;<br=
>
&nbsp;<br>
-INSANE_SKIP_${PN} =3D &quot;arch ldflags file-rdeps&quot;<br>
&#43;INSANE_SKIP:${PN} =3D &quot;arch ldflags file-rdeps&quot;<br>
&nbsp;<br>
-INSANE_SKIP_${PN}-dbg =3D &quot;arch&quot;<br>
&#43;INSANE_SKIP:${PN}-dbg =3D &quot;arch&quot;<br>
diff --git a/recipes-bsp/ipc-lld/ipc-lld.inc b/recipes-bsp/ipc-lld/ipc-lld.=
inc<br>
index 2aea055f..57cdaee9 100644<br>
--- a/recipes-bsp/ipc-lld/ipc-lld.inc<br>
&#43;&#43;&#43; b/recipes-bsp/ipc-lld/ipc-lld.inc<br>
@@ -26,4 &#43;26,4 @@ PDK_COMP_LINK_TEXT =3D &quot;IPCLLD&quot;<br>
&nbsp;<br>
&nbsp;EXTRA_OEMAKE =3D &quot;PDK_INSTALL_PATH=3D${PDK_INSTALL_PATH} &quot;<=
br>
&nbsp;<br>
-TI_PDK_LIMIT_CORES_append_am65xx-evm =3D &quot; mcu1_1 &quot;<br>
&#43;TI_PDK_LIMIT_CORES:append_am65xx-evm =3D &quot; mcu1_1 &quot;<br>
diff --git a/recipes-bsp/ipumm-fw/ipumm-fw_git.bb b/recipes-bsp/ipumm-fw/ip=
umm-fw_git.bb<br>
index 380c274a..14d28258 100644<br>
--- a/recipes-bsp/ipumm-fw/ipumm-fw_git.bb<br>
&#43;&#43;&#43; b/recipes-bsp/ipumm-fw/ipumm-fw_git.bb<br>
@@ -9,7 &#43;9,7 @@ inherit features_check<br>
&nbsp;<br>
&nbsp;REQUIRED_MACHINE_FEATURES =3D &quot;mmip&quot;<br>
&nbsp;<br>
-RDEPENDS_${PN} =3D &quot;libdce&quot;<br>
&#43;RDEPENDS:${PN} =3D &quot;libdce&quot;<br>
&nbsp;<br>
&nbsp;SRC_URI =3D &quot;git://git.ti.com/ivimm/ipumm.git;protocol=3Dgit&quo=
t;<br>
&nbsp;<br>
@@ -59,9 &#43;59,9 @@ do_install() {<br>
&nbsp;&nbsp;&nbsp;&nbsp; install -m 0644 ${S}/${TARGET_MAP} ${D}${base_libd=
ir}/firmware/${TARGET}.map<br>
&nbsp;}<br>
&nbsp;<br>
-ALTERNATIVE_${PN} =3D &quot;dra7-ipu2-fw.xem4&quot;<br>
&#43;ALTERNATIVE:${PN} =3D &quot;dra7-ipu2-fw.xem4&quot;<br>
&nbsp;ALTERNATIVE_LINK_NAME[dra7-ipu2-fw.xem4] =3D &quot;${base_libdir}/fir=
mware/${TARGET}&quot;<br>
&nbsp;ALTERNATIVE_TARGET[dra7-ipu2-fw.xem4] =3D &quot;${base_libdir}/firmwa=
re/${TARGET}.${BPN}&quot;<br>
&nbsp;ALTERNATIVE_PRIORITY =3D &quot;20&quot;<br>
&nbsp;<br>
-FILES_${PN} &#43;=3D &quot;${base_libdir}/firmware/*&quot;<br>
&#43;FILES:${PN} &#43;=3D &quot;${base_libdir}/firmware/*&quot;<br>
diff --git a/recipes-bsp/iqn2-lld/iqn2-lld-test_git.bb b/recipes-bsp/iqn2-l=
ld/iqn2-lld-test_git.bb<br>
index f276c4b3..3a6da221 100644<br>
--- a/recipes-bsp/iqn2-lld/iqn2-lld-test_git.bb<br>
&#43;&#43;&#43; b/recipes-bsp/iqn2-lld/iqn2-lld-test_git.bb<br>
@@ -6,7 &#43;6,7 @@ include iqn2-lld.inc<br>
&nbsp;<br>
&nbsp;PR =3D &quot;${INC_PR}.0&quot;<br>
&nbsp;<br>
-EXTRA_OEMAKE =3D &quot;-f makefile_armv7 PDK_INSTALL_PATH=3D${STAGING_INCD=
IR} IQN2_SRC_DIR=3D${WORKDIR}/git&quot;<br>
&#43;EXTRA_OEMAKE =3D &quot;-f makefile:armv7 PDK_INSTALL_PATH=3D${STAGING_=
INCDIR} IQN2_SRC_DIR=3D${WORKDIR}/git&quot;<br>
&nbsp;<br>
&nbsp;do_compile () {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; oe_runmake clean DEVICE=3D=
k2l<br>
diff --git a/recipes-bsp/iqn2-lld/iqn2-lld_git.bb b/recipes-bsp/iqn2-lld/iq=
n2-lld_git.bb<br>
index a0c2ef87..a342f6c2 100644<br>
--- a/recipes-bsp/iqn2-lld/iqn2-lld_git.bb<br>
&#43;&#43;&#43; b/recipes-bsp/iqn2-lld/iqn2-lld_git.bb<br>
@@ -6,7 &#43;6,7 @@ include iqn2-lld.inc<br>
&nbsp;<br>
&nbsp;PR =3D &quot;${INC_PR}.0&quot;<br>
&nbsp;<br>
-EXTRA_OEMAKE =3D &quot;-f makefile_armv7 PDK_INSTALL_PATH=3D${STAGING_INCD=
IR}&quot;<br>
&#43;EXTRA_OEMAKE =3D &quot;-f makefile:armv7 PDK_INSTALL_PATH=3D${STAGING_=
INCDIR}&quot;<br>
&nbsp;<br>
&nbsp;do_configure () {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sed -i -e 's/march=3Darmv7=
-a/march=3Darmv7ve/' build/armv7/libiqn2_aearmv7.mk<br>
diff --git a/recipes-bsp/mad-utils/mad-utils-rtos_git.bb b/recipes-bsp/mad-=
utils/mad-utils-rtos_git.bb<br>
index 0144aad2..6eed9786 100644<br>
--- a/recipes-bsp/mad-utils/mad-utils-rtos_git.bb<br>
&#43;&#43;&#43; b/recipes-bsp/mad-utils/mad-utils-rtos_git.bb<br>
@@ -23,7 &#43;23,7 @@ PR =3D &quot;r0&quot;<br>
&nbsp;S =3D &quot;${WORKDIR}/git&quot;<br>
&nbsp;<br>
&nbsp;export C6X_BASE_DIR=3D&quot;${TI_CGT6X_7_INSTALL_DIR}&quot;<br>
-PATH_prepend =3D &quot;${TI_CGT6X_7_INSTALL_DIR}/bin:&quot;<br>
&#43;PATH:prepend =3D &quot;${TI_CGT6X_7_INSTALL_DIR}/bin:&quot;<br>
&nbsp;<br>
&nbsp;DEVICE =3D &quot;&quot;<br>
&nbsp;DEVICE_c665x-evm =3D &quot;C6657&quot;<br>
@@ -52,6 &#43;52,6 @@ do_install() {<br>
&nbsp;&nbsp;&nbsp;&nbsp; cp -rP --preserve=3Dmode,links,timestamps --no-pre=
serve=3Downership * ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/boot/mad-util=
s<br>
&nbsp;}<br>
&nbsp;<br>
-FILES_${PN} &#43;=3D &quot;${PDK_INSTALL_DIR_RECIPE}/packages/ti/boot/mad-=
utils&quot;<br>
&#43;FILES:${PN} &#43;=3D &quot;${PDK_INSTALL_DIR_RECIPE}/packages/ti/boot/=
mad-utils&quot;<br>
&nbsp;<br>
-INSANE_SKIP_${PN} &#43;=3D &quot;arch staticdev ldflags file-rdeps&quot;<b=
r>
&#43;INSANE_SKIP:${PN} &#43;=3D &quot;arch staticdev ldflags file-rdeps&quo=
t;<br>
diff --git a/recipes-bsp/mcasp-lld/mcasp-lld-rtos_git.bb b/recipes-bsp/mcas=
p-lld/mcasp-lld-rtos_git.bb<br>
index 5775d84b..76eb07b9 100644<br>
--- a/recipes-bsp/mcasp-lld/mcasp-lld-rtos_git.bb<br>
&#43;&#43;&#43; b/recipes-bsp/mcasp-lld/mcasp-lld-rtos_git.bb<br>
@@ -16,16 &#43;16,16 @@ PACKAGE_ARCH =3D &quot;${MACHINE_ARCH}&quot;<br>
&nbsp;PR =3D &quot;r0&quot;<br>
&nbsp;<br>
&nbsp;<br>
-DEPENDS_append =3D &quot; edma3-lld-rtos \<br>
&#43;DEPENDS:append =3D &quot; edma3-lld-rtos \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; osal-rtos \<br>
&nbsp;&quot;<br>
-DEPENDS_append_ti43x =3D &quot; starterware-rtos \<br>
&#43;DEPENDS:append_ti43x =3D &quot; starterware-rtos \<br>
&nbsp;&quot;<br>
-DEPENDS_append_ti33x =3D &quot; starterware-rtos \<br>
&#43;DEPENDS:append_ti33x =3D &quot; starterware-rtos \<br>
&nbsp;&quot;<br>
&nbsp;<br>
-DEPENDS_remove_k3 =3D &quot;edma3-lld-rtos &quot;<br>
-DEPENDS_append_k3 =3D &quot; udma-lld-rtos \<br>
&#43;DEPENDS:remove_k3 =3D &quot;edma3-lld-rtos &quot;<br>
&#43;DEPENDS:append_k3 =3D &quot; udma-lld-rtos \<br>
&nbsp;&quot;<br>
&nbsp;<br>
&nbsp;# Build with make instead of XDC<br>
@@ -35,7 &#43;35,7 @@ export PDK_MCASP_ROOT_PATH =3D&quot;${WORKDIR}/build&=
quot;<br>
&nbsp;export DEST_ROOT=3D&quot;${S}&quot;<br>
&nbsp;<br>
&nbsp;export EDMA3LLD_BIOS6_INSTALLDIR =3D &quot;${EDMA3_LLD_INSTALL_DIR}&q=
uot;<br>
-XDCPATH_append =3D &quot;;${EDMA3_LLD_INSTALL_DIR}/packages&quot;<br>
&#43;XDCPATH:append =3D &quot;;${EDMA3_LLD_INSTALL_DIR}/packages&quot;<br>
&nbsp;<br>
&nbsp;# HTML doc link params<br>
&nbsp;PDK_COMP_LINK_TEXT =3D &quot;MCASP LLD&quot;<br>
diff --git a/recipes-bsp/mcbsp-lld/mcbsp-lld-rtos_git.bb b/recipes-bsp/mcbs=
p-lld/mcbsp-lld-rtos_git.bb<br>
index 96ac5d75..f1eeccdd 100644<br>
--- a/recipes-bsp/mcbsp-lld/mcbsp-lld-rtos_git.bb<br>
&#43;&#43;&#43; b/recipes-bsp/mcbsp-lld/mcbsp-lld-rtos_git.bb<br>
@@ -15,11 &#43;15,11 @@ PACKAGE_ARCH =3D &quot;${MACHINE_ARCH}&quot;<br>
&nbsp;PR =3D &quot;r0&quot;<br>
&nbsp;<br>
&nbsp;<br>
-DEPENDS_append =3D &quot; edma3-lld-rtos \<br>
&#43;DEPENDS:append =3D &quot; edma3-lld-rtos \<br>
&nbsp;&quot;<br>
&nbsp;<br>
&nbsp;export EDMA3LLD_BIOS6_INSTALLDIR =3D &quot;${EDMA3_LLD_INSTALL_DIR}&q=
uot;<br>
-XDCPATH_append =3D &quot;;${EDMA3_LLD_INSTALL_DIR}/packages&quot;<br>
&#43;XDCPATH:append =3D &quot;;${EDMA3_LLD_INSTALL_DIR}/packages&quot;<br>
&nbsp;<br>
&nbsp;TI_PDK_XDCMAKE =3D &quot;0&quot;<br>
&nbsp;<br>
diff --git a/recipes-bsp/mmap-lld/mmap-lld-test_git.bb b/recipes-bsp/mmap-l=
ld/mmap-lld-test_git.bb<br>
index 8a09524e..4dd8289a 100644<br>
--- a/recipes-bsp/mmap-lld/mmap-lld-test_git.bb<br>
&#43;&#43;&#43; b/recipes-bsp/mmap-lld/mmap-lld-test_git.bb<br>
@@ -6,7 &#43;6,7 @@ PR =3D &quot;${INC_PR}.0&quot;<br>
&nbsp;PACKAGE_ARCH =3D &quot;${MACHINE_ARCH}&quot;<br>
&nbsp;<br>
&nbsp;DEPENDS=3D&quot;common-csl-ip mmap-lld&quot;<br>
-RDEPENDS_${PN}=3D&quot;uio-module-drv&quot;<br>
&#43;RDEPENDS:${PN}=3D&quot;uio-module-drv&quot;<br>
&nbsp;<br>
&nbsp;DEVICELIST_k2hk =3D &quot;k2h k2k&quot;<br>
&nbsp;DEVICELIST_k2e =3D &quot;k2e&quot;<br>
@@ -20,12 &#43;20,12 @@ CHOICELIST =3D &quot; yes \<br>
&nbsp;do_compile () {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for device in ${DEVICELIST=
}<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; do<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; make -f makefile_armv7 clean \<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; make -f makefile:armv7 clean \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PDK_I=
NSTALL_PATH=3D&quot;${STAGING_INCDIR}&quot; \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DEVIC=
E=3D&quot;$device&quot; MPAX_SRC_DIR=3D&quot;${S}&quot;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; for choice in ${CHOICELIST}<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; do<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; make -f makefile=
_armv7 tests examples \<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; make -f make=
file:armv7 tests examples \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PDK_INSTALL_PATH=3D${STAGING_INC=
DIR} \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DEVICE=3D&quot;$device&quot; MPA=
X_SRC_DIR=3D&quot;${S}&quot; \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; USEDYNAMIC_LIB=3D&quot;$choice&q=
uot;<br>
@@ -36,7 &#43;36,7 @@ do_compile () {<br>
&nbsp;do_install () {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for device in ${DEVICELIST=
}<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; do<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; make -f makefile_armv7 installbin \<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; make -f makefile:armv7 installbin \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; PDK_INSTALL_PATH=3D${STAGING_INCDIR} \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; DEVICE=3D&quot;$device&quot; MPAX_SRC_DIR=3D&quot;${S=
}&quot; \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; INSTALL_BIN_BASE_DIR=3D&quot;${D}/${bindir}&quot;<br>
diff --git a/recipes-bsp/mmap-lld/mmap-lld_git.bb b/recipes-bsp/mmap-lld/mm=
ap-lld_git.bb<br>
index cfc5d4c9..29ef7042 100644<br>
--- a/recipes-bsp/mmap-lld/mmap-lld_git.bb<br>
&#43;&#43;&#43; b/recipes-bsp/mmap-lld/mmap-lld_git.bb<br>
@@ -6,10 &#43;6,10 @@ PR =3D &quot;${INC_PR}.0&quot;<br>
&nbsp;DEPENDS=3D&quot;common-csl-ip&quot;<br>
&nbsp;<br>
&nbsp;do_compile () {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; make -f makefile_armv7 clean lib PDK_=
INSTALL_PATH=3D${STAGING_INCDIR}<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; make -f makefile:armv7 clean lib =
PDK_INSTALL_PATH=3D${STAGING_INCDIR}<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;do_install () {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; make -f makefile_armv7 install PDK_IN=
STALL_PATH=3D${STAGING_INCDIR} INSTALL_INC_BASE_DIR=3D${D}/${includedir} IN=
STALL_LIB_BASE_DIR=3D${D}${libdir}<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; make -f makefile:armv7 install PD=
K_INSTALL_PATH=3D${STAGING_INCDIR} INSTALL_INC_BASE_DIR=3D${D}/${includedir=
} INSTALL_LIB_BASE_DIR=3D${D}${libdir}<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; chown -R root:root ${D}<br=
>
&nbsp;}<br>
diff --git a/recipes-bsp/mmcsd-lld/mmcsd-lld-rtos_git.bb b/recipes-bsp/mmcs=
d-lld/mmcsd-lld-rtos_git.bb<br>
index 8c027cdd..5a79d9da 100644<br>
--- a/recipes-bsp/mmcsd-lld/mmcsd-lld-rtos_git.bb<br>
&#43;&#43;&#43; b/recipes-bsp/mmcsd-lld/mmcsd-lld-rtos_git.bb<br>
@@ -16,16 &#43;16,16 @@ PACKAGE_ARCH =3D &quot;${MACHINE_ARCH}&quot;<br>
&nbsp;PR =3D &quot;r0&quot;<br>
&nbsp;<br>
&nbsp;<br>
-DEPENDS_append =3D &quot; edma3-lld-rtos \<br>
&#43;DEPENDS:append =3D &quot; edma3-lld-rtos \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; osal-rtos \<br>
&nbsp;&quot;<br>
-DEPENDS_append_ti33x =3D &quot; starterware-rtos \<br>
&#43;DEPENDS:append_ti33x =3D &quot; starterware-rtos \<br>
&nbsp;&quot;<br>
-DEPENDS_append_ti43x =3D &quot; starterware-rtos \<br>
&#43;DEPENDS:append_ti43x =3D &quot; starterware-rtos \<br>
&nbsp;&quot;<br>
-DEPENDS_remove_k3 =3D &quot;edma3-lld-rtos &quot;<br>
&#43;DEPENDS:remove_k3 =3D &quot;edma3-lld-rtos &quot;<br>
&nbsp;<br>
-DEPENDS_append_k3 =3D &quot; sciclient-rtos \<br>
&#43;DEPENDS:append_k3 =3D &quot; sciclient-rtos \<br>
&nbsp;&quot;<br>
&nbsp;<br>
&nbsp;# Build with make instead of XDC<br>
@@ -35,7 &#43;35,7 @@ export PDK_MMCSD_ROOT_PATH =3D&quot;${WORKDIR}/build&=
quot;<br>
&nbsp;export DEST_ROOT=3D&quot;${S}&quot;<br>
&nbsp;<br>
&nbsp;export EDMA3LLD_BIOS6_INSTALLDIR =3D &quot;${EDMA3_LLD_INSTALL_DIR}&q=
uot;<br>
-XDCPATH_append =3D &quot;;${EDMA3_LLD_INSTALL_DIR}/packages&quot;<br>
&#43;XDCPATH:append =3D &quot;;${EDMA3_LLD_INSTALL_DIR}/packages&quot;<br>
&nbsp;<br>
&nbsp;# HTML doc link params<br>
&nbsp;PDK_COMP_LINK_TEXT =3D &quot;MMCSD LLD&quot;<br>
diff --git a/recipes-bsp/netcp-pa-fw/netcp-pa-fw_git.bb b/recipes-bsp/netcp=
-pa-fw/netcp-pa-fw_git.bb<br>
index fe7fa2b2..9e0f4b24 100644<br>
--- a/recipes-bsp/netcp-pa-fw/netcp-pa-fw_git.bb<br>
&#43;&#43;&#43; b/recipes-bsp/netcp-pa-fw/netcp-pa-fw_git.bb<br>
@@ -53,4 &#43;53,4 @@ do_install() {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; done<br>
&nbsp;}<br>
&nbsp;<br>
-FILES_${PN} =3D &quot;${base_libdir}/firmware&quot;<br>
&#43;FILES:${PN} =3D &quot;${base_libdir}/firmware&quot;<br>
diff --git a/recipes-bsp/netcp-sa-fw/netcp-sa-fw_git.bb b/recipes-bsp/netcp=
-sa-fw/netcp-sa-fw_git.bb<br>
index 56373a73..9d1ffe34 100644<br>
--- a/recipes-bsp/netcp-sa-fw/netcp-sa-fw_git.bb<br>
&#43;&#43;&#43; b/recipes-bsp/netcp-sa-fw/netcp-sa-fw_git.bb<br>
@@ -26,4 &#43;26,4 @@ do_install() {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; install -m 0644 ${S}/ti-ke=
ystone/${TARGET} ${D}${base_libdir}/firmware/${TARGET}<br>
&nbsp;}<br>
&nbsp;<br>
-FILES_${PN} =3D &quot;${base_libdir}/firmware&quot;<br>
&#43;FILES:${PN} =3D &quot;${base_libdir}/firmware&quot;<br>
diff --git a/recipes-bsp/nwal-lld/nwal-lld-rtos_git.bb b/recipes-bsp/nwal-l=
ld/nwal-lld-rtos_git.bb<br>
index b5c4bf13..3153f08a 100644<br>
--- a/recipes-bsp/nwal-lld/nwal-lld-rtos_git.bb<br>
&#43;&#43;&#43; b/recipes-bsp/nwal-lld/nwal-lld-rtos_git.bb<br>
@@ -6,7 &#43;6,7 @@ require recipes-bsp/nwal-lld/nwal-lld.inc<br>
&nbsp;<br>
&nbsp;PR =3D &quot;${INC_PR}.0&quot;<br>
&nbsp;<br>
-DEPENDS_append =3D &quot; cppi-lld-rtos \<br>
&#43;DEPENDS:append =3D &quot; cppi-lld-rtos \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pa-lld-rtos \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pktlib-rtos \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; qmss-lld-rtos \<br>
diff --git a/recipes-bsp/nwal-lld/nwal-lld-test_git.bb b/recipes-bsp/nwal-l=
ld/nwal-lld-test_git.bb<br>
index 79528a0a..1c7870d6 100644<br>
--- a/recipes-bsp/nwal-lld/nwal-lld-test_git.bb<br>
&#43;&#43;&#43; b/recipes-bsp/nwal-lld/nwal-lld-test_git.bb<br>
@@ -6,7 &#43;6,7 @@ include nwal-lld.inc<br>
&nbsp;<br>
&nbsp;PR =3D &quot;${INC_PR}.0&quot;<br>
&nbsp;<br>
-EXTRA_OEMAKE &#43;=3D &quot;-f makefile_armv7 PDK_INSTALL_PATH=3D${STAGING=
_INCDIR}&quot;<br>
&#43;EXTRA_OEMAKE &#43;=3D &quot;-f makefile:armv7 PDK_INSTALL_PATH=3D${STA=
GING_INCDIR}&quot;<br>
&nbsp;<br>
&nbsp;do_compile () {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for device in ${DEVICELIST=
}<br>
diff --git a/recipes-bsp/nwal-lld/nwal-lld_git.bb b/recipes-bsp/nwal-lld/nw=
al-lld_git.bb<br>
index a9690cab..c898ab4b 100644<br>
--- a/recipes-bsp/nwal-lld/nwal-lld_git.bb<br>
&#43;&#43;&#43; b/recipes-bsp/nwal-lld/nwal-lld_git.bb<br>
@@ -6,7 &#43;6,7 @@ include nwal-lld.inc<br>
&nbsp;<br>
&nbsp;PR =3D &quot;${INC_PR}.0&quot;<br>
&nbsp;<br>
-EXTRA_OEMAKE &#43;=3D &quot;-f makefile_armv7 PDK_INSTALL_PATH=3D${STAGING=
_INCDIR}&quot;<br>
&#43;EXTRA_OEMAKE &#43;=3D &quot;-f makefile:armv7 PDK_INSTALL_PATH=3D${STA=
GING_INCDIR}&quot;<br>
&nbsp;<br>
&nbsp;do_compile () {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for device in ${DEVICELIST=
}<br>
diff --git a/recipes-bsp/osal/osal-rtos_git.bb b/recipes-bsp/osal/osal-rtos=
_git.bb<br>
index a718f7ca..2ca3e8ee 100644<br>
--- a/recipes-bsp/osal/osal-rtos_git.bb<br>
&#43;&#43;&#43; b/recipes-bsp/osal/osal-rtos_git.bb<br>
@@ -3,10 &#43;3,10 @@ require recipes-bsp/osal/osal.inc<br>
&nbsp;<br>
&nbsp;PR =3D &quot;${INC_PR}.0&quot;<br>
&nbsp;<br>
-COMPATIBLE_MACHINE_append =3D &quot;|c66x|k3&quot;<br>
&#43;COMPATIBLE_MACHINE:append =3D &quot;|c66x|k3&quot;<br>
&nbsp;<br>
-DEPENDS_append_ti33x =3D &quot; starterware-rtos&quot;<br>
-DEPENDS_append_ti43x =3D &quot; starterware-rtos&quot;<br>
&#43;DEPENDS:append_ti33x =3D &quot; starterware-rtos&quot;<br>
&#43;DEPENDS:append_ti43x =3D &quot; starterware-rtos&quot;<br>
&nbsp;<br>
&nbsp;# Build with make instead of XDC<br>
&nbsp;TI_PDK_XDCMAKE =3D &quot;0&quot;<br>
diff --git a/recipes-bsp/osal/osal-test_git.bb b/recipes-bsp/osal/osal-test=
_git.bb<br>
index 354aa797..9dfa2447 100644<br>
--- a/recipes-bsp/osal/osal-test_git.bb<br>
&#43;&#43;&#43; b/recipes-bsp/osal/osal-test_git.bb<br>
@@ -6,7 &#43;6,7 @@ include osal.inc<br>
&nbsp;<br>
&nbsp;PR =3D &quot;${INC_PR}.1&quot;<br>
&nbsp;<br>
-EXTRA_OEMAKE =3D &quot;-f makefile_armv7 PDK_INSTALL_PATH=3D${STAGING_INCD=
IR} OSAL_SRC_DIR=3D${S}&quot;<br>
&#43;EXTRA_OEMAKE =3D &quot;-f makefile:armv7 PDK_INSTALL_PATH=3D${STAGING_=
INCDIR} OSAL_SRC_DIR=3D${S}&quot;<br>
&nbsp;<br>
&nbsp;do_compile () {<br>
&nbsp;#&nbsp;&nbsp; Build the tests<br>
diff --git a/recipes-bsp/osal/osal_git.bb b/recipes-bsp/osal/osal_git.bb<br=
>
index 4f881d2e..e6c0300f 100644<br>
--- a/recipes-bsp/osal/osal_git.bb<br>
&#43;&#43;&#43; b/recipes-bsp/osal/osal_git.bb<br>
@@ -6,7 &#43;6,7 @@ include osal.inc<br>
&nbsp;<br>
&nbsp;PR =3D &quot;${INC_PR}.1&quot;<br>
&nbsp;<br>
-EXTRA_OEMAKE =3D &quot;-f makefile_armv7 PDK_INSTALL_PATH=3D${STAGING_INCD=
IR}&quot;<br>
&#43;EXTRA_OEMAKE =3D &quot;-f makefile:armv7 PDK_INSTALL_PATH=3D${STAGING_=
INCDIR}&quot;<br>
&nbsp;<br>
&nbsp;do_compile () {<br>
&nbsp;#&nbsp;&nbsp; Build the lib<br>
diff --git a/recipes-bsp/pa-lld/pa-lld-rtos_git.bb b/recipes-bsp/pa-lld/pa-=
lld-rtos_git.bb<br>
index e415f36c..046ec80e 100644<br>
--- a/recipes-bsp/pa-lld/pa-lld-rtos_git.bb<br>
&#43;&#43;&#43; b/recipes-bsp/pa-lld/pa-lld-rtos_git.bb<br>
@@ -3,10 &#43;3,10 @@ SUMMARY =3D &quot;TI RTOS low level driver for Packet=
 Accelerator (PA)&quot;<br>
&nbsp;inherit ti-pdk<br>
&nbsp;<br>
&nbsp;require recipes-bsp/pa-lld/pa-lld.inc<br>
-COMPATIBLE_MACHINE_append =3D &quot;|c667x-evm&quot;<br>
&#43;COMPATIBLE_MACHINE:append =3D &quot;|c667x-evm&quot;<br>
&nbsp;PR =3D &quot;${INC_PR}.0&quot;<br>
&nbsp;<br>
-DEPENDS_append =3D &quot; rm-lld-rtos&quot;<br>
&#43;DEPENDS:append =3D &quot; rm-lld-rtos&quot;<br>
&nbsp;<br>
&nbsp;# HTML doc link params<br>
&nbsp;PDK_COMP_LINK_TEXT =3D &quot;PA LLD&quot;<br>
diff --git a/recipes-bsp/pa-lld/pa-lld-test_git.bb b/recipes-bsp/pa-lld/pa-=
lld-test_git.bb<br>
index 760f1882..595df142 100644<br>
--- a/recipes-bsp/pa-lld/pa-lld-test_git.bb<br>
&#43;&#43;&#43; b/recipes-bsp/pa-lld/pa-lld-test_git.bb<br>
@@ -14,10 &#43;14,10 @@ do_compile () {<br>
&nbsp;# Now build the lld unit test examples<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for device in ${DEVICELIST=
}<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; do<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; make -f makefile_armv7 clean PDK_INST=
ALL_PATH=3D${STAGING_INCDIR} DEVICE=3D&quot;$device&quot; PA_SRC_DIR=3D${S}=
<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; make -f makefile:armv7 clean PDK_=
INSTALL_PATH=3D${STAGING_INCDIR} DEVICE=3D&quot;$device&quot; PA_SRC_DIR=3D=
${S}<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; for choice in ${CHOICELIST}<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; do<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; make -f makefile=
_armv7 tests examples PDK_INSTALL_PATH=3D${STAGING_INCDIR} DEVICE=3D&quot;$=
device&quot; PA_SRC_DIR=3D${S} USEDYNAMIC_LIB=3D&quot;$choice&quot;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; make -f make=
file:armv7 tests examples PDK_INSTALL_PATH=3D${STAGING_INCDIR} DEVICE=3D&qu=
ot;$device&quot; PA_SRC_DIR=3D${S} USEDYNAMIC_LIB=3D&quot;$choice&quot;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; done<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; done<br>
&nbsp;}<br>
@@ -25,6 &#43;25,6 @@ do_compile () {<br>
&nbsp;do_install () {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for device in ${DEVICELIST=
}<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; do<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; make -f makefile_armv7 installbin PDK_INSTALL_PATH=3D${STAGING_I=
NCDIR} DEVICE=3D&quot;$device&quot; PA_SRC_DIR=3D${S} INSTALL_BIN_BASE_DIR=
=3D${D}${bindir}<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; make -f makefile:armv7 installbin PDK_INSTALL_PATH=3D${STAGI=
NG_INCDIR} DEVICE=3D&quot;$device&quot; PA_SRC_DIR=3D${S} INSTALL_BIN_BASE_=
DIR=3D${D}${bindir}<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; done<br>
&nbsp;}<br>
diff --git a/recipes-bsp/pa-lld/pa-lld_git.bb b/recipes-bsp/pa-lld/pa-lld_g=
it.bb<br>
index bbe7aa31..84cdbd82 100644<br>
--- a/recipes-bsp/pa-lld/pa-lld_git.bb<br>
&#43;&#43;&#43; b/recipes-bsp/pa-lld/pa-lld_git.bb<br>
@@ -10,12 &#43;10,12 @@ do_compile () {<br>
&nbsp;#&nbsp;&nbsp; Now build the lld in the updated directory<br>
&nbsp;&nbsp;&nbsp;&nbsp; for device in ${DEVICELIST}<br>
&nbsp;&nbsp;&nbsp;&nbsp; do<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; make -f makefile_armv7 lib PDK_=
INSTALL_PATH=3D${STAGING_INCDIR} DEVICE=3D&quot;$device&quot;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; make -f makefile:armv7 lib =
PDK_INSTALL_PATH=3D${STAGING_INCDIR} DEVICE=3D&quot;$device&quot;<br>
&nbsp;&nbsp;&nbsp;&nbsp; done<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;do_install () {<br>
-&nbsp;&nbsp;&nbsp; make -f makefile_armv7 install PDK_INSTALL_PATH=3D${STA=
GING_INCDIR} INSTALL_INC_BASE_DIR=3D${D}${includedir} INSTALL_LIB_BASE_DIR=
=3D${D}${libdir}<br>
&#43;&nbsp;&nbsp;&nbsp; make -f makefile:armv7 install PDK_INSTALL_PATH=3D$=
{STAGING_INCDIR} INSTALL_INC_BASE_DIR=3D${D}${includedir} INSTALL_LIB_BASE_=
DIR=3D${D}${libdir}<br>
&nbsp;&nbsp;&nbsp;&nbsp; chown -R root:root ${D}<br>
&nbsp;<br>
&nbsp;#&nbsp;&nbsp; Set the generic device library symbolic link<br>
diff --git a/recipes-bsp/pcie-lld/pcie-lld-rtos_git.bb b/recipes-bsp/pcie-l=
ld/pcie-lld-rtos_git.bb<br>
index ccd9a44b..83d70dba 100644<br>
--- a/recipes-bsp/pcie-lld/pcie-lld-rtos_git.bb<br>
&#43;&#43;&#43; b/recipes-bsp/pcie-lld/pcie-lld-rtos_git.bb<br>
@@ -14,7 &#43;14,7 @@ PACKAGE_ARCH =3D &quot;${MACHINE_ARCH}&quot;<br>
&nbsp;<br>
&nbsp;PR =3D &quot;r1&quot;<br>
&nbsp;<br>
-DEPENDS_append_k3 =3D &quot; udma-lld-rtos \<br>
&#43;DEPENDS:append_k3 =3D &quot; udma-lld-rtos \<br>
&nbsp;&quot;<br>
&nbsp;<br>
&nbsp;<br>
diff --git a/recipes-bsp/pktlib/pktlib-rtos_git.bb b/recipes-bsp/pktlib/pkt=
lib-rtos_git.bb<br>
index 8d5747f4..1688d392 100644<br>
--- a/recipes-bsp/pktlib/pktlib-rtos_git.bb<br>
&#43;&#43;&#43; b/recipes-bsp/pktlib/pktlib-rtos_git.bb<br>
@@ -3,8 &#43;3,8 @@ require pktlib.inc<br>
&nbsp;<br>
&nbsp;PR =3D &quot;${INC_PR}.1&quot;<br>
&nbsp;<br>
-DEPENDS_append =3D &quot; rm-lld-rtos \<br>
&#43;DEPENDS:append =3D &quot; rm-lld-rtos \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; qmss-lld-rtos \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cppi-lld-rtos \<br>
&nbsp;&quot;<br>
-COMPATIBLE_MACHINE_append =3D &quot;|c66x&quot;<br>
&#43;COMPATIBLE_MACHINE:append =3D &quot;|c66x&quot;<br>
diff --git a/recipes-bsp/pktlib/pktlib_git.bb b/recipes-bsp/pktlib/pktlib_g=
it.bb<br>
index b15b61b2..c355064e 100644<br>
--- a/recipes-bsp/pktlib/pktlib_git.bb<br>
&#43;&#43;&#43; b/recipes-bsp/pktlib/pktlib_git.bb<br>
@@ -7,7 &#43;7,7 @@ include pktlib.inc<br>
&nbsp;<br>
&nbsp;PR =3D &quot;${INC_PR}.1&quot;<br>
&nbsp;<br>
-EXTRA_OEMAKE &#43;=3D &quot;-f makefile_armv7 PDK_INSTALL_PATH=3D${STAGING=
_INCDIR} INSTALL_INC_BASE_DIR=3D${D}${includedir} INSTALL_LIB_BASE_DIR=3D${=
D}${libdir}&quot;<br>
&#43;EXTRA_OEMAKE &#43;=3D &quot;-f makefile:armv7 PDK_INSTALL_PATH=3D${STA=
GING_INCDIR} INSTALL_INC_BASE_DIR=3D${D}${includedir} INSTALL_LIB_BASE_DIR=
=3D${D}${libdir}&quot;<br>
&nbsp;<br>
&nbsp;do_compile () {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; oe_runmake lib<br>
diff --git a/recipes-bsp/pm-lld/pm-lld-rtos_git.bb b/recipes-bsp/pm-lld/pm-=
lld-rtos_git.bb<br>
index 25fcb65e..d8b391a0 100644<br>
--- a/recipes-bsp/pm-lld/pm-lld-rtos_git.bb<br>
&#43;&#43;&#43; b/recipes-bsp/pm-lld/pm-lld-rtos_git.bb<br>
@@ -37,15 &#43;37,15 @@ PR =3D &quot;r0&quot;<br>
&nbsp;<br>
&nbsp;S =3D &quot;${WORKDIR}/${PM_LLD_GIT_DESTSUFFIX}&quot;<br>
&nbsp;<br>
-DEPENDS_append =3D &quot; ti-sysbios \<br>
&#43;DEPENDS:append =3D &quot; ti-sysbios \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; os=
al-rtos \<br>
&nbsp;&quot;<br>
-DEPENDS_append_ti33x =3D &quot; starterware-rtos \<br>
&#43;DEPENDS:append_ti33x =3D &quot; starterware-rtos \<br>
&nbsp;&quot;<br>
-DEPENDS_append_ti43x =3D &quot; starterware-rtos \<br>
&#43;DEPENDS:append_ti43x =3D &quot; starterware-rtos \<br>
&nbsp;&quot;<br>
&nbsp;<br>
-DEPENDS_append_k3 =3D &quot; sciclient-rtos \<br>
&#43;DEPENDS:append_k3 =3D &quot; sciclient-rtos \<br>
&nbsp;&quot;<br>
&nbsp;<br>
&nbsp;export PDK_PM_ROOT_PATH =3D &quot;${WORKDIR}/build&quot;<br>
@@ -54,7 &#43;54,7 @@ export DEST_ROOT=3D&quot;${S}&quot;<br>
&nbsp;# Build with make instead of XDC<br>
&nbsp;TI_PDK_XDCMAKE =3D &quot;0&quot;<br>
&nbsp;<br>
-do_compile_append() {<br>
&#43;do_compile:append() {<br>
&nbsp;&nbsp;&nbsp;&nbsp; # Delete archive created by XDC release command si=
nce it does not contain all content<br>
&nbsp;&nbsp;&nbsp;&nbsp; find -name &quot;*.tar&quot; -exec rm -f {} \;<br>
&nbsp;<br>
@@ -65,7 &#43;65,7 @@ do_compile_append() {<br>
&nbsp;<br>
&nbsp;<br>
&nbsp;# Workaround: dra7xx build requires am57xx pm libraries for opencl-mo=
nitor<br>
-TI_PDK_LIMIT_SOCS_append_dra7xx =3D &quot; am571x am572x am574x&quot;<br>
-TI_PDK_LIMIT_BOARDS_append_dra7xx =3D &quot; evmAM571x evmAM572x idkAM574x=
&quot;<br>
&#43;TI_PDK_LIMIT_SOCS:append_dra7xx =3D &quot; am571x am572x am574x&quot;<=
br>
&#43;TI_PDK_LIMIT_BOARDS:append_dra7xx =3D &quot; evmAM571x evmAM572x idkAM=
574x&quot;<br>
&nbsp;<br>
-INSANE_SKIP_${PN} =3D &quot;arch staticdev&quot;<br>
&#43;INSANE_SKIP:${PN} =3D &quot;arch staticdev&quot;<br>
diff --git a/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.13.5776728.b=
b b/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.13.5776728.bb<br>
index e6edebdd..c3524e99 100644<br>
--- a/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.13.5776728.bb<br>
&#43;&#43;&#43; b/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.13.5776=
728.bb<br>
@@ -7,7 &#43;7,7 @@ inherit module features_check<br>
&nbsp;<br>
&nbsp;REQUIRED_MACHINE_FEATURES =3D &quot;gpu&quot;<br>
&nbsp;<br>
-MACHINE_KERNEL_PR_append =3D &quot;b&quot;<br>
&#43;MACHINE_KERNEL_PR:append =3D &quot;b&quot;<br>
&nbsp;PR =3D &quot;${MACHINE_KERNEL_PR}&quot;<br>
&nbsp;<br>
&nbsp;PACKAGE_ARCH =3D &quot;${MACHINE_ARCH}&quot;<br>
diff --git a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb b/re=
cipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb<br>
index a5160fdc..a00fce22 100644<br>
--- a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb<br>
&#43;&#43;&#43; b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb=
<br>
@@ -9,7 &#43;9,7 @@ REQUIRED_MACHINE_FEATURES =3D &quot;gpu&quot;<br>
&nbsp;<br>
&nbsp;COMPATIBLE_MACHINE =3D &quot;pandaboard|beagleboard|ti33x|ti43x|omap-=
a15|k3&quot;<br>
&nbsp;<br>
-MACHINE_KERNEL_PR_append =3D &quot;x&quot;<br>
&#43;MACHINE_KERNEL_PR:append =3D &quot;x&quot;<br>
&nbsp;PR =3D &quot;${MACHINE_KERNEL_PR}&quot;<br>
&nbsp;<br>
&nbsp;PACKAGE_ARCH =3D &quot;${MACHINE_ARCH}&quot;<br>
@@ -37,7 &#43;37,7 @@ TARGET_PRODUCT_pandaboard =3D &quot;ti443x&quot;<br>
&nbsp;<br>
&nbsp;EXTRA_OEMAKE &#43;=3D 'KERNELDIR=3D&quot;${STAGING_KERNEL_DIR}&quot; =
TARGET_PRODUCT=3D${TARGET_PRODUCT} WINDOW_SYSTEM=3Dnulldrmws'<br>
&nbsp;<br>
-do_compile_prepend() {<br>
&#43;do_compile:prepend() {<br>
&nbsp;&nbsp;&nbsp;&nbsp; cd ${S}/eurasia_km/eurasiacon/build/linux2/omap_li=
nux<br>
&nbsp;}<br>
&nbsp;<br>
diff --git a/recipes-bsp/pru/pru-icss_git.bb b/recipes-bsp/pru/pru-icss_git=
.bb<br>
index c74a15dc..8b3912d9 100644<br>
--- a/recipes-bsp/pru/pru-icss_git.bb<br>
&#43;&#43;&#43; b/recipes-bsp/pru/pru-icss_git.bb<br>
@@ -18,12 &#43;18,12 @@ require recipes-ti/includes/ti-paths.inc<br>
&nbsp;COMPATIBLE_MACHINE =3D &quot;ti33x|ti43x|omap-a15|k2g|k3&quot;<br>
&nbsp;PACKAGE_ARCH =3D &quot;${MACHINE_ARCH}&quot;<br>
&nbsp;<br>
-PACKAGES_prepend =3D &quot; \<br>
&#43;PACKAGES:prepend =3D &quot; \<br>
&nbsp;&nbsp;&nbsp;&nbsp; ${PN}-halt \<br>
&nbsp;&nbsp;&nbsp;&nbsp; ${PN}-rpmsg-echo \<br>
&nbsp;&quot;<br>
&nbsp;<br>
-RDEPENDS_${PN}_append =3D &quot; \<br>
&#43;RDEPENDS:${PN}:append =3D &quot; \<br>
&nbsp;&nbsp;&nbsp;&nbsp; ${PN}-halt \<br>
&nbsp;&nbsp;&nbsp;&nbsp; ${PN}-rpmsg-echo \<br>
&nbsp;&quot;<br>
@@ -60,10 &#43;60,10 @@ do_install() {<br>
&nbsp;&nbsp;&nbsp;&nbsp; install -m 0644 ${S}/lib/rpmsg_lib.lib ${D}${libdi=
r}<br>
&nbsp;}<br>
&nbsp;<br>
-FILES_${PN}-staticdev =3D &quot;${libdir}&quot;<br>
-FILES_${PN}-dev =3D &quot;${includedir}&quot;<br>
&#43;FILES:${PN}-staticdev =3D &quot;${libdir}&quot;<br>
&#43;FILES:${PN}-dev =3D &quot;${includedir}&quot;<br>
&nbsp;<br>
-do_install_append_ti33x() {<br>
&#43;do_install:append_ti33x() {<br>
&nbsp;&nbsp;&nbsp;&nbsp; install -m 644 ${S}/examples/${PLATFORM}/PRU_Halt/=
gen/PRU_Halt.out \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${D}${base_libdir}/firmware/pru<br>
&nbsp;&nbsp;&nbsp;&nbsp; for i in 0 1<br>
@@ -73,7 &#43;73,7 @@ do_install_append_ti33x() {<br>
&nbsp;&nbsp;&nbsp;&nbsp; done<br>
&nbsp;}<br>
&nbsp;<br>
-do_install_append_ti43x() {<br>
&#43;do_install:append_ti43x() {<br>
&nbsp;&nbsp;&nbsp;&nbsp; install -m 644 ${S}/examples/${PLATFORM}/PRU_Halt/=
gen/PRU_Halt.out \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${D}${base_libdir}/firmware/pru<br>
&nbsp;&nbsp;&nbsp;&nbsp; for i in 0 1<br>
@@ -86,7 &#43;86,7 @@ do_install_append_ti43x() {<br>
&nbsp;&nbsp;&nbsp;&nbsp; done<br>
&nbsp;}<br>
&nbsp;<br>
-do_install_append_omap-a15() {<br>
&#43;do_install:append_omap-a15() {<br>
&nbsp;&nbsp;&nbsp;&nbsp; install -m 644 ${S}/examples/${PLATFORM}/PRU_Halt/=
gen/PRU_Halt.out \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${D}${base_libdir}/firmware/pru<br>
&nbsp;&nbsp;&nbsp;&nbsp; for i in 1 2<br>
@@ -99,7 &#43;99,7 @@ do_install_append_omap-a15() {<br>
&nbsp;&nbsp;&nbsp;&nbsp; done<br>
&nbsp;}<br>
&nbsp;<br>
-do_install_append_k2g() {<br>
&#43;do_install:append_k2g() {<br>
&nbsp;&nbsp;&nbsp;&nbsp; install -m 644 ${S}/examples/${PLATFORM}/PRU_Halt/=
gen/PRU_Halt.out \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${D}${base_libdir}/firmware/pru<br>
&nbsp;&nbsp;&nbsp;&nbsp; for i in 0 1<br>
@@ -112,7 &#43;112,7 @@ do_install_append_k2g() {<br>
&nbsp;&nbsp;&nbsp;&nbsp; done<br>
&nbsp;}<br>
&nbsp;<br>
-do_install_append_am65xx() {<br>
&#43;do_install:append_am65xx() {<br>
&nbsp;&nbsp;&nbsp;&nbsp; for i in 0 1 <br>
&nbsp;&nbsp;&nbsp;&nbsp; do<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; install -m 644 ${S}/exampl=
es/${PLATFORM}/PRU_Halt/gen/PRU${i}/PRU_Halt_${i}.out \<br>
@@ -135,7 &#43;135,7 @@ do_install_append_am65xx() {<br>
&nbsp;&nbsp;&nbsp;&nbsp; done<br>
&nbsp;}<br>
&nbsp;<br>
-do_install_append_j7() {<br>
&#43;do_install:append_j7() {<br>
&nbsp;&nbsp;&nbsp;&nbsp; for i in 0 1<br>
&nbsp;&nbsp;&nbsp;&nbsp; do<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; install -m 644 ${S}/exampl=
es/${PLATFORM}/PRU_Halt/gen/PRU${i}/PRU_Halt_${i}.out \<br>
@@ -159,8 &#43;159,8 @@ do_install_append_j7() {<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
-FILES_${PN}-halt =3D &quot;${base_libdir}/firmware/pru/PRU_Halt* ${base_li=
bdir}/firmware/pru/RTU_Halt* ${base_libdir}/firmware/pru/TX_PRU_Halt*&quot;=
<br>
-FILES_${PN}-rpmsg-echo =3D &quot;${base_libdir}/firmware/pru/PRU_RPMsg_Ech=
o_Interrupt* ${base_libdir}/firmware/pru/RTU_RPMsg_Echo_Interrupt*&quot;<br=
>
&#43;FILES:${PN}-halt =3D &quot;${base_libdir}/firmware/pru/PRU_Halt* ${bas=
e_libdir}/firmware/pru/RTU_Halt* ${base_libdir}/firmware/pru/TX_PRU_Halt*&q=
uot;<br>
&#43;FILES:${PN}-rpmsg-echo =3D &quot;${base_libdir}/firmware/pru/PRU_RPMsg=
_Echo_Interrupt* ${base_libdir}/firmware/pru/RTU_RPMsg_Echo_Interrupt*&quot=
;<br>
&nbsp;<br>
&nbsp;# Set up names for the firmwares<br>
&nbsp;PRU_ICSS_ALTERNATIVES_ti33x&nbsp;&nbsp;&nbsp; =3D &quot;am335x-pru0-f=
w am335x-pru1-fw&quot;<br>
@@ -222,11 &#43;222,11 @@ ALTERNATIVE_LINK_NAME[j7-txpru1_0-fw] =3D &quot;$=
{base_libdir}/firmware/j7-txpru1_0-fw&quot;<br>
&nbsp;ALTERNATIVE_LINK_NAME[j7-txpru1_1-fw] =3D &quot;${base_libdir}/firmwa=
re/j7-txpru1_1-fw&quot;<br>
&nbsp;<br>
&nbsp;# Create the pru-icss-halt firmware alternatives<br>
-ALTERNATIVE_pru-icss-halt =3D &quot;${PRU_ICSS_ALTERNATIVES}&quot;<br>
&#43;ALTERNATIVE:pru-icss-halt =3D &quot;${PRU_ICSS_ALTERNATIVES}&quot;<br>
&nbsp;<br>
&nbsp;# Only Halt firmware images are supported for the Tx_PRU cores<br>
-ALTERNATIVE_pru-icss-halt_append_am65xx =3D &quot; am65x-txpru0_0-fw am65x=
-txpru0_1-fw am65x-txpru1_0-fw am65x-txpru1_1-fw am65x-txpru2_0-fw am65x-tx=
pru2_1-fw&quot;<br>
-ALTERNATIVE_pru-icss-halt_append_j7 =3D &quot; j7-txpru0_0-fw j7-txpru0_1-=
fw j7-txpru1_0-fw j7-txpru1_1-fw&quot;<br>
&#43;ALTERNATIVE:pru-icss-halt:append_am65xx =3D &quot; am65x-txpru0_0-fw a=
m65x-txpru0_1-fw am65x-txpru1_0-fw am65x-txpru1_1-fw am65x-txpru2_0-fw am65=
x-txpru2_1-fw&quot;<br>
&#43;ALTERNATIVE:pru-icss-halt:append_j7 =3D &quot; j7-txpru0_0-fw j7-txpru=
0_1-fw j7-txpru1_0-fw j7-txpru1_1-fw&quot;<br>
&nbsp;<br>
&nbsp;ALTERNATIVE_TARGET_pru-icss-halt[am335x-pru0-fw] =3D &quot;${base_lib=
dir}/firmware/pru/PRU_Halt.out&quot;<br>
&nbsp;ALTERNATIVE_TARGET_pru-icss-halt[am335x-pru1-fw] =3D &quot;${base_lib=
dir}/firmware/pru/PRU_Halt.out&quot;<br>
@@ -282,7 &#43;282,7 @@ ALTERNATIVE_TARGET_pru-icss-halt[j7-txpru1_1-fw] =
=3D &quot;${base_libdir}/firmware/pru/<br>
&nbsp;ALTERNATIVE_PRIORITY_pru-icss-halt =3D &quot;50&quot;<br>
&nbsp;<br>
&nbsp;# Create the pru-icss-rpmsg-echo firmware alternatives<br>
-ALTERNATIVE_pru-icss-rpmsg-echo =3D &quot;${PRU_ICSS_ALTERNATIVES}&quot;<b=
r>
&#43;ALTERNATIVE:pru-icss-rpmsg-echo =3D &quot;${PRU_ICSS_ALTERNATIVES}&quo=
t;<br>
&nbsp;<br>
&nbsp;ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am335x-pru0-fw] =3D &quot;${ba=
se_libdir}/firmware/pru/PRU_RPMsg_Echo_Interrupt0.out&quot;<br>
&nbsp;ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am335x-pru1-fw] =3D &quot;${ba=
se_libdir}/firmware/pru/PRU_RPMsg_Echo_Interrupt1.out&quot;<br>
@@ -326,8 &#43;326,8 @@ ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[j7-rtu1_1-fw=
] =3D &quot;${base_libdir}/firmware/<br>
&nbsp;<br>
&nbsp;ALTERNATIVE_PRIORITY_pru-icss-rpmsg-echo =3D &quot;100&quot;<br>
&nbsp;<br>
-ALLOW_EMPTY_${PN} =3D &quot;1&quot;<br>
&#43;ALLOW_EMPTY:${PN} =3D &quot;1&quot;<br>
&nbsp;<br>
&nbsp;# This installs PRU firmware, so skip &quot;arch&quot; QA check<br>
-INSANE_SKIP_${PN}-halt =3D &quot;arch&quot;<br>
-INSANE_SKIP_${PN}-rpmsg-echo =3D &quot;arch&quot;<br>
&#43;INSANE_SKIP:${PN}-halt =3D &quot;arch&quot;<br>
&#43;INSANE_SKIP:${PN}-rpmsg-echo =3D &quot;arch&quot;<br>
diff --git a/recipes-bsp/pru/pru-pwm-fw_git.bb b/recipes-bsp/pru/pru-pwm-fw=
_git.bb<br>
index a8c71034..14c81390 100644<br>
--- a/recipes-bsp/pru/pru-pwm-fw_git.bb<br>
&#43;&#43;&#43; b/recipes-bsp/pru/pru-pwm-fw_git.bb<br>
@@ -34,6 &#43;34,6 @@ do_install() {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; install -m 0644 ${S}/gen/p=
wm.out ${D}/lib/firmware/ti-pruss/am65x-pru0-pwm-fw.elf<br>
&nbsp;}<br>
&nbsp;<br>
-FILES_${PN} =3D &quot;/lib/firmware&quot;<br>
&#43;FILES:${PN} =3D &quot;/lib/firmware&quot;<br>
&nbsp;<br>
-INSANE_SKIP_${PN} =3D &quot;arch&quot;<br>
&#43;INSANE_SKIP:${PN} =3D &quot;arch&quot;<br>
diff --git a/recipes-bsp/pru/pru-swuart-fw_git.bb b/recipes-bsp/pru/pru-swu=
art-fw_git.bb<br>
index 1cb51f38..f0d9e80d 100644<br>
--- a/recipes-bsp/pru/pru-swuart-fw_git.bb<br>
&#43;&#43;&#43; b/recipes-bsp/pru/pru-swuart-fw_git.bb<br>
@@ -15,7 &#43;15,7 @@ TI_PDK_COMP =3D &quot;ti.drv.uart&quot;<br>
&nbsp;<br>
&nbsp;PE =3D &quot;1&quot;<br>
&nbsp;<br>
-SRC_URI_append =3D &quot; \<br>
&#43;SRC_URI:append =3D &quot; \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file://0001-ics=
s_uart-add-Makefile-for-building-firmware.patch">
file://0001-icss_uart-add-Makefile-for-building-firmware.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file://0001-ics=
s_uart-remove-dependency-on-PDK-CSL.patch">file://0001-icss_uart-remove-dep=
endency-on-PDK-CSL.patch</a> \<br>
&nbsp;&quot;<br>
@@ -35,6 &#43;35,6 @@ do_install() {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; install -m 0644 ${S}/firmw=
are/icss_uart/src/gen/src.out ${D}/lib/firmware/ti-pruss/pru_swuart-fw.elf<=
br>
&nbsp;}<br>
&nbsp;<br>
-FILES_${PN} =3D &quot;/lib/firmware&quot;<br>
&#43;FILES:${PN} =3D &quot;/lib/firmware&quot;<br>
&nbsp;<br>
-INSANE_SKIP_${PN} =3D &quot;arch&quot;<br>
&#43;INSANE_SKIP:${PN} =3D &quot;arch&quot;<br>
diff --git a/recipes-bsp/pru/ti-pru-sw-edma-driver_1.00.00.bb b/recipes-bsp=
/pru/ti-pru-sw-edma-driver_1.00.00.bb<br>
index a837b356..98ab387c 100644<br>
--- a/recipes-bsp/pru/ti-pru-sw-edma-driver_1.00.00.bb<br>
&#43;&#43;&#43; b/recipes-bsp/pru/ti-pru-sw-edma-driver_1.00.00.bb<br>
@@ -7,9 &#43;7,9 @@ COMPATIBLE_MACHINE =3D &quot;omapl138&quot;<br>
&nbsp;<br>
&nbsp;INHIBIT_PACKAGE_STRIP =3D &quot;1&quot;<br>
&nbsp;<br>
-MACHINE_KERNEL_PR_append =3D &quot;b&quot;<br>
&#43;MACHINE_KERNEL_PR:append =3D &quot;b&quot;<br>
&nbsp;PR =3D &quot;${MACHINE_KERNEL_PR}&quot;<br>
-PV_append =3D &quot;&#43;svn${SRCPV}&quot;<br>
&#43;PV:append =3D &quot;&#43;svn${SRCPV}&quot;<br>
&nbsp;<br>
&nbsp;SRC_URI =3D &quot;svn://gforge.ti.com/svn/pru_sw/;module=3Dtrunk;prot=
ocol=3Dhttps;user=3Danonymous;pswd=3D''&quot;<br>
&nbsp;<br>
@@ -21,7 &#43;21,7 @@ inherit module<br>
&nbsp;<br>
&nbsp;EXTRA_OEMAKE &#43;=3D &quot;KERNEL_DIR=3D'${STAGING_KERNEL_DIR}'&quot=
;<br>
&nbsp;<br>
-do_compile_prepend () {<br>
&#43;do_compile:prepend () {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; export CCTOOL_PREFIX=3D&qu=
ot;${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX}&quot;<br>
&nbsp;}<br>
&nbsp;<br>
diff --git a/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb b/recipes-bsp=
/prueth-fw/prueth-fw-am65x-sr2_git.bb<br>
index 67e8cd07..60746741 100644<br>
--- a/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb<br>
&#43;&#43;&#43; b/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb<br>
@@ -34,6 &#43;34,6 @@ do_install() {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; done<br>
&nbsp;}<br>
&nbsp;<br>
-FILES_${PN} =3D &quot;${base_libdir}/firmware&quot;<br>
&#43;FILES:${PN} =3D &quot;${base_libdir}/firmware&quot;<br>
&nbsp;<br>
-INSANE_SKIP_${PN} =3D &quot;arch&quot;<br>
&#43;INSANE_SKIP:${PN} =3D &quot;arch&quot;<br>
diff --git a/recipes-bsp/prueth-fw/prueth-fw-am65x_git.bb b/recipes-bsp/pru=
eth-fw/prueth-fw-am65x_git.bb<br>
index d447df33..f688fb76 100644<br>
--- a/recipes-bsp/prueth-fw/prueth-fw-am65x_git.bb<br>
&#43;&#43;&#43; b/recipes-bsp/prueth-fw/prueth-fw-am65x_git.bb<br>
@@ -32,6 &#43;32,6 @@ do_install() {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; done<br>
&nbsp;}<br>
&nbsp;<br>
-FILES_${PN} =3D &quot;${base_libdir}/firmware&quot;<br>
&#43;FILES:${PN} =3D &quot;${base_libdir}/firmware&quot;<br>
&nbsp;<br>
-INSANE_SKIP_${PN} =3D &quot;arch&quot;<br>
&#43;INSANE_SKIP:${PN} =3D &quot;arch&quot;<br>
diff --git a/recipes-bsp/prueth-fw/prueth-fw_5.6.15.bb b/recipes-bsp/prueth=
-fw/prueth-fw_5.6.15.bb<br>
index c392673e..99da31b2 100644<br>
--- a/recipes-bsp/prueth-fw/prueth-fw_5.6.15.bb<br>
&#43;&#43;&#43; b/recipes-bsp/prueth-fw/prueth-fw_5.6.15.bb<br>
@@ -32,6 &#43;32,6 @@ do_install() {<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
-FILES_${PN} =3D &quot;${base_libdir}/firmware&quot;<br>
&#43;FILES:${PN} =3D &quot;${base_libdir}/firmware&quot;<br>
&nbsp;<br>
-INSANE_SKIP_${PN} =3D &quot;arch&quot;<br>
&#43;INSANE_SKIP:${PN} =3D &quot;arch&quot;<br>
diff --git a/recipes-bsp/pruhsr-fw/pruhsr-fw_2.17.25.bb b/recipes-bsp/pruhs=
r-fw/pruhsr-fw_2.17.25.bb<br>
index 2616373e..24f1bd42 100644<br>
--- a/recipes-bsp/pruhsr-fw/pruhsr-fw_2.17.25.bb<br>
&#43;&#43;&#43; b/recipes-bsp/pruhsr-fw/pruhsr-fw_2.17.25.bb<br>
@@ -32,6 &#43;32,6 @@ do_install() {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; done<br>
&nbsp;}<br>
&nbsp;<br>
-FILES_${PN} =3D &quot;${base_libdir}/firmware&quot;<br>
&#43;FILES:${PN} =3D &quot;${base_libdir}/firmware&quot;<br>
&nbsp;<br>
-INSANE_SKIP_${PN} =3D &quot;arch&quot;<br>
&#43;INSANE_SKIP:${PN} =3D &quot;arch&quot;<br>
diff --git a/recipes-bsp/pruprp-fw/pruprp-fw_2.17.25.bb b/recipes-bsp/prupr=
p-fw/pruprp-fw_2.17.25.bb<br>
index e71bc00a..e9ba0c22 100644<br>
--- a/recipes-bsp/pruprp-fw/pruprp-fw_2.17.25.bb<br>
&#43;&#43;&#43; b/recipes-bsp/pruprp-fw/pruprp-fw_2.17.25.bb<br>
@@ -33,6 &#43;33,6 @@ do_install() {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; done<br>
&nbsp;}<br>
&nbsp;<br>
-FILES_${PN} =3D &quot;${base_libdir}/firmware&quot;<br>
&#43;FILES:${PN} =3D &quot;${base_libdir}/firmware&quot;<br>
&nbsp;<br>
-INSANE_SKIP_${PN} =3D &quot;arch&quot;<br>
&#43;INSANE_SKIP:${PN} =3D &quot;arch&quot;<br>
diff --git a/recipes-bsp/pruss-lld/pruss-lld-apps_git.bb b/recipes-bsp/prus=
s-lld/pruss-lld-apps_git.bb<br>
index 48eab404..0eb83647 100644<br>
--- a/recipes-bsp/pruss-lld/pruss-lld-apps_git.bb<br>
&#43;&#43;&#43; b/recipes-bsp/pruss-lld/pruss-lld-apps_git.bb<br>
@@ -2,14 &#43;2,14 @@ DESCRIPTION =3D &quot;TI PRUSS low level driver examp=
le applications&quot;<br>
&nbsp;<br>
&nbsp;DEPENDS=3D&quot;common-csl-ip pruss-lld osal ti-pdk-build-rtos pruss-=
lld-rtos&quot;<br>
&nbsp;<br>
-DEPENDS_append_ti33x =3D &quot; starterware&quot;<br>
-DEPENDS_append_ti43x =3D &quot; starterware&quot;<br>
&#43;DEPENDS:append_ti33x =3D &quot; starterware&quot;<br>
&#43;DEPENDS:append_ti43x =3D &quot; starterware&quot;<br>
&nbsp;<br>
&nbsp;include pruss-lld.inc<br>
&nbsp;<br>
&nbsp;PR =3D &quot;${INC_PR}.0&quot;<br>
&nbsp;<br>
-EXTRA_OEMAKE &#43;=3D &quot;-f makefile_armv7 PDK_INSTALL_PATH=3D${STAGING=
_INCDIR} PDK_PKG_PATH=3D${STAGING_DATADIR}/ti/ti-pdk-tree/packages PRUSS_SR=
C_DIR=3D${S}&quot;<br>
&#43;EXTRA_OEMAKE &#43;=3D &quot;-f makefile:armv7 PDK_INSTALL_PATH=3D${STA=
GING_INCDIR} PDK_PKG_PATH=3D${STAGING_DATADIR}/ti/ti-pdk-tree/packages PRUS=
S_SRC_DIR=3D${S}&quot;<br>
&nbsp;<br>
&nbsp;<br>
&nbsp;DEVICE_LIST ?=3D &quot;${TI_PDK_LIMIT_SOCS}&quot;<br>
diff --git a/recipes-bsp/pruss-lld/pruss-lld-rtos_git.bb b/recipes-bsp/prus=
s-lld/pruss-lld-rtos_git.bb<br>
index 9ab09b64..ef7c08bc 100644<br>
--- a/recipes-bsp/pruss-lld/pruss-lld-rtos_git.bb<br>
&#43;&#43;&#43; b/recipes-bsp/pruss-lld/pruss-lld-rtos_git.bb<br>
@@ -3,12 &#43;3,12 @@ SUMMARY =3D &quot;TI RTOS low level driver library fo=
r PRUSS&quot;<br>
&nbsp;inherit ti-pdk<br>
&nbsp;require recipes-bsp/pruss-lld/pruss-lld.inc<br>
&nbsp;<br>
-COMPATIBLE_MACHINE_append =3D &quot;|k3&quot;<br>
&#43;COMPATIBLE_MACHINE:append =3D &quot;|k3&quot;<br>
&nbsp;PR =3D &quot;${INC_PR}.0&quot;<br>
&nbsp;<br>
-DEPENDS_append =3D &quot; osal-rtos&quot;<br>
-DEPENDS_append_ti33x =3D &quot; starterware-rtos&quot;<br>
-DEPENDS_append_ti43x =3D &quot; starterware-rtos&quot;<br>
&#43;DEPENDS:append =3D &quot; osal-rtos&quot;<br>
&#43;DEPENDS:append_ti33x =3D &quot; starterware-rtos&quot;<br>
&#43;DEPENDS:append_ti43x =3D &quot; starterware-rtos&quot;<br>
&nbsp;<br>
&nbsp;# Build with make instead of XDC<br>
&nbsp;TI_PDK_XDCMAKE =3D &quot;0&quot;<br>
@@ -19,4 &#43;19,4 @@ export DEST_ROOT=3D&quot;${WORKDIR}/build&quot;<br>
&nbsp;# HTML doc link params<br>
&nbsp;PDK_COMP_LINK_TEXT =3D &quot;PRUSS LLD&quot;<br>
&nbsp;<br>
-INSANE_SKIP_${PN} =3D &quot;arch&quot;<br>
&#43;INSANE_SKIP:${PN} =3D &quot;arch&quot;<br>
diff --git a/recipes-bsp/pruss-lld/pruss-lld-test_git.bb b/recipes-bsp/prus=
s-lld/pruss-lld-test_git.bb<br>
index 8007f652..29cc32af 100644<br>
--- a/recipes-bsp/pruss-lld/pruss-lld-test_git.bb<br>
&#43;&#43;&#43; b/recipes-bsp/pruss-lld/pruss-lld-test_git.bb<br>
@@ -6,7 &#43;6,7 @@ include pruss-lld.inc<br>
&nbsp;<br>
&nbsp;PR =3D &quot;${INC_PR}.2&quot;<br>
&nbsp;<br>
-EXTRA_OEMAKE &#43;=3D &quot;-f makefile_armv7 PDK_INSTALL_PATH=3D${STAGING=
_INCDIR} PRUSS_SRC_DIR=3D${S}&quot;<br>
&#43;EXTRA_OEMAKE &#43;=3D &quot;-f makefile:armv7 PDK_INSTALL_PATH=3D${STA=
GING_INCDIR} PRUSS_SRC_DIR=3D${S}&quot;<br>
&nbsp;<br>
&nbsp;DEVICE_LIST ?=3D &quot;${TI_PDK_LIMIT_SOCS}&quot;<br>
&nbsp;<br>
diff --git a/recipes-bsp/pruss-lld/pruss-lld_git.bb b/recipes-bsp/pruss-lld=
/pruss-lld_git.bb<br>
index f1e93cd7..2ab599d5 100644<br>
--- a/recipes-bsp/pruss-lld/pruss-lld_git.bb<br>
&#43;&#43;&#43; b/recipes-bsp/pruss-lld/pruss-lld_git.bb<br>
@@ -6,7 &#43;6,7 @@ include pruss-lld.inc<br>
&nbsp;<br>
&nbsp;PR =3D &quot;${INC_PR}.2&quot;<br>
&nbsp;<br>
-EXTRA_OEMAKE &#43;=3D &quot;-f makefile_armv7 PDK_INSTALL_PATH=3D${STAGING=
_INCDIR}&quot;<br>
&#43;EXTRA_OEMAKE &#43;=3D &quot;-f makefile:armv7 PDK_INSTALL_PATH=3D${STA=
GING_INCDIR}&quot;<br>
&nbsp;<br>
&nbsp;do_compile () {<br>
&nbsp;#&nbsp;&nbsp; Build the lib<br>
diff --git a/recipes-bsp/prusw-fw/prusw-fw_3.2.9.bb b/recipes-bsp/prusw-fw/=
prusw-fw_3.2.9.bb<br>
index 3f5ef7e7..43109b6b 100644<br>
--- a/recipes-bsp/prusw-fw/prusw-fw_3.2.9.bb<br>
&#43;&#43;&#43; b/recipes-bsp/prusw-fw/prusw-fw_3.2.9.bb<br>
@@ -32,6 &#43;32,6 @@ do_install() {<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
-FILES_${PN} =3D &quot;${base_libdir}/firmware&quot;<br>
&#43;FILES:${PN} =3D &quot;${base_libdir}/firmware&quot;<br>
&nbsp;<br>
-INSANE_SKIP_${PN} =3D &quot;arch&quot;<br>
&#43;INSANE_SKIP:${PN} =3D &quot;arch&quot;<br>
diff --git a/recipes-bsp/qmss-lld/qmss-lld-rtos_git.bb b/recipes-bsp/qmss-l=
ld/qmss-lld-rtos_git.bb<br>
index 7f771429..d854e0bc 100644<br>
--- a/recipes-bsp/qmss-lld/qmss-lld-rtos_git.bb<br>
&#43;&#43;&#43; b/recipes-bsp/qmss-lld/qmss-lld-rtos_git.bb<br>
@@ -4,6 &#43;4,6 @@ require qmss-lld.inc<br>
&nbsp;<br>
&nbsp;PR =3D &quot;${INC_PR}.1&quot;<br>
&nbsp;<br>
-COMPATIBLE_MACHINE_append =3D &quot;|c66x&quot;<br>
&#43;COMPATIBLE_MACHINE:append =3D &quot;|c66x&quot;<br>
&nbsp;<br>
-DEPENDS_append =3D &quot; rm-lld-rtos&quot;<br>
&#43;DEPENDS:append =3D &quot; rm-lld-rtos&quot;<br>
diff --git a/recipes-bsp/qmss-lld/qmss-lld-test_git.bb b/recipes-bsp/qmss-l=
ld/qmss-lld-test_git.bb<br>
index 53f6dcff..6eddbdd3 100644<br>
--- a/recipes-bsp/qmss-lld/qmss-lld-test_git.bb<br>
&#43;&#43;&#43; b/recipes-bsp/qmss-lld/qmss-lld-test_git.bb<br>
@@ -14,10 &#43;14,10 @@ do_compile () {<br>
&nbsp;#&nbsp;&nbsp; Now build the lld in the updated directory<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for device in ${DEVICELIST=
}<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; do<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; make -f makefile_armv7 clean PDK_INSTALL_PATH=3D${STAGING_INCDIR=
} DEVICE=3D&quot;$device&quot; QMSS_SRC_DIR=3D${S}<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; make -f makefile:armv7 clean PDK_INSTALL_PATH=3D${STAGING_IN=
CDIR} DEVICE=3D&quot;$device&quot; QMSS_SRC_DIR=3D${S}<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; for choice in ${CHOICELIST}<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; do<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; make -f makefile=
_armv7 tests examples PDK_INSTALL_PATH=3D${STAGING_INCDIR} DEVICE=3D&quot;$=
device&quot; QMSS_SRC_DIR=3D${S} USEDYNAMIC_LIB=3D&quot;$choice&quot;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; make -f make=
file:armv7 tests examples PDK_INSTALL_PATH=3D${STAGING_INCDIR} DEVICE=3D&qu=
ot;$device&quot; QMSS_SRC_DIR=3D${S} USEDYNAMIC_LIB=3D&quot;$choice&quot;<b=
r>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; done<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; done<br>
&nbsp;}<br>
@@ -25,6 &#43;25,6 @@ do_compile () {<br>
&nbsp;do_install () {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for device in ${DEVICELIST=
}<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; do<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; make -f makefile_armv7 installbin PDK_INSTALL_PATH=3D${STAGING_I=
NCDIR} DEVICE=3D&quot;$device&quot; QMSS_SRC_DIR=3D${S} INSTALL_BIN_BASE_DI=
R=3D${D}${bindir}<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; make -f makefile:armv7 installbin PDK_INSTALL_PATH=3D${STAGI=
NG_INCDIR} DEVICE=3D&quot;$device&quot; QMSS_SRC_DIR=3D${S} INSTALL_BIN_BAS=
E_DIR=3D${D}${bindir}<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; done<br>
&nbsp;}<br>
diff --git a/recipes-bsp/qmss-lld/qmss-lld_git.bb b/recipes-bsp/qmss-lld/qm=
ss-lld_git.bb<br>
index 04f82d98..4a40aed5 100644<br>
--- a/recipes-bsp/qmss-lld/qmss-lld_git.bb<br>
&#43;&#43;&#43; b/recipes-bsp/qmss-lld/qmss-lld_git.bb<br>
@@ -8,15 &#43;8,15 @@ PR =3D &quot;${INC_PR}.1&quot;<br>
&nbsp;<br>
&nbsp;do_compile () {<br>
&nbsp;#&nbsp;&nbsp; Now build the lld<br>
-&nbsp;&nbsp;&nbsp; make -f makefile_armv7 clean PDK_INSTALL_PATH=3D${STAGI=
NG_INCDIR}<br>
&#43;&nbsp;&nbsp;&nbsp; make -f makefile:armv7 clean PDK_INSTALL_PATH=3D${S=
TAGING_INCDIR}<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for device in ${DEVICELIST=
}<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; do<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; make -f makefile_armv7 lib PDK_INSTALL_PATH=3D${STAGING_INCDIR}&=
nbsp; DEVICE=3D&quot;${device}&quot;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; make -f makefile:armv7 lib PDK_INSTALL_PATH=3D${STAGING_INCD=
IR}&nbsp; DEVICE=3D&quot;${device}&quot;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; done<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;do_install () {<br>
-&nbsp;&nbsp;&nbsp; make -f makefile_armv7 install PDK_INSTALL_PATH=3D${STA=
GING_INCDIR} INSTALL_INC_BASE_DIR=3D${D}${includedir} INSTALL_LIB_BASE_DIR=
=3D${D}${libdir}<br>
&#43;&nbsp;&nbsp;&nbsp; make -f makefile:armv7 install PDK_INSTALL_PATH=3D$=
{STAGING_INCDIR} INSTALL_INC_BASE_DIR=3D${D}${includedir} INSTALL_LIB_BASE_=
DIR=3D${D}${libdir}<br>
&nbsp;&nbsp;&nbsp;&nbsp; chown -R root:root ${D}<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp; # Set the generic device library symbolic link to =
default k2h<br>
@@ -35,4 &#43;35,4 @@ INHIBIT_PACKAGE_STRIP_FILES_k2hk =3D &quot;${PKGD}${l=
ibdir}/libqmss_k2h.a ${PKGD}${libd<br>
&nbsp;INHIBIT_PACKAGE_STRIP_FILES_k2e =3D &quot;${PKGD}${libdir}/libqmss_k2=
e.a&quot;<br>
&nbsp;INHIBIT_PACKAGE_STRIP_FILES_k2l =3D &quot;${PKGD}${libdir}/libqmss_k2=
l.a&quot;<br>
&nbsp;INHIBIT_PACKAGE_STRIP_FILES_k2g =3D &quot;${PKGD}${libdir}/libqmss_k2=
h.a&quot;<br>
-INHIBIT_PACKAGE_STRIP_FILES_append =3D &quot; ${PKGD}${libdir}/libqmss.a&q=
uot;<br>
&#43;INHIBIT_PACKAGE_STRIP_FILES:append =3D &quot; ${PKGD}${libdir}/libqmss=
.a&quot;<br>
diff --git a/recipes-bsp/qmss-pdsp-fw/qmss-pdsp-fw_git.bb b/recipes-bsp/qms=
s-pdsp-fw/qmss-pdsp-fw_git.bb<br>
index cd207826..ac030486 100644<br>
--- a/recipes-bsp/qmss-pdsp-fw/qmss-pdsp-fw_git.bb<br>
&#43;&#43;&#43; b/recipes-bsp/qmss-pdsp-fw/qmss-pdsp-fw_git.bb<br>
@@ -26,4 &#43;26,4 @@ do_install() {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; install -m 0644 ${S}/ti-ke=
ystone/${ORIGIN} ${D}${base_libdir}/firmware/${TARGET}<br>
&nbsp;}<br>
&nbsp;<br>
-FILES_${PN} =3D &quot;${base_libdir}/firmware&quot;<br>
&#43;FILES:${PN} =3D &quot;${base_libdir}/firmware&quot;<br>
diff --git a/recipes-bsp/rm-lld/rm-lld-rtos_git.bb b/recipes-bsp/rm-lld/rm-=
lld-rtos_git.bb<br>
index 2f49892c..2a279a0a 100644<br>
--- a/recipes-bsp/rm-lld/rm-lld-rtos_git.bb<br>
&#43;&#43;&#43; b/recipes-bsp/rm-lld/rm-lld-rtos_git.bb<br>
@@ -1,6 &#43;1,6 @@<br>
&nbsp;inherit ti-pdk<br>
&nbsp;<br>
-COMPATIBLE_MACHINE_append =3D &quot;|c66x&quot;<br>
&#43;COMPATIBLE_MACHINE:append =3D &quot;|c66x&quot;<br>
&nbsp;<br>
&nbsp;require rm-lld.inc<br>
&nbsp;<br>
diff --git a/recipes-bsp/rm-lld/rm-lld_git.bb b/recipes-bsp/rm-lld/rm-lld_g=
it.bb<br>
index e2701d04..3aa87f92 100644<br>
--- a/recipes-bsp/rm-lld/rm-lld_git.bb<br>
&#43;&#43;&#43; b/recipes-bsp/rm-lld/rm-lld_git.bb<br>
@@ -6,7 &#43;6,7 @@ DEPENDS =3D &quot;ti-ipc libdaemon&quot;<br>
&nbsp;<br>
&nbsp;PACKAGES =3D&#43; &quot;${PN}-test&quot;<br>
&nbsp;<br>
-FILES_${PN}-test =3D &quot;${bindir}/rmDspClientTest.out \<br>
&#43;FILES:${PN}-test =3D &quot;${bindir}/rmDspClientTest.out \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${bindir}/rmLinuxClientTest.o=
ut \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${bindir}/rmLinuxMtClientTest=
.out \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${bindir}/ti/drv/rm/test/dts_=
files/*.dtb&quot;<br>
@@ -15,10 &#43;15,10 @@ CHOICELIST =3D &quot;yes no&quot;<br>
&nbsp;<br>
&nbsp;do_compile () {<br>
&nbsp;#&nbsp;&nbsp; Now build the lld<br>
-&nbsp;&nbsp;&nbsp; make -f makefile_armv7 clean lib PDK_INSTALL_PATH=3D${S=
TAGING_INCDIR} RM_SRC_DIR=3D${S}<br>
&#43;&nbsp;&nbsp;&nbsp; make -f makefile:armv7 clean lib PDK_INSTALL_PATH=
=3D${STAGING_INCDIR} RM_SRC_DIR=3D${S}<br>
&nbsp;&nbsp;&nbsp;&nbsp; for choice in ${CHOICELIST}<br>
&nbsp;&nbsp;&nbsp;&nbsp; do<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; make -f makefile_armv7 tests IPC_DEVKIT_INS=
TALL_PATH=3D${STAGING_INCDIR} PDK_INSTALL_PATH=3D${BASEDIR} USEDYNAMIC_LIB=
=3D&quot;$choice&quot;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; make -f makefile:armv7 tests IPC_DEVKIT=
_INSTALL_PATH=3D${STAGING_INCDIR} PDK_INSTALL_PATH=3D${BASEDIR} USEDYNAMIC_=
LIB=3D&quot;$choice&quot;<br>
&nbsp;&nbsp;&nbsp;&nbsp; done<br>
&nbsp;}<br>
&nbsp;<br>
@@ -26,7 &#43;26,7 @@ do_install () {<br>
&nbsp;&nbsp;&nbsp;&nbsp; install -d ${D}${includedir}/ti/drv/rm<br>
&nbsp;&nbsp;&nbsp;&nbsp; install -d ${D}${libdir}<br>
&nbsp;&nbsp;&nbsp;&nbsp; install -d ${D}${bindir}<br>
-&nbsp;&nbsp;&nbsp; make -f makefile_armv7 install installbin installbin_te=
st INSTALL_INC_BASE_DIR=3D${D}${includedir} INSTALL_LIB_BASE_DIR=3D${D}${li=
bdir} INSTALL_BIN_BASE_DIR=3D${D}${bindir}<br>
&#43;&nbsp;&nbsp;&nbsp; make -f makefile:armv7 install installbin installbi=
n_test INSTALL_INC_BASE_DIR=3D${D}${includedir} INSTALL_LIB_BASE_DIR=3D${D}=
${libdir} INSTALL_BIN_BASE_DIR=3D${D}${bindir}<br>
&nbsp;&nbsp;&nbsp;&nbsp; chown -R root:root ${D}<br>
&nbsp;}<br>
&nbsp;<br>
diff --git a/recipes-bsp/sa-lld/sa-lld-rtos_git.bb b/recipes-bsp/sa-lld/sa-=
lld-rtos_git.bb<br>
index 5bcdc2e8..a3f68dca 100644<br>
--- a/recipes-bsp/sa-lld/sa-lld-rtos_git.bb<br>
&#43;&#43;&#43; b/recipes-bsp/sa-lld/sa-lld-rtos_git.bb<br>
@@ -6,18 &#43;6,18 @@ require recipes-bsp/sa-lld/sa-lld.inc<br>
&nbsp;<br>
&nbsp;PR =3D &quot;${INC_PR}.0&quot;<br>
&nbsp;<br>
-COMPATIBLE_MACHINE_append =3D &quot;|c667x-evm|k3&quot;<br>
&#43;COMPATIBLE_MACHINE:append =3D &quot;|c667x-evm|k3&quot;<br>
&nbsp;<br>
&nbsp;# Build with make instead of XDC<br>
&nbsp;TI_PDK_XDCMAKE_k3 =3D &quot;0&quot;<br>
&nbsp;<br>
&nbsp;# SA promote/demote library depends on osal<br>
-DEPENDS_append =3D &quot; osal-rtos \<br>
&#43;DEPENDS:append =3D &quot; osal-rtos \<br>
&nbsp;&quot;<br>
&nbsp;export PDK_SA_ROOT_PATH =3D&quot;${WORKDIR}/build&quot;<br>
&nbsp;export DEST_ROOT=3D&quot;${S}&quot;<br>
&nbsp;<br>
-INSANE_SKIP_${PN} =3D &quot;arch&quot;<br>
&#43;INSANE_SKIP:${PN} =3D &quot;arch&quot;<br>
&nbsp;<br>
&nbsp;PACKAGE_ARCH =3D &quot;${MACHINE_ARCH}&quot;<br>
&nbsp;<br>
diff --git a/recipes-bsp/sa-lld/sa-lld-test_git.bb b/recipes-bsp/sa-lld/sa-=
lld-test_git.bb<br>
index b9050b6a..847c7bb8 100644<br>
--- a/recipes-bsp/sa-lld/sa-lld-test_git.bb<br>
&#43;&#43;&#43; b/recipes-bsp/sa-lld/sa-lld-test_git.bb<br>
@@ -17,7 &#43;17,7 @@ CHOICELIST =3D &quot;no yes&quot;<br>
&nbsp;CFLAGS &#43;=3D &quot;-fcommon&quot;<br>
&nbsp;<br>
&nbsp;PARALLEL_MAKE =3D &quot;&quot;<br>
-EXTRA_OEMAKE =3D &quot;-f makefile_armv7 PDK_INSTALL_PATH=3D${STAGING_INCD=
IR} SA_SRC_DIR=3D${S}&quot;<br>
&#43;EXTRA_OEMAKE =3D &quot;-f makefile:armv7 PDK_INSTALL_PATH=3D${STAGING_=
INCDIR} SA_SRC_DIR=3D${S}&quot;<br>
&nbsp;<br>
&nbsp;do_compile () {<br>
&nbsp;#&nbsp;&nbsp; Now build the lld in the updated directory<br>
@@ -43,4 &#43;43,4 @@ do_install () {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; done<br>
&nbsp;}<br>
&nbsp;<br>
-INSANE_SKIP_${PN} =3D &quot;ldflags&quot;<br>
&#43;INSANE_SKIP:${PN} =3D &quot;ldflags&quot;<br>
diff --git a/recipes-bsp/sa-lld/sa-lld_git.bb b/recipes-bsp/sa-lld/sa-lld_g=
it.bb<br>
index a45fe1f7..29b99cd0 100644<br>
--- a/recipes-bsp/sa-lld/sa-lld_git.bb<br>
&#43;&#43;&#43; b/recipes-bsp/sa-lld/sa-lld_git.bb<br>
@@ -7,7 &#43;7,7 @@ include sa-lld.inc<br>
&nbsp;PR =3D &quot;${INC_PR}.1&quot;<br>
&nbsp;<br>
&nbsp;PARALLEL_MAKE =3D &quot;&quot;<br>
-EXTRA_OEMAKE =3D &quot;-f makefile_armv7 PDK_INSTALL_PATH=3D${STAGING_INCD=
IR}&quot;<br>
&#43;EXTRA_OEMAKE =3D &quot;-f makefile:armv7 PDK_INSTALL_PATH=3D${STAGING_=
INCDIR}&quot;<br>
&nbsp;<br>
&nbsp;do_compile () {<br>
&nbsp;#&nbsp;&nbsp; Now build the lld in the updated directory<br>
diff --git a/recipes-bsp/sciclient/sciclient-rtos_git.bb b/recipes-bsp/scic=
lient/sciclient-rtos_git.bb<br>
index deaf0b12..45110999 100644<br>
--- a/recipes-bsp/sciclient/sciclient-rtos_git.bb<br>
&#43;&#43;&#43; b/recipes-bsp/sciclient/sciclient-rtos_git.bb<br>
@@ -14,7 &#43;14,7 @@ PACKAGE_ARCH =3D &quot;${MACHINE_ARCH}&quot;<br>
&nbsp;<br>
&nbsp;PR =3D &quot;r1&quot;<br>
&nbsp;<br>
-DEPENDS_append =3D &quot; osal-rtos common-csl-ip-rtos openssl-native&quot=
;<br>
&#43;DEPENDS:append =3D &quot; osal-rtos common-csl-ip-rtos openssl-native&=
quot;<br>
&nbsp;<br>
&nbsp;# Build with make instead of XDC<br>
&nbsp;TI_PDK_XDCMAKE =3D &quot;0&quot;<br>
@@ -31,7 &#43;31,7 @@ BUILD_HS_j7-hs-evm =3D &quot;yes&quot;<br>
&nbsp;export BUILD_HS<br>
&nbsp;<br>
&nbsp;# Sciclient for am65x supports mcu1_1 in addition to the default core=
s in TI_PDK_LIMIT_CORES<br>
-TI_PDK_LIMIT_CORES_append_am65xx =3D &quot; mcu1_1&quot;<br>
&#43;TI_PDK_LIMIT_CORES:append_am65xx =3D &quot; mcu1_1&quot;<br>
&nbsp;<br>
&nbsp;# HTML doc link params<br>
&nbsp;PDK_COMP_LINK_TEXT =3D &quot;SCICLIENT&quot;<br>
@@ -66,7 &#43;66,7 @@ do_compile() {<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
-do_compile_prepend_am65xx-hs-evm() {<br>
&#43;do_compile:prepend_am65xx-hs-evm() {<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp; cd ${SCICLIENT_ROOTPATH}<br>
&nbsp;<br>
@@ -79,7 &#43;79,7 @@ do_compile_prepend_am65xx-hs-evm() {<br>
&nbsp;&nbsp;&nbsp;&nbsp; cd -<br>
&nbsp;}<br>
&nbsp;<br>
-do_compile_prepend_am65xx-evm() {<br>
&#43;do_compile:prepend_am65xx-evm() {<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp; cd ${SCICLIENT_ROOTPATH}/tools<br>
&nbsp;<br>
@@ -92,7 &#43;92,7 @@ do_compile_prepend_am65xx-evm() {<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
-do_compile_prepend_j7-evm() {<br>
&#43;do_compile:prepend_j7-evm() {<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp; cd ${SCICLIENT_ROOTPATH}/tools<br>
&nbsp;&nbsp;&nbsp;&nbsp; # Create the .bin file for GP<br>
@@ -100,7 &#43;100,7 @@ do_compile_prepend_j7-evm() {<br>
&nbsp;&nbsp;&nbsp;&nbsp; cd -<br>
&nbsp;}<br>
&nbsp;<br>
-do_compile_prepend_j7-hs-evm() {<br>
&#43;do_compile:prepend_j7-hs-evm() {<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp; cd ${SCICLIENT_ROOTPATH}/tools<br>
&nbsp;&nbsp;&nbsp;&nbsp; # Create the .bin file for HS<br>
@@ -114,11 &#43;114,11 @@ do_install() {<br>
&nbsp;&nbsp;&nbsp;&nbsp; find -name &quot;*.tar&quot; -exec tar xf {} --no-=
same-owner -C ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/drv/sciclient \;<br=
>
&nbsp;}<br>
&nbsp;<br>
-FILES_${PN} &#43;=3D &quot;${PDK_INSTALL_DIR_RECIPE}/packages&quot;<br>
&#43;FILES:${PN} &#43;=3D &quot;${PDK_INSTALL_DIR_RECIPE}/packages&quot;<br=
>
&nbsp;<br>
-INSANE_SKIP_${PN} =3D &quot;arch ldflags file-rdeps&quot;<br>
&#43;INSANE_SKIP:${PN} =3D &quot;arch ldflags file-rdeps&quot;<br>
&nbsp;<br>
-INSANE_SKIP_${PN}-dbg =3D &quot;arch&quot;<br>
&#43;INSANE_SKIP:${PN}-dbg =3D &quot;arch&quot;<br>
&nbsp;<br>
&nbsp;INHIBIT_PACKAGE_DEBUG_SPLIT =3D &quot;1&quot;<br>
&nbsp;INHIBIT_PACKAGE_STRIP =3D &quot;1&quot;<br>
diff --git a/recipes-bsp/serdes-diag/serdes-diag-rtos_git.bb b/recipes-bsp/=
serdes-diag/serdes-diag-rtos_git.bb<br>
index 442c4cb1..f9f448e7 100644<br>
--- a/recipes-bsp/serdes-diag/serdes-diag-rtos_git.bb<br>
&#43;&#43;&#43; b/recipes-bsp/serdes-diag/serdes-diag-rtos_git.bb<br>
@@ -32,4 &#43;32,4 @@ TI_PDK_XDCMAKE_k3 =3D &quot;0&quot;<br>
&nbsp;# HTML doc link params<br>
&nbsp;PDK_COMP_LINK_TEXT =3D &quot;SERDES Diagnostics&quot;<br>
&nbsp;<br>
-INSANE_SKIP_${PN} =3D &quot;arch&quot;<br>
&#43;INSANE_SKIP:${PN} =3D &quot;arch&quot;<br>
diff --git a/recipes-bsp/serdes-fw/serdes-fw_git.bb b/recipes-bsp/serdes-fw=
/serdes-fw_git.bb<br>
index 66271788..7d424941 100644<br>
--- a/recipes-bsp/serdes-fw/serdes-fw_git.bb<br>
&#43;&#43;&#43; b/recipes-bsp/serdes-fw/serdes-fw_git.bb<br>
@@ -26,4 &#43;26,4 @@ do_install() {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; done<br>
&nbsp;}<br>
&nbsp;<br>
-FILES_${PN} =3D &quot;${base_libdir}/firmware&quot;<br>
&#43;FILES:${PN} =3D &quot;${base_libdir}/firmware&quot;<br>
diff --git a/recipes-bsp/spi-lld/spi-lld-rtos_git.bb b/recipes-bsp/spi-lld/=
spi-lld-rtos_git.bb<br>
index 7d53d15c..18ec9290 100644<br>
--- a/recipes-bsp/spi-lld/spi-lld-rtos_git.bb<br>
&#43;&#43;&#43; b/recipes-bsp/spi-lld/spi-lld-rtos_git.bb<br>
@@ -14,14 &#43;14,14 @@ PACKAGE_ARCH =3D &quot;${MACHINE_ARCH}&quot;<br>
&nbsp;<br>
&nbsp;PR =3D &quot;r0&quot;<br>
&nbsp;<br>
-DEPENDS_append =3D &quot; osal-rtos \<br>
&#43;DEPENDS:append =3D &quot; osal-rtos \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; edma3-lld-rtos \<br>
&nbsp;&quot;<br>
-DEPENDS_append_ti33x =3D &quot; starterware-rtos pruss-lld-rtos gpio-lld-r=
tos&quot;<br>
-DEPENDS_append_ti43x =3D &quot; starterware-rtos pruss-lld-rtos gpio-lld-r=
tos&quot;<br>
&#43;DEPENDS:append_ti33x =3D &quot; starterware-rtos pruss-lld-rtos gpio-l=
ld-rtos&quot;<br>
&#43;DEPENDS:append_ti43x =3D &quot; starterware-rtos pruss-lld-rtos gpio-l=
ld-rtos&quot;<br>
&nbsp;<br>
-DEPENDS_remove_k3 =3D &quot;edma3-lld-rtos &quot;<br>
-DEPENDS_append_k3 =3D &quot; udma-lld-rtos&quot;<br>
&#43;DEPENDS:remove_k3 =3D &quot;edma3-lld-rtos &quot;<br>
&#43;DEPENDS:append_k3 =3D &quot; udma-lld-rtos&quot;<br>
&nbsp;<br>
&nbsp;<br>
&nbsp;# Build with make instead of XDC<br>
@@ -31,7 &#43;31,7 @@ export PDK_SPI_ROOT_PATH =3D&quot;${WORKDIR}/build&qu=
ot;<br>
&nbsp;export DEST_ROOT=3D&quot;${S}&quot;<br>
&nbsp;<br>
&nbsp;export EDMA3LLD_BIOS6_INSTALLDIR =3D &quot;${EDMA3_LLD_INSTALL_DIR}&q=
uot;<br>
-XDCPATH_append =3D &quot;;${EDMA3_LLD_INSTALL_DIR}/packages&quot;<br>
&#43;XDCPATH:append =3D &quot;;${EDMA3_LLD_INSTALL_DIR}/packages&quot;<br>
&nbsp;<br>
&nbsp;# HTML doc link params<br>
&nbsp;PDK_COMP_LINK_TEXT =3D &quot;SPI LLD&quot;<br>
diff --git a/recipes-bsp/srio-lld/srio-lld-rtos_git.bb b/recipes-bsp/srio-l=
ld/srio-lld-rtos_git.bb<br>
index 7708a18e..9c535759 100644<br>
--- a/recipes-bsp/srio-lld/srio-lld-rtos_git.bb<br>
&#43;&#43;&#43; b/recipes-bsp/srio-lld/srio-lld-rtos_git.bb<br>
@@ -6,10 &#43;6,10 @@ require recipes-bsp/srio-lld/srio-lld.inc<br>
&nbsp;<br>
&nbsp;PR =3D &quot;${INC_PR}.0&quot;<br>
&nbsp;<br>
-DEPENDS_append =3D &quot; cppi-lld-rtos \<br>
&#43;DEPENDS:append =3D &quot; cppi-lld-rtos \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; qmss-lld-rtos \<br>
&nbsp;&quot;<br>
-COMPATIBLE_MACHINE_append =3D &quot;|c66x&quot;<br>
&#43;COMPATIBLE_MACHINE:append =3D &quot;|c66x&quot;<br>
&nbsp;<br>
&nbsp;PACKAGE_ARCH =3D &quot;${MACHINE_ARCH}&quot;<br>
&nbsp;<br>
diff --git a/recipes-bsp/srio-lld/srio-lld.inc b/recipes-bsp/srio-lld/srio-=
lld.inc<br>
index efe379ff..d2d08b6b 100644<br>
--- a/recipes-bsp/srio-lld/srio-lld.inc<br>
&#43;&#43;&#43; b/recipes-bsp/srio-lld/srio-lld.inc<br>
@@ -15,4 &#43;15,4 @@ DEVICELIST =3D &quot;k2h k2k&quot;<br>
&nbsp;<br>
&nbsp;BASEDIR =3D &quot;${WORKDIR}/git&quot;<br>
&nbsp;<br>
-EXTRA_OEMAKE =3D &quot;-f makefile_armv7 PDK_INSTALL_PATH=3D${STAGING_INCD=
IR}&quot;<br>
&#43;EXTRA_OEMAKE =3D &quot;-f makefile:armv7 PDK_INSTALL_PATH=3D${STAGING_=
INCDIR}&quot;<br>
diff --git a/recipes-bsp/starterware/starterware-rtos_git.bb b/recipes-bsp/=
starterware/starterware-rtos_git.bb<br>
index bcac8d42..0d22b4db 100644<br>
--- a/recipes-bsp/starterware/starterware-rtos_git.bb<br>
&#43;&#43;&#43; b/recipes-bsp/starterware/starterware-rtos_git.bb<br>
@@ -24,10 &#43;24,10 @@ do_install() {<br>
&nbsp;&nbsp;&nbsp;&nbsp; find -name &quot;*.tar&quot; -exec tar xf {} --no-=
same-owner -C ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/starterware \;<br>
&nbsp;}<br>
&nbsp;<br>
-FILES_${PN} &#43;=3D &quot;${PDK_INSTALL_DIR_RECIPE}/packages&quot;<br>
&#43;FILES:${PN} &#43;=3D &quot;${PDK_INSTALL_DIR_RECIPE}/packages&quot;<br=
>
&nbsp;<br>
&nbsp;INHIBIT_PACKAGE_STRIP =3D &quot;1&quot;<br>
&nbsp;INHIBIT_SYSROOT_STRIP =3D &quot;1&quot;<br>
&nbsp;INHIBIT_PACKAGE_DEBUG_SPLIT =3D &quot;1&quot;<br>
-INSANE_SKIP_${PN} =3D &quot;arch staticdev file-rdeps&quot;<br>
&#43;INSANE_SKIP:${PN} =3D &quot;arch staticdev file-rdeps&quot;<br>
&nbsp;<br>
diff --git a/recipes-bsp/starterware/starterware_git.bb b/recipes-bsp/start=
erware/starterware_git.bb<br>
index 3adfac36..a560e7bd 100644<br>
--- a/recipes-bsp/starterware/starterware_git.bb<br>
&#43;&#43;&#43; b/recipes-bsp/starterware/starterware_git.bb<br>
@@ -2,7 &#43;2,7 @@ require starterware.inc<br>
&nbsp;<br>
&nbsp;PR =3D &quot;${INC_PR}.0&quot;<br>
&nbsp;<br>
-ALLOW_EMPTY_${PN} =3D &quot;1&quot;<br>
&#43;ALLOW_EMPTY:${PN} =3D &quot;1&quot;<br>
&nbsp;<br>
&nbsp;CLEANBROKEN =3D &quot;1&quot;<br>
&nbsp;<br>
diff --git a/recipes-bsp/tcp3d-lld/tcp3d-lld-rtos_git.bb b/recipes-bsp/tcp3=
d-lld/tcp3d-lld-rtos_git.bb<br>
index 0f7c52bb..db4421ee 100644<br>
--- a/recipes-bsp/tcp3d-lld/tcp3d-lld-rtos_git.bb<br>
&#43;&#43;&#43; b/recipes-bsp/tcp3d-lld/tcp3d-lld-rtos_git.bb<br>
@@ -14,10 &#43;14,10 @@ PACKAGE_ARCH =3D &quot;${MACHINE_ARCH}&quot;<br>
&nbsp;<br>
&nbsp;PR =3D &quot;r0&quot;<br>
&nbsp;<br>
-DEPENDS_append =3D &quot; edma3-lld-rtos&quot;<br>
&#43;DEPENDS:append =3D &quot; edma3-lld-rtos&quot;<br>
&nbsp;<br>
&nbsp;export EDMA3LLD_BIOS6_INSTALLDIR =3D &quot;${EDMA3_LLD_INSTALL_DIR}&q=
uot;<br>
-XDCPATH_append =3D &quot;;${EDMA3_LLD_INSTALL_DIR}/packages&quot;<br>
&#43;XDCPATH:append =3D &quot;;${EDMA3_LLD_INSTALL_DIR}/packages&quot;<br>
&nbsp;<br>
&nbsp;# HTML doc link params<br>
&nbsp;PDK_COMP_LINK_TEXT =3D &quot;TCP3D LLD&quot;<br>
diff --git a/recipes-bsp/ti-ocf-crypto-module/ti-ocf-crypto-module_1.0.bb b=
/recipes-bsp/ti-ocf-crypto-module/ti-ocf-crypto-module_1.0.bb<br>
index 43eed7d1..946f2ceb 100644<br>
--- a/recipes-bsp/ti-ocf-crypto-module/ti-ocf-crypto-module_1.0.bb<br>
&#43;&#43;&#43; b/recipes-bsp/ti-ocf-crypto-module/ti-ocf-crypto-module_1.0=
.bb<br>
@@ -19,13 &#43;19,13 @@ S =3D &quot;${WORKDIR}/trunk&quot;<br>
&nbsp;<br>
&nbsp;inherit module<br>
&nbsp;<br>
-MACHINE_KERNEL_PR_append =3D &quot;b&quot;<br>
&#43;MACHINE_KERNEL_PR:append =3D &quot;b&quot;<br>
&nbsp;PR =3D &quot;${MACHINE_KERNEL_PR}&quot;<br>
-PV_append =3D &quot;&#43;svn${SRCPV}&quot;<br>
&#43;PV:append =3D &quot;&#43;svn${SRCPV}&quot;<br>
&nbsp;<br>
&nbsp;EXTRA_OEMAKE &#43;=3D &quot;KERNEL_DIR=3D${STAGING_KERNEL_DIR}&quot;<=
br>
&nbsp;<br>
-do_compile_prepend () {<br>
&#43;do_compile:prepend () {<br>
&nbsp;&nbsp;&nbsp;&nbsp; sed -i &quot;s/arm-none-linux-gnueabi-/${TARGET_PR=
EFIX}/g&quot; ${S}/Makefile<br>
&nbsp;}<br>
&nbsp;<br>
diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw-source_git.bb b/recipes-bsp/ti=
-sci-fw/ti-sci-fw-source_git.bb<br>
index 063e72d7..c8f830f7 100644<br>
--- a/recipes-bsp/ti-sci-fw/ti-sci-fw-source_git.bb<br>
&#43;&#43;&#43; b/recipes-bsp/ti-sci-fw/ti-sci-fw-source_git.bb<br>
@@ -20,7 &#43;20,7 @@ do_compile[noexec] =3D &quot;1&quot;<br>
&nbsp;<br>
&nbsp;SRCIPK_SRC_DIR =3D &quot;${WORKDIR}/imggen&quot;<br>
&nbsp;SRCIPK_INSTALL_DIR =3D &quot;board-support/k3-image-gen-${PV}&quot;<b=
r>
-FILES_${PN} =3D &quot;${SRCIPK_INSTALL_DIR}&quot;<br>
&#43;FILES:${PN} =3D &quot;${SRCIPK_INSTALL_DIR}&quot;<br>
&nbsp;<br>
&nbsp;do_install() {<br>
&nbsp;&nbsp;&nbsp;&nbsp; # Copy sources for packaging<br>
@@ -42,4 &#43;42,4 @@ do_install() {<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;# Do not perform any QA checks on source package<br>
-INSANE_SKIP_${PN} &#43;=3D &quot;${ALL_QA}&quot;<br>
&#43;INSANE_SKIP:${PN} &#43;=3D &quot;${ALL_QA}&quot;<br>
diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_0.1.1.50.bb b/recipes-bsp/ti-s=
ci-fw/ti-sci-fw_0.1.1.50.bb<br>
index 9e68fdff..32ea3b4d 100644<br>
--- a/recipes-bsp/ti-sci-fw/ti-sci-fw_0.1.1.50.bb<br>
&#43;&#43;&#43; b/recipes-bsp/ti-sci-fw/ti-sci-fw_0.1.1.50.bb<br>
@@ -25,7 &#43;25,7 @@ do_install() {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; install -m 0644 ${S}/ti-ke=
ystone/${TARGET} ${D}/boot/${TARGET}<br>
&nbsp;}<br>
&nbsp;<br>
-FILES_${PN} =3D &quot;/boot&quot;<br>
&#43;FILES:${PN} =3D &quot;/boot&quot;<br>
&nbsp;<br>
&nbsp;inherit deploy<br>
&nbsp;<br>
diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/recipes-bsp/ti-sci-fw=
/ti-sci-fw_git.bb<br>
index 87fdec68..57118ad6 100644<br>
--- a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb<br>
&#43;&#43;&#43; b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb<br>
@@ -1,15 &#43;1,15 @@<br>
&nbsp;require recipes-bsp/ti-sci-fw/ti-sci-fw.inc<br>
&nbsp;<br>
&nbsp;DEPENDS =3D &quot;openssl-native u-boot-mkimage-native dtc-native&quo=
t;<br>
-DEPENDS_append_j7200-evm-k3r5 =3D &quot; virtual/bootloader&quot;<br>
-DEPENDS_append_am64xx-evm-k3r5 =3D &quot; virtual/bootloader&quot;<br>
&#43;DEPENDS:append_j7200-evm-k3r5 =3D &quot; virtual/bootloader&quot;<br>
&#43;DEPENDS:append_am64xx-evm-k3r5 =3D &quot; virtual/bootloader&quot;<br>
&nbsp;<br>
&nbsp;CLEANBROKEN =3D &quot;1&quot;<br>
&nbsp;PR =3D &quot;r1&quot;<br>
&nbsp;<br>
&nbsp;# Loaded by R5F core<br>
&nbsp;COMPATIBLE_MACHINE =3D &quot;k3r5&quot;<br>
-COMPATIBLE_MACHINE_aarch64 =3D &quot;null&quot;<br>
&#43;COMPATIBLE_MACHINE:aarch64 =3D &quot;null&quot;<br>
&nbsp;<br>
&nbsp;PACKAGE_ARCH =3D &quot;${MACHINE_ARCH}&quot;<br>
&nbsp;<br>
@@ -49,10 &#43;49,10 @@ EXTRA_OEMAKE =3D &quot;\<br>
&nbsp;EXTRA_OEMAKE_HS =3D &quot; \<br>
&nbsp;&nbsp;&nbsp;&nbsp; HS=3D1 SYSFW_HS_PATH=3D&quot;${S}/ti-sysfw/${SYSFW=
_BASE}-enc.bin&quot; SYSFW_HS_INNER_CERT_PATH=3D&quot;${S}/ti-sysfw/${SYSFW=
_BASE}-cert.bin&quot; \<br>
&nbsp;&quot;<br>
-EXTRA_OEMAKE_append =3D &quot;${@['',' ${EXTRA_OEMAKE_HS}']['${SYSFW_SUFFI=
X}' =3D=3D 'hs']}&quot;<br>
&#43;EXTRA_OEMAKE:append =3D &quot;${@['',' ${EXTRA_OEMAKE_HS}']['${SYSFW_S=
UFFIX}' =3D=3D 'hs']}&quot;<br>
&nbsp;<br>
-EXTRA_OEMAKE_append_j7200-evm-k3r5 =3D &quot; SBL=3D&quot;${STAGING_DIR_HO=
ST}/boot/u-boot-spl.bin&quot;&quot;<br>
-EXTRA_OEMAKE_append_am64xx-evm-k3r5 =3D &quot; SBL=3D&quot;${STAGING_DIR_H=
OST}/boot/u-boot-spl.bin&quot;&quot;<br>
&#43;EXTRA_OEMAKE:append_j7200-evm-k3r5 =3D &quot; SBL=3D&quot;${STAGING_DI=
R_HOST}/boot/u-boot-spl.bin&quot;&quot;<br>
&#43;EXTRA_OEMAKE:append_am64xx-evm-k3r5 =3D &quot; SBL=3D&quot;${STAGING_D=
IR_HOST}/boot/u-boot-spl.bin&quot;&quot;<br>
&nbsp;<br>
&nbsp;do_compile() {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cd ${WORKDIR}/imggen/<br>
@@ -68,7 &#43;68,7 @@ do_install() {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fi<br>
&nbsp;}<br>
&nbsp;<br>
-FILES_${PN} =3D &quot;/boot&quot;<br>
&#43;FILES:${PN} =3D &quot;/boot&quot;<br>
&nbsp;<br>
&nbsp;inherit deploy<br>
&nbsp;<br>
diff --git a/recipes-bsp/traceframework/traceframework-rtos_git.bb b/recipe=
s-bsp/traceframework/traceframework-rtos_git.bb<br>
index 369b04b4..55e41188 100644<br>
--- a/recipes-bsp/traceframework/traceframework-rtos_git.bb<br>
&#43;&#43;&#43; b/recipes-bsp/traceframework/traceframework-rtos_git.bb<br>
@@ -4,7 &#43;4,7 @@ require traceframework.inc<br>
&nbsp;<br>
&nbsp;PR =3D &quot;${INC_PR}.2&quot;<br>
&nbsp;<br>
-XDCPATH_append =3D &quot;;${UIA_INSTALL_DIR}/packages&quot;<br>
&#43;XDCPATH:append =3D &quot;;${UIA_INSTALL_DIR}/packages&quot;<br>
&nbsp;<br>
&nbsp;# HTML doc link params<br>
&nbsp;PDK_COMP_LINK_TEXT =3D &quot;Trace Framework&quot;<br>
diff --git a/recipes-bsp/traceframework/traceframework_git.bb b/recipes-bsp=
/traceframework/traceframework_git.bb<br>
index 26eb81a0..5a2873e0 100644<br>
--- a/recipes-bsp/traceframework/traceframework_git.bb<br>
&#43;&#43;&#43; b/recipes-bsp/traceframework/traceframework_git.bb<br>
@@ -8,7 &#43;8,7 @@ PR =3D &quot;${INC_PR}.0&quot;<br>
&nbsp;<br>
&nbsp;BASEDIR =3D &quot;${WORKDIR}/git&quot;<br>
&nbsp;<br>
-EXTRA_OEMAKE &#43;=3D &quot;-f makefile_armv7 PDK_INSTALL_PATH=3D${STAGING=
_INCDIR} \<br>
&#43;EXTRA_OEMAKE &#43;=3D &quot;-f makefile:armv7 PDK_INSTALL_PATH=3D${STA=
GING_INCDIR} \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; CUIA_INSTALL_DIR=3D${STAGING_INCDIR} CUIA_LIB_D=
IR=3D${STAGING_LIBDIR}&quot;<br>
&nbsp;<br>
&nbsp;do_compile () {<br>
@@ -34,7 &#43;34,7 @@ do_install() {<br>
&nbsp;<br>
&nbsp;PACKAGES =3D&#43; &quot;${PN}-test&quot;<br>
&nbsp;<br>
-FILES_${PN}-test =3D &quot;${bindir}/tfw*.out \<br>
&#43;FILES:${PN}-test =3D &quot;${bindir}/tfw*.out \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${bindir}/*.txt&quot;<br>
&nbsp;<br>
&nbsp;INHIBIT_PACKAGE_STRIP_FILES =3D &quot;${PKGD}${libdir}/libtraceframew=
ork.a&quot;<br>
diff --git a/recipes-bsp/transport-rtos/bmet-eth-rtos_git.bb b/recipes-bsp/=
transport-rtos/bmet-eth-rtos_git.bb<br>
index f14161ff..aa21b652 100644<br>
--- a/recipes-bsp/transport-rtos/bmet-eth-rtos_git.bb<br>
&#43;&#43;&#43; b/recipes-bsp/transport-rtos/bmet-eth-rtos_git.bb<br>
@@ -9,7 &#43;9,7 @@ LIC_FILES_CHKSUM =3D &quot;<a href=3D""></a>file://bmet=
_transport.h;beginline=3D12;endline=3D40;md5=3D6d209c69<br>
&nbsp;<br>
&nbsp;COMPATIBLE_MACHINE =3D &quot;k2hk|k2e|k2l&quot;<br>
&nbsp;<br>
-DEPENDS_append =3D &quot; qmss-lld-rtos \<br>
&#43;DEPENDS:append =3D &quot; qmss-lld-rtos \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cppi-lld-rtos \<br>
&nbsp;&quot;<br>
&nbsp;<br>
diff --git a/recipes-bsp/transport-rtos/nimu-icss-rtos_git.bb b/recipes-bsp=
/transport-rtos/nimu-icss-rtos_git.bb<br>
index 7400adf8..e4f9905e 100644<br>
--- a/recipes-bsp/transport-rtos/nimu-icss-rtos_git.bb<br>
&#43;&#43;&#43; b/recipes-bsp/transport-rtos/nimu-icss-rtos_git.bb<br>
@@ -9,13 &#43;9,13 @@ LIC_FILES_CHKSUM =3D &quot;<a href=3D""></a>file://ni=
mu_icssEth.h;beginline=3D1;endline=3D35;md5=3D3ea633a510b<br>
&nbsp;<br>
&nbsp;COMPATIBLE_MACHINE =3D &quot;ti33x|ti43x|omap-a15|k2g|c66x|omapl1|k3&=
quot;<br>
&nbsp;<br>
-DEPENDS_append =3D &quot; ti-ndk \<br>
&#43;DEPENDS:append =3D &quot; ti-ndk \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pruss-lld-rtos \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; icss-emac-lld-rtos \<br>
&nbsp;&quot;<br>
-DEPENDS_append_c665x-evm =3D &quot; emac-lld-rtos&quot;<br>
-DEPENDS_append_c667x-evm =3D &quot; pa-lld-rtos&quot;<br>
-DEPENDS_append_omapl1 =3D &quot; emac-lld-rtos&quot;<br>
&#43;DEPENDS:append_c665x-evm =3D &quot; emac-lld-rtos&quot;<br>
&#43;DEPENDS:append_c667x-evm =3D &quot; pa-lld-rtos&quot;<br>
&#43;DEPENDS:append_omapl1 =3D &quot; emac-lld-rtos&quot;<br>
&nbsp;<br>
&nbsp;TI_PDK_COMP =3D &quot;ti.transport.ndk.nimu_icss&quot;<br>
&nbsp;<br>
@@ -26,4 &#43;26,4 @@ export PDK_NIMU_ICSS_ROOT_PATH =3D&quot;${WORKDIR}/bu=
ild&quot;<br>
&nbsp;export DEST_ROOT=3D&quot;${S}&quot;<br>
&nbsp;<br>
&nbsp;export NDK_INSTALL_PATH =3D &quot;${NDK_INSTALL_DIR}&quot;<br>
-XDCPATH_append =3D &quot;;${NDK_INSTALL_DIR}/packages&quot;<br>
&#43;XDCPATH:append =3D &quot;;${NDK_INSTALL_DIR}/packages&quot;<br>
diff --git a/recipes-bsp/transport-rtos/nimu-rtos_git.bb b/recipes-bsp/tran=
sport-rtos/nimu-rtos_git.bb<br>
index 4389b1e8..75c97589 100644<br>
--- a/recipes-bsp/transport-rtos/nimu-rtos_git.bb<br>
&#43;&#43;&#43; b/recipes-bsp/transport-rtos/nimu-rtos_git.bb<br>
@@ -11,19 &#43;11,19 @@ COMPATIBLE_MACHINE =3D &quot;ti33x|ti43x|omap-a15|k=
eystone|c66x|omapl1|k3&quot;<br>
&nbsp;<br>
&nbsp;TI_PDK_COMP =3D &quot;ti.transport.ndk.nimu&quot;<br>
&nbsp;<br>
-DEPENDS_append =3D &quot; ti-ndk osal-rtos&quot;<br>
-DEPENDS_append_ti33x =3D &quot; starterware-rtos emac-lld-rtos&quot;<br>
-DEPENDS_append_ti43x =3D &quot; starterware-rtos emac-lld-rtos&quot;<br>
-DEPENDS_append_omap-a15 =3D &quot; emac-lld-rtos&quot;<br>
-DEPENDS_append_keystone =3D &quot; qmss-lld-rtos cppi-lld-rtos&quot;<br>
-DEPENDS_append_k2hk =3D &quot; pa-lld-rtos&quot;<br>
-DEPENDS_append_k2e =3D &quot; pa-lld-rtos&quot;<br>
-DEPENDS_append_k2l =3D &quot; pa-lld-rtos&quot;<br>
-DEPENDS_append_k2g =3D &quot; emac-lld-rtos&quot;<br>
-DEPENDS_append_c665x-evm =3D &quot; emac-lld-rtos&quot;<br>
-DEPENDS_append_c667x-evm =3D &quot; pa-lld-rtos cppi-lld-rtos&quot;<br>
-DEPENDS_append_omapl1 =3D &quot; emac-lld-rtos&quot;<br>
-DEPENDS_append_k3 =3D &quot; emac-lld-rtos pruss-lld-rtos&quot;<br>
&#43;DEPENDS:append =3D &quot; ti-ndk osal-rtos&quot;<br>
&#43;DEPENDS:append_ti33x =3D &quot; starterware-rtos emac-lld-rtos&quot;<b=
r>
&#43;DEPENDS:append_ti43x =3D &quot; starterware-rtos emac-lld-rtos&quot;<b=
r>
&#43;DEPENDS:append_omap-a15 =3D &quot; emac-lld-rtos&quot;<br>
&#43;DEPENDS:append_keystone =3D &quot; qmss-lld-rtos cppi-lld-rtos&quot;<b=
r>
&#43;DEPENDS:append_k2hk =3D &quot; pa-lld-rtos&quot;<br>
&#43;DEPENDS:append_k2e =3D &quot; pa-lld-rtos&quot;<br>
&#43;DEPENDS:append_k2l =3D &quot; pa-lld-rtos&quot;<br>
&#43;DEPENDS:append_k2g =3D &quot; emac-lld-rtos&quot;<br>
&#43;DEPENDS:append_c665x-evm =3D &quot; emac-lld-rtos&quot;<br>
&#43;DEPENDS:append_c667x-evm =3D &quot; pa-lld-rtos cppi-lld-rtos&quot;<br=
>
&#43;DEPENDS:append_omapl1 =3D &quot; emac-lld-rtos&quot;<br>
&#43;DEPENDS:append_k3 =3D &quot; emac-lld-rtos pruss-lld-rtos&quot;<br>
&nbsp;<br>
&nbsp;# Build with make instead of XDC<br>
&nbsp;TI_PDK_XDCMAKE =3D &quot;0&quot;<br>
@@ -32,4 &#43;32,4 @@ export PDK_NIMU_ROOT_PATH =3D&quot;${WORKDIR}/build&q=
uot;<br>
&nbsp;export DEST_ROOT=3D&quot;${S}&quot;<br>
&nbsp;<br>
&nbsp;export NDK_INSTALL_PATH =3D &quot;${NDK_INSTALL_DIR}&quot;<br>
-XDCPATH_append =3D &quot;;${NDK_INSTALL_DIR}/packages&quot;<br>
&#43;XDCPATH:append =3D &quot;;${NDK_INSTALL_DIR}/packages&quot;<br>
diff --git a/recipes-bsp/transport-rtos/timesync-rtos_git.bb b/recipes-bsp/=
transport-rtos/timesync-rtos_git.bb<br>
index 556c1288..3913ecf4 100644<br>
--- a/recipes-bsp/transport-rtos/timesync-rtos_git.bb<br>
&#43;&#43;&#43; b/recipes-bsp/transport-rtos/timesync-rtos_git.bb<br>
@@ -9,7 &#43;9,7 @@ LIC_FILES_CHKSUM =3D &quot;<a href=3D""></a>file://time=
Sync_ver.h;beginline=3D23;endline=3D45;md5=3D4bd873035e<br>
&nbsp;<br>
&nbsp;COMPATIBLE_MACHINE =3D &quot;ti33x|ti43x|omap-a15|k2g&quot;<br>
&nbsp;<br>
-DEPENDS_append =3D &quot; ti-ndk \<br>
&#43;DEPENDS:append =3D &quot; ti-ndk \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; osal-rtos \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pruss-lld-rtos \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; icss-emac-lld-rtos \<br>
@@ -28,4 &#43;28,4 @@ export DEST_ROOT=3D&quot;${S}&quot;<br>
&nbsp;export NDK_INSTALL_PATH =3D &quot;${NDK_INSTALL_DIR}&quot;<br>
&nbsp;export EDMA3LLD_BIOS6_INSTALLDIR =3D &quot;${EDMA3_LLD_INSTALL_DIR}&q=
uot;<br>
&nbsp;<br>
-XDCPATH_append =3D &quot;;${NDK_INSTALL_DIR}/packages&quot;<br>
&#43;XDCPATH:append =3D &quot;;${NDK_INSTALL_DIR}/packages&quot;<br>
diff --git a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend b=
/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend<br>
index f075cac0..d02562c2 100644<br>
--- a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend<br>
&#43;&#43;&#43; b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbapp=
end<br>
@@ -8,7 &#43;8,7 @@ TFA_BUILD_TARGET_k3 =3D &quot;all&quot;<br>
&nbsp;TFA_INSTALL_TARGET_k3 =3D &quot;bl31&quot;<br>
&nbsp;TFA_SPD_k3 =3D &quot;opteed&quot;<br>
&nbsp;<br>
-do_compile_append_am65xx-hs-evm() {<br>
&#43;do_compile:append_am65xx-hs-evm() {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; export TI_SECURE_DEV_PKG=
=3D${TI_SECURE_DEV_PKG}<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ( cd ${BUILD_DIR}; \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; mv bl31.bin bl31.bin.unsigned; \<br>
@@ -16,7 &#43;16,7 @@ do_compile_append_am65xx-hs-evm() {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; )<br>
&nbsp;}<br>
&nbsp;<br>
-do_compile_append_j7-hs-evm() {<br>
&#43;do_compile:append_j7-hs-evm() {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; export TI_SECURE_DEV_PKG=
=3D${TI_SECURE_DEV_PKG}<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ( cd ${BUILD_DIR}; \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; mv bl31.bin bl31.bin.unsigned; \<br>
diff --git a/recipes-bsp/u-boot/u-boot-ti.inc b/recipes-bsp/u-boot/u-boot-t=
i.inc<br>
index dc8d6b06..8c8575dc 100644<br>
--- a/recipes-bsp/u-boot/u-boot-ti.inc<br>
&#43;&#43;&#43; b/recipes-bsp/u-boot/u-boot-ti.inc<br>
@@ -16,7 &#43;16,7 @@ SPL_BINARY ?=3D &quot;MLO&quot;<br>
&nbsp;require ${COREBASE}/meta/recipes-bsp/u-boot/u-boot-common.inc<br>
&nbsp;require ${COREBASE}/meta/recipes-bsp/u-boot/u-boot.inc<br>
&nbsp;<br>
-FILESEXTRAPATHS_prepend :=3D &quot;${THISDIR}/u-boot:&quot;<br>
&#43;FILESEXTRAPATHS:prepend :=3D &quot;${THISDIR}/u-boot:&quot;<br>
&nbsp;<br>
&nbsp;SUMMARY =3D &quot;u-boot bootloader for TI devices&quot;<br>
&nbsp;<br>
@@ -28,7 &#43;28,7 @@ UBOOT_GIT_URI =3D &quot;git://git.ti.com/ti-u-boot/ti=
-u-boot.git&quot;<br>
&nbsp;UBOOT_GIT_PROTOCOL =3D &quot;git&quot;<br>
&nbsp;SRC_URI =3D &quot;${UBOOT_GIT_URI};protocol=3D${UBOOT_GIT_PROTOCOL};b=
ranch=3D${BRANCH}&quot;<br>
&nbsp;<br>
-PV_append =3D &quot;&#43;git${SRCPV}&quot;<br>
&#43;PV:append =3D &quot;&#43;git${SRCPV}&quot;<br>
&nbsp;<br>
&nbsp;# u-boot needs devtree compiler to parse dts files<br>
&nbsp;DEPENDS &#43;=3D &quot;dtc-native bc-native lzop-native flex-native b=
ison-native&quot;<br>
@@ -39,17 &#43;39,17 @@ PACKAGECONFIG[atf] =3D &quot;ATF=3D${STAGING_DIR_HO=
ST}/firmware/bl31.bin,,trusted-firmwar<br>
&nbsp;PACKAGECONFIG[optee] =3D &quot;TEE=3D${STAGING_DIR_HOST}${nonarch_bas=
e_libdir}/firmware/bl32.bin,,optee-os&quot;<br>
&nbsp;PACKAGECONFIG[dm] =3D &quot;DM=3D${STAGING_DIR_HOST}${nonarch_base_li=
bdir}/firmware/pdk-ipc/${DM_FIRMWARE},,ti-rtos-firmware&quot;<br>
&nbsp;<br>
-PACKAGECONFIG_append_aarch64 =3D &quot; atf optee&quot;<br>
-PACKAGECONFIG_append_j7 =3D &quot; dm&quot;<br>
&#43;PACKAGECONFIG:append:aarch64 =3D &quot; atf optee&quot;<br>
&#43;PACKAGECONFIG:append_j7 =3D &quot; dm&quot;<br>
&nbsp;<br>
&nbsp;COMPATIBLE_MACHINE =3D &quot;(ti-soc)&quot;<br>
&nbsp;<br>
&nbsp;EXTRA_OEMAKE &#43;=3D &quot;${PACKAGECONFIG_CONFARGS}&quot;<br>
&nbsp;<br>
&nbsp;PROVIDES &#43;=3D &quot;u-boot&quot;<br>
-PKG_${PN} =3D &quot;u-boot&quot;<br>
-PKG_${PN}-dev =3D &quot;u-boot-dev&quot;<br>
-PKG_${PN}-dbg =3D &quot;u-boot-dbg&quot;<br>
&#43;PKG:${PN} =3D &quot;u-boot&quot;<br>
&#43;PKG:${PN}-dev =3D &quot;u-boot-dev&quot;<br>
&#43;PKG:${PN}-dbg =3D &quot;u-boot-dbg&quot;<br>
&nbsp;<br>
&nbsp;S =3D &quot;${WORKDIR}/git&quot;<br>
&nbsp;<br>
@@ -115,7 &#43;115,7 @@ UBOOT_HS_2ND_BINARY =3D &quot;u-boot-spl_HS_2ND&quo=
t;<br>
&nbsp;UBOOT_HS_2ND_IMAGE =3D &quot;u-boot-spl_HS_2ND-${MACHINE}-${PV}-${PR}=
&quot;<br>
&nbsp;UBOOT_HS_2ND_SYMLINK =3D &quot;u-boot-spl_HS_2ND-${MACHINE}&quot;<br>
&nbsp;<br>
-do_install_append () {<br>
&#43;do_install:append () {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if [ -n &quot;${UBOOT_CONF=
IG}&quot; ]<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; then<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; for config in ${UBOOT_MACHINE}; do<br>
@@ -178,7 &#43;178,7 @@ do_install_append () {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fi<br>
&nbsp;}<br>
&nbsp;<br>
-do_deploy_append () {<br>
&#43;do_deploy:append () {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if [ -n &quot;${UBOOT_CONF=
IG}&quot; ]<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; then<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; for config in ${UBOOT_MACHINE}; do<br>
@@ -275,7 &#43;275,7 @@ do_deploy_append () {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rm ${DEPLOYDIR}/${PN}-init=
ial-env-${MACHINE}-${PV}-${PR} || true<br>
&nbsp;}<br>
&nbsp;<br>
-do_install_append_keystone () {<br>
&#43;do_install:append_keystone () {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if [ -n &quot;${UBOOT_CONF=
IG}&quot; ]<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; then<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; for config in ${UBOOT_MACHINE}; do<br>
@@ -324,7 &#43;324,7 @@ do_install_append_keystone () {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fi<br>
&nbsp;}<br>
&nbsp;<br>
-do_deploy_append_keystone () {<br>
&#43;do_deploy:append_keystone () {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if [ -n &quot;${UBOOT_CONF=
IG}&quot; ]<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; then<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; for config in ${UBOOT_MACHINE}; do<br>
@@ -391,12 &#43;391,12 @@ do_deploy_append_keystone () {<br>
&nbsp;# j7200 uses combined image for tiboot3.bin that includes u-boot-spl.=
bin and sysfw<br>
&nbsp;# along with board PM/RM configs generated by k3-image-gen and comes =
from ti-sci-fw<br>
&nbsp;# hence move the legacy u-boot's tiboot3.bin and u-boot-spl.bin out o=
f the way<br>
-do_deploy_append_j7200-evm-k3r5 () {<br>
&#43;do_deploy:append_j7200-evm-k3r5 () {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mv ${DEPLOYDIR}/tiboot3.bi=
n ${DEPLOYDIR}/tiboot3-r5spl.bin || true<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mv ${DEPLOYDIR}/u-boot-spl=
.bin ${DEPLOYDIR}/u-boot-spl-r5spl.bin || true<br>
&nbsp;}<br>
&nbsp;<br>
-do_deploy_append_am64xx-evm-k3r5 () {<br>
&#43;do_deploy:append_am64xx-evm-k3r5 () {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mv ${DEPLOYDIR}/tiboot3.bi=
n ${DEPLOYDIR}/tiboot3-r5spl.bin || true<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mv ${DEPLOYDIR}/u-boot-spl=
.bin ${DEPLOYDIR}/u-boot-spl-r5spl.bin || true<br>
&nbsp;}<br>
diff --git a/recipes-bsp/uart-lld/uart-lld-rtos_git.bb b/recipes-bsp/uart-l=
ld/uart-lld-rtos_git.bb<br>
index f293fdda..b81eecb0 100644<br>
--- a/recipes-bsp/uart-lld/uart-lld-rtos_git.bb<br>
&#43;&#43;&#43; b/recipes-bsp/uart-lld/uart-lld-rtos_git.bb<br>
@@ -15,16 &#43;15,16 @@ PACKAGE_ARCH =3D &quot;${MACHINE_ARCH}&quot;<br>
&nbsp;<br>
&nbsp;PR =3D &quot;r0&quot;<br>
&nbsp;<br>
-DEPENDS_append =3D &quot; edma3-lld-rtos \<br>
&#43;DEPENDS:append =3D &quot; edma3-lld-rtos \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; osal-rtos \<br>
&nbsp;&quot;<br>
-DEPENDS_append_ti33x =3D &quot; starterware-rtos \<br>
&#43;DEPENDS:append_ti33x =3D &quot; starterware-rtos \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 pruss-lld-rtos \<br>
&nbsp;&quot;<br>
-DEPENDS_append_ti43x =3D &quot; starterware-rtos&quot;<br>
&#43;DEPENDS:append_ti43x =3D &quot; starterware-rtos&quot;<br>
&nbsp;<br>
-DEPENDS_remove_k3 =3D &quot;edma3-lld-rtos &quot;<br>
-DEPENDS_append_k3 =3D &quot; udma-lld-rtos &quot;<br>
&#43;DEPENDS:remove_k3 =3D &quot;edma3-lld-rtos &quot;<br>
&#43;DEPENDS:append_k3 =3D &quot; udma-lld-rtos &quot;<br>
&nbsp;<br>
&nbsp;# Build with make instead of XDC<br>
&nbsp;TI_PDK_XDCMAKE =3D &quot;0&quot;<br>
@@ -33,9 &#43;33,9 @@ export PDK_UART_ROOT_PATH =3D&quot;${WORKDIR}/build&q=
uot;<br>
&nbsp;export DEST_ROOT=3D&quot;${S}&quot;<br>
&nbsp;<br>
&nbsp;export EDMA3LLD_BIOS6_INSTALLDIR =3D &quot;${EDMA3_LLD_INSTALL_DIR}&q=
uot;<br>
-XDCPATH_append =3D &quot;;${EDMA3_LLD_INSTALL_DIR}/packages&quot;<br>
&#43;XDCPATH:append =3D &quot;;${EDMA3_LLD_INSTALL_DIR}/packages&quot;<br>
&nbsp;<br>
&nbsp;# HTML doc link params<br>
&nbsp;PDK_COMP_LINK_TEXT =3D &quot;UART LLD&quot;<br>
&nbsp;<br>
-INSANE_SKIP_${PN} =3D &quot;arch&quot;<br>
&#43;INSANE_SKIP:${PN} =3D &quot;arch&quot;<br>
diff --git a/recipes-bsp/udma-lld/udma-lld-rtos_git.bb b/recipes-bsp/udma-l=
ld/udma-lld-rtos_git.bb<br>
index a82eb362..a65876b6 100644<br>
--- a/recipes-bsp/udma-lld/udma-lld-rtos_git.bb<br>
&#43;&#43;&#43; b/recipes-bsp/udma-lld/udma-lld-rtos_git.bb<br>
@@ -15,7 &#43;15,7 @@ PACKAGE_ARCH =3D &quot;${MACHINE_ARCH}&quot;<br>
&nbsp;<br>
&nbsp;PR =3D &quot;r1&quot;<br>
&nbsp;<br>
-DEPENDS_append =3D &quot; osal-rtos \<br>
&#43;DEPENDS:append =3D &quot; osal-rtos \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sciclient-rtos \<br>
&nbsp;&quot;<br>
&nbsp;<br>
@@ -60,6 &#43;60,6 @@ do_install() {<br>
&nbsp;&nbsp;&nbsp;&nbsp; find -name &quot;*.tar&quot; -exec tar xf {} --no-=
same-owner -C ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/drv/udma \;<br>
&nbsp;}<br>
&nbsp;<br>
-FILES_${PN} &#43;=3D &quot;${PDK_INSTALL_DIR_RECIPE}/packages&quot;<br>
&#43;FILES:${PN} &#43;=3D &quot;${PDK_INSTALL_DIR_RECIPE}/packages&quot;<br=
>
&nbsp;<br>
-INSANE_SKIP_${PN} =3D &quot;arch ldflags&quot;<br>
&#43;INSANE_SKIP:${PN} =3D &quot;arch ldflags&quot;<br>
diff --git a/recipes-bsp/uio-module-drv/uio-module-drv-test_git.bb b/recipe=
s-bsp/uio-module-drv/uio-module-drv-test_git.bb<br>
index 3a4fb1bf..3c94f691 100644<br>
--- a/recipes-bsp/uio-module-drv/uio-module-drv-test_git.bb<br>
&#43;&#43;&#43; b/recipes-bsp/uio-module-drv/uio-module-drv-test_git.bb<br>
@@ -12,7 &#43;12,7 @@ DEVICE_NAME_ti33x =3D &quot;am33xx&quot;<br>
&nbsp;DEVICE_NAME_ti43x =3D &quot;am43xx&quot;<br>
&nbsp;DEVICE_NAME_keystone =3D &quot;keystone&quot;<br>
&nbsp;DEVICE_NAME_k2g =3D &quot;k2g&quot;<br>
-RDEPENDS_${PN} =3D &quot;uio-module-drv&quot;<br>
&#43;RDEPENDS:${PN} =3D &quot;uio-module-drv&quot;<br>
&nbsp;<br>
&nbsp;do_compile() {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; oe_runmake -C ${S} test &q=
uot;DEVICE=3D${DEVICE_NAME}&quot;<br>
@@ -24,22 &#43;24,22 @@ do_install() {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; install -c -m 755 ${S}/tes=
t/uio_int_test ${D}${bindir}/.<br>
&nbsp;}<br>
&nbsp;<br>
-do_install_append_keystone () {<br>
&#43;do_install:append_keystone () {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; install -c -m 755 ${S}/tes=
t/uio_cic2_int_multithread_test ${D}${bindir}/.<br>
&nbsp;}<br>
&nbsp;<br>
-do_install_append_k2g () {<br>
&#43;do_install:append_k2g () {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; install -c -m 755 ${S}/tes=
t/prussdrv_test/test/pruss_uio_test ${D}${bindir}/.<br>
&nbsp;}<br>
&nbsp;<br>
-do_install_append_omap-a15 () {<br>
&#43;do_install:append_omap-a15 () {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; install -c -m 755 ${S}/tes=
t/prussdrv_test/test/pruss_uio_test ${D}${bindir}/.<br>
&nbsp;}<br>
&nbsp;<br>
-do_install_append_ti33x () {<br>
&#43;do_install:append_ti33x () {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; install -c -m 755 ${S}/tes=
t/prussdrv_test/test/pruss_uio_test ${D}${bindir}/.<br>
&nbsp;}<br>
&nbsp;<br>
-do_install_append_ti43x () {<br>
&#43;do_install:append_ti43x () {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; install -c -m 755 ${S}/tes=
t/prussdrv_test/test/pruss_uio_test ${D}${bindir}/.<br>
&nbsp;}<br>
diff --git a/recipes-bsp/uio-module-drv/uio-module-drv_git.bb b/recipes-bsp=
/uio-module-drv/uio-module-drv_git.bb<br>
index cb61305f..2bb1f0b3 100644<br>
--- a/recipes-bsp/uio-module-drv/uio-module-drv_git.bb<br>
&#43;&#43;&#43; b/recipes-bsp/uio-module-drv/uio-module-drv_git.bb<br>
@@ -2,19 &#43;2,19 @@ DESCRIPTION =3D &quot;User space IO (UIO) driver for =
on-chip modules&quot;<br>
&nbsp;<br>
&nbsp;include uio-module-drv.inc<br>
&nbsp;<br>
-FILESEXTRAPATHS_prepend:=3D &quot;${THISDIR}/${PN}:&quot;<br>
&#43;FILESEXTRAPATHS:prepend:=3D &quot;${THISDIR}/${PN}:&quot;<br>
&nbsp;<br>
&nbsp;SRC_URI &#43;=3D &quot;<a href=3D"file://0001-uio-module-drv-Replace-=
ioremap_nocache-with-ioremap.patch">file://0001-uio-module-drv-Replace-iore=
map_nocache-with-ioremap.patch</a>&quot;<br>
&nbsp;<br>
&nbsp;# This package builds a kernel module, use kernel PR as base and appe=
nd a local<br>
-MACHINE_KERNEL_PR_append =3D &quot;d&quot;<br>
&#43;MACHINE_KERNEL_PR:append =3D &quot;d&quot;<br>
&nbsp;PR =3D &quot;${MACHINE_KERNEL_PR}&quot;<br>
&nbsp;<br>
&nbsp;module_auto_load_uio-module-drv =3D &quot;uio-module-drv&quot;<br>
&nbsp;<br>
&nbsp;inherit module<br>
&nbsp;<br>
-do_install_append () {<br>
&#43;do_install:append () {<br>
&nbsp;&nbsp;&nbsp;&nbsp; install -d ${D}${includedir}<br>
&nbsp;&nbsp;&nbsp;&nbsp; cp *.h ${D}${includedir}<br>
&nbsp;}<br>
diff --git a/recipes-bsp/usb-lld/usb-lld-rtos_git.bb b/recipes-bsp/usb-lld/=
usb-lld-rtos_git.bb<br>
index 7aa0d1b9..69f91385 100644<br>
--- a/recipes-bsp/usb-lld/usb-lld-rtos_git.bb<br>
&#43;&#43;&#43; b/recipes-bsp/usb-lld/usb-lld-rtos_git.bb<br>
@@ -14,10 &#43;14,10 @@ PACKAGE_ARCH =3D &quot;${MACHINE_ARCH}&quot;<br>
&nbsp;<br>
&nbsp;PR =3D &quot;r0&quot;<br>
&nbsp;<br>
-DEPENDS_append =3D &quot; osal-rtos&quot;<br>
-DEPENDS_append_ti33x =3D &quot; starterware-rtos&quot;<br>
-DEPENDS_append_ti43x =3D &quot; starterware-rtos&quot;<br>
-DEPENDS_append_k3 =3D &quot; sciclient-rtos&quot;<br>
&#43;DEPENDS:append =3D &quot; osal-rtos&quot;<br>
&#43;DEPENDS:append_ti33x =3D &quot; starterware-rtos&quot;<br>
&#43;DEPENDS:append_ti43x =3D &quot; starterware-rtos&quot;<br>
&#43;DEPENDS:append_k3 =3D &quot; sciclient-rtos&quot;<br>
&nbsp;<br>
&nbsp;# Build with make instead of XDC<br>
&nbsp;TI_PDK_XDCMAKE =3D &quot;0&quot;<br>
diff --git a/recipes-bsp/vis-fw/vis_01.50.07.15.bb b/recipes-bsp/vis-fw/vis=
_01.50.07.15.bb<br>
index 3cd56489..498be36b 100644<br>
--- a/recipes-bsp/vis-fw/vis_01.50.07.15.bb<br>
&#43;&#43;&#43; b/recipes-bsp/vis-fw/vis_01.50.07.15.bb<br>
@@ -25,12 &#43;25,12 @@ do_install() {<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;PACKAGES &#43;=3D &quot;${PN}-fw&quot;<br>
-RDEPENDS_${PN} &#43;=3D &quot;${PN}-fw&quot;<br>
&#43;RDEPENDS:${PN} &#43;=3D &quot;${PN}-fw&quot;<br>
&nbsp;<br>
-FILES_${PN}-fw &#43;=3D &quot;${base_libdir}/firmware/${DSPAPP}&quot;<br>
&#43;FILES:${PN}-fw &#43;=3D &quot;${base_libdir}/firmware/${DSPAPP}&quot;<=
br>
&nbsp;<br>
-INSANE_SKIP_${PN} =3D &quot;ldflags&quot;<br>
-INSANE_SKIP_${PN}-fw =3D &quot;arch&quot;<br>
&#43;INSANE_SKIP:${PN} =3D &quot;ldflags&quot;<br>
&#43;INSANE_SKIP:${PN}-fw =3D &quot;arch&quot;<br>
&nbsp;INHIBIT_PACKAGE_DEBUG_SPLIT =3D &quot;1&quot;<br>
&nbsp;INHIBIT_PACKAGE_STRIP =3D &quot;1&quot;<br>
&nbsp;INHIBIT_SYSROOT_STRIP =3D &quot;1&quot;<br>
diff --git a/recipes-bsp/vpdma-fw/vpdma-fw_03-2012.bb b/recipes-bsp/vpdma-f=
w/vpdma-fw_03-2012.bb<br>
index 4707f179..c7b2a7bb 100644<br>
--- a/recipes-bsp/vpdma-fw/vpdma-fw_03-2012.bb<br>
&#43;&#43;&#43; b/recipes-bsp/vpdma-fw/vpdma-fw_03-2012.bb<br>
@@ -20,6 &#43;20,6 @@ do_install() {<br>
&nbsp;&nbsp;&nbsp;&nbsp; cp ${S}/${TARGET} ${D}${base_libdir}/firmware/${TA=
RGET}<br>
&nbsp;}<br>
&nbsp;<br>
-FILES_${PN} &#43;=3D &quot;${base_libdir}/firmware/${TARGET}&quot;<br>
&#43;FILES:${PN} &#43;=3D &quot;${base_libdir}/firmware/${TARGET}&quot;<br>
&nbsp;<br>
&nbsp;PR =3D &quot;r1&quot;<br>
diff --git a/recipes-bsp/vps-lld/vps-lld-rtos_git.bb b/recipes-bsp/vps-lld/=
vps-lld-rtos_git.bb<br>
index e2834a63..7e0695ab 100644<br>
--- a/recipes-bsp/vps-lld/vps-lld-rtos_git.bb<br>
&#43;&#43;&#43; b/recipes-bsp/vps-lld/vps-lld-rtos_git.bb<br>
@@ -26,7 &#43;26,7 @@ PR =3D &quot;r0&quot;<br>
&nbsp;S =3D &quot;${WORKDIR}/${VPS_LLD_GIT_DESTSUFFIX}&quot;<br>
&nbsp;<br>
&nbsp;# Add to DEPENDS set in ti-pdk.bbclass<br>
-DEPENDS_append =3D &quot; \<br>
&#43;DEPENDS:append =3D &quot; \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ti=
-sysbios \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; os=
al-rtos \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ed=
ma3-lld-rtos \<br>
@@ -44,7 &#43;44,7 @@ TI_PDK_XDCMAKE =3D &quot;0&quot;<br>
&nbsp;# The makefile will push these on the XDCPATH<br>
&nbsp;export EDMA3LLD_BIOS6_INSTALLDIR =3D &quot;${EDMA3_LLD_INSTALL_DIR}&q=
uot;<br>
&nbsp;<br>
-do_compile_append() {<br>
&#43;do_compile:append() {<br>
&nbsp;&nbsp;&nbsp;&nbsp; # Delete archive created by XDC release command si=
nce it does not contain all content<br>
&nbsp;&nbsp;&nbsp;&nbsp; find -name &quot;*.tar&quot; -exec rm -f {} \;<br>
&nbsp;<br>
@@ -53,4 &#43;53,4 @@ do_compile_append() {<br>
&nbsp;&nbsp;&nbsp;&nbsp; tar -cf pm_lld.tar --exclude=3D'*.tar' ./*<br>
&nbsp;}<br>
&nbsp;<br>
-INSANE_SKIP_${PN} =3D &quot;arch ldflags&quot;<br>
&#43;INSANE_SKIP:${PN} =3D &quot;arch ldflags&quot;<br>
diff --git a/recipes-bsp/wl18xx-fw/wl18xx-fw_8.9.0.0.86.bb b/recipes-bsp/wl=
18xx-fw/wl18xx-fw_8.9.0.0.86.bb<br>
index 50b6c297..48b500a8 100644<br>
--- a/recipes-bsp/wl18xx-fw/wl18xx-fw_8.9.0.0.86.bb<br>
&#43;&#43;&#43; b/recipes-bsp/wl18xx-fw/wl18xx-fw_8.9.0.0.86.bb<br>
@@ -22,4 &#43;22,4 @@ do_install() {<br>
&nbsp;&nbsp;&nbsp;&nbsp; oe_runmake 'DEST_DIR=3D${D}' install<br>
&nbsp;}<br>
&nbsp;<br>
-FILES_${PN} =3D &quot;/lib/firmware/ti-connectivity/*&quot;<br>
&#43;FILES:${PN} =3D &quot;/lib/firmware/ti-connectivity/*&quot;<br>
diff --git a/recipes-bsp/x-load/x-load.inc b/recipes-bsp/x-load/x-load.inc<=
br>
index 7a9638b0..bb700e46 100644<br>
--- a/recipes-bsp/x-load/x-load.inc<br>
&#43;&#43;&#43; b/recipes-bsp/x-load/x-load.inc<br>
@@ -34,7 &#43;34,7 @@ do_install () {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ln -sf ${MLO_IMAGE} ${D}/b=
oot/${MLO_SYMLINK_NOMACHINE} <br>
&nbsp;}<br>
&nbsp;<br>
-FILES_${PN} =3D &quot;/boot&quot;<br>
&#43;FILES:${PN} =3D &quot;/boot&quot;<br>
&nbsp;<br>
&nbsp;inherit deploy<br>
&nbsp;<br>
diff --git a/recipes-bsp/x-load/x-load_1.46-psp.bb b/recipes-bsp/x-load/x-l=
oad_1.46-psp.bb<br>
index 108e408d..cc9ad3f7 100644<br>
--- a/recipes-bsp/x-load/x-load_1.46-psp.bb<br>
&#43;&#43;&#43; b/recipes-bsp/x-load/x-load_1.46-psp.bb<br>
@@ -11,7 &#43;11,7 @@ PR =3D&quot;r0&quot;<br>
&nbsp;PE =3D &quot;1&quot;<br>
&nbsp;<br>
&nbsp;# TI PSP v1.46_OMAPPSP_03.00.01.06 (Tag is one commit different)<br>
-SRCREV_pn-${PN} =3D &quot;fc6d5be15c703d21aef0ae0b8c02177721f0445f&quot;<b=
r>
&#43;SRCREV:pn-${PN} =3D &quot;fc6d5be15c703d21aef0ae0b8c02177721f0445f&quo=
t;<br>
&nbsp;SRC_URI =3D &quot;git://arago-project.org/git/projects/x-load-omap3.g=
it;protocol=3Dgit&quot;<br>
&nbsp;<br>
&nbsp;S =3D &quot;${WORKDIR}/git&quot;<br>
@@ -33,6 &#43;33,6 @@ do_install () {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ln -sf ${MLO_IMAGE} ${D}/b=
oot/${MLO_SYMLINK_NOMACHINE}<br>
&nbsp;}<br>
&nbsp;<br>
-FILES_${PN} =3D &quot;/boot&quot;<br>
&#43;FILES:${PN} =3D &quot;/boot&quot;<br>
&nbsp;<br>
&nbsp;PACKAGE_ARCH =3D &quot;${MACHINE_ARCH}&quot;<br>
diff --git a/recipes-bsp/x-load/x-load_git.bb b/recipes-bsp/x-load/x-load_g=
it.bb<br>
index 1ce1b0f0..46ccc8dd 100644<br>
--- a/recipes-bsp/x-load/x-load_git.bb<br>
&#43;&#43;&#43; b/recipes-bsp/x-load/x-load_git.bb<br>
@@ -1,12 &#43;1,12 @@<br>
&nbsp;require x-load.inc<br>
&nbsp;<br>
-#FILESPATHPKG_prepend =3D &quot;x-load-git:x-load-git/${MACHINE}&quot;<br>
&#43;#FILESPATHPKG:prepend =3D &quot;x-load-git:x-load-git/${MACHINE}&quot;=
<br>
&nbsp;<br>
&nbsp;PV =3D &quot;1.5.1&quot;<br>
&nbsp;PR =3D&quot;r3&quot;<br>
&nbsp;PE =3D &quot;1&quot;<br>
&nbsp;<br>
-SRCREV_pn-${PN} =3D &quot;c4289f1bee035dea41536c5ba5e1bc36c7d493c4&quot;<b=
r>
&#43;SRCREV:pn-${PN} =3D &quot;c4289f1bee035dea41536c5ba5e1bc36c7d493c4&quo=
t;<br>
&nbsp;SRC_URI =3D &quot;git://gitorious.org/x-loader/x-loader.git;branch=3D=
master;protocol=3Dgit \<br>
&nbsp;&quot;<br>
&nbsp;<br>
diff --git a/recipes-connectivity/wl18xx-calibrator/wl18xx-calibrator_8.7.3=
.bb b/recipes-connectivity/wl18xx-calibrator/wl18xx-calibrator_8.7.3.bb<br>
index f9a4448f..2888b95a 100644<br>
--- a/recipes-connectivity/wl18xx-calibrator/wl18xx-calibrator_8.7.3.bb<br>
&#43;&#43;&#43; b/recipes-connectivity/wl18xx-calibrator/wl18xx-calibrator_=
8.7.3.bb<br>
@@ -3,7 &#43;3,7 @@ LICENSE =3D &quot;BSD&quot;<br>
&nbsp;LIC_FILES_CHKSUM =3D &quot;<a href=3D"file://COPYING;md5=3D4725015cb0=
be7be389cf06deeae3683d">file://COPYING;md5=3D4725015cb0be7be389cf06deeae368=
3d</a>&quot;<br>
&nbsp;<br>
&nbsp;DEPENDS =3D &quot;libnl&quot;<br>
-RDEPENDS_${PN} =3D &quot;wl18xx-fw&quot;<br>
&#43;RDEPENDS:${PN} =3D &quot;wl18xx-fw&quot;<br>
&nbsp;<br>
&nbsp;#Tag: R8.7_SP3 (8.7.3)<br>
&nbsp;SRCREV =3D &quot;5048b59a444ac59ba7171d6e122d5a84581aebf2&quot;<br>
diff --git a/recipes-connectivity/wl18xx-target-scripts/wl18xx-target-scrip=
ts_8.7.3.bb b/recipes-connectivity/wl18xx-target-scripts/wl18xx-target-scri=
pts_8.7.3.bb<br>
index 6c4b2b43..2a44fa84 100644<br>
--- a/recipes-connectivity/wl18xx-target-scripts/wl18xx-target-scripts_8.7.=
3.bb<br>
&#43;&#43;&#43; b/recipes-connectivity/wl18xx-target-scripts/wl18xx-target-=
scripts_8.7.3.bb<br>
@@ -13,7 &#43;13,7 @@ PR =3D &quot;r1&quot;<br>
&nbsp;<br>
&nbsp;S =3D &quot;${WORKDIR}/git&quot;<br>
&nbsp;<br>
-FILES_${PN} &#43;=3D &quot;${datadir}/wl18xx/&quot;<br>
&#43;FILES:${PN} &#43;=3D &quot;${datadir}/wl18xx/&quot;<br>
&nbsp;<br>
&nbsp;do_install() {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; install -d ${D}${datadir}/=
wl18xx/<br>
diff --git a/recipes-connectivity/wlconf/wlconf_8.7.3.bb b/recipes-connecti=
vity/wlconf/wlconf_8.7.3.bb<br>
index 19f28b75..475bac28 100644<br>
--- a/recipes-connectivity/wlconf/wlconf_8.7.3.bb<br>
&#43;&#43;&#43; b/recipes-connectivity/wlconf/wlconf_8.7.3.bb<br>
@@ -30,10 &#43;30,10 @@ do_install() {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${D}$=
{sbindir}/wlconf/official_inis/<br>
&nbsp;}<br>
&nbsp;<br>
-FILES_${PN} &#43;=3D &quot; \<br>
&#43;FILES:${PN} &#43;=3D &quot; \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${sbindir}/wlconf \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${sbindir}/wlconf/official=
_inis \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /lib/firmware/ti-connectiv=
ity/wl18xx-conf.bin \<br>
&nbsp;&quot;<br>
&nbsp;<br>
-FILES_${PN}-dbg &#43;=3D &quot;${sbindir}/wlconf/.debug&quot;<br>
&#43;FILES:${PN}-dbg &#43;=3D &quot;${sbindir}/wlconf/.debug&quot;<br>
diff --git a/recipes-core/init-ifupdown/init-ifupdown_1.0.bbappend b/recipe=
s-core/init-ifupdown/init-ifupdown_1.0.bbappend<br>
index 56223033..461ffebe 100644<br>
--- a/recipes-core/init-ifupdown/init-ifupdown_1.0.bbappend<br>
&#43;&#43;&#43; b/recipes-core/init-ifupdown/init-ifupdown_1.0.bbappend<br>
@@ -1 &#43;1 @@<br>
-FILESEXTRAPATHS_prepend :=3D &quot;${THISDIR}/${PN}-${PV}:&quot;<br>
&#43;FILESEXTRAPATHS:prepend :=3D &quot;${THISDIR}/${PN}-${PV}:&quot;<br>
diff --git a/recipes-core/udev/eudev_%.bbappend b/recipes-core/udev/eudev_%=
.bbappend<br>
index 7c04fd23..15f95ef8 100644<br>
--- a/recipes-core/udev/eudev_%.bbappend<br>
&#43;&#43;&#43; b/recipes-core/udev/eudev_%.bbappend<br>
@@ -1,13 &#43;1,13 @@<br>
-FILESEXTRAPATHS_prepend :=3D &quot;${THISDIR}/${PN}:&quot;<br>
&#43;FILESEXTRAPATHS:prepend :=3D &quot;${THISDIR}/${PN}:&quot;<br>
&nbsp;<br>
-SRC_URI_append_ti-soc =3D &quot; \<br>
&#43;SRC_URI:append_ti-soc =3D &quot; \<br>
&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file://omap-tty.rules">file://omap-tty.=
rules</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file://firmware.rules">file://firmware.=
rules</a> \<br>
&nbsp;&quot;<br>
&nbsp;<br>
-PR_append_ti-soc =3D &quot;.3&quot;<br>
&#43;PR:append_ti-soc =3D &quot;.3&quot;<br>
&nbsp;<br>
-do_install_append_ti-soc() {<br>
&#43;do_install:append_ti-soc() {<br>
&nbsp;&nbsp;&nbsp;&nbsp; install -m 0644 ${WORKDIR}/omap-tty.rules ${D}${sy=
sconfdir}/udev/rules.d/<br>
&nbsp;&nbsp;&nbsp;&nbsp; install -m 0644 ${WORKDIR}/firmware.rules ${D}${sy=
sconfdir}/udev/rules.d/<br>
&nbsp;}<br>
diff --git a/recipes-devtools/gdbc6x/gdbc6x_git.bb b/recipes-devtools/gdbc6=
x/gdbc6x_git.bb<br>
index aa519a91..08f81970 100644<br>
--- a/recipes-devtools/gdbc6x/gdbc6x_git.bb<br>
&#43;&#43;&#43; b/recipes-devtools/gdbc6x/gdbc6x_git.bb<br>
@@ -9,7 &#43;9,7 @@ COMPATIBLE_MACHINE =3D &quot;dra7xx|keystone&quot;<br>
&nbsp;<br>
&nbsp;PR =3D &quot;${INC_PR}.1&quot;<br>
&nbsp;<br>
-SRC_URI_append =3D &quot; \<br>
&#43;SRC_URI:append =3D &quot; \<br>
&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file://init">file://init</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file://0001-libbfd.h-suppress-GCC9-Wstr=
ingop-truncation.patch;striplevel=3D2">
file://0001-libbfd.h-suppress-GCC9-Wstringop-truncation.patch;striplevel=3D=
2</a> \<br>
&nbsp;&quot;<br>
@@ -39,7 &#43;39,7 @@ do_install () {<br>
&nbsp;&nbsp;&nbsp;&nbsp; install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/=
init.d/gdbserverproxy<br>
&nbsp;}<br>
&nbsp;<br>
-RDEPENDS_${PN} =3D &quot;gdbserverproxy-module-drv bash&quot;<br>
&#43;RDEPENDS:${PN} =3D &quot;gdbserverproxy-module-drv bash&quot;<br>
&nbsp;<br>
&nbsp;include gdbc6x.inc<br>
&nbsp;<br>
diff --git a/recipes-devtools/gdbc6x/gdbserver-c6x_git.bb b/recipes-devtool=
s/gdbc6x/gdbserver-c6x_git.bb<br>
index 79b584be..4dbce012 100644<br>
--- a/recipes-devtools/gdbc6x/gdbserver-c6x_git.bb<br>
&#43;&#43;&#43; b/recipes-devtools/gdbc6x/gdbserver-c6x_git.bb<br>
@@ -37,7 &#43;37,7 @@ do_install() {<br>
&nbsp;COMPATIBLE_MACHINE =3D &quot;dra7xx|keystone&quot;<br>
&nbsp;PACKAGE_ARCH =3D &quot;${MACHINE_ARCH}&quot;<br>
&nbsp;<br>
-FILES_${PN}-dev &#43;=3D &quot;\<br>
&#43;FILES:${PN}-dev &#43;=3D &quot;\<br>
&nbsp;&nbsp;&nbsp;&nbsp; ${datadir}/ti/gdbc6x \<br>
&nbsp;&quot;<br>
&nbsp;<br>
@@ -45,6 &#43;45,6 @@ include gdbc6x.inc<br>
&nbsp;<br>
&nbsp;require recipes-ti/includes/ti-paths.inc<br>
&nbsp;<br>
-ALLOW_EMPTY_${PN} =3D &quot;1&quot;<br>
&#43;ALLOW_EMPTY:${PN} =3D &quot;1&quot;<br>
&nbsp;<br>
&nbsp;PARALLEL_MAKE =3D &quot;&quot;<br>
diff --git a/recipes-devtools/gdbc6x/gdbserverproxy-module-drv_git.bb b/rec=
ipes-devtools/gdbc6x/gdbserverproxy-module-drv_git.bb<br>
index 77a29ec8..bd3e33fd 100644<br>
--- a/recipes-devtools/gdbc6x/gdbserverproxy-module-drv_git.bb<br>
&#43;&#43;&#43; b/recipes-devtools/gdbc6x/gdbserverproxy-module-drv_git.bb<=
br>
@@ -3,9 &#43;3,9 @@ LICENSE =3D &quot;GPLv2&quot;<br>
&nbsp;LIC_FILES_CHKSUM =3D &quot;<a href=3D"file://COPYING.txt;md5=3D758599=
89545e37968a99b631ef42722e">file://COPYING.txt;md5=3D75859989545e37968a99b6=
31ef42722e</a>&quot;<br>
&nbsp;<br>
&nbsp;# This package builds a kernel module, use kernel PR as base and appe=
nd a local<br>
-MACHINE_KERNEL_PR_append =3D &quot;b&quot;<br>
&#43;MACHINE_KERNEL_PR:append =3D &quot;b&quot;<br>
&nbsp;PR =3D &quot;${MACHINE_KERNEL_PR}&quot;<br>
-PV_append =3D &quot;&#43;git${SRCPV}&quot;<br>
&#43;PV:append =3D &quot;&#43;git${SRCPV}&quot;<br>
&nbsp;<br>
&nbsp;S =3D &quot;${WORKDIR}/git/kernel_module/gdbproxy-mod&quot;<br>
&nbsp;<br>
diff --git a/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb b/recipes-g=
raphics/libgal/ti-gc320-libs_5.0.11.p7.bb<br>
index 55758682..ab72c109 100644<br>
--- a/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb<br>
&#43;&#43;&#43; b/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb<br>
@@ -16,7 &#43;16,7 @@ BRANCH =3D &quot;ti-${PV}&quot;<br>
&nbsp;SRC_URI =3D &quot;git://git.ti.com/graphics/ti-gc320-libs.git;protoco=
l=3Dgit;branch=3D${BRANCH}&quot;<br>
&nbsp;SRCREV =3D &quot;c0afab259de59909cfe74c01f3f7fbaa147f94b5&quot;<br>
&nbsp;<br>
-RRECOMMENDS_${PN} =3D &quot;ti-gc320-driver&quot;<br>
&#43;RRECOMMENDS:${PN} =3D &quot;ti-gc320-driver&quot;<br>
&nbsp;<br>
&nbsp;# There's only hardfp version available<br>
&nbsp;python __anonymous() {<br>
@@ -43,4 &#43;43,4 @@ do_install() {<br>
&nbsp;&nbsp;&nbsp;&nbsp; chown -R root:root ${D}<br>
&nbsp;}<br>
&nbsp;<br>
-INSANE_SKIP_${PN} &#43;=3D &quot;ldflags&quot;<br>
&#43;INSANE_SKIP:${PN} &#43;=3D &quot;ldflags&quot;<br>
diff --git a/recipes-graphics/libgles/ti-img-rogue-umlibs_1.13.5776728.bb b=
/recipes-graphics/libgles/ti-img-rogue-umlibs_1.13.5776728.bb<br>
index 5194015e..1ff4b65a 100644<br>
--- a/recipes-graphics/libgles/ti-img-rogue-umlibs_1.13.5776728.bb<br>
&#43;&#43;&#43; b/recipes-graphics/libgles/ti-img-rogue-umlibs_1.13.5776728=
.bb<br>
@@ -30,22 &#43;30,22 @@ inherit update-rc.d<br>
&nbsp;PROVIDES &#43;=3D &quot;virtual/egl virtual/libgles1 virtual/libgles2=
 virtual/libgbm&quot;<br>
&nbsp;<br>
&nbsp;DEPENDS &#43;=3D &quot;libdrm wayland expat&quot;<br>
-RDEPENDS_${PN} &#43;=3D &quot;bash&quot;<br>
-RDEPENDS_${PN} &#43;=3D &quot;wayland expat&quot;<br>
&#43;RDEPENDS:${PN} &#43;=3D &quot;bash&quot;<br>
&#43;RDEPENDS:${PN} &#43;=3D &quot;wayland expat&quot;<br>
&nbsp;<br>
-RPROVIDES_${PN} =3D &quot;libegl libgles1 libgles2 libgbm&quot;<br>
-RPROVIDES_${PN}-dev =3D &quot;libegl-dev libgles1-dev libgles2-dev libgbm-=
dev&quot;<br>
-RPROVIDES_${PN}-dbg =3D &quot;libegl-dbg libgles1-dbg libgles2-dbg&quot;<b=
r>
&#43;RPROVIDES:${PN} =3D &quot;libegl libgles1 libgles2 libgbm&quot;<br>
&#43;RPROVIDES:${PN}-dev =3D &quot;libegl-dev libgles1-dev libgles2-dev lib=
gbm-dev&quot;<br>
&#43;RPROVIDES:${PN}-dbg =3D &quot;libegl-dbg libgles1-dbg libgles2-dbg&quo=
t;<br>
&nbsp;<br>
-RREPLACES_${PN} =3D &quot;libegl libgles1 liblges2 libgbm&quot;<br>
-RREPLACES_${PN}-dev =3D &quot;libegl-dev libgles1-dev libgles2-dev libgbm-=
dev&quot;<br>
-RREPLACES_${PN}-dbg =3D &quot;libegl-dbg libgles1-dbg libgles2-dbg&quot;<b=
r>
&#43;RREPLACES:${PN} =3D &quot;libegl libgles1 liblges2 libgbm&quot;<br>
&#43;RREPLACES:${PN}-dev =3D &quot;libegl-dev libgles1-dev libgles2-dev lib=
gbm-dev&quot;<br>
&#43;RREPLACES:${PN}-dbg =3D &quot;libegl-dbg libgles1-dbg libgles2-dbg&quo=
t;<br>
&nbsp;<br>
-RCONFLICTS_${PN} =3D &quot;libegl libgles1 libgles2 libgbm&quot;<br>
-RCONFLICTS_${PN}-dev =3D &quot;libegl-dev libgles1-dev libgles2-dev libgbm=
-dev&quot;<br>
-RCONFLICTS_${PN}-dbg =3D &quot;libegl-dbg libgles1-dbg libgles2-dbg&quot;<=
br>
&#43;RCONFLICTS:${PN} =3D &quot;libegl libgles1 libgles2 libgbm&quot;<br>
&#43;RCONFLICTS:${PN}-dev =3D &quot;libegl-dev libgles1-dev libgles2-dev li=
bgbm-dev&quot;<br>
&#43;RCONFLICTS:${PN}-dbg =3D &quot;libegl-dbg libgles1-dbg libgles2-dbg&qu=
ot;<br>
&nbsp;<br>
-RRECOMMENDS_${PN} &#43;=3D &quot;ti-img-rogue-driver&quot;<br>
&#43;RRECOMMENDS:${PN} &#43;=3D &quot;ti-img-rogue-driver&quot;<br>
&nbsp;<br>
&nbsp;S =3D &quot;${WORKDIR}/git&quot;<br>
&nbsp;<br>
@@ -54,16 &#43;54,16 @@ do_install () {<br>
&nbsp;&nbsp;&nbsp;&nbsp; chown -R root:root ${D}<br>
&nbsp;}<br>
&nbsp;<br>
-FILES_${PN} &#43;=3D &quot; ${base_libdir}/firmware/&quot;<br>
-FILES_${PN} &#43;=3D &quot; ${datadir}/&quot;<br>
&#43;FILES:${PN} &#43;=3D &quot; ${base_libdir}/firmware/&quot;<br>
&#43;FILES:${PN} &#43;=3D &quot; ${datadir}/&quot;<br>
&nbsp;<br>
&nbsp;PACKAGES =3D&#43; &quot;${PN}-plugins&quot;<br>
-FILES_${PN}-plugins =3D &quot;${libdir}/libGLESv2.so ${libdir}/libGLESv1_C=
M.so ${libdir}/libEGL.so ${libdir}/dri/pvr_dri.so&quot;<br>
-RDEPENDS_${PN} &#43;=3D &quot;${PN}-plugins&quot;<br>
&#43;FILES:${PN}-plugins =3D &quot;${libdir}/libGLESv2.so ${libdir}/libGLES=
v1_CM.so ${libdir}/libEGL.so ${libdir}/dri/pvr_dri.so&quot;<br>
&#43;RDEPENDS:${PN} &#43;=3D &quot;${PN}-plugins&quot;<br>
&nbsp;<br>
-ALLOW_EMPTY_${PN}-plugins =3D &quot;1&quot;<br>
&#43;ALLOW_EMPTY:${PN}-plugins =3D &quot;1&quot;<br>
&nbsp;<br>
-INSANE_SKIP_${PN} &#43;=3D &quot;ldflags arch already-stripped&quot;<br>
-INSANE_SKIP_${PN}-plugins =3D &quot;dev-so&quot;<br>
&#43;INSANE_SKIP:${PN} &#43;=3D &quot;ldflags arch already-stripped&quot;<b=
r>
&#43;INSANE_SKIP:${PN}-plugins =3D &quot;dev-so&quot;<br>
&nbsp;<br>
&nbsp;CLEANBROKEN =3D &quot;1&quot;<br>
diff --git a/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb b/recip=
es-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb<br>
index 627d128f..4cbdd07a 100644<br>
--- a/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb<br>
&#43;&#43;&#43; b/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb<br=
>
@@ -32,24 &#43;32,24 @@ inherit update-rc.d<br>
&nbsp;PROVIDES &#43;=3D &quot;virtual/egl virtual/libgles1 virtual/libgles2=
 virtual/libgbm&quot;<br>
&nbsp;<br>
&nbsp;DEPENDS &#43;=3D &quot;libdrm udev wayland wayland-protocols libffi e=
xpat&quot;<br>
-RDEPENDS_${PN} &#43;=3D &quot;libdrm libdrm-omap udev wayland wayland-prot=
ocols libffi expat&quot;<br>
&#43;RDEPENDS:${PN} &#43;=3D &quot;libdrm libdrm-omap udev wayland wayland-=
protocols libffi expat&quot;<br>
&nbsp;<br>
-RPROVIDES_${PN} =3D &quot;libegl libgles1 libgles2 libgbm&quot;<br>
-RPROVIDES_${PN}-dev =3D &quot;libegl-dev libgles1-dev libgles2-dev libgbm-=
dev&quot;<br>
-RPROVIDES_${PN}-dbg =3D &quot;libegl-dbg libgles1-dbg libgles2-dbg libgbm-=
dbg&quot;<br>
&#43;RPROVIDES:${PN} =3D &quot;libegl libgles1 libgles2 libgbm&quot;<br>
&#43;RPROVIDES:${PN}-dev =3D &quot;libegl-dev libgles1-dev libgles2-dev lib=
gbm-dev&quot;<br>
&#43;RPROVIDES:${PN}-dbg =3D &quot;libegl-dbg libgles1-dbg libgles2-dbg lib=
gbm-dbg&quot;<br>
&nbsp;<br>
-RREPLACES_${PN} =3D &quot;libegl libgles1 libgles2 libgbm&quot;<br>
-RREPLACES_${PN}-dev =3D &quot;libegl-dev libgles1-dev libgles2-dev libgbm-=
dev&quot;<br>
-RREPLACES_${PN}-dbg =3D &quot;libegl-dbg libgles1-dbg libgles2-dbg libgbm-=
dbg&quot;<br>
&#43;RREPLACES:${PN} =3D &quot;libegl libgles1 libgles2 libgbm&quot;<br>
&#43;RREPLACES:${PN}-dev =3D &quot;libegl-dev libgles1-dev libgles2-dev lib=
gbm-dev&quot;<br>
&#43;RREPLACES:${PN}-dbg =3D &quot;libegl-dbg libgles1-dbg libgles2-dbg lib=
gbm-dbg&quot;<br>
&nbsp;<br>
-RCONFLICTS_${PN} =3D &quot;libegl libgles1 libgles2 libgbm&quot;<br>
-RCONFLICTS_${PN}-dev =3D &quot;libegl-dev libgles1-dev libgles2-dev libgbm=
-dev&quot;<br>
-RCONFLICTS_${PN}-dbg =3D &quot;libegl-dbg libgles1-dbg libgles2-dbg libgbm=
-dbg&quot;<br>
&#43;RCONFLICTS:${PN} =3D &quot;libegl libgles1 libgles2 libgbm&quot;<br>
&#43;RCONFLICTS:${PN}-dev =3D &quot;libegl-dev libgles1-dev libgles2-dev li=
bgbm-dev&quot;<br>
&#43;RCONFLICTS:${PN}-dbg =3D &quot;libegl-dbg libgles1-dbg libgles2-dbg li=
bgbm-dbg&quot;<br>
&nbsp;<br>
&nbsp;# The actual SONAME is libGLESv2.so.2, so need to explicitly specify =
RPROVIDES for .so.1 here<br>
-RPROVIDES_${PN} &#43;=3D &quot;libGLESv2.so.1&quot;<br>
&#43;RPROVIDES:${PN} &#43;=3D &quot;libGLESv2.so.1&quot;<br>
&nbsp;<br>
-RRECOMMENDS_${PN} &#43;=3D &quot;ti-sgx-ddk-km&quot;<br>
&#43;RRECOMMENDS:${PN} &#43;=3D &quot;ti-sgx-ddk-km&quot;<br>
&nbsp;<br>
&nbsp;S =3D &quot;${WORKDIR}/git&quot;<br>
&nbsp;<br>
@@ -60,12 &#43;60,12 @@ do_install () {<br>
&nbsp;&nbsp;&nbsp;&nbsp; chown -R root:root ${D}<br>
&nbsp;}<br>
&nbsp;<br>
-FILES_${PN} =3D&nbsp; &quot;${bindir}/*&quot;<br>
-FILES_${PN} &#43;=3D &quot; ${libdir}/*&quot;<br>
-FILES_${PN} &#43;=3D&nbsp; &quot;${includedir}/*&quot;<br>
-FILES_${PN} &#43;=3D&nbsp; &quot;${sysconfdir}/*&quot;<br>
&#43;FILES:${PN} =3D&nbsp; &quot;${bindir}/*&quot;<br>
&#43;FILES:${PN} &#43;=3D &quot; ${libdir}/*&quot;<br>
&#43;FILES:${PN} &#43;=3D&nbsp; &quot;${includedir}/*&quot;<br>
&#43;FILES:${PN} &#43;=3D&nbsp; &quot;${sysconfdir}/*&quot;<br>
&nbsp;<br>
-INSANE_SKIP_${PN} &#43;=3D &quot;dev-so ldflags useless-rpaths&quot;<br>
-INSANE_SKIP_${PN} &#43;=3D &quot;already-stripped dev-deps&quot;<br>
&#43;INSANE_SKIP:${PN} &#43;=3D &quot;dev-so ldflags useless-rpaths&quot;<b=
r>
&#43;INSANE_SKIP:${PN} &#43;=3D &quot;already-stripped dev-deps&quot;<br>
&nbsp;<br>
&nbsp;CLEANBROKEN =3D &quot;1&quot;<br>
diff --git a/recipes-kernel/kselftests/kselftests_4.10.bb b/recipes-kernel/=
kselftests/kselftests_4.10.bb<br>
index f478e56d..5cd72f96 100644<br>
--- a/recipes-kernel/kselftests/kselftests_4.10.bb<br>
&#43;&#43;&#43; b/recipes-kernel/kselftests/kselftests_4.10.bb<br>
@@ -80,42 &#43;80,42 @@ PACKAGE_BEFORE_PN =3D &quot; \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${PN}-zram \<br>
&nbsp;&quot;<br>
&nbsp;<br>
-FILES_${PN}-bpf =3D &quot;${bindir}/kselftests/bpf&quot;<br>
-FILES_${PN}-breakpoints =3D &quot;${bindir}/kselftests/breakpoints&quot;<b=
r>
-FILES_${PN}-capabilities =3D &quot;${bindir}/kselftests/capabilities&quot;=
<br>
-FILES_${PN}-cpu-hotplug =3D &quot;${bindir}/kselftests/cpu-hotplug&quot;<b=
r>
-FILES_${PN}-efivarfs =3D &quot;${bindir}/kselftests/efivarfs&quot;<br>
-FILES_${PN}-exec =3D &quot;${bindir}/kselftests/exec&quot;<br>
-FILES_${PN}-firmware =3D &quot;${bindir}/kselftests/firmware&quot;<br>
-FILES_${PN}-ftrace =3D &quot;${bindir}/kselftests/ftrace&quot;<br>
-FILES_${PN}-futex =3D &quot;${bindir}/kselftests/futex&quot;<br>
-FILES_${PN}-gpio =3D &quot;${bindir}/kselftests/gpio&quot;<br>
-FILES_${PN}-ipc =3D &quot;${bindir}/kselftests/ipc&quot;<br>
-FILES_${PN}-kcmp =3D &quot;${bindir}/kselftests/kcmp&quot;<br>
-FILES_${PN}-lib =3D &quot;${bindir}/kselftests/lib&quot;<br>
-FILES_${PN}-membarrier =3D &quot;${bindir}/kselftests/membarrier&quot;<br>
-FILES_${PN}-memfd =3D &quot;${bindir}/kselftests/memfd&quot;<br>
-FILES_${PN}-memory-hotplug =3D &quot;${bindir}/kselftests/memory-hotplug&q=
uot;<br>
-FILES_${PN}-mount =3D &quot;${bindir}/kselftests/mount&quot;<br>
-FILES_${PN}-mqueue =3D &quot;${bindir}/kselftests/mqueue&quot;<br>
-FILES_${PN}-net =3D &quot;${bindir}/kselftests/net&quot;<br>
-FILES_${PN}-nsfs =3D &quot;${bindir}/kselftests/nsfs&quot;<br>
-FILES_${PN}-powerpc =3D &quot;${bindir}/kselftests/powerpc&quot;<br>
-FILES_${PN}-pstore =3D &quot;${bindir}/kselftests/pstore&quot;<br>
-FILES_${PN}-ptp =3D &quot;${bindir}/kselftests/ptp&quot;<br>
-FILES_${PN}-ptrace =3D &quot;${bindir}/kselftests/ptrace&quot;<br>
-FILES_${PN}-seccomp =3D &quot;${bindir}/kselftests/seccomp&quot;<br>
-FILES_${PN}-sigaltstack =3D &quot;${bindir}/kselftests/sigaltstack&quot;<b=
r>
-FILES_${PN}-size =3D &quot;${bindir}/kselftests/size&quot;<br>
-FILES_${PN}-static-keys =3D &quot;${bindir}/kselftests/static_keys&quot;<b=
r>
-FILES_${PN}-sync =3D &quot;${bindir}/kselftests/sync&quot;<br>
-FILES_${PN}-sysctl =3D &quot;${bindir}/kselftests/sysctl&quot;<br>
-FILES_${PN}-timers =3D &quot;${bindir}/kselftests/timers&quot;<br>
-FILES_${PN}-user =3D &quot;${bindir}/kselftests/user&quot;<br>
-FILES_${PN}-vm =3D &quot;${bindir}/kselftests/vm&quot;<br>
-FILES_${PN}-x86 =3D &quot;${bindir}/kselftests/x86&quot;<br>
-FILES_${PN}-zram =3D &quot;${bindir}/kselftests/zram&quot;<br>
-FILES_${PN}-dbg &#43;=3D &quot;${bindir}/kselftests/*/.debug&quot;<br>
&#43;FILES:${PN}-bpf =3D &quot;${bindir}/kselftests/bpf&quot;<br>
&#43;FILES:${PN}-breakpoints =3D &quot;${bindir}/kselftests/breakpoints&quo=
t;<br>
&#43;FILES:${PN}-capabilities =3D &quot;${bindir}/kselftests/capabilities&q=
uot;<br>
&#43;FILES:${PN}-cpu-hotplug =3D &quot;${bindir}/kselftests/cpu-hotplug&quo=
t;<br>
&#43;FILES:${PN}-efivarfs =3D &quot;${bindir}/kselftests/efivarfs&quot;<br>
&#43;FILES:${PN}-exec =3D &quot;${bindir}/kselftests/exec&quot;<br>
&#43;FILES:${PN}-firmware =3D &quot;${bindir}/kselftests/firmware&quot;<br>
&#43;FILES:${PN}-ftrace =3D &quot;${bindir}/kselftests/ftrace&quot;<br>
&#43;FILES:${PN}-futex =3D &quot;${bindir}/kselftests/futex&quot;<br>
&#43;FILES:${PN}-gpio =3D &quot;${bindir}/kselftests/gpio&quot;<br>
&#43;FILES:${PN}-ipc =3D &quot;${bindir}/kselftests/ipc&quot;<br>
&#43;FILES:${PN}-kcmp =3D &quot;${bindir}/kselftests/kcmp&quot;<br>
&#43;FILES:${PN}-lib =3D &quot;${bindir}/kselftests/lib&quot;<br>
&#43;FILES:${PN}-membarrier =3D &quot;${bindir}/kselftests/membarrier&quot;=
<br>
&#43;FILES:${PN}-memfd =3D &quot;${bindir}/kselftests/memfd&quot;<br>
&#43;FILES:${PN}-memory-hotplug =3D &quot;${bindir}/kselftests/memory-hotpl=
ug&quot;<br>
&#43;FILES:${PN}-mount =3D &quot;${bindir}/kselftests/mount&quot;<br>
&#43;FILES:${PN}-mqueue =3D &quot;${bindir}/kselftests/mqueue&quot;<br>
&#43;FILES:${PN}-net =3D &quot;${bindir}/kselftests/net&quot;<br>
&#43;FILES:${PN}-nsfs =3D &quot;${bindir}/kselftests/nsfs&quot;<br>
&#43;FILES:${PN}-powerpc =3D &quot;${bindir}/kselftests/powerpc&quot;<br>
&#43;FILES:${PN}-pstore =3D &quot;${bindir}/kselftests/pstore&quot;<br>
&#43;FILES:${PN}-ptp =3D &quot;${bindir}/kselftests/ptp&quot;<br>
&#43;FILES:${PN}-ptrace =3D &quot;${bindir}/kselftests/ptrace&quot;<br>
&#43;FILES:${PN}-seccomp =3D &quot;${bindir}/kselftests/seccomp&quot;<br>
&#43;FILES:${PN}-sigaltstack =3D &quot;${bindir}/kselftests/sigaltstack&quo=
t;<br>
&#43;FILES:${PN}-size =3D &quot;${bindir}/kselftests/size&quot;<br>
&#43;FILES:${PN}-static-keys =3D &quot;${bindir}/kselftests/static_keys&quo=
t;<br>
&#43;FILES:${PN}-sync =3D &quot;${bindir}/kselftests/sync&quot;<br>
&#43;FILES:${PN}-sysctl =3D &quot;${bindir}/kselftests/sysctl&quot;<br>
&#43;FILES:${PN}-timers =3D &quot;${bindir}/kselftests/timers&quot;<br>
&#43;FILES:${PN}-user =3D &quot;${bindir}/kselftests/user&quot;<br>
&#43;FILES:${PN}-vm =3D &quot;${bindir}/kselftests/vm&quot;<br>
&#43;FILES:${PN}-x86 =3D &quot;${bindir}/kselftests/x86&quot;<br>
&#43;FILES:${PN}-zram =3D &quot;${bindir}/kselftests/zram&quot;<br>
&#43;FILES:${PN}-dbg &#43;=3D &quot;${bindir}/kselftests/*/.debug&quot;<br>
&nbsp;<br>
&nbsp;# FIXME bpf target is failing to build and need to be fixed:<br>
&nbsp;# In file included from test_verifier.c:23:0:<br>
@@ -123,24 &#43;123,24 @@ FILES_${PN}-dbg &#43;=3D &quot;${bindir}/kselftes=
ts/*/.debug&quot;<br>
&nbsp;#&nbsp;&nbsp; struct pt_regs regs;<br>
&nbsp;#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ^~~~<br>
&nbsp;# make[1]: *** [test_verifier] Error 1<br>
-ALLOW_EMPTY_${PN}-bpf =3D &quot;1&quot;<br>
&#43;ALLOW_EMPTY:${PN}-bpf =3D &quot;1&quot;<br>
&nbsp;<br>
&nbsp;# gcc 7.x fails to build seccomp<br>
-ALLOW_EMPTY_${PN}-seccomp =3D &quot;1&quot;<br>
&#43;ALLOW_EMPTY:${PN}-seccomp =3D &quot;1&quot;<br>
&nbsp;<br>
&nbsp;# FIXME net target builds most of the binaries, but reuseport_bpf_num=
a depends on libnuma,<br>
&nbsp;# which is not availbale on ARM, failing entire test case<br>
-ALLOW_EMPTY_${PN}-net =3D &quot;1&quot;<br>
-<br>
-RDEPENDS_${PN}-cpu-hotplug &#43;=3D &quot;bash&quot;<br>
-RDEPENDS_${PN}-efivarfs &#43;=3D &quot;bash&quot;<br>
-RDEPENDS_${PN}-futex &#43;=3D &quot;bash ncurses&quot;<br>
-RDEPENDS_${PN}-gpio &#43;=3D &quot;bash&quot;<br>
-RDEPENDS_${PN}-memory-hotplug &#43;=3D &quot;bash&quot;<br>
-RDEPENDS_${PN}-net &#43;=3D &quot;bash&quot;<br>
-RDEPENDS_${PN}-vm &#43;=3D &quot;bash sudo&quot;<br>
-RDEPENDS_${PN}-zram &#43;=3D &quot;bash bc&quot;<br>
-RDEPENDS_${PN} &#43;=3D &quot;bash \<br>
&#43;ALLOW_EMPTY:${PN}-net =3D &quot;1&quot;<br>
&#43;<br>
&#43;RDEPENDS:${PN}-cpu-hotplug &#43;=3D &quot;bash&quot;<br>
&#43;RDEPENDS:${PN}-efivarfs &#43;=3D &quot;bash&quot;<br>
&#43;RDEPENDS:${PN}-futex &#43;=3D &quot;bash ncurses&quot;<br>
&#43;RDEPENDS:${PN}-gpio &#43;=3D &quot;bash&quot;<br>
&#43;RDEPENDS:${PN}-memory-hotplug &#43;=3D &quot;bash&quot;<br>
&#43;RDEPENDS:${PN}-net &#43;=3D &quot;bash&quot;<br>
&#43;RDEPENDS:${PN}-vm &#43;=3D &quot;bash sudo&quot;<br>
&#43;RDEPENDS:${PN}-zram &#43;=3D &quot;bash bc&quot;<br>
&#43;RDEPENDS:${PN} &#43;=3D &quot;bash \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${PN}-bpf \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${PN}-capabilities \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${PN}-cpu-hotplug \<br>
@@ -174,17 &#43;174,17 @@ RDEPENDS_${PN} &#43;=3D &quot;bash \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${PN}-zram \<br>
&nbsp;&quot;<br>
&nbsp;<br>
-RDEPENDS_${PN}_append_aarch64 =3D &quot; ${PN}-breakpoints ${PN}-ipc&quot;=
<br>
-RDEPENDS_${PN}_append_x86 =3D &quot; ${PN}-breakpoints ${PN}-ipc ${PN}-x86=
&quot;<br>
-RDEPENDS_${PN}_append_x86-64 =3D &quot; ${PN}-breakpoints ${PN}-ipc ${PN}-=
x86&quot;<br>
-RDEPENDS_${PN}_append_powerpc =3D &quot; ${PN}-powerpc&quot;<br>
-RDEPENDS_${PN}_append_powerpc64 =3D &quot; ${PN}-powerpc&quot;<br>
&#43;RDEPENDS:${PN}:append:aarch64 =3D &quot; ${PN}-breakpoints ${PN}-ipc&q=
uot;<br>
&#43;RDEPENDS:${PN}:append:x86 =3D &quot; ${PN}-breakpoints ${PN}-ipc ${PN}=
-x86&quot;<br>
&#43;RDEPENDS:${PN}:append:x86-64 =3D &quot; ${PN}-breakpoints ${PN}-ipc ${=
PN}-x86&quot;<br>
&#43;RDEPENDS:${PN}:append:powerpc =3D &quot; ${PN}-powerpc&quot;<br>
&#43;RDEPENDS:${PN}:append:powerpc64 =3D &quot; ${PN}-powerpc&quot;<br>
&nbsp;<br>
-INSANE_SKIP_${PN} =3D &quot;already-stripped&quot;<br>
-INSANE_SKIP_${PN}-exec =3D &quot;ldflags&quot;<br>
-INSANE_SKIP_${PN}-ipc =3D &quot;ldflags&quot;<br>
-INSANE_SKIP_${PN}-mount =3D &quot;ldflags&quot;<br>
-INSANE_SKIP_${PN}-vm =3D &quot;ldflags&quot;<br>
&#43;INSANE_SKIP:${PN} =3D &quot;already-stripped&quot;<br>
&#43;INSANE_SKIP:${PN}-exec =3D &quot;ldflags&quot;<br>
&#43;INSANE_SKIP:${PN}-ipc =3D &quot;ldflags&quot;<br>
&#43;INSANE_SKIP:${PN}-mount =3D &quot;ldflags&quot;<br>
&#43;INSANE_SKIP:${PN}-vm =3D &quot;ldflags&quot;<br>
&nbsp;<br>
-COMPATIBLE_MACHINE_riscv64 =3D &quot;(null)&quot;<br>
-COMPATIBLE_MACHINE_riscv32 =3D &quot;(null)&quot;<br>
&#43;COMPATIBLE_MACHINE:riscv64 =3D &quot;(null)&quot;<br>
&#43;COMPATIBLE_MACHINE:riscv32 =3D &quot;(null)&quot;<br>
diff --git a/recipes-kernel/linux/bundle-devicetree.inc b/recipes-kernel/li=
nux/bundle-devicetree.inc<br>
index 4d450374..d259e58c 100644<br>
--- a/recipes-kernel/linux/bundle-devicetree.inc<br>
&#43;&#43;&#43; b/recipes-kernel/linux/bundle-devicetree.inc<br>
@@ -2,7 &#43;2,7 @@<br>
&nbsp;# zImage. The factory u-boot on lego-ev3 EEPROM only supports uImage,=
 so we<br>
&nbsp;# append the DTB to the final uImage here.<br>
&nbsp;<br>
-do_deploy_append() {<br>
&#43;do_deploy:append() {<br>
&nbsp;&nbsp;&nbsp;&nbsp; if [ &quot;${KERNEL_DEVICETREE_BUNDLE}&quot; =3D &=
quot;1&quot; ]; then<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; install -d ${DEPLOYDIR}<br=
>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for dtbf in ${KERNEL_DEVIC=
ETREE}; do<br>
diff --git a/recipes-kernel/linux/kernel-rdepends.inc b/recipes-kernel/linu=
x/kernel-rdepends.inc<br>
index 743b352c..193afe48 100644<br>
--- a/recipes-kernel/linux/kernel-rdepends.inc<br>
&#43;&#43;&#43; b/recipes-kernel/linux/kernel-rdepends.inc<br>
@@ -1,41 &#43;1,41 @@<br>
&nbsp;# Pull in the devicetree files into the rootfs<br>
-RDEPENDS_${KERNEL_PACKAGE_NAME}-base &#43;=3D &quot;kernel-devicetree&quot=
;<br>
&#43;RDEPENDS:${KERNEL_PACKAGE_NAME}-base &#43;=3D &quot;kernel-devicetree&=
quot;<br>
&nbsp;<br>
&nbsp;# Add run-time dependency for PM firmware to the rootfs<br>
-RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_ti33x =3D &quot; amx3-cm3&quot=
;<br>
-RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_ti43x =3D &quot; amx3-cm3&quot=
;<br>
&#43;RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append_ti33x =3D &quot; amx3-cm3&=
quot;<br>
&#43;RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append_ti43x =3D &quot; amx3-cm3&=
quot;<br>
&nbsp;<br>
&nbsp;# Add run-time dependency for VPE VPDMA firmware to the rootfs<br>
-RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_dra7xx =3D &quot; vpdma-fw&quo=
t;<br>
&#43;RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append_dra7xx =3D &quot; vpdma-fw=
&quot;<br>
&nbsp;<br>
&nbsp;# Add run-time dependency for Goodix firmware to the rootfs<br>
-RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_dra7xx =3D &quot; goodix-fw&qu=
ot;<br>
&#43;RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append_dra7xx =3D &quot; goodix-f=
w&quot;<br>
&nbsp;<br>
&nbsp;# Install boot-monitor skern file into /boot dir of rootfs<br>
-RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_keystone =3D &quot; boot-monit=
or&quot;<br>
&#43;RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append_keystone =3D &quot; boot-m=
onitor&quot;<br>
&nbsp;<br>
&nbsp;# Install ti-sci-fw into /boot dir of rootfs<br>
-RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_k2g =3D &quot; ti-sci-fw&quot;=
<br>
&#43;RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append_k2g =3D &quot; ti-sci-fw&q=
uot;<br>
&nbsp;<br>
&nbsp;# Add run-time dependency for SerDes firmware to the rootfs<br>
-RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_keystone =3D &quot; serdes-fw&=
quot;<br>
&#43;RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append_keystone =3D &quot; serdes=
-fw&quot;<br>
&nbsp;<br>
&nbsp;# Add run-time dependency for QMSS PDSP firmware to the rootfs<br>
-RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_keystone =3D &quot; qmss-pdsp-=
fw&quot;<br>
&#43;RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append_keystone =3D &quot; qmss-p=
dsp-fw&quot;<br>
&nbsp;<br>
&nbsp;# Add run-time dependency for NETCP PA firmware to the rootfs<br>
-RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_k2hk =3D &quot; netcp-pa-fw&qu=
ot;<br>
-RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_k2e =3D &quot; netcp-pa-fw&quo=
t;<br>
-RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_k2l =3D &quot; netcp-pa-fw&quo=
t;<br>
&#43;RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append_k2hk =3D &quot; netcp-pa-f=
w&quot;<br>
&#43;RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append_k2e =3D &quot; netcp-pa-fw=
&quot;<br>
&#43;RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append_k2l =3D &quot; netcp-pa-fw=
&quot;<br>
&nbsp;<br>
&nbsp;# Add run-time dependency for PRU Ethernet firmware to the rootfs<br>
-RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_am57xx-evm =3D &quot; prueth-f=
w prusw-fw pruhsr-fw pruprp-fw&quot;<br>
-RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_am57xx-hs-evm =3D &quot; pruet=
h-fw prusw-fw pruhsr-fw pruprp-fw&quot;<br>
-RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_ti43x =3D &quot; prueth-fw pru=
hsr-fw pruprp-fw&quot;<br>
-RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_ti33x =3D &quot; prueth-fw pru=
hsr-fw pruprp-fw&quot;<br>
-RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_am65xx =3D &quot; prueth-fw-am=
65x&quot;<br>
-RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_am65xx-evm =3D &quot; prueth-f=
w-am65x-sr2&quot;<br>
-RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_am64xx-evm =3D &quot; prueth-f=
w-am65x-sr2&quot;<br>
&#43;RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append_am57xx-evm =3D &quot; prue=
th-fw prusw-fw pruhsr-fw pruprp-fw&quot;<br>
&#43;RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append_am57xx-hs-evm =3D &quot; p=
rueth-fw prusw-fw pruhsr-fw pruprp-fw&quot;<br>
&#43;RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append_ti43x =3D &quot; prueth-fw=
 pruhsr-fw pruprp-fw&quot;<br>
&#43;RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append_ti33x =3D &quot; prueth-fw=
 pruhsr-fw pruprp-fw&quot;<br>
&#43;RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append_am65xx =3D &quot; prueth-f=
w-am65x&quot;<br>
&#43;RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append_am65xx-evm =3D &quot; prue=
th-fw-am65x-sr2&quot;<br>
&#43;RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append_am64xx-evm =3D &quot; prue=
th-fw-am65x-sr2&quot;<br>
&nbsp;<br>
&nbsp;# Add run-time dependency for Cadence MHDP firmware to the rootfs<br>
-RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_j7 =3D &quot; cadence-mhdp-fw&=
quot;<br>
&#43;RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append_j7 =3D &quot; cadence-mhdp=
-fw&quot;<br>
diff --git a/recipes-kernel/linux/linux-ti-mainline_git.bb b/recipes-kernel=
/linux/linux-ti-mainline_git.bb<br>
index 5d043da7..9489ed6a 100644<br>
--- a/recipes-kernel/linux/linux-ti-mainline_git.bb<br>
&#43;&#43;&#43; b/recipes-kernel/linux/linux-ti-mainline_git.bb<br>
@@ -25,7 &#43;25,7 @@ SRCREV =3D &quot;62fb9874f5da54fdb243003b386128037319=
b219&quot;<br>
&nbsp;PV =3D &quot;5.13&#43;git${SRCPV}&quot;<br>
&nbsp;<br>
&nbsp;# Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a r=
ebuild<br>
-MACHINE_KERNEL_PR_append =3D &quot;b&quot;<br>
&#43;MACHINE_KERNEL_PR:append =3D &quot;b&quot;<br>
&nbsp;PR =3D &quot;${MACHINE_KERNEL_PR}&quot;<br>
&nbsp;<br>
&nbsp;KERNEL_GIT_URI =3D &quot;git://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git&quot;<br>
@@ -41,12 &#43;41,12 @@ SRCREV_FORMAT =3D &quot;linux&quot;<br>
&nbsp;<br>
&nbsp;KERNEL_DEVICETREE =3D &quot;&quot;<br>
&nbsp;<br>
-kernel_do_compile_append() {<br>
&#43;kernel_do_compile:append() {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; oe_runmake dtbs CC=3D&quot=
;${KERNEL_CC} $cc_extra &quot; LD=3D&quot;${KERNEL_LD}&quot; ${KERNEL_EXTRA=
_ARGS}<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; oe_runmake -C ${WORKDIR}/t=
i-upstream-tools LINUX=3D${S} DTC=3D${B}/scripts/dtc/dtc O=3D${B} CC=3D&quo=
t;${KERNEL_CC} $cc_extra &quot; LD=3D&quot;${KERNEL_LD}&quot; ${KERNEL_EXTR=
A_ARGS}<br>
&nbsp;}<br>
&nbsp;<br>
-do_install_append() {<br>
&#43;do_install:append() {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for dtbf in `find arch/${A=
RCH}/boot/dts/ \( -name '*.dtb' -or -name '*.dtbo' \)`; do<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; dtb=3D&quot;$dtbf&quot;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; dtb_ext=3D${dtb##*.}<br>
@@ -56,7 &#43;56,7 @@ do_install_append() {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; done<br>
&nbsp;}<br>
&nbsp;<br>
-do_deploy_append() {<br>
&#43;do_deploy:append() {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for dtbf in `find arch/${A=
RCH}/boot/dts/ \( -name '*.dtb' -or -name '*.dtbo' \) -printf '%P\n'`; do<b=
r>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; dtb=3D&quot;$dtbf&quot;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; dtb_ext=3D${dtb##*.}<br>
@@ -67,9 &#43;67,9 @@ do_deploy_append() {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; done<br>
&nbsp;}<br>
&nbsp;<br>
-do_shared_workdir_prepend() {<br>
&#43;do_shared_workdir:prepend() {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cd ${B}<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; echo &gt;&gt; Module.symve=
rs<br>
&nbsp;}<br>
&nbsp;<br>
-FILES_${KERNEL_PACKAGE_NAME}-devicetree &#43;=3D &quot;/${KERNEL_IMAGEDEST=
}/*.itb&quot;<br>
&#43;FILES:${KERNEL_PACKAGE_NAME}-devicetree &#43;=3D &quot;/${KERNEL_IMAGE=
DEST}/*.itb&quot;<br>
diff --git a/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb b/recipes-ker=
nel/linux/linux-ti-staging-rt_5.10.bb<br>
index f039d6c2..256cea2e 100644<br>
--- a/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb<br>
&#43;&#43;&#43; b/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb<br>
@@ -2,7 &#43;2,7 @@ require linux-ti-staging_5.10.bb<br>
&nbsp;<br>
&nbsp;# Look in the generic major.minor directory for files<br>
&nbsp;# This will have priority over generic non-rt path<br>
-FILESEXTRAPATHS_prepend :=3D &quot;${THISDIR}/${PN}-5.10:&quot;<br>
&#43;FILESEXTRAPATHS:prepend :=3D &quot;${THISDIR}/${PN}-5.10:&quot;<br>
&nbsp;<br>
&nbsp;BRANCH =3D &quot;ti-rt-linux-5.10.y&quot;<br>
&nbsp;<br>
diff --git a/recipes-kernel/linux/linux-ti-staging-rt_5.4.bb b/recipes-kern=
el/linux/linux-ti-staging-rt_5.4.bb<br>
index 5542422e..8a0c0eaf 100644<br>
--- a/recipes-kernel/linux/linux-ti-staging-rt_5.4.bb<br>
&#43;&#43;&#43; b/recipes-kernel/linux/linux-ti-staging-rt_5.4.bb<br>
@@ -2,7 &#43;2,7 @@ require linux-ti-staging_5.4.bb<br>
&nbsp;<br>
&nbsp;# Look in the generic major.minor directory for files<br>
&nbsp;# This will have priority over generic non-rt path<br>
-FILESEXTRAPATHS_prepend :=3D &quot;${THISDIR}/${PN}-5.4:&quot;<br>
&#43;FILESEXTRAPATHS:prepend :=3D &quot;${THISDIR}/${PN}-5.4:&quot;<br>
&nbsp;<br>
&nbsp;BRANCH =3D &quot;ti-rt-linux-5.4.y&quot;<br>
&nbsp;<br>
diff --git a/recipes-kernel/linux/linux-ti-staging-systest_5.10.bb b/recipe=
s-kernel/linux/linux-ti-staging-systest_5.10.bb<br>
index f0917985..e57d82eb 100644<br>
--- a/recipes-kernel/linux/linux-ti-staging-systest_5.10.bb<br>
&#43;&#43;&#43; b/recipes-kernel/linux/linux-ti-staging-systest_5.10.bb<br>
@@ -2,4 &#43;2,4 @@ require linux-ti-staging_5.10.bb<br>
&nbsp;<br>
&nbsp;# Look in the generic major.minor directory for files<br>
&nbsp;# This will have priority over generic non-rt path<br>
-FILESEXTRAPATHS_prepend :=3D &quot;${THISDIR}/${PN}-5.10:&quot;<br>
&#43;FILESEXTRAPATHS:prepend :=3D &quot;${THISDIR}/${PN}-5.10:&quot;<br>
diff --git a/recipes-kernel/linux/linux-ti-staging-systest_5.4.bb b/recipes=
-kernel/linux/linux-ti-staging-systest_5.4.bb<br>
index a2404574..7a9a148b 100644<br>
--- a/recipes-kernel/linux/linux-ti-staging-systest_5.4.bb<br>
&#43;&#43;&#43; b/recipes-kernel/linux/linux-ti-staging-systest_5.4.bb<br>
@@ -2,4 &#43;2,4 @@ require linux-ti-staging_5.4.bb<br>
&nbsp;<br>
&nbsp;# Look in the generic major.minor directory for files<br>
&nbsp;# This will have priority over generic non-rt path<br>
-FILESEXTRAPATHS_prepend :=3D &quot;${THISDIR}/${PN}-5.4:&quot;<br>
&#43;FILESEXTRAPATHS:prepend :=3D &quot;${THISDIR}/${PN}-5.4:&quot;<br>
diff --git a/recipes-kernel/linux/linux-ti-staging_5.10.bb b/recipes-kernel=
/linux/linux-ti-staging_5.10.bb<br>
index e06f7b64..36b0d005 100644<br>
--- a/recipes-kernel/linux/linux-ti-staging_5.10.bb<br>
&#43;&#43;&#43; b/recipes-kernel/linux/linux-ti-staging_5.10.bb<br>
@@ -14,7 &#43;14,7 @@ require recipes-kernel/linux/kernel-rdepends.inc<br>
&nbsp;require recipes-kernel/linux/ti-kernel.inc<br>
&nbsp;<br>
&nbsp;# Look in the generic major.minor directory for files<br>
-FILESEXTRAPATHS_prepend :=3D &quot;${THISDIR}/${PN}-5.10:&quot;<br>
&#43;FILESEXTRAPATHS:prepend :=3D &quot;${THISDIR}/${PN}-5.10:&quot;<br>
&nbsp;<br>
&nbsp;KERNEL_EXTRA_ARGS &#43;=3D &quot;LOADADDR=3D${UBOOT_ENTRYPOINT} \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${EXTRA_DTC_ARGS}=
&quot;<br>
@@ -27,7 &#43;27,7 @@ SRCREV =3D &quot;4c2eade9f722838b0e457650368cba1c6c74=
83c2&quot;<br>
&nbsp;PV =3D &quot;5.10.41&#43;git${SRCPV}&quot;<br>
&nbsp;<br>
&nbsp;# Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a r=
ebuild<br>
-MACHINE_KERNEL_PR_append =3D &quot;b&quot;<br>
&#43;MACHINE_KERNEL_PR:append =3D &quot;b&quot;<br>
&nbsp;PR =3D &quot;${MACHINE_KERNEL_PR}&quot;<br>
&nbsp;<br>
&nbsp;KERNEL_GIT_URI =3D &quot;git://git.ti.com/ti-linux-kernel/ti-linux-ke=
rnel.git&quot;<br>
@@ -35,11 &#43;35,11 @@ KERNEL_GIT_PROTOCOL =3D &quot;git&quot;<br>
&nbsp;SRC_URI &#43;=3D &quot;${KERNEL_GIT_URI};protocol=3D${KERNEL_GIT_PROT=
OCOL};branch=3D${BRANCH} \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a=
 href=3D"file://defconfig">file://defconfig</a>&quot;<br>
&nbsp;<br>
-FILES_${KERNEL_PACKAGE_NAME}-devicetree &#43;=3D &quot;/${KERNEL_IMAGEDEST=
}/*.itb&quot;<br>
&#43;FILES:${KERNEL_PACKAGE_NAME}-devicetree &#43;=3D &quot;/${KERNEL_IMAGE=
DEST}/*.itb&quot;<br>
&nbsp;<br>
&nbsp;# Special configuration for remoteproc/rpmsg IPC modules<br>
&nbsp;module_conf_rpmsg_client_sample =3D &quot;blacklist rpmsg_client_samp=
le&quot;<br>
&nbsp;module_conf_ti_k3_r5_remoteproc =3D &quot;softdep ti_k3_r5_remoteproc=
 pre: virtio_rpmsg_bus&quot;<br>
&nbsp;module_conf_ti_k3_dsp_remoteproc =3D &quot;softdep ti_k3_dsp_remotepr=
oc pre: virtio_rpmsg_bus&quot;<br>
&nbsp;KERNEL_MODULE_PROBECONF &#43;=3D &quot;rpmsg_client_sample ti_k3_r5_r=
emoteproc ti_k3_dsp_remoteproc&quot;<br>
-KERNEL_MODULE_AUTOLOAD_append_j7 =3D &quot; rpmsg_kdrv_switch&quot;<br>
&#43;KERNEL_MODULE_AUTOLOAD:append_j7 =3D &quot; rpmsg_kdrv_switch&quot;<br=
>
diff --git a/recipes-kernel/linux/linux-ti-staging_5.4.bb b/recipes-kernel/=
linux/linux-ti-staging_5.4.bb<br>
index a86223af..b08a7672 100644<br>
--- a/recipes-kernel/linux/linux-ti-staging_5.4.bb<br>
&#43;&#43;&#43; b/recipes-kernel/linux/linux-ti-staging_5.4.bb<br>
@@ -13,7 &#43;13,7 @@ require recipes-kernel/linux/bundle-devicetree.inc<br=
>
&nbsp;require recipes-kernel/linux/kernel-rdepends.inc<br>
&nbsp;<br>
&nbsp;# Look in the generic major.minor directory for files<br>
-FILESEXTRAPATHS_prepend :=3D &quot;${THISDIR}/${PN}-5.4:&quot;<br>
&#43;FILESEXTRAPATHS:prepend :=3D &quot;${THISDIR}/${PN}-5.4:&quot;<br>
&nbsp;<br>
&nbsp;KERNEL_EXTRA_ARGS &#43;=3D &quot;LOADADDR=3D${UBOOT_ENTRYPOINT}&quot;=
<br>
&nbsp;<br>
@@ -25,7 &#43;25,7 @@ SRCREV =3D &quot;023faefa70274929bff92dc41167b007f752=
3792&quot;<br>
&nbsp;PV =3D &quot;5.4.106&#43;git${SRCPV}&quot;<br>
&nbsp;<br>
&nbsp;# Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a r=
ebuild<br>
-MACHINE_KERNEL_PR_append =3D &quot;a&quot;<br>
&#43;MACHINE_KERNEL_PR:append =3D &quot;a&quot;<br>
&nbsp;PR =3D &quot;${MACHINE_KERNEL_PR}&quot;<br>
&nbsp;<br>
&nbsp;KERNEL_GIT_URI =3D &quot;git://git.ti.com/ti-linux-kernel/ti-linux-ke=
rnel.git&quot;<br>
@@ -33,11 &#43;33,11 @@ KERNEL_GIT_PROTOCOL =3D &quot;git&quot;<br>
&nbsp;SRC_URI &#43;=3D &quot;${KERNEL_GIT_URI};protocol=3D${KERNEL_GIT_PROT=
OCOL};branch=3D${BRANCH} \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a=
 href=3D"file://defconfig">file://defconfig</a>&quot;<br>
&nbsp;<br>
-FILES_${KERNEL_PACKAGE_NAME}-devicetree &#43;=3D &quot;/${KERNEL_IMAGEDEST=
}/*.itb&quot;<br>
&#43;FILES:${KERNEL_PACKAGE_NAME}-devicetree &#43;=3D &quot;/${KERNEL_IMAGE=
DEST}/*.itb&quot;<br>
&nbsp;<br>
&nbsp;# Special configuration for remoteproc/rpmsg IPC modules<br>
&nbsp;module_conf_rpmsg_client_sample =3D &quot;blacklist rpmsg_client_samp=
le&quot;<br>
&nbsp;module_conf_ti_k3_r5_remoteproc =3D &quot;softdep ti_k3_r5_remoteproc=
 pre: virtio_rpmsg_bus&quot;<br>
&nbsp;module_conf_ti_k3_dsp_remoteproc =3D &quot;softdep ti_k3_dsp_remotepr=
oc pre: virtio_rpmsg_bus&quot;<br>
&nbsp;KERNEL_MODULE_PROBECONF &#43;=3D &quot;rpmsg_client_sample ti_k3_r5_r=
emoteproc ti_k3_dsp_remoteproc&quot;<br>
-KERNEL_MODULE_AUTOLOAD_append_j7 =3D &quot; rpmsg_kdrv_switch&quot;<br>
&#43;KERNEL_MODULE_AUTOLOAD:append_j7 =3D &quot; rpmsg_kdrv_switch&quot;<br=
>
diff --git a/recipes-kernel/linux/ti-uio.inc b/recipes-kernel/linux/ti-uio.=
inc<br>
index 80dad7dc..6fc74d1a 100644<br>
--- a/recipes-kernel/linux/ti-uio.inc<br>
&#43;&#43;&#43; b/recipes-kernel/linux/ti-uio.inc<br>
@@ -1,19 &#43;1,19 @@<br>
-SRC_URI_append_keystone =3D &quot; <a href=3D"file://keystone-uio.dtsi">fi=
le://keystone-uio.dtsi</a>&quot;<br>
-SRC_URI_append_k2hk =3D &quot; <a href=3D"file://k2hk-uio.dtsi">file://k2h=
k-uio.dtsi</a>&quot;<br>
-SRC_URI_append_k2l =3D &quot; <a href=3D"file://k2l-uio.dtsi">file://k2l-u=
io.dtsi</a>&quot;<br>
-SRC_URI_append_k2e =3D &quot; <a href=3D"file://k2e-uio.dtsi">file://k2e-u=
io.dtsi</a>&quot;<br>
-SRC_URI_append_k2g =3D &quot; <a href=3D"file://keystone-k2g-pru-uio.dtsi"=
>file://keystone-k2g-pru-uio.dtsi</a>&quot;<br>
-SRC_URI_append_dra7xx =3D &quot; <a href=3D"file://am57xx-pru-uio.dtsi">fi=
le://am57xx-pru-uio.dtsi</a> \<br>
&#43;SRC_URI:append_keystone =3D &quot; <a href=3D"file://keystone-uio.dtsi=
">file://keystone-uio.dtsi</a>&quot;<br>
&#43;SRC_URI:append_k2hk =3D &quot; <a href=3D"file://k2hk-uio.dtsi">file:/=
/k2hk-uio.dtsi</a>&quot;<br>
&#43;SRC_URI:append_k2l =3D &quot; <a href=3D"file://k2l-uio.dtsi">file://k=
2l-uio.dtsi</a>&quot;<br>
&#43;SRC_URI:append_k2e =3D &quot; <a href=3D"file://k2e-uio.dtsi">file://k=
2e-uio.dtsi</a>&quot;<br>
&#43;SRC_URI:append_k2g =3D &quot; <a href=3D"file://keystone-k2g-pru-uio.d=
tsi">file://keystone-k2g-pru-uio.dtsi</a>&quot;<br>
&#43;SRC_URI:append_dra7xx =3D &quot; <a href=3D"file://am57xx-pru-uio.dtsi=
">file://am57xx-pru-uio.dtsi</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; <a href=3D"file://am571x-pru-uio.dtsi">file://am571x-pru-uio.dtsi</a=
> \<br>
&nbsp;&quot;<br>
-SRC_URI_append_ti33x =3D &quot; <a href=3D"file://am335x-pru-uio.dtsi">fil=
e://am335x-pru-uio.dtsi</a>&quot;<br>
-SRC_URI_append_ti43x =3D &quot; <a href=3D"file://am437x-pru-uio.dtsi">fil=
e://am437x-pru-uio.dtsi</a>&quot;<br>
&#43;SRC_URI:append_ti33x =3D &quot; <a href=3D"file://am335x-pru-uio.dtsi"=
>file://am335x-pru-uio.dtsi</a>&quot;<br>
&#43;SRC_URI:append_ti43x =3D &quot; <a href=3D"file://am437x-pru-uio.dtsi"=
>file://am437x-pru-uio.dtsi</a>&quot;<br>
&nbsp;<br>
&nbsp;DTSI_LIST =3D &quot;&quot;<br>
-DTSI_LIST_append_keystone =3D &quot; keystone-uio.dtsi&quot;<br>
-DTSI_LIST_append_k2hk =3D &quot; k2hk-uio.dtsi&quot;<br>
-DTSI_LIST_append_k2l =3D &quot; k2l-uio.dtsi&quot;<br>
-DTSI_LIST_append_k2e =3D &quot; k2e-uio.dtsi&quot;<br>
&#43;DTSI_LIST:append_keystone =3D &quot; keystone-uio.dtsi&quot;<br>
&#43;DTSI_LIST:append_k2hk =3D &quot; k2hk-uio.dtsi&quot;<br>
&#43;DTSI_LIST:append_k2l =3D &quot; k2l-uio.dtsi&quot;<br>
&#43;DTSI_LIST:append_k2e =3D &quot; k2e-uio.dtsi&quot;<br>
&nbsp;<br>
&nbsp;do_setup_uio() {<br>
&nbsp;&nbsp;&nbsp;&nbsp; if [ &quot;${ENABLE_TI_UIO_DEVICES}&quot; =3D=3D &=
quot;1&quot; ]<br>
@@ -30,7 &#43;30,7 @@ do_setup_uio() {<br>
&nbsp;&nbsp;&nbsp;&nbsp; fi<br>
&nbsp;}<br>
&nbsp;<br>
-do_setup_uio_append_dra7xx() {<br>
&#43;do_setup_uio:append_dra7xx() {<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp; if [ &quot;${ENABLE_TI_UIO_DEVICES}&quot; =3D=3D &=
quot;1&quot; ]<br>
&nbsp;&nbsp;&nbsp;&nbsp; then<br>
@@ -53,7 &#43;53,7 @@ do_setup_uio_append_dra7xx() {<br>
&nbsp;&nbsp;&nbsp;&nbsp; fi<br>
&nbsp;}<br>
&nbsp;<br>
-do_setup_uio_append_ti33x() {<br>
&#43;do_setup_uio:append_ti33x() {<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp; if [ &quot;${ENABLE_TI_UIO_DEVICES}&quot; =3D=3D &=
quot;1&quot; ]<br>
&nbsp;&nbsp;&nbsp;&nbsp; then<br>
@@ -65,7 &#43;65,7 @@ do_setup_uio_append_ti33x() {<br>
&nbsp;&nbsp;&nbsp;&nbsp; fi<br>
&nbsp;}<br>
&nbsp;<br>
-do_setup_uio_append_ti43x() {<br>
&#43;do_setup_uio:append_ti43x() {<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp; if [ &quot;${ENABLE_TI_UIO_DEVICES}&quot; =3D=3D &=
quot;1&quot; ]<br>
&nbsp;&nbsp;&nbsp;&nbsp; then<br>
@@ -77,7 &#43;77,7 @@ do_setup_uio_append_ti43x() {<br>
&nbsp;&nbsp;&nbsp;&nbsp; fi<br>
&nbsp;}<br>
&nbsp;<br>
-do_setup_uio_append_k2g() {<br>
&#43;do_setup_uio:append_k2g() {<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp; if [ &quot;${ENABLE_TI_UIO_DEVICES}&quot; =3D=3D &=
quot;1&quot; ]<br>
&nbsp;&nbsp;&nbsp;&nbsp; then<br>
diff --git a/recipes-security/optee/optee-os_%.bbappend b/recipes-security/=
optee/optee-os_%.bbappend<br>
index d7e81c5a..881dc84f 100644<br>
--- a/recipes-security/optee/optee-os_%.bbappend<br>
&#43;&#43;&#43; b/recipes-security/optee/optee-os_%.bbappend<br>
@@ -1,8 &#43;1,8 @@<br>
-do_compile_prepend_ti-soc() {<br>
&#43;do_compile:prepend_ti-soc() {<br>
&nbsp;&nbsp;&nbsp;&nbsp; export TI_SECURE_DEV_PKG=3D${TI_SECURE_DEV_PKG}<br=
>
&nbsp;}<br>
&nbsp;<br>
-do_compile_append_k3() {<br>
&#43;do_compile:append_k3() {<br>
&nbsp;&nbsp;&nbsp;&nbsp; ( cd ${B}/core/; \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cp tee-pager_v2.bin ${B}/b=
l32.bin; \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cp tee.elf ${B}/bl32.elf; =
\<br>
@@ -37,23 &#43;37,23 @@ optee_sign_k3hs() {<br>
&nbsp;&nbsp;&nbsp;&nbsp; )<br>
&nbsp;}<br>
&nbsp;<br>
-do_compile_append_ti43x() {<br>
&#43;do_compile:append_ti43x() {<br>
&nbsp;&nbsp;&nbsp;&nbsp; optee_sign_legacyhs<br>
&nbsp;}<br>
&nbsp;<br>
-do_compile_append_dra7xx() {<br>
&#43;do_compile:append_dra7xx() {<br>
&nbsp;&nbsp;&nbsp;&nbsp; optee_sign_legacyhs<br>
&nbsp;}<br>
&nbsp;<br>
-do_compile_append_am65xx-hs-evm() {<br>
&#43;do_compile:append_am65xx-hs-evm() {<br>
&nbsp;&nbsp;&nbsp;&nbsp; optee_sign_k3hs<br>
&nbsp;}<br>
&nbsp;<br>
-do_compile_append_j7-hs-evm() {<br>
&#43;do_compile:append_j7-hs-evm() {<br>
&nbsp;&nbsp;&nbsp;&nbsp; optee_sign_k3hs<br>
&nbsp;}<br>
&nbsp;<br>
-do_install_append_ti-soc() {<br>
&#43;do_install:append_ti-soc() {<br>
&nbsp;&nbsp;&nbsp;&nbsp; install -m 644 ${B}/*.optee ${D}${nonarch_base_lib=
dir}/firmware/ || true<br>
&nbsp;&nbsp;&nbsp;&nbsp; install -m 644 ${B}/bl32.bin ${D}${nonarch_base_li=
bdir}/firmware/ || true<br>
&nbsp;&nbsp;&nbsp;&nbsp; install -m 644 ${B}/bl32.elf ${D}${nonarch_base_li=
bdir}/firmware/ || true<br>
@@ -66,18 &#43;66,18 @@ optee_deploy_legacyhs() {<br>
&nbsp;&nbsp;&nbsp;&nbsp; done<br>
&nbsp;}<br>
&nbsp;<br>
-do_deploy_append_ti43x() {<br>
&#43;do_deploy:append_ti43x() {<br>
&nbsp;&nbsp;&nbsp;&nbsp; optee_deploy_legacyhs<br>
&nbsp;}<br>
&nbsp;<br>
-do_deploy_append_dra7xx() {<br>
&#43;do_deploy:append_dra7xx() {<br>
&nbsp;&nbsp;&nbsp;&nbsp; optee_deploy_legacyhs<br>
&nbsp;}<br>
&nbsp;<br>
-do_deploy_append_k3() {<br>
&#43;do_deploy:append_k3() {<br>
&nbsp;&nbsp;&nbsp;&nbsp; ln -sf optee/bl32.bin ${DEPLOYDIR}/<br>
&nbsp;&nbsp;&nbsp;&nbsp; ln -sf optee/bl32.elf ${DEPLOYDIR}/<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;# This is needed for bl32.elf<br>
-INSANE_SKIP_${PN}_append_k3 =3D &quot; textrel&quot;<br>
&#43;INSANE_SKIP:${PN}:append_k3 =3D &quot; textrel&quot;<br>
diff --git a/recipes-ti/beagleboard/beaglebone-capes.bb b/recipes-ti/beagle=
board/beaglebone-capes.bb<br>
index 569a3e5a..ceefe0d6 100644<br>
--- a/recipes-ti/beagleboard/beaglebone-capes.bb<br>
&#43;&#43;&#43; b/recipes-ti/beagleboard/beaglebone-capes.bb<br>
@@ -23,4 &#43;23,4 @@ do_install() {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; install -m 0755 ${WORKDIR}=
/cape*.sh ${D}${bindir}<br>
&nbsp;}<br>
&nbsp;<br>
-FILES_${PN} &#43;=3D &quot;${base_libdir}/systemd/system&quot;<br>
&#43;FILES:${PN} &#43;=3D &quot;${base_libdir}/systemd/system&quot;<br>
diff --git a/recipes-ti/beagleboard/beaglebone-getting-started.bb b/recipes=
-ti/beagleboard/beaglebone-getting-started.bb<br>
index adde30b4..303b9bd7 100644<br>
--- a/recipes-ti/beagleboard/beaglebone-getting-started.bb<br>
&#43;&#43;&#43; b/recipes-ti/beagleboard/beaglebone-getting-started.bb<br>
@@ -17,5 &#43;17,5 @@ do_install() {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cp -R --no-dereference --p=
reserve=3Dmode,links ${S}/* ${D}${datadir}/${PN}<br>
&nbsp;}<br>
&nbsp;<br>
-FILES_${PN} &#43;=3D &quot;${datadir}/${PN}&quot;<br>
-INSANE_SKIP_${PN} =3D &quot;file-rdeps&quot;<br>
&#43;FILES:${PN} &#43;=3D &quot;${datadir}/${PN}&quot;<br>
&#43;INSANE_SKIP:${PN} =3D &quot;file-rdeps&quot;<br>
diff --git a/recipes-ti/beagleboard/gadget-init.bb b/recipes-ti/beagleboard=
/gadget-init.bb<br>
index b546efbb..3ab00ec3 100644<br>
--- a/recipes-ti/beagleboard/gadget-init.bb<br>
&#43;&#43;&#43; b/recipes-ti/beagleboard/gadget-init.bb<br>
@@ -39,22 &#43;39,22 @@ do_install() {<br>
&nbsp;<br>
&nbsp;PACKAGES =3D&#43; &quot;${PN}-storage ${PN}-network ${PN}-udhcpd&quot=
;<br>
&nbsp;<br>
-ALLOW_EMPTY_${PN} =3D &quot;1&quot;<br>
&#43;ALLOW_EMPTY:${PN} =3D &quot;1&quot;<br>
&nbsp;<br>
-FILES_${PN}-storage =3D &quot;${base_libdir}/systemd/system/storage-gadget=
-init.service \<br>
&#43;FILES:${PN}-storage =3D &quot;${base_libdir}/systemd/system/storage-ga=
dget-init.service \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${base_libd=
ir}/systemd/system/basic.target.wants/storage-gadget-init.service \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${bindir}/g=
-storage-reinsert.sh \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${bindir}/u=
pdate-image-info-on-mmcblk0p1.sh \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${sysconfdi=
r}/udev/rules.d/bone-gmass-eject.rules&quot;<br>
&nbsp;<br>
-FILES_${PN}-network =3D &quot;${base_libdir}/systemd/system/network-gadget=
-init.service \<br>
&#43;FILES:${PN}-network =3D &quot;${base_libdir}/systemd/system/network-ga=
dget-init.service \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${base_libd=
ir}/systemd/system/basic.target.wants/network-gadget-init.service \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${bindir}/g=
-ether-load.sh \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${bindir}/g=
-ether-start-service.sh \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${sysconfdi=
r}/udev/rules.d/udhcpd.rules&quot;<br>
&nbsp;<br>
-FILES_${PN}-udhcpd =3D &quot;${base_libdir}/systemd/system/udhcpd.service =
\<br>
&#43;FILES:${PN}-udhcpd =3D &quot;${base_libdir}/systemd/system/udhcpd.serv=
ice \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${base_libdir}/sy=
stemd/system/basic.target.wants/udhcpd.service \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${sysconfdir}/udh=
cpd.conf&quot;<br>
&nbsp;<br>
-RRECOMMENDS_${PN} =3D &quot;${PN}-storage ${PN}-network ${PN}-udhcpd&quot;=
<br>
&#43;RRECOMMENDS:${PN} =3D &quot;${PN}-storage ${PN}-network ${PN}-udhcpd&q=
uot;<br>
diff --git a/recipes-ti/bios/ti-biosutils_1.02.02.bb b/recipes-ti/bios/ti-b=
iosutils_1.02.02.bb<br>
index 01c070d7..eb674f6b 100644<br>
--- a/recipes-ti/bios/ti-biosutils_1.02.02.bb<br>
&#43;&#43;&#43; b/recipes-ti/bios/ti-biosutils_1.02.02.bb<br>
@@ -6,7 &#43;6,7 @@ PVsuffix =3D &quot;_02&quot;<br>
&nbsp;SRC_URI[biosutilstarball.md5sum] =3D &quot;0654e9e72b0a6fc7a6575829c0=
cd90c9&quot;<br>
&nbsp;SRC_URI[biosutilstarball.sha256sum] =3D &quot;df486500bdc8dbe3800fc7e=
fe4241e6fa5b1827ba7c0dc17a71b41d42ef921e1&quot;<br>
&nbsp;<br>
-INSANE_SKIP_${PN} =3D &quot;installed-vs-shipped&quot;<br>
&#43;INSANE_SKIP:${PN} =3D &quot;installed-vs-shipped&quot;<br>
&nbsp;<br>
&nbsp;COMPATIBLE_HOST ?=3D &quot;null&quot;<br>
&nbsp;COMPATIBLE_HOST_ti-soc =3D &quot;(.*)&quot;<br>
diff --git a/recipes-ti/bios/ti-sysbios.inc b/recipes-ti/bios/ti-sysbios.in=
c<br>
index 087f2edd..0009dfcc 100644<br>
--- a/recipes-ti/bios/ti-sysbios.inc<br>
&#43;&#43;&#43; b/recipes-ti/bios/ti-sysbios.inc<br>
@@ -19,10 &#43;19,10 @@ do_install() {<br>
&nbsp;&nbsp;&nbsp;&nbsp; cp ${CP_ARGS} ${S}/* ${D}${SYSBIOS_INSTALL_DIR_REC=
IPE}<br>
&nbsp;}<br>
&nbsp;<br>
-ALLOW_EMPTY_${PN} =3D &quot;1&quot;<br>
-FILES_${PN}-dev &#43;=3D &quot;${SYSBIOS_INSTALL_DIR_RECIPE}&quot;<br>
&#43;ALLOW_EMPTY:${PN} =3D &quot;1&quot;<br>
&#43;FILES:${PN}-dev &#43;=3D &quot;${SYSBIOS_INSTALL_DIR_RECIPE}&quot;<br>
&nbsp;<br>
&nbsp;INHIBIT_PACKAGE_STRIP =3D &quot;1&quot;<br>
&nbsp;INHIBIT_SYSROOT_STRIP =3D &quot;1&quot;<br>
&nbsp;INHIBIT_PACKAGE_DEBUG_SPLIT =3D &quot;1&quot;<br>
-INSANE_SKIP_${PN}-dev =3D &quot;arch ldflags staticdev file-rdeps&quot;<br=
>
&#43;INSANE_SKIP:${PN}-dev =3D &quot;arch ldflags staticdev file-rdeps&quot=
;<br>
diff --git a/recipes-ti/codec-engine/ti-codec-engine_3.24.00.08.bb b/recipe=
s-ti/codec-engine/ti-codec-engine_3.24.00.08.bb<br>
index aa538412..5851b899 100644<br>
--- a/recipes-ti/codec-engine/ti-codec-engine_3.24.00.08.bb<br>
&#43;&#43;&#43; b/recipes-ti/codec-engine/ti-codec-engine_3.24.00.08.bb<br>
@@ -25,5 &#43;25,5 @@ do_install() {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cp ${CP_ARGS} ${S}/* ${D}$=
{CE_INSTALL_DIR_RECIPE}<br>
&nbsp;}<br>
&nbsp;<br>
-ALLOW_EMPTY_${PN} =3D &quot;1&quot;<br>
-FILES_${PN}-dev &#43;=3D &quot;${CE_INSTALL_DIR_RECIPE}&quot;<br>
&#43;ALLOW_EMPTY:${PN} =3D &quot;1&quot;<br>
&#43;FILES:${PN}-dev &#43;=3D &quot;${CE_INSTALL_DIR_RECIPE}&quot;<br>
diff --git a/recipes-ti/ctoolslib/libaet_git.bb b/recipes-ti/ctoolslib/liba=
et_git.bb<br>
index 626ba926..7f31569e 100644<br>
--- a/recipes-ti/ctoolslib/libaet_git.bb<br>
&#43;&#43;&#43; b/recipes-ti/ctoolslib/libaet_git.bb<br>
@@ -32,8 &#43;32,8 @@ do_install() {<br>
&nbsp;COMPATIBLE_MACHINE =3D &quot;dra7xx|keystone&quot;<br>
&nbsp;PACKAGE_ARCH =3D &quot;${MACHINE_ARCH}&quot;<br>
&nbsp;<br>
-FILES_${PN}-dev &#43;=3D &quot;\<br>
&#43;FILES:${PN}-dev &#43;=3D &quot;\<br>
&nbsp;&nbsp;&nbsp;&nbsp; ${datadir}/ti/ctoolslib/aet \<br>
&nbsp;&quot;<br>
&nbsp;<br>
-ALLOW_EMPTY_${PN} =3D &quot;1&quot;<br>
&#43;ALLOW_EMPTY:${PN} =3D &quot;1&quot;<br>
diff --git a/recipes-ti/devtools/gcc-arm-baremetal_7-2018-q2-update.bb b/re=
cipes-ti/devtools/gcc-arm-baremetal_7-2018-q2-update.bb<br>
index f474c87f..e0feb02c 100644<br>
--- a/recipes-ti/devtools/gcc-arm-baremetal_7-2018-q2-update.bb<br>
&#43;&#43;&#43; b/recipes-ti/devtools/gcc-arm-baremetal_7-2018-q2-update.bb=
<br>
@@ -14,16 &#43;14,16 @@ S =3D &quot;${WORKDIR}/gcc-arm-none-eabi-7-2018-q2-=
update&quot;<br>
&nbsp;<br>
&nbsp;# only x86_64 is supported<br>
&nbsp;COMPATIBLE_HOST =3D &quot;x86_64.*-linux&quot;<br>
-COMPATIBLE_HOST_class-target =3D &quot;null&quot;<br>
&#43;COMPATIBLE_HOST:class-target =3D &quot;null&quot;<br>
&nbsp;<br>
&nbsp;do_install() {<br>
&nbsp;&nbsp;&nbsp;&nbsp; install -d ${D}${GCC_ARM_NONE_TOOLCHAIN_RECIPE}<br=
>
&nbsp;&nbsp;&nbsp;&nbsp; cp -r ${S}/. ${D}${GCC_ARM_NONE_TOOLCHAIN_RECIPE}<=
br>
&nbsp;}<br>
&nbsp;<br>
-FILES_${PN} =3D &quot;${GCC_ARM_NONE_TOOLCHAIN_RECIPE}/*&quot;<br>
&#43;FILES:${PN} =3D &quot;${GCC_ARM_NONE_TOOLCHAIN_RECIPE}/*&quot;<br>
&nbsp;<br>
-INSANE_SKIP_${PN} =3D &quot;already-stripped libdir staticdev build-deps f=
ile-rdeps&quot;<br>
&#43;INSANE_SKIP:${PN} =3D &quot;already-stripped libdir staticdev build-de=
ps file-rdeps&quot;<br>
&nbsp;INHIBIT_PACKAGE_DEBUG_SPLIT =3D &quot;1&quot;<br>
&nbsp;<br>
&nbsp;BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
diff --git a/recipes-ti/devtools/gcc-linaro-baremetal-aarch64-native.bb b/r=
ecipes-ti/devtools/gcc-linaro-baremetal-aarch64-native.bb<br>
index 97344f90..f1596a8b 100644<br>
--- a/recipes-ti/devtools/gcc-linaro-baremetal-aarch64-native.bb<br>
&#43;&#43;&#43; b/recipes-ti/devtools/gcc-linaro-baremetal-aarch64-native.b=
b<br>
@@ -1,6 &#43;1,6 @@<br>
&nbsp;include recipes-ti/devtools/gcc-linaro.inc<br>
&nbsp;<br>
-PACKAGE_DIR =3D &quot;gcc-linaro-${PV}-${GCC_ARM_YEAR}-x86_64_aarch64-elf&=
quot;<br>
&#43;PACKAGE_DIR =3D &quot;gcc-linaro-${PV}-${GCC_ARM_YEAR}-x86_64:aarch64-=
elf&quot;<br>
&nbsp;S =3D &quot;${WORKDIR}/${PACKAGE_DIR}&quot;<br>
&nbsp;<br>
&nbsp;LIC_CHKSUM =3D &quot;bc7fad4bba98e7a4cd5ab3042506493c&quot;<br>
@@ -8,7 &#43;8,7 @@ LIC_CHKSUM =3D &quot;bc7fad4bba98e7a4cd5ab3042506493c&q=
uot;<br>
&nbsp;inherit native<br>
&nbsp;require recipes-ti/includes/ti-paths.inc<br>
&nbsp;<br>
-SRC_URI =3D &quot;<a href=3D"https://releases.linaro.org/components/toolch=
ain/binaries/7.2-${GCC_ARM_YEAR}/aarch64-elf/gcc-linaro-${PV}-${GCC_ARM_YEA=
R}-x86_64_aarch64-elf.tar.xz;name=3Dgcc-linaro-aarch64">https://releases.li=
naro.org/components/toolchain/binaries/7.2-${GCC_ARM_YEAR}/aarch64-elf/gcc-=
linaro-${PV}-${GCC_ARM_YEAR}-x86_64_aarch64-elf.tar.xz;name=3Dgcc-linaro-aa=
rch64</a>&quot;<br>
&#43;SRC_URI =3D &quot;<a href=3D"https://releases.linaro.org/components/to=
olchain/binaries/7.2-${GCC_ARM_YEAR}/aarch64-elf/gcc-linaro-${PV}-${GCC_ARM=
_YEAR}-x86_64:aarch64-elf.tar.xz;name=3Dgcc-linaro-aarch64">https://release=
s.linaro.org/components/toolchain/binaries/7.2-${GCC_ARM_YEAR}/aarch64-elf/=
gcc-linaro-${PV}-${GCC_ARM_YEAR}-x86_64:aarch64-elf.tar.xz;name=3Dgcc-linar=
o-aarch64</a>&quot;<br>
&nbsp;<br>
&nbsp;SRC_URI[gcc-linaro-aarch64.md5sum] =3D &quot;4972f8943820bdd2f577f498=
de78964b&quot;<br>
&nbsp;SRC_URI[gcc-linaro-aarch64.sha256sum] =3D &quot;30fb7d876bcb982c50205=
7c593d9c1f11b35d5158a26d986718e2b998388c4c8&quot;<br>
@@ -18,6 &#43;18,6 @@ do_install() {<br>
&nbsp;&nbsp;&nbsp;&nbsp; cp -r ${S}/. ${D}${GCC_LINARO_BAREMETAL_AARCH64_TO=
OLCHAIN_RECIPE}<br>
&nbsp;}<br>
&nbsp;<br>
-FILES_${PN} =3D &quot;${GCC_LINARO_BAREMETAL_AARCH64_TOOLCHAIN_RECIPE}/*&q=
uot;<br>
&#43;FILES:${PN} =3D &quot;${GCC_LINARO_BAREMETAL_AARCH64_TOOLCHAIN_RECIPE}=
/*&quot;<br>
&nbsp;<br>
-INSANE_SKIP_${PN} =3D &quot;already-stripped&quot;<br>
&#43;INSANE_SKIP:${PN} =3D &quot;already-stripped&quot;<br>
diff --git a/recipes-ti/devtools/gcc-linaro-baremetal-native.bb b/recipes-t=
i/devtools/gcc-linaro-baremetal-native.bb<br>
index 0268ae3d..d0683fe1 100644<br>
--- a/recipes-ti/devtools/gcc-linaro-baremetal-native.bb<br>
&#43;&#43;&#43; b/recipes-ti/devtools/gcc-linaro-baremetal-native.bb<br>
@@ -1,6 &#43;1,6 @@<br>
&nbsp;include recipes-ti/devtools/gcc-linaro.inc<br>
&nbsp;<br>
-PACKAGE_DIR =3D &quot;gcc-linaro-${PV}-${GCC_ARM_YEAR}-x86_64_arm-eabi&quo=
t;<br>
&#43;PACKAGE_DIR =3D &quot;gcc-linaro-${PV}-${GCC_ARM_YEAR}-x86_64:arm-eabi=
&quot;<br>
&nbsp;S =3D &quot;${WORKDIR}/${PACKAGE_DIR}&quot;<br>
&nbsp;<br>
&nbsp;LIC_CHKSUM =3D &quot;bc7fad4bba98e7a4cd5ab3042506493c&quot;<br>
@@ -8,7 &#43;8,7 @@ LIC_CHKSUM =3D &quot;bc7fad4bba98e7a4cd5ab3042506493c&q=
uot;<br>
&nbsp;inherit native<br>
&nbsp;require recipes-ti/includes/ti-paths.inc<br>
&nbsp;<br>
-SRC_URI =3D &quot;<a href=3D"https://releases.linaro.org/components/toolch=
ain/binaries/7.2-${GCC_ARM_YEAR}/arm-eabi/gcc-linaro-${PV}-${GCC_ARM_YEAR}-=
x86_64_arm-eabi.tar.xz;name=3Dgcc-linaro">https://releases.linaro.org/compo=
nents/toolchain/binaries/7.2-${GCC_ARM_YEAR}/arm-eabi/gcc-linaro-${PV}-${GC=
C_ARM_YEAR}-x86_64_arm-eabi.tar.xz;name=3Dgcc-linaro</a>&quot;<br>
&#43;SRC_URI =3D &quot;<a href=3D"https://releases.linaro.org/components/to=
olchain/binaries/7.2-${GCC_ARM_YEAR}/arm-eabi/gcc-linaro-${PV}-${GCC_ARM_YE=
AR}-x86_64:arm-eabi.tar.xz;name=3Dgcc-linaro">https://releases.linaro.org/c=
omponents/toolchain/binaries/7.2-${GCC_ARM_YEAR}/arm-eabi/gcc-linaro-${PV}-=
${GCC_ARM_YEAR}-x86_64:arm-eabi.tar.xz;name=3Dgcc-linaro</a>&quot;<br>
&nbsp;<br>
&nbsp;SRC_URI[gcc-linaro.md5sum] =3D &quot;9a4a39cfc78c84375b1160aa93587aed=
&quot;<br>
&nbsp;SRC_URI[gcc-linaro.sha256sum] =3D &quot;45fc4f90af2e2e9c3197a275f6005=
ef5639f7a1889fa3eb24c3125ccd70fcd3d&quot;<br>
@@ -18,6 &#43;18,6 @@ do_install() {<br>
&nbsp;&nbsp;&nbsp;&nbsp; cp -r ${S}/. ${D}${GCC_LINARO_BAREMETAL_TOOLCHAIN_=
RECIPE}<br>
&nbsp;}<br>
&nbsp;<br>
-FILES_${PN} =3D &quot;${GCC_LINARO_BAREMETAL_TOOLCHAIN_RECIPE}/*&quot;<br>
&#43;FILES:${PN} =3D &quot;${GCC_LINARO_BAREMETAL_TOOLCHAIN_RECIPE}/*&quot;=
<br>
&nbsp;<br>
-INSANE_SKIP_${PN} =3D &quot;already-stripped&quot;<br>
&#43;INSANE_SKIP:${PN} =3D &quot;already-stripped&quot;<br>
diff --git a/recipes-ti/devtools/ti-cg-xml_2.61.00.bb b/recipes-ti/devtools=
/ti-cg-xml_2.61.00.bb<br>
index e618af5a..8e36be6d 100644<br>
--- a/recipes-ti/devtools/ti-cg-xml_2.61.00.bb<br>
&#43;&#43;&#43; b/recipes-ti/devtools/ti-cg-xml_2.61.00.bb<br>
@@ -29,9 &#43;29,9 @@ do_install() {<br>
&nbsp;&nbsp;&nbsp;&nbsp; cp ${CP_ARGS} ${S}/* ${D}${CG_XML_INSTALL_DIR_RECI=
PE}<br>
&nbsp;}<br>
&nbsp;<br>
-FILES_${PN} &#43;=3D &quot;${CG_XML_INSTALL_DIR_RECIPE}&quot;<br>
&#43;FILES:${PN} &#43;=3D &quot;${CG_XML_INSTALL_DIR_RECIPE}&quot;<br>
&nbsp;<br>
-INSANE_SKIP_${PN} =3D &quot;arch ldflags file-rdeps&quot;<br>
&#43;INSANE_SKIP:${PN} =3D &quot;arch ldflags file-rdeps&quot;<br>
&nbsp;<br>
&nbsp;INHIBIT_PACKAGE_STRIP =3D &quot;1&quot;<br>
&nbsp;INHIBIT_SYSROOT_STRIP =3D &quot;1&quot;<br>
diff --git a/recipes-ti/devtools/ti-cgt-arm_18.12.5.bb b/recipes-ti/devtool=
s/ti-cgt-arm_18.12.5.bb<br>
index 81384d50..60b216f9 100644<br>
--- a/recipes-ti/devtools/ti-cgt-arm_18.12.5.bb<br>
&#43;&#43;&#43; b/recipes-ti/devtools/ti-cgt-arm_18.12.5.bb<br>
@@ -21,7 &#43;21,7 @@ TI_BIN_UNPK_CMDS =3D &quot;&quot;<br>
&nbsp;<br>
&nbsp;# only x86_64 is supported<br>
&nbsp;COMPATIBLE_HOST =3D &quot;x86_64.*-linux&quot;<br>
-COMPATIBLE_HOST_class-target =3D &quot;null&quot;<br>
&#43;COMPATIBLE_HOST:class-target =3D &quot;null&quot;<br>
&nbsp;<br>
&nbsp;do_install() {<br>
&nbsp;&nbsp;&nbsp;&nbsp; install -d ${D}${M4_TOOLCHAIN_INSTALL_DIR_RECIPE}<=
br>
@@ -31,14 &#43;31,14 @@ do_install() {<br>
&nbsp;SRC_URI[cgt_arm_installer.md5sum] =3D &quot;e9e668332cf86c965b4da9d1d=
488426b&quot;<br>
&nbsp;SRC_URI[cgt_arm_installer.sha256sum] =3D &quot;da976143128c619a278cb4=
214a4295c409d100f9e65ad2f4d0d1039db7cf98f4&quot;<br>
&nbsp;<br>
-BINFILE_NAME =3D &quot;cgt_arm_installer&quot;<br>
&#43;BINFILE_NAME =3D &quot;cgt:arm_installer&quot;<br>
&nbsp;<br>
-FILES_${PN} &#43;=3D &quot;${M4_TOOLCHAIN_INSTALL_DIR_RECIPE}&quot;<br>
&#43;FILES:${PN} &#43;=3D &quot;${M4_TOOLCHAIN_INSTALL_DIR_RECIPE}&quot;<br=
>
&nbsp;<br>
&nbsp;INHIBIT_PACKAGE_STRIP =3D &quot;1&quot;<br>
&nbsp;INHIBIT_SYSROOT_STRIP =3D &quot;1&quot;<br>
&nbsp;INHIBIT_PACKAGE_DEBUG_SPLIT =3D &quot;1&quot;<br>
&nbsp;<br>
-INSANE_SKIP_${PN} &#43;=3D &quot;arch staticdev file-rdeps&quot;<br>
&#43;INSANE_SKIP:${PN} &#43;=3D &quot;arch staticdev file-rdeps&quot;<br>
&nbsp;<br>
&nbsp;BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
diff --git a/recipes-ti/devtools/ti-cgt-pru_2.3.2.bb b/recipes-ti/devtools/=
ti-cgt-pru_2.3.2.bb<br>
index ed10e272..d14c1962 100644<br>
--- a/recipes-ti/devtools/ti-cgt-pru_2.3.2.bb<br>
&#43;&#43;&#43; b/recipes-ti/devtools/ti-cgt-pru_2.3.2.bb<br>
@@ -3,18 &#43;3,18 @@ HOMEPAGE =3D &quot;<a href=3D""></a>https://www-a.ti.=
com/downloads/sds_support/TICodegenerationTools/dow<br>
&nbsp;LICENSE =3D &quot;(TI-TSPA &amp; Thai-Open-Source-Software-Center) &a=
mp; BSD-3-Clause &amp; BSL-1.0 &amp; Hewlett-Packard &amp; AFL-3.0 &amp; MI=
T &amp; BSD-2-Clause &amp; PD&quot;<br>
&nbsp;<br>
&nbsp;LIC_FILES_CHKSUM =3D &quot;<a href=3D"file://ti-cgt-pru_${PV}/PRU_Cod=
e_Generation_Tools_2.3.x_manifest.html;md5=3De22f9d8240f7cca0c0aa5242d9ffa5=
bc">file://ti-cgt-pru_${PV}/PRU_Code_Generation_Tools_2.3.x_manifest.html;m=
d5=3De22f9d8240f7cca0c0aa5242d9ffa5bc</a>&quot;<br>
-LIC_FILES_CHKSUM_class-target =3D &quot;<a href=3D"file://usr/share/doc/ti=
/cgt-pru/PRU_Code_Generation_Tools_2.3.x_manifest.html;md5=3De22f9d8240f7cc=
a0c0aa5242d9ffa5bc">file://usr/share/doc/ti/cgt-pru/PRU_Code_Generation_Too=
ls_2.3.x_manifest.html;md5=3De22f9d8240f7cca0c0aa5242d9ffa5bc</a>&quot;<br>
&#43;LIC_FILES_CHKSUM:class-target =3D &quot;<a href=3D"file://usr/share/do=
c/ti/cgt-pru/PRU_Code_Generation_Tools_2.3.x_manifest.html;md5=3De22f9d8240=
f7cca0c0aa5242d9ffa5bc">file://usr/share/doc/ti/cgt-pru/PRU_Code_Generation=
_Tools_2.3.x_manifest.html;md5=3De22f9d8240f7cca0c0aa5242d9ffa5bc</a>&quot;=
<br>
&nbsp;<br>
&nbsp;require recipes-ti/includes/ti-paths.inc<br>
&nbsp;require recipes-ti/includes/ti-unpack.inc<br>
&nbsp;<br>
-BINFILE =3D &quot;ti_cgt_pru_${PV}_linux_installer_x86.bin&quot;<br>
&#43;BINFILE =3D &quot;ti_cgt_pru_${PV}_linux_installer:x86.bin&quot;<br>
&nbsp;BINFILE_NAME =3D &quot;cgt-pru-x86&quot;<br>
&nbsp;TI_BIN_UNPK_ARGS =3D &quot;--prefix ${S}&quot;<br>
&nbsp;TI_BIN_UNPK_CMDS =3D &quot;&quot;<br>
&nbsp;<br>
-BINFILE_class-target =3D &quot;ti_cgt_pru_${PV}_armlinuxa8hf_busybox_insta=
ller.sh&quot;<br>
-BINFILE_NAME_class-target =3D &quot;cgt-pru-arm&quot;<br>
&#43;BINFILE:class-target =3D &quot;ti_cgt_pru_${PV}:armlinuxa8hf_busybox_i=
nstaller.sh&quot;<br>
&#43;BINFILE_NAME:class-target =3D &quot;cgt-pru-arm&quot;<br>
&nbsp;<br>
&nbsp;SRC_URI =3D &quot;<a href=3D"http://software-dl.ti.com/codegen/esd/cg=
t_public_sw/PRU/${PV}/${BINFILE};name=3D${BINFILE_NAME}">http://software-dl=
.ti.com/codegen/esd/cgt_public_sw/PRU/${PV}/${BINFILE};name=3D${BINFILE_NAM=
E}</a>&quot;<br>
&nbsp;<br>
@@ -30,13 &#43;30,13 @@ do_install() {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${D}${TI_CGT_P=
RU_INSTALL_DIR_RECIPE}/<br>
&nbsp;}<br>
&nbsp;<br>
-do_install_class-target() {<br>
&#43;do_install:class-target() {<br>
&nbsp;&nbsp;&nbsp;&nbsp; ${WORKDIR}/${BINFILE} --prefix ${D}<br>
&nbsp;}<br>
&nbsp;<br>
-FILES_${PN} &#43;=3D &quot;${datadir}/ti/*&quot;<br>
&#43;FILES:${PN} &#43;=3D &quot;${datadir}/ti/*&quot;<br>
&nbsp;<br>
-FILES_${PN}-dbg =3D &quot;${TI_CGT_PRU_INSTALL_DIR_RECIPE}/bin/.debug \<br=
>
&#43;FILES:${PN}-dbg =3D &quot;${TI_CGT_PRU_INSTALL_DIR_RECIPE}/bin/.debug =
\<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${TI_CGT_PRU_INSTALL_DIR_RECIPE}/li=
b/.debug \<br>
&nbsp;&quot;<br>
&nbsp;<br>
@@ -44,6 &#43;44,6 @@ INHIBIT_PACKAGE_STRIP =3D &quot;1&quot;<br>
&nbsp;INHIBIT_SYSROOT_STRIP =3D &quot;1&quot;<br>
&nbsp;INHIBIT_PACKAGE_DEBUG_SPLIT =3D &quot;1&quot;<br>
&nbsp;<br>
-INSANE_SKIP_${PN} &#43;=3D &quot;arch staticdev already-stripped file-rdep=
s&quot;<br>
&#43;INSANE_SKIP:${PN} &#43;=3D &quot;arch staticdev already-stripped file-=
rdeps&quot;<br>
&nbsp;<br>
&nbsp;BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
diff --git a/recipes-ti/devtools/ti-cgt470.inc b/recipes-ti/devtools/ti-cgt=
470.inc<br>
index f0992aa7..c8f91271 100644<br>
--- a/recipes-ti/devtools/ti-cgt470.inc<br>
&#43;&#43;&#43; b/recipes-ti/devtools/ti-cgt470.inc<br>
@@ -13,7 &#43;13,7 @@ S =3D &quot;${WORKDIR}/cgt470_${PV}&quot;<br>
&nbsp;<br>
&nbsp;SRC_URI =3D &quot;<a href=3D"http://install.source.dir.local/ti_cgt_t=
ms470_${PVwithdots}_setup_linux_x86.bin;name=3Dcgt470bin">http://install.so=
urce.dir.local/ti_cgt_tms470_${PVwithdots}_setup_linux_x86.bin;name=3Dcgt47=
0bin</a>&quot;<br>
&nbsp;<br>
-BINFILE=3D&quot;ti_cgt_tms470_${PVwithdots}_setup_linux_x86.bin&quot;<br>
&#43;BINFILE=3D&quot;ti_cgt_tms470_${PVwithdots}_setup_linux:x86.bin&quot;<=
br>
&nbsp;TI_BIN_UNPK_CMDS=3D&quot;Y:qY:workdir: : &quot;<br>
&nbsp;TI_BIN_UNPK_WDEXT=3D&quot;/cgt470_${PV}&quot;<br>
&nbsp;<br>
diff --git a/recipes-ti/devtools/ti-cgt6x-7_7.4.16.bb b/recipes-ti/devtools=
/ti-cgt6x-7_7.4.16.bb<br>
index a67a2d8a..a7de8e38 100644<br>
--- a/recipes-ti/devtools/ti-cgt6x-7_7.4.16.bb<br>
&#43;&#43;&#43; b/recipes-ti/devtools/ti-cgt6x-7_7.4.16.bb<br>
@@ -28,16 &#43;28,16 @@ SRC_URI[cgt6x_7.4.16_x86_installer.sha256sum] =3D &=
quot;baa0d1ef20397383f99f45068a6d160<br>
&nbsp;<br>
&nbsp;# only x86_64 is supported<br>
&nbsp;COMPATIBLE_HOST =3D &quot;x86_64.*-linux&quot;<br>
-COMPATIBLE_HOST_class-target =3D &quot;null&quot;<br>
&#43;COMPATIBLE_HOST:class-target =3D &quot;null&quot;<br>
&nbsp;<br>
&nbsp;do_install() {<br>
&nbsp;&nbsp;&nbsp;&nbsp; install -d ${D}/${TI_CGT6X_7_INSTALL_DIR_RECIPE}<b=
r>
&nbsp;&nbsp;&nbsp;&nbsp; cp -rP --preserve=3Dmode,links,timestamps --no-pre=
serve=3Downership ${WORKDIR}/c6000_7.4.16/. ${D}/${TI_CGT6X_7_INSTALL_DIR_R=
ECIPE}<br>
&nbsp;}<br>
&nbsp;<br>
-FILES_${PN} &#43;=3D &quot;${TI_CGT6X_7_INSTALL_DIR_RECIPE}&quot;<br>
&#43;FILES:${PN} &#43;=3D &quot;${TI_CGT6X_7_INSTALL_DIR_RECIPE}&quot;<br>
&nbsp;<br>
-INSANE_SKIP_${PN} &#43;=3D &quot;arch staticdev textrel&quot;<br>
&#43;INSANE_SKIP:${PN} &#43;=3D &quot;arch staticdev textrel&quot;<br>
&nbsp;<br>
&nbsp;INHIBIT_PACKAGE_STRIP =3D &quot;1&quot;<br>
&nbsp;INHIBIT_SYSROOT_STRIP =3D &quot;1&quot;<br>
diff --git a/recipes-ti/devtools/ti-cgt6x_8.3.2.bb b/recipes-ti/devtools/ti=
-cgt6x_8.3.2.bb<br>
index 38f5597d..00221d84 100644<br>
--- a/recipes-ti/devtools/ti-cgt6x_8.3.2.bb<br>
&#43;&#43;&#43; b/recipes-ti/devtools/ti-cgt6x_8.3.2.bb<br>
@@ -3,13 &#43;3,13 @@ HOMEPAGE =3D &quot;<a href=3D""></a>https://www-a.ti.=
com/downloads/sds_support/TICodegenerationTools/dow<br>
&nbsp;LICENSE =3D &quot;(TI-TSPA &amp; Thai-Open-Source-Software-Center) &a=
mp; BSD-3-Clause &amp; BSL-1.0 &amp; Patrick-Powell &amp; AFL-3.0 &amp; MIT=
 &amp; BSD-2-Clause &amp; PD&quot;<br>
&nbsp;<br>
&nbsp;LIC_FILES_CHKSUM =3D &quot;<a href=3D"file://ti-cgt-c6000_${PV}/C6000=
CodeGenerationTools_8.3.x_manifest.html;md5=3Dd06c6f9acebf78df4108a8535396e=
9f1">file://ti-cgt-c6000_${PV}/C6000CodeGenerationTools_8.3.x_manifest.html=
;md5=3Dd06c6f9acebf78df4108a8535396e9f1</a>&quot;<br>
-LIC_FILES_CHKSUM_class-target =3D &quot;<a href=3D"file://usr/share/doc/ti=
/cgt-c6x/C6000CodeGenerationTools_8.3.x_manifest.html;md5=3Dd06c6f9acebf78d=
f4108a8535396e9f1">file://usr/share/doc/ti/cgt-c6x/C6000CodeGenerationTools=
_8.3.x_manifest.html;md5=3Dd06c6f9acebf78df4108a8535396e9f1</a>&quot;<br>
&#43;LIC_FILES_CHKSUM:class-target =3D &quot;<a href=3D"file://usr/share/do=
c/ti/cgt-c6x/C6000CodeGenerationTools_8.3.x_manifest.html;md5=3Dd06c6f9aceb=
f78df4108a8535396e9f1">file://usr/share/doc/ti/cgt-c6x/C6000CodeGenerationT=
ools_8.3.x_manifest.html;md5=3Dd06c6f9acebf78df4108a8535396e9f1</a>&quot;<b=
r>
&nbsp;<br>
&nbsp;PE =3D &quot;1&quot;<br>
&nbsp;<br>
&nbsp;require recipes-ti/includes/ti-unpack.inc<br>
&nbsp;<br>
-COMPATIBLE_HOST_class-target =3D &quot;arm.*-linux&quot;<br>
&#43;COMPATIBLE_HOST:class-target =3D &quot;arm.*-linux&quot;<br>
&nbsp;<br>
&nbsp;# For now we only have hardfp version for target class<br>
&nbsp;python __anonymous() {<br>
@@ -26,13 &#43;26,13 @@ python __anonymous() {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ra=
ise bb.parse.SkipPackage(&quot;%s-%s ONLY supports hardfp mode for now&quot=
; % (pkgn, pkgv))<br>
&nbsp;}<br>
&nbsp;<br>
-BINFILE =3D &quot;ti_cgt_c6000_${PV}_linux_installer_x86.bin&quot;<br>
-BINFILE_NAME =3D &quot;cgt6x_x86_installer&quot;<br>
&#43;BINFILE =3D &quot;ti_cgt_c6000_${PV}_linux_installer:x86.bin&quot;<br>
&#43;BINFILE_NAME =3D &quot;cgt6x:x86_installer&quot;<br>
&nbsp;TI_BIN_UNPK_ARGS =3D &quot;--prefix ${S}&quot;<br>
&nbsp;TI_BIN_UNPK_CMDS =3D &quot;&quot;<br>
&nbsp;<br>
-BINFILE_class-target =3D &quot;ti_cgt_c6000_${PV}_armlinuxa8hf_busybox_ins=
taller.sh&quot;<br>
-BINFILE_NAME_class-target =3D &quot;cgt6x_arm_installer&quot;<br>
&#43;BINFILE:class-target =3D &quot;ti_cgt_c6000_${PV}:armlinuxa8hf_busybox=
_installer.sh&quot;<br>
&#43;BINFILE_NAME:class-target =3D &quot;cgt6x:arm_installer&quot;<br>
&nbsp;<br>
&nbsp;SRC_URI =3D &quot;<a href=3D"http://software-dl.ti.com/codegen/esd/cg=
t_public_sw/C6000/${PV}/${BINFILE};name=3D${BINFILE_NAME}">http://software-=
dl.ti.com/codegen/esd/cgt_public_sw/C6000/${PV}/${BINFILE};name=3D${BINFILE=
_NAME}</a>&quot;<br>
&nbsp;<br>
@@ -91,17 &#43;91,17 @@ do_install() {<br>
&nbsp;<br>
&nbsp;}<br>
&nbsp;<br>
-do_install_class-target() {<br>
&#43;do_install:class-target() {<br>
&nbsp;&nbsp;&nbsp;&nbsp; ${WORKDIR}/${BINFILE} --prefix ${D}<br>
&nbsp;}<br>
&nbsp;<br>
-FILES_${PN} &#43;=3D &quot;${datadir}/ti/*&quot;<br>
&#43;FILES:${PN} &#43;=3D &quot;${datadir}/ti/*&quot;<br>
&nbsp;<br>
-FILES_${PN}-dbg &#43;=3D &quot;${datadir}/ti/cgt-c6x/bin/.debug&quot;<br>
&#43;FILES:${PN}-dbg &#43;=3D &quot;${datadir}/ti/cgt-c6x/bin/.debug&quot;<=
br>
&nbsp;<br>
-INSANE_SKIP_${PN} &#43;=3D &quot;staticdev&quot;<br>
&#43;INSANE_SKIP:${PN} &#43;=3D &quot;staticdev&quot;<br>
&nbsp;INHIBIT_PACKAGE_STRIP_FILES =3D &quot;${PKGD}${datadir}/ti/cgt-c6x/li=
b/libc.a&quot;<br>
&nbsp;<br>
&nbsp;BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
&nbsp;<br>
-COMPATIBLE_MACHINE_class-target =3D &quot;(ti-soc)&quot;<br>
&#43;COMPATIBLE_MACHINE:class-target =3D &quot;(ti-soc)&quot;<br>
diff --git a/recipes-ti/devtools/ti-cgt7x_1.2.0.bb b/recipes-ti/devtools/ti=
-cgt7x_1.2.0.bb<br>
index cbdac1ef..35b58d4c 100644<br>
--- a/recipes-ti/devtools/ti-cgt7x_1.2.0.bb<br>
&#43;&#43;&#43; b/recipes-ti/devtools/ti-cgt7x_1.2.0.bb<br>
@@ -15,12 &#43;15,12 @@ require recipes-ti/includes/ti-paths.inc<br>
&nbsp;<br>
&nbsp;# only x86_64 is supported<br>
&nbsp;COMPATIBLE_HOST =3D &quot;x86_64.*-linux&quot;<br>
-COMPATIBLE_HOST_class-target =3D &quot;null&quot;<br>
&#43;COMPATIBLE_HOST:class-target =3D &quot;null&quot;<br>
&nbsp;<br>
&nbsp;PE =3D &quot;1&quot;<br>
&nbsp;<br>
&nbsp;BINFILE =3D &quot;ti_cgt_c7000_${PV}.STS_linux_installer_x86.bin&quot=
;<br>
-BINFILE_NAME =3D &quot;cgt7x_x86_installer&quot;<br>
&#43;BINFILE_NAME =3D &quot;cgt7x:x86_installer&quot;<br>
&nbsp;<br>
&nbsp;SRC_URI =3D &quot;<a href=3D"http://software-dl.ti.com/codegen/esd/cg=
t_public_sw/C7000/${PV}.STS/${BINFILE};name=3D${BINFILE_NAME}">http://softw=
are-dl.ti.com/codegen/esd/cgt_public_sw/C7000/${PV}.STS/${BINFILE};name=3D$=
{BINFILE_NAME}</a>&quot;<br>
&nbsp;<br>
@@ -38,9 &#43;38,9 @@ do_install() {<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
-FILES_${PN} &#43;=3D &quot;${TI_CGT7X_INSTALL_DIR_RECIPE}&quot;<br>
&#43;FILES:${PN} &#43;=3D &quot;${TI_CGT7X_INSTALL_DIR_RECIPE}&quot;<br>
&nbsp;<br>
-INSANE_SKIP_${PN} &#43;=3D &quot;arch staticdev textrel&quot;<br>
&#43;INSANE_SKIP:${PN} &#43;=3D &quot;arch staticdev textrel&quot;<br>
&nbsp;<br>
&nbsp;INHIBIT_PACKAGE_STRIP =3D &quot;1&quot;<br>
&nbsp;INHIBIT_SYSROOT_STRIP =3D &quot;1&quot;<br>
diff --git a/recipes-ti/devtools/ti-xdctools-common.inc b/recipes-ti/devtoo=
ls/ti-xdctools-common.inc<br>
index c21e4794..e88331bd 100644<br>
--- a/recipes-ti/devtools/ti-xdctools-common.inc<br>
&#43;&#43;&#43; b/recipes-ti/devtools/ti-xdctools-common.inc<br>
@@ -13,14 &#43;13,14 @@ do_install() {<br>
&nbsp;&nbsp;&nbsp;&nbsp; cp ${CP_ARGS}&nbsp; ${S}/* ${D}${XDC_INSTALL_DIR_R=
ECIPE}<br>
&nbsp;}<br>
&nbsp;<br>
-FILES_${PN}-dev =3D &quot;${XDC_INSTALL_DIR_RECIPE}&quot;<br>
&#43;FILES:${PN}-dev =3D &quot;${XDC_INSTALL_DIR_RECIPE}&quot;<br>
&nbsp;<br>
&nbsp;BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
&nbsp;<br>
&nbsp;INHIBIT_PACKAGE_STRIP =3D &quot;1&quot;<br>
&nbsp;INHIBIT_SYSROOT_STRIP =3D &quot;1&quot;<br>
&nbsp;INHIBIT_PACKAGE_DEBUG_SPLIT =3D &quot;1&quot;<br>
-INSANE_SKIP_${PN}-dev =3D &quot;libdir dev-elf arch file-rdeps&quot;<br>
&#43;INSANE_SKIP:${PN}-dev =3D &quot;libdir dev-elf arch file-rdeps&quot;<b=
r>
&nbsp;<br>
&nbsp;# Prevent internal libs from getting picked up<br>
&nbsp;PRIVATE_LIBS =3D &quot; \<br>
@@ -66,5 &#43;66,5 @@ libawt_xawt.so \<br>
&nbsp;<br>
&nbsp;COMPATIBLE_HOST ?=3D &quot;null&quot;<br>
&nbsp;COMPATIBLE_HOST_ti-soc =3D &quot;(.*)&quot;<br>
-COMPATIBLE_HOST_class-native =3D &quot;(.*)&quot;<br>
-COMPATIBLE_HOST_class-nativesdk =3D &quot;(.*)&quot;<br>
&#43;COMPATIBLE_HOST:class-native =3D &quot;(.*)&quot;<br>
&#43;COMPATIBLE_HOST:class-nativesdk =3D &quot;(.*)&quot;<br>
diff --git a/recipes-ti/dmai/ti-dmai.inc b/recipes-ti/dmai/ti-dmai.inc<br>
index 50621184..0a690496 100644<br>
--- a/recipes-ti/dmai/ti-dmai.inc<br>
&#43;&#43;&#43; b/recipes-ti/dmai/ti-dmai.inc<br>
@@ -31,13 &#43;31,13 @@ SRC_URI =3D &quot;svn://gforge.ti.com/svn/dmai/;mod=
ule=3D${DMAIBRANCH};protocol=3Dhttps;use<br>
&nbsp;<br>
&nbsp;DEPENDS =3D &quot;virtual/kernel alsa-lib ti-framework-components ti-=
codec-engine ti-xdctools-native&quot;<br>
&nbsp;<br>
-DEPENDS_append_dm6446&nbsp;&nbsp; =3D &quot; ti-codecs-dm6446&nbsp;&nbsp; =
ti-dspbios ti-cgt6x ti-linuxutils&quot;<br>
-DEPENDS_append_dm6467&nbsp;&nbsp; =3D &quot; ti-codecs-dm6467&nbsp;&nbsp; =
ti-dspbios ti-cgt6x ti-linuxutils&quot;<br>
-DEPENDS_append_omap3&nbsp;&nbsp;&nbsp; =3D &quot; ti-codecs-omap3530 ti-ds=
pbios ti-cgt6x ti-linuxutils&quot;<br>
-DEPENDS_append_dm355&nbsp;&nbsp;&nbsp; =3D &quot; ti-codecs-dm355&quot;<br=
>
-DEPENDS_append_dm365&nbsp;&nbsp;&nbsp; =3D &quot; ti-codecs-dm365&quot;<br=
>
-DEPENDS_append_omapl137 =3D &quot; ti-codecs-omapl137 ti-dspbios ti-cgt6x =
ti-linuxutils&quot;<br>
-DEPENDS_append_omapl138 =3D &quot; ti-codecs-omapl138 ti-dspbios ti-cgt6x =
ti-linuxutils&quot;<br>
&#43;DEPENDS:append_dm6446&nbsp;&nbsp; =3D &quot; ti-codecs-dm6446&nbsp;&nb=
sp; ti-dspbios ti-cgt6x ti-linuxutils&quot;<br>
&#43;DEPENDS:append_dm6467&nbsp;&nbsp; =3D &quot; ti-codecs-dm6467&nbsp;&nb=
sp; ti-dspbios ti-cgt6x ti-linuxutils&quot;<br>
&#43;DEPENDS:append_omap3&nbsp;&nbsp;&nbsp; =3D &quot; ti-codecs-omap3530 t=
i-dspbios ti-cgt6x ti-linuxutils&quot;<br>
&#43;DEPENDS:append_dm355&nbsp;&nbsp;&nbsp; =3D &quot; ti-codecs-dm355&quot=
;<br>
&#43;DEPENDS:append_dm365&nbsp;&nbsp;&nbsp; =3D &quot; ti-codecs-dm365&quot=
;<br>
&#43;DEPENDS:append_omapl137 =3D &quot; ti-codecs-omapl137 ti-dspbios ti-cg=
t6x ti-linuxutils&quot;<br>
&#43;DEPENDS:append_omapl138 =3D &quot; ti-codecs-omapl138 ti-dspbios ti-cg=
t6x ti-linuxutils&quot;<br>
&nbsp;<br>
&nbsp;# Define DMAI build time variables<br>
&nbsp;DMAIPLATFORM_dm6446&nbsp;&nbsp;&nbsp; =3D &quot;dm6446_al&quot;<br>
@@ -145,18 &#43;145,18 @@ do_install () {<br>
&nbsp;PACKAGE_ARCH =3D &quot;${MACHINE_ARCH}&quot;<br>
&nbsp;<br>
&nbsp;PACKAGES &#43;=3D &quot;ti-dmai-apps&quot;<br>
-FILES_ti-dmai-apps =3D &quot;${installdir}/ti-dmai-apps/*&quot;<br>
-INSANE_SKIP_ti-dmai-apps =3D &quot;1&quot;<br>
-<br>
-RDEPENDS_ti-dmai-apps_dm6446&nbsp;&nbsp;&nbsp; &#43;=3D &quot;ti-codecs-dm=
6446-server&nbsp;&nbsp; ti-cmem-module ti-dsplink-module&quot;<br>
-RDEPENDS_ti-dmai-apps_dm6467&nbsp;&nbsp;&nbsp; &#43;=3D &quot;ti-codecs-dm=
6467&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ti-cmem-module t=
i-dsplink-module&quot;<br>
-RDEPENDS_ti-dmai-apps_omap3&nbsp;&nbsp;&nbsp;&nbsp; &#43;=3D &quot;ti-code=
cs-omap3530-server ti-cmem-module ti-dsplink-module ti-lpm-module ti-sdma-m=
odule&quot;<br>
-RDEPENDS_ti-dmai-apps_dm355&nbsp;&nbsp;&nbsp;&nbsp; &#43;=3D &quot;ti-code=
cs-dm355&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ti-cme=
m-module ti-dm355mm-module&quot;<br>
-RDEPENDS_ti-dmai-apps_dm365&nbsp;&nbsp;&nbsp;&nbsp; &#43;=3D &quot;ti-code=
cs-dm365&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ti-cme=
m-module ti-dm365mm-module ti-edma-module ti-irq-module&quot;<br>
-RDEPENDS_ti-dmai-apps_omapl137&nbsp; &#43;=3D &quot;ti-codecs-omapl137-ser=
ver ti-cmem-module ti-dsplink-module&quot;<br>
-RDEPENDS_ti-dmai-apps_omapl138&nbsp; &#43;=3D &quot;ti-codecs-omapl138-ser=
ver ti-cmem-module ti-dsplink-module&quot;<br>
-<br>
-pkg_postinst_ti-dmai-apps () {<br>
&#43;FILES:ti-dmai-apps =3D &quot;${installdir}/ti-dmai-apps/*&quot;<br>
&#43;INSANE_SKIP:ti-dmai-apps =3D &quot;1&quot;<br>
&#43;<br>
&#43;RDEPENDS:ti-dmai-apps_dm6446&nbsp;&nbsp;&nbsp; &#43;=3D &quot;ti-codec=
s-dm6446-server&nbsp;&nbsp; ti-cmem-module ti-dsplink-module&quot;<br>
&#43;RDEPENDS:ti-dmai-apps_dm6467&nbsp;&nbsp;&nbsp; &#43;=3D &quot;ti-codec=
s-dm6467&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ti-cmem-modu=
le ti-dsplink-module&quot;<br>
&#43;RDEPENDS:ti-dmai-apps_omap3&nbsp;&nbsp;&nbsp;&nbsp; &#43;=3D &quot;ti-=
codecs-omap3530-server ti-cmem-module ti-dsplink-module ti-lpm-module ti-sd=
ma-module&quot;<br>
&#43;RDEPENDS:ti-dmai-apps_dm355&nbsp;&nbsp;&nbsp;&nbsp; &#43;=3D &quot;ti-=
codecs-dm355&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ti=
-cmem-module ti-dm355mm-module&quot;<br>
&#43;RDEPENDS:ti-dmai-apps_dm365&nbsp;&nbsp;&nbsp;&nbsp; &#43;=3D &quot;ti-=
codecs-dm365&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ti=
-cmem-module ti-dm365mm-module ti-edma-module ti-irq-module&quot;<br>
&#43;RDEPENDS:ti-dmai-apps_omapl137&nbsp; &#43;=3D &quot;ti-codecs-omapl137=
-server ti-cmem-module ti-dsplink-module&quot;<br>
&#43;RDEPENDS:ti-dmai-apps_omapl138&nbsp; &#43;=3D &quot;ti-codecs-omapl138=
-server ti-cmem-module ti-dsplink-module&quot;<br>
&#43;<br>
&#43;pkg_postinst:ti-dmai-apps () {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ln -sf ${installdir}/ti-co=
decs-server/*.${DSPSUFFIX} ${installdir}/ti-dmai-apps/<br>
&nbsp;}<br>
&nbsp;<br>
diff --git a/recipes-ti/dmai/ti-dmai_svn.bb b/recipes-ti/dmai/ti-dmai_svn.b=
b<br>
index 3cc54b91..a9bd9f82 100644<br>
--- a/recipes-ti/dmai/ti-dmai_svn.bb<br>
&#43;&#43;&#43; b/recipes-ti/dmai/ti-dmai_svn.bb<br>
@@ -12,7 &#43;12,7 @@ LIC_FILES_CHKSUM =3D &quot;<a href=3D""></a>file://dm=
ai_${PV}_License.html;md5=3D3302f728a5a42f97cabc26a54<br>
&nbsp;<br>
&nbsp;# This package has high dependence on kernel, use kernel PR as base a=
nd append a local version<br>
&nbsp;PR =3D &quot;${MACHINE_KERNEL_PR}&quot;<br>
-PR_append =3D &quot;p&quot;<br>
&#43;PR:append =3D &quot;p&quot;<br>
&nbsp;<br>
&nbsp;DMAIBRANCH_dm6446&nbsp;&nbsp;&nbsp;&nbsp; =3D &quot;trunk&quot;<br>
&nbsp;DMAIBRANCH_dm6467&nbsp;&nbsp;&nbsp;&nbsp; =3D &quot;branches/GITPSP_I=
NT_101009&quot;<br>
@@ -32,12 &#43;32,12 @@ SRCREV_omapl137&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 =3D &quot;482&quot;<br>
&nbsp;SRCREV_omapl138&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D &quot;570&quo=
t;<br>
&nbsp;SRCREV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; ?=3D &quot;UNDEFINED_SRCREV&quot;<br>
&nbsp;<br>
-SRC_URI_append =3D &quot; <a href=3D"file://omap3530-r642-remove-include-v=
ideodev.diff;striplevel=3D3">
file://omap3530-r642-remove-include-videodev.diff;striplevel=3D3</a> \<br>
&#43;SRC_URI:append =3D &quot; <a href=3D"file://omap3530-r642-remove-inclu=
de-videodev.diff;striplevel=3D3">
file://omap3530-r642-remove-include-videodev.diff;striplevel=3D3</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file://r642-fix-config-b=
ld.diff;striplevel=3D3">file://r642-fix-config-bld.diff;striplevel=3D3</a> =
\<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file://remove-unneeded-i=
ncludes.patch">file://remove-unneeded-includes.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;<br>
&nbsp;<br>
-INSANE_SKIP_${PN} =3D &quot;installed-vs-shipped&quot;<br>
&#43;INSANE_SKIP:${PN} =3D &quot;installed-vs-shipped&quot;<br>
&nbsp;<br>
&nbsp;COMPATIBLE_HOST ?=3D &quot;null&quot;<br>
&nbsp;COMPATIBLE_HOST_ti-soc =3D &quot;(.*)&quot;<br>
diff --git a/recipes-ti/dsplib/dsplib.inc b/recipes-ti/dsplib/dsplib.inc<br=
>
index 111d83cb..a248905d 100644<br>
--- a/recipes-ti/dsplib/dsplib.inc<br>
&#43;&#43;&#43; b/recipes-ti/dsplib/dsplib.inc<br>
@@ -35,7 &#43;35,7 @@ export SWTOOLS_PATH =3D &quot;${SWTOOLS_INSTALL_DIR}/=
ti/mas/swtools&quot;<br>
&nbsp;export XDCBUILDCFG=3D&quot;${SWTOOLS_PATH}/config.bld&quot;<br>
&nbsp;export INCDIR=3D&quot;${MATHLIB_INSTALL_DIR}/&quot;<br>
&nbsp;<br>
-PATH_append =3D &quot;:${XDC_INSTALL_DIR}&quot;<br>
&#43;PATH:append =3D &quot;:${XDC_INSTALL_DIR}&quot;<br>
&nbsp;<br>
&nbsp;XDCPATH.=3D&quot;${XDCCGROOT}/include;${XDC_INSTALL_DIR}/packages;${S=
YSBIOS_INSTALL_DIR}/packages;&quot;<br>
&nbsp;XDCPATH.=3D&quot;${SWTOOLS_INSTALL_DIR};${MATHLIB_INSTALL_DIR};${DSPL=
IB_WORK_DIR};&quot;<br>
@@ -70,9 &#43;70,9 @@ do_deploy() {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rm -r ./${DSPLIB_PACKAGE_N=
AME}<br>
&nbsp;}<br>
&nbsp;<br>
-ALLOW_EMPTY_${PN} =3D &quot;1&quot;<br>
-FILES_${PN}-dev &#43;=3D &quot;${DSPLIB_INSTALL_DIR_RECIPE}&quot;<br>
&#43;ALLOW_EMPTY:${PN} =3D &quot;1&quot;<br>
&#43;FILES:${PN}-dev &#43;=3D &quot;${DSPLIB_INSTALL_DIR_RECIPE}&quot;<br>
&nbsp;<br>
-INSANE_SKIP_${PN}-dev =3D &quot;arch&quot;<br>
&#43;INSANE_SKIP:${PN}-dev =3D &quot;arch&quot;<br>
&nbsp;COMPATIBLE_HOST ?=3D &quot;null&quot;<br>
&nbsp;COMPATIBLE_HOST_ti-soc =3D &quot;(.*)&quot;<br>
diff --git a/recipes-ti/framework-components/ti-framework-components.inc b/=
recipes-ti/framework-components/ti-framework-components.inc<br>
index ca152328..e8b7c414 100644<br>
--- a/recipes-ti/framework-components/ti-framework-components.inc<br>
&#43;&#43;&#43; b/recipes-ti/framework-components/ti-framework-components.i=
nc<br>
@@ -15,7 &#43;15,7 @@ do_install() {<br>
&nbsp;&nbsp;&nbsp;&nbsp; cp ${CP_ARGS} ${S}/* ${D}${FC_INSTALL_DIR_RECIPE}<=
br>
&nbsp;}<br>
&nbsp;<br>
-INSANE_SKIP_${PN} =3D &quot;ldflags&quot;<br>
&#43;INSANE_SKIP:${PN} =3D &quot;ldflags&quot;<br>
&nbsp;<br>
-ALLOW_EMPTY_${PN} =3D &quot;1&quot;<br>
-FILES_${PN}-dev &#43;=3D &quot;${FC_INSTALL_DIR_RECIPE}&quot;<br>
&#43;ALLOW_EMPTY:${PN} =3D &quot;1&quot;<br>
&#43;FILES:${PN}-dev &#43;=3D &quot;${FC_INSTALL_DIR_RECIPE}&quot;<br>
diff --git a/recipes-ti/imglib/imglib-c66x.inc b/recipes-ti/imglib/imglib-c=
66x.inc<br>
index 164bf41d..82fea284 100644<br>
--- a/recipes-ti/imglib/imglib-c66x.inc<br>
&#43;&#43;&#43; b/recipes-ti/imglib/imglib-c66x.inc<br>
@@ -23,12 &#43;23,12 @@ do_install() {<br>
&nbsp;&nbsp;&nbsp;&nbsp; cp ${CP_ARGS} ${S}/* ${D}${IMGLIB_C66_INSTALL_DIR_=
RECIPE}<br>
&nbsp;}<br>
&nbsp;<br>
-ALLOW_EMPTY_${PN} =3D &quot;1&quot;<br>
-FILES_${PN}-dev &#43;=3D &quot;${IMGLIB_C66_INSTALL_DIR_RECIPE}&quot;<br>
&#43;ALLOW_EMPTY:${PN} =3D &quot;1&quot;<br>
&#43;FILES:${PN}-dev &#43;=3D &quot;${IMGLIB_C66_INSTALL_DIR_RECIPE}&quot;<=
br>
&nbsp;<br>
&nbsp;INHIBIT_PACKAGE_STRIP =3D &quot;1&quot;<br>
&nbsp;INHIBIT_SYSROOT_STRIP =3D &quot;1&quot;<br>
&nbsp;INHIBIT_PACKAGE_DEBUG_SPLIT =3D &quot;1&quot;<br>
&nbsp;<br>
-RDEPENDS_${PN}-dev &#43;=3D &quot;perl&quot;<br>
-INSANE_SKIP_${PN}-dev =3D &quot;arch&quot;<br>
&#43;RDEPENDS:${PN}-dev &#43;=3D &quot;perl&quot;<br>
&#43;INSANE_SKIP:${PN}-dev =3D &quot;arch&quot;<br>
diff --git a/recipes-ti/includes/ti-staging.inc b/recipes-ti/includes/ti-st=
aging.inc<br>
index b5888055..f18d017c 100644<br>
--- a/recipes-ti/includes/ti-staging.inc<br>
&#43;&#43;&#43; b/recipes-ti/includes/ti-staging.inc<br>
@@ -1,6 &#43;1,6 @@<br>
&nbsp;INHIBIT_PACKAGE_STRIP =3D &quot;1&quot;<br>
&nbsp;<br>
-ALLOW_EMPTY_${PN} =3D &quot;1&quot;<br>
-ALLOW_EMPTY_${PN}-dev =3D &quot;1&quot;<br>
&#43;ALLOW_EMPTY:${PN} =3D &quot;1&quot;<br>
&#43;ALLOW_EMPTY:${PN}-dev =3D &quot;1&quot;<br>
&nbsp;<br>
&nbsp;<br>
diff --git a/recipes-ti/includes/ti-unpack.inc b/recipes-ti/includes/ti-unp=
ack.inc<br>
index 828f3d5a..63b8cd75 100644<br>
--- a/recipes-ti/includes/ti-unpack.inc<br>
&#43;&#43;&#43; b/recipes-ti/includes/ti-unpack.inc<br>
@@ -79,5 &#43;79,5 @@ python ti_bin_do_unpack() {<br>
&nbsp;<br>
&nbsp;COMPATIBLE_HOST ?=3D &quot;null&quot;<br>
&nbsp;COMPATIBLE_HOST_ti-soc =3D &quot;(.*)&quot;<br>
-COMPATIBLE_HOST_class-native =3D &quot;(.*)&quot;<br>
-COMPATIBLE_HOST_class-nativesdk =3D &quot;(.*)&quot;<br>
&#43;COMPATIBLE_HOST:class-native =3D &quot;(.*)&quot;<br>
&#43;COMPATIBLE_HOST:class-nativesdk =3D &quot;(.*)&quot;<br>
diff --git a/recipes-ti/ipc/ipc-transport-common-rtos_git.bb b/recipes-ti/i=
pc/ipc-transport-common-rtos_git.bb<br>
index 6fec0f0d..ade78022 100644<br>
--- a/recipes-ti/ipc/ipc-transport-common-rtos_git.bb<br>
&#43;&#43;&#43; b/recipes-ti/ipc/ipc-transport-common-rtos_git.bb<br>
@@ -20,4 &#43;20,4 @@ do_install () {<br>
&nbsp;&nbsp;&nbsp;&nbsp; cp -r ${S} ${D}${PDK_INSTALL_DIR_RECIPE}/packages/=
ti/transport/ipc/c66<br>
&nbsp;}<br>
&nbsp;<br>
-FILES_${PN} &#43;=3D &quot;${PDK_INSTALL_DIR_RECIPE}/packages/ti/transport=
/ipc/c66/example/*&quot;<br>
&#43;FILES:${PN} &#43;=3D &quot;${PDK_INSTALL_DIR_RECIPE}/packages/ti/trans=
port/ipc/c66/example/*&quot;<br>
diff --git a/recipes-ti/ipc/ipc-transport-qmss-rtos_git.bb b/recipes-ti/ipc=
/ipc-transport-qmss-rtos_git.bb<br>
index 6655ab7e..2dffc11e 100644<br>
--- a/recipes-ti/ipc/ipc-transport-qmss-rtos_git.bb<br>
&#43;&#43;&#43; b/recipes-ti/ipc/ipc-transport-qmss-rtos_git.bb<br>
@@ -9,7 &#43;9,7 @@ COMPATIBLE_MACHINE =3D &quot;k2hk|k2l|k2e&quot;<br>
&nbsp;<br>
&nbsp;PACKAGE_ARCH =3D &quot;${MACHINE_ARCH}&quot;<br>
&nbsp;<br>
-DEPENDS_append =3D &quot; qmss-lld-rtos \<br>
&#43;DEPENDS:append =3D &quot; qmss-lld-rtos \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cppi-lld-rtos \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ti-ipc-rtos \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ipc-transport-common-rtos \<br>
@@ -20,4 &#43;20,4 @@ IPC_TRANSPORT_QMSS_DESTSUFFIX =3D &quot;git/c66/qmss&=
quot;<br>
&nbsp;S =3D &quot;${WORKDIR}/${IPC_TRANSPORT_QMSS_DESTSUFFIX}&quot;<br>
&nbsp;<br>
&nbsp;export IPC_INSTALL_PATH =3D &quot;${IPC_INSTALL_DIR}&quot;<br>
-XDCPATH_append =3D &quot;;${IPC_INSTALL_DIR}/packages&quot;<br>
&#43;XDCPATH:append =3D &quot;;${IPC_INSTALL_DIR}/packages&quot;<br>
diff --git a/recipes-ti/ipc/ipc-transport-qmss.inc b/recipes-ti/ipc/ipc-tra=
nsport-qmss.inc<br>
index f029656e..04705269 100644<br>
--- a/recipes-ti/ipc/ipc-transport-qmss.inc<br>
&#43;&#43;&#43; b/recipes-ti/ipc/ipc-transport-qmss.inc<br>
@@ -3,7 &#43;3,7 @@ LICENSE =3D &quot;BSD-3-Clause&quot;<br>
&nbsp;<br>
&nbsp;require ipc-transport.inc<br>
&nbsp;<br>
-INC_PR_append =3D &quot;.1&quot;<br>
&#43;INC_PR:append =3D &quot;.1&quot;<br>
&nbsp;<br>
&nbsp;LIC_FILES_CHKSUM =3D &quot;<a href=3D"file://COPYING.txt;md5=3D27bb0d=
eb260c60120a8d7b91da7c3b02">file://COPYING.txt;md5=3D27bb0deb260c60120a8d7b=
91da7c3b02</a>&quot;<br>
&nbsp;<br>
diff --git a/recipes-ti/ipc/ipc-transport-srio-rtos_git.bb b/recipes-ti/ipc=
/ipc-transport-srio-rtos_git.bb<br>
index 3f96598f..52720916 100644<br>
--- a/recipes-ti/ipc/ipc-transport-srio-rtos_git.bb<br>
&#43;&#43;&#43; b/recipes-ti/ipc/ipc-transport-srio-rtos_git.bb<br>
@@ -7,7 &#43;7,7 @@ LIC_FILES_CHKSUM =3D &quot;<a href=3D""></a>file://Tran=
sportSrio.xdc;beginline=3D1;endline=3D35;md5=3D4d466471<br>
&nbsp;<br>
&nbsp;COMPATIBLE_MACHINE =3D &quot;k2hk&quot;<br>
&nbsp;<br>
-DEPENDS_append =3D &quot; qmss-lld-rtos \<br>
&#43;DEPENDS:append =3D &quot; qmss-lld-rtos \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cppi-lld-rtos \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; srio-lld-rtos \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ti-ipc-rtos \<br>
@@ -19,4 &#43;19,4 @@ IPC_TRANSPORT_SRIO_DESTSUFFIX =3D &quot;git/c66/srio&=
quot;<br>
&nbsp;S =3D &quot;${WORKDIR}/${IPC_TRANSPORT_SRIO_DESTSUFFIX}&quot;<br>
&nbsp;<br>
&nbsp;export IPC_INSTALL_PATH =3D &quot;${IPC_INSTALL_DIR}&quot;<br>
-XDCPATH_append =3D &quot;;${IPC_INSTALL_DIR}/packages&quot;<br>
&#43;XDCPATH:append =3D &quot;;${IPC_INSTALL_DIR}/packages&quot;<br>
diff --git a/recipes-ti/ipc/ipc-transport-srio.inc b/recipes-ti/ipc/ipc-tra=
nsport-srio.inc<br>
index 6c477388..89425703 100644<br>
--- a/recipes-ti/ipc/ipc-transport-srio.inc<br>
&#43;&#43;&#43; b/recipes-ti/ipc/ipc-transport-srio.inc<br>
@@ -3,7 &#43;3,7 @@ LICENSE =3D &quot;BSD-3-Clause&quot;<br>
&nbsp;<br>
&nbsp;require ipc-transport.inc<br>
&nbsp;<br>
-INC_PR_append =3D &quot;.1&quot;<br>
&#43;INC_PR:append =3D &quot;.1&quot;<br>
&nbsp;<br>
&nbsp;LIC_FILES_CHKSUM =3D &quot;<a href=3D"file://COPYING.txt;md5=3D27bb0d=
eb260c60120a8d7b91da7c3b02">file://COPYING.txt;md5=3D27bb0deb260c60120a8d7b=
91da7c3b02</a>&quot;<br>
&nbsp;<br>
diff --git a/recipes-ti/ipc/ti-ipc-examples-linux_git.bb b/recipes-ti/ipc/t=
i-ipc-examples-linux_git.bb<br>
index ab479556..81706592 100644<br>
--- a/recipes-ti/ipc/ti-ipc-examples-linux_git.bb<br>
&#43;&#43;&#43; b/recipes-ti/ipc/ti-ipc-examples-linux_git.bb<br>
@@ -5,7 &#43;5,7 @@ SRC_URI &#43;=3D &quot;<a href=3D""></a>file://0001-exa=
mples-ClusterMgr-sys_errlist-has-been-deprecated-.pat<br>
&nbsp;<br>
&nbsp;DEPENDS =3D &quot;ti-ipc ti-xdctools-native ti-sysbios ti-ipc-rtos zi=
p-native&quot;<br>
&nbsp;<br>
-do_compile_append() {<br>
&#43;do_compile:append() {<br>
&nbsp;<br>
&nbsp;&nbsp; if [&nbsp; &quot;${PLATFORM}&quot; !=3D &quot;UNKNOWN&quot; ];=
 then<br>
&nbsp;&nbsp;&nbsp;&nbsp; oe_runmake extract HOSTOS=3D&quot;linux&quot; IPC_=
INSTALL_DIR=3D&quot;${IPC_INSTALL_DIR}&quot;<br>
@@ -27,7 &#43;27,7 @@ do_compile_append() {<br>
&nbsp;&nbsp; fi<br>
&nbsp;}<br>
&nbsp;<br>
-do_install_append() {<br>
&#43;do_install:append() {<br>
&nbsp;&nbsp; cd ${S_ipc-examples}/src<br>
&nbsp;<br>
&nbsp;&nbsp; if [&nbsp; &quot;${PLATFORM}&quot; !=3D &quot;UNKNOWN&quot; ];=
 then<br>
@@ -46,4 &#43;46,4 @@ do_install_append() {<br>
&nbsp;&nbsp; fi<br>
&nbsp;}<br>
&nbsp;<br>
-FILES_${PN} &#43;=3D &quot;${bindir}/*&quot;<br>
&#43;FILES:${PN} &#43;=3D &quot;${bindir}/*&quot;<br>
diff --git a/recipes-ti/ipc/ti-ipc-examples.inc b/recipes-ti/ipc/ti-ipc-exa=
mples.inc<br>
index 022b13f0..66cd5d32 100644<br>
--- a/recipes-ti/ipc/ti-ipc-examples.inc<br>
&#43;&#43;&#43; b/recipes-ti/ipc/ti-ipc-examples.inc<br>
@@ -5,9 &#43;5,9 @@ require ti-ipc-rtos.inc<br>
&nbsp;LICENSE =3D &quot;BSD&quot;<br>
&nbsp;LIC_FILES_CHKSUM =3D &quot;<a href=3D"file://${S_ipc-examples}/src/ma=
kefile;beginline=3D1;endline=3D30;md5=3Da52324bd5033bb49ea07bade1244ac9a">f=
ile://${S_ipc-examples}/src/makefile;beginline=3D1;endline=3D30;md5=3Da5232=
4bd5033bb49ea07bade1244ac9a</a>&quot;<br>
&nbsp;<br>
-INSANE_SKIP_${PN} &#43;=3D &quot;arch&quot;<br>
&#43;INSANE_SKIP:${PN} &#43;=3D &quot;arch&quot;<br>
&nbsp;<br>
-ALLOW_EMPTY_${PN} =3D &quot;1&quot;<br>
&#43;ALLOW_EMPTY:${PN} =3D &quot;1&quot;<br>
&nbsp;<br>
&nbsp;IPC_INSTALL_DIR =3D &quot;${STAGING_DIR_TARGET}/usr/share/ti/ti-ipc-t=
ree&quot;<br>
&nbsp;<br>
diff --git a/recipes-ti/ipc/ti-ipc-examples_git.bb b/recipes-ti/ipc/ti-ipc-=
examples_git.bb<br>
index c46e5c81..bcc8674e 100644<br>
--- a/recipes-ti/ipc/ti-ipc-examples_git.bb<br>
&#43;&#43;&#43; b/recipes-ti/ipc/ti-ipc-examples_git.bb<br>
@@ -3,7 &#43;3,7 @@ require ti-ipc-examples.inc<br>
&nbsp;<br>
&nbsp;DEPENDS =3D &quot;ti-ipc ti-xdctools-native ti-sysbios ti-ipc-rtos zi=
p-native&quot;<br>
&nbsp;<br>
-do_compile_append() {<br>
&#43;do_compile:append() {<br>
&nbsp;<br>
&nbsp;&nbsp; if [&nbsp; &quot;${PLATFORM}&quot; !=3D &quot;UNKNOWN&quot; ];=
 then<br>
&nbsp;&nbsp;&nbsp;&nbsp; oe_runmake extract HOSTOS=3D&quot;bios&quot; IPC_I=
NSTALL_DIR=3D&quot;${IPC_INSTALL_DIR}&quot;<br>
@@ -21,7 &#43;21,7 @@ do_compile_append() {<br>
&nbsp;&nbsp; fi<br>
&nbsp;}<br>
&nbsp;<br>
-do_install_append() {<br>
&#43;do_install:append() {<br>
&nbsp;&nbsp; if [&nbsp; &quot;${PLATFORM}&quot; !=3D &quot;UNKNOWN&quot; ];=
 then<br>
&nbsp;&nbsp;&nbsp;&nbsp; # Install directory for bios examples<br>
&nbsp;&nbsp;&nbsp;&nbsp; install -d ${D}/ipc_${IPC_VERSION}/examples/bios<b=
r>
@@ -41,4 &#43;41,4 @@ do_install_append() {<br>
&nbsp;&nbsp; fi<br>
&nbsp;}<br>
&nbsp;<br>
-FILES_${PN} &#43;=3D &quot;ipc_*&quot;<br>
&#43;FILES:${PN} &#43;=3D &quot;ipc_*&quot;<br>
diff --git a/recipes-ti/ipc/ti-ipc-rtos.inc b/recipes-ti/ipc/ti-ipc-rtos.in=
c<br>
index b6b7892f..e64f9dcf 100644<br>
--- a/recipes-ti/ipc/ti-ipc-rtos.inc<br>
&#43;&#43;&#43; b/recipes-ti/ipc/ti-ipc-rtos.inc<br>
@@ -41,16 &#43;41,16 @@ RELEASE_SUFFIX =3D &quot;&quot;<br>
&nbsp;<br>
&nbsp;PR =3D &quot;${INC_PR}.r0&quot;<br>
&nbsp;<br>
-DEPENDS_append_keystone =3D &quot; ti-cgt6x-native \<br>
&#43;DEPENDS:append_keystone =3D &quot; ti-cgt6x-native \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; gcc-arm-baremetal-native \<br>
&nbsp;&quot;<br>
-DEPENDS_append_omap-a15 =3D &quot; ti-cgt6x-native \<br>
&#43;DEPENDS:append_omap-a15 =3D &quot; ti-cgt6x-native \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; ti-cgt-arm-native \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; gcc-arm-baremetal-native \<br>
&nbsp;&quot;<br>
-DEPENDS_append_omapl138 =3D &quot; ti-cgt6x-native \<br>
&#43;DEPENDS:append_omapl138 =3D &quot; ti-cgt6x-native \<br>
&nbsp;&quot;<br>
-DEPENDS_append_c66x =3D &quot; ti-cgt6x-native \<br>
&#43;DEPENDS:append_c66x =3D &quot; ti-cgt6x-native \<br>
&nbsp;&quot;<br>
&nbsp;<br>
&nbsp;IPC_TARGETS =3D &quot;&quot;<br>
diff --git a/recipes-ti/ipc/ti-ipc-rtos_git.bb b/recipes-ti/ipc/ti-ipc-rtos=
_git.bb<br>
index b292d677..080d8c24 100644<br>
--- a/recipes-ti/ipc/ti-ipc-rtos_git.bb<br>
&#43;&#43;&#43; b/recipes-ti/ipc/ti-ipc-rtos_git.bb<br>
@@ -5,13 &#43;5,13 @@ require ti-ipc-rtos.inc<br>
&nbsp;DEPENDS =3D &quot;ti-xdctools-native ti-sysbios doxygen-native zip-na=
tive&quot;<br>
&nbsp;<br>
&nbsp;PACKAGES =3D&#43; &quot;${PN}-fw&quot;<br>
-FILES_${PN}-fw =3D &quot;${base_libdir}/firmware/*&quot;<br>
-FILES_${PN}-dev &#43;=3D &quot;${IPC_INSTALL_DIR_RECIPE}&quot;<br>
&#43;FILES:${PN}-fw =3D &quot;${base_libdir}/firmware/*&quot;<br>
&#43;FILES:${PN}-dev &#43;=3D &quot;${IPC_INSTALL_DIR_RECIPE}&quot;<br>
&nbsp;<br>
-INSANE_SKIP_${PN}-fw &#43;=3D &quot;arch&quot;<br>
-INSANE_SKIP_${PN}-dev &#43;=3D &quot;arch&quot;<br>
&#43;INSANE_SKIP:${PN}-fw &#43;=3D &quot;arch&quot;<br>
&#43;INSANE_SKIP:${PN}-dev &#43;=3D &quot;arch&quot;<br>
&nbsp;<br>
-ALLOW_EMPTY_${PN} =3D &quot;1&quot;<br>
&#43;ALLOW_EMPTY:${PN} =3D &quot;1&quot;<br>
&nbsp;<br>
&nbsp;IPC_PACKAGE_DIR =3D &quot;${S}/ipc-package&quot;<br>
&nbsp;<br>
@@ -85,7 &#43;85,7 @@ KFPLAT_k2g =3D &quot;TCI66AK2G02&quot;<br>
&nbsp;<br>
&nbsp;ALTERNATIVE_PRIORITY =3D &quot;5&quot;<br>
&nbsp;<br>
-pkg_postinst_${PN}-fw_keystone () {<br>
&#43;pkg_postinst:${PN}-fw_keystone () {<br>
&nbsp;&nbsp; i=3D0<br>
&nbsp;&nbsp; while [ $i -lt ${KFDSPNUM} ]; do<br>
&nbsp;&nbsp;&nbsp;&nbsp; update-alternatives --install /lib/firmware/keysto=
ne-dsp$i-fw keystone-dsp$i-fw ipc/ti_platforms_evm${KFPLAT}_core0/messageq_=
single.xe66 ${ALTERNATIVE_PRIORITY}<br>
@@ -93,7 &#43;93,7 @@ pkg_postinst_${PN}-fw_keystone () {<br>
&nbsp;&nbsp; done<br>
&nbsp;}<br>
&nbsp;<br>
-pkg_postrm_${PN}-fw_keystone () {<br>
&#43;pkg_postrm:${PN}-fw_keystone () {<br>
&nbsp;&nbsp; i=3D0<br>
&nbsp;&nbsp; while [ $i -lt ${KFDSPNUM} ]; do<br>
&nbsp;&nbsp;&nbsp;&nbsp; update-alternatives --remove keystone-dsp$i-fw ipc=
/ti_platforms_evm${KFPLAT}_core0/messageq_single.xe66<br>
@@ -101,24 &#43;101,24 @@ pkg_postrm_${PN}-fw_keystone () {<br>
&nbsp;&nbsp; done<br>
&nbsp;}<br>
&nbsp;<br>
-pkg_postinst_${PN}-fw_omap-a15 () {<br>
&#43;pkg_postinst:${PN}-fw_omap-a15 () {<br>
&nbsp;&nbsp; update-alternatives --install /lib/firmware/dra7-dsp1-fw.xe66 =
dra7-dsp1-fw.xe66 ipc/ti_platforms_evmDRA7XX_dsp1/test_omx_dsp1_vayu.xe66 $=
{ALTERNATIVE_PRIORITY}<br>
&nbsp;&nbsp; update-alternatives --install /lib/firmware/dra7-dsp2-fw.xe66 =
dra7-dsp2-fw.xe66 ipc/ti_platforms_evmDRA7XX_dsp2/test_omx_dsp2_vayu.xe66 $=
{ALTERNATIVE_PRIORITY}<br>
&nbsp;&nbsp; update-alternatives --install /lib/firmware/dra7-ipu1-fw.xem4 =
dra7-ipu1-fw.xem4 ipc/ti_platforms_evmDRA7XX_ipu1/test_omx_ipu1_vayu.xem4 $=
{ALTERNATIVE_PRIORITY}<br>
&nbsp;&nbsp; update-alternatives --install /lib/firmware/dra7-ipu2-fw.xem4 =
dra7-ipu2-fw.xem4 ipc/ti_platforms_evmDRA7XX_ipu2/test_omx_ipu2_vayu.xem4 $=
{ALTERNATIVE_PRIORITY}<br>
&nbsp;}<br>
&nbsp;<br>
-pkg_postrm_${PN}-fw_omap-a15 () {<br>
&#43;pkg_postrm:${PN}-fw_omap-a15 () {<br>
&nbsp;&nbsp; update-alternatives --remove dra7-dsp1-fw.xe66 ipc/ti_platform=
s_evmDRA7XX_dsp1/test_omx_dsp1_vayu.xe66<br>
&nbsp;&nbsp; update-alternatives --remove dra7-dsp2-fw.xe66 ipc/ti_platform=
s_evmDRA7XX_dsp2/test_omx_dsp2_vayu.xe66<br>
&nbsp;&nbsp; update-alternatives --remove dra7-ipu1-fw.xem4 ipc/ti_platform=
s_evmDRA7XX_ipu1/test_omx_ipu1_vayu.xem4<br>
&nbsp;&nbsp; update-alternatives --remove dra7-ipu2-fw.xem4 ipc/ti_platform=
s_evmDRA7XX_ipu2/test_omx_ipu2_vayu.xem4<br>
&nbsp;}<br>
&nbsp;<br>
-pkg_postinst_${PN}-fw_omapl138 () {<br>
&#43;pkg_postinst:${PN}-fw_omapl138 () {<br>
&nbsp;&nbsp; update-alternatives --install /lib/firmware/rproc-dsp-fw rproc=
-dsp-fw ipc/ti_platforms_evmOMAPL138_DSP/messageq_single.xe674 ${ALTERNATIV=
E_PRIORITY}<br>
&nbsp;}<br>
&nbsp;<br>
-pkg_postrm_${PN}-fw_omapl138 () {<br>
&#43;pkg_postrm:${PN}-fw_omapl138 () {<br>
&nbsp;&nbsp; update-alternatives --remove rproc-dsp-fw ipc/ti_platforms_evm=
OMAPL138_DSP/messageq_single.xe674<br>
&nbsp;}<br>
diff --git a/recipes-ti/ipc/ti-ipc_git.bb b/recipes-ti/ipc/ti-ipc_git.bb<br=
>
index 425ca4e1..8f543c91 100644<br>
--- a/recipes-ti/ipc/ti-ipc_git.bb<br>
&#43;&#43;&#43; b/recipes-ti/ipc/ti-ipc_git.bb<br>
@@ -28,7 &#43;28,7 @@ inherit autotools-brokensep pkgconfig update-rc.d sys=
temd<br>
&nbsp;INITSCRIPT_NAME =3D &quot;tiipclad-daemon.sh&quot;<br>
&nbsp;INITSCRIPT_PARAMS =3D &quot;defaults 10&quot;<br>
&nbsp;<br>
-SYSTEMD_SERVICE_${PN} =3D &quot;tiipclad-daemon.service&quot;<br>
&#43;SYSTEMD_SERVICE:${PN} =3D &quot;tiipclad-daemon.service&quot;<br>
&nbsp;<br>
&nbsp;EXTRA_OECONF &#43;=3D &quot;PLATFORM=3D${PLATFORM} KERNEL_INSTALL_DIR=
=3D${STAGING_KERNEL_DIR} KERNEL_BUILD_DIR=3D${STAGING_KERNEL_BUILDDIR}&quot=
;<br>
&nbsp;<br>
@@ -39,7 &#43;39,7 @@ do_configure() {<br>
&nbsp;&nbsp;&nbsp;&nbsp; oe_runconf<br>
&nbsp;}<br>
&nbsp;<br>
-do_install_append() {<br>
&#43;do_install:append() {<br>
&nbsp;&nbsp;&nbsp;&nbsp; install -d ${D}${sysconfdir}/init.d/<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp; # Modify the startup scripts to point to the right=
<br>
@@ -53,15 &#43;53,15 @@ do_install_append() {<br>
&nbsp;&nbsp;&nbsp;&nbsp; install -c -m 755 ${WORKDIR}/tiipclad-daemon.sh ${=
D}${sysconfdir}/init.d/${INITSCRIPT_NAME}<br>
&nbsp;}<br>
&nbsp;<br>
-do_install_append_dra7xx() {<br>
&#43;do_install:append_dra7xx() {<br>
&nbsp;&nbsp;&nbsp;&nbsp; install -d ${D}${sysconfdir}/modprobe.d/<br>
&nbsp;&nbsp;&nbsp;&nbsp; install -c -m 644 ${WORKDIR}/omap_remoteproc.conf =
${D}${sysconfdir}/modprobe.d/<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;PACKAGES =3D&#43; &quot;${PN}-test&quot;<br>
-RDEPENDS_${PN}-test &#43;=3D &quot;${PN}&quot;<br>
&#43;RDEPENDS:${PN}-test &#43;=3D &quot;${PN}&quot;<br>
&nbsp;<br>
-FILES_${PN}-test =3D &quot; \<br>
&#43;FILES:${PN}-test =3D &quot; \<br>
&nbsp;&nbsp;&nbsp;&nbsp; ${bindir}/NameServerApp \<br>
&nbsp;&nbsp;&nbsp;&nbsp; ${bindir}/MessageQApp \<br>
&nbsp;&nbsp;&nbsp;&nbsp; ${bindir}/MessageQMulti \<br>
diff --git a/recipes-ti/linuxutils/ti-linuxutils.inc b/recipes-ti/linuxutil=
s/ti-linuxutils.inc<br>
index c8f93209..c461418f 100644<br>
--- a/recipes-ti/linuxutils/ti-linuxutils.inc<br>
&#43;&#43;&#43; b/recipes-ti/linuxutils/ti-linuxutils.inc<br>
@@ -15,7 &#43;15,7 @@ require recipes-ti/includes/ti-staging.inc<br>
&nbsp;PR =3D &quot;${MACHINE_KERNEL_PR}&quot;<br>
&nbsp;<br>
&nbsp;#This is a kernel module, don't set PR directly<br>
-MACHINE_KERNEL_PR_append =3D &quot;f&quot;<br>
&#43;MACHINE_KERNEL_PR:append =3D &quot;f&quot;<br>
&nbsp;<br>
&nbsp;inherit module<br>
&nbsp;<br>
@@ -82,12 &#43;82,12 @@ PACKAGES =3D&#43; &quot; ti-cmem-module \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; ti-irq-module \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; ti-linuxutils-app&quot;<br>
&nbsp;<br>
-FILES_ti-cmem-module =3D &quot;/lib/modules/${KERNEL_VERSION}/kernel/drive=
rs/dsp/cmem*.ko&quot;<br>
-FILES_ti-sdma-module =3D &quot;/lib/modules/${KERNEL_VERSION}/kernel/drive=
rs/dsp/sdma*.ko&quot;<br>
-FILES_ti-edma-module =3D &quot;/lib/modules/${KERNEL_VERSION}/kernel/drive=
rs/dsp/edma*.ko&quot;<br>
-FILES_ti-irq-module =3D &quot;/lib/modules/${KERNEL_VERSION}/kernel/driver=
s/dsp/irq*.ko&quot;<br>
&#43;FILES:ti-cmem-module =3D &quot;/lib/modules/${KERNEL_VERSION}/kernel/d=
rivers/dsp/cmem*.ko&quot;<br>
&#43;FILES:ti-sdma-module =3D &quot;/lib/modules/${KERNEL_VERSION}/kernel/d=
rivers/dsp/sdma*.ko&quot;<br>
&#43;FILES:ti-edma-module =3D &quot;/lib/modules/${KERNEL_VERSION}/kernel/d=
rivers/dsp/edma*.ko&quot;<br>
&#43;FILES:ti-irq-module =3D &quot;/lib/modules/${KERNEL_VERSION}/kernel/dr=
ivers/dsp/irq*.ko&quot;<br>
&nbsp;<br>
-FILES_ti-linuxutils-app =3D &quot;${installdir}/ti-linuxutils-app/*/*&quot=
;<br>
&#43;FILES:ti-linuxutils-app =3D &quot;${installdir}/ti-linuxutils-app/*/*&=
quot;<br>
&nbsp;<br>
-INSANE_SKIP_ti-linuxutils-app =3D &quot;True&quot;<br>
&#43;INSANE_SKIP:ti-linuxutils-app =3D &quot;True&quot;<br>
&nbsp;INHIBIT_PACKAGE_STRIP =3D &quot;1&quot;<br>
diff --git a/recipes-ti/linuxutils/ti-linuxutils_2.26.01.02.bb b/recipes-ti=
/linuxutils/ti-linuxutils_2.26.01.02.bb<br>
index 113e6a69..2b7e1f9a 100644<br>
--- a/recipes-ti/linuxutils/ti-linuxutils_2.26.01.02.bb<br>
&#43;&#43;&#43; b/recipes-ti/linuxutils/ti-linuxutils_2.26.01.02.bb<br>
@@ -11,7 &#43;11,7 @@ PV =3D &quot;2_26_01_02&quot;<br>
&nbsp;SRC_URI[md5sum] =3D &quot;70b4918bc35c1bcfef34d6ba3fbce0c8&quot;<br>
&nbsp;SRC_URI[sha256sum] =3D &quot;51266dd928f8d629cd417c869789a6c0d5966121=
20f165619119cbaadfd66ee2&quot;<br>
&nbsp;<br>
-INSANE_SKIP_${PN} =3D &quot;installed-vs-shipped&quot;<br>
&#43;INSANE_SKIP:${PN} =3D &quot;installed-vs-shipped&quot;<br>
&nbsp;<br>
&nbsp;COMPATIBLE_HOST ?=3D &quot;null&quot;<br>
&nbsp;COMPATIBLE_HOST_ti-soc =3D &quot;(.*)&quot;<br>
diff --git a/recipes-ti/mathlib/mathlib.inc b/recipes-ti/mathlib/mathlib.in=
c<br>
index cfc5409f..e83584bf 100644<br>
--- a/recipes-ti/mathlib/mathlib.inc<br>
&#43;&#43;&#43; b/recipes-ti/mathlib/mathlib.inc<br>
@@ -34,7 &#43;34,7 @@ export C66CODEGENTOOL =3D&quot;${CGTOOLS_INSTALL_DIR}=
&quot;<br>
&nbsp;export SWTOOLS_PATH =3D &quot;${SWTOOLS_INSTALL_DIR}/ti/mas/swtools&q=
uot;<br>
&nbsp;export XDCBUILDCFG=3D&quot;${SWTOOLS_PATH}/config.bld&quot;<br>
&nbsp;<br>
-PATH_append =3D &quot;:${XDC_INSTALL_DIR}&quot;<br>
&#43;PATH:append =3D &quot;:${XDC_INSTALL_DIR}&quot;<br>
&nbsp;<br>
&nbsp;XDCPATH.=3D&quot;${XDCCGROOT}/include;${XDC_INSTALL_DIR}/packages;${S=
YSBIOS_INSTALL_DIR}/packages;&quot;<br>
&nbsp;XDCPATH.=3D&quot;${SWTOOLS_INSTALL_DIR};${MATHLIB_WORK_DIR};&quot;<br=
>
@@ -69,9 &#43;69,9 @@ do_deploy() {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rm -r ./${MATHLIB_PACKAGE_=
NAME}<br>
&nbsp;}<br>
&nbsp;<br>
-ALLOW_EMPTY_${PN} =3D &quot;1&quot;<br>
-FILES_${PN}-dev &#43;=3D &quot;${MATHLIB_INSTALL_DIR_RECIPE}&quot;<br>
&#43;ALLOW_EMPTY:${PN} =3D &quot;1&quot;<br>
&#43;FILES:${PN}-dev &#43;=3D &quot;${MATHLIB_INSTALL_DIR_RECIPE}&quot;<br>
&nbsp;<br>
-INSANE_SKIP_${PN}-dev =3D &quot;arch&quot;<br>
&#43;INSANE_SKIP:${PN}-dev =3D &quot;arch&quot;<br>
&nbsp;COMPATIBLE_HOST ?=3D &quot;null&quot;<br>
&nbsp;COMPATIBLE_HOST_ti-soc =3D &quot;(.*)&quot;<br>
diff --git a/recipes-ti/mpm-transport/mpm-transport_git.bb b/recipes-ti/mpm=
-transport/mpm-transport_git.bb<br>
index 9bbbb733..6843689c 100644<br>
--- a/recipes-ti/mpm-transport/mpm-transport_git.bb<br>
&#43;&#43;&#43; b/recipes-ti/mpm-transport/mpm-transport_git.bb<br>
@@ -5,8 &#43;5,8 @@ LIC_FILES_CHKSUM =3D &quot;<a href=3D"file://LICENSE.tx=
t;md5=3D122b7757f366f3f6fe11988715258fc9">file://LICENSE.txt;md5=3D122b7757=
f366f3f6fe11988715258fc9</a>&quot;<br>
&nbsp;COMPATIBLE_MACHINE =3D &quot;keystone&quot;<br>
&nbsp;<br>
&nbsp;DEPENDS =3D &quot;common-csl-ip edma3-lld mmap-lld cmem rm-lld qmss-l=
ld cppi-lld uio-module-drv&quot;<br>
-DEPENDS_append_k2hk =3D &quot; hyplnk-lld srio-lld&quot;<br>
-DEPENDS_append_k2e =3D &quot; hyplnk-lld&quot;<br>
&#43;DEPENDS:append_k2hk =3D &quot; hyplnk-lld srio-lld&quot;<br>
&#43;DEPENDS:append_k2e =3D &quot; hyplnk-lld&quot;<br>
&nbsp;<br>
&nbsp;PACKAGE_ARCH =3D &quot;${MACHINE_ARCH}&quot;<br>
&nbsp;<br>
@@ -21,14 &#43;21,14 @@ PR =3D &quot;r0&quot;<br>
&nbsp;<br>
&nbsp;CC &#43;=3D &quot;-fcommon&quot;<br>
&nbsp;EXTRA_OEMAKE =3D &quot;PDK_INSTALL_PATH=3D${STAGING_INCDIR}&quot;<br>
-EXTRA_OEMAKE_append_k2hk &#43;=3D &quot;HYPLNK_TRANSPORT=3Dtrue SRIO_TRANS=
PORT=3Dtrue&quot;<br>
-EXTRA_OEMAKE_append_k2e &#43;=3D &quot;HYPLNK_TRANSPORT=3Dtrue&quot;<br>
-INSANE_SKIP_${PN} &#43;=3D &quot;ldflags&quot;<br>
&#43;EXTRA_OEMAKE:append_k2hk &#43;=3D &quot;HYPLNK_TRANSPORT=3Dtrue SRIO_T=
RANSPORT=3Dtrue&quot;<br>
&#43;EXTRA_OEMAKE:append_k2e &#43;=3D &quot;HYPLNK_TRANSPORT=3Dtrue&quot;<b=
r>
&#43;INSANE_SKIP:${PN} &#43;=3D &quot;ldflags&quot;<br>
&nbsp;<br>
&nbsp;S =3D &quot;${WORKDIR}/git&quot;<br>
&nbsp;<br>
&nbsp;PACKAGES =3D&#43; &quot;${PN}-test&quot;<br>
-FILES_${PN}-test =3D &quot;${bindir}/mpm_transport_test.out \<br>
&#43;FILES:${PN}-test =3D &quot;${bindir}/mpm_transport_test.out \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; ${bindir}/mpm_transport_hyplnk_loopback.out \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; ${bindir}/mpm_transport_hyplnk_remote.out \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; ${bindir}/mpm_transport_hyplnk_loopback_dma.out \<br>
diff --git a/recipes-ti/multiprocmgr/multiprocmgr-rtos_git.bb b/recipes-ti/=
multiprocmgr/multiprocmgr-rtos_git.bb<br>
index 7a6e0f63..41efe38b 100644<br>
--- a/recipes-ti/multiprocmgr/multiprocmgr-rtos_git.bb<br>
&#43;&#43;&#43; b/recipes-ti/multiprocmgr/multiprocmgr-rtos_git.bb<br>
@@ -9,7 &#43;9,7 @@ DEPENDS =3D &quot;ti-cgt6x-native&quot;<br>
&nbsp;PR =3D &quot;${INC_PR}.2&quot;<br>
&nbsp;<br>
&nbsp;PACKAGES =3D&#43; &quot;${PN}-test&quot;<br>
-FILES_${PN}-test =3D &quot;${datadir}/ti/examples/mpm/test/filetestdemo/c6=
6x/demo_loopback/build/bin/*.out \<br>
&#43;FILES:${PN}-test =3D &quot;${datadir}/ti/examples/mpm/test/filetestdem=
o/c66x/demo_loopback/build/bin/*.out \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${datadir}/ti/examples/mpm/te=
st/sync_test/c66x/bin/*.out&quot;<br>
&nbsp;<br>
&nbsp;EXTRA_OEMAKE =3D &quot;LOCAL_SYSROOT=3D&quot;${STAGING_DIR_TARGET}&qu=
ot; \<br>
@@ -35,10 &#43;35,10 @@ do_install() {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${D}${datadir}/ti/examples=
/mpm/test/sync_test/c66x/bin/<br>
&nbsp;}<br>
&nbsp;<br>
-FILES_${PN}-dev &#43;=3D &quot;${MPM_INSTALL_DIR_RECIPE}&quot;<br>
-INSANE_SKIP_${PN}-dev =3D &quot;arch&quot;<br>
-INSANE_SKIP_${PN}-test =3D &quot;arch&quot;<br>
&#43;FILES:${PN}-dev &#43;=3D &quot;${MPM_INSTALL_DIR_RECIPE}&quot;<br>
&#43;INSANE_SKIP:${PN}-dev =3D &quot;arch&quot;<br>
&#43;INSANE_SKIP:${PN}-test =3D &quot;arch&quot;<br>
&nbsp;<br>
-RDEPENDS_${PN}-dev =3D &quot;bash&quot;<br>
&#43;RDEPENDS:${PN}-dev =3D &quot;bash&quot;<br>
&nbsp;<br>
-ALLOW_EMPTY_${PN} =3D &quot;1&quot;<br>
&#43;ALLOW_EMPTY:${PN} =3D &quot;1&quot;<br>
diff --git a/recipes-ti/multiprocmgr/multiprocmgr-test_git.bb b/recipes-ti/=
multiprocmgr/multiprocmgr-test_git.bb<br>
index 8bcb1105..3d1b3aee 100644<br>
--- a/recipes-ti/multiprocmgr/multiprocmgr-test_git.bb<br>
&#43;&#43;&#43; b/recipes-ti/multiprocmgr/multiprocmgr-test_git.bb<br>
@@ -5,14 &#43;5,14 @@ include multiprocmgr.inc<br>
&nbsp;PR =3D &quot;${INC_PR}.2&quot;<br>
&nbsp;<br>
&nbsp;DEPENDS =3D &quot;multiprocmgr cmem&quot;<br>
-RDEPENDS_${PN} =3D &quot;multiprocmgr mpm-transport cmem&quot;<br>
-RDEPENDS_${PN} &#43;=3D &quot;multiprocmgr-rtos-test bash&quot;<br>
&#43;RDEPENDS:${PN} =3D &quot;multiprocmgr mpm-transport cmem&quot;<br>
&#43;RDEPENDS:${PN} &#43;=3D &quot;multiprocmgr-rtos-test bash&quot;<br>
&nbsp;<br>
-FILES_${PN} &#43;=3D &quot;\<br>
&#43;FILES:${PN} &#43;=3D &quot;\<br>
&nbsp;&nbsp;&nbsp;&nbsp; ${datadir}/ti/examples/mpm \<br>
&nbsp;&quot;<br>
&nbsp;<br>
-FILES_${PN}-dbg &#43;=3D &quot;\<br>
&#43;FILES:${PN}-dbg &#43;=3D &quot;\<br>
&nbsp;&nbsp;&nbsp;&nbsp; ${datadir}/ti/examples/mpm/*/.debug \<br>
&nbsp;&quot;<br>
&nbsp;<br>
@@ -28,4 &#43;28,4 @@ do_install() {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cp -r ${S}/test ${D}${data=
dir}/ti/examples/mpm<br>
&nbsp;}<br>
&nbsp;<br>
-INSANE_SKIP_${PN} =3D &quot;ldflags staticdev&quot;<br>
&#43;INSANE_SKIP:${PN} =3D &quot;ldflags staticdev&quot;<br>
diff --git a/recipes-ti/multiprocmgr/multiprocmgr_git.bb b/recipes-ti/multi=
procmgr/multiprocmgr_git.bb<br>
index 07512603..1bd24885 100644<br>
--- a/recipes-ti/multiprocmgr/multiprocmgr_git.bb<br>
&#43;&#43;&#43; b/recipes-ti/multiprocmgr/multiprocmgr_git.bb<br>
@@ -16,7 &#43;16,7 @@ PACKAGE_ARCH =3D &quot;${MACHINE_ARCH}&quot;<br>
&nbsp;INITSCRIPT_NAME =3D &quot;mpmsrv-daemon.sh&quot;<br>
&nbsp;INITSCRIPT_PARAMS =3D &quot;defaults 10&quot;<br>
&nbsp;<br>
-SYSTEMD_SERVICE_${PN} =3D &quot;mpmsrv-daemon.service&quot;<br>
&#43;SYSTEMD_SERVICE:${PN} =3D &quot;mpmsrv-daemon.service&quot;<br>
&nbsp;<br>
&nbsp;inherit update-rc.d systemd<br>
&nbsp;<br>
@@ -41,4 &#43;41,4 @@ do_install() {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; chown -R root:root ${D}${l=
ibdir}/<br>
&nbsp;}<br>
&nbsp;<br>
-INSANE_SKIP_${PN} =3D &quot;ldflags&quot;<br>
&#43;INSANE_SKIP:${PN} =3D &quot;ldflags&quot;<br>
diff --git a/recipes-ti/ndk/ti-ndk.inc b/recipes-ti/ndk/ti-ndk.inc<br>
index 9afde316..89c1adf8 100644<br>
--- a/recipes-ti/ndk/ti-ndk.inc<br>
&#43;&#43;&#43; b/recipes-ti/ndk/ti-ndk.inc<br>
@@ -14,7 &#43;14,7 @@ do_install() {<br>
&nbsp;&nbsp;&nbsp;&nbsp; cp ${CP_ARGS} ${S}/* ${D}${NDK_INSTALL_DIR_RECIPE}=
<br>
&nbsp;}<br>
&nbsp;<br>
-ALLOW_EMPTY_${PN} =3D &quot;1&quot;<br>
-FILES_${PN}-dev &#43;=3D &quot;${NDK_INSTALL_DIR_RECIPE}&quot;<br>
&#43;ALLOW_EMPTY:${PN} =3D &quot;1&quot;<br>
&#43;FILES:${PN}-dev &#43;=3D &quot;${NDK_INSTALL_DIR_RECIPE}&quot;<br>
&nbsp;<br>
-INSANE_SKIP_${PN}-dev =3D &quot;arch ldflags staticdev file-rdeps&quot;<br=
>
&#43;INSANE_SKIP:${PN}-dev =3D &quot;arch ldflags staticdev file-rdeps&quot=
;<br>
diff --git a/recipes-ti/ns/ti-ns.inc b/recipes-ti/ns/ti-ns.inc<br>
index 2a50c56c..a6b37c6b 100644<br>
--- a/recipes-ti/ns/ti-ns.inc<br>
&#43;&#43;&#43; b/recipes-ti/ns/ti-ns.inc<br>
@@ -15,7 &#43;15,7 @@ do_install() {<br>
&nbsp;&nbsp;&nbsp;&nbsp; cp ${CP_ARGS} ${S}/* ${D}${NS_INSTALL_DIR_RECIPE}<=
br>
&nbsp;}<br>
&nbsp;<br>
-ALLOW_EMPTY_${PN} =3D &quot;1&quot;<br>
-FILES_${PN}-dev &#43;=3D &quot;${NS_INSTALL_DIR_RECIPE}&quot;<br>
&#43;ALLOW_EMPTY:${PN} =3D &quot;1&quot;<br>
&#43;FILES:${PN}-dev &#43;=3D &quot;${NS_INSTALL_DIR_RECIPE}&quot;<br>
&nbsp;<br>
-INSANE_SKIP_${PN}-dev =3D &quot;arch ldflags staticdev file-rdeps&quot;<br=
>
&#43;INSANE_SKIP:${PN}-dev =3D &quot;arch ldflags staticdev file-rdeps&quot=
;<br>
diff --git a/recipes-ti/openmp-rtos/openmp-rtos_git.bb b/recipes-ti/openmp-=
rtos/openmp-rtos_git.bb<br>
index 0c93f354..32faa984 100644<br>
--- a/recipes-ti/openmp-rtos/openmp-rtos_git.bb<br>
&#43;&#43;&#43; b/recipes-ti/openmp-rtos/openmp-rtos_git.bb<br>
@@ -24,9 &#43;24,9 @@ SRCREV =3D &quot;c090eb664d9815a36ead0e14f31e10259068=
0fb8&quot;<br>
&nbsp;LIC_FILES_CHKSUM =3D &quot;<a href=3D"file://docs/license/omp_manifes=
t_template.html;md5=3D61a6972303c0447b7c056195d7ebafee">file://docs/license=
/omp_manifest_template.html;md5=3D61a6972303c0447b7c056195d7ebafee</a>&quot=
;<br>
&nbsp;<br>
&nbsp;DEPENDS =3D &quot;common-csl-ip-rtos doxygen-native libulm ti-xdctool=
s-native ti-ipc-rtos ti-sysbios ti-cgt6x-native zip-native&quot;<br>
-DEPENDS_append_k2hk =3D &quot; qmss-lld-rtos cppi-lld-rtos&quot;<br>
-DEPENDS_append_k2e =3D &quot; qmss-lld-rtos cppi-lld-rtos&quot;<br>
-DEPENDS_append_k2l =3D &quot; qmss-lld-rtos cppi-lld-rtos&quot;<br>
&#43;DEPENDS:append_k2hk =3D &quot; qmss-lld-rtos cppi-lld-rtos&quot;<br>
&#43;DEPENDS:append_k2e =3D &quot; qmss-lld-rtos cppi-lld-rtos&quot;<br>
&#43;DEPENDS:append_k2l =3D &quot; qmss-lld-rtos cppi-lld-rtos&quot;<br>
&nbsp;<br>
&nbsp;COMPATIBLE_MACHINE =3D &quot;keystone|omap-a15&quot;<br>
&nbsp;PACKAGE_ARCH =3D &quot;${MACHINE_ARCH}&quot;<br>
@@ -64,10 &#43;64,10 @@ do_install() {<br>
&nbsp;&nbsp;&nbsp;&nbsp; cp -r ${S}/exports/openmp_dsp_${RELEASE_TARGET}_*/=
. -d&nbsp; ${D}${OMP_INSTALL_DIR_RECIPE}<br>
&nbsp;}<br>
&nbsp;<br>
-ALLOW_EMPTY_${PN} =3D &quot;1&quot;<br>
&#43;ALLOW_EMPTY:${PN} =3D &quot;1&quot;<br>
&nbsp;<br>
-FILES_${PN}-dev &#43;=3D &quot; \<br>
&#43;FILES:${PN}-dev &#43;=3D &quot; \<br>
&nbsp;&nbsp;&nbsp;&nbsp; ${OMP_INSTALL_DIR_RECIPE}/ \<br>
&nbsp;&quot;<br>
&nbsp;<br>
-INSANE_SKIP_${PN}-dev =3D &quot;arch&quot;<br>
&#43;INSANE_SKIP:${PN}-dev =3D &quot;arch&quot;<br>
diff --git a/recipes-ti/osal/ti-osal.inc b/recipes-ti/osal/ti-osal.inc<br>
index 0a966d40..11f99e63 100644<br>
--- a/recipes-ti/osal/ti-osal.inc<br>
&#43;&#43;&#43; b/recipes-ti/osal/ti-osal.inc<br>
@@ -15,10 &#43;15,10 @@ do_install() {<br>
&nbsp;&nbsp;&nbsp;&nbsp; cp -pPrf ${S}/* ${D}${OSAL_INSTALL_DIR_RECIPE}<br>
&nbsp;}<br>
&nbsp;<br>
-INSANE_SKIP_${PN}-dev =3D &quot;staticdev&quot;<br>
&#43;INSANE_SKIP:${PN}-dev =3D &quot;staticdev&quot;<br>
&nbsp;<br>
-ALLOW_EMPTY_${PN} =3D &quot;1&quot;<br>
-FILES_${PN}-dev &#43;=3D &quot;${OSAL_INSTALL_DIR_RECIPE}&quot;<br>
&#43;ALLOW_EMPTY:${PN} =3D &quot;1&quot;<br>
&#43;FILES:${PN}-dev &#43;=3D &quot;${OSAL_INSTALL_DIR_RECIPE}&quot;<br>
&nbsp;<br>
&nbsp;COMPATIBLE_HOST ?=3D &quot;null&quot;<br>
&nbsp;COMPATIBLE_HOST_ti-soc =3D &quot;(.*)&quot;<br>
diff --git a/recipes-ti/swtools/swtools_git.bb b/recipes-ti/swtools/swtools=
_git.bb<br>
index 497c0e0d..b6d645f3 100644<br>
--- a/recipes-ti/swtools/swtools_git.bb<br>
&#43;&#43;&#43; b/recipes-ti/swtools/swtools_git.bb<br>
@@ -27,7 &#43;27,7 @@ export C64PCODEGENTOOL =3D &quot;${CGTOOLS_INSTALL_DI=
R}&quot;<br>
&nbsp;export C674CODEGENTOOL =3D &quot;${CGTOOLS_INSTALL_DIR}&quot;<br>
&nbsp;export C66CODEGENTOOL&nbsp; =3D &quot;${CGTOOLS_INSTALL_DIR}&quot;<br=
>
&nbsp;<br>
-PATH_append =3D &quot;:${XDC_INSTALL_DIR}&quot;<br>
&#43;PATH:append =3D &quot;:${XDC_INSTALL_DIR}&quot;<br>
&nbsp;<br>
&nbsp;XDCPATH .=3D &quot;${XDCCGROOT}/include;${XDC_INSTALL_DIR}/packages;$=
{SYSBIOS_INSTALL_DIR}/packages;&quot;<br>
&nbsp;<br>
@@ -44,9 &#43;44,9 @@ do_install() {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cp ${CP_ARGS} ${S}/* ${D}$=
{SWTOOLS_INSTALL_DIR_RECIPE}<br>
&nbsp;}<br>
&nbsp;<br>
-FILES_${PN}-dev &#43;=3D &quot;${SWTOOLS_INSTALL_DIR_RECIPE}&quot;<br>
&#43;FILES:${PN}-dev &#43;=3D &quot;${SWTOOLS_INSTALL_DIR_RECIPE}&quot;<br>
&nbsp;<br>
-INSANE_SKIP_${PN}-dev =3D &quot;arch staticdev&quot;<br>
-ALLOW_EMPTY_${PN} =3D &quot;1&quot;<br>
&#43;INSANE_SKIP:${PN}-dev =3D &quot;arch staticdev&quot;<br>
&#43;ALLOW_EMPTY:${PN} =3D &quot;1&quot;<br>
&nbsp;COMPATIBLE_HOST ?=3D &quot;null&quot;<br>
&nbsp;COMPATIBLE_HOST_ti-soc =3D &quot;(.*)&quot;<br>
diff --git a/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb b/recipes-ti/=
ti-pdk-build/ti-pdk-build-rtos_git.bb<br>
index 96648815..6b491dcc 100644<br>
--- a/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb<br>
&#43;&#43;&#43; b/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb<br>
@@ -28,5 &#43;28,5 @@ do_install() {<br>
&nbsp;&nbsp;&nbsp;&nbsp; oe_runmake<br>
&nbsp;}<br>
&nbsp;<br>
-FILES_${PN} &#43;=3D &quot;${PDK_INSTALL_DIR_RECIPE}/packages/*&quot;<br>
-INSANE_SKIP_${PN} &#43;=3D &quot; file-rdeps&quot;<br>
&#43;FILES:${PN} &#43;=3D &quot;${PDK_INSTALL_DIR_RECIPE}/packages/*&quot;<=
br>
&#43;INSANE_SKIP:${PN} &#43;=3D &quot; file-rdeps&quot;<br>
diff --git a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/recipes-ti/ti-rto=
s-bin/ti-rtos-firmware.bb<br>
index 43de1ec2..1e9aab78 100644<br>
--- a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb<br>
&#43;&#43;&#43; b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb<br>
@@ -18,7 &#43;18,7 @@ PLAT_SFX_j7200-evm =3D &quot;j7200&quot;<br>
&nbsp;PLAT_SFX_am65xx =3D &quot;am65xx&quot;<br>
&nbsp;PLAT_SFX_am64xx =3D &quot;am64xx&quot;<br>
&nbsp;<br>
-FILESEXTRAPATHS_prepend :=3D &quot;${METATIBASE}/recipes-bsp/ti-sci-fw/fil=
es/:&quot;<br>
&#43;FILESEXTRAPATHS:prepend :=3D &quot;${METATIBASE}/recipes-bsp/ti-sci-fw=
/files/:&quot;<br>
&nbsp;require recipes-bsp/ti-sci-fw/ti-sci-fw.inc<br>
&nbsp;<br>
&nbsp;CORESDK_RTOS_VERSION ?=3D &quot;08.00.00.26&quot;<br>
@@ -30,7 &#43;30,7 @@ PR =3D &quot;${INC_PR}.0&quot;<br>
&nbsp;# Secure Build <br>
&nbsp;DEPENDS &#43;=3D &quot;openssl-native&quot;<br>
&nbsp;<br>
-FILES_${PN} &#43;=3D &quot;${base_libdir}&quot;<br>
&#43;FILES:${PN} &#43;=3D &quot;${base_libdir}&quot;<br>
&nbsp;<br>
&nbsp;TI_SECURE_DEV_PKG ?=3D &quot;&quot;<br>
&nbsp;<br>
@@ -47,7 &#43;47,7 @@ LEGACY_DM_FW_DIR&nbsp; =3D &quot;${D}${base_libdir}/f=
irmware/pdk-ipc/&quot;<br>
&nbsp;DM_FIRMWARE =3D &quot;ipc_echo_testb_mcu1_0_release_strip.xer5f&quot;=
<br>
&nbsp;<br>
&nbsp;# J7 HS support<br>
-do_install_prepend_j7-hs-evm() {<br>
&#43;do_install:prepend_j7-hs-evm() {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; export TI_SECURE_DEV_PKG=
=3D${TI_SECURE_DEV_PKG}<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ( cd ${RTOS_DM_FW_DIR}; \<=
br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; mv ${DM_FIRMWARE} ${DM_FIRMWARE}.unsigned; \<br>
@@ -56,7 &#43;56,7 @@ do_install_prepend_j7-hs-evm() {<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;# Update the am64xx ipc binaries to be consistent with other platform=
s<br>
-do_install_prepend_am64xx() {<br>
&#43;do_install:prepend_am64xx() {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ( cd ${RTOS_IPC_FW_DIR}; \=
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; mv am64-main-r5f0_0-fw ipc_echo_baremetal_test_mcu1_0=
_release_strip.xer5f; \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; mv am64-main-r5f0_1-fw ipc_echo_baremetal_test_mcu1_1=
_release_strip.xer5f; \<br>
@@ -114,19 &#43;114,19 @@ do_install_am64xx() {<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;# Set up names for the firmwares<br>
-ALTERNATIVE_${PN}_am65xx =3D &quot;\<br>
&#43;ALTERNATIVE:${PN}_am65xx =3D &quot;\<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; am65x-mcu-r5f0_0-fw \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; am65x-mcu-r5f0_1-fw \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;<br>
&nbsp;<br>
-ALTERNATIVE_${PN}_am64xx =3D &quot;\<br>
&#43;ALTERNATIVE:${PN}_am64xx =3D &quot;\<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; am64-main-r5f0_0-fw \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; am64-main-r5f0_1-fw \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; am64-main-r5f1_0-fw \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; am64-main-r5f1_1-fw \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;<br>
&nbsp;<br>
-ALTERNATIVE_${PN}_j7 =3D &quot;\<br>
&#43;ALTERNATIVE:${PN}_j7 =3D &quot;\<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; j7-mcu-r5f0_0-fw \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; j7-mcu-r5f0_1-fw \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; j7-main-r5f0_0-fw \<br>
@@ -138,7 &#43;138,7 @@ ALTERNATIVE_${PN}_j7 =3D &quot;\<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; j7-c71_0-fw\<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;<br>
&nbsp;<br>
-ALTERNATIVE_${PN}_j7200-evm =3D &quot;\<br>
&#43;ALTERNATIVE:${PN}_j7200-evm =3D &quot;\<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; j7200-mcu-r5f0_0-fw \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; j7200-mcu-r5f0_1-fw \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; j7200-main-r5f0_0-fw \<br>
@@ -221,7 &#43;221,7 @@ ALTERNATIVE_TARGET[j7200-main-r5f0_1-fw] =3D &quot;=
${base_libdir}/firmware/pdk-ipc/ipc_<br>
&nbsp;ALTERNATIVE_PRIORITY =3D &quot;10&quot;<br>
&nbsp;<br>
&nbsp;# make sure that lib/firmware, and all its contents are part of the p=
ackage<br>
-FILES_${PN} &#43;=3D &quot;${base_libdir}/firmware&quot;<br>
&#43;FILES:${PN} &#43;=3D &quot;${base_libdir}/firmware&quot;<br>
&nbsp;<br>
&nbsp;# This is used to prevent the build system to_strip the executables<b=
r>
&nbsp;INHIBIT_PACKAGE_STRIP =3D &quot;1&quot;<br>
@@ -229,7 &#43;229,7 @@ INHIBIT_SYSROOT_STRIP =3D &quot;1&quot;<br>
&nbsp;# This is used to prevent the build system to split the debug info in=
 a separate file<br>
&nbsp;INHIBIT_PACKAGE_DEBUG_SPLIT =3D &quot;1&quot;<br>
&nbsp;# As it likely to be a different arch from the Yocto build, disable c=
hecking by adding &quot;arch&quot; to INSANE_SKIP<br>
-INSANE_SKIP_${PN} &#43;=3D &quot;arch&quot;<br>
&#43;INSANE_SKIP:${PN} &#43;=3D &quot;arch&quot;<br>
&nbsp;<br>
&nbsp;# we don't want to configure and build the source code<br>
&nbsp;do_compile[noexec] =3D &quot;1&quot;<br>
diff --git a/recipes-ti/udma/udma_git.bb b/recipes-ti/udma/udma_git.bb<br>
index c905fa58..b6100a37 100644<br>
--- a/recipes-ti/udma/udma_git.bb<br>
&#43;&#43;&#43; b/recipes-ti/udma/udma_git.bb<br>
@@ -14,7 &#43;14,7 @@ PV =3D &quot;01.00.00.00&quot;<br>
&nbsp;<br>
&nbsp;PACKAGES =3D&#43; &quot;${PN}-test&quot;<br>
&nbsp;<br>
-FILES_${PN}-test =3D &quot;${bindir}/udma_test&quot;<br>
&#43;FILES:${PN}-test =3D &quot;${bindir}/udma_test&quot;<br>
&nbsp;<br>
&nbsp;do_install() {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; install -d ${D}${bindir}/<=
br>
@@ -29,4 &#43;29,4 @@ do_install() {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; install -c -m 755 ${S}/inc=
lude/* ${D}${includedir}/<br>
&nbsp;}<br>
&nbsp;<br>
-INSANE_SKIP_${PN} &#43;=3D &quot;textrel&quot;<br>
&#43;INSANE_SKIP:${PN} &#43;=3D &quot;textrel&quot;<br>
diff --git a/recipes-ti/uio-test-pruss/uio-test-pruss_git.bb b/recipes-ti/u=
io-test-pruss/uio-test-pruss_git.bb<br>
index cbae1b11..fdcf766e 100644<br>
--- a/recipes-ti/uio-test-pruss/uio-test-pruss_git.bb<br>
&#43;&#43;&#43; b/recipes-ti/uio-test-pruss/uio-test-pruss_git.bb<br>
@@ -26,10 &#43;26,10 @@ COMPATIBLE_MACHINE =3D &quot;omap-a15|ti33x|ti43x|k=
2g&quot;<br>
&nbsp;PACKAGE_ARCH =3D &quot;${MACHINE_ARCH}&quot;<br>
&nbsp;<br>
&nbsp;DEVICE_NAME =3D &quot;&quot;<br>
-DEVICE_NAME_append_am57xx-evm =3D &quot;am57xx&quot;<br>
-DEVICE_NAME_append_ti33x =3D &quot;am33xx&quot;<br>
-DEVICE_NAME_append_ti43x =3D &quot;am43xx&quot;<br>
-DEVICE_NAME_append_k2g =3D &quot;k2g&quot;<br>
&#43;DEVICE_NAME:append_am57xx-evm =3D &quot;am57xx&quot;<br>
&#43;DEVICE_NAME:append_ti33x =3D &quot;am33xx&quot;<br>
&#43;DEVICE_NAME:append_ti43x =3D &quot;am43xx&quot;<br>
&#43;DEVICE_NAME:append_k2g =3D &quot;k2g&quot;<br>
&nbsp;<br>
&nbsp;EXTRA_OEMAKE =3D &quot;CGT_PRU=3D${TI_CGT_PRU_INSTALL_DIR} DEVICE=3D$=
{DEVICE_NAME}&quot;<br>
&nbsp;<br>
diff --git a/recipes-ti/vlib/vlib-c66x.inc b/recipes-ti/vlib/vlib-c66x.inc<=
br>
index a539e4d7..9ab9c506 100644<br>
--- a/recipes-ti/vlib/vlib-c66x.inc<br>
&#43;&#43;&#43; b/recipes-ti/vlib/vlib-c66x.inc<br>
@@ -23,10 &#43;23,10 @@ do_install() {<br>
&nbsp;&nbsp;&nbsp;&nbsp; cp ${CP_ARGS} ${S}/* ${D}${VLIB_C66_INSTALL_DIR_RE=
CIPE}<br>
&nbsp;}<br>
&nbsp;<br>
-ALLOW_EMPTY_${PN} =3D &quot;1&quot;<br>
-FILES_${PN}-dev &#43;=3D &quot;${VLIB_C66_INSTALL_DIR_RECIPE}&quot;<br>
&#43;ALLOW_EMPTY:${PN} =3D &quot;1&quot;<br>
&#43;FILES:${PN}-dev &#43;=3D &quot;${VLIB_C66_INSTALL_DIR_RECIPE}&quot;<br=
>
&nbsp;<br>
&nbsp;INHIBIT_PACKAGE_STRIP =3D &quot;1&quot;<br>
&nbsp;INHIBIT_SYSROOT_STRIP =3D &quot;1&quot;<br>
&nbsp;INHIBIT_PACKAGE_DEBUG_SPLIT =3D &quot;1&quot;<br>
-INSANE_SKIP_${PN}-dev =3D &quot;installed-vs-shipped arch&quot;<br>
&#43;INSANE_SKIP:${PN}-dev =3D &quot;installed-vs-shipped arch&quot;<br>
diff --git a/recipes-ti/xdais/ti-xdais.inc b/recipes-ti/xdais/ti-xdais.inc<=
br>
index 24268b3a..daa93ddf 100644<br>
--- a/recipes-ti/xdais/ti-xdais.inc<br>
&#43;&#43;&#43; b/recipes-ti/xdais/ti-xdais.inc<br>
@@ -19,7 &#43;19,7 @@ do_install() {<br>
&nbsp;INHIBIT_PACKAGE_STRIP =3D &quot;1&quot;<br>
&nbsp;INHIBIT_SYSROOT_STRIP =3D &quot;1&quot;<br>
&nbsp;INHIBIT_PACKAGE_DEBUG_SPLIT =3D &quot;1&quot;<br>
-INSANE_SKIP_${PN}-dev =3D &quot;arch&quot;<br>
&#43;INSANE_SKIP:${PN}-dev =3D &quot;arch&quot;<br>
&nbsp;<br>
-ALLOW_EMPTY_${PN} =3D &quot;1&quot;<br>
-FILES_${PN}-dev &#43;=3D &quot;${XDAIS_INSTALL_DIR_RECIPE}&quot;<br>
&#43;ALLOW_EMPTY:${PN} =3D &quot;1&quot;<br>
&#43;FILES:${PN}-dev &#43;=3D &quot;${XDAIS_INSTALL_DIR_RECIPE}&quot;<br>
diff --git a/recipes-ti/xdais/ti-xdais_6.26.01.03.bb b/recipes-ti/xdais/ti-=
xdais_6.26.01.03.bb<br>
index 3d358632..9fc4cee1 100644<br>
--- a/recipes-ti/xdais/ti-xdais_6.26.01.03.bb<br>
&#43;&#43;&#43; b/recipes-ti/xdais/ti-xdais_6.26.01.03.bb<br>
@@ -8,4 &#43;8,4 @@ LIC_FILES_CHKSUM =3D &quot;<a href=3D""></a>file://xdai=
s_6_26_01_03_manifest.html;md5=3Da5a675d49db2f658bb<br>
&nbsp;SRC_URI[xdaistarball.md5sum] =3D &quot;9b2bea3408254e737ec0d819a031ad=
f6&quot;<br>
&nbsp;SRC_URI[xdaistarball.sha256sum] =3D &quot;d7bcbd8bcfe6fdfc5f402e4b125=
ced6c806dc30bc5296e98d5d43b0b5a237a0d&quot;<br>
&nbsp;<br>
-INSANE_SKIP_${PN} =3D &quot;installed-vs-shipped&quot;<br>
&#43;INSANE_SKIP:${PN} =3D &quot;installed-vs-shipped&quot;<br>
-- <br>
2.32.0<br>
<br>
</div>
</span></font>
</body>
</html>

--_000_c99e3f08bc634b59b41aae51df7b1647emailandroidcom_--
