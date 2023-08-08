Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CE92C001B0
	for <webhook@archiver.kernel.org>; Tue,  8 Aug 2023 17:11:11 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.67673.1691514667333541380
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 08 Aug 2023 10:11:07 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: list.ti.com, ip: 198.47.19.141, mailfrom: lcpdbld@list.ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 378HB6BQ031995;
	Tue, 8 Aug 2023 12:11:06 -0500
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 378HB6lT016296
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 8 Aug 2023 12:11:06 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 8
 Aug 2023 12:11:05 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 8 Aug 2023 12:11:05 -0500
Received: from fllvdckhpci039.itg.ti.com (fllvdckhpci039.itg.ti.com [10.248.132.250])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 378HB5dL010691;
	Tue, 8 Aug 2023 12:11:05 -0500
Received: by fllvdckhpci039.itg.ti.com (Postfix, from userid 60899)
	id CD9A410FCF73; Tue,  8 Aug 2023 12:11:05 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][kirkstone][PATCH 0/5] Update to cicd.kirkstone.202308080400
Date: Tue, 8 Aug 2023 12:11:00 -0500
Message-ID: <1691514665-81829-1-git-send-email-lcpdbld@list.ti.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 08 Aug 2023 17:11:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16870

Update k3conf, linux-ti-staging_6.1, linux-ti-staging-rt_6.1, ti-linux-fw and u-boot-ti-staging_2023.04 to cicd.kirkstone.202308080400 tag

LCPD Automation Script (5):
  ti-linux-fw: CI/CD Auto-Merger: cicd.kirkstone.202308080400
  u-boot-ti-staging_2023.04: CI/CD Auto-Merger:
    cicd.kirkstone.202308080400
  k3conf: CI/CD Auto-Merger: cicd.kirkstone.202308080400
  linux-ti-staging-rt_6.1: CI/CD Auto-Merger:
    cicd.kirkstone.202308080400
  linux-ti-staging_6.1: CI/CD Auto-Merger: cicd.kirkstone.202308080400

 meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc         | 2 +-
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb | 2 +-
 meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb           | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.1.bb | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb    | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

-- 
1.8.3.1


