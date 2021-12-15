Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web09.1506.1639602665253555702
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 15 Dec 2021 13:11:05 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4772440C4E
	for <meta-ti@lists.yoctoproject.org>; Wed, 15 Dec 2021 21:11:04 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gITpW6-5Klke for <meta-ti@lists.yoctoproject.org>;
	Wed, 15 Dec 2021 21:11:04 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 3698B40A3D
	for <meta-ti@lists.yoctoproject.org>; Wed, 15 Dec 2021 21:11:04 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 5D9E0174718
	for <meta-ti@lists.yoctoproject.org>; Wed, 15 Dec 2021 16:11:03 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master][PATCH 00/11] Sync up with Dunfell #3
Date: Wed, 15 Dec 2021 16:10:52 -0500
Message-Id: <1639602663-32787-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4

From: Denys Dmytriyenko <denys@konsulko.com>

Keep master up to date with latest changes in Dunfell, adjust to the new
override syntax.

Nick Saulnier (1):
  pru-icss_git.bb: update to PSSP v6.0.1

Nishanth Menon (1):
  Revert "ti-sci-fw: k3-image-gen: Revert SPL address change for
    mainline"

Praneeth Bajjuri (2):
  linux-ti-staging: Bump linux version for 08.01.00.006
  u-boot-ti-staging: Bump u-boot version for 08.01.00.006

Ryan Eatmon (1):
  linux-ti-mainline: Bump kernel version to v5.15

Sidraya (2):
  viddec-test-app: Add the viddec-test-app recipe
  videnc-test-app: Add the videnc-test-app recipe

Yogesh Siraswar (4):
  vxd-dec-fw: Move firmware one folder up in target
  ti-sci-fw: Fix for k3-image-gen issue for combined boot images
  conf: j7200-hs: fix the wrong machine configuration included
  linux-ti-staging: block sa2ul for am64x hs and j7200 hs device

 conf/machine/j7200-hs-evm.conf                     |  2 +-
 recipes-bsp/pru/pru-icss_git.bb                    |  4 +-
 .../ti-img-encode-decode/viddec-test-app_1.0.0.bb  | 18 ++++++
 .../ti-img-encode-decode/videnc-test-app_1.0.0.bb  | 18 ++++++
 recipes-bsp/ti-img-encode-decode/vxd-dec-fw_git.bb |  4 +-
 recipes-bsp/ti-linux-fw/ti-linux-fw.inc            | 11 ----
 ...ip-signing-of-binaries-for-combined-boot-.patch | 64 ++++++++++++++++++++++
 ...am64x-Makefile-Move-the-SPL-Load-address-.patch | 36 ------------
 recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb             |  5 ++
 recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb    |  4 +-
 recipes-kernel/linux/linux-ti-mainline_git.bb      |  8 +--
 recipes-kernel/linux/linux-ti-staging-rt_5.10.bb   |  2 +-
 recipes-kernel/linux/linux-ti-staging_5.10.bb      |  8 ++-
 13 files changed, 124 insertions(+), 60 deletions(-)
 create mode 100644 recipes-bsp/ti-img-encode-decode/viddec-test-app_1.0.0.bb
 create mode 100644 recipes-bsp/ti-img-encode-decode/videnc-test-app_1.0.0.bb
 create mode 100644 recipes-bsp/ti-sci-fw/files/0001-Makefile-Skip-signing-of-binaries-for-combined-boot-.patch
 delete mode 100644 recipes-bsp/ti-sci-fw/files/0001-Revert-soc-am64x-Makefile-Move-the-SPL-Load-address-.patch

-- 
2.7.4

