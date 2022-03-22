Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9460FC41535
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 16:25:33 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web08.12217.1647966331568983392
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 22 Mar 2022 09:25:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=a6N8Hf1B;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22MGPTF3073155;
	Tue, 22 Mar 2022 11:25:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1647966329;
	bh=2XJ/T3jEMvqB7/JfbxsJUfBV8NNakVUb/gp2Kwksb0c=;
	h=From:To:Subject:Date;
	b=a6N8Hf1BKSFqMW5ZbA+lHp9DGKNOw3jSKjoBS8dVxaQQDTbakV2JWMjvFhYMVlfkn
	 cUNYH/qxZGsOS7GISRsjPk22rdE6GaAXpXreWcA7YjvEMCCyBZu/jwNiqZ9KlFPkoV
	 l3QyNpfTTlKEzq/77F20X4MY0dQpNU4bgNVYDsAI=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22MGPTdH011012
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 22 Mar 2022 11:25:29 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 22
 Mar 2022 11:25:29 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 22 Mar 2022 11:25:29 -0500
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22MGPTbs013073;
	Tue, 22 Mar 2022 11:25:29 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1nWhK4-0003zd-Vr; Tue, 22 Mar 2022 11:25:29 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Yogesh Siraswar <yogeshs@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH 00/11] Adding support for am62xx
Date: Tue, 22 Mar 2022 11:25:17 -0500
Message-ID: <20220322162528.15298-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 22 Mar 2022 16:25:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14513

These patches add initial recipe support for am62xx.

Hari Nagalla (3):
  ti-rtos: Add support for AM62x M4F
  ti-rtos: Fix AM62x R5F DM FW paths
  ti-rtos: Fix AM62x Fix MCU core numbers

Krunal Bhargav (1):
  ti-graphics: Add AM62x GPU (AXE1-16M) support v4

Nikhil Devshatwar (3):
  recipes-bsp: lpm-demo: Introduce low power mode demo package
  recipes-bsp: tifs-lpm-stub: Introduce new recipe
  recipes-bsp: lpm-demo: Fix build errors with clean task

Nishanth Menon (4):
  machine: Add am62xx evm configuration
  recipes-ti: ti-rtos-bin: Add AM62x binaries
  recipes: Pick up correct image and build DM to boot images
  HACK: recipes-ti: ti-rtos-metadata: Make am62x point to am64x

 conf/machine/am62xx-evm-k3r5.conf             |  11 +
 conf/machine/am62xx-evm.conf                  |  15 +
 conf/machine/include/am62xx.inc               |  17 +
 recipes-bsp/lpm-demo/files/GPL-2              | 340 ++++++++++++++++++
 recipes-bsp/lpm-demo/lpm-demo_1.0.bb          |  30 ++
 .../ti-img-rogue-driver_1.13.5776728.bb       |  40 ---
 .../ti-img-rogue-driver_1.15.6133109.bb       |  42 +++
 recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb        |  18 +
 .../tifs-lpm-stub/tifs-lpm-stub_git.bb        |  22 ++
 recipes-bsp/u-boot/u-boot-ti.inc              |   7 +
 ...bb => ti-img-rogue-umlibs_1.15.6133109.bb} |  17 +-
 recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb    |  37 ++
 recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb    |   1 +
 13 files changed, 549 insertions(+), 48 deletions(-)
 create mode 100644 conf/machine/am62xx-evm-k3r5.conf
 create mode 100644 conf/machine/am62xx-evm.conf
 create mode 100644 conf/machine/include/am62xx.inc
 create mode 100644 recipes-bsp/lpm-demo/files/GPL-2
 create mode 100644 recipes-bsp/lpm-demo/lpm-demo_1.0.bb
 delete mode 100644 recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.13.5776728.bb
 create mode 100644 recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb
 create mode 100644 recipes-bsp/tifs-lpm-stub/tifs-lpm-stub_git.bb
 rename recipes-graphics/libgles/{ti-img-rogue-umlibs_1.13.5776728.bb => ti-img-rogue-umlibs_1.15.6133109.bb} (77%)

-- 
2.17.1


