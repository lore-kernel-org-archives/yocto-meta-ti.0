Return-Path: <devarsht@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35EC0C7EE25
	for <webhook@archiver.kernel.org>; Fri,  9 Jun 2023 14:29:09 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.14817.1686320947434493043
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 09 Jun 2023 07:29:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=cLT9l0Fl;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: devarsht@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 359ET6GA063406;
	Fri, 9 Jun 2023 09:29:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686320946;
	bh=K1jwLYU7OFphuNri983g3VW1zg9roRV71emIsGxjIuo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=cLT9l0FlCyWl3gkHKLLIT786DBva2e28pZxdUXgxW0REM0prc+FGDK+RseOh7KteH
	 T1XjQsqd6DjnaK1GADSatTBL5qZ6R0O3P+Xkcg+7L1u65zehVl7sCDM9t92bzyxDK6
	 57tKja9k6fP4TKgW+XRWr5qpdEQdAqL+oUqLi8qY=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 359ET6qb010770
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 9 Jun 2023 09:29:06 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 9
 Jun 2023 09:29:05 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 9 Jun 2023 09:29:05 -0500
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 359ET5YN030193;
	Fri, 9 Jun 2023 09:29:05 -0500
From: Devarsh Thakkar <devarsht@ti.com>
To: <reatmon@ti.com>, <meta-ti@lists.yoctoproject.org>, <praneeth@ti.com>,
        <denys@konsulko.com>
CC: <nm@ti.com>, <vigneshr@ti.com>, <a-bhatia1@ti.com>, <j-luthra@ti.com>,
        <khasim@ti.com>, <nsekhar@ti.com>, <afd@ti.com>, <rs@ti.com>,
        <devarsht@ti.com>
Subject: [meta-ti] [kirkstone] [PATCH 2/2] conf: machine: am62xx: Add TI logo as image boot file
Date: Fri, 9 Jun 2023 19:59:01 +0530
Message-ID: <20230609142901.2958733-3-devarsht@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230609142901.2958733-1-devarsht@ti.com>
References: <20230609142901.2958733-1-devarsht@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 09 Jun 2023 14:29:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16702

Add TI logo bitmap image as image boot file so that it gets
copied to boot partition and A53 SPL or U-boot proper
can load it and display during board bootup.

Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
---
 meta-ti-bsp/conf/machine/include/am62xx.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-ti-bsp/conf/machine/include/am62xx.inc b/meta-ti-bsp/conf/machine/include/am62xx.inc
index 0bd5279d..8bc4d2fc 100644
--- a/meta-ti-bsp/conf/machine/include/am62xx.inc
+++ b/meta-ti-bsp/conf/machine/include/am62xx.inc
@@ -15,6 +15,9 @@ IMAGE_BOOT_FILES += "tiboot3-am62x-gp-evm.bin"
 # Since default tiboot3.bin on AM62x is for HS-FS, add a version for HS-SE
 IMAGE_BOOT_FILES += "tiboot3-am62x-hs-evm.bin"
 
+# Bitmap image tarball for early splashscreen
+IMAGE_BOOT_FILES += "ti.gz"
+
 TFA_BOARD = "lite"
 TFA_K3_SYSTEM_SUSPEND = "1"
 
-- 
2.34.1


