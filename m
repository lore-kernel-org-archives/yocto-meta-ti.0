Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC1E9C10DAA
	for <webhook@archiver.kernel.org>; Mon, 27 Nov 2023 21:58:41 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.113353.1701122318383467536
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 27 Nov 2023 13:58:38 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: list.ti.com, ip: 198.47.23.248, mailfrom: lcpdbld@list.ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3ARLwans067429;
	Mon, 27 Nov 2023 15:58:36 -0600
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3ARLwauf022233
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 27 Nov 2023 15:58:36 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 27
 Nov 2023 15:58:36 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 27 Nov 2023 15:58:36 -0600
Received: from fllvdckhpci028.itg.ti.com (fllvdckhpci028.itg.ti.com [10.248.130.161])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3ARLwaGK060312;
	Mon, 27 Nov 2023 15:58:36 -0600
Received: by fllvdckhpci028.itg.ti.com (Postfix, from userid 60899)
	id 97D3410BB70B; Mon, 27 Nov 2023 15:58:36 -0600 (CST)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][kirkstone][PATCH 1/4] pru-icss_git.bb: update to PSSP v6.3.0
Date: Mon, 27 Nov 2023 15:58:33 -0600
Message-ID: <1701122316-142436-2-git-send-email-lcpdbld@list.ti.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1701122316-142436-1-git-send-email-lcpdbld@list.ti.com>
References: <1701122316-142436-1-git-send-email-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 27 Nov 2023 21:58:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17332

From: Praneeth Bajjuri <praneeth@ti.com>

Upgrade to v6.3.0 version.

This release adds resources for using AM243x & AM64x PRU cores with cores
running FreeRTOS:
 * The RTOS Getting Started Labs
 * Examples for using PRU GPIO and the broadside interface
 * SORTE_G example (a custom networking interface)

Bug fixes:
 * AM64x & AM65x header files, fix the names of extended sections to be in the
   format of
   ConstantsTableName_0x100

Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
Signed-off-by: Nick Saulnier <nsaulnier@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-extras/recipes-bsp/pru/pru-icss_git.bb | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta-ti-extras/recipes-bsp/pru/pru-icss_git.bb b/meta-ti-extras/recipes-bsp/pru/pru-icss_git.bb
index 6acce94..b01dd6a 100644
--- a/meta-ti-extras/recipes-bsp/pru/pru-icss_git.bb
+++ b/meta-ti-extras/recipes-bsp/pru/pru-icss_git.bb
@@ -8,10 +8,9 @@ inherit update-alternatives
 
 BRANCH = "master"
 SRC_URI = "git://git.ti.com/git/pru-software-support-package/pru-software-support-package.git;protocol=https;branch=${BRANCH}"
-SRCREV = "3d0e311580d8967d0854ca789e9069e2810e9c1a"
+SRCREV = "00a5efa5157feb84cb2e4bf50b481f7082acca82"
 
-PV = "6.2.0"
-PR = "r1"
+PV = "6.3.0"
 
 require recipes-ti/includes/ti-paths.inc
 
-- 
1.8.3.1


