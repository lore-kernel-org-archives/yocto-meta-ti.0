Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 120CDC0032E
	for <webhook@archiver.kernel.org>; Fri, 20 Oct 2023 12:11:18 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.52811.1697803873934283048
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 20 Oct 2023 05:11:14 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: list.ti.com, ip: 198.47.23.248, mailfrom: lcpdbld@list.ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 39KCBC9b117868;
	Fri, 20 Oct 2023 07:11:12 -0500
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 39KCBCN2023365
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 20 Oct 2023 07:11:12 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 20
 Oct 2023 07:11:12 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 20 Oct 2023 07:11:12 -0500
Received: from fllvdckhpci028.itg.ti.com (fllvdckhpci028.itg.ti.com [10.248.130.161])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 39KCBC8o004618;
	Fri, 20 Oct 2023 07:11:12 -0500
Received: by fllvdckhpci028.itg.ti.com (Postfix, from userid 60899)
	id 05FF110AA2AB; Fri, 20 Oct 2023 07:11:12 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH 0/4] Update to cicd.master.202310200100
Date: Fri, 20 Oct 2023 07:11:08 -0500
Message-ID: <1697803872-27135-1-git-send-email-lcpdbld@list.ti.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 20 Oct 2023 12:11:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17151

Update linux-ti-staging_6.1, linux-ti-staging-rt_6.1, ti-linux-fw and u-boot-ti-staging_2023.04 to cicd.master.202310200100 tag

LCPD Automation Script (4):
  ti-linux-fw: CI/CD Auto-Merger: cicd.master.202310200100
  u-boot-ti-staging_2023.04: CI/CD Auto-Merger: cicd.master.202310200100
  linux-ti-staging-rt_6.1: CI/CD Auto-Merger: cicd.master.202310200100
  linux-ti-staging_6.1: CI/CD Auto-Merger: cicd.master.202310200100

 meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc         | 2 +-
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.1.bb | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb    | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

-- 
1.8.3.1


