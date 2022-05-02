Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5F81C4332F
	for <webhook@archiver.kernel.org>; Mon,  2 May 2022 14:51:29 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.11687.1651503084185805499
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 02 May 2022 07:51:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E6B6E40C2A
	for <meta-ti@lists.yoctoproject.org>; Mon,  2 May 2022 14:51:22 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p68pWOzv-TVi for <meta-ti@lists.yoctoproject.org>;
	Mon,  2 May 2022 14:51:22 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id CBF7B40C30
	for <meta-ti@lists.yoctoproject.org>; Mon,  2 May 2022 14:51:22 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id C6AC4174914
	for <meta-ti@lists.yoctoproject.org>; Mon,  2 May 2022 10:51:20 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master][PATCH 00/26] sync up with dunfell
Date: Mon,  2 May 2022 14:50:54 +0000
Message-Id: <20220502145120.726632-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 02 May 2022 14:51:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14642

From: Denys Dmytriyenko <denys@konsulko.com>

Port latest updates in Dunfell into master.

Denys Dmytriyenko (1):
  linux-ti-staging/mainline: depend on libmpc-native and gmp-native

Devarsh Thakkar (1):
  u-boot-ti: Use SRCREV to get short commit ID

Etheridge, Darren (1):
  ti-graphics: gpu enable and move all platforms to ddk 1.15

Jonathan Humphreys (1):
  conf: Enable bmap file for wic images on legacy platforms

Matthias Schiffer (1):
  ti-sgx-ddk-um: avoid unnecessary dependency on -dev package

Nick Saulnier (2):
  pru-icss_git.bb: update to PSSP v6.1.0
  pru-icss_git.bb: add AM62x

Nishanth Menon (1):
  machine: Add am62xx evm configuration

Praneeth Bajjuri (2):
  ipc: ti-rpmsg-char: Update library to 0.4.1
  k3conf: Update SRCREV to pick AM62x support

Ryan Eatmon (16):
  linux-ti-staging: Bump to 08.02.00.004 release
  linux-ti-staging-rt: Bump to 08.02.00.004 release
  u-boot-ti-staging: Bump to 08.02.00.004 release
  linux-ti-staging: Bump to 08.02.00.005 release
  linux-ti-staging-rt: Bump to 08.02.00.005 release
  u-boot-ti-staging: Bump to 08.02.00.005 release
  ti-linux-fw: Bump to 08.02.00.005 release
  u-boot-ti-staging: Bump to 08.02.00.006 release
  u-boot-ti-staging: Bump to 08.03.00.001 release
  linux-ti-staging: Bump to 08.03.00.001 release
  linux-ti-staging-rt: Bump to 08.03.00.001 release
  conf: machine: am62xx Add missing dtbo file
  u-boot-ti-staging: Bump to 08.03.00.002 release
  linux-ti-staging: Bump to 08.03.00.002 release
  linux-ti-staging-rt: Bump to 08.03.00.002 release
  ti-linux-fw: Bump to 08.03.00.002 release

 meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf | 11 +++++
 meta-ti-bsp/conf/machine/am62xx-evm.conf      | 14 ++++++
 meta-ti-bsp/conf/machine/include/am62xx.inc   | 17 +++++++
 meta-ti-bsp/conf/machine/include/omap-a15.inc |  2 +-
 meta-ti-bsp/conf/machine/include/ti33x.inc    |  2 +-
 meta-ti-bsp/conf/machine/include/ti43x.inc    |  2 +-
 meta-ti-bsp/conf/machine/j721s2-evm.conf      |  2 +
 .../ti-img-rogue-driver_1.13.5776728.bb       | 40 -----------------
 .../ti-img-rogue-driver_1.15.6133109.bb       | 44 +++++++++++++++++++
 .../recipes-bsp/ti-linux-fw/ti-linux-fw.inc   |  4 +-
 .../recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb    | 18 ++++++++
 .../u-boot/u-boot-ti-staging_2021.01.bb       |  4 +-
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc  | 17 ++++---
 .../recipes-devtools/k3conf/k3conf_git.bb     |  2 +-
 ...bb =3D> ti-img-rogue-umlibs_1.15.6133109.bb} | 13 +++---
 .../libgles/ti-sgx-ddk-um_1.17.4948957.bb     |  2 +-
 .../linux/linux-ti-mainline_git.bb            |  2 +-
 .../linux/linux-ti-staging-rt_5.10.bb         |  4 +-
 .../linux/linux-ti-staging_5.10.bb            |  6 ++-
 meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc  |  6 +--
 .../ti-rtos-bin/ti-rtos-firmware.bb           | 38 +++++++++++++---
 .../recipes-bsp/pru/pru-icss_git.bb           | 25 ++++++++++-
 22 files changed, 196 insertions(+), 79 deletions(-)
 create mode 100644 meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf
 create mode 100644 meta-ti-bsp/conf/machine/am62xx-evm.conf
 create mode 100644 meta-ti-bsp/conf/machine/include/am62xx.inc
 delete mode 100644 meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-=
driver_1.13.5776728.bb
 create mode 100644 meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-=
driver_1.15.6133109.bb
 rename meta-ti-bsp/recipes-graphics/libgles/{ti-img-rogue-umlibs_1.13.57=
76728.bb =3D> ti-img-rogue-umlibs_1.15.6133109.bb} (84%)

--=20
2.25.1


