Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28E16C6FD1D
	for <webhook@archiver.kernel.org>; Fri, 17 Mar 2023 15:20:59 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.22368.1679066457491419673
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 17 Mar 2023 08:20:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=iiBX4BQ8;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 32HFKu04036940;
	Fri, 17 Mar 2023 10:20:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1679066456;
	bh=gXjLa2fDEsrNvkNALN1keltNf7WLKSDrSKAqV/2D7kk=;
	h=From:To:Subject:Date;
	b=iiBX4BQ8fU4Osh9XL8EQnJhHCcsBqBoA/JVHzthvvsX3JubwVx3GSXrjG+SB/jP0C
	 CCQ2kv2OR5TIO4jNAVO5qKXiPNAek5R9epZsYGA/sxEUedlUP3lsGw1q2bZlt1LJKH
	 RLFdzUwFSR794ihXuhjobzoeqvveGTkBVfCFUaUk=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 32HFKuLE026533
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 17 Mar 2023 10:20:56 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Fri, 17
 Mar 2023 10:20:55 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Fri, 17 Mar 2023 10:20:55 -0500
Received: from uda0214219 (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 32HFKuZN100593;
	Fri, 17 Mar 2023 10:20:56 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1pdBt1-0006iH-Tu; Fri, 17 Mar 2023 10:20:55 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/kirkstone][PATCH v3 0/3] Kernel and u-boot LTS
Date: Fri, 17 Mar 2023 10:20:52 -0500
Message-ID: <20230317152055.25762-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 17 Mar 2023 15:20:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16002

We are preparing for LTS migration to the 6.1 kernel and 2023.01 u-boot
versions.  This series creates the recipes for them as well doing a
little cleanup of how we handle specifying the DTB/DTBO files in the
machine confs.

Ryan Eatmon (3):
  linux-ti-*: Add filtering for which dtb/dtbo to include
  linux-ti-staging: Add 6.1 kernel in prep for LTS migration
  u-boot-ti-staging: Add 2023.01 in prep for LTS migration

v3: Set DEFAULT_PREFERENCE for new rt and systest recipes.
v2: - Do not use the prefix for mainline or next kernels.
    - Add rt and systest variations for the kernel.

 meta-ti-bsp/conf/machine/am57xx-evm.conf      | 17 ++++----
 meta-ti-bsp/conf/machine/am62xx-evm.conf      |  5 +--
 meta-ti-bsp/conf/machine/am62xx-lp-evm.conf   |  5 +--
 meta-ti-bsp/conf/machine/beagle-x15.conf      |  8 +++-
 meta-ti-bsp/conf/machine/beaglebone.conf      | 13 +++++--
 meta-ti-bsp/conf/machine/dra7xx-evm.conf      | 14 +++----
 meta-ti-bsp/conf/machine/include/am64xx.inc   |  5 +--
 meta-ti-bsp/conf/machine/include/am65xx.inc   | 12 +-----
 meta-ti-bsp/conf/machine/include/ti33x.inc    | 15 +++++--
 meta-ti-bsp/conf/machine/include/ti43x.inc    | 10 +++--
 meta-ti-bsp/conf/machine/j7200-evm.conf       |  2 +
 meta-ti-bsp/conf/machine/j721e-evm.conf       |  3 +-
 meta-ti-bsp/conf/machine/j721s2-evm.conf      |  3 +-
 meta-ti-bsp/conf/machine/j784s4-evm.conf      |  6 +--
 meta-ti-bsp/conf/machine/omapl138-lcdk.conf   |  8 +++-
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
 .../linux/ti-kernel-devicetree-prefix.inc     | 22 +++++++++++
 32 files changed, 179 insertions(+), 92 deletions(-)
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


