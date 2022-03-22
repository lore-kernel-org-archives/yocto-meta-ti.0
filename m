Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6A2AC4321E
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 18:16:01 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web08.13726.1647972960520737803
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 22 Mar 2022 11:16:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=vYY2ZngJ;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22MIFwhc099851;
	Tue, 22 Mar 2022 13:15:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1647972958;
	bh=b79KH9vhg4PBnz4Gwn9T9kxkSb2EGU0dX8fZ5qukxHU=;
	h=From:To:Subject:Date;
	b=vYY2ZngJfUCI0EYlndp0ISLSf8gQ/KrO8jq2CZixbp6JaBbZhdywl7kBtJh9piTCH
	 6gY8uqVdAC14sabttPKOtOnUmbRviZp5gv6mLph1gHl76PI6uppOtZBk5abBQu7VLZ
	 a67HSTxRxJtc3ktn2lkTdlGmVrBs2u2OGuYFk1Uc=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22MIFw0e006692
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 22 Mar 2022 13:15:58 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 22
 Mar 2022 13:15:58 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 22 Mar 2022 13:15:58 -0500
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22MIFwNt030837;
	Tue, 22 Mar 2022 13:15:58 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1nWj30-0005OR-AX; Tue, 22 Mar 2022 13:15:58 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Yogesh Siraswar <yogeshs@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH v2 0/7] Adding support for am62xx
Date: Tue, 22 Mar 2022 13:15:51 -0500
Message-ID: <20220322181558.20684-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 22 Mar 2022 18:16:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14530

These patches add initial recipe support for am62xx.

--
v2: Removed ti-graphics patch, and removed lpm-demo patches.

Hari Nagalla (3):
  ti-rtos: Add support for AM62x M4F
  ti-rtos: Fix AM62x R5F DM FW paths
  ti-rtos: Fix AM62x Fix MCU core numbers

Nishanth Menon (4):
  machine: Add am62xx evm configuration
  recipes-ti: ti-rtos-bin: Add AM62x binaries
  recipes: Pick up correct image and build DM to boot images
  HACK: recipes-ti: ti-rtos-metadata: Make am62x point to am64x

 conf/machine/am62xx-evm-k3r5.conf          | 11 +++++++
 conf/machine/am62xx-evm.conf               | 13 ++++++++
 conf/machine/include/am62xx.inc            | 17 ++++++++++
 recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb     | 18 +++++++++++
 recipes-bsp/u-boot/u-boot-ti.inc           |  7 ++++
 recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb | 37 ++++++++++++++++++++++
 recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb |  1 +
 7 files changed, 104 insertions(+)
 create mode 100644 conf/machine/am62xx-evm-k3r5.conf
 create mode 100644 conf/machine/am62xx-evm.conf
 create mode 100644 conf/machine/include/am62xx.inc

-- 
2.17.1


