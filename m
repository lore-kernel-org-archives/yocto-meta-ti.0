Return-Path: <r-gunasekaran@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69EDAEE57EB
	for <webhook@archiver.kernel.org>; Fri,  8 Sep 2023 11:38:46 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.37009.1694173119731765373
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 08 Sep 2023 04:38:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=iYgU3SdE;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: r-gunasekaran@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 388BcdUC100874
	for <meta-ti@lists.yoctoproject.org>; Fri, 8 Sep 2023 06:38:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1694173119;
	bh=oZwgOIutjpfej/t14TorQT/soYjpDDaF6Ab+lpRiuu4=;
	h=From:To:CC:Subject:Date;
	b=iYgU3SdEyplrSM5Y9V/dnrALjV6zhrrP3v0jOHs9cbQTof47YkDeNUdQ45SM6cXc8
	 wVOVphcGq/6k/bH/cbQIHl7zV3dWB/OvHlOmEWfcIWd26jBd3KxMQ8HDI/8slxufw8
	 guwcGNs4kHQFaanK8vmUfswKJpkDfRT8ISb6O8Ag=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 388BcdAb061986
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 8 Sep 2023 06:38:39 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 8
 Sep 2023 06:38:39 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 8 Sep 2023 06:38:38 -0500
Received: from uda0500640.dal.design.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 388BcaNn028718;
	Fri, 8 Sep 2023 06:38:37 -0500
From: Ravi Gunasekaran <r-gunasekaran@ti.com>
To: <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>
CC: <praneeth@ti.com>, <srk@ti.com>, <r-gunasekaran@ti.com>
Subject: [meta-ti][kirkstone]] kernel-rdepends: Remove PRU Ethernet firmwares for legacy devices
Date: Fri, 8 Sep 2023 17:08:36 +0530
Message-ID: <20230908113836.12413-1-r-gunasekaran@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 08 Sep 2023 11:38:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16930

Remove the PRU Ethernet drivers from being packaged.

Signed-off-by: Ravi Gunasekaran <r-gunasekaran@ti.com>
---
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


