Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D98FC6371A
	for <webhook@archiver.kernel.org>; Fri,  4 Nov 2022 21:41:08 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.208.1667598058462036823
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 04 Nov 2022 14:40:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id A955940D7F
	for <meta-ti@lists.yoctoproject.org>; Fri,  4 Nov 2022 21:40:57 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BekYNs-iF0zF for <meta-ti@lists.yoctoproject.org>;
	Fri,  4 Nov 2022 21:40:57 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 88A4A40D7A
	for <meta-ti@lists.yoctoproject.org>; Fri,  4 Nov 2022 21:40:57 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id E2667162035
	for <meta-ti@lists.yoctoproject.org>; Fri,  4 Nov 2022 17:40:51 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master/kirkstone][PATCH 00/47] 2022.10 sync up with Dunfell
Date: Fri,  4 Nov 2022 21:40:08 +0000
Message-Id: <20221104214055.1221197-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 04 Nov 2022 21:41:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15228

From: Denys Dmytriyenko <denys@konsulko.com>

Latest (as of end of October 2022) sync up of Dunfell changes to Kirkston=
e/master

Notable changes:

* TI-SCI cleanup
* HS unification
* New J7 platforms
* General fixes and component updates

Anand Gadiyar (1):
  machine: add am62xx-lp-evm configuration

Andrew Davis (21):
  machine: k3r5: Make combined R5 boot the default
  ti-sci-fw: Use new SOC_TYPE and SYSFW_DIR to simplify recipe
  ti-sci-fw: Deploy all SYSFW firmware types
  ti-sci-fw: Use SYSFW_TIBOOT3 to point to the SYSFW image
  ti-sci-fw: Make combined R5 boot the default
  ti-sci-fw: Only install and deploy combined boot symlink when set
  conf: machine: Move K3 TI_SECURE_DEV_PKG definition to common include
  ti-sci-fw: Only deploy the raw SYSFW images for one machine target
  conf: machine: am64xx-hs-evm: Add extra machine to build GP SYSFW
  conf: machine: k3: Add fitImage to the default kernel image types
  ti-sci-fw: Add am65xx-evm-k3r5-sr2 to combined R5 boot list
  recipies-ti: Add TI K3 Security Development Package
  ti-sci-fw: Use ti-k3-secdev if TI_SECURE_DEV_PKG_K3 is not defined
  u-boot-ti-staging: Update to the latest ti-u-boot-2021.01
  conf: machine: am64xx-evm: Make HS-SE the default
  conf: machine: am64xx-evm: Update default HS names
  optee-os: Upgrade to upstream 3.18.0
  optee-os: Lower log level for AM62x
  conf: machine: am64xx-evm: Switch to SR2.0 HS-FS build by default
  conf: machine: am64xx: Move multi-config targets into base SoC include
  trusted-firmware-a: Update to latest upstream master

Denys Dmytriyenko (8):
  k3: also inherit kernel-fitimage class for FIT image generation
  linux-ti-mainline: unbreak devtool
  ti-img-rogue-driver: drop local patch as upstream is now fixed
  ti-linux-fw: update to the latest
  u-boot-ti-staging: update to the latest
  linux-ti-staging: update to the latest
  ti-k3-secdev: include ti-paths.inc
  ti-sci-fw: use getVar() to check if TI_SECURE_DEV_PKG_K3 is defined

Jayesh Choudhary (4):
  optee-os: Update SRCREV for OP-TEE TRNG in J784S4
  conf: machine: j784s4: Add OP-TEE flavour
  conf: machine: j721s2: Add OP-TEE flavour
  optee-os: Enable TRNG driver as OP-TEE support is added

Manorit Chawdhry (3):
  ti-rtos-firmware: j721e-hs-evm: add secure firmware images
  ti-rtos-firmware: j7200-hs-evm: add secure firmware images
  ti-rtos-firmware: j721s2-hs-evm: add secure firmware images

Praneeth Bajjuri (2):
  trusted-firmware-a: upgrade to v2.7
  ipc: ti-rpmsg-char: Update library to 0.5.1

Rahul T R (1):
  cadence-mhdp-fw: Add dependency for j721s2

Randolph Sapp (2):
  ti-sci-fw: Use d.getVar() in DEPENDS expression
  ti-img-rogue-*: Bump the graphics recipes

Ryan Eatmon (5):
  all: Stop using git://git.ti.com
  ti-img-rogue-driver: Fix git SRC_URI
  machine: Add j784s4-evm configuration.
  j721s2 and j784s4: Correct serial console device
  cnm-wave-fw: update firmware name to wave521c_k3_codec_fw.bin

 .../conf/machine/am62xx-lp-evm-k3r5.conf      |  11 +
 meta-ti-bsp/conf/machine/am62xx-lp-evm.conf   |  16 ++
 .../conf/machine/am64xx-evm-k3r5-gp.conf      |  20 ++
 .../machine/am64xx-evm-k3r5-sr2-hs-fs.conf    |  14 ++
 .../machine/am64xx-evm-k3r5-sr2-hs-se.conf    |  20 ++
 meta-ti-bsp/conf/machine/am64xx-evm-k3r5.conf |  11 -
 .../conf/machine/am64xx-hs-evm-k3r5.conf      |  14 --
 meta-ti-bsp/conf/machine/am64xx-hs-evm.conf   |  21 --
 meta-ti-bsp/conf/machine/am65xx-evm-k3r5.conf |   6 +
 .../conf/machine/am65xx-hs-evm-k3r5.conf      |   8 +-
 meta-ti-bsp/conf/machine/am65xx-hs-evm.conf   |   2 -
 meta-ti-bsp/conf/machine/include/am64xx.inc   |  18 +-
 meta-ti-bsp/conf/machine/include/k3.inc       |   5 +-
 meta-ti-bsp/conf/machine/include/k3r5.inc     |   8 +-
 .../conf/machine/j7200-hs-evm-k3r5.conf       |   2 -
 meta-ti-bsp/conf/machine/j7200-hs-evm.conf    |   2 -
 meta-ti-bsp/conf/machine/j721e-evm-k3r5.conf  |   6 +
 .../conf/machine/j721e-hs-evm-k3r5.conf       |   8 +-
 meta-ti-bsp/conf/machine/j721e-hs-evm.conf    |   3 +-
 meta-ti-bsp/conf/machine/j721s2-evm.conf      |   3 +-
 .../conf/machine/j721s2-hs-evm-k3r5.conf      |   2 -
 meta-ti-bsp/conf/machine/j721s2-hs-evm.conf   |   2 -
 meta-ti-bsp/conf/machine/j784s4-evm-k3r5.conf |  11 +
 meta-ti-bsp/conf/machine/j784s4-evm.conf      |  25 ++
 meta-ti-bsp/conf/multiconfig/k3r5-gp.conf     |   3 +
 .../conf/multiconfig/k3r5-sr2-hs-fs.conf      |   3 +
 .../conf/multiconfig/k3r5-sr2-hs-se.conf      |   3 +
 .../cadence-mhdp-fw/cadence-mhdp-fw_git.bb    |   2 +-
 .../cm3-pm-firmware/amx3-cm3_git.bb           |   2 +-
 meta-ti-bsp/recipes-bsp/cmem/cmem.inc         |   2 +-
 .../cnm-wave-fw/cnm-wave-fw_git.bb            |   5 +-
 .../cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb        |   4 +-
 .../ti-gc320-driver_5.0.11.p7.bb              |   2 +-
 ...nit.c-cast-boolean-value-to-IMG_BOOL.patch |  34 ---
 .../ti-img-rogue-driver_1.15.6133109.bb       |  13 +-
 .../ti-sgx-ddk-km_1.17.4948957.bb             |   2 +-
 .../viddec-test-app_1.0.0.bb                  |   2 +-
 .../videnc-test-app_1.0.0.bb                  |   2 +-
 .../recipes-bsp/ti-linux-fw/ti-linux-fw.inc   |   8 +-
 .../recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb    | 220 +++++------------
 .../tifs-lpm-stub/tifs-lpm-stub_git.bb        |   2 +-
 .../trusted-firmware-a_%.bbappend             |   6 +-
 .../u-boot/u-boot-ti-staging_2021.01.bb       |   4 +-
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc  |  55 +----
 .../uio-module-drv/uio-module-drv.inc         |   4 +-
 .../recipes-bsp/vpe-tests/vpe-tests_git.bb    |   2 +-
 .../recipes-devtools/k3conf/k3conf_git.bb     |   2 +-
 .../libgal/ti-gc320-libs_5.0.11.p7.bb         |   2 +-
 .../ti-img-rogue-umlibs_1.15.6133109.bb       |   7 +-
 .../recipes-kernel/linux/kernel-rdepends.inc  |   6 +-
 .../linux/linux-ti-mainline_git.bb            |   8 +-
 .../linux/linux-ti-staging-rt_5.10.bb         |   4 +-
 .../linux/linux-ti-staging_5.10.bb            |   8 +-
 .../optee/optee-os_%.bbappend                 |  11 +-
 meta-ti-bsp/recipes-ti/ipc/ti-ipc.inc         |   4 +-
 meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc  |  10 +-
 .../ti-rtos-bin/ti-rtos-firmware.bb           | 232 +++++++++++++++++-
 .../ti-rtos-bin/ti-rtos-metadata.bb           |   4 +-
 meta-ti-extras/recipes-bsp/bt-fw/bt-fw_git.bb |   2 +-
 .../recipes-bsp/dspdce-fw/dspdce-fw_git.bb    |   2 +-
 meta-ti-extras/recipes-bsp/dsptop/dsptop.inc  |   2 +-
 .../recipes-bsp/ipumm-fw/ipumm-fw_git.bb      |   2 +-
 .../wl18xx-fw/wl18xx-fw_8.9.0.0.86.bb         |   2 +-
 .../recipes-connectivity/uim/uim-sysfs_8.5.bb |   2 +-
 .../wl18xx-calibrator_8.7.3.bb                |   4 +-
 .../wl18xx-target-scripts_8.7.3.bb            |   2 +-
 .../wlconf/wlconf_8.7.3.bb                    |   2 +-
 .../recipes-devtools/gdbc6x/gdbc6x.inc        |   2 +-
 .../recipes-ti/ctoolslib/libaet_git.bb        |   2 +-
 meta-ti-extras/recipes-ti/dsplib/dsplib.inc   |   4 +-
 .../recipes-ti/includes/ti-paths.inc          |   2 +
 meta-ti-extras/recipes-ti/ipc/ti-ipc-rtos.inc |   8 +-
 meta-ti-extras/recipes-ti/mathlib/mathlib.inc |   4 +-
 .../recipes-ti/openmp-rtos/openmp-rtos_git.bb |   6 +-
 .../recipes-ti/secdev/ti-k3-secdev_git.bb     |  38 +++
 .../recipes-ti/swtools/swtools_git.bb         |   4 +-
 .../uio-test-pruss/uio-test-pruss_git.bb      |   4 +-
 77 files changed, 612 insertions(+), 398 deletions(-)
 create mode 100644 meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf
 create mode 100644 meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
 create mode 100644 meta-ti-bsp/conf/machine/am64xx-evm-k3r5-gp.conf
 create mode 100644 meta-ti-bsp/conf/machine/am64xx-evm-k3r5-sr2-hs-fs.co=
nf
 create mode 100644 meta-ti-bsp/conf/machine/am64xx-evm-k3r5-sr2-hs-se.co=
nf
 delete mode 100644 meta-ti-bsp/conf/machine/am64xx-evm-k3r5.conf
 delete mode 100644 meta-ti-bsp/conf/machine/am64xx-hs-evm-k3r5.conf
 delete mode 100644 meta-ti-bsp/conf/machine/am64xx-hs-evm.conf
 create mode 100644 meta-ti-bsp/conf/machine/j784s4-evm-k3r5.conf
 create mode 100644 meta-ti-bsp/conf/machine/j784s4-evm.conf
 create mode 100644 meta-ti-bsp/conf/multiconfig/k3r5-gp.conf
 create mode 100644 meta-ti-bsp/conf/multiconfig/k3r5-sr2-hs-fs.conf
 create mode 100644 meta-ti-bsp/conf/multiconfig/k3r5-sr2-hs-se.conf
 delete mode 100644 meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-=
driver/0001-rgxinit.c-cast-boolean-value-to-IMG_BOOL.patch
 create mode 100644 meta-ti-extras/recipes-ti/secdev/ti-k3-secdev_git.bb

--=20
2.25.1


