Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAA00C7EE2D
	for <webhook@archiver.kernel.org>; Tue, 16 May 2023 16:42:33 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.26954.1684255348171071988
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 16 May 2023 09:42:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=AKH/htjB;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34GGgPiA067630;
	Tue, 16 May 2023 11:42:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1684255345;
	bh=Z64NX3iqT3evigUxIauu4XrMwfb68AAg3dOq6Bee+Ug=;
	h=From:To:Subject:Date;
	b=AKH/htjBVRr9GpvC0Bcn/LJOYw4FDaoXkc9HuXORP+EF5As9s8AxQ5DHYxS/x4qET
	 9/cUPbCJTwmrBbZhlv3sH30AZJDu1hP9w9+V1jIhvXGpnj6uYZ2SQxogTXF9XMzEyk
	 xsMCTaz3HzrpX+r4RuLuUAwzzmWqO1sP4Mgk2TTo=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34GGgPP4005878
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 16 May 2023 11:42:25 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 16
 May 2023 11:42:25 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 16 May 2023 11:42:25 -0500
Received: from uda0214219 (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34GGgPBc004046;
	Tue, 16 May 2023 11:42:25 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1pyxkn-0003DO-Ey; Tue, 16 May 2023 11:42:25 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/kirkstone][PATCH 0/8] LTS sync up
Date: Tue, 16 May 2023 11:42:17 -0500
Message-ID: <20230516164225.12311-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 16 May 2023 16:42:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16541

This patch series is a repost of a number of patches that we have been
testing as part of our LTS migration to kernel 6.1 and uboot 2023.

LCPD Automation Script (1):
  various: Intial LTS migration version

Manorit Chawdhry (1):
  j721e-hs-evm: Merge j721e defconfigs

Randolph Sapp (1):
  ti-img-rogue-driver: enable bxs/8xe apm

Ryan Eatmon (3):
  ti-ipc: Stop looking for rpmsg_rpc.h in the kernel
  ti-sci-fw: Add SYSFW_SUFFIX to SYSFW_BINARY to match k3-image-gen
  various: Remove DEFAULT_PREFERENCE

Udit Kumar (2):
  meta-ti-bsp: conf: machine: j7200: Update def config
  meta-ti-bsp: conf: machine: j721s2: Update def config

 meta-ti-bsp/conf/machine/am65xx-evm.conf      |  2 ++
 meta-ti-bsp/conf/machine/am65xx-hs-evm.conf   |  2 ++
 meta-ti-bsp/conf/machine/include/am65xx.inc   |  4 +--
 .../conf/machine/j7200-hs-evm-k3r5.conf       |  2 +-
 meta-ti-bsp/conf/machine/j7200-hs-evm.conf    |  2 +-
 .../conf/machine/j721e-hs-evm-k3r5.conf       |  2 +-
 meta-ti-bsp/conf/machine/j721e-hs-evm.conf    |  2 +-
 .../conf/machine/j721s2-hs-evm-k3r5.conf      |  2 +-
 meta-ti-bsp/conf/machine/j721s2-hs-evm.conf   |  2 +-
 .../ti-img-rogue-driver_23.1.6404501.bb       |  2 +-
 .../recipes-bsp/ti-linux-fw/ti-linux-fw.inc   |  4 +--
 .../recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb    | 32 ++++++++---------
 .../u-boot/u-boot-ti-staging_2021.01.bb       |  2 +-
 .../u-boot/u-boot-ti-staging_2023.04.bb       |  3 +-
 .../recipes-devtools/k3conf/k3conf_git.bb     |  2 +-
 .../linux/linux-ti-staging-rt_5.10.bb         |  2 +-
 .../linux/linux-ti-staging-rt_6.1.bb          |  6 ++--
 .../linux/linux-ti-staging-systest_6.1.bb     |  2 --
 .../linux/linux-ti-staging_5.10.bb            |  2 +-
 .../linux/linux-ti-staging_6.1.bb             |  6 ++--
 ...ooking-for-rpmsg_rpc.h-in-the-kernel.patch | 35 +++++++++++++++++++
 meta-ti-bsp/recipes-ti/ipc/ti-ipc_git.bb      |  6 ++++
 22 files changed, 81 insertions(+), 43 deletions(-)
 create mode 100644 meta-ti-bsp/recipes-ti/ipc/ti-ipc/0001-MmRpc-Stop-looking-for-rpmsg_rpc.h-in-the-kernel.patch

-- 
2.17.1


