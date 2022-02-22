Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.8944.1645503243152496976
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 21 Feb 2022 20:14:03 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 683A440C52
	for <meta-ti@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:14:02 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 76PSqlhqBNsU for <meta-ti@lists.yoctoproject.org>;
	Tue, 22 Feb 2022 04:14:02 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 3F31140C2E
	for <meta-ti@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:14:02 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 0B92A17476C
	for <meta-ti@lists.yoctoproject.org>; Mon, 21 Feb 2022 23:14:02 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [PATCH 01/17] meta-ti: create a sub-layer meta-ti-bsp from existing content
Date: Tue, 22 Feb 2022 04:13:45 +0000
Message-Id: <20220222041401.2840172-2-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220222041401.2840172-1-denis@denix.org>
References: <20220222041401.2840172-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Denys Dmytriyenko <denys@konsulko.com>

Extra sub-layers will be created next and relevant content moved across t=
hem.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 COPYING.MIT =3D> meta-ti-bsp/COPYING.MIT                 |  0
 README =3D> meta-ti-bsp/README                           |  0
 {conf =3D> meta-ti-bsp/conf}/layer.conf                  | 10 +++++-----
 {conf =3D> meta-ti-bsp/conf}/machine/am335x-evm.conf     |  0
 {conf =3D> meta-ti-bsp/conf}/machine/am335x-hs-evm.conf  |  0
 {conf =3D> meta-ti-bsp/conf}/machine/am437x-evm.conf     |  0
 {conf =3D> meta-ti-bsp/conf}/machine/am437x-hs-evm.conf  |  0
 {conf =3D> meta-ti-bsp/conf}/machine/am57xx-evm.conf     |  0
 {conf =3D> meta-ti-bsp/conf}/machine/am57xx-hs-evm.conf  |  0
 .../conf}/machine/am64xx-evm-k3r5.conf                 |  0
 {conf =3D> meta-ti-bsp/conf}/machine/am64xx-evm.conf     |  0
 .../conf}/machine/am64xx-hs-evm-k3r5.conf              |  0
 {conf =3D> meta-ti-bsp/conf}/machine/am64xx-hs-evm.conf  |  0
 .../conf}/machine/am65xx-evm-k3r5-sr2.conf             |  0
 .../conf}/machine/am65xx-evm-k3r5.conf                 |  0
 {conf =3D> meta-ti-bsp/conf}/machine/am65xx-evm.conf     |  0
 .../conf}/machine/am65xx-hs-evm-k3r5-sr2.conf          |  0
 .../conf}/machine/am65xx-hs-evm-k3r5.conf              |  0
 {conf =3D> meta-ti-bsp/conf}/machine/am65xx-hs-evm.conf  |  0
 {conf =3D> meta-ti-bsp/conf}/machine/beagle-x15.conf     |  0
 {conf =3D> meta-ti-bsp/conf}/machine/beaglebone.conf     |  0
 {conf =3D> meta-ti-bsp/conf}/machine/dra7xx-evm.conf     |  0
 {conf =3D> meta-ti-bsp/conf}/machine/dra7xx-hs-evm.conf  |  0
 {conf =3D> meta-ti-bsp/conf}/machine/include/am64xx.inc  |  0
 {conf =3D> meta-ti-bsp/conf}/machine/include/am65xx.inc  |  0
 {conf =3D> meta-ti-bsp/conf}/machine/include/dra7xx.inc  |  0
 {conf =3D> meta-ti-bsp/conf}/machine/include/j7.inc      |  0
 {conf =3D> meta-ti-bsp/conf}/machine/include/k3.inc      |  0
 {conf =3D> meta-ti-bsp/conf}/machine/include/k3r5.inc    |  0
 .../conf}/machine/include/omap-a15.inc                 |  0
 {conf =3D> meta-ti-bsp/conf}/machine/include/omapl1.inc  |  0
 .../conf}/machine/include/omapl138.inc                 |  0
 {conf =3D> meta-ti-bsp/conf}/machine/include/ti-soc.inc  |  0
 {conf =3D> meta-ti-bsp/conf}/machine/include/ti33x.inc   |  0
 {conf =3D> meta-ti-bsp/conf}/machine/include/ti43x.inc   |  0
 {conf =3D> meta-ti-bsp/conf}/machine/j7-evm-k3r5.conf    |  0
 {conf =3D> meta-ti-bsp/conf}/machine/j7-evm.conf         |  0
 .../conf}/machine/j7-hs-evm-k3r5-sr1-1.conf            |  0
 {conf =3D> meta-ti-bsp/conf}/machine/j7-hs-evm-k3r5.conf |  0
 {conf =3D> meta-ti-bsp/conf}/machine/j7-hs-evm.conf      |  0
 {conf =3D> meta-ti-bsp/conf}/machine/j7200-evm-k3r5.conf |  0
 {conf =3D> meta-ti-bsp/conf}/machine/j7200-evm.conf      |  0
 .../conf}/machine/j7200-hs-evm-k3r5.conf               |  0
 {conf =3D> meta-ti-bsp/conf}/machine/j7200-hs-evm.conf   |  0
 {conf =3D> meta-ti-bsp/conf}/machine/omapl138-lcdk.conf  |  0
 {conf =3D> meta-ti-bsp/conf}/multiconfig/k3r5-sr1-1.conf |  0
 {conf =3D> meta-ti-bsp/conf}/multiconfig/k3r5-sr2.conf   |  0
 {conf =3D> meta-ti-bsp/conf}/multiconfig/k3r5.conf       |  0
 {licenses =3D> meta-ti-bsp/licenses}/Hewlett-Packard     |  0
 {licenses =3D> meta-ti-bsp/licenses}/Patrick-Powell      |  0
 {licenses =3D> meta-ti-bsp/licenses}/TI-IMG              |  0
 {licenses =3D> meta-ti-bsp/licenses}/TI-TFL              |  0
 {licenses =3D> meta-ti-bsp/licenses}/TI-TSPA             |  0
 .../licenses}/Thai-Open-Source-Software-Center         |  0
 .../recipes-bsp}/bt-fw/bt-fw_git.bb                    |  0
 .../cadence-mhdp-fw/cadence-mhdp-fw_git.bb             |  0
 .../recipes-bsp}/cm3-pm-firmware/amx3-cm3_git.bb       |  0
 .../recipes-bsp}/cmem/cmem-mod_git.bb                  |  0
 {recipes-bsp =3D> meta-ti-bsp/recipes-bsp}/cmem/cmem.inc |  0
 .../recipes-bsp}/cmem/cmem_git.bb                      |  0
 .../recipes-bsp}/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb    |  0
 .../recipes-bsp}/cuia/cuia_1.0.0.13.bb                 |  0
 .../recipes-bsp}/dspdce-fw/dspdce-fw_git.bb            |  0
 .../recipes-bsp}/dsptop/debugss-module-drv_git.bb      |  0
 .../recipes-bsp}/dsptop/dsptop.inc                     |  0
 .../recipes-bsp}/dsptop/dsptop_git.bb                  |  0
 .../recipes-bsp}/dsptop/libulm_git.bb                  |  0
 .../gc320-drivers/ti-gc320-driver_5.0.11.p7.bb         |  0
 .../recipes-bsp}/goodix-fw/goodix-fw_git.bb            |  0
 .../recipes-bsp}/ipumm-fw/ipumm-fw_git.bb              |  0
 ...r-support-OpenEmbedded-nodistro-internal-aarc.patch |  0
 .../ti-img-rogue-driver_1.13.5776728.bb                |  0
 .../powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb      |  0
 .../recipes-bsp}/pru/pru-icss_git.bb                   |  0
 .../recipes-bsp}/pru/ti-pru-sw-edma-driver_1.00.00.bb  |  0
 .../recipes-bsp}/prueth-fw/prueth-fw-am65x-sr2_git.bb  |  0
 .../recipes-bsp}/prueth-fw/prueth-fw-am65x_git.bb      |  0
 .../recipes-bsp}/prueth-fw/prueth-fw_5.6.15.bb         |  0
 .../recipes-bsp}/pruhsr-fw/pruhsr-fw_2.17.25.bb        |  0
 .../recipes-bsp}/pruprp-fw/pruprp-fw_2.17.25.bb        |  0
 .../recipes-bsp}/prusw-fw/prusw-fw-am65x-sr2_git.bb    |  0
 .../recipes-bsp}/prusw-fw/prusw-fw_3.2.9.bb            |  0
 .../ti-img-encode-decode/viddec-test-app_1.0.0.bb      |  0
 .../ti-img-encode-decode/videnc-test-app_1.0.0.bb      |  0
 .../ti-img-encode-decode/vxd-dec-fw_git.bb             |  0
 .../recipes-bsp}/ti-linux-fw/ti-linux-fw.inc           |  0
 ...e-Skip-signing-of-binaries-for-combined-boot-.patch |  0
 .../recipes-bsp}/ti-sci-fw/ti-sci-fw-source_git.bb     |  0
 .../recipes-bsp}/ti-sci-fw/ti-sci-fw_git.bb            |  0
 .../trusted-firmware-a/trusted-firmware-a_%.bbappend   |  0
 .../recipes-bsp}/u-boot/u-boot-ti-mainline_git.bb      |  0
 .../recipes-bsp}/u-boot/u-boot-ti-staging_2020.01.bb   |  0
 .../recipes-bsp}/u-boot/u-boot-ti-staging_2021.01.bb   |  0
 .../recipes-bsp}/u-boot/u-boot-ti.inc                  |  0
 .../uio-module-drv/uio-module-drv-test_git.bb          |  0
 .../recipes-bsp}/uio-module-drv/uio-module-drv.inc     |  0
 ...dule-drv-Replace-ioremap_nocache-with-ioremap.patch |  0
 .../recipes-bsp}/uio-module-drv/uio-module-drv_git.bb  |  0
 .../recipes-bsp}/vis-fw/vis_01.50.07.15.bb             |  0
 .../recipes-bsp}/vpdma-fw/vpdma-fw_03-2012.bb          |  0
 .../recipes-bsp}/vpe-tests/vpe-tests_git.bb            |  0
 .../0001-Add-Makefile-to-install-firmware-files.patch  |  0
 .../recipes-bsp}/wl18xx-fw/wl18xx-fw_8.9.0.0.86.bb     |  0
 .../recipes-connectivity}/uim/uim-sysfs_8.5.bb         |  0
 ...o-not-define-EFUSE_PARAMETER_TYPE_ENMT-type-e.patch |  0
 .../wl18xx-calibrator/wl18xx-calibrator_8.7.3.bb       |  0
 ...int_stat.sh-replace-system-bin-sh-with-bin-sh.patch |  0
 .../wl18xx-target-scripts_8.7.3.bb                     |  0
 .../recipes-connectivity}/wlconf/wlconf_8.7.3.bb       |  0
 .../recipes-core}/udev/eudev/firmware.rules            |  0
 .../recipes-core}/udev/eudev/omap-tty.rules            |  0
 .../recipes-core}/udev/eudev_%.bbappend                |  0
 .../recipes-devtools}/gdbc6x/gdbc6x.inc                |  0
 ...1-libbfd.h-suppress-GCC9-Wstringop-truncation.patch |  0
 .../recipes-devtools}/gdbc6x/gdbc6x/init               |  0
 .../recipes-devtools}/gdbc6x/gdbc6x_git.bb             |  0
 .../recipes-devtools}/gdbc6x/gdbserver-c6x_git.bb      |  0
 .../gdbc6x/gdbserverproxy-module-drv_git.bb            |  0
 .../recipes-devtools}/ion/libion_git.bb                |  0
 .../recipes-devtools}/k3conf/k3conf_git.bb             |  0
 .../libgal/ti-gc320-libs_5.0.11.p7.bb                  |  0
 .../libgles/ti-img-rogue-umlibs_1.13.5776728.bb        |  0
 .../libgles/ti-sgx-ddk-um_1.17.4948957.bb              |  0
 .../recipes-kernel}/linux/bundle-devicetree.inc        |  0
 .../recipes-kernel}/linux/cmem.inc                     |  0
 .../recipes-kernel}/linux/files/cmem.dtsi              |  0
 .../recipes-kernel}/linux/files/configs/empty          |  0
 .../linux/files/dra7xx/am571x-pru-uio.dtsi             |  0
 .../linux/files/dra7xx/am57xx-pru-uio.dtsi             |  0
 .../linux/files/dra7xx/cmem-am571x.dtsi                |  0
 .../linux/files/dra7xx/cmem-am5729-beagleboneai.dtsi   |  0
 .../linux/files/dra7xx/cmem-am572idk.dtsi              |  0
 .../linux/files/dra7xx/cmem-am574x.dtsi                |  0
 .../linux/files/dra7xx/cmem-dra71x.dtsi                |  0
 .../linux/files/dra7xx/cmem-dra72x.dtsi                |  0
 .../linux/files/dra7xx/cmem-dra76x.dtsi                |  0
 .../recipes-kernel}/linux/files/dra7xx/cmem.dtsi       |  0
 .../linux/files/ti33x/am335x-pru-uio.dtsi              |  0
 .../linux/files/ti43x/am437x-pru-uio.dtsi              |  0
 .../recipes-kernel}/linux/kernel-rdepends.inc          |  0
 .../recipes-kernel}/linux/linux-ti-mainline/defconfig  |  0
 .../linux/linux-ti-mainline/dra7xx/defconfig           |  0
 .../linux/linux-ti-mainline/k3/defconfig               |  0
 .../linux/linux-ti-mainline/omapl138/defconfig         |  0
 .../linux/linux-ti-mainline/ti33x/defconfig            |  0
 .../linux/linux-ti-mainline/ti43x/defconfig            |  0
 .../recipes-kernel}/linux/linux-ti-mainline_git.bb     |  0
 .../linux/linux-ti-staging-5.10/defconfig              |  0
 .../linux/linux-ti-staging-5.10/dra7xx/defconfig       |  0
 .../linux/linux-ti-staging-5.10/k3/defconfig           |  0
 .../linux/linux-ti-staging-5.10/omapl138/defconfig     |  0
 .../linux/linux-ti-staging-5.10/ti33x/defconfig        |  0
 .../linux/linux-ti-staging-5.10/ti43x/defconfig        |  0
 .../linux/linux-ti-staging-5.4/defconfig               |  0
 .../linux/linux-ti-staging-5.4/dra7xx/defconfig        |  0
 .../linux/linux-ti-staging-5.4/k3/defconfig            |  0
 .../linux/linux-ti-staging-5.4/omapl138/defconfig      |  0
 .../linux/linux-ti-staging-5.4/ti33x/defconfig         |  0
 .../linux/linux-ti-staging-5.4/ti43x/defconfig         |  0
 .../linux/linux-ti-staging-rt-5.10/defconfig           |  0
 .../linux/linux-ti-staging-rt-5.10/dra7xx/defconfig    |  0
 .../linux/linux-ti-staging-rt-5.10/k3/defconfig        |  0
 .../linux/linux-ti-staging-rt-5.10/ti33x/defconfig     |  0
 .../linux/linux-ti-staging-rt-5.10/ti43x/defconfig     |  0
 .../linux/linux-ti-staging-rt-5.4/defconfig            |  0
 .../linux/linux-ti-staging-rt-5.4/dra7xx/defconfig     |  0
 .../linux/linux-ti-staging-rt-5.4/k3/defconfig         |  0
 .../linux/linux-ti-staging-rt-5.4/ti33x/defconfig      |  0
 .../linux/linux-ti-staging-rt-5.4/ti43x/defconfig      |  0
 .../recipes-kernel}/linux/linux-ti-staging-rt_5.10.bb  |  0
 .../recipes-kernel}/linux/linux-ti-staging-rt_5.4.bb   |  0
 .../linux/linux-ti-staging-systest-5.10/defconfig      |  0
 .../linux-ti-staging-systest-5.10/dra7xx/defconfig     |  0
 .../linux/linux-ti-staging-systest-5.10/k3/defconfig   |  0
 .../linux-ti-staging-systest-5.10/omapl138/defconfig   |  0
 .../linux-ti-staging-systest-5.10/ti33x/defconfig      |  0
 .../linux-ti-staging-systest-5.10/ti43x/defconfig      |  0
 .../linux/linux-ti-staging-systest-5.4/defconfig       |  0
 .../linux-ti-staging-systest-5.4/dra7xx/defconfig      |  0
 .../linux/linux-ti-staging-systest-5.4/k3/defconfig    |  0
 .../linux-ti-staging-systest-5.4/omapl138/defconfig    |  0
 .../linux/linux-ti-staging-systest-5.4/ti33x/defconfig |  0
 .../linux/linux-ti-staging-systest-5.4/ti43x/defconfig |  0
 .../linux/linux-ti-staging-systest_5.10.bb             |  0
 .../linux/linux-ti-staging-systest_5.4.bb              |  0
 .../recipes-kernel}/linux/linux-ti-staging_5.10.bb     |  0
 .../recipes-kernel}/linux/linux-ti-staging_5.4.bb      |  0
 .../recipes-kernel}/linux/setup-defconfig.inc          |  0
 .../recipes-kernel}/linux/ti-kernel.inc                |  0
 .../recipes-kernel}/linux/ti-uio.inc                   |  0
 .../recipes-multimedia}/libdce/libdce_3.00.14.00.bb    |  0
 .../recipes-security}/optee/optee-%.bbappend           |  0
 .../recipes-security}/optee/optee-os_%.bbappend        |  0
 {recipes-ti =3D> meta-ti-bsp/recipes-ti}/README          |  0
 .../recipes-ti}/beagleboard/beaglebone-capes.bb        |  0
 .../beagleboard/beaglebone-capes/cape-stop.sh          |  0
 .../beagleboard/beaglebone-capes/cape.service          |  0
 .../recipes-ti}/beagleboard/beaglebone-capes/cape.sh   |  0
 .../beagleboard/beaglebone-getting-started.bb          |  0
 .../recipes-ti}/beagleboard/gadget-init.bb             |  0
 .../beagleboard/gadget-init/bone-gmass-eject.rules     |  0
 .../beagleboard/gadget-init/g-ether-load.sh            |  0
 .../beagleboard/gadget-init/g-ether-start-service.sh   |  0
 .../beagleboard/gadget-init/g-storage-reinsert.sh      |  0
 .../gadget-init/network-gadget-init.service            |  0
 .../gadget-init/storage-gadget-init.service            |  0
 .../recipes-ti}/beagleboard/gadget-init/udhcpd.conf    |  0
 .../recipes-ti}/beagleboard/gadget-init/udhcpd.rules   |  0
 .../recipes-ti}/beagleboard/gadget-init/udhcpd.service |  0
 .../gadget-init/update-image-info-on-mmcblk0p1.sh      |  0
 .../recipes-ti}/bios/ti-sysbios.inc                    |  0
 .../recipes-ti}/bios/ti-sysbios_6.76.03.01.bb          |  0
 .../codec-engine/ti-codec-engine_3.24.00.08.bb         |  0
 .../recipes-ti}/ctoolslib/libaet_git.bb                |  0
 .../devtools/gcc-arm-baremetal_7-2018-q2-update.bb     |  0
 .../recipes-ti}/devtools/ti-cg-xml_2.61.00.bb          |  0
 .../recipes-ti}/devtools/ti-cgt-arm_18.12.5.bb         |  0
 .../recipes-ti}/devtools/ti-cgt-pru_2.3.2.bb           |  0
 .../recipes-ti}/devtools/ti-cgt470.inc                 |  0
 .../recipes-ti}/devtools/ti-cgt470_4.6.6.bb            |  0
 .../recipes-ti}/devtools/ti-cgt6x-7_7.4.16.bb          |  0
 .../recipes-ti}/devtools/ti-cgt6x_8.3.2.bb             |  0
 .../recipes-ti}/devtools/ti-cgt7x_1.2.0.bb             |  0
 .../recipes-ti}/devtools/ti-xdctools-common.inc        |  0
 .../recipes-ti}/devtools/ti-xdctools-core.inc          |  0
 .../recipes-ti}/devtools/ti-xdctools.inc               |  0
 .../recipes-ti}/devtools/ti-xdctools_3.55.02.22.bb     |  0
 .../recipes-ti}/dsplib/dsplib-c64xp_git.bb             |  0
 .../recipes-ti}/dsplib/dsplib-c66x_git.bb              |  0
 .../recipes-ti}/dsplib/dsplib-c674x_git.bb             |  0
 .../recipes-ti}/dsplib/dsplib.inc                      |  0
 .../framework-components/ti-framework-components.inc   |  0
 .../ti-framework-components_2.26.00.01.bb              |  0
 .../ti-framework-components_3.40.02.07.bb              |  0
 .../recipes-ti}/imglib/imglib-c66x.inc                 |  0
 .../recipes-ti}/imglib/imglib-c66x_3.1.1.0.bb          |  0
 .../recipes-ti}/includes/ti-eula-unpack.inc            |  0
 .../recipes-ti}/includes/ti-paths.inc                  |  0
 .../recipes-ti}/includes/ti-staging.inc                |  0
 .../recipes-ti}/includes/ti-unpack.inc                 |  0
 .../recipes-ti}/ipc/ti-ipc-common.inc                  |  0
 ...s-ClusterMgr-sys_errlist-has-been-deprecated-.patch |  0
 .../recipes-ti}/ipc/ti-ipc-examples-linux_git.bb       |  0
 .../recipes-ti}/ipc/ti-ipc-examples.inc                |  0
 .../recipes-ti}/ipc/ti-ipc-examples_git.bb             |  0
 .../recipes-ti}/ipc/ti-ipc-rtos.inc                    |  0
 .../recipes-ti}/ipc/ti-ipc-rtos_git.bb                 |  0
 {recipes-ti =3D> meta-ti-bsp/recipes-ti}/ipc/ti-ipc.inc  |  0
 .../ipc/ti-ipc/0001-Add-kernel-build-dir.patch         |  0
 .../recipes-ti}/ipc/ti-ipc/omap_remoteproc.conf        |  0
 .../recipes-ti}/ipc/ti-ipc/tiipclad-daemon.service     |  0
 .../recipes-ti}/ipc/ti-ipc/tiipclad-daemon.sh          |  0
 .../recipes-ti}/ipc/ti-ipc_git.bb                      |  0
 ...-examples-Remove-use-of-includedir-and-libdir.patch |  0
 .../recipes-ti}/ipc/ti-rpmsg-char-examples_git.bb      |  0
 .../recipes-ti}/ipc/ti-rpmsg-char.inc                  |  0
 .../recipes-ti}/ipc/ti-rpmsg-char_git.bb               |  0
 .../recipes-ti}/mathlib/mathlib-c66x_git.bb            |  0
 .../recipes-ti}/mathlib/mathlib-c674x_git.bb           |  0
 .../recipes-ti}/mathlib/mathlib.inc                    |  0
 .../recipes-ti}/openmp-rtos/openmp-rtos_git.bb         |  0
 .../recipes-ti}/osal/ti-osal.inc                       |  0
 .../recipes-ti}/osal/ti-osal_1.24.00.09.bb             |  0
 .../recipes-ti}/swtools/swtools_git.bb                 |  0
 .../recipes-ti}/ti-rtos-bin/files/empty                |  0
 .../recipes-ti}/ti-rtos-bin/ti-rtos-firmware.bb        |  0
 .../recipes-ti}/ti-rtos-bin/ti-rtos-metadata.bb        |  0
 .../recipes-ti}/uio-test-pruss/uio-test-pruss_git.bb   |  0
 .../recipes-ti}/vlib/vlib-c66x.inc                     |  0
 .../recipes-ti}/vlib/vlib-c66x_3.2.1.0.bb              |  0
 .../recipes-ti}/xdais/ti-xdais.inc                     |  0
 .../recipes-ti}/xdais/ti-xdais_6.26.01.03.bb           |  0
 .../recipes-ti}/xdais/ti-xdais_7.24.00.04.bb           |  0
 {wic =3D> meta-ti-bsp/wic}/sdimage-2part-efi.wks         |  0
 {wic =3D> meta-ti-bsp/wic}/sdimage-2part.wks             |  0
 275 files changed, 5 insertions(+), 5 deletions(-)
 rename COPYING.MIT =3D> meta-ti-bsp/COPYING.MIT (100%)
 rename README =3D> meta-ti-bsp/README (100%)
 rename {conf =3D> meta-ti-bsp/conf}/layer.conf (70%)
 rename {conf =3D> meta-ti-bsp/conf}/machine/am335x-evm.conf (100%)
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
 rename {conf =3D> meta-ti-bsp/conf}/machine/beaglebone.conf (100%)
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
 rename {conf =3D> meta-ti-bsp/conf}/machine/include/ti33x.inc (100%)
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
 rename {licenses =3D> meta-ti-bsp/licenses}/Hewlett-Packard (100%)
 rename {licenses =3D> meta-ti-bsp/licenses}/Patrick-Powell (100%)
 rename {licenses =3D> meta-ti-bsp/licenses}/TI-IMG (100%)
 rename {licenses =3D> meta-ti-bsp/licenses}/TI-TFL (100%)
 rename {licenses =3D> meta-ti-bsp/licenses}/TI-TSPA (100%)
 rename {licenses =3D> meta-ti-bsp/licenses}/Thai-Open-Source-Software-Ce=
nter (100%)
 rename {recipes-bsp =3D> meta-ti-bsp/recipes-bsp}/bt-fw/bt-fw_git.bb (10=
0%)
 rename {recipes-bsp =3D> meta-ti-bsp/recipes-bsp}/cadence-mhdp-fw/cadenc=
e-mhdp-fw_git.bb (100%)
 rename {recipes-bsp =3D> meta-ti-bsp/recipes-bsp}/cm3-pm-firmware/amx3-c=
m3_git.bb (100%)
 rename {recipes-bsp =3D> meta-ti-bsp/recipes-bsp}/cmem/cmem-mod_git.bb (=
100%)
 rename {recipes-bsp =3D> meta-ti-bsp/recipes-bsp}/cmem/cmem.inc (100%)
 rename {recipes-bsp =3D> meta-ti-bsp/recipes-bsp}/cmem/cmem_git.bb (100%=
)
 rename {recipes-bsp =3D> meta-ti-bsp/recipes-bsp}/cpsw9g-eth-fw/cpsw9g-e=
th-fw_git.bb (100%)
 rename {recipes-bsp =3D> meta-ti-bsp/recipes-bsp}/cuia/cuia_1.0.0.13.bb =
(100%)
 rename {recipes-bsp =3D> meta-ti-bsp/recipes-bsp}/dspdce-fw/dspdce-fw_gi=
t.bb (100%)
 rename {recipes-bsp =3D> meta-ti-bsp/recipes-bsp}/dsptop/debugss-module-=
drv_git.bb (100%)
 rename {recipes-bsp =3D> meta-ti-bsp/recipes-bsp}/dsptop/dsptop.inc (100=
%)
 rename {recipes-bsp =3D> meta-ti-bsp/recipes-bsp}/dsptop/dsptop_git.bb (=
100%)
 rename {recipes-bsp =3D> meta-ti-bsp/recipes-bsp}/dsptop/libulm_git.bb (=
100%)
 rename {recipes-bsp =3D> meta-ti-bsp/recipes-bsp}/gc320-drivers/ti-gc320=
-driver_5.0.11.p7.bb (100%)
 rename {recipes-bsp =3D> meta-ti-bsp/recipes-bsp}/goodix-fw/goodix-fw_gi=
t.bb (100%)
 rename {recipes-bsp =3D> meta-ti-bsp/recipes-bsp}/ipumm-fw/ipumm-fw_git.=
bb (100%)
 rename {recipes-bsp =3D> meta-ti-bsp/recipes-bsp}/powervr-drivers/ti-img=
-rogue-driver/0001-compiler-support-OpenEmbedded-nodistro-internal-aarc.p=
atch (100%)
 rename {recipes-bsp =3D> meta-ti-bsp/recipes-bsp}/powervr-drivers/ti-img=
-rogue-driver_1.13.5776728.bb (100%)
 rename {recipes-bsp =3D> meta-ti-bsp/recipes-bsp}/powervr-drivers/ti-sgx=
-ddk-km_1.17.4948957.bb (100%)
 rename {recipes-bsp =3D> meta-ti-bsp/recipes-bsp}/pru/pru-icss_git.bb (1=
00%)
 rename {recipes-bsp =3D> meta-ti-bsp/recipes-bsp}/pru/ti-pru-sw-edma-dri=
ver_1.00.00.bb (100%)
 rename {recipes-bsp =3D> meta-ti-bsp/recipes-bsp}/prueth-fw/prueth-fw-am=
65x-sr2_git.bb (100%)
 rename {recipes-bsp =3D> meta-ti-bsp/recipes-bsp}/prueth-fw/prueth-fw-am=
65x_git.bb (100%)
 rename {recipes-bsp =3D> meta-ti-bsp/recipes-bsp}/prueth-fw/prueth-fw_5.=
6.15.bb (100%)
 rename {recipes-bsp =3D> meta-ti-bsp/recipes-bsp}/pruhsr-fw/pruhsr-fw_2.=
17.25.bb (100%)
 rename {recipes-bsp =3D> meta-ti-bsp/recipes-bsp}/pruprp-fw/pruprp-fw_2.=
17.25.bb (100%)
 rename {recipes-bsp =3D> meta-ti-bsp/recipes-bsp}/prusw-fw/prusw-fw-am65=
x-sr2_git.bb (100%)
 rename {recipes-bsp =3D> meta-ti-bsp/recipes-bsp}/prusw-fw/prusw-fw_3.2.=
9.bb (100%)
 rename {recipes-bsp =3D> meta-ti-bsp/recipes-bsp}/ti-img-encode-decode/v=
iddec-test-app_1.0.0.bb (100%)
 rename {recipes-bsp =3D> meta-ti-bsp/recipes-bsp}/ti-img-encode-decode/v=
idenc-test-app_1.0.0.bb (100%)
 rename {recipes-bsp =3D> meta-ti-bsp/recipes-bsp}/ti-img-encode-decode/v=
xd-dec-fw_git.bb (100%)
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
ule-drv.inc (100%)
 rename {recipes-bsp =3D> meta-ti-bsp/recipes-bsp}/uio-module-drv/uio-mod=
ule-drv/0001-uio-module-drv-Replace-ioremap_nocache-with-ioremap.patch (1=
00%)
 rename {recipes-bsp =3D> meta-ti-bsp/recipes-bsp}/uio-module-drv/uio-mod=
ule-drv_git.bb (100%)
 rename {recipes-bsp =3D> meta-ti-bsp/recipes-bsp}/vis-fw/vis_01.50.07.15=
.bb (100%)
 rename {recipes-bsp =3D> meta-ti-bsp/recipes-bsp}/vpdma-fw/vpdma-fw_03-2=
012.bb (100%)
 rename {recipes-bsp =3D> meta-ti-bsp/recipes-bsp}/vpe-tests/vpe-tests_gi=
t.bb (100%)
 rename {recipes-bsp =3D> meta-ti-bsp/recipes-bsp}/wl18xx-fw/wl18xx-fw/00=
01-Add-Makefile-to-install-firmware-files.patch (100%)
 rename {recipes-bsp =3D> meta-ti-bsp/recipes-bsp}/wl18xx-fw/wl18xx-fw_8.=
9.0.0.86.bb (100%)
 rename {recipes-connectivity =3D> meta-ti-bsp/recipes-connectivity}/uim/=
uim-sysfs_8.5.bb (100%)
 rename {recipes-connectivity =3D> meta-ti-bsp/recipes-connectivity}/wl18=
xx-calibrator/wl18xx-calibrator/0001-plt.h-Do-not-define-EFUSE_PARAMETER_=
TYPE_ENMT-type-e.patch (100%)
 rename {recipes-connectivity =3D> meta-ti-bsp/recipes-connectivity}/wl18=
xx-calibrator/wl18xx-calibrator_8.7.3.bb (100%)
 rename {recipes-connectivity =3D> meta-ti-bsp/recipes-connectivity}/wl18=
xx-target-scripts/wl18xx-target-scripts/0001-print_stat.sh-replace-system=
-bin-sh-with-bin-sh.patch (100%)
 rename {recipes-connectivity =3D> meta-ti-bsp/recipes-connectivity}/wl18=
xx-target-scripts/wl18xx-target-scripts_8.7.3.bb (100%)
 rename {recipes-connectivity =3D> meta-ti-bsp/recipes-connectivity}/wlco=
nf/wlconf_8.7.3.bb (100%)
 rename {recipes-core =3D> meta-ti-bsp/recipes-core}/udev/eudev/firmware.=
rules (100%)
 rename {recipes-core =3D> meta-ti-bsp/recipes-core}/udev/eudev/omap-tty.=
rules (100%)
 rename {recipes-core =3D> meta-ti-bsp/recipes-core}/udev/eudev_%.bbappen=
d (100%)
 rename {recipes-devtools =3D> meta-ti-bsp/recipes-devtools}/gdbc6x/gdbc6=
x.inc (100%)
 rename {recipes-devtools =3D> meta-ti-bsp/recipes-devtools}/gdbc6x/gdbc6=
x/0001-libbfd.h-suppress-GCC9-Wstringop-truncation.patch (100%)
 rename {recipes-devtools =3D> meta-ti-bsp/recipes-devtools}/gdbc6x/gdbc6=
x/init (100%)
 rename {recipes-devtools =3D> meta-ti-bsp/recipes-devtools}/gdbc6x/gdbc6=
x_git.bb (100%)
 rename {recipes-devtools =3D> meta-ti-bsp/recipes-devtools}/gdbc6x/gdbse=
rver-c6x_git.bb (100%)
 rename {recipes-devtools =3D> meta-ti-bsp/recipes-devtools}/gdbc6x/gdbse=
rverproxy-module-drv_git.bb (100%)
 rename {recipes-devtools =3D> meta-ti-bsp/recipes-devtools}/ion/libion_g=
it.bb (100%)
 rename {recipes-devtools =3D> meta-ti-bsp/recipes-devtools}/k3conf/k3con=
f_git.bb (100%)
 rename {recipes-graphics =3D> meta-ti-bsp/recipes-graphics}/libgal/ti-gc=
320-libs_5.0.11.p7.bb (100%)
 rename {recipes-graphics =3D> meta-ti-bsp/recipes-graphics}/libgles/ti-i=
mg-rogue-umlibs_1.13.5776728.bb (100%)
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
 rename {recipes-multimedia =3D> meta-ti-bsp/recipes-multimedia}/libdce/l=
ibdce_3.00.14.00.bb (100%)
 rename {recipes-security =3D> meta-ti-bsp/recipes-security}/optee/optee-=
%.bbappend (100%)
 rename {recipes-security =3D> meta-ti-bsp/recipes-security}/optee/optee-=
os_%.bbappend (100%)
 rename {recipes-ti =3D> meta-ti-bsp/recipes-ti}/README (100%)
 rename {recipes-ti =3D> meta-ti-bsp/recipes-ti}/beagleboard/beaglebone-c=
apes.bb (100%)
 rename {recipes-ti =3D> meta-ti-bsp/recipes-ti}/beagleboard/beaglebone-c=
apes/cape-stop.sh (100%)
 rename {recipes-ti =3D> meta-ti-bsp/recipes-ti}/beagleboard/beaglebone-c=
apes/cape.service (100%)
 rename {recipes-ti =3D> meta-ti-bsp/recipes-ti}/beagleboard/beaglebone-c=
apes/cape.sh (100%)
 rename {recipes-ti =3D> meta-ti-bsp/recipes-ti}/beagleboard/beaglebone-g=
etting-started.bb (100%)
 rename {recipes-ti =3D> meta-ti-bsp/recipes-ti}/beagleboard/gadget-init.=
bb (100%)
 rename {recipes-ti =3D> meta-ti-bsp/recipes-ti}/beagleboard/gadget-init/=
bone-gmass-eject.rules (100%)
 rename {recipes-ti =3D> meta-ti-bsp/recipes-ti}/beagleboard/gadget-init/=
g-ether-load.sh (100%)
 rename {recipes-ti =3D> meta-ti-bsp/recipes-ti}/beagleboard/gadget-init/=
g-ether-start-service.sh (100%)
 rename {recipes-ti =3D> meta-ti-bsp/recipes-ti}/beagleboard/gadget-init/=
g-storage-reinsert.sh (100%)
 rename {recipes-ti =3D> meta-ti-bsp/recipes-ti}/beagleboard/gadget-init/=
network-gadget-init.service (100%)
 rename {recipes-ti =3D> meta-ti-bsp/recipes-ti}/beagleboard/gadget-init/=
storage-gadget-init.service (100%)
 rename {recipes-ti =3D> meta-ti-bsp/recipes-ti}/beagleboard/gadget-init/=
udhcpd.conf (100%)
 rename {recipes-ti =3D> meta-ti-bsp/recipes-ti}/beagleboard/gadget-init/=
udhcpd.rules (100%)
 rename {recipes-ti =3D> meta-ti-bsp/recipes-ti}/beagleboard/gadget-init/=
udhcpd.service (100%)
 rename {recipes-ti =3D> meta-ti-bsp/recipes-ti}/beagleboard/gadget-init/=
update-image-info-on-mmcblk0p1.sh (100%)
 rename {recipes-ti =3D> meta-ti-bsp/recipes-ti}/bios/ti-sysbios.inc (100=
%)
 rename {recipes-ti =3D> meta-ti-bsp/recipes-ti}/bios/ti-sysbios_6.76.03.=
01.bb (100%)
 rename {recipes-ti =3D> meta-ti-bsp/recipes-ti}/codec-engine/ti-codec-en=
gine_3.24.00.08.bb (100%)
 rename {recipes-ti =3D> meta-ti-bsp/recipes-ti}/ctoolslib/libaet_git.bb =
(100%)
 rename {recipes-ti =3D> meta-ti-bsp/recipes-ti}/devtools/gcc-arm-baremet=
al_7-2018-q2-update.bb (100%)
 rename {recipes-ti =3D> meta-ti-bsp/recipes-ti}/devtools/ti-cg-xml_2.61.=
00.bb (100%)
 rename {recipes-ti =3D> meta-ti-bsp/recipes-ti}/devtools/ti-cgt-arm_18.1=
2.5.bb (100%)
 rename {recipes-ti =3D> meta-ti-bsp/recipes-ti}/devtools/ti-cgt-pru_2.3.=
2.bb (100%)
 rename {recipes-ti =3D> meta-ti-bsp/recipes-ti}/devtools/ti-cgt470.inc (=
100%)
 rename {recipes-ti =3D> meta-ti-bsp/recipes-ti}/devtools/ti-cgt470_4.6.6=
.bb (100%)
 rename {recipes-ti =3D> meta-ti-bsp/recipes-ti}/devtools/ti-cgt6x-7_7.4.=
16.bb (100%)
 rename {recipes-ti =3D> meta-ti-bsp/recipes-ti}/devtools/ti-cgt6x_8.3.2.=
bb (100%)
 rename {recipes-ti =3D> meta-ti-bsp/recipes-ti}/devtools/ti-cgt7x_1.2.0.=
bb (100%)
 rename {recipes-ti =3D> meta-ti-bsp/recipes-ti}/devtools/ti-xdctools-com=
mon.inc (100%)
 rename {recipes-ti =3D> meta-ti-bsp/recipes-ti}/devtools/ti-xdctools-cor=
e.inc (100%)
 rename {recipes-ti =3D> meta-ti-bsp/recipes-ti}/devtools/ti-xdctools.inc=
 (100%)
 rename {recipes-ti =3D> meta-ti-bsp/recipes-ti}/devtools/ti-xdctools_3.5=
5.02.22.bb (100%)
 rename {recipes-ti =3D> meta-ti-bsp/recipes-ti}/dsplib/dsplib-c64xp_git.=
bb (100%)
 rename {recipes-ti =3D> meta-ti-bsp/recipes-ti}/dsplib/dsplib-c66x_git.b=
b (100%)
 rename {recipes-ti =3D> meta-ti-bsp/recipes-ti}/dsplib/dsplib-c674x_git.=
bb (100%)
 rename {recipes-ti =3D> meta-ti-bsp/recipes-ti}/dsplib/dsplib.inc (100%)
 rename {recipes-ti =3D> meta-ti-bsp/recipes-ti}/framework-components/ti-=
framework-components.inc (100%)
 rename {recipes-ti =3D> meta-ti-bsp/recipes-ti}/framework-components/ti-=
framework-components_2.26.00.01.bb (100%)
 rename {recipes-ti =3D> meta-ti-bsp/recipes-ti}/framework-components/ti-=
framework-components_3.40.02.07.bb (100%)
 rename {recipes-ti =3D> meta-ti-bsp/recipes-ti}/imglib/imglib-c66x.inc (=
100%)
 rename {recipes-ti =3D> meta-ti-bsp/recipes-ti}/imglib/imglib-c66x_3.1.1=
.0.bb (100%)
 rename {recipes-ti =3D> meta-ti-bsp/recipes-ti}/includes/ti-eula-unpack.=
inc (100%)
 rename {recipes-ti =3D> meta-ti-bsp/recipes-ti}/includes/ti-paths.inc (1=
00%)
 rename {recipes-ti =3D> meta-ti-bsp/recipes-ti}/includes/ti-staging.inc =
(100%)
 rename {recipes-ti =3D> meta-ti-bsp/recipes-ti}/includes/ti-unpack.inc (=
100%)
 rename {recipes-ti =3D> meta-ti-bsp/recipes-ti}/ipc/ti-ipc-common.inc (1=
00%)
 rename {recipes-ti =3D> meta-ti-bsp/recipes-ti}/ipc/ti-ipc-examples-linu=
x/0001-examples-ClusterMgr-sys_errlist-has-been-deprecated-.patch (100%)
 rename {recipes-ti =3D> meta-ti-bsp/recipes-ti}/ipc/ti-ipc-examples-linu=
x_git.bb (100%)
 rename {recipes-ti =3D> meta-ti-bsp/recipes-ti}/ipc/ti-ipc-examples.inc =
(100%)
 rename {recipes-ti =3D> meta-ti-bsp/recipes-ti}/ipc/ti-ipc-examples_git.=
bb (100%)
 rename {recipes-ti =3D> meta-ti-bsp/recipes-ti}/ipc/ti-ipc-rtos.inc (100=
%)
 rename {recipes-ti =3D> meta-ti-bsp/recipes-ti}/ipc/ti-ipc-rtos_git.bb (=
100%)
 rename {recipes-ti =3D> meta-ti-bsp/recipes-ti}/ipc/ti-ipc.inc (100%)
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
 rename {recipes-ti =3D> meta-ti-bsp/recipes-ti}/mathlib/mathlib-c66x_git=
.bb (100%)
 rename {recipes-ti =3D> meta-ti-bsp/recipes-ti}/mathlib/mathlib-c674x_gi=
t.bb (100%)
 rename {recipes-ti =3D> meta-ti-bsp/recipes-ti}/mathlib/mathlib.inc (100=
%)
 rename {recipes-ti =3D> meta-ti-bsp/recipes-ti}/openmp-rtos/openmp-rtos_=
git.bb (100%)
 rename {recipes-ti =3D> meta-ti-bsp/recipes-ti}/osal/ti-osal.inc (100%)
 rename {recipes-ti =3D> meta-ti-bsp/recipes-ti}/osal/ti-osal_1.24.00.09.=
bb (100%)
 rename {recipes-ti =3D> meta-ti-bsp/recipes-ti}/swtools/swtools_git.bb (=
100%)
 rename {recipes-ti =3D> meta-ti-bsp/recipes-ti}/ti-rtos-bin/files/empty =
(100%)
 rename {recipes-ti =3D> meta-ti-bsp/recipes-ti}/ti-rtos-bin/ti-rtos-firm=
ware.bb (100%)
 rename {recipes-ti =3D> meta-ti-bsp/recipes-ti}/ti-rtos-bin/ti-rtos-meta=
data.bb (100%)
 rename {recipes-ti =3D> meta-ti-bsp/recipes-ti}/uio-test-pruss/uio-test-=
pruss_git.bb (100%)
 rename {recipes-ti =3D> meta-ti-bsp/recipes-ti}/vlib/vlib-c66x.inc (100%=
)
 rename {recipes-ti =3D> meta-ti-bsp/recipes-ti}/vlib/vlib-c66x_3.2.1.0.b=
b (100%)
 rename {recipes-ti =3D> meta-ti-bsp/recipes-ti}/xdais/ti-xdais.inc (100%=
)
 rename {recipes-ti =3D> meta-ti-bsp/recipes-ti}/xdais/ti-xdais_6.26.01.0=
3.bb (100%)
 rename {recipes-ti =3D> meta-ti-bsp/recipes-ti}/xdais/ti-xdais_7.24.00.0=
4.bb (100%)
 rename {wic =3D> meta-ti-bsp/wic}/sdimage-2part-efi.wks (100%)
 rename {wic =3D> meta-ti-bsp/wic}/sdimage-2part.wks (100%)

diff --git a/COPYING.MIT b/meta-ti-bsp/COPYING.MIT
similarity index 100%
rename from COPYING.MIT
rename to meta-ti-bsp/COPYING.MIT
diff --git a/README b/meta-ti-bsp/README
similarity index 100%
rename from README
rename to meta-ti-bsp/README
diff --git a/conf/layer.conf b/meta-ti-bsp/conf/layer.conf
similarity index 70%
rename from conf/layer.conf
rename to meta-ti-bsp/conf/layer.conf
index f64ac5eb..309e3d2b 100644
--- a/conf/layer.conf
+++ b/meta-ti-bsp/conf/layer.conf
@@ -5,15 +5,15 @@ METATIBASE :=3D '${@os.path.normpath("${LAYERDIR}/")}'
 # We have a recipes directory, add to BBFILES
 BBFILES +=3D "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/recipes*/*/*.bbapp=
end"
=20
-BBFILE_COLLECTIONS +=3D "meta-ti"
-BBFILE_PATTERN_meta-ti :=3D "^${LAYERDIR}/"
-BBFILE_PRIORITY_meta-ti =3D "6"
+BBFILE_COLLECTIONS +=3D "meta-ti-bsp"
+BBFILE_PATTERN_meta-ti-bsp :=3D "^${LAYERDIR}/"
+BBFILE_PRIORITY_meta-ti-bsp =3D "6"
=20
-LAYERSERIES_COMPAT_meta-ti =3D "honister"
+LAYERSERIES_COMPAT_meta-ti-bsp =3D "honister"
=20
 LICENSE_PATH +=3D "${LAYERDIR}/licenses"
=20
-LAYERDEPENDS_meta-ti =3D " \
+LAYERDEPENDS_meta-ti-bsp =3D " \
     core \
     meta-arm \
 "
diff --git a/conf/machine/am335x-evm.conf b/meta-ti-bsp/conf/machine/am33=
5x-evm.conf
similarity index 100%
rename from conf/machine/am335x-evm.conf
rename to meta-ti-bsp/conf/machine/am335x-evm.conf
diff --git a/conf/machine/am335x-hs-evm.conf b/meta-ti-bsp/conf/machine/a=
m335x-hs-evm.conf
similarity index 100%
rename from conf/machine/am335x-hs-evm.conf
rename to meta-ti-bsp/conf/machine/am335x-hs-evm.conf
diff --git a/conf/machine/am437x-evm.conf b/meta-ti-bsp/conf/machine/am43=
7x-evm.conf
similarity index 100%
rename from conf/machine/am437x-evm.conf
rename to meta-ti-bsp/conf/machine/am437x-evm.conf
diff --git a/conf/machine/am437x-hs-evm.conf b/meta-ti-bsp/conf/machine/a=
m437x-hs-evm.conf
similarity index 100%
rename from conf/machine/am437x-hs-evm.conf
rename to meta-ti-bsp/conf/machine/am437x-hs-evm.conf
diff --git a/conf/machine/am57xx-evm.conf b/meta-ti-bsp/conf/machine/am57=
xx-evm.conf
similarity index 100%
rename from conf/machine/am57xx-evm.conf
rename to meta-ti-bsp/conf/machine/am57xx-evm.conf
diff --git a/conf/machine/am57xx-hs-evm.conf b/meta-ti-bsp/conf/machine/a=
m57xx-hs-evm.conf
similarity index 100%
rename from conf/machine/am57xx-hs-evm.conf
rename to meta-ti-bsp/conf/machine/am57xx-hs-evm.conf
diff --git a/conf/machine/am64xx-evm-k3r5.conf b/meta-ti-bsp/conf/machine=
/am64xx-evm-k3r5.conf
similarity index 100%
rename from conf/machine/am64xx-evm-k3r5.conf
rename to meta-ti-bsp/conf/machine/am64xx-evm-k3r5.conf
diff --git a/conf/machine/am64xx-evm.conf b/meta-ti-bsp/conf/machine/am64=
xx-evm.conf
similarity index 100%
rename from conf/machine/am64xx-evm.conf
rename to meta-ti-bsp/conf/machine/am64xx-evm.conf
diff --git a/conf/machine/am64xx-hs-evm-k3r5.conf b/meta-ti-bsp/conf/mach=
ine/am64xx-hs-evm-k3r5.conf
similarity index 100%
rename from conf/machine/am64xx-hs-evm-k3r5.conf
rename to meta-ti-bsp/conf/machine/am64xx-hs-evm-k3r5.conf
diff --git a/conf/machine/am64xx-hs-evm.conf b/meta-ti-bsp/conf/machine/a=
m64xx-hs-evm.conf
similarity index 100%
rename from conf/machine/am64xx-hs-evm.conf
rename to meta-ti-bsp/conf/machine/am64xx-hs-evm.conf
diff --git a/conf/machine/am65xx-evm-k3r5-sr2.conf b/meta-ti-bsp/conf/mac=
hine/am65xx-evm-k3r5-sr2.conf
similarity index 100%
rename from conf/machine/am65xx-evm-k3r5-sr2.conf
rename to meta-ti-bsp/conf/machine/am65xx-evm-k3r5-sr2.conf
diff --git a/conf/machine/am65xx-evm-k3r5.conf b/meta-ti-bsp/conf/machine=
/am65xx-evm-k3r5.conf
similarity index 100%
rename from conf/machine/am65xx-evm-k3r5.conf
rename to meta-ti-bsp/conf/machine/am65xx-evm-k3r5.conf
diff --git a/conf/machine/am65xx-evm.conf b/meta-ti-bsp/conf/machine/am65=
xx-evm.conf
similarity index 100%
rename from conf/machine/am65xx-evm.conf
rename to meta-ti-bsp/conf/machine/am65xx-evm.conf
diff --git a/conf/machine/am65xx-hs-evm-k3r5-sr2.conf b/meta-ti-bsp/conf/=
machine/am65xx-hs-evm-k3r5-sr2.conf
similarity index 100%
rename from conf/machine/am65xx-hs-evm-k3r5-sr2.conf
rename to meta-ti-bsp/conf/machine/am65xx-hs-evm-k3r5-sr2.conf
diff --git a/conf/machine/am65xx-hs-evm-k3r5.conf b/meta-ti-bsp/conf/mach=
ine/am65xx-hs-evm-k3r5.conf
similarity index 100%
rename from conf/machine/am65xx-hs-evm-k3r5.conf
rename to meta-ti-bsp/conf/machine/am65xx-hs-evm-k3r5.conf
diff --git a/conf/machine/am65xx-hs-evm.conf b/meta-ti-bsp/conf/machine/a=
m65xx-hs-evm.conf
similarity index 100%
rename from conf/machine/am65xx-hs-evm.conf
rename to meta-ti-bsp/conf/machine/am65xx-hs-evm.conf
diff --git a/conf/machine/beagle-x15.conf b/meta-ti-bsp/conf/machine/beag=
le-x15.conf
similarity index 100%
rename from conf/machine/beagle-x15.conf
rename to meta-ti-bsp/conf/machine/beagle-x15.conf
diff --git a/conf/machine/beaglebone.conf b/meta-ti-bsp/conf/machine/beag=
lebone.conf
similarity index 100%
rename from conf/machine/beaglebone.conf
rename to meta-ti-bsp/conf/machine/beaglebone.conf
diff --git a/conf/machine/dra7xx-evm.conf b/meta-ti-bsp/conf/machine/dra7=
xx-evm.conf
similarity index 100%
rename from conf/machine/dra7xx-evm.conf
rename to meta-ti-bsp/conf/machine/dra7xx-evm.conf
diff --git a/conf/machine/dra7xx-hs-evm.conf b/meta-ti-bsp/conf/machine/d=
ra7xx-hs-evm.conf
similarity index 100%
rename from conf/machine/dra7xx-hs-evm.conf
rename to meta-ti-bsp/conf/machine/dra7xx-hs-evm.conf
diff --git a/conf/machine/include/am64xx.inc b/meta-ti-bsp/conf/machine/i=
nclude/am64xx.inc
similarity index 100%
rename from conf/machine/include/am64xx.inc
rename to meta-ti-bsp/conf/machine/include/am64xx.inc
diff --git a/conf/machine/include/am65xx.inc b/meta-ti-bsp/conf/machine/i=
nclude/am65xx.inc
similarity index 100%
rename from conf/machine/include/am65xx.inc
rename to meta-ti-bsp/conf/machine/include/am65xx.inc
diff --git a/conf/machine/include/dra7xx.inc b/meta-ti-bsp/conf/machine/i=
nclude/dra7xx.inc
similarity index 100%
rename from conf/machine/include/dra7xx.inc
rename to meta-ti-bsp/conf/machine/include/dra7xx.inc
diff --git a/conf/machine/include/j7.inc b/meta-ti-bsp/conf/machine/inclu=
de/j7.inc
similarity index 100%
rename from conf/machine/include/j7.inc
rename to meta-ti-bsp/conf/machine/include/j7.inc
diff --git a/conf/machine/include/k3.inc b/meta-ti-bsp/conf/machine/inclu=
de/k3.inc
similarity index 100%
rename from conf/machine/include/k3.inc
rename to meta-ti-bsp/conf/machine/include/k3.inc
diff --git a/conf/machine/include/k3r5.inc b/meta-ti-bsp/conf/machine/inc=
lude/k3r5.inc
similarity index 100%
rename from conf/machine/include/k3r5.inc
rename to meta-ti-bsp/conf/machine/include/k3r5.inc
diff --git a/conf/machine/include/omap-a15.inc b/meta-ti-bsp/conf/machine=
/include/omap-a15.inc
similarity index 100%
rename from conf/machine/include/omap-a15.inc
rename to meta-ti-bsp/conf/machine/include/omap-a15.inc
diff --git a/conf/machine/include/omapl1.inc b/meta-ti-bsp/conf/machine/i=
nclude/omapl1.inc
similarity index 100%
rename from conf/machine/include/omapl1.inc
rename to meta-ti-bsp/conf/machine/include/omapl1.inc
diff --git a/conf/machine/include/omapl138.inc b/meta-ti-bsp/conf/machine=
/include/omapl138.inc
similarity index 100%
rename from conf/machine/include/omapl138.inc
rename to meta-ti-bsp/conf/machine/include/omapl138.inc
diff --git a/conf/machine/include/ti-soc.inc b/meta-ti-bsp/conf/machine/i=
nclude/ti-soc.inc
similarity index 100%
rename from conf/machine/include/ti-soc.inc
rename to meta-ti-bsp/conf/machine/include/ti-soc.inc
diff --git a/conf/machine/include/ti33x.inc b/meta-ti-bsp/conf/machine/in=
clude/ti33x.inc
similarity index 100%
rename from conf/machine/include/ti33x.inc
rename to meta-ti-bsp/conf/machine/include/ti33x.inc
diff --git a/conf/machine/include/ti43x.inc b/meta-ti-bsp/conf/machine/in=
clude/ti43x.inc
similarity index 100%
rename from conf/machine/include/ti43x.inc
rename to meta-ti-bsp/conf/machine/include/ti43x.inc
diff --git a/conf/machine/j7-evm-k3r5.conf b/meta-ti-bsp/conf/machine/j7-=
evm-k3r5.conf
similarity index 100%
rename from conf/machine/j7-evm-k3r5.conf
rename to meta-ti-bsp/conf/machine/j7-evm-k3r5.conf
diff --git a/conf/machine/j7-evm.conf b/meta-ti-bsp/conf/machine/j7-evm.c=
onf
similarity index 100%
rename from conf/machine/j7-evm.conf
rename to meta-ti-bsp/conf/machine/j7-evm.conf
diff --git a/conf/machine/j7-hs-evm-k3r5-sr1-1.conf b/meta-ti-bsp/conf/ma=
chine/j7-hs-evm-k3r5-sr1-1.conf
similarity index 100%
rename from conf/machine/j7-hs-evm-k3r5-sr1-1.conf
rename to meta-ti-bsp/conf/machine/j7-hs-evm-k3r5-sr1-1.conf
diff --git a/conf/machine/j7-hs-evm-k3r5.conf b/meta-ti-bsp/conf/machine/=
j7-hs-evm-k3r5.conf
similarity index 100%
rename from conf/machine/j7-hs-evm-k3r5.conf
rename to meta-ti-bsp/conf/machine/j7-hs-evm-k3r5.conf
diff --git a/conf/machine/j7-hs-evm.conf b/meta-ti-bsp/conf/machine/j7-hs=
-evm.conf
similarity index 100%
rename from conf/machine/j7-hs-evm.conf
rename to meta-ti-bsp/conf/machine/j7-hs-evm.conf
diff --git a/conf/machine/j7200-evm-k3r5.conf b/meta-ti-bsp/conf/machine/=
j7200-evm-k3r5.conf
similarity index 100%
rename from conf/machine/j7200-evm-k3r5.conf
rename to meta-ti-bsp/conf/machine/j7200-evm-k3r5.conf
diff --git a/conf/machine/j7200-evm.conf b/meta-ti-bsp/conf/machine/j7200=
-evm.conf
similarity index 100%
rename from conf/machine/j7200-evm.conf
rename to meta-ti-bsp/conf/machine/j7200-evm.conf
diff --git a/conf/machine/j7200-hs-evm-k3r5.conf b/meta-ti-bsp/conf/machi=
ne/j7200-hs-evm-k3r5.conf
similarity index 100%
rename from conf/machine/j7200-hs-evm-k3r5.conf
rename to meta-ti-bsp/conf/machine/j7200-hs-evm-k3r5.conf
diff --git a/conf/machine/j7200-hs-evm.conf b/meta-ti-bsp/conf/machine/j7=
200-hs-evm.conf
similarity index 100%
rename from conf/machine/j7200-hs-evm.conf
rename to meta-ti-bsp/conf/machine/j7200-hs-evm.conf
diff --git a/conf/machine/omapl138-lcdk.conf b/meta-ti-bsp/conf/machine/o=
mapl138-lcdk.conf
similarity index 100%
rename from conf/machine/omapl138-lcdk.conf
rename to meta-ti-bsp/conf/machine/omapl138-lcdk.conf
diff --git a/conf/multiconfig/k3r5-sr1-1.conf b/meta-ti-bsp/conf/multicon=
fig/k3r5-sr1-1.conf
similarity index 100%
rename from conf/multiconfig/k3r5-sr1-1.conf
rename to meta-ti-bsp/conf/multiconfig/k3r5-sr1-1.conf
diff --git a/conf/multiconfig/k3r5-sr2.conf b/meta-ti-bsp/conf/multiconfi=
g/k3r5-sr2.conf
similarity index 100%
rename from conf/multiconfig/k3r5-sr2.conf
rename to meta-ti-bsp/conf/multiconfig/k3r5-sr2.conf
diff --git a/conf/multiconfig/k3r5.conf b/meta-ti-bsp/conf/multiconfig/k3=
r5.conf
similarity index 100%
rename from conf/multiconfig/k3r5.conf
rename to meta-ti-bsp/conf/multiconfig/k3r5.conf
diff --git a/licenses/Hewlett-Packard b/meta-ti-bsp/licenses/Hewlett-Pack=
ard
similarity index 100%
rename from licenses/Hewlett-Packard
rename to meta-ti-bsp/licenses/Hewlett-Packard
diff --git a/licenses/Patrick-Powell b/meta-ti-bsp/licenses/Patrick-Powel=
l
similarity index 100%
rename from licenses/Patrick-Powell
rename to meta-ti-bsp/licenses/Patrick-Powell
diff --git a/licenses/TI-IMG b/meta-ti-bsp/licenses/TI-IMG
similarity index 100%
rename from licenses/TI-IMG
rename to meta-ti-bsp/licenses/TI-IMG
diff --git a/licenses/TI-TFL b/meta-ti-bsp/licenses/TI-TFL
similarity index 100%
rename from licenses/TI-TFL
rename to meta-ti-bsp/licenses/TI-TFL
diff --git a/licenses/TI-TSPA b/meta-ti-bsp/licenses/TI-TSPA
similarity index 100%
rename from licenses/TI-TSPA
rename to meta-ti-bsp/licenses/TI-TSPA
diff --git a/licenses/Thai-Open-Source-Software-Center b/meta-ti-bsp/lice=
nses/Thai-Open-Source-Software-Center
similarity index 100%
rename from licenses/Thai-Open-Source-Software-Center
rename to meta-ti-bsp/licenses/Thai-Open-Source-Software-Center
diff --git a/recipes-bsp/bt-fw/bt-fw_git.bb b/meta-ti-bsp/recipes-bsp/bt-=
fw/bt-fw_git.bb
similarity index 100%
rename from recipes-bsp/bt-fw/bt-fw_git.bb
rename to meta-ti-bsp/recipes-bsp/bt-fw/bt-fw_git.bb
diff --git a/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb b/meta-ti=
-bsp/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb
similarity index 100%
rename from recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb
rename to meta-ti-bsp/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb
diff --git a/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb b/meta-ti-bsp/re=
cipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb
similarity index 100%
rename from recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb
rename to meta-ti-bsp/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb
diff --git a/recipes-bsp/cmem/cmem-mod_git.bb b/meta-ti-bsp/recipes-bsp/c=
mem/cmem-mod_git.bb
similarity index 100%
rename from recipes-bsp/cmem/cmem-mod_git.bb
rename to meta-ti-bsp/recipes-bsp/cmem/cmem-mod_git.bb
diff --git a/recipes-bsp/cmem/cmem.inc b/meta-ti-bsp/recipes-bsp/cmem/cme=
m.inc
similarity index 100%
rename from recipes-bsp/cmem/cmem.inc
rename to meta-ti-bsp/recipes-bsp/cmem/cmem.inc
diff --git a/recipes-bsp/cmem/cmem_git.bb b/meta-ti-bsp/recipes-bsp/cmem/=
cmem_git.bb
similarity index 100%
rename from recipes-bsp/cmem/cmem_git.bb
rename to meta-ti-bsp/recipes-bsp/cmem/cmem_git.bb
diff --git a/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb b/meta-ti-bsp=
/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb
similarity index 100%
rename from recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb
rename to meta-ti-bsp/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb
diff --git a/recipes-bsp/cuia/cuia_1.0.0.13.bb b/meta-ti-bsp/recipes-bsp/=
cuia/cuia_1.0.0.13.bb
similarity index 100%
rename from recipes-bsp/cuia/cuia_1.0.0.13.bb
rename to meta-ti-bsp/recipes-bsp/cuia/cuia_1.0.0.13.bb
diff --git a/recipes-bsp/dspdce-fw/dspdce-fw_git.bb b/meta-ti-bsp/recipes=
-bsp/dspdce-fw/dspdce-fw_git.bb
similarity index 100%
rename from recipes-bsp/dspdce-fw/dspdce-fw_git.bb
rename to meta-ti-bsp/recipes-bsp/dspdce-fw/dspdce-fw_git.bb
diff --git a/recipes-bsp/dsptop/debugss-module-drv_git.bb b/meta-ti-bsp/r=
ecipes-bsp/dsptop/debugss-module-drv_git.bb
similarity index 100%
rename from recipes-bsp/dsptop/debugss-module-drv_git.bb
rename to meta-ti-bsp/recipes-bsp/dsptop/debugss-module-drv_git.bb
diff --git a/recipes-bsp/dsptop/dsptop.inc b/meta-ti-bsp/recipes-bsp/dspt=
op/dsptop.inc
similarity index 100%
rename from recipes-bsp/dsptop/dsptop.inc
rename to meta-ti-bsp/recipes-bsp/dsptop/dsptop.inc
diff --git a/recipes-bsp/dsptop/dsptop_git.bb b/meta-ti-bsp/recipes-bsp/d=
sptop/dsptop_git.bb
similarity index 100%
rename from recipes-bsp/dsptop/dsptop_git.bb
rename to meta-ti-bsp/recipes-bsp/dsptop/dsptop_git.bb
diff --git a/recipes-bsp/dsptop/libulm_git.bb b/meta-ti-bsp/recipes-bsp/d=
sptop/libulm_git.bb
similarity index 100%
rename from recipes-bsp/dsptop/libulm_git.bb
rename to meta-ti-bsp/recipes-bsp/dsptop/libulm_git.bb
diff --git a/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb b/met=
a-ti-bsp/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
similarity index 100%
rename from recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
rename to meta-ti-bsp/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7=
.bb
diff --git a/recipes-bsp/goodix-fw/goodix-fw_git.bb b/meta-ti-bsp/recipes=
-bsp/goodix-fw/goodix-fw_git.bb
similarity index 100%
rename from recipes-bsp/goodix-fw/goodix-fw_git.bb
rename to meta-ti-bsp/recipes-bsp/goodix-fw/goodix-fw_git.bb
diff --git a/recipes-bsp/ipumm-fw/ipumm-fw_git.bb b/meta-ti-bsp/recipes-b=
sp/ipumm-fw/ipumm-fw_git.bb
similarity index 100%
rename from recipes-bsp/ipumm-fw/ipumm-fw_git.bb
rename to meta-ti-bsp/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
diff --git a/recipes-bsp/powervr-drivers/ti-img-rogue-driver/0001-compile=
r-support-OpenEmbedded-nodistro-internal-aarc.patch b/meta-ti-bsp/recipes=
-bsp/powervr-drivers/ti-img-rogue-driver/0001-compiler-support-OpenEmbedd=
ed-nodistro-internal-aarc.patch
similarity index 100%
rename from recipes-bsp/powervr-drivers/ti-img-rogue-driver/0001-compiler=
-support-OpenEmbedded-nodistro-internal-aarc.patch
rename to meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver/000=
1-compiler-support-OpenEmbedded-nodistro-internal-aarc.patch
diff --git a/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.13.5776728=
.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.13.57=
76728.bb
similarity index 100%
rename from recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.13.5776728.=
bb
rename to meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.1=
3.5776728.bb
diff --git a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb b/=
meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
similarity index 100%
rename from recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
rename to meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948=
957.bb
diff --git a/recipes-bsp/pru/pru-icss_git.bb b/meta-ti-bsp/recipes-bsp/pr=
u/pru-icss_git.bb
similarity index 100%
rename from recipes-bsp/pru/pru-icss_git.bb
rename to meta-ti-bsp/recipes-bsp/pru/pru-icss_git.bb
diff --git a/recipes-bsp/pru/ti-pru-sw-edma-driver_1.00.00.bb b/meta-ti-b=
sp/recipes-bsp/pru/ti-pru-sw-edma-driver_1.00.00.bb
similarity index 100%
rename from recipes-bsp/pru/ti-pru-sw-edma-driver_1.00.00.bb
rename to meta-ti-bsp/recipes-bsp/pru/ti-pru-sw-edma-driver_1.00.00.bb
diff --git a/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb b/meta-ti-b=
sp/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb
similarity index 100%
rename from recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb
rename to meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb
diff --git a/recipes-bsp/prueth-fw/prueth-fw-am65x_git.bb b/meta-ti-bsp/r=
ecipes-bsp/prueth-fw/prueth-fw-am65x_git.bb
similarity index 100%
rename from recipes-bsp/prueth-fw/prueth-fw-am65x_git.bb
rename to meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw-am65x_git.bb
diff --git a/recipes-bsp/prueth-fw/prueth-fw_5.6.15.bb b/meta-ti-bsp/reci=
pes-bsp/prueth-fw/prueth-fw_5.6.15.bb
similarity index 100%
rename from recipes-bsp/prueth-fw/prueth-fw_5.6.15.bb
rename to meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw_5.6.15.bb
diff --git a/recipes-bsp/pruhsr-fw/pruhsr-fw_2.17.25.bb b/meta-ti-bsp/rec=
ipes-bsp/pruhsr-fw/pruhsr-fw_2.17.25.bb
similarity index 100%
rename from recipes-bsp/pruhsr-fw/pruhsr-fw_2.17.25.bb
rename to meta-ti-bsp/recipes-bsp/pruhsr-fw/pruhsr-fw_2.17.25.bb
diff --git a/recipes-bsp/pruprp-fw/pruprp-fw_2.17.25.bb b/meta-ti-bsp/rec=
ipes-bsp/pruprp-fw/pruprp-fw_2.17.25.bb
similarity index 100%
rename from recipes-bsp/pruprp-fw/pruprp-fw_2.17.25.bb
rename to meta-ti-bsp/recipes-bsp/pruprp-fw/pruprp-fw_2.17.25.bb
diff --git a/recipes-bsp/prusw-fw/prusw-fw-am65x-sr2_git.bb b/meta-ti-bsp=
/recipes-bsp/prusw-fw/prusw-fw-am65x-sr2_git.bb
similarity index 100%
rename from recipes-bsp/prusw-fw/prusw-fw-am65x-sr2_git.bb
rename to meta-ti-bsp/recipes-bsp/prusw-fw/prusw-fw-am65x-sr2_git.bb
diff --git a/recipes-bsp/prusw-fw/prusw-fw_3.2.9.bb b/meta-ti-bsp/recipes=
-bsp/prusw-fw/prusw-fw_3.2.9.bb
similarity index 100%
rename from recipes-bsp/prusw-fw/prusw-fw_3.2.9.bb
rename to meta-ti-bsp/recipes-bsp/prusw-fw/prusw-fw_3.2.9.bb
diff --git a/recipes-bsp/ti-img-encode-decode/viddec-test-app_1.0.0.bb b/=
meta-ti-bsp/recipes-bsp/ti-img-encode-decode/viddec-test-app_1.0.0.bb
similarity index 100%
rename from recipes-bsp/ti-img-encode-decode/viddec-test-app_1.0.0.bb
rename to meta-ti-bsp/recipes-bsp/ti-img-encode-decode/viddec-test-app_1.=
0.0.bb
diff --git a/recipes-bsp/ti-img-encode-decode/videnc-test-app_1.0.0.bb b/=
meta-ti-bsp/recipes-bsp/ti-img-encode-decode/videnc-test-app_1.0.0.bb
similarity index 100%
rename from recipes-bsp/ti-img-encode-decode/videnc-test-app_1.0.0.bb
rename to meta-ti-bsp/recipes-bsp/ti-img-encode-decode/videnc-test-app_1.=
0.0.bb
diff --git a/recipes-bsp/ti-img-encode-decode/vxd-dec-fw_git.bb b/meta-ti=
-bsp/recipes-bsp/ti-img-encode-decode/vxd-dec-fw_git.bb
similarity index 100%
rename from recipes-bsp/ti-img-encode-decode/vxd-dec-fw_git.bb
rename to meta-ti-bsp/recipes-bsp/ti-img-encode-decode/vxd-dec-fw_git.bb
diff --git a/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/meta-ti-bsp/recipe=
s-bsp/ti-linux-fw/ti-linux-fw.inc
similarity index 100%
rename from recipes-bsp/ti-linux-fw/ti-linux-fw.inc
rename to meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
diff --git a/recipes-bsp/ti-sci-fw/files/0001-Makefile-Skip-signing-of-bi=
naries-for-combined-boot-.patch b/meta-ti-bsp/recipes-bsp/ti-sci-fw/files=
/0001-Makefile-Skip-signing-of-binaries-for-combined-boot-.patch
similarity index 100%
rename from recipes-bsp/ti-sci-fw/files/0001-Makefile-Skip-signing-of-bin=
aries-for-combined-boot-.patch
rename to meta-ti-bsp/recipes-bsp/ti-sci-fw/files/0001-Makefile-Skip-sign=
ing-of-binaries-for-combined-boot-.patch
diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw-source_git.bb b/meta-ti-bsp/=
recipes-bsp/ti-sci-fw/ti-sci-fw-source_git.bb
similarity index 100%
rename from recipes-bsp/ti-sci-fw/ti-sci-fw-source_git.bb
rename to meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw-source_git.bb
diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/meta-ti-bsp/recipes=
-bsp/ti-sci-fw/ti-sci-fw_git.bb
similarity index 100%
rename from recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
rename to meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
diff --git a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend=
 b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappe=
nd
similarity index 100%
rename from recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
rename to meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%=
.bbappend
diff --git a/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb b/meta-ti-bsp/r=
ecipes-bsp/u-boot/u-boot-ti-mainline_git.bb
similarity index 100%
rename from recipes-bsp/u-boot/u-boot-ti-mainline_git.bb
rename to meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb
diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb b/meta-ti-bs=
p/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb
similarity index 100%
rename from recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb
rename to meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb
diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb b/meta-ti-bs=
p/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
similarity index 100%
rename from recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
rename to meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
diff --git a/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-bsp/recipes-bsp/u=
-boot/u-boot-ti.inc
similarity index 100%
rename from recipes-bsp/u-boot/u-boot-ti.inc
rename to meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
diff --git a/recipes-bsp/uio-module-drv/uio-module-drv-test_git.bb b/meta=
-ti-bsp/recipes-bsp/uio-module-drv/uio-module-drv-test_git.bb
similarity index 100%
rename from recipes-bsp/uio-module-drv/uio-module-drv-test_git.bb
rename to meta-ti-bsp/recipes-bsp/uio-module-drv/uio-module-drv-test_git.=
bb
diff --git a/recipes-bsp/uio-module-drv/uio-module-drv.inc b/meta-ti-bsp/=
recipes-bsp/uio-module-drv/uio-module-drv.inc
similarity index 100%
rename from recipes-bsp/uio-module-drv/uio-module-drv.inc
rename to meta-ti-bsp/recipes-bsp/uio-module-drv/uio-module-drv.inc
diff --git a/recipes-bsp/uio-module-drv/uio-module-drv/0001-uio-module-dr=
v-Replace-ioremap_nocache-with-ioremap.patch b/meta-ti-bsp/recipes-bsp/ui=
o-module-drv/uio-module-drv/0001-uio-module-drv-Replace-ioremap_nocache-w=
ith-ioremap.patch
similarity index 100%
rename from recipes-bsp/uio-module-drv/uio-module-drv/0001-uio-module-drv=
-Replace-ioremap_nocache-with-ioremap.patch
rename to meta-ti-bsp/recipes-bsp/uio-module-drv/uio-module-drv/0001-uio-=
module-drv-Replace-ioremap_nocache-with-ioremap.patch
diff --git a/recipes-bsp/uio-module-drv/uio-module-drv_git.bb b/meta-ti-b=
sp/recipes-bsp/uio-module-drv/uio-module-drv_git.bb
similarity index 100%
rename from recipes-bsp/uio-module-drv/uio-module-drv_git.bb
rename to meta-ti-bsp/recipes-bsp/uio-module-drv/uio-module-drv_git.bb
diff --git a/recipes-bsp/vis-fw/vis_01.50.07.15.bb b/meta-ti-bsp/recipes-=
bsp/vis-fw/vis_01.50.07.15.bb
similarity index 100%
rename from recipes-bsp/vis-fw/vis_01.50.07.15.bb
rename to meta-ti-bsp/recipes-bsp/vis-fw/vis_01.50.07.15.bb
diff --git a/recipes-bsp/vpdma-fw/vpdma-fw_03-2012.bb b/meta-ti-bsp/recip=
es-bsp/vpdma-fw/vpdma-fw_03-2012.bb
similarity index 100%
rename from recipes-bsp/vpdma-fw/vpdma-fw_03-2012.bb
rename to meta-ti-bsp/recipes-bsp/vpdma-fw/vpdma-fw_03-2012.bb
diff --git a/recipes-bsp/vpe-tests/vpe-tests_git.bb b/meta-ti-bsp/recipes=
-bsp/vpe-tests/vpe-tests_git.bb
similarity index 100%
rename from recipes-bsp/vpe-tests/vpe-tests_git.bb
rename to meta-ti-bsp/recipes-bsp/vpe-tests/vpe-tests_git.bb
diff --git a/recipes-bsp/wl18xx-fw/wl18xx-fw/0001-Add-Makefile-to-install=
-firmware-files.patch b/meta-ti-bsp/recipes-bsp/wl18xx-fw/wl18xx-fw/0001-=
Add-Makefile-to-install-firmware-files.patch
similarity index 100%
rename from recipes-bsp/wl18xx-fw/wl18xx-fw/0001-Add-Makefile-to-install-=
firmware-files.patch
rename to meta-ti-bsp/recipes-bsp/wl18xx-fw/wl18xx-fw/0001-Add-Makefile-t=
o-install-firmware-files.patch
diff --git a/recipes-bsp/wl18xx-fw/wl18xx-fw_8.9.0.0.86.bb b/meta-ti-bsp/=
recipes-bsp/wl18xx-fw/wl18xx-fw_8.9.0.0.86.bb
similarity index 100%
rename from recipes-bsp/wl18xx-fw/wl18xx-fw_8.9.0.0.86.bb
rename to meta-ti-bsp/recipes-bsp/wl18xx-fw/wl18xx-fw_8.9.0.0.86.bb
diff --git a/recipes-connectivity/uim/uim-sysfs_8.5.bb b/meta-ti-bsp/reci=
pes-connectivity/uim/uim-sysfs_8.5.bb
similarity index 100%
rename from recipes-connectivity/uim/uim-sysfs_8.5.bb
rename to meta-ti-bsp/recipes-connectivity/uim/uim-sysfs_8.5.bb
diff --git a/recipes-connectivity/wl18xx-calibrator/wl18xx-calibrator/000=
1-plt.h-Do-not-define-EFUSE_PARAMETER_TYPE_ENMT-type-e.patch b/meta-ti-bs=
p/recipes-connectivity/wl18xx-calibrator/wl18xx-calibrator/0001-plt.h-Do-=
not-define-EFUSE_PARAMETER_TYPE_ENMT-type-e.patch
similarity index 100%
rename from recipes-connectivity/wl18xx-calibrator/wl18xx-calibrator/0001=
-plt.h-Do-not-define-EFUSE_PARAMETER_TYPE_ENMT-type-e.patch
rename to meta-ti-bsp/recipes-connectivity/wl18xx-calibrator/wl18xx-calib=
rator/0001-plt.h-Do-not-define-EFUSE_PARAMETER_TYPE_ENMT-type-e.patch
diff --git a/recipes-connectivity/wl18xx-calibrator/wl18xx-calibrator_8.7=
.3.bb b/meta-ti-bsp/recipes-connectivity/wl18xx-calibrator/wl18xx-calibra=
tor_8.7.3.bb
similarity index 100%
rename from recipes-connectivity/wl18xx-calibrator/wl18xx-calibrator_8.7.=
3.bb
rename to meta-ti-bsp/recipes-connectivity/wl18xx-calibrator/wl18xx-calib=
rator_8.7.3.bb
diff --git a/recipes-connectivity/wl18xx-target-scripts/wl18xx-target-scr=
ipts/0001-print_stat.sh-replace-system-bin-sh-with-bin-sh.patch b/meta-ti=
-bsp/recipes-connectivity/wl18xx-target-scripts/wl18xx-target-scripts/000=
1-print_stat.sh-replace-system-bin-sh-with-bin-sh.patch
similarity index 100%
rename from recipes-connectivity/wl18xx-target-scripts/wl18xx-target-scri=
pts/0001-print_stat.sh-replace-system-bin-sh-with-bin-sh.patch
rename to meta-ti-bsp/recipes-connectivity/wl18xx-target-scripts/wl18xx-t=
arget-scripts/0001-print_stat.sh-replace-system-bin-sh-with-bin-sh.patch
diff --git a/recipes-connectivity/wl18xx-target-scripts/wl18xx-target-scr=
ipts_8.7.3.bb b/meta-ti-bsp/recipes-connectivity/wl18xx-target-scripts/wl=
18xx-target-scripts_8.7.3.bb
similarity index 100%
rename from recipes-connectivity/wl18xx-target-scripts/wl18xx-target-scri=
pts_8.7.3.bb
rename to meta-ti-bsp/recipes-connectivity/wl18xx-target-scripts/wl18xx-t=
arget-scripts_8.7.3.bb
diff --git a/recipes-connectivity/wlconf/wlconf_8.7.3.bb b/meta-ti-bsp/re=
cipes-connectivity/wlconf/wlconf_8.7.3.bb
similarity index 100%
rename from recipes-connectivity/wlconf/wlconf_8.7.3.bb
rename to meta-ti-bsp/recipes-connectivity/wlconf/wlconf_8.7.3.bb
diff --git a/recipes-core/udev/eudev/firmware.rules b/meta-ti-bsp/recipes=
-core/udev/eudev/firmware.rules
similarity index 100%
rename from recipes-core/udev/eudev/firmware.rules
rename to meta-ti-bsp/recipes-core/udev/eudev/firmware.rules
diff --git a/recipes-core/udev/eudev/omap-tty.rules b/meta-ti-bsp/recipes=
-core/udev/eudev/omap-tty.rules
similarity index 100%
rename from recipes-core/udev/eudev/omap-tty.rules
rename to meta-ti-bsp/recipes-core/udev/eudev/omap-tty.rules
diff --git a/recipes-core/udev/eudev_%.bbappend b/meta-ti-bsp/recipes-cor=
e/udev/eudev_%.bbappend
similarity index 100%
rename from recipes-core/udev/eudev_%.bbappend
rename to meta-ti-bsp/recipes-core/udev/eudev_%.bbappend
diff --git a/recipes-devtools/gdbc6x/gdbc6x.inc b/meta-ti-bsp/recipes-dev=
tools/gdbc6x/gdbc6x.inc
similarity index 100%
rename from recipes-devtools/gdbc6x/gdbc6x.inc
rename to meta-ti-bsp/recipes-devtools/gdbc6x/gdbc6x.inc
diff --git a/recipes-devtools/gdbc6x/gdbc6x/0001-libbfd.h-suppress-GCC9-W=
stringop-truncation.patch b/meta-ti-bsp/recipes-devtools/gdbc6x/gdbc6x/00=
01-libbfd.h-suppress-GCC9-Wstringop-truncation.patch
similarity index 100%
rename from recipes-devtools/gdbc6x/gdbc6x/0001-libbfd.h-suppress-GCC9-Ws=
tringop-truncation.patch
rename to meta-ti-bsp/recipes-devtools/gdbc6x/gdbc6x/0001-libbfd.h-suppre=
ss-GCC9-Wstringop-truncation.patch
diff --git a/recipes-devtools/gdbc6x/gdbc6x/init b/meta-ti-bsp/recipes-de=
vtools/gdbc6x/gdbc6x/init
similarity index 100%
rename from recipes-devtools/gdbc6x/gdbc6x/init
rename to meta-ti-bsp/recipes-devtools/gdbc6x/gdbc6x/init
diff --git a/recipes-devtools/gdbc6x/gdbc6x_git.bb b/meta-ti-bsp/recipes-=
devtools/gdbc6x/gdbc6x_git.bb
similarity index 100%
rename from recipes-devtools/gdbc6x/gdbc6x_git.bb
rename to meta-ti-bsp/recipes-devtools/gdbc6x/gdbc6x_git.bb
diff --git a/recipes-devtools/gdbc6x/gdbserver-c6x_git.bb b/meta-ti-bsp/r=
ecipes-devtools/gdbc6x/gdbserver-c6x_git.bb
similarity index 100%
rename from recipes-devtools/gdbc6x/gdbserver-c6x_git.bb
rename to meta-ti-bsp/recipes-devtools/gdbc6x/gdbserver-c6x_git.bb
diff --git a/recipes-devtools/gdbc6x/gdbserverproxy-module-drv_git.bb b/m=
eta-ti-bsp/recipes-devtools/gdbc6x/gdbserverproxy-module-drv_git.bb
similarity index 100%
rename from recipes-devtools/gdbc6x/gdbserverproxy-module-drv_git.bb
rename to meta-ti-bsp/recipes-devtools/gdbc6x/gdbserverproxy-module-drv_g=
it.bb
diff --git a/recipes-devtools/ion/libion_git.bb b/meta-ti-bsp/recipes-dev=
tools/ion/libion_git.bb
similarity index 100%
rename from recipes-devtools/ion/libion_git.bb
rename to meta-ti-bsp/recipes-devtools/ion/libion_git.bb
diff --git a/recipes-devtools/k3conf/k3conf_git.bb b/meta-ti-bsp/recipes-=
devtools/k3conf/k3conf_git.bb
similarity index 100%
rename from recipes-devtools/k3conf/k3conf_git.bb
rename to meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb
diff --git a/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb b/meta-ti=
-bsp/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb
similarity index 100%
rename from recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb
rename to meta-ti-bsp/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb
diff --git a/recipes-graphics/libgles/ti-img-rogue-umlibs_1.13.5776728.bb=
 b/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_1.13.5776728.=
bb
similarity index 100%
rename from recipes-graphics/libgles/ti-img-rogue-umlibs_1.13.5776728.bb
rename to meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_1.13.5=
776728.bb
diff --git a/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb b/met=
a-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
similarity index 100%
rename from recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
rename to meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957=
.bb
diff --git a/recipes-kernel/linux/bundle-devicetree.inc b/meta-ti-bsp/rec=
ipes-kernel/linux/bundle-devicetree.inc
similarity index 100%
rename from recipes-kernel/linux/bundle-devicetree.inc
rename to meta-ti-bsp/recipes-kernel/linux/bundle-devicetree.inc
diff --git a/recipes-kernel/linux/cmem.inc b/meta-ti-bsp/recipes-kernel/l=
inux/cmem.inc
similarity index 100%
rename from recipes-kernel/linux/cmem.inc
rename to meta-ti-bsp/recipes-kernel/linux/cmem.inc
diff --git a/recipes-kernel/linux/files/cmem.dtsi b/meta-ti-bsp/recipes-k=
ernel/linux/files/cmem.dtsi
similarity index 100%
rename from recipes-kernel/linux/files/cmem.dtsi
rename to meta-ti-bsp/recipes-kernel/linux/files/cmem.dtsi
diff --git a/recipes-kernel/linux/files/configs/empty b/meta-ti-bsp/recip=
es-kernel/linux/files/configs/empty
similarity index 100%
rename from recipes-kernel/linux/files/configs/empty
rename to meta-ti-bsp/recipes-kernel/linux/files/configs/empty
diff --git a/recipes-kernel/linux/files/dra7xx/am571x-pru-uio.dtsi b/meta=
-ti-bsp/recipes-kernel/linux/files/dra7xx/am571x-pru-uio.dtsi
similarity index 100%
rename from recipes-kernel/linux/files/dra7xx/am571x-pru-uio.dtsi
rename to meta-ti-bsp/recipes-kernel/linux/files/dra7xx/am571x-pru-uio.dt=
si
diff --git a/recipes-kernel/linux/files/dra7xx/am57xx-pru-uio.dtsi b/meta=
-ti-bsp/recipes-kernel/linux/files/dra7xx/am57xx-pru-uio.dtsi
similarity index 100%
rename from recipes-kernel/linux/files/dra7xx/am57xx-pru-uio.dtsi
rename to meta-ti-bsp/recipes-kernel/linux/files/dra7xx/am57xx-pru-uio.dt=
si
diff --git a/recipes-kernel/linux/files/dra7xx/cmem-am571x.dtsi b/meta-ti=
-bsp/recipes-kernel/linux/files/dra7xx/cmem-am571x.dtsi
similarity index 100%
rename from recipes-kernel/linux/files/dra7xx/cmem-am571x.dtsi
rename to meta-ti-bsp/recipes-kernel/linux/files/dra7xx/cmem-am571x.dtsi
diff --git a/recipes-kernel/linux/files/dra7xx/cmem-am5729-beagleboneai.d=
tsi b/meta-ti-bsp/recipes-kernel/linux/files/dra7xx/cmem-am5729-beaglebon=
eai.dtsi
similarity index 100%
rename from recipes-kernel/linux/files/dra7xx/cmem-am5729-beagleboneai.dt=
si
rename to meta-ti-bsp/recipes-kernel/linux/files/dra7xx/cmem-am5729-beagl=
eboneai.dtsi
diff --git a/recipes-kernel/linux/files/dra7xx/cmem-am572idk.dtsi b/meta-=
ti-bsp/recipes-kernel/linux/files/dra7xx/cmem-am572idk.dtsi
similarity index 100%
rename from recipes-kernel/linux/files/dra7xx/cmem-am572idk.dtsi
rename to meta-ti-bsp/recipes-kernel/linux/files/dra7xx/cmem-am572idk.dts=
i
diff --git a/recipes-kernel/linux/files/dra7xx/cmem-am574x.dtsi b/meta-ti=
-bsp/recipes-kernel/linux/files/dra7xx/cmem-am574x.dtsi
similarity index 100%
rename from recipes-kernel/linux/files/dra7xx/cmem-am574x.dtsi
rename to meta-ti-bsp/recipes-kernel/linux/files/dra7xx/cmem-am574x.dtsi
diff --git a/recipes-kernel/linux/files/dra7xx/cmem-dra71x.dtsi b/meta-ti=
-bsp/recipes-kernel/linux/files/dra7xx/cmem-dra71x.dtsi
similarity index 100%
rename from recipes-kernel/linux/files/dra7xx/cmem-dra71x.dtsi
rename to meta-ti-bsp/recipes-kernel/linux/files/dra7xx/cmem-dra71x.dtsi
diff --git a/recipes-kernel/linux/files/dra7xx/cmem-dra72x.dtsi b/meta-ti=
-bsp/recipes-kernel/linux/files/dra7xx/cmem-dra72x.dtsi
similarity index 100%
rename from recipes-kernel/linux/files/dra7xx/cmem-dra72x.dtsi
rename to meta-ti-bsp/recipes-kernel/linux/files/dra7xx/cmem-dra72x.dtsi
diff --git a/recipes-kernel/linux/files/dra7xx/cmem-dra76x.dtsi b/meta-ti=
-bsp/recipes-kernel/linux/files/dra7xx/cmem-dra76x.dtsi
similarity index 100%
rename from recipes-kernel/linux/files/dra7xx/cmem-dra76x.dtsi
rename to meta-ti-bsp/recipes-kernel/linux/files/dra7xx/cmem-dra76x.dtsi
diff --git a/recipes-kernel/linux/files/dra7xx/cmem.dtsi b/meta-ti-bsp/re=
cipes-kernel/linux/files/dra7xx/cmem.dtsi
similarity index 100%
rename from recipes-kernel/linux/files/dra7xx/cmem.dtsi
rename to meta-ti-bsp/recipes-kernel/linux/files/dra7xx/cmem.dtsi
diff --git a/recipes-kernel/linux/files/ti33x/am335x-pru-uio.dtsi b/meta-=
ti-bsp/recipes-kernel/linux/files/ti33x/am335x-pru-uio.dtsi
similarity index 100%
rename from recipes-kernel/linux/files/ti33x/am335x-pru-uio.dtsi
rename to meta-ti-bsp/recipes-kernel/linux/files/ti33x/am335x-pru-uio.dts=
i
diff --git a/recipes-kernel/linux/files/ti43x/am437x-pru-uio.dtsi b/meta-=
ti-bsp/recipes-kernel/linux/files/ti43x/am437x-pru-uio.dtsi
similarity index 100%
rename from recipes-kernel/linux/files/ti43x/am437x-pru-uio.dtsi
rename to meta-ti-bsp/recipes-kernel/linux/files/ti43x/am437x-pru-uio.dts=
i
diff --git a/recipes-kernel/linux/kernel-rdepends.inc b/meta-ti-bsp/recip=
es-kernel/linux/kernel-rdepends.inc
similarity index 100%
rename from recipes-kernel/linux/kernel-rdepends.inc
rename to meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc
diff --git a/recipes-kernel/linux/linux-ti-mainline/defconfig b/meta-ti-b=
sp/recipes-kernel/linux/linux-ti-mainline/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-ti-mainline/defconfig
rename to meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline/defconfig
diff --git a/recipes-kernel/linux/linux-ti-mainline/dra7xx/defconfig b/me=
ta-ti-bsp/recipes-kernel/linux/linux-ti-mainline/dra7xx/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-ti-mainline/dra7xx/defconfig
rename to meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline/dra7xx/defco=
nfig
diff --git a/recipes-kernel/linux/linux-ti-mainline/k3/defconfig b/meta-t=
i-bsp/recipes-kernel/linux/linux-ti-mainline/k3/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-ti-mainline/k3/defconfig
rename to meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline/k3/defconfig
diff --git a/recipes-kernel/linux/linux-ti-mainline/omapl138/defconfig b/=
meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline/omapl138/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-ti-mainline/omapl138/defconfig
rename to meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline/omapl138/def=
config
diff --git a/recipes-kernel/linux/linux-ti-mainline/ti33x/defconfig b/met=
a-ti-bsp/recipes-kernel/linux/linux-ti-mainline/ti33x/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-ti-mainline/ti33x/defconfig
rename to meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline/ti33x/defcon=
fig
diff --git a/recipes-kernel/linux/linux-ti-mainline/ti43x/defconfig b/met=
a-ti-bsp/recipes-kernel/linux/linux-ti-mainline/ti43x/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-ti-mainline/ti43x/defconfig
rename to meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline/ti43x/defcon=
fig
diff --git a/recipes-kernel/linux/linux-ti-mainline_git.bb b/meta-ti-bsp/=
recipes-kernel/linux/linux-ti-mainline_git.bb
similarity index 100%
rename from recipes-kernel/linux/linux-ti-mainline_git.bb
rename to meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
diff --git a/recipes-kernel/linux/linux-ti-staging-5.10/defconfig b/meta-=
ti-bsp/recipes-kernel/linux/linux-ti-staging-5.10/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-ti-staging-5.10/defconfig
rename to meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-5.10/defconfi=
g
diff --git a/recipes-kernel/linux/linux-ti-staging-5.10/dra7xx/defconfig =
b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-5.10/dra7xx/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-ti-staging-5.10/dra7xx/defconfig
rename to meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-5.10/dra7xx/d=
efconfig
diff --git a/recipes-kernel/linux/linux-ti-staging-5.10/k3/defconfig b/me=
ta-ti-bsp/recipes-kernel/linux/linux-ti-staging-5.10/k3/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-ti-staging-5.10/k3/defconfig
rename to meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-5.10/k3/defco=
nfig
diff --git a/recipes-kernel/linux/linux-ti-staging-5.10/omapl138/defconfi=
g b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-5.10/omapl138/defco=
nfig
similarity index 100%
rename from recipes-kernel/linux/linux-ti-staging-5.10/omapl138/defconfig
rename to meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-5.10/omapl138=
/defconfig
diff --git a/recipes-kernel/linux/linux-ti-staging-5.10/ti33x/defconfig b=
/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-5.10/ti33x/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-ti-staging-5.10/ti33x/defconfig
rename to meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-5.10/ti33x/de=
fconfig
diff --git a/recipes-kernel/linux/linux-ti-staging-5.10/ti43x/defconfig b=
/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-5.10/ti43x/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-ti-staging-5.10/ti43x/defconfig
rename to meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-5.10/ti43x/de=
fconfig
diff --git a/recipes-kernel/linux/linux-ti-staging-5.4/defconfig b/meta-t=
i-bsp/recipes-kernel/linux/linux-ti-staging-5.4/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-ti-staging-5.4/defconfig
rename to meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-5.4/defconfig
diff --git a/recipes-kernel/linux/linux-ti-staging-5.4/dra7xx/defconfig b=
/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-5.4/dra7xx/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-ti-staging-5.4/dra7xx/defconfig
rename to meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-5.4/dra7xx/de=
fconfig
diff --git a/recipes-kernel/linux/linux-ti-staging-5.4/k3/defconfig b/met=
a-ti-bsp/recipes-kernel/linux/linux-ti-staging-5.4/k3/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-ti-staging-5.4/k3/defconfig
rename to meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-5.4/k3/defcon=
fig
diff --git a/recipes-kernel/linux/linux-ti-staging-5.4/omapl138/defconfig=
 b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-5.4/omapl138/defconf=
ig
similarity index 100%
rename from recipes-kernel/linux/linux-ti-staging-5.4/omapl138/defconfig
rename to meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-5.4/omapl138/=
defconfig
diff --git a/recipes-kernel/linux/linux-ti-staging-5.4/ti33x/defconfig b/=
meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-5.4/ti33x/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-ti-staging-5.4/ti33x/defconfig
rename to meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-5.4/ti33x/def=
config
diff --git a/recipes-kernel/linux/linux-ti-staging-5.4/ti43x/defconfig b/=
meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-5.4/ti43x/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-ti-staging-5.4/ti43x/defconfig
rename to meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-5.4/ti43x/def=
config
diff --git a/recipes-kernel/linux/linux-ti-staging-rt-5.10/defconfig b/me=
ta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-5.10/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-ti-staging-rt-5.10/defconfig
rename to meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-5.10/defco=
nfig
diff --git a/recipes-kernel/linux/linux-ti-staging-rt-5.10/dra7xx/defconf=
ig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-5.10/dra7xx/def=
config
similarity index 100%
rename from recipes-kernel/linux/linux-ti-staging-rt-5.10/dra7xx/defconfi=
g
rename to meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-5.10/dra7x=
x/defconfig
diff --git a/recipes-kernel/linux/linux-ti-staging-rt-5.10/k3/defconfig b=
/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-5.10/k3/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-ti-staging-rt-5.10/k3/defconfig
rename to meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-5.10/k3/de=
fconfig
diff --git a/recipes-kernel/linux/linux-ti-staging-rt-5.10/ti33x/defconfi=
g b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-5.10/ti33x/defco=
nfig
similarity index 100%
rename from recipes-kernel/linux/linux-ti-staging-rt-5.10/ti33x/defconfig
rename to meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-5.10/ti33x=
/defconfig
diff --git a/recipes-kernel/linux/linux-ti-staging-rt-5.10/ti43x/defconfi=
g b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-5.10/ti43x/defco=
nfig
similarity index 100%
rename from recipes-kernel/linux/linux-ti-staging-rt-5.10/ti43x/defconfig
rename to meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-5.10/ti43x=
/defconfig
diff --git a/recipes-kernel/linux/linux-ti-staging-rt-5.4/defconfig b/met=
a-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-5.4/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-ti-staging-rt-5.4/defconfig
rename to meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-5.4/defcon=
fig
diff --git a/recipes-kernel/linux/linux-ti-staging-rt-5.4/dra7xx/defconfi=
g b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-5.4/dra7xx/defco=
nfig
similarity index 100%
rename from recipes-kernel/linux/linux-ti-staging-rt-5.4/dra7xx/defconfig
rename to meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-5.4/dra7xx=
/defconfig
diff --git a/recipes-kernel/linux/linux-ti-staging-rt-5.4/k3/defconfig b/=
meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-5.4/k3/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-ti-staging-rt-5.4/k3/defconfig
rename to meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-5.4/k3/def=
config
diff --git a/recipes-kernel/linux/linux-ti-staging-rt-5.4/ti33x/defconfig=
 b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-5.4/ti33x/defconf=
ig
similarity index 100%
rename from recipes-kernel/linux/linux-ti-staging-rt-5.4/ti33x/defconfig
rename to meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-5.4/ti33x/=
defconfig
diff --git a/recipes-kernel/linux/linux-ti-staging-rt-5.4/ti43x/defconfig=
 b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-5.4/ti43x/defconf=
ig
similarity index 100%
rename from recipes-kernel/linux/linux-ti-staging-rt-5.4/ti43x/defconfig
rename to meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-5.4/ti43x/=
defconfig
diff --git a/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb b/meta-ti-b=
sp/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
similarity index 100%
rename from recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
rename to meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
diff --git a/recipes-kernel/linux/linux-ti-staging-rt_5.4.bb b/meta-ti-bs=
p/recipes-kernel/linux/linux-ti-staging-rt_5.4.bb
similarity index 100%
rename from recipes-kernel/linux/linux-ti-staging-rt_5.4.bb
rename to meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_5.4.bb
diff --git a/recipes-kernel/linux/linux-ti-staging-systest-5.10/defconfig=
 b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-5.10/defconf=
ig
similarity index 100%
rename from recipes-kernel/linux/linux-ti-staging-systest-5.10/defconfig
rename to meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-5.10/=
defconfig
diff --git a/recipes-kernel/linux/linux-ti-staging-systest-5.10/dra7xx/de=
fconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-5.10/=
dra7xx/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-ti-staging-systest-5.10/dra7xx/def=
config
rename to meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-5.10/=
dra7xx/defconfig
diff --git a/recipes-kernel/linux/linux-ti-staging-systest-5.10/k3/defcon=
fig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-5.10/k3/d=
efconfig
similarity index 100%
rename from recipes-kernel/linux/linux-ti-staging-systest-5.10/k3/defconf=
ig
rename to meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-5.10/=
k3/defconfig
diff --git a/recipes-kernel/linux/linux-ti-staging-systest-5.10/omapl138/=
defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-5.1=
0/omapl138/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-ti-staging-systest-5.10/omapl138/d=
efconfig
rename to meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-5.10/=
omapl138/defconfig
diff --git a/recipes-kernel/linux/linux-ti-staging-systest-5.10/ti33x/def=
config b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-5.10/t=
i33x/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-ti-staging-systest-5.10/ti33x/defc=
onfig
rename to meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-5.10/=
ti33x/defconfig
diff --git a/recipes-kernel/linux/linux-ti-staging-systest-5.10/ti43x/def=
config b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-5.10/t=
i43x/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-ti-staging-systest-5.10/ti43x/defc=
onfig
rename to meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-5.10/=
ti43x/defconfig
diff --git a/recipes-kernel/linux/linux-ti-staging-systest-5.4/defconfig =
b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-5.4/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-ti-staging-systest-5.4/defconfig
rename to meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-5.4/d=
efconfig
diff --git a/recipes-kernel/linux/linux-ti-staging-systest-5.4/dra7xx/def=
config b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-5.4/dr=
a7xx/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-ti-staging-systest-5.4/dra7xx/defc=
onfig
rename to meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-5.4/d=
ra7xx/defconfig
diff --git a/recipes-kernel/linux/linux-ti-staging-systest-5.4/k3/defconf=
ig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-5.4/k3/def=
config
similarity index 100%
rename from recipes-kernel/linux/linux-ti-staging-systest-5.4/k3/defconfi=
g
rename to meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-5.4/k=
3/defconfig
diff --git a/recipes-kernel/linux/linux-ti-staging-systest-5.4/omapl138/d=
efconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-5.4/=
omapl138/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-ti-staging-systest-5.4/omapl138/de=
fconfig
rename to meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-5.4/o=
mapl138/defconfig
diff --git a/recipes-kernel/linux/linux-ti-staging-systest-5.4/ti33x/defc=
onfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-5.4/ti3=
3x/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-ti-staging-systest-5.4/ti33x/defco=
nfig
rename to meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-5.4/t=
i33x/defconfig
diff --git a/recipes-kernel/linux/linux-ti-staging-systest-5.4/ti43x/defc=
onfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-5.4/ti4=
3x/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-ti-staging-systest-5.4/ti43x/defco=
nfig
rename to meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-5.4/t=
i43x/defconfig
diff --git a/recipes-kernel/linux/linux-ti-staging-systest_5.10.bb b/meta=
-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest_5.10.bb
similarity index 100%
rename from recipes-kernel/linux/linux-ti-staging-systest_5.10.bb
rename to meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest_5.10.=
bb
diff --git a/recipes-kernel/linux/linux-ti-staging-systest_5.4.bb b/meta-=
ti-bsp/recipes-kernel/linux/linux-ti-staging-systest_5.4.bb
similarity index 100%
rename from recipes-kernel/linux/linux-ti-staging-systest_5.4.bb
rename to meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest_5.4.b=
b
diff --git a/recipes-kernel/linux/linux-ti-staging_5.10.bb b/meta-ti-bsp/=
recipes-kernel/linux/linux-ti-staging_5.10.bb
similarity index 100%
rename from recipes-kernel/linux/linux-ti-staging_5.10.bb
rename to meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_5.10.bb
diff --git a/recipes-kernel/linux/linux-ti-staging_5.4.bb b/meta-ti-bsp/r=
ecipes-kernel/linux/linux-ti-staging_5.4.bb
similarity index 100%
rename from recipes-kernel/linux/linux-ti-staging_5.4.bb
rename to meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_5.4.bb
diff --git a/recipes-kernel/linux/setup-defconfig.inc b/meta-ti-bsp/recip=
es-kernel/linux/setup-defconfig.inc
similarity index 100%
rename from recipes-kernel/linux/setup-defconfig.inc
rename to meta-ti-bsp/recipes-kernel/linux/setup-defconfig.inc
diff --git a/recipes-kernel/linux/ti-kernel.inc b/meta-ti-bsp/recipes-ker=
nel/linux/ti-kernel.inc
similarity index 100%
rename from recipes-kernel/linux/ti-kernel.inc
rename to meta-ti-bsp/recipes-kernel/linux/ti-kernel.inc
diff --git a/recipes-kernel/linux/ti-uio.inc b/meta-ti-bsp/recipes-kernel=
/linux/ti-uio.inc
similarity index 100%
rename from recipes-kernel/linux/ti-uio.inc
rename to meta-ti-bsp/recipes-kernel/linux/ti-uio.inc
diff --git a/recipes-multimedia/libdce/libdce_3.00.14.00.bb b/meta-ti-bsp=
/recipes-multimedia/libdce/libdce_3.00.14.00.bb
similarity index 100%
rename from recipes-multimedia/libdce/libdce_3.00.14.00.bb
rename to meta-ti-bsp/recipes-multimedia/libdce/libdce_3.00.14.00.bb
diff --git a/recipes-security/optee/optee-%.bbappend b/meta-ti-bsp/recipe=
s-security/optee/optee-%.bbappend
similarity index 100%
rename from recipes-security/optee/optee-%.bbappend
rename to meta-ti-bsp/recipes-security/optee/optee-%.bbappend
diff --git a/recipes-security/optee/optee-os_%.bbappend b/meta-ti-bsp/rec=
ipes-security/optee/optee-os_%.bbappend
similarity index 100%
rename from recipes-security/optee/optee-os_%.bbappend
rename to meta-ti-bsp/recipes-security/optee/optee-os_%.bbappend
diff --git a/recipes-ti/README b/meta-ti-bsp/recipes-ti/README
similarity index 100%
rename from recipes-ti/README
rename to meta-ti-bsp/recipes-ti/README
diff --git a/recipes-ti/beagleboard/beaglebone-capes.bb b/meta-ti-bsp/rec=
ipes-ti/beagleboard/beaglebone-capes.bb
similarity index 100%
rename from recipes-ti/beagleboard/beaglebone-capes.bb
rename to meta-ti-bsp/recipes-ti/beagleboard/beaglebone-capes.bb
diff --git a/recipes-ti/beagleboard/beaglebone-capes/cape-stop.sh b/meta-=
ti-bsp/recipes-ti/beagleboard/beaglebone-capes/cape-stop.sh
similarity index 100%
rename from recipes-ti/beagleboard/beaglebone-capes/cape-stop.sh
rename to meta-ti-bsp/recipes-ti/beagleboard/beaglebone-capes/cape-stop.s=
h
diff --git a/recipes-ti/beagleboard/beaglebone-capes/cape.service b/meta-=
ti-bsp/recipes-ti/beagleboard/beaglebone-capes/cape.service
similarity index 100%
rename from recipes-ti/beagleboard/beaglebone-capes/cape.service
rename to meta-ti-bsp/recipes-ti/beagleboard/beaglebone-capes/cape.servic=
e
diff --git a/recipes-ti/beagleboard/beaglebone-capes/cape.sh b/meta-ti-bs=
p/recipes-ti/beagleboard/beaglebone-capes/cape.sh
similarity index 100%
rename from recipes-ti/beagleboard/beaglebone-capes/cape.sh
rename to meta-ti-bsp/recipes-ti/beagleboard/beaglebone-capes/cape.sh
diff --git a/recipes-ti/beagleboard/beaglebone-getting-started.bb b/meta-=
ti-bsp/recipes-ti/beagleboard/beaglebone-getting-started.bb
similarity index 100%
rename from recipes-ti/beagleboard/beaglebone-getting-started.bb
rename to meta-ti-bsp/recipes-ti/beagleboard/beaglebone-getting-started.b=
b
diff --git a/recipes-ti/beagleboard/gadget-init.bb b/meta-ti-bsp/recipes-=
ti/beagleboard/gadget-init.bb
similarity index 100%
rename from recipes-ti/beagleboard/gadget-init.bb
rename to meta-ti-bsp/recipes-ti/beagleboard/gadget-init.bb
diff --git a/recipes-ti/beagleboard/gadget-init/bone-gmass-eject.rules b/=
meta-ti-bsp/recipes-ti/beagleboard/gadget-init/bone-gmass-eject.rules
similarity index 100%
rename from recipes-ti/beagleboard/gadget-init/bone-gmass-eject.rules
rename to meta-ti-bsp/recipes-ti/beagleboard/gadget-init/bone-gmass-eject=
.rules
diff --git a/recipes-ti/beagleboard/gadget-init/g-ether-load.sh b/meta-ti=
-bsp/recipes-ti/beagleboard/gadget-init/g-ether-load.sh
similarity index 100%
rename from recipes-ti/beagleboard/gadget-init/g-ether-load.sh
rename to meta-ti-bsp/recipes-ti/beagleboard/gadget-init/g-ether-load.sh
diff --git a/recipes-ti/beagleboard/gadget-init/g-ether-start-service.sh =
b/meta-ti-bsp/recipes-ti/beagleboard/gadget-init/g-ether-start-service.sh
similarity index 100%
rename from recipes-ti/beagleboard/gadget-init/g-ether-start-service.sh
rename to meta-ti-bsp/recipes-ti/beagleboard/gadget-init/g-ether-start-se=
rvice.sh
diff --git a/recipes-ti/beagleboard/gadget-init/g-storage-reinsert.sh b/m=
eta-ti-bsp/recipes-ti/beagleboard/gadget-init/g-storage-reinsert.sh
similarity index 100%
rename from recipes-ti/beagleboard/gadget-init/g-storage-reinsert.sh
rename to meta-ti-bsp/recipes-ti/beagleboard/gadget-init/g-storage-reinse=
rt.sh
diff --git a/recipes-ti/beagleboard/gadget-init/network-gadget-init.servi=
ce b/meta-ti-bsp/recipes-ti/beagleboard/gadget-init/network-gadget-init.s=
ervice
similarity index 100%
rename from recipes-ti/beagleboard/gadget-init/network-gadget-init.servic=
e
rename to meta-ti-bsp/recipes-ti/beagleboard/gadget-init/network-gadget-i=
nit.service
diff --git a/recipes-ti/beagleboard/gadget-init/storage-gadget-init.servi=
ce b/meta-ti-bsp/recipes-ti/beagleboard/gadget-init/storage-gadget-init.s=
ervice
similarity index 100%
rename from recipes-ti/beagleboard/gadget-init/storage-gadget-init.servic=
e
rename to meta-ti-bsp/recipes-ti/beagleboard/gadget-init/storage-gadget-i=
nit.service
diff --git a/recipes-ti/beagleboard/gadget-init/udhcpd.conf b/meta-ti-bsp=
/recipes-ti/beagleboard/gadget-init/udhcpd.conf
similarity index 100%
rename from recipes-ti/beagleboard/gadget-init/udhcpd.conf
rename to meta-ti-bsp/recipes-ti/beagleboard/gadget-init/udhcpd.conf
diff --git a/recipes-ti/beagleboard/gadget-init/udhcpd.rules b/meta-ti-bs=
p/recipes-ti/beagleboard/gadget-init/udhcpd.rules
similarity index 100%
rename from recipes-ti/beagleboard/gadget-init/udhcpd.rules
rename to meta-ti-bsp/recipes-ti/beagleboard/gadget-init/udhcpd.rules
diff --git a/recipes-ti/beagleboard/gadget-init/udhcpd.service b/meta-ti-=
bsp/recipes-ti/beagleboard/gadget-init/udhcpd.service
similarity index 100%
rename from recipes-ti/beagleboard/gadget-init/udhcpd.service
rename to meta-ti-bsp/recipes-ti/beagleboard/gadget-init/udhcpd.service
diff --git a/recipes-ti/beagleboard/gadget-init/update-image-info-on-mmcb=
lk0p1.sh b/meta-ti-bsp/recipes-ti/beagleboard/gadget-init/update-image-in=
fo-on-mmcblk0p1.sh
similarity index 100%
rename from recipes-ti/beagleboard/gadget-init/update-image-info-on-mmcbl=
k0p1.sh
rename to meta-ti-bsp/recipes-ti/beagleboard/gadget-init/update-image-inf=
o-on-mmcblk0p1.sh
diff --git a/recipes-ti/bios/ti-sysbios.inc b/meta-ti-bsp/recipes-ti/bios=
/ti-sysbios.inc
similarity index 100%
rename from recipes-ti/bios/ti-sysbios.inc
rename to meta-ti-bsp/recipes-ti/bios/ti-sysbios.inc
diff --git a/recipes-ti/bios/ti-sysbios_6.76.03.01.bb b/meta-ti-bsp/recip=
es-ti/bios/ti-sysbios_6.76.03.01.bb
similarity index 100%
rename from recipes-ti/bios/ti-sysbios_6.76.03.01.bb
rename to meta-ti-bsp/recipes-ti/bios/ti-sysbios_6.76.03.01.bb
diff --git a/recipes-ti/codec-engine/ti-codec-engine_3.24.00.08.bb b/meta=
-ti-bsp/recipes-ti/codec-engine/ti-codec-engine_3.24.00.08.bb
similarity index 100%
rename from recipes-ti/codec-engine/ti-codec-engine_3.24.00.08.bb
rename to meta-ti-bsp/recipes-ti/codec-engine/ti-codec-engine_3.24.00.08.=
bb
diff --git a/recipes-ti/ctoolslib/libaet_git.bb b/meta-ti-bsp/recipes-ti/=
ctoolslib/libaet_git.bb
similarity index 100%
rename from recipes-ti/ctoolslib/libaet_git.bb
rename to meta-ti-bsp/recipes-ti/ctoolslib/libaet_git.bb
diff --git a/recipes-ti/devtools/gcc-arm-baremetal_7-2018-q2-update.bb b/=
meta-ti-bsp/recipes-ti/devtools/gcc-arm-baremetal_7-2018-q2-update.bb
similarity index 100%
rename from recipes-ti/devtools/gcc-arm-baremetal_7-2018-q2-update.bb
rename to meta-ti-bsp/recipes-ti/devtools/gcc-arm-baremetal_7-2018-q2-upd=
ate.bb
diff --git a/recipes-ti/devtools/ti-cg-xml_2.61.00.bb b/meta-ti-bsp/recip=
es-ti/devtools/ti-cg-xml_2.61.00.bb
similarity index 100%
rename from recipes-ti/devtools/ti-cg-xml_2.61.00.bb
rename to meta-ti-bsp/recipes-ti/devtools/ti-cg-xml_2.61.00.bb
diff --git a/recipes-ti/devtools/ti-cgt-arm_18.12.5.bb b/meta-ti-bsp/reci=
pes-ti/devtools/ti-cgt-arm_18.12.5.bb
similarity index 100%
rename from recipes-ti/devtools/ti-cgt-arm_18.12.5.bb
rename to meta-ti-bsp/recipes-ti/devtools/ti-cgt-arm_18.12.5.bb
diff --git a/recipes-ti/devtools/ti-cgt-pru_2.3.2.bb b/meta-ti-bsp/recipe=
s-ti/devtools/ti-cgt-pru_2.3.2.bb
similarity index 100%
rename from recipes-ti/devtools/ti-cgt-pru_2.3.2.bb
rename to meta-ti-bsp/recipes-ti/devtools/ti-cgt-pru_2.3.2.bb
diff --git a/recipes-ti/devtools/ti-cgt470.inc b/meta-ti-bsp/recipes-ti/d=
evtools/ti-cgt470.inc
similarity index 100%
rename from recipes-ti/devtools/ti-cgt470.inc
rename to meta-ti-bsp/recipes-ti/devtools/ti-cgt470.inc
diff --git a/recipes-ti/devtools/ti-cgt470_4.6.6.bb b/meta-ti-bsp/recipes=
-ti/devtools/ti-cgt470_4.6.6.bb
similarity index 100%
rename from recipes-ti/devtools/ti-cgt470_4.6.6.bb
rename to meta-ti-bsp/recipes-ti/devtools/ti-cgt470_4.6.6.bb
diff --git a/recipes-ti/devtools/ti-cgt6x-7_7.4.16.bb b/meta-ti-bsp/recip=
es-ti/devtools/ti-cgt6x-7_7.4.16.bb
similarity index 100%
rename from recipes-ti/devtools/ti-cgt6x-7_7.4.16.bb
rename to meta-ti-bsp/recipes-ti/devtools/ti-cgt6x-7_7.4.16.bb
diff --git a/recipes-ti/devtools/ti-cgt6x_8.3.2.bb b/meta-ti-bsp/recipes-=
ti/devtools/ti-cgt6x_8.3.2.bb
similarity index 100%
rename from recipes-ti/devtools/ti-cgt6x_8.3.2.bb
rename to meta-ti-bsp/recipes-ti/devtools/ti-cgt6x_8.3.2.bb
diff --git a/recipes-ti/devtools/ti-cgt7x_1.2.0.bb b/meta-ti-bsp/recipes-=
ti/devtools/ti-cgt7x_1.2.0.bb
similarity index 100%
rename from recipes-ti/devtools/ti-cgt7x_1.2.0.bb
rename to meta-ti-bsp/recipes-ti/devtools/ti-cgt7x_1.2.0.bb
diff --git a/recipes-ti/devtools/ti-xdctools-common.inc b/meta-ti-bsp/rec=
ipes-ti/devtools/ti-xdctools-common.inc
similarity index 100%
rename from recipes-ti/devtools/ti-xdctools-common.inc
rename to meta-ti-bsp/recipes-ti/devtools/ti-xdctools-common.inc
diff --git a/recipes-ti/devtools/ti-xdctools-core.inc b/meta-ti-bsp/recip=
es-ti/devtools/ti-xdctools-core.inc
similarity index 100%
rename from recipes-ti/devtools/ti-xdctools-core.inc
rename to meta-ti-bsp/recipes-ti/devtools/ti-xdctools-core.inc
diff --git a/recipes-ti/devtools/ti-xdctools.inc b/meta-ti-bsp/recipes-ti=
/devtools/ti-xdctools.inc
similarity index 100%
rename from recipes-ti/devtools/ti-xdctools.inc
rename to meta-ti-bsp/recipes-ti/devtools/ti-xdctools.inc
diff --git a/recipes-ti/devtools/ti-xdctools_3.55.02.22.bb b/meta-ti-bsp/=
recipes-ti/devtools/ti-xdctools_3.55.02.22.bb
similarity index 100%
rename from recipes-ti/devtools/ti-xdctools_3.55.02.22.bb
rename to meta-ti-bsp/recipes-ti/devtools/ti-xdctools_3.55.02.22.bb
diff --git a/recipes-ti/dsplib/dsplib-c64xp_git.bb b/meta-ti-bsp/recipes-=
ti/dsplib/dsplib-c64xp_git.bb
similarity index 100%
rename from recipes-ti/dsplib/dsplib-c64xp_git.bb
rename to meta-ti-bsp/recipes-ti/dsplib/dsplib-c64xp_git.bb
diff --git a/recipes-ti/dsplib/dsplib-c66x_git.bb b/meta-ti-bsp/recipes-t=
i/dsplib/dsplib-c66x_git.bb
similarity index 100%
rename from recipes-ti/dsplib/dsplib-c66x_git.bb
rename to meta-ti-bsp/recipes-ti/dsplib/dsplib-c66x_git.bb
diff --git a/recipes-ti/dsplib/dsplib-c674x_git.bb b/meta-ti-bsp/recipes-=
ti/dsplib/dsplib-c674x_git.bb
similarity index 100%
rename from recipes-ti/dsplib/dsplib-c674x_git.bb
rename to meta-ti-bsp/recipes-ti/dsplib/dsplib-c674x_git.bb
diff --git a/recipes-ti/dsplib/dsplib.inc b/meta-ti-bsp/recipes-ti/dsplib=
/dsplib.inc
similarity index 100%
rename from recipes-ti/dsplib/dsplib.inc
rename to meta-ti-bsp/recipes-ti/dsplib/dsplib.inc
diff --git a/recipes-ti/framework-components/ti-framework-components.inc =
b/meta-ti-bsp/recipes-ti/framework-components/ti-framework-components.inc
similarity index 100%
rename from recipes-ti/framework-components/ti-framework-components.inc
rename to meta-ti-bsp/recipes-ti/framework-components/ti-framework-compon=
ents.inc
diff --git a/recipes-ti/framework-components/ti-framework-components_2.26=
.00.01.bb b/meta-ti-bsp/recipes-ti/framework-components/ti-framework-comp=
onents_2.26.00.01.bb
similarity index 100%
rename from recipes-ti/framework-components/ti-framework-components_2.26.=
00.01.bb
rename to meta-ti-bsp/recipes-ti/framework-components/ti-framework-compon=
ents_2.26.00.01.bb
diff --git a/recipes-ti/framework-components/ti-framework-components_3.40=
.02.07.bb b/meta-ti-bsp/recipes-ti/framework-components/ti-framework-comp=
onents_3.40.02.07.bb
similarity index 100%
rename from recipes-ti/framework-components/ti-framework-components_3.40.=
02.07.bb
rename to meta-ti-bsp/recipes-ti/framework-components/ti-framework-compon=
ents_3.40.02.07.bb
diff --git a/recipes-ti/imglib/imglib-c66x.inc b/meta-ti-bsp/recipes-ti/i=
mglib/imglib-c66x.inc
similarity index 100%
rename from recipes-ti/imglib/imglib-c66x.inc
rename to meta-ti-bsp/recipes-ti/imglib/imglib-c66x.inc
diff --git a/recipes-ti/imglib/imglib-c66x_3.1.1.0.bb b/meta-ti-bsp/recip=
es-ti/imglib/imglib-c66x_3.1.1.0.bb
similarity index 100%
rename from recipes-ti/imglib/imglib-c66x_3.1.1.0.bb
rename to meta-ti-bsp/recipes-ti/imglib/imglib-c66x_3.1.1.0.bb
diff --git a/recipes-ti/includes/ti-eula-unpack.inc b/meta-ti-bsp/recipes=
-ti/includes/ti-eula-unpack.inc
similarity index 100%
rename from recipes-ti/includes/ti-eula-unpack.inc
rename to meta-ti-bsp/recipes-ti/includes/ti-eula-unpack.inc
diff --git a/recipes-ti/includes/ti-paths.inc b/meta-ti-bsp/recipes-ti/in=
cludes/ti-paths.inc
similarity index 100%
rename from recipes-ti/includes/ti-paths.inc
rename to meta-ti-bsp/recipes-ti/includes/ti-paths.inc
diff --git a/recipes-ti/includes/ti-staging.inc b/meta-ti-bsp/recipes-ti/=
includes/ti-staging.inc
similarity index 100%
rename from recipes-ti/includes/ti-staging.inc
rename to meta-ti-bsp/recipes-ti/includes/ti-staging.inc
diff --git a/recipes-ti/includes/ti-unpack.inc b/meta-ti-bsp/recipes-ti/i=
ncludes/ti-unpack.inc
similarity index 100%
rename from recipes-ti/includes/ti-unpack.inc
rename to meta-ti-bsp/recipes-ti/includes/ti-unpack.inc
diff --git a/recipes-ti/ipc/ti-ipc-common.inc b/meta-ti-bsp/recipes-ti/ip=
c/ti-ipc-common.inc
similarity index 100%
rename from recipes-ti/ipc/ti-ipc-common.inc
rename to meta-ti-bsp/recipes-ti/ipc/ti-ipc-common.inc
diff --git a/recipes-ti/ipc/ti-ipc-examples-linux/0001-examples-ClusterMg=
r-sys_errlist-has-been-deprecated-.patch b/meta-ti-bsp/recipes-ti/ipc/ti-=
ipc-examples-linux/0001-examples-ClusterMgr-sys_errlist-has-been-deprecat=
ed-.patch
similarity index 100%
rename from recipes-ti/ipc/ti-ipc-examples-linux/0001-examples-ClusterMgr=
-sys_errlist-has-been-deprecated-.patch
rename to meta-ti-bsp/recipes-ti/ipc/ti-ipc-examples-linux/0001-examples-=
ClusterMgr-sys_errlist-has-been-deprecated-.patch
diff --git a/recipes-ti/ipc/ti-ipc-examples-linux_git.bb b/meta-ti-bsp/re=
cipes-ti/ipc/ti-ipc-examples-linux_git.bb
similarity index 100%
rename from recipes-ti/ipc/ti-ipc-examples-linux_git.bb
rename to meta-ti-bsp/recipes-ti/ipc/ti-ipc-examples-linux_git.bb
diff --git a/recipes-ti/ipc/ti-ipc-examples.inc b/meta-ti-bsp/recipes-ti/=
ipc/ti-ipc-examples.inc
similarity index 100%
rename from recipes-ti/ipc/ti-ipc-examples.inc
rename to meta-ti-bsp/recipes-ti/ipc/ti-ipc-examples.inc
diff --git a/recipes-ti/ipc/ti-ipc-examples_git.bb b/meta-ti-bsp/recipes-=
ti/ipc/ti-ipc-examples_git.bb
similarity index 100%
rename from recipes-ti/ipc/ti-ipc-examples_git.bb
rename to meta-ti-bsp/recipes-ti/ipc/ti-ipc-examples_git.bb
diff --git a/recipes-ti/ipc/ti-ipc-rtos.inc b/meta-ti-bsp/recipes-ti/ipc/=
ti-ipc-rtos.inc
similarity index 100%
rename from recipes-ti/ipc/ti-ipc-rtos.inc
rename to meta-ti-bsp/recipes-ti/ipc/ti-ipc-rtos.inc
diff --git a/recipes-ti/ipc/ti-ipc-rtos_git.bb b/meta-ti-bsp/recipes-ti/i=
pc/ti-ipc-rtos_git.bb
similarity index 100%
rename from recipes-ti/ipc/ti-ipc-rtos_git.bb
rename to meta-ti-bsp/recipes-ti/ipc/ti-ipc-rtos_git.bb
diff --git a/recipes-ti/ipc/ti-ipc.inc b/meta-ti-bsp/recipes-ti/ipc/ti-ip=
c.inc
similarity index 100%
rename from recipes-ti/ipc/ti-ipc.inc
rename to meta-ti-bsp/recipes-ti/ipc/ti-ipc.inc
diff --git a/recipes-ti/ipc/ti-ipc/0001-Add-kernel-build-dir.patch b/meta=
-ti-bsp/recipes-ti/ipc/ti-ipc/0001-Add-kernel-build-dir.patch
similarity index 100%
rename from recipes-ti/ipc/ti-ipc/0001-Add-kernel-build-dir.patch
rename to meta-ti-bsp/recipes-ti/ipc/ti-ipc/0001-Add-kernel-build-dir.pat=
ch
diff --git a/recipes-ti/ipc/ti-ipc/omap_remoteproc.conf b/meta-ti-bsp/rec=
ipes-ti/ipc/ti-ipc/omap_remoteproc.conf
similarity index 100%
rename from recipes-ti/ipc/ti-ipc/omap_remoteproc.conf
rename to meta-ti-bsp/recipes-ti/ipc/ti-ipc/omap_remoteproc.conf
diff --git a/recipes-ti/ipc/ti-ipc/tiipclad-daemon.service b/meta-ti-bsp/=
recipes-ti/ipc/ti-ipc/tiipclad-daemon.service
similarity index 100%
rename from recipes-ti/ipc/ti-ipc/tiipclad-daemon.service
rename to meta-ti-bsp/recipes-ti/ipc/ti-ipc/tiipclad-daemon.service
diff --git a/recipes-ti/ipc/ti-ipc/tiipclad-daemon.sh b/meta-ti-bsp/recip=
es-ti/ipc/ti-ipc/tiipclad-daemon.sh
similarity index 100%
rename from recipes-ti/ipc/ti-ipc/tiipclad-daemon.sh
rename to meta-ti-bsp/recipes-ti/ipc/ti-ipc/tiipclad-daemon.sh
diff --git a/recipes-ti/ipc/ti-ipc_git.bb b/meta-ti-bsp/recipes-ti/ipc/ti=
-ipc_git.bb
similarity index 100%
rename from recipes-ti/ipc/ti-ipc_git.bb
rename to meta-ti-bsp/recipes-ti/ipc/ti-ipc_git.bb
diff --git a/recipes-ti/ipc/ti-rpmsg-char-examples/0001-examples-Remove-u=
se-of-includedir-and-libdir.patch b/meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-c=
har-examples/0001-examples-Remove-use-of-includedir-and-libdir.patch
similarity index 100%
rename from recipes-ti/ipc/ti-rpmsg-char-examples/0001-examples-Remove-us=
e-of-includedir-and-libdir.patch
rename to meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char-examples/0001-examples=
-Remove-use-of-includedir-and-libdir.patch
diff --git a/recipes-ti/ipc/ti-rpmsg-char-examples_git.bb b/meta-ti-bsp/r=
ecipes-ti/ipc/ti-rpmsg-char-examples_git.bb
similarity index 100%
rename from recipes-ti/ipc/ti-rpmsg-char-examples_git.bb
rename to meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char-examples_git.bb
diff --git a/recipes-ti/ipc/ti-rpmsg-char.inc b/meta-ti-bsp/recipes-ti/ip=
c/ti-rpmsg-char.inc
similarity index 100%
rename from recipes-ti/ipc/ti-rpmsg-char.inc
rename to meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc
diff --git a/recipes-ti/ipc/ti-rpmsg-char_git.bb b/meta-ti-bsp/recipes-ti=
/ipc/ti-rpmsg-char_git.bb
similarity index 100%
rename from recipes-ti/ipc/ti-rpmsg-char_git.bb
rename to meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char_git.bb
diff --git a/recipes-ti/mathlib/mathlib-c66x_git.bb b/meta-ti-bsp/recipes=
-ti/mathlib/mathlib-c66x_git.bb
similarity index 100%
rename from recipes-ti/mathlib/mathlib-c66x_git.bb
rename to meta-ti-bsp/recipes-ti/mathlib/mathlib-c66x_git.bb
diff --git a/recipes-ti/mathlib/mathlib-c674x_git.bb b/meta-ti-bsp/recipe=
s-ti/mathlib/mathlib-c674x_git.bb
similarity index 100%
rename from recipes-ti/mathlib/mathlib-c674x_git.bb
rename to meta-ti-bsp/recipes-ti/mathlib/mathlib-c674x_git.bb
diff --git a/recipes-ti/mathlib/mathlib.inc b/meta-ti-bsp/recipes-ti/math=
lib/mathlib.inc
similarity index 100%
rename from recipes-ti/mathlib/mathlib.inc
rename to meta-ti-bsp/recipes-ti/mathlib/mathlib.inc
diff --git a/recipes-ti/openmp-rtos/openmp-rtos_git.bb b/meta-ti-bsp/reci=
pes-ti/openmp-rtos/openmp-rtos_git.bb
similarity index 100%
rename from recipes-ti/openmp-rtos/openmp-rtos_git.bb
rename to meta-ti-bsp/recipes-ti/openmp-rtos/openmp-rtos_git.bb
diff --git a/recipes-ti/osal/ti-osal.inc b/meta-ti-bsp/recipes-ti/osal/ti=
-osal.inc
similarity index 100%
rename from recipes-ti/osal/ti-osal.inc
rename to meta-ti-bsp/recipes-ti/osal/ti-osal.inc
diff --git a/recipes-ti/osal/ti-osal_1.24.00.09.bb b/meta-ti-bsp/recipes-=
ti/osal/ti-osal_1.24.00.09.bb
similarity index 100%
rename from recipes-ti/osal/ti-osal_1.24.00.09.bb
rename to meta-ti-bsp/recipes-ti/osal/ti-osal_1.24.00.09.bb
diff --git a/recipes-ti/swtools/swtools_git.bb b/meta-ti-bsp/recipes-ti/s=
wtools/swtools_git.bb
similarity index 100%
rename from recipes-ti/swtools/swtools_git.bb
rename to meta-ti-bsp/recipes-ti/swtools/swtools_git.bb
diff --git a/recipes-ti/ti-rtos-bin/files/empty b/meta-ti-bsp/recipes-ti/=
ti-rtos-bin/files/empty
similarity index 100%
rename from recipes-ti/ti-rtos-bin/files/empty
rename to meta-ti-bsp/recipes-ti/ti-rtos-bin/files/empty
diff --git a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/meta-ti-bsp/rec=
ipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
similarity index 100%
rename from recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
rename to meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
diff --git a/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb b/meta-ti-bsp/rec=
ipes-ti/ti-rtos-bin/ti-rtos-metadata.bb
similarity index 100%
rename from recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb
rename to meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb
diff --git a/recipes-ti/uio-test-pruss/uio-test-pruss_git.bb b/meta-ti-bs=
p/recipes-ti/uio-test-pruss/uio-test-pruss_git.bb
similarity index 100%
rename from recipes-ti/uio-test-pruss/uio-test-pruss_git.bb
rename to meta-ti-bsp/recipes-ti/uio-test-pruss/uio-test-pruss_git.bb
diff --git a/recipes-ti/vlib/vlib-c66x.inc b/meta-ti-bsp/recipes-ti/vlib/=
vlib-c66x.inc
similarity index 100%
rename from recipes-ti/vlib/vlib-c66x.inc
rename to meta-ti-bsp/recipes-ti/vlib/vlib-c66x.inc
diff --git a/recipes-ti/vlib/vlib-c66x_3.2.1.0.bb b/meta-ti-bsp/recipes-t=
i/vlib/vlib-c66x_3.2.1.0.bb
similarity index 100%
rename from recipes-ti/vlib/vlib-c66x_3.2.1.0.bb
rename to meta-ti-bsp/recipes-ti/vlib/vlib-c66x_3.2.1.0.bb
diff --git a/recipes-ti/xdais/ti-xdais.inc b/meta-ti-bsp/recipes-ti/xdais=
/ti-xdais.inc
similarity index 100%
rename from recipes-ti/xdais/ti-xdais.inc
rename to meta-ti-bsp/recipes-ti/xdais/ti-xdais.inc
diff --git a/recipes-ti/xdais/ti-xdais_6.26.01.03.bb b/meta-ti-bsp/recipe=
s-ti/xdais/ti-xdais_6.26.01.03.bb
similarity index 100%
rename from recipes-ti/xdais/ti-xdais_6.26.01.03.bb
rename to meta-ti-bsp/recipes-ti/xdais/ti-xdais_6.26.01.03.bb
diff --git a/recipes-ti/xdais/ti-xdais_7.24.00.04.bb b/meta-ti-bsp/recipe=
s-ti/xdais/ti-xdais_7.24.00.04.bb
similarity index 100%
rename from recipes-ti/xdais/ti-xdais_7.24.00.04.bb
rename to meta-ti-bsp/recipes-ti/xdais/ti-xdais_7.24.00.04.bb
diff --git a/wic/sdimage-2part-efi.wks b/meta-ti-bsp/wic/sdimage-2part-ef=
i.wks
similarity index 100%
rename from wic/sdimage-2part-efi.wks
rename to meta-ti-bsp/wic/sdimage-2part-efi.wks
diff --git a/wic/sdimage-2part.wks b/meta-ti-bsp/wic/sdimage-2part.wks
similarity index 100%
rename from wic/sdimage-2part.wks
rename to meta-ti-bsp/wic/sdimage-2part.wks
--=20
2.25.1

