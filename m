Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2136DC46467
	for <webhook@archiver.kernel.org>; Thu, 19 Jan 2023 16:09:52 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.49514.1674144588135933796
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 19 Jan 2023 08:09:48 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: list.ti.com, ip: 198.47.19.141, mailfrom: lcpdbld@list.ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 30JG9j5d035105;
	Thu, 19 Jan 2023 10:09:45 -0600
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 30JG9jgN042398
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 19 Jan 2023 10:09:45 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Thu, 19
 Jan 2023 10:09:45 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Thu, 19 Jan 2023 10:09:45 -0600
Received: from fllvdckhpci039.itg.ti.com (fllvdckhpci039.itg.ti.com [10.248.132.250])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 30JG9jjt093190;
	Thu, 19 Jan 2023 10:09:45 -0600
Received: by fllvdckhpci039.itg.ti.com (Postfix, from userid 60899)
	id 57FCB11225B2; Thu, 19 Jan 2023 10:09:45 -0600 (CST)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH 0/4] Update to cicd.dunfell.202301190740
Date: Thu, 19 Jan 2023 10:09:41 -0600
Message-ID: <1674144585-54426-1-git-send-email-lcpdbld@list.ti.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 19 Jan 2023 16:09:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15597

Update linux-ti-staging, linux-ti-staging-rt, ti-linux-fw and u-boot-ti-staging to cicd.dunfell.202301190740 tag

LCPD Automation Script (4):
  ti-linux-fw: CI/CD Auto-Merger: cicd.dunfell.202301190740
  u-boot-ti-staging: CI/CD Auto-Merger: cicd.dunfell.202301190740
  linux-ti-staging-rt: CI/CD Auto-Merger: cicd.dunfell.202301190740
  linux-ti-staging: CI/CD Auto-Merger: cicd.dunfell.202301190740

 recipes-bsp/ti-linux-fw/ti-linux-fw.inc          | 4 ++--
 recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb  | 2 +-
 recipes-kernel/linux/linux-ti-staging-rt_5.10.bb | 2 +-
 recipes-kernel/linux/linux-ti-staging_5.10.bb    | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

-- 
1.8.3.1


