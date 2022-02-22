Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.8935.1645503196375755653
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 21 Feb 2022 20:13:16 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 5867F40C79
	for <meta-ti@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:13:15 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z7TwNczZc2Xh for <meta-ti@lists.yoctoproject.org>;
	Tue, 22 Feb 2022 04:13:15 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 3929440A28
	for <meta-ti@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:13:15 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id F0246174738
	for <meta-ti@lists.yoctoproject.org>; Mon, 21 Feb 2022 23:13:14 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [PATCH 00/19] #1 - cleanup and deprecation
Date: Tue, 22 Feb 2022 04:12:55 +0000
Message-Id: <20220222041314.2840028-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Denys Dmytriyenko <denys@konsulko.com>

This patchset takes a first stab at cleaning up meta-ti and deprecating
old platforms, corresponding config files and component recipes.

Here's a temp git tree with these patches applied to glance at:
https://github.com/denix0/meta-ti/tree/master

Denys Dmytriyenko (19):
  conf/machine: remove SoC/platforms in DaVinci and OMAP3/4 families
  x-load: remove deprecated first stage X-Loader bootloader
  hdvpss: remove DaVinci High-Definition Video Processing Subsystem
    (HDVPSS)
  dmai: remove Davinci Multimedia Application Interface (DMAI)
  linuxutils: remove Linux Utils helper package
  ti-ocf-crypto-module: remove OMAP3-specific OCF ctypto module
  abefw: remove OMAP4 Audio Back-End (ABE) firmware
  alsa-state: remove asound.state for deprecated beagleboard
  init-ifupdown: remove default /etc/interfaces file for beagleboard
  formfactor: remove beagleboard-specific configs
  conf/machine: remove Keystone1/2 SoC/machine configs
  recipes-bsp: remove Keystone1/2 LLDs
  classes,recipes: remove K1/2 PDK RTOS support, FWs and IPC transports
  meta-ti: remove remaining Keystone1/2 overrides
  doxygen: remove outdated version in favor of upstream
  kselftests: remove outdated version in favor of upstream
  dspbios,biosutils: remove remnants of DSP/BIOS, predecessor to
    SYS/BIOS
  gcc-linaro-baremetal: remove 7.2 version of GCC for baremetal Arm and
    Aarch64
  trusted-firmware-a: adjust ${BUILD_DIR} for meta-arm/master

 classes/ti-pdk-fetch.bbclass                  |  47 --
 classes/ti-pdk.bbclass                        | 144 ----
 conf/layer.conf                               |   9 -
 conf/machine/am3517-evm.conf                  |  35 -
 conf/machine/am37x-evm.conf                   |  31 -
 conf/machine/am57xx-evm.conf                  |   4 -
 conf/machine/beagleboard.conf                 |  38 -
 conf/machine/beaglebone.conf                  |   3 -
 conf/machine/c665x-evm.conf                   |   9 -
 conf/machine/c667x-evm.conf                   |   9 -
 conf/machine/dra7xx-evm.conf                  |   4 -
 conf/machine/include/am64xx.inc               |   5 -
 conf/machine/include/am65xx.inc               |   5 -
 conf/machine/include/c66x.inc                 |   9 -
 conf/machine/include/davinci.inc              |  22 -
 conf/machine/include/j7.inc                   |   5 -
 conf/machine/include/k2e.inc                  |   6 -
 conf/machine/include/k2g.inc                  |   6 -
 conf/machine/include/k2hk.inc                 |   6 -
 conf/machine/include/k2l.inc                  |   6 -
 conf/machine/include/keystone.inc             |  30 -
 conf/machine/include/omap3.inc                |  42 --
 conf/machine/include/omap4.inc                |  26 -
 conf/machine/include/omapl137.inc             |   5 -
 conf/machine/include/omapl138.inc             |   3 -
 conf/machine/include/ti33x.inc                |   4 -
 conf/machine/include/ti43x.inc                |   4 -
 conf/machine/k2e-evm.conf                     |  32 -
 conf/machine/k2e-hs-evm.conf                  |  15 -
 conf/machine/k2g-evm.conf                     |  35 -
 conf/machine/k2g-hs-evm.conf                  |  15 -
 conf/machine/k2hk-evm.conf                    |  32 -
 conf/machine/k2hk-hs-evm.conf                 |  15 -
 conf/machine/k2l-evm.conf                     |  32 -
 conf/machine/k2l-hs-evm.conf                  |  15 -
 conf/machine/lego-ev3.conf                    |  22 -
 conf/machine/omap3evm.conf                    |  32 -
 conf/machine/omap5-evm.conf                   |  34 -
 conf/machine/omapl137-evm.conf                |  15 -
 conf/machine/omapl138-lcdk.conf               |   3 -
 conf/machine/pandaboard.conf                  |  16 -
 recipes-bsp/abefw/abefw_1.0.14.bb             |  23 -
 recipes-bsp/aif2-lld/aif2-lld-rtos_git.bb     |  16 -
 recipes-bsp/aif2-lld/aif2-lld-test_git.bb     |  18 -
 recipes-bsp/aif2-lld/aif2-lld.inc             |  14 -
 recipes-bsp/aif2-lld/aif2-lld_git.bb          |  20 -
 recipes-bsp/alsa-state/alsa-state.bbappend    |   1 -
 .../alsa-state/beagleboard/asound.state       | 656 ------------------
 .../audk2g-addon/audk2g-addon-rtos_git.bb     |  38 -
 recipes-bsp/bcp-lld/bcp-lld-rtos_git.bb       |  23 -
 recipes-bsp/board-rtos/board-rtos_git.bb      |  76 --
 recipes-bsp/boot-monitor/boot-monitor_git.bb  |  47 --
 recipes-bsp/cal-lld/cal-lld-rtos_git.bb       |  76 --
 recipes-bsp/cmb-addon/cmb-addon-rtos_git.bb   |  41 --
 .../common-csl-ip/common-csl-ip-rtos_git.bb   |  23 -
 recipes-bsp/common-csl-ip/common-csl-ip.inc   |  23 -
 .../common-csl-ip/common-csl-ip_git.bb        |  17 -
 .../common-csl-ip/csl-rti-dwwdtest-fw_git.bb  |  77 --
 recipes-bsp/cppi-lld/cppi-lld-rtos_git.bb     |  10 -
 recipes-bsp/cppi-lld/cppi-lld-test_git.bb     |  29 -
 recipes-bsp/cppi-lld/cppi-lld.inc             |  19 -
 recipes-bsp/cppi-lld/cppi-lld_git.bb          |  38 -
 recipes-bsp/dfe-lld/dfe-lld-rtos_git.bb       |  12 -
 recipes-bsp/dfe-lld/dfe-lld-test_git.bb       |  20 -
 recipes-bsp/dfe-lld/dfe-lld.inc               |  14 -
 recipes-bsp/dfe-lld/dfe-lld_git.bb            |  20 -
 recipes-bsp/dsptop/debugss-module-drv_git.bb  |   4 +-
 recipes-bsp/dsptop/dsptop_git.bb              |   4 +-
 recipes-bsp/dsptop/libulm_git.bb              |   3 +-
 .../dsptop/temperature-module-drv_git.bb      |  18 -
 recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb   | 145 ----
 recipes-bsp/edma3-lld/edma3-lld.inc           |  17 -
 recipes-bsp/edma3-lld/edma3-lld_git.bb        |  78 ---
 recipes-bsp/emac-lld/emac-lld-rtos_git.bb     |  30 -
 recipes-bsp/emac-lld/emac-lld.inc             |   7 -
 recipes-bsp/fatfs-rtos/fatfs-rtos_git.bb      |  28 -
 .../faultmanagement-rtos_git.bb               |  36 -
 recipes-bsp/fftc-lld/fftc-lld-rtos_git.bb     |  22 -
 .../formfactor/beagleboard/machconfig         |   3 -
 .../formfactor/formfactor_0.0.bbappend        |   1 -
 recipes-bsp/fvid2/fvid2-rtos_git.bb           |  67 --
 recipes-bsp/gpio-lld/gpio-lld-rtos_git.bb     |  34 -
 recipes-bsp/gpmc-lld/gpmc-lld-rtos_git.bb     |  32 -
 recipes-bsp/hplib/hplib-mod_git.bb            |  22 -
 recipes-bsp/hplib/hplib-test_git.bb           |  32 -
 recipes-bsp/hplib/hplib.inc                   |  20 -
 recipes-bsp/hplib/hplib_git.bb                |  33 -
 recipes-bsp/hyplnk-lld/hyplnk-lld-rtos_git.bb |  12 -
 recipes-bsp/hyplnk-lld/hyplnk-lld-test_git.bb |  26 -
 recipes-bsp/hyplnk-lld/hyplnk-lld.inc         |  21 -
 recipes-bsp/hyplnk-lld/hyplnk-lld_git.bb      |  36 -
 recipes-bsp/i2c-lld/i2c-lld-rtos_git.bb       |  45 --
 recipes-bsp/ibl-boot/ibl-boot-rtos_git.bb     |  75 --
 .../icss-emac-lld/icss-emac-lld-rtos_git.bb   |  25 -
 .../icss-emac-lld/icss-emac-lld-test_git.bb   |  30 -
 recipes-bsp/icss-emac-lld/icss-emac-lld.inc   |  15 -
 .../icss-emac-lld/icss-emac-lld_git.bb        |  25 -
 recipes-bsp/iolink-lld/iolink-lld-rtos_git.bb |  33 -
 .../ipc-lld/ipc-lld-examples-rtos_git.bb      | 162 -----
 recipes-bsp/ipc-lld/ipc-lld-fw_git.bb         | 196 ------
 recipes-bsp/ipc-lld/ipc-lld-rtos_git.bb       |  45 --
 recipes-bsp/ipc-lld/ipc-lld.inc               |  29 -
 recipes-bsp/iqn2-lld/iqn2-lld-rtos_git.bb     |  12 -
 recipes-bsp/iqn2-lld/iqn2-lld-test_git.bb     |  18 -
 recipes-bsp/iqn2-lld/iqn2-lld.inc             |  13 -
 recipes-bsp/iqn2-lld/iqn2-lld_git.bb          |  25 -
 recipes-bsp/mad-utils/mad-utils-rtos_git.bb   |  57 --
 recipes-bsp/mcasp-lld/mcasp-lld-rtos_git.bb   |  41 --
 recipes-bsp/mcbsp-lld/mcbsp-lld-rtos_git.bb   |  30 -
 recipes-bsp/mmap-lld/mmap-lld-rtos_git.bb     |  10 -
 recipes-bsp/mmap-lld/mmap-lld-test_git.bb     |  44 --
 recipes-bsp/mmap-lld/mmap-lld.inc             |  22 -
 recipes-bsp/mmap-lld/mmap-lld_git.bb          |  15 -
 recipes-bsp/mmcsd-lld/mmcsd-lld-rtos_git.bb   |  41 --
 recipes-bsp/netcp-pa-fw/netcp-pa-fw_git.bb    |  50 --
 recipes-bsp/netcp-sa-fw/netcp-sa-fw_git.bb    |  23 -
 recipes-bsp/nwal-lld/nwal-lld-rtos_git.bb     |  19 -
 recipes-bsp/nwal-lld/nwal-lld-test_git.bb     |  27 -
 recipes-bsp/nwal-lld/nwal-lld.inc             |  21 -
 recipes-bsp/nwal-lld/nwal-lld_git.bb          |  27 -
 recipes-bsp/osal/osal-rtos_git.bb             |  18 -
 recipes-bsp/osal/osal-test_git.bb             |  20 -
 recipes-bsp/osal/osal.inc                     |  15 -
 recipes-bsp/osal/osal_git.bb                  |  21 -
 recipes-bsp/pa-lld/pa-lld-rtos_git.bb         |  12 -
 recipes-bsp/pa-lld/pa-lld-test_git.bb         |  30 -
 recipes-bsp/pa-lld/pa-lld.inc                 |  24 -
 recipes-bsp/pa-lld/pa-lld_git.bb              |  27 -
 recipes-bsp/pcie-lld/pcie-lld-rtos_git.bb     |  28 -
 recipes-bsp/pktlib/pktlib-rtos_git.bb         |  10 -
 recipes-bsp/pktlib/pktlib.inc                 |  24 -
 recipes-bsp/pktlib/pktlib_git.bb              |  19 -
 recipes-bsp/pm-lld/pm-lld-rtos_git.bb         |  71 --
 .../ti-sgx-ddk-km_1.17.4948957.bb             |   4 +-
 recipes-bsp/pru/pru-icss_git.bb               |  32 +-
 recipes-bsp/pru/pru-pwm-fw_git.bb             |  39 --
 ...t-add-Makefile-for-building-firmware.patch | 145 ----
 ...ss_uart-remove-dependency-on-PDK-CSL.patch |  54 --
 recipes-bsp/pru/pru-swuart-fw_git.bb          |  40 --
 recipes-bsp/pruss-lld/pruss-lld-apps_git.bb   |  31 -
 recipes-bsp/pruss-lld/pruss-lld-rtos_git.bb   |  22 -
 recipes-bsp/pruss-lld/pruss-lld-test_git.bb   |  27 -
 recipes-bsp/pruss-lld/pruss-lld.inc           |  15 -
 recipes-bsp/pruss-lld/pruss-lld_git.bb        |  21 -
 recipes-bsp/qmss-lld/qmss-lld-rtos_git.bb     |   9 -
 recipes-bsp/qmss-lld/qmss-lld-test_git.bb     |  30 -
 recipes-bsp/qmss-lld/qmss-lld.inc             |  19 -
 recipes-bsp/qmss-lld/qmss-lld_git.bb          |  38 -
 recipes-bsp/qmss-pdsp-fw/qmss-pdsp-fw_git.bb  |  26 -
 recipes-bsp/rm-lld/rm-lld-rtos_git.bb         |  13 -
 recipes-bsp/rm-lld/rm-lld.inc                 |  15 -
 recipes-bsp/rm-lld/rm-lld_git.bb              |  33 -
 recipes-bsp/sa-lld/sa-lld-rtos_git.bb         |  26 -
 recipes-bsp/sa-lld/sa-lld-test_git.bb         |  46 --
 recipes-bsp/sa-lld/sa-lld.inc                 |  21 -
 recipes-bsp/sa-lld/sa-lld_git.bb              |  26 -
 recipes-bsp/sciclient/sciclient-rtos_git.bb   | 125 ----
 .../serdes-diag/serdes-diag-rtos_git.bb       |  35 -
 recipes-bsp/serdes-fw/serdes-fw_git.bb        |  27 -
 recipes-bsp/spi-lld/spi-lld-rtos_git.bb       |  37 -
 recipes-bsp/srio-lld/srio-lld-rtos_git.bb     |  17 -
 recipes-bsp/srio-lld/srio-lld-test_git.bb     |  30 -
 recipes-bsp/srio-lld/srio-lld.inc             |  18 -
 recipes-bsp/srio-lld/srio-lld_git.bb          |  21 -
 recipes-bsp/srss-tc/srss-tc_git.bb            |  33 -
 .../starterware/starterware-rtos_git.bb       |  33 -
 recipes-bsp/starterware/starterware.inc       |  21 -
 recipes-bsp/starterware/starterware_git.bb    |  16 -
 recipes-bsp/tcp3d-lld/tcp3d-lld-rtos_git.bb   |  23 -
 .../ti-ocf-crypto-module_1.0.bb               |  35 -
 .../ti-pdk-source/ti-pdk-source_git.bb        |  33 -
 recipes-bsp/ti-sci-fw/ti-sci-fw_0.1.1.50.bb   |  37 -
 .../traceframework/traceframework-rtos_git.bb |  10 -
 recipes-bsp/traceframework/traceframework.inc |  27 -
 .../traceframework/traceframework_git.bb      |  40 --
 .../transport-rtos/bmet-eth-rtos_git.bb       |  19 -
 .../transport-rtos/nimu-icss-rtos_git.bb      |  29 -
 recipes-bsp/transport-rtos/nimu-rtos_git.bb   |  35 -
 .../transport-rtos/timesync-rtos_git.bb       |  31 -
 recipes-bsp/transport-rtos/transport.inc      |  11 -
 .../trusted-firmware-a_%.bbappend             |   4 +-
 recipes-bsp/tsip-lld/tsip-lld-rtos_git.bb     |  18 -
 recipes-bsp/u-boot/u-boot-ti.inc              | 126 ----
 recipes-bsp/uart-lld/uart-lld-rtos_git.bb     |  41 --
 recipes-bsp/udma-lld/udma-lld-rtos_git.bb     |  65 --
 .../uio-module-drv/uio-module-drv-test_git.bb |  12 +-
 recipes-bsp/usb-lld/usb-lld-rtos_git.bb       |  29 -
 recipes-bsp/utils-rtos/profiling-rtos_git.bb  |  26 -
 recipes-bsp/utils-rtos/trace-rtos_git.bb      |  28 -
 recipes-bsp/vps-lld/vps-lld-rtos_git.bb       |  56 --
 recipes-bsp/wdtimer/wdtimer-rtos_git.bb       |  29 -
 recipes-bsp/x-load/signgp.bb                  |  20 -
 recipes-bsp/x-load/signgp/signGP.c            | 108 ---
 recipes-bsp/x-load/x-load.inc                 |  58 --
 .../x-load/0001-Beagle-Rev-C5-support.patch   |  60 --
 recipes-bsp/x-load/x-load/panda-frefclk.patch | 193 ------
 recipes-bsp/x-load/x-load_1.46-psp.bb         |  38 -
 recipes-bsp/x-load/x-load_git.bb              |  22 -
 .../init-ifupdown-1.0/beagleboard/interfaces  |  27 -
 .../init-ifupdown/init-ifupdown_1.0.bbappend  |   1 -
 .../doxygen/doxygen/patch-flex_2_6_0.diff     |  66 --
 recipes-devtools/doxygen/doxygen_1.8.9.1.bb   |  36 -
 recipes-devtools/gdbc6x/gdbc6x_git.bb         |   2 +-
 recipes-devtools/gdbc6x/gdbserver-c6x_git.bb  |   3 +-
 .../gdbc6x/gdbserverproxy-module-drv_git.bb   |   3 +-
 .../libgles/ti-sgx-ddk-um_1.17.4948957.bb     |   4 +-
 .../0001-selftests-add-ptp-to-TARGETS.patch   |  25 -
 ...oints-allow-to-cross-compile-for-aar.patch |  32 -
 .../0001-selftests-gpio-use-pkg-config.patch  |  53 --
 ...verride-CC-in-the-top-level-Makefile.patch |  22 -
 ...t-use-LDLIBS-to-link-against-libnuma.patch |  24 -
 ...se-LDLIBS-to-link-against-libpthread.patch |  23 -
 ...-selftests-sigaltstack-fix-packaging.patch |  26 -
 ...se-LDLIBS-to-link-against-libpthread.patch |  23 -
 recipes-kernel/kselftests/kselftests_4.10.bb  | 190 -----
 recipes-kernel/linux/files/k2e/cmem.dtsi      |  36 -
 recipes-kernel/linux/files/k2e/k2e-uio.dtsi   |  32 -
 recipes-kernel/linux/files/k2g/cmem.dtsi      |  37 -
 .../linux/files/k2g/keystone-k2g-pru-uio.dtsi | 391 -----------
 recipes-kernel/linux/files/k2hk/cmem.dtsi     |  37 -
 recipes-kernel/linux/files/k2hk/k2hk-uio.dtsi |  58 --
 recipes-kernel/linux/files/k2l/cmem.dtsi      |  37 -
 recipes-kernel/linux/files/k2l/k2l-uio.dtsi   |  10 -
 .../linux/files/keystone/keystone-uio.dtsi    | 186 -----
 recipes-kernel/linux/kernel-rdepends.inc      |  17 -
 .../linux/linux-ti-mainline/k2g/defconfig     |   1 -
 .../linux-ti-mainline/keystone/defconfig      |   1 -
 .../linux/linux-ti-staging-5.10/k2g/defconfig |   1 -
 .../linux-ti-staging-5.10/keystone/defconfig  |   1 -
 .../linux/linux-ti-staging-5.4/k2g/defconfig  |   1 -
 .../linux-ti-staging-5.4/keystone/defconfig   |   1 -
 .../linux-ti-staging-rt-5.10/k2g/defconfig    |   1 -
 .../keystone/defconfig                        |   1 -
 .../linux-ti-staging-rt-5.4/k2g/defconfig     |   1 -
 .../keystone/defconfig                        |   1 -
 .../k2g/defconfig                             |   1 -
 .../keystone/defconfig                        |   1 -
 .../k2g/defconfig                             |   1 -
 .../keystone/defconfig                        |   1 -
 recipes-kernel/linux/ti-uio.inc               |  21 -
 recipes-ti/bios/ti-biosutils.inc              |  18 -
 recipes-ti/bios/ti-biosutils_1.02.02.bb       |  12 -
 recipes-ti/bios/ti-dspbios.inc                |  25 -
 recipes-ti/ctoolslib/libaet_git.bb            |   3 +-
 .../gcc-linaro-baremetal-aarch64-native.bb    |  23 -
 .../devtools/gcc-linaro-baremetal-native.bb   |  23 -
 recipes-ti/devtools/gcc-linaro.inc            |  10 -
 recipes-ti/dmai/ti-dmai.inc                   | 162 -----
 recipes-ti/dmai/ti-dmai/arago-tdox            | 210 ------
 .../dmai/ti-dmai/doxygen_templates.tar.gz     | Bin 8012 -> 0 bytes
 .../dmai/ti-dmai/loadmodules-ti-dmai-apps.sh  |  37 -
 .../ti-dmai/loadmodules-ti-dmai-dm355_al.sh   |  23 -
 .../ti-dmai/loadmodules-ti-dmai-dm365_al.sh   |  25 -
 .../ti-dmai/loadmodules-ti-dmai-dm6446_al.sh  |  19 -
 .../ti-dmai/loadmodules-ti-dmai-dm6467_al.sh  |  19 -
 .../ti-dmai/loadmodules-ti-dmai-o3530_al.sh   |  42 --
 .../ti-dmai/loadmodules-ti-dmai-ol137_al.sh   |  19 -
 .../ti-dmai/loadmodules-ti-dmai-ol138_al.sh   |  19 -
 ...omap3530-r642-remove-include-videodev.diff |  64 --
 .../dmai/ti-dmai/r642-fix-config-bld.diff     |  48 --
 .../ti-dmai/remove-unneeded-includes.patch    |  26 -
 .../ti-dmai/unloadmodules-ti-dmai-apps.sh     |  12 -
 recipes-ti/dmai/ti-dmai_svn.bb                |  43 --
 recipes-ti/hdvpss/ti-hdvpss.inc               |  20 -
 recipes-ti/hdvpss/ti-hdvpss_01.00.01.27.bb    |   7 -
 recipes-ti/imglib/imglib-c66x.inc             |   2 +-
 recipes-ti/includes/ti-paths.inc              |  16 -
 .../ipc/ipc-transport-common-rtos_git.bb      |  23 -
 recipes-ti/ipc/ipc-transport-qmss-rtos_git.bb |  23 -
 recipes-ti/ipc/ipc-transport-qmss-test_git.bb |  37 -
 recipes-ti/ipc/ipc-transport-qmss.inc         |  14 -
 recipes-ti/ipc/ipc-transport-qmss_git.bb      |  19 -
 recipes-ti/ipc/ipc-transport-srio-rtos_git.bb |  22 -
 recipes-ti/ipc/ipc-transport-srio-test_git.bb |  32 -
 recipes-ti/ipc/ipc-transport-srio.inc         |  14 -
 recipes-ti/ipc/ipc-transport-srio_git.bb      |  19 -
 recipes-ti/ipc/ipc-transport.inc              |  15 -
 recipes-ti/ipc/ti-ipc-common.inc              |   8 -
 recipes-ti/ipc/ti-ipc-rtos.inc                |  15 -
 recipes-ti/ipc/ti-ipc-rtos_git.bb             |  23 -
 recipes-ti/ipc/ti-ipc_git.bb                  |   5 -
 recipes-ti/linuxutils/ti-linuxutils.inc       |  93 ---
 .../ti-linuxutils/linuxutils-BKL-fix-2.patch  |  22 -
 .../ti-linuxutils/linuxutils-BKL-fix.patch    |  73 --
 .../linuxutils_2_26-cmemk-fixes.patch         |  59 --
 .../linuxutils_2_26-sdmak-fixes.patch         |  25 -
 .../linuxutils/ti-linuxutils_2.26.01.02.bb    |  17 -
 recipes-ti/mpm-transport/mpm-transport_git.bb |  50 --
 .../multiprocmgr/multiprocmgr-rtos_git.bb     |  44 --
 .../multiprocmgr/multiprocmgr-test_git.bb     |  31 -
 recipes-ti/multiprocmgr/multiprocmgr.inc      |  21 -
 .../multiprocmgr/mpmsrv-daemon.service        |  14 -
 recipes-ti/multiprocmgr/multiprocmgr_git.bb   |  44 --
 recipes-ti/ndk/ti-ndk.inc                     |  20 -
 recipes-ti/ndk/ti-ndk_3.61.01.01.bb           |  17 -
 recipes-ti/ns/ti-ns.inc                       |  21 -
 recipes-ti/ns/ti-ns_2.60.01.06.bb             |  15 -
 recipes-ti/openmp-rtos/openmp-rtos_git.bb     |  13 +-
 .../ti-pdk-build/ti-pdk-build-rtos_git.bb     |  32 -
 recipes-ti/udma/udma_git.bb                   |  32 -
 .../uio-test-pruss/uio-test-pruss_git.bb      |   3 +-
 recipes-ti/vlib/vlib-c66x.inc                 |   2 +-
 302 files changed, 17 insertions(+), 10077 deletions(-)
 delete mode 100644 classes/ti-pdk-fetch.bbclass
 delete mode 100644 classes/ti-pdk.bbclass
 delete mode 100644 conf/machine/am3517-evm.conf
 delete mode 100644 conf/machine/am37x-evm.conf
 delete mode 100644 conf/machine/beagleboard.conf
 delete mode 100644 conf/machine/c665x-evm.conf
 delete mode 100644 conf/machine/c667x-evm.conf
 delete mode 100644 conf/machine/include/c66x.inc
 delete mode 100644 conf/machine/include/davinci.inc
 delete mode 100644 conf/machine/include/k2e.inc
 delete mode 100644 conf/machine/include/k2g.inc
 delete mode 100644 conf/machine/include/k2hk.inc
 delete mode 100644 conf/machine/include/k2l.inc
 delete mode 100644 conf/machine/include/keystone.inc
 delete mode 100644 conf/machine/include/omap3.inc
 delete mode 100644 conf/machine/include/omap4.inc
 delete mode 100644 conf/machine/include/omapl137.inc
 delete mode 100644 conf/machine/k2e-evm.conf
 delete mode 100644 conf/machine/k2e-hs-evm.conf
 delete mode 100644 conf/machine/k2g-evm.conf
 delete mode 100644 conf/machine/k2g-hs-evm.conf
 delete mode 100644 conf/machine/k2hk-evm.conf
 delete mode 100644 conf/machine/k2hk-hs-evm.conf
 delete mode 100644 conf/machine/k2l-evm.conf
 delete mode 100644 conf/machine/k2l-hs-evm.conf
 delete mode 100644 conf/machine/lego-ev3.conf
 delete mode 100644 conf/machine/omap3evm.conf
 delete mode 100644 conf/machine/omap5-evm.conf
 delete mode 100644 conf/machine/omapl137-evm.conf
 delete mode 100644 conf/machine/pandaboard.conf
 delete mode 100644 recipes-bsp/abefw/abefw_1.0.14.bb
 delete mode 100644 recipes-bsp/aif2-lld/aif2-lld-rtos_git.bb
 delete mode 100644 recipes-bsp/aif2-lld/aif2-lld-test_git.bb
 delete mode 100644 recipes-bsp/aif2-lld/aif2-lld.inc
 delete mode 100644 recipes-bsp/aif2-lld/aif2-lld_git.bb
 delete mode 100644 recipes-bsp/alsa-state/alsa-state.bbappend
 delete mode 100644 recipes-bsp/alsa-state/alsa-state/beagleboard/asound.=
state
 delete mode 100644 recipes-bsp/audk2g-addon/audk2g-addon-rtos_git.bb
 delete mode 100644 recipes-bsp/bcp-lld/bcp-lld-rtos_git.bb
 delete mode 100644 recipes-bsp/board-rtos/board-rtos_git.bb
 delete mode 100644 recipes-bsp/boot-monitor/boot-monitor_git.bb
 delete mode 100644 recipes-bsp/cal-lld/cal-lld-rtos_git.bb
 delete mode 100644 recipes-bsp/cmb-addon/cmb-addon-rtos_git.bb
 delete mode 100644 recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb
 delete mode 100644 recipes-bsp/common-csl-ip/common-csl-ip.inc
 delete mode 100644 recipes-bsp/common-csl-ip/common-csl-ip_git.bb
 delete mode 100644 recipes-bsp/common-csl-ip/csl-rti-dwwdtest-fw_git.bb
 delete mode 100644 recipes-bsp/cppi-lld/cppi-lld-rtos_git.bb
 delete mode 100644 recipes-bsp/cppi-lld/cppi-lld-test_git.bb
 delete mode 100644 recipes-bsp/cppi-lld/cppi-lld.inc
 delete mode 100644 recipes-bsp/cppi-lld/cppi-lld_git.bb
 delete mode 100644 recipes-bsp/dfe-lld/dfe-lld-rtos_git.bb
 delete mode 100644 recipes-bsp/dfe-lld/dfe-lld-test_git.bb
 delete mode 100644 recipes-bsp/dfe-lld/dfe-lld.inc
 delete mode 100644 recipes-bsp/dfe-lld/dfe-lld_git.bb
 delete mode 100644 recipes-bsp/dsptop/temperature-module-drv_git.bb
 delete mode 100644 recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb
 delete mode 100644 recipes-bsp/edma3-lld/edma3-lld.inc
 delete mode 100644 recipes-bsp/edma3-lld/edma3-lld_git.bb
 delete mode 100644 recipes-bsp/emac-lld/emac-lld-rtos_git.bb
 delete mode 100644 recipes-bsp/emac-lld/emac-lld.inc
 delete mode 100644 recipes-bsp/fatfs-rtos/fatfs-rtos_git.bb
 delete mode 100644 recipes-bsp/faultmanagement/faultmanagement-rtos_git.=
bb
 delete mode 100644 recipes-bsp/fftc-lld/fftc-lld-rtos_git.bb
 delete mode 100755 recipes-bsp/formfactor/formfactor/beagleboard/machcon=
fig
 delete mode 100644 recipes-bsp/formfactor/formfactor_0.0.bbappend
 delete mode 100644 recipes-bsp/fvid2/fvid2-rtos_git.bb
 delete mode 100644 recipes-bsp/gpio-lld/gpio-lld-rtos_git.bb
 delete mode 100644 recipes-bsp/gpmc-lld/gpmc-lld-rtos_git.bb
 delete mode 100644 recipes-bsp/hplib/hplib-mod_git.bb
 delete mode 100644 recipes-bsp/hplib/hplib-test_git.bb
 delete mode 100644 recipes-bsp/hplib/hplib.inc
 delete mode 100644 recipes-bsp/hplib/hplib_git.bb
 delete mode 100644 recipes-bsp/hyplnk-lld/hyplnk-lld-rtos_git.bb
 delete mode 100644 recipes-bsp/hyplnk-lld/hyplnk-lld-test_git.bb
 delete mode 100644 recipes-bsp/hyplnk-lld/hyplnk-lld.inc
 delete mode 100644 recipes-bsp/hyplnk-lld/hyplnk-lld_git.bb
 delete mode 100644 recipes-bsp/i2c-lld/i2c-lld-rtos_git.bb
 delete mode 100644 recipes-bsp/ibl-boot/ibl-boot-rtos_git.bb
 delete mode 100644 recipes-bsp/icss-emac-lld/icss-emac-lld-rtos_git.bb
 delete mode 100644 recipes-bsp/icss-emac-lld/icss-emac-lld-test_git.bb
 delete mode 100644 recipes-bsp/icss-emac-lld/icss-emac-lld.inc
 delete mode 100644 recipes-bsp/icss-emac-lld/icss-emac-lld_git.bb
 delete mode 100644 recipes-bsp/iolink-lld/iolink-lld-rtos_git.bb
 delete mode 100644 recipes-bsp/ipc-lld/ipc-lld-examples-rtos_git.bb
 delete mode 100644 recipes-bsp/ipc-lld/ipc-lld-fw_git.bb
 delete mode 100644 recipes-bsp/ipc-lld/ipc-lld-rtos_git.bb
 delete mode 100644 recipes-bsp/ipc-lld/ipc-lld.inc
 delete mode 100644 recipes-bsp/iqn2-lld/iqn2-lld-rtos_git.bb
 delete mode 100644 recipes-bsp/iqn2-lld/iqn2-lld-test_git.bb
 delete mode 100644 recipes-bsp/iqn2-lld/iqn2-lld.inc
 delete mode 100644 recipes-bsp/iqn2-lld/iqn2-lld_git.bb
 delete mode 100644 recipes-bsp/mad-utils/mad-utils-rtos_git.bb
 delete mode 100644 recipes-bsp/mcasp-lld/mcasp-lld-rtos_git.bb
 delete mode 100644 recipes-bsp/mcbsp-lld/mcbsp-lld-rtos_git.bb
 delete mode 100644 recipes-bsp/mmap-lld/mmap-lld-rtos_git.bb
 delete mode 100644 recipes-bsp/mmap-lld/mmap-lld-test_git.bb
 delete mode 100644 recipes-bsp/mmap-lld/mmap-lld.inc
 delete mode 100644 recipes-bsp/mmap-lld/mmap-lld_git.bb
 delete mode 100644 recipes-bsp/mmcsd-lld/mmcsd-lld-rtos_git.bb
 delete mode 100644 recipes-bsp/netcp-pa-fw/netcp-pa-fw_git.bb
 delete mode 100644 recipes-bsp/netcp-sa-fw/netcp-sa-fw_git.bb
 delete mode 100644 recipes-bsp/nwal-lld/nwal-lld-rtos_git.bb
 delete mode 100644 recipes-bsp/nwal-lld/nwal-lld-test_git.bb
 delete mode 100644 recipes-bsp/nwal-lld/nwal-lld.inc
 delete mode 100644 recipes-bsp/nwal-lld/nwal-lld_git.bb
 delete mode 100644 recipes-bsp/osal/osal-rtos_git.bb
 delete mode 100644 recipes-bsp/osal/osal-test_git.bb
 delete mode 100644 recipes-bsp/osal/osal.inc
 delete mode 100644 recipes-bsp/osal/osal_git.bb
 delete mode 100644 recipes-bsp/pa-lld/pa-lld-rtos_git.bb
 delete mode 100644 recipes-bsp/pa-lld/pa-lld-test_git.bb
 delete mode 100644 recipes-bsp/pa-lld/pa-lld.inc
 delete mode 100644 recipes-bsp/pa-lld/pa-lld_git.bb
 delete mode 100644 recipes-bsp/pcie-lld/pcie-lld-rtos_git.bb
 delete mode 100644 recipes-bsp/pktlib/pktlib-rtos_git.bb
 delete mode 100644 recipes-bsp/pktlib/pktlib.inc
 delete mode 100644 recipes-bsp/pktlib/pktlib_git.bb
 delete mode 100644 recipes-bsp/pm-lld/pm-lld-rtos_git.bb
 delete mode 100644 recipes-bsp/pru/pru-pwm-fw_git.bb
 delete mode 100644 recipes-bsp/pru/pru-swuart-fw/0001-icss_uart-add-Make=
file-for-building-firmware.patch
 delete mode 100644 recipes-bsp/pru/pru-swuart-fw/0001-icss_uart-remove-d=
ependency-on-PDK-CSL.patch
 delete mode 100644 recipes-bsp/pru/pru-swuart-fw_git.bb
 delete mode 100644 recipes-bsp/pruss-lld/pruss-lld-apps_git.bb
 delete mode 100644 recipes-bsp/pruss-lld/pruss-lld-rtos_git.bb
 delete mode 100644 recipes-bsp/pruss-lld/pruss-lld-test_git.bb
 delete mode 100644 recipes-bsp/pruss-lld/pruss-lld.inc
 delete mode 100644 recipes-bsp/pruss-lld/pruss-lld_git.bb
 delete mode 100644 recipes-bsp/qmss-lld/qmss-lld-rtos_git.bb
 delete mode 100644 recipes-bsp/qmss-lld/qmss-lld-test_git.bb
 delete mode 100644 recipes-bsp/qmss-lld/qmss-lld.inc
 delete mode 100644 recipes-bsp/qmss-lld/qmss-lld_git.bb
 delete mode 100644 recipes-bsp/qmss-pdsp-fw/qmss-pdsp-fw_git.bb
 delete mode 100644 recipes-bsp/rm-lld/rm-lld-rtos_git.bb
 delete mode 100644 recipes-bsp/rm-lld/rm-lld.inc
 delete mode 100644 recipes-bsp/rm-lld/rm-lld_git.bb
 delete mode 100644 recipes-bsp/sa-lld/sa-lld-rtos_git.bb
 delete mode 100644 recipes-bsp/sa-lld/sa-lld-test_git.bb
 delete mode 100644 recipes-bsp/sa-lld/sa-lld.inc
 delete mode 100644 recipes-bsp/sa-lld/sa-lld_git.bb
 delete mode 100644 recipes-bsp/sciclient/sciclient-rtos_git.bb
 delete mode 100644 recipes-bsp/serdes-diag/serdes-diag-rtos_git.bb
 delete mode 100644 recipes-bsp/serdes-fw/serdes-fw_git.bb
 delete mode 100644 recipes-bsp/spi-lld/spi-lld-rtos_git.bb
 delete mode 100644 recipes-bsp/srio-lld/srio-lld-rtos_git.bb
 delete mode 100644 recipes-bsp/srio-lld/srio-lld-test_git.bb
 delete mode 100644 recipes-bsp/srio-lld/srio-lld.inc
 delete mode 100644 recipes-bsp/srio-lld/srio-lld_git.bb
 delete mode 100644 recipes-bsp/srss-tc/srss-tc_git.bb
 delete mode 100644 recipes-bsp/starterware/starterware-rtos_git.bb
 delete mode 100644 recipes-bsp/starterware/starterware.inc
 delete mode 100644 recipes-bsp/starterware/starterware_git.bb
 delete mode 100644 recipes-bsp/tcp3d-lld/tcp3d-lld-rtos_git.bb
 delete mode 100644 recipes-bsp/ti-ocf-crypto-module/ti-ocf-crypto-module=
_1.0.bb
 delete mode 100644 recipes-bsp/ti-pdk-source/ti-pdk-source_git.bb
 delete mode 100644 recipes-bsp/ti-sci-fw/ti-sci-fw_0.1.1.50.bb
 delete mode 100644 recipes-bsp/traceframework/traceframework-rtos_git.bb
 delete mode 100644 recipes-bsp/traceframework/traceframework.inc
 delete mode 100644 recipes-bsp/traceframework/traceframework_git.bb
 delete mode 100644 recipes-bsp/transport-rtos/bmet-eth-rtos_git.bb
 delete mode 100644 recipes-bsp/transport-rtos/nimu-icss-rtos_git.bb
 delete mode 100644 recipes-bsp/transport-rtos/nimu-rtos_git.bb
 delete mode 100644 recipes-bsp/transport-rtos/timesync-rtos_git.bb
 delete mode 100644 recipes-bsp/transport-rtos/transport.inc
 delete mode 100644 recipes-bsp/tsip-lld/tsip-lld-rtos_git.bb
 delete mode 100644 recipes-bsp/uart-lld/uart-lld-rtos_git.bb
 delete mode 100644 recipes-bsp/udma-lld/udma-lld-rtos_git.bb
 delete mode 100644 recipes-bsp/usb-lld/usb-lld-rtos_git.bb
 delete mode 100644 recipes-bsp/utils-rtos/profiling-rtos_git.bb
 delete mode 100644 recipes-bsp/utils-rtos/trace-rtos_git.bb
 delete mode 100644 recipes-bsp/vps-lld/vps-lld-rtos_git.bb
 delete mode 100644 recipes-bsp/wdtimer/wdtimer-rtos_git.bb
 delete mode 100644 recipes-bsp/x-load/signgp.bb
 delete mode 100644 recipes-bsp/x-load/signgp/signGP.c
 delete mode 100644 recipes-bsp/x-load/x-load.inc
 delete mode 100644 recipes-bsp/x-load/x-load/0001-Beagle-Rev-C5-support.=
patch
 delete mode 100644 recipes-bsp/x-load/x-load/panda-frefclk.patch
 delete mode 100644 recipes-bsp/x-load/x-load_1.46-psp.bb
 delete mode 100644 recipes-bsp/x-load/x-load_git.bb
 delete mode 100644 recipes-core/init-ifupdown/init-ifupdown-1.0/beaglebo=
ard/interfaces
 delete mode 100644 recipes-core/init-ifupdown/init-ifupdown_1.0.bbappend
 delete mode 100644 recipes-devtools/doxygen/doxygen/patch-flex_2_6_0.dif=
f
 delete mode 100644 recipes-devtools/doxygen/doxygen_1.8.9.1.bb
 delete mode 100644 recipes-kernel/kselftests/files/0001-selftests-add-pt=
p-to-TARGETS.patch
 delete mode 100644 recipes-kernel/kselftests/files/0001-selftests-breakp=
oints-allow-to-cross-compile-for-aar.patch
 delete mode 100644 recipes-kernel/kselftests/files/0001-selftests-gpio-u=
se-pkg-config.patch
 delete mode 100644 recipes-kernel/kselftests/files/0001-selftests-lib-al=
low-to-override-CC-in-the-top-level-Makefile.patch
 delete mode 100644 recipes-kernel/kselftests/files/0001-selftests-net-us=
e-LDLIBS-to-link-against-libnuma.patch
 delete mode 100644 recipes-kernel/kselftests/files/0001-selftests-seccom=
p-use-LDLIBS-to-link-against-libpthread.patch
 delete mode 100644 recipes-kernel/kselftests/files/0001-selftests-sigalt=
stack-fix-packaging.patch
 delete mode 100644 recipes-kernel/kselftests/files/0001-selftests-timers=
-use-LDLIBS-to-link-against-libpthread.patch
 delete mode 100644 recipes-kernel/kselftests/kselftests_4.10.bb
 delete mode 100644 recipes-kernel/linux/files/k2e/cmem.dtsi
 delete mode 100644 recipes-kernel/linux/files/k2e/k2e-uio.dtsi
 delete mode 100644 recipes-kernel/linux/files/k2g/cmem.dtsi
 delete mode 100644 recipes-kernel/linux/files/k2g/keystone-k2g-pru-uio.d=
tsi
 delete mode 100644 recipes-kernel/linux/files/k2hk/cmem.dtsi
 delete mode 100644 recipes-kernel/linux/files/k2hk/k2hk-uio.dtsi
 delete mode 100644 recipes-kernel/linux/files/k2l/cmem.dtsi
 delete mode 100644 recipes-kernel/linux/files/k2l/k2l-uio.dtsi
 delete mode 100644 recipes-kernel/linux/files/keystone/keystone-uio.dtsi
 delete mode 100644 recipes-kernel/linux/linux-ti-mainline/k2g/defconfig
 delete mode 100644 recipes-kernel/linux/linux-ti-mainline/keystone/defco=
nfig
 delete mode 100644 recipes-kernel/linux/linux-ti-staging-5.10/k2g/defcon=
fig
 delete mode 100644 recipes-kernel/linux/linux-ti-staging-5.10/keystone/d=
efconfig
 delete mode 100644 recipes-kernel/linux/linux-ti-staging-5.4/k2g/defconf=
ig
 delete mode 100644 recipes-kernel/linux/linux-ti-staging-5.4/keystone/de=
fconfig
 delete mode 100644 recipes-kernel/linux/linux-ti-staging-rt-5.10/k2g/def=
config
 delete mode 100644 recipes-kernel/linux/linux-ti-staging-rt-5.10/keyston=
e/defconfig
 delete mode 100644 recipes-kernel/linux/linux-ti-staging-rt-5.4/k2g/defc=
onfig
 delete mode 100644 recipes-kernel/linux/linux-ti-staging-rt-5.4/keystone=
/defconfig
 delete mode 100644 recipes-kernel/linux/linux-ti-staging-systest-5.10/k2=
g/defconfig
 delete mode 100644 recipes-kernel/linux/linux-ti-staging-systest-5.10/ke=
ystone/defconfig
 delete mode 100644 recipes-kernel/linux/linux-ti-staging-systest-5.4/k2g=
/defconfig
 delete mode 100644 recipes-kernel/linux/linux-ti-staging-systest-5.4/key=
stone/defconfig
 delete mode 100644 recipes-ti/bios/ti-biosutils.inc
 delete mode 100644 recipes-ti/bios/ti-biosutils_1.02.02.bb
 delete mode 100644 recipes-ti/bios/ti-dspbios.inc
 delete mode 100644 recipes-ti/devtools/gcc-linaro-baremetal-aarch64-nati=
ve.bb
 delete mode 100644 recipes-ti/devtools/gcc-linaro-baremetal-native.bb
 delete mode 100644 recipes-ti/devtools/gcc-linaro.inc
 delete mode 100644 recipes-ti/dmai/ti-dmai.inc
 delete mode 100644 recipes-ti/dmai/ti-dmai/arago-tdox
 delete mode 100644 recipes-ti/dmai/ti-dmai/doxygen_templates.tar.gz
 delete mode 100755 recipes-ti/dmai/ti-dmai/loadmodules-ti-dmai-apps.sh
 delete mode 100755 recipes-ti/dmai/ti-dmai/loadmodules-ti-dmai-dm355_al.=
sh
 delete mode 100644 recipes-ti/dmai/ti-dmai/loadmodules-ti-dmai-dm365_al.=
sh
 delete mode 100755 recipes-ti/dmai/ti-dmai/loadmodules-ti-dmai-dm6446_al=
.sh
 delete mode 100755 recipes-ti/dmai/ti-dmai/loadmodules-ti-dmai-dm6467_al=
.sh
 delete mode 100755 recipes-ti/dmai/ti-dmai/loadmodules-ti-dmai-o3530_al.=
sh
 delete mode 100755 recipes-ti/dmai/ti-dmai/loadmodules-ti-dmai-ol137_al.=
sh
 delete mode 100755 recipes-ti/dmai/ti-dmai/loadmodules-ti-dmai-ol138_al.=
sh
 delete mode 100644 recipes-ti/dmai/ti-dmai/omap3530-r642-remove-include-=
videodev.diff
 delete mode 100644 recipes-ti/dmai/ti-dmai/r642-fix-config-bld.diff
 delete mode 100644 recipes-ti/dmai/ti-dmai/remove-unneeded-includes.patc=
h
 delete mode 100644 recipes-ti/dmai/ti-dmai/unloadmodules-ti-dmai-apps.sh
 delete mode 100644 recipes-ti/dmai/ti-dmai_svn.bb
 delete mode 100644 recipes-ti/hdvpss/ti-hdvpss.inc
 delete mode 100644 recipes-ti/hdvpss/ti-hdvpss_01.00.01.27.bb
 delete mode 100644 recipes-ti/ipc/ipc-transport-common-rtos_git.bb
 delete mode 100644 recipes-ti/ipc/ipc-transport-qmss-rtos_git.bb
 delete mode 100644 recipes-ti/ipc/ipc-transport-qmss-test_git.bb
 delete mode 100644 recipes-ti/ipc/ipc-transport-qmss.inc
 delete mode 100644 recipes-ti/ipc/ipc-transport-qmss_git.bb
 delete mode 100644 recipes-ti/ipc/ipc-transport-srio-rtos_git.bb
 delete mode 100644 recipes-ti/ipc/ipc-transport-srio-test_git.bb
 delete mode 100644 recipes-ti/ipc/ipc-transport-srio.inc
 delete mode 100644 recipes-ti/ipc/ipc-transport-srio_git.bb
 delete mode 100644 recipes-ti/ipc/ipc-transport.inc
 delete mode 100644 recipes-ti/linuxutils/ti-linuxutils.inc
 delete mode 100644 recipes-ti/linuxutils/ti-linuxutils/linuxutils-BKL-fi=
x-2.patch
 delete mode 100644 recipes-ti/linuxutils/ti-linuxutils/linuxutils-BKL-fi=
x.patch
 delete mode 100644 recipes-ti/linuxutils/ti-linuxutils/linuxutils_2_26-c=
memk-fixes.patch
 delete mode 100644 recipes-ti/linuxutils/ti-linuxutils/linuxutils_2_26-s=
dmak-fixes.patch
 delete mode 100644 recipes-ti/linuxutils/ti-linuxutils_2.26.01.02.bb
 delete mode 100644 recipes-ti/mpm-transport/mpm-transport_git.bb
 delete mode 100644 recipes-ti/multiprocmgr/multiprocmgr-rtos_git.bb
 delete mode 100644 recipes-ti/multiprocmgr/multiprocmgr-test_git.bb
 delete mode 100644 recipes-ti/multiprocmgr/multiprocmgr.inc
 delete mode 100644 recipes-ti/multiprocmgr/multiprocmgr/mpmsrv-daemon.se=
rvice
 delete mode 100644 recipes-ti/multiprocmgr/multiprocmgr_git.bb
 delete mode 100644 recipes-ti/ndk/ti-ndk.inc
 delete mode 100644 recipes-ti/ndk/ti-ndk_3.61.01.01.bb
 delete mode 100644 recipes-ti/ns/ti-ns.inc
 delete mode 100644 recipes-ti/ns/ti-ns_2.60.01.06.bb
 delete mode 100644 recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb
 delete mode 100644 recipes-ti/udma/udma_git.bb

--=20
2.25.1

