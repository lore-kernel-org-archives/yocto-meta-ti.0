Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E663C197A0
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 09:42:18 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.46894.1700473336137028490
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 20 Nov 2023 01:42:16 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: list.ti.com, ip: 198.47.23.249, mailfrom: lcpdbld@list.ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3AK9gEMq127171;
	Mon, 20 Nov 2023 03:42:14 -0600
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3AK9gED5007053
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 20 Nov 2023 03:42:14 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 20
 Nov 2023 03:42:14 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 20 Nov 2023 03:42:14 -0600
Received: from fllvdckhpci039.itg.ti.com (fllvdckhpci039.itg.ti.com [10.248.132.250])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3AK9gECj061519;
	Mon, 20 Nov 2023 03:42:14 -0600
Received: by fllvdckhpci039.itg.ti.com (Postfix, from userid 60899)
	id 545EF10F50C2; Mon, 20 Nov 2023 03:42:14 -0600 (CST)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH 0/4] Update to cicd.master.202311200100
Date: Mon, 20 Nov 2023 03:42:10 -0600
Message-ID: <1700473334-48951-1-git-send-email-lcpdbld@list.ti.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 20 Nov 2023 09:42:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17312

Update linux-ti-staging_6.1, linux-ti-staging-rt_6.1, ti-linux-fw and u-boot-ti-staging_2023.04 to cicd.master.202311200100 tag

LCPD Automation Script (4):
  ti-linux-fw: CI/CD Auto-Merger: cicd.master.202311200100
  u-boot-ti-staging_2023.04: CI/CD Auto-Merger: cicd.master.202311200100
  linux-ti-staging-rt_6.1: CI/CD Auto-Merger: cicd.master.202311200100
  linux-ti-staging_6.1: CI/CD Auto-Merger: cicd.master.202311200100

 meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc         | 10 +++++-----
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb |  2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.1.bb |  2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb    |  2 +-
 4 files changed, 8 insertions(+), 8 deletions(-)

-- 
1.8.3.1


