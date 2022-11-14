Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B25D4C43219
	for <webhook@archiver.kernel.org>; Mon, 14 Nov 2022 18:42:16 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.459.1668451330374332660
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 14 Nov 2022 10:42:10 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: list.ti.com, ip: 198.47.23.249, mailfrom: lcpdbld@list.ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2AEIg9PA072914;
	Mon, 14 Nov 2022 12:42:09 -0600
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2AEIg9fd049565
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 14 Nov 2022 12:42:09 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Mon, 14
 Nov 2022 12:42:08 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Mon, 14 Nov 2022 12:42:08 -0600
Received: from fllvdckhpci039.itg.ti.com (fllvdckhpci039.itg.ti.com [10.248.132.250])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2AEIg8F3016478;
	Mon, 14 Nov 2022 12:42:08 -0600
Received: by fllvdckhpci039.itg.ti.com (Postfix, from userid 60899)
	id CC7B111221DB; Mon, 14 Nov 2022 12:42:08 -0600 (CST)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH 0/4] Update to cicd.2022.11.14.10:36:47
Date: Mon, 14 Nov 2022 12:42:04 -0600
Message-ID: <1668451328-133630-1-git-send-email-lcpdbld@list.ti.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 14 Nov 2022 18:42:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15342

Update linux-ti-staging, linux-ti-staging-rt, ti-linux-fw and u-boot-ti-staging to cicd.2022.11.14.10:36:47 tag

LCPD Automation Script (4):
  ti-linux-fw: CI/CD Auto-Merger: cicd.2022.11.14.10:36:47
  u-boot-ti-staging: CI/CD Auto-Merger: cicd.2022.11.14.10:36:47
  linux-ti-staging-rt: CI/CD Auto-Merger: cicd.2022.11.14.10:36:47
  linux-ti-staging: CI/CD Auto-Merger: cicd.2022.11.14.10:36:47

 recipes-bsp/ti-linux-fw/ti-linux-fw.inc          | 4 ++--
 recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb  | 2 +-
 recipes-kernel/linux/linux-ti-staging-rt_5.10.bb | 4 ++--
 recipes-kernel/linux/linux-ti-staging_5.10.bb    | 4 ++--
 4 files changed, 7 insertions(+), 7 deletions(-)

-- 
1.8.3.1


