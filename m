Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C707BC77B62
	for <webhook@archiver.kernel.org>; Fri, 31 Mar 2023 12:20:58 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.53042.1680265254090438728
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 31 Mar 2023 05:20:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: list.ti.com, ip: 198.47.19.142, mailfrom: lcpdbld@list.ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 32VCKpcr021585;
	Fri, 31 Mar 2023 07:20:51 -0500
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 32VCKpte113278
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 31 Mar 2023 07:20:51 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Fri, 31
 Mar 2023 07:20:51 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Fri, 31 Mar 2023 07:20:51 -0500
Received: from fllvdckhpci039.itg.ti.com (fllvdckhpci039.itg.ti.com [10.248.132.250])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 32VCKpRY030242;
	Fri, 31 Mar 2023 07:20:51 -0500
Received: by fllvdckhpci039.itg.ti.com (Postfix, from userid 60899)
	id 8398711221B4; Fri, 31 Mar 2023 07:20:51 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH 0/3] Update to cicd.dunfell.202303310400
Date: Fri, 31 Mar 2023 07:20:48 -0500
Message-ID: <1680265251-54342-1-git-send-email-lcpdbld@list.ti.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 31 Mar 2023 12:20:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16276

Update k3conf, ti-linux-fw and u-boot-ti-staging to cicd.dunfell.202303310400 tag

LCPD Automation Script (3):
  ti-linux-fw: CI/CD Auto-Merger: cicd.dunfell.202303310400
  u-boot-ti-staging: CI/CD Auto-Merger: cicd.dunfell.202303310400
  k3conf: CI/CD Auto-Merger: cicd.dunfell.202303310400

 recipes-bsp/ti-linux-fw/ti-linux-fw.inc         | 2 +-
 recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb | 2 +-
 recipes-devtools/k3conf/k3conf_git.bb           | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

-- 
1.8.3.1


