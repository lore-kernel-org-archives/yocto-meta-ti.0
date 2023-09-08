Return-Path: <r-gunasekaran@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 504F9EE57FF
	for <webhook@archiver.kernel.org>; Fri,  8 Sep 2023 11:44:46 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.36845.1694173483250013251
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 08 Sep 2023 04:44:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=ItFcqOyK;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: r-gunasekaran@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 388BigL9129466
	for <meta-ti@lists.yoctoproject.org>; Fri, 8 Sep 2023 06:44:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1694173482;
	bh=VtApKgdHNrYVEbDP8PtMHVnDziwSrsdgDzLor+O/Xoo=;
	h=From:To:CC:Subject:Date;
	b=ItFcqOyKXCexRIck2684Lioyu4Cbcq+/car/MB9GZafrEURoStd8mDRIVOauuHi0w
	 ETKG0CdVXQOO2x5ZoAaI6zDzGxDH4195+tNqL7TdaP8MQwgtvUcy/wMGnkx+Zo4ecs
	 RzvoGlaGmkpWXsiJnqtyirmAxxA5r8nNAZVOGHT4=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 388BigtB020809
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 8 Sep 2023 06:44:42 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 8
 Sep 2023 06:44:42 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 8 Sep 2023 06:44:42 -0500
Received: from uda0500640.dal.design.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 388BierY072109;
	Fri, 8 Sep 2023 06:44:40 -0500
From: Ravi Gunasekaran <r-gunasekaran@ti.com>
To: <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>
CC: <praneeth@ti.com>, <srk@ti.com>, <r-gunasekaran@ti.com>
Subject: [meta-ti][kirkstone][PATCH v2] kernel-rdepends: Remove PRU Ethernet firmwares for legacy devices
Date: Fri, 8 Sep 2023 17:14:39 +0530
Message-ID: <20230908114439.13213-1-r-gunasekaran@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 08 Sep 2023 11:44:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16932

Remove the PRU Ethernet firmwares from being packaged for
AM33x, AM43x and AM57x.

Signed-off-by: Ravi Gunasekaran <r-gunasekaran@ti.com>
---
Changes from v1:
--------------
* Corrected the commit message.

 meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc b/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc
index 266a7ef5..317ab1b1 100644
--- a/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc
+++ b/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc
@@ -12,9 +12,6 @@ RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:dra7xx = " vpdma-fw"
 RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:dra7xx = " goodix-fw"
 
 # Add run-time dependency for PRU Ethernet firmware to the rootfs
-RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:am57xx = " prueth-fw prusw-fw pruhsr-fw pruprp-fw"
-RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:ti43x = " prueth-fw pruhsr-fw pruprp-fw"
-RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:ti33x = " prueth-fw pruhsr-fw pruprp-fw"
 RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:am65xx = " prueth-fw-am65x"
 RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:am65xx-evm = " prueth-fw-am65x-sr2 pruhsr-fw-am65x-sr2 prusw-fw-am65x-sr2"
 RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:am64xx = " prueth-fw-am65x-sr2 pruhsr-fw-am65x-sr2 prusw-fw-am65x-sr2"

base-commit: c3916324a01fe96c68a78ef9ed0070d6b1fc8f2f
-- 
2.17.1


