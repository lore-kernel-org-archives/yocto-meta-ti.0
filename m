Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B42DC7EE31
	for <webhook@archiver.kernel.org>; Thu, 25 May 2023 18:11:41 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.19174.1685038297115048513
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 25 May 2023 11:11:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=iuQLYWoV;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34PIBYDI077474;
	Thu, 25 May 2023 13:11:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1685038294;
	bh=59Yu1abKpXt53Ij4g+xrm6au2zWECvnVbwxPmW6W37U=;
	h=From:To:CC:Subject:Date;
	b=iuQLYWoVM7rsrQGb61nrHxWG6hUtG9LDXDfwH0m2UgiSuPfABWbWYPJWbJbjDEs2x
	 EdpZoz4LrOe7Mn4OhHdvnq51z2jUO5IiSpkXNTKYE4sxyOg6QhQrExP8zrGtKFGlX/
	 l/ZLftXt4DTKuet0D6Cs5Ocvzf3N30uKUcGdR/+g=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34PIBYaL059566
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 25 May 2023 13:11:34 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 25
 May 2023 13:11:34 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 25 May 2023 13:11:33 -0500
Received: from lelv0326.itg.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34PIBXGr102467;
	Thu, 25 May 2023 13:11:33 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH 0/9] Switch to U-Boot binman
Date: Thu, 25 May 2023 13:11:23 -0500
Message-ID: <20230525181132.417197-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 25 May 2023 18:11:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16589

Hello all,

First 5 patches can stand alone, but the last 4 would need squashed if
we want to keep bisectability. Not sure if that matters much since the
patch that pulls U-Boot forward to the version for which this all works
comes from the CICD automation, so will be broken between this series
and the CICD patch. Squash as needed.

Thanks,
Andrew

Andrew Davis (9):
  ti-dm-fw: Add recipe for TI DM firmware
  ti-eth-fw: Add recipe for TI Ethernet firmware
  ti-sci-fw: Remove source package recipe
  u-boot-bb.org: Remove this recipe
  u-boot-ti-staging: Remove version 2021.01
  ti-sci-fw: Drop k3-image-gen and only provide firmware
  u-boot-ti-staging: Use binman to package our firmware
  conf: machine: Switch all the machines over to U-Boot binman
  conf: machine: Remove all leftover config files

 .../conf/machine/am62axx-evm-k3r5-gp.conf     |  19 ---
 .../conf/machine/am62axx-evm-k3r5-hs-se.conf  |  22 ---
 ...-k3r5-hs-fs.conf => am62axx-evm-k3r5.conf} |   4 +-
 meta-ti-bsp/conf/machine/am62axx-evm.conf     |   4 -
 .../conf/machine/am62xx-evm-k3r5-hs-fs.conf   |  14 --
 .../conf/machine/am62xx-evm-k3r5-hs-se.conf   |  21 ---
 ...-evm-k3r5-gp.conf => am62xx-evm-k3r5.conf} |   7 -
 meta-ti-bsp/conf/machine/am62xx-evm.conf      |   4 +-
 .../machine/am62xx-lp-evm-k3r5-hs-fs.conf     |  14 --
 .../machine/am62xx-lp-evm-k3r5-hs-se.conf     |  21 ---
 .../conf/machine/am62xx-lp-evm-k3r5.conf      |   7 -
 meta-ti-bsp/conf/machine/am62xx-lp-evm.conf   |   4 -
 .../conf/machine/am64xx-evm-k3r5-gp.conf      |  20 ---
 .../machine/am64xx-evm-k3r5-sr2-hs-fs.conf    |  14 --
 .../machine/am64xx-evm-k3r5-sr2-hs-se.conf    |  20 ---
 meta-ti-bsp/conf/machine/am64xx-evm-k3r5.conf |  12 ++
 .../conf/machine/am65xx-evm-k3r5-sr2.conf     |  11 --
 meta-ti-bsp/conf/machine/am65xx-evm-k3r5.conf |   7 +-
 .../conf/machine/am65xx-hs-evm-k3r5-sr2.conf  |  11 --
 .../conf/machine/am65xx-hs-evm-k3r5.conf      |   7 +-
 meta-ti-bsp/conf/machine/am65xx-hs-evm.conf   |   4 -
 meta-ti-bsp/conf/machine/beagle-x15.conf      |   2 -
 .../conf/machine/beaglebone-ai64-k3r5.conf    |   3 -
 meta-ti-bsp/conf/machine/beaglebone-ai64.conf |   2 -
 meta-ti-bsp/conf/machine/beaglebone.conf      |   2 -
 meta-ti-bsp/conf/machine/beagleplay-k3r5.conf |   3 -
 meta-ti-bsp/conf/machine/beagleplay.conf      |   2 -
 meta-ti-bsp/conf/machine/include/am62axx.inc  |   6 -
 .../conf/machine/include/am62xx-lp.inc        |   4 -
 meta-ti-bsp/conf/machine/include/am62xx.inc   |   6 -
 meta-ti-bsp/conf/machine/include/am64xx.inc   |   6 -
 meta-ti-bsp/conf/machine/include/am65xx.inc   |  13 +-
 meta-ti-bsp/conf/machine/include/j721e.inc    |  12 +-
 meta-ti-bsp/conf/machine/include/k3.inc       |   2 +-
 meta-ti-bsp/conf/machine/include/k3r5.inc     |   4 +-
 meta-ti-bsp/conf/machine/j7200-hs-evm.conf    |   4 -
 meta-ti-bsp/conf/machine/j721e-evm-k3r5.conf  |   6 +-
 .../conf/machine/j721e-hs-evm-k3r5.conf       |   6 +-
 meta-ti-bsp/conf/machine/j721e-hs-evm.conf    |   5 -
 .../conf/machine/j721s2-evm-k3r5-gp.conf      |  20 ---
 .../machine/j721s2-evm-k3r5-sr1-hs-fs.conf    |  15 --
 meta-ti-bsp/conf/machine/j721s2-evm.conf      |   4 -
 meta-ti-bsp/conf/machine/j721s2-hs-evm.conf   |   6 -
 .../conf/machine/j784s4-evm-k3r5-gp.conf      |  20 ---
 .../machine/j784s4-evm-k3r5-sr1-hs-fs.conf    |  16 --
 meta-ti-bsp/conf/machine/j784s4-evm.conf      |   4 -
 meta-ti-bsp/conf/machine/j784s4-hs-evm.conf   |   2 -
 meta-ti-bsp/conf/multiconfig/k3r5-gp.conf     |   3 -
 meta-ti-bsp/conf/multiconfig/k3r5-hs-fs.conf  |   3 -
 meta-ti-bsp/conf/multiconfig/k3r5-hs-se.conf  |   3 -
 .../conf/multiconfig/k3r5-sr1-hs-fs.conf      |   3 -
 meta-ti-bsp/conf/multiconfig/k3r5-sr1.conf    |   3 -
 .../conf/multiconfig/k3r5-sr2-hs-fs.conf      |   3 -
 .../conf/multiconfig/k3r5-sr2-hs-se.conf      |   3 -
 meta-ti-bsp/conf/multiconfig/k3r5-sr2.conf    |   3 -
 meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb  | 119 +++++++++++++++
 .../recipes-bsp/ti-eth-fw/ti-eth-fw.bb        | 118 ++++++++++++++
 .../recipes-bsp/ti-linux-fw/ti-linux-fw.inc   |  15 +-
 .../ti-sci-fw/ti-sci-fw-source_git.bb         |  45 ------
 .../recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb    | 144 ++----------------
 .../recipes-bsp/u-boot/u-boot-bb.org_git.bb   |  24 ---
 ...e-to-support-oe-core-fitImage-naming.patch | 144 ------------------
 .../u-boot/u-boot-ti-staging_2021.01.bb       |  15 --
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc  |  29 +++-
 .../ti-rtos-bin/ti-rtos-firmware.bb           |  86 +----------
 65 files changed, 318 insertions(+), 867 deletions(-)
 delete mode 100644 meta-ti-bsp/conf/machine/am62axx-evm-k3r5-gp.conf
 delete mode 100644 meta-ti-bsp/conf/machine/am62axx-evm-k3r5-hs-se.conf
 rename meta-ti-bsp/conf/machine/{am62axx-evm-k3r5-hs-fs.conf => am62axx-evm-k3r5.conf} (60%)
 delete mode 100644 meta-ti-bsp/conf/machine/am62xx-evm-k3r5-hs-fs.conf
 delete mode 100644 meta-ti-bsp/conf/machine/am62xx-evm-k3r5-hs-se.conf
 rename meta-ti-bsp/conf/machine/{am62xx-evm-k3r5-gp.conf => am62xx-evm-k3r5.conf} (54%)
 delete mode 100644 meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5-hs-fs.conf
 delete mode 100644 meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5-hs-se.conf
 delete mode 100644 meta-ti-bsp/conf/machine/am64xx-evm-k3r5-gp.conf
 delete mode 100644 meta-ti-bsp/conf/machine/am64xx-evm-k3r5-sr2-hs-fs.conf
 delete mode 100644 meta-ti-bsp/conf/machine/am64xx-evm-k3r5-sr2-hs-se.conf
 create mode 100644 meta-ti-bsp/conf/machine/am64xx-evm-k3r5.conf
 delete mode 100644 meta-ti-bsp/conf/machine/am65xx-evm-k3r5-sr2.conf
 delete mode 100644 meta-ti-bsp/conf/machine/am65xx-hs-evm-k3r5-sr2.conf
 delete mode 100644 meta-ti-bsp/conf/machine/j721s2-evm-k3r5-gp.conf
 delete mode 100644 meta-ti-bsp/conf/machine/j721s2-evm-k3r5-sr1-hs-fs.conf
 delete mode 100644 meta-ti-bsp/conf/machine/j784s4-evm-k3r5-gp.conf
 delete mode 100644 meta-ti-bsp/conf/machine/j784s4-evm-k3r5-sr1-hs-fs.conf
 delete mode 100644 meta-ti-bsp/conf/multiconfig/k3r5-gp.conf
 delete mode 100644 meta-ti-bsp/conf/multiconfig/k3r5-hs-fs.conf
 delete mode 100644 meta-ti-bsp/conf/multiconfig/k3r5-hs-se.conf
 delete mode 100644 meta-ti-bsp/conf/multiconfig/k3r5-sr1-hs-fs.conf
 delete mode 100644 meta-ti-bsp/conf/multiconfig/k3r5-sr1.conf
 delete mode 100644 meta-ti-bsp/conf/multiconfig/k3r5-sr2-hs-fs.conf
 delete mode 100644 meta-ti-bsp/conf/multiconfig/k3r5-sr2-hs-se.conf
 delete mode 100644 meta-ti-bsp/conf/multiconfig/k3r5-sr2.conf
 create mode 100644 meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb
 create mode 100644 meta-ti-bsp/recipes-bsp/ti-eth-fw/ti-eth-fw.bb
 delete mode 100644 meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw-source_git.bb
 delete mode 100644 meta-ti-bsp/recipes-bsp/u-boot/u-boot-bb.org_git.bb
 delete mode 100644 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging-2021.01/0001-configs-Update-to-support-oe-core-fitImage-naming.patch
 delete mode 100644 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb

-- 
2.39.2


