Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.3342.1637378773188973374
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 19 Nov 2021 19:26:13 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 1E7DC40C61
	for <meta-ti@lists.yoctoproject.org>; Sat, 20 Nov 2021 03:26:12 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jRlE25NEsJl0 for <meta-ti@lists.yoctoproject.org>;
	Sat, 20 Nov 2021 03:26:12 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E978C40BEA
	for <meta-ti@lists.yoctoproject.org>; Sat, 20 Nov 2021 03:26:11 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 9F6F41746D2
	for <meta-ti@lists.yoctoproject.org>; Fri, 19 Nov 2021 22:26:11 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master][PATCH v2 00/26] Sync up with Dunfell #2
Date: Fri, 19 Nov 2021 22:25:45 -0500
Message-Id: <1637378771-24987-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4

From: Denys Dmytriyenko <denys@konsulko.com>

Keep master up to date with latest changes in Dunfell, adjust to the new
override syntax.

Amjad Ouled-Ameur (1):
  recipes-bsp: u-boot-ti-mainline: Update to v2021.10 release

Denys Dmytriyenko (1):
  recipes: update github SRC_URIs

Praneeth Bajjuri (1):
  vxd-dec-fw: Add the recipe for vxd-dec-fw

Ryan Eatmon (3):
  u-boot-ti-staging: Bump u-boot version for 08.01.00.005
  linux-ti-staging: Bump linux version for 08.01.00.005
  linux-ti-staging-rt: Bump linux rt version for 08.01.00.005

Yogesh Siraswar (20):
  u-boot-ti-staging: Bump u-boot version for 08.01.00.002
  ti-linux-fw: Bump ti linux firmware for 08.01.00.002
  linux-ti-staging: Bump linux version for 08.01.00.002
  linux-ti-staging-rt: Bump linux rt version for 08.01.00.002 release
  ti-linux-fw: Bump k3 image gen to latest
  u-boot-ti-staging: Bump u-boot version for 08.01.00.003
  linux-ti-staging: Bump linux version for 08.01.00.003
  linux-ti-staging-rt: Bump linux rt version for 08.01.00.003
  ti-linux-fw: Add AUTOREV support for K3 Image Gen
  conf: am57xx-evm: Add missing *.dtb and *.dtbo
  conf: machine: add new am64x hs platform
  ti-sci-fw: changes to build combined boot image for hs build
  am64xx-hs: changes to support new hs platform
  conf: machine: am64xx: Add missing dtbo
  conf: machine : am65xx: Add missing dtbo
  conf: machine: Add j7200 hs platform
  ti-rtos-firmware: Add j7200 hs support
  j7200-hs: changes to support new hs platform
  j721e-sr1_1: Add j721e sr1.1 HS support
  j7-hs-evm: Correct image boot file causing build error

 conf/machine/am57xx-evm.conf                       |  3 ++
 conf/machine/am64xx-hs-evm-k3r5.conf               | 14 +++++
 conf/machine/am64xx-hs-evm.conf                    | 22 ++++++++
 conf/machine/include/am64xx.inc                    |  1 +
 conf/machine/include/am65xx.inc                    |  1 +
 conf/machine/j7-hs-evm-k3r5-sr1-1.conf             | 11 ++++
 conf/machine/j7-hs-evm.conf                        |  8 +++
 conf/machine/j7200-hs-evm-k3r5.conf                | 13 +++++
 conf/machine/j7200-hs-evm.conf                     | 22 ++++++++
 conf/multiconfig/k3r5-sr1-1.conf                   |  3 ++
 licenses/TI-IMG                                    | 63 ++++++++++++++++++++++
 recipes-bsp/ti-img-encode-decode/vxd-dec-fw_git.bb | 24 +++++++++
 recipes-bsp/ti-linux-fw/ti-linux-fw.inc            | 13 +++--
 recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb             | 40 +++++++++++++-
 .../trusted-firmware-a_%.bbappend                  | 16 ++++++
 recipes-bsp/u-boot/u-boot-ti-mainline_git.bb       |  4 +-
 recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb    |  4 +-
 recipes-bsp/u-boot/u-boot-ti.inc                   | 12 +++++
 ...NUInstallDirs-module-to-detect-install-pa.patch | 48 -----------------
 recipes-devtools/ion/libion_git.bb                 |  6 +--
 recipes-kernel/linux/kernel-rdepends.inc           |  3 ++
 recipes-kernel/linux/linux-ti-staging-rt_5.10.bb   |  2 +-
 recipes-kernel/linux/linux-ti-staging_5.10.bb      |  2 +-
 recipes-security/optee/optee-os_%.bbappend         |  8 +++
 .../beagleboard/beaglebone-getting-started.bb      |  2 +-
 recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb         | 36 ++++++++++++-
 26 files changed, 314 insertions(+), 67 deletions(-)
 create mode 100644 conf/machine/am64xx-hs-evm-k3r5.conf
 create mode 100644 conf/machine/am64xx-hs-evm.conf
 create mode 100644 conf/machine/j7-hs-evm-k3r5-sr1-1.conf
 create mode 100644 conf/machine/j7200-hs-evm-k3r5.conf
 create mode 100644 conf/machine/j7200-hs-evm.conf
 create mode 100644 conf/multiconfig/k3r5-sr1-1.conf
 create mode 100644 licenses/TI-IMG
 create mode 100644 recipes-bsp/ti-img-encode-decode/vxd-dec-fw_git.bb
 delete mode 100644 recipes-devtools/ion/libion/0001-cmake-Use-GNUInstallDirs-module-to-detect-install-pa.patch

-- 
2.7.4

