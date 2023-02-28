Return-Path: <s-vadapalli@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3537C64EC7
	for <webhook@archiver.kernel.org>; Tue, 28 Feb 2023 06:01:36 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.17214.1677564093383052314
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 27 Feb 2023 22:01:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=JXtijDB2;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: s-vadapalli@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 31S61W3T103166
	for <meta-ti@lists.yoctoproject.org>; Tue, 28 Feb 2023 00:01:32 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1677564092;
	bh=LtO6FaUr2ym8AuiJnyO3C8TQxKeXAZFpwxpdkupVU3M=;
	h=From:To:CC:Subject:Date;
	b=JXtijDB2V/r1ZXGF53RKiWhqhhjghO0EVfBEvwavVjfrp4YnGNkSV57SvyYCZLXb0
	 FtW4I8RvP0tD9EGvjjtSlqusrrFKDDdeAjTRvAzxF8vnWU3g5BTxeKn38uMhhUOxt0
	 5fUgR75B1gm88oYFKbUI94AdXfB5vu6bopeAmKsY=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 31S61WDk028591
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Tue, 28 Feb 2023 00:01:32 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 28
 Feb 2023 00:01:31 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Tue, 28 Feb 2023 00:01:31 -0600
Received: from uda0492258.dhcp.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 31S61U8Z125207;
	Tue, 28 Feb 2023 00:01:30 -0600
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <srk@ti.com>, <s-vadapalli@ti.com>
Subject: [meta-ti][dunfell][PATCH] conf: machine: am62axx: Add overlay for second CPSW3G Port
Date: Tue, 28 Feb 2023 11:31:29 +0530
Message-ID: <20230228060129.1537734-1-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 28 Feb 2023 06:01:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15963

The SK-Ethernet-DC01 Add-On Ethernet Card for AM62A-SK board supports
RGMII mode.

Add overlay to enable the second CPSW3G port in RGMII-RXID mode with the
Add-On Ethernet Card.

Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
---
 conf/machine/am62axx-evm.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/conf/machine/am62axx-evm.conf b/conf/machine/am62axx-evm.conf
index 9dcb6e55..2fd91bd7 100644
--- a/conf/machine/am62axx-evm.conf
+++ b/conf/machine/am62axx-evm.conf
@@ -12,6 +12,7 @@ KERNEL_DEVICETREE = " \
     ti/k3-am62a7-fpdlink-ov2312-0-3.dtbo \
     ti/k3-am62a7-fpdlink-sk-fusion.dtbo \
     ti/k3-am62a7-sk-csi2-imx219.dtbo \
+    ti/k3-am62a7-sk-ethernet-dc01.dtbo \
     ti/k3-j721e-fpdlink-imx390-cm-0-0.dtbo \
     ti/k3-j721e-fpdlink-imx390-cm-0-1.dtbo \
     ti/k3-j721e-fpdlink-imx390-cm-0-2.dtbo \
-- 
2.25.1


