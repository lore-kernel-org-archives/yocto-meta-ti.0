Return-Path: <praneeth@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F00B1C61D85
	for <webhook@archiver.kernel.org>; Tue, 21 Nov 2023 23:44:09 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.15348.1700610249255042445
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 21 Nov 2023 15:44:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=RkFZzig5;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: praneeth@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3ALNi5ke029848;
	Tue, 21 Nov 2023 17:44:05 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1700610245;
	bh=MN+vKtwZ+bNWWse+TpkEzakkboR+4JP119GHiZaXqmM=;
	h=From:To:CC:Subject:Date;
	b=RkFZzig5xtXNQ+/Y9BiStHswIuI3XAIW310w+JVGmXHCJ8ol21yvXCV81aqH7XWXL
	 vp+9iAy43SnReBuRd/E8Js3UgPiSivWrg75031XgE9zguWeeiL+vIgYYNJvF3mjT1K
	 YWqKsoF4/F1IkWGItygrwQGuWnWQ5KHD/FvWCwNg=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3ALNi5bd040728
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 21 Nov 2023 17:44:05 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 21
 Nov 2023 17:44:04 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 21 Nov 2023 17:44:04 -0600
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3ALNi4YW021766;
	Tue, 21 Nov 2023 17:44:04 -0600
From: Praneeth Bajjuri <praneeth@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Ryan Eatmon <reatmon@ti.com>, Nick Saulnier <nsaulnier@ti.com>,
        <denis@denix.org>
Subject: [kirkstone PATCHv2] pru-icss_git.bb: update to PSSP v6.3.0
Date: Tue, 21 Nov 2023 17:44:04 -0600
Message-ID: <20231121234404.3819-1-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 21 Nov 2023 23:44:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17325

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
---
v2: remove PR revision as its no longer required to maintain

 meta-ti-extras/recipes-bsp/pru/pru-icss_git.bb | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta-ti-extras/recipes-bsp/pru/pru-icss_git.bb b/meta-ti-extras/recipes-bsp/pru/pru-icss_git.bb
index 6acce94b..b01dd6a5 100644
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
2.17.1


