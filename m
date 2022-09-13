Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40758C6FD38
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 03:56:06 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web09.872.1663041344406898523
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 12 Sep 2022 20:55:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9C11A40D68
	for <meta-ti@lists.yoctoproject.org>; Tue, 13 Sep 2022 03:55:43 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XTXzQ5L9R9uQ for <meta-ti@lists.yoctoproject.org>;
	Tue, 13 Sep 2022 03:55:43 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-80-88.washdc.fios.verizon.net
 [100.15.80.88])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 8042140D4E
	for <meta-ti@lists.yoctoproject.org>; Tue, 13 Sep 2022 03:55:43 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id C95F41666A7
	for <meta-ti@lists.yoctoproject.org>; Mon, 12 Sep 2022 23:55:39 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master/kirkstone][PATCH 00/65] Latest 2022.09 sync-up with Dunfell
 #1
Date: Tue, 13 Sep 2022 03:54:36 +0000
Message-Id: <20220913035541.2364351-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 13 Sep 2022 03:56:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15024

From: Denys Dmytriyenko <denys@konsulko.com>

Sync up with latest Dunfell changes.
This is still incomplete - there's a second part coming, but needs more w=
ork.

Andrew Davis (10):
  conf: machine: am64xx: Add missing dtbo
  trusted-firmware-a: Update to latest upstream master
  optee: Upgrade to upstream 3.17.0
  optee-os: Use software RNG on AM62x and J721s2
  linux-ti-staging: Unblock SA2UL for AM64x and J7200 HS devices
  conf: machine: Make multi-certificate image the default
  u-boot-ti: Do not prepend output files with DEPLOYDIR
  optee-os: Allow build to continue without TI_SECURE_DEV_PKG set
  trusted-firmware-a: Allow build to continue without TI_SECURE_DEV_PKG
    set
  prueth-fw: Deploy for AM64xx based on SoC not EVM

Aparna M (1):
  ti-tros-firmware: Add DM firmware binary to deploy directory for
    am62xx-evm

Bryan Brattlof (2):
  k3conf: update SRCREV to add J721S2 support
  k3conf: update SRCREV to add j721S2 fixes

Darren Etheridge (1):
  ti-graphics: update for 4K/64K page size GPU drivers

Denys Dmytriyenko (2):
  cnm-wave-fw: mark also compatible with j721s2 HS
  j721e-hs-evm-k3r5: do not create generic sysfw.itb symlink

Drew Fustini (3):
  conf: dra7xx-evm: avoid missing dtb files for linux-ti-mainline
  conf: am57xx-evm: avoid missing dtb files for linux-ti-mainline
  conf: am43: avoid missing dtb files for linux-ti-mainline

Jayesh Choudhary (3):
  conf: machine: Add j721s2 hs platform
  ti-rtos-firmware: Add j721s2 hs support
  j721s2-hs: changes to support new hs platform

Jonathan Humphreys (1):
  j7200-hs-evm-k3r5: Move J7200 HS evm support to PG2.0

LCPD Automation Script (4):
  u-boot-ti-staging: CI/CD Auto-Merger: cicd.2022.06.28.12:11:17
  linux-ti-staging-rt: CI/CD Auto-Merger: cicd.2022.06.28.12:11:17
  linux-ti-staging: CI/CD Auto-Merger: cicd.2022.06.28.12:11:17
  u-boot-ti-staging: CI/CD Auto-Merger: cicd.2022.07.30.15:19:12

Manorit Chawdhry (1):
  conf: machine: wic: Fix HS image boot partition

Praneeth Bajjuri (1):
  conf: machine: am62xx: add new dtb for low-power

Ryan Eatmon (36):
  conf: machine: am62xx Fix overlay extension
  u-boot-ti-staging: Bump to 08.03.00.004 release
  linux-ti-staging: Bump to 08.03.00.004 release
  linux-ti-staging-rt: Bump to 08.03.00.004 release
  ti-linux-fw: Bump to 08.03.00.004 release
  u-boot-ti-staging: Bump to 08.03.00.005 release
  linux-ti-staging: Bump to 08.03.00.005 release
  linux-ti-staging-rt: Bump to 08.03.00.005 release
  ti-linux-fw: Bump to 08.03.00.005 release
  u-boot: Bump to verison that supports j721s2-hs-evm
  u-boot-ti-staging: Bump to 08.04.00.001 release
  linux-ti-staging: Bump to 08.04.00.001 release
  linux-ti-staging-rt: Bump to 08.04.00.001 release
  ti-linux-fw: Bump to 08.04.00.001 release
  u-boot-ti-staging: Bump to 08.04.00.002 release
  linux-ti-staging: Bump to 08.04.00.002 release
  linux-ti-staging-rt: Bump to 08.04.00.002 release
  ti-linux-fw: Bump to 08.04.00.002 release
  conf: machine: wic: Fix j721s2-hs-evm image boot partition
  u-boot-ti-staging: Bump to 08.04.00.003 release
  linux-ti-staging: Bump to 08.04.00.003 release
  linux-ti-staging-rt: Bump to 08.04.00.003 release
  conf: machine: j721s2: add new dtb for GESI
  u-boot-ti-staging: Bump to 08.04.00.004 release
  linux-ti-staging: Bump to 08.04.00.004 release
  linux-ti-staging-rt: Bump to 08.04.00.004 release
  ti-img-encode-decode: Lock test app to j7-evm
  kernel u-boot: Fix formulation of LOCALVERSION
  u-boot-ti-staging: Bump to 08.04.00.005 release
  linux-ti-staging: Bump to 08.04.00.005 release
  linux-ti-staging-rt: Bump to 08.04.00.005 release
  cadence-mhdp-fw: Lock firmware to j721e
  ti-linux-fw: Create K3_IMAGE_GEN_BRANCH variable
  linux-ti-staging: Bump to 08.04.01.001 release
  linux-ti-staging-rt: Bump to 08.04.01.001 release
  ti-linux-fw: Bump to 08.04.01.001 release

 meta-ti-bsp/conf/machine/am57xx-evm.conf      |  6 +-
 meta-ti-bsp/conf/machine/am62xx-evm.conf      |  4 +-
 meta-ti-bsp/conf/machine/am64xx-hs-evm.conf   |  3 +-
 meta-ti-bsp/conf/machine/am65xx-hs-evm.conf   |  3 +-
 meta-ti-bsp/conf/machine/dra7xx-evm.conf      |  2 +-
 meta-ti-bsp/conf/machine/include/am62xx.inc   |  5 +-
 meta-ti-bsp/conf/machine/include/am64xx.inc   |  6 +-
 meta-ti-bsp/conf/machine/include/am65xx.inc   |  5 +-
 meta-ti-bsp/conf/machine/include/k3.inc       |  6 +-
 meta-ti-bsp/conf/machine/include/ti43x.inc    |  6 +-
 meta-ti-bsp/conf/machine/j7200-evm.conf       |  3 -
 .../conf/machine/j7200-hs-evm-k3r5.conf       |  2 +-
 meta-ti-bsp/conf/machine/j7200-hs-evm.conf    |  3 +-
 meta-ti-bsp/conf/machine/j721e-evm.conf       |  3 +
 .../conf/machine/j721e-hs-evm-k3r5.conf       |  1 +
 meta-ti-bsp/conf/machine/j721e-hs-evm.conf    |  4 +-
 meta-ti-bsp/conf/machine/j721s2-evm.conf      |  4 +-
 .../conf/machine/j721s2-hs-evm-k3r5.conf      | 13 +++++
 .../{j7200-hs-evm.conf =3D> j721s2-hs-evm.conf} | 11 ++--
 .../cadence-mhdp-fw/cadence-mhdp-fw_git.bb    |  2 +-
 .../cnm-wave-fw/cnm-wave-fw_git.bb            |  4 +-
 .../ti-img-rogue-driver_1.15.6133109.bb       |  6 +-
 .../prueth-fw/prueth-fw-am65x-sr2_git.bb      |  2 +-
 .../viddec-test-app_1.0.0.bb                  |  2 +-
 .../videnc-test-app_1.0.0.bb                  |  2 +-
 .../recipes-bsp/ti-linux-fw/ti-linux-fw.inc   |  8 ++-
 .../recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb    | 18 ++++++
 .../trusted-firmware-a_%.bbappend             | 44 +++++++-------
 .../u-boot/u-boot-ti-staging_2021.01.bb       |  4 +-
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc  | 44 ++++++++------
 .../recipes-devtools/k3conf/k3conf_git.bb     |  2 +-
 .../ti-img-rogue-umlibs_1.15.6133109.bb       |  6 +-
 .../recipes-kernel/linux/kernel-rdepends.inc  |  6 +-
 .../linux/linux-ti-staging-rt_5.10.bb         |  4 +-
 .../linux/linux-ti-staging_5.10.bb            | 10 +---
 .../recipes-kernel/linux/setup-defconfig.inc  |  2 +-
 .../optee/optee-client_%.bbappend             |  2 +
 .../optee/optee-examples_%.bbappend           |  2 +
 .../optee/optee-os-tadevkit_%.bbappend        |  2 +
 .../optee/optee-os_%.bbappend                 | 19 +++++-
 .../optee/optee-test_%.bbappend               |  3 +
 .../ti-rtos-bin/ti-rtos-firmware.bb           | 58 +++++++++++++++++++
 42 files changed, 226 insertions(+), 116 deletions(-)
 create mode 100644 meta-ti-bsp/conf/machine/j721s2-hs-evm-k3r5.conf
 copy meta-ti-bsp/conf/machine/{j7200-hs-evm.conf =3D> j721s2-hs-evm.conf=
} (63%)
 create mode 100644 meta-ti-bsp/recipes-security/optee/optee-client_%.bba=
ppend
 create mode 100644 meta-ti-bsp/recipes-security/optee/optee-examples_%.b=
bappend
 create mode 100644 meta-ti-bsp/recipes-security/optee/optee-os-tadevkit_=
%.bbappend
 create mode 100644 meta-ti-bsp/recipes-security/optee/optee-test_%.bbapp=
end

--=20
2.25.1


