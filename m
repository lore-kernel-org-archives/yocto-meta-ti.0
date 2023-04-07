Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DE86C6FD1D
	for <webhook@archiver.kernel.org>; Fri,  7 Apr 2023 20:37:03 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.420.1680899813654984877
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 07 Apr 2023 13:36:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6B14440C61;
	Fri,  7 Apr 2023 20:36:52 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mIc5D6Zznfw9; Fri,  7 Apr 2023 20:36:52 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 54A6040C46;
	Fri,  7 Apr 2023 20:36:51 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id A572E1637F9;
	Fri,  7 Apr 2023 16:36:12 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master/kirkstone][PATCH 0/5] BeagleBoard.org related updates
Date: Fri,  7 Apr 2023 20:36:31 +0000
Message-Id: <20230407203636.3265548-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 07 Apr 2023 20:37:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16325

From: Denys Dmytriyenko <denys@konsulko.com>

* Update to the latest kernel 5.10.162 version
* Update BeagleBone AI64 U-boot branch for new memory part
* Add new BeaglePlay platform
* Switch 32-bit BeagleBone and BeagleBoard-X15 to bb.org kernel/u-boot

Denys Dmytriyenko (5):
  linux-bb.org: update to 5.10.162 and dedicated branches
  u-boot-bb.org: use dedicated branch for beaglebone-ai64
  beaglebone-ai64: add new DTBOs, remove duplicate settings
  machine: beagleplay: add new BeaglePlay platform
  machine: switch beaglebone and beagle-x15 to bb.org kernel/u-boot

 meta-ti-bsp/conf/machine/beagle-x15.conf      |  4 ++
 meta-ti-bsp/conf/machine/beaglebone-ai64.conf |  6 +-
 meta-ti-bsp/conf/machine/beaglebone.conf      |  4 ++
 meta-ti-bsp/conf/machine/beagleplay-k3r5.conf | 14 ++++
 meta-ti-bsp/conf/machine/beagleplay.conf      | 70 +++++++++++++++++++
 .../recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb    |  1 +
 .../recipes-bsp/u-boot/u-boot-bb.org_git.bb   | 10 +++
 ...h-default-kernel-compression-to-LZMA.patch | 30 ++++++++
 .../recipes-kernel/linux/linux-bb.org_git.bb  | 18 ++---
 9 files changed, 145 insertions(+), 12 deletions(-)
 create mode 100644 meta-ti-bsp/conf/machine/beagleplay-k3r5.conf
 create mode 100644 meta-ti-bsp/conf/machine/beagleplay.conf
 create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-bb.org/0001-de=
fconfig-switch-default-kernel-compression-to-LZMA.patch

--=20
2.25.1


