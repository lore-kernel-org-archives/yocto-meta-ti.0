Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B578DC25B47
	for <webhook@archiver.kernel.org>; Fri, 27 Oct 2023 10:21:25 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.3876.1698402083617954908
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 27 Oct 2023 03:21:23 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: list.ti.com, ip: 198.47.19.142, mailfrom: lcpdbld@list.ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 39RALLPu015741;
	Fri, 27 Oct 2023 05:21:21 -0500
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 39RALLIO070848
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 27 Oct 2023 05:21:21 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 27
 Oct 2023 05:21:21 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 27 Oct 2023 05:21:21 -0500
Received: from fllvdckhpci028.itg.ti.com (fllvdckhpci028.itg.ti.com [10.248.130.161])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 39RALLSG017488;
	Fri, 27 Oct 2023 05:21:21 -0500
Received: by fllvdckhpci028.itg.ti.com (Postfix, from userid 60899)
	id 4181710E44E1; Fri, 27 Oct 2023 05:21:21 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH 0/3] Update to cicd.master.202310270100
Date: Fri, 27 Oct 2023 05:21:18 -0500
Message-ID: <1698402081-89947-1-git-send-email-lcpdbld@list.ti.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 27 Oct 2023 10:21:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17206

Update linux-ti-staging_6.1, linux-ti-staging-rt_6.1 and u-boot-ti-staging_2023.04 to cicd.master.202310270100 tag

LCPD Automation Script (3):
  u-boot-ti-staging_2023.04: CI/CD Auto-Merger: cicd.master.202310270100
  linux-ti-staging-rt_6.1: CI/CD Auto-Merger: cicd.master.202310270100
  linux-ti-staging_6.1: CI/CD Auto-Merger: cicd.master.202310270100

 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.1.bb | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb    | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

-- 
1.8.3.1


