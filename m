Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13D8CC6FD1D
	for <webhook@archiver.kernel.org>; Thu, 30 Mar 2023 21:33:54 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.39393.1680212029684587536
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 30 Mar 2023 14:33:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=yVA+uNrz;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 32ULXljQ035707;
	Thu, 30 Mar 2023 16:33:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1680212027;
	bh=/DumqEGo7c4ZOohtVbQFTISJrl9fap4i7ImFX9SNbfE=;
	h=From:To:Subject:Date;
	b=yVA+uNrzUGlEev5fgwexvTTeqx4Re09tqWCafpuxSTi/gt7lTrI6+90nO9LC56Otk
	 Zn+ptlsz3MZv1Uz0lIaVQxWDMm4Aa9m1hbrCxJMrEFSYS4SEy5LztrqXT/SIx8Y83P
	 LauP0IzupzxS71rQVpWnX4vTz1E50KF0TjcyZgqI=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 32ULXlPD020986
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 30 Mar 2023 16:33:47 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Thu, 30
 Mar 2023 16:33:47 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Thu, 30 Mar 2023 16:33:47 -0500
Received: from uda0214219 (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 32ULXlQf080838;
	Thu, 30 Mar 2023 16:33:47 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1phztz-0005Nv-EJ; Thu, 30 Mar 2023 16:33:47 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/kirkstone][PATCH v6 0/3] Kernel and u-boot LTS
Date: Thu, 30 Mar 2023 16:33:44 -0500
Message-ID: <20230330213347.20656-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 30 Mar 2023 21:33:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16265

We are preparing for LTS migration to the 6.1 kernel and 2023.04 u-boot
versions.  This series creates the recipes for them as well doing a
little cleanup of how we handle specifying the DTB/DTBO files in the
machine confs.

Ryan Eatmon (3):
  linux-ti-*: Add filtering for which dtb/dtbo to include
  linux-ti-staging: Add 6.1 kernel in prep for LTS migration
  u-boot-ti-staging: Add 2023.04 in prep for LTS migration

v6: - Change to u-boot 2023.04
    - Remove uneeded line from new kernel recipe based on feedback
v5: Add KERNEL_DEVICETREE_DTBMERGE to the prefix logic.
v4: Rebase on top of recent dunfell sync.
v3: Set DEFAULT_PREFERENCE for new rt and systest recipes.
v2: - Do not use the prefix for mainline or next kernels.
    - Add rt and systest variations for the kernel.

 meta-ti-bsp/conf/machine/am57xx-evm.conf      | 22 ++++++-----
 meta-ti-bsp/conf/machine/am62axx-evm.conf     | 20 +++-------
 meta-ti-bsp/conf/machine/am62xx-evm.conf      | 10 +----
 meta-ti-bsp/conf/machine/am62xx-lp-evm.conf   |  9 +++--
 meta-ti-bsp/conf/machine/beagle-x15.conf      |  8 +++-
 meta-ti-bsp/conf/machine/beaglebone.conf      | 13 +++++--
 meta-ti-bsp/conf/machine/dra7xx-evm.conf      | 14 +++----
 meta-ti-bsp/conf/machine/include/am64xx.inc   |  5 +--
 meta-ti-bsp/conf/machine/include/am65xx.inc   | 12 +-----
 meta-ti-bsp/conf/machine/include/ti33x.inc    | 15 ++++++--
 meta-ti-bsp/conf/machine/include/ti43x.inc    | 10 +++--
 meta-ti-bsp/conf/machine/j7200-evm.conf       |  4 +-
 meta-ti-bsp/conf/machine/j721e-evm.conf       | 29 +++-----------
 meta-ti-bsp/conf/machine/j721s2-evm.conf      | 32 +++-------------
 meta-ti-bsp/conf/machine/j784s4-evm.conf      | 33 +++-------------
 meta-ti-bsp/conf/machine/omapl138-lcdk.conf   |  7 +++-
 .../u-boot/u-boot-ti-staging_2023.04.bb       | 11 ++++++
 .../linux/linux-ti-mainline_git.bb            | 23 -----------
 .../recipes-kernel/linux/linux-ti-next_git.bb | 15 --------
 .../linux/linux-ti-staging-6.1/defconfig      |  2 +
 .../linux/linux-ti-staging-6.1/k3/defconfig   |  2 +
 .../linux-ti-staging-6.1/omapl138/defconfig   |  1 +
 .../linux/linux-ti-staging-rt-6.1/defconfig   |  2 +
 .../linux-ti-staging-rt-6.1/k3/defconfig      |  2 +
 .../omapl138/defconfig                        |  1 +
 .../linux/linux-ti-staging-rt_6.1.bb          | 12 ++++++
 .../linux-ti-staging-systest-6.1/defconfig    |  2 +
 .../linux-ti-staging-systest-6.1/k3/defconfig |  2 +
 .../omapl138/defconfig                        |  1 +
 .../linux/linux-ti-staging-systest_6.1.bb     |  7 ++++
 .../linux/linux-ti-staging_5.10.bb            |  1 +
 .../linux/linux-ti-staging_6.1.bb             | 38 +++++++++++++++++++
 .../linux/ti-kernel-devicetree-prefix.inc     | 22 +++++++++++
 33 files changed, 198 insertions(+), 189 deletions(-)
 create mode 100644 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb
 create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.1/defconfig
 create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.1/k3/defconfig
 create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.1/omapl138/defconfig
 create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.1/defconfig
 create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.1/k3/defconfig
 create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.1/omapl138/defconfig
 create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.1.bb
 create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-6.1/defconfig
 create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-6.1/k3/defconfig
 create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-6.1/omapl138/defconfig
 create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest_6.1.bb
 create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
 create mode 100644 meta-ti-bsp/recipes-kernel/linux/ti-kernel-devicetree-prefix.inc

-- 
2.17.1


