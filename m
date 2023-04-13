Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE992C77B6C
	for <webhook@archiver.kernel.org>; Thu, 13 Apr 2023 05:25:30 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.5617.1681363527207607210
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 12 Apr 2023 22:25:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: list.ti.com, ip: 198.47.23.248, mailfrom: lcpdbld@list.ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33D5PQBX060075;
	Thu, 13 Apr 2023 00:25:26 -0500
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33D5PQQB115317
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 13 Apr 2023 00:25:26 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Thu, 13
 Apr 2023 00:25:26 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Thu, 13 Apr 2023 00:25:26 -0500
Received: from fllvdckhpci039.itg.ti.com (fllvdckhpci039.itg.ti.com [10.248.132.250])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33D5PPZl018165;
	Thu, 13 Apr 2023 00:25:25 -0500
Received: by fllvdckhpci039.itg.ti.com (Postfix, from userid 60899)
	id B177110FE253; Thu, 13 Apr 2023 00:25:25 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH 0/2] Update to cicd.dunfell.202304122200
Date: Thu, 13 Apr 2023 00:25:23 -0500
Message-ID: <1681363525-103432-1-git-send-email-lcpdbld@list.ti.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 13 Apr 2023 05:25:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16389

Update linux-ti-staging and linux-ti-staging-rt to cicd.dunfell.202304122200 tag

LCPD Automation Script (2):
  linux-ti-staging-rt: CI/CD Auto-Merger: cicd.dunfell.202304122200
  linux-ti-staging: CI/CD Auto-Merger: cicd.dunfell.202304122200

 recipes-kernel/linux/linux-ti-staging-rt_5.10.bb | 2 +-
 recipes-kernel/linux/linux-ti-staging_5.10.bb    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
1.8.3.1


