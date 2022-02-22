Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web09.8973.1645503242902797652
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 21 Feb 2022 20:14:03 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4ED0940C7F
	for <meta-ti@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:14:02 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZblUW7aETO7R for <meta-ti@lists.yoctoproject.org>;
	Tue, 22 Feb 2022 04:14:02 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 36DCA40A28
	for <meta-ti@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:14:02 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id EFC5E174738
	for <meta-ti@lists.yoctoproject.org>; Mon, 21 Feb 2022 23:14:01 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [PATCH 00/17] #2 - restructuring and more fixes
Date: Tue, 22 Feb 2022 04:13:44 +0000
Message-Id: <20220222041401.2840172-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Denys Dmytriyenko <denys@konsulko.com>

This is a second stab at improving meta-ti by restructuring it into multi=
ple
sub-layers - meta-ti-bsp, meta-ti-extras, etc. Also, pull in additional c=
leanup
fixes.

Here's a temp git tree with these patches applied to glance at:
https://github.com/denix0/meta-ti/tree/master

Awais Belal (1):
  ti-rtos-firmware: use nonarch_base_libdir for deployment

Denys Dmytriyenko (14):
  meta-ti: create a sub-layer meta-ti-bsp from existing content
  meta-ti: add MIT license file for the metadata and basic README
  meta-ti-extras: add sub-layer with extra components that don't belong
    to BSP
  meta-ti: move WiLink components to meta-ti-extras
  wlconf: explicitly specify source branch
  wl18xx-calibrator: explicitly specify source branch
  meta-ti: move BIOS,XDC,XDAIS,CGT,DSP libs and components to
    meta-ti-extras
  meta-ti-extras: setup layer custom licenses
  ti-ipc: use fuller path when including common files
  meta-ti: move cuia to meta-ti-extras
  meta-ti: move beaglebone-specific components to meta-ti-extras
  meta-ti: update ambiguous "BSD" license with "BSD-3-Clause"
  meta-ti: set layer compatibility with kirkstone
  meta-ti: use nonarch_base_libdir for firmware installations

Vivien Didelot (2):
  beaglebone: move kernel and dtb to packagegroup-core-boot
  ti33x: move screen feature to machine configs

 README                                        |  33 +-
 meta-ti-bsp/COPYING.MIT                       |  17 +
 meta-ti-bsp/README                            |  33 ++
 {conf =3D> meta-ti-bsp/conf}/layer.conf         |  10 +-
 .../conf}/machine/am335x-evm.conf             |   2 +-
 .../conf}/machine/am335x-hs-evm.conf          |   0
 .../conf}/machine/am437x-evm.conf             |   0
 .../conf}/machine/am437x-hs-evm.conf          |   0
 .../conf}/machine/am57xx-evm.conf             |   0
 .../conf}/machine/am57xx-hs-evm.conf          |   0
 .../conf}/machine/am64xx-evm-k3r5.conf        |   0
 .../conf}/machine/am64xx-evm.conf             |   0
 .../conf}/machine/am64xx-hs-evm-k3r5.conf     |   0
 .../conf}/machine/am64xx-hs-evm.conf          |   0
 .../conf}/machine/am65xx-evm-k3r5-sr2.conf    |   0
 .../conf}/machine/am65xx-evm-k3r5.conf        |   0
 .../conf}/machine/am65xx-evm.conf             |   0
 .../conf}/machine/am65xx-hs-evm-k3r5-sr2.conf |   0
 .../conf}/machine/am65xx-hs-evm-k3r5.conf     |   0
 .../conf}/machine/am65xx-hs-evm.conf          |   0
 .../conf}/machine/beagle-x15.conf             |   0
 .../conf}/machine/beaglebone.conf             |   4 +-
 .../conf}/machine/dra7xx-evm.conf             |   0
 .../conf}/machine/dra7xx-hs-evm.conf          |   0
 .../conf}/machine/include/am64xx.inc          |   0
 .../conf}/machine/include/am65xx.inc          |   0
 .../conf}/machine/include/dra7xx.inc          |   0
 .../conf}/machine/include/j7.inc              |   0
 .../conf}/machine/include/k3.inc              |   0
 .../conf}/machine/include/k3r5.inc            |   0
 .../conf}/machine/include/omap-a15.inc        |   0
 .../conf}/machine/include/omapl1.inc          |   0
 .../conf}/machine/include/omapl138.inc        |   0
 .../conf}/machine/include/ti-soc.inc          |   0
 .../conf}/machine/include/ti33x.inc           |   5 +-
 .../conf}/machine/include/ti43x.inc           |   0
 .../conf}/machine/j7-evm-k3r5.conf            |   0
 .../conf}/machine/j7-evm.conf                 |   0
 .../conf}/machine/j7-hs-evm-k3r5-sr1-1.conf   |   0
 .../conf}/machine/j7-hs-evm-k3r5.conf         |   0
 .../conf}/machine/j7-hs-evm.conf              |   0
 .../conf}/machine/j7200-evm-k3r5.conf         |   0
 .../conf}/machine/j7200-evm.conf              |   0
 .../conf}/machine/j7200-hs-evm-k3r5.conf      |   0
 .../conf}/machine/j7200-hs-evm.conf           |   0
 .../conf}/machine/omapl138-lcdk.conf          |   0
 .../conf}/multiconfig/k3r5-sr1-1.conf         |   0
 .../conf}/multiconfig/k3r5-sr2.conf           |   0
 .../conf}/multiconfig/k3r5.conf               |   0
 {licenses =3D> meta-ti-bsp/licenses}/TI-IMG     |   0
 {licenses =3D> meta-ti-bsp/licenses}/TI-TFL     |   0
 {licenses =3D> meta-ti-bsp/licenses}/TI-TSPA    |   0
 .../cadence-mhdp-fw/cadence-mhdp-fw_git.bb    |   6 +-
 .../cm3-pm-firmware/amx3-cm3_git.bb           |   8 +-
 .../recipes-bsp}/cmem/cmem-mod_git.bb         |   0
 .../recipes-bsp}/cmem/cmem.inc                |   0
 .../recipes-bsp}/cmem/cmem_git.bb             |   0
 .../cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb        |  10 +-
 .../ti-gc320-driver_5.0.11.p7.bb              |   0
 .../recipes-bsp}/goodix-fw/goodix-fw_git.bb   |   6 +-
 ...-OpenEmbedded-nodistro-internal-aarc.patch |   0
 .../ti-img-rogue-driver_1.13.5776728.bb       |   0
 .../ti-sgx-ddk-km_1.17.4948957.bb             |   0
 .../prueth-fw/prueth-fw-am65x-sr2_git.bb      |   6 +-
 .../prueth-fw/prueth-fw-am65x_git.bb          |   6 +-
 .../prueth-fw/prueth-fw_5.6.15.bb             |   6 +-
 .../pruhsr-fw/pruhsr-fw_2.17.25.bb            |   6 +-
 .../pruprp-fw/pruprp-fw_2.17.25.bb            |   6 +-
 .../prusw-fw/prusw-fw-am65x-sr2_git.bb        |   6 +-
 .../recipes-bsp}/prusw-fw/prusw-fw_3.2.9.bb   |   6 +-
 .../viddec-test-app_1.0.0.bb                  |   0
 .../videnc-test-app_1.0.0.bb                  |   0
 .../ti-img-encode-decode/vxd-dec-fw_git.bb    |   6 +-
 .../recipes-bsp}/ti-linux-fw/ti-linux-fw.inc  |   0
 ...gning-of-binaries-for-combined-boot-.patch |   0
 .../ti-sci-fw/ti-sci-fw-source_git.bb         |   0
 .../recipes-bsp}/ti-sci-fw/ti-sci-fw_git.bb   |   0
 .../trusted-firmware-a_%.bbappend             |   0
 .../u-boot/u-boot-ti-mainline_git.bb          |   0
 .../u-boot/u-boot-ti-staging_2020.01.bb       |   0
 .../u-boot/u-boot-ti-staging_2021.01.bb       |   0
 .../recipes-bsp}/u-boot/u-boot-ti.inc         |   0
 .../uio-module-drv/uio-module-drv-test_git.bb |   0
 .../uio-module-drv/uio-module-drv.inc         |   2 +-
 ...Replace-ioremap_nocache-with-ioremap.patch |   0
 .../uio-module-drv/uio-module-drv_git.bb      |   0
 .../recipes-bsp}/vis-fw/vis_01.50.07.15.bb    |   6 +-
 .../recipes-bsp}/vpdma-fw/vpdma-fw_03-2012.bb |   6 +-
 .../recipes-bsp}/vpe-tests/vpe-tests_git.bb   |   6 +-
 .../recipes-core}/udev/eudev/firmware.rules   |   0
 .../recipes-core}/udev/eudev/omap-tty.rules   |   0
 .../recipes-core}/udev/eudev_%.bbappend       |   0
 .../recipes-devtools}/ion/libion_git.bb       |   0
 .../recipes-devtools}/k3conf/k3conf_git.bb    |   0
 .../libgal/ti-gc320-libs_5.0.11.p7.bb         |   0
 .../ti-img-rogue-umlibs_1.13.5776728.bb       |   2 +-
 .../libgles/ti-sgx-ddk-um_1.17.4948957.bb     |   0
 .../linux/bundle-devicetree.inc               |   0
 .../recipes-kernel}/linux/cmem.inc            |   0
 .../recipes-kernel}/linux/files/cmem.dtsi     |   0
 .../recipes-kernel}/linux/files/configs/empty |   0
 .../linux/files/dra7xx/am571x-pru-uio.dtsi    |   0
 .../linux/files/dra7xx/am57xx-pru-uio.dtsi    |   0
 .../linux/files/dra7xx/cmem-am571x.dtsi       |   0
 .../dra7xx/cmem-am5729-beagleboneai.dtsi      |   0
 .../linux/files/dra7xx/cmem-am572idk.dtsi     |   0
 .../linux/files/dra7xx/cmem-am574x.dtsi       |   0
 .../linux/files/dra7xx/cmem-dra71x.dtsi       |   0
 .../linux/files/dra7xx/cmem-dra72x.dtsi       |   0
 .../linux/files/dra7xx/cmem-dra76x.dtsi       |   0
 .../linux/files/dra7xx/cmem.dtsi              |   0
 .../linux/files/ti33x/am335x-pru-uio.dtsi     |   0
 .../linux/files/ti43x/am437x-pru-uio.dtsi     |   0
 .../recipes-kernel}/linux/kernel-rdepends.inc |   0
 .../linux/linux-ti-mainline/defconfig         |   0
 .../linux/linux-ti-mainline/dra7xx/defconfig  |   0
 .../linux/linux-ti-mainline/k3/defconfig      |   0
 .../linux-ti-mainline/omapl138/defconfig      |   0
 .../linux/linux-ti-mainline/ti33x/defconfig   |   0
 .../linux/linux-ti-mainline/ti43x/defconfig   |   0
 .../linux/linux-ti-mainline_git.bb            |   0
 .../linux/linux-ti-staging-5.10/defconfig     |   0
 .../linux-ti-staging-5.10/dra7xx/defconfig    |   0
 .../linux/linux-ti-staging-5.10/k3/defconfig  |   0
 .../linux-ti-staging-5.10/omapl138/defconfig  |   0
 .../linux-ti-staging-5.10/ti33x/defconfig     |   0
 .../linux-ti-staging-5.10/ti43x/defconfig     |   0
 .../linux/linux-ti-staging-5.4/defconfig      |   0
 .../linux-ti-staging-5.4/dra7xx/defconfig     |   0
 .../linux/linux-ti-staging-5.4/k3/defconfig   |   0
 .../linux-ti-staging-5.4/omapl138/defconfig   |   0
 .../linux-ti-staging-5.4/ti33x/defconfig      |   0
 .../linux-ti-staging-5.4/ti43x/defconfig      |   0
 .../linux/linux-ti-staging-rt-5.10/defconfig  |   0
 .../linux-ti-staging-rt-5.10/dra7xx/defconfig |   0
 .../linux-ti-staging-rt-5.10/k3/defconfig     |   0
 .../linux-ti-staging-rt-5.10/ti33x/defconfig  |   0
 .../linux-ti-staging-rt-5.10/ti43x/defconfig  |   0
 .../linux/linux-ti-staging-rt-5.4/defconfig   |   0
 .../linux-ti-staging-rt-5.4/dra7xx/defconfig  |   0
 .../linux-ti-staging-rt-5.4/k3/defconfig      |   0
 .../linux-ti-staging-rt-5.4/ti33x/defconfig   |   0
 .../linux-ti-staging-rt-5.4/ti43x/defconfig   |   0
 .../linux/linux-ti-staging-rt_5.10.bb         |   0
 .../linux/linux-ti-staging-rt_5.4.bb          |   0
 .../linux-ti-staging-systest-5.10/defconfig   |   0
 .../dra7xx/defconfig                          |   0
 .../k3/defconfig                              |   0
 .../omapl138/defconfig                        |   0
 .../ti33x/defconfig                           |   0
 .../ti43x/defconfig                           |   0
 .../linux-ti-staging-systest-5.4/defconfig    |   0
 .../dra7xx/defconfig                          |   0
 .../linux-ti-staging-systest-5.4/k3/defconfig |   0
 .../omapl138/defconfig                        |   0
 .../ti33x/defconfig                           |   0
 .../ti43x/defconfig                           |   0
 .../linux/linux-ti-staging-systest_5.10.bb    |   0
 .../linux/linux-ti-staging-systest_5.4.bb     |   0
 .../linux/linux-ti-staging_5.10.bb            |   0
 .../linux/linux-ti-staging_5.4.bb             |   0
 .../recipes-kernel}/linux/setup-defconfig.inc |   0
 .../recipes-kernel}/linux/ti-kernel.inc       |   0
 .../recipes-kernel}/linux/ti-uio.inc          |   0
 .../recipes-security}/optee/optee-%.bbappend  |   0
 .../optee/optee-os_%.bbappend                 |   0
 .../recipes-ti}/ipc/ti-ipc-common.inc         |   0
 .../recipes-ti}/ipc/ti-ipc.inc                |   2 +-
 .../ti-ipc/0001-Add-kernel-build-dir.patch    |   0
 .../ipc/ti-ipc/omap_remoteproc.conf           |   0
 .../ipc/ti-ipc/tiipclad-daemon.service        |   0
 .../recipes-ti}/ipc/ti-ipc/tiipclad-daemon.sh |   0
 .../recipes-ti}/ipc/ti-ipc_git.bb             |   0
 ...-Remove-use-of-includedir-and-libdir.patch |   0
 .../ipc/ti-rpmsg-char-examples_git.bb         |   0
 .../recipes-ti}/ipc/ti-rpmsg-char.inc         |   0
 .../recipes-ti}/ipc/ti-rpmsg-char_git.bb      |   0
 .../recipes-ti}/ti-rtos-bin/files/empty       |   0
 .../ti-rtos-bin/ti-rtos-firmware.bb           | 102 ++---
 .../ti-rtos-bin/ti-rtos-metadata.bb           |   0
 .../wic}/sdimage-2part-efi.wks                |   0
 {wic =3D> meta-ti-bsp/wic}/sdimage-2part.wks    |   0
 meta-ti-extras/COPYING.MIT                    |  17 +
 meta-ti-extras/conf/layer.conf                |  18 +
 .../licenses}/Hewlett-Packard                 |   0
 .../licenses}/Patrick-Powell                  |   0
 .../Thai-Open-Source-Software-Center          |   0
 .../recipes-bsp}/bt-fw/bt-fw_git.bb           |   6 +-
 .../recipes-bsp}/dspdce-fw/dspdce-fw_git.bb   |  10 +-
 .../dsptop/debugss-module-drv_git.bb          |   0
 .../recipes-bsp}/dsptop/dsptop.inc            |   0
 .../recipes-bsp}/dsptop/dsptop_git.bb         |   2 +-
 .../recipes-bsp}/dsptop/libulm_git.bb         |   2 +-
 .../recipes-bsp}/ipumm-fw/ipumm-fw_git.bb     |  12 +-
 .../recipes-bsp/pru/pru-icss_git.bb           | 363 ++++++++++++++++++
 .../pru/ti-pru-sw-edma-driver_1.00.00.bb      |   0
 ...d-Makefile-to-install-firmware-files.patch |   0
 .../wl18xx-fw/wl18xx-fw_8.9.0.0.86.bb         |   0
 .../uim/uim-sysfs_8.5.bb                      |   0
 ...ine-EFUSE_PARAMETER_TYPE_ENMT-type-e.patch |   0
 .../wl18xx-calibrator_8.7.3.bb                |   4 +-
 ...sh-replace-system-bin-sh-with-bin-sh.patch |   0
 .../wl18xx-target-scripts_8.7.3.bb            |   0
 .../wlconf/wlconf_8.7.3.bb                    |   2 +-
 .../recipes-devtools}/cuia/cuia_1.0.0.13.bb   |   0
 .../recipes-devtools}/gdbc6x/gdbc6x.inc       |   0
 ...h-suppress-GCC9-Wstringop-truncation.patch |   0
 .../recipes-devtools}/gdbc6x/gdbc6x/init      |   0
 .../recipes-devtools}/gdbc6x/gdbc6x_git.bb    |   0
 .../gdbc6x/gdbserver-c6x_git.bb               |   2 +-
 .../gdbc6x/gdbserverproxy-module-drv_git.bb   |   0
 .../libdce/libdce_3.00.14.00.bb               |   2 +-
 .../recipes-ti}/README                        |   0
 .../beagleboard/beaglebone-capes.bb           |   0
 .../beagleboard/beaglebone-capes/cape-stop.sh |   0
 .../beagleboard/beaglebone-capes/cape.service |   0
 .../beagleboard/beaglebone-capes/cape.sh      |   0
 .../beagleboard/beaglebone-getting-started.bb |   0
 .../recipes-ti}/beagleboard/gadget-init.bb    |   0
 .../gadget-init/bone-gmass-eject.rules        |   0
 .../beagleboard/gadget-init/g-ether-load.sh   |   0
 .../gadget-init/g-ether-start-service.sh      |   0
 .../gadget-init/g-storage-reinsert.sh         |   0
 .../gadget-init/network-gadget-init.service   |   0
 .../gadget-init/storage-gadget-init.service   |   0
 .../beagleboard/gadget-init/udhcpd.conf       |   0
 .../beagleboard/gadget-init/udhcpd.rules      |   0
 .../beagleboard/gadget-init/udhcpd.service    |   0
 .../update-image-info-on-mmcblk0p1.sh         |   0
 .../recipes-ti}/bios/ti-sysbios.inc           |   2 +-
 .../recipes-ti}/bios/ti-sysbios_6.76.03.01.bb |   0
 .../ti-codec-engine_3.24.00.08.bb             |   2 +-
 .../recipes-ti}/ctoolslib/libaet_git.bb       |   2 +-
 .../gcc-arm-baremetal_7-2018-q2-update.bb     |   0
 .../recipes-ti}/devtools/ti-cg-xml_2.61.00.bb |   2 +-
 .../devtools/ti-cgt-arm_18.12.5.bb            |   0
 .../recipes-ti}/devtools/ti-cgt-pru_2.3.2.bb  |   0
 .../recipes-ti}/devtools/ti-cgt470.inc        |   0
 .../recipes-ti}/devtools/ti-cgt470_4.6.6.bb   |   0
 .../recipes-ti}/devtools/ti-cgt6x-7_7.4.16.bb |   0
 .../recipes-ti}/devtools/ti-cgt6x_8.3.2.bb    |   0
 .../recipes-ti}/devtools/ti-cgt7x_1.2.0.bb    |   0
 .../devtools/ti-xdctools-common.inc           |   2 +-
 .../recipes-ti}/devtools/ti-xdctools-core.inc |   0
 .../recipes-ti}/devtools/ti-xdctools.inc      |   0
 .../devtools/ti-xdctools_3.55.02.22.bb        |   0
 .../recipes-ti}/dsplib/dsplib-c64xp_git.bb    |   0
 .../recipes-ti}/dsplib/dsplib-c66x_git.bb     |   0
 .../recipes-ti}/dsplib/dsplib-c674x_git.bb    |   0
 .../recipes-ti}/dsplib/dsplib.inc             |   0
 .../ti-framework-components.inc               |   2 +-
 .../ti-framework-components_2.26.00.01.bb     |   0
 .../ti-framework-components_3.40.02.07.bb     |   0
 .../recipes-ti}/imglib/imglib-c66x.inc        |   0
 .../recipes-ti}/imglib/imglib-c66x_3.1.1.0.bb |   0
 .../recipes-ti}/includes/ti-eula-unpack.inc   |   0
 .../recipes-ti}/includes/ti-paths.inc         |   0
 .../recipes-ti}/includes/ti-staging.inc       |   0
 .../recipes-ti}/includes/ti-unpack.inc        |   0
 ...Mgr-sys_errlist-has-been-deprecated-.patch |   0
 .../ipc/ti-ipc-examples-linux_git.bb          |   0
 .../recipes-ti}/ipc/ti-ipc-examples.inc       |   4 +-
 .../recipes-ti}/ipc/ti-ipc-examples_git.bb    |   0
 .../recipes-ti}/ipc/ti-ipc-rtos.inc           |   0
 .../recipes-ti}/ipc/ti-ipc-rtos_git.bb        |  10 +-
 .../recipes-ti}/mathlib/mathlib-c66x_git.bb   |   0
 .../recipes-ti}/mathlib/mathlib-c674x_git.bb  |   0
 .../recipes-ti}/mathlib/mathlib.inc           |   0
 .../openmp-rtos/openmp-rtos_git.bb            |   2 +-
 .../recipes-ti}/osal/ti-osal.inc              |   2 +-
 .../recipes-ti}/osal/ti-osal_1.24.00.09.bb    |   0
 .../recipes-ti}/swtools/swtools_git.bb        |   2 +-
 .../uio-test-pruss/uio-test-pruss_git.bb      |   0
 .../recipes-ti}/vlib/vlib-c66x.inc            |   0
 .../recipes-ti}/vlib/vlib-c66x_3.2.1.0.bb     |   0
 .../recipes-ti}/xdais/ti-xdais.inc            |   0
 .../recipes-ti}/xdais/ti-xdais_6.26.01.03.bb  |   0
 .../recipes-ti}/xdais/ti-xdais_7.24.00.04.bb  |   0
 recipes-bsp/pru/pru-icss_git.bb               | 363 ------------------
 279 files changed, 598 insertions(+), 545 deletions(-)
 create mode 100644 meta-ti-bsp/COPYING.MIT
 create mode 100644 meta-ti-bsp/README
 rename {conf =3D> meta-ti-bsp/conf}/layer.conf (70%)
 rename {conf =3D> meta-ti-bsp/conf}/machine/am335x-evm.conf (96%)
 rename {conf =3D> meta-ti-bsp/conf}/machine/am335x-hs-evm.conf (100%)
 rename {conf =3D> meta-ti-bsp/conf}/machine/am437x-evm.conf (100%)
 rename {conf =3D> meta-ti-bsp/conf}/machine/am437x-hs-evm.conf (100%)
 rename {conf =3D> meta-ti-bsp/conf}/machine/am57xx-evm.conf (100%)
 rename {conf =3D> meta-ti-bsp/conf}/machine/am57xx-hs-evm.conf (100%)
 rename {conf =3D> meta-ti-bsp/conf}/machine/am64xx-evm-k3r5.conf (100%)
 rename {conf =3D> meta-ti-bsp/conf}/machine/am64xx-evm.conf (100%)
 rename {conf =3D> meta-ti-bsp/conf}/machine/am64xx-hs-evm-k3r5.conf (100=
%)
 rename {conf =3D> meta-ti-bsp/conf}/machine/am64xx-hs-evm.conf (100%)
 rename {conf =3D> meta-ti-bsp/conf}/machine/am65xx-evm-k3r5-sr2.conf (10=
0%)
 rename {conf =3D> meta-ti-bsp/conf}/machine/am65xx-evm-k3r5.conf (100%)
 rename {conf =3D> meta-ti-bsp/conf}/machine/am65xx-evm.conf (100%)
 rename {conf =3D> meta-ti-bsp/conf}/machine/am65xx-hs-evm-k3r5-sr2.conf =
(100%)
 rename {conf =3D> meta-ti-bsp/conf}/machine/am65xx-hs-evm-k3r5.conf (100=
%)
 rename {conf =3D> meta-ti-bsp/conf}/machine/am65xx-hs-evm.conf (100%)
 rename {conf =3D> meta-ti-bsp/conf}/machine/beagle-x15.conf (100%)
 rename {conf =3D> meta-ti-bsp/conf}/machine/beaglebone.conf (79%)
 rename {conf =3D> meta-ti-bsp/conf}/machine/dra7xx-evm.conf (100%)
 rename {conf =3D> meta-ti-bsp/conf}/machine/dra7xx-hs-evm.conf (100%)
 rename {conf =3D> meta-ti-bsp/conf}/machine/include/am64xx.inc (100%)
 rename {conf =3D> meta-ti-bsp/conf}/machine/include/am65xx.inc (100%)
 rename {conf =3D> meta-ti-bsp/conf}/machine/include/dra7xx.inc (100%)
 rename {conf =3D> meta-ti-bsp/conf}/machine/include/j7.inc (100%)
 rename {conf =3D> meta-ti-bsp/conf}/machine/include/k3.inc (100%)
 rename {conf =3D> meta-ti-bsp/conf}/machine/include/k3r5.inc (100%)
 rename {conf =3D> meta-ti-bsp/conf}/machine/include/omap-a15.inc (100%)
 rename {conf =3D> meta-ti-bsp/conf}/machine/include/omapl1.inc (100%)
 rename {conf =3D> meta-ti-bsp/conf}/machine/include/omapl138.inc (100%)
 rename {conf =3D> meta-ti-bsp/conf}/machine/include/ti-soc.inc (100%)
 rename {conf =3D> meta-ti-bsp/conf}/machine/include/ti33x.inc (91%)
 rename {conf =3D> meta-ti-bsp/conf}/machine/include/ti43x.inc (100%)
 rename {conf =3D> meta-ti-bsp/conf}/machine/j7-evm-k3r5.conf (100%)
 rename {conf =3D> meta-ti-bsp/conf}/machine/j7-evm.conf (100%)
 rename {conf =3D> meta-ti-bsp/conf}/machine/j7-hs-evm-k3r5-sr1-1.conf (1=
00%)
 rename {conf =3D> meta-ti-bsp/conf}/machine/j7-hs-evm-k3r5.conf (100%)
 rename {conf =3D> meta-ti-bsp/conf}/machine/j7-hs-evm.conf (100%)
 rename {conf =3D> meta-ti-bsp/conf}/machine/j7200-evm-k3r5.conf (100%)
 rename {conf =3D> meta-ti-bsp/conf}/machine/j7200-evm.conf (100%)
 rename {conf =3D> meta-ti-bsp/conf}/machine/j7200-hs-evm-k3r5.conf (100%=
)
 rename {conf =3D> meta-ti-bsp/conf}/machine/j7200-hs-evm.conf (100%)
 rename {conf =3D> meta-ti-bsp/conf}/machine/omapl138-lcdk.conf (100%)
 rename {conf =3D> meta-ti-bsp/conf}/multiconfig/k3r5-sr1-1.conf (100%)
 rename {conf =3D> meta-ti-bsp/conf}/multiconfig/k3r5-sr2.conf (100%)
 rename {conf =3D> meta-ti-bsp/conf}/multiconfig/k3r5.conf (100%)
 rename {licenses =3D> meta-ti-bsp/licenses}/TI-IMG (100%)
 rename {licenses =3D> meta-ti-bsp/licenses}/TI-TFL (100%)
 rename {licenses =3D> meta-ti-bsp/licenses}/TI-TSPA (100%)
 rename {recipes-bsp =3D> meta-ti-bsp/recipes-bsp}/cadence-mhdp-fw/cadenc=
e-mhdp-fw_git.bb (67%)
 rename {recipes-bsp =3D> meta-ti-bsp/recipes-bsp}/cm3-pm-firmware/amx3-c=
m3_git.bb (69%)
 rename {recipes-bsp =3D> meta-ti-bsp/recipes-bsp}/cmem/cmem-mod_git.bb (=
100%)
 rename {recipes-bsp =3D> meta-ti-bsp/recipes-bsp}/cmem/cmem.inc (100%)
 rename {recipes-bsp =3D> meta-ti-bsp/recipes-bsp}/cmem/cmem_git.bb (100%=
)
 rename {recipes-bsp =3D> meta-ti-bsp/recipes-bsp}/cpsw9g-eth-fw/cpsw9g-e=
th-fw_git.bb (71%)
 rename {recipes-bsp =3D> meta-ti-bsp/recipes-bsp}/gc320-drivers/ti-gc320=
-driver_5.0.11.p7.bb (100%)
 rename {recipes-bsp =3D> meta-ti-bsp/recipes-bsp}/goodix-fw/goodix-fw_gi=
t.bb (71%)
 rename {recipes-bsp =3D> meta-ti-bsp/recipes-bsp}/powervr-drivers/ti-img=
-rogue-driver/0001-compiler-support-OpenEmbedded-nodistro-internal-aarc.p=
atch (100%)
 rename {recipes-bsp =3D> meta-ti-bsp/recipes-bsp}/powervr-drivers/ti-img=
-rogue-driver_1.13.5776728.bb (100%)
 rename {recipes-bsp =3D> meta-ti-bsp/recipes-bsp}/powervr-drivers/ti-sgx=
-ddk-km_1.17.4948957.bb (100%)
 rename {recipes-bsp =3D> meta-ti-bsp/recipes-bsp}/prueth-fw/prueth-fw-am=
65x-sr2_git.bb (75%)
 rename {recipes-bsp =3D> meta-ti-bsp/recipes-bsp}/prueth-fw/prueth-fw-am=
65x_git.bb (71%)
 rename {recipes-bsp =3D> meta-ti-bsp/recipes-bsp}/prueth-fw/prueth-fw_5.=
6.15.bb (77%)
 rename {recipes-bsp =3D> meta-ti-bsp/recipes-bsp}/pruhsr-fw/pruhsr-fw_2.=
17.25.bb (77%)
 rename {recipes-bsp =3D> meta-ti-bsp/recipes-bsp}/pruprp-fw/pruprp-fw_2.=
17.25.bb (77%)
 rename {recipes-bsp =3D> meta-ti-bsp/recipes-bsp}/prusw-fw/prusw-fw-am65=
x-sr2_git.bb (75%)
 rename {recipes-bsp =3D> meta-ti-bsp/recipes-bsp}/prusw-fw/prusw-fw_3.2.=
9.bb (77%)
 rename {recipes-bsp =3D> meta-ti-bsp/recipes-bsp}/ti-img-encode-decode/v=
iddec-test-app_1.0.0.bb (100%)
 rename {recipes-bsp =3D> meta-ti-bsp/recipes-bsp}/ti-img-encode-decode/v=
idenc-test-app_1.0.0.bb (100%)
 rename {recipes-bsp =3D> meta-ti-bsp/recipes-bsp}/ti-img-encode-decode/v=
xd-dec-fw_git.bb (66%)
 rename {recipes-bsp =3D> meta-ti-bsp/recipes-bsp}/ti-linux-fw/ti-linux-f=
w.inc (100%)
 rename {recipes-bsp =3D> meta-ti-bsp/recipes-bsp}/ti-sci-fw/files/0001-M=
akefile-Skip-signing-of-binaries-for-combined-boot-.patch (100%)
 rename {recipes-bsp =3D> meta-ti-bsp/recipes-bsp}/ti-sci-fw/ti-sci-fw-so=
urce_git.bb (100%)
 rename {recipes-bsp =3D> meta-ti-bsp/recipes-bsp}/ti-sci-fw/ti-sci-fw_gi=
t.bb (100%)
 rename {recipes-bsp =3D> meta-ti-bsp/recipes-bsp}/trusted-firmware-a/tru=
sted-firmware-a_%.bbappend (100%)
 rename {recipes-bsp =3D> meta-ti-bsp/recipes-bsp}/u-boot/u-boot-ti-mainl=
ine_git.bb (100%)
 rename {recipes-bsp =3D> meta-ti-bsp/recipes-bsp}/u-boot/u-boot-ti-stagi=
ng_2020.01.bb (100%)
 rename {recipes-bsp =3D> meta-ti-bsp/recipes-bsp}/u-boot/u-boot-ti-stagi=
ng_2021.01.bb (100%)
 rename {recipes-bsp =3D> meta-ti-bsp/recipes-bsp}/u-boot/u-boot-ti.inc (=
100%)
 rename {recipes-bsp =3D> meta-ti-bsp/recipes-bsp}/uio-module-drv/uio-mod=
ule-drv-test_git.bb (100%)
 rename {recipes-bsp =3D> meta-ti-bsp/recipes-bsp}/uio-module-drv/uio-mod=
ule-drv.inc (95%)
 rename {recipes-bsp =3D> meta-ti-bsp/recipes-bsp}/uio-module-drv/uio-mod=
ule-drv/0001-uio-module-drv-Replace-ioremap_nocache-with-ioremap.patch (1=
00%)
 rename {recipes-bsp =3D> meta-ti-bsp/recipes-bsp}/uio-module-drv/uio-mod=
ule-drv_git.bb (100%)
 rename {recipes-bsp =3D> meta-ti-bsp/recipes-bsp}/vis-fw/vis_01.50.07.15=
.bb (82%)
 rename {recipes-bsp =3D> meta-ti-bsp/recipes-bsp}/vpdma-fw/vpdma-fw_03-2=
012.bb (78%)
 rename {recipes-bsp =3D> meta-ti-bsp/recipes-bsp}/vpe-tests/vpe-tests_gi=
t.bb (85%)
 rename {recipes-core =3D> meta-ti-bsp/recipes-core}/udev/eudev/firmware.=
rules (100%)
 rename {recipes-core =3D> meta-ti-bsp/recipes-core}/udev/eudev/omap-tty.=
rules (100%)
 rename {recipes-core =3D> meta-ti-bsp/recipes-core}/udev/eudev_%.bbappen=
d (100%)
 rename {recipes-devtools =3D> meta-ti-bsp/recipes-devtools}/ion/libion_g=
it.bb (100%)
 rename {recipes-devtools =3D> meta-ti-bsp/recipes-devtools}/k3conf/k3con=
f_git.bb (100%)
 rename {recipes-graphics =3D> meta-ti-bsp/recipes-graphics}/libgal/ti-gc=
320-libs_5.0.11.p7.bb (100%)
 rename {recipes-graphics =3D> meta-ti-bsp/recipes-graphics}/libgles/ti-i=
mg-rogue-umlibs_1.13.5776728.bb (97%)
 rename {recipes-graphics =3D> meta-ti-bsp/recipes-graphics}/libgles/ti-s=
gx-ddk-um_1.17.4948957.bb (100%)
 rename {recipes-kernel =3D> meta-ti-bsp/recipes-kernel}/linux/bundle-dev=
icetree.inc (100%)
 rename {recipes-kernel =3D> meta-ti-bsp/recipes-kernel}/linux/cmem.inc (=
100%)
 rename {recipes-kernel =3D> meta-ti-bsp/recipes-kernel}/linux/files/cmem=
.dtsi (100%)
 rename {recipes-kernel =3D> meta-ti-bsp/recipes-kernel}/linux/files/conf=
igs/empty (100%)
 rename {recipes-kernel =3D> meta-ti-bsp/recipes-kernel}/linux/files/dra7=
xx/am571x-pru-uio.dtsi (100%)
 rename {recipes-kernel =3D> meta-ti-bsp/recipes-kernel}/linux/files/dra7=
xx/am57xx-pru-uio.dtsi (100%)
 rename {recipes-kernel =3D> meta-ti-bsp/recipes-kernel}/linux/files/dra7=
xx/cmem-am571x.dtsi (100%)
 rename {recipes-kernel =3D> meta-ti-bsp/recipes-kernel}/linux/files/dra7=
xx/cmem-am5729-beagleboneai.dtsi (100%)
 rename {recipes-kernel =3D> meta-ti-bsp/recipes-kernel}/linux/files/dra7=
xx/cmem-am572idk.dtsi (100%)
 rename {recipes-kernel =3D> meta-ti-bsp/recipes-kernel}/linux/files/dra7=
xx/cmem-am574x.dtsi (100%)
 rename {recipes-kernel =3D> meta-ti-bsp/recipes-kernel}/linux/files/dra7=
xx/cmem-dra71x.dtsi (100%)
 rename {recipes-kernel =3D> meta-ti-bsp/recipes-kernel}/linux/files/dra7=
xx/cmem-dra72x.dtsi (100%)
 rename {recipes-kernel =3D> meta-ti-bsp/recipes-kernel}/linux/files/dra7=
xx/cmem-dra76x.dtsi (100%)
 rename {recipes-kernel =3D> meta-ti-bsp/recipes-kernel}/linux/files/dra7=
xx/cmem.dtsi (100%)
 rename {recipes-kernel =3D> meta-ti-bsp/recipes-kernel}/linux/files/ti33=
x/am335x-pru-uio.dtsi (100%)
 rename {recipes-kernel =3D> meta-ti-bsp/recipes-kernel}/linux/files/ti43=
x/am437x-pru-uio.dtsi (100%)
 rename {recipes-kernel =3D> meta-ti-bsp/recipes-kernel}/linux/kernel-rde=
pends.inc (100%)
 rename {recipes-kernel =3D> meta-ti-bsp/recipes-kernel}/linux/linux-ti-m=
ainline/defconfig (100%)
 rename {recipes-kernel =3D> meta-ti-bsp/recipes-kernel}/linux/linux-ti-m=
ainline/dra7xx/defconfig (100%)
 rename {recipes-kernel =3D> meta-ti-bsp/recipes-kernel}/linux/linux-ti-m=
ainline/k3/defconfig (100%)
 rename {recipes-kernel =3D> meta-ti-bsp/recipes-kernel}/linux/linux-ti-m=
ainline/omapl138/defconfig (100%)
 rename {recipes-kernel =3D> meta-ti-bsp/recipes-kernel}/linux/linux-ti-m=
ainline/ti33x/defconfig (100%)
 rename {recipes-kernel =3D> meta-ti-bsp/recipes-kernel}/linux/linux-ti-m=
ainline/ti43x/defconfig (100%)
 rename {recipes-kernel =3D> meta-ti-bsp/recipes-kernel}/linux/linux-ti-m=
ainline_git.bb (100%)
 rename {recipes-kernel =3D> meta-ti-bsp/recipes-kernel}/linux/linux-ti-s=
taging-5.10/defconfig (100%)
 rename {recipes-kernel =3D> meta-ti-bsp/recipes-kernel}/linux/linux-ti-s=
taging-5.10/dra7xx/defconfig (100%)
 rename {recipes-kernel =3D> meta-ti-bsp/recipes-kernel}/linux/linux-ti-s=
taging-5.10/k3/defconfig (100%)
 rename {recipes-kernel =3D> meta-ti-bsp/recipes-kernel}/linux/linux-ti-s=
taging-5.10/omapl138/defconfig (100%)
 rename {recipes-kernel =3D> meta-ti-bsp/recipes-kernel}/linux/linux-ti-s=
taging-5.10/ti33x/defconfig (100%)
 rename {recipes-kernel =3D> meta-ti-bsp/recipes-kernel}/linux/linux-ti-s=
taging-5.10/ti43x/defconfig (100%)
 rename {recipes-kernel =3D> meta-ti-bsp/recipes-kernel}/linux/linux-ti-s=
taging-5.4/defconfig (100%)
 rename {recipes-kernel =3D> meta-ti-bsp/recipes-kernel}/linux/linux-ti-s=
taging-5.4/dra7xx/defconfig (100%)
 rename {recipes-kernel =3D> meta-ti-bsp/recipes-kernel}/linux/linux-ti-s=
taging-5.4/k3/defconfig (100%)
 rename {recipes-kernel =3D> meta-ti-bsp/recipes-kernel}/linux/linux-ti-s=
taging-5.4/omapl138/defconfig (100%)
 rename {recipes-kernel =3D> meta-ti-bsp/recipes-kernel}/linux/linux-ti-s=
taging-5.4/ti33x/defconfig (100%)
 rename {recipes-kernel =3D> meta-ti-bsp/recipes-kernel}/linux/linux-ti-s=
taging-5.4/ti43x/defconfig (100%)
 rename {recipes-kernel =3D> meta-ti-bsp/recipes-kernel}/linux/linux-ti-s=
taging-rt-5.10/defconfig (100%)
 rename {recipes-kernel =3D> meta-ti-bsp/recipes-kernel}/linux/linux-ti-s=
taging-rt-5.10/dra7xx/defconfig (100%)
 rename {recipes-kernel =3D> meta-ti-bsp/recipes-kernel}/linux/linux-ti-s=
taging-rt-5.10/k3/defconfig (100%)
 rename {recipes-kernel =3D> meta-ti-bsp/recipes-kernel}/linux/linux-ti-s=
taging-rt-5.10/ti33x/defconfig (100%)
 rename {recipes-kernel =3D> meta-ti-bsp/recipes-kernel}/linux/linux-ti-s=
taging-rt-5.10/ti43x/defconfig (100%)
 rename {recipes-kernel =3D> meta-ti-bsp/recipes-kernel}/linux/linux-ti-s=
taging-rt-5.4/defconfig (100%)
 rename {recipes-kernel =3D> meta-ti-bsp/recipes-kernel}/linux/linux-ti-s=
taging-rt-5.4/dra7xx/defconfig (100%)
 rename {recipes-kernel =3D> meta-ti-bsp/recipes-kernel}/linux/linux-ti-s=
taging-rt-5.4/k3/defconfig (100%)
 rename {recipes-kernel =3D> meta-ti-bsp/recipes-kernel}/linux/linux-ti-s=
taging-rt-5.4/ti33x/defconfig (100%)
 rename {recipes-kernel =3D> meta-ti-bsp/recipes-kernel}/linux/linux-ti-s=
taging-rt-5.4/ti43x/defconfig (100%)
 rename {recipes-kernel =3D> meta-ti-bsp/recipes-kernel}/linux/linux-ti-s=
taging-rt_5.10.bb (100%)
 rename {recipes-kernel =3D> meta-ti-bsp/recipes-kernel}/linux/linux-ti-s=
taging-rt_5.4.bb (100%)
 rename {recipes-kernel =3D> meta-ti-bsp/recipes-kernel}/linux/linux-ti-s=
taging-systest-5.10/defconfig (100%)
 rename {recipes-kernel =3D> meta-ti-bsp/recipes-kernel}/linux/linux-ti-s=
taging-systest-5.10/dra7xx/defconfig (100%)
 rename {recipes-kernel =3D> meta-ti-bsp/recipes-kernel}/linux/linux-ti-s=
taging-systest-5.10/k3/defconfig (100%)
 rename {recipes-kernel =3D> meta-ti-bsp/recipes-kernel}/linux/linux-ti-s=
taging-systest-5.10/omapl138/defconfig (100%)
 rename {recipes-kernel =3D> meta-ti-bsp/recipes-kernel}/linux/linux-ti-s=
taging-systest-5.10/ti33x/defconfig (100%)
 rename {recipes-kernel =3D> meta-ti-bsp/recipes-kernel}/linux/linux-ti-s=
taging-systest-5.10/ti43x/defconfig (100%)
 rename {recipes-kernel =3D> meta-ti-bsp/recipes-kernel}/linux/linux-ti-s=
taging-systest-5.4/defconfig (100%)
 rename {recipes-kernel =3D> meta-ti-bsp/recipes-kernel}/linux/linux-ti-s=
taging-systest-5.4/dra7xx/defconfig (100%)
 rename {recipes-kernel =3D> meta-ti-bsp/recipes-kernel}/linux/linux-ti-s=
taging-systest-5.4/k3/defconfig (100%)
 rename {recipes-kernel =3D> meta-ti-bsp/recipes-kernel}/linux/linux-ti-s=
taging-systest-5.4/omapl138/defconfig (100%)
 rename {recipes-kernel =3D> meta-ti-bsp/recipes-kernel}/linux/linux-ti-s=
taging-systest-5.4/ti33x/defconfig (100%)
 rename {recipes-kernel =3D> meta-ti-bsp/recipes-kernel}/linux/linux-ti-s=
taging-systest-5.4/ti43x/defconfig (100%)
 rename {recipes-kernel =3D> meta-ti-bsp/recipes-kernel}/linux/linux-ti-s=
taging-systest_5.10.bb (100%)
 rename {recipes-kernel =3D> meta-ti-bsp/recipes-kernel}/linux/linux-ti-s=
taging-systest_5.4.bb (100%)
 rename {recipes-kernel =3D> meta-ti-bsp/recipes-kernel}/linux/linux-ti-s=
taging_5.10.bb (100%)
 rename {recipes-kernel =3D> meta-ti-bsp/recipes-kernel}/linux/linux-ti-s=
taging_5.4.bb (100%)
 rename {recipes-kernel =3D> meta-ti-bsp/recipes-kernel}/linux/setup-defc=
onfig.inc (100%)
 rename {recipes-kernel =3D> meta-ti-bsp/recipes-kernel}/linux/ti-kernel.=
inc (100%)
 rename {recipes-kernel =3D> meta-ti-bsp/recipes-kernel}/linux/ti-uio.inc=
 (100%)
 rename {recipes-security =3D> meta-ti-bsp/recipes-security}/optee/optee-=
%.bbappend (100%)
 rename {recipes-security =3D> meta-ti-bsp/recipes-security}/optee/optee-=
os_%.bbappend (100%)
 rename {recipes-ti =3D> meta-ti-bsp/recipes-ti}/ipc/ti-ipc-common.inc (1=
00%)
 rename {recipes-ti =3D> meta-ti-bsp/recipes-ti}/ipc/ti-ipc.inc (96%)
 rename {recipes-ti =3D> meta-ti-bsp/recipes-ti}/ipc/ti-ipc/0001-Add-kern=
el-build-dir.patch (100%)
 rename {recipes-ti =3D> meta-ti-bsp/recipes-ti}/ipc/ti-ipc/omap_remotepr=
oc.conf (100%)
 rename {recipes-ti =3D> meta-ti-bsp/recipes-ti}/ipc/ti-ipc/tiipclad-daem=
on.service (100%)
 rename {recipes-ti =3D> meta-ti-bsp/recipes-ti}/ipc/ti-ipc/tiipclad-daem=
on.sh (100%)
 rename {recipes-ti =3D> meta-ti-bsp/recipes-ti}/ipc/ti-ipc_git.bb (100%)
 rename {recipes-ti =3D> meta-ti-bsp/recipes-ti}/ipc/ti-rpmsg-char-exampl=
es/0001-examples-Remove-use-of-includedir-and-libdir.patch (100%)
 rename {recipes-ti =3D> meta-ti-bsp/recipes-ti}/ipc/ti-rpmsg-char-exampl=
es_git.bb (100%)
 rename {recipes-ti =3D> meta-ti-bsp/recipes-ti}/ipc/ti-rpmsg-char.inc (1=
00%)
 rename {recipes-ti =3D> meta-ti-bsp/recipes-ti}/ipc/ti-rpmsg-char_git.bb=
 (100%)
 rename {recipes-ti =3D> meta-ti-bsp/recipes-ti}/ti-rtos-bin/files/empty =
(100%)
 rename {recipes-ti =3D> meta-ti-bsp/recipes-ti}/ti-rtos-bin/ti-rtos-firm=
ware.bb (65%)
 rename {recipes-ti =3D> meta-ti-bsp/recipes-ti}/ti-rtos-bin/ti-rtos-meta=
data.bb (100%)
 rename {wic =3D> meta-ti-bsp/wic}/sdimage-2part-efi.wks (100%)
 rename {wic =3D> meta-ti-bsp/wic}/sdimage-2part.wks (100%)
 create mode 100644 meta-ti-extras/COPYING.MIT
 create mode 100644 meta-ti-extras/conf/layer.conf
 rename {licenses =3D> meta-ti-extras/licenses}/Hewlett-Packard (100%)
 rename {licenses =3D> meta-ti-extras/licenses}/Patrick-Powell (100%)
 rename {licenses =3D> meta-ti-extras/licenses}/Thai-Open-Source-Software=
-Center (100%)
 rename {recipes-bsp =3D> meta-ti-extras/recipes-bsp}/bt-fw/bt-fw_git.bb =
(64%)
 rename {recipes-bsp =3D> meta-ti-extras/recipes-bsp}/dspdce-fw/dspdce-fw=
_git.bb (79%)
 rename {recipes-bsp =3D> meta-ti-extras/recipes-bsp}/dsptop/debugss-modu=
le-drv_git.bb (100%)
 rename {recipes-bsp =3D> meta-ti-extras/recipes-bsp}/dsptop/dsptop.inc (=
100%)
 rename {recipes-bsp =3D> meta-ti-extras/recipes-bsp}/dsptop/dsptop_git.b=
b (95%)
 rename {recipes-bsp =3D> meta-ti-extras/recipes-bsp}/dsptop/libulm_git.b=
b (97%)
 rename {recipes-bsp =3D> meta-ti-extras/recipes-bsp}/ipumm-fw/ipumm-fw_g=
it.bb (76%)
 create mode 100644 meta-ti-extras/recipes-bsp/pru/pru-icss_git.bb
 rename {recipes-bsp =3D> meta-ti-extras/recipes-bsp}/pru/ti-pru-sw-edma-=
driver_1.00.00.bb (100%)
 rename {recipes-bsp =3D> meta-ti-extras/recipes-bsp}/wl18xx-fw/wl18xx-fw=
/0001-Add-Makefile-to-install-firmware-files.patch (100%)
 rename {recipes-bsp =3D> meta-ti-extras/recipes-bsp}/wl18xx-fw/wl18xx-fw=
_8.9.0.0.86.bb (100%)
 rename {recipes-connectivity =3D> meta-ti-extras/recipes-connectivity}/u=
im/uim-sysfs_8.5.bb (100%)
 rename {recipes-connectivity =3D> meta-ti-extras/recipes-connectivity}/w=
l18xx-calibrator/wl18xx-calibrator/0001-plt.h-Do-not-define-EFUSE_PARAMET=
ER_TYPE_ENMT-type-e.patch (100%)
 rename {recipes-connectivity =3D> meta-ti-extras/recipes-connectivity}/w=
l18xx-calibrator/wl18xx-calibrator_8.7.3.bb (87%)
 rename {recipes-connectivity =3D> meta-ti-extras/recipes-connectivity}/w=
l18xx-target-scripts/wl18xx-target-scripts/0001-print_stat.sh-replace-sys=
tem-bin-sh-with-bin-sh.patch (100%)
 rename {recipes-connectivity =3D> meta-ti-extras/recipes-connectivity}/w=
l18xx-target-scripts/wl18xx-target-scripts_8.7.3.bb (100%)
 rename {recipes-connectivity =3D> meta-ti-extras/recipes-connectivity}/w=
lconf/wlconf_8.7.3.bb (94%)
 rename {recipes-bsp =3D> meta-ti-extras/recipes-devtools}/cuia/cuia_1.0.=
0.13.bb (100%)
 rename {recipes-devtools =3D> meta-ti-extras/recipes-devtools}/gdbc6x/gd=
bc6x.inc (100%)
 rename {recipes-devtools =3D> meta-ti-extras/recipes-devtools}/gdbc6x/gd=
bc6x/0001-libbfd.h-suppress-GCC9-Wstringop-truncation.patch (100%)
 rename {recipes-devtools =3D> meta-ti-extras/recipes-devtools}/gdbc6x/gd=
bc6x/init (100%)
 rename {recipes-devtools =3D> meta-ti-extras/recipes-devtools}/gdbc6x/gd=
bc6x_git.bb (100%)
 rename {recipes-devtools =3D> meta-ti-extras/recipes-devtools}/gdbc6x/gd=
bserver-c6x_git.bb (97%)
 rename {recipes-devtools =3D> meta-ti-extras/recipes-devtools}/gdbc6x/gd=
bserverproxy-module-drv_git.bb (100%)
 rename {recipes-multimedia =3D> meta-ti-extras/recipes-multimedia}/libdc=
e/libdce_3.00.14.00.bb (95%)
 rename {recipes-ti =3D> meta-ti-extras/recipes-ti}/README (100%)
 rename {recipes-ti =3D> meta-ti-extras/recipes-ti}/beagleboard/beaglebon=
e-capes.bb (100%)
 rename {recipes-ti =3D> meta-ti-extras/recipes-ti}/beagleboard/beaglebon=
e-capes/cape-stop.sh (100%)
 rename {recipes-ti =3D> meta-ti-extras/recipes-ti}/beagleboard/beaglebon=
e-capes/cape.service (100%)
 rename {recipes-ti =3D> meta-ti-extras/recipes-ti}/beagleboard/beaglebon=
e-capes/cape.sh (100%)
 rename {recipes-ti =3D> meta-ti-extras/recipes-ti}/beagleboard/beaglebon=
e-getting-started.bb (100%)
 rename {recipes-ti =3D> meta-ti-extras/recipes-ti}/beagleboard/gadget-in=
it.bb (100%)
 rename {recipes-ti =3D> meta-ti-extras/recipes-ti}/beagleboard/gadget-in=
it/bone-gmass-eject.rules (100%)
 rename {recipes-ti =3D> meta-ti-extras/recipes-ti}/beagleboard/gadget-in=
it/g-ether-load.sh (100%)
 rename {recipes-ti =3D> meta-ti-extras/recipes-ti}/beagleboard/gadget-in=
it/g-ether-start-service.sh (100%)
 rename {recipes-ti =3D> meta-ti-extras/recipes-ti}/beagleboard/gadget-in=
it/g-storage-reinsert.sh (100%)
 rename {recipes-ti =3D> meta-ti-extras/recipes-ti}/beagleboard/gadget-in=
it/network-gadget-init.service (100%)
 rename {recipes-ti =3D> meta-ti-extras/recipes-ti}/beagleboard/gadget-in=
it/storage-gadget-init.service (100%)
 rename {recipes-ti =3D> meta-ti-extras/recipes-ti}/beagleboard/gadget-in=
it/udhcpd.conf (100%)
 rename {recipes-ti =3D> meta-ti-extras/recipes-ti}/beagleboard/gadget-in=
it/udhcpd.rules (100%)
 rename {recipes-ti =3D> meta-ti-extras/recipes-ti}/beagleboard/gadget-in=
it/udhcpd.service (100%)
 rename {recipes-ti =3D> meta-ti-extras/recipes-ti}/beagleboard/gadget-in=
it/update-image-info-on-mmcblk0p1.sh (100%)
 rename {recipes-ti =3D> meta-ti-extras/recipes-ti}/bios/ti-sysbios.inc (=
97%)
 rename {recipes-ti =3D> meta-ti-extras/recipes-ti}/bios/ti-sysbios_6.76.=
03.01.bb (100%)
 rename {recipes-ti =3D> meta-ti-extras/recipes-ti}/codec-engine/ti-codec=
-engine_3.24.00.08.bb (97%)
 rename {recipes-ti =3D> meta-ti-extras/recipes-ti}/ctoolslib/libaet_git.=
bb (97%)
 rename {recipes-ti =3D> meta-ti-extras/recipes-ti}/devtools/gcc-arm-bare=
metal_7-2018-q2-update.bb (100%)
 rename {recipes-ti =3D> meta-ti-extras/recipes-ti}/devtools/ti-cg-xml_2.=
61.00.bb (98%)
 rename {recipes-ti =3D> meta-ti-extras/recipes-ti}/devtools/ti-cgt-arm_1=
8.12.5.bb (100%)
 rename {recipes-ti =3D> meta-ti-extras/recipes-ti}/devtools/ti-cgt-pru_2=
.3.2.bb (100%)
 rename {recipes-ti =3D> meta-ti-extras/recipes-ti}/devtools/ti-cgt470.in=
c (100%)
 rename {recipes-ti =3D> meta-ti-extras/recipes-ti}/devtools/ti-cgt470_4.=
6.6.bb (100%)
 rename {recipes-ti =3D> meta-ti-extras/recipes-ti}/devtools/ti-cgt6x-7_7=
.4.16.bb (100%)
 rename {recipes-ti =3D> meta-ti-extras/recipes-ti}/devtools/ti-cgt6x_8.3=
.2.bb (100%)
 rename {recipes-ti =3D> meta-ti-extras/recipes-ti}/devtools/ti-cgt7x_1.2=
.0.bb (100%)
 rename {recipes-ti =3D> meta-ti-extras/recipes-ti}/devtools/ti-xdctools-=
common.inc (97%)
 rename {recipes-ti =3D> meta-ti-extras/recipes-ti}/devtools/ti-xdctools-=
core.inc (100%)
 rename {recipes-ti =3D> meta-ti-extras/recipes-ti}/devtools/ti-xdctools.=
inc (100%)
 rename {recipes-ti =3D> meta-ti-extras/recipes-ti}/devtools/ti-xdctools_=
3.55.02.22.bb (100%)
 rename {recipes-ti =3D> meta-ti-extras/recipes-ti}/dsplib/dsplib-c64xp_g=
it.bb (100%)
 rename {recipes-ti =3D> meta-ti-extras/recipes-ti}/dsplib/dsplib-c66x_gi=
t.bb (100%)
 rename {recipes-ti =3D> meta-ti-extras/recipes-ti}/dsplib/dsplib-c674x_g=
it.bb (100%)
 rename {recipes-ti =3D> meta-ti-extras/recipes-ti}/dsplib/dsplib.inc (10=
0%)
 rename {recipes-ti =3D> meta-ti-extras/recipes-ti}/framework-components/=
ti-framework-components.inc (96%)
 rename {recipes-ti =3D> meta-ti-extras/recipes-ti}/framework-components/=
ti-framework-components_2.26.00.01.bb (100%)
 rename {recipes-ti =3D> meta-ti-extras/recipes-ti}/framework-components/=
ti-framework-components_3.40.02.07.bb (100%)
 rename {recipes-ti =3D> meta-ti-extras/recipes-ti}/imglib/imglib-c66x.in=
c (100%)
 rename {recipes-ti =3D> meta-ti-extras/recipes-ti}/imglib/imglib-c66x_3.=
1.1.0.bb (100%)
 rename {recipes-ti =3D> meta-ti-extras/recipes-ti}/includes/ti-eula-unpa=
ck.inc (100%)
 rename {recipes-ti =3D> meta-ti-extras/recipes-ti}/includes/ti-paths.inc=
 (100%)
 rename {recipes-ti =3D> meta-ti-extras/recipes-ti}/includes/ti-staging.i=
nc (100%)
 rename {recipes-ti =3D> meta-ti-extras/recipes-ti}/includes/ti-unpack.in=
c (100%)
 rename {recipes-ti =3D> meta-ti-extras/recipes-ti}/ipc/ti-ipc-examples-l=
inux/0001-examples-ClusterMgr-sys_errlist-has-been-deprecated-.patch (100=
%)
 rename {recipes-ti =3D> meta-ti-extras/recipes-ti}/ipc/ti-ipc-examples-l=
inux_git.bb (100%)
 rename {recipes-ti =3D> meta-ti-extras/recipes-ti}/ipc/ti-ipc-examples.i=
nc (91%)
 rename {recipes-ti =3D> meta-ti-extras/recipes-ti}/ipc/ti-ipc-examples_g=
it.bb (100%)
 rename {recipes-ti =3D> meta-ti-extras/recipes-ti}/ipc/ti-ipc-rtos.inc (=
100%)
 rename {recipes-ti =3D> meta-ti-extras/recipes-ti}/ipc/ti-ipc-rtos_git.b=
b (93%)
 rename {recipes-ti =3D> meta-ti-extras/recipes-ti}/mathlib/mathlib-c66x_=
git.bb (100%)
 rename {recipes-ti =3D> meta-ti-extras/recipes-ti}/mathlib/mathlib-c674x=
_git.bb (100%)
 rename {recipes-ti =3D> meta-ti-extras/recipes-ti}/mathlib/mathlib.inc (=
100%)
 rename {recipes-ti =3D> meta-ti-extras/recipes-ti}/openmp-rtos/openmp-rt=
os_git.bb (98%)
 rename {recipes-ti =3D> meta-ti-extras/recipes-ti}/osal/ti-osal.inc (95%=
)
 rename {recipes-ti =3D> meta-ti-extras/recipes-ti}/osal/ti-osal_1.24.00.=
09.bb (100%)
 rename {recipes-ti =3D> meta-ti-extras/recipes-ti}/swtools/swtools_git.b=
b (98%)
 rename {recipes-ti =3D> meta-ti-extras/recipes-ti}/uio-test-pruss/uio-te=
st-pruss_git.bb (100%)
 rename {recipes-ti =3D> meta-ti-extras/recipes-ti}/vlib/vlib-c66x.inc (1=
00%)
 rename {recipes-ti =3D> meta-ti-extras/recipes-ti}/vlib/vlib-c66x_3.2.1.=
0.bb (100%)
 rename {recipes-ti =3D> meta-ti-extras/recipes-ti}/xdais/ti-xdais.inc (1=
00%)
 rename {recipes-ti =3D> meta-ti-extras/recipes-ti}/xdais/ti-xdais_6.26.0=
1.03.bb (100%)
 rename {recipes-ti =3D> meta-ti-extras/recipes-ti}/xdais/ti-xdais_7.24.0=
0.04.bb (100%)
 delete mode 100644 recipes-bsp/pru/pru-icss_git.bb

--=20
2.25.1


