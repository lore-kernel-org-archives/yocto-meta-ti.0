Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAE2EC07E98
	for <webhook@archiver.kernel.org>; Mon, 27 Nov 2023 21:58:41 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.113703.1701122318602599432
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 27 Nov 2023 13:58:38 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: list.ti.com, ip: 198.47.23.249, mailfrom: lcpdbld@list.ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3ARLwaRr089300;
	Mon, 27 Nov 2023 15:58:36 -0600
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3ARLwaVc016803
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 27 Nov 2023 15:58:36 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 27
 Nov 2023 15:58:36 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 27 Nov 2023 15:58:36 -0600
Received: from fllvdckhpci028.itg.ti.com (fllvdckhpci028.itg.ti.com [10.248.130.161])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3ARLwa2u013161;
	Mon, 27 Nov 2023 15:58:36 -0600
Received: by fllvdckhpci028.itg.ti.com (Postfix, from userid 60899)
	id 94A7710B5969; Mon, 27 Nov 2023 15:58:36 -0600 (CST)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][kirkstone][PATCH 0/4] Update to cicd.kirkstone.202311271209
Date: Mon, 27 Nov 2023 15:58:32 -0600
Message-ID: <1701122316-142436-1-git-send-email-lcpdbld@list.ti.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 27 Nov 2023 21:58:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17334

Update linux-ti-staging_6.1, linux-ti-staging-rt_6.1, ti-linux-fw and u-boot-ti-staging_2023.04 to cicd.kirkstone.202311271209 tag

Darren Etheridge (1):
  mesa-pvr: use different srcrev for Rogue and SGX GPU platforms

LCPD Automation Script (1):
  CI/CD Auto-Merger: cicd.kirkstone.202311271209

Paresh Bhagat (1):
  ti-extras: Add support for extra kernel/u-boot features for am62pxx

Praneeth Bajjuri (1):
  pru-icss_git.bb: update to PSSP v6.3.0

 meta-ti-bsp/conf/machine/am62pxx-evm-k3r5.conf              |  1 +
 meta-ti-bsp/conf/machine/am62pxx-evm.conf                   |  1 +
 meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc         | 10 +++++-----
 meta-ti-bsp/recipes-bsp/u-boot/ti-extras.inc                |  2 +-
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb |  2 +-
 meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_22.3.5.bb        |  8 ++++++--
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.1.bb |  2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb    |  2 +-
 meta-ti-bsp/recipes-kernel/linux/ti-extras-rt.inc           |  2 +-
 meta-ti-bsp/recipes-kernel/linux/ti-extras.inc              |  2 +-
 meta-ti-extras/recipes-bsp/pru/pru-icss_git.bb              |  5 ++---
 meta-ti-extras/recipes-ti/jailhouse/jailhouse_git.bb        |  6 +++++-
 12 files changed, 26 insertions(+), 17 deletions(-)

-- 
1.8.3.1


