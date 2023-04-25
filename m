Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DA46C77B73
	for <webhook@archiver.kernel.org>; Tue, 25 Apr 2023 17:23:49 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.86184.1682443428914622941
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 25 Apr 2023 10:23:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=CViskUZU;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33PHNkFu099809;
	Tue, 25 Apr 2023 12:23:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1682443426;
	bh=IRjg+wXlcogzBv9gxuTXf5acMhqOJtnEJgOFInTRRok=;
	h=From:To:CC:Subject:Date;
	b=CViskUZUF7/+NvVU6wCNlcwueoQLvHoPTKj7yNZ/7zF8Il3wcxVKPl4c1pZ9OGvLC
	 JYrjX/ws63/wKIIe/SG/wsFtoDM++LZcFJhx0EL4D0rFLA21l/KymLbfjOj5l9ynDm
	 ++hUf5cnGZxqGxZ48xRZyR661MAw+rlaCI5y6BPE=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33PHNkxR007683
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 25 Apr 2023 12:23:46 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 25
 Apr 2023 12:23:46 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Tue, 25 Apr 2023 12:23:45 -0500
Received: from ula0226330.dal.design.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33PHNj0n030178;
	Tue, 25 Apr 2023 12:23:45 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        Praneeth Bajjuri <praneeth@ti.com>,
        Neha Malcom Francis <n-francis@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master/kirkstone][RFC 0/9] Switch to U-Boot binman
Date: Tue, 25 Apr 2023 12:23:36 -0500
Message-ID: <20230425172345.12293-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 25 Apr 2023 17:23:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16421

Hello all,

This series is what the binman conversion will look like. As you
can see from the diff status below, we are greatly simplifying our
boot image building process (removes ~559 lines and ~25 files).

The first 3 patches should be good to go in today. I'd argue the
same for the next 2 but I'll take comments on that. Last 4 all
need to go in at the same time and be squashed together. They
are only broken out into patches to make the review a little
bit easier (still a lot of churn I know). They must also wait
until the binman work is merged into our TI U-Boot.

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
 .../conf/machine/am62xx-evm-k3r5-hs-fs.conf   |  14 --
 .../conf/machine/am62xx-evm-k3r5-hs-se.conf   |  21 ---
 ...-evm-k3r5-gp.conf => am62xx-evm-k3r5.conf} |   7 -
 meta-ti-bsp/conf/machine/am62xx-evm.conf      |   4 +-
 .../machine/am62xx-lp-evm-k3r5-hs-fs.conf     |  14 --
 .../machine/am62xx-lp-evm-k3r5-hs-se.conf     |  21 ---
 .../conf/machine/am62xx-lp-evm-k3r5.conf      |   7 -
 .../conf/machine/am64xx-evm-k3r5-gp.conf      |  20 ---
 .../machine/am64xx-evm-k3r5-sr2-hs-fs.conf    |  14 --
 .../machine/am64xx-evm-k3r5-sr2-hs-se.conf    |  20 ---
 meta-ti-bsp/conf/machine/am64xx-evm-k3r5.conf |  12 ++
 .../conf/machine/am65xx-evm-k3r5-sr2.conf     |  11 --
 meta-ti-bsp/conf/machine/am65xx-evm-k3r5.conf |   7 -
 .../conf/machine/am65xx-hs-evm-k3r5-sr2.conf  |  11 --
 .../conf/machine/am65xx-hs-evm-k3r5.conf      |   7 -
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
 meta-ti-bsp/conf/machine/include/am65xx.inc   |   5 -
 meta-ti-bsp/conf/machine/include/j721e.inc    |   3 -
 meta-ti-bsp/conf/machine/include/k3.inc       |   2 +-
 meta-ti-bsp/conf/machine/include/k3r5.inc     |   5 +-
 meta-ti-bsp/conf/machine/j721e-evm-k3r5.conf  |   6 -
 .../conf/machine/j721e-hs-evm-k3r5.conf       |   6 -
 .../conf/machine/j721s2-evm-k3r5-gp.conf      |  20 ---
 .../machine/j721s2-evm-k3r5-sr1-hs-fs.conf    |  15 --
 meta-ti-bsp/conf/machine/j721s2-evm.conf      |   4 -
 meta-ti-bsp/conf/machine/j721s2-hs-evm.conf   |   2 -
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
 .../u-boot/u-boot-ti-staging_2023.04.bb       |   2 -
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc  |  14 +-
 .../ti-rtos-bin/ti-rtos-firmware.bb           |  86 +----------
 61 files changed, 286 insertions(+), 845 deletions(-)
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


