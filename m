Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74912C678D5
	for <webhook@archiver.kernel.org>; Wed, 22 Feb 2023 02:11:16 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.2777.1677031872062754791
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 21 Feb 2023 18:11:12 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: list.ti.com, ip: 198.47.19.141, mailfrom: lcpdbld@list.ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 31M2B91I097741;
	Tue, 21 Feb 2023 20:11:09 -0600
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 31M2B9XB121649
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 21 Feb 2023 20:11:09 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 21
 Feb 2023 20:11:08 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Tue, 21 Feb 2023 20:11:09 -0600
Received: from fllvdckhpci039.itg.ti.com (fllvdckhpci039.itg.ti.com [10.248.132.250])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 31M2B893029571;
	Tue, 21 Feb 2023 20:11:08 -0600
Received: by fllvdckhpci039.itg.ti.com (Postfix, from userid 60899)
	id D2A1310FE250; Tue, 21 Feb 2023 20:11:08 -0600 (CST)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH 0/4] Update to cicd.dunfell.202302211800
Date: Tue, 21 Feb 2023 20:11:04 -0600
Message-ID: <1677031868-147446-1-git-send-email-lcpdbld@list.ti.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 22 Feb 2023 02:11:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15905

Update linux-ti-staging, linux-ti-staging-rt, ti-linux-fw and u-boot-ti-staging to cicd.dunfell.202302211800 tag

LCPD Automation Script (4):
  ti-linux-fw: CI/CD Auto-Merger: cicd.dunfell.202302211800
  u-boot-ti-staging: CI/CD Auto-Merger: cicd.dunfell.202302211800
  linux-ti-staging-rt: CI/CD Auto-Merger: cicd.dunfell.202302211800
  linux-ti-staging: CI/CD Auto-Merger: cicd.dunfell.202302211800

 recipes-bsp/ti-linux-fw/ti-linux-fw.inc          | 2 +-
 recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb  | 2 +-
 recipes-kernel/linux/linux-ti-staging-rt_5.10.bb | 4 ++--
 recipes-kernel/linux/linux-ti-staging_5.10.bb    | 4 ++--
 4 files changed, 6 insertions(+), 6 deletions(-)

-- 
1.8.3.1


