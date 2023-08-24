Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE77FC3DA66
	for <webhook@archiver.kernel.org>; Thu, 24 Aug 2023 02:42:52 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.2586.1692844966861726949
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 23 Aug 2023 19:42:47 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: list.ti.com, ip: 198.47.23.248, mailfrom: lcpdbld@list.ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 37O2gjHt086786;
	Wed, 23 Aug 2023 21:42:45 -0500
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 37O2gjSi125533
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 23 Aug 2023 21:42:45 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 23
 Aug 2023 21:42:45 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 23 Aug 2023 21:42:45 -0500
Received: from fllvdckhpci039.itg.ti.com (fllvdckhpci039.itg.ti.com [10.248.132.250])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 37O2giDx007917;
	Wed, 23 Aug 2023 21:42:45 -0500
Received: by fllvdckhpci039.itg.ti.com (Postfix, from userid 60899)
	id E96B010FE4C5; Wed, 23 Aug 2023 21:42:44 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][kirkstone][PATCH 0/2] Update to cicd.kirkstone.202308231800
Date: Wed, 23 Aug 2023 21:42:42 -0500
Message-ID: <1692844964-98806-1-git-send-email-lcpdbld@list.ti.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 24 Aug 2023 02:42:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16888

Update linux-ti-staging_6.1 and linux-ti-staging-rt_6.1 to cicd.kirkstone.202308231800 tag

LCPD Automation Script (2):
  linux-ti-staging-rt_6.1: CI/CD Auto-Merger:
    cicd.kirkstone.202308231800
  linux-ti-staging_6.1: CI/CD Auto-Merger: cicd.kirkstone.202308231800

 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.1.bb | 4 ++--
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb    | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

-- 
1.8.3.1


