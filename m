Return-Path: <devarsht@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 184CEEB64D8
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 14:33:16 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.13951.1686753189149123534
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 14 Jun 2023 07:33:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Nk9PSxjW;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: devarsht@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35EEX7SB058985;
	Wed, 14 Jun 2023 09:33:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686753187;
	bh=cYQTlKzEz37b/WSaCvrXE3qClwoAHByOEo5eIA4HcV8=;
	h=From:To:CC:Subject:Date;
	b=Nk9PSxjWtSjNpQZR1FAAuAety0mq0ZdgC6ZawgboyNR8vA2YoenEBg7u1tvk9lPU2
	 7dv8JdOsWtrCClT9go4rigACZ62ZWyl6SniqyGyCEY3WyYOYmVqSM30Ny6LUtr+kRK
	 ndqhEqDqBIFXO6xlBIjAr6OpQ0230ib/xR3Ho56M=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35EEX7I8084843
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 14 Jun 2023 09:33:07 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 14
 Jun 2023 09:33:07 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 14 Jun 2023 09:33:07 -0500
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35EEX6Bg008154;
	Wed, 14 Jun 2023 09:33:06 -0500
From: Devarsh Thakkar <devarsht@ti.com>
To: <reatmon@ti.com>, <meta-ti@lists.yoctoproject.org>, <praneeth@ti.com>,
        <denys@konsulko.com>
CC: <nm@ti.com>, <vigneshr@ti.com>, <a-bhatia1@ti.com>, <j-luthra@ti.com>,
        <khasim@ti.com>, <nsekhar@ti.com>, <afd@ti.com>, <rs@ti.com>,
        <n-jain1@ti.com>, <devarsht@ti.com>
Subject: [meta-ti] [kirkstone] [PATCH v2 0/2] Early splash screen on
Date: Wed, 14 Jun 2023 20:03:04 +0530
Message-ID: <20230614143306.1502763-1-devarsht@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 14 Jun 2023 14:33:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16718

This series is to enable out-of-box early splash screen on AM62x devices
with wic images compiled using meta-ti.

With this, u-boot SPL or u-boot proper can load TI logo from boot
partition
and display it while board is being booted.

Devarsh Thakkar (2):
  u-boot-ti-staging_2023.04: Copy bitmap file to boot partition for
    AM62x
  conf: machine: am62xx: Add TI logo as image boot file

 meta-ti-bsp/conf/machine/include/am62xx.inc              | 3 +++
 .../recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb      | 9 +++++++++
 2 files changed, 12 insertions(+)
---
V2: Rename ti logo file to include metadata
-- 
2.34.1


