Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB3B4EE14A9
	for <webhook@archiver.kernel.org>; Thu,  7 Sep 2023 02:20:13 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.4924.1694053206207292525
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 06 Sep 2023 19:20:06 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: list.ti.com, ip: 198.47.23.248, mailfrom: lcpdbld@list.ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3872K4E7098636;
	Wed, 6 Sep 2023 21:20:04 -0500
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3872K4A2045184
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 6 Sep 2023 21:20:04 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 6
 Sep 2023 21:20:04 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 6 Sep 2023 21:20:04 -0500
Received: from fllvdckhpci039.itg.ti.com (fllvdckhpci039.itg.ti.com [10.248.132.250])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3872K4jM068896;
	Wed, 6 Sep 2023 21:20:04 -0500
Received: by fllvdckhpci039.itg.ti.com (Postfix, from userid 60899)
	id 20AD210F5A62; Wed,  6 Sep 2023 21:20:04 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][kirkstone][PATCH 0/3] Update to cicd.kirkstone.202309061800
Date: Wed, 6 Sep 2023 21:20:01 -0500
Message-ID: <1694053204-31836-1-git-send-email-lcpdbld@list.ti.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 07 Sep 2023 02:20:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16926

Update linux-ti-staging_6.1, linux-ti-staging-rt_6.1 and u-boot-ti-staging_2023.04 to cicd.kirkstone.202309061800 tag

LCPD Automation Script (3):
  u-boot-ti-staging_2023.04: CI/CD Auto-Merger:
    cicd.kirkstone.202309061800
  linux-ti-staging-rt_6.1: CI/CD Auto-Merger:
    cicd.kirkstone.202309061800
  linux-ti-staging_6.1: CI/CD Auto-Merger: cicd.kirkstone.202309061800

 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.1.bb | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb    | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

-- 
1.8.3.1


