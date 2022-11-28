Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AF00C46467
	for <webhook@archiver.kernel.org>; Mon, 28 Nov 2022 03:15:17 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.108946.1669605316056106948
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 27 Nov 2022 19:15:16 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: list.ti.com, ip: 198.47.19.141, mailfrom: lcpdbld@list.ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2AS3FDSt106824;
	Sun, 27 Nov 2022 21:15:13 -0600
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2AS3FDPn062358
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 27 Nov 2022 21:15:13 -0600
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Sun, 27
 Nov 2022 21:15:13 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Sun, 27 Nov 2022 21:15:13 -0600
Received: from fllvdckhpci039.itg.ti.com (fllvdckhpci039.itg.ti.com [10.248.132.250])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2AS3FDpK085213;
	Sun, 27 Nov 2022 21:15:13 -0600
Received: by fllvdckhpci039.itg.ti.com (Postfix, from userid 60899)
	id 1D28C11225B3; Sun, 27 Nov 2022 21:15:13 -0600 (CST)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH 0/4] Update to cicd.2022.11.27.19:06:00
Date: Sun, 27 Nov 2022 21:15:09 -0600
Message-ID: <1669605313-143229-1-git-send-email-lcpdbld@list.ti.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 28 Nov 2022 03:15:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15363

Update linux-ti-staging, linux-ti-staging-rt, ti-linux-fw and u-boot-ti-staging to cicd.2022.11.27.19:06:00 tag

LCPD Automation Script (4):
  ti-linux-fw: CI/CD Auto-Merger: cicd.2022.11.27.19:06:00
  u-boot-ti-staging: CI/CD Auto-Merger: cicd.2022.11.27.19:06:00
  linux-ti-staging-rt: CI/CD Auto-Merger: cicd.2022.11.27.19:06:00
  linux-ti-staging: CI/CD Auto-Merger: cicd.2022.11.27.19:06:00

 recipes-bsp/ti-linux-fw/ti-linux-fw.inc          | 2 +-
 recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb  | 2 +-
 recipes-kernel/linux/linux-ti-staging-rt_5.10.bb | 2 +-
 recipes-kernel/linux/linux-ti-staging_5.10.bb    | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

-- 
1.8.3.1


