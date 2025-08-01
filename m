Return-Path: <b-padhi@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0006C87FDA
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 04:44:55 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.80624.1754023485658095007
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 31 Jul 2025 21:44:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=ypristDz;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: b-padhi@ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5714ii4A3191689;
	Thu, 31 Jul 2025 23:44:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1754023484;
	bh=EQMKkm5hZYZzSj6GGKUUzXwf7RXpdpqlgTH9uH2P2J8=;
	h=From:To:CC:Subject:Date;
	b=ypristDzmbAU+6fuJEkF3aqwVBGn9s0Yq3t/RTDpuUqLvRpLd4UsRZXfh2b/BUjft
	 y+DvU1BEdrZkER8JmjbufKNWGxwfnXv3IivqP+6xCBz73N6Wz8Bv5wkGKrsEyx+k3s
	 aP/Lvx4x2ZQ5adtVxfOvsWTBNW7/0ETmxqqe4vWI=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5714iirI3238585
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 31 Jul 2025 23:44:44 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 31
 Jul 2025 23:44:44 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 31 Jul 2025 23:44:44 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.234.212])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5714if0H3708319;
	Thu, 31 Jul 2025 23:44:42 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <reatmon@ti.com>, <denys@konsulko.com>
CC: <a-limaye@ti.com>, <afd@ti.com>, <u-kumar1@ti.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [master/scarthgap][PATCH 0/2] Add license for PKA FW
Date: Fri, 1 Aug 2025 10:14:39 +0530
Message-ID: <20250801044441.1059527-1-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 01 Aug 2025 04:44:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18864

Add the LICENSE for PKA firmware from ti-linux-firmware repository and point to
this license inside the PKA firmware recipe.

Beleswar Padhi (2):
  licenses: Add a LICENSE for PKA Firmware
  ti-pka-fw: Update license to PKA-FW

 meta-ti-bsp/licenses/PKA-FW                   | 100 ++++++++++++++++++
 .../recipes-bsp/ti-pka-fw/ti-pka-fw_git.bb    |   4 +-
 2 files changed, 102 insertions(+), 2 deletions(-)
 create mode 100644 meta-ti-bsp/licenses/PKA-FW

-- 
2.34.1


