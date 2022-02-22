Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.8802.1645503271758378556
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 21 Feb 2022 20:14:31 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 3989B40AE9
	for <meta-ti@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:14:31 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kZ0sMo8GvypC for <meta-ti@lists.yoctoproject.org>;
	Tue, 22 Feb 2022 04:14:31 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 2D12C40A28
	for <meta-ti@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:14:31 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id E9C69174738
	for <meta-ti@lists.yoctoproject.org>; Mon, 21 Feb 2022 23:14:30 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [PATCH 00/29] #3 - another sync up with Dunfell
Date: Tue, 22 Feb 2022 04:14:01 +0000
Message-Id: <20220222041430.2840289-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Denys Dmytriyenko <denys@konsulko.com>

Since Dunfell has been used as an LTS/release branch for latest TI SDK re=
leases,
it accumulated a number of changes (including new platforms) that are due=
 to be
synced to master/kirkstone.

Here's a temp git tree with these patches applied to glance at:
https://github.com/denix0/meta-ti/tree/master

Hari Nagalla (2):
  recipes-ti/ti-rtos-bin: Fix unavailable binary path
  ipc: ti-rpmsg-char: Update library to 0.4.0

Kevin Hilman (1):
  conf/machine/am57xx-evm: add overlay for OV10635 sensor

Nishanth Menon (8):
  machine: Add j721s2 evm configuration
  optee-os: Add support for alternate console
  trusted-firmware-a: Add support for alternate console
  recipes-bsp/ti-rtos: Use target_c7x_0 instead of just c7x
  ti-rtos-bin: Add j721s2
  recipes-bsp/ti-rtos: Define the TARGET and ALTERNATE_TARGET as well.
  recipies-ti: ti-rtos-firmware: Fixup typo for rtos firmware
  recipes-bsp: Add cnm-wave-fw firmware recipe

Praneeth Bajjuri (2):
  ti-linux-fw: Bump up TIFS and DM to v2022.01
  Revert "ti-sci-fw: Fix for k3-image-gen issue for combined boot
    images"

Roger Quadros (1):
  u-boot-ti: Support binman image generation

Ryan Eatmon (15):
  cnm-wave-fw: Fix name of firmware for j721s2
  cnm-wave-fw: lock the compatiable machine to j721s2-evm
  linux-ti-staging: Bump to 08.02.00.001 release
  linux-ti-staging-rt: Bump to 08.02.00.001 release
  u-boot-ti-staging: Bump to 08.02.00.001 release
  ti-linux-fw: Bump to 08.02.00.001 release
  cnm-wave-fw: Split firmware name into target and source
  linux-ti-staging: Bump to 08.02.00.002 release
  linux-ti-staging-rt: Bump to 08.02.00.002 release
  u-boot-ti-staging: Bump to 08.02.00.002 release
  ti-linux-fw: Bump to 08.02.00.002 release
  ti-linux-fw: Bump to 08.02.00.003 release
  linux-ti-staging: Bump to 08.02.00.003 release
  linux-ti-staging-rt: Bump to 08.02.00.003 release
  u-boot-ti-staging: Bump to 08.02.00.003 release

 meta-ti-bsp/conf/machine/am57xx-evm.conf      |  1 +
 meta-ti-bsp/conf/machine/j721s2-evm-k3r5.conf | 11 ++++
 meta-ti-bsp/conf/machine/j721s2-evm.conf      | 22 +++++++
 .../cnm-wave-fw/cnm-wave-fw_git.bb            | 44 +++++++++++++
 .../recipes-bsp/ti-linux-fw/ti-linux-fw.inc   | 11 ++--
 ...gning-of-binaries-for-combined-boot-.patch | 64 -------------------
 .../recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb    | 27 ++++++--
 .../trusted-firmware-a_%.bbappend             |  2 +
 .../u-boot/u-boot-ti-staging_2021.01.bb       |  4 +-
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc  |  8 ++-
 .../recipes-kernel/linux/kernel-rdepends.inc  |  3 +
 .../linux/linux-ti-staging-rt_5.10.bb         |  4 +-
 .../linux/linux-ti-staging_5.10.bb            |  4 +-
 .../optee/optee-os_%.bbappend                 |  2 +
 meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc  |  6 +-
 .../ti-rtos-bin/ti-rtos-firmware.bb           | 59 ++++++++++++++++-
 16 files changed, 184 insertions(+), 88 deletions(-)
 create mode 100644 meta-ti-bsp/conf/machine/j721s2-evm-k3r5.conf
 create mode 100644 meta-ti-bsp/conf/machine/j721s2-evm.conf
 create mode 100644 meta-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.b=
b
 delete mode 100644 meta-ti-bsp/recipes-bsp/ti-sci-fw/files/0001-Makefile=
-Skip-signing-of-binaries-for-combined-boot-.patch

--=20
2.25.1

