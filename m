Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72351E92FFC
	for <webhook@archiver.kernel.org>; Sat,  7 Oct 2023 04:46:34 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.12573.1696653989259598486
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 06 Oct 2023 21:46:29 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: list.ti.com, ip: 198.47.19.142, mailfrom: lcpdbld@list.ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3974kR4E054111;
	Fri, 6 Oct 2023 23:46:27 -0500
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3974kR3I070719
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 6 Oct 2023 23:46:27 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 6
 Oct 2023 23:46:27 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 6 Oct 2023 23:46:27 -0500
Received: from fllvdckhpci039.itg.ti.com (fllvdckhpci039.itg.ti.com [10.248.132.250])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3974kREJ024902;
	Fri, 6 Oct 2023 23:46:27 -0500
Received: by fllvdckhpci039.itg.ti.com (Postfix, from userid 60899)
	id 5358810F5A4C; Fri,  6 Oct 2023 23:46:27 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][kirkstone][PATCH 0/5] Update to cicd.kirkstone.202310061657
Date: Fri, 6 Oct 2023 23:46:22 -0500
Message-ID: <1696653987-108478-1-git-send-email-lcpdbld@list.ti.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sat, 07 Oct 2023 04:46:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17070

Update k3conf, linux-ti-staging_6.1, linux-ti-staging-rt_6.1, ti-linux-fw and u-boot-ti-staging_2023.04 to cicd.kirkstone.202310061657 tag

LCPD Automation Script (5):
  ti-linux-fw: CI/CD Auto-Merger: cicd.kirkstone.202310061657
  u-boot-ti-staging_2023.04: CI/CD Auto-Merger:
    cicd.kirkstone.202310061657
  k3conf: CI/CD Auto-Merger: cicd.kirkstone.202310061657
  linux-ti-staging-rt_6.1: CI/CD Auto-Merger:
    cicd.kirkstone.202310061657
  linux-ti-staging_6.1: CI/CD Auto-Merger: cicd.kirkstone.202310061657

 meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc         | 2 +-
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb | 2 +-
 meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb           | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.1.bb | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb    | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

-- 
1.8.3.1


