Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECEE3C54EBC
	for <webhook@archiver.kernel.org>; Sun,  8 Jan 2023 01:42:07 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.36250.1673142118247626146
 for <meta-ti@lists.yoctoproject.org>;
 Sat, 07 Jan 2023 17:41:58 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: list.ti.com, ip: 198.47.19.141, mailfrom: lcpdbld@list.ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3081ftxD114047;
	Sat, 7 Jan 2023 19:41:55 -0600
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3081ft0B023331
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 7 Jan 2023 19:41:55 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Sat, 7
 Jan 2023 19:41:54 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Sat, 7 Jan 2023 19:41:54 -0600
Received: from fllvdckhpci039.itg.ti.com (fllvdckhpci039.itg.ti.com [10.248.132.250])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3081fs5I095874;
	Sat, 7 Jan 2023 19:41:54 -0600
Received: by fllvdckhpci039.itg.ti.com (Postfix, from userid 60899)
	id C0123112303A; Sat,  7 Jan 2023 19:41:54 -0600 (CST)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH 0/3] Update to cicd.2023.01.07.13:47:28
Date: Sat, 7 Jan 2023 19:41:51 -0600
Message-ID: <1673142114-50446-1-git-send-email-lcpdbld@list.ti.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sun, 08 Jan 2023 01:42:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15539

Update linux-ti-staging, linux-ti-staging-rt and u-boot-ti-staging to cicd.2023.01.07.13:47:28 tag

LCPD Automation Script (3):
  u-boot-ti-staging: CI/CD Auto-Merger: cicd.2023.01.07.13:47:28
  linux-ti-staging-rt: CI/CD Auto-Merger: cicd.2023.01.07.13:47:28
  linux-ti-staging: CI/CD Auto-Merger: cicd.2023.01.07.13:47:28

 recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb  | 2 +-
 recipes-kernel/linux/linux-ti-staging-rt_5.10.bb | 2 +-
 recipes-kernel/linux/linux-ti-staging_5.10.bb    | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

-- 
1.8.3.1


