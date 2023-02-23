Return-Path: <b-kapoor@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0C09C636D7
	for <webhook@archiver.kernel.org>; Thu, 23 Feb 2023 06:17:07 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.5036.1677133027084119848
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 22 Feb 2023 22:17:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=gAH2Ukjm;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: b-kapoor@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 31N6H6S2038761
	for <meta-ti@lists.yoctoproject.org>; Thu, 23 Feb 2023 00:17:06 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1677133026;
	bh=ZpTXHblqE7BDWuShSJguJT9jMt6yfOA8126byvqNzRo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=gAH2UkjmeqnbR+xFe1npO6gf48qSaSRpFeB/FILcYk9mVTrDBOE2Yi2wFHXNDro2D
	 aLQ6nlxPfg3Pe6+Tb9Fv6PNMyRRULgTtfSUXgICGjlo52FUCIQoIwlBMQCknPQZkCt
	 CrCvq3mNAHE6KwMO25TFpuAsN9XgTEgTXaln9PMs=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 31N6H6Yl060325
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 23 Feb 2023 00:17:06 -0600
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Thu, 23
 Feb 2023 00:17:06 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Thu, 23 Feb 2023 00:17:06 -0600
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 31N6H5Sh030228;
	Thu, 23 Feb 2023 00:17:05 -0600
From: Bhavya Kapoor <b-kapoor@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <b-kapoor@ti.com>, <reatmon@ti.com>
Subject: [meta-ti][dunfell][PATCH 2/4] conf: machine: j7-evm: Add uarts overlay for J721E
Date: Thu, 23 Feb 2023 11:47:01 +0530
Message-ID: <20230223061703.735524-2-b-kapoor@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230223061703.735524-1-b-kapoor@ti.com>
References: <20230223061703.735524-1-b-kapoor@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 23 Feb 2023 06:17:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15926

Add device tree overlay for extending support for mcu_uart0 as well as
wkup_uart0 for boards with J721E SoC. This overlay will mainly be used
for the purpose of testing uart instances.

Signed-off-by: Bhavya Kapoor <b-kapoor@ti.com>
---
 conf/machine/j7-evm.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/conf/machine/j7-evm.conf b/conf/machine/j7-evm.conf
index 7fb78019..e18ff509 100644
--- a/conf/machine/j7-evm.conf
+++ b/conf/machine/j7-evm.conf
@@ -38,6 +38,7 @@ KERNEL_DEVICETREE = " \
     ti/k3-j721e-fpdlink-sk-fusion.dtbo \
     ti/k3-j721e-sk-csi2-ov5640.dtbo \
     ti/k3-j721e-sk-rpi-cam-imx219.dtbo \
+    ti/k3-j721e-common-proc-board-uarts.dtbo \
 "
 
 UBOOT_MACHINE = "j721e_evm_a72_config"
-- 
2.34.1


