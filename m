Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1779FC433F5
	for <webhook@archiver.kernel.org>; Fri, 27 May 2022 16:06:40 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web08.5507.1653667590812950275
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 27 May 2022 09:06:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=JdUDeWnT;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 24RG6RKv034614;
	Fri, 27 May 2022 11:06:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1653667587;
	bh=nQY6U8TgkDEHPdxMKU0NZxYtEY26ZzZh5pC3tR4umC0=;
	h=From:To:CC:Subject:Date;
	b=JdUDeWnTwHgDwgZhdH3YwvOzsQqakcQ5JJZsefwlaITGBUzRXoefACGfcR9k7Mrmi
	 1K2r2J1PfgeBOilZaSeZOom6y8FHNLxt6xMtZpIOTq0uOxfQoJEf5QDk20klNobrIL
	 HXXsZ23FEbAWRMQh2ksk52wZctM7SgnDaSw6wAh4=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 24RG6Ru2014643
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 27 May 2022 11:06:27 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 27
 May 2022 11:06:26 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 27 May 2022 11:06:26 -0500
Received: from ula0226330.dal.design.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 24RG6QJE003581;
	Fri, 27 May 2022 11:06:26 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        Judith Mendez <jm@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][dunfell][PATCH] conf: machine: am64xx: Add missing dtbo
Date: Fri, 27 May 2022 11:06:26 -0500
Message-ID: <20220527160626.4131-1-afd@ti.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 27 May 2022 16:06:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14766

Add missing k3-am642-evm-icssg1-dualemac-mii.dtbo.

Reported-by: Judith Mendez <jm@ti.com>
Signed-off-by: Andrew Davis <afd@ti.com>
---
 conf/machine/include/am64xx.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/conf/machine/include/am64xx.inc b/conf/machine/include/am64xx.inc
index 7646c70a..918aa038 100644
--- a/conf/machine/include/am64xx.inc
+++ b/conf/machine/include/am64xx.inc
@@ -10,6 +10,7 @@ KERNEL_DEVICETREE = " \
     ti/k3-am642-evm.dtb \
     ti/k3-am642-sk.dtb \
     ti/k3-am642-evm-icssg1-dualemac.dtbo \
+    ti/k3-am642-evm-icssg1-dualemac-mii.dtbo \
     ti/k3-am642-evm-nand.dtbo \
 "
 
-- 
2.36.1


