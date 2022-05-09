Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B080C43217
	for <webhook@archiver.kernel.org>; Mon,  9 May 2022 17:59:53 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.555.1652119191596765393
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 09 May 2022 10:59:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4E98E407DA
	for <meta-ti@lists.yoctoproject.org>; Mon,  9 May 2022 17:59:50 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fCU7GL49O-AG for <meta-ti@lists.yoctoproject.org>;
	Mon,  9 May 2022 17:59:50 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 3E81640BC4
	for <meta-ti@lists.yoctoproject.org>; Mon,  9 May 2022 17:59:50 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id C66311748EE
	for <meta-ti@lists.yoctoproject.org>; Mon,  9 May 2022 13:59:47 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master][PATCH 00/10] sync up with Dunfell 08.03.00.003
Date: Mon,  9 May 2022 17:59:37 +0000
Message-Id: <20220509175947.1994132-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 09 May 2022 17:59:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14720

From: Denys Dmytriyenko <denys@konsulko.com>

Sync up with Dunfell up to 08.03.00.003 release.
Plus couple minor fixes.

Denys Dmytriyenko (2):
  libdce: upgrade to 3.00.15.00 and specify branch
  dsptop: fix host contamination warning

Nishanth Menon (3):
  u-boot-ti: Use SRCPV instead of SRCREV for U_BOOT_LOCAL_VERSION
  recipes-kernel: setup-defconfig: Use SRCPV to update
    KERNEL_LOCALVERSION
  conf/machine: am62xx: Update build flag for low power mode

Praneeth Bajjuri (1):
  trusted-firmware-a: upgrade to v2.6+

Ryan Eatmon (4):
  recipes-bsp: tifs-lpm-stub: Introduce new recipe
  u-boot-ti-staging: Bump to 08.03.00.003 release
  linux-ti-staging: Bump to 08.03.00.003 release
  linux-ti-staging-rt: Bump to 08.03.00.003 release

 meta-ti-bsp/conf/machine/include/am62xx.inc   |  2 ++
 .../recipes-bsp/ti-linux-fw/ti-linux-fw.inc   |  1 +
 .../tifs-lpm-stub/tifs-lpm-stub_git.bb        | 23 +++++++++++++++++++
 .../trusted-firmware-a_%.bbappend             |  5 ++--
 .../u-boot/u-boot-ti-staging_2021.01.bb       |  4 ++--
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc  |  2 +-
 .../recipes-kernel/linux/kernel-rdepends.inc  |  4 ++++
 .../linux/linux-ti-staging-rt_5.10.bb         |  2 +-
 .../linux/linux-ti-staging_5.10.bb            |  2 +-
 .../recipes-kernel/linux/setup-defconfig.inc  | 10 +-------
 .../recipes-bsp/dsptop/dsptop_git.bb          |  1 +
 ...dce_3.00.14.00.bb =3D> libdce_3.00.15.00.bb} |  6 ++---
 12 files changed, 42 insertions(+), 20 deletions(-)
 create mode 100644 meta-ti-bsp/recipes-bsp/tifs-lpm-stub/tifs-lpm-stub_g=
it.bb
 rename meta-ti-extras/recipes-multimedia/libdce/{libdce_3.00.14.00.bb =3D=
> libdce_3.00.15.00.bb} (75%)

--=20
2.25.1


