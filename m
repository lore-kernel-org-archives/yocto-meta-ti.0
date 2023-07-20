Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 271FAC3DA40
	for <webhook@archiver.kernel.org>; Thu, 20 Jul 2023 06:02:24 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.6911.1689832937669694961
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 19 Jul 2023 23:02:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: list.ti.com, ip: 198.47.19.141, mailfrom: lcpdbld@list.ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 36K62C0w083634;
	Thu, 20 Jul 2023 01:02:12 -0500
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 36K62CTO083814
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 20 Jul 2023 01:02:12 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 20
 Jul 2023 01:02:12 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 20 Jul 2023 01:02:12 -0500
Received: from fllvdckhpci028.itg.ti.com (fllvdckhpci028.itg.ti.com [10.248.130.161])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 36K62CO0069107;
	Thu, 20 Jul 2023 01:02:12 -0500
Received: by fllvdckhpci028.itg.ti.com (Postfix, from userid 60899)
	id 294C9115E9FA; Thu, 20 Jul 2023 01:02:12 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][kirkstone][PATCH 0/2] Update to cicd.kirkstone.202307192152
Date: Thu, 20 Jul 2023 01:02:10 -0500
Message-ID: <1689832932-32090-1-git-send-email-lcpdbld@list.ti.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 20 Jul 2023 06:02:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16853

Update linux-ti-staging_6.1 and linux-ti-staging-rt_6.1 to cicd.kirkstone.202307192152 tag

LCPD Automation Script (2):
  linux-ti-staging-rt_6.1: CI/CD Auto-Merger:
    cicd.kirkstone.202307192152
  linux-ti-staging_6.1: CI/CD Auto-Merger: cicd.kirkstone.202307192152

 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.1.bb | 4 ++--
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb    | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

-- 
1.8.3.1


