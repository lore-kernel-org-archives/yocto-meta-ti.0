Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 274D1C6FD1C
	for <webhook@archiver.kernel.org>; Wed, 22 Mar 2023 14:15:44 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.43842.1679494540874426949
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 22 Mar 2023 07:15:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=NBXo62nz;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 32MEFdvP111095;
	Wed, 22 Mar 2023 09:15:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1679494539;
	bh=uWtBhjL6HJ/zJohOSGce2hPUsk2I1EZKzxulSAr8n/4=;
	h=From:To:Subject:Date;
	b=NBXo62nzvlYhv6FPu2yMrIZXdIzqPeRzoWTM5XtVua3MVpmuI9QgQLuhlrnDzAy70
	 hk9Ae6CB/jYbcG9zN+2CuyxM6lC3cL78v39uheD+ql2Vm/G/mZbp+2BNFdFq/MpWSn
	 8jgZt/2FWrfwQmQQMeGyzegaZdHth0xUVBSQRDyY=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 32MEFddD050262
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 22 Mar 2023 09:15:39 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 22
 Mar 2023 09:15:39 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 22 Mar 2023 09:15:39 -0500
Received: from uda0214219 (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 32MEFd6L055597;
	Wed, 22 Mar 2023 09:15:39 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1pezFb-0004nP-0K; Wed, 22 Mar 2023 09:15:39 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH v4 0/3] Kernel and u-boot LTS
Date: Wed, 22 Mar 2023 09:15:35 -0500
Message-ID: <20230322141538.18392-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 22 Mar 2023 14:15:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16229

We are preparing for LTS migration to the 6.1 kernel and 2023.01 u-boot
versions.  This series creates the recipes for them as well doing a
little cleanup of how we handle specifying the DTB/DTBO files in the
machine confs.

Ryan Eatmon (3):
  linux-ti-*: Add filtering for which dtb/dtbo to include
  linux-ti-staging: Add 6.1 kernel in prep for LTS migration
  u-boot-ti-staging: Add 2023.01 in prep for LTS migration

v4: Rebase on top of recent dunfell sync.
v3: Set DEFAULT_PREFERENCE for new rt and systest recipes.
v2: - Do not use the prefix for mainline or next kernels.
    - Add rt and systest variations for the kernel.

 meta-ti-bsp/conf/machine/am57xx-evm.conf      | 17 ++++----
 meta-ti-bsp/conf/machine/am62axx-evm.conf     | 20 +++-------
 meta-ti-bsp/conf/machine/am62xx-evm.conf      | 10 +----
 meta-ti-bsp/conf/machine/am62xx-lp-evm.conf   |  9 +++--
 meta-ti-bsp/conf/machine/beagle-x15.conf      |  8 +++-
 meta-ti-bsp/conf/machine/beaglebone.conf      | 13 +++++--
 meta-ti-bsp/conf/machine/dra7xx-evm.conf      | 14 +++----
 meta-ti-bsp/conf/machine/include/am64xx.inc   |  5 +--
 meta-ti-bsp/conf/machine/include/am65xx.inc   | 12 +-----
 meta-ti-bsp/conf/machine/include/ti33x.inc    | 15 +++++--
 meta-ti-bsp/conf/machine/include/ti43x.inc    | 10 +++--
 meta-ti-bsp/conf/machine/j7200-evm.conf       |  4 +-
 meta-ti-bsp/conf/machine/j721e-evm.conf       | 29 +++-----------
 meta-ti-bsp/conf/machine/j721s2-evm.conf      | 32 +++------------
 meta-ti-bsp/conf/machine/j784s4-evm.conf      | 33 +++-------------
 meta-ti-bsp/conf/machine/omapl138-lcdk.conf   |  7 +++-
 .../u-boot/u-boot-ti-staging_2023.01.bb       | 11 ++++++
 .../linux/linux-ti-mainline_git.bb            | 23 -----------
 .../recipes-kernel/linux/linux-ti-next_git.bb | 15 -------
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
 .../linux/linux-ti-staging_6.1.bb             | 39 +++++++++++++++++++
 .../linux/ti-kernel-devicetree-prefix.inc     | 21 ++++++++++
 33 files changed, 193 insertions(+), 189 deletions(-)
 create mode 100644 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.01.bb
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


