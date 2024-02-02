Return-Path: <praneeth@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CCA5C4828F
	for <webhook@archiver.kernel.org>; Fri,  2 Feb 2024 21:41:27 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.4742.1706910078637933034
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 02 Feb 2024 13:41:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Ql3cuOE4;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: praneeth@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 412LfHvl093261
	for <meta-ti@lists.yoctoproject.org>; Fri, 2 Feb 2024 15:41:17 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1706910077;
	bh=mCZFGT+k8v8tbSChjKRZIEAPHaWyFt8fTFHmXlyikaE=;
	h=From:To:CC:Subject:Date;
	b=Ql3cuOE4YcQ+3qwXDY0K502+GCNVLa13Ow8vUnBAQuMC7R9pVLUaW2JMfQVZRlogq
	 FoEzOQ2xOGRXA7Qz6DOIqgbhacyVSpqH2nt1Ge+tzbwzqaE/IBqbmiUv4Nd4sEmUBC
	 grwKHOeo7XuYNGZwAyelFY9RoFlhum1lDViZgZz4=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 412LfHKO086930
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 2 Feb 2024 15:41:17 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 2
 Feb 2024 15:41:17 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 2 Feb 2024 15:41:17 -0600
Received: from localhost (praneethhome.dhcp.ti.com [128.247.81.61])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 412LfHts040756;
	Fri, 2 Feb 2024 15:41:17 -0600
From: <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Vignesh Raghavendra <vigneshr@ti.com>, Udit Kumar <u-kumar1@ti.com>
Subject: [master PATCH] u-boot-ti-staging: Add 2024.04 uboot in prep for LTS migration
Date: Fri, 2 Feb 2024 15:41:17 -0600
Message-ID: <20240202214117.31184-1-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 02 Feb 2024 21:41:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17437

From: Praneeth Bajjuri <praneeth@ti.com>

In preperation of LTS migration, switching from 2024.01 to 2024.04 for
u-boot as this is close to what will be the final version for LTS.

Default preference is still kept as low for this version since we are in
early migration phase.

Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
---
 ...oot-ti-staging_2024.01.bb => u-boot-ti-staging_2024.04.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-ti-bsp/recipes-bsp/u-boot/{u-boot-ti-staging_2024.01.bb => u-boot-ti-staging_2024.04.bb} (64%)

diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2024.01.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2024.04.bb
similarity index 64%
rename from meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2024.01.bb
rename to meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2024.04.bb
index d2a6ccb5..7da9d808 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2024.01.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2024.04.bb
@@ -6,6 +6,6 @@ include ${@ 'recipes-bsp/u-boot/ti-extras.inc' if d.getVar('TI_EXTRAS') else ''}
 
 PR = "r0"
 
-BRANCH = "ti-u-boot-2024.01"
+BRANCH = "ti-u-boot-2024.04"
 
-SRCREV = "2f0282922b2c458eea7f85c500a948a587437b63"
+SRCREV = "6faba41927bdc8973b59678649ef83c564cc421e"
-- 
2.17.1


