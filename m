Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 613A6C4167B
	for <webhook@archiver.kernel.org>; Mon,  6 Nov 2023 12:48:10 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.53427.1699274880241943414
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 06 Nov 2023 04:48:00 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: list.ti.com, ip: 198.47.19.142, mailfrom: lcpdbld@list.ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3A6ClwFD075791;
	Mon, 6 Nov 2023 06:47:58 -0600
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3A6ClwCP074994
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 6 Nov 2023 06:47:58 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 6
 Nov 2023 06:47:58 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 6 Nov 2023 06:47:58 -0600
Received: from fllvdckhpci028.itg.ti.com (fllvdckhpci028.itg.ti.com [10.248.130.161])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3A6Clw1T109588;
	Mon, 6 Nov 2023 06:47:58 -0600
Received: by fllvdckhpci028.itg.ti.com (Postfix, from userid 60899)
	id 5D58910B5968; Mon,  6 Nov 2023 06:47:58 -0600 (CST)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH 0/4] Update to cicd.master.202311060100
Date: Mon, 6 Nov 2023 06:47:54 -0600
Message-ID: <1699274878-149529-1-git-send-email-lcpdbld@list.ti.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 06 Nov 2023 12:48:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17247

Update linux-ti-staging_6.1, linux-ti-staging-rt_6.1, ti-linux-fw and u-boot-ti-staging_2023.04 to cicd.master.202311060100 tag

LCPD Automation Script (4):
  ti-linux-fw: CI/CD Auto-Merger: cicd.master.202311060100
  u-boot-ti-staging_2023.04: CI/CD Auto-Merger: cicd.master.202311060100
  linux-ti-staging-rt_6.1: CI/CD Auto-Merger: cicd.master.202311060100
  linux-ti-staging_6.1: CI/CD Auto-Merger: cicd.master.202311060100

 meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc         | 2 +-
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.1.bb | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb    | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

-- 
1.8.3.1


