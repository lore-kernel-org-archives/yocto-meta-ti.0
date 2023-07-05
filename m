Return-Path: <praneeth@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2132EB64DA
	for <webhook@archiver.kernel.org>; Wed,  5 Jul 2023 21:07:15 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.6671.1688591226564469433
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 05 Jul 2023 14:07:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=MgejBFJJ;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: praneeth@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 365L75qv109043
	for <meta-ti@lists.yoctoproject.org>; Wed, 5 Jul 2023 16:07:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1688591226;
	bh=mey3DiO0h7d+W0MixBNASezgANqFdl/mSJkajH3WIVA=;
	h=From:To:CC:Subject:Date;
	b=MgejBFJJ2LK3T0Mt8/w7jQZt7Cu87aemuXJQxXXbyb9bbKPpgjLcDWxaZsR6z3gGT
	 fAd9prUff6UqOmuBOR7VP683U/ESbiruD72i+u3QJkX3vaknURjdJUZbinGppW334A
	 xGTvCphm57AfOLpxaUJqm/S1V1dtvJfRLbNJgp/o=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 365L75W7130890
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Wed, 5 Jul 2023 16:07:05 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 5
 Jul 2023 16:07:05 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 5 Jul 2023 16:07:05 -0500
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 365L75Ia084956;
	Wed, 5 Jul 2023 16:07:05 -0500
From: <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Ryan Eatmon <reatmon@ti.com>,
        Nick
 Saulnier <nsaulnier@ti.com>, Hari Nagalla <hnagalla@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: [kirkstone PATCH v2] pru-icss_git.bb: update to PSSP v6.2.0
Date: Wed, 5 Jul 2023 16:07:05 -0500
Message-ID: <20230705210705.15757-1-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 05 Jul 2023 21:07:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16815

From: Praneeth Bajjuri <praneeth@ti.com>

Upgrade to v6.2.0 version.
This release supports Linux kernel 6.1.
The RPMsg library in previous versions of the PSSP will not work with
the PRU RPMsg drivers in Linux kernel 6.1.

Other changes in this version:
 * Bug fixes:
     - Getting Started Labs, fix "zero" command clearing too many bytes
     - Include files, add a missing parentheses to pru_cfg, pru_ctrl, pru_ecap
 * Update ReadMe files to point to the latest URLs

Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
---
v2: fixes build issue reported on 32b platforms

 meta-ti-extras/recipes-bsp/pru/pru-icss_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-ti-extras/recipes-bsp/pru/pru-icss_git.bb b/meta-ti-extras/recipes-bsp/pru/pru-icss_git.bb
index 3b0805d9..e73e0e7e 100644
--- a/meta-ti-extras/recipes-bsp/pru/pru-icss_git.bb
+++ b/meta-ti-extras/recipes-bsp/pru/pru-icss_git.bb
@@ -8,10 +8,10 @@ inherit update-alternatives
 
 BRANCH = "master"
 SRC_URI = "git://git.ti.com/git/pru-software-support-package/pru-software-support-package.git;protocol=https;branch=${BRANCH}"
-SRCREV = "ae1decf0b494b2904e6157e1379691ffc468f0cf"
+SRCREV = "3d0e311580d8967d0854ca789e9069e2810e9c1a"
 
-PV = "6.1.0"
-PR = "r0"
+PV = "6.2.0"
+PR = "r1"
 
 require recipes-ti/includes/ti-paths.inc
 
-- 
2.17.1


