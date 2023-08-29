Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A0D9C83F17
	for <webhook@archiver.kernel.org>; Tue, 29 Aug 2023 19:56:50 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.798.1693339008048009508
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 29 Aug 2023 12:56:48 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: list.ti.com, ip: 198.47.19.141, mailfrom: lcpdbld@list.ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 37TJukqw030942;
	Tue, 29 Aug 2023 14:56:46 -0500
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 37TJukup089679
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 29 Aug 2023 14:56:46 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 29
 Aug 2023 14:56:46 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 29 Aug 2023 14:56:46 -0500
Received: from fllvdckhpci028.itg.ti.com (fllvdckhpci028.itg.ti.com [10.248.130.161])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 37TJukq4041914;
	Tue, 29 Aug 2023 14:56:46 -0500
Received: by fllvdckhpci028.itg.ti.com (Postfix, from userid 60899)
	id 4BF411120F23; Tue, 29 Aug 2023 14:56:46 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH 0/4] Update to cicd.master.202308290957
Date: Tue, 29 Aug 2023 14:56:42 -0500
Message-ID: <1693339006-51698-1-git-send-email-lcpdbld@list.ti.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 29 Aug 2023 19:56:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16906

Update linux-ti-staging_6.1, linux-ti-staging-rt_6.1, ti-linux-fw and u-boot-ti-staging_2023.04 to cicd.master.202308290957 tag

LCPD Automation Script (4):
  ti-linux-fw: CI/CD Auto-Merger: cicd.master.202308290957
  u-boot-ti-staging_2023.04: CI/CD Auto-Merger: cicd.master.202308290957
  linux-ti-staging-rt_6.1: CI/CD Auto-Merger: cicd.master.202308290957
  linux-ti-staging_6.1: CI/CD Auto-Merger: cicd.master.202308290957

 meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc         | 2 +-
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.1.bb | 4 ++--
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb    | 4 ++--
 4 files changed, 6 insertions(+), 6 deletions(-)

-- 
1.8.3.1


